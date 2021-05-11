<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- *************************************************************************
**************************파일업로드1********************************************
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
**************************파일업로드1********************************************
***************************************************************************-->

      <!-- 기본정보 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.custInfo" /></h1> <!-- 고객정보 -->
                    <div class="btn_right">
                    <div style="display:none;">
                        <button type="button" class="btn_m btn_add" id="btnCustReset"><spring:message code="global.btn.add" /></button> <!-- 추가 -->
                    </div>
                        <button type="button" class="btn_m" id="btnSalesActiveAdd"><spring:message code='crm.btn.salesActiveAdd' /></button>  <!-- 영업활동등록 -->
                        <button type="button" class="btn_m" id="btnMessage"><spring:message code="global.btn.message" /></button>  <!-- 메시지 -->
                        <button type="button" class="btn_m" id="btnCustRegLink"><spring:message code="global.btn.custNew" /></button>  <!-- 고객신규등록 -->
                        <button type="button" class="btn_m" id="btnInfoModify"><spring:message code="global.btn.custInfoModify" /></button>  <!-- 유일정보수정 -->
                        <button type="button" class="btn_m btn_search" id="btnCustSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                        <button type="button" class="btn_m btn_save" id="btnCustSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </div>
                </div>
      <!-- customerForm 시작 -->
            <div id="customerForm" name="customerForm" onsubmit="return false;">
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
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                <td>
                                    <div class="form_search">
                                        <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input onKey_down" />
                                        <input id="custNm" name="custNm" type="hidden" value="" class="form_input" data-json-obj="true" />
                                        <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                    </div>
                                    <input id="pageMode" name="pageMode" type="hidden" value="updateMode" readonly data-json-obj="true" />
                                    <input type="hidden" id="docId" name="docId" data-json-obj="true" />
                                    <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td class="readonly_area">
                                    <input id="custTp" name="custTp" class="form_comboBox form_readonly" readOnly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td class="readonly_area">
                                        <input id="custNo" name="custNo" type="text" class="form_input form_readonly"  readonly data-json-obj="true" />
                                    <input id="oldCustNm" name="oldCustNm" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                                <td class="readonly_area">
                                    <input id="custCd" name="custCd" class="form_comboBox form_readonly " readOnly data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.defaultInfo' /></h2> <!-- 기본정보 -->
                </div>
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
                                <th scope="row"><spring:message code="global.lbl.sex" /></th> <!-- 성별 -->
                                <td>
                                    <input id="sexCd" name="sexCd"  class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                                <td>
                                    <input id="mathDocTp" name="mathDocTp" class="form_comboBox"  data-json-obj="true" />
                                    <input id="oldMathDocTp" name="oldMathDocTp" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                <td>
                                    <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input numberandalpha getCustMathDocDupByKey"  pattern="[0-9A-Z]" maxlength="30" data-json-obj="true" />
                                    <input id="oldSsnCrnNo" name="oldSsnCrnNo" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" style="width:16%" >
                                            <label class="label_check ml5"><input id="bhmcYn" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled data-json-obj="true" /></label>
                                        </div>
                                        <div class="form_right" style="width:84%" >
                                            <input id="siebelRowId" name="siebelRowId" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                                <td class="readonly_area">
                                    <input id="mngScNm" name="mngScNm" type="text" value="" class="form_input"  readonly />
                                    <input id="mngScId" name="mngScId" type="hidden" value="" class="form_input"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecNm" name="mngTecNm" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecId" name="mngTecId" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custHoldTp" /></th> <!-- 정보출처 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.5%;" >
                                            <input id="custHoldTp" name="custHoldTp" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.5%;">
                                            <input id="custHoldTpDtl" name="custHoldTpDtl" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
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
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hpNo" /></span></th> <!-- 이동전화 -->
                                <td class="readonly_area">
                                    <input id="hpNo" name="hpNo" type="text" class="form_input numberic form_readonly" readonly data-type="mobile" pattern="\d" maxlength="20" data-json-obj="true" />
                                    <input id="oldHpNo" name="oldHpNo" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <td colspan="3">
                                    <label class="label_check ml5"><input id="hpNoInvldYn" name="hpNoInvldYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNoInvld" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="hpNoAddImposYn" name="hpNoAddImposYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNoAddImpos" /></label>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                <td>
                                    <input id="telNo" name="telNo" type="text" value="" class="form_input numberic" data-type="tel"  maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td>
                                    <input id="officeTelNo" name="officeTelNo" type="text" class="form_input numberic"  data-type="tel" maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNo" name="officeFaxNo" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td colspan="3">
                                    <input id="emailNm" name="emailNm" type="email" value="" class="form_input form_email" maxlength="40" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                                <td>
                                    <input id="wechatId" name="wechatId" type="text" value="" class="form_input"  maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.qq" /></th> <!-- QQ -->
                                <td>
                                    <input id="qqId" name="qqId" type="text" value="" class="form_input"  maxlength="20" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.prefCommMthCd" /></span></th> <!-- 선호연락방법 -->
                                <td class="required_area">
                                    <input id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.prefCommNo" /></span></th> <!-- 선호연락처 -->
                                <td class="required_area">
                                    <input id="prefCommNo" name="prefCommNo" class="form_input numberic" data-type="mobile" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefContactMthCd" /></th> <!-- 우선연락방식  SMS / EMAIL / DM -->
                                <td>
                                    <input id="prefContactMthCd" name="prefContactMthCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefContactTime" /></th> <!-- 우선연락시간 -->
                                <td>
                                    <input id="prefContactTimeCd" name="prefContactTimeCd" class="form_comboBox"  data-json-obj="true" />
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
                                    <label class="label_check ml5"><input id="smsReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNo" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="telReceiveYn" name="telReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.homeTelNo" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="dmReceiveYn" name="dmReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.dm" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="emailReceiveYn" name="emailReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code='global.lbl.email' /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="faxReceiveYn" name="faxReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code='global.lbl.fax' /></label>&nbsp;&nbsp;&nbsp;
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
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.corporation" /></span></th> <!-- 고객명 -->
                                <td>
                                    <div class="form_search">
                                    <input id="custNmSearchC" name="custNmSearchC" type="text" value="" class="form_input onKey_down" />
                                    <input id="custNmC" name="custNmC" type="hidden" value="" class="form_input" data-json-obj="true" />
                                        <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTpC" name="custTpC" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td class="required_area">
                                    <input id="custNoC" name="custNoC" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                                <td class="readonly_area">
                                    <input id="custCdC" name="custCdC" class="form_comboBox form_readonly " readOnly data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.defaultInfo' /></h2> <!-- 기본정보 -->
                </div>
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
                                <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th> <!-- 대표자명 -->
                                <td>
                                    <input id="ownRgstNm" name="ownRgstNm"  type="text" class="form_input" maxlength="30" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                                <td>
                                    <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                <td>
                                    <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input numberandalpha getCustMathDocDupByKey"  maxlength="30" pattern="[0-9A-Z]" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" style="width:16%" >
                                            <label class="label_check ml5"><input id="bhmcYnC" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled data-json-obj="true" /></label>
                                        </div>
                                        <div class="form_right" style="width:84%" >
                                            <input id="siebelRowIdC" name="siebelRowIdC" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 담당SC -->
                                <td class="readonly_area">
                                    <input id="mngScNmC" name="mngScNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngScIdC" name="mngScIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecNmC" name="mngTecNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecIdC" name="mngTecIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custHoldTp" /></th> <!-- 정보출처 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.5%;" >
                                            <input id="custHoldTpC" name="custHoldTpC" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.5%;">
                                            <input id="custHoldTpDtlC" name="custHoldTpDtlC" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
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
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.officeTelNo" /></span></th> <!-- 대표전화 -->
                                <td class="required_area">
                                    <input id="officeTelNoC" name="officeTelNoC" type="text" value="" class="form_input form_readonly"  readonly data-type="tel" maxlength="30" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNoC" name="officeFaxNoC" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td colspan="3">
                                    <input id="emailNmC" name="emailNmC" type="email" value="" class="form_input form_email" maxlength="40" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                <td>
                                  <input id="bizcondCdC" name="bizcondCdC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                <td>
                                  <input id="cmpScaleContC" name="cmpScaleContC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                                <td>
                                  <input id="cmpTpC" name="cmpTpC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th></th>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                                <td colspan="3">
                                  <select id="custGroupsC" name="custGroupsC" multiple="multiple" ></select>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                                <td colspan="3">
                                  <select id="custTagsC" name="custTagsC" multiple="multiple" ></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>  <!-- corporateDiv End -->
            </div>  <!-- customerForm 마침 -->
            </section>
      <!-- //기본정보 -->
            <!-- 주소정보 시작 -->
            <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.addr' /></h2>
                <div class="btn_right">
                    <%-- <button class="btn_s btn_save" id="btnSaveAddress" ><spring:message code="global.btn.save" /></button> <!-- 주소저장 --> --%>
                    <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 -->
                    <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 -->
                </div>
            </div>
            <div class="table_grid">
                <div id="addrGrid"></div>
            </div>
            </section>
            <!-- //주소정보 끝 -->
            <!-- 보유차량 시작 -->
            <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.lbl.haveCar' /></h2> <!-- 보유차량 -->
                </div>
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
                                <th scope="row"><spring:message code="global.lbl.carlineNm" /></th> <!-- 차종명 -->
                                <td>
                                    <input id="carlineNmHC" name="carlineNmHC"  class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.modelNm" /></th> <!-- 모델 -->
                                <td>
                                    <input id="modelNmHC" name="modelNmHC" class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.licensePlt" /></th> <!-- 번호판 -->
                                <td>
                                    <input id="carRegNoHC" name="carRegNoHC"  class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.purcDt" /></th> <!-- 구매일자 -->
                                <td class="readonly_area">
                                    <input id="custSaleDtHC" name="custSaleDtHC" class="form_datepicker form_readonly" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //보유차량 끝 -->
            <!-- 정비이력 시작 -->
            <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='ser.lbl.lbrHistory' /></h2> <!-- 정비이력 -->
                </div>
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
                                <th scope="row"><spring:message code="global.lbl.carNo" /></th> <!-- 차량번호 -->
                                <td>
                                    <input id="carRegNoLH" name="carRegNoLH" class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.vsitr" /></th> <!-- 방문자 -->
                                <td>
                                    <input id="driverNmLH" name="driverNmLH"  class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.lbrDt" /></th> <!-- 정비일자 -->
                                <td>
                                    <input id="roDtLH" name="roDtLH"  class="form_datepicker form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.runDist" /></th> <!-- 주행거리 -->
                                <td>
                                    <input id="runDistValLH" name="runDistValLH" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //정비이력 끝 -->
            <!-- 딜러멤버십 시작 -->
            <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.lbl.dlrMbrShip' /></h2> <!-- 딜러멤버십 -->
                </div>
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
                                <th scope="row"><spring:message code="global.lbl.dlrMbrShipReg" /></th> <!-- 딜러멤버십등급 -->
                                <td>
                                    <input id="gradeCdDMS" name="gradeCdDMS"  class="form_comboBox form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.savePointAble" /></th> <!-- 적립포인트(가용) -->
                                <td>
                                    <input id="usePointDMS" name="usePointDMS" class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.chargePointAble" /></th> <!-- 충전포인트(가용) -->
                                <td>
                                    <input id="chargeUsePointDMS" name="chargeUsePointDMS"  class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.joinDt" /></th> <!-- 가입일 -->
                                <td class="readonly_area">
                                    <input id="joinDtDMS" name="joinDtDMS" class="form_datepicker form_readonly" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //딜러멤버십 끝 -->
        <!-- Tab Area Start -->
        <section class="group">
            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="custDtlTab" class="k-state-active"><spring:message code="global.lbl.dtlInfo" /><!-- 상세정보 --></li>
                    <li id="relCustInfoTab"><spring:message code="global.lbl.relCustInfo" /> <!-- 연계인 --></li>
                    <li id="haveCarTab"><spring:message code="global.lbl.haveCar" /> <!-- 보유차량 --></li>
                    <li id="activeTab"><spring:message code="global.lbl.active" /> <!-- 활동 --></li>
                    <li id="leadTab"><spring:message code="global.lbl.lead" /> <!-- 리드 --></li>
                    <li id="saleOptyTab"><spring:message code="global.lbl.saleOpty" /> <!-- 판매기회 --></li>
                    <li id="lbrHistoryTab"><spring:message code="ser.lbl.lbrHistory" /> <!-- 정비이력 --></li>
                    <li id="dlrMbrShipTab"><spring:message code="global.lbl.dlrMbrShip" /> <!-- 딜러멤버십 --></li>
                    <li id="blueMbrShipTab"><spring:message code="global.lbl.blueMbrShip" /> <!-- 블루멤버십 --></li>
                    <li id="incFincTab"><spring:message code="global.lbl.incFinc" /> <!-- 보험/금융 --></li>
                    <li id="infoUpdHistTab"><spring:message code="global.lbl.infoUpdHist" /> <!-- 정보변경이력  --></li>
                    <li id="memoTab"><spring:message code="global.lbl.memo" /> <!-- 메모 --></li>
                    <li id="sendInfoHistTab"><spring:message code="global.lbl.sendInfoHist" /> <!-- 공장으로 보고하는 고객 --></li>
                    <li id="contractTab"><spring:message code="global.lbl.contract" /> <!-- 계약서 --></li>
                    <li id="fileTab"><spring:message code="global.lbl.file" /> <!-- 첨부파일 --></li>
                </ul>
                <div id="custDtlTabDiv"><!-- 상세정보 시작-->
                <div id="custDtlTabArea">
                    <section class="group">
                        <div class="header_area">
                            <%-- <h2 class="title_basic"><spring:message code="global.lbl.dtlInfo" /></h2> --%>
                            <div class="btn_right">
                                <button class="btn_xs" id="btnSearchCustDtl" ><spring:message code="global.btn.search" /></button> <!-- 상세정보조회 -->
                                <button class="btn_xs" id="btnSaveCustDtl" ><spring:message code="global.btn.save" /></button> <!-- 상세정보저장 -->
                            </div>
                        </div>
                <div class="table_form form_width_100per mt5">
                    <table>
                        <colgroup>
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"></th> <!-- 개인정보활용동의서 -->
                                <td>
                                    <label class="label_check ml5"><input id="perInfoAgreeYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.infoAgreedocId" /></label>
                                    <label class="label_check ml5"><input id="perInfoUseYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.infoUsrYn" /></label>
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
                                        <th scope="row"><spring:message code='global.lbl.buyAddCnt' /></th> <!-- 추가구매  -->
                                        <td colspan="3">
                                            <input id="buyCnt" name="buyCnt" class="form_input"  data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.chgBuy' /></th> <!-- 교환구매  -->
                                        <td colspan="3">
                                            <div class="form_float">
                                                <div class="form_left" style="width:33%;" >
                                                    <input id="chgBuyYn" name="chgBuyYn" class="form_comboBox" data-json-obj="true" />
                                                </div>
                                                <div class="form_left" style="width:33%;">
                                                    <input id="purcCarBrandCd" name="purcCarBrandCd" class="form_comboBox" data-json-obj="true" />
                                                </div>
                                                <div class="form_right" style="width:34%;">
                                                    <input id="purcCarModelNm" name="purcCarModelNm" class="form_input" data-json-obj="true" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                      <th scope="row"><spring:message code="global.lbl.birthday" /></th> <!--  생일 -->
                                      <td>
                                          <input id="birthDt" name="birthDt" class="form_datepicker"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.age" /></th> <!-- 나이 -->
                                      <td>
                                          <input id="ageDtl" name="ageDtl" class="form_numeric"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.chinaZodiacSign" /></th> <!-- 띠 -->
                                      <td>
                                          <input id="chinaZodiacSignCd" name="chinaZodiacSignCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.zodiacSign" /></th> <!-- 별자리 -->
                                      <td>
                                          <input id="zodiacSignCd" name="zodiacSignCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row"><spring:message code="global.lbl.bloodTp" /></th> <!--  혈액열 -->
                                      <td>
                                          <input id="bloodTp" name="bloodTp" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.marryYn" /></th> <!-- 결혼여부 -->
                                      <td>
                                          <input id="marryCd" name="marryCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.marryDt" /></th> <!-- 결혼기념일 -->
                                      <td>
                                          <input id="marryDt" name="marryDt" class="form_datepicker"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.childrenCnt" /></th> <!-- 자녀수 -->
                                      <td>
                                          <input id="childrenCnt" name="childrenCnt" class="form_numeric"  pattern="[0-9]" data-json-obj="true" />
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row"><spring:message code="global.lbl.incomeLvlCd" /></th> <!-- 가계소득 -->
                                      <td>
                                          <input id="incomeLvlCd" name="incomeLvlCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.acCareerCd" /></th> <!-- 학력 -->
                                      <td>
                                          <input id="acCareerCd" name="acCareerCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>

                                    </tr>
                                    <tr>
                                      <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                                      <td colspan="3">
                                          <select id="custGroups" name="custGroups" multiple="multiple" ></select>
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                                      <td colspan="3">
                                          <select id="custTags" name="custTags" multiple="multiple" ></select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row"><spring:message code="global.lbl.hobby" /></th> <!-- 취미 -->
                                      <td colspan="3">
                                          <select id="custHobbys" name="custHobbys" multiple="multiple" ></select>
                                          <!--  <input id="hobbyCd" name="hobbyCd" class="form_comboBox"  data-json-obj="true" /> -->
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
                                      <th scope="row"><spring:message code="global.lbl.officeNm" /></th> <!-- 직장명 -->
                                      <td>
                                          <input id="officeNm" name="officeNm" type="text" value="" class="form_input"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                      <td>
                                          <input id="bizcondCd" name="bizcondCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                      <td>
                                          <input id="cmpScaleCont" name="cmpScaleCont" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                                      <td>
                                          <input id="cmpTp" name="cmpTp" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row"><spring:message code="global.lbl.job" /></th> <!-- 직업 -->
                                      <td>
                                          <input id="jobCd" name="jobCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.deptNm" /></th> <!-- 부서 -->
                                      <td>
                                          <input id="deptNm" name="deptNm" type="text" value="" class="form_input"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><spring:message code="global.lbl.jobNm" /></th> <!-- 직무 -->
                                      <td>
                                          <input id="dutyCd" name="dutyCd" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th></th><td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div> <!-- // custDtlTabArea End -->
                </div> <!-- // 상세정보 끝 -->
                <div id="relCustInfoTabDiv"> <!-- 연계인 시작-->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.title.relCustInfo" /></h2> <!-- 고객 연계인 정보 --> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchRelCust" ><spring:message code="global.btn.search" /></button> <!-- 연계인조회 -->
                              <button class="btn_xs" id="btnSaveRelCustGrid" ><spring:message code="global.btn.save" /></button> <!-- 연계인저장 -->
                              <button class="btn_xs" id="btnAddRelCust" ><spring:message code="global.btn.rowAdd" /></button> <!-- 연계인행추가 -->
                              <button class="btn_xs" id="btnDelRelCust" ><spring:message code="global.btn.rowDel" /></button> <!-- 연계인행삭제 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="gridRel"></div>
                      </div>
                  </section>
                </div> <!-- //연계인 끝-->
                <div id="haveCarTabDiv"><!-- 보유차량 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.haveCar" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchHaveCar" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="haveCarGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //보유차량 끝 -->
                <div id="activeTabDiv"><!-- 활동 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.active" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchActive" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="activeGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //활동 끝-->
                <div id="leadTabDiv"><!-- 리드 -->
                 <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.lead" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchLead" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="gridLead"></div>
                      </div>
                  </section>
                </div> <!-- //리드 끝-->
                <div id="saleOptyTabDiv"><!-- 판매기회 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.saleOpty" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchSalesOppt" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="salesOpptGrid"></div>
                      </div>
                  </section>
                </div> <!-- //판매기회 끝-->
                <div id="lbrHistoryTabDiv"> <!-- 정비이력 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="ser.lbl.lbrHistory" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchLbr" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="lbrGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //정비이력 끝 -->
                <div id="dlrMbrShipTabDiv"> <!-- 딜러멤버십 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.dlrMbrShip" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchDlrMbrShip" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
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
                                    <th scope="row"><spring:message code='global.lbl.dlrMbrShipReg' /></th> <!-- 딜러멤버십등급 -->
                                    <td>
                                        <input type="text" id="gradeCd" value="" class="form_comboBox form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.savePointAble' /></th> <!-- 적립포인트(가용) -->
                                    <td class="readonly_area">
                                        <input type="text" id="usePoint" value="" class="form_numeric form_readonly form_num" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.chargePointAble' /></th> <!-- 충전포인트(가용)-->
                                    <td class="readonly_area">
                                        <input type="text" id="chargeUsePoint" value="" class="form_numeric form_readonly form_num" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.joinDt' /></th> <!-- 가입일 -->
                                    <td class="readonly_area">
                                        <input type="text" id="joinDt" value="" class="form_datepicker form_readonly" readonly />
                                    </td>
                                 </tr>
                             </tbody>
                            </table>
                        </div>
                      <div class="table_grid">
                        <div id="dlrMbrShipGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //딜러멤버십 끝-->
                <div id="blueMbrShipTabDiv"> <!-- 블루멤버십 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.blueMbrShip" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchBlueMbrShip" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
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
                                    <th scope="row"><spring:message code='global.lbl.BlueMbrShipReg' /></th> <!-- 블루멤버십등급 -->
                                    <td>
                                        <input type="text" id="blueGradeCd" value="" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.savePointAble' /></th> <!-- 적립포인트(가용) -->
                                    <td class="readonly_area">
                                        <input type="text" id="blueUsePoint" value="" class="form_numeric form_readonly form_num" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.joinDt' /></th> <!-- 가입일 -->
                                    <td class="readonly_area">
                                        <input type="text" id="blueJoinDt" value="" class="form_datepicker form_readonly" readonly />
                                    </td>
                                    <th></th>
                                    <td></td>
                                 </tr>
                            </tbody>
                        </table>
                      </div>
                      <div class="table_grid">
                        <div id="blueMbrShipGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //블루멤버십 끝 -->
                <div id="incFincTabDiv"> <!-- 보험/금융 -->
                  <section class="group">
                      <div class="header_area">
                          <h3 class="title_basic"><spring:message code="global.lbl.insurance" /></h3>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchInc" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="incGrid" class="grid"></div>
                      </div>
                  </section>
                  <section class="group">
                      <div class="header_area">
                          <h3 class="title_basic"><spring:message code="global.lbl.finc" /></h3>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchfinc" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="fincGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //보험/금융 끝 -->
                <div id="infoUpdHistTabDiv"> <!-- 정보변경이력  -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.infoUpdHist" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchInfoUpdHist" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="infoUpdHistGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //정보변경이력 끝 -->
                <div id="memoTabDiv"> <!-- 메모 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.memo" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchMemo" ><spring:message code="global.btn.search" /></button> <!-- 메모조회 -->
                              <button class="btn_xs" id="btnSaveMemo" ><spring:message code="global.btn.save" /></button> <!-- 메모저장 -->
                              <button class="btn_xs btn_add" id="btnAddMemo" ><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                              <button class="btn_xs btn_del" id="btnDelMemo" ><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="memoGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //메모 끝 -->
                <div id="sendInfoHistTabDiv"> <!-- 공장으로 보고하는 고객 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.sendInfoHist" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchSendInfoHist" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="sendInfoHistGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //공장으로 보고하는 고객 끝 -->
                <div id="contractTabDiv"> <!-- 계약서 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.contract" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchContract" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="contractGrid"></div>
                      </div>
                  </section>
                </div> <!-- //계약서  끝 -->
                <div id="fileTabDiv"> <!-- 첨부파일 -->
<!-- *************************************************************************
**************************파일업로드2********************************************
***************************************************************************-->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.file" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchFile" ><spring:message code="global.btn.search" /><!-- 파일조회 --></button>
                              <button class="btn_xs" id="btnSaveFile" ><spring:message code="global.btn.save" /><!-- 파일저장 --></button>
                              <button class="btn_xs" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                              <span class="btn_xs" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="fileGrid"></div>
                      </div>
                  </section>
<!-- *************************************************************************
**************************파일업로드2********************************************
***************************************************************************-->
                </div> <!-- //첨부파일 끝-->
            </div>
        </section>
        <!-- //Tab Area End-->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

/*************************************************************
 데이터 셋업
*************************************************************/
    var popupWindow;
    var groupTxt;
    var tagTxt;
    var groupDS = [];
    var hobbyDS = [];
    var tagDS   = [];
    var custGroups = [];
    var custTags = [];
    var custHobbys = [];
    var custGroupsC = [];
    var custTagsC = [];
    var pointCdListMap = [];

    var getParamChk             = "${getParamChk}";
    var loginDlrCd              = "${dlrCd}";
    var custNo                  = "${custNo}";
    var custTpList              = [];
    var custTpMap         = [];
    var cardTpCdList              = [];
    var cardTpCdMap         = [];
    var custCdList              = [];
    var custCdMap = [];
    var custHoldTpList          = [];
    var custHoldTpDtlList       = [];
    var sexCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":""}];
    var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpList           = [];
    var mbrGradeCdList          = [];
    var mathDocTpListC          = [{"cmmCd":"", "cmmCdNm":""}];
    var pconTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    var addrTpList              = [];
    var ageCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var driverTpList            = [{"cmmCd":"", "cmmCdNm":""}];
    var jobCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":""}];
    var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":""}];
    var cmpTpList               = [{"cmmCd":"", "cmmCdNm":""}];
    var acCareerCdList          = [{"cmmCd":"", "cmmCdNm":""}];
    var marryYnList             = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":""}];
    var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":""}];
    var prefCommMthCdList       = [];
    var chgBuyYnDS              = [];
    var chgBuyYnMap             = [];
    var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":""}];
    var purcCarBrandCdMap       = [];
    var chinaZodiacSignCdDS     = [{"cmmCd":"", "cmmCdNm":""}];
    var zodiacSignCdDS          = [{"cmmCd":"", "cmmCdNm":""}];
    var bloodTpDS               = [{"cmmCd":"", "cmmCdNm":""}];
    var dutyCdDS                = [{"cmmCd":"", "cmmCdNm":""}];


    var prefCommMthCdMap        = [];
    var mathDocTpMap            = [];
    var mathDocTpMapC            = [];
    var pconTpMap               = [];
    var addrTpMap               = [];
    var prefContactMthCdMap     = [];
    var prefContactTimeCdMap    = [];
    var callStatCdList = [];
    var callStatCdMap = [];
    var leadSrcList = [];
    var leadSrcMap = [];
    var statList = [];
    var statMap = [];

    chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
    chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

    // 리드유형
    var leadTpList = [];
    var leadTpMap = [];
    <c:forEach var="obj" items="${leadTpList}">
        leadTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        leadTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 메모유형
    var memoTpDS = [];
    var memoTpMap = [];
    <c:forEach var="obj" items="${memoTpDS}">
        memoTpDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        memoTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 성동활률 DS
    var succPrbCdDs = [];
    var succPrbCdArr = [];
    <c:forEach var="obj" items="${succPrbCdList}">
        succPrbCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        succPrbCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    succPrbCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = succPrbCdArr[val];
        }
        return returnVal;
    };

    // 판매기회 출처 DS
    var saleOpptSrcCdDs = [];
    var saleOpptSrcCdArr = [];

    <c:forEach var="obj" items="${saleOpptSrcCdList}">
        saleOpptSrcCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        saleOpptSrcCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    saleOpptSrcCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = saleOpptSrcCdArr[val];
        }
        return returnVal;
    };

    // 판매기회단계 DS
    var saleOpptStepCdDs = [];
    var saleOpptStepCdArr = [];
    <c:forEach var="obj" items="${saleOpptStepCdList}">
        saleOpptStepCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        saleOpptStepCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    saleOpptStepCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = saleOpptStepCdArr[val];
        }
        return returnVal;
    };

    // 전출상태 DS
    var trsfStatCdDs = [];
    var trsfStatCdArr = [];
    <c:forEach var="obj" items="${trsfStatCdList}">
        trsfStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        trsfStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    trsfStatCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = trsfStatCdArr[val];
        }
        return returnVal;
    };

    // 사용자
    var usersDS = [];
    var usersArr = [];
    <c:forEach var="obj" items="${users}">
        usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
        usersArr["${obj.usrId}"] = "${obj.usrNm}";
    </c:forEach>
    usersArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = usersArr[val];
        }
        return returnVal;
    };

    // 정비이력 RO유형 -- 시작
    var roTpCdList = [];
    var roTpCdListMap = [];
    <c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    roTpCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    // 정비이력 RO유형 -- 끝

    //계약유형 SAL003
    var contractTpDSList = [];
    var contractTpObj = {};
    <c:forEach var="obj" items="${contractTpList}">
        contractTpDSList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
        contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

  //계약상태 SAL002 (배정, 출고요청 만 표시)
    var contractStatDSList = [];
    var contractStatObj = {};
    <c:forEach var="obj" items="${contractStatList}">
        contractStatDSList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
        contractStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${callStatCdList}">
    callStatCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    callStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${leadSrcList}">
    leadSrcList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
    statList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    statMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${purcCarBrandCdDS}">
    purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    purcCarBrandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${chinaZodiacSignCdDS}">
    chinaZodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${zodiacSignCdDS}">
    zodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${bloodTpDS}">
    bloodTpDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${dutyCdDS}">
    dutyCdDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>


    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${pointCdList}">
    pointCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${cardTpCdList}">
    cardTpCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    cardTpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpList}">
    custHoldTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpDtlList}">
    custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCd}">
    prefContactMthCd.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCd}">
    prefContactTimeCd.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${incomeLvlCdList}">
    incomeLvlCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${mbrGradeCdList}">
    mbrGradeCdList.push({"cmmCd":"${obj.gradeSeq}" , "cmmCdNm":"${obj.gradeNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${mathDocTpList}">
        <c:if test="${obj.remark1 == 'P'}">
            mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
            mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>

        <c:if test="${obj.remark1 == 'C'}">
            mathDocTpListC.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
            mathDocTpMapC["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${pconTpList}">
    pconTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    pconTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${addrTpList}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${ageCdList}">
    ageCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${driverTpList}">
    driverTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${jobCdList}">
    jobCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpScaleContList}">
    cmpScaleContList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpTpList}">
    cmpTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${acCareerCdList}">
    acCareerCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${marryYnList}">
    marryYnList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${avgCarChgCdList}">
    avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroups.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHobbys}">
    custHobbys.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroupsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTagsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    var defaultGroupCDatasourceSetting = function(e){
        groupDS = [];
        var selectedGroups = $("#custGroupsC").data("kendoMultiSelect").value();

        if(selectedGroups.length == 0){
            return;
        }

        $.each(custGroupsC, function(index, data){
            if(selectedGroups.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
            }
        });
        console.log(groupDS);
    };

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

    var defaultHobbyDatasourceSetting = function(e){
        hobbyDS = [];
        var selectedHobbys = $("#custHobbys").data("kendoMultiSelect").value();

        if(selectedHobbys.length == 0){
            return;
        }

        $.each(custHobbys, function(index, data){
            if(selectedHobbys.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                hobbyDS.push({"grpSeq":data.grpSeq,"grpTp":"003"});
            }
        });
    };

    var defaultGroupDatasourceSetting = function(e){
        groupDS = [];
        var selectedGroups = $("#custGroups").data("kendoMultiSelect").value();

        if(selectedGroups.length == 0){
            return;
        }

        $.each(custGroups, function(index, data){
            if(selectedGroups.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
            }
        });
    };

    var defaultTagDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#custTags").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            return;
        }

        $.each(custTags, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });
    };

    function getCustDupByKey(idVal){

        var custTp = $("#custTp").data("kendoExtDropDownList").value();

        var custNm = $("#custNm").val();
        var custNo = $("#custNo").val();
        var hpNo = $("#hpNo").val();
        var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
        var ssnCrnNo = $("#ssnCrnNo").val();
        var officeTelNo = $("#officeTelNoC").val();
        var oldCustNm = $("#oldCustNm").val();
        var oldHpNo = $("#oldHpNo").val();
        var oldMathDocTp = $("#oldMathDocTp").val();
        var oldSsnCrnNo = $("#oldSsnCrnNo").val();
        var chkContinued = false;

        if (custTp == "02") {
            custNm = $("#custNmC").val();
            mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
            ssnCrnNo = $("#ssnCrnNoC").val();
            if (custNm.length >= 1 && officeTelNo.length > 1 ) {
                chkContinued = true;
            }
        } else {
            if (custNm.length >= 1 && hpNo.length > 1 ) {
                chkContinued = true;
            }
        }

        if (chkContinued){

            var param = {};
            param["sCustTp"]       = custTp;
            param["sCustNm"]       = custNm;
            param["sHpNo"]         = hpNo;
            param["sOfficeTelNo"]         = officeTelNo;
            param["sMathDocTp"]         = mathDocTp;
            param["sSsnCrnNo"]         = ssnCrnNo;
            param["sOldCustNm"]         = oldCustNm;
            param["sOldHpNo"]         = oldHpNo;
            param["sOldMathDocTp"]         = oldMathDocTp;
            param["sOldSsnCrnNo"]         = oldSsnCrnNo;

            console.log(param);

            $.ajax({
                url:"<c:url value='/crm/cif/customerInfo/selectCustDupByKey.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    console.log(jqXHR.responseJSON);
                    //alert(jqXHR.responseJSON.errors[0].errorMessage);
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    console.log(result);

                    if (result.custInfoDS.length == 0 ){
                        dms.notification.success("<spring:message code='global.info.ableToDo' />");
                    } else {
                        dms.notification.success("<spring:message code='global.info.already' />");
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
    }


    function getCustMathDocDupByKey(idVal){

        var custTp = $("#custTp").data("kendoExtDropDownList").value();


        var custNm = $("#custNm").val();
        var custNo = $("#custNo").val();
        var hpNo = $("#hpNo").val();
        var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
        var ssnCrnNo = $("#ssnCrnNo").val();
        var officeTelNo = $("#officeTelNoC").val();
        var oldCustNm = $("#oldCustNm").val();
        var oldHpNo = $("#oldHpNo").val();
        var oldMathDocTp = $("#oldMathDocTp").val();
        var oldSsnCrnNo = $("#oldSsnCrnNo").val();
        var chkContinued = false;

        if (custTp == "02") {
            custNm = $("#custNmC").val();
            mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
            ssnCrnNo = $("#ssnCrnNoC").val();
        }

        if (mathDocTp.length >= 1 && ssnCrnNo.length > 1 ){

            var param = {};
            param["sCustTp"]       = custTp;
            param["sCustNm"]       = custNm;
            param["sHpNo"]         = hpNo;
            param["sOfficeTelNo"]         = officeTelNo;
            param["sMathDocTp"]         = mathDocTp;
            param["sSsnCrnNo"]         = ssnCrnNo;
            param["sOldCustNm"]         = oldCustNm;
            param["sOldHpNo"]         = oldHpNo;
            param["sOldMathDocTp"]         = oldMathDocTp;
            param["sOldSsnCrnNo"]         = oldSsnCrnNo;

            console.log(param);

            $.ajax({
                url:"<c:url value='/crm/cif/customerInfo/selectCustMathDocDupByKey.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    console.log(jqXHR.responseJSON);
                    //alert(jqXHR.responseJSON.errors[0].errorMessage);
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    console.log("getCustMathDocDupByKey !!! ");
                    console.log(result);

                    if (result.length == 0 ){
                        dms.notification.success("<spring:message code='global.info.ableToDo' />");
                    } else {
                        dms.notification.success("<spring:message code='global.info.already' />");
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
    }

    /******************************************************
     * 활동 탭 (DataSource)- 시작
     ******************************************************/


    // 영업활동유형 DS
    var salesActiveTpCdArr = [];
    <c:forEach var="obj" items="${salesActiveTpCdList}">
        salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    salesActiveTpCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = salesActiveTpCdArr[val];
        }
        return returnVal;
    };

    // 연락방식 DS
    var commMthCdArr = [];
    <c:forEach var="obj" items="${commMthCdList}">
        commMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    commMthCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = commMthCdArr[val];
        }
        return returnVal;
    };

    // 영업활동상태 DS
    var salesActiveStatCdArr = [];
    <c:forEach var="obj" items="${salesActiveStatCdList}">
        salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    salesActiveStatCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = salesActiveStatCdArr[val];
        }
        return returnVal;
    };
     /******************************************************
     * 활동 탭 (DataSource)- 종료
     ******************************************************/

     /******************************************************
      * 띠 처리 - 시작
      ******************************************************/
    function getpet(toYear) {
        console.log("====toYear====");
         console.log(toYear);
        var toyear = 1997; //(1997 - 내가 태어난날) % 12 합니다.
        //var birthyear = document.frm.inyear.value;
        var birthyear = toYear;
        var birthpet="Ox"
        x = (toyear - birthyear) % 12// x값을 구합니다.
        console.log("x ===> " + x);

        if ((x ==1) || (x == -11)) {
            birthpet="쥐띠"
        } else if (x == 0) {
            birthpet="Ox"
        } else if ((x == 11) || (x == -1)) {
            birthpet="호랑이띠"
        } else if ((x == 10) || (x == -2)) {
            birthpet="토끼띠"
        } else if ((x == 9) || (x == -3)) {
            birthpet="용띠"
        } else if ((x == 8) || (x == -4)) {
            birthpet="뱀띠"
        } else if ((x == 7) || (x == -5)) {
            birthpet="말띠"
        } else if ((x == 6) || (x == -6)) {
            birthpet="양띠"
        } else if ((x == 5) || (x == -7)) {
            birthpet="원숭이띠"
        } else if ((x == 4) || (x == -8)) {
            birthpet="닭띠"
        } else if ((x == 3) || (x == -9)) {
            birthpet="개띠"
        } else if ((x == 2) || (x == -10)) {
            birthpet="돼지띠"
        }

        console.log(birthpet);
        //$("#zodi").val(birthpet);
    }

    /******************************************************
     * 띠 처리 - 종료
     ******************************************************/

$(document).ready(function() {

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

// 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
            } else {
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                $("#personalDiv").hide();
                $("#corporateDiv").show();
            }
        }
        , enable:false
    });

 // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                $("#personalDiv").show();
                $("#corporateDiv").hide();
            } else {
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
            }
        }
        , enable:false
    });

 // 잠재/보유고객      custCd              (CRM023)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:0
        //,  value:"01"
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
/*             if (selcmmCd == "02") {
                $("#mathDocTp").data("kendoExtDropDownList").enable(false);
                $("#ssnCrnNo").attr("readonly", true);
                $("#ssnCrnNo").addClass("form_readonly");
                $("#mathDocTpC").data("kendoExtDropDownList").enable(false);
                $("#ssnCrnNoC").attr("readonly", true);
                $("#ssnCrnNoC").addClass("form_readonly");
            } else {
                $("#mathDocTp").data("kendoExtDropDownList").enable(true);
                $("#ssnCrnNo").attr("readonly", false);
                $("#ssnCrnNo").removeClass("form_readonly");
                $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
                $("#ssnCrnNoC").attr("readonly", false);
                $("#ssnCrnNoC").removeClass("form_readonly");
            } */
        }
    });
    $("#custCd").data("kendoExtDropDownList").value("01");

    // 잠재/보유고객      custCdC              (CRM023)
    $("#custCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:0
        , value:"01"
    });
    $("#custCdC").data("kendoExtDropDownList").value("01");


 // 선호연락방법       prefCommMthCd (CRM022)
     $("#prefCommMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:prefCommMthCdList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#prefCommNo").val($("#hpNo").val());
            } else if (selcmmCd == "02") {
                $("#prefCommNo").val($("#telNo").val());
            } else {
                $("#prefCommNo").val($("#officeTelNo").val());
            }
        }
    });

 // 신분증유형            mathDocTp       (CRM024)
     $("#mathDocTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:mathDocTpList
        , index:0
    });

     // 신분증유형            mathDocTpC       (CRM024)
     $("#mathDocTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:mathDocTpListC
        , index:0
    });

 // 고객확보유형1      custHoldTp      (CRM008)
     $("#custHoldTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            var custHoldTpDtl = $("#custHoldTpDtl").data("kendoExtDropDownList");
            if (selcmmCd == "01"){
                custHoldTpDtl.enable(true);
            } else {
                custHoldTpDtl.value("");
                custHoldTpDtl.enable(false);
            }
        }
    });

 // 고객확보유형2      custHoldTpDtl   (CRM***)
     $("#custHoldTpDtl").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpDtlList
        , index:0
        , enable:false
    });

     // 고객확보유형1      custHoldTpC      (CRM008)
     $("#custHoldTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            var custHoldTpDtl = $("#custHoldTpDtlC").data("kendoExtDropDownList");
            if (selcmmCd == "01"){
                custHoldTpDtl.enable(true);
            } else {
                custHoldTpDtl.value("");
                custHoldTpDtl.enable(false);
            }
        }
    });

 // 고객확보유형2      custHoldTpDtlC   (CRM***)
     $("#custHoldTpDtlC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpDtlList
        , index:0
        , enable:false
    });

 // 직업군                  jocCd                   (CRM002)
     $("#jobCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:jobCdList
        , index:0
    });

 // 업종                  bizcondCd
     $("#bizcondCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:bizcondCdList
        , index:0
    });

 // 회사규모                  cmpScaleContList       (CRM026)
     $("#cmpScaleCont").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpScaleContList
        , index:0
    });

 // 회사유형                  cmpTp
     $("#cmpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpTpList
        , index:0
    });

 // 업종                  bizcondCdC
     $("#bizcondCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:bizcondCdList
        , index:0
    });

 // 회사규모                  cmpScaleContListC       (CRM026)
     $("#cmpScaleContC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpScaleContList
        , index:0
    });

 // 회사유형                  cmpTpC
     $("#cmpTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpTpList
        , index:0
    });


 // 주 운전자                driverTp            (CRM015)
     $("#driverTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:driverTpList
        , index:0
    });

 // 연령                       ageCd                 (CRM014)
     $("#ageCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:ageCdList
        , index:0
    });

 // 학력                       acCareerCd      (CRM012)
     $("#acCareerCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:acCareerCdList
        , index:0
    });

 // 소득수준             incomeLvlCd     (CRM013)
     $("#incomeLvlCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:incomeLvlCdList
        , index:0
    });

 // 성별                       sexCd                   (COM017)
     $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:sexCdList
        , index:0
    });

 // 우선연락방식                       prefContactMthCd    (CRM038)
     $("#prefContactMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefContactMthCdList
        , index:0
    });

 // 우선연락시간                       prefContactTimeCd      (CRM027)
     $("#prefContactTimeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefContactTimeCdList
        , index:0
    });

 // 결혼여부                       marryYnList          (CRM028)
     $("#marryCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:marryYnList
        , index:0
    });

 // 평균차량 교체 시기                       avgCarChgCdList    (CRM029)
     $("#avgCarChgCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:avgCarChgCdList
        , index:0
    });

     $("#chgBuyYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:" "
         , dataSource:chgBuyYnDS
         , index:0
     });

     $("#purcCarBrandCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:purcCarBrandCdDS
         , index:0
     });

     $("#chinaZodiacSignCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:chinaZodiacSignCdDS
         , index:0
     });

     $("#zodiacSignCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:zodiacSignCdDS
         , index:0
     });

     $("#bloodTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:bloodTpDS
         , index:0
     });

     $("#dutyCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:dutyCdDS
         , index:0
     });

 // 결혼기념일
     $("#marryDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

 // 생일
     $("#birthDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         , change:function(){

             //var fullYear = this.value().getFullYear();
             //console.log(fullYear);
             //getpet(fullYear);

         }
     });

    //$("#birthDt").focusout(function(){

       // kjlee
       //console.log($("#birthDt").data("kendoExtMaskedDatePicker").value());
       //console.log($("#birthDt").data("kendoExtMaskedDatePicker").value().getFullYear());
    //});




 // 숫자
     var onlyNum = new RegExp("[^0-9]","i");
     $(".numberic").keyup(function(e)
     {
         var content = $(this).val();

         if(content.match(onlyNum)){
             console.log($(this).val());
             $(this).val('');
         }
     });

/*       $(".numberic").kendoMaskedTextBox({
         mask:"000000000000000000"
         , promptChar:" "
         , culture:"de-CH"
         }); */

 // 숫자와 알파벳   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
     var onlyNumAlpha = new RegExp("[^A-Z0-9]");
     $(".numberandalpha").keyup(function(e)
     {

         var contents = $(this).val();
         console.log(contents);
         console.log(onlyNumAlpha.test(contents));
         if(onlyNumAlpha.test(contents)){

             $(this).val('');
         }
     });
/*      $(".numberandalpha").kendoMaskedTextBox({
         mask:"AAAAAAAAAAAAAAAAAAAA"
         , promptChar:" "
     }); */

// 이메일   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
      //var onlyEmail = new RegExp("^[a-zA-Z0-9]{2,15}@[a-zA-Z0-9]{1,10}(\.[a-zA-Z]{2,3}){1,2}$");
      //var onlyEmail = new RegExp("^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$");
    $(".form_email").keyup(function(e)
    {
        var onlyEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        var contents = $(this).val();
        console.log(contents);
        console.log(onlyEmail.test(contents));
        if(onlyEmail.test(contents)){
          //$(this).val('');
        }
    });

    $(".numberic").focusout(function(){
       $(this).val($.trim($(this).val()));
       var content = $(this).val();
       if(content.match(onlyNum)){
           $(this).val('');
       }
    });



     $(".numberandalpha").focusout(function(){
         $(this).val($.trim($(this).val()));
         var contents = $(this).val();
         console.log(contents);
         console.log(onlyNumAlpha.test(contents));
         if(onlyNumAlpha.test(contents)){

             $(this).val('');
         }
     });

     // 고객명, 휴대전화 입력 후 고객 체크 (자동)
     $(".getCustDupByKey").focusout(function(){
         var idValue = $(this).context.id;
         getCustDupByKey(idValue);
     });

     // 증거유형 + 증거번호 후 고객 체크 (자동)
     $(".getCustMathDocDupByKey").focusout(function(){
         var idValue = $(this).context.id;
         getCustMathDocDupByKey(idValue);
     });


 // 그룹
     $("#custGroups").kendoMultiSelect({
         dataSource:custGroups,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultGroupDatasourceSetting,
         change:defaultGroupDatasourceSetting
     });

 // 태그
     $("#custTags").kendoMultiSelect({
         dataSource:custTags,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultTagDatasourceSetting,
         change:defaultTagDatasourceSetting
     });

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

 // hobby 취미
     $("#custHobbys").kendoMultiSelect({
         dataSource:custHobbys,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultHobbyDatasourceSetting,
         change:defaultHobbyDatasourceSetting
     });

 // 자녀수
     $("#childrenCnt").kendoExtNumericTextBox({
         format:"#"
        ,min:0
     });

 // 나이
     $("#ageDtl").kendoExtNumericTextBox({
         format:"#"
        ,min:0
     });

  // 딜러멤버십 가입일
     $("#joinDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,enable:false
     });

  // 보유차량 구매일자
     $("#custSaleDtHC").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,enable:false
     });

  // 정비일자
     $("#roDtLH").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,enable:false
     });
  // 딜러멤버십 가입일
     $("#joinDtDMS").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,enable:false
     });

  // 블루멤버십 가입일
     $("#blueJoinDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,enable:false
     });

  // 딜러멤버십 등급
     $("#gradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:mbrGradeCdList
        , index:0
        , enable:false
    });

  // 딜러멤버십 등급
     $("#gradeCdDMS").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:mbrGradeCdList
        , index:0
        , enable:false
    });

  // 블루멤버십 등급
/*      $("#blueGradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:mathDocTpList
        , index:0
        , enable:false
    }); */

     // 포인트 숫자
     $(".form_num").kendoExtNumericTextBox({
         format:"#"
        , min:0
        , enable:false
     });

/*************************************************************
이벤트 정의
*************************************************************/

    $("#addrGrid").on("click", "input.flagYn", function(){

        var addrGrid = $("#addrGrid").data("kendoExtGrid");
        var uid = $(this).data("uid");

        $("input.flagYn", "#addrGrid").prop("checked", false);
        $(this).prop("checked", true);
        console.log(uid);

        $.each(addrGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });

        addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");
        console.log(addrGrid.dataSource.data());

    });

    //버튼 - 고객신규등록 바로가기
    $("#btnCustRegLink").kendoButton({
        click:function(e) {

            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.personalCustReg' />","<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do' />", "VIEW-I-10231"); //개인고객바로가기

        }
    });

    // 주소저장 - addrGrid
    //$("#btnSaveAddress").kendoButton({
    //$("#btnSaveAddress").click(function(){

    var btnSaveAddress = function() {

        var custNo = $("#custNo").val();

        var grid = $("#addrGrid").data("kendoExtGrid");

        $.each(grid.dataSource.view(), function(idx, dataItem){
            dataItem.set("refKeyNm", custNo);
        });

        var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

        if (grid.cudDataLength == 0){
            //dms.notification.info("<spring:message code='global.info.required.change' />");
            return;
        }

        // 그리드 무결성 점검
        var dataValidate = false;
        $.each(saveData.insertList, function(idx, row){
            if(row.addrTp == ""){
               // 선택하지 않은 주소유형이 있습니다.
               dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
               dataValidate = true;
               return false;
            }
         });

        if(dataValidate){ return false;}

        if (grid.gridValidation()){
            $.ajax({
                url:"<c:url value='/crm/cmm/addressInfo/multiAddressInfo.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                    console.log("failed!!");
                },
                success:function(jqXHR, textStatus){
                    //dms.notification.info("<spring:message code='global.info.success' />");
                    $("#btnCustSearch").click();
                    //grid.dataSource.page(1);
                }
            });
        }else{
            globalNotification.show("<spring:message code='global.info.check.input' />", "error");
        }
    };

    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                $(".custSearch").click();
            }
        }
    });

    // 고객조회
    //var custSearch = function() {
     $(".custSearch").click(function(){

         var custTp = $("#custTp").data("kendoExtDropDownList").value();
         var custNm = $("#custNmSearch").val();
         if (custTp == "02") {
             custNm = $("#custNmSearchC").val();
         }

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":true
                     , "custNm":custNm
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             console.log("Popup Search Result:::");
                             console.log(data[0]);

                             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                 $("#custNo").val(data[0].custNo);
                             }

                             popupWindow.close();

                             $("#btnCustSearch").click();
                         }
                     }
                 }
             }
         })
     });

    //버튼 - 연계인  추가
     $("#btnAddRelCust").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"customerSearchPopup"
                 , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data);
                                 insertRelCustomerItemAdd(data);
                             }
                         }
                     }
                 }
             })
         }
         , enable:false
     });

     // 연계인추가 - gridRel
     function insertRelCustomerItemAdd(data){
         $.each(data, function(idx, row){
             $("#gridRel").data("kendoExtGrid").dataSource.insert(0,{
                 "pconCustNo"            :row.custNo
                 , "pconTp"              :"01"
                 , "mathDocTp"           :row.mathDocTp
                 , "prefCommMthCd"       :row.prefCommMthCd
                 , "prefContactMthCd"    :row.prefContactMthCd
                 , "prefContactTimeCd"   :row.prefContactTimeCd
                 , "upperCustNo"         :$("#custNo").val()            // 상위 고객번호
                 , "custNm"              :row.custNm
                 , "certiNum"            :row.certiNum                  // 신분증 번호
                 , "telNo"               :row.telNo                     // 전화
                 , "hpNo"                :row.hpNo                      // 휴대전화
                 , "emailNm"             :row.emailNm                   // E-MAIL
                 //, "regDt"               :row.regDt                     // 등록일
                 , "prefCommNo"          :row.prefCommNo                // 선호 연락처
             });
         });
     }

     // 연계인 삭제 - gridRel
     $("#btnDelRelCust").kendoButton({
        click:function(e) {
            var grid = $("#gridRel").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
        , enable:false
     });

     //버튼 - 주소  추가
     $("#btnAddAddress").kendoButton({
         click:function(e) {
             /*
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             */

             zipCodeSearchPopupWin = dms.window.popup({
                 windowId:"zipCodeSearchPopupWin"
                 , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
                 , content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                     , data:{
                         "autoBind":false
                         ,"usrNm":""
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data);
                                 insertAddressItemAdd(data);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 주소추가 - addressGrid
     function insertAddressItemAdd(data){
         var custNo = $("#custNo").val();
         $.each(data, function(idx, row){
             $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "flagYn"            :"N"
                 , "addrTp"          :"01"
                 , "zipCd"           :row.zipCd
                 , "sungNm"          :row.sungNm
                 , "cityNm"          :row.cityNm
                 , "distNm"          :row.distNm
                 , "addrNm"          :""
                 , "addrDetlCont"    :""
                 , "useYn"           :"Y"
                 , "sungCd"          :row.sungCd
                 , "cityCd"          :row.cityCd
                 , "distCd"          :row.distCd
                 , "refTableNm"      :"CR_0101T"                  //참조테이블
                 , "refKeyNm"        :custNo                     // 참조 키
             });
         });
     }

     // 주소 삭제 - addressGrid
     $("#btnDelAddress").kendoButton({
        click:function(e) {
            var grid = $("#addrGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
     });


     $("#btnSaveRelCustGrid").kendoButton({
         click:function(e){
             var grid = $("#gridRel").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

             if (grid.cudDataLength == 0){
                 dms.notification.info("<spring:message code='global.info.required.change' />");
                 return;
             }

             console.log(saveData);

             if (grid.gridValidation()){
                 $.ajax({
                     url:"<c:url value='/crm/cif/customerInfo/multiCustomerRelChg.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error){
                         //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                         consoloe.log("failed!!");
                     },
                     success:function(jqXHR, textStatus){

                         //grid.dataSource._destroyed = [];
                         dms.notification.info("<spring:message code='global.info.success' />");
                         grid.dataSource.page(1);
                     }
                 });
             }else{
                 globalNotification.show("<spring:message code='global.info.check.input' />", "error");
             }
         }
          , enable:false
     });

     // 정보변경ㅇㅣ력 조회
     $("#btnSearchInfoUpdHist").kendoButton({
         click:function(e) {

             $("#infoUpdHistGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });
     // 메모탭 조회
     $("#btnSearchMemo").kendoButton({
         click:function(e) {
             $("#memoGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     // 메모 저장
     $("#btnSaveMemo").kendoButton({
         click:function(e){
             var grid = $("#memoGrid").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

             if (grid.cudDataLength == 0){
                 dms.notification.info("<spring:message code='global.info.required.change' />");
                 return;
             }

             console.log(saveData);

             if (grid.gridValidation()){
                 $.ajax({
                     url:"<c:url value='/crm/cif/customerInfo/multiCustomerMemoChg.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error){
                         //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                         consoloe.log("failed!!");
                     },
                     success:function(jqXHR, textStatus){

                         //grid.dataSource._destroyed = [];
                         dms.notification.info("<spring:message code='global.info.success' />");
                         grid.dataSource.page(1);
                     }
                 });
             }else{
                 globalNotification.show("<spring:message code='global.info.check.input' />", "error");
             }
         }
     });

     //메모  추가
     $("#btnAddMemo").kendoButton({
         click:function(e) {
             // 고객번호
             if ( dms.string.isEmpty($("#custNo").val()) ) {
                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return false;
             };

             $("#memoGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "memoTp"            :"01"
                 , "memoCont"        :""
                 , "shareYn"         :"N"
                 , "custNo"          :$("#custNo").val()            // 고객번호
             });

         }

     });

     // 메모삭제 - memoGrid
     $("#btnDelMemo").kendoButton({
        click:function(e) {
            var grid = $("#memoGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
     });


     // 고객 상세정보 조회
     $("#btnSearchCustDtl").kendoButton({
        click:function(e) {
            $("#btnCustSearch").click();
        }
     });

     //연계인탭 조회
     $("#btnSearchRelCust").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#gridRel").data("kendoExtGrid").dataSource.page(1);
         }
     });

     //보유차량탭 조회
     $("#btnSearchHaveCar").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             $("#haveCarGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     //리드탭 조회
     $("#btnSearchActive").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#activeGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     //리드탭 조회
     $("#btnSearchLead").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#gridLead").data("kendoExtGrid").dataSource.page(1);
         }
     });

     //판매기회탭 조회
     $("#btnSearchSalesOppt").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     //파일탭 조회
     $("#btnSearchFile").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     //파일탭 저장
     $("#btnSaveFile").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#btnCustSave").click();
         }
     });

     // 정비이력탭 조회
     $("#btnSearchLbr").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#lbrGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     // 딜러멤버십탭 조회
     $("#btnSearchDlrMbrShip").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var param = {};

             param["sCustNo"] = $("#custNo").val();

             console.log("---btnSearchDlrMbrShip---");
             console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectPointInfosCondition.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log(jqXHR);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     console.log("success!!!!");
                     //dms.notification.success("<spring:message code='global.info.success'/>");
                     console.log(result);
                     console.log(result.data[0].cardNo);
                     //console.log(result[0].cardNo);
                     $("#gradeCd").data("kendoExtDropDownList").value(result.data[0].gradeCd);
                     $("#usePoint").data("kendoExtNumericTextBox").value(result.data[0].usePoint);
                     $("#chargeUsePoint").data("kendoExtNumericTextBox").value(result.data[0].chargeUsePoint);
                     $("#joinDt").data("kendoExtMaskedDatePicker").value(result.data[0].regDt);
                 }
             }).done(function(result) {
                 console.log("btnSearchDlrMbrShip Done!!!!");
             });

             $("#dlrMbrShipGrid").data("kendoExtGrid").dataSource.page(1);

         }
     });

     // 블루멤버십탭 조회
     $("#btnSearchBlueMbrShip").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var param = {};

             param["sCustNo"] = $("#custNo").val();

             console.log("---btnSearch BlueDlrMbrShip---");
             console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectBlueMemberInfosCondition.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log(jqXHR);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     console.log("success!!!!");
                     //dms.notification.success("<spring:message code='global.info.success'/>"); kjlee
                     console.log(result);
                     //console.log(result.data[0].levelName);
                     $("#blueGradeCd").val(result.data[0].levelName);
                     $("#blueUsePoint").data("kendoExtNumericTextBox").value(result.data[0].blueBean);
                     $("#blueJoinDt").data("kendoExtMaskedDatePicker").value(result.data[0].beMembershipTime);
                 }
             }).done(function(result) {
                 console.log("btnSearchDlrMbrShip Done!!!!");
             });

             $("#blueMbrShipGrid").data("kendoExtGrid").dataSource.page(1);

         }
     });

     // 계약탭 조회
     $("#btnSearchContract").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
             $("#contractGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     $("#btnCustSearch").kendoButton({
         click:function(e) {

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var custNo = $("#custNo").val();

             $("#btnCustReset").click();

             // form 데이터
             var param = {};
             param["sCustNo"] = custNo; // $("#custNo").val();
             param["sSearchRange"] = "MY";
             //param["sBhmcYnSearch"] = "N";

             console.log(param);
             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR);
                     //console.log(jqXHR.responseJSON);
                     //alert(jqXHR.responseJSON.errors[0].errorMessage);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {

                 console.log(result);

                 if (result.custInfoDS.length != 0 ){

                     // Mode 변경
                     $("#pageMode").val("updateMode");

                     $("#custNm").val(result.custInfoDS[0].custNm);
                     $("#custNmSearch").val(result.custInfoDS[0].custNm);
                     $("#custNmSearchC").val(result.custInfoDS[0].custNm);
                     $("#custNo").val(result.custInfoDS[0].custNo);
                     $("#custTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                     $("#custCd").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                     $("#hpNo").val(result.custInfoDS[0].hpNo);
                     $("#emailNm").val(result.custInfoDS[0].emailNm);
                     $("#mngScId").val(result.custInfoDS[0].mngScId);
                     $("#mngScNm").val(result.custInfoDS[0].mngScNm);
                     $("#mngTecId").val(result.custInfoDS[0].mngTecId);
                     $("#mngTecNm").val(result.custInfoDS[0].mngTecNm);
                     $("#wechatId").val(result.custInfoDS[0].wechatId);
                     $("#qqId").val(result.custInfoDS[0].qqId);
                     $("#telNo").val(result.custInfoDS[0].telNo);
                     $("#sungCd").val(result.custInfoDS[0].sungCd);
                     $("#cityCd").val(result.custInfoDS[0].cityCd);
                     $("#regionCd").val(result.custInfoDS[0].regionCd);
                     $("#regionCdRead").val(result.custInfoDS[0].regionCdRead);
                     $("#zipCd").val(result.custInfoDS[0].zipCd);
                     $("#addr1").val(result.custInfoDS[0].addr1);
                     $("#addr2").val(result.custInfoDS[0].addr2);
                     $("#officeSungCd").val(result.custInfoDS[0].officeSungCd);
                     $("#officeCityCd").val(result.custInfoDS[0].officeCityCd);
                     $("#officeRegionCd").val(result.custInfoDS[0].officeRegionCd);
                     $("#officeRegionCdRead").val(result.custInfoDS[0].officeRegionCdRead);
                     $("#officeZipCd").val(result.custInfoDS[0].officeZipCd);
                     $("#officeAddr1").val(result.custInfoDS[0].officeAddr1);
                     $("#officeAddr2").val(result.custInfoDS[0].officeAddr2);
                     $("#idSungCd").val(result.custInfoDS[0].idSungCd);
                     $("#idCityCd").val(result.custInfoDS[0].idCityCd);
                     $("#idRegionCd").val(result.custInfoDS[0].idRegionCd);
                     $("#idRegionCdRead").val(result.custInfoDS[0].idRegionCdRead);
                     $("#idZipCd").val(result.custInfoDS[0].idZipCd);
                     $("#idAddr1").val(result.custInfoDS[0].idAddr1);
                     $("#idAddr2").val(result.custInfoDS[0].idAddr2);
                     $("#prefCommMthCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefCommMthCd);
                     $("#custHoldTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                     $("#custHoldTpDtl").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                     $("#mathDocTp").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                     $("#ssnCrnNo").val(result.custInfoDS[0].ssnCrnNo);
                     $("#officeNm").val(result.custInfoDS[0].officeNm);
                     $("#jobCd").data("kendoExtDropDownList").value(result.custInfoDS[0].jobCd);
                     $("#bizcondCd").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                     $("#cmpScaleCont").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpScaleCont);
                     $("#cmpTp").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                     $("#deptNm").val(result.custInfoDS[0].deptNm);
                     $("#psitNm").val(result.custInfoDS[0].psitNm);
                     $("#officeTelNo").val(result.custInfoDS[0].officeTelNo);
                     $("#officeFaxNo").val(result.custInfoDS[0].officeFaxNo);
                     $("#marryDt").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].marryDt);      // 결혼기념일
                     $("#birthDt").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].birthDt);      // 생일
                     $("#acCareerCd").data("kendoExtDropDownList").value(result.custInfoDS[0].acCareerCd);
                     $("#incomeLvlCd").data("kendoExtDropDownList").value(result.custInfoDS[0].incomeLvlCd);
                     $("#sexCd").data("kendoExtDropDownList").value(result.custInfoDS[0].sexCd);
                     $("#prefContactMthCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactMthCd);
                     $("#prefContactTimeCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactTimeCd);
                     $("#prefCommNo").val(result.custInfoDS[0].prefCommNo);
                     $("#marryCd").data("kendoExtDropDownList").value(result.custInfoDS[0].marryCd);
                     $("#siebelRowId").val(result.custInfoDS[0].siebelRowId);

                     $("#chgBuyYn").data("kendoExtDropDownList").value(result.custInfoDS[0].chgBuyYn);
                     $("#purcCarBrandCd").data("kendoExtDropDownList").value(result.custInfoDS[0].purcCarBrandCd);
                     $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].chinaZodiacSignCd);
                     $("#zodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].zodiacSignCd);
                     $("#bloodTp").data("kendoExtDropDownList").value(result.custInfoDS[0].bloodTp);
                     $("#dutyCd").data("kendoExtDropDownList").value(result.custInfoDS[0].dutyCd);

                     $("#buyCnt").val(result.custInfoDS[0].buyCnt);
                     $("#purcCarModelNm").val(result.custInfoDS[0].purcCarModelNm);
                     $("#childrenCnt").data("kendoExtNumericTextBox").value(result.custInfoDS[0].childrenCnt);
                     $("#ageDtl").data("kendoExtNumericTextBox").value(result.custInfoDS[0].ageDtl);

                     $("#docId").val(result.custInfoDS[0].docId);
                     $("#dlrCd").val(result.custInfoDS[0].dlrCd);

                     $("#oldCustNm").val(result.custInfoDS[0].custNm);
                     $("#oldHpNo").val(result.custInfoDS[0].hpNo);
                     $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                     $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);

                     // 보유차량
                     $("#carlineNmHC").val(result.carlineNmHC);
                     $("#modelNmHC").val(result.modelNmHC);
                     $("#carRegNoHC").val(result.carRegNoHC);
                     $("#custSaleDtHC").data("kendoExtMaskedDatePicker").value(result.custSaleDtHC);

                     // 정비이력
                     $("#roDtLH").data("kendoExtMaskedDatePicker").value(result.roDtLH);
                     $("#carRegNoLH").val(result.carRegNoLH);
                     $("#driverNmLH").val(result.driverNmLH);
                     $("#runDistValLH").val(result.runDistValLH);

                     // 딜러멤버십
                     $("#gradeCdDMS").data("kendoExtDropDownList").value(result.gradeCdDMS);
                     $("#usePointDMS").val(result.usePointDMS);
                     $("#chargeUsePointDMS").val(result.chargeUsePointDMS);
                     $("#joinDtDMS").data("kendoExtMaskedDatePicker").value(result.joinDtDMS);

                     // CheckBox
                     var bhmcYn = result.custInfoDS[0].bhmcYn;
                     var smsReceiveYn = result.custInfoDS[0].smsReceiveYn;
                     var telReceiveYn = result.custInfoDS[0].telReceiveYn;
                     var dmReceiveYn = result.custInfoDS[0].dmReceiveYn;
                     var emailReceiveYn = result.custInfoDS[0].emailReceiveYn;
                     var faxReceiveYn = result.custInfoDS[0].faxReceiveYn;
                     var perInfoAgreeYn = result.custInfoDS[0].perInfoAgreeYn;
                     var perInfoUseYn = result.custInfoDS[0].perInfoUseYn;
                     var hpNoInvldYn = result.custInfoDS[0].hpNoInvldYn;
                     var hpNoAddImposYn = result.custInfoDS[0].hpNoAddImposYn;

                     if (bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true) };
                     if (smsReceiveYn == 'Y'){ $("#smsReceiveYn").prop("checked", true) };
                     if (telReceiveYn == 'Y'){ $("#telReceiveYn").prop("checked", true) };
                     if (dmReceiveYn == 'Y'){ $("#dmReceiveYn").prop("checked", true) };
                     if (emailReceiveYn == 'Y'){ $("#emailReceiveYn").prop("checked", true) };
                     if (faxReceiveYn == 'Y'){ $("#faxReceiveYn").prop("checked", true) };
                     if (perInfoAgreeYn == 'Y'){ $("#perInfoAgreeYn").prop("checked", true) };
                     if (perInfoUseYn == 'Y'){ $("#perInfoUseYn").prop("checked", true) };
                     if (hpNoInvldYn == 'Y'){ $("#hpNoInvldYn").prop("checked", true) };
                     if (hpNoAddImposYn == 'Y'){ $("#hpNoAddImposYn").prop("checked", true) };

                     // 법인 Div Set
                     var custTpVal = result.custInfoDS[0].custTp;
                     var tabToActivate;
                     var tabStrip;

                     if (custTpVal == '02') {

                         console.log("Corporate Div!!!");
                         if (bhmcYn == 'Y'){ $("#bhmcYnC").prop("checked", true) };

                         $("#custTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                         $("#custNmC").val(result.custInfoDS[0].custNm);
                         $("#custNoC").val(result.custInfoDS[0].custNo);
                         $("#custCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                         $("#mathDocTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                         $("#ssnCrnNoC").val(result.custInfoDS[0].ssnCrnNo);
                         $("#mngScIdC").val(result.custInfoDS[0].mngScId);
                         $("#mngScNmC").val(result.custInfoDS[0].mngScNm);
                         $("#mngTecIdC").val(result.custInfoDS[0].mngTecId);
                         $("#mngTecNmC").val(result.custInfoDS[0].mngTecNm);
                         $("#custHoldTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                         $("#custHoldTpDtlC").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                         $("#officeTelNoC").val(result.custInfoDS[0].officeTelNo);

                         $("#officeFaxNoC").val(result.custInfoDS[0].officeFaxNo);
                         $("#emailNmC").val(result.custInfoDS[0].emailNm);
                         $("#bizcondCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                         $("#cmpScaleContC").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpScaleCont);
                         $("#cmpTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                         $("#ownRgstNm").val(result.custInfoDS[0].ownRgstNm);
                         $("#siebelRowIdC").val(result.custInfoDS[0].siebelRowId);

                         $("#oldHpNo").val(result.custInfoDS[0].officeTelNo);
                         $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                         $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);

                         $("#personalDiv").hide();
                         $("#corporateDiv").show();

                         //$("#custDtlTab").hide();
                         //$("#tabstrip-1").hide();
                         //tabToActivate = $("#relCustInfoTab");
                         //tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab(tabToActivate);
                         //tabStrip.remove("li:first");
                         //tabToDisabled = $("#relCustInfoTab");
                         console.log("tab Chk  corporateDiv!!!");
                         var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                         console.log(tabStrip);
                         tabStrip.enable(tabStrip.tabGroup.children().eq(0), false);
                         //tabStrip.disable(tabSelect, tabSelect.hasClass("k-state-disabled"));
                         //tabStrip.select(tabStrip.tabGroup.children("li").eq(1));
                         //tabSrip.reload("li:first");


                     } else {
                         $("#personalDiv").show();
                         $("#corporateDiv").hide();

                         console.log("tab Chk  personalDiv!!!");
                         var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                         console.log(tabStrip);
                         tabStrip.enable(tabStrip.tabGroup.children().eq(0), true);

                         //$("#custDtlTab").show();
                         //$("#tabstrip-1").show();
                         //tabStrip.select(tabStrip.tabGroup.children("li").eq(7));
                         //tabToActivate = $("#custDtlTab");
                         //tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab(tabToActivate);
                     }

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
                         if (result.groupDS.length == 1) {
                             $("#custGroups").data("kendoMultiSelect").value(groupSeq);
                         } else {
                             $("#custGroups").data("kendoMultiSelect").value(groupSeq.split(","));
                         }
                         defaultGroupDatasourceSetting();
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
                         if (result.tagDS.length == 1) {
                             $("#custTags").data("kendoMultiSelect").value(tagSeq);
                         } else {
                             $("#custTags").data("kendoMultiSelect").value(tagSeq.split(","));
                         }

                         defaultTagDatasourceSetting();
                     } else {
                         if (result.tagDS.length == 1) {
                             $("#custTagsC").data("kendoMultiSelect").value(tagSeq);
                         } else {
                             $("#custTagsC").data("kendoMultiSelect").value(tagSeq.split(","));
                         }

                         defaultTagCDatasourceSetting();
                     }
                 }

                 if (result.hobbyDS.length != 0 ){
                     hobbySeq = "";
                     var hobbyDsItem;
                     for(i=0 ;  i < result.hobbyDS.length ; i++){
                         hobbyDsItem = result.hobbyDS[i];
                         if (i==0){
                             hobbySeq = hobbyDsItem.grpSeq;
                         }else{
                             hobbySeq = hobbySeq+","+hobbyDsItem.grpSeq;
                         }
                     }

                     if (result.hobbyDS.length == 1) {
                         $("#custHobbys").data("kendoMultiSelect").value(hobbySeq);
                     } else {
                         $("#custHobbys").data("kendoMultiSelect").value(hobbySeq.split(","));
                     }

                     defaultHobbyDatasourceSetting();
                 }

                 // 주소 조회
                 var addrGrid = $("#addrGrid").data("kendoExtGrid");
                 addrGrid.dataSource.read();

                 // 연계인 조회
                 //var grid = $("#gridRel").data("kendoExtGrid");
                 //grid.setDataSource(new kendo.data.DataSource());
                 //grid.dataSource.read();

                 // 활성 비활성
                 var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
                 var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
                 var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
                 btnAddRelCust.enable(true);
                 btnSaveRelCustGrid.enable(true);
                 btnDelRelCust.enable(true);

                 if ( dms.string.isNotEmpty(result.custInfoDS[0].mathDocTp) && dms.string.isNotEmpty(result.custInfoDS[0].ssnCrnNo) ) {
                     $("#mathDocTp").data("kendoExtDropDownList").enable(false);
                     //$("#ssnCrnNo").data("kendoMaskedTextBox").enable(false);
                     $("#ssnCrnNo").attr("readOnly", true);
                     $("#ssnCrnNo").addClass("form_readonly");
                     $("#mathDocTpC").data("kendoExtDropDownList").enable(false);
                     //$("#ssnCrnNoC").data("kendoMaskedTextBox").enable(false);
                     $("#ssnCrnNoC").attr("readOnly", true);
                     $("#ssnCrnNoC").addClass("form_readonly");
                 }

/*                  if (result.custInfoDS[0].custCd == "02") {
                     $("#mathDocTp").data("kendoExtDropDownList").enable(false);
                     $("#ssnCrnNo").attr("readonly", true);
                     $("#ssnCrnNo").addClass("form_readonly");
                     $("#mathDocTpC").data("kendoExtDropDownList").enable(false);
                     $("#ssnCrnNoC").attr("readonly", true);
                     $("#ssnCrnNoC").addClass("form_readonly");
                 } else {
                     $("#mathDocTp").data("kendoExtDropDownList").enable(true);
                     $("#ssnCrnNo").attr("readonly", false);
                     $("#ssnCrnNo").removeClass("form_readonly");
                     $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
                     $("#ssnCrnNoC").attr("readonly", false);
                     $("#ssnCrnNoC").removeClass("form_readonly");
                 } */

             });
         }

     });

     // 메시지버튼
     $("#btnMessage").kendoButton({
         click:function(e){

             var   smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                 , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                 , smsTmplUserList = []              // sms 전송 대상자 목록
                 , refKeyNm = $("#custNo").val()
                 , refTableNm = "CR_0101T"
                 , contactBizCd = "01"
             ;

             if ( dms.string.isEmpty($("#custNo").val()) ) {
                // {고객}을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.customer' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                return;
             }

             smsTmplUserList.push({
                 "custNo" :$("#custNo").val()
               , "custNm" :$("#custNm").val()
               , "hpNo"   :$("#hpNo").val()
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
     });

     // 영업활동등록
     $("#btnSalesActiveAdd").kendoButton({
         click:function(e){

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return false;
             }

             popupWindow = dms.window.popup({
                 windowId:"salesActivePopup"
                 , title:"<spring:message code='crm.menu.salesActiveScheduler' />"   // 영업활동 스케줄
                 , content:{
                     url:"<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarPopup.do'/>"
                     , data:{

                         "autoBind":false
                         //,"schedulerSeq":""
                         //,"start":""
                         //,"salesActiveYn":"Y"

                         // 신규등록일때 전송할 정보
                         ,"custNo":$("#custNo").val()
                         ,"custNm":$("#custNm").val()
                         ,"hpNo":$("#hpNo").val()
                         ,"scId":$("#mngScId").val()
                         ,"scNm":$("#mngScNm").val()
                         // 신규등록일때 전송할 정보

                         ,"callbackFunc":function(data){

                             console.log("callbackFunc")
                             console.log(data)

                             if ( data == "SUCCESS" ) {
                                 // 예약 / 이 완료 되었습니다.
                                 dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                 popupWindow.close();
                             }

                         }
                     }
                 }
             });
         }
     });

     // 유일정보수정 버튼
     $("#btnInfoModify").kendoButton({
         click:function(e){

             var custNo = $("#custNo").val();

             if ( dms.string.isEmpty(custNo)){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return false;
             }

             custInfoUpdate = dms.window.popup({
                 windowId:"custInfoUpdate"
                 , title:"<spring:message code='global.btn.custInfoModify' />"   // 메시지전송
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoUpdatePopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "custNm"         :$("#custNm").val()
                         , "custNo"         :$("#custNo").val()
                         , "hpNo"           :$("#hpNo").val()
                         , "custCd"         :$("#custCd").data("kendoExtDropDownList").value()
                         , "mathDocTp"      :$("#mathDocTp").data("kendoExtDropDownList").value()
                         , "ssnCrnNo"       :$("#ssnCrnNo").val()
                         , "custNmC"        :$("#custNmC").val()
                         , "custCdC"        :$("#custCdC").data("kendoExtDropDownList").value()
                         , "officeTelNo"    :$("#officeTelNo").val()
                         , "officeTelNoC"   :$("#officeTelNoC").val()
                         , "mathDocTpC"     :$("#mathDocTpC").data("kendoExtDropDownList").value()
                         , "ssnCrnNoC"      :$("#ssnCrnNoC").val()
                         , "custTp"         :$("#custTp").data("kendoExtDropDownList").value()
                         , "prefCommMthCd"  :$("#prefCommMthCd").data("kendoExtDropDownList").value()
                         , "prefCommNo"     :$("#prefCommNo").val()
                         , "callbackFunc":function(data){
                             if(data == "SUCCESS"){

                                 $("#btnCustSearch").click();
                             }
                         }
                     }
                 }
             });
         }
     });

     // 초기화
     $("#btnCustReset").kendoButton({
        click:function(e){
            var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
            var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
            var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
            btnAddRelCust.enable(false);
            btnSaveRelCustGrid.enable(false);
            btnDelRelCust.enable(false);

            $("#pageMode").val("updateMode");

            // Reset
            $("#custNm").val("");
            $("#custNmSearch").val("");
            $("#custNmSearchC").val("");
            $("#oldCustNm").val("");
            $("#custNo").val("");
            $("#custTp").data("kendoExtDropDownList").value("");
            $("#custCd").data("kendoExtDropDownList").value("");
            $("#hpNo").val("");
            $("#oldHpNo").val("");
            $("#emailNm").val("");
            $("#mngScId").val("");
            $("#mngTecId").val("");
            $("#wechatId").val("");
            $("#qqId").val("");
            $("#telNo").val("");
            $("#sungCd").val("");
            $("#cityCd").val("");
            $("#regionCd").val("");
            $("#regionCdRead").val("");
            $("#zipCd").val("");
            $("#addr1").val("");
            $("#addr2").val("");
            $("#officeSungCd").val("");
            $("#officeCityCd").val("");
            $("#officeRegionCd").val("");
            $("#officeRegionCdRead").val("");
            $("#officeZipCd").val("");
            $("#officeAddr1").val("");
            $("#officeAddr2").val("");
            $("#idSungCd").val("");
            $("#idCityCd").val("");
            $("#idRegionCd").val("");
            $("#idRegionCdRead").val("");
            $("#idZipCd").val("");
            $("#idAddr1").val("");
            $("#idAddr2").val("");
            $("#prefCommMthCd").data("kendoExtDropDownList").value("");
            $("#custHoldTp").data("kendoExtDropDownList").value("");
            $("#custHoldTpDtl").data("kendoExtDropDownList").value("");
            $("#mathDocTp").data("kendoExtDropDownList").value("");
            $("#ssnCrnNo").val("");
            $("#officeNm").val("");
            $("#jobCd").data("kendoExtDropDownList").value("");
            $("#bizcondCd").data("kendoExtDropDownList").value("");
            $("#cmpScaleCont").data("kendoExtDropDownList").value("");
            $("#cmpTp").data("kendoExtDropDownList").value("");
            $("#deptNm").val("");
            $("#psitNm").val("");
            $("#officeTelNo").val("");
            $("#officeFaxNo").val("");
            $("#marryDt").data("kendoExtMaskedDatePicker").value("");
            $("#birthDt").data("kendoExtMaskedDatePicker").value("");
            $("#acCareerCd").data("kendoExtDropDownList").value("");
            $("#incomeLvlCd").data("kendoExtDropDownList").value("");
            $("#sexCd").data("kendoExtDropDownList").value("");
            $("#prefContactMthCd").data("kendoExtDropDownList").value("");
            $("#prefContactTimeCd").data("kendoExtDropDownList").value("");
            $("#prefCommNo").val("");
            $("#marryCd").data("kendoExtDropDownList").value("");
            $("#siebelRowId").val("");
            $("#chgBuyYn").data("kendoExtDropDownList").value("");
            $("#purcCarBrandCd").data("kendoExtDropDownList").value("");
            $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
            $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            $("#bloodTp").data("kendoExtDropDownList").value("");
            $("#dutyCd").data("kendoExtDropDownList").value("");
            $("#buyCnt").val("");
            $("#purcCarModelNm").val("");
            $("#childrenCnt").data("kendoExtNumericTextBox").value("");
            $("#ageDtl").data("kendoExtNumericTextBox").value("");

            $("#docId").val("");
            $("#dlrCd").val("");

            $("#oldCustNm").val("");
            $("#oldHpNo").val("");
            $("#oldMathDocTp").val("");
            $("#oldSsnCrnNo").val("");

            $("#custGroups").data("kendoMultiSelect").value("");
            $("#custTags").data("kendoMultiSelect").value("");
            $("#custHobbys").data("kendoMultiSelect").value("");

            // 보유차량
            $("#carlineNmHC").val("");
            $("#modelNmHC").val("");
            $("#carRegNoHC").val("");
            $("#custSaleDtHC").data("kendoExtMaskedDatePicker").value("");

            // 정비이력
            $("#roDtLH").data("kendoExtMaskedDatePicker").value("");
            $("#carRegNoLH").val("");
            $("#driverNmLH").val("");
            $("#runDistValLH").val("");

            // 딜러멤버십
            $("#gradeCdDMS").data("kendoExtDropDownList").value("");
            $("#usePointDMS").val("");
            $("#chargeUsePointDMS").val("");
            $("#joinDtDMS").data("kendoExtMaskedDatePicker").value("");

            $("#bhmcYn").prop("checked", false);
            $("#smsReceiveYn").prop("checked", false);
            $("#telReceiveYn").prop("checked", false);
            $("#dmReceiveYn").prop("checked", false);
            $("#emailReceiveYn").prop("checked", false);
            $("#faxReceiveYn").prop("checked", false);
            $("#perInfoAgreeYn").prop("checked", false);
            $("#perInfoUseYn").prop("checked", false);
            $("#hpNoInvldYn").prop("checked", false);
            $("#hpNoAddImposYn").prop("checked", false);

            $("#custTp").data("kendoExtDropDownList").value("01");
            $("#custCd").data("kendoExtDropDownList").value("01");

            $("#mathDocTp").data("kendoExtDropDownList").enable(true);
            //$("#ssnCrnNo").data("kendoMaskedTextBox").enable(true);
            $("#ssnCrnNo").attr("readOnly", false);
            $("#ssnCrnNo").removeClass("form_readonly");
            $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
            //$("#ssnCrnNoC").data("kendoMaskedTextBox").enable(true);
            $("#ssnCrnNoC").attr("readOnly", false);
            $("#ssnCrnNoC").removeClass("form_readonly");

            $("#gridRel").data("kendoExtGrid").dataSource.data([]);  // 연계인
            $("#haveCarGrid").data("kendoExtGrid").dataSource.data([]);  // 보유차량
            $("#activeGrid").data("kendoExtGrid").dataSource.data([]);   // 활동
            $("#gridLead").data("kendoExtGrid").dataSource.data([]);  //리드
            $("#salesOpptGrid").data("kendoExtGrid").dataSource.data([]);  //판매기회
            $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);  // 정비이력
            $("#dlrMbrShipGrid").data("kendoExtGrid").dataSource.data([]);  // 딜러멤버십
            $("#blueMbrShipGrid").data("kendoExtGrid").dataSource.data([]);  // 블루멤버십
            $("#incGrid").data("kendoExtGrid").dataSource.data([]);  // 보험
            $("#fincGrid").data("kendoExtGrid").dataSource.data([]);  // 금융
            $("#infoUpdHistGrid").data("kendoExtGrid").dataSource.data([]);  // 정보변경이력
            $("#memoGrid").data("kendoExtGrid").dataSource.data([]);  // 메모
            $("#sendInfoHistGrid").data("kendoExtGrid").dataSource.data([]);  // 공장으로 보고하는 고객
            $("#contractGrid").data("kendoExtGrid").dataSource.data([]);  // 계약서
            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일

         // 법인 DIV Reset
            $("#custTpC").data("kendoExtDropDownList").value("");
            $("#custNmC").val("");
            $("#custNoC").val("");
            $("#custCdC").data("kendoExtDropDownList").value("");
            $("#mathDocTpC").data("kendoExtDropDownList").value("");
            $("#ssnCrnNoC").val("");
            $("#bhmcYnC").prop("checked", false);
            $("#mngScIdC").val("");
            $("#mngTecIdC").val("");
            $("#custHoldTpC").data("kendoExtDropDownList").value("");
            $("#custHoldTpDtlC").data("kendoExtDropDownList").value("");
            $("#officeTelNoC").val("");
            $("#officeFaxNoC").val("");
            $("#emailNmC").val("");
            $("#bizcondCdC").data("kendoExtDropDownList").value("");
            $("#cmpScaleContC").data("kendoExtDropDownList").value("");
            $("#cmpTpC").data("kendoExtDropDownList").value("");
            $("#siebelRowIdC").val();
            $("#ownRgstNm").val("");

        }
     });

     // 저장/수정
     $("#btnCustSave").kendoButton({
         click:function(e) {

             var custTpVal = $("#custTp").data("kendoExtDropDownList").value();

             // 화면 필수 체크
             // 고객번호
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             if (custTpVal == "01") {

                 /*
                 if ( dms.string.isEmpty($("#custNm").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNm").focus();
                     return false;
                 }
                 */

                 if ( dms.string.isEmpty($("#hpNo").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#hpNo").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#prefCommMthCd").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.prefCommMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#prefCommMthCd").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#prefCommNo").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.prefCommNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#prefCommNo").focus();
                     return false;
                 }
             } else {
              // 법인 필수 항목 체크
              /*
                 if ( dms.string.isEmpty($("#custNmC").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.corporation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNmC").focus();
                     return false;
                 }
              */

                 if ( dms.string.isEmpty($("#officeTelNoC").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#officeTelNoC").focus();
                     return false;
                 }
             }


             // 주소 정보 필수 확인
             var grid = $("#addrGrid").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
             console.log(saveData);
             if (grid.cudDataLength != 0){
                 if ((saveData.insertList.length != 0) || (saveData.updateList.length != 0)) {
                     if($("input.flagYn:checked", "#addrGrid").length != 1 ){
                         dms.notification.warning("<spring:message code='global.lbl.selectAddr' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                         return false;
                     }
                 }
             }

             /** 보유고객 등록
             if ($("#custCd").val() == "02"){
                 if ($("#addr1").val() ==""){
                     dms.notification.warning("보유고객은 주소 정보가 필수 입니다.");
                     $("#addr1").focus();
                     return false;
                 }

                 if ($("#addr2").val() ==""){
                     dms.notification.warning("보유고객은 주소 정보가 필수 입니다.");
                     $("#addr2").focus();
                     return false;
                 }
             }
             */

             // form 데이터
             //var param = $("#customerForm").serializeObject();

             // form 데이터
             var param =
                 $("#customerForm").serializeObject(
                     $("#customerForm").serializeArrayInSelector("[data-json-obj='true']")
                 );

             if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" } else { param["bhmcYn"] = "N" };
             if ($("#smsReceiveYn").prop("checked")){ param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
             if ($("#telReceiveYn").prop("checked")){ param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
             if ($("#dmReceiveYn").prop("checked")){ param["dmReceiveYn"] = "Y" } else { param["dmReceiveYn"] = "N" };
             if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
             if ($("#faxReceiveYn").prop("checked")){ param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };
             if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
             if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };
             if ($("#hpNoInvldYn").prop("checked")){ param["hpNoInvldYn"] = "Y" } else { param["hpNoInvldYn"] = "N" };
             if ($("#hpNoAddImposYn").prop("checked")){ param["hpNoAddImposYn"] = "Y" } else { param["hpNoAddImposYn"] = "N" };

             param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
             param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
             param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
             param["custHoldTpDtl"] = $("#custHoldTpDtl").data("kendoExtDropDownList").value();
             param["ssnCrnNo"] = $("#ssnCrnNo").val();

             param["childrenCnt"] = $("#childrenCnt").data("kendoExtNumericTextBox").value();
             param["ageDtl"] = $("#ageDtl").data("kendoExtNumericTextBox").value();

           //법인인 경우 ID 재 정의
             if (custTpVal == "02") {
                 param["custTp"] = $("#custTpC").data("kendoExtDropDownList").value();
                 param["custNm"] = $("#custNmC").val();
                 param["custNo"] = $("#custNoC").val();
                 param["custCd"] = $("#custCdC").data("kendoExtDropDownList").value();
                 param["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                 param["ssnCrnNo"] = $("#ssnCrnNoC").val();
                 if ($("#bhmcYnC").prop("checked")){ param["bhmcYn"] = "Y" };
                 param["mngScId"] = $("#mngScIdC").val();
                 param["mngTecId"] = $("#mngTecIdC").val();
                 param["custHoldTp"] = $("#custHoldTpC").data("kendoExtDropDownList").value();
                 param["custHoldTpDtl"] = $("#custHoldTpDtlC").data("kendoExtDropDownList").value();
                 param["officeTelNo"] = $("#officeTelNoC").val();
                 param["officeFaxNo"] = $("#officeFaxNoC").val();
                 param["emailNm"] = $("#emailNmC").val();
                 param["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                 param["cmpScaleCont"] = $("#cmpScaleContC").data("kendoExtDropDownList").value();
                 param["cmpTp"] = $("#cmpTpC").data("kendoExtDropDownList").value();
                 param["siebelRowId"] = $("#siebelRowIdC").val();
             }

             var pageMode = $("#pageMode").val();
             var url = "<c:url value='/crm/cif/customerInfo/insertCustomer.do' />";
             if (pageMode == "insertMode"){
                 // 신규등록 URL
                 url = "<c:url value='/crm/cif/customerInfo/insertCustomer.do' />";
             } else {
                 // 업데이트 URL
                 url = "<c:url value='/crm/cif/customerInfo/updateCustomer.do' />";
             }

             param["marryDt"] = $("#marryDt").data("kendoExtMaskedDatePicker").value();
             param["groupDS"] = groupDS;
             param["tagDS"] = tagDS;
             param["hobbyDS"] = hobbyDS;

             console.log("---btnCustSave---")
             console.log(param);

             $.ajax({
                 url:url
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log(jqXHR);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     console.log("success!!!!");
                     console.log(result);
                     console.log(result["custNo"]);
                     if (result["custNo"] != ""){
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#custNo").val(result["custNo"]);

                         if (grid.cudDataLength != 0){
                             console.log("address save!!");
                             btnSaveAddress(result["custNo"]);
                         } else {
                             console.log("address UnSave!!");
                             $("#btnCustSearch").click();
                         }
                     }

                 }
             }).done(function(result) {
                 console.log("btnCustSave Done!!!!");
             });
         }
     });

     // 상세정보저장
     $("#btnSaveCustDtl").kendoButton({
         click:function(e) {

             var custTpVal = $("#custTp").data("kendoExtDropDownList").value();
             if (custTpVal == "01") {

                 // 고객번호
                 if ( dms.string.isEmpty($("#custNo").val())){
                     dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNo").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#custNm").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNm").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#hpNo").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#hpNo").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#prefCommMthCd").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.prefCommMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#prefCommMthCd").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#prefCommNo").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.prefCommNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#prefCommNo").focus();
                     return false;
                 }
             } else {
                 // 법인 필수 항목 체크
                 if ( dms.string.isEmpty($("#custNmC").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.corporation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNmC").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#officeTelNoC").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#officeTelNoC").focus();
                     return false;
                 }

             }

             // form 데이터
             var param =
                 $("#custDtlTabArea").serializeObject(
                     $("#custDtlTabArea").serializeArrayInSelector("[data-json-obj='true']")
                 );

             if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" } else { param["bhmcYn"] = "N" };
             if ($("#smsReceiveYn").prop("checked")){ param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
             if ($("#telReceiveYn").prop("checked")){ param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
             if ($("#dmReceiveYn").prop("checked")){ param["dmReceiveYn"] = "Y" } else { param["dmReceiveYn"] = "N" };
             if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
             if ($("#faxReceiveYn").prop("checked")){ param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };
             if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
             if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };
             if ($("#hpNoInvldYn").prop("checked")){ param["hpNoInvldYn"] = "Y" } else { param["hpNoInvldYn"] = "N" };
             if ($("#hpNoAddImposYn").prop("checked")){ param["hpNoAddImposYn"] = "Y" } else { param["hpNoAddImposYn"] = "N" };


             if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
                 param["chgBuyYn"] = "N";
             }

             param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
             //param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
             //param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
             //param["custHoldTpDtl"] = $("#custHoldTpDtl").data("kendoExtDropDownList").value();
             //param["ssnCrnNo"] = $("#ssnCrnNo").data("kendoMaskedTextBox").value();

             param["oldCustNm"] = $("#oldCustNm").val();
             param["oldHpNo"] = $("#oldHpNo").val();
             param["oldMathDocTp"] = $("#oldMathDocTp").val();
             param["oldSsnCrnNo"] = $("#oldSsnCrnNo").val();
             //param["custNm"] = $("#custNm").val();
             //param["hpNo"] = $("#hpNo").val();
             param["custNo"] = $("#custNo").val();
             param["marryDt"] = $("#marryDt").data("kendoExtMaskedDatePicker").value();
             param["groupDS"] = groupDS;
             param["tagDS"] = tagDS;
             param["hobbyDS"] = hobbyDS;
             param["commandTp"] = "CUSTDTLUPDATE";

             var url = "<c:url value='/crm/cif/customerInfo/updateCustomer.do' />";

             console.log("Saving of Customer Detail Info.!!!");
             console.log(url);
             console.log(param);

             $.ajax({
                 url:url
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log(jqXHR);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     //console.log(result);
                     if (result["custNo"] != ""){
                         console.log("success!!!!");
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#custNo").val(result["custNo"]);
                         $("#btnCustSearch").click();
                     }

                 }
             }).done(function(result) {
                 console.log("btnCustSave Done!!!!");
             });
         }
     });

     // 버튼 - 그룹선택 팝업
     $("#btnSelectGroupPopup").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"groupSearchPopup"
                 , title:"<spring:message code = 'global.title.custGrpSearch'/>"   // 고객그룹 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerGroup/selectGroupPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "grpTp" :"001"
                         , "callbackFunc":function(data){
                             if (data.length > 0) {
                                 //groupDS = data;

                                 groupDS = [];
                                 groupTxt = "";
                                 for(i=0 ;  i < data.length ; i++){
                                     if (i==0){
                                         groupTxt = data[i].grpNm;
                                     }else{
                                         groupTxt = groupTxt+", "+data[i].grpNm;
                                     }
                                     groupDS.push({"grpSeq":data[i].grpSeq,"grpTp":"001"});
                                 }

                                 $("#groupTxt").val(groupTxt);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 버튼 - 태그선택 팝업
     $("#btnSelectTagPopup").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"groupSearchPopup"
                 , title:"<spring:message code = 'global.lbl.tag'/>"   // 태그 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerGroup/selectTagPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "grpTp" :"002"
                         , "callbackFunc":function(data){
                             if (data.length > 0) {
                                 tagDS = [];
                                 tagTxt = "";
                                 for(i=0 ;  i < data.length ; i++){
                                     if (i==0){
                                         tagTxt = data[i].grpNm;
                                     }else{
                                         tagTxt = tagTxt+", "+data[i].grpNm;
                                     }
                                     tagDS.push({"grpSeq":data[i].grpSeq,"grpTp":"002"});
                                 }

                                 $("#tagTxt").val(tagTxt);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 탭 TabStrip
     $("#tabstrip").kendoExtTabStrip({
         animation:false
         , select:function(e) {
             var selectTabId = e.item.id;
             var callUrl;
             console.log(selectTabId);
         }
     });


/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/
     //연계인 그리드 설정
         $("#gridRel").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/customerRelSearch.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
                             params["sort"]                 = options.sort;

                             params["upperCustNo"] = $("#custNo").val();
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
                             id:"seq"
                                ,fields:{
                                 seq                   :{type:"number", editable:false}
                                 , pconCustNo          :{type:"string", editable:false}
                                 //, rnum              :{type:"number", editable:false}
                                 , upperCustNo         :{type:"string", editable:false}
                                 , custNo              :{type:"string", editable:false}
                                 , pconTp              :{type:"string", validation:{required:true} , editable:true}
                                 , custNm              :{type:"string", editable:false}
                                 , mathDocTp           :{type:"string", editable:false}       // 신분증유형
                                 , certiNum            :{type:"string", editable:false}       // 신분증 번호
                                 , telNo               :{type:"string", editable:false}       // 전화
                                 , hpNo                :{type:"string", editable:false}       // 휴대전화
                                 , emailNm             :{type:"string", editable:false}       // E-MAIL
                                 , prefCommMthCd       :{type:"string", editable:false}       // 선호연락방식
                                 , prefCommNo          :{type:"string", editable:false}       // 선호 연락처
                                 , prefContactMthCd    :{type:"string", editable:false}       // 우선 연락방식
                                 , prefContactTimeCd   :{type:"string", editable:false}       // 우선 연락시간
                                 , regDt               :{type:"date", editable:false}         // 등록일
                             }
                         }
                 }
             }
             ,columns:[
                         // {field:"rnum",              title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                         {field:"pconTp",            title:"<spring:message code='global.lbl.type' />",  width:100, attributes:{"class":"ac"}
                            , editor:function(container, options){
                                $('<input data-bind="value:' + options.field + '"  />')
                                .appendTo(container)
                                .kendoExtDropDownList({
                                    dataTextField:"cmmCdNm"
                                    , dataValueField:"cmmCd"
                                    //, optionLabel:" "
                                    , dataSource:pconTpList
                                });
                            }
                            , template:'#if (pconTp !== ""){# #= pconTpMap[pconTp]# #}#'
                         }
                         ,{field:"custNm",            title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"mathDocTp",         title:"<spring:message code='global.lbl.mathDocTp' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:mathDocTpList
                                 });
                             }
                             , template:'#if (mathDocTp !== ""){# #= mathDocTpMap[mathDocTp]# #}#'
                         }
                         ,{field:"certiNum",          title:"<spring:message code='global.lbl.ssnCrnNo' />",  width:120, attributes:{"class":"ac"}}
                         ,{field:"telNo",             title:"<spring:message code='global.lbl.homeTelNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"hpNo",              title:"<spring:message code='global.lbl.hpNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"emailNm",           title:"<spring:message code='global.lbl.emailNm' />",  width:300, attributes:{"class":"al"}}
                         ,{field:"prefCommMthCd",     title:"<spring:message code='global.lbl.prefCommMthCd' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:prefCommMthCdList
                                 });
                             }
                             , template:'#if (prefCommMthCd !== ""){# #= prefCommMthCdMap[prefCommMthCd]# #}#'
                         }
                         ,{field:"prefCommNo",        title:"<spring:message code='global.lbl.prefCommNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"prefContactMthCd",  title:"<spring:message code='global.lbl.prefContactMthCd' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:prefContactMthCdList
                                 });
                             }
                             , template:'#if (prefContactMthCd !== ""){# #= prefContactMthCdMap[prefContactMthCd]# #}#'
                         }
                         ,{field:"prefContactTimeCd", title:"<spring:message code='global.lbl.prefContactTime' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:prefContactTimeCdList
                                 });
                             }
                             , template:'#if (prefContactTimeCd !== ""){# #= prefContactTimeCdMap[prefContactTimeCd]# #}#'
                         }
                         ,{field:"regDt",             title:"<spring:message code='global.lbl.regDt' />",  width:100, attributes:{"class":"ac"}
                            , format:"{0:<dms:configValue code='dateFormat' />}"
                         }
                         ,{title:""}
                     ]
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,navigatable:false
             ,height:158
             ,editable:{
                 mode:"incell"
                 ,confirmation :false
             }
             ,pageable:false
         });

         // 보유차량
         $("#haveCarGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectHaveCar.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
                             params["sort"]                 = options.sort;

                             params["sCustNo"] = $("#custNo").val();
                             params["sDlrCd"] = $("#dlrCd").val();
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
                                 , dlrNm               :{type:"string"}
                             }
                         }
                 }
             }
             ,editable:false
             ,autoBind:false
             ,navigatable:false
             ,pageable:false
             ,height:158
             ,columns:[
                 {field:"carBrandCd",  title:"<spring:message code='global.lbl.brand' />",   width:130, attributes:{"class":"ac"}, template:"#= purcCarBrandCdMap[carBrandCd] #"}  //브랜드
                 ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />",     width:130, attributes:{"class":"ac"}} //차종
                 ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />",     width:130, attributes:{"class":"ac"}} //모델
                 ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}} //VIN
                 ,{field:"enginNo", title:"<spring:message code='global.lbl.enginNo' />", width:130, attributes:{"class":"ac"}} //엔진번호
                 ,{field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />",     width:130, attributes:{"class":"al"}} //번호판
                 ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",     width:130, attributes:{"class":"ac"}} //외장색
                 ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",     width:130, attributes:{"class":"ac"}} //내장색
                 ,{field:"dlrNm", title:"<spring:message code='global.lbl.purcDlrComp' />",     width:130, attributes:{"class":"ac"}} //구매 딜러사
                 ,{field:"custSaleDt", title:"<spring:message code='global.lbl.purcDt' />",     width:130, attributes:{"class":"ac"} // 구입일자자
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                 } //구매일자
                 ,{title:""}
             ]
         });

         /******************************************************
          * 활동 그리드 시작
          ******************************************************/
         $("#activeGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectSalesActives.do' />"
                     },
                     parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;

                             params["sCustNo"] = $("#custNo").val();

                             console.log('activeGrid params:',kendo.stringify(params) );
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     model:{
                         id:"salesActiveNo"
                         ,fields:{
                             rnum:{type:"number"}
                             ,salesActiveNo:{type:"string"}
                             ,scNm:{type:"string"}
                             ,salesActiveStatCd:{type:"string"}
                             ,planStartDt:{type:"date"}
                             ,planEndDt:{type:"date"}
                             ,activeStartDt:{type:"date"}
                             ,activeEndDt:{type:"date"}
                             ,salesActiveTpCd:{type:"string"}
                             ,activeCont:{type:"string"}
                             ,activeRsltCont:{type:"string"}
                             ,saleOpptNo:{type:"string"}
                             ,custNm:{type:"string"}
                             ,prefCommNo:{type:"string"}
                             ,regDt:{type:"date"}
                             ,updtDt:{type:"date"}
                         }
                     }
                 }
             }
             ,autoBind:false
             ,editable:false
             ,height:256
             ,navigatable:false
             ,pageable:false
             //,selectable:"row"
             ,columns:[

                         {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                             ,attributes:{"class":"ac"}
                         }
                         ,{field:"salesActiveStatCd", title:"<spring:message code='crm.lbl.salesActiveStatCd' />", width:100       /* 영업활동상태 */
                             , attributes:{"class":"ac"}
                             , template:'#= salesActiveStatCdArrVal(salesActiveStatCd)#'
                         }
                         ,{field:"planStartDt", title:"<spring:message code='crm.lbl.planStartDt' />", width:120                   /* 계획시작일자 */
                             , attributes:{"class":"ac"}
                             , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                         }
                         ,{field:"planEndDt", title:"<spring:message code='crm.lbl.planEndDt' />", width:120                       /* 계획종료일자 */
                             , attributes:{"class":"ac"}
                             , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                         }
                         ,{field:"salesActiveTpCd", title:"<spring:message code='crm.lbl.salesActiveTpCd' />", width:100           /* 영업활동유형 */
                             , attributes:{"class":"ac"}
                             , template:'#= salesActiveTpCdArrVal(salesActiveStatCd)#'
                         }
                         ,{field:"activeCont", title:"<spring:message code='crm.lbl.activeCont' />", width:100}                    /* 활동내용 */
                         ,{field:"activeRsltCont", title:"<spring:message code='global.lbl.activeRsltCont' />", width:200}         /* 활동결과 */
                         ,{field:"saleOpptNo", title:"<spring:message code='global.lbl.saleOpptSeq' />", width:100}                /* 판매기회번호 */
                         ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}                         /* 고객명 */
                         ,{field:"prefCommNo", title:"<spring:message code='global.lbl.prefCommNo' />", width:100}                 /* 선호연락처 */

             ]
         });
         /******************************************************
          * 활동 그리드 종료
          ******************************************************/

         // 리드 그리드
         $("#gridLead").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectLeads.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;
                             //params["sLeadTp"] = "IDCC";
                             params["sCallListCd"] = "IDCCLEAD";
                             params["sCustNo"] =  $("#custNo").val();

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
                             id:"leadNo"
                             ,fields:{
                                 leadTp:{type:"string", editable:false}
                                 ,hpNo:{type:"string", editable:false}
                                 ,telNo:{type:"string", editable:false}
                                 ,leadSrcCd:{type:"string", editable:false}
                                 ,bhmcYn:{type:"string", editable:false}
                                 ,prsnNm:{type:"string", editable:false}
                                 ,ddlnDt:{type:"date", editable:false}
                                 ,opptChgDt:{type:"date", editable:false}
                                 ,regUsrNm:{type:"string", editable:false}
                                 ,regDt:{type:"date", editable:false}
                                 ,statCd:{type:"string", editable:false}
                                 ,delayYn:{type:"string", editable:false}
                                 ,callStatCd:{type:"string", editable:false}
                                 ,allocDt:{type:"date", editable:false}
                                 ,nextCallDt:{type:"date", editable:false}
                             }
                         }
                 }
             }
             ,autoBind:false
             ,columns:[
                          {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                            ,attributes:{"class":"ac"}
                          }
                          ,{field:"leadTp", title:"<spring:message code='crm.lbl.leadTp' />", width:100, attributes:{"class":"ac"}
                              ,template:'#if (leadTp !== ""){# #= leadTpMap[leadTp]# #}#'
                          }/* 리드유형 */
                          ,{field:"leadSrcCd", title:"<spring:message code='global.lbl.leadSrc' />", width:100, attributes:{"class":"ac"}
                              ,template:'#if (leadSrcCd !== ""){# #= leadSrcMap[leadSrcCd]# #}#'
                          }
                          ,{field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:100, attributes:{"class":"ac"}}
                          ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100, attributes:{"class":"ac"}}
                          ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:100, attributes:{"class":"ac"}}
                          ,{field:"prsnNm", title:"<spring:message code='global.lbl.prsNm' />", width:100, attributes:{"class":"ac"}}
                          ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}
                          ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}
                              ,template:'#if (statCd !== ""){# #= statMap[statCd]# #}#'
                          }
                          ,{field:"ddlnDt", title:"<spring:message code='global.lbl.ddlnDt' />", width:100, attributes:{"class":"ac"}
                              ,format:"{0:<dms:configValue code='dateFormat' />}"
                          }
                          ,{field:"opptChgDt", title:"<spring:message code='crm.lbl.opptChgDt' />", width:100, attributes:{"class":"ac"}
                              ,format:"{0:<dms:configValue code='dateFormat' />}"
                          }
                          ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                              ,format:"{0:<dms:configValue code='dateFormat' />}"
                          }
                          ,{field:"allocDt", title:"<spring:message code='global.lbl.allocDt' />", width:100, attributes:{"class":"ac"}
                              ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                          }
                          ,{field:"delayYn", title:"<spring:message code='global.lbl.delayYn' />", width:100, attributes:{"class":"ac"}}
                          ,{title:""}

             ]
             ,editable:false
             ,navigatable:false
             ,pageable:false
             ,height:158
         });

         // 판매기회 관리 그리드 시작 //
         $("#salesOpptGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectSalesOpptMgmts.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;

                             params["sCustNo"] =  $("#custNo").val();

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
                             id:"saleOpptSeq"
                             ,fields:{
                                 rnum:{type:"number"}
                                 ,saleOpptSeq:{type:"number"}
                                 ,custNm:{type:"string"}
                                 ,carlineNm:{type:"string"}
                                 ,modelNm:{type:"string"}
                                 ,expcSaleDt:{type:"date"}
                                 ,succPrbCd:{type:"string"}
                                 ,saleOpptSrcCd:{type:"string"}
                                 ,saleOpptStepCd:{type:"string"}
                                 ,scNm:{type:"string"}
                                 ,regDt:{type:"date"}
                             }
                         }
                 }
             }

             ,editable:false
             ,height:158
             ,navigatable:false
             ,pageable:false
             ,autoBind:false
             ,selectable:"row"
             ,columns:[
                        //{field:"saleOpptSeq", title:"SEQ", width:30}
                        {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                            ,attributes:{"class":"ac"}
                        }
                        ,{field:"carlineNm", title:"<spring:message code='global.lbl.intrCarLine' />", width:150} /* 관심차종 */
                        ,{field:"modelNm", title:"<spring:message code='global.lbl.intrModel' />", width:150} /* 관심모델 */
                        ,{field:"expcSaleDt", title:"<spring:message code='global.lbl.expcSaleDt' />", width:100, attributes:{"class":"ac"}/* 예상판매일자 */
                            ,format:"{0:<dms:configValue code='dateFormat' />}"
                        }
                        ,{field:"succPrbCd", title:"<spring:message code='global.lbl.succPrbCd' />", width:100, attributes:{"class":"ac"}/* 성공확률 */
                            ,template:'#= succPrbCdArrVal(succPrbCd)#'
                        }
                        ,{field:"saleOpptSrcCd", title:"<spring:message code='global.lbl.saleOpptSrcCd' />", width:100    /* 판매기회출처 */
                            ,template:'#= saleOpptSrcCdArrVal(saleOpptSrcCd)#'
                        }
                        ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:100    /* 판매기회단계 */
                            ,template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                        }
                        ,{field:"scId", title:"<spring:message code='sal.lbl.salesAdvisor' />", width:100, sortable:false      //판매고문
                            ,template:'#= usersArrVal(scId)#'

                        }
                        ,{field:"trsfStatCd", title:"<spring:message code='global.lbl.trsfStatCd' />", width:100    /* 전출상태 */
                            ,attributes:{"class":"ac"}
                            ,template:'#= trsfStatCdArrVal(trsfStatCd)#'
                        }
                        ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}/* 등록일 */
                            ,format:"{0:<dms:configValue code='dateFormat' />}"
                        }
                        ,{title:""}
             ]
         });
         // 판매기회 관리 그리드 종료 //

         // 정비이력그리드
         $("#lbrGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectRepairOrders.do' />"
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

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             params["sCarOwnerId"] = $("#custNo").val();

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
                         }
                     }
                 }
             }
             ,height:158
             ,pageable:false
             ,navigatable:false
             ,autoBind:false
             ,editable:false
             ,columns:[
                 {field:"dlrCd", title:"<spring:message code='global.lbl.dealer' />", width:100, attributes:{"class":"ac"}}  // 딜러
                 ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100, attributes:{"class":"ac"}}                    // 차량번호
                 ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}                       // VIN
                 ,{field:"carOwnNm", title:"<spring:message code='global.lbl.carOwner' />", width:100, attributes:{"class":"ac"}}                 // 차량소유주
                 ,{field:"driverNm", title:"<spring:message code='global.lbl.vsitr' />", width:100, attributes:{"class":"ac"}}                    // 방문자
                 ,{field:"carNm", title:"<spring:message code='global.lbl.car' />", width:100, attributes:{"class":"ac"}}                         // 차량
                 ,{field:"runDistVal", title:"<spring:message code='global.lbl.runDist' />", width:70, attributes:{"class":"ar"}}                   // 주행거리
                 ,{field:"roDocNo", title:"<spring:message code='global.lbl.roDocNo' />", width:150, attributes:{"class":"ac"}}                       // RO번호
                 ,{field:"rnum", title:"<spring:message code='ser.lbl.roDt' />", width:100, attributes:{"class":"ar"}}     // RO확인시간
                 ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                     , attributes:{"class":"ac"}
                     , editor:function(container, options){
                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , dataSource:roTpCdList
                         });
                     }
                     , template:'#if (roTp !== ""){# #= roTpCdListMap[roTp]# #}#'
                 }                                // RO유형
                 ,{field:"ro", title:"<spring:message code='global.lbl.roUser' />", width:100, attributes:{"class":"ac"}}                            // RO발행자
                 ,{title:""}
             ]
         });

         // 딜러멤머십
         $("#dlrMbrShipGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerInfo/selectMembershipPointHiss.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            // 고객번호
                            if ( dms.string.isEmpty($("#custNo").val()) ) {
                                dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                return false;
                            };

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCustNo"]  = $("#custNo").val();
                            //params["sCustNo"]  = "CA07AA20160100010";
                            //params["sCardTpCd"] = "01";

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
                            ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                            ,membershipNo:{type:"string", validation:{required:true}, editable:false}
                            ,membershipTp:{type:"string", validation:{required:true}, editable:false}
                            ,cardNo:{type:"string", validation:{required:false}, editable:false}
                            ,pointCd:{type:"string", validation:{required:false}, editable:false}
                            ,pointTp:{type:"string", validation:{required:false}, editable:false}
                            ,occrPointVal:{type:"string", validation:{required:false}, editable:false}
                            ,occrPointVal2:{type:"string", validation:{required:false}, editable:false}
                            ,deptNm:{type:"string", validation:{required:false}, editable:false}
                            ,prsnId:{type:"string", validation:{required:false}, editable:false}
                            ,occrDt:{type:"string", validation:{required:false}, editable:false}
                        }
                    }
                }
            }
            , editable:false
            , autoBind:false
            , navigatable:true
            , pageable:false
            , height:158
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //딜러코드
                ,{field:"membershipNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 번호
                ,{field:"membershipTp", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 타입
                ,{field:"cardNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //카드번호
                ,{field:"pointCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //포인트 코드
                ,{field:"pointTp", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} ,hidden:true} //발생포인트
                ,{field:"occrPointVal", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"},hidden:true } //발생포인트
                ,{field:"cardTpCd", title:"<spring:message code='global.lbl.mbrShipTp'/>", width:100,attributes:{"class":"ac"}
                    , template:'#if (cardTpCd !== ""){# #= cardTpCdMap[cardTpCd]# #}#'
                } //멤버십종류
                ,{field:"occrPointVal2", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //발생포인트-부호포함
                ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm'/>", width:100,attributes:{"class":"ac"} } //담당부서
                ,{field:"prsnNm", title:"<spring:message code='global.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //담당자
                ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                } //발생일(현재 부서로 되어 있어서 추후 변경해야함)
                ,{title:""}
            ]
         });

         // 블루멤머십
         $("#blueMbrShipGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerInfo/selectBlueMembershipCalcDetails.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            // 고객번호
                            if ( dms.string.isEmpty($("#custNo").val()) ) {
                                dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                return false;
                            };

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCustNo"]  = $("#custNo").val();

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
                            ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                            ,pointHisSeq:{type:"int", validation:{required:true}, editable:false}
                            ,blueMembershipNo:{type:"string", validation:{required:true}, editable:false}
                            ,cardNo:{type:"string", validation:{required:false}, editable:false}
                            ,pointCd:{type:"string", validation:{required:false}, editable:false}
                            ,pointTp:{type:"string", validation:{required:false}, editable:false}
                            ,occrPointVal:{type:"string", validation:{required:false}, editable:false}
                            ,occrPointValadd:{type:"string", validation:{required:false}, editable:false}
                            ,prsnDeptNm:{type:"string", validation:{required:false}, editable:false}
                            ,prsnId:{type:"string", validation:{required:false}, editable:false}
                            ,prsnNm:{type:"string", validation:{required:false}, editable:false}
                            ,occrDt:{type:"string", validation:{required:false}, editable:false}
                        }
                    }
                }
            }
            , editable:false
            , autoBind:false
            , navigatable:true
            , pageable:false
            , height:158
             ,columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //딜러코드
                ,{field:"pointHisSeq", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 번호
                ,{field:"blueMembershipNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 타입
                ,{field:"cardNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //카드번호
                ,{field:"pointTp", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} ,hidden:true} //발생포인트
                ,{field:"occrPointVal", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"},hidden:true } //발생포인트
                ,{field:"pointCd", title:"<spring:message code='global.lbl.cont'/>", attributes:{"class":"ac"}
                    ,width:120
                    ,template:'#if(pointCd !== ""){# #= pointCdListMap[pointCd]# #}#'
                }// 내용
                ,{field:"occrPointValadd", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //발생포인트-부호포함
                ,{field:"prsnDeptNm", title:"<spring:message code='global.lbl.deptNm'/>", width:100,attributes:{"class":"ac"} } //담당부서
                ,{field:"prsnNm", title:"<spring:message code='global.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //담당자
                ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                } //발생일(현재 부서로 되어 있어서 추후 변경해야함)
                ,{title:""}
             ]
         });

         // 보험정보
         $("#incGrid").kendoExtGrid({
             editable:false
             ,autoBind:false
             ,navigatable:false
             ,pageable:false
             ,height:158
             ,columns:[
                 {field:"a",  title:"<spring:message code='global.lbl.line' />",   width:60, attributes:{"class":"al"}} //No
                 ,{field:"b", title:"<spring:message code='global.lbl.incCmp' />",     width:130, attributes:{"class":"al"}} //보험회사
                 ,{field:"c", title:"<spring:message code='global.lbl.incRegDt' />", width:130, attributes:{"class":"al"}} //보험 가입일
                 ,{field:"d", title:"<spring:message code='global.lbl.incAmt' />", width:130, attributes:{"class":"al"}} //보험 금액
                 ,{title:""}
             ]
         });

         // 금융정보
         $("#fincGrid").kendoExtGrid({
             editable:false
             ,autoBind:false
             ,navigatable:false
             ,pageable:false
             ,height:158
             ,columns:[
                 {field:"a",  title:"<spring:message code='global.lbl.line' />",   width:60, attributes:{"class":"al"}} //No
                 ,{field:"b", title:"<spring:message code='global.lbl.fincCmp' />",     width:130, attributes:{"class":"al"}} //금융사
                 ,{field:"c", title:"<spring:message code='global.lbl.fincItem' />", width:130, attributes:{"class":"al"}} //금융상품
                 ,{field:"d", title:"<spring:message code='global.lbl.fincReqAmt' />", width:130, attributes:{"class":"al"}} //신청금액
                 ,{field:"e", title:"<spring:message code='global.lbl.fincReqDt' />",     width:130, attributes:{"class":"al"}} //신청일자
                 ,{field:"f", title:"<spring:message code='global.lbl.fincEndDt' />",     width:130, attributes:{"class":"al"}} //만기일자
                 ,{title:""}
             ]
         });

         // 고객정보변경이력
         $("#infoUpdHistGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoHistory.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;

                             params["sCustNo"]               = $("#custNo").val();

                             console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                         errors:"error"
                         //, data:"custInfoDS"
                         //, total:"total"
                         , model:{
                             id:"rnum"
                             , fields:{
                                 rnum:{type:"number"}
                                 , custNo       :{type:"string", editable:false}
                                 , custNm       :{type:"string", editable:false}
                                 , custTp       :{type:"string", editable:false}
                                 , hpNo         :{type:"string", editable:false}
                                 , befHpNo      :{type:"string", editable:false}
                                 , telNo        :{type:"string", editable:false}
                                 , emailNm      :{type:"string", editable:false}
                                 , befEmailNm   :{type:"string", editable:false}
                                 , bhmcYn       :{type:"string", editable:false}
                                 , regDt        :{type:"date", editable:false}
                                 , zipCd        :{type:"string", editable:false}
                                 , sungCd       :{type:"string", editable:false}
                                 , cityCd       :{type:"string", editable:false}
                                 , distCd       :{type:"string", editable:false}
                                 , sungNm       :{type:"string", editable:false}
                                 , cityNm       :{type:"string", editable:false}
                                 , distNm       :{type:"string", editable:false}
                                 , addr1        :{type:"string", editable:false}
                                 , addrDetlCont :{type:"string", editable:false}
                                 , mathDocTp    :{type:"string", editable:false}
                                 , ssnCrnNo     :{type:"string", editable:false}
                                 , logDt        :{type:"date", editable:false}
                             }
                         }
                 }

             }
             , editable:false
             ,autoBind:false
             ,selectable:"row"
             ,height:158
             ,columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                                ,attributes:{"class":"ac"}
                    }
                    , {field:"befCustNo" , title:"<spring:message code='global.lbl.custNo' />",  width:150, attributes:{"class":"ac"}
                    }
                    , {field:"befCustTp" , title:"<spring:message code='global.lbl.custTp' />", width:120, attributes:{"class":"ac"}
                        , editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                , dataValueField:"cmmCd"
                                , dataSource:custTpList
                            });
                        }
                        , template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
                    }
                    , {field:"befCustNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}
                    }
                    , {field:"befCustCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"}
                        , editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                , dataValueField:"cmmCd"
                                , dataSource:custCdList
                            });
                        }
                        , template:'#if (custCd !== ""){# #= custCdMap[custCd]# #}#'
                    }
                    , {field:"befHpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}
                        //, template:'# if (befHpNo !== hpNo){# befHpNo #} #'
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.befHpNo != dataItem.hpNo) {
                                spanObj = "<span class='txt_label bg_red'>"+dataItem.befHpNo+"</span>";
                            } else {
                                spanObj = dataItem.befHpNo;
                            }
                            return spanObj;
                        }
                    }
                    , {field:"befEmailNm"  , title:"<spring:message code='global.lbl.emailNm' />", width:250, attributes:{"class":"al"}
                        //, template:'# if (befEmailNm !== emailNm){# <span class="txt_label bg_gray"> befEmailNm </span> #} #'
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.befEmailNm != dataItem.emailNm) {
                                spanObj = "<span class='txt_label bg_red'>"+dataItem.befEmailNm+"</span>";
                            } else {
                                spanObj = dataItem.befEmailNm;
                            }
                            return spanObj;
                        }
                    }
                    , {field:"befMathDocTp"  , title:"<spring:message code='global.lbl.mathDocTp' />", width:120, attributes:{"class":"al"}
                        , template:'#if (befMathDocTp !== ""){# #= mathDocTpMap[befMathDocTp]# #}#'
                    }
                    , {field:"befSsnCrnNo"  , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:120, attributes:{"class":"al"}}
                    , {field:"befOfficeTelNo"  , title:"<spring:message code='global.lbl.officeTelNo' />", width:120, attributes:{"class":"al"}}
                    , {field:"logDt"  , title:"<spring:message code='global.lbl.chgDt' />", width:120, attributes:{"class":"ac"}
                        , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                    }
                    ,{title:""}
             ]
         });

         // 메모
         $("#memoGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectCustomerMemo.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
                             params["sort"]                 = options.sort;

                             params["sDlrCd"] = $("#dlrCd").val();
                             params["sCustNo"] = $("#custNo").val();
                             params["sMngScId"] = $("#mngScId").val();
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
                                   rnum:{type:"number" , editable:false}
                                 , memoTp:{type:"string", validation:{required:true} , editable:true}
                                 , memoCont:{type:"string", validation:{required:true} , editable:true}
                                 , shareYn:{type:"string", editable:true}
                                 , regDt:{type:"date", editable:false}         // 등록일
                                 , custNo:{type:"string", editable:false}
                                 , dlrCd:{type:"string", editable:false}
                                 , updtDt:{type:"date", editable:false}         // 수정일
                                 , usrNm:{type:"string", editable:false}
                                 , regUsrId:{type:"string", editable:false}
                             }
                         }
                 }
             }
             ,edit:function(e) {
                 if(!e.model.isNew()) {
                     var selectedVal = this.dataItem(this.select());
                     var regUsrId = selectedVal.regUsrId;
                     var mngScId = $("#mngScId").val();
                     if (e.sender.columns[e.container.index()].field == "memoTp"
                         || e.sender.columns[e.container.index()].field == "memoCont") {

                         if (regUsrId != mngScId) {
                             this.closeCell();
                         }
                     }
                 }
             }
             ,dataBound:function(e) {

                 var mngScId = $("#mngScId").val();

                 var grid          = $("#memoGrid").data("kendoExtGrid")
                 , rows          = grid.tbody.find("tr");

                 rows.each(function(index, row) {
                     var gridData = grid.dataSource.at(index);
                     console.log("------");
                     console.log(gridData);
                     console.log(gridData.regUsrId);
                     console.log("------");
                     console.log(row);

                     if (mngScId != gridData.regUsrId) {
                       $("input.grid-checkbox-item", row).prop("disabled", true);
                       $("input.shareYn", row).prop("disabled", true);
                       $("table", "#memoGrid").removeClass('k-selectable');
                     } else {
                       $("table", "#memoGrid").addClass('k-selectable');
                     }
                 });
             }
            /* ,change:function(e) {
                 var selectedVal = this.dataItem(this.select());
                 var mngScId = $("#mngScId").val();

                 console.log(selectedVal);

                 if (mngScId != selectedVal.regUsrId) {
                     var row = this.tbody.find("tr");
                     //var row = this.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop("checked", false);
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop('disabled', false);
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).attr('checked', false);
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop('disabled', true);
                     console.log("row::::");
                     console.log(row);
                     console.log(row[selectedVal.rnum-1]);
                 }

             } */
             ,columns:[
                 {field:"rnum",              title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
                 , {field:"memoTp",  title:"<spring:message code='global.lbl.type' />",   width:100, attributes:{"class":"ac"}
                     , editor:function(container, options){
                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , dataSource:memoTpDS
                         });
                     }
                     , template:'#if (memoTp !== ""){# #= memoTpMap[memoTp]# #}#'
                 } //유형
                 , {field:"memoCont", title:"<spring:message code='global.lbl.memo' />",     width:500, attributes:{"class":"al"}} //메모
                 , {template:'<input type="checkbox" #= shareYn == "Y"? \'checked="checked"\':"" # class="shareYn" data-uid="#= uid #" />', width:100, attributes:{"class":"ac"},title:"<spring:message code='global.lbl.shareYn' />"}//공개여부
                 , {field:"usrNm", title:"<spring:message code='global.lbl.regUsrId' />",     width:100, attributes:{"class":"ac"}} //메모
                 , {field:"regDt", title:"<spring:message code='global.lbl.regDt' />",     width:100, attributes:{"class":"ac"}
                     , format:"{0:<dms:configValue code='dateFormat' />}"
                 } //등록일
                 , {title:""}
             ]
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,height:158
             ,pageable:false
             ,navigatable:false
         });

         // 공장으로 보고하는 고객
         $("#sendInfoHistGrid").kendoExtGrid({
             editable:false
             ,autoBind:false
             ,navigatable:false
             ,pageable:false
             ,height:158
             ,columns:[
                 {field:"a",  title:"<spring:message code='global.lbl.custNm' />", width:130, attributes:{"class":"al"}} //고객명
                 ,{field:"b", title:"<spring:message code='global.lbl.custNo' />",     width:130, attributes:{"class":"al"}} //고객번호
                 ,{field:"c", title:"<spring:message code='global.lbl.custTp' />", width:130, attributes:{"class":"al"}} //고객유형
                 ,{field:"d", title:"<spring:message code='global.lbl.custCd' />", width:130, attributes:{"class":"al"}} //장재/보유고객
                 ,{field:"e", title:"<spring:message code='global.lbl.upCustNm' />",     width:130, attributes:{"class":"al"}} //상위고객
                 ,{field:"f", title:"<spring:message code='global.lbl.prefCommMthCd' />",     width:130, attributes:{"class":"al"}} //선호연락방식
                 ,{field:"g", title:"<spring:message code='global.lbl.prefCommNo' />",     width:130, attributes:{"class":"al"}} //선호연락처
                 ,{field:"h", title:"<spring:message code='global.lbl.sungNm' />",     width:130, attributes:{"class":"al"}} //성/직할시
                 ,{field:"i", title:"<spring:message code='global.lbl.city' />",     width:130, attributes:{"class":"al"}} //시
                 ,{field:"j", title:"<spring:message code='global.lbl.distNm' />",     width:130, attributes:{"class":"al"}} //구/군
                 ,{field:"k", title:"<spring:message code='global.lbl.detlAddr' />",     width:130, attributes:{"class":"al"}} //주소
                 ,{field:"l", title:"<spring:message code='global.lbl.zipCd' />",     width:130, attributes:{"class":"al"}} //우편번호
                 ,{field:"m", title:"<spring:message code='global.lbl.vip' />",     width:130, attributes:{"class":"al"}} //VIP
                 ,{title:""}
             ]
         });

         // 계약 그리드
         $("#contractGrid").kendoExtGrid({
             dataSource:{
                  transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectProgressSts.do' />"
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

                             //params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                             params["sDlrCd"] = $("#dlrCd").val();            //딜러코드
                             params["sContractCustNo"] = $("#custNo").val();            //고객번호

                             console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,requestEnd:function(e) {
                     if (e.type == "read") {
                         //조회가 완료 되였습니다.
                         dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                     }
                 }
                 ,schema:{
                     model:{
                         id:"contractNo"
                         ,fields:{
                             contractNo     :{type:"string"}
                             ,contractTp    :{type:"string"}
                             ,contractDt    :{type:"date"}
                             ,contractStatCd:{type:"string"}
                             ,contractCustNo:{type:"string"}
                             ,saleEmpNo     :{type:"string"}
                             ,carlineCd     :{type:"string"}
                             ,modelCd       :{type:"string"}
                             ,ocnCd         :{type:"string"}
                             ,extColorCd    :{type:"string"}
                             ,intColorCd    :{type:"string"}
                             ,carAmt        :{type:"number"}
                         }
                     }
                 }
             }
             ,editable:false
             ,autoBind:false
             ,navigatable:false
             ,pageable:false
             ,height:158
             ,columns:[
                         {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:130, attributes:{"class":"ac"}} //계약번호
                         ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:130, attributes:{"class":"ac"}, template:"#= contractTpObj[contractTp] #"}         //계약유형
                         ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:130, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
                         ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:130, attributes:{"class":"ac"}, template:"#= contractStatObj[contractStatCd] #"} //계약상태
                         ,{field:"contractCustNo",title:"<spring:message code='global.lbl.customer' />",     width:150, attributes:{"class":"ac"}} //고객
                         ,{field:"saleEmpNo",     title:"<spring:message code='sale.lbl.saleEmpNo' />",      width:130, attributes:{"class":"ac"}} //영업사원
                         ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carLine' />",      width:130, attributes:{"class":"al"}} //차종
                         ,{field:"modelCd",       title:"<spring:message code='global.lbl.model' />",        width:130, attributes:{"class":"al"}} //모델
                         ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocn' />",          width:130, attributes:{"class":"ac"}} //OCN
                         ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColor' />",     width:130, attributes:{"class":"ac"}} //외장색
                         ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColor' />",     width:130, attributes:{"class":"ac"}} //내장색
                         ,{field:"carAmt",        title:"<spring:message code='global.lbl.vehiclePrice' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"} //차량가격
                         ,{title:""}
             ]
         });

         /* *************************************************************************
          **************************파일업로드5********************************************
          ***************************************************************************/
          // 파일 그리드 시작 //
          $("#fileGrid").kendoExtGrid({
              dataSource:{
                  transport:{
                      read:{
                          url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                      },
                      parameterMap:function(options, operation) {
                          if (operation === "read") {

                              var params = {};
                              params["sFileDocNo"] = $("#docId").val();

                              return kendo.stringify(params);

                          }else if (operation !== "read" && options.models) {
                              return kendo.stringify(options.models);
                          }
                      }
                  }
                  ,schema:{
                      model:{
                          fields:{
                              fileDocNo:{type:"string", editable:false}
                              ,fileNo:{type:"number", editable:false}
                              ,fileNm:{type:"string", editable:false}
                              ,fileSize:{type:"number", editable:false}
                          }
                      }
                  }
              }
             ,autoBind:false
             ,editable:true
             ,height:141
             ,multiSelectWithCheckbox:true
             ,navigatable:false
             ,pageable:false
             //,selectable:"row"
             ,columns:[
                 {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
                ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", attributes:{"class":"ar"}}       // 파일크기
                ,{title:""}

             ]
         });
         // 파일 그리드 종료 //
          /* *************************************************************************
          **************************파일업로드5********************************************
          ***************************************************************************/


      // 주소 그리드
         $("#addrGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;
                             params["sRefTableNm"]           = "CR_0101T";
                             params["sRefKeyNm"]             = $("#custNo").val();

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
                             id:"seq"
                             ,fields:{
                                 seq:{type:"string", editable:false}
                                 ,rnum  :{type:"number" , editable:false}
                                 ,addrTp:{type:"string", editable:true}
                                 ,zipCd:{type:"string", editable:false}
                                 ,sungCd:{type:"string", editable:false}
                                 ,cityCd:{type:"string", editable:false}
                                 ,distCd:{type:"string", editable:false}
                                 ,sungNm:{type:"string", editable:false}
                                 ,cityNm:{type:"string", editable:false}
                                 ,distNm:{type:"string", editable:false}
                                 ,addrNm:{type:"string", editable:true}
                                 ,addrDetlCont:{type:"string", editable:true}
                                 ,flagYn:{type:"string", editable:true}
                                 ,refTableNm:{type:"string", editable:false}
                                 ,refKeyNm:{type:"string", editable:true}
                                 ,useYn:{type:"string", editable:true}
                             }
                         }
                 }
             }
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,navigatable:false
             ,height:150
             ,pageable:false
             ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
                ,{template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:60, attributes:{"class":"ac"},title:"<spring:message code='global.lbl.selectAddr' />"}
                ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}
                    , editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:addrTpList
                        });
                    }
                    , template:'#if (addrTp !== ""){# #= addrTpMap[addrTp]# #}#'
                }       // 주소유형
                ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
                ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
                ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}}       // 지역
                ,{field:"addrNm", hidden:true}       // 주소
                ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:200, attributes:{"class":"al"}}       // 상세주소
                ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:100, attributes:{"class":"ac"}}       // 우편번호
                ,{field:"useYn", title:"<spring:message code='global.lbl.validYn' />", width:100, attributes:{"class":"ac"}
                    , editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:chgBuyYnDS
                        });
                    }
                    , template:'#if (useYn !== ""){# #= chgBuyYnMap[useYn]# #}#'
                }       // 사융유무
                ,{field:"sungCd", hidden:true}
                ,{field:"cityCd", hidden:true}
                ,{field:"distCd", hidden:true}
                ,{field:"refTableNm", hidden:true}
                ,{field:"refKeyNm", hidden:true}
                ,{title:""}
             ]

         });

         /* *************************************************************************
          **************************파일업로드3********************************************
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

         $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
             var grid = $("#fileGrid").data("kendoExtGrid");
             var dataItem = grid.dataItem(grid.select());

             if(dms.string.isNotEmpty(dataItem)){
                 dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
             }
         });
         /* *************************************************************************
          **************************파일업로드3********************************************
          ***************************************************************************/

          if (getParamChk == "GETCUSTNO") {

              console.log("getParamChk:" + getParamChk);
              $("#custNo").val(custNo);
              $("#btnCustSearch").click();
          }

});


/* *************************************************************************
 **************************파일업로드4********************************************
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

     if (dms.string.isEmpty($("#docId").val())) {
         $.ajax({
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#docId").val(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#docId").val();
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
 **************************파일업로드4********************************************
 ***************************************************************************/

</script>
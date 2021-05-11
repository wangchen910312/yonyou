<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

      <!-- 기본정보 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.custReg" /></h1> <!-- 고객정보 -->
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-10753" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_m btn_save" id="btnCustSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-10759" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_m btn_reset" id="btnCustReset"><spring:message code="global.btn.init" /></button> <!-- 초기화 -->
                        </dms:access>
                        <!-- 조회
                        <button type="button" class="btn_m btn_search" id="btnCustSearch"><spring:message code="global.btn.search" /></button>
                        -->
                        <input type="hidden" id="btnCustSearch" />
                    </div>
                </div>
<div id="customerForm" name="customerForm" onsubmit="return false;">
<div id="personalDiv" class="personalDiv">
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
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                <td class="required_area">
                                    <input id="custNm" name="custNm" type="text" value="" class="form_input"  maxlength="30" data-json-obj="true" />
                                    <input id="oldCustNm" name="oldCustNm" type="hidden" value="" data-json-obj="true" />
                                    <input type="hidden" id="custCollSrcCd" name="custCollSrcCd" value="${custCollSrcCd}" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="custNo" name="custNo" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                    <input id="pageMode" name="pageMode" type="hidden" value="insertMode" readonly data-json-obj="true" />
                                    <input type="hidden" id="docId" name="docId" data-json-obj="true" />
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
                                    <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input numberandalpha" maxlength="30" data-json-obj="true" style="text-transform: uppercase"/>
                                    <input id="oldSsnCrnNo" name="oldSsnCrnNo" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <!-- BHMC여부 -->
                                <!--
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th>
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
                                -->
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                                <td class="readonly_area">
                                    <input id="mngScNm" name="mngScNm" type="text" value="" class="form_input"  readonly />
                                    <input id="mngScId" name="mngScId" type="hidden" value="" class="form_input"  readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecNm" name="mngTecNm" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecId" name="mngTecId" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
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
                                <th scope="row"><input type="radio" checked name="prefCommMthCdRadio" value="01" ><span class="bu_required"><spring:message code="global.lbl.hpNo" /></span></th> <!-- 이동전화 -->
                                <td>
                                    <input id="hpNo" name="hpNo" type="text" value="" class="form_input numberic getCustDupByKey"  maxlength="11" data-type="mobile" pattern="\d" data-json-obj="true" />
                                    <input id="oldHpNo" name="oldHpNo" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <td colspan="3" style="display:none;">
                                    <label class="label_check ml5"><input id="hpNoInvldYn" name="hpNoInvldYn" type="checkbox" class="form_check" unchecked disabled data-json-obj="true" /> <spring:message code="global.lbl.hpNoInvld" /></label>&nbsp;&nbsp;&nbsp;<!-- 법인 검증 무효 -->
                                    <label class="label_check ml5"><input id="hpNoAddImposYn" name="hpNoAddImposYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNoAddImpos" /></label>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><input type="radio" name="prefCommMthCdRadio" value="02" ><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                <td>
                                    <input id="telNo" name="telNo" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row" style="display:none;"><span class="bu_required"><spring:message code="crm.lbl.prefCommMthCd" /></span></th> <!-- 선호연락방법 -->
                                <td class="required_area" style="display:none;">
                                    <input id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row" style="display:none;"><span class="bu_required"><spring:message code="crm.lbl.prefCommNo" /></span></th> <!-- 선호연락처 -->
                                <td class="required_area" style="display:none;">
                                    <input id="prefCommNo" name="prefCommNo" class="form_input numberic" data-type="mobile" maxlength="20" pattern="\d" data-json-obj="true" />
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
                                    <input id="qqId" name="qqId" type="text" value="" class="form_input numberic"  maxlength="30" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td>
                                    <input id="officeTelNo" name="officeTelNo" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNo" name="officeFaxNo" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.prefContactMthCd" /></th> <!-- 우선연락방식  SMS / EMAIL / DM -->
                                <td>
                                    <input id="prefContactMthCd" name="prefContactMthCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.prefContactTime" /></th> <!-- 우선연락시간 -->
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
                                    <label class="label_check ml5"><input id="smsReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.sms" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="hpNoReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNo" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="telReceiveYn" name="telReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.homeTelNo" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="emailReceiveYn" name="emailReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code='global.lbl.email' /></label>&nbsp;&nbsp;&nbsp;
                                    <!--
                                    <label class="label_check ml5"><input id="dmReceiveYn" name="dmReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.dm" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="faxReceiveYn" name="faxReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code='global.lbl.fax' /></label>&nbsp;&nbsp;&nbsp;
                                    -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
</div>  <!-- PersonalDiv End-->
<div id="corporateDiv" class="corporateDiv" style="display:none"> <!-- corporateDiv Start -->
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
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTpC" name="custTpC" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corporation" /></span><!-- 회사명 --></th>
                                <td class="required_area">
                                    <input id="custNmC" name="custNmC" type="text" value="" class="form_input"  maxlength="30" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="custNoC" name="custNoC" type="text" value="" class="form_input form_readonly " readonly data-json-obj="true" />
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
<%--                                 <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th> <!-- 대표자명 --> --%>
<!--                                 <td> -->
<!--                                     <input id="ownRgstNm" name="ownRgstNm"  type="text" class="form_input" maxlength="20" data-json-obj="true" /> -->
<!--                                 </td> -->
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMng" /></span></th> <!-- 구매담당자명 -->
                                <td>
                                    <input id="purcMngNm" name="purcMngNm" type="text" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                                <td>
                                    <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                <td>
                                    <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input getCustMathDocDupByKey" maxlength="30" data-json-obj="true" style="text-transform: uppercase" />
                                </td>
                                <!-- BHMC여부 -->
                                <!--
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th>
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
                                -->
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.custSourceLocation" /></th> <!-- 정보출처 -->
                                <td>
                                    <input id="custHoldTpC" name="custHoldTpC" class="form_comboBox" data-json-obj="true" />
                                    <div class="form_float" style="display:none;">
                                        <div class="form_right">
                                            <input id="custHoldTpDtlC" name="custHoldTpDtlC" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.taxpayerNo" /></th> <!-- 납세인식별번호 -->
                                <td>
                                    <input id="taxpayerNo" name="taxpayerNo" class="form_input numberandalpha" maxlength="40" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                                <td class="readonly_area">
                                    <input id="mngScNmC" name="mngScNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngScIdC" name="mngScIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecNmC" name="mngTecNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecIdC" name="mngTecIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
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
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMngHpno" /></span></th> <!-- 구매담당자이동전화 -->
                                <td>
                                    <input id="hpNoC" name="hpNoC" type="text" class="form_input numberic getCustDupByKey" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 대표전화 --></th>
                                <td>
                                    <input id="officeTelNoC" name="officeTelNoC" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNoC" name="officeFaxNoC" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td>
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
                                  <input id="cmpScaleContC" name="cmpScaleContC" class="form_input"  data-json-obj="true" />
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

                <!-- 주소정보 시작 -->
                <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code='global.title.addr' /></h2>
                        <div class="btn_right">
                            <%-- <button class="btn_s btn_save" id="btnSaveAddress" ><spring:message code="global.btn.save" /></button> <!-- 주소저장 --> --%>
                            <dms:access viewId="VIEW-D-10758" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 -->
                            </dms:access>
                            <dms:access viewId="VIEW-D-10757" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 -->
                            </dms:access>
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="addrGrid"></div>
                    </div>
                </section>
                <!-- //주소정보 끝 -->

<div class="personalDiv">   <!-- PersonalDiv Start-->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.lbl.dtlInfo' /></h2> <!-- 상세정보 -->
                    <div class="fl">
                        <label><input type="checkbox" id="addInfoChk" class="form_check" onclick="bf_addInfo()"> <spring:message code='crm.lbl.infoInput' /></label>     <!-- 정보입력 -->
                    </div>
                </div>
                <div id="addInfo" style="display:none">
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
                                        <label class="label_check ml5"><input id="perInfoAgreeYn" type="checkbox" class="form_check" checked data-json-obj="true" /> <spring:message code="global.lbl.infoAgreedocId" /></label>
                                        <label class="label_check ml5"><input id="perInfoUseYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.infoUsrYn" /></label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form form_width_100per mt5">
                        <table>
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
<!--                                 <tr> -->
<%--                                     <th scope="row"><spring:message code='global.lbl.buyAddCnt' /></th> <!-- 추가구매  --> --%>
<!--                                     <td colspan="3"> -->
<!--                                         <input id="buyCnt" name="buyCnt" class="form_input"  maxlength="10"  data-json-obj="true" /> -->
<!--                                     </td> -->
<%--                                     <th scope="row"><spring:message code='global.lbl.chgBuy' /></th> <!-- 교환구매  --> --%>
<!--                                     <td colspan="3"> -->
<!--                                         <div class="form_float"> -->
<!--                                             <div class="form_left" style="width:33%;" > -->
<!--                                                 <input id="chgBuyYn" name="chgBuyYn" class="form_comboBox" data-json-obj="true" /> -->
<!--                                             </div> -->
<!--                                             <div class="form_left" style="width:33%;"> -->
<!--                                                 <input id="purcCarBrandCd" name="purcCarBrandCd" class="form_comboBox" data-json-obj="true" /> -->
<!--                                             </div> -->
<!--                                             <div class="form_right" style="width:34%;"> -->
<!--                                                 <input id="purcCarModelNm" name="purcCarModelNm" class="form_input" data-json-obj="true" /> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
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
                                      <input id="childrenCnt" name="childrenCnt" class="form_numeric"  data-json-obj="true" />
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
                                  <th scope="row"><spring:message code="crm.lbl.custSourceLocation" /></th> <!-- 정보출처 -->
                                  <td>
                                      <input id="custHoldTp" name="custHoldTp" class="form_comboBox" data-json-obj="true" />
                                      <div class="form_float" style="display:none;">
                                          <div class="form_right" >
                                              <input id="custHoldTpDtl" name="custHoldTpDtl" class="form_comboBox" data-json-obj="true" />
                                          </div>
                                      </div>
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
                                      <input id="officeNm" name="officeNm" type="text" value="" class="form_input"  maxlength="20" data-json-obj="true" />
                                  </td>
                                  <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                  <td>
                                      <input id="bizcondCd" name="bizcondCd" class="form_comboBox"  data-json-obj="true" />
                                  </td>
                                  <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                  <td>
                                      <input id="cmpScaleCont" name="cmpScaleCont" class="form_input"  data-json-obj="true" />
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
                                      <input id="deptNm" name="deptNm" type="text" value="" class="form_input"  maxlength="20" data-json-obj="true" />
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
                </div>
                </div> <!-- PersonalDiv End-->

</div> <!--  customerForm End -->
                </section>
      <!-- //기본정보 -->



      <!-- 고객 연계인 정보 -->
       <section class="group" style="display:none;">
          <div class="header_area">
              <h2 class="title_basic"><spring:message code="global.title.relCustInfo" /></h2> <!-- 고객 연계인 정보 -->
              <div class="btn_right">
                  <dms:access viewId="VIEW-D-10756" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_save" id="btnSaveRelCustGrid" ><spring:message code="global.btn.save" /></button> <!-- 연계인저장 -->
                  </dms:access>
                  <dms:access viewId="VIEW-D-10755" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_add" id="btnAddRelCust" ><spring:message code="global.btn.rowAdd" /></button> <!-- 연계인행추가 -->
                  </dms:access>
                  <dms:access viewId="VIEW-D-10754" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_del" id="btnDelRelCust" ><spring:message code="global.btn.rowDel" /></button> <!-- 연계인행삭제 -->
                  </dms:access>
              </div>
          </div>
          <div class="table_grid">
            <div id="gridRel"></div>
          </div>
      </section>

      <!-- //고객 연계인 정보 -->

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

    var loginDlrCd              = "${dlrCd}"
    var custCollSrcCd           = "${custCollSrcCd}";
    var custTpList              = [];
    var custCdList              = [];
    var custHoldTpList          = [];
    var custHoldTpDtlList       = [];
    var sexCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var mathDocTpListC          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var pconTpList              = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var addrTpList              = [];
    var ageCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var driverTpList            = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var jobCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var cmpTpList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var acCareerCdList          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var marryYnList             = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var chgBuyYnDS              = [];
    var chgBuyYnMap              = [];
    var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var chinaZodiacSignCdDS     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var zodiacSignCdDS          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var bloodTpDS               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var dutyCdDS                = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    var prefCommMthCdMap        = [];
    var mathDocTpMap            = [];
    var mathDocTpMapC            = [];
    var pconTpMap               = [];
    var addrTpMap               = [];
    var prefContactMthCdMap     = [];
    var prefContactTimeCdMap    = [];

    chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
    chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

    <c:forEach var="obj" items="${purcCarBrandCdDS}">
    purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${chinaZodiacSignCdDS}">
    chinaZodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${zodiacSignCdDS}">
    zodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${bloodTpDS}">
    bloodTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${dutyCdDS}">
    dutyCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpList}">
    custHoldTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpDtlList}">
    custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCd}">
    prefContactMthCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCd}">
    prefContactTimeCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${incomeLvlCdList}">
    incomeLvlCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${mathDocTpList}">
        <c:if test="${obj.remark1 == 'P'}">
            mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>

        <c:if test="${obj.remark1 == 'C'}">
            mathDocTpListC.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            mathDocTpMapC["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${pconTpList}">
    pconTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    pconTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${addrTpList}">
        <c:if test="${obj.remark1 ne 'SA'}">
            addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${ageCdList}">
    ageCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${driverTpList}">
    driverTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${jobCdList}">
    jobCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpScaleContList}">
    cmpScaleContList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpTpList}">
    cmpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${acCareerCdList}">
    acCareerCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${marryYnList}">
    marryYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${avgCarChgCdList}">
    avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroups.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroupsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTagsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHobbys}">
    custHobbys.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
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
        console.log("::::::hobbyDS::::::");
        console.log(hobbyDS);
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
        console.log(groupDS);
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

        console.log(tagDS);
    };

    function getCustDupByKey(idVal){
        console.log("getCustDupByKey!!!!");
        var custTp = $("#custTp").data("kendoExtDropDownList").value();

        var custNm = $("#custNm").val();
        var custNo = $("#custNo").val();
        var custCd = $("#custCd").data("kendoExtDropDownList").value();
        var hpNo = $("#hpNo").val();
        var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
        var ssnCrnNo = $("#ssnCrnNo").val();
        var officeTelNo = $("#officeTelNoC").val();
        var oldCustNm = $("#oldCustNm").val();
        var oldHpNo = $("#oldHpNo").val();
        var oldMathDocTp = $("#oldMathDocTp").val();
        var oldSsnCrnNo = $("#oldSsnCrnNo").val();
        var chkContinued = false;
        // 법인연계인 (구매담당자)
        var purcMngNm = $("#purcMngNm").val();
        var hpNoC = $("#hpNoC").val();

        if ( dms.string.isEmpty(custCd) ) {
            custCd = "01";
        }

        if (custTp == "02") {
            custNm = $("#custNmC").val();
            if (hpNoC.length > 1 ) {
                hpNo = hpNoC;
                chkContinued = true;
            }
        } else {
            if (hpNo.length > 1 ) {
                chkContinued = true;
            }
        }

        if (chkContinued){

            var param = {};
            param["sCustNo"]       = custNo;
            param["sCustCd"]       = custCd;   // 잠재
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
                //url:"<c:url value='/crm/cif/customerInfo/selectCustDupByKey.do' />"
                url:"<c:url value='/crm/cif/customerInfo/selectCustDupScreenByKey.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    //console.log(jqXHR.responseJSON);
                    dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    console.log(result);

                    if (result.total == 0 ){
                        dms.notification.info ("<spring:message code='global.info.ableToDo' />");
                    } else {
                        dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
    }

    function getCustMathDocDupByKey(idVal){

        var custTp = $("#custTp").val();

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

        if (dms.string.isNotEmpty(mathDocTp) && dms.string.isNotEmpty(ssnCrnNo)){

            var param = {};
            var flag;
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
                ,async:false
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                    flag = false;
                    return false;
                },
                success:function(result){
                    console.log("getCustMathDocDupByKey !!! ");

                    if (result.total == 0 ){
                        dms.notification.info("<spring:message code='global.info.ableToDo' />");
                        flag = true;
                        return true;
                    } else {
                        //dms.notification.info("<spring:message code='global.info.already' />");
                        dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                        return false;
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
        return flag;
    }

    // 상세정보 입력 체크
    var bf_addInfo = function(obj){

        if($("#addInfoChk").prop('checked')){
            $("#addInfo").show();
        }else{
            $("#addInfo").hide();
        }
    }


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
                $(".personalDiv").hide();
                $(".corporateDiv").show();
            }
        }
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
                $(".personalDiv").show();
                $(".corporateDiv").hide();
            } else {
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
            }
        }
    });

 // 잠재/보유고객      custCd              (CRM023)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:0
        , value:"01"
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
        //, optionLabel:" "
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
        //, optionLabel:" "
        //, dataSource:mathDocTpList
        , dataSource:dms.data.cmmCdFilter(mathDocTpList)
        , index:0
        , change:function(){
            var sel = this.dataItem(this.select()).cmmCd;

            if (sel == "01") {
                $("#ssnCrnNo").attr('maxlength','18');
                if($("#ssnCrnNo").val().length >= 15){
                    var yyyy = $("#ssnCrnNo").val().substr(6,4);
                    var mm = $("#ssnCrnNo").val().substr(10,2);
                    var dd = $("#ssnCrnNo").val().substr(12,2);
                    $("#birthDt").data("kendoExtMaskedDatePicker").value(yyyy+"-"+mm+"-"+dd);      // 생일
                    getAge(yyyy, mm, dd);
                    getPet(yyyy);
                    sunSign(mm, dd);
                }
            } else if (sel  == "02"
                                 || sel  == "03"
                                 || sel  == "04"
                                 || sel  == "05"
                                 || sel  == "06"
            ) {
                $("#ssnCrnNo").attr('maxlength','20');
            } else if (sel == "08") {
                $("#ssnCrnNoC").attr('maxlength','10');
            } else if (sel == "10") {
                $("#ssnCrnNoC").attr('maxlength','18');
            }
            if (getCustMathDocDupByKey()) {
                $("#birthDt").data("kendoExtMaskedDatePicker").value("");      // 생일
                $("#ageDtl").data("kendoExtNumericTextBox").value("");
                $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
                $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            }
        }
    });

  // 신분증유형            mathDocTpC       (CRM024)
     $("#mathDocTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        //, dataSource:mathDocTpListC
        , dataSource:dms.data.cmmCdFilter(mathDocTpListC)
        , index:0
        , change:function(){
            var sel = this.dataItem(this.select()).cmmCd;

            if (sel == "01") {
                $("#ssnCrnNo").attr('maxlength','18');
            } else if (sel  == "02"
                                 || sel  == "03"
                                 || sel  == "04"
                                 || sel  == "05"
                                 || sel  == "06"
            ) {
                $("#ssnCrnNo").attr('maxlength','20');
            } else if (sel == "08") {
                $("#ssnCrnNoC").attr('maxlength','10');
            } else if (sel == "10") {
                $("#ssnCrnNoC").attr('maxlength','18');
            }

            getCustMathDocDupByKey();
        }
    });

 // 고객확보유형1      custHoldTp      (CRM008)
     $("#custHoldTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , filter:"contains"
        , filtering:function(e){
            var filter = e.filter;
        }
        //,select:onSelectSearchHoldTp
//         , index:0
//         , change:function(){
//             var selcmmCd = this.dataItem(this.select()).cmmCd;
//             var custHoldTpDtl = $("#custHoldTpDtl").data("kendoExtDropDownList");
//             if (selcmmCd == "01"){
//                 custHoldTpDtl.enable(true);
//             } else {
//                 custHoldTpDtl.value("");
//                 custHoldTpDtl.enable(false);
//             }
//         }
    });

 // 고객확보유형1      custHoldTpC      (CRM008)
     $("#custHoldTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , filter:"contains"
        , filtering:function(e){
            var filter = e.filter;
        }
        //,select:onSelectSearchHoldTp
//         , index:0
//         , change:function(){
//             var selcmmCd = this.dataItem(this.select()).cmmCd;
//             var custHoldTpDtl = $("#custHoldTpDtlC").data("kendoExtDropDownList");
//             if (selcmmCd == "01"){
//                 custHoldTpDtl.enable(true);
//             } else {
//                 custHoldTpDtl.value("");
//                 custHoldTpDtl.enable(false);
//             }
//         }
    });

 // 고객확보유형2      custHoldTpDtlC   (CRM***)
     $("#custHoldTpDtlC").kendoExtDropDownList({
         dataTextField:"holdDetlTpNm"
        , dataValueField:"holdSeq"
        , filter:"contains"
        , optionLabel:" "
        , enable:false
    });

 // 고객확보유형2      custHoldTpDtl   (CRM***)
     $("#custHoldTpDtl").kendoExtDropDownList({
         dataTextField:"holdDetlTpNm"
        , dataValueField:"holdSeq"
        , filter:"contains"
        , optionLabel:" "
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
//      $("#cmpScaleCont").kendoExtDropDownList({
//         dataTextField:"cmmCdNm"
//         , dataValueField:"cmmCd"
//         , dataSource:cmpScaleContList
//         , index:0
//     });

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
//      $("#cmpScaleContC").kendoExtDropDownList({
//         dataTextField:"cmmCdNm"
//         , dataValueField:"cmmCd"
//         , dataSource:cmpScaleContList
//         , index:0
//     });

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

 // 우선연락방식                       prefContactMthCd    (CRM022)
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

//      $("#chgBuyYn").kendoExtDropDownList({
//          dataTextField:"cmmCdNm"
//          , dataValueField:"cmmCd"
//          , optionLabel:" "
//          , dataSource:chgBuyYnDS
//          , index:0
//      });

//      $("#purcCarBrandCd").kendoExtDropDownList({
//          dataTextField:"cmmCdNm"
//          , dataValueField:"cmmCd"
         //, optionLabel:" "
//          , dataSource:purcCarBrandCdDS
//          , index:0
//      });

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
             var fullYear = this.value().getFullYear();
             var monthVal = this.value().getMonth();
             var dayVal = this.value().getDate();
             getPet(fullYear);
             sunSign(monthVal,dayVal);

         }
     });

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

 // 숫자와 알파벳
     var onlyNumAlpha = new RegExp("[^a-zA-Z0-9]");
     $(".numberandalpha").keyup(function(e)
     {

         var contents = $(this).val();
          console.log(contents);
          console.log(onlyNumAlpha.test(contents));
         if(onlyNumAlpha.test(contents)){

             $(this).val('');
         }
     });

     // 조직기구코드
     //var corpNumChk = new RegExp("[^[0-9]{8}-[0-9]$]");
     //var corpNumChk = new RegExp("^[0-9]{8}-[0-9]");
     var corpNumChk = new RegExp("[^a-zA-Z0-9-]");
     $(".corpNumChk").keyup(function(e)
     {

         var contents = $(this).val();
         console.log(contents);
         if(corpNumChk.test(contents)){
             $(this).val('');
         }
     });

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

  // 생일 자동 셋팅
     $("#ssnCrnNo").focusout(function(e)
     {
        if( dms.string.isNotEmpty($("#ssnCrnNo").val()) ) {
            if (getCustMathDocDupByKey()) {
                var mathDocTpVal = $("#mathDocTp").data("kendoExtDropDownList").value();
                if ( mathDocTpVal == "01" ){
                    var yyyy,mm,dd;
                    if($("#ssnCrnNo").val().length == 15){
                        //yyyy = $("#ssnCrnNo").val().substr(6,2);
                        yyyy = '19'+$("#ssnCrnNo").val().substr(6,2);
                        mm = $("#ssnCrnNo").val().substr(8,2);
                        dd = $("#ssnCrnNo").val().substr(10,2);
                    }else if($("#ssnCrnNo").val().length == 18){
                        yyyy = $("#ssnCrnNo").val().substr(6,4);
                        mm = $("#ssnCrnNo").val().substr(10,2);
                        dd = $("#ssnCrnNo").val().substr(12,2);
                    }
                    $("#birthDt").data("kendoExtMaskedDatePicker").value(yyyy+"-"+mm+"-"+dd);      // 생일
                    getAge(yyyy, mm, dd);
                    getPet(yyyy);
                    sunSign(mm, dd);
                }
            } else {
                $("#birthDt").data("kendoExtMaskedDatePicker").value("");      // 생일
                $("#ageDtl").data("kendoExtNumericTextBox").value("");
                $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
                $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            }
        } else {
            $("#birthDt").data("kendoExtMaskedDatePicker").value("");      // 생일
            $("#ageDtl").data("kendoExtNumericTextBox").value("");
            $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
            $("#zodiacSignCd").data("kendoExtDropDownList").value("");
        }
     });

     // 법인고객 증서번호 체크
     $("#ssnCrnNoC").focusout(function(e){
         if( dms.string.isNotEmpty($("#ssnCrnNoC").val()) ) {
             getCustMathDocDupByKey()
         }
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
         format:"n0"
        ,min:0
     });

 // 나이
     $("#ageDtl").kendoExtNumericTextBox({
         format:"n0"
        ,min:0
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

    });

    // 주소저장 - addrGrid
    //$("#btnSaveAddress").kendoButton({
    //$("#btnSaveAddress").click(function(){

    var btnSaveAddress = function(custNo) {

        var custNumber = custNo;

        if (custNumber == "") {
            custNumber = $("#custNo").val();
        }

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


    //버튼 - 연계인  추가
//      $("#btnAddRelCust").kendoButton({
//          click:function(e) {
//              popupWindow = dms.window.popup({
//                  windowId:"customerSearchPopup"
//                  , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
//                  , content:{
//                      url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
//                      , data:{
//                          "autoBind":false
//                          , "type"  :null
//                          , "callbackFunc":function(data){
//                              if (data.length >= 1) {
//                                  console.log(data);
//                                  insertRelCustomerItemAdd(data);
//                              }
//                          }
//                      }
//                  }
//              })
//          }
//          , enable:false
//      });

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
//      $("#btnDelRelCust").kendoButton({
//         click:function(e) {
//             var grid = $("#gridRel").data("kendoExtGrid");
//             var rows = grid.select();

//             rows.each(function(index, row) {
//                 grid.removeRow(row);
//             });
//         }
//         , enable:false
//      });



     function getAge(yyyy, mm, dd){
         var today = new Date();
         var toMonth = today.getMonth()+1;
         var toDate = today.getDate();
         var toYear = today.getFullYear();
         var toAge = toYear - yyyy;

         if (toMonth > mm){
             dayDiff = toAge;
         } else if (mm > toMonth) {
             dayDiff = toAge -1;
         } else {
             if (dd > toDate) {
                 dayDiff =toAge -1;
             } else {
                 var dayDiff = toAge;
             }
         }
         var age = parseInt(dayDiff);
         $("#ageDtl").data("kendoExtNumericTextBox").value(age);
     }
     /******************************************************
      * 띠 처리 - 시작
      ******************************************************/
     function getPet(toYear) {
        console.log("getPet toYear:" + toYear);
        var toyear = 1997; //(1997 - 내가 태어난날) % 12 합니다.
        var birthyear = toYear;
        var birthpet="Ox"
        x = (toyear - birthyear) % 12// x값을 구합니다.

        if ((x ==1) || (x == -11)) {
            birthpet="01"       //쥐띠
        } else if (x == 0) {
            birthpet="02"       //소띠
        } else if ((x == 11) || (x == -1)) {
            birthpet="03"       //호랑이띠
        } else if ((x == 10) || (x == -2)) {
            birthpet="04"       //토끼띠
        } else if ((x == 9) || (x == -3)) {
            birthpet="05"       //용띠
        } else if ((x == 8) || (x == -4)) {
            birthpet="06"       //뱀띠
        } else if ((x == 7) || (x == -5)) {
            birthpet="07"       //말띠
        } else if ((x == 6) || (x == -6)) {
            birthpet="08"       //양띠
        } else if ((x == 5) || (x == -7)) {
            birthpet="09"       //원숭이띠
        } else if ((x == 4) || (x == -8)) {
            birthpet="10"       //닭띠
        } else if ((x == 3) || (x == -9)) {
            birthpet="11"       //개띠
        } else if ((x == 2) || (x == -10)) {
            birthpet="12"       //돼지띠
        }

        $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(birthpet);

     }
     /******************************************************
      * 띠 처리 - 끝
      ******************************************************/

      /******************************************************
       * 별자리 처리 - 시작
       ******************************************************/
     function sunSign(monthVal,dayVal) {
         console.log("sunSign monthVal:" +monthVal);
         console.log("sunSign dayVal:" +dayVal);
         var signVal;

         if (monthVal == 1 && dayVal <=19) {signVal = "12";}
         if (monthVal == 1 && dayVal >=20) {signVal = "01";}
         if (monthVal == 2 && dayVal <=18) {signVal = "01";}
         if (monthVal == 2 && dayVal >=19) {signVal = "02";}
         if (monthVal == 3 && dayVal <=20) {signVal = "02";}
         if (monthVal == 3 && dayVal >=21) {signVal = "03";}
         if (monthVal == 4 && dayVal <=20) {signVal = "03";}
         if (monthVal == 4 && dayVal >=21) {signVal = "04";}
         if (monthVal == 5 && dayVal <=20) {signVal = "04";}
         if (monthVal == 5 && dayVal >=21) {signVal = "05";}
         if (monthVal == 6 && dayVal <=20) {signVal = "05";}
         if (monthVal == 6 && dayVal >=21) {signVal = "06";}
         if (monthVal == 7 && dayVal <=21) {signVal = "06";}
         if (monthVal == 7 && dayVal >=22) {signVal = "07";}
         if (monthVal == 8 && dayVal <=21) {signVal = "07";}
         if (monthVal == 8 && dayVal >=22) {signVal = "08";}
         if (monthVal == 9 && dayVal <=21) {signVal = "08";}
         if (monthVal == 9 && dayVal >=22) {signVal = "09";}
         if (monthVal == 10 && dayVal <=21) {signVal = "09";}
         if (monthVal == 10 && dayVal >=22) {signVal = "10";}
         if (monthVal == 11 && dayVal <=21) {signVal = "10";}
         if (monthVal == 11 && dayVal >=22) {signVal = "11";}
         if (monthVal == 12 && dayVal <=20) {signVal = "11";}
         if (monthVal == 12 && dayVal >=21) {signVal = "12";}

         $("#zodiacSignCd").data("kendoExtDropDownList").value(signVal);
     }
     /******************************************************
      * 별자리 처리 - 종료
      ******************************************************/


  // using addrDetlUsingYn parameter to control the address INPUT box show or not
     var addrDetlUsingYn = "Y";
     if(addrDetlUsingYn === "Y"){
         var height=435;
     }else if(addrDetlUsingYn === "N"){
         var height=420;
     }


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
                 , width:"700"
                 , height:height
                 , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
                 , content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                     , data:{
                         "autoBind":false
                         ,"addrDetlUsingYn":addrDetlUsingYn
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
         var addrGrid = $("#addrGrid").data("kendoExtGrid");
         var detalAddressData = data.addrDetl;
         var addrTp = data.addrTp;
         $.each(addrGrid.dataSource.view(), function(idx, dataItem){
             dataItem.set("flagYn", "N");
         });

         $.each(data, function(idx, row){
             $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "flagYn"            :"Y"
                 , "addrTp"          :addrTp
                 , "zipCd"           :row.zipCd
                 , "sungNm"          :row.sungNm
                 , "cityNm"          :row.cityNm
                 , "distNm"          :row.distNm
                 , "addrNm"          :""
                 , "addrDetlCont"    :detalAddressData
                 , "useYn"           :"Y"
                 , "sungCd"          :row.sungCd
                 , "cityCd"          :row.cityCd
                 , "distCd"          :row.distCd
                 , "refTableNm"      :"CR_0101T"                  //참조테이블
                 , "refKeyNm"        :custNo                     // 참조 키
             });
         });
         $("#hiddenAddrTable").show();
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


//      $("#btnSaveRelCustGrid").kendoButton({
//          click:function(e){
//              var grid = $("#gridRel").data("kendoExtGrid");

//              var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

//              if (grid.cudDataLength == 0){
//                  dms.notification.info("<spring:message code='global.info.required.change' />");
//                  return;
//              }

//              console.log(saveData);

//              if (grid.gridValidation()){
//                  $.ajax({
//                      url:"<c:url value='/crm/cif/customerInfo/multiCustomerRelChg.do' />",
//                      data:JSON.stringify(saveData),
//                      type:'POST',
//                      dataType:'json',
//                      contentType:'application/json',
//                      error:function(jqXHR,status,error){
//                         globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
//                          consoloe.log("failed!!");
//                      },
//                      success:function(jqXHR, textStatus){

//                         grid.dataSource._destroyed = [];
//                          dms.notification.info("<spring:message code='global.info.success' />");
//                          grid.dataSource.page(1);
//                      }
//                  });
//              }else{
//                  globalNotification.show("<spring:message code='global.info.check.input' />", "error");
//              }
//          }
//           , enable:false
//      });


     //$("#btnCustSearch").kendoButton({
       $("#btnCustSearch").click(function(){

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
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
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {

                 console.log(result);

                 if (result.custInfoDS.length != 0 ){

                     // Mode 변경
                     $("#pageMode").val("updateMode");

                     $("#custNm").val(result.custInfoDS[0].custNm);
                     //$("#custNm").val(result.custInfoDS[0].custNm);
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
                     $("#custHoldTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                     //$("#custHoldTpDtl").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                     $("#mathDocTp").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                     $("#ssnCrnNo").val(result.custInfoDS[0].ssnCrnNo);
                     $("#officeNm").val(result.custInfoDS[0].officeNm);
                     $("#jobCd").data("kendoExtDropDownList").value(result.custInfoDS[0].jobCd);
                     $("#bizcondCd").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                     $("#cmpScaleCont").val(result.custInfoDS[0].cmpScaleCont);
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
                     $("#marryCd").data("kendoExtDropDownList").value(result.custInfoDS[0].marryCd);
                     //$("#prefCommMthCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefCommMthCd);
                     //$("#prefCommNo").val(result.custInfoDS[0].prefCommNo);
                     //$("#siebelRowId").val(result.custInfoDS[0].siebelRowId);

                     $("input:radio [ name='prefCommMthCdRadio']:radio[value='"+result.custInfoDS[0].prefCommMthCd+"']").attr("checked", true);

//                      $("#chgBuyYn").data("kendoExtDropDownList").value(result.custInfoDS[0].chgBuyYn);
//                      $("#purcCarBrandCd").data("kendoExtDropDownList").value(result.custInfoDS[0].purcCarBrandCd);
                     $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].chinaZodiacSignCd);
                     $("#zodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].zodiacSignCd);
                     $("#bloodTp").data("kendoExtDropDownList").value(result.custInfoDS[0].bloodTp);
                     $("#dutyCd").data("kendoExtDropDownList").value(result.custInfoDS[0].dutyCd);

                     //$("#buyCnt").val(result.custInfoDS[0].buyCnt);
//                      $("#purcCarModelNm").val(result.custInfoDS[0].purcCarModelNm);
                     $("#childrenCnt").data("kendoExtNumericTextBox").value(result.custInfoDS[0].childrenCnt);
                     $("#ageDtl").data("kendoExtNumericTextBox").value(result.custInfoDS[0].ageDtl);

                     $("#docId").val(result.custInfoDS[0].docId);

                     $("#oldCustNm").val(result.custInfoDS[0].custNm);
                     $("#oldHpNo").val(result.custInfoDS[0].hpNo);
                     $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                     $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);

                     // CheckBox
                     //var bhmcYn = result.custInfoDS[0].bhmcYn;
                     var smsReceiveYn = result.custInfoDS[0].smsReceiveYn;
                     var hpNoReceiveYn = result.custInfoDS[0].hpNoReceiveYn;
                     var telReceiveYn = result.custInfoDS[0].telReceiveYn;
                     var emailReceiveYn = result.custInfoDS[0].emailReceiveYn;
                     //var dmReceiveYn = result.custInfoDS[0].dmReceiveYn;
                     //var faxReceiveYn = result.custInfoDS[0].faxReceiveYn;
                     var perInfoAgreeYn = result.custInfoDS[0].perInfoAgreeYn;
                     var perInfoUseYn = result.custInfoDS[0].perInfoUseYn;
                     var hpNoInvldYn = result.custInfoDS[0].hpNoInvldYn;
                     var hpNoAddImposYn = result.custInfoDS[0].hpNoAddImposYn;

                     //if (bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true) };
                     if (smsReceiveYn == 'Y'){ $("#smsReceiveYn").prop("checked", true) };
                     if (hpNoReceiveYn == 'Y'){ $("#hpNoReceiveYn").prop("checked", true) };
                     if (telReceiveYn == 'Y'){ $("#telReceiveYn").prop("checked", true) };
                     if (emailReceiveYn == 'Y'){ $("#emailReceiveYn").prop("checked", true) };
                     //if (dmReceiveYn == 'Y'){ $("#dmReceiveYn").prop("checked", true) };
                     //if (faxReceiveYn == 'Y'){ $("#faxReceiveYn").prop("checked", true) };
                     if (perInfoAgreeYn == 'Y'){ $("#perInfoAgreeYn").prop("checked", true) };
                     if (perInfoUseYn == 'Y'){ $("#perInfoUseYn").prop("checked", true) };
                     if (hpNoInvldYn == 'Y'){ $("#hpNoInvldYn").prop("checked", true) };
                     if (hpNoAddImposYn == 'Y'){ $("#hpNoAddImposYn").prop("checked", true) };

                     // 법인 Div Set
                     var custTpVal = result.custInfoDS[0].custTp;
                         console.log("Corporate Div!!! == > " + custTpVal);
                     if (custTpVal == '02') {

                         console.log("Corporate Div!!!");
                         //if (bhmcYn == 'Y'){ $("#bhmcYnC").prop("checked", true) };

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
                         //$("#custHoldTpDtlC").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                         $("#officeTelNoC").val(result.custInfoDS[0].officeTelNo);

                         $("#officeFaxNoC").val(result.custInfoDS[0].officeFaxNo);
                         $("#emailNmC").val(result.custInfoDS[0].emailNm);
                         $("#bizcondCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                         $("#cmpScaleContC").val(result.custInfoDS[0].cmpScaleCont);
                         $("#cmpTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                         //$("#ownRgstNm").val(result.custInfoDS[0].ownRgstNm);
                         //$("#siebelRowIdC").val(result.custInfoDS[0].siebelRowId);

                         $("#oldHpNo").val(result.custInfoDS[0].officeTelNo);
                         $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                         $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);
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

//                  var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
//                  var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
//                  var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
//                  btnAddRelCust.enable(true);
//                  btnSaveRelCustGrid.enable(true);
//                  btnDelRelCust.enable(true);

                 // 주소 조회
                 var addrGrid = $("#addrGrid").data("kendoExtGrid");
                 addrGrid.dataSource.read();

                 // 연계인 조회
                 var grid = $("#gridRel").data("kendoExtGrid");
                 //grid.setDataSource(new kendo.data.DataSource());
                 grid.dataSource.read();

                 $("#custTp").data("kendoExtDropDownList").enable(false);
                 $("#custTpC").data("kendoExtDropDownList").enable(false);

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

             });

       });



     // 초기화
     $("#btnCustReset").kendoButton({
        click:function(e){
            // kjlee
            console.log("btnCustReset 1 ");
//             var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
//             var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
//             var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
            console.log("btnCustReset 2 ");
//             btnAddRelCust.enable(false);
            console.log("btnCustReset 3 ");
//             btnSaveRelCustGrid.enable(false);
            console.log("btnCustReset 4 ");
//             btnDelRelCust.enable(false);
            console.log("btnCustReset 5 ");

            $("#pageMode").val("insertMode");

            // Reset
            $("#custNm").val("");
            $("#oldCustNm").val("");
            $("#custNo").val("");
            $("#custTp").data("kendoExtDropDownList").value("01");
            $("#custCd").data("kendoExtDropDownList").value("01");
            $("#hpNo").val("");
            $("#oldHpNo").val("");
            $("#emailNm").val("");
            $("#mngScId").val("");
            $("#mngTecId").val("");
            $("#wechatId").val("");
            $("#qqId").val("");
            $("#telNo").val("");
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
            //$("#custHoldTpDtl").data("kendoExtDropDownList").value("");
            $("#mathDocTp").data("kendoExtDropDownList").value("");
            $("#ssnCrnNo").val("");
            $("#officeNm").val("");
            $("#jobCd").data("kendoExtDropDownList").value("");
            $("#bizcondCd").data("kendoExtDropDownList").value("");
            $("#cmpScaleCont").val("");
            $("#cmpTp").data("kendoExtDropDownList").value("");
            $("#deptNm").val("");
            $("#psitNm").val("");
            $("#officeTelNo").val("");
            $("#officeFaxNo").val("");
            $("#marryDt").data("kendoExtMaskedDatePicker").value("");
            $("#birthDt").data("kendoExtMaskedDatePicker").value("");
            $("#acCareerCd").data("kendoExtDropDownList").value("");
            $("#incomeLvlCd").data("kendoExtDropDownList").value("");
            $("#custHobbys").data("kendoMultiSelect").value("");
            $("#custGroups").data("kendoMultiSelect").value("");
            $("#custTags").data("kendoMultiSelect").value("");
            $("#sexCd").data("kendoExtDropDownList").value("");
            $("#prefContactMthCd").data("kendoExtDropDownList").value("");
            $("#prefContactTimeCd").data("kendoExtDropDownList").value("");
            $("#prefCommNo").val("");
            $("#marryCd").data("kendoExtDropDownList").value("");
            $("#siebelRowId").val("");
//             $("#chgBuyYn").data("kendoExtDropDownList").value("");
//             $("#purcCarBrandCd").data("kendoExtDropDownList").value("");
            $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
            $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            $("#bloodTp").data("kendoExtDropDownList").value("");
            $("#dutyCd").data("kendoExtDropDownList").value("");
            //$("#buyCnt").val("");
//             $("#purcCarModelNm").val("");
            $("#childrenCnt").data("kendoExtNumericTextBox").value("");
            $("#ageDtl").data("kendoExtNumericTextBox").value("");

            $("#docId").val("");

            $("#oldCustNm").val("");
            $("#oldHpNo").val("");
            $("#oldMathDocTp").val("");
            $("#oldSsnCrnNo").val("");

            //$("#bhmcYn").prop("checked", false);
            $("#smsReceiveYn").prop("checked", false);
            $("#hpNoReceiveYn").prop("checked", false);
            $("#telReceiveYn").prop("checked", false);
            $("#emailReceiveYn").prop("checked", false);
            //$("#dmReceiveYn").prop("checked", false);
            //$("#faxReceiveYn").prop("checked", false);
            $("#perInfoAgreeYn").prop("checked", false);
            $("#perInfoUseYn").prop("checked", false);
            $("#hpNoInvldYn").prop("checked", false);
            $("#hpNoAddImposYn").prop("checked", false);

            // 법인 DIV Reset
            $("#custTpC").data("kendoExtDropDownList").value("");
            $("#custNmC").val("");
            $("#custNoC").val("");
            $("#custCdC").data("kendoExtDropDownList").value("");
            $("#mathDocTpC").data("kendoExtDropDownList").value("");
            $("#ssnCrnNoC").val("");
            //$("#bhmcYnC").prop("checked", false);
            $("#mngScIdC").val("");
            $("#mngTecIdC").val("");
            $("#custHoldTpC").data("kendoExtDropDownList").value("");
            //$("#custHoldTpDtlC").data("kendoExtDropDownList").value("");
            $("#officeTelNoC").val("");
            $("#officeFaxNoC").val("");
            $("#emailNmC").val("");
            $("#bizcondCdC").data("kendoExtDropDownList").value("");
            $("#cmpScaleContC").val("");
            $("#cmpTpC").data("kendoExtDropDownList").value("");
            //$("#siebelRowIdC").val();
            //$("#ownRgstNm").val("");

            $("#gridRel").data("kendoExtGrid").dataSource.data([]);
            $("#addrGrid").data("kendoExtGrid").dataSource.data([]);

            $("#custTp").data("kendoExtDropDownList").enable(true);
            $("#custTpC").data("kendoExtDropDownList").enable(true);

            $("#mathDocTp").data("kendoExtDropDownList").enable(true);
            //$("#ssnCrnNo").data("kendoMaskedTextBox").enable(true);
            $("#ssnCrnNo").attr("readOnly", false);
            $("#ssnCrnNo").removeClass("form_readonly");
            $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
            //$("#ssnCrnNoC").data("kendoMaskedTextBox").enable(true);
            $("#ssnCrnNoC").attr("readOnly", false);
            $("#ssnCrnNoC").removeClass("form_readonly");

            console.log("btnCustReset 3 ");
        }
     });

     // 저장/수정
     $("#btnCustSave").kendoButton({
         click:function(e) {

             var custTpVal = $("#custTp").data("kendoExtDropDownList").value();
             var custCdVal = $("#custCd").data("kendoExtDropDownList").value();
             var mathDocTpVal = $("#mathDocTp").data("kendoExtDropDownList").value();
             var mathDocTpCVal = $("#mathDocTpC").data("kendoExtDropDownList").value();
             var ssnCrnNoVal = $("#ssnCrnNo").val();
             var ssnCrnNoCVal = $("#ssnCrnNoC").val();
             var hpNoVal = $("#hpNo").val();

             if (custTpVal == "01") {
                 // 개인 필수 항목 체크
                 /*
                 if ( dms.string.isEmpty($("#custNm").val())) {
                     dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNm").focus();
                     return false;
                 }
                 */

                 if ( dms.string.isEmpty(hpNoVal)) {
                     dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#hpNo").focus();
                     return false;
                 }

                 if (hpNoVal.length <= 10) {
                     dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
                     $("#hpNo").focus();
                     return false;
                 }

                 /*
                 if ( dms.string.isEmpty($("#prefCommMthCd").val())) {
                     dms.notification.warning("<spring:message code='crm.lbl.prefCommMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#prefCommMthCd").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#prefCommNo").val())) {
                     dms.notification.warning("<spring:message code='crm.lbl.prefCommNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#prefCommNo").focus();
                     return false;
                 }
                 */

             } else {
                 // 법인 필수 항목 체크
                 if ( dms.string.isEmpty($("#custNmC").val())) {
                     dms.notification.warning("<spring:message code='crm.lbl.corporation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custNmC").focus();
                     return false;
                 }
                 if ( dms.string.isEmpty($("#purcMngNm").val()) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.corpPurcMng' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };
                 if ( dms.string.isEmpty($("#hpNoC").val()) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.corpPurcMngHpno' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if ($("#hpNoC").val().length <= 10) {
                     dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
                     $("#hpNoC").focus();
                     return false;
                 }

             }

             /**
              *  보유고객 등록
              *  증거유형 , 증거번호
              */
              if (custCdVal == "02"){

                  if (custTpVal == "01") {  // 개인

                      if ( dms.string.isEmpty(mathDocTpVal)){
                          dms.notification.warning("<spring:message code='global.lbl.mathDocTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                          $("#mathDocTp").focus()
                          return false;
                      }

                      if ( dms.string.isEmpty(ssnCrnNoVal)){
                          dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                          $("#ssnCrnNo").focus()
                          return false;
                      }
                  } else { // 법인
                      if ( dms.string.isEmpty(mathDocTpCVal)){
                          dms.notification.warning("<spring:message code='global.lbl.mathDocTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                          $("#mathDocTpC").focus()
                          return false;
                      }

                      if ( dms.string.isEmpty(ssnCrnNoCVal)){
                          dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                          $("#ssnCrnNoC").focus()
                          return false;
                      }

                      if (mathDocTpCVal == "10") {
                          if (ssnCrnNoCVal.length != 18) {
                              dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.lengthCheckMsg' arguments='${returnMsg}' />");
                              $("#ssnCrnNoC").focus();
                              return false;
                          }
                      }
                  }
              }

             // 주소 정보 필수 확인
             var grid = $("#addrGrid").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

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

             // 라디오 버튼에 따른 값 셋팅
             if (custTpVal == "01") {
                 var prefCommMthCdVal = $("input:radio[name='prefCommMthCdRadio']:checked").val();
                 param["prefCommMthCd"] = prefCommMthCdVal;

                 if (prefCommMthCdVal == "01") {
                     param["prefCommNo"] = $("#hpNo").val();
                 } else {

                     if ( dms.string.isEmpty($("#telNo").val())) {
                         dms.notification.warning("<spring:message code='global.lbl.homeTelNo' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                         $("#telNo").focus();
                         return false;
                     }

                     param["prefCommNo"] = $("#telNo").val();
                 }
             }

             //if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" } else { param["bhmcYn"] = "N" };
             if ($("#smsReceiveYn").prop("checked")){ param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
             if ($("#hpNoReceiveYn").prop("checked")){ param["hpNoReceiveYn"] = "Y" } else { param["hpNoReceiveYn"] = "N" };
             if ($("#telReceiveYn").prop("checked")){ param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
             if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
             //if ($("#dmReceiveYn").prop("checked")){ param["dmReceiveYn"] = "Y" } else { param["dmReceiveYn"] = "N" };
             //if ($("#faxReceiveYn").prop("checked")){ param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };
             if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
             if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };

//              if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
//                  param["chgBuyYn"] = "N";
//              }
             param["marryDt"] = $("#marryDt").data("kendoExtMaskedDatePicker").value();
             param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
             param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
             param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
             //param["custHoldTpDtl"] = $("#custHoldTpDtl").data("kendoExtDropDownList").value();
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
                 //if ($("#bhmcYnC").prop("checked")){ param["bhmcYn"] = "Y" };
                 param["mngScId"] = $("#mngScIdC").val();
                 param["mngTecId"] = $("#mngTecIdC").val();
                 param["custHoldTp"] = $("#custHoldTpC").data("kendoExtDropDownList").value();
                 //param["custHoldTpDtl"] = $("#custHoldTpDtlC").data("kendoExtDropDownList").value();
                 param["officeTelNo"] = $("#officeTelNoC").val();
                 param["officeFaxNo"] = $("#officeFaxNoC").val();
                 param["emailNm"] = $("#emailNmC").val();
                 param["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                 param["cmpScaleCont"] = $("#cmpScaleContC").val();
                 param["cmpTp"] = $("#cmpTpC").data("kendoExtDropDownList").value();
                 //param["siebelRowId"] = $("#siebelRowIdC").val();
                 param["hpNo"] = $("#hpNoC").val();
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

             if ( dms.string.isNotEmpty($("#birthDt").data("kendoExtMaskedDatePicker").value()) ) {
                 var birthDtConv = kendo.toString($("#birthDt").data("kendoExtMaskedDatePicker").value(), "<dms:configValue code='dateFormat' />");
//               birthDtConv += $("#birthDt").data("kendoExtMaskedDatePicker").value().getMonth()+1+"-";
//               birthDtConv += $("#birthDt").data("kendoExtMaskedDatePicker").value().getDate();
                 param["birthDt"] = birthDtConv;
             }else{
                 param["birthDt"] = "";
             }

             param["groupDS"] = groupDS;
             param["tagDS"] = tagDS;
             param["hobbyDS"] = hobbyDS;

             console.log("-btnCustSave-----------------");
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
                         console.log("success!!!!");
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
                 ,beforeSend:function(xhr){
                     dms.loading.show();
                 }
                 ,complete:function(xhr, status) {
                     dms.loading.hide();
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

                             var params = {};

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
                             params["sort"]                 = options.sort;

                             params["sUpperCustNo"] = $("#custNo").val();
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
//                          ,{field:"mathDocTp",         title:"<spring:message code='global.lbl.mathDocTp' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:mathDocTpList
//                                  });
//                              }
//                              , template:'#if (mathDocTp !== ""){# #= mathDocTpMap[mathDocTp]# #}#'
//                          }
//                          ,{field:"certiNum",          title:"<spring:message code='global.lbl.ssnCrnNo' />",  width:120, attributes:{"class":"ac"}}
                         ,{field:"telNo",             title:"<spring:message code='global.lbl.homeTelNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"hpNo",              title:"<spring:message code='global.lbl.hpNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"emailNm",           title:"<spring:message code='global.lbl.emailNm' />",  width:100, attributes:{"class":"al"}}
//                          ,{field:"prefCommMthCd",     title:"<spring:message code='crm.lbl.prefCommMthCd' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:prefCommMthCdList
//                                  });
//                              }
//                              , template:'#if (prefCommMthCd !== ""){# #= prefCommMthCdMap[prefCommMthCd]# #}#'
//                          }
//                          ,{field:"prefCommNo",        title:"<spring:message code='crm.lbl.prefCommNo' />",  width:100, attributes:{"class":"ac"}}
//                          ,{field:"prefContactMthCd",  title:"<spring:message code='crm.lbl.prefContactMthCd' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:prefContactMthCdList
//                                  });
//                              }
//                              , template:'#if (prefContactMthCd !== ""){# #= prefContactMthCdMap[prefContactMthCd]# #}#'
//                          }
//                          ,{field:"prefContactTimeCd", title:"<spring:message code='crm.lbl.prefContactTime' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:prefContactTimeCdList
//                                  });
//                              }
//                              , template:'#if (prefContactTimeCd !== ""){# #= prefContactTimeCdMap[prefContactTimeCd]# #}#'
//                          }
                         ,{field:"regDt",             title:"<spring:message code='global.lbl.regDt' />",  width:100, attributes:{"class":"ac"}
                            , format:"{0:<dms:configValue code='dateFormat' />}"
                         }
                     ]
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,navigatable:false
             ,filterable:false
             ,height:89
             ,editable:{
                 mode:"incell"
                 ,confirmation :false
             }
             ,pageable:false
         });


      // 주소 그리드
         $("#addrGrid").kendoExtGrid({
             gridId:"G-CRM-0628-171602"
             ,dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

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
             ,height:89
             ,navigatable:false
             ,pageable:false
             ,filterable:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
                 ,{_field:"checkbox", template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:100, attributes:{"class":"ac"},title:"<spring:message code='global.lbl.selectAddr' />"}
                 ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:200, attributes:{"class":"ac"}
                     , editor:function(container, options){
                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , dataSource:dms.data.cmmCdFilter(addrTpList)
                         });
                     }
                     , template:'#if (addrTp !== ""){# #= addrTpMap[addrTp]# #}#'
                 }       // 주소유형
                 ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:200, attributes:{"class":"al"}}       // 성
                 ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:200, attributes:{"class":"al"}}       // 도시
                 ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:150, attributes:{"class":"al"}}       // 지역
                 ,{field:"addrNm", hidden:true}       // 주소
                 ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:300, attributes:{"class":"al"}}       // 상세주소
                 ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:150, attributes:{"class":"ac"}}       // 우편번호
                 ,{field:"useYn", title:"<spring:message code='global.lbl.validYn' />", width:200, attributes:{"class":"ac"}
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
             ]

         });
});

/******************************************************
 * 띠 처리 - 시작
 ******************************************************/
function getPet(toYear) {
   console.log("toYear:" + toYear);
   var toyear = 1997; //(1997 - 내가 태어난날) % 12 합니다.
   var birthyear = toYear;
   var birthpet="Ox"
   x = (toyear - birthyear) % 12// x값을 구합니다.

   if ((x ==1) || (x == -11)) {
       birthpet="01"       //쥐띠
   } else if (x == 0) {
       birthpet="02"       //소띠
   } else if ((x == 11) || (x == -1)) {
       birthpet="03"       //호랑이띠
   } else if ((x == 10) || (x == -2)) {
       birthpet="04"       //토끼띠
   } else if ((x == 9) || (x == -3)) {
       birthpet="05"       //용띠
   } else if ((x == 8) || (x == -4)) {
       birthpet="06"       //뱀띠
   } else if ((x == 7) || (x == -5)) {
       birthpet="07"       //말띠
   } else if ((x == 6) || (x == -6)) {
       birthpet="08"       //양띠
   } else if ((x == 5) || (x == -7)) {
       birthpet="09"       //원숭이띠
   } else if ((x == 4) || (x == -8)) {
       birthpet="10"       //닭띠
   } else if ((x == 3) || (x == -9)) {
       birthpet="11"       //개띠
   } else if ((x == 2) || (x == -10)) {
       birthpet="12"       //돼지띠
   }

   $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(birthpet);

}
/******************************************************
 * 띠 처리 - 끝
 ******************************************************/

 /******************************************************
  * 별자리 처리 - 시작
  ******************************************************/
function sunSign(monthVal,dayVal) {
    console.log("monthVal:" +monthVal);
    console.log("dayVal:" +dayVal);
    var signVal;

    if (monthVal == 1 && dayVal <=19) {signVal = "12";}
    if (monthVal == 1 && dayVal >=20) {signVal = "01";}
    if (monthVal == 2 && dayVal <=18) {signVal = "01";}
    if (monthVal == 2 && dayVal >=19) {signVal = "02";}
    if (monthVal == 3 && dayVal <=20) {signVal = "02";}
    if (monthVal == 3 && dayVal >=21) {signVal = "03";}
    if (monthVal == 4 && dayVal <=20) {signVal = "03";}
    if (monthVal == 4 && dayVal >=21) {signVal = "04";}
    if (monthVal == 5 && dayVal <=20) {signVal = "04";}
    if (monthVal == 5 && dayVal >=21) {signVal = "05";}
    if (monthVal == 6 && dayVal <=20) {signVal = "05";}
    if (monthVal == 6 && dayVal >=21) {signVal = "06";}
    if (monthVal == 7 && dayVal <=21) {signVal = "06";}
    if (monthVal == 7 && dayVal >=22) {signVal = "07";}
    if (monthVal == 8 && dayVal <=21) {signVal = "07";}
    if (monthVal == 8 && dayVal >=22) {signVal = "08";}
    if (monthVal == 9 && dayVal <=21) {signVal = "08";}
    if (monthVal == 9 && dayVal >=22) {signVal = "09";}
    if (monthVal == 10 && dayVal <=21) {signVal = "09";}
    if (monthVal == 10 && dayVal >=22) {signVal = "10";}
    if (monthVal == 11 && dayVal <=21) {signVal = "10";}
    if (monthVal == 11 && dayVal >=22) {signVal = "11";}
    if (monthVal == 12 && dayVal <=20) {signVal = "11";}
    if (monthVal == 12 && dayVal >=21) {signVal = "12";}

    $("#zodiacSignCd").data("kendoExtDropDownList").value(signVal);

}
/******************************************************
 * 별자리 처리 - 종료
 ******************************************************/

/** [조회조건 영역] ComboBox Select() **/
// 정보경로에 따른 상세경로 조회
function onSelectSearchHoldTp(e){
//     $("#custHoldTpDtl").data("kendoExtDropDownList").setDataSource([]);
//     $("#custHoldTpDtl").data("kendoExtDropDownList").enable(true);
//     $("#custHoldTpDtlC").data("kendoExtDropDownList").setDataSource([]);
//     $("#custHoldTpDtlC").data("kendoExtDropDownList").enable(true);

    var dataItem = this.dataItem(e.item);
    console.log("dataItem onSelectSearchHoldTp:::::::::::::::::::");
    console.log(dataItem);
    if(dataItem.cmmCd == ""){
//         $("#custHoldTpDtl").data("kendoExtDropDownList").setDataSource([]);
//         $("#custHoldTpDtl").data("kendoExtDropDownList").enable(false);
//         $("#custHoldTpDtlC").data("kendoExtDropDownList").setDataSource([]);
//         $("#custHoldTpDtlC").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
        ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
        ,async:false
    });
//     $("#custHoldTpDtl").data("kendoExtDropDownList").setDataSource(responseJson.data);
//     $("#custHoldTpDtlC").data("kendoExtDropDownList").setDataSource(responseJson.data);
}


</script>







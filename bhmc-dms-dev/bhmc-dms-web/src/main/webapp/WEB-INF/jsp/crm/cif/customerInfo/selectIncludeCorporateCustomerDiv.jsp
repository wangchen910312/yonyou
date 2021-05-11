<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

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
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corporation" /></span></th> <!-- 고객명 -->
                                <td>
                                    <div class="form_search">
                                    <input id="custNmSearchC" name="custNmSearchC" type="text" value="" class="form_input" />
                                    <input id="custNmC" name="custNmC" type="hidden" value="" class="form_input" data-json-obj="true" />
                                    <!--
                                        <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /></a>
                                    -->
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
<%--                                 <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th> <!-- 대표자명 --> --%>
<!--                                 <td> -->
<!--                                     <input id="ownRgstNm" name="ownRgstNm"  type="text" class="form_input" maxlength="30" data-json-obj="true" /> -->
<!--                                 </td> -->
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMng" /></span></th> <!-- 구매담당자명 -->
                                <td>
                                    <input id="purcMngNm" name="purcMngNm" type="text" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.mathDocTp" /></span></th> <!-- 증거유형 -->
                                <td>
                                    <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.ssnCrnNo" /></span></th> <!-- 증거번호 -->
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
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 담당SC -->
                                <td class="readonly_area">
                                    <input id="mngScNmC" name="mngScNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngScIdC" name="mngScIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" style="display:none;"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area" style="display:none;">
                                    <input id="mngTecNmC" name="mngTecNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecIdC" name="mngTecIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.custSourceLocation" /></th> <!-- 정보출처 -->
                                <td>
                                    <input id="custHoldTpC" name="custHoldTpC" class="form_comboBox" data-json-obj="true" />
                                    <div class="form_float" style="display:none;">
                                        <div class="form_right">
                                            <input id="custHoldTpDtlC" name="custHoldTpDtlC" class="form_comboBox" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.taxpayerNo" /></th> <!-- 납세인식별번호 -->
                                <td>
                                    <input id="taxpayerNo" name="taxpayerNo" class="form_input numberandalpha" maxlength="40" data-json-obj="true" />
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
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 대표전화 -->
                                <td>
                                    <input id="officeTelNoC" name="officeTelNoC" type="text" value="" class="form_input"  data-type="tel" maxlength="30" pattern="\d" data-json-obj="true" />
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
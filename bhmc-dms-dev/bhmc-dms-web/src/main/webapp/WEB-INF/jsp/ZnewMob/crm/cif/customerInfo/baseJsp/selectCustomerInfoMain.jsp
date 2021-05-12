<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- content -->
<section id="content">
<!-- content_search -->
    <section id="content_search" class="content_search" style="display:;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.lbl.custSearchCondition" /><!-- 고객검색조건--></h2>
        </div>
        <div id="custSearchTabDiv"> <!--  고객조회 TAB - 시작 -->
            <!-- content_pop_list -->
            <section id="content_pop_list" style="display:none;">
                <div class="listarea">
                    <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustSearchListPopup.jsp"></c:import>
                    <!-- <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                </div>
            </section>

            <!-- content_pop_search(고객)-->
            <section id="content_pop_search" class="content_pop_search">
               <div class="formarea">
                    <table class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                         <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /></th>
                                    <td>
                                        <div class="f_text"><input type="search" id="psCustNm"  class="form_input" value=""/></div><!-- 李鎭五 -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custTp' /></th>
                                    <td>
                                        <div class="f_text">
                                        <input type="text" id="psCustTp" name="psCustTp"  class="form_comboBox" />
                                        </div>
                                    </td>
                                </tr>
                                <tr hidden>
                                    <th scope="row"><spring:message code='crm.lbl.scId' /></th>
                                    <td>
                                        <div class="f_text">
                                        <input type="text" id="psMngScId" name="psMngScId"  class="form_comboBox" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custCd' /></th>
                                    <td>
                                        <div class="f_text">
                                        <input type="text" id="psCustCd" name="psCustCd"  class="form_comboBox" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /></th>
                                    <td>
                                        <div class="f_text"><input type="number" class="numberic" id="psHpNo" class="form_input" /></div>
                                    </td>
                                </tr>
                                <tr class="orderRegDt">
                                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.saleDt' /></span></th>    <!-- 주문등록일 -->
                                    <td class="f_term">
                                        <div class="f_item01" style = "width:82%">
                                            <input type="date" id="sRegStartDt" style="background-color:#ffffff;"/>
                                            <!-- <input type="search" id="psSaleDtFrom" value=""  />
                                            <span class="date" onclick="calpicker('psSaleDtFrom')">날짜</span> -->
                                        </div>
                                        <span class="termtext"> ∼</span>
                                        <div class="f_item01" style = "width:82%">
                                            <input type="date" id="psSaleDtTo" style="background-color:#ffffff;" />
                                            <!-- <input type="search" id="psSaleDtTo" value=""  />
                                            <span class="date" onclick="calpicker('psSaleDtTo')">날짜</span> -->
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <dms:access viewId="VIEW-D-12773" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                    </dms:access>
                </div>
            </section>
        </div> <!--  고객조회 TAB - 끝-->
        </section>
        <!-- content_seach end -->


        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
                </div>

                <!-- 기본정보  -->
                <div id="customerForm" name="customerForm" onsubmit="return false;">
                <div id="personalDiv">
                    <div class="co_group">
                        <div class="formarea">
                            <table class="flist01">
                                <caption></caption>
                                <colgroup>
                                    <col style="width:34%;">
                                    <col style="">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="required"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                            <input type="text" id="custTp" name="custTp" data-json-obj="true"  class="form_comboBox" readonly="readonly" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                        <td>
                                            <div class="f_text f_required">
                                                <input type="text" id="custNm" name="custNm" data-json-obj="true" />
                                                <input type="hidden" id="docId" name="docId" data-json-obj="true" />
                                                <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" />
                                                <input type="hidden" id="seq" name="seq" />
                                                <input id="pageMode" name="pageMode" type="hidden" value="updateMode" data-json-obj="true" disabled="disabled"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" id="custNo" name="custNo" data-json-obj="true" readonly="readonly" />
                                                <input id="oldCustNm" name="oldCustNm" type="hidden" value="" data-json-obj="true" readonly="readonly"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custCd" /><!-- 잠재/보유고객 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" id="custCd" name="custCd" class="form_comboBox" data-json-obj="true" readonly="readonly" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.sex" /><!-- 성별 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                            <input type="text" id="sexCd" name="sexCd" class="form_comboBox" data-json-obj="true" readonly="readonly" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!--증서유형 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                            <input type="text" id="mathDocTp" name="mathDocTp" class="form_comboBox" />
                                            <input id="oldMathDocTp" name="oldMathDocTp" type="hidden" value="" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!--증서번호 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="ssnCrnNo" name="ssnCrnNo" placeholder=" ">
                                                <input id="oldSsnCrnNo" name="oldSsnCrnNo" type="hidden" value="" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                        <th scope="row"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC 여부 --></th>
                                        <td>
                                            <input type="checkbox" id="bhmcYn" name="check01" class="f_check f_disabled" unchecked readOnly="readOnly"  data-json-obj="true" /><label for="bhmcYn"></label>
                                            <input id="siebelRowId" name="siebelRowId" type="hidden" value="" class="form_input form_readonly" readonly="readonly" data-json-obj="true" />
                                        </td>
                                    </tr> --%>
                                    <tr>
                                        <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                                        <td >
                                            <div class="f_text f_disabled">
                                                <input id="mngScNm" name="mngScNm" type="text" value=""  class="form_comboBox" readonly="readonly"  />
                                                <input id="mngScId" name="mngScId" type="hidden" value=""  data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                        <th scope="row"><spring:message code="global.lbl.prsnSA" /><!-- 담당SA --></th>
                                        <td >
                                            <div class="f_text f_disabled">
                                                <input id="mngTecNm" name="mngTecNm" type="text" value="" class="form_comboBox"  readonly="readonly" />
                                                <input id="mngTecId" name="mngTecId" type="hidden" value="" class="form_input"  readonly="readonly" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr> --%>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custHoldTp" /><!-- 정보출처 --></th>
                                        <td>
                                            <div class="f_text">
                                            <input type="text" id="custHoldTp" name="custHoldTp" class="" data-json-obj="true"  />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="display:none;" >
                                        <th scope="row"></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                            <input type="text" id="custHoldTpDtl" name="custHoldTpDtl" class="" data-json-obj="true" readonly="readonly"/>
                                            </div>
                                        </td>
                                    <tr>
                                        <th scope="row"  class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                        <td>
                                            <div class="f_itemexe01">
                                                <div class="f_text f_disabled">
                                                    <input type="text" value="" id="hpNo" name="hpNo" placeholder="" readonly="readonly" maxlength="20" data-json-obj="true" style="width: 55%"/><img src="<c:url value='/resources/img/mob/btn_popphone2.png' />" style="width: 40%" usemap="#001" id="mapImg">
                                                    <map name="001">
                                                        <dms:access viewId="VIEW-D-12772" hasPermission="${dms:getPermissionMask('READ')}">
                                                        <area shape="rect" coords="0,0,26,34" href="#" id="mapTel" />
                                                        </dms:access>
                                                        <dms:access viewId="VIEW-D-12771" hasPermission="${dms:getPermissionMask('READ')}">
                                                        <area shape="rect" coords="30,0,64,34" id="mapSMS" />
                                                        </dms:access>
                                                    </map>
                                                    <input id="oldHpNo" name="oldHpNo" type="hidden" value="" data-json-obj="true" />
                                                </div>
                                                <dms:access viewId="VIEW-D-12770" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="btn_itemexe_off" id="smsReceiveYn" name="smsReceiveYn" value="N" data-json-obj="true"><spring:message code="global.lbl.reject" /><!-- 거부 --></span>
                                                </dms:access>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" ><spring:message code="global.lbl.homeTelNo" /><!-- 집전화 --></th>
                                        <td>
                                            <div class="f_itemexe01">
                                                <div class="f_text ">
                                                    <input type="text" value="" id="telNo" name="telNo" placeholder=""  maxlength="20" data-json-obj="true" />
                                                </div>
                                                <dms:access viewId="VIEW-D-12770" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="btn_itemexe_off" id="telReceiveYn" name="telReceiveYn" value="N" data-json-obj="true"><spring:message code="global.lbl.reject" /><!-- 거부 --></span>
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12769" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="btn_itemexe_off" id="dmReceiveYn" name="dmReceiveYn" value="N" style="display: none;"></span>
                                                </dms:access>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"  class="required"></th>
                                        <td>
                                            <input type="checkbox" id="hpNoInvldYn" name="hpNoInvldYn" class="f_check" data-json-obj="true"/><label for="hpNoInvldYn"><spring:message code="global.lbl.hpNoInvld" /><!-- 휴대폰번호 무효 --></label>
                                            <input type="checkbox" id="hpNoAddImposYn" name="hpNoAddImposYn" class="f_check" data-json-obj="true"/><label for="hpNoAddImposYn"><spring:message code="global.lbl.hpNoAddImpos" /><!-- 휴대폰번호 수정불가 --></label>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 직장전화 --></th>
                                        <td>
                                            <div class="f_itemexe01">
                                                <div class="f_text">
                                                    <input type="number" class="numberic" value="" id="officeTelNo" name="officeTelNo" placeholder="" maxlength="20" data-json-obj="true" />
                                                </div>
                                                <!-- <span class="btn_itemexe_off" id="faxReceiveYn" name="faxReceiveYn" value="N" data-json-obj="true" >거부</span> -->
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <th scope="row"><spring:message code="global.lbl.fax" /><!-- FAX --></th>
                                        <td>
                                            <div class="f_itemexe01">
                                                <div class="f_text">
                                                    <input type="text" id="officeFaxNo" name="officeFaxNo" placeholder="" maxlength="20" data-json-obj="true" />
                                                </div>
                                                <dms:access viewId="VIEW-D-12768" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="btn_itemexe_off" id="faxReceiveYn" name="faxReceiveYn" value="N" data-json-obj="true" ><spring:message code="global.lbl.reject" /><!-- 거부 --></span>
                                                </dms:access>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.email" /><!-- E-Mail --></th>
                                        <td>
                                            <div class="f_itemexe01">
                                                <div class="f_text">
                                                    <input id="emailNm" name="emailNm" type="email" placeholder="" maxlength="40" data-json-obj="true" />
                                                </div>
                                                <dms:access viewId="VIEW-D-12767" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="btn_itemexe_off" id="emailReceiveYn" name="emailReceiveYn" value="N" data-json-obj="true" ><spring:message code="global.lbl.reject" /><!-- 거부 --></span>
                                                </dms:access>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">We-Chat ID</th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="wechatId" name="wechatId" placeholder="" maxlength="20" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.qq" /><!-- QQ --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="qqId" name="qqId" placeholder="" maxlength="20" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <th scope="row" class="required"><spring:message code="global.lbl.prefCommMthCd" /><!-- 선호연락방법 --></th>
                                        <td>
                                            <div class="f_text f_required">
                                            <input type="text" id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <th scope="row" class="required"><spring:message code="global.lbl.prefCommNo" /><!-- 선호연락처 --></th>
                                        <td>
                                            <div class="f_text f_required">
                                                <input type="text" id="prefCommNo" name="prefCommNo" maxlength="20" pattern="\d" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <th scope="row"><spring:message code="global.lbl.prefContactMthCd" /><!-- 우선연락방식 --></th>
                                        <td>
                                            <div class="f_text">
                                            <input type="text" id="prefContactMthCd" name="prefContactMthCd" class="form_comboBox" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <th scope="row"><spring:message code="global.lbl.prefContactTime" /></th> <!-- 우선연락시간 -->
                                        <td>
                                            <div class="f_text">
                                            <input type="text" id="prefContactTimeCd" name="prefContactTimeCd" class="form_comboBox" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //개인 기본정보 END-->
                </div>



                <div id="corporateDiv"  style="display:none"> <!-- corporateDiv Start -->
                    <div class="co_group">
                        <div class="formarea">
                            <table class="flist01">
                                <caption>고객 기본정보입니다. </caption>
                                <colgroup>
                                    <col style="width:34%;">
                                    <col style="">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                            <input type="text" id="custTpC" name="custTpC"  data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                        <td>
                                            <div class="f_text f_required">
                                                <input type="text" id="custNmC" name="custNmC" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" id="custNoC" name="custNoC" data-json-obj="true" readonly="readonly" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custCd" /><!-- 잠재/보유고객 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" id="custCdC" name="custCdC"  data-json-obj="true" readonly="readonly" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.ownRgstNm" /><!-- 대표자명 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" id="ownRgstNm" name="ownRgstNm" maxlength="30" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input id="mathDocTpC" name="mathDocTpC" class=""  data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value=""  maxlength="30" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC 여부 --></th>
                                        <td>
                                            <input type="checkbox" id="bhmcYnC" name="bhmcYnC" class="f_check f_disabled" unchecked readonly="readonly"  data-json-obj="true" /><label for="bhmcYnC"></label>
                                            <input id="siebelRowIdC" name="siebelRowIdC" type="hidden" value="" class="form_input form_readonly" readonly="readonly" data-json-obj="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 담당SC --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input id="mngScNmC" name="mngScNmC" type="text" value="" class=""  readonly="readonly" />
                                                <input id="mngScIdC" name="mngScIdC" type="hidden" value="" class="form_input form_readonly"  readonly="readonly" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.prsnSA" /><!-- 담당SA --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input id="mngTecNmC" name="mngTecNmC" type="text" value="" class=""  readonly="readonly" />
                                                <input id="mngTecIdC" name="mngTecIdC" type="hidden" value="" class="form_input form_readonly"  readonly="readonly" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custHoldTp" /><!-- 정보출처 --></th>
                                        <td>
                                            <div class="f_text ">
                                            <input type="text" id="custHoldTpC" name="custHoldTpC"  class="" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                            <input type="text" id="custHoldTpDtlC" name="custHoldTpDtlC" class="" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="required"><spring:message code="global.lbl.officeTelNo" /><!-- 대표전화 --></th>
                                        <td>
                                            <div class="f_text f_required">
                                                <input type="number" class="numberic" id="officeTelNoC" name="officeTelNoC" readonly="readonly" maxlength="30" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                        <td>
                                            <div class="f_text">
                                                <input id="officeFaxNoC" name="officeFaxNoC" type="text" value=""  maxlength="20" data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 대표 E-MAIL ? --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="emailNmC" name="emailNmC" maxlength="40" data-json-obj="true"  />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                        <td>
                                            <div class="f_text">
                                            <input id="bizcondCdC" name="bizcondCdC" class="form_comboBox"  data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                        <td>
                                            <div class="f_text">
                                                <input id="cmpScaleContC" name="cmpScaleContC" class="form_comboBox"  data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                                        <td>
                                            <div class="f_text">
                                            <input id="cmpTpC" name="cmpTpC" class="form_comboBox"  data-json-obj="true" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                                        <td>
                                            <div class="f_item01">
                                                <input type="text" id="custGroupsC" name="custGroupsC" value="" class="">
                                                <dms:access viewId="VIEW-D-12766" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="search" id="btnAddGroupsC" ><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                                </dms:access>
                                                <input type="hidden" id="custGroupsCSeq" name="custGroupsCSeq"  />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                                        <td>
                                            <div class="f_item01">
                                                <input type="text" id="custTagsC" name="custTagsC" value="" class="">
                                                <dms:access viewId="VIEW-D-12765" hasPermission="${dms:getPermissionMask('READ')}">
                                                <span class="search" id="btnAddTagsC"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                                </dms:access>
                                                <input type="hidden" id="custTagsCSeq" name="custTagsCSeq" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>  <!-- corporateDiv End -->

                </div>
                <!-- // 기본정보  -->

                <div id="personalDetailDiv">
                    <!-- 개인 상세정보  -->
                    <div class="co_group">
                        <div class="content_title">
                            <h2><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보 --></h2>
                            <div class="title_btn">
                                <span class="co_open"><span>상세내용 접기 </span></span>
                                <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
                            </div>
                        </div>
                        <div class="co_view">
                            <div class="formarea">
                                <div class="agreement">
                                    <input type="checkbox" id="perInfoAgreeYn" name="perInfoAgreeYn" class="f_check" /><label for="perInfoAgreeYn"><spring:message code="global.lbl.infoAgreedocId" /><!-- 정보활동 동의서 동의 --></label>
                                    <input type="checkbox" id="perInfoUseYn" name="perInfoUseYn" class="f_check" /><label for="perInfoUseYn"><spring:message code="global.lbl.infoUsrYn" /><!-- 정보 사용 동의 --></label>
                                </div>
                                <table class="flist01">
                                    <caption>고객 상세정보 </caption>
                                    <colgroup>
                                        <col style="width:34%;">
                                        <col style="">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.buyAddCnt' /></th> <!-- 추가구매  -->
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="buyCnt" name="buyCnt" data-json-obj="true"  />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.chgBuy' /></th> <!-- 교환구매  -->
                                            <td>
                                                <div class="f_text">
                                                <input id="chgBuyYn" name="chgBuyYn" class="form_comboBox" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td>
                                                <div class="f_text">
                                                <input id="purcCarBrandCd" name="purcCarBrandCd" class="form_comboBox" data-json-obj="true" />
                                                </div  >
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td>
                                                <div class="f_text">
                                                    <input id="purcCarModelNm" name="purcCarModelNm" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.birthday" /></th> <!--  생일 -->
                                            <td>
                                                <div class="f_item01">
                                                    <input type="date" id="birthDt" style="background-color:#ffffff;"/>
                                                    <!-- <input type="search" id="birthDt" name="birthDt" value="" data-json-obj="true" />
                                                    <span class="date" onclick="calpicker('birthDt')">날짜선택</span> -->
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.age" /></th> <!-- 나이 -->
                                            <td>
                                                <div class="f_text">
                                                    <input id="ageDtl" name="ageDtl" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.chinaZodiacSign" /></th> <!-- 띠 -->
                                            <td>
                                                <div class="f_text">
                                                <input id="chinaZodiacSignCd" name="chinaZodiacSignCd" class="form_comboBox"  data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.zodiacSign" /></th> <!-- 별자리 -->
                                            <td>
                                                <div class="f_text">
                                                <input id="zodiacSignCd" name="zodiacSignCd" class="form_comboBox"  data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.bloodTp" /></th> <!--  혈액형 -->
                                            <td>
                                                <div class="f_text"><input id="bloodTp" name="bloodTp" class="form_comboBox"  data-json-obj="true" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.marryYn" /></th> <!-- 결혼여부 -->
                                            <td>
                                                <div class="f_text"><input id="marryCd" name="marryCd" class="form_comboBox"  data-json-obj="true" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.marryDt" /></th> <!-- 결혼기념일 -->
                                            <td>
                                                <div class="f_item01">
                                                    <input type="date" id="birthDt" style="background-color:#ffffff;"/>
                                                    <!-- <input type="search" id="marryDt" name="marryDt" value="" class="">
                                                    <span class="date" onclick="calpicker('marryDt')">날짜선택</span> -->
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.childrenCnt" /></th> <!-- 자녀수 -->
                                            <td>
                                                <div class="f_item02">
                                                    <input id="childrenCnt" name="childrenCnt" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                                            <td>
                                                <div class="f_item01">
                                                    <input type="text" id="custGroups" name="custGroups" value="" class="">
                                                    <dms:access viewId="VIEW-D-12775" hasPermission="${dms:getPermissionMask('READ')}">
                                                    <span class="search" id="btnAddGroups"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                                    </dms:access>
                                                    <input type="hidden" id="custGroupsSeq" name="custGroupsSeq" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                                            <td>
                                                <div class="f_item01">
                                                    <input type="text" id="custTags" name="custTags"  value="" class="form_comboBox">
                                                    <dms:access viewId="VIEW-D-12774" hasPermission="${dms:getPermissionMask('READ')}">
                                                    <span class="search" id="btnAddTags"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                                    </dms:access>
                                                    <input type="hidden" id="custTagsSeq" name="custTagsSeq" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.officeNm" /></th> <!-- 직장명 -->
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="officeNm" name="officeNm" type="text" value="" data-json-obj="true" placeholder="" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                            <td>
                                                <div class="f_text"> <input id="bizcondCd" name="bizcondCd" class="form_comboBox"  data-json-obj="true" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                            <td>
                                                <div class="f_text">
                                                    <input id="cmpScaleCont" name="cmpScaleCont" class="form_comboBox"  data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                                            <td>
                                                <div class="f_text">
                                                <input id="cmpTp" name="cmpTp" class="form_comboBox"  data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.job" /><!-- 직업군 --></th>
                                            <td>
                                                <div class="f_text"><input type="text" id="jobCd" name="jobCd" class="form_comboBox" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                           <th scope="row"><spring:message code="global.lbl.deptNm" /></th> <!-- 부서 -->
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="deptNm" name="deptNm"  placeholder="" data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.jobNm" /></th> <!-- 직무 -->
                                            <td>
                                                <div class="f_text">
                                                <input id="dutyCd" name="dutyCd" class="form_comboBox"  data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- // 개인 상세정보  -->
                </div>

                <!-- common info  -->
                <!-- 주소  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoAddressList.jsp"></c:import>
                <!-- <iframe id="addressList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 주소  -->

                <!-- 연계인  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoRelList.jsp"></c:import>
                <!-- <iframe id="relList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 연계인  -->

                <!-- 보유차량  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoCarList.jsp"></c:import>
                <!-- <iframe id="haveCarList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 보유차량  -->

                <!-- 추적이력 -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerSalesOpptTraceMgmtList.jsp"></c:import>
                <!-- <iframe id="traceList" border="0" frameborder="0" width="100%" height="200"></iframe> -->
                <!-- // 추적이력  -->


                <!-- 회전기록 -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectSalesOpptProcessMgmtHistList.jsp"></c:import>
                <!-- <iframe id="leadStatusExchangeList" border="0" frameborder="0" width="100%" height="200"></iframe> -->
                <!-- 회전기록 -->

                <!-- 정비이력  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoRepairOrderList.jsp"></c:import>
                <!-- <iframe id="lbrList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 정비이력  -->

                <!-- 딜러 멤버십  -->
                <div class="co_group">
                    <div class="content_title">
                        <h2><spring:message code='global.lbl.dlrMbrShip' /><!-- 딜러 멤버십 --></h2>
                        <div class="title_btn">
                            <span class="co_open co_close" id="btnDlrMbrShipSearch"><span>상세내용 보기 </span></span>
                            <!-- <span class="co_close"><span>상세내용 접기</span></span> -->
                        </div>
                    </div>
                    <div class="co_view" style="display:none;">
                        <div class="formarea">
                            <table class="flist01">
                                <caption>딜러 멤버십 정보</caption>
                                <colgroup>
                                    <col style="width:40%;">
                                    <col style="">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.membershipNo' /><!-- 멤버십 번호 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" id="membershipNo" name="membershipNo" class="form_comboBox" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.dlrMbrShipReg' /><!-- 딜러 멤버십 등급 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" value="" id="gradeCd" name="" disabled="disabled">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.savePointAble' /><!-- 적립 포인트(가용) --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" value="" id="usePoint" disabled="disabled">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.chargePointAble' /><!-- 충전 포인트(가용) --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" value="" id="chargeUsePoint" disabled="disabled">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.joinDt' /><!-- 가입일 --></th>
                                        <td>
                                            <div class="f_text f_disabled">
                                                <input type="text" value="" id="joinDt" disabled="disabled">
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 포인트이력 -->
                        <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoMemberShipList.jsp"></c:import>
                        <!-- <iframe id="dlrMbrShipList" border="0" frameborder="0" width="100%" ></iframe> -->

                        <!-- 충전카드이력 -->
                        <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoMembershipCardHisList.jsp"></c:import>
                        <!-- <iframe id="dlrMbrShipCardList" border="0" frameborder="0" width="100%"></iframe> -->
                    </div>
                </div>
                <!-- // 딜러 멤버십  -->

                <!-- 블루 멤버십  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoBlueList.jsp"></c:import>
                <!-- <iframe id="blueMbrShipList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 블루 멤버십  -->

                <!-- 보험정보  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerIncSearchList.jsp"></c:import>
                <!-- <iframe id="incList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 보험정보  -->

                <!-- 금융정보  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerFincSearchList.jsp"></c:import>
                <!-- <iframe id="fincList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 금융정보  -->

                <!-- 용품정보  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerAccessoryList.jsp"></c:import>
                <!-- <iframe id="accessoryList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 용품정보  -->

                <!-- 고객 정보변경 이력  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoChangeList.jsp"></c:import>
                <!-- <iframe id="infoUpdHistList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 고객 정보변경 이력  -->

                <!-- 비고  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoMemoList.jsp"></c:import>
                <!-- <iframe id="memoList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 비고  -->

                <!-- 계약 이력  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoContactList.jsp"></c:import>
                <!-- <iframe id="contractList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 계약 이력  -->

                <!-- 첨부파일  -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoFileList.jsp"></c:import>
                <!-- <iframe id="fileList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- // 첨부파일  -->

                <!-- 메시지 -->
                <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerMsgList.jsp"></c:import>
                <!-- <iframe id="msgList" border="0" frameborder="0" width="100%" height="300"></iframe> -->
                <!-- //메시지 -->

                <!-- 버튼 2개  -->
                <div class="con_btnarea btncount2">
                    <%-- <div><span class="btnd1t2" id="btnCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div> --%>
                    <dms:access viewId="VIEW-D-13111" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1" id="btnCancel"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12762" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
                    </dms:access>
                </div>
            </section>
        </div>
    </section>
    <!-- content end -->

     <!-- 메모  layerPopup-->
    <section class="lay_pop" id="lay_04" style="display:none;left:25px;top:930px">
        <div class="lay_title">
            <h1><spring:message code='global.lbl.memo' /><!-- 메모 --></h1>
        </div>
        <div class="lay_cont" id="memoPopContentForm">
            <div class="formarea">
                <table class="flist01">
                    <caption>문자전송 내용 입력</caption>
                    <colgroup>
                        <col style="width:100%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>
                                <div class="f_text"><input type="text"  id="memoTp" name="memoTp" class="form_comboBox"  data-json-obj="true" /></div><!--  -->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" id="popShareYn" name="popShareYn" class="f_check" checked data-json-obj="true" /><label for="popShareYn"><spring:message code='global.lbl.closed' /><!-- 비공개 --></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea rows="4" cols="" class="f_textarea"  id="memoCont" name="memoCont" placeholder="" data-json-obj="true"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btnarea">
            <span class="btnd1t2" onclick="layerClose('#lay_04')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>
            <dms:access viewId="VIEW-D-12761" hasPermission="${dms:getPermissionMask('READ')}">
            <span class="btnd1" id="insertPopMemo" ><spring:message code='global.btn.save' /><!-- 저장 --></span>
            </dms:access>
        </div>
    </section>
    <!--  // 메모  -->

    <!-- 그룹/태그  layerPopup-->
    <section class="lay_pop" id="lay_05" >
        <div class="lay_title">
            <h1>그룹선택</h1>
        </div>
        <div class="lay_cont">
            <ul class="grouplist">
            </ul>
        </div>
        <div class="btnarea">
            <span class="btnd1t2" onclick="layerClose('#lay_05')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>
            <dms:access viewId="VIEW-D-12760" hasPermission="${dms:getPermissionMask('READ')}">
            <span class="btnd1" id="btnSetGroups"><spring:message code='global.btn.save' /><!-- 저장 --></span>
            </dms:access>
        </div>
    </section>
    <!--  // 그룹/태그  -->


    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>



<!-- script -->
<script>
//Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
var tabSel = "${tabSel}";
var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

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

var custTpList              = [{"cmmCd":"" , "cmmCdNm":"<spring:message code='global.lbl.all' />"}];
var custTpMap         = [];
var cardTpCdList              = [];
var cardTpCdMap         = [];
var custCdList              = [];
var custCdMap = [];
var custHoldTpList          = [];
var custHoldTpDtlList       = [];
var sexCdList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var sexCdMap                = [];
var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var mathDocTpList           = [];
var mbrGradeCdList          = [];
var mathDocTpListC          = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var pconTpList              = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var addrTpList              = [];
var ageCdList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var driverTpList            = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var jobCdList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var cmpTpList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var acCareerCdList          = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var marryYnList             = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var prefCommMthCdList       = [];
var chgBuyYnDS              = [];
var chgBuyYnMap             = [];
var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var purcCarBrandCdMap       = [];
var chinaZodiacSignCdDS     = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var zodiacSignCdDS          = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var bloodTpDS               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];
var dutyCdDS                = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.all' />", "useYn":""}];


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

var isSaved="N";

chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

// 메모유형
var memoTpDS = [];
var memoTpMap = [];
<c:forEach var="obj" items="${memoTpDS}">
   memoTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   memoTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 성동활률 DS
var succPrbCdDs = [];
var succPrbCdArr = [];
<c:forEach var="obj" items="${succPrbCdList}">
   succPrbCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
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
   saleOpptSrcCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
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
   saleOpptStepCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
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
   trsfStatCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
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
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
roTpCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
// 정비이력 RO유형 -- 끝

//계약유형 SAL003
var contractTpDSList = [];
var contractTpObj = {};
<c:forEach var="obj" items="${contractTpList}">
   contractTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//계약상태 SAL002 (배정, 출고요청 만 표시)
var contractStatDSList = [];
var contractStatObj = {};
<c:forEach var="obj" items="${contractStatList}">
   contractStatDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   contractStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//통화상태
<c:forEach var="obj" items="${callStatCdList}">
callStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
callStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${leadSrcList}">
leadSrcList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//계약상태
<c:forEach var="obj" items="${statList}">
statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
statMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//교환구매 브랜드
<c:forEach var="obj" items="${purcCarBrandCdDS}">
purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
purcCarBrandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${chinaZodiacSignCdDS}">
chinaZodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${zodiacSignCdDS}">
zodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//혈액형
<c:forEach var="obj" items="${bloodTpDS}">
bloodTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${dutyCdDS}">
dutyCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객유형
<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//블루멤버십- 포인트발생내역
<c:forEach var="obj" items="${pointCdList}">
pointCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${cardTpCdList}">
cardTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
cardTpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//잠재/보유고ㄱ
<c:forEach var="obj" items="${custCdList}">
custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//선호연락방법
<c:forEach var="obj" items="${prefCommMthCdList}">
prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//고객확보유형
<c:forEach var="obj" items="${custHoldTpList}">
custHoldTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${custHoldTpDtlList}">
custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
</c:forEach>

//성별
<c:forEach var="obj" items="${sexCdList}">
sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

<c:forEach var="obj" items="${mbrGradeCdList}">
mbrGradeCdList.push({"cmmCd":"${obj.gradeSeq}" , "cmmCdNm":"${obj.gradeNm}"});
</c:forEach>
//신분증유형
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
addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//연령
<c:forEach var="obj" items="${ageCdList}">
ageCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//주운전자
<c:forEach var="obj" items="${driverTpList}">
driverTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//직업군
<c:forEach var="obj" items="${jobCdList}">
jobCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//업종
<c:forEach var="obj" items="${bizcondCdList}">
bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사규모
<c:forEach var="obj" items="${cmpScaleContList}">
cmpScaleContList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사유형
<c:forEach var="obj" items="${cmpTpList}">
cmpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${acCareerCdList}">
acCareerCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//결혼여부
<c:forEach var="obj" items="${marryYnList}">
marryYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//우선연락방식
<c:forEach var="obj" items="${prefContactMthCdList}">
prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//우선연락시간
<c:forEach var="obj" items="${prefContactTimeCdList}">
prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//평균차량교체시기
<c:forEach var="obj" items="${avgCarChgCdList}">
avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//그룹
var custGroupsMap = [];
<c:forEach var="obj" items="${custGroups}">
custGroups.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
custGroupsMap["${obj.grpSeq}"] = "${obj.grpNm}";
</c:forEach>

//태그
var custTagsMap = [];
<c:forEach var="obj" items="${custTags}">
custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
custTagsMap["${obj.grpSeq}"] = "${obj.grpNm}";
</c:forEach>

<c:forEach var="obj" items="${custHobbys}">
custHobbys.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
</c:forEach>

//신차구분
var ncarDstinCdMap = [];
<c:forEach var="obj" items="${ncarDstinCdList}">
ncarDstinCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//보험회사 Array
var incCmpCdMap = {};
<c:forEach var="obj" items="${incCmpCdList}">
    incCmpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//블루멤버십등급
var mLevelList = [];
var mLevelMap ={};
<c:forEach var="obj" items="${mLevelList}">
    mLevelList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    mLevelMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//용품업무유형
var goodsTpList = [];
var goodsTpMap ={};
<c:forEach var="obj" items="${goodsTpList}">
goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
goodsTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//용품판매상태
var contractStatCdList = [];
var contractStatCdMap ={};
<c:forEach var="obj" items="${contractStatCdList}">
contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
contractStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

///
var userList = [];
 <c:choose>
    <c:when test="${mngScIdCtrl eq 'N'}">
    userList.push({"usrId":"${userId}", "usrNm":"${userNm}"});
    </c:when>
    <c:otherwise>
        <c:forEach var="obj" items="${userList}">
        userList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
        </c:forEach>
    </c:otherwise>
</c:choose>
// 그리드에서 목록 선택시 선택값 세팅
var setDataItem; //고객
var setDataItem2; //정보

var searchAddr = false;
var searchRel = false;
var searchCar = false;
var searchActive = false;
var searchLead = false;
var searchTrace = false;
var searchLeadStatusExchange =false;
var searchSales = false;
var searchLbr = false;
var searchDlr = false;
var searchBlue = false;
var searchInc = false;
var searchFinc = false;
var searchAccessory = false;
var searchHiss = false;
var searchMemo = false;
var searchRemark = false;
var searchInfo = false;
var searchContract = false;
var searchFile = false;
var searchMsg = false;


$(document).ready(function() {

    setDataItem = null ;// 화면 로딩시 초기화
    setDataItem2 = null ;// 화면 로딩시 초기화
    function initPage(){
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
    }


    /*************************************************************
    드랍다운 리스트 셋팅
    *************************************************************/


//////
    var defaultPsMngScIdIndex=0;
    for(var i=0; i<userList.length; i++){
        if(userList[i].usrId == userId){
            defaultPsMngScIdIndex=i+1;
        }
        if(userList.length>2){
            defaultPsMngScIdIndex=0;
        }
    }
    $("#psMngScId").kendoExtDropDownList({
        dataTextField:"usrNm"
        , dataValueField:"usrId"
        , dataSource:userList
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , index:defaultPsMngScIdIndex
     });

    $("#psCustCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:custCdList
        , index:0
    });

     //////
    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#psCustTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:custTpList
        , index:1
    });

    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:custTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
            } else {
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                $("#personalDiv").hide();
                $("#personalDetailDiv").hide();

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
                $("#personalDetailDiv").show();
                $("#corporateDiv").hide();
            } else {
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
            }
        }
        , enable:false
    });

    // 성별 드랍다운 리스트.
    $("#sexCd, #psSexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        , dataSource:sexCdList
        , index:0
    });

    // 잠재/보유고객      custCd              (CRM023)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:custCdList
        , index:0
        //,  value:"01"
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
        }
    });
    $("#custCd").data("kendoExtDropDownList").value("01");

    // 잠재/보유고객      custCdC              (CRM023)
    $("#custCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:custCdList
        , index:0
        , value:"01"
    });
    $("#custCdC").data("kendoExtDropDownList").value("01");


 // 선호연락방법       prefCommMthCd (CRM022)
     $("#prefCommMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
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
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:mathDocTpList
       , index:0
   });

    // 신분증유형            mathDocTpC       (CRM024)
    $("#mathDocTpC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:mathDocTpListC
       , index:0
   });
 // 고객확보유형1      custHoldTp      (CRM008)
    $("#custHoldTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
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
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:custHoldTpDtlList
       , index:0
       , enable:false
   });

    // 고객확보유형1      custHoldTpC      (CRM008)
    $("#custHoldTpC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
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
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:custHoldTpDtlList
       , index:0
       , enable:false
   });

// 직업군                  jocCd                   (CRM002)
    $("#jobCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:jobCdList
       , index:0
   });

// 업종                  bizcondCd
    $("#bizcondCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:bizcondCdList
       , index:0
   });

// 회사규모                  cmpScaleContList       (CRM026)
    $("#cmpScaleCont").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:cmpScaleContList
       , index:0
   });

// 회사유형                  cmpTp
    $("#cmpTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:cmpTpList
       , index:0
   });

// 업종                  bizcondCdC
    $("#bizcondCdC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
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
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:cmpTpList
       , index:0
   });


// 주 운전자                driverTp            (CRM015)
    $("#driverTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:driverTpList
       , index:0
   });

// 연령                       ageCd                 (CRM014)
    $("#ageCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:ageCdList
       , index:0
   });

// 학력                       acCareerCd      (CRM012)
    $("#acCareerCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:acCareerCdList
       , index:0
   });

// 소득수준             incomeLvlCd     (CRM013)
    $("#incomeLvlCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:incomeLvlCdList
       , index:0
   });

 // 우선연락방식                       prefContactMthCd    (CRM038)
    $("#prefContactMthCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:prefContactMthCdList
       , index:0
   });

// 우선연락시간                       prefContactTimeCd      (CRM027)
    $("#prefContactTimeCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:prefContactTimeCdList
       , index:0
   });

// 결혼여부                       marryYnList          (CRM028)
    $("#marryCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:marryYnList
       , index:0
   });

// 평균차량 교체 시기                       avgCarChgCdList    (CRM029)
    $("#avgCarChgCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:avgCarChgCdList
       , index:0
   });

    //교환구매여부
    $("#chgBuyYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:chgBuyYnDS
        , index:0
    });
//교환구매 브랜드
    $("#purcCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:purcCarBrandCdDS
        , index:0
    });
    //띠
    $("#chinaZodiacSignCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:chinaZodiacSignCdDS
        , index:0
    });

    //별자리
    $("#zodiacSignCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:zodiacSignCdDS
        , index:0
    });

    //혈액형
    $("#bloodTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:bloodTpDS
        , index:0
    });

    $("#dutyCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , dataSource:dutyCdDS
        , index:0
    });

    // 딜러멤버십 등급
    $("#gradeCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.all' />"
       , dataSource:mbrGradeCdList
       , index:0
       , enable:false
    });

    //메모 유형
    $("#memoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:memoTpDS
        , index:0
    });

    // 멤버십번호
    $("#membershipNo").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , change:function(){
            var cmmCd = this.dataItem(this.select()).cmmCd;

            $.ajax({
                url:"<c:url value='/mob/crm/cif/customerInfo/selectMembershipInfoByKey.do' />"
                ,data:JSON.stringify({"sMembershipNo":cmmCd})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            }).done(function(result) {
                $("#gradeCd").data("kendoExtDropDownList").value(result.gradeCd);
                $("#usePoint").val(result.lastPointVal);
                $("#chargeUsePoint").val(result.realTotAmt);
                $("#joinDt").val(chgDate2Str(result.regDt));
            });
        }
    });

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.custSearch' />"); // 고객조회

    // 버튼 - 조회(고객)
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sUsrId = $("#sUsrId");
            var sUsrNm = $("#sUsrNm");
            var sEmpNo = $("#sEmpNo");

            var custNm = $("#psCustNm");
            var custTp = $("#psCustTp").data("kendoExtDropDownList").value();
            var hpNo = $("#psHpNo");
            var telNo = $("#psTelNo");

            //날짜 공백시 메시지 출력
            var psSaleDtFrom= $("#psSaleDtFrom").val();
            var psSaleDtTo=$("#psSaleDtTo").val();
            if ( (dms.string.isNotEmpty(psSaleDtFrom) && dms.string.isEmpty(psSaleDtTo)) ||
                    (dms.string.isEmpty(psSaleDtFrom) && dms.string.isNotEmpty(psSaleDtTo))
            ){
               mob.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
               return false;
            }

          //조회버튼 클릭 시점에 contentList2()함수와 동일 기능 구현
            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");
            $("#header_title span").addClass("search_open");
            $(".tabarea").css("display","none");

            //
            var html = "";
            html += "<h2><spring:message code='global.lbl.custInfo' /></h2>";
            html += "<div class=\'title_btn\'>";
            html += "</div>";
            $("#content_search > .content_title").html(html);

            initList();
            listData.read();
        }
    });

    if(custNo.length > 15){
        $("#custNo").val(custNo);
        $("#btnSearch").click();
    }

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        //리스트 -> 고객조회
        if($("#content_pop_list").css("display") == "block"){
            $("#content_pop_search").css("display","block");
            $("#content_pop_list").css("display","none");
            $("#custNo").val("");

            var html = "";
            html += "<h2><spring:message code='global.lbl.custSearchCondition' />(<spring:message code='global.lbl.custInfo' />)<!-- 고객검색조건(고객정보)   --></h2> ";
            $("#content_search > .content_title").html(html);

            $("#header_title span").removeAttr("class");
        }

        //상세 -> 리스트
        else if ($("#content_detail").css("display") == "block") {
            $("#content_detail").css("display","none");
            $("#content_search").css("display","block");
            $("#content_pop_list").css("display","block");
            contentList(isSaved);
            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");
            $("#custNo").val("");
            isSaved="N";
        }

        else{
            mob.loading.show();
            goMain();
        }
    });

    //e-mail 수신거부
    $("#emailReceiveYn, #faxReceiveYn, #smsReceiveYn, #telReceiveYn").click(function(){
        changeClass(this);
    });

    //주소정보 iframe
    $("#btnAddrSearch").click(function(){
        searchAddressList();
        searchAddr = true;
    });

    //연계인(추가기능) gridRel
    $("#btnRelSearch").click(function(){
        if(!searchRel){
            searchRelList();
            searchRel = true;
        }
    });

    $("#btnCarSearch").click(function(){
        if(!searchCar){
          //보유차량 haveCarGrid
          subListData3.read();
          searchCar = true;
        }
    });



    $("#btnTraceSearch").click(function(){
        if(!searchLead){
            //추적 gridLead
            subListData4.read();
            searchTrace = true;
        }
    });

    $("#btnLeadStatusExchangSearch").click(function(){
        if(!searchLead){
            //회전 gridLead
            subListData5.read();
            searchLeadStatusExchange = true;
        }
    });

    $("#btnActiveSearch").click(function(){
        if(!searchActive){
            searchActive = true;
        }
    });

    $("#btnLbrSearch").click(function(){
        if(!searchLbr){
            //정비이력 lbrGrid
            subListData6.read();
            searchLbr = true;
        }
    });

    $("#btnDlrMbrShipSearch").click(function(){
        if(!searchDlr){
            //딜러멤버십 dlrMbrShipGrid
            var sCustNo = $("#custNo").val();
            if ( dms.string.isEmpty(sCustNo)){
                mob.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                $("#custNo").focus();
                return false;
            };

            $.ajax({
                url:"<c:url value='/mob/crm/cif/customerInfo/selectMemberships.do' />"
                ,data:JSON.stringify({"sCustNo":sCustNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                },success:function(result){
                    $("#membershipNo").data("kendoExtDropDownList").value("");
                    $("#gradeCd").data("kendoExtDropDownList").value("");
                    $("#usePoint").val("");
                    $("#chargeUsePoint").val("");
                    $("#joinDt").val("");

                    var resultCnt = result.total;
                    var membershipNoDDL = $("#membershipNo").data("kendoExtDropDownList");
                    var membershipNoDs = [];
                    var membershipNo;

                    if ( resultCnt === 1 ) {

                        membershipNo = result.data[0].membershipNo;
                        membershipNoDs.push({"cmmCdNm":membershipNo, "cmmCd":membershipNo})
                        membershipNoDDL.setDataSource(membershipNoDs);
                        membershipNoDDL.value(membershipNo);
                        membershipNoDDL.enable(false);

                        $("#gradeCd").data("kendoExtDropDownList").value(result.data[0].gradeCd);
                        $("#usePoint").val(result.data[0].lastPointVal);
                        $("#chargeUsePoint").val(result.data[0].realTotAmt);
                        $("#joinDt").val(result.data[0].regDt);

                    } else if ( resultCnt > 1 ) {

                        $.each(result.data, function(index, data){
                            membershipNoDs.push({"cmmCdNm":data.membershipNo, "cmmCd":data.membershipNo})
                        });

                        membershipNoDDL.setDataSource(membershipNoDs);
                        membershipNoDDL.select(0);
                        membershipNoDDL.trigger("change");

                    };

                }
            }).done(function(result) {
                if(result.total > 0){
                    subListData7.read();
                    subListData8.read();
                }
                searchDlr = true;
            });
        }
    });

    $("#btnBlueMbrShipSearch").click(function(){
        if(!searchBlue){
            if ( dms.string.isEmpty($("#custNo").val())){
                dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                $("#custNo").focus();
                return false;
            }

            var param = {};

            param["sCustNo"] = $("#custNo").val();

          //블루 멤버십 blueMbrShipGrid
          subListData9.read();

            searchBlue = true;
        }
    });

    $("#btnIncSearch").click(function(){
        if(!searchInc){
            //보험정보 incGrid
            subListData10.read();
            searchInc = true;
        }
    });

    $("#btnFincSearch").click(function(){
        if(!searchFinc){
            //금융정보 incGrid
            subListData11.read();
            searchFinc = true;
        }
    });

    $("#btnAccessorySearch").click(function(){
        if(!searchAccessory){
            //용품정보 incGrid
            subListData12.read();
            searchAccessory = true;
        }
    });

    $("#btnInfoHissSearch").click(function(){
        if(!searchHiss){
            //고객 정보변경 이력 infoUpdHistGrid
            subListData13.read();
            searchHiss = true;
        }
    });

    $("#btnMemoSearch").click(function(){
        if(!searchMemo){
            //메모(추가기능) memoGrid
            searchMemoList();
            searchMemo = true;
        }
    });

    $("#btnRemarkSearch").click(function(){
        if(!searchRemark){
            //비고
            searchRemark = true;
        }
    });


    $("#btnSndInfoSearch").click(function(){
        if(!searchInfo){
            searchInfo = true;
        }
    });

    $("#btnContractSearch").click(function(){
        if(!searchContract){
            //계약이력 contractGrid
            subListData15.read();
            searchContract = true;
        }
    });

    $("#btnFileSearch").click(function(){
        if(!searchFile){
            //첨부파일
            subListData16.read();
            searchFile = true;
        }
    });

    $("#btnMsgSearch").click(function(){
        if(!searchMsg){
            subListData17.read();
            searchMsg = true;
        }
    });

    $("#mapSMS").click(function(){
        sendSMSPopup();
    });



}); //end document ready
//jhg
//주소
function searchAddressList(){
    subListData.read();
}
//연계인
function searchRelList(){
    subListData2.read();
}

//비고
function searchMemoList(){
    subListData14.read();
}

//수신거부 선택 클래스 변경
function changeClass(obj){
    var className = $(obj).attr("class");
    if(className != 'undefined' && className != null) {
        var newClassNm = "";
        if(className.indexOf("off") > -1){
            newClassNm = "btn_itemexe_on";
            $(obj).val("Y");
            $(obj).text("<spring:message code='global.lbl.recv' />");
            //
        }else{
            newClassNm = "btn_itemexe_off";
            $(obj).val("N");
            $(obj).text("<spring:message code='global.lbl.reject' />");
        }
        $(obj).attr("class", newClassNm);
    }
}
</script>

<script>

function contentSearchCheck(){
    if ($("#custSearchTabDiv").css("display") == "block") { contentSearch(); }
}

//목록페이지 보기 (고객)
function contentList(_isSaved) {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");
  $("#header_title span").addClass("search_open");

  if(_isSaved=="Y"){
      listData.read();
  }

}

//검색페이지 보기(고객)
function contentSearch() {
  $("#content_pop_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_pop_search").css("display","block");
  $("#content_search").css("display","block");

  $("#custSearchTab").addClass("on");
}

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_pop_list").css("display","none");
    $("#content_pop_search").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");

    var custNo = dataItem.custNo;
    if ( dms.string.isEmpty(custNo)){
        mob.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
        $("#custNo").focus();
        return false;
    }

    //초기화
    custReset();

    // form 데이터
    var param = {};
    param["sCustNo"] = custNo; // $("#custNo").val();
    param["sSearchRange"] = "MY";

    mob.loading.show();
    $.ajax({
        url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
    }).done(function(result) {
        //console.log(result);

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
            try{
                var userAgent = navigator.userAgent.toLowerCase();
                if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                    || (userAgent.search("ipad") > -1))
                {
                    $("#mapTel").attr("href","telprompt://"+result.custInfoDS[0].hpNo);
                }else
                {
                    $("#mapTel").attr("href","tel:"+result.custInfoDS[0].hpNo);
                }
            }catch(e){
            }
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
            $("#officeSungCd").val(result.custInfoDS[0].officeSungCd);
            $("#officeCityCd").val(result.custInfoDS[0].officeCityCd);
            $("#officeRegionCd").val(result.custInfoDS[0].officeRegionCd);
            $("#officeRegionCdRead").val(result.custInfoDS[0].officeRegionCdRead);
            $("#officeZipCd").val(result.custInfoDS[0].officeZipCd);
            $("#officeAddr1").val(result.custInfoDS[0].officeAddr1);
            $("#idSungCd").val(result.custInfoDS[0].idSungCd);
            $("#idCityCd").val(result.custInfoDS[0].idCityCd);
            $("#idRegionCd").val(result.custInfoDS[0].idRegionCd);
            $("#idRegionCdRead").val(result.custInfoDS[0].idRegionCdRead);
            $("#idZipCd").val(result.custInfoDS[0].idZipCd);
            $("#idAddr1").val(result.custInfoDS[0].idAddr1);
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
            $("#officeFaxNo").val(result.custInfoDS[0].officeFaxNo);    //fax 번호
            $("#birthDt").val(chgDate2Str(result.custInfoDS[0].birthDt));      // 생일
            $("#marryDt").val(chgDate2Str(result.custInfoDS[0].marryDt));      // 결혼기념일
            $("#birthDt").val(result.custInfoDS[0].birthDt);      // 생일
            $("#sexCd").data("kendoExtDropDownList").value(result.custInfoDS[0].sexCd);
            $("#prefContactMthCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactMthCd);  //선호연락방법
            $("#prefContactTimeCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactTimeCd);    //선호연락시간
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

            $("#childrenCnt").val(result.custInfoDS[0].childrenCnt);        //자녀수
            $("#ageDtl").val(result.custInfoDS[0].ageDtl);      //나이

            $("#docId").val(result.custInfoDS[0].docId);
            $("#dlrCd").val(result.custInfoDS[0].dlrCd);

            $("#oldCustNm").val(result.custInfoDS[0].custNm);
            $("#oldHpNo").val(result.custInfoDS[0].hpNo);
            $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
            $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);
            $("#seq").val(result.custInfoDS[0].salesOpptSeq);

            $("#blueJoinDt").val(chgDate2Str(result.custInfoDS[0].blueMembershipJoinDt));
            $("#blueMembershipNo").val(result.custInfoDS[0].blueMembershipNo);
            $("#blueAvlbPointVal").val(result.custInfoDS[0].blueAvlbPointVal);
            $("#blueGradeCd").val(blueGradeCdChg(result.custInfoDS[0].blueGradeNm));

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

            if (smsReceiveYn == 'Y'){ changeClass("#smsReceiveYn");}   //휴대폰 수신거부
            if (telReceiveYn == 'Y'){ changeClass("#telReceiveYn") };   //집전화 수신거부
            if (dmReceiveYn == 'Y'){ changeClass("#dmReceiveYn") };
            if (emailReceiveYn == 'Y'){ changeClass("#emailReceiveYn") };   //email
            if (faxReceiveYn == 'Y'){ changeClass("#faxReceiveYn") };       //fax

            if (hpNoInvldYn == 'Y'){ $("#hpNoInvldYn").prop("checked", true) };
            if (hpNoAddImposYn == 'Y'){ $("#hpNoAddImposYn").prop("checked", true) };

            //개인정보동의여부
            if (perInfoAgreeYn == 'Y'){ $("#perInfoAgreeYn").prop("checked", true) };
            if (perInfoUseYn == 'Y'){ $("#perInfoUseYn").prop("checked", true) };

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
                $("#personalDetailDiv").hide();
                $("#corporateDiv").show();

            } else {
                $("#personalDiv").show();
                $("#personalDetailDiv").show();
                $("#corporateDiv").hide();

                console.log("tab Chk  personalDiv!!!");
            }

            mob.loading.hide();
        }

        groupDS = result.groupDS;
        if (result.groupDS.length != 0 ){
            groupSeq = "";
            var  groupVal = "";
            var groupDsItem;
            for(i=0 ;  i < result.groupDS.length ; i++){
                groupDsItem = result.groupDS[i];
                if (i==0){
                    groupSeq = groupDsItem.grpSeq;
                    groupVal = custGroupsMap[groupDsItem.grpSeq];

                }else{
                    groupSeq = groupSeq+","+groupDsItem.grpSeq;
                    groupVal = groupVal +", "+custGroupsMap[groupDsItem.grpSeq];
                }
            }

            if (result.custInfoDS[0].custTp == '01') {
                $("#custGroups").val(groupVal);
            } else {
                $("#custGroupsC").val(groupVal);
            }
        }

        tagDS = result.tagDS;
        if (result.tagDS.length != 0 ){
            tagSeq = "";
            var tagVal = "";
            var tagDsItem;
            for(i=0 ;  i < result.tagDS.length ; i++){
                tagDsItem = result.tagDS[i];
                if (i==0){
                    tagSeq = tagDsItem.grpSeq;
                    tagVal = custTagsMap[tagDsItem.grpSeq];
                }else{
                    tagSeq = tagSeq+","+tagDsItem.grpSeq;
                    tagVal = tagVal+", "+custTagsMap[tagDsItem.grpSeq];
                }
            }

            if (result.custInfoDS[0].custTp == '01') {
                $("#custTags").val(tagVal);
            } else {
                $("#custTagsC").val(tagVal);
            }
        }

        //비활성
        $("#custNm, #custNmC, #hpNo, #prefCommMthCd, #prefCommNo, #chgBuyYn, #buyCnt, #purcCarBrandCd, #purcCarModelNm").attr("readOnly", true);
        $("#custNm, #custNmC, #hpNo, #prefCommMthCd, #prefCommNo, #chgBuyYn, #buyCnt, #purcCarBrandCd, #purcCarModelNm ").parent().addClass("f_disabled");
        $("#prefCommMthCd").data("kendoExtDropDownList").enable(false);
        $("#chgBuyYn").data("kendoExtDropDownList").enable(false);
        $("#purcCarBrandCd").data("kendoExtDropDownList").enable(false);

        $("#prefCommMthCd, #custCd").parent().parent().addClass("f_disabled");

        if ( dms.string.isNotEmpty(result.custInfoDS[0].mathDocTp) && dms.string.isNotEmpty(result.custInfoDS[0].ssnCrnNo) ) {
            $("#mathDocTp").data("kendoExtDropDownList").enable(false);
            $("#ssnCrnNo").attr("readOnly", true);
            $("#mathDocTpC").data("kendoExtDropDownList").enable(false);
            $("#ssnCrnNoC").attr("readOnly", true);
        }

    });
  }

//초기화
function custReset(){
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
    $("#marryDt").val("");
    $("#birthDt").val("");
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
    $("#childrenCnt").val("");
    $("#ageDtl").val("");

    $("#docId").val("");
    $("#dlrCd").val("");

    $("#oldCustNm").val("");
    $("#oldHpNo").val("");
    $("#oldMathDocTp").val("");
    $("#oldSsnCrnNo").val("");

    $("#custGroups").val("");
    $("#custTags").val("");

    $("#bhmcYn").prop("checked", false);

    $("#smsReceiveYn").attr("class", "btn_itemexe_off");
    $("#telReceiveYn").attr("class", "btn_itemexe_off");
    $("#dmReceiveYn").attr("class", "btn_itemexe_off");
    $("#emailReceiveYn").attr("class", "btn_itemexe_off");
    $("#faxReceiveYn").attr("class", "btn_itemexe_off");

    $("#perInfoAgreeYn").prop("checked", false);    //개인정보 사용거부
    $("#perInfoUseYn").prop("checked", false);      //개인정보 활용동의

    $("#hpNoInvldYn").prop("checked", false);       //휴대폰번호 무효
    $("#hpNoAddImposYn").prop("checked", false);    //휴대폰번호 수정불가

    $("#custTp").data("kendoExtDropDownList").value("01");
    $("#custCd").data("kendoExtDropDownList").value("01");

    $("#mathDocTp").data("kendoExtDropDownList").enable(true);
    $("#ssnCrnNo").attr("readOnly", false);
    $("#ssnCrnNo").removeClass("form_readonly");
    $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
    $("#ssnCrnNoC").attr("readOnly", false);
    $("#ssnCrnNoC").removeClass("form_readonly");

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

    //그리드 검색 초기화
    searchAddr = false;
    searchRel = false;
    searchCar = false;
    searchActive = false;
    searchLead = false;
    searchTrace = false;
    searchLeadStatusExchange =false;
    searchSales = false;
    searchLbr = false;
    searchDlr = false;
    searchBlue = false;
    searchInc = false;
    searchFinc = false;
    searchAccessory = false;
    searchHiss = false;
    searchMemo = false;
    searchRemark =false;
    searchInfo = false;
    searchContract = false;
    searchFile = false;
    searchMsg = false;

    // 컨텐츠 접기
    $(".content_title > .title_btn > span.co_open").each(function(){
        $(this).parent().parent().next(".co_view").hide();
        $(this).addClass('co_close');
    });
}

  //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            confirmOpen(confirmMsgSave,'doSave',y,n);
        }
    });

   //버튼- 취소
   $("#btnCancel").kendoButton({
       click:function(e){
           //리스트 -> 고객조회
           if($("#content_pop_list").css("display") == "block"){
               $("#content_pop_search").css("display","block");
               $("#content_pop_list").css("display","none");

               var html = "";
               html += "<h2><spring:message code='global.lbl.custSearchCondition' />(<spring:message code='global.lbl.custInfo' />)<!-- 고객검색조건(고객정보)   --></h2> ";
               $("#content_search > .content_title").html(html);

               $("#header_title span").removeAttr("class");
           }


           //상세 -> 리스트
           else if ($("#content_detail").css("display") == "block") {
               $("#content_detail").css("display","none");
               $("#content_search").css("display","block");
               $("#content_pop_list").css("display","block");
               contentList(isSaved);
               $("#content_pop_search").css("display","none");
               $("#content_pop_list").css("display","block");
               $("#custNo").val("");
               isSaved="N";
           }

           else{
               goMain();
           }

       }
   });
  //버튼 -저장 callback
  function doSave(){
      var custTpVal = $("#custTp").data("kendoExtDropDownList").value();

      // 화면 필수 체크
      // 고객번호
      if ( dms.string.isEmpty($("#custNo").val())){
          mob.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
          $("#custNo").focus();
          return false;
      }

      if (custTpVal == "01") {

          if ( dms.string.isEmpty($("#hpNo").val())) {
              mob.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
              $("#hpNo").focus();
              return false;
          }

          if ( dms.string.isEmpty($("#prefCommMthCd").val())) {
              mob.notification.warning("<spring:message code='global.lbl.prefCommMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
              $("#prefCommMthCd").focus();
              return false;
          }

          if ( dms.string.isEmpty($("#prefCommNo").val())) {
              mob.notification.warning("<spring:message code='global.lbl.prefCommNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
              $("#prefCommNo").focus();
              return false;
          }
      } else {
       // 법인 필수 항목 체크

          if ( dms.string.isEmpty($("#custNmC").val())) {
               mob.notification.warning("<spring:message code='global.lbl.corporation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
               $("#custNmC").focus();
               return false;
           }
          if ( dms.string.isEmpty($("#officeTelNoC").val())) {
              mob.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
              $("#officeTelNoC").focus();
              return false;
          }
      }

      // form 데이터
      var param =
          $("#customerForm").serializeObject(
              $("#customerForm").serializeArrayInSelector("[data-json-obj='true']")
          );

      if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" } else { param["bhmcYn"] = "N" };

      //수신여부
      if($("#smsReceiveYn").hasClass("btn_itemexe_on")){param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
      if($("#telReceiveYn").hasClass("btn_itemexe_on")){param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
      if($("#emailReceiveYn").hasClass("btn_itemexe_on")){param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
      if($("#faxReceiveYn").hasClass("btn_itemexe_on")){param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };

      //개인정보동의
      if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
      if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };

      //휴대폰번호 무효
      if ($("#hpNoInvldYn").prop("checked")){ param["hpNoInvldYn"] = "Y" } else { param["hpNoInvldYn"] = "N" };
      //휴대폰번호 수정불가
      if ($("#hpNoAddImposYn").prop("checked")){ param["hpNoAddImposYn"] = "Y" } else { param["hpNoAddImposYn"] = "N" };

      if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
          param["chgBuyYn"] = "N";
      }

      param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
      param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
      param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
      param["custHoldTpDtl"] = $("#custHoldTpDtl").data("kendoExtDropDownList").value();
      param["ssnCrnNo"] = $("#ssnCrnNo").val();

      param["oldCustNm"] = $("#oldCustNm").val();
      param["oldHpNo"] = $("#oldHpNo").val();
      param["oldMathDocTp"] = $("#oldMathDocTp").val();
      param["oldSsnCrnNo"] = $("#oldSsnCrnNo").val();

      param["custNo"] = $("#custNo").val();

      param["buyCnt"] = $("#buyCnt").val();
      param["chgBuyYn"] = $("#chgBuyYn").data("kendoExtDropDownList").value();
      param["purcCarBrandCd"] = $("#purcCarBrandCd").data("kendoExtDropDownList").value();
      param["purcCarModelNm"] = $("#purcCarModelNm").val();
      param["chinaZodiacSignCd"] = $("#chinaZodiacSignCd").data("kendoExtDropDownList").value();
      param["zodiacSignCd"] = $("#zodiacSignCd").data("kendoExtDropDownList").value();
      param["bloodTp"] = $("#bloodTp").data("kendoExtDropDownList").value();
      param["marryCd"] = $("#marryCd").data("kendoExtDropDownList").value();
      param["officeNm"] = $("#officeNm").val();
      param["bizcondCd"] = $("#bizcondCd").data("kendoExtDropDownList").value();
      param["cmpScaleCont"] = $("#cmpScaleCont").data("kendoExtDropDownList").value();
      param["cmpTp"] = $("#cmpTp").data("kendoExtDropDownList").value();
      param["jobCd"] = $("#jobCd").data("kendoExtDropDownList").value();
      param["deptNm"] = $("#deptNm").val();
      param["dutyCd"] = $("#dutyCd").data("kendoExtDropDownList").value();

      param["birthDt"] = $("#birthDt").val();
      param["marryDt"] = $("#marryDt").val();
      param["childrenCnt"] = $("#childrenCnt").val();
      param["ageDtl"] = $("#ageDtl").val();

      param["commandTp"] = "CUSTDTLUPDATE";

      var selectedGroups = $("#custGroupsSeq").val().split(", ");
      groupDS = [];
      makeGroupObj(selectedGroups, groupDS, "001");

      var selectedTags = $("#custTagsSeq").val().split(", ");
      tagDS = [];
      makeGroupObj(selectedTags, tagDS, "002");

//      console.log(param);
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

          var selectedGroups = $("#custGroupsCSeq").val().split(", ");
          makeGroupObj(selectedGroups, groupDS, "001");

          var selectedTags = $("#custTagsCSeq").val().split(", ");
          makeGroupObj(selectedTags, tagDS, "002");
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


      param["groupDS"] = groupDS;
      param["tagDS"] = tagDS;

      param.ageDtl = parseInt(param.ageDtl);
      param.childrenCnt = parseInt(param.childrenCnt);
      param.marryDt = chgDateTimeStamp(param.marryDt);

      mob.loading.show();
      $.ajax({
          url:url
          ,data:JSON.stringify(param)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR,status,error){
              mob.loading.hide();
              var errorJsonType = JSON.parse(jqXHR.responseText);
              /* mob.notification.error("<spring:message code='global.err.mobSystemError'/>"); */
              mob.notification.error(errorJsonType.errors[0].errorMessage);
          },
          success:function(result){
              mob.loading.hide();
              if (result["custNo"] != ""){
                  mob.notification.success("<spring:message code='global.info.success'/>");
                  doSaveAddressList();
                  $("#custNo").val(result["custNo"]);
              }

          }
      }).done(function(result) {
          isSaved="Y";
      });
  }
  //address 저장
  function saveAddressList(){
      confirmOpen(confirmMsgSave,'doSaveAddressList',y,n);
  }
  function doSaveAddressList(){
   // 주소 정보 필수 확인
      if(searchAddr){
          var dataSource = subListData;

          var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

          var total = saveData.deleteList.length + saveData.insertList.length + saveData.updateList.length;
          if (total == 0){
              mob.notification.info("<spring:message code='global.info.required.change' />");
              return;
          }

          mob.loading.show();
          $.ajax({
              url:"<c:url value='/crm/cmm/addressInfo/multiAddressInfo.do' />",
              data:JSON.stringify(saveData),
              type:'POST',
              dataType:'json',
              contentType:'application/json',
              error:function(jqXHR,status,error){
                  mob.loading.hide();
                  mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              },
              success:function(jqXHR, textStatus){
                  mob.loading.hide();
                  //mob.notification.info("<spring:message code='global.info.success' />");

                  searchAddressList();
              }
          });

      }
  }
  //relList 저장
  function saveRelList(){
      var dataSource = subListData2;

      var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

      var total = saveData.deleteList.length + saveData.insertList.length + saveData.updateList.length;
      if (total == 0){
          mob.notification.info("<spring:message code='global.info.required.change' />");
          return;
      }

          mob.loading.show();
          $.ajax({
              url:"<c:url value='/crm/cif/customerInfo/multiCustomerRelChg.do' />",
              data:JSON.stringify(saveData),
              type:'POST',
              dataType:'json',
              contentType:'application/json',
              error:function(jqXHR,status,error){
                  mob.loading.hide();
                  mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              },
              success:function(jqXHR, textStatus){
                  mob.loading.hide();
                  mob.notification.info("<spring:message code='global.info.success' />");

                  searchRelList();
              }
          });
  }

  //memo 저장
  function saveMemoList(){

      var dataSource = subListData14;

      var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

      var total = saveData.deleteList.length + saveData.insertList.length + saveData.updateList.length;
      if (total == 0){
          mob.notification.info("<spring:message code='global.info.required.change' />");
          return;
      }

      mob.loading.show();
      $.ajax({
          url:"<c:url value='/crm/cif/customerInfo/multiCustomerMemoChg.do' />",
          data:JSON.stringify(saveData),
          type:'POST',
          dataType:'json',
          contentType:'application/json',
          error:function(jqXHR,status,error){
              mob.loading.hide();
              mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
          },
          success:function(jqXHR, textStatus){
              mob.loading.hide();
              mob.notification.info("<spring:message code='global.info.success' />");

          }
      });

  }

//버튼 - 주소  추가
var zipCodeSearchPopupWin;
$("#btnAddAddress").click(function(){

  if(searchAddr){

      zipCodeSearchPopupWin = mob.window.popup({
          windowId:"zipCodeSearchPopupMain"
          , content:{
              url:"<c:url value='/mob/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
              , data:{
                  "autoBind":false
                  ,"usrNm":""
                  , "callbackFunc":function(data){

                      if (data != null || data != 'undefined') {
                          addrAddItemSubList1(data);
                      }
                  }
              }
          }
      })
  }
});


// 고객 검색 팝업
var popupWindow  ;
$("#btnCustSearch").click(function(){
    if(searchRel ){
        popupWindow = mob.window.popup({
            windowId:"customerSearchPopupMain"
            , content:{
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if ( dms.string.isNotEmpty(data.custNo) ) {
                            //연계인list 추가
                            relAddItemSubList1(data);
                        }
                    }
                }
            }
        })
    }
});

//메모 추가 팝업
$("#btnAddMemo").click(function(){
    pushLayer('#lay_04');
});
//메모추가
$("#insertPopMemo").click(function(){
    var param =
        $("#memoPopContentForm").serializeObject(
            $("#memoPopContentForm").serializeArrayInSelector("[data-json-obj='true']")
        );

    if ($("#popShareYn").prop("checked")){ param["shareYn"] = "Y" } else { param["shareYn"] = "N" };

    //메모list 추가
    memoAddItemSubList1(param);

    //팝업닫기
    layerClose('#lay_04');
});

//그룹선택 팝업
 var id = this.id;

//그룹선택 팝업
 var id = this.id;
$("#btnAddGroups, #btnAddTags, #btnAddGroupsC, #btnAddTagsC").click(function(){
    pushLayer('#lay_05');

    id = this.id;
    if(id == "btnAddGroups" || id == "btnAddGroupsC"){

        $("#lay_05 > div > h1").text("태그선택");/* 태그선택 */

        var txt = "" ;
        var grpSeq = "";
        var classTag = "\'on\'";

        $.each(custGroups, function(index, data){   //전체 group
            $.each(groupDS, function(i, ds){    //선택한 group
                grpSeq = ds.grpSeq;
                if(grpSeq == data.grpSeq){
                    txt += "<li><span class="+classTag+" value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";

                    return false;
                }
            });
            if(grpSeq != data.grpSeq){
                txt += "<li><span value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";
            }
        });
    }else if(id == "btnAddTags" || id == "btnAddTagsC"){

        $("#lay_05 > div > h1").text("태그선택");

        var txt = "" ;
        var grpSeq = "";
        var classTag = "\'on\'";

        $.each(custTags, function(index, data){
            $.each(tagDS, function(i, ds){
                grpSeq = ds.grpSeq;
                if(grpSeq == data.grpSeq){
                    txt += "<li><span class="+classTag+" value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";

                    return false;
                }
            });
            if(grpSeq != data.grpSeq){
                txt += "<li><span value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";
            }
        });

    }

    $("#lay_05 > .lay_cont > .grouplist > li").remove();
    $("#lay_05 > .lay_cont > .grouplist").html(txt);

    $(".grouplist li span").click(function(){
        $(this).toggleClass("on");
    });

});

 $("#btnSetGroups").click(function(){
     var popGroupTxt = "";
     var popGroupSeq = "";
     $("#lay_05 > .lay_cont > .grouplist > li > span").each(function(){
         if($(this).hasClass("on")  == true){
             if(popGroupTxt == ""){
                 popGroupSeq += $(this).attr("value");
                 popGroupTxt += $(this).text();
             }else{
                 popGroupSeq += ", " + $(this).attr("value");
                 popGroupTxt += ", " + $(this).text();
             }
         }
     });


     if(id == "btnAddGroups"){
         $("#custGroups").val(popGroupTxt);
         $("#custGroupsSeq").val(popGroupSeq);

         var selectedGroups = $("#custGroupsSeq").val().split(", ");
         groupDS = [];
         makeGroupObj(selectedGroups, groupDS, "001");

     }else if(id == "btnAddTags"){
         $("#custTags").val(popGroupTxt);
         $("#custTagsSeq").val(popGroupSeq);

         var selectedTags = $("#custTagsSeq").val().split(", ");
         tagDS = [];
         makeGroupObj(selectedTags, tagDS, "002");

     }else if(id == "btnAddGroupsC"){
         $("#custGroupsC").val(popGroupTxt);
         $("#custGroupsCSeq").val(popGroupSeq);

         var selectedGroups = $("#custGroupsCSeq").val().split(", ");
         groupDS = [];
         makeGroupObj(selectedGroups, groupDS, "001");

     }else if(id == "btnAddTagsC"){
         $("#custTagsC").val(popGroupTxt);
         $("#custTagsCSeq").val(popGroupSeq);

         var selectedTags = $("#custTagsCSeq").val().split(", ");
         tagDS = [];
         makeGroupObj(selectedTags, tagDS, "002");

     }

     layerClose('#lay_05');

 });

function makeGroupObj(obj, ds, grpTp){
    if(obj[0] != ""){
        $.each(obj, function(index, data){
            ds.push({"grpSeq":data,"grpTp":grpTp});
        });
    }
}

function moveSearchforCustInfo(){

    if($("#content_pop_search").css("display")=="block" || $("#content_pop_search").css("display")=="block"){
        $("#content_pop_search").css("display","block");
        $("#content_pop_list").css("display","none");

        $("#content_search").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_list").css("display","block");


        $("#header_title span").addClass("search_open");


    }else if($("#content_pop_list").css("display") == "block"){
        $("#content_pop_search").css("display","block");
        $("#content_pop_list").css("display","none");

        var html = "";
        html += "<h2><spring:message code='global.lbl.custSearchCondition' />(<spring:message code='global.lbl.custInfo' />)<!-- 고객검색조건(고객정보)   --></h2> ";
        $("#content_search > .content_title").html(html);

        $("#header_title span").removeAttr("class");
    }

}

//SMS 팝업
var sendSMSPopupWin;
function sendSMSPopup(){
    var   smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
        , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
        , smsTmplUserList = []              // sms 전송 대상자 목록
        , refKeyNm = $("#custNo").val()
        , refTableNm = "CR_0101T"
        , contactBizCd = "01"
    ;

    var custNo = $("#custNo").val()
        , custNm = $("#custNm").val()
        , hpNo = $("#hpNo").val();

    sendSMSPopupWin = mob.window.popup({
            windowId:"sendSMSPopupWin"
            ,width:"100%"
            ,height:"700px"
            ,content:{
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSendSMSPopup.do'/>"
                , data:{
                    "custNo":custNo
                    ,"custNm":custNm
                    ,"hpNo":hpNo
                    ,"smsTmplUserGroup":smsTmplUserGroup
                    ,"smsTmplUserSeq":smsTmplUserSeq
                    ,"smsTmplUserList":smsTmplUserList
                    ,"refKeyNm":refKeyNm
                    ,"refTableNm":refTableNm
                    ,"contactBizCd":contactBizCd
                    ,"callbackFunc":function(data){
                        if (data.length >= 1) {
                            if(data == "FAIL"){
                                mob.notification.success("<spring:message code='global.lbl.send'/>"+"<spring:message code='global.btn.failed'/>");
                            }else{
                                mob.notification.success("<spring:message code='global.info.success'/>");
                            }
                        }
                    }
                }
            }
        });
}

//블루멤버십등급
blueGradeCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = mLevelMap[val];
    }
    return returnVal;
}
</script>
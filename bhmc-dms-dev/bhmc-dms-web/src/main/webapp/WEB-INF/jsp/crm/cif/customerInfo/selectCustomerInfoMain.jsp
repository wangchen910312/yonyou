<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />

<!-- *************************************************************************
**************************파일업로드 1********************************************
***************************************************************************-->
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
                        <!-- <button type="button" class="btn_m" id="btnSalesActiveAdd"><spring:message code='crm.btn.salesActiveAdd' /></button> --> <!-- 영업활동등록 -->
                        <button type="button" class="btn_m" id="btnMessage"><spring:message code="global.btn.message" /></button>  <!-- 메시지 -->
                        <button type="button" class="btn_m" id="btnCustRegLink" style="display:none;"><spring:message code="global.btn.custNew" /></button>  <!-- 고객신규등록 -->
                        <button type="button" class="btn_m" id="btnInfoModify"><spring:message code="global.btn.custInfoModify" /></button>  <!-- 유일정보 수정 -->
                        <button type="button" class="btn_m btn_search hidden" id="btnCustSearch"><%--  20170321 조회버튼 삭제해달라고해서 히든처리 --%><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
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
                                    <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input"  maxlength="30" /> <!--  onKey_down -->
                                    <input id="custNm" name="custNm" type="hidden" value="" class="form_input" data-json-obj="true" />
                                    <!-- 고객조회
                                    <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /></a>
                                    -->
                                    <input id="pageMode" name="pageMode" type="hidden" value="updateMode" readonly data-json-obj="true" />
                                    <input type="hidden" id="docId" name="docId" data-json-obj="true" />
                                    <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" />
                                    <input type="hidden" id="seq" name="seq" />
                                    <input type="hidden" id="blueGradeChgDt" />
                                    <input type="hidden" id="bmLocalDataSearch" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
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
                                <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.mathDocTp" /></span></th> <!-- 증거유형 -->
                                <td>
                                    <input id="mathDocTp" name="mathDocTp" class="form_comboBox"  data-json-obj="true" />
                                    <input id="oldMathDocTp" name="oldMathDocTp" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.ssnCrnNo" /></span></th> <!-- 증거번호  -->
                                <td>
                                    <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input numberandalpha" maxlength="30" data-json-obj="true" style="text-transform: uppercase" />
                                    <input id="oldSsnCrnNo" name="oldSsnCrnNo" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.scId" /></th> <!-- 판매고문 -->
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
                                    <input id="hpNo" name="hpNo" type="text" class="form_input numberic getCustDupByKey" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" />
                                    <input id="oldHpNo" name="oldHpNo" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <td colspan="3">
                                    <label class="label_check ml5"><input id="hpNoInvldYn" name="hpNoInvldYn" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled data-json-obj="true" /> <spring:message code="global.lbl.hpNoInvld" /></label>&nbsp;&nbsp;&nbsp; <!-- 핸드폰번호무효  (법인검증무효) -->
                                    <label class="label_check ml5"><input id="hpNoAddImposYn" name="hpNoAddImposYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNoAddImpos" /></label> <!-- 핸드폰번호수정불가 (딜러갱신불가) -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><input type="radio" name="prefCommMthCdRadio" value="02" ><spring:message code="global.lbl.homeTelNo" /><!-- 고정(유선)전화 --></th>
                                <td>
                                    <input id="telNo" name="telNo" type="text" value="" class="form_input numberic" data-type="tel" maxlength="20" data-json-obj="true" />
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
                                    <!-- <input id="emailNm" name="emailNm" type="email" value="" class="form_input form_email" maxlength="40" data-json-obj="true" /> -->
                                    <input type="email" id="emailNm" name="emailNm" class="form_input" maxlength="40" data-json-obj="true" />
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
                                <th scope="row" ><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td >
                                    <input id="officeTelNo" name="officeTelNo" type="text" class="form_input numberic"  data-type="tel" maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row" ><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td >
                                    <input id="officeFaxNo" name="officeFaxNo" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row" ><spring:message code="crm.lbl.prefContactMthCd" /></th> <!-- 우선연락방식  SMS / EMAIL / DM -->
                                <td >
                                    <input id="prefContactMthCd" name="prefContactMthCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row" ><spring:message code="crm.lbl.prefContactTime" /></th> <!-- 우선연락시간 -->
                                <td >
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
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div> <!-- PersonalDiv End-->
            <div id="corporateDiv"  style="display:none"> <!-- corporateDiv Start -->
               <!--  salesOpptProcForm Start -->
               <jsp:include page="/WEB-INF/jsp/crm/cif/customerInfo/selectIncludeCorporateCustomerDiv.jsp"></jsp:include>
               <!--  salesOpptProcForm End -->
            </div>  <!-- corporateDiv End -->
            </div>  <!-- customerForm 마침 -->
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
                            <th scope="row"><spring:message code="crm.lbl.addrNm" /></th> <!-- 주소 -->
                            <td colspan="6">
                                <input id="addrFull" name="addrFull" class="form_input form_readonly"/>
                            </td>
                            <td colspan="2">
                                <button type="button" id="btnAddrHidden" class="btn_xs2 btn_detail"><spring:message code="crm.lbl.more" /></button>
                                <button type="button" id="btnAddAddress" class="btn_xs2 btn_add"><spring:message code="global.btn.add" /></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </section>
            <!-- 주소정보 시작 -->
            <section class="group" id="hiddenAddrTable" style="display:none;">
            <div class="mt5">
                <div class="table_grid">
                    <div id="addrGrid"></div>
                </div>
            </div>
            </section>
            <!-- //주소정보 끝 -->
        <!-- Tab Area Start -->
        <section class="group">
            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="custDtlTab" class="k-state-active"><spring:message code="global.lbl.dtlInfo" /><!-- 상세정보 --></li>
                    <li id="relCustInfoTab"><spring:message code="global.lbl.relCustInfo" /> <!-- 연계인 --></li>
                    <li id="haveCarTab"><spring:message code="global.lbl.haveCar" /> <!-- 보유차량 --></li>
                    <li id="activeHistoryTab"><spring:message code="crm.lbl.activeHistory" /> <!-- 추적이력 --></li>
                    <li id="leadStatusExchangeTab"><spring:message code="crm.lbl.leadStatusExchange" /> <!-- 회전기록--></li>
                    <li id="lbrHistoryTab"><spring:message code="ser.lbl.lbrHistory" /> <!-- 정비이력 --></li>
                    <li id="dlrMbrShipTab"><spring:message code="global.lbl.dlrMbrShip" /> <!-- 딜러멤버십 --></li>
<%--                     <li id="blueMbrShipTab"><spring:message code="global.lbl.blueMbrShip" /> <!-- 블루멤버십 --></li> --%>
                    <li id="incFincTab"><spring:message code="global.lbl.incFinc" /> <!-- 보험/금융 --></li>
                    <li id="infoUpdHistTab"><spring:message code="global.lbl.infoUpdHist" /> <!-- 정보변경이력  --></li>
                    <li id="contractTab"><spring:message code="global.lbl.contract" /> <!-- 계약서 --></li>
                    <li id="fileTab"><spring:message code="global.lbl.file" /> <!-- 첨부파일 --></li>
                    <li id="msgHistTab"><spring:message code='global.lbl.msgHistory' /> <!-- 메시지이력 --></li>
                    <li id="couponTab"><spring:message code="crm.lbl.coupon" /> <!-- 쿠폰 --></li>
                    <li id="custChargeTab"><spring:message code="ser.lbl.preBalAmt" /> <!-- 예치금 --></li>
                    <li id="memoTab"><spring:message code="crm.lbl.remark" /> <!-- 메모 - 비고 --></li>
                </ul>
                <div id="custDtlTabDiv" class="mt0"><!-- 상세정보 시작-->
                <div id="custDtlTabArea">
                    <div class="header_area">
                        <%-- <h2 class="title_basic"><spring:message code="global.lbl.dtlInfo" /></h2> --%>
                        <div class="btn_right">
                            <button class="btn_xs" id="btnSearchCustDtl" ><spring:message code="global.btn.search" /></button> <!-- 상세정보조회 -->
                            <button class="btn_xs" id="btnSaveCustDtl" ><spring:message code="global.btn.save" /></button> <!-- 상세정보저장 -->
                        </div>
                    </div>
                    <div class="table_form form_width_100per">
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
<!--                                    <input id="buyCnt" name="buyCnt" class="form_input"  data-json-obj="true" />   -->
                                        <label class="label_check ml5"><input id="buyCnt" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled /></label>
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.chgBuy' /></th> <!-- 교환구매  -->
                                    <td colspan="2">
                                        <div class="form_float">
                                            <div class="form_left" style="width:33%; margin-top:3px;" >
<!--                                            <input id="chgBuyYn" name="chgBuyYn" class="form_comboBox" data-json-obj="true" /> -->
                                                <label class="label_check ml5"><input id="chgBuyYn" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled /></label>
                                            </div>
                                            <div class="form_left" style="width:33%;">
<!--                                                 <input id="purcCarBrandCd" name="purcCarBrandCd" class="form_comboBox form_readonly" readonly data-json-obj="true" /> -->
                                                <input id="purcCarBrandNm" name="purcCarBrandNm" class="form_input form_readonly" readonly />
                                            </div>
                                            <div class="form_right" style="width:34%;">
                                                <input id="purcCarModelNm" name="purcCarModelNm" class="form_input form_readonly" readonly />
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
                                <th scope="row"><spring:message code="crm.lbl.custSourceLocation" /></th>
                                  <td>
                                    <input id="custHoldTp" name="custHoldTp" class="form_comboBox" data-json-obj="true" />
                                    <div class="form_float" style="display:none;">
                                        <div class="form_right">
                                            <input id="custHoldTpDtl" name="custHoldTpDtl" class="form_comboBox" readonly data-json-obj="true" />
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
                                      <input id="officeNm" name="officeNm" type="text" value="" class="form_input"  data-json-obj="true" />
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
                </div> <!-- // custDtlTabArea -->
                </div> <!-- // 상세정보 끝 -->
                <div id="relCustInfoTabDiv" class="mt0"> <!-- 연계인 시작-->
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
                <div id="haveCarTabDiv" class="mt0"><!-- 보유차량 -->
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
                <div id="activeHistoryTabDiv" class="mt0"> <!-- activeHistoryTabDiv Start -->
                    <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                              <button class="btn_xs" id="btnCtlSearchTrace" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="activeHistoryTabGrid" class="grid"></div>
                        </div>
                    </section>
                </div> <!-- activeHistoryTabDiv End -->
                <div id="leadStatusExchangeTabDiv" class="mt0"> <!-- leadStatusExchangeTabDiv Start -->
                    <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                              <button class="btn_xs" id="btnCtlSearchLeadHist" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="leadStatusExchangeTabGrid" class="grid"></div>
                        </div>
                    </section>
                </div> <!-- leadStatusExchangeTabDiv End -->
                <div id="lbrHistoryTabDiv" class="mt0"> <!-- 정비이력 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="ser.lbl.lbrHistory" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchAllLbr" ><spring:message code="crm.lbl.allView" /></button> <!-- 전체보기 -->
                              <button class="btn_xs" id="btnSearchLbr" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="lbrGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //정비이력 끝 -->
                <div id="dlrMbrShipTabDiv" class="mt0"> <!-- 딜러멤버십 -->
                  <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                                <button class="btn_xs" id="btnSearchDlrMbrShip" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <!-- 멤버십 정보 탭 영역 -->
                        <div class="table_grid">
                            <div id="membershipGrid" ></div>
                        </div>
                        <!-- 멤버십 정보 탭 종료 -->

                        <!-- 포인트 이력 탭 영역 -->
                        <div class="header_area">
                            <h2 class="title_basic"> <spring:message code="global.lbl.pointHistory"/></h2><!-- 포인트 이력 -->
                        </div>
                        <div class="table_grid">
                            <div id="tabPointHisGrid" ></div>
                        </div>
                        <!-- 포인트 이력 탭 종료 -->

                        <!-- 충전카드 이력 탭 영역 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.lbl.rechargeCardHistory" /></h2>
                        </div>
                        <div class="table_grid">
                            <div id="tabCardListGrid" ></div>
                        </div>
                        <!-- 충전카드 이력 탭 영역 종료-->

                  </section>
                </div> <!-- //딜러멤버십 끝-->
<!--                 <div id="blueMbrShipTabDiv" class="mt0"> 블루멤버십 -->
<!--                   <section class="group"> -->
<!--                       <div class="header_area"> -->
<%--                           <h2 class="title_basic"><spring:message code="global.lbl.blueMbrShip" /></h2> --%>
<!--                           <div class="btn_right"> -->
<%--                               <button class="btn_xs" id="btnSearchBlueMbrShip" ><spring:message code="crm.btn.latestInfoSearch" /></button> <!-- 최신정보조회 --> --%>
<!--                           </div> -->
<!--                       </div> -->
<!--                         <div class="table_form form_width_100per"> -->
<!--                             <table> -->
<%--                                 <caption></caption> --%>
<%--                             <colgroup> --%>
<%--                                 <col style="width:10%;"> --%>
<%--                                 <col style="width:15%;"> --%>
<%--                                 <col style="width:10%;"> --%>
<%--                                 <col style="width:15%;"> --%>
<%--                                 <col style="width:10%;"> --%>
<%--                                 <col style="width:15%;"> --%>
<%--                                 <col style="width:10%;"> --%>
<%--                                 <col style="width:15%;"> --%>
<%--                             </colgroup> --%>
<!--                             <tbody> -->
<!--                                 <tr> -->
<%--                                     <th scope="row"><spring:message code='crm.lbl.blueMembershipNo' /></th> <!-- 블루멤버십 번호 --> --%>
<!--                                     <td> -->
<!--                                         <input type="text" id="blueMembershipNo" value="" class="form_input form_readonly" readonly /> -->
<!--                                     </td> -->
<%--                                     <th scope="row"><spring:message code='global.lbl.BlueMbrShipReg' /></th> <!-- 블루멤버십등급 --> --%>
<!--                                     <td> -->
<!--                                         <input type="text" id="blueGradeCd" value="" class="form_comboBox form_readonly" readonly /> -->
<!--                                     </td> -->
<%--                                     <th scope="row"><spring:message code='global.lbl.savePointAble' /></th> <!-- 적립포인트(가용) --> --%>
<!--                                     <td class="readonly_area"> -->
<!--                                         <input type="text" id="blueAvlbPointVal" value="" class="form_numeric form_readonly form_num" readonly  /> -->
<!--                                     </td> -->
<%--                                     <th scope="row"><spring:message code='global.lbl.joinDt' /></th> <!-- 가입일 --> --%>
<!--                                     <td class="readonly_area"> -->
<!--                                         <input type="text" id="blueJoinDt" value="" class="form_datepicker form_readonly" readonly /> -->
<!--                                     </td> -->
<!--                                  </tr> -->
<!--                                 <tr> -->
<%--                                     <th scope="row"><spring:message code='crm.lbl.bmLoginId' /></th> <!-- BM회원계정 --> --%>
<!--                                     <td> -->
<!--                                         <input type="text" id="blueLoginId" value="" class="form_input form_readonly" readonly /> -->
<!--                                     </td> -->
<!--                                  </tr> -->
<!--                             </tbody> -->
<!--                         </table> -->
<!--                       </div> -->
<!--                       <div class="table_grid mt10"> -->
<!--                         <div id="blueMbrShipGrid" class="grid"></div> -->
<!--                       </div> -->
<!--                   </section> -->
<!--                 </div> //블루멤버십 끝 -->
                <div id="incFincTabDiv" class="mt0"> <!-- 보험/금융 -->
                  <section class="group">
                      <div class="header_area"> <!-- 보험 -->
                          <h3 class="title_basic"><spring:message code="global.lbl.insurance" /></h3>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchInc" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="incGrid" class="grid"></div>
                      </div>
                      <div class="header_area"> <!-- 금융 -->
                          <h3 class="title_basic"><spring:message code="global.lbl.finc" /></h3>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchFinc" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="fincGrid" class="grid"></div>
                      </div>
                      <div class="header_area"> <!-- 용품 -->
                          <h3 class="title_basic"><spring:message code="sal.title.accessoryCondition" /></h3>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchAccessory" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="accessoryGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //보험/금융 끝 -->
                <div id="infoUpdHistTabDiv" class="mt0"> <!-- 정보변경이력  -->
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
                <div id="contractTabDiv" class="mt0"> <!-- 계약서 -->
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
                <div id="fileTabDiv" class="mt0"> <!-- 첨부파일 -->
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
                <div id="msgHistTabDiv" class="mt0">
                    <section class="group">
                      <div class="header_area">
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchMsg" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="msgHistoryGrid"></div>
                      </div>
                    </section>
                </div>
                <div id="couponTabDiv" class="mt0"> <!-- 쿠폰 -->
                  <section class="group">
                      <div class="header_area">
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchCoupon" ><spring:message code="global.btn.search" /></button> <!-- 쿠폰조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="couponTabGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //쿠폰 끝 -->
                <div id="custChargeTabDiv" class="mt0"> <!-- 예치금 -->
                  <section class="group">
                      <div class="header_area">
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchCustCharge" ><spring:message code="global.btn.search" /></button> <!-- 예치금조회 -->
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
                                    <th scope="row"><spring:message code="crm.lbl.ableAmt" /><!-- 가용 금액 --></th>
                                    <td class="readonly_area">
                                        <input id="sAbleAmtDetail" name="sAbleAmtDetail"  class="form_numeric form_readonly form_num" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.totalRchgAmt" /><!-- 총충전금액--></th>
                                    <td class="readonly_area">
                                        <input id="sTotChrAmtDetail" name="sTotChrAmtDetail"  class="form_numeric form_readonly form_num" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.totalUseAmt" /><!-- 총 사용 금액 --></th>
                                    <td class="readonly_area">
                                        <input id="sTotUseAmtDetail" name="sTotUseAmtDetail"  class="form_numeric form_readonly form_num" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록 일--></th>
                                    <td>
                                        <input id="sRegDtDetail" name="sRegDtDetail"  type="text"  class="form_input form_readonly" readonly />
                                    </td>
                                 </tr>
                             </tbody>
                            </table>
                        </div>
                      <div class="header_area">
                      </div>
                      <div class="table_grid">
                        <div id="custChargeTabGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //예치금 끝 -->
                <div id="memoTabDiv" class="mt0"> <!-- 메모 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="crm.lbl.remark" /></h2> --%>
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
            </div>
        <script type="text/javascript" charset="UTF-8">
        // 탭 TabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,displayScrollButton:true  //스크롤버튼 출력여부
            ,scrollWidth:50                  //스크롤버튼 클릭시 이동픽셀
            , select:function(e) {
                selectTabId = e.item.id;
                //callUrl;
                // console.log(selectTabId);
                if (selectTabId == "custDtlTab") {
                    //$("#btnSearchCustDtl").click();
                    if (custTp == "02") {  // 법인
                        // console.log("return false:::");
                        return false;
                    }
                }
            }
            ,change : function(e){

                if( dms.string.isNotEmpty($("#custNo").val())) {
                    var custTp = $("#custTp").data("kendoExtDropDownList").value();
// console.log("custTp : " + custTp);
                    if (selectTabId == "custDtlTab") {
                        //$("#btnSearchCustDtl").click();
                        if (custTp == "02") {  // 법인
//                             $("#custDtlTab").removeClass("k-state-active");
//                             $("#custDtlTab").addClass("k-state-active");
                            this.select(1);
                        }
                    } else if (selectTabId == "relCustInfoTab") {
                        // console.log("btnSearchRelCust click:::");
                        $("#btnSearchRelCust").click();
                    } else if (selectTabId == "haveCarTab") {
                        $("#btnSearchHaveCar").click();
                    } else if (selectTabId == "activeHistoryTab") {
                        $("#btnCtlSearchTrace").click();
                    } else if (selectTabId == "leadStatusExchangeTab") {
                        $("#btnCtlSearchLeadHist").click();
                    } else if (selectTabId == "lbrHistoryTab") {
                        $("#btnSearchLbr").click();
                    } else if (selectTabId == "dlrMbrShipTab") {
                        $("#btnSearchDlrMbrShip").click();
                    } else if (selectTabId == "blueMbrShipTab") {
                        $("#bmLocalDataSearch").click();
                    } else if (selectTabId == "incFincTab") {
                        $("#btnSearchInc").click();
                        $("#btnSearchFinc").click();
                        $("#btnSearchAccessory").click();
                    } else if (selectTabId == "infoUpdHistTab") {
                        $("#btnSearchInfoUpdHist").click();
                    } else if (selectTabId == "memoTab") {
                        $("#btnSearchMemo").click();
                    } else if (selectTabId == "couponTab") {
                        $("#btnSearchCoupon").click();
                    } else if (selectTabId == "custChargeTab") {
                        $("#btnSearchCustCharge").click();
                    } else if (selectTabId == "contractTab") {
                        $("#btnSearchContract").click();
                    } else if (selectTabId == "fileTab") {
                        $("#btnSearchFile").click();
                    } else if (selectTabId == "msgHistTab") {
                        $("#btnSearchMsg").click();
                    }
                }
            }
        });
        </script>
        </section>
        <!-- //Tab Area End-->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

/*************************************************************
 데이터 셋업
*************************************************************/
    var getParamChk             = "${getParamChk}";
    var loginDlrCd              = "${dlrCd}";
    var custNo                  = "${custNo}";
    var loginUsrId              = "${loginUsrId}";
    var custInfoUpdtValidPrid   = "${custInfoUpdtValidPrid}";

 // yyyy-MM-dd
    var vDtyyyyMMdd = "${_dateFormat}";

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
    var bmPointCdListMap = [];

    var custTpList              = [];
    var custTpMap         = [];
    var cardTpCdList              = [];
    var cardTpCdMap         = [];
    var custCdList              = [];
    var custCdMap = [];
    var custHoldTpList          = [];
    var custHoldTpDtlList       = [];
    var sexCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var mathDocTpList           = [];
    var mbrGradeCdList          = [];
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
    var prefCommMthCdList       = [];
    var chgBuyYnDS              = [];
    var chgBuyYnMap             = [];
    var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var purcCarBrandCdMap       = [];
    var chinaZodiacSignCdDS     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var zodiacSignCdDS          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var bloodTpDS               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var dutyCdDS                = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var ncarDstinCdMap           = [];

    var prefCommMthCdMap        = [];
    var mathDocTpMap            = [];
    var mathDocTpMapC            = [];
    var pconTpMap               = [];
    var addrTpMap               = [];
    var prefContactMthCdMap     = [];
    var prefContactTimeCdMap    = [];
    var callStatCdList = [];
    var callStatCdMap = [];
//     var leadSrcList = [];
//     var leadSrcMap = [];
//     var statList = [];
//     var statMap = [];

    var paymMthMap = [];
    var rcptTpMap = [];

    var custChgHistCdMap = [];

    <c:forEach var="obj" items="${custChgHistCdList}">
    custChgHistCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${ncarDstinCdList}">
    ncarDstinCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${paymMthList}">
    paymMthMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${rcptTpList}">
    rcptTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //블루멤버십등급
    var mLevelList = [];
    <c:forEach var="obj" items="${mLevelList}">
        mLevelList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //보험회사 Array
    var incCmpCdMap = {};
    <c:forEach var="obj" items="${incCmpCdList}">
        incCmpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
    chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

    // 리드유형
    var leadTpList = [];
    var leadTpMap = [];
    <c:forEach var="obj" items="${leadTpList}">
        leadTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        leadTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 메모유형
    var memoTpDS = [];
    var memoTpMap = [];
    <c:forEach var="obj" items="${memoTpDS}">
        memoTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        memoTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

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

  //용품업무유형
    var goodsTpList = [];
    <c:forEach var="obj" items="${goodsTpList}">
    goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var goodsTpMap = dms.data.arrayToMap(goodsTpList, function(obj){ return obj.cmmCd; });

  //용품판매상태
    var contractStatCdList = [];
    <c:forEach var="obj" items="${contractStatCdList}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var contractStatCdMap = dms.data.arrayToMap(contractStatCdList, function(obj){ return obj.cmmCd; });

  //금융신청상태:SAL042
    var fincStatObj = {};
    <c:forEach var="obj" items="${fincStatCdDS}">
        fincStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //금융사:SAL055
    var fincCmpObj = {};
    <c:forEach var="obj" items="${fincCmpCdDS}">
        fincCmpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${callStatCdList}">
    callStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    callStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

//     <c:forEach var="obj" items="${leadSrcList}">
//     leadSrcList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
//     leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
//     </c:forEach>

//     <c:forEach var="obj" items="${statList}">
//     statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
//     statMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
//     </c:forEach>

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

    <c:forEach var="obj" items="${bloodTpDS}">
    bloodTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${dutyCdDS}">
    dutyCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${pointCdList}">
    pointCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${bmPointCdList}">
    bmPointCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${cardTpCdList}">
    cardTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    cardTpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

    <c:forEach var="obj" items="${mbrGradeCdList}">
    mbrGradeCdList.push({"gradeSeq":"${obj.gradeSeq}","gradeNm":"${obj.gradeNm}"});
    </c:forEach>
    var gradeCodeListMap = dms.data.arrayToMap(mbrGradeCdList, function(obj){ return obj.gradeSeq; });

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
            groupDS.push({"grpSeq":"0","grpTp":"001"});
            return;
        }

        $.each(custGroupsC, function(index, data){
            if(selectedGroups.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
            }
        });
        // console.log(groupDS);
    };

    var defaultTagCDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#custTagsC").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            tagDS.push({"grpSeq":"0","grpTp":"002"});
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
            hobbyDS.push({"grpSeq":"0","grpTp":"003"});
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
            groupDS.push({"grpSeq":"0","grpTp":"001"});
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
            tagDS.push({"grpSeq":"0","grpTp":"002"});
            return;
        }

        $.each(custTags, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });
    };

    function getCustDupByKey(idVal){
        // console.log("getCustDupByKey!!!!");
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
            if ( dms.string.isNotEmpty(hpNoC) ) {
                hpNo = hpNoC;
                chkContinued = true;
            }
        } else {
            if ( dms.string.isNotEmpty(hpNo) ) {
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
            param["sOfficeTelNo"]  = officeTelNo;
            param["sMathDocTp"]         = mathDocTp;
            param["sSsnCrnNo"]         = ssnCrnNo;
            param["sOldCustNm"]         = oldCustNm;
            param["sOldHpNo"]         = oldHpNo;
            param["sOldMathDocTp"]         = oldMathDocTp;
            param["sOldSsnCrnNo"]         = oldSsnCrnNo;

            // console.log(param);

            $.ajax({
                //url:"<c:url value='/crm/cif/customerInfo/selectCustDupByKey.do' />"
                url:"<c:url value='/crm/cif/customerInfo/selectCustDupScreenByKey.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //// console.log(jqXHR);
                    //// console.log(jqXHR.responseJSON);
                    dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    // console.log(result);
                    if (result.total == 0 ){
                        dms.notification.info("<spring:message code='global.info.ableToDo' />");
                    } else {
                        dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                    }
                }
            }).done(function(result) {
                // console.log("done!!!!");
            });
        }
    }

    // 증거유형 증거번호 체크
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

        if ( dms.string.isNotEmpty(mathDocTp) && dms.string.isNotEmpty(ssnCrnNo)) {

            var param = {};
            var flag;
            param["sCustNo"]        = custNo;
            param["sCustTp"]        = custTp;
            param["sCustNm"]        = custNm;
            param["sHpNo"]          = hpNo;
            param["sOfficeTelNo"]   = officeTelNo;
            param["sMathDocTp"]     = mathDocTp;
            param["sSsnCrnNo"]      = ssnCrnNo;
            param["sOldCustNm"]     = oldCustNm;
            param["sOldHpNo"]       = oldHpNo;
            param["sOldMathDocTp"]  = oldMathDocTp;
            param["sOldSsnCrnNo"]   = oldSsnCrnNo;

            // console.log(param);

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
                    // console.log("getCustMathDocDupByKey !!! ");

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
                // console.log("done!!!!");
            });
        }

        return flag;
    }

    /******************************************************
     * 활동 탭 (DataSource)- 시작
     ******************************************************/
     var dcUseTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     var dcUseTpArr = [];

     // 할인사용구분
     <c:forEach var="obj" items="${dcUseTpList}">
         dcUseTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         dcUseTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>
     dcUseTpArrVal = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             returnVal = dcUseTpArr[val];
         }
         return returnVal;
     };

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

     /**
      * hyperlink in grid event
      */
      $(document).on("click", ".linkContract", function(e){

           var grid = $("#contractGrid").data("kendoExtGrid"),
           row = $(e.target).closest("tr");
           var dataItem = grid.dataItem(row);
           var contractStatCd = dataItem.contractStatCd;

           if (contractStatCd == "10") {
               window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.contractCt' />", "<c:url value='/sal/cnt/contractMnt/selectContractMntMain.do' />?estimateNo="+dataItem.contractNo, "VIEW-D-10634"); // contractNo
           } else {
               //window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.contMgmt' />", "<c:url value='/sal/cnt/contractRe/selectContractReMain.do' />?orderNo="+dataItem.contractNo, "VIEW-D-10401"); // contractNo
               window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.contractTot' />", "<c:url value='/sal/cnt/contractProgress/selectContractProgressMain.do' />?orderNo="+dataItem.contractNo, "VIEW-D-10636"); // contractNo
           }

      });

      /**
       * hyperlink in grid event
       */
       $(document).on("click", ".linkVin", function(e){

            var grid = $("#haveCarGrid").data("kendoExtGrid"),
            row = $(e.target).closest("tr");
            var dataItem = grid.dataItem(row);

            window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.vehicleMasterMgmt' />", "<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do' />?sSerFg=Y&sVinNo="+dataItem.vinNo, "VIEW-D-10396"); // vinNo
       });

       occrPointValFormat = function(pointTp, occrPointVal){
           var occrPointStr;
           if ( dms.string.isNotEmpty(pointTp) && occrPointVal > 0 ) {
               occrPointStr = "("+pointTp+") "+kendo.toString(occrPointVal, "n");
           };
           return occrPointStr;
       };

$(document).ready(function() {

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

// 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custTpList
        , index:0
        , change:function(){
            var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
            } else {
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                $("#hpNoC").val($("#hpNo").val());
                $("#custNoC").val($("#custNo").val());
                $("#custCdC").data("kendoExtDropDownList").value($("#custCd").data("kendoExtDropDownList").value());
                $("#personalDiv").hide();
                $("#corporateDiv").show();
                // console.log("02****");
                 tabStrip.select(1)
            }
        }
//         , enable:false
    });

 // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custTpList
        , index:0
        , change:function(){
            var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                $("#hpNo").val($("#hpNoC").val());
                $("#custNo").val($("#custNoC").val());
                $("#custCd").data("kendoExtDropDownList").value($("#custCdC").data("kendoExtDropDownList").value());
                $("#personalDiv").show();
                $("#corporateDiv").hide();
                 tabStrip.select(0)
            } else {
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
            }
        }
//         , enable:false
    });

 // 잠재/보유고객      custCd              (CRM023)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custCdList
        , index:0
    });
    $("#custCd").data("kendoExtDropDownList").value("01");

    // 잠재/보유고객      custCdC              (CRM023)
    $("#custCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:dms.data.cmmCdFilter(custCdList)
        , index:0
        , value:"01"
    });
    $("#custCdC").data("kendoExtDropDownList").value("01");

    $("#hpNo").focusout(function(){
        if($("#hpNo").val() != $("#oldHpNo").val()){
            $("#hpNoInvldYn").prop("checked", false);
            $("#hpNoAddImposYn").prop("checked", false);
        }
    });

 // 선호연락방법       prefCommMthCd (CRM022)
     $("#prefCommMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:dms.data.cmmCdFilter(prefCommMthCdList)
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
        , index:0
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
//      $("#cmpScaleCont").kendoExtDropDownList({
//         dataTextField:"cmmCdNm"
//         , dataValueField:"cmmCd"
//        , optionLabel:" "
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

//      $("#chgBuyYn").kendoExtDropDownList({
//          dataTextField:"cmmCdNm"
//          , dataValueField:"cmmCd"
//          , optionLabel:" "
//          , dataSource:chgBuyYnDS
//          , index:0
//      });

     $("#purcCarBrandCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:purcCarBrandCdDS
         , index:0
         , enable:false
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
             var fullYear = this.value().getFullYear();
             var monthVal = this.value().getMonth()+1;
             var dayVal = this.value().getDate();

             getAge(fullYear, monthVal, dayVal);
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
             $(this).val('');
         }
     });

 // 숫자와 알파벳   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
     var onlyNumAlpha = new RegExp("[^a-zA-Z0-9]");
     $(".numberandalpha").keyup(function(e)
     {
         var contents = $(this).val();
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
         // console.log(contents);
         if(corpNumChk.test(contents)){
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
//        if(onlyEmail.test(contents)){
          //$(this).val('');
  //      }
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
          // console.log(contents);
          // console.log(onlyNumAlpha.test(contents));
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
//      $(".getCustMathDocDupByKey").focusout(function(){
//          var idValue = $(this).context.id;
//          getCustMathDocDupByKey(idValue);
//      });


     // 생일 자동 셋팅
     $("#ssnCrnNo").focusout(function(e)
     {
         if( dms.string.isNotEmpty($("#ssnCrnNo").val()) ) {
            if ( getCustMathDocDupByKey() ) {
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

  // 블루멤버십 가입일
     /*$("#blueJoinDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,enable:false
     });*/

  // 블루멤버십 등급
      /*$("#blueGradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:mLevelList
        , index:0
        , enable:false
    });*/

     // 포인트 숫자
     $(".form_num").kendoExtNumericTextBox({
         format:"n0"
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
        // console.log(uid);

        $.each(addrGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });

        addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");
        //// console.log(addrGrid.dataSource.data());

    });

    $("#gridRel").on("click", "input.flagYn", function(){

        var gridRel = $("#gridRel").data("kendoExtGrid");
        var uid = $(this).data("uid");

        $("input.flagYn", "#gridRel").prop("checked", false);
        $(this).prop("checked", true);

        $.each(gridRel.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });

        gridRel.dataSource.getByUid(uid).set("flagYn", "Y");

    });

    $("#memoGrid").on("click", "input.shareYn", function(e){

        var memoGrid = $("#memoGrid").data("kendoExtGrid");
        var uid = $(this).data("uid");

        // console.log("this prop checked :" +$(this).prop("checked"));
        if ($(this).prop("checked")) {
            $(this).prop("checked", true);
            memoGrid.dataSource.getByUid(uid).set("shareYn", "Y");
        } else {
            $(this).prop("checked", false);
            memoGrid.dataSource.getByUid(uid).set("shareYn", "N");
        }
    });

    // 검색조건 show/hide
    $("#btnAddrHidden").kendoButton({
        click:function(e){
            $("#hiddenAddrTable").toggle();
            $("#btnAddrHidden").toggleClass("active");
        }
    });

    // 메시지이력 탭 조회
    $("#btnSearchMsg").kendoButton({
        click:function(e){
            $("#msgHistoryGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //버튼 - 고객신규등록 바로가기
    $("#btnCustRegLink").kendoButton({
        click:function(e) {
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custReg' />","<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do' />", "VIEW-D-10271"); //개인고객바로가기
        }
    });

    $("#btnCtlSearchTrace").kendoButton({
        click:function(e){
            // console.log("btnCtlSearchTrace Button !!!");
            var seq = $("#seq").val();

            if (dms.string.isEmpty(seq)){
                //dms.notification.info("<spring:message code='global.info.success'/>");
                return false;
            } else {
                $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
            }
        }
    });

    $("#btnCtlSearchLeadHist").kendoButton({
        click:function(e){

            // console.log("btnCtlSearchLeadHist Button !! ");
            var seq = $("#seq").val();

            if (dms.string.isEmpty(seq)){
                //dms.notification.info("<spring:message code='global.info.success'/>");
                return false;
            } else {
                $("#leadStatusExchangeTabGrid").data("kendoExtGrid").dataSource.page(1);
            }

        }
    });

    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                $(".custSearch").click();
            }
        }
    });

    // 로컬에 저장되어 있는bm 정보 조회
    $("#bmLocalDataSearch").click(function(){

        if ( dms.string.isEmpty($("#custNo").val())){
            dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            $("#custNo").focus();
            return false;
        }

        var custNo = $("#custNo").val();
        var ssnCrnNo = $("#ssnCrnNo").val();

        // form 데이터
        var param = {};
        param["sCustNo"] = custNo;
        param["sSearchRange"] = "MY";

        // console.log("bmLocalDataSearch");
        // console.log(param);

        $.ajax({
            url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                // console.log(jqXHR);
                dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result){
                // console.log("success!!!!");
                // console.log(result);
                var blueMembershipNo = result.custInfoDS[0].blueMembershipNo;
                $("#blueMembershipNo").val(blueMembershipNo);
                $("#blueAvlbPointVal").data("kendoExtNumericTextBox").value(result.custInfoDS[0].blueAvlbPointVal);
                //$("#blueGradeCd").data("kendoExtDropDownList").value(result.custInfoDS[0].blueGradeNm);
                $("#blueGradeChgDt").val(result.custInfoDS[0].blueGradeChgDt);
                //$("#blueJoinDt").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].blueMembershipJoinDt);
                $("#blueLoginId").val(result.custInfoDS[0].blueLoginId);

                if ( dms.string.isNotEmpty(ssnCrnNo) && dms.string.isNotEmpty(blueMembershipNo)) {
                    //$("#blueMbrShipGrid").data("kendoExtGrid").dataSource.page(1);
                };

            }
        }).done(function(result) {
            // console.log("bmLocalDataSearch Done!!!!");
        });


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
                     , "custCd":null      // null:All, 01:잠재, 02:보유
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             // console.log("Popup Search Result:::");
                             // console.log(data[0]);
                             // console.log(data[0].custNo);
                             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                 $("#custNo").val(data[0].custNo);
                                 //$("#custNo").val("CA07AA20160800051");
                             }
                             //$("#custNo").val("CA07AA20160800051");

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
             $("#gridRel").data("kendoExtGrid").dataSource.insert(0,{
                 "pconTp"              :"05"
                 , "flagYn"             : "N"
                 , "upperCustNo"         :$("#custNo").val()            // 상위 고객번호
                 , "relNm"               :""
                 , "telNo"               :""
                 , "hpNo"                :""
                 , "wechatId"            :""
             });
         }
     });

     // 연계인추가 - gridRel
     function insertRelCustomerItemAdd(data){
         $("#gridRel").data("kendoExtGrid").dataSource.insert(0,{
             "pconTp"              :"01"
             , "upperCustNo"         :$("#custNo").val()            // 상위 고객번호
             , "relNm"               :""
             , "telNo"               :""
             , "hpNo"                :""
             , "wechatId"            :""
         });
     }

     // 연계인 삭제 - gridRel
      $("#btnDelRelCust").kendoButton({
        click:function(e) {
            var grid = $("#gridRel").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                var pconCustNo = grid.dataItem(row).pconCustNo;
                if (dms.string.isEmpty(pconCustNo)) {
                    grid.removeRow(row);
                }
            });
        }
        //, enable:false
     });


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
             zipCodeSearchPopupWin = dms.window.popup({
                 windowId:"zipCodeSearchPopupWin"
                 , width:"700"
                 , height:height
                 , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
                 , content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                     , data:{
                         "autoBind":false
                         ,"usrNm":""
                         ,"addrDetlUsingYn":addrDetlUsingYn
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 // console.log(data);
                                 insertAddressItemAdd(data);
                                 //$("#hiddenAddrTable").toggle();
                                 //$("#btnAddrHidden").toggleClass("active");
                             }
                         }
                     }
                 }
             })
         }
     });

     //버튼 - 주소  추가
     /* $("#btnAddAddress").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

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
                                 // console.log(data);
                                 insertAddressItemAdd(data);
                             }
                         }
                     }
                 }
             })
         }
     }); */

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
                 , "addrDetlCont" 	 :detalAddressData
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

     // 주소저장 - addrGrid
     //$("#btnSaveAddress").kendoButton({
     //$("#btnSaveAddress").click(function(){

     function btnSaveAddress(custNo) {

//          var custNo = $("#custNo").val();
         var custNo = custNo;

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

         // console.log("addrGrid::::");
         // console.log(saveData);

         if (grid.gridValidation()){
             $.ajax({
                 url:"<c:url value='/crm/cmm/addressInfo/multiAddressInfo.do' />",
                 data:JSON.stringify(saveData),
                 type:'POST',
                 dataType:'json',
                 async:false,
                 contentType:'application/json',
                 error:function(jqXHR,status,error){
                      dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(jqXHR, textStatus){
                     //dms.notification.info("<spring:message code='global.info.success' />");
                     //$("#btnCustSearch").click();
                     // console.log("success!!");
                     grid.dataSource.page(1);
                 }
             });
         }else{
             globalNotification.show("<spring:message code='global.info.check.input' />", "error");
         }
     };

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

             // console.log(saveData);

             if (grid.gridValidation()){
                 $.ajax({
                     url:"<c:url value='/crm/cif/customerInfo/multiCustomerRelChg.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     beforeSend:function(xhr){
                        dms.loading.show();
                     },
                     error:function(jqXHR,status,error){
                         //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                         dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                         // console.log("failed!!");
                     },
                     success:function(jqXHR, textStatus){

                         //grid.dataSource._destroyed = [];
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         grid.dataSource.page(1);

                     }
                     ,complete:function(xhr, status) {
                         dms.loading.hide();
                     }
                 });
             }else{
                 globalNotification.show("<spring:message code='global.info.check.input' />", "error");
             }
         }
     });

     // 딜러 멤버시 조회
     $("#btnSearchDMSMembership").kendoButton({
         click:function(e) {
             $("#membershipGrid").data("kendoExtGrid").dataSource.page(1);
             $("#tabPointHisGrid").data("kendoExtGrid").dataSource.data([]);  // 포인트이력
             $("#tabCardListGrid").data("kendoExtGrid").dataSource.data([]);  // 충전카드이력력
         }
     });

     // 보험탭 조회
     $("#btnSearchInc").kendoButton({
         click:function(e) {
             $("#incGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     // 금융탭 조회
     $("#btnSearchFinc").kendoButton({
         click:function(e) {
             $("#fincGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     // 용품탭 조회
     $("#btnSearchAccessory").kendoButton({
         click:function(e) {
             $("#accessoryGrid").data("kendoExtGrid").dataSource.page(1);
         }
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

             // console.log("memo Save !!!! ");
             // console.log(saveData);

             if (grid.gridValidation()){
                 $.ajax({
                     url:"<c:url value='/crm/cif/customerInfo/multiCustomerMemoChg.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error){
                         //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                         dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                         // console.log("failed!!");
                     },
                     success:function(jqXHR, textStatus){

                         //grid.dataSource._destroyed = [];
                         dms.notification.success("<spring:message code='global.info.success'/>");
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
             //$("#activeGrid").data("kendoExtGrid").dataSource.page(1);
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

             var grid = $("#fileGrid").data("kendoExtGrid");
             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

             if (grid.cudDataLength == 0) {
                 //변경된 정보가 없습니다.
                 dms.notification.info("<spring:message code='global.info.required.change'/>");
                 return;
             }

             $("#btnCustSave").click();
         }
     });

     // 정비이력탭 전체보기
     $("#btnSearchAllLbr").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var grid = $("#lbrGrid").data("kendoExtGrid")
             , dataItem = grid.dataItem(grid.select())
             , vinNo
             , custNo
             ;

             custNo = $("#custNo").val();
             if (dataItem != null){
                 vinNo = dataItem.vinNo;
                 window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.serviceHistory' />", "<c:url value='/ser/svi/serviceHistory/selectServiceHistoryMain.do' />?vinNo="+vinNo+"&searchGubun=AD", "VIEW-D-10371"); // 서비스이력
             } else {
                 dms.notification.warning("<spring:message code='global.lbl.car' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return false;
             }

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
             $("#membershipGrid").data("kendoExtGrid").dataSource.page(1);
             $("#tabPointHisGrid").data("kendoExtGrid").dataSource.data([]);  // 포인트이력
             $("#tabCardListGrid").data("kendoExtGrid").dataSource.data([]);  // 충전카드이력력
         }
     });

     // 블루멤버십탭 조회
     $("#btnSearchBlueMbrShip").kendoButton({
         click:function(e) {
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#ssnCrnNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 // console.log("ssncrnNo is empty!!!");
                 $("#ssnCrnNo").focus();
                 return false;
             }

             var param = {};

             param["sCustNo"] = $("#custNo").val();
             //param["sIdentityNumber"] = $("#ssnCrnNo").val();

             // console.log("---btnSearch BlueDlrMbrShip---");
             // console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectBlueMemberInfoCondition.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     // console.log(jqXHR);
                     dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     // console.log("success!!!! ");
                     // console.log(result);
                     // console.log(result.IsSuccess);
                     if (result.IsSuccess) {
                         $("#blueAvlbPointVal").data("kendoExtNumericTextBox").value(result.Data.Point);
                         //$("#blueGradeCd").data("kendoExtDropDownList").value(result.Data.Mlevel);
                         $("#blueMembershipNo").val(result.Data.BlueMembership_No);
                         //$("#blueGradeChgDt").val(result.Data.MLevelBeginDate);
                         //$("#blueJoinDt").data("kendoExtMaskedDatePicker").value(result.Data.regDt);
                         $("#blueLoginId").val(result.Data.UserName);

                         //$("#blueMbrShipGrid").data("kendoExtGrid").dataSource.page(1);

                     }else {
                         dms.notification.warning(result.Message);
                     }
                 }
             }).done(function(result) {
                 // console.log("btnSearchBlueMbrShip Done!!!!");
                 /* var blueParam = {};

                 blueParam["custNo"] = $("#custNo").val();
                 blueParam["blueAvlbPointVal"] = $("#blueAvlbPointVal").data("kendoExtNumericTextBox").value();
                 blueParam["blueGradeNm"] = $("#blueGradeCd").data("kendoExtDropDownList").value();
                 blueParam["blueMembershipNo"] = $("#blueMembershipNo").val();
                 blueParam["blueGradeChgDt"] = $("#blueGradeChgDt").val();
                 blueParam["blueMembershipJoinDt"] = $("#blueJoinDt").data("kendoExtMaskedDatePicker").value();
                 blueParam["commandTp"] = "BLUEMEMBER";

                 // console.log(blueParam);
                $.ajax({
                  url:"<c:url value='/crm/cif/customerInfo/updateCustomer.do' />"
                  ,data:JSON.stringify(blueParam)
                  ,type:'POST'
                  ,dataType:'json'
                  ,contentType:'application/json'
                  ,error:function(jqXHR,status,error){
                      // console.log(jqXHR);
                      dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                  }
                }).done(function(result) {
                    // console.log("Success Updated of BlueMembership Info. !!!!");
                }); */
             });



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

     // 쿠폰탭 조회
     $("#btnSearchCoupon").kendoButton({
         click:function(e) {
             $("#couponTabGrid").data("kendoExtGrid").dataSource.page(1);
         }
     });

     // 예치금탭 조회
     $("#btnSearchCustCharge").kendoButton({
         click:function(e) {

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var custChargeTabGrid = $("#custChargeTabGrid").data("kendoExtGrid").dataSource;
             custChargeTabGrid.page(1);

             if ( custChargeTabGrid._total > 0 ) {

                 var param = {};
                 param["sCustNo"] = $("#custNo").val();

                 $.ajax({
                     url:"<c:url value='/crm/cif/customerInfo/selectCustChargeMst.do' />"
                     ,data:JSON.stringify(param)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error){
                         dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                     },
                     success:function(result){
                         // console.log("success - btnSearchCustCharge");
                         // console.log(result);
                         if(result){
                             $("#sAbleAmtDetail").data("kendoExtNumericTextBox").value(result.ableAmt);
                             $("#sTotChrAmtDetail").data("kendoExtNumericTextBox").value(result.totChrAmt);
                             $("#sTotUseAmtDetail").data("kendoExtNumericTextBox").value(result.totUseAmt);
                             $("#sRegDtDetail").val(result.regDt);
                         }
                     }
                 }).done(function(result) {
                     // console.log("btnSearchCustCharge Done!!!!");
                 });

             };



         }
     });

     $("#btnCustSearch").kendoButton({
         click:function(e) {

              // console.log("btnCustSearch..");
             var custNo = $("#custNo").val();
              // console.log(custNo);
             if ( dms.string.isEmpty(custNo) ){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return false;
             }


             //$("#btnCustReset").click();

             // form 데이터
             var param = {};
             param["sCustNo"] = custNo; // $("#custNo").val();
             param["sSearchRange"] = "MY";
             //param["sBhmcYnSearch"] = "N";

             // console.log(param);
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
                     // console.log(result);

                     if (result.custInfoDS.length != 0 ){

                         // Mode 변경
                         $("#pageMode").val("updateMode");

                         $("#custNm").val(result.custInfoDS[0].custNm);
                         $("#custNmSearch").val(result.custInfoDS[0].custNm);
                         $("#custNmSearchC").val(result.custInfoDS[0].custNm);
                         //$("#custNo").val(result.custInfoDS[0].custNo);
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
                         $("#addrFull").val(result.custInfoDS[0].addrFull);
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
                         $("input:radio[name=prefCommMthCdRadio][value='"+result.custInfoDS[0].prefCommMthCd+"']").prop("checked",true);

//                          $("#purcCarBrandCd").data("kendoExtDropDownList").value(result.purcCarBrandNm);
                         $("#purcCarBrandNm").val(result.purcCarBrandNm);
                         $("#purcCarModelNm").val(result.purcCarModelNm);
                         $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].chinaZodiacSignCd);
                         $("#zodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].zodiacSignCd);
                         $("#bloodTp").data("kendoExtDropDownList").value(result.custInfoDS[0].bloodTp);
                         $("#dutyCd").data("kendoExtDropDownList").value(result.custInfoDS[0].dutyCd);

                         $("#childrenCnt").data("kendoExtNumericTextBox").value(result.custInfoDS[0].childrenCnt);
                         $("#ageDtl").data("kendoExtNumericTextBox").value(result.custInfoDS[0].ageDtl);

                         $("#docId").val(result.custInfoDS[0].docId);
                         $("#dlrCd").val(result.custInfoDS[0].dlrCd);
                         $("#seq").val(result.custInfoDS[0].salesOpptSeq);
                         //$("#blueJoinDt").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].blueMembershipJoinDt);
                         $("#blueMembershipNo").val(result.custInfoDS[0].blueMembershipNo);
                         $("#blueAvlbPointVal").val(result.custInfoDS[0].blueAvlbPointVal);
                         //$("#blueGradeCd").data("kendoExtDropDownList").value(result.custInfoDS[0].blueGradeNm);

                         $("#oldCustNm").val(result.custInfoDS[0].custNm);
                         $("#oldHpNo").val(result.custInfoDS[0].hpNo);
                         $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                         $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);

                         // 보유차량
//                          $("#carlineNmHC").val(result.carlineNmHC);
//                          $("#modelNmHC").val(result.modelNmHC);
//                          $("#carRegNoHC").val(result.carRegNoHC);
//                          $("#custSaleDtHC").data("kendoExtMaskedDatePicker").value(result.custSaleDtHC);

                         // 정비이력
//                          $("#roDtLH").data("kendoExtMaskedDatePicker").value(result.roDtLH);
//                          $("#carRegNoLH").val(result.carRegNoLH);
//                          $("#driverNmLH").val(result.driverNmLH);
//                          $("#runDistValLH").val(dms.string.addThousandSeparatorCommas(result.runDistValLH));

    /* 증서유형 , 증서번호 수정 가능 판단
     * 1. 보유고객이면서 둘중 하나라도 데이터가 없는경우
     * 2. 계약 구매이면서 인도후 15일 이내인것
     * 3. 정비에서 들어온 고객(등록일 기준)인 경우 15일 이내
     */
                         $("#mathDocTp").data("kendoExtDropDownList").enable(true);
                         $("#ssnCrnNo").attr("readonly", false);
                         $("#ssnCrnNo").removeClass("form_readonly");
                         $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
                         $("#ssnCrnNoC").attr("readonly", false);
                         $("#ssnCrnNoC").removeClass("form_readonly");

                         var mathDocTp = result.custInfoDS[0].mathDocTp;
                         var ssnCrnNo = result.custInfoDS[0].ssnCrnNo;
                         var editable = "false";
                         var btnInfoModify = $("#btnInfoModify").data("kendoButton"); // 유일정보수정버튼
                         if (result.custInfoDS[0].custCd == "02"){
                             $(".custCdReq").addClass("bu_required");
                             $("#custTp").data("kendoExtDropDownList").enable(false);
                             $("#custTpC").data("kendoExtDropDownList").enable(false);
                         } else {
                             $(".custCdReq").removeClass("bu_required");
                             $("#custTp").data("kendoExtDropDownList").enable(true);
                             $("#custTpC").data("kendoExtDropDownList").enable(true);
                         }

                         // console.log("result :::");
                         // console.log(result.custInfoDS[0].ableSsncrnno);
                         if (result.custInfoDS[0].ableSsncrnno == "Y"){
                             editable = "true";
                         } else if (result.custInfoDS[0].ableSsncrnno == "N"){
                             editable = "false";
                         }

    // 2. 계약 구매이면서 인도후 15일 이내인것
//     // console.log("::::::custInfoUpdtValidPrid::::: ", custInfoUpdtValidPrid);
//     // console.log("::::::editable::::: ", editable);
//                         var tDt = new Date();
//                         if ((custInfoUpdtValidPrid != "0") && (editable == "false")) {
//                             if ( result.custInfoDS[0].firstSaleDt != null ) {
//                                 var saleDt = new Date(result.custInfoDS[0].firstSaleDt);
//                                 saleDt.setDate(saleDt.getDate()+parseInt(custInfoUpdtValidPrid));

//                                 if (saleDt < tDt){
//                                     // console.log("saleDt Passed!!!");
//                                 } else {
//                                     // console.log("tDt modify Enable !!!");
//                                     editable = "true";
//                                 }
//                             }

//     3. 정비에서 들어온 고객(등록일 기준)인 경우 15일 이내
//                             if ((result.custInfoDS[0].custCd == "02") && (result.custInfoDS[0].saleDt == null) && (editable == "false")){
//                                 var regDt = new Date(result.custInfoDS[0].regDt);
//                                 regDt.setDate(regDt.getDate()+parseInt(custInfoUpdtValidPrid));
//                                 if (regDt < tDt){
//                                     // console.log("modify Disable !!!");
//                                 } else {
//                                     // console.log("tDt modify Enable !!!");
//                                     editable = "true";
//                                 }
//                             }
//                         }

                        // console.log("editable :: " + editable);
                        if (editable == "true") {
                            $("#mathDocTp").data("kendoExtDropDownList").enable(true);
                            $("#ssnCrnNo").attr("readonly", false);
                            $("#ssnCrnNo").removeClass("form_readonly");
                            $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
                            $("#ssnCrnNoC").attr("readonly", false);
                            $("#ssnCrnNoC").removeClass("form_readonly");
                            btnInfoModify.enable(false);
                        } else {
                            $("#mathDocTp").data("kendoExtDropDownList").enable(false);
                            $("#ssnCrnNo").attr("readOnly", true);
                            $("#ssnCrnNo").addClass("form_readonly");
                            $("#mathDocTpC").data("kendoExtDropDownList").enable(false);
                            $("#ssnCrnNoC").attr("readOnly", true);
                            $("#ssnCrnNoC").addClass("form_readonly");
                            btnInfoModify.enable(true);
                        }

                         // CheckBox
                         var smsReceiveYn = result.custInfoDS[0].smsReceiveYn;
                         var hpNoReceiveYn = result.custInfoDS[0].hpNoReceiveYn;
                         var telReceiveYn = result.custInfoDS[0].telReceiveYn;
                         var emailReceiveYn = result.custInfoDS[0].emailReceiveYn;
                         var perInfoAgreeYn = result.custInfoDS[0].perInfoAgreeYn;
                         var perInfoUseYn = result.custInfoDS[0].perInfoUseYn;
                         var hpNoInvldYn = result.custInfoDS[0].hpNoInvldYn;
                         var hpNoAddImposYn = result.custInfoDS[0].hpNoAddImposYn;
                         var buyCntYn = result.buyCnt;
                         var chgBuyYn = result.chgBuyYn;

                         if (smsReceiveYn == 'Y'){ $("#smsReceiveYn").prop("checked", true) };
                         if (hpNoReceiveYn == 'Y'){ $("#hpNoReceiveYn").prop("checked", true) };
                         if (telReceiveYn == 'Y'){ $("#telReceiveYn").prop("checked", true) };
                         if (emailReceiveYn == 'Y'){ $("#emailReceiveYn").prop("checked", true) };
                         if (perInfoAgreeYn == 'Y'){ $("#perInfoAgreeYn").prop("checked", true) };
                         if (perInfoUseYn == 'Y'){ $("#perInfoUseYn").prop("checked", true) };
                         if (hpNoInvldYn == 'Y') {
                             $("#hpNoInvldYn").prop("checked", true);
                             $("#hpNoAddImposYn").attr("disabled",false)
                         } else {
                             $("#hpNoAddImposYn").attr("disabled",true)
                         }

                         if (hpNoAddImposYn == 'Y'){ $("#hpNoAddImposYn").prop("checked", true) };
                         if (buyCntYn == 'Y'){ $("#buyCnt").prop("checked", true) };
                         if (chgBuyYn == 'Y'){ $("#chgBuyYn").prop("checked", true) };

                         // 법인 Div Set
                         var custTpVal = result.custInfoDS[0].custTp;
                         var tabToActivate;
                         var tabStrip = $("#tabstrip").data("kendoExtTabStrip");

                         if (custTpVal == '02') {

                             // console.log("Corporate Div!!!");

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
                             $("#officeTelNoC").val(result.custInfoDS[0].officeTelNo);

                             $("#officeFaxNoC").val(result.custInfoDS[0].officeFaxNo);
                             $("#emailNmC").val(result.custInfoDS[0].emailNm);
                             $("#bizcondCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                             $("#cmpScaleContC").val(result.custInfoDS[0].cmpScaleCont);
                             $("#cmpTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                             $("#purcMngNm").val(result.custInfoDS[0].purcMngNm);
                             $("#hpNoC").val(result.custInfoDS[0].hpNo);
                             $("#taxpayerNo").val(result.custInfoDS[0].taxpayerNo);

                             $("#oldHpNo").val(result.custInfoDS[0].officeTelNo);
                             $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                             $("#oldSsnCrnNo").val(result.custInfoDS[0].ssnCrnNo);

                             $("#personalDiv").hide();
                             $("#corporateDiv").show();

                             tabStrip.select(1);
                             $("#btnSearchRelCust").click();

                         } else {
                             $("#personalDiv").show();
                             $("#corporateDiv").hide();

                             // console.log("tab Chk  personalDiv!!!");
                             tabStrip.select(0);
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
                     $("#addrGrid").data("kendoExtGrid").dataSource.page(1);

                 }
                 ,complete:function(xhr, status) {
                     dms.loading.hide();
                 }
             }).done(function(result) {

                 // console.log("Done!!!");
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
                         dms.notification.warning(jqXHR.responseJSON.errors);
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

                         // 신규등록일때 전송할 정보
                         ,"custNo":$("#custNo").val()
                         ,"custNm":$("#custNm").val()
                         ,"hpNo":$("#hpNo").val()
                         ,"scId":$("#mngScId").val()
                         ,"scNm":$("#mngScNm").val()

                         ,"callbackFunc":function(data){

                             // console.log("callbackFunc")
                             // console.log(data)

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

             var prefCommMthCdVal = $("input:radio[name='prefCommMthCdRadio']:checked").val();
             var prefCommNoVal = $("#hpNo").val();

             if (prefCommMthCdVal == "02") {
                 prefCommNoVal = $("#telNo").val();
             }

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoRequestCheck.do'/>?custNo="+custNo
                 ,type:'GET'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,beforeSend:function(xhr){
                     dms.loading.show();
                 }
                 ,error:function(jqXHR,status,error){
                     // console.log(jqXHR);
                     dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
//                      // console.log("success!!!!");
//                      // console.log(result);

                     if (result != 0) {
                         dms.notification.info("<spring:message code='crm.info.processingEval' />");
                         return false;
                     } else {
                         custInfoUpdate = dms.window.popup({
                             windowId:"custInfoUpdate"
                             , title:"<spring:message code='global.btn.custInfoModify' />"
                             , height:300
                             , content:{
                                 url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoUpdatePopup.do'/>?custNo="+custNo
                                 , data:{
                                     "autoBind":false
                                     , "custNm"         :$("#custNm").val()
                                     , "custNo"         :custNo
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
                                     , "prefCommMthCd"  :prefCommMthCdVal
                                     , "prefCommNo"     :prefCommNoVal
                                     , "callbackFunc":function(data){
                                         if(data == "SUCCESS"){

                                             $("#btnCustSearch").click();
                                         }
                                     }
                                 }
                             }
                         });

                     }

                 }
                 ,complete:function(xhr, status) {
                     dms.loading.hide();
                 }
             });


         }
     });

     // 초기화
     $("#btnCustReset").kendoButton({
        click:function(e){

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
            $("#sexCd").data("kendoExtDropDownList").value("");
            $("#prefContactMthCd").data("kendoExtDropDownList").value("");
            $("#prefContactTimeCd").data("kendoExtDropDownList").value("");
            $("#prefCommNo").val("");
            $("#marryCd").data("kendoExtDropDownList").value("");
            $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
            $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            $("#bloodTp").data("kendoExtDropDownList").value("");
            $("#dutyCd").data("kendoExtDropDownList").value("");
            $("#purcCarBrandNm").val("");
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

            $("#smsReceiveYn").prop("checked", false);
            $("#hpNoReceiveYn").prop("checked", false);
            $("#telReceiveYn").prop("checked", false);
            $("#emailReceiveYn").prop("checked", false);
            $("#perInfoAgreeYn").prop("checked", false);
            $("#perInfoUseYn").prop("checked", false);
            $("#hpNoAddImposYn").prop("checked", false);
            $("#chgBuyYn").prop("checked", false);
            $("#buyCnt").prop("checked", false);

            $("#custTp").data("kendoExtDropDownList").value("01");
            $("#custCd").data("kendoExtDropDownList").value("01");

            $("#mathDocTp").data("kendoExtDropDownList").enable(true);
            $("#ssnCrnNo").attr("readOnly", false);
            $("#ssnCrnNo").removeClass("form_readonly");
            $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
            $("#ssnCrnNoC").attr("readOnly", false);
            $("#ssnCrnNoC").removeClass("form_readonly");

            $("#gridRel").data("kendoExtGrid").dataSource.data([]);  // 연계인
            $("#haveCarGrid").data("kendoExtGrid").dataSource.data([]);  // 보유차량
            $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);  // 정비이력
            $("#membershipGrid").data("kendoExtGrid").dataSource.data([]);
            $("#tabPointHisGrid").data("kendoExtGrid").dataSource.data([]);  // 포인트이력
            $("#tabCardListGrid").data("kendoExtGrid").dataSource.data([]);  // 충전카드이력력
            //$("#blueMbrShipGrid").data("kendoExtGrid").dataSource.data([]);  // 블루멤버십
            $("#incGrid").data("kendoExtGrid").dataSource.data([]);  // 보험
            $("#fincGrid").data("kendoExtGrid").dataSource.data([]);  // 금융
            $("#accessoryGrid").data("kendoExtGrid").dataSource.data([]);  // 용품
            $("#infoUpdHistGrid").data("kendoExtGrid").dataSource.data([]);  // 정보변경이력
            $("#memoGrid").data("kendoExtGrid").dataSource.data([]);  // 메모
            $("#couponTabGrid").data("kendoExtGrid").dataSource.data([]);  // 쿠폰
            $("#contractGrid").data("kendoExtGrid").dataSource.data([]);  // 계약서
            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일

         // 법인 DIV Reset
            $("#custTpC").data("kendoExtDropDownList").value("");
            $("#custNmC").val("");
            $("#custNoC").val("");
            $("#custCdC").data("kendoExtDropDownList").value("");
            $("#mathDocTpC").data("kendoExtDropDownList").value("");
            $("#ssnCrnNoC").val("");
            $("#mngScIdC").val("");
            $("#mngTecIdC").val("");
            $("#custHoldTpC").data("kendoExtDropDownList").value("");
            $("#officeTelNoC").val("");
            $("#officeFaxNoC").val("");
            $("#emailNmC").val("");
            $("#bizcondCdC").data("kendoExtDropDownList").value("");
            $("#cmpScaleContC").val("");
            $("#cmpTpC").data("kendoExtDropDownList").value("");
            $("#ownRgstNm").val("");

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
             var oldHpNo = $("#oldHpNo").val();
             var hpNoVal = $("#hpNo").val();

             // 화면 필수 체크
             // 고객번호
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             if (custTpVal == "01") {

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

                 if ( dms.string.isNotEmpty(ssnCrnNoVal) && ssnCrnNoVal.length > 30 ) {
                     // {증서번호}는 {30글자}를 초과할 수 없습니다.
                     dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='arguMsg1' /><spring:message code='crm.info.ssnCrnNoMaxLenChk' var='arguMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${arguMsg1}, ${arguMsg2}' />");
                     $("#ssnCrnNo").focus();
                     return false;
                 };

             } else {
              // 법인 필수 항목 체크
                  if ( dms.string.isEmpty($("#custNmSearchC").val())) {
                      dms.notification.warning("<spring:message code='crm.lbl.corporation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                      $("#custNmSearchC").focus();
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

                  if ( dms.string.isNotEmpty(ssnCrnNoCVal) && ssnCrnNoCVal.length > 30 ) {
                      // {증서번호}는 {30글자}를 초과할 수 없습니다.
                      dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='arguMsg1' /><spring:message code='crm.info.ssnCrnNoMaxLenChk' var='arguMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${arguMsg1}, ${arguMsg2}' />");
                      $("#ssnCrnNoC").focus();
                      return false;
                  };

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
             //// console.log(saveData);
             if (grid.cudDataLength != 0){
                 if ((saveData.insertList.length != 0) || (saveData.updateList.length != 0)) {
                     if($("input.flagYn:checked", "#addrGrid").length != 1 ){
                         //dms.notification.warning("<spring:message code='global.lbl.selectAddr' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                         dms.notification.warning("<spring:message code='global.lbl.selectAddr' var='arguMsg' /><spring:message code='global.lbl.check' var='arguMsg2' /><spring:message code='global.info.itemOnlyMsg' arguments='${arguMsg},${arguMsg2}' />");
                         return false;
                     }
                 }
             }


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

             param["custNm"] = $("#custNmSearch").val();
             if ($("#smsReceiveYn").prop("checked")){ param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
             if ($("#hpNoReceiveYn").prop("checked")){ param["hpNoReceiveYn"] = "Y" } else { param["hpNoReceiveYn"] = "N" };
             if ($("#telReceiveYn").prop("checked")){ param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
             if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
             if ($("#hpNoAddImposYn").prop("checked")){ param["hpNoAddImposYn"] = "Y" } else { param["hpNoAddImposYn"] = "N" };
             if ($("#hpNoInvldYn").prop("checked")){ param["hpNoInvldYn"] = "Y" } else { param["hpNoInvldYn"] = "N" };

             if (oldHpNo != hpNoVal) {
                 param["hpNoInvldYn"] = "N";
             }

             param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
             param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
             param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
             param["ssnCrnNo"] = $("#ssnCrnNo").val();

             param["childrenCnt"] = $("#childrenCnt").data("kendoExtNumericTextBox").value();
             param["ageDtl"] = $("#ageDtl").data("kendoExtNumericTextBox").value();

           //법인인 경우 ID 재 정의
             if (custTpVal == "02") {
                 param["custNm"] = $("#custNmSearchC").val();
                 param["custTp"] = $("#custTpC").data("kendoExtDropDownList").value();
                 param["custNo"] = $("#custNoC").val();
                 param["custCd"] = $("#custCdC").data("kendoExtDropDownList").value();
                 param["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                 param["ssnCrnNo"] = $("#ssnCrnNoC").val();
                 param["mngScId"] = $("#mngScIdC").val();
                 param["mngTecId"] = $("#mngTecIdC").val();
                 param["custHoldTp"] = $("#custHoldTpC").data("kendoExtDropDownList").value();
                 param["officeTelNo"] = $("#officeTelNoC").val();
                 param["officeFaxNo"] = $("#officeFaxNoC").val();
                 param["emailNm"] = $("#emailNmC").val();
                 param["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                 param["cmpScaleCont"] = $("#cmpScaleContC").val();
                 param["cmpTp"] = $("#cmpTpC").data("kendoExtDropDownList").value();
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
                 var param1 =
                     $("#custDtlTabArea").serializeObject(
                         $("#custDtlTabArea").serializeArrayInSelector("[data-json-obj='true']")
                     );
                 $.extend(param,param1);
                 if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
                 if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };

                 param["oldCustNm"] = $("#oldCustNm").val();
                 param["oldHpNo"] = $("#oldHpNo").val();
                 param["oldMathDocTp"] = $("#oldMathDocTp").val();
                 param["oldSsnCrnNo"] = $("#oldSsnCrnNo").val();
                           
                 var birthDt = $("#birthDt").data("kendoExtMaskedDatePicker").value();
                 if ( dms.string.isNotEmpty(birthDt) ) {
                     param["birthDt"] = kendo.toString(kendo.parseDate(birthDt),"<dms:configValue code='dateFormat' />");
                 }else{
                     param["birthDt"] = "";
                 }
             }

             param["marryDt"] = $("#marryDt").data("kendoExtMaskedDatePicker").value();

             param["groupDS"] = groupDS;
             param["tagDS"] = tagDS;
             param["hobbyDS"] = hobbyDS;
 
             // console.log("---btnCustSave---")
             // console.log(param);

             $.ajax({
                 url:url
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,beforeSend:function(xhr){
                     dms.loading.show();
                 }
                 ,error:function(jqXHR,status,error){
                     // console.log(jqXHR);
                     dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     // console.log("success!!!!");
                     // console.log(result);
                     // console.log(result["custNo"]);
                     if (result["custNo"] != ""){
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#custNo").val(result["custNo"]);

                         if (grid.cudDataLength != 0){
                             // console.log("address save!!");
                             // console.log(result["custNo"]);
                             btnSaveAddress(result["custNo"]);
                         } else {
                             // console.log("address UnSave!!");
                             //$("#btnCustSearch").click();
                         }
                     }
                 }
                 ,complete:function(xhr, status) {
                     dms.loading.hide();
                 }
             }).done(function(result) {
                 // console.log("btnCustSave Done!!!!");
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

//                  if ( dms.string.isEmpty($("#prefCommMthCd").val())) {
//                      dms.notification.warning("<spring:message code='crm.lbl.prefCommMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                      $("#prefCommMthCd").focus();
//                      return false;
//                  }

//                  if ( dms.string.isEmpty($("#prefCommNo").val())) {
//                      dms.notification.warning("<spring:message code='crm.lbl.prefCommNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                      $("#prefCommNo").focus();
//                      return false;
//                  }
             } else {
                 // 법인 필수 항목 체크
                 if ( dms.string.isEmpty($("#custNmC").val())) {
                     dms.notification.warning("<spring:message code='crm.lbl.corporation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
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

             //if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" } else { param["bhmcYn"] = "N" };
             //if ($("#smsReceiveYn").prop("checked")){ param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
             //if ($("#hpNoReceiveYn").prop("checked")){ param["hpNoReceiveYn"] = "Y" } else { param["hpNoReceiveYn"] = "N" };
             //if ($("#telReceiveYn").prop("checked")){ param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
             //if ($("#dmReceiveYn").prop("checked")){ param["dmReceiveYn"] = "Y" } else { param["dmReceiveYn"] = "N" };
             //if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
             //if ($("#faxReceiveYn").prop("checked")){ param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };
             if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
             if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };
             if ($("#hpNoInvldYn").prop("checked")){ param["hpNoInvldYn"] = "Y" } else { param["hpNoInvldYn"] = "N" };
             if ($("#hpNoAddImposYn").prop("checked")){ param["hpNoAddImposYn"] = "Y" } else { param["hpNoAddImposYn"] = "N" };


//              if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
//                  param["chgBuyYn"] = "N";
//              }

             param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
             //param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
             param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
             //param["custHoldTpDtl"] = $("#custHoldTpDtl").data("kendoExtDropDownList").value();
             //param["ssnCrnNo"] = $("#ssnCrnNo").data("kendoMaskedTextBox").value();

             param["oldCustNm"] = $("#oldCustNm").val();
             param["oldHpNo"] = $("#oldHpNo").val();
             param["oldMathDocTp"] = $("#oldMathDocTp").val();
             param["oldSsnCrnNo"] = $("#oldSsnCrnNo").val();
             //param["custNm"] = $("#custNm").val();
             param["hpNo"] = $("#hpNo").val();
             param["custNo"] = $("#custNo").val();
             param["marryDt"] = $("#marryDt").data("kendoExtMaskedDatePicker").value();

//              if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
//                  param["chgBuyYn"] = "N";
//              }

             var birthDt = $("#birthDt").data("kendoExtMaskedDatePicker").value();
             if ( dms.string.isNotEmpty(birthDt) ) {
                 param["birthDt"] = kendo.toString(kendo.parseDate(birthDt),"<dms:configValue code='dateFormat' />");
             }else{
                 param["birthDt"] = "";
             }
             //param["birthDt"] = $("#birthDt").data("kendoExtMaskedDatePicker").value();
             param["groupDS"] = groupDS;
             param["tagDS"] = tagDS;
             param["hobbyDS"] = hobbyDS;
             param["commandTp"] = "CUSTDTLUPDATE";

             var url = "<c:url value='/crm/cif/customerInfo/updateCustomer.do' />";

             // console.log("Saving of Customer Detail Info.!!!");
             // console.log(url);
//              console.log(param);

             $.ajax({
                 url:url
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,beforeSend:function(xhr){
                     dms.loading.show();
                 }
                 ,error:function(jqXHR,status,error){
                     // console.log(jqXHR);
                     dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     //// console.log(result);
                     if (result["custNo"] != ""){
                         // console.log("success!!!!");
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#custNo").val(result["custNo"]);
                         //$("#btnCustSearch").click();
                     }

                 }
                 ,complete:function(xhr, status) {
                     dms.loading.hide();
                 }
             }).done(function(result) {
                 // console.log("btnCustSave Done!!!!");
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


        //메시지이력 그리드 - 시작
        $("#msgHistoryGrid").kendoExtGrid({
               gridId:"G-CRM-0529-194512"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/crm/cif/customerInfo/selectMsgHistorys.do' />"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               params["recordCountPerPage"]    = options.pageSize;
                               params["pageIndex"]             = options.page;
                               params["firstIndex"]            = options.skip;
                               params["lastIndex"]             = options.skip + options.take;
                               params["sort"]                  = options.sort;

                               params["sCustNo"] = $("#custNo").val();

                               //// console.log('msgHistoryGrid params:',kendo.stringify(params) );
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
           ,editable:false
           ,height:280
           ,navigatable:false
           ,pageable:false
           ,filterable:false
           ,sortable :false
           ,scrollable: {
               virtual: true
           }
           ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,columns:[
                   {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                       ,filterable:false
                       , attributes:{"class":"ac"}
                   }
                   ,{field:"sendDt", title:"<spring:message code='crm.lbl.sendDate' />", width:130                /* 발송일 */
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
                   ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                /* 연락일 등록일 */
                       , attributes:{"class":"ac"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"
                   }
           ]
           });
        //메시지이력 그리드 - 종료



     //연계인 그리드 설정
         $("#gridRel").kendoExtGrid({
             gridId:"G-CRM-0529-111502"
             , dataSource:{
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
                                 , upperCustNo         :{type:"string", editable:false}
                                 , pconCustNo         :{type:"string", editable:false}
                                 , pconTp              :{type:"string", validation:{required:true}}
                                 , regDt         :{type:"date", editable:false}
                             }
                         }
                 }
             }
             ,edit:function(e) {
                 if(!e.model.isNew()) {
                     var selectedVal = this.dataItem(this.select());
                     var pconTp = selectedVal.pconTp;
                     var pconCustNo = selectedVal.pconCustNo;

                     if (dms.string.isNotEmpty(pconCustNo)) { // pconTp == "06" || pconTp == "07") {
                        this.closeCell();
                     }

                 }
             }
             ,autoBind:false
             ,filterable:false
             ,navigatable:true
             ,height:280
             ,sortable:false
             ,pageable:true
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
             ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,columns:[
                {_field:"chk", title:"<spring:message code='crm.lbl.majorCustRel' />", template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:60, attributes:{"class":"ac"}}
                ,{field:"pconTp",            title:"<spring:message code='global.lbl.type' />",  width:100, attributes:{"class":"ac"}
                     , editor:function(container, options){
                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , dataSource:dms.data.cmmCdFilter(pconTpList)
                         });
                     }
                    , template:'#if (pconTp !== "" && pconTpMap[pconTp] !== undefined){# #= pconTpMap[pconTp]# #}#'
                }
                ,{field:"relNm",            title:"<spring:message code='crm.lbl.relCustNm' />",  width:120, attributes:{"class":"ac"}
                }
                ,{field:"telNo",             title:"<spring:message code='global.lbl.homeTelNo' />",  width:150, attributes:{"class":"ac"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                            mask:"00000000000000000000"
                            ,promptChar: " "
                        });
                    }
                }
                ,{field:"hpNo",              title:"<spring:message code='global.lbl.hpNo' />",  width:150, attributes:{"class":"ac"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                            mask:"00000000000"
                            ,promptChar: " "
                        });
                    }
                }
                ,{field:"wechatId",              title:"<spring:message code='global.lbl.wechatId' />",  width:150, attributes:{"class":"ac"}}
                ,{field:"regDt",             title:"<spring:message code='global.lbl.regDt' />",  width:100, attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                }
             ]
         });

         // 보유차량 - selectCustomerInfoMain.jsp, selectCallCenterActionPopup.jsp, selectCustHaveCarSearchPopup.do
         $("#haveCarGrid").kendoExtGrid({
             gridId:"G-CRM-0529-121502"
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

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
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
                                 , custRegDt           :{type:"date"}
                                 , dlrNm               :{type:"string"}
                             }
                         }
                 }
             }
             ,editable:false
             ,autoBind:false
             ,filterable:false
             ,navigatable:false
             ,pageable:false
             ,scrollable: {
                 virtual: true
             }
             ,scrollable: true
             ,height:280
             ,sortable:false
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,columns:[
                 {field:"useYn",  title:"<spring:message code='global.lbl.gubun' />",   width:130, attributes:{"class":"ac"}
                     ,template:function(dataItem){
                         return (dataItem.useYn == "Y")?"<spring:message code='global.lbl.haveCar' />":"<spring:message code='global.lbl.historyCar' />";
                     }
                 }
                 ,{field:"ncarDstinCd",  title:"<spring:message code='sal.lbl.carBrand' />",   width:130, attributes:{"class":"ac"}
                     ,template:'#if (ncarDstinCd !== "" && ncarDstinCdMap[ncarDstinCd] !== undefined){# #= ncarDstinCdMap[ncarDstinCd]# #}#'
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
                 ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.saleDt' />", width:130, attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                 } //구매일자
                 ,{field:"invcPublDt", title:"<spring:message code='sal.lbl.invoiceDt' />", width:130, attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                 } //영수증일자
                 ,{field:"custRegDt", title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                 } //등록일

             ]
         });

         /******************************************************
          * 활동 그리드 시작
          ******************************************************/
         $("#activeGrid").kendoExtGrid({
             gridId:"G-CRM-0529-111504"
             , dataSource:{
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

                             // console.log('activeGrid params:',kendo.stringify(params) );
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
             ,height:280
             ,sortable:false
             ,filterable:false
             ,navigatable:false
             ,pageable:false
             //,selectable:"row"
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
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
                         ,{field:"prefCommNo", title:"<spring:message code='crm.lbl.prefCommNo' />", width:100}                 /* 선호연락처 */
             ]
         });
         /******************************************************
          * 활동 그리드 종료
          ******************************************************/

         // 추적이력 그리드
        $("#activeHistoryTabGrid").kendoExtGrid({
            gridId:"G-CRM-0529-194356"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerInfo/selectSalesOpptTraceMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var seq = $("#seq").val();

                            // 고객번호
//                             if ( dms.string.isEmpty(seq) ) {
//                                 dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
//                                 return false;
//                             };

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sSaleOpptSeq"]           = seq;

                            // console.log("activeHistoryTabGrid Params!!!");
                            // console.log(params);
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
                            ,mngScNm:{type:"string", editable:true}
                            ,traceMthNm:{type:"string", editable:false}
                            ,traceGradeNm:{type:"string", editable:false}
                            ,traceCont:{type:"string", editable:false}
                            ,nextTraceMthNm:{type:"string", editable:false}
                            ,traceDt:{type:"date", editable:false}
                            ,nextTraceDt:{type:"date", editable:false}
                            ,traceDtFormat:{type:"date", editable:false}
                            ,nextTraceDtFormat:{type:"date", editable:false}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateFormat' />");
                                elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
            }
            ,editable:false
            ,height:280
            ,sortable:false
            ,filterable:false
            ,navigatable:false
            ,pageable:false
            ,scrollable: {
                virtual: true
            }
            ,autoBind:false
            ,selectable:"row"
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:[
               {field:"mngScNm", title:"<spring:message code='crm.lbl.tracer' />", width:100, attributes:{"class":"ac"}}
               ,{field:"traceDtFormat", title:"<spring:message code='crm.lbl.traceDt' />", width:120, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (traceDtFormat !== null ){# #= kendo.toString(data.traceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"traceMthNm", title:"<spring:message code='crm.lbl.traceMth' />", width:70, attributes:{"class":"ac"}}
               ,{field:"traceGradeNm", title:"<spring:message code='crm.lbl.activeGrade' />", width:70, attributes:{"class":"ac"}}
               ,{field:"traceCont", title:"<spring:message code='crm.lbl.traceCont' />", width:300, attributes:{"class":"al"}}
               ,{field:"nextTraceDtFormat", title:"<spring:message code='crm.lbl.nextTraceDt' />", width:120, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (nextTraceDtFormat !== null ){# #= kendo.toString(data.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"nextTraceMthNm", title:"<spring:message code='crm.lbl.nextTraceMthCd' />", width:120, attributes:{"class":"ac"}}
            ]
        });
        // 추적이력 그리드 끝

        // 회전기록 그리드 시작
        $("#leadStatusExchangeTabGrid").kendoExtGrid({
            gridId:"G-CRM-0529-105012"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerInfo/selectSalesOpptProcessMgmtHist.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var seq = $("#seq").val();

                            // 리드번호
//                             if ( dms.string.isEmpty(seq) ) {
//                                 dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
//                                 return false;
//                             };

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sSaleOpptSeq"]           = seq;

                            // console.log("leadStatusExchangeTabGrid Params!!!");
                            // console.log(params);
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
                            ,mngScNm:{type:"string", editable:true}
                            ,regUsrNm:{type:"string", editable:false}
                            ,regDt:{type:"date", editable:false}
                            ,regDtFormat:{type:"date", editable:false}
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
            ,editable:false
            ,height:280
            ,sortable:false
            ,filterable:false
            ,navigatable:false
            ,pageable:false
            ,autoBind:false
            ,selectable:"row"
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:[
               {field:"regDtFormat", title:"<spring:message code='global.lbl.dateTime' />", width:120, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"leadStatCont", title:"<spring:message code='crm.lbl.leadStat' />", width:200, attributes:{"class":"ac"}}
               ,{field:"mngScNm", title:"<spring:message code='crm.lbl.prsNm' />", width:70, attributes:{"class":"ac"}}
               ,{field:"regUsrNm", title:"<spring:message code='global.lbl.handler' />", width:70, attributes:{"class":"ac"}}
               ,{field:"sysMesgCont", title:"<spring:message code='crm.title.detailCont' />", width:300, attributes:{"class":"al"}
                   ,template:function(dataItem) {  //에러메세지
                       var str = "";
                       if(dms.string.isNotEmpty(dataItem.sysMesgCont)){
                           str += "<div>" + dataItem.sysMesgCont + "</div>";
                       };
                       return str;
                   }
               }
            ]
        });
        // 회전기록 그리드 끝

        // 정비이력그리드 -- selectCustomerInfoMain.jsp, selectCallCenterActionPopup.jsp 와 같이 수정해주세요
        $("#lbrGrid").kendoExtGrid({
            gridId:"G-CRM-0529-112633"
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

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
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
            ,height:280
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

         /*************************************************************
          * 멤버십 그리드
          *************************************************************/
          $("#membershipGrid").kendoExtGrid({
              gridId:"G-CRM-0529-175312"
              ,dataSource:{
                   transport:{
                      read:{
                          url:"<c:url value='/crm/cif/customerInfo/selectMemberships.do' />"
                      }
                      ,parameterMap:function(options, operation) {
                          if (operation === "read") {

                              var params = {};

                              params["recordCountPerPage"] = options.pageSize;
                              params["pageIndex"] = options.page;
                              params["firstIndex"] = options.skip;
                              params["lastIndex"] = options.skip + options.take;
                              params["sort"] = options.sort;

                              params["sCustNo"]  = $("#custNo").val();

                              //// console.log("1111멤버십 : ",kendo.stringify(params));
                              return kendo.stringify(params);

                          } else if (operation !== "read" && options.models) {
                              return kendo.stringify(options.models);
                          }
                      }
                  }
                  ,schema:{
                      model:{
                          id:"membershipNo"
                          ,fields:{
                              rnum:{type:"string", editable:false}
                              ,dlrCd:{type:"string", validation:{required:false}}
                              ,membershipNo:{type:"string", validation:{required:false}}
                              ,pointExtcExpcDt:{type:"date", validation:{required:false}}
                              ,regDt:{type:"date", validation:{required:false}}
                              ,lastPointVal:{type:"number", validation:{required:false}}
                          }
                      }
                  }
              }
              ,autoBind:false
              ,height:77
              ,multiSelectWithCheckbox:false
              ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
              ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
              ,appendEmptyColumn:true           //빈컬럼 적용. default:false
              ,enableTooltip:true               //Tooltip 적용, default:fa
              ,filterable:false
              ,sortable:false
              ,pageable:false
              ,scrollable: {
                  virtual: true
              }
              ,editable:false
              ,selectable:"row"
              ,columns:[
                  {field:"rnum", title:"<spring:message code='global.lbl.no' />",hidden:true, width:60, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100,attributes:{"class":"ac"}} // 딜러코드
                  ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", width:130,attributes:{"class":"ac"}} //멥머십 번호
                  ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>", hidden:true, width:100,attributes:{"class":"ac"}} //카드번호 일련번호
                  ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"al"}} //고객명
                  ,{field:"gradeCd", title:"<spring:message code='global.lbl.gradeCd'/>", width:100
                      ,attributes:{"class":"ac"}
                      ,template:"# if(gradeCodeListMap[gradeCd] != null) { # #= gradeCodeListMap[gradeCd].gradeNm# # }#"
                  }//등급
                  ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.realTotAmt'/>", width:100
                      ,attributes:{"class":"ar"}
                      ,format:"{0:n0}"
                      ,decimal:0
                  }//가용금액
                  ,{field:"lastPointVal", title:"<spring:message code='global.lbl.savePoint'/>(<spring:message code='global.lbl.avlbStock'/>)", width:100
                      ,attributes:{"class":"ar"}
                      ,format:"{0:n0}"
                      ,decimal:0
                  }//적립포인트(가용)
                  ,{field:"pointExtcExpcDt", title:"<spring:message code='crm.lbl.pointExtcExpcDt'/>", width:100
                      ,attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }//포인트소멸예정일
                  ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo'/>", width:140,attributes:{"class":"ac"}}//VIN번호
                  ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo'/>", width:100,attributes:{"class":"ac"}}//차량번호
                  ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm'/>", width:100,attributes:{"class":"al"}}//차종명
                  ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm'/>", width:100,attributes:{"class":"al"}}//차관
                  ,{field:"custTp", title:"<spring:message code='global.lbl.custTp' />", width:100,attributes:{"class":"ac"}
                      , template:'#if (custTp !== "" && custTpMap[custTp] !== undefined){# #= custTpMap[custTp]# #}#'
                      , editor:function(container, options){
                          $('<input data-bind="value:' + options.field + '"  />')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              dataTextField:"cmmCdNm"
                              , dataValueField:"cmmCd"
                              , dataSource:custTpList
                          });
                          $('<span class="k-invalid-msg" data-for="custTp"></span>').appendTo(container);
                      }
                  }
                  ,{field:"custCd", title:"<spring:message code='global.lbl.custCd' />", width:100,attributes:{"class":"ac"}
                      , template:'#if (custCd !== "" && custCdMap[custCd] !== undefined){# #= custCdMap[custCd]# #}#'
                      , editor:function(container, options){
                          $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , dataSource:custCdList
                         });
                      $('<span class="k-invalid-msg" data-for="custCd"></span>').appendTo(container);
                      }
                  }
                  ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", width:100,attributes:{"class":"ac"}} //이동전화
                  ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo'/>", width:100,attributes:{"class":"ac"}}//고전(유선)전화
                  ,{field:"regDt", title:"<spring:message code='crm.lbl.membershipRegistDt'/>", width:100,attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }//등록일
              ]
              ,change:function(e){

                 var selectedItem = this.dataItem(this.select());
                 var custNo = selectedItem.custNo;

                 if ( dms.string.isNotEmpty(custNo) ) {
                     $("#tabPointHisGrid").data("kendoExtGrid").dataSource.read();  //포인트이력
                     $("#tabCardListGrid").data("kendoExtGrid").dataSource.read();  //충전카드이력
                 }
               }
              ,dataBound:function (e) { //그리드가 로딩된 후 화면컨트롤 할때 해야 하는 부분

                  if ( e.sender.dataSource._total == 1 ) {

                      var grid = this
                      , selectRow
                      selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                      grid.select(selectRow);

                  };

              }

          });

          <c:set value="${policy}" var="membershipStan" /> <!-- C:고객, V:자동차 -->

          <!-- 차량기준일때 그리드에 차량 정보를 보여준다.-->
           <c:choose>
                <c:when test="${membershipStan eq 'V'}">
                var membershipGrid = $("#membershipGrid").data("kendoExtGrid");
                    membershipGrid.showColumn("vinNo");
                    membershipGrid.showColumn("carRegNo");
                    membershipGrid.showColumn("carlineNm");
                    membershipGrid.showColumn("modelNm");
                </c:when>
                <c:when test="${membershipStan eq 'C'}">
                   var membershipGrid = $("#membershipGrid").data("kendoExtGrid");
                    membershipGrid.hideColumn("vinNo");
                    membershipGrid.hideColumn("carRegNo");
                    membershipGrid.hideColumn("carlineNm");
                    membershipGrid.hideColumn("modelNm");
                </c:when>
            </c:choose>

        // 포인트이력 tabPointHisGrid
        $("#tabPointHisGrid").kendoExtGrid({
            gridId:"G-CRM-0529-133012"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerInfo/selectMembershipPointHiss.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var grid = $('#membershipGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            if ( dms.string.isNotEmpty(selectedItem) ) {

                                params["sMembershipNo"] = selectedItem.membershipNo;
                                params["sCardTpCd"] = "01";

                            } else {
                                return;
                            }

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
                            ,lastPointVal:{type:"number", validation:{required:false}, editable:false}
                            ,occrDt:{type:"string", validation:{required:false}, editable:false}
                            ,prsnNm:{type:"string", validation:{required:false}, editable:false}
                        }
                    }
                }
            }
            ,autoBind:false
            ,height:77
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,sortable:false
            ,pageable:false
            ,scrollable: {
                virtual: true
            }
            ,editable:false
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //딜러코드
                ,{field:"membershipNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 번호
                ,{field:"membershipTp", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 타입
                ,{field:"cardNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //카드번호
                ,{field:"pointCdNm", title:"<spring:message code='crm.lbl.pointCdCont'/>",attributes:{"class":"ac"}} //종류
                ,{field:"pointTp", title:"<spring:message code='global.lbl.arPoint'/>", width:250,attributes:{"class":"ac"},hidden:true } //발생포인트
                ,{field:"occrPointVal", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ar"},hidden:true } //발생포인트
                ,{field:"occrPointVal2", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ar"} } //발생포인트-부호포함
                ,{field:"lastPointVal", title:"<spring:message code='crm.lbl.usePoint'/>", width:100,attributes:{"class":"ar"}
                    ,format:"{0:n0}"
                    ,decimal:0
                } //가용포인트
                ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                } //발생일(현재 부서로 되어 있어서 추후 변경해야함)
                ,{field:"prsnNm", title:"<spring:message code='crm.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //담당자
                ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />", width:100 , attributes:{"class":"ac"}// 사용처
                    ,sortable:false
                    ,template:"#=dcUseTpArrVal(useTp)#"
                }
                ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"},sortable:false ,width :150}  // 사용번호
            ]

        });


        // 충전카드이력 tabCardListGrid
        $("#tabCardListGrid").kendoExtGrid({
            gridId:"G-CRM-0529-141712"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerInfo/selectMembershipPointHiss.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var grid = $('#membershipGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            if ( dms.string.isNotEmpty(selectedItem) ) {
                                params["sMembershipNo"] = selectedItem.membershipNo;
                                params["sCardTpCd"] = "02";
                            } else {
                                return;
                            }

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
                            ,occrPointVal:{type:"number", validation:{required:false}, editable:false}
                            ,occrPointVal2:{type:"string", validation:{required:false}, editable:false}
                            ,realTotAmt:{type:"number", validation:{required:false}, editable:false}
                            ,occrDt:{type:"string", validation:{required:false}, editable:false}
                            ,prsnNm:{type:"string", validation:{required:false}, editable:false}

                        }
                    }
                }
            }
            ,autoBind:false
            ,height:77
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,sortable:false
            ,pageable:false
            ,scrollable: {
                virtual: true
            }
            ,editable:false
            ,columns:[
                      {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                      ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo'/>",width:130, attributes:{"class":"ac"}} //카드번호
                      ,{field:"pointCdNm", title:"<spring:message code='crm.lbl.pointCdCont'/>",width:120, attributes:{"class":"ac"}}
                      ,{field:"pointCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //포인트 코드
                      ,{field:"pointTp", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"},hidden:true } //발생포인트
                      ,{field:"occrPointVal", title:"<spring:message code='global.lbl.amt'/>", width:100,attributes:{"class":"ar"}    //금액
                          ,template:'#if(pointTp !== ""){# #= occrPointValFormat(pointTp, occrPointVal) # #}#'
                      }
                      ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.realTotAmt'/>", width:100,attributes:{"class":"ar"}
                          ,format:"{0:n}"
                          ,decimal:0
                      } //가용금액
                      ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"}
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                      } //발생일(현재 부서로 되어 있어서 추후 변경해야함)
                      ,{field:"prsnNm", title:"<spring:message code='crm.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //담당자
                      ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />", width:100 , attributes:{"class":"ac"}// 사용처
                          ,sortable:false
                          ,template:"#=dcUseTpArrVal(useTp)#"
                      }
                      ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"},sortable:false ,width :150}  // 사용번호
            ]

        });

         // 블루멤머십
         /*$("#blueMbrShipGrid").kendoExtGrid({
             gridId:"G-CRM-0529-121233"
             , dataSource:{
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
                            params["identityNumber"]  = $("#ssnCrnNo").val(); // 증서번호
                            params["blueMembershipNo"] =  $("#blueMembershipNo").val(); // 회원카드번호
                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                 ,schema:{
                     model:{
                         id:"pointDt",
                         fields:{
                             DealerId:{type:"string", editable:false},
                             Type:{type:"string", editable:false},
                             Point:{type:"string", editable:false},
                             Remark:{type:"string", editable:false},
                             UpdateDate:{type:"string", editable:false}
                         }
                     }
                 }
            }
            , editable:false
            , autoBind:false
            , sortable:false
            , navigatable:true
            , pageable:false
            , height:250
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,columns:[
                  {field:"DealerId", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //딜러코드
                  ,{field:"Type", title:"<spring:message code='crm.lbl.blueMemTpCd'/>", width:100,attributes:{"class":"ac"}
                      ,template:"#if (Type !== 1 ){# #= '<spring:message code='crm.lbl.new'/>' # #} else {# #= '<spring:message code='crm.lbl.consume'/>' # #}#"
                   } //발생포인트
                  ,{field:"Point", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //point
                  ,{field:"Remark", title:"<spring:message code='global.lbl.cont'/>", width:300,attributes:{"class":"al"} } //비고
                  ,{field:"UpdateDate", title:"<spring:message code='global.lbl.arDt'/>", width:120,attributes:{"class":"ac"}
                      ,template:"#if (UpdateDate !== null ){# #= kendo.toString(kendo.parseDate(UpdateDate,'yyyyMMddHHmmss'), '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                   } //포인트 소비
             ]
         });*/

        // 보험정보
           $("#incGrid").kendoExtGrid({
               gridId:"G-CRM-0529-133309"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/sal/inc/incJoinInfo/selectIncJoinInfo.do' />"
                       },
                       parameterMap:function(options, operation) {
                           if (operation == "read") {
                               var params = {};
                               params["recordCountPerPage"] = options.pageSize;
                               params["pageIndex"] = options.page;
                               params["firstIndex"] = options.skip;
                               params["lastIndex"] = options.skip + options.take;
                               params["sort"] = options.sort;

                               params["sDlrCd"] = $("#dlrCd").val();
                               params["sCustNo"]  = $("#custNo").val();

                               return kendo.stringify(params);
                           }else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       model:{
                           id:"incPk"
                           ,fields:{
                                incPk    :{type:"string"}
                               ,custNo:{type:"string"}
                               ,custNm:{type:"string"}
                               ,custTelNo:{type:"string"}
                               ,carBrandNm:{type:"string"}
                               ,carlineNm:{type:"string"}
                               ,modelNm  :{type:"string"}
                               ,vinNo    :{type:"string"}
                               ,incStatNm:{type:"string"}
                               ,incCsNm:{type:"string"}
                               ,contractNo :{type:"string"}
                               ,incCmpCd :{type:"string"}
                               ,incNo:{type:"string"}
                               ,incExpcTotAmt:{type:"number"}
                               ,realIncTotAmt:{type:"number"}
                               ,incFeeTotAmt:{type:"number"}
                               ,saleId   :{type:"string"}
                               ,incJoinDt:{type:"date"}
                               ,incPrsnNm:{type:"string"}
                               ,incProfitNm:{type:"string"}
                           }
                       }
                   }
               }
               ,editable:false
               ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
               ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
               ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
               ,appendEmptyColumn:true           //빈컬럼 적용. default:false
               ,enableTooltip:true               //Tooltip 적용, default:false
               ,scrollable: {
                   virtual: true
               }
               ,height:77
               ,pageable:false
               ,resizable:true
               ,autoBind:false
               ,sortable:false
               ,filterable:false
               ,columns:[
                    {field:"carBrandNm"
                         ,title:"<spring:message code='sal.lbl.brandNm' />"
                         ,width:100
                         ,attributes:{"class":"al"}
                    } // 브랜드명
                    ,{field:"carlineNm"
                       ,title:"<spring:message code = 'global.lbl.carLine'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //차종
                    ,{field:"modelNm"
                       ,title:"<spring:message code = 'global.lbl.model'/>"
                       ,width:120
                       ,attributes:{"class":"al"}
                     } //모델
                    ,{field:"vinNo"
                       ,title:"<spring:message code = 'global.lbl.vinNum'/>"
                       ,width:140
                       ,attributes:{"class":"ac"}
                     } //VIN NO
                    ,{field:"incStatNm"
                         ,title:"<spring:message code = 'sal.lbl.incStat'/>"
                         ,width:100
                         ,attributes:{"class":"ac"}
                     } //보험상태
                    ,{field:"incCsNm"
                         ,title:"<spring:message code = 'sal.lbl.incTps'/>"
                         ,width:100
                         ,attributes:{"class":"ac"}
                    } //보험종류
                    ,{field:"contractNo"
                       ,title:"<spring:message code = 'global.lbl.contractNo'/>"
                       ,width:110
                       ,attributes:{"class":"ac"}
                     } //계약번호
                    ,{field:"incCmpCd"
                       ,title:"<spring:message code = 'global.lbl.incCmp'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,template:'# if (incCmpCdMap[incCmpCd] != null){# #= incCmpCdMap[incCmpCd]# # }#'
                     } //보험회사
                    ,{field:"incNo"
                       ,title:"<spring:message code = 'global.lbl.incNo'/>"
                       ,width:120
                       ,attributes:{"class":"ac"}
                     } //보험번호
                    ,{field:"incExpcTotAmt"
                       ,title:"<spring:message code = 'sal.lbl.incExpcAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:n2}"
                     } //예상금액
                    ,{field:"realIncTotAmt"
                       ,title:"<spring:message code = 'sal.lbl.realIncAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:n2}"
                     } //실보험금액
                    ,{field:"incFeeTotAmt"
                       ,title:"<spring:message code = 'ser.lbl.incFeeAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:n2}"
                     } //보험수수료
                    ,{field:"saleId"
                       ,title:"<spring:message code = 'sal.lbl.salesAdvisor'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //판매고문
                    ,{field:"incJoinDt"
                       ,title:"<spring:message code = 'global.lbl.incJoinDt'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                     } //보험가입일
                    ,{field:"incPrsnNm"
                       ,title:"<spring:message code = 'sal.lbl.incPerson'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //보험담당자
                    ,{field:"incProfitNm"
                       ,title:"<spring:message code = 'sal.lbl.incProfitNm'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                    } //보험수익자명
                ]
           });

         // 금융정보
         $("#fincGrid").kendoExtGrid({
             gridId:"G-CRM-0529-052913"
                 ,dataSource:{
                     transport:{
                         read:{
                             url:"<c:url value='/sal/fim/fincInfoMng/selectFincInfoMngCRMSearch.do' />"
                         },
                         parameterMap:function(options, operation) {
                             if (operation == "read") {
                                 var params = {};
                                 params["recordCountPerPage"] = options.pageSize;
                                 params["pageIndex"] = options.page;
                                 params["firstIndex"] = options.skip;
                                 params["lastIndex"] = options.skip + options.take;
                                 params["sort"] = options.sort;

                                 //params["sDlrCd"] = dlrCd;
                                 //params["sContractNo"] = $("#contractNo").val();
                                 params["sDlrCd"] = $("#dlrCd").val();
                                 params["sCustCd"] = $("#custNo").val();

                                 return kendo.stringify(params);

                             }else if (operation !== "read" && options.models) {
                                 return kendo.stringify(options.models);
                             }
                         }
                     }
                     ,batch:false
                     ,schema:{
                         model:{
                             id:"contractNo",
                             fields:{
                                  dlrCd         :{type:"string", editable:false} // 딜러코드
                                 ,regUsrNm      :{type:"string"}                 // 등록인
                                 ,fincStatCd    :{type:"string"}                 // 신청상태
                                 ,publNm        :{type:"string"}                 // 발행명칭
                                 ,vinNo         :{type:"string"}                 // VIN NO
                                 ,fincCmpCd     :{type:"string"}                 // 금융사/은행
                                 ,fincReqAmt    :{type:"number"}                 // 대출금액
                                 ,fincRpayPrid  :{type:"number"}                 // 상환기간
                                 ,fincNo        :{type:"string"}                 // 대출번호
                                 ,contractNo    :{type:"string"}                 // 계약번호
                                 ,fincReqDt     :{type:"date"}                   // 신청일자
                                 ,updtDt        :{type:"date"}                   // 수정일자
                             }
                         }
                     }
                 }
                , editable:false
                ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
                ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
                ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:false
                ,height:77
                ,pageable:false
                ,resizable:true
                ,autoBind:false
                ,sortable:false
                ,scrollable: {
                    virtual: true
                }
                ,selectable:"row"
                ,filterable:false
                ,columns:[
                         {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
                         ,{field:"regUsrNm", title:"<spring:message code='sal.lbl.regUsrNm' />", attributes:{"class":"ac"}, width:120}  //등록인
                         ,{field:"fincStatNm", title:"<spring:message code='sal.lbl.requestStat' />", attributes:{"class":"ac"}, width:220}                 //신청상태
                         ,{field:"publNm", title:"<spring:message code='sal.lbl.publNm' />", attributes:{"class":"al"}, width:100}        //영수증발행명
                         ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"ac"}, width:100}       // VIN NO
                         ,{field:"fincCmpNm", title:"<spring:message code='global.lbl.fincCmp' />/<spring:message code='sal.lbl.bank' />", attributes:{"class":"al"}, width:100}                 //금융사/은행
                         ,{
                             field:"fincReqAmt", title:"<spring:message code='sal.lbl.fincReqAmt' />", attributes:{"class":"ar"}, width:100
                             , format:"{0:n2}"
                         }  //대출금액
                         ,{
                             field:"fincRpayPrid", title:"<spring:message code='sal.lbl.fincRpayPrid' />", attributes:{"class":"ar"}, width:100
                             , format:"{0:n0}"
                         }                 //상환기간
                         ,{field:"fincNo", title:"<spring:message code='sal.lbl.fincNo' />", attributes:{"class":"al"}, width:150}   //대출번호
                         ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"ac"}, width:120} // 계약번호
                         ,{
                             field:"fincReqDt", title:"<spring:message code='sal.lbl.reqDt' />", attributes:{"class":"ac"}, width:80
                             , format:"{0:"+vDtyyyyMMdd+"}"
                         }                 //신청일자
                         ,{
                             field:"updtDt", title:"<spring:message code='global.lbl.updtDt' />", attributes:{"class":"ac"}, width:80
                             , format:"{0:"+vDtyyyyMMdd+"}"
                         }                 //수정일자
                      ]
         });

      // 용품 그리드
         $("#accessoryGrid").kendoExtGrid({
             gridId:"G-CRM-0529-052944"
             ,dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSales.do' />"
                     },
                     parameterMap:function(options, operation) {
                         if (operation === "read") {
                             var params = {};

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             params["sDlrCd"] = $("#dlrCd").val();
                             params["sContractCustNo"] = $("#custNo").val();

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,batch:false
                 ,schema:{
                     model:{
                         id:"goodsContractNo"
                         ,fields:{
                             finDocNo:{type:"string"}          //수납문서번호
                             ,contractStatCd:{type:"string"}    //용품상태
                             ,goodsTp:{type:"string"}            //업무유형
                             ,contractCustNm:{type:"string"}    //고객명
                             ,carlineCd:{type:"string"}          //차종
                             ,goodsContractNo:{type:"string"}    //용품계약번호
                             ,goodsNm:{type:"string"}            //용품명칭
                             ,goodsCnt:{type:"number"}           //용품수
                             ,saleContractNo:{type:"string"}    //계약번호
                             ,telNo:{type:"string"}              //고객전화번호
                             ,vinNo:{type:"string"}              //vinNo
                             ,goodsContractDt:{type:"date"}      //오더일자
                             ,updtDtStr:{ type:"string" }

                         }
                     }
                 }
             }
             , editable:false
             ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,height:77
             ,scrollable: {
                 virtual: true
             }
             ,pageable:false
             ,resizable:true
             ,autoBind:false
             ,sortable:false
             ,filterable:false
             ,selectable:"row"
             ,columns:[
                       {field:"contractStatCd", title:"<spring:message code='sal.lbl.goodStat'/>", width:80
                           ,attributes:{"class":"ac"}
                           ,template:function(dataItem){
                               var contractStatCdNm = "";

                               if(!dms.string.isEmpty(contractStatCdMap[dataItem.contractStatCd])){
                                   contractStatCdNm = contractStatCdMap[dataItem.contractStatCd].cmmCdNm;
                               }

                               if(dataItem.contractStatCd == "10"){
                                   return "<span class='txt_label bg_green'>" + contractStatCdNm + "</span>";
                               }else if(dataItem.contractStatCd == "20"){
                                   return "<span class='txt_label bg_yellow'>" + contractStatCdNm + "</span>";
                               }else if(dataItem.contractStatCd == "30"){
                                   return "<span class='txt_label bg_orange'>" + contractStatCdNm + "</span>";
                               }else if(dataItem.contractStatCd == "40"){
                                   return "<span class='txt_label bg_blue'>" + contractStatCdNm + "</span>";
                               }else if(dataItem.contractStatCd == "50"){
                                   return "<span class='txt_label bg_red'>" + contractStatCdNm + "</span>";
                               }else if(dataItem.contractStatCd == "60"){
                                   return "<span class='txt_label bg_purple'>" + contractStatCdNm + "</span>";
                               }

                               return contractStatCdNm;
                           }
                       } //용품문서상태
                       ,{field:"goodsContractDt", title:"<spring:message code='sal.lbl.orderDate' />", width:80                                    //오더일자
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }
                       ,{field:"goodsTp", title:"<spring:message code='sal.lbl.goodsTp' />", width:90
                           ,attributes:{"class":"ac"}
                           ,template:"# if(goodsTpMap[goodsTp] != null) { # #= goodsTpMap[goodsTp].cmmCdNm# # }#"
                       }
//                        ,{field:"contractCustNm", title:"<spring:message code='global.lbl.custNm' />", width:130}                                   //고객명
                       ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />", width:100}                                       //차종
                       ,{field:"goodsContractNo", title:"<spring:message code='sal.lbl.goodsContractNo' />", width:150, attributes:{"class":"ac"}} //용품오더번호
                       ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:300, attributes:{"class":"al"}}                                                       //용품명
                       ,{field:"goodsCnt", title:"<spring:message code='sal.lbl.goodsCnt' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}", decimal:0}//용품수
                       ,{field:"saleContractNo", title:"<spring:message code='global.lbl.contractNo' />", width:120, attributes:{"class":"ac"}}    //계약번호
                       ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}                  //VIN
                       ,{field:"telNo", title:"<spring:message code='sal.lbl.telNo' />", width:100}                                                //고객전화번호
                       ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100}                                          //차량번호
                       ,{field:"expcGiEndDt", title:"<spring:message code='sal.lbl.expcGiEndDt' />", width:80                                      //출고예정일자
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }
                       ,{field      :"updtDtStr", hidden:true}//수정일시
                   ]
        });

         // 고객정보변경이력
         $("#infoUpdHistGrid").kendoExtGrid({
             gridId:"G-CRM-0529-052905"
             , dataSource:{
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

                             // console.log(params);
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
                                 , logDt        :{type:"date", editable:false}
                             }
                         }
                 }

             }
             , editable:false
             , autoBind:false
             , selectable:"row"
             , sortable:false
             , height:280
             , filterable:false
             , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             , enableTooltip:true               //Tooltip 적용, default:false
             , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                    ,attributes:{"class":"ac"}
                }
                , {field:"chgCdNm" , title:"<spring:message code='global.lbl.field' />", width:120, attributes:{"class":"ac"}}
                , {field:"befValue" , title:"<spring:message code='crm.lbl.beforeValue' />",  width:200, attributes:{"class":"al"}}
                , {field:"aftValue" , title:"<spring:message code='crm.lbl.afterValue' />",  width:200, attributes:{"class":"al"}}
                , {field:"regUsrNm" , title:"<spring:message code='global.lbl.updtUsrId' />",  width:100, attributes:{"class":"ac"}}
                , {field:"logDt"  , title:"<spring:message code='global.lbl.chgDt' />", width:120, attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
             ]
         });

         // 메모 (비고)
         $("#memoGrid").kendoExtGrid({
             gridId:"G-CRM-0529-153005"
             , dataSource:{
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
                         || e.sender.columns[e.container.index()].field == "memoCont"
                         ) {

                         if (regUsrId != loginUsrId) {
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
                     // console.log("memoGrid!! ");
                     // console.log(row);

//                      if (mngScId != gridData.regUsrId) {
//                        $("input.grid-checkbox-item", row).prop("disabled", true);
//                        $("input.shareYn", row).prop("disabled", true);
//                        $("table", "#memoGrid").removeClass('k-selectable');
//                      } else {
//                        $("table", "#memoGrid").addClass('k-selectable');
//                      }
                 });
             }
            /* ,change:function(e) {
                 var selectedVal = this.dataItem(this.select());
                 var mngScId = $("#mngScId").val();

                 // console.log(selectedVal);

                 if (mngScId != selectedVal.regUsrId) {
                     var row = this.tbody.find("tr");
                     //var row = this.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop("checked", false);
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop('disabled', false);
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).attr('checked', false);
                     //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop('disabled', true);
                     // console.log("row::::");
                     // console.log(row);
                     // console.log(row[selectedVal.rnum-1]);
                 }
             } */
             ,autoBind:false
             ,height:280
             ,pageable:false
             ,filterable:false
             ,sortable:false
             ,scrollable: {
                 virtual: true
             }
             ,navigatable:false
             , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             , enableTooltip:true               //Tooltip 적용, default:false
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
                     , template:'#if (memoTp !== "" && memoTpMap[memoTp] !== undefined){# #= memoTpMap[memoTp]# #}#'
                 } //유형
                 , {field:"memoCont", title:"<spring:message code='crm.lbl.remark' />",     width:500, attributes:{"class":"al"}} //메모
                 , {field:"shareYn", title:"<spring:message code='global.lbl.shareYn' />" , width:100, attributes:{"class":"ac"}
                     //, template:'<input type="checkbox" #= shareYn == "Y"? \'checked="checked"\':"" # class="shareYn" data-uid="#= uid #" />'
                     ,template:function(dataItem){
                         var spanObj = "";
                         // console.log(dataItem);
                         if (dataItem.shareYn == 'Y') {
                             spanObj = "<input type='checkbox' checked='checked' class='shareYn' data-uid="+dataItem.uid+" />";
                             if (dataItem.regUsrId != loginUsrId) {
                                 spanObj = "<input type='checkbox' checked='checked' class='shareYn' disabled data-uid="+dataItem.uid+" />";
                             }
                         } else if (dataItem.shareYn == 'N') {
                             spanObj = "<input type='checkbox' class='shareYn' data-uid="+dataItem.uid+" />";
                         }
                         return spanObj;
                     }
                     , editor:function(container, options){
                         $('<input type="checkbox" class="shareYn" />')
                     }
                 }//공개여부
                 , {field:"usrNm", title:"<spring:message code='global.lbl.regUsrId' />",     width:100, attributes:{"class":"ac"}} //메모
                 , {field:"regDt", title:"<spring:message code='global.lbl.regDt' />",     width:100, attributes:{"class":"ac"}
                     , format:"{0:<dms:configValue code='dateFormat' />}"
                 } //등록일
             ]
         });

         // 쿠폰
         $("#couponTabGrid").kendoExtGrid({
             gridId:"G-CRM-0529-123452"
             ,dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/selectCustCouponPublishInfo.do' />"
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

                             params["sCustNo"] = $("#custNo").val();

                             // console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                         model:{
                             id:"publiNo"
                             ,fields:{
                                 rnum:{type:"string", editable:false}
                                 ,regDt:{type:"date", editable:false}
                                 ,updtDt:{type:"date", editable:false}
                                 ,cupnFromDt:{type:"date", editable:false}
                                 ,cupnToDt:{type:"date", editable:false}
                                 ,publiDt:{type:"date", editable:false}
                                 ,usedDt:{type:"date", editable:false}
                             }
                         }
                 }
             }
             ,autoBind:false
             ,height:280
             ,filterable:false
             ,sortable:false
             ,navigatable:false
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,selectable:"row"
             ,editable:false
             ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}, hidden:true}// 일련번호
                ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
                ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width :150 , attributes:{"class":"ac"} , hidden:true}  // 고객번호
                ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width :100, attributes:{"class":"ac"}, hidden:true}  // 고객명
                ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm' />", width :150, attributes:{"class":"al"}}  // 쿠폰명
                ,{field:"dcUseTp", title:"<spring:message code='crm.lbl.dcUseTp' />"      // 할인사용구분
                    , width :100
                    , attributes:{"class":"ac"}
                    , template:"#=dcUseTpArrVal(dcUseTp)#"
                }
                ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width :140, attributes:{"class":"ac"}}  // VIN 번호
                ,{field:"publiNo", title:"<spring:message code='crm.lbl.publishNo' />", attributes:{"class":"ac"} , width:180 }  // 발행번호
                ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", attributes:{"class":"ar"} , width:60}  // 유효일자
                ,{field:"cupnFromDt", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :100               // 쿠폰시작일
                    ,attributes:{"class":"ac"}
                    ,template:"#if (data.cupnFromDt !== null ){# #= kendo.toString(data.cupnFromDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"cupnToDt", title:"<spring:message code='crm.lbl.cupnToDt' />", width :100               // 쿠폰종료일
                    ,attributes:{"class":"ac"}
                    ,template:"#if (data.cupnToDt !== null ){# #= kendo.toString(data.cupnToDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"publiDt", title:"<spring:message code='crm.lbl.publishDt' />", width :100               // 발행일
                    ,attributes:{"class":"ac"}
                    ,template:"#if (data.publiDt !== null ){# #= kendo.toString(data.publiDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"publiUsrNm", title:"<spring:message code='crm.lbl.publisher' />", width :100, attributes:{"class":"ac"}}  // 발행인
                ,{field:"usedDt", title:"<spring:message code='crm.lbl.cupnUseDt' />", width :100               // 쿠폰사용일자
                    ,attributes:{"class":"ac"}
                    ,template:"#if (data.usedDt !== null ){# #= kendo.toString(data.usedDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />"      // 사용처
                    , width :100
                    , attributes:{"class":"ac"}
                    , template:"#=dcUseTpArrVal(useTp)#"
                }
                ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"}, width :100}  // 사용번호
                ,{field:"chkUsrNm", title:"<spring:message code='crm.lbl.chkUsrNm' />", attributes:{"class":"ac"}, width :100}  // 쿠폰집행자
             ]
         });

         // 예치금
         $("#custChargeTabGrid").kendoExtGrid({
             gridId:"G-CRM-0529-122605"
             ,dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/custChargeMgmt/selectCustChargeMgmtHistResults.do' />"
                         ,async:false       // 그리드 조회 후 상세정보 호출 여부를 위해 async false로 옵션줌
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

                             params["sCustNo"] = $("#custNo").val();

                             // console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     model:{
                         id:"custNo"
                         ,fields:{
                             rnum:{type:"number", editable:false}
                             ,dlrCd:{type:"string", validation:{required:true}}
                             ,custNo:{type:"string", validation:{required:true}}
                             ,custNm:{type:"string", validation:{required:true}}
                             ,paymMthCd:{type:"string", validation:{required:true}}
                             ,paymAmt:{type:"Double", validation:{required:true}}
                             ,ableAmt:{type:"Double", validation:{required:true}}
                             ,rcptTp:{type:"string", validation:{required:true}}
                             ,rcptNo:{type:"string", validation:{required:true}}
                             ,rcptDt:{type:"Date", validation:{required:true}}
                             ,vinNo:{type:"string", validation:{required:true}}
                             ,sourTp:{type:"string", validation:{required:true}}
                             ,chrTp:{type:"string", validation:{required:true}}
                             ,carRegNo:{type:"string", validation:{required:true}}
                             ,remark:{type:"string", validation:{required:true}}
                             ,refKeyNo:{type:"string", validation:{required:true}}
                             ,regUsrId:{type:"string", validation:{required:true}}
                             ,updtUsrId:{type:"string", validation:{required:true}}
                             ,updtDt:{type:"Date", validation:{required:true}}
                             ,regDt:{type:"Date", validation:{required:true}}
                             ,chrSeq:{type:"int", validation:{required:true}}
                         }
                     }
                 }
             }
             ,autoBind:false
             ,editable:false
             ,height:250
             ,pageable:false
             ,filterable:false
             ,sortable:false
             ,scrollable: {
                 virtual: true
             }
             ,navigatable:false
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,selectable:"row"
             ,columns:[
                       {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false,filterable:false,attributes:{"class":"ac"}}
                      ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:140,attributes:{"class":"ac"}, hidden:true }
                      ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"ac"}, hidden:true }
                      ,{field:"paymMthCd", title:"<spring:message code='crm.lbl.payMethod' />"
                          ,width:80
                          ,attributes:{"class":"ac"}
                          ,template:'#if (paymMthCd !== "" && paymMthMap[paymMthCd] !== undefined){# #= paymMthMap[paymMthCd]# #}#'
                      }
                      //,{field:"paymAmt", title:"<spring:message code='crm.lbl.paymAmt' />", width:100,attributes:{"class":"ar"},format:"{0:##,###}"}
                      ,{field:"chrTpNm", title:"<spring:message code='crm.lbl.paymAmt' />", width:100,attributes:{"class":"ar"},format:"{0:##,###}"}
                      ,{field:"rcptTp", title:"<spring:message code='crm.lbl.invoiceTp' />"
                          ,width:120
                          ,attributes:{"class":"ac"}
                          ,template:"#if (rcptTp === '01'||rcptTp === '02') {# #= rcptTpMap[rcptTp] # #} else {# #= '-' # #}#"
                      }
                      ,{field:"rcptNo", title:"<spring:message code='crm.lbl.invoiceNo' />", width:120,attributes:{"class":"ac"}}
                      ,{field:"rcptDt", title:"<spring:message code='crm.lbl.lastTradeDate' />", width:100,attributes:{"class":"ac"}
                          ,template:"#if (rcptDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"}
                      ,{field:"ableAmt", title:"<spring:message code='crm.lbl.ableAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
                      ,{field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:200}
                      ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width:80,attributes:{"class":"ar"}}
                      ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:80,attributes:{"class":"ac"}}
                      ,{field:"regUsrNm", title:"<spring:message code='global.lbl.pprocId' />", width:70,attributes:{"class":"ac"}}
                      ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />"      // 사용처
                          , width :100
                          , attributes:{"class":"ac"}
                          , template:"#=dcUseTpArrVal(useTp)#"
                      }
                      ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"}, width :100}  // 사용번호
                      ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100,attributes:{"class":"ac"}
                          ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                      }
                  ]
         });

         // 계약 그리드
         $("#contractGrid").kendoExtGrid({
             gridId:"G-CRM-0528-122606"
             , dataSource:{
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

                             // console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,requestEnd:function(e) {
                     if (e.type == "read") {
                         //조회가 완료 되였습니다.
                         //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
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
             ,filterable:false
             ,sortable:false
             ,navigatable:false
             ,pageable:false
             ,height:280
             ,scrollable: {
                 virtual: true
             }
             , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             , enableTooltip:true               //Tooltip 적용, default:false
             ,columns:[
                         {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:130, attributes:{"class":"ac"}
                             ,template:function(dataItem){
                                 var spanObj = "<a href='#' class='linkContract'>"+dataItem.contractNo+"</a>";
                                 return spanObj;
                             }
                         } //계약번호
                         ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:130, attributes:{"class":"ac"}, template:"#= contractTpObj[contractTp] #"}         //계약유형
                         ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:130, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
                         ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:130, attributes:{"class":"ac"}, template:"#= contractStatObj[contractStatCd] #"} //계약상태
                         //,{field:"contractCustNo",title:"<spring:message code='global.lbl.customer' />",     width:150, attributes:{"class":"ac"}} //고객
                         ,{field:"saleEmpNm",     title:"<spring:message code='sale.lbl.saleEmpNo' />",      width:130, attributes:{"class":"ac"}} //영업사원
                         ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carLine' />",      width:130, attributes:{"class":"al"}} //차종
                         ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",        width:130, attributes:{"class":"al"}} //모델
                         //,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocn' />",          width:130, attributes:{"class":"ac"}} //OCN
                         //,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColor' />",     width:130, attributes:{"class":"ac"}} //외장색
                         //,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColor' />",     width:130, attributes:{"class":"ac"}} //내장색
                         ,{field:"carAmt",        title:"<spring:message code='global.lbl.vehiclePrice' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"} //차량가격
                         ,{field:"vinNo",        title:"<spring:message code='global.lbl.vinNo' />", width:100, attributes:{"class":"ac"}} //VIN
             ]
         });

         /* *************************************************************************
          **************************파일업로드5********************************************
          ***************************************************************************/
          // 파일 그리드 시작    //
          $("#fileGrid").kendoExtGrid({
              gridId:"G-CRM-0528-142607"
              , dataSource:{
                  transport:{
                      read:{
                          url:"<c:url value='/crm/cif/customerInfo/selectFiles.do' />"
                      },
                      parameterMap:function(options, operation) {
                          if (operation === "read") {

                              var params = {};
                              //params["sFileDocNo"] = $("#docId").val();
                              params["sCustNo"] = $("#custNo").val();
                              params["sDocId"] = $("#docId").val();

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
                              ,docTp:{type:"string", editable:false}
                              ,fileNm:{type:"string", editable:false}
                              ,fileSize:{type:"number", editable:false}
                          }
                      }
                  }
              }
              ,dataBound:function(e) {

                  var grid        = $("#fileGrid").data("kendoExtGrid")
                  , rows          = grid.tbody.find("tr");

                  rows.each(function(index, row) {
                      var gridData = grid.dataSource.at(index);
                      // console.log("fileGrid!! ");

                      if ( gridData.docTp != "01") {
                         $("input.grid-checkbox-item", row).prop("disabled", true);
                      }

    //                   if (mngScId != gridData.regUsrId) {
    //                     $("input.shareYn", row).prop("disabled", true);
    //                     $("table", "#memoGrid").removeClass('k-selectable');
    //                   } else {
    //                     $("table", "#memoGrid").addClass('k-selectable');
    //                   }
                  });
              }
              ,change:function(e) {
                  var selectedVal = this.dataItem(this.select());

                  if (selectedVal.docTp != "01") {

                      //var row = this.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");
                      //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).attr('checked', false);
                      //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop("checked", false);
                      //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop('disabled', false);
                      //
                      //$("input.grid-checkbox-item", row[selectedVal.rnum-1]).prop('disabled', true);
                  }

              }
             ,editable:false
             ,autoBind:false
             ,filterable:false
             ,sortable:false
             ,navigatable:false
             ,pageable:false
             ,height: 280
             , selectable:"row"
             ,multiSelectWithCheckbox: false
             , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             , enableTooltip:true               //Tooltip 적용, default:false
             ,columns:[
                 {field:"docTpNm", title:"<spring:message code='global.lbl.type' />", width:150, attributes:{"class":"ac"}}           // 유형
                ,{field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />", width:250
                    ,attributes:{"class":"al"}
                    ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                }           // 파일명
                ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                    ,attributes:{"class":"ar"}
                    ,template:"#= dms.string.formatFileSize(fileSize) #"
                }

             ]
         });
         // 파일 그리드 종료 //
          /* *************************************************************************
          **************************파일업로드5********************************************
          ***************************************************************************/

       // 고객상세 주소 그리드
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
                              // console.log("addrGrid Testl..111.");
                              params["recordCountPerPage"]    = options.pageSize;
                              params["pageIndex"]             = options.page;
                              params["firstIndex"]            = options.skip;
                              params["lastIndex"]             = options.skip + options.take;
                              params["sort"]                  = options.sort;
                              params["sRefTableNm"]           = "CR_0101T";
                              params["sRefKeyNm"]             = $("#custNo").val();

                              // console.log("addrGrid Testl..222.");
                              // console.log(params);
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
//               ,filterable:false
               ,autoBind:false
              ,navigatable:false
              ,height:72
              ,pageable:false
              ,edit:function(e){
                  if ( e.model.addrTp === "02" ) {
                      this.closeCell();       // 주소타입이 02 이면 수정 불가능
                  };
              }
              ,columns:[
                 //{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
                 {_field:"chk", title:"<spring:message code='global.lbl.selectAddr' />", template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:60, attributes:{"class":"ac"}}
                 ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}
                     , editor:function(container, options){
                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , dataSource:dms.data.cmmCdFilter(addrTpList)
                             //, dataSource:addrTpList
                         });
                     }
                     , template:'#if (addrTp !== "" && addrTpMap[addrTp] !== undefined){# #= addrTpMap[addrTp]# #}#'
                 }       // 주소유형
                 ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
                 ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
                 ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:70, attributes:{"class":"al"}}       // 지역
                 ,{field:"addrNm", hidden:true}       // 주소
                 ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:150, attributes:{"class":"al"}}       // 상세주소
                 ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:70, attributes:{"class":"ac"}}       // 우편번호
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
                     , template:'#if (useYn !== "" && chgBuyYnMap[useYn] !== undefined){# #= chgBuyYnMap[useYn]# #}#'
                 }       // 사융유무
                 ,{_field:"delIcon", title:"<spring:message code='global.btn.del' />", width:50, attributes:{"class":"ac"}
                     ,template:function(e){
                         var spanObj;
                         if ( e.addrTp === "02" ) {
                             spanObj = "<a href='javascript:;' ></a>";
                         } else {
                             spanObj = "<a href='javascript:;' onclick='javascript:fn_delAddrRow();' ><span class='icon_delete'></span></a>";
                         };
                         return spanObj;
                     }
                 }       // 삭제
                 ,{field:"sungCd", hidden:true}
                 ,{field:"cityCd", hidden:true}
                 ,{field:"distCd", hidden:true}
                 ,{field:"refTableNm", hidden:true}
                 ,{field:"refKeyNm", hidden:true}
              ]
          });



         /* *************************************************************************
          **************************파일업로드3********************************************
          ***************************************************************************/
         //========파일삭제
         $("#fileDelete").click(function(){
             var grid = $("#fileGrid").data("kendoExtGrid");
             var rows = grid.select();
             var selectedItem = grid.dataItem(grid.select());

             if (rows.length < 1) {
                 //목록을 선택하여 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.select'/>");
                 return;
             }

             if( dms.string.isNotEmpty(selectedItem) ){
                 // 삭제 할수 없는 파일
                 if (selectedItem.docTp != "01") {
                     dms.notification.info("<spring:message code='crm.info.noDeleteFile'/>");
                     return;
                 }
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
                     dms.notification.warning(jqXHR.responseJSON.errors);
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
              // console.log("getParamChk : " + getParamChk);
              // console.log("custNo 1 : " + custNo);
              $("#custNo").val(custNo);
              // console.log("custNo 2 : " + $("#custNo").val());
              $("#btnCustSearch").click();
          }

});
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
   // console.log("getPet toYear:" + toYear);
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
    // console.log("sunSign monthVal:" +monthVal);
    // console.log("sunSign dayVal:" +dayVal);
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

function fn_delAddrRow(){
    var grid = $("#addrGrid").data("kendoExtGrid");
    var rows = grid.select();

    rows.each(function(index, row) {
        grid.removeRow(row);
    });
}


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

     // console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {
     // console.log("===============");
     // console.log(message);

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo:result.fileDocNo
             ,fileNo:result.fileNo
             ,fileNm:result.fileNm
             ,fileSize:result.fileSize
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
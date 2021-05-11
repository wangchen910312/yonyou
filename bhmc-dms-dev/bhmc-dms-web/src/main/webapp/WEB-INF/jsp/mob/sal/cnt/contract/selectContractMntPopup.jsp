<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약관리 팝업 -->
<section id="content">

    <div class="content_right" id="contractMntForm">
        <section id="content_detail" class="content_detail">
            <!-- 기본정보  -->
            <div class="co_group">
                <div class="content_title conttitlePrev" id="edit_title">
                    <h1 class="title_basic"><spring:message code='sal.title.contractCt' /></h1> <!-- 계약체결관리 -->
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                                    <td>
                                        <div class="f_text f_disabled"><input id="contractNo" name="contractNo" data-json-obj="true" readonly /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                                    <td>
                                        <div class="f_text f_disabled"><input id="contractDt" name="contractDt" disabled="disabled" data-json-obj="true" readonly /></div>

                                    </td>
                                </tr>
                                <th scope="row" style="display:none"><spring:message code='sal.lbl.beforeNo' /></th> <!-- 예약번호 -->
                                <td style="display:none">
                                    <div class="form_search" style="width:79%">
                                        <input id="beforeNo" name="beforeNo" readonly class="form_input" data-json-obj="true" />
                                        <input type="hidden" id="beBeforeNo" name="beBeforeNo" data-json-obj="true" />
                                        <input type="hidden" id="beforeImplyYn" name="beforeImplyYn" data-json-obj="true" />
                                    </div>
                                </td>
                                <tr>
                                    <th scope="row" class="required"><span class="bu_required"><spring:message code='sal.lbl.dlReqDt' /></span></th>    <!-- 인도요청일 -->
                                    <td class="f_term">
                                        <div class="f_item01" style="width:100%">
                                            <input type="search" id="dlReqDt" style="width:150px" data-json-obj="true" readOnly />
                                            <span class="date" onclick="calpicker('dlReqDt');"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><span class="bu_required"><spring:message code='global.lbl.salPrsnNm' /></span></th>     <!-- 판매담당자 -->
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="saleEmpNo" name="saleEmpNo" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.lv2DlrYn' /></th>        <!-- 2급딜러여부 -->
                                     <td>
                                        <div class="f_text">
                                            <input type="text" id="lv2DlrYn" name="lv2DlrYn" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 기본정보  -->

            <!-- 개인 -->
            <div id="cust_01" class="co_group">
                <div class="content_title">
                    <h2><spring:message code='global.title.custinfo' /></h2>         <!-- 고객정보 -->
                    <div class="title_btn">
                         <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                                    <td>
                                        <div class="f_item01">
                                            <input id="vCustNm_01" name="vCustNm_01" type="text" class="form_input onKey_up onKey_bulr" />
                                            <input id="custNm_01" name="custNm_01" type="hidden" value="" />
                                            <span class="customer" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span>
                                        </div>
                                        <div class="f_text">
                                            <input id="custCd_01" name="custCd_01" type="text" value=""  readonly />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input value="<spring:message code='global.lbl.personal' />" readonly />       <!-- 개인 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop">
                                    <th scope="row" class="required"><spring:message code="global.lbl.mathDocTp" /><!-- 증서유형 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="ssnCrnTp_01" name="ssnCrnTp_01" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='sal.lbl.ssnCrnNo' /><!-- 증서번호 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="ssnCrnNo_01" name="ssnCrnNo_01" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="telNo1_01" type="text" data-type="mobile" pattern="\d" maxlength="13" />
                                            <input type="hidden" id="telNo2_01">         <!-- 전화번호2 화면에 없음 -->
                                            <input type="hidden" id="emailNm_01" />      <!-- 이메일 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop">
                                    <th scope="row"><spring:message code='sal.lbl.addrTp' /></th><!-- 주소유형 -->
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="addrTp_01" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                                    <td>
                                        <div class="f_text">
                                            <input id="sungCd_01" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                                    <td>
                                        <div class="f_text">
                                            <input id="cityCd_01" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                                    <td>
                                        <div class="f_text">
                                            <input id="distCd_01"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.zipCd' /></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="zipCd_01"  maxlength="6" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="addrDetlCont_01" name="addrDetlCont_01" />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 개인  -->

            <!-- 법인 -->
            <div id="cust_02" class="co_group">
                <div class="content_title">
                    <h2><spring:message code='global.title.custinfo' /></h2>         <!-- 고객정보 -->
                    <div class="title_btn">
                        <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                                    <td>
                                        <div class="f_item01">
                                            <input id="vCustNm_02" name="vCustNm_02" type="text" value=""  class="form_input onKey_up onKey_bulr" />
                                            <input id="custNm_02" name="custNm_02" type="hidden" value="" />
                                            <span class="customer" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span>
                                        </div>
                                        <div class="f_text">
                                            <input id="custCd_02" name="custCd_02" type="text" value=""  readonly />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custTp' /></th>   <!-- 고객유형 -->
                                    <td>
                                        <div class="f_text">
                                            <input value="<spring:message code='global.lbl.corporation' />" readonly />        <!-- 법인 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop">
                                    <th scope="row"><spring:message code='sal.taxPayNo' /></th>   <!-- 납세번호 -->
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="taxPayNo_02" name="taxPayNo_02" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code="crm.lbl.corpPurcMng" /></th><!-- 구매담당자명 -->
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="purcMngNm_02" name="purcMngNm_02" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr class="crop">
                                    <th scope="row" class="required"><spring:message code="global.lbl.mathDocTp" /><!-- 증서유형 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="ssnCrnTp_02" name="ssnCrnTp_02" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='sal.lbl.ssnCrnNo' /><!-- 증서번호 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="ssnCrnNo_02" name="ssnCrnNo_02" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='global.lbl.hpNo' /><!-- 이동전화 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="telNo1_02" type="text" data-type="mobile" pattern="\d" maxlength="13" />
                                            <input type="hidden" id="telNo2_02" />         <!-- 전화번호2 화면에 없음 -->
                                            <input type="hidden" id="emailNm_02" />      <!-- 이메일 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop">
                                    <th scope="row"><spring:message code='sal.lbl.addrTp' /></th><!-- 주소유형 -->
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="addrTp_02" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                                    <td>
                                        <div class="f_text">
                                            <input id="sungCd_02"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                                    <td>
                                        <div class="f_text">
                                            <input id="cityCd_02" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                                    <td>
                                        <div class="f_text">
                                            <input id="distCd_02" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.zipCd' />
                                    <td>
                                        <div class="f_text">
                                            <input id="zipCd_02" maxlength="6" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.detlAddr' /><!-- 상세주소 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="addrDetlCont_02" name="addrDetlCont_02" />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- // 법인  -->

            <!-- 차량정보  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='ser.title.carInfo' /></h2>
                    <div class="title_btn">
                        <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                                    <td class="f_smulti">
                                        <div class="f_sbox" style="width:46%;">
                                            <div class="f_text">
                                                <input id="sVinNo" type="text" placeholder="" maxlength="17" style="text-transform:uppercase;"/>
                                                <input type="hidden" id="vinNo" name="vinNo" data-json-obj="true" />
                                                <input type="hidden" id="beforVinNo" name="beforVinNo" data-json-obj="true" />
                                            </div>
                                        </div>
                                        <div class="f_btn" style="width:27%;">
                                            <span id="btnSearchVinNo" class="btnd1"><spring:message code='global.lbl.search' /></span>
                                        </div>
                                        <div class="f_btn" style="width:27%;">
                                            <span id="btnCancelVinNo" class="btnd1"><spring:message code='global.btn.cancel' /></span>
                                        </div>

                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row" class="required"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="carlineCd" name="carlineCd" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='global.lbl.model' /><!-- 차관 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="modelCd" name="modelCd" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.ocn' /><!-- ocn --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="ocnCd" name="ocnCd" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="extColorCd" name="extColorCd" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="intColorCd" name="intColorCd" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.payTp' /><!-- 지불방식 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="payTp" name="payTp" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /><!-- 지도가 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="retlAmt" name="retlAmt" disabled="disabled" data-json-obj="true" readonly style="width:100%"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.realCarAmts' /><!-- 순차량금액:실제차량금액 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="realCarAmt" name="realCarAmt" onblur="bf_addDcRealAmt();" onfocus="fnOnfocus(this.id);" type="text" data-json-obj="true" style="width:100%"/>
                                            <input type="hidden" id="promotionAmt" name="promotionAmt" readonly data-json-obj="true" /> <!-- 우대금액 -->
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 차량정보 -->

            <!-- 계약가격정보 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='sal.title.contractPriceInfo' /></h2>     <!-- 계약가격정보 -->
                    <div class="title_btn">
                        <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.realCarAmts' /><!-- 순차량가격 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="realAmt" name="realAmt" disabled="disabled" data-json-obj="true" readonly style="width:100%" /> <!-- 순차량금액 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.realPayAmts' /><!-- 총계합  --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="realPayAmt" name="realPayAmt" disabled="disabled" data-json-obj="true"  readonly style="width:100%" /> <!-- 총계합 -->
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 계약가격정보 -->


            <!-- hidden값  -->
            <span style="display:none">
                <!-- 계약고객유형 :SAL028 C:계약자, D:실운전자 -->
                <!-- 계약자 고객유형 :01:개인, 02:법인 -->
                <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

                <!--
                              계약상태 :SAL002
                    10      계약등록
                    20      계약생성
                    50      고객인도
                    90      계약삭제
                    91      계약해지
                -->
                <input id="contractStatCd" name="contractStatCd" type="hidden" data-json-obj="true" />

                <!-- 견적번호 -->
                <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

                <!-- 저장 후 선택될 계약번호 -->
                <input id="savedContractNo" value="" />

                <!-- 할인레벨 코드 -->
                <input id="dcLvlCd" name="dcLvlCd" data-json-obj="true" />

                <!-- 할인승인여부 -->
                <input id="dcApproveYn" name="dcApproveYn" value="N" data-json-obj="true" />

                <!-- 판매기회번호 -->
                <input id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />

                <!-- 그룹계약번호 -->
                <input id="grpContractNo" name="grpContractNo" readonly class="form_input form_readonly" data-json-obj="true" />

                <!-- 판매유형 -->
                <input id="contractTp" name="contractTp" class="form_comboBox" data-json-obj="true" />

                <!-- 개인-납세번호 -->
                <input id="taxPayNo_01" type="hidden" value="" class="form_input" />

                <!-- 개인-구매담당자명 -->
                <input id="purcMngNm_01" type="hidden" value="" class="form_input" />

                <!-- <input id="realAmt" type="hidden" value="" />순차량금액 -->
                <input id="goodsAmt" name="goodsAmt" type="hidden" disabled="disabled" data-json-obj="true" /><!-- 용품가격 -->
                <td class="ar child_borderNone"><input id="reservContAmt" name="reservContAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>       <!-- 예판가격 -->
                <input id="incAmt" name="incAmt" type="hidden" disabled="disabled" data-json-obj="true" /><!-- 보험료 -->
                <input id="fincAmt" name="fincAmt" type="hidden" disabled="disabled" data-json-obj="true" /><!-- 금융 -->
                <input id="sbstAmt" name="sbstAmt" type="hidden" disabled="disabled" data-json-obj="true" /><!-- 중고차 -->
                <input id="aapAmt" name="aapAmt" type="hidden" disabled="disabled" disabled="disabled" data-json-obj="true" /><!-- 대행료 -->
                <input id="pointAmt" name="pointAmt" type="hidden" disabled="disabled" data-json-obj="true" /><!-- 포인트 -->
                <!-- <input id="realPayAmt" type="hidden" value="" />실제지불금액 -->


                <!-- 용품 -->
                <input id="goodsTotAmt" name="goodsTotAmt" type="hidden" />
                <div class="table_grid">
                    <div id="goodsGrid"></div>
                </div>


                <!-- 보험서비스 -->
                <input id="incExpcAmt" name="incExpcAmt"  type="hidden" value="" data-json-obj="true" /><!-- 보험예상금액(예상총금액) -->
                <input id="incAapTp" name="incAapTp" type="hidden" value="A" data-json-obj="true" />
                <input id="realIncAmt" name="realIncAmt" type="hidden" value="" data-json-obj="true" /><!-- 실보험총금액 -->
                <input id="incDifferenceAmt" name="incDifferenceAmt" type="hidden" value="" /><!-- 차액 -->
                <input id="incImplyYn" name="incImplyYn" type="hidden" value="" /><!-- 총금액포함여부 -->
                <input id="incPconCustNm" name="incPconCustNm" type="hidden" value="" data-json-obj="true" /><!-- 연계인 -->
                <input id="incPconCustTelNo" name="incPconCustTelNo" type="hidden" value="" data-json-obj="true" /><!-- 연계인전화 -->
                <input id="incCustNm" name="incCustNm" type="hidden" value="" data-json-obj="true" /><!-- 피보험자 -->
                <input id="incCustTelNo" name="incCustTelNo" type="hidden" value="" data-json-obj="true" /><!-- 피보험자전화 -->
                <input id="incCmpCd" name="incCmpCd" type="hidden" value="" data-json-obj="true" /><!-- 보험회사 -->
                <input id="incProfitNm" name="incProfitNm" type="hidden" value="" data-json-obj="true" /><!-- 제1수익자 -->
                <input id="incFeeAmt" name="incFeeAmt" type="hidden" value="" data-json-obj="true" /><!-- 보험수수료 -->
                <input id="finImplyYn" name="finImplyYn" type="hidden" disabled="disabled" /><!-- 재무수납여부 -->
                <input id="frcIncAmt" name="frcIncAmt" type="hidden" value="" data-json-obj="true" /><!-- 강제보험금액 -->
                <input id="busIncAmt" name="busIncAmt" type="hidden" value="" data-json-obj="true" /><!-- 상업보험금액 -->
                <input id="transIncTaxAmt" name="transIncTaxAmt" type="hidden" value="" data-json-obj="true" /><!-- 차량선박세 -->
                <input id="incRemark" name="incRemark" type="hidden" value="" data-json-obj="true" /><!-- 비고 -->
                <div class="table_grid">
                    <div id="incGrid" ></div>
                </div>

                <!-- 금융서비스 -->
                <input id="fincReqYn" name="fincReqYn" type="hidden" value="" data-json-obj="true" /><!-- 금융사 -->
                <input id="fincCmpCd" name="fincCmpCd" type="hidden" value="" data-json-obj="true" /><!-- 금융사 -->
                <input id="fincRpayPrid" name="fincRpayPrid" type="hidden" value="" data-json-obj="true" /><!-- 상환기간 -->
                <input id="fincLoadRate" name="fincLoadRate" type="hidden" value="" data-json-obj="true" /><!-- 대출비율(%) -->
                <input id="fincFeeAmt" name="fincFeeAmt" type="hidden" value="" data-json-obj="true" /><!-- 대출수수료 -->
                <input id="fincItemCd" name="fincItemCd" type="hidden" value="" data-json-obj="true" /><!-- 상품 -->
                <input id="fincBurdAmt" name="fincBurdAmt" type="hidden" value="" data-json-obj="true" /><!-- 자기금액(고객부담금액) -->
                <input id="instIntrRate" name="instIntrRate" type="hidden" value="" data-json-obj="true" /><!-- 할부이자율 -->
                <input id="grteIncAmt" name="grteIncAmt" type="hidden" value="" data-json-obj="true" /><!-- 보증수수료 -->
                <input id="fincReqDt" name="fincReqDt" type="hidden" value="" data-json-obj="true" /><!-- 신청일자 -->
                <input id="fincEndDt" name="fincEndDt"  type="hidden" value="" data-json-obj="true" /><!-- 만기일자 -->
                <input id="fincReqAmt" name="fincReqAmt" type="hidden" value="" data-json-obj="true" /><!-- 신청금액 -->

                <!-- 중고차치환 -->
                <input id="uatcCarPurcYn" name="uatcCarPurcYn" type="hidden" value="" data-json-obj="true" /><!-- 치환여부 -->
                <input id="sUsrVinNo" name="sUsrVinNo" type="hidden" value="" /><!-- VIN NO -->
                <input id="usrVinNo" name="usrVinNo" type="hidden" maxlength="17" readonly class="form_input form_readonly" data-json-obj="true" />
                <input id="purcNo" name="purcNo" type="hidden" value="" data-json-obj="true" /><!-- 매입번호 -->
                <input id="beforPurcNo" name="beforPurcNo" type="hidden" data-json-obj="true" />
                <input id="usrSbstAmt" name="usrSbstAmt" type="hidden" value="" data-json-obj="true" /><!-- 치환금액 -->
                <input id="subsidyAmt" name="subsidyAmt" type="hidden" value="" data-json-obj="true" /><!-- 기업보조금 -->
                <input id="sbusTp" name="sbusTp" type="hidden"  value="1" data-json-obj="true"/>

                <!-- 대행업무 -->
                <input id="regTp" name="regTp" type="hidden" data-json-obj="true" />
                <button id="btnAapsAdd" type="hidden" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                <button id="btnAapsDel" type="hidden" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
                <button id="btnAapsCancel" type="hidden" class="btn_s"><spring:message code='global.btn.cancel' /></button>       <!-- 취소 -->
                <div class="table_grid mt10">
                    <div id="aapGrid"></div>
                </div>


                <!-- 포인트 -->
                <input id="blueMembershipId" name="blueMembershipId" type="hidden" value="" /><!-- 블루멤버십 아이디 -->
                <input id="mLevel" name="mLevel" type="hidden" value="" /><!-- 회원등급 -->
                <input id="point" name="point" type="hidden" value="" /><!-- 적립포인트 -->
                <input id="bluePointApplyRate" name="bluePointApplyRate" type="hidden" data-json-obj="true" />
                <input id="blueMembershipPointVal" name="blueMembershipPointVal" type="hidden" value="" data-json-obj="true" /><!-- 지불금액 -->
                <input id="tBlueAmount" name="tBlueAmount" type="hidden" />

            </span>

        </section>
    </div>


    <!-- 버튼  -->
    <div class="con_btnarea btncount3">
        <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
        <div><span class="btnd1" id="btnCreate"><spring:message code='sal.btn.contractCreate' /><!-- 계약생성 --></span></div>
        <div><span class="btnd1t2" id="btnDelete"><spring:message code='sal.btn.contsancel' /><!-- 폐기 --></span></div>
    </div>
    <div class="con_btnarea">
        <div><span class="btnd1t2" id="btnCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
    </div>


</section>


<!-- 저장팝업 -->
<section class="lay_pop" id="savePopup">
    <div class="lay_title">
        <h1><spring:message code='global.lbl.info' /><!-- 알림 --></h1>
    </div>
    <div class="lay_cont2">
         <span>
             <spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />
         </span>
    </div>
    <div class="btnarea">
        <span id="btnSavePopup" class="btnd1t2"><spring:message code='global.btn.save' /></span><!-- 저장 --></span>
        <span class="btnd1" onclick="layerClose('#savePopup')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>
    </div>
</section>

<!-- 생성팝업 -->
<section class="lay_pop" id="approvalPopup">
    <div class="lay_title">
        <h1><spring:message code='global.lbl.info' /><!-- 알림 --></h1>
    </div>
    <div class="lay_cont2">
         <span>
             <spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />
         </span>
    </div>
    <div class="btnarea">
        <span id="btnSaveApprovalPopup" class="btnd1t2"><spring:message code='global.btn.save' /></span><!-- 저장 --></span>
        <span class="btnd1" onclick="layerClose('#approvalPopup')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>
    </div>
</section>

<!-- 폐기팝업 -->
<section class="lay_pop" id="deletePopup">
    <div class="lay_title">
        <h1><spring:message code='global.lbl.info' /><!-- 알림 --></h1>
    </div>
    <div class="lay_cont2">
         <span>
              <spring:message code='sal.info.conDeleteMsg'/>
         </span>
    </div>
    <div class="btnarea">
        <span id="btnDeletePopup" class="btnd1t2"><spring:message code='global.btn.save' /></span><!-- 확인 --></span>
        <span class="btnd1" onclick="layerClose('#deletePopup')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>
    </div>
</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>


<script type="text/javascript">
<!--

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

var dateFormat =  '<dms:configValue code="dateFormat" />';

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

//판매담당자 여부
var saleEmpYn = "Y";
//판매관리자 여부 : 판매인도 판매관리자도 아닌 사람은 관리자와 같은 권한을 갖는다. [2016.10.27 : 구상우D ]
var saleAdminYn = "N";

//임시 작업
if(userId == "admin2"){ saleAdminYn = "Y"; }

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//성 - 주소
var sungCdDs = [];
<c:forEach var="obj" items="${sungCdList}">
    sungCdDs.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//지불방식 :SAL071
var amtPayTpList = [];
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];
var contractTpList = [];    // 집단판매 제외, 직접
<c:forEach var="obj" items="${contractTpDS}">

    <c:if test="${obj.cmmCd ne 'G' and obj.cmmCd ne 'D' }">
        contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약상태
var contractStatCdList = [];
var contractStatCdArray = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractStatCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//용품판매품목상태
var itemStatCdList = [];
<c:forEach var="obj" items="${itemStatCdList}">
    itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });


//설치책임자
var eqipPrsnList = [];
<c:forEach var="obj" items="${eqipPrsnList}">
    eqipPrsnList.push({tecId:"${obj.tecId}", tecNm:"${obj.tecNm}"});
</c:forEach>
var eqipPrsnMap = dms.data.arrayToMap(eqipPrsnList, function(obj){ return obj.tecId; });

//탁송구분 :SAL125
// 탁송 :C , 방문 :I
// 차량등록지역 :SAL086

// 대행업무유형 : SAL021
var aapWorkList = [];
var aapWorkObj = {};
var incCmpCdList = [];
<c:forEach var="obj" items="${aapWorkDS}">
    aapWorkList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "remark1":"${obj.remark1}"});
    aapWorkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 보험회사 :SAL127
var incCmpCdList = [];
<c:forEach var="obj" items="${incCmpCdDS}">
    incCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 보험유형 :SAL019
var insTpList = [];
var insTpObj = {};
<c:forEach var="obj" items="${insTpDS}">
    insTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    insTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//3자보험유형 :SAL197
var threeIncTpAmtDs = [];
var threeIncTpAmtObj = {};
<c:forEach var="obj" items="${threeIncTpAmtList}">
    threeIncTpAmtDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    threeIncTpAmtObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


// 금융사 :SAL055
var fincCmpCdList = [];
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 금융상품
var fincItemObj = {};
<c:forEach var="obj" items="${fincItemDS}">
    if(fincItemObj.hasOwnProperty("${obj.fincCmpCd}")){
        fincItemObj["${obj.fincCmpCd}"].push({"cmmCd":"${obj.fincItemCd}", "cmmCdNm":"${obj.fincItemNm}", "useYn":"${obj.useYn}"});
    }else{
        fincItemObj["${obj.fincCmpCd}"] = [];
        fincItemObj["${obj.fincCmpCd}"].push({"cmmCd":"${obj.fincItemCd}", "cmmCdNm":"${obj.fincItemNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>


// 주요인증문서유형(신분증유형) :CRM024
var ssnCrnTpPList = [];        // remark1 - P :개인
var ssnCrnTpCList = [];        // remark1 - C :법인
<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

// 주소유형:CRM033
var addrTpList = [];
<c:forEach var="obj" items="${addrTpDS}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 할인레벨 :SAL156
var dcLvlCdObj = {};
<c:forEach var="obj" items="${dcLvlCdDS}">
    dcLvlCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 블루멤버십 회원등급 유형 CRM806
var mLevelList = [];
<c:forEach var="obj" items="${mLevelList}">
    mLevelList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>


//팝업 설정값
var options = parent.mainPopupWindow.options.content.data;

var popupWindow;
var dealerSearchPopupWin;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    $("#contractDt").val(chgServerDate2Str(toDay));
    $("#dlReqDt").val(chgServerDate2Str(toDay));
    //$("#contractDt").val(toDay);
    //$("#dlReqDt").val(toDay);
    var contractDt = $("#contractDt");
    var dlReqDt = $("#dlReqDt");


    // 저장 팝업
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

             // div 띄우기
            pushLayer('#savePopup');

        }
    });

    // 계약생성 팝업
    $("#btnCreate").kendoButton({
        enable:false,
        click:function(e){
            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

            // div 띄우기
            pushLayer('#approvalPopup');

        }
    });

    // 폐기(삭제) 팝업
    $("#btnDelete").kendoButton({
        enable:true,
        click:function(e){

         // div 띄우기
            pushLayer('#deletePopup');

        }
    });


    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        var data = {};
        data.msg = 'refresh';
        parent.$("#formarea").show();
        options.callbackFunc(data);
        parent.mainPopupWindow.close();

        //else if ($("#content_pop_search").css("display") == "block") { contentList(); }
        //else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    // 취소 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            // 팝업 닫기.
            var data = {};
            data.msg = 'refresh';
            parent.$("#formarea").show();
            options.callbackFunc(data);
            parent.mainPopupWindow.close();
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

    /* 보험서비스 관리*/
    $("#btnIncAllChange").kendoButton({   // 보험서비스 - 일괄변경
        click:function(e){
            var grid = $("#incGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                mob.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dItem = grid.dataItem(rows[0]);
            rows.each(function(index, row){
                var dataSourceRow = grid.dataSource.getByUid(row.attributes["data-uid"].nodeValue);
                //dataSourceRow.set("incTp", dms.string.strNvl(dItem.incTp));

                //dataSourceRow.set("valRecAmt", dms.string.strNvl(dItem.valRecAmt));
                //dataSourceRow.set("incExpcAmt", dms.string.strNvl(dItem.incExpcAmt));
                //dataSourceRow.set("realIncAmt", dms.string.strNvl(dItem.realIncAmt));
                dataSourceRow.set("incPrid", dms.string.strNvl(dItem.incPrid));
                dataSourceRow.set("incStartDt", dms.string.strNvl(dItem.incStartDt));
                dataSourceRow.set("incEndDt", dms.string.strNvl(dItem.incEndDt));
                dataSourceRow.set("remark", dms.string.strNvl(dItem.remark));
                dataSourceRow.set("dirty", true);
            });
        }
    });

    $("#btnIncAdd").kendoButton({   // 보험서비스 - 행추가
        click:function(e){

            /*
            var sDt = kendo.parseDate(toDay);
                sDt.setMonth(sDt.getMonth() + 12);
                sDt.setDate(sDt.getDate() -1);
            var eDt = kendo.toString(sDt, "yyyy-MM-dd");

            $('#incGrid').data('kendoExtGrid').dataSource.insert(0, {
                 incTp:""
                ,incPrid:12
                ,incStartDt:new Date(toDay)
                ,incEndDt:new Date(eDt)
            });
            */

            parent.bf_pSearchIncItem();
        }
    });

    $("#btnIncDel").kendoButton({      // 보험서비스 - 행삭제
        click:function(e){
            var grid = $("#incGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                mob.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnIncCancel").kendoButton({    // 보험서비스 - 취소
        click :function(e) {
            $('#incGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    /* 용품 */
    $("#btnGoodsAdd").kendoButton({   // 용품 - 행추가
        click:function(e){
            $('#goodsGrid').data('kendoExtGrid').dataSource.insert(0, {
                "dlrCd":dlrCd
                ,"contractNo":$("#contractNo").val()
                ,"statCd":"10"
                ,"goodsCd":""
                ,"goodsNm":""
                ,"goodsCnt":1
                ,"goodsUnitCd":""
                ,"goodsPrc":0
                ,"dcRate":0
                ,"dcAmt":0
                ,"goodsAmt":0
                ,"realGoodsAmt":0
                ,"eqipCostAmt":0
                ,"totAmt":0
                ,"expcEqipDt":""
                ,"eqipPrsnId":""
                ,"expcGiEndDt":""
                ,"realDlDt":""
                ,"pkgItemCd":""
                ,"grStrgeCd":""
                ,"giStrgeCd":""
                ,"eqipEndDt":""
            });
        }
    });

    $("#btnGoodsDel").kendoButton({      // 용품 - 행삭제
        click:function(e){
            var grid = $("#goodsGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //용품을(를) 선택하여 주십시오
                mob.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
                return;
            }

            //처리상태가 출고(20), 반납(40)인 경우 삭제 할수 없다.
            var flag = true;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if(dataItem.statCd == "20" || dataItem.statCd == "40"){
                    flag = false;
                    return false;
                }
            });

            if(!flag){
                //처리상태가 출고/반납인 목록은 삭제 할 수 없습니다.
                mob.notification.warning("<spring:message code='sal.info.delete.impossibleState.accessoryItemSales' />");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnGoodsCancel").kendoButton({    // 용품 - 취소
        click :function(e) {
            $('#goodsGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    /* 대행업무 */
    $("#btnAapsAdd").kendoButton({   // 대행업무 - 행추가
        click:function(e){
            parent.bf_pSearchAapItem();
        }
    });

    $("#btnAapsDel").kendoButton({      // 대행업무 - 행삭제
        click:function(e){
            var grid = $("#aapGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");

            var removeList = [];
            rows.each(function(index, row) {
                if( $(this).find(".grid-checkbox-item").prop("checked") ){ removeList.push(row); }
            });

            if (removeList.length < 1) {
                //목록을 선택하여 주십시오.
                mob.notification.info("목록을 선택하여 주십시오.");
                return;
            }

            $.each(removeList, function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnAapsCancel").kendoButton({    // 대행업무 - 취소
        click :function(e) {
            $('#aapGrid').data('kendoExtGrid').cancelChanges();
        }
    });


    $("#custTp").val("01");       // 계약자 고객유형
    $("#sDlrCd").val(dlrCd);        // 딜러코드
    $("#sDlrNm").val(dlrNm);        // 딜러명

    // 탭
    /* var selectTabId = "goodsTab";       // 초기값 :용품
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
        }
    }); */

    // 계약일
/*     $("#contractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
    });
 */
    // 2급딜러여부
    $("#lv2DlrYn").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,select :function(e){
           var dataItem = this.dataItem(e.item);
           if(dataItem.cmmCd != "Y"){
               $("#lv2DlrOrgCd").val('');
               $("#lv2DlrOrgNm").val('');
           }
       }
       ,index :0
    });

    // 인도요청일
/*     $("#dlReqDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    }); */


    // 계약유형
    $("#contractTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(contractTpList)
       ,index :0
    });

    // 지불방식
    $("#payTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(amtPayTpList)
       ,optionLabel:" "
       ,index:0
    });

    // 판매담당자
    $("#saleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y" && saleAdminYn == "N"){
        $("#saleEmpNo").data("kendoExtDropDownList").value(userId);
        $("#saleEmpNo").data("kendoExtDropDownList").enable(false);
    }

    // 개인 :신분증유형
    $("#ssnCrnTp_01").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpPList)
       ,optionLabel:" "
       ,index:0
       ,change:function(){
           var sel = this.dataItem(this.select()).cmmCd;
           if (sel == "01") {
               $("#ssnCrnNo_01").attr('maxlength','18');
           }else if (sel  == "02"
                   || sel  == "03"
                   || sel  == "04"
                   || sel  == "05"
                   || sel  == "06"
                    ) {
               $("#ssnCrnNo_01").attr('maxlength','20');
           }else{
               $("#ssnCrnNo_01").attr('maxlength','20');
           }
       }
    });

    // 법인 :법인유형
    $("#ssnCrnTp_02").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpCList)
       ,optionLabel:" "
       ,index:0
       ,change:function(){
           var sel = this.dataItem(this.select()).cmmCd;
           if (sel == "08") {
               $("#ssnCrnNo_02").attr('maxlength','10');
           }else if(sel == "10"){
               $("#ssnCrnNo_02").attr('maxlength','18');
           }else{
               $("#ssnCrnNo_02").attr('maxlength','25');
           }
       }
    });

    /**
    * 주소유형
    */
    $("#addrTp_01").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(addrTpList)
       ,value:"03"
    });

    /**
     * 성 콤보박스
     */
    $("#sungCd_01").kendoExtDropDownList({
        dataTextField :"sungNm"
       ,dataValueField :"sungCd"
       ,dataSource :sungCdDs
       ,filter :"contains"
       ,optionLabel:" "
       ,select :function(e){
           $("#cityCd_01").data("kendoExtDropDownList").setDataSource([]);
            $("#cityCd_01").data("kendoExtDropDownList").enable(true);

            $("#distCd_01").data("kendoExtDropDownList").setDataSource([]);
            $("#distCd_01").data("kendoExtDropDownList").enable(false);

            $("#zipCd_01").val('');

            var dataItem = this.dataItem(e.item);
            if(dms.string.strNvl(dataItem.sungCd) == ""){
                $("#cityCd_01").data("kendoExtDropDownList").setDataSource([]);
                $("#cityCd_01").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                ,data :JSON.stringify({"sungCd":dataItem.sungCd})
                ,async :false
            });
            $("#cityCd_01").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 시 콤보박스
     */
    $("#cityCd_01").kendoExtDropDownList({
        dataTextField :"cityNm"
       ,dataValueField :"cityCd"
       ,filter :"contains"
       ,optionLabel:" "
       ,select :function(e){
           $("#distCd_01").data("kendoExtDropDownList").setDataSource([]);
           $("#distCd_01").data("kendoExtDropDownList").enable(true);

           $("#zipCd_01").val('');

           var dataItem = this.dataItem(e.item);
           if(dms.string.strNvl(dataItem.cityCd) == ""){
               $("#distCd_01").data("kendoExtDropDownList").setDataSource([]);
               $("#distCd_01").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
               ,data :JSON.stringify({"sungCd":$("#sungCd_01").data("kendoExtDropDownList").value(), "cityCd":dataItem.cityCd})
               ,async :false
           });
           $("#distCd_01").data("kendoExtDropDownList").setDataSource(responseJson.data);

       }
    });
    $("#cityCd_01").data("kendoExtDropDownList").enable(false);

    /**
    * 구 콤보박스
    */
    $("#distCd_01").kendoExtDropDownList({
        dataTextField: "distNm"
       ,dataValueField:"distCd"
       ,filter :"contains"
       ,optionLabel:" "
       ,select :function(e){
           var sung   = $("#sungCd_01").data("kendoExtDropDownList").value();
           var city   = $("#cityCd_01").data("kendoExtDropDownList").value();
           var distCd = this.dataItem(e.item).distCd;

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/cnt/contractMnt/selectZipCodeSearch.do' />"
               ,data :JSON.stringify({"sungCd":sung, "cityCd":city, "distCd":distCd})
               ,async :false
           });

           if(responseJson != null){
               $("#zipCd_01").val(dms.string.strNvl(responseJson.zipCd));
           }else{
               $("#zipCd_01").val('');
           }
       }
    });
    $("#distCd_01").data("kendoExtDropDownList").enable(false);

   /**
    * 주소유형
    */
    $("#addrTp_02").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(addrTpList)
       ,value:"03"
    });

    /**
     * 성 콤보박스
     */
    $("#sungCd_02").kendoExtDropDownList({
        dataTextField :"sungNm"
       ,dataValueField :"sungCd"
       ,dataSource :sungCdDs
       ,filter :"contains"
       ,optionLabel:" "
       ,select :function(e){
           $("#cityCd_02").data("kendoExtDropDownList").setDataSource([]);
            $("#cityCd_02").data("kendoExtDropDownList").enable(true);

            $("#distCd_02").data("kendoExtDropDownList").setDataSource([]);
            $("#distCd_02").data("kendoExtDropDownList").enable(false);

            $("#zipCd_02").val('');

            var dataItem = this.dataItem(e.item);
            if(dms.string.strNvl(dataItem.sungCd) == ""){
                $("#cityCd_02").data("kendoExtDropDownList").setDataSource([]);
                $("#cityCd_02").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                ,data :JSON.stringify({"sungCd":dataItem.sungCd})
                ,async :false
            });
            $("#cityCd_02").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 시 콤보박스
     */
    $("#cityCd_02").kendoExtDropDownList({
        dataTextField :"cityNm"
       ,dataValueField :"cityCd"
       ,filter :"contains"
       ,optionLabel:" "
       ,select :function(e){
           $("#distCd_02").data("kendoExtDropDownList").setDataSource([]);
           $("#distCd_02").data("kendoExtDropDownList").enable(true);

           $("#zipCd_02").val('');

           var dataItem = this.dataItem(e.item);
           if(dms.string.strNvl(dataItem.cityCd) == ""){
               $("#distCd_02").data("kendoExtDropDownList").setDataSource([]);
               $("#distCd_02").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
               ,data :JSON.stringify({"sungCd":$("#sungCd_02").data("kendoExtDropDownList").value(), "cityCd":dataItem.cityCd})
               ,async :false
           });
           $("#distCd_02").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#cityCd_02").data("kendoExtDropDownList").enable(false);

    /**
    * 구 콤보박스
    */
    $("#distCd_02").kendoExtDropDownList({
        dataTextField: "distNm"
       ,dataValueField:"distCd"
       ,filter :"contains"
       ,optionLabel:" "
       ,select :function(e){
           var sung   = $("#sungCd_02").data("kendoExtDropDownList").value();
           var city   = $("#cityCd_02").data("kendoExtDropDownList").value();
           var distCd = this.dataItem(e.item).distCd;

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/cnt/contractMnt/selectZipCodeSearch.do' />"
               ,data :JSON.stringify({"sungCd":sung, "cityCd":city, "distCd":distCd})
               ,async :false
           });

           if(responseJson != null){
               $("#zipCd_02").val(dms.string.strNvl(responseJson.zipCd));
           }else{
               $("#zipCd_02").val('');
           }
       }
    });
    $("#distCd_02").data("kendoExtDropDownList").enable(false);

    // 예판가격
    $("#reservContAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 차량
    $("#carlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,filter :"contains"
       ,select :onSelectCarlineCd
       ,optionLabel:" "
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField :"modelNm"
       ,dataValueField :"modelCd"
       ,filter :"contains"
       ,select :onSelectModelCd
       ,optionLabel:" "
    });
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,filter :"contains"
        ,select :onSelectOcnCd
        ,optionLabel:" "
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,filter :"contains"
        ,select :onSelectExtColorCd
        ,optionLabel:" "
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,filter :"contains"
        ,optionLabel:" "
        ,select :function(e){
            $("#vinNo").val('');    // vin no
            $("#sVinNo").val('');
        }
    });
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    // 공장지도가
    $("#retlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제차량금액( key in 변경 )
     $("#realCarAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    $("#realAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 용품가격
    $("#goodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 보험료
    $("#incAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 금융
    $("#fincAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 치환차감(중고차)
    $("#sbstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 대행료
    $("#aapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 프로모션 : 할인금액

    /* $("#promotionAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    }); */


    // 포인트
    $("#pointAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제지불금액
     $("#realPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    /************************
     * 탭-용품
    ************************/
    // 용품 합계
    $("#goodsTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    /************************
     * 탭-보험
    ************************/
     // 보험예상총금액
    $("#incExpcAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 실제보험총금액
    $("#realIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 차액
    $("#incDifferenceAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 보험수수료
    $("#incFeeAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //강제보험금액
    $("#frcIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //상업보험금액
    $("#busIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //차량선박세
    $("#transIncTaxAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 보험회사
    $("#incCmpCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(incCmpCdList)
       ,optionLabel:" "
    });

    // 보험처리 :대행
    /*
    $("#incAapTp01").click(function(){
        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");
        $("#incFeeAmt").data("kendoExtNumericTextBox").enable(true);        // 보험수수료
        $("#incCmpCd").data("kendoExtDropDownList").enable(true);           // 보험회사
        $("#incProfitNm").attr("disabled", false);    // 제1수익자
        $("#incRemark").attr("disabled", false);    // 비고

        // 보험 그리드 조회
        $("#incGrid").data('kendoExtGrid').dataSource.read(); // 보험 Grid
        $("#btnIncAdd").data("kendoButton").enable(true);
        $("#btnIncDel").data("kendoButton").enable(true);
        $("#btnIncCancel").data("kendoButton").enable(true);
        $("#incAapTp").val("A");      // SAL126 대행:A , 본인:M
    });
    //보험처리 :본인
    $("#incAapTp02").click(function(){
        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");
        $("#incExpcAmt").data("kendoExtNumericTextBox").value(0);
        $("#realIncAmt").data("kendoExtNumericTextBox").value(0);
        $("#incDifferenceAmt").data("kendoExtNumericTextBox").value(0);
        $("#incFeeAmt").data("kendoExtNumericTextBox").value(0);
        $("#incCmpCd").data("kendoExtDropDownList").value('');
        $("#incProfitNm").val('');
        $("#incRemark").val('');

        $("#incFeeAmt").data("kendoExtNumericTextBox").enable(false);        // 보험수수료
        $("#incCmpCd").data("kendoExtDropDownList").enable(false);           // 보험회사
        $("#incProfitNm").attr("disabled", true);    // 제1수익자
        $("#incRemark").attr("disabled", true);      // 비고

        $("#btnIncAdd").data("kendoButton").enable(false);
        $("#btnIncDel").data("kendoButton").enable(false);
        $("#btnIncCancel").data("kendoButton").enable(false);

        if($("#incGrid").data('kendoExtGrid') != null){
            $("#incGrid").data('kendoExtGrid').dataSource.data([]); // 보험 Grid
        }
        $("#incAapTp").val("M");       // SAL126 대행:A , 본인:M
    });
    */

    /************************
     * 탭-금융사
    ************************/
    // 금융처리 : 대행
      $("#fincTp01").click(function(){
        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");

         //$(".tabFincUl").removeClass("disabled");
         $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
         $("#fincRpayPrid").data("kendoExtNumericTextBox").enable(true);
         $("#fincLoadRate").data("kendoExtNumericTextBox").enable(true);
         $("#fincFeeAmt").data("kendoExtNumericTextBox").enable(true);
         $("#fincItemCd").data("kendoExtDropDownList").enable(true);
         $("#fincBurdAmt").data("kendoExtNumericTextBox").enable(true);
         $("#instIntrRate").data("kendoExtNumericTextBox").enable(true);
         $("#grteIncAmt").data("kendoExtNumericTextBox").enable(true);
         $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(true);
         $("#fincEndDt").data("kendoExtMaskedDatePicker").enable(true);
         $("#fincReqAmt").data("kendoExtNumericTextBox").enable(true);

         $("#fincReqYn").val("Y");
     });

     // 금융처리 : 본인
     $("#fincTp02").click(function(){
        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");

        //$(".tabFincUl").addClass("disabled");
        $("#fincCmpCd").data("kendoExtDropDownList").enable(false);
        $("#fincRpayPrid").data("kendoExtNumericTextBox").enable(false);
        $("#fincLoadRate").data("kendoExtNumericTextBox").enable(false);
        $("#fincFeeAmt").data("kendoExtNumericTextBox").enable(false);
        $("#fincItemCd").data("kendoExtDropDownList").enable(false);
        $("#fincBurdAmt").data("kendoExtNumericTextBox").enable(false);
        $("#instIntrRate").data("kendoExtNumericTextBox").enable(false);
        $("#grteIncAmt").data("kendoExtNumericTextBox").enable(false);
        $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#fincEndDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#fincReqAmt").data("kendoExtNumericTextBox").enable(false);

        $("#fincCmpCd").data("kendoExtDropDownList").value("");
        $("#fincRpayPrid").data("kendoExtNumericTextBox").value(0);
        $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
        $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0);
        $("#fincItemCd").data("kendoExtDropDownList").value("");
        $("#fincBurdAmt").data("kendoExtNumericTextBox").value(0);
        $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
        $("#grteIncAmt").data("kendoExtNumericTextBox").value(0);
        $("#fincReqDt").data("kendoExtMaskedDatePicker").value("");
        $("#fincEndDt").data("kendoExtMaskedDatePicker").value("");
        $("#fincReqAmt").data("kendoExtNumericTextBox").value(0);

        $("#fincReqYn").val("N");
     });

    // 금융사
    $("#fincCmpCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(fincCmpCdList)
       ,optionLabel:" "
    });

    // 상환기간
    $("#fincRpayPrid").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       //,min:0
       ,max:999
       ,spinners:false
       ,change: function() {
           var nFincRpayPrid = Number(this.value());

           if( dms.string.isEmpty($("#fincReqDt").data("kendoExtMaskedDatePicker").value()) ){
               $("#fincReqDt").data("kendoExtMaskedDatePicker").value(toDay);
           }
           var fincReqDt = kendo.parseDate(kendo.toString($("#fincReqDt").data("kendoExtMaskedDatePicker").value(), "yyyy-MM-dd"));
           fincReqDt.setMonth(fincReqDt.getMonth() + nFincRpayPrid );
           fincReqDt.setDate(fincReqDt.getDate() - 1);
           var fincEndDt = kendo.toString(fincReqDt, "yyyy-MM-dd");
           $("#fincEndDt").data("kendoExtMaskedDatePicker").value(fincEndDt);
       }
    });

    // 대출비율(%)
    $("#fincLoadRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0
       ,max:999
       ,spinners:false
       ,change: function(){
           var fincLoadRate = Number(this.value());
           var realPayAmt = Number($("#realPayAmt").data("kendoExtNumericTextBox").value());
           //var realPayAmt = Number($("#realPayAmt").val());

           // 금융:신청금액 = 총금액 - 고객부담금
           if(fincLoadRate > 0  && realPayAmt > 0){
               $("#fincReqAmt").data("kendoExtNumericTextBox").value( realPayAmt * (fincLoadRate/100) );
           }else{
               $("#fincReqAmt").data("kendoExtNumericTextBox").value( 0.00);
           }
       }
    });

    //대출 수수료
    $("#fincFeeAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
       ,change:function(){
           var fincFeeAmt = $("#fincFeeAmt").data("kendoExtNumericTextBox").value();
           if(fincFeeAmt == null){
               fincFeeAmt = 0;
               $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
           }
           $("#fincAmt").data("kendoExtNumericTextBox").value( Number(fincFeeAmt) );

           bf_sumCarAmt();
       }
    });

    // 금융상품
    $("#fincItemCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:[]
       ,optionLabel:" "
       ,change :function(e){
           var dataItem = this.dataItem(e.item);
           if(dms.string.strNvl(dataItem.cmmCd) != ""){
               //$("#fincRpayPrid").data("kendoExtNumericTextBox").value( Number(dataItem.fincItemPrid) ); //상환기간

               if( dms.string.isEmpty($("#fincReqDt").data("kendoExtMaskedDatePicker").value()) ){
                   $("#fincReqDt").data("kendoExtMaskedDatePicker").value(toDay);
               }
               var fincReqDt = kendo.parseDate(kendo.toString($("#fincReqDt").data("kendoExtMaskedDatePicker").value(), "yyyy-MM-dd"));
               //fincReqDt.setMonth(fincReqDt.getMonth() + Number(dataItem.fincItemPrid));
               fincReqDt.setMonth(fincReqDt.getMonth() + 12);        // 기본셋팅
               fincReqDt.setDate(fincReqDt.getDate() - 1);
               var fincEndDt = kendo.toString(fincReqDt, "yyyy-MM-dd");
               $("#fincEndDt").data("kendoExtMaskedDatePicker").value(fincEndDt);
           }
           fn_FincRate();

       }
    });

    // 금융사 change 이벤트
    $("#fincCmpCd").on("change", function (){
        //console.log('fincCmpCd Change:',$(this).data("kendoExtDropDownList").value());
        if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[$(this).data("kendoExtDropDownList").value()]);
        }else{
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource([]);
        }
        fn_FincRate();
    });

    // 금융정보 초기화
    fn_FincRate = function(){
        $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
        $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0);
        $("#fincBurdAmt").data("kendoExtNumericTextBox").value(0);
        $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
        $("#grteIncAmt").data("kendoExtNumericTextBox").value(0);
        $("#fincReqAmt").data("kendoExtNumericTextBox").value(0);
    }

    // 신청금액
    $("#fincReqAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
       ,change : function(){
           var fincReqAmt = Number(this.value());
           var realPayAmt = Number($("#realPayAmt").data("kendoExtNumericTextBox").value());
           //var realPayAmt = Number($("#realPayAmt").val());

           if(fincReqAmt > 0  && realPayAmt > 0){
               $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / realPayAmt) * 100 );
           }else{
               $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
           }

           $("#fincBurdAmt").data("kendoExtNumericTextBox").value(realPayAmt - fincReqAmt);
       }
    });

    // 고객부담금
    $("#fincBurdAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
       ,change : function(){
           var fincBurdAmt = Number(this.value());
           var realPayAmt = Number($("#realPayAmt").data("kendoExtNumericTextBox").value());
           //var realPayAmt = Number($("#realPayAmt").val());

           $("#fincReqAmt").data("kendoExtNumericTextBox").value(realPayAmt - fincBurdAmt);

           var fincReqAmt = realPayAmt - fincBurdAmt;
           $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / realPayAmt) * 100 );
       }
    });

    //할부이자율
    $("#instIntrRate").kendoExtNumericTextBox({
         format:"n0"
        ,decimals :2
        ,max:999
        ,value:0.00
        ,spinners:false
     });


    //보증수수료
    $("#grteIncAmt").kendoExtNumericTextBox({
         format:"n2"
        ,decimals :2
        ,value:0.00
        ,spinners:false
     });

    // 신청일자
    $("#fincReqDt").kendoExtMaskedDatePicker({
         format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 만기일자
    $("#fincEndDt").kendoExtMaskedDatePicker({
         format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    /************************
     * 탭-중고차
    ************************/
    // 중고차 :치환여부
    $("#uatcCarPurcYn").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,select :function(e){
           bf_uatcCarPurcYnChk(this.dataItem(e.item).cmmCd);
       }
       ,index :0
    });

    //평가금액
    $("#usrSbstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 정부보조금
    $("#subsidyAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    $('input[name="tabSbusTp"]').click(function(){
        $("#sbusTp").val($('input[name="tabSbusTp"]:checked').val());
        bf_addUsrSbstAmt();
    });

    $("#sUsrVinNo").attr("disabled", true);
    $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
    $("#purcNo").attr("disabled", true);
    $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
    $("#sbusTp").val("1");
    $('input[name="tabSbusTp"]').prop("disabled", true);


    /************************
     * 탭-대행
    ************************/

    // 번호판 등록처리 :대행
    $("#tabRegTp01").click(function(){
        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");
        $("#regTp").val("A");      // SAL126 대행:A , 본인:M
        $("#aapGrid").data('kendoExtGrid').dataSource.data([]);
        initAapGrid();

        $("#btnAapsAdd").data("kendoButton").enable(true);
        $("#btnAapsDel").data("kendoButton").enable(true);
        $("#btnAapsCancel").data("kendoButton").enable(true);
    });
    //번호판 등록처리 :본인
    $("#tabRegTp02").click(function(){
        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");
        $("#regTp").val("M");       // SAL126 대행:A , 본인:M
        $("#aapGrid").data('kendoExtGrid').dataSource.data([]);

        $("#btnAapsAdd").data("kendoButton").enable(false);
        $("#btnAapsDel").data("kendoButton").enable(false);
        $("#btnAapsCancel").data("kendoButton").enable(false);
    });

    /************************
     * 탭-포인트
    ************************/
    // BM 회원등급
    $("#mLevel").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(mLevelList)
       ,optionLabel:" "
    });

    $("#point").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    $("#blueMembershipPointVal").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    $("#tBlueAmount").kendoExtNumericTextBox({
        format:"###,###.## RMB"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    /************************
     * 탭-종료
    ************************/

    // DB동기화 - 재조회.
    function fn_contOnLoad(selectedItem){
        mob.loading.show();
        $.ajax({
            url :"<c:url value='/sal/cnt/contractMnt/selectContractReSearch.do' />"
           ,data :JSON.stringify({"sDlrCd":selectedItem.sDlrCd, "sContractNo":selectedItem.sContractNo})
           ,type :'POST'
           ,dataType :'json'
           ,contentType :'application/json'
           ,error :function(jqXHR,status,error) {
               mob.loading.hide();
               if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                   mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }else{
                   mob.notification.error(error);
               }
           }
           ,success :function(jqXHR, textStatus) {
               mob.loading.hide();
               if(jqXHR.total > 0){
                 refreshAll();
                 fn_contGridDBclick(jqXHR.data[0]);
               }else{
                 // {상세정보}을(를) 확인하여 주세요.
                 mob.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
               }
           }
       });
    }

    // 그리드 주문번호 더블클릭.
    fn_contGridDBclick = function(selectedItem){
        if( selectedItem != null && selectedItem != 'undefined'){

            $("#contractNo").val(selectedItem.contractNo);                           // 계약번호
            if(dms.string.strNvl(selectedItem.contractDt) == ""){
                //$("#contractDt").data("kendoExtMaskedDatePicker").value( toDay );   // 계약일
                $("#contractDt").val(chgServerDate2Str(toDay));   // 계약일
            }else{
                //$("#contractDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractDt);   // 계약일
                $("#contractDt").val(chgServerDate2Str(selectedItem.contractDt));   // 계약일
            }
            //$("#contractDt").data("kendoExtMaskedDatePicker").enable(false);                    // 계약일 수정불가
            $("#contractStatCd").val(selectedItem.contractStatCd);                     // 계약상태

            // 계약종합조회 화면에서 넘어 왔을 시.
            if( typeof(options.sStatCd) != "undefined" && options.sStatCd == "900"){
                fn_btnState(options.sStatCd, selectedItem.contractStatCd);
            }else{
                fn_btnState(selectedItem.contractStatCd);   // 버튼상태
            }

            $("#saleOpptNo").val(selectedItem.saleOpptNo);   //판매기회번호
            if(dms.string.isNotEmpty(selectedItem.saleOpptNo)){
                //$("#saleOpptYn").prop('checked', true);
                $("#saleOpptTxt").hide();
            }else{
                //$("#saleOpptYn").prop('checked', false);
                $("#saleOpptTxt").hide();
            }

            $("#lv2DlrYn").data("kendoExtDropDownList").value(selectedItem.lv2DlrYn == "Y" ? "Y" :"N");    //2급딜러여부
            $("#lv2DlrOrgCd").val(selectedItem.lv2DlrOrgCd);     //2급딜러조직코드
            $("#lv2DlrOrgNm").val(selectedItem.lv2DlrOrgNm);     //2급딜러조직
            //$("#dlReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.dlReqDt);      // 인도요청일
            $("#dlReqDt").val(chgServerDate2Str(selectedItem.dlReqDt));      // 인도요청일

            // 계약유형
            if(selectedItem.contractTp == "G"){              // 집단판매
                $("#contractTp").data("kendoExtDropDownList").setDataSource(sContractTpList);
                $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);       // 계약유형
                $("#contractTp").data("kendoExtDropDownList").enable(false);
            }else if(selectedItem.contractTp == "D"){        // 직접판매
                $("#contractTp").data("kendoExtDropDownList").setDataSource(sContractTpList);
                $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);
                $("#contractTp").data("kendoExtDropDownList").enable(false);
            }else {
                $("#contractTp").data("kendoExtDropDownList").setDataSource(contractTpList);        // 집단판매 제외
                $("#contractTp").data("kendoExtDropDownList").enable(true);
                $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);       // 계약유형
            }

            $("#grpContractNo").val(selectedItem.grpContractNo);                       //그룹계약번호
            $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);           // 지불방식
            $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자
            if(saleEmpYn == "Y" && saleAdminYn == "N"){
                $("#saleEmpNo").data("kendoExtDropDownList").enable(false);
            }else{
                $("#saleEmpNo").data("kendoExtDropDownList").enable(true);
            }

            /* 계약 고객정보 세팅 */
            var custTp = selectedItem.custTp;
            if(custTp != null){
                $("#custTp").val(custTp);       // 계약 고객유형
                /** 계약고객정보 **/
                if(custTp == "02"){  // 법인
                    $("#cust_01").hide();
                    $("#cust_02").show();
                }
                else{            // 개인
                    $("#cust_02").hide();
                    $("#cust_01").show();
                }


                $("#custCd_"+custTp).val(selectedItem.custCd);       // 고객코드
                $("#custNm_"+custTp).val(selectedItem.custNm);       // 고객명
                $("#vCustNm_"+custTp).val(selectedItem.custNm);      // 고객명
                $("#taxPayNo_"+custTp).val(selectedItem.taxPayNo);   // 납세번호
                $("#purcMngNm_"+custTp).val(selectedItem.purcMngNm);   // 구매담당자명
                $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.ssnCrnTp); // 신분증유형 / 법인유형
                $("#ssnCrnTp_"+custTp).change();
                $("#ssnCrnNo_"+custTp).val(selectedItem.ssnCrnNo);  // 증서번호
                $("#telNo1_"+custTp).val(selectedItem.telNo1);      // 전화번호1
                $("#telNo2_"+custTp).val(selectedItem.telNo2);      // 전화번호2
                $("#emailNm_"+custTp).val(selectedItem.emailNm);    // 이메일명

                // 보유고객은 신분증유형, 신분증 번호 변경 불가[2016.12.08 구상우K]
                if( dms.string.strNvl(selectedItem.custCcd) == "02" ){
                    $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
                    $("#ssnCrnNo_"+custTp).attr("disabled", true);
                }else{
                    $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
                    $("#ssnCrnNo_"+custTp).attr("disabled", false);
                }

                $("#sungCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(selectedItem.sungCd));    // 성
                //$("#sungNm_"+custTp).val(selectedItem.sungNm);    // 성

                // 시
                if(dms.string.isNotEmpty(selectedItem.sungCd)){
                    var rsJsonCity = dms.ajax.getJson({
                        url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                        ,data :JSON.stringify({"sungCd":selectedItem.sungCd})
                        ,async :false
                    });
                    $("#cityCd_"+custTp).data("kendoExtDropDownList").enable(true);
                    $("#cityCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonCity.data);
                    //$("#cityNm_"+custTp).val(selectedItem.cityNm);
                    $("#cityCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(selectedItem.cityCd));

                    // 구
                    if(dms.string.isNotEmpty(selectedItem.cityCd)){
                        var rsJsonDist = dms.ajax.getJson({
                            url :"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
                            ,data :JSON.stringify({"sungCd":selectedItem.sungCd, "cityCd":selectedItem.cityCd})
                            ,async :false
                        });
                        $("#distCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonDist.data);
                        //$("#distNm_"+custTp).val(selectedItem.distNm);
                        $("#distCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(selectedItem.distCd));
                        $("#distCd_"+custTp).data("kendoExtDropDownList").enable(true);
                    }else{
                        $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
                        $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
                    }
                }else{
                    $("#cityCd_"+custTp).data("kendoExtDropDownList").value("");
                    $("#cityCd_"+custTp).data("kendoExtDropDownList").enable(false);
                    $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
                    $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
                }

                $("#zipCd_"+custTp).val(selectedItem.zipCd);      // 우편번호
                $("#addrTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.addrTp);   //주소유형
                $("#addrDetlCont_"+custTp).val(selectedItem.addrDetlCont);   // 상세주소

                // 판매 기회일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
                if(!dms.string.isEmpty(selectedItem.saleOpptNo)){
                    $("#vCustNm_"+custTp).attr("disabled", true);
                    //$("#btnCrmCustSearch_"+custTp).show();
                }

                // 집단판매일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
                if(selectedItem.contractTp == "G"){
                    $("#vCustNm_"+custTp).attr("disabled", true);
                    //$("#btnCrmCustSearch_"+custTp).show();
                    bf_crmCustSearch();      // 갱신버튼 실행.
                }
            }

            /* 차량정보 */
            if(selectedItem.carlineCd != null &&  selectedItem.carlineCd != ""){
                $("#carlineCd").data("kendoExtDropDownList").enable(true);
                $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd); // 차종
            }

            if(selectedItem.modelCd != null &&  selectedItem.modelCd != ""){
                var modelCd = $("#modelCd").data("kendoExtDropDownList");

                var modelDS = setModelDataSource(selectedItem.carlineCd);
                if(modelDS != null){
                    modelCd.setDataSource( modelDS );
                }else{
                    modelCd.setDataSource([{modelNm:selectedItem.modelNm, modelCd:selectedItem.modelCd}]);
                }
                modelCd.enable(true);
                modelCd.value(selectedItem.modelCd); // 모델
            }

            if(selectedItem.ocnCd != null &&  selectedItem.ocnCd != ""){
                var ocnCd = $("#ocnCd").data("kendoExtDropDownList");

                var ocnDS = setOcnDataSource(selectedItem.carlineCd, selectedItem.modelCd);
                if(ocnDS != null){
                    ocnCd.setDataSource( ocnDS );
                }else{
                    ocnCd.setDataSource([{ocnNm:selectedItem.ocnNm, ocnCd:selectedItem.ocnCd}]);
                }
                ocnCd.enable(true);
                ocnCd.value(selectedItem.ocnCd); // OCN
            }

            if(selectedItem.extColorCd != null &&  selectedItem.extColorCd != ""){
                var extColorCd = $("#extColorCd").data("kendoExtDropDownList");

                var extColorDS = setExtColorDataSource(selectedItem.modelCd);
                if(extColorDS != null){
                    extColorCd.setDataSource( extColorDS );
                }else{
                    extColorCd.setDataSource([{extColorNm:selectedItem.extColorNm, extColorCd:selectedItem.extColorCd}]);
                }
                extColorCd.enable(true);
                extColorCd.value(selectedItem.extColorCd); // 외장색
            }

            if(selectedItem.intColorCd != null &&  selectedItem.intColorCd != ""){
                var intColorCd = $("#intColorCd").data("kendoExtDropDownList");

                var intColorDS = setIntColorDataSource(selectedItem.modelCd);
                if(intColorDS != null){
                    intColorCd.setDataSource( intColorDS );
                }else{
                    intColorCd.setDataSource([{intColorNm:selectedItem.intColorNm, intColorCd:selectedItem.intColorCd}]);
                }
                intColorCd.enable(true);
                intColorCd.value(selectedItem.intColorCd); // 내장색
            }

            $("#beforVinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");    // vin no
            $("#vinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");         // vin no
            $("#sVinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");        // vin no

            /* 계약가격정보 */
            $("#retlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt :0);                // 공장지도가
            //$("#retlAmt").val(dms.format.currency(selectedItem.retlAmt != null ? selectedItem.retlAmt :0));                // 공장지도가

            //$("#promotionAmt").data("kendoExtNumericTextBox").value(selectedItem.promotionAmt != null ? selectedItem.promotionAmt :0); // 판촉금액
            $("#promotionAmt").val(selectedItem.promotionAmt != null ? selectedItem.promotionAmt :0);                               // 판촉금액
            $("#realCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);       // 순차량가격
            //$("#realCarAmt").val(dms.format.currency(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0));                // 순차량가격
            $("#realAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);          // 순차량가격
            //$("#realAmt").val(dms.format.currency(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0));                // 순차량가격
            $("#goodsAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsAmt != null ? selectedItem.goodsAmt :0);             // 용품가격
            $("#incAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt :0);                   // 보험료
            //$("#fincAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt != null ? selectedItem.fincFeeAmt :0);        // 금융
            $("#sbstAmt").data("kendoExtNumericTextBox").value(selectedItem.sbstAmt != null ? selectedItem.sbstAmt :0);                // 치환차감
            $("#aapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt :0);                   // 대행료
            $("#pointAmt").data("kendoExtNumericTextBox").value(selectedItem.pointAmt != null ? selectedItem.pointAmt :0);                   // 대행료
            $("#realPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt :0);       // 실제지불금액
            //$("#realPayAmt").val(dms.format.currency(selectedItem.realPayAmt != null ? selectedItem.realPayAmt :0));                // 순차량가격

            /* 용품 */
            $("#goodsGrid").data('kendoExtGrid').dataSource.read();

            /* 보험서비스 */
            /*
            if(selectedItem.incAapTp == "A"){
                $("#incAapTp01").click();
            }else{
                $("#incAapTp02").click();
            }
            */

            $("#incAapTp").val(selectedItem.incAapTp);
            $("#incExpcAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.incExpcAmt));
            $("#realIncAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.realIncAmt));
            $("#incFeeAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.realIncFeeAmt));
            $("#incImplyYn").prop('checked', selectedItem.implyYn=="Y"?true:false);
            $("#finImplyYn").prop('checked', selectedItem.finImplyYn=="Y"?true:false);
            $("#incPconCustNm").val(selectedItem.incPconCustNm);
            $("#incPconCustTelNo").val(selectedItem.incPconCustTelNo);
            $("#incCustNm").val(selectedItem.incCustNm);
            $("#incCustTelNo").val(selectedItem.incCustTelNo);
            $("#incCmpCd").data("kendoExtDropDownList").value(selectedItem.incCmpCd);
            $("#incProfitNm").val(selectedItem.incProfitNm);
            $("#frcIncAmt").data("kendoExtNumericTextBox").value(selectedItem.frcIncAmt);
            $("#busIncAmt").data("kendoExtNumericTextBox").value(selectedItem.busIncAmt);
            $("#transIncTaxAmt").data("kendoExtNumericTextBox").value(selectedItem.transIncTaxAmt);
            $("#incRemark").val(selectedItem.incRemark);

            bf_sumIncAmt();
            $("#incGrid").data('kendoExtGrid').dataSource.read();        // 보험 그리드 조회

            /* 금융서비스 */
            if( dms.string.strNvl(selectedItem.fincReqYn) == "Y"){
                $("#fincTp01").click();
            }else{
                $("#fincTp02").click();
            }
            //bf_fincReq();

            $("#fincCmpCd").data("kendoExtDropDownList").value(selectedItem.fincCmpCd);
            $("#fincCmpCd").change();
            $("#fincRpayPrid").data("kendoExtNumericTextBox").value(selectedItem.fincRpayPrid);
            $("#fincLoadRate").data("kendoExtNumericTextBox").value(selectedItem.fincLoadRate);
            $("#fincFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt);
            $("#fincAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt != null ? selectedItem.fincFeeAmt : 0);  //금융[탭]
            $("#fincItemCd").data("kendoExtDropDownList").value(selectedItem.fincItemCd);
            $("#fincBurdAmt").data("kendoExtNumericTextBox").value(selectedItem.fincBurdAmt);
            $("#fincReqAmt").data("kendoExtNumericTextBox").value(selectedItem.fincReqAmt);
            $("#instIntrRate").data("kendoExtNumericTextBox").value(selectedItem.instIntrRate);
            $("#grteIncAmt").data("kendoExtNumericTextBox").value(selectedItem.grteIncAmt);
            $("#fincReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincReqDt);
            $("#fincEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincEndDt);

            /* 중고차치환 */
            $("#uatcCarPurcYn").data("kendoExtDropDownList").value(selectedItem.uatcCarPurcYn);
            $("#sUsrVinNo").val(selectedItem.usrVinNo);
            if(dms.string.strNvl(selectedItem.usrVinNoSrYn) == "Y"){
                $("#usrVinNo").val(selectedItem.usrVinNo);
            }
            $("#usrSbstAmt").data("kendoExtNumericTextBox").value( Number(selectedItem.usrSbstAmt) );
            $("#purcNo").val(selectedItem.purcNo);
            $("#beforPurcNo").val(selectedItem.purcNo);

            $("#subsidyAmt").data("kendoExtNumericTextBox").value( Number(selectedItem.subsidyAmt) );
            $("#sbusTp").val(selectedItem.sbusTp == null ? "1" : selectedItem.sbusTp);

            $('input[name="tabSbusTp"]').prop("disabled", false);
            $("#tabSbusTp0"+$("#sbusTp").val()).attr("checked", true);
            bf_uatcCarPurcYnChk(selectedItem.uatcCarPurcYn);

            /* 번호판등록서비스 */
           if(selectedItem.regTp == "A"){
                $("#tabRegTp01").siblings("li").removeClass("on");
                $("#tabRegTp01").addClass("on");
                $("#regTp").val("A");      // SAL126 대행:A , 본인:M
                $("#aapGrid").data('kendoExtGrid').dataSource.read();

                $("#btnAapsAdd").data("kendoButton").enable(true);
                $("#btnAapsDel").data("kendoButton").enable(true);
                $("#btnAapsCancel").data("kendoButton").enable(true);
            }else{
                $("#tabRegTp02").click();
            }
            //$("#regPreAmt").data("kendoExtNumericTextBox").value(selectedItem.regPreAmt);
            //$("#realRegAmt").data("kendoExtNumericTextBox").value(selectedItem.realRegAmt);
            //$("#regDistCd").data("kendoExtDropDownList").value(selectedItem.regDistCd);
            //$("#regExpcDt").data("kendoExtMaskedDatePicker").value(selectedItem.regExpcDt);
            //$("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(selectedItem.purcTaxPreAmt);
            //$("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(selectedItem.realPurcTaxAmt);
            //$("#regFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.regFeeAmt);
            //bf_sumRegAmt();

            /* 포인트 */
            $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( Number(selectedItem.blueMembershipPointVal) > 0 ? Number(selectedItem.blueMembershipPointVal) : 0.00 );
            var bmRate = selectedItem.bluePointApplyRate != null ? Number(selectedItem.bluePointApplyRate) : 0.1;
            $("#tBlueAmount").data("kendoExtNumericTextBox").value( Number(selectedItem.blueMembershipPointVal) * (bmRate * 100) );
            fn_bmPointLoad(selectedItem.custCd);

            // 견적번호 세팅
            $("#estimateNo").val(selectedItem.estimateNo);

            bf_sumCarAmt();



            /* 저장시에 재정의 사용 */
            $("#corpPromotionAmt").val('0');    // 법인 프로모션 금액
            $("#dlrPromotionAmt").val('0');     // 딜러 프로모션 금액
            $("#dcLvlCd").val(selectedItem.dcLvlCd);
            $("#dcApproveYn").val(selectedItem.dcApproveYn);

            // 직접 계약일시
            if(selectedItem.contractTp == "D"){
                $("#carlineCd").data("kendoExtDropDownList").enable(false);
                $("#modelCd").data("kendoExtDropDownList").enable(false);
                $("#ocnCd").data("kendoExtDropDownList").enable(false);
                $("#extColorCd").data("kendoExtDropDownList").enable(false);
                $("#intColorCd").data("kendoExtDropDownList").enable(false);
            }

        }
    }


    // 보험내역 Grid
    $("#incGrid").kendoExtGrid({
        gridId :"G-SAL-2017-051907"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractRe/selectIncSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        var params = {};

                        params["sDlrCd"] = dlrCd;
                        params["sContractNo"] = $("#contractNo").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,requestEnd :function(e){
                if(e.type =="read" && e.response.total > 0){
                    //console.log(e.sender._data);
                }
            }
            ,schema :{
                model :{
                    id :"contractNo",
                    fields :{
                           dlrCd          :{type:"string"}
                         , contractNo     :{type:"string"}
                         , incTp          :{type:"string"}
                         , valRecAmt      :{type:"number"}
                         , incExpcAmt     :{type:"number"}
                         , realIncAmt     :{type:"number"}
                         , incPrid        :{type:"number"}
                         , incStartDt     :{type:"date"}
                         , incEndDt       :{type:"date"}
                         , remark         :{type:"string"}
                    }
                }
            }
        }
        ,dataBound :function(e) {
            var rows = e.sender.tbody.children()
              , v_incExpcAmt = 0
              , v_realIncAmt = 0;

            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.incExpcAmt != null){
                    v_incExpcAmt += Number(dataItem.incExpcAmt);
                }
                if(dataItem.realIncAmt != null){
                    v_realIncAmt += Number(dataItem.realIncAmt);
                }
            });

            //$("#incExpcAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
            v_incExpcAmt = Number($("#incExpcAmt").data("kendoExtNumericTextBox").value());
            $("#realIncAmt").data("kendoExtNumericTextBox").value(v_realIncAmt);
            $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( (v_incExpcAmt - v_realIncAmt) );
        }
        ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
        ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
        ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
        //,appendEmptyColumn :false           //빈컬럼 적용. default :false
        ,enableTooltip :true               //Tooltip 적용, default :false
        ,height :120
        ,pageable :false
        ,resizable :true
        ,selectable :"multiple, row"
        ,autoBind :false
        ,sortable :false
        ,filterable :false
        ,edit :function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }

            var input = e.container.find(".k-input");

            if(fieldName == "incExpcAmt"){
                /*
                input.blur(function(){
                    var rows = e.sender.select();
                    var selectedItem = e.sender.dataItem(rows[0]);

                    var incExpcAmt = Number(selectedItem.incExpcAmt);

                    if(incExpcAmt >= 0 && incExpcAmt != null){

                        var grid = $("#incGrid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var item, v_incExpcAmt = 0;

                        rows.each(function(index, row) {
                            item = grid.dataItem(rows[index]);

                            if(item.incExpcAmt != null){
                                v_incExpcAmt += Number(item.incExpcAmt);
                            }
                        });

                        $("#incExpcAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
                        $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( (v_incExpcAmt - $("#realIncAmt").data("kendoExtNumericTextBox").value()) );

                        //$("#incAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
                        //bf_sumCarAmt();
                    }
                });
                */
                this.closeCell();
            }

            if(fieldName == "realIncAmt"){

                input.blur(function(){
                 // 선택된 값
                    var rows = e.sender.select();
                    var selectedItem = e.sender.dataItem(rows[0]);

                    var realIncAmt = Number(selectedItem.realIncAmt);

                    if(realIncAmt >= 0 && realIncAmt != null){

                        var grid = $("#incGrid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var item, v_realIncAmt = 0;

                        rows.each(function(index, row) {
                            item = grid.dataItem(rows[index]);

                            if(item.realIncAmt != null){
                                v_realIncAmt += Number(item.realIncAmt);
                            }
                        });

                        $("#realIncAmt").data("kendoExtNumericTextBox").value((v_realIncAmt * 10000));
                        $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( ($("#incExpcAmt").data("kendoExtNumericTextBox").value() - (v_realIncAmt * 10000)) );
                    }
                });
            }
        }
        ,columns :[
                    {field:"dlrCd", hidden:true}       // 딜러코드
                   ,{field:"contractNo", hidden:true}       // 계약번호
                   ,{
                       field:"incTp", title:"보험유형", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                       ,template :"#= dms.string.strNvl(insTpObj[incTp]) #"
                       ,editor :function (container, options){
                           $('<input required name="incTp" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                               autoBind :false
                               ,dataTextField :"cmmCdNm"
                               ,dataValueField :"cmmCd"
                               ,dataSource :dms.data.cmmCdFilter(insTpList)
                           });
                           $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
                       }
                   }    // 보험유형
                   ,{
                       field:"valRecAmt", title:"<spring:message code='sal.lbl.incAmountAmt' />(<spring:message code='sal.lbl.planUnit' />)", attributes:{"class":"ar"}, width:150
                       ,template: "#= bf_incAmtTemplate(incTp, valRecAmt) #"
                       ,editor:function(container, options){
                           var obj = $('<input name="valRecAmt" data-bind="value:' + options.field + '" style="width:100%;" />').appendTo(container);
                           if(options.model.incTp == "03"){
                               obj.kendoExtDropDownList({
                                      autoBind:false
                                     ,dataTextField:"cmmCdNm"
                                     ,dataValueField:"cmmCd"
                                     ,dataSource:dms.data.cmmCdFilter(threeIncTpAmtDs)
                                  });
                           }else{
                               obj.kendoExtNumericTextBox({
                                   format:"n2"
                                  ,decimals:2
                                  ,value:0.00
                                  ,spinners:false
                               });
                           }
                           $('<span class="k-invalid-msg" data-for="valRecAmt"></span>').appendTo(container);
                       }
                    } //수령액(보액)
                   ,{
                       field:"incExpcAmt", title:"<spring:message code='sal.lbl.incExpcPrice' />(<spring:message code='sal.lbl.planUnit' />)", attributes:{"class":"ar"}, width:150
                       , template: "#= bf_incAmtTemplate(incTp, incExpcAmt) #"
                    }   // 예상보험금액
                   ,{
                        field:"realIncAmt", title:"<spring:message code='sal.lbl.realIncPrice' />(<spring:message code='sal.lbl.planUnit' />)", attributes:{"class":"ar"}, width:150
                        ,template: "#= bf_incAmtTemplate(incTp, realIncAmt) #"
                        ,editor:function(container, options){
                            var obj = $('<input name="realIncAmt" data-bind="value:' + options.field + '" style="width:100%;" />').appendTo(container);
                            if(options.model.incTp == "03"){
                                obj.kendoExtDropDownList({
                                       autoBind:false
                                      ,dataTextField:"cmmCdNm"
                                      ,dataValueField:"cmmCd"
                                      ,dataSource:dms.data.cmmCdFilter(threeIncTpAmtDs)
                                      ,select :function(e){
                                          var grid = $("#incGrid").data("kendoExtGrid");
                                          var rows = grid.tbody.find("tr");
                                          var oItem;
                                          var oRealIncAmt = 0;
                                          rows.each(function(index, row) {
                                              oItem = grid.dataItem(rows[index]);
                                              if(oItem.realIncAmt != null){
                                                  oRealIncAmt +=  Number(oItem.realIncAmt);
                                              }
                                          });
                                          $("#realIncAmt").data("kendoExtNumericTextBox").value((oRealIncAmt * 10000));
                                          $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( ($("#incExpcAmt").data("kendoExtNumericTextBox").value() - (oRealIncAmt * 10000)) );
                                      }
                                   });
                            }else{
                                obj.kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2
                                   ,value:0.00
                                   ,spinners:false
                                });
                            }
                            $('<span class="k-invalid-msg" data-for="realIncAmt"></span>').appendTo(container);
                        }
                    }   // 실제보험금액
                   ,{
                       field:"incPrid", title:"기간(월)", attributes:{"class":"ar"}, width:90, format :"{0:n0}"
                       ,editor :function (container, options){
                           $('<input required name="incPrid" data-bind="value:' + options.field + '" onfocus="this.select()" maxlength="2" />')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                                 format:"n0"
                                 ,value:0
                                 ,change :function(e){
                                     var grid = $("#incGrid").data("kendoExtGrid");
                                     var selectedItem = grid.dataItem(grid.select());
                                     if(dms.string.isEmpty(selectedItem.incStartDt)){ return ; }

                                     var incStartOrgDt = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));
                                     var incStartDt    = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));

                                     incStartDt.setMonth(incStartDt.getMonth() + Number(this.value()));
                                     incStartDt.setDate(incStartDt.getDate() -1);
                                     var incEndDt = kendo.toString(incStartDt, "yyyy-MM-dd");

                                     selectedItem.set("incStartDt", incStartOrgDt);
                                     selectedItem.set("incEndDt",   kendo.parseDate(incEndDt));
                                     //options.model.set("incEndDt", incEndDt);
                                 }
                             });
                           $('<span class="k-invalid-msg" data-for="incPrid"></span>').appendTo(container);
                       }
                   }   // 기간(월)
                   ,{field:"incStartDt", title:"<spring:message code='sal.lbl.orgStartDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 시작일자
                   ,{field:"incEndDt", title:"<spring:message code='sal.lbl.orgEndDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }     // 종료일자
                   ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", attributes:{"class":"al"}, width:150}   // 비고
         ]
    });

    /* 용품 그리드 */
    $("#goodsGrid").kendoExtGrid({
        gridId :"G-SAL-2017-051910"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractMnt/selectGoodsSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        var params = {};

                        params["sDlrCd"] = dlrCd;
                        params["sContractNo"] = $("#contractNo").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,requestEnd :function(e){
                if(e.type =="read" && e.response.total > 0){
                    //console.log(e.sender._data);
                }
            }
            ,schema :{
                model :{
                    id :"seq",
                    fields :{
                           dlrCd       :{type:"string", editable :false}  //딜러코드
                         , contractNo  :{type:"string", editable :false}
                         , seq         :{type:"number", editable :false}  //일련번호(라인번호)
                         , statCd      :{type:"string"}
                         , goodsCd     :{type:"string"}
                         , goodsNm     :{type:"string"}
                         , goodsCnt    :{type:"number"}
                         , goodsUnitCd :{type:"string"}
                         , goodsPrc    :{type:"number"}  // 단가
                         , dcRate      :{type:"number"}  // 할인율 = (할인금액/단가) * 100
                         , dcAmt       :{type:"number"}  // 할인금액 = (단가*수량) - 금액
                         , goodsAmt    :{type:"number"}  // 실제 판매가 = 단가 - (단가*할인율)
                         , realGoodsAmt:{type:"number"}  // 용품금액 = 실제판매가 * 수량
                         , eqipCostAmt:{type:"number"}      //설치비용
                         , totAmt:{type:"number"}           //총금액 = 용품금액+설치비용
                         , expcEqipDt:{type:"date"}         //설치예정일
                         , eqipPrsnId:{type:"string"}       //설치담당
                         , expcGiEndDt:{type:"date"}        //예약출고완료일자
                         , realDlDt:{type:"date"}           //출고일
                         , pkgItemCd:{type:"string"}        //패키지품목코드
                         , grStrgeCd:{type:"string"}        //입고창고
                         , giStrgeCd:{type:"string"}        //출고창고
                         , eqipEndDt:{type:"date"}          //설치완료일
                    }
                }
                ,parse:function(d){
                    if(d.data != null){
                        $.each(d.data, function(idx, dataItem){
                            //용품판매품목상태가 반품대기(30), 반품(40) 인 경우 음수처리
                            if(dataItem.statCd == "30" || dataItem.statCd == "40"){
                                dataItem["goodsCnt"] = dataItem.goodsCnt * -1;
                                dataItem["dcAmt"] = dataItem.dcAmt * -1;
                            }
                        });
                    }
                    return d;
                 }
            }
        }
        ,dataBound :function(e) {
            var rows = e.sender.tbody.children();
            var oRealGoodsAmt = 0;
            //증정금액
            var prenAmt = 0;

            $.each(rows, function(idx, row){
                 var item = e.sender.dataItem(row);

                 //우대금액(단가*(우대율/100))
                 //item.set("dcAmt", item.goodsPrc * item.dcRate/100);
                 item["dcAmt"] = (item.goodsPrc * item.dcRate/100);

                 //실제판매가(단가-우대금액)
                 //item.set("goodsAmt", item.goodsPrc - item.dcAmt);
                 item["goodsAmt"] = item.goodsPrc - item.dcAmt;

                 //용품총가격(수량*실제판매가)
                 item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);
                 item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;

                 //금액(용품총가격+설치비용)
                 item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);
                 item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;

                 //prenAmt += item.goodsCnt * item.dcAmt;
                 oRealGoodsAmt += Number(item.totAmt);
             });

            $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
            $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);

            bf_sumCarAmt();
        }
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default :false
        ,height :115
        ,pageable :false
        ,resizable :true
        ,selectable :"multiple, row"
        ,autoBind :false
        ,sortable :false
        ,filterable :false
        ,edit :function(e){
            var eles = e.container.find("input")
              , rows = e.sender.select()
              , selectedItem = e.sender.dataItem(rows[0])
              , fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

             //용품판매품목상태가 출고대기(10)인 경우만 변경 가능
             if(selectedItem.statCd != "10"){
                 this.closeCell();
                 return;
             }

            if(fieldName == "goodsNm"){
                if(dms.string.isNotEmpty(selectedItem.goodsCd)){
                    this.closeCell();
                }
            }

            if(fieldName == "goodsUnitCd"
              || fieldName == "dcRate"
              || fieldName == "expcEqipDt"

              || fieldName == "eqipPrsnId"
              || fieldName == "expcGiEndDt"
              || fieldName == "realDlDt"
              || fieldName == "pkgItemCd"
              || fieldName == "grStrgeCd"
              || fieldName == "giStrgeCd"
              || fieldName == "eqipEndDt"
            ){
                this.closeCell();
                return;
            }
            if(fieldName == "dcAmt"){
                input.blur(function(){
                    var grid = $("#goodsGrid").data("kendoExtGrid")
                      , item = grid.dataItem(grid.select());
                    //할인율
                    //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                    item.set("dcRate", (item.dcAmt/item.goodsPrc) * 100);

                    //실제판매가(단가-할인금액)
                    //item["goodsAmt"] = item.goodsPrc - item.dcAmt;
                    item.set("goodsAmt", item.goodsPrc - item.dcAmt);

                    //용품총가격(수량*실제판매가)
                    //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                    item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                    //금액(용품총가격+설치비용)
                    //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                    item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                    //grid.refresh();
                    bf_gridSumGoodsAmt();
                });
            }
            if(fieldName == "goodsAmt"){
                input.blur(function(){
                    var grid = $("#goodsGrid").data("kendoExtGrid")
                      , item = grid.dataItem(grid.select());
                    // 할인금액 = 단가-실제판매가
                    //item["dcAmt"] = item.goodsPrc - item.goodsAmt;
                    item.set("dcAmt", item.goodsPrc - item.goodsAmt);

                    //할인율
                    //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                    item.set("dcRate", (item.dcAmt/item.goodsPrc) * 100);

                    //용품총가격(수량*실제판매가)
                    //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                    item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                    //금액(용품총가격+설치비용)
                    //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                    item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                    bf_gridSumGoodsAmt();
                });
            }
            if(fieldName == "realGoodsAmt"){
                input.blur(function(){
                    var grid = $("#goodsGrid").data("kendoExtGrid")
                      , item = grid.dataItem(grid.select());
                    // 할인금액 = 단가 - (금액/수량)
                    //item["dcAmt"] = item.goodsPrc - (item.realGoodsAmt/item.goodsCnt);
                    item.set("dcAmt", item.goodsPrc - (item.realGoodsAmt/item.goodsCnt));

                    //할인율
                    //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                    item.set("dcRate", (item.dcAmt/item.goodsPrc) * 100);

                    //금액(용품총가격+설치비용)
                    //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                    item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                    bf_gridSumGoodsAmt();
                });
            }
            if(fieldName == "goodsCnt"){
                input.blur(function(){
                    var grid = $("#goodsGrid").data("kendoExtGrid");
                    var item = grid.dataItem(grid.select());
                    //용품총가격(수량*실제판매가)
                    //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                    item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                    //금액(용품총가격+설치비용)
                    //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                    item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                    bf_gridSumGoodsAmt();
                });
            }
            if(fieldName == "eqipCostAmt"){
                input.blur(function(){
                    var grid = $("#goodsGrid").data("kendoExtGrid");
                    var item = grid.dataItem(grid.select());
                    //금액(용품총가격+설치비용)
                    //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                    item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                    bf_gridSumGoodsAmt();
                });
            }
            if(fieldName == "totAmt"){
                input.blur(function(){
                    var grid = $("#goodsGrid").data("kendoExtGrid");
                    var item = grid.dataItem(grid.select());
                    //할인금= 단가 - ((총금액-설치비)/수량)
                    //item["dcAmt"] = item.goodsPrc - ((item.totAmt-item.eqipCostAmt) / item.goodsCnt);
                    item.set("dcAmt", item.goodsPrc - ((item.totAmt-item.eqipCostAmt) / item.goodsCnt));

                    //할인율
                    //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                    item.set("dcRate", (item.dcAmt/item.goodsPrc) * 100);

                    //실제판매가(단가-할인금액)
                    //item["goodsAmt"] = item.goodsPrc - item.dcAmt;
                    item.set("goodsAmt", item.goodsPrc - item.dcAmt);

                    //용품총가격(수량*실제판매가)
                    //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                    item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                    bf_gridSumGoodsAmt();
                });
            }
        }
        ,columns :[
             {field:"dlrCd", hidden:true}            // 딜러코드
            ,{field:"contractNo", hidden:true}       // 계약번호
            ,{field:"seq", hidden:true}              // 순번
            , {field:"statCd", title:"<spring:message code='global.lbl.issueStatCd'/>", width:80
                 ,attributes:{"class":"ac"}
                 ,template:function(dataItem){
                     var statCdNm = "";

                     if(!dms.string.isEmpty(itemStatCdMap[dataItem.statCd])){
                         statCdNm = itemStatCdMap[dataItem.statCd].cmmCdNm;
                     }

                     if(dataItem.statCd == "10"){
                         return "<span class='txt_label bg_green'>" + statCdNm + "</span>";
                     }else if(dataItem.statCd == "20"){
                         return "<span class='txt_label bg_blue'>" + statCdNm + "</span>";
                     }else if(dataItem.statCd == "30"){
                         return "<span class='txt_label bg_orange'>" + statCdNm + "</span>";
                     }else if(dataItem.statCd == "40"){
                         return "<span class='txt_label bg_red'>" + statCdNm + "</span>";
                     }

                     return statCdNm;
                 }
             }
            , {field:"goodsCd", title :"<spring:message code='sal.lbl.goodsCd' />", width :95
                ,attributes :{"class" :"ac"}
                ,editor :function(container, options) {
                    if(!options.model.isNew()
                            || dms.string.isNotEmpty(options.model.pkgItemCd) ){
                        container.context.innerText = dms.string.strNvl(options.model.goodsCd);
                        return;
                    }
                    $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectGoodsSearchPopup(\''+dms.string.strNvl(options.model.goodsCd)+'\', \''+dms.string.strNvl(options.model.pkgItemCd)+'\');"></a></div>')
                    .appendTo(container);
                }
              } //용품코드
            , {field:"goodsNm", title:"<spring:message code='global.lbl.goodsNm' />", width :140, attributes :{"class" :"al"}}//용품명
            , {field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", width:70, attributes:{"class":"ar"}, format:"{0:n0}"}    // 수량
            , {field:"goodsUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:65, attributes:{"class":"ac"}} //단위

            , {field:"goodsPrc", title:"<spring:message code='global.lbl.prc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}" }    // 단가
            , {field:"dcRate", title:"<spring:message code='sal.lbl.upgrdRate' />", width:65, attributes:{"class":"ar"}, template:"#=kendo.toString(dcRate, 'n0')#%"}    //할인율
            , {field:"dcAmt", title:"<spring:message code='sal.lbl.upgrdAmt' />", width:65, attributes:{"class":"ar"}, format:"{0:n2}"}     //할인가
            , {field:"goodsAmt", title:"<spring:message code='sal.lbl.saleAmt' />", width:110, attributes:{"class":"ar"}, format:"{0:n2}"}   //실제판매가
            , {field:"realGoodsAmt", title:"<spring:message code='sal.lbl.retlTotAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}    // 금액
            , {field:"eqipCostAmt", title:"<spring:message code='sal.lbl.eqipCost' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}    //설치비용
            , {field:"totAmt", title:"<spring:message code='global.lbl.amt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}           //총가격
            , {field:"expcEqipDt", title:"<spring:message code='sal.lbl.expEqipDt' />", width:80, attributes:{"class":"ac"}                      //설치예정일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"eqipPrsnId" ,title:"<spring:message code='sal.lbl.eqipEmp' />", width:90, attributes:{"class":"ac"}                        //설치담당
                 ,template:"# if(eqipPrsnMap[eqipPrsnId] != null) { # #= eqipPrsnMap[eqipPrsnId].tecNm# # }#"
                 ,editor:function (container, options){
                     $('<input required name="eqipPrsnId" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         valuePrimitive:true
                         ,dataTextField: "tecNm"
                         ,dataValueField:"tecId"
                         ,dataSource:dms.data.cmmCdFilter(eqipPrsnList)
                         ,optionLabel:" "
                     });
                     $('<span class="k-invalid-msg" data-for="eqipPrsnId"></span>').appendTo(container);
                 }
             }
             ,{field:"eqipEndDt", title:"<spring:message code='sal.lbl.eqipEndDt' />", width:80, attributes:{"class":"ac"}                       //설치완료일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"expcGiEndDt", title:"<spring:message code='sal.lbl.expcGiEndDt' />", width:100, attributes:{"class":"ac"}                  //예약출고완료일자
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"realDlDt", title:"<spring:message code='global.lbl.giDt' />", width:80, attributes:{"class":"ac"}                          //출고일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
            , {field:"pkgItemCd", title:"<spring:message code='sal.lbl.pkgItemCd' />", width:100, attributes:{"class":"al"}, format:"{0:n2}"} //패키지번호
            , {field:"grStrgeCd",   hidden:true}
            , {field:"giStrgeCd",   hidden:true}
        ]
     });


     /**
     * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
     */
     $(document).on("click", ".grid-checkbox-item", function(e){
         var grid = $("#goodsGrid").data("kendoExtGrid")
           , row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']")
           , chk = $(this).is(":checked")
           , pkg = dms.string.strNvl(grid.dataItem(row).pkgItemCd);

         if( pkg != ""){
             var rowsPack = grid.tbody.find("tr")
               , inputRows = grid.tbody.find("tr > td > input");

             rowsPack.each(function(index, row) {
                 var rowItem = grid.dataItem(row);
                 if(pkg == dms.string.strNvl(rowItem.pkgItemCd)){
                     inputRows[index].checked = chk;
                 }
             });
         }
     });

     $(document).on("click", ".grid-checkAll", function(e){
         var grid = $("#goodsGrid").data("kendoExtGrid");
         var checked = $(this).is(":checked");
         var rows = grid.tbody.find("tr");

         if(checked){
             rows.each(function(index, row) {
                 grid.select($(this));
                 $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
             });
         }else{
             grid.clearSelection();

             rows.each(function(index, row) {
                 $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
             });
         }
     });

    // 대행업무
    $("#aapGrid").kendoExtGrid({
        gridId :"G-SAL-0223-083211"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractMnt/selectAapSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        var params = {};

                        params["sDlrCd"] = dlrCd;
                        params["sContractNo"] = $("#contractNo").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,requestEnd :function(e){
                if(e.type =="read" && e.response.total > 0){
                    //console.log(e.sender._data);
                }
            }
            ,schema :{
                model :{
                    id :"dlrCd",
                    fields :{
                           dlrCd     :{type:"string"}
                         , contractNo:{type:"string"}
                         , aapWorkTp :{type:"string"}
                         , realAapAmt :{type:"number"}
                         , aapImplyYn :{type:"string"}
                         , rmk:{type:"string"}

                    }
                }
            }
        }
        ,dataBound :function(e) {
            var rows = e.sender.tbody.children()
              , v_realAapAmt = 0

            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.realAapAmt != null && dataItem.aapImplyYn == "Y" ){
                    v_realAapAmt += Number(dataItem.realAapAmt);
                }
            });
            $("#aapAmt").data("kendoExtNumericTextBox").value(Number(v_realAapAmt));

            bf_sumCarAmt();
        }
        ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
        ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
        ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
        //,appendEmptyColumn :false           //빈컬럼 적용. default :false
        ,enableTooltip :true               //Tooltip 적용, default :false
        ,height :120
        ,pageable :false
        ,resizable :true
        ,selectable :"multiple, row"
        ,autoBind :false
        ,sortable :false
        ,filterable :false
        ,edit :function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }

            var input = e.container.find(".k-input");

            if(fieldName == "aapImplyYn"){
                this.closeCell();
            }

            if(fieldName == "realAapAmt"){

                input.blur(function(){
                    var rows = e.sender.select();
                    var selectedItem = e.sender.dataItem(rows[0]);

                    var realAapAmt = Number(selectedItem.realAapAmt);

                    if(realAapAmt >= 0 && realAapAmt != null){

                        var grid = $("#aapGrid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var item, v_realAapAmt = 0;

                        rows.each(function(index, row) {
                            item = grid.dataItem(rows[index]);

                            if(item.realAapAmt != null){
                                v_realAapAmt += Number(item.realAapAmt);
                            }
                        });
                        $("#aapAmt").data("kendoExtNumericTextBox").value(Number(v_realAapAmt));

                        bf_sumCarAmt();
                    }
                });
            }
        }
        ,columns :[
                    {field:"dlrCd", hidden:true}       // 딜러코드
                   ,{field:"contractNo", hidden:true}       // 계약번호
                   ,{
                       field:"aapWorkTp", title:"업무유형", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                       ,template :"#= dms.string.strNvl(aapWorkObj[aapWorkTp]) #"
                       ,editor :function (container, options){
                           $('<input required name="aapWorkTp" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                               autoBind :false
                               ,dataTextField :"cmmCdNm"
                               ,dataValueField :"cmmCd"
                               ,dataSource :dms.data.cmmCdFilter(aapWorkList)
                           });
                           $('<span class="k-invalid-msg" data-for="aapWorkTp"></span>').appendTo(container);
                       }
                   }    // 업무유형
                   ,{
                       field:"realAapAmt", title:"실제금액", attributes:{"class":"ar"}, width:100
                       , format:"{0:n2}"
                    } //실제금액
                   ,{
                       field:"aapImplyYn", title:"계약금 포함여부", attributes:{"class":"ac"}, width:90
                       , template: '<input type="checkbox" class="checkbox" data-uid=#= uid # onclick="bf_checkAapAmmt(this, \'#=uid#\')" id="aapImplyYn" #= aapImplyYn=="Y" ? checked="checked":"" #  />'
                    }   // 계약금 포함여부
                   ,{field:"rmk", title:"비고", attributes:{"class":"al"}, width:250}   // 비고
         ]
    });


    fnOnfocus = function(id){
        $("#"+ id +" ").select();
    }


    //$("#incAapTp02").click();       // 보험처리 - 최초:본인
    $("#fincTp02").click();         // 금융 - 최초:본인
    $("#tabFincKindCd01").click();  // 금융 - 최초:금액
    $("#tabRegTp02").click();       // 번호판등록 - 최초:본인


    // 간반차트에서 계약번호로 넘어 왔을 시.
    if("" != ""){
        reSearch("");
        $("#savedContractNo").val("");
    }

    /** 판매기회 정보 셋팅 **/
    var saleOpptNo = '${saleOpptNo}';       // 판매기회 데이터
    if(saleOpptNo != ""){
        reSearch(saleOpptNo);
        $("#savedContractNo").val(saleOpptNo);
    }
    /** 판매기회 정보 셋팅 END **/

    $("#dPopButton").show();

    // 더블클릭.
    if( dms.string.isNotEmpty(options.sContractNo)){
        fn_contOnLoad(options);
    }else{
        refreshAll();
        fn_btnState();
    }

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.contractCt' />"); //계약체결관리

    $(".k-formatted-value.k-input").parent(".k-numeric-wrap").css("border", "0px");
    $(".k-formatted-value.k-input").css("height", "32px");
    $(".k-formatted-value.k-input").css("width", "100%");
    $(".k-formatted-value.k-input").css("text-align", "right");
    $(".k-formatted-value.k-input[disabled]").unbind();
    //$("#retlAmt").unbind();
    //$("#realAmt").unbind();
    //$("#realPayAmt").unbind();


 });
 /******************************************
  * ready () = End =
  ******************************************/


  /******************************************
   * 함수영역 - start
   ******************************************/


// 초기화
   function refreshAll() {
       /* 기본정보 */
       $("#contractNo").val("");      // 계약번호
       //$("#contractDt").data("kendoExtMaskedDatePicker").enable(true);
       //$("#contractDt").data("kendoExtMaskedDatePicker").value(toDay);      // 계약일자
       $("#contractDt").val(chgServerDate2Str(toDay));      // 계약일자
       //$("#contractDt").data("kendoExtMaskedDatePicker").enable(false);
       $("#saleOpptNo").val("");      // 판매기회번호
       //$("#saleOpptYn").prop('checked', false);
       $("#saleOpptTxt").hide();

       $("#lv2DlrYn").data("kendoExtDropDownList").value('N');            // 2급딜러여부
       $("#lv2DlrOrgCd").val('');
       $("#lv2DlrOrgNm").val('');
       //$("#dlReqDt").data("kendoExtMaskedDatePicker").value(toDay);    // 인도요청일
       $("#dlReqDt").val(chgServerDate2Str(toDay));    // 인도요청일

       $("#contractTp").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(contractTpList));        // 집단판매,직접판매 제외
       $("#contractTp").data("kendoExtDropDownList").enable(true);
       $("#contractTp").data("kendoExtDropDownList").select(0);   // 계약유형

       $("#grpContractNo").val("");      // 그룹계약번호
       $("#payTp").data("kendoExtDropDownList").select(1);          // 지불방식
       if(saleEmpYn == "Y" && saleAdminYn == "N"){
           $("#saleEmpNo").data("kendoExtDropDownList").value(userId);    // 판매담당자
           $("#saleEmpNo").data("kendoExtDropDownList").enable(false);
       }else{
           $("#saleEmpNo").data("kendoExtDropDownList").value('');       // 판매담당자
           $("#saleEmpNo").data("kendoExtDropDownList").enable(true);
       }

       $("#custTp").val("01");       // 계약자 고객유형
       $("#estimateNo").val("");     // 견적번호
       $("#contractStatCd").val(""); // 계약상태

       $("#vCustNm_01").attr("disabled", false);
       $("#vCustNm_02").attr("disabled", false);
       //$("#btnCrmCustSearch_01").hide();
       //$("#btnCrmCustSearch_02").hide();

       $("#cust_02").hide();
       $("#cust_01").show();
       $("#custCd_01").val("");     // 고객코드
       $("#custNm_01").val("");     // 고객명
       $("#vCustNm_01").val("");    // 고객명
       $("#taxPayNo_01").val("");   // 납세번호
       $("#purcMngNm_01").val(""); //구매담당자명
       $("#ssnCrnTp_01").data("kendoExtDropDownList").enable(true);
       $("#ssnCrnTp_01").val("");   //신분증유형
       $("#ssnCrnTp_01").change();
       $("#ssnCrnNo_01").attr("disabled", false);
       $("#ssnCrnNo_01").val("");   //증서번호
       $("#telNo1_01").val("");     //전화번호
       $("#telNo2_01").val("");
       $("#emailNm_01").val("");    //이메일
       //$("#sungNm_01").val("");
       $("#sungCd_01").data("kendoExtDropDownList").value("");

       //$("#cityNm_01").val("");
       $("#cityCd_01").data("kendoExtDropDownList").value("");
       $("#cityCd_01").data("kendoExtDropDownList").setDataSource([]);
       $("#cityCd_01").data("kendoExtDropDownList").enable(false);

       //$("#distNm_01").val("");
       $("#distCd_01").data("kendoExtDropDownList").value("");
       $("#distCd_01").data("kendoExtDropDownList").setDataSource([]);
       $("#distCd_01").data("kendoExtDropDownList").enable(false);

       $("#zipCd_01").val("");
       $("#addrTp_01").data("kendoExtDropDownList").value("03");
       $("#addrDetlCont_01").val("");

       $("#custCd_02").val("");      // 고객코드
       $("#custNm_02").val("");      // 고객명
       $("#vCustNm_02").val("");     // 고객명
       $("#taxPayNo_02").val("");    // 납세번호
       $("#purcMngNm_02").val(""); //구매담당자명
       $("#ssnCrnTp_02").data("kendoExtDropDownList").enable(true);
       $("#ssnCrnTp_02").val("");    //신분증유형
       $("#ssnCrnTp_02").change();
       $("#ssnCrnNo_02").attr("disabled", false);
       $("#ssnCrnNo_02").val("");    //증서번호
       $("#telNo1_02").val("");      //전화번호
       $("#telNo2_02").val("");
       $("#emailNm_02").val("");     //이메일

       //$("#sungNm_02").val("");
       $("#sungCd_02").data("kendoExtDropDownList").value("");

       //$("#cityNm_02").val("");
       $("#cityCd_02").data("kendoExtDropDownList").value("");
       $("#cityCd_02").data("kendoExtDropDownList").setDataSource([]);
       $("#cityCd_02").data("kendoExtDropDownList").enable(false);

       //$("#distNm_02").val("");
       $("#distCd_02").data("kendoExtDropDownList").value("");
       $("#distCd_02").data("kendoExtDropDownList").setDataSource([]);
       $("#distCd_02").data("kendoExtDropDownList").enable(false);
       $("#zipCd_02").val("");
       $("#addrTp_02").data("kendoExtDropDownList").value("03");
       $("#addrDetlCont_02").val("");

       /* 차량 */
       $("#carlineCd").data("kendoExtDropDownList").enable(true);
       $("#carlineCd").data("kendoExtDropDownList").value('');

       var modelCd = $("#modelCd").data("kendoExtDropDownList");
       modelCd.setDataSource([]);
       modelCd.enable(false);
       modelCd.value('');

       var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
       ocnCd.setDataSource([]);
       ocnCd.enable(false);
       ocnCd.value('');

       var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
       extColorCd.setDataSource([]);
       extColorCd.enable(false);
       extColorCd.value('');

       var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
       intColorCd.setDataSource([]);
       intColorCd.enable(false);
       intColorCd.value('');

       $("#beforVinNo").val('');                               // vin no
       $("#vinNo").val('');                                    // vin no
       $("#sVinNo").val('');                                  // 조회용

       $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);     // 지도가
       //$("#retlAmt").val(dms.format.currency(0));                // 공장지도가
       $("#realCarAmt").data("kendoExtNumericTextBox").value(0.00);  // 실제차량금액
       //$("#realCarAmt").val(dms.format.currency(0));                // 실제차량금액

       /* 계약가격정보 */
       $("#realAmt").data("kendoExtNumericTextBox").value(0.00);        // 순차량금액
       //$("#realAmt").val(dms.format.currency(0));                // 순차량금액
       $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);       // 용품가격
       $("#incAmt").data("kendoExtNumericTextBox").value(0.00);         // 보험료
       $("#fincAmt").data("kendoExtNumericTextBox").value(0.00);        // 금융
       $("#sbstAmt").data("kendoExtNumericTextBox").value(0.00);        // 치환차감
       $("#aapAmt").data("kendoExtNumericTextBox").value(0.00);         // 대행료
       //$("#promotionAmt").data("kendoExtNumericTextBox").value(0);   // 판촉금액
       $("#promotionAmt").val(0);                                 // 판촉금액
       $("#pointAmt").data("kendoExtNumericTextBox").value(0.00);       // 포인트
       $("#realPayAmt").data("kendoExtNumericTextBox").value(0.00);     // 실제지불금액
       //$("#realPayAmt").val(dms.format.currency(0));                // 실제지불금액


       //$("#tabstrip").data("kendoExtTabStrip").select(0);
       //selectTabId = "goodsTab";      // 용품

       /* 용품 */
       $("#goodsTotAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#goodsGrid").data('kendoExtGrid').dataSource.data([]);

       /* 보험 */
       //$("#incAapTp02").click();    // 보험서비스 :본인
       $("#incAapTp").val("A");      // SAL126 대행:A , 본인:M
       $("#incExpcAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#realIncAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#incDifferenceAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#incFeeAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#incImplyYn").prop('checked', true);
       $("#finImplyYn").prop('checked', false);
       $("#incPconCustNm").val('');
       $("#incPconCustTelNo").val('');
       $("#incCustNm").val('');
       $("#incCustTelNo").val('');
       $("#incCmpCd").data("kendoExtDropDownList").value('');
       $("#incProfitNm").val('');
       $("#frcIncAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#busIncAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#transIncTaxAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#incRemark").val('');
       $("#incGrid").data('kendoExtGrid').dataSource.data([]);     // 보험 Grid

       /*금융*/
       $("#fincTp02").click();      // 금융 : 본인
       $("#fincReqYn").val("Y");
       $("#tabFincKindCd01").click();      //금융서비스 :상품관리 유형 - 금액
       $("#fincReqYn").val("N");

       //bf_fincReq();
       $("#fincCmpCd").data("kendoExtDropDownList").value('');
       $("#fincCmpCd").change();
       $("#fincRpayPrid").data("kendoExtNumericTextBox").value(0);
       $("#fincLoadRate").data("kendoExtNumericTextBox").value(0.00);

       $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#fincItemCd").data("kendoExtDropDownList").value('');
       $("#fincBurdAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#fincReqAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
       $("#grteIncAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#fincReqDt").data("kendoExtMaskedDatePicker").value('');
       $("#fincEndDt").data("kendoExtMaskedDatePicker").value('');

       /* 중고차치환 */
       $("#uatcCarPurcYn").data("kendoExtDropDownList").value("N");
       $("#sUsrVinNo").val('');
       $("#usrVinNo").val('');
       $("#purcNo").val('');
       $("#beforPurcNo").val('');

       $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#sUsrVinNo").attr("disabled", true);
       $("#purcNo").attr("disabled", true);
       $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
       $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
       $("#sbusTp").val("1");
       $("#tabSbusTp01").attr("checked", true);
       $('input[name="tabSbusTp"]').prop("disabled", true);
       //bf_uatcCarPurcYnChk("N");

       /* 대행업무 */
       $("#tabRegTp02").click();    // 번호판 등록서비스 :본인

       /* 포인트*/
       $("#blueMembershipId").val('');
       $("#bluePointApplyRate").val('0.1');
       $("#mLevel").data("kendoExtDropDownList").value('');
       $("#point").data("kendoExtNumericTextBox").value(0.00);
       $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0.00);
       $("#tBlueAmount").data("kendoExtNumericTextBox").value(0.00);


       /* 판촉 */
       //$("#promotionAmt").data("kendoExtNumericTextBox").value(0.00);

       bf_sumCarAmt();

       $("#savedContractNo").val("");      // 저장 조회용

       $("#dcLvlCd").val("");
       $("#dcApproveYn").val("N");
   }




   /** [차량영역] ComboBox Select() **/
 //차종에 따른 모델검색 [차량영역]
 function onSelectCarlineCd(e){
     $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
     $("#modelCd").data("kendoExtDropDownList").enable(true);

     $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
     $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

     $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
     $("#extColorCd").data("kendoExtDropDownList").enable(false);

     $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
     $("#intColorCd").data("kendoExtDropDownList").enable(false);

     $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);         // 지도가
         $("#realCarAmt").data("kendoExtNumericTextBox").value(0.00);      // 순차량금액
         //$("#realCarAmt").val(0.00);      // 순차량금액

         bf_addDcRealAmt();

         $("#vinNo").val('');    // vin no
         $("#sVinNo").val('');

         var dataItem = this.dataItem(e.item);
         if(dataItem.carlineCd == ""){
             $("#modelCd").data("kendoExtDropDownList").enable(false);
             return false;
         }

         $("#modelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
     }

     // 모델에 따른 OCN검색 [차량영역]
     function onSelectModelCd(e){
         $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
         $("#ocnCd").data("kendoExtDropDownList").enable(true);

         $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#extColorCd").data("kendoExtDropDownList").enable(false);

         $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#intColorCd").data("kendoExtDropDownList").enable(false);

         $("#vinNo").val('');    // vin no
         $("#sVinNo").val('');

         var dataItem = this.dataItem(e.item);
         if(dataItem.modelCd == ""){
             $("#ocnCd").data("kendoExtDropDownList").enable(false);
             return false;
         }

         $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), dataItem.modelCd));

         $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
         $("#realCarAmt").data("kendoExtNumericTextBox").value(0);      // 순차량금액
         //$("#realCarAmt").val(0);      // 순차량금액
         bf_addDcRealAmt();

     }

     //OCN에 따른 외장색 검색
     function onSelectOcnCd(e){
         $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#extColorCd").data("kendoExtDropDownList").enable(true);

         $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#intColorCd").data("kendoExtDropDownList").enable(false);

         $("#vinNo").val('');    // vin no
         $("#sVinNo").val('');

         if(this.dataItem(e.item).ocnCd == ""){
             $("#extColorCd").data("kendoExtDropDownList").enable(false);
             return false;
         }

         //차량 가격 세팅
         $("#retlAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).msPrc);       // 지도가
         $("#realCarAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).msPrc);    // 순차량금액
         //$("#realCarAmt").val(this.dataItem(e.item).msPrc);    // 순차량금액
         bf_addDcRealAmt();

         $("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource($("#modelCd").data("kendoExtDropDownList").value()));
     }

     // 외장색에 따른 내장색 검색
     function onSelectExtColorCd(e){
         $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#intColorCd").data("kendoExtDropDownList").enable(true);

         $("#vinNo").val('');    // vin no
         $("#sVinNo").val('');

         if(this.dataItem(e.item).ocnCd == ""){
             $("#intColorCd").data("kendoExtDropDownList").enable(false);
             return false;
         }
         $("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#modelCd").data("kendoExtDropDownList").value()));
     }

     // 차관(모델)의 DataSource를 불러온다.
     function setModelDataSource(carlineCd){
         var responseJson = dms.ajax.getJson({
             url :"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
             ,data :JSON.stringify({"carlineCd":carlineCd})
             ,async :false
         });

         if(responseJson == null || responseJson.data == null){
             responseJson.data = null;
         }
         return responseJson.data;
     }

     // OCN의 DataSource를 불러온다.
     function setOcnDataSource(carlineCd, modelCd){
         var responseJson = dms.ajax.getJson({
             url :"<c:url value='/sal/cnt/contractRe/selectOcn.do' />"
             ,data :JSON.stringify({"carlineCd":carlineCd, "modelCd":modelCd})
             ,async :false
         });

         if(responseJson == null || responseJson.data == null){
             responseJson.data = null;
         }
         return responseJson.data;
     }

     // 외장색의 DataSource를 불러온다.
     function setExtColorDataSource(modelCd){
         var responseJson = dms.ajax.getJson({
             url :"<c:url value='/sal/cnt/contractRe/selectExtColor.do' />"
             ,data :JSON.stringify({"modelCd":modelCd})
             ,async :false
         });

         if(responseJson == null || responseJson.data == null){
             responseJson.data = null;
         }

         return responseJson.data;
     }

     // 내장색의 DataSource를 불러온다.
     function setIntColorDataSource(modelCd){
         var responseJson = dms.ajax.getJson({
             url :"<c:url value='/sal/cnt/contractRe/selectIntColor.do' />"
             ,data :JSON.stringify({"modelCd":modelCd})
             ,async :false
         });

         if(responseJson == null || responseJson.data == null){
             responseJson.data = null;
         }

         return responseJson.data;
     }

     // 보험수수료 = 보험 탭
     function bf_onIncAmt(){
         var incExpcAmt = $("#incExpcAmt").data("kendoExtNumericTextBox").value();
         var incFeeAmt = $("#incFeeAmt").data("kendoExtNumericTextBox").value();

         if(incExpcAmt == null){
             incExpcAmt = 0;
             $("#incExpcAmt").data("kendoExtNumericTextBox").value(incExpcAmt);
         }

         if(incFeeAmt == null){
             incFeeAmt = 0;
             $("#incFeeAmt").data("kendoExtNumericTextBox").value(incFeeAmt);
         }

         $("#incAmt").data("kendoExtNumericTextBox").value(incExpcAmt+incFeeAmt);
         bf_sumCarAmt();
     }

     // 순차량금액 조정
     function bf_addDcRealAmt(){
         var realCarAmt = $("#realCarAmt").data("kendoExtNumericTextBox").value();
         //var realCarAmt = $("#realCarAmt").val();
         if(realCarAmt == null){
             realCarAmt = 0;
             $("#realCarAmt").data("kendoExtNumericTextBox").value(realCarAmt);
             //$("#realCarAmt").val(realCarAmt);
         }

         $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
         bf_sumCarAmt();
     }

     // 차량가격 계산
     function bf_sumCarAmt(){
        var carAmt     = Number($("#retlAmt").data("kendoExtNumericTextBox").value());
        var realCarAmt = Number($("#realCarAmt").data("kendoExtNumericTextBox").value());
        //var realCarAmt = Number($("#realCarAmt").val());
        var dcAmt      = carAmt - realCarAmt;
        //2016.11.03 이승민과장 로직추가 : carAmt == 0은 할인가 표시 안함.
        //$("#promotionAmt").data("kendoExtNumericTextBox").value(carAmt==0?0:dcAmt);
        $("#promotionAmt").val(carAmt==0?0.00:dcAmt);

        var goodsAmt = Number($("#goodsAmt").data("kendoExtNumericTextBox").value());
        var incAmt   = Number($("#incAmt").data("kendoExtNumericTextBox").value());
        var fincAmt  = Number($("#fincAmt").data("kendoExtNumericTextBox").value());
        var sbstAmt  = Number($("#sbstAmt").data("kendoExtNumericTextBox").value());
        var aapAmt   = Number($("#aapAmt").data("kendoExtNumericTextBox").value());
        var pointAmt = Number($("#pointAmt").data("kendoExtNumericTextBox").value());

        // 실제차량금액 = 지도가 + 용품 + 보험 + 금융 + 중고차(-) + 대행 - 할인 + 포인트(-)
        var carTotAmt = carAmt + goodsAmt + incAmt + fincAmt + sbstAmt + aapAmt - dcAmt + pointAmt;

        // 총판매 금액 : 실제차량금액
        $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt);

        //중고차 보조금
        var subsidyAmt = Number($("#subsidyAmt").data("kendoExtNumericTextBox").value());
        switch($("#sbusTp").val()){
            case '1':
                $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
                break;
            case '2':
                $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
                $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt-subsidyAmt);
                break;
            case '3':
                $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt-subsidyAmt);
                $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt-subsidyAmt);
                break;
        }

        // 금융신청금액 = 완성차가격 - 자기금액
        if( dms.string.strNvl($("#fincReqYn").val()) == "Y"){
            var fincBurdAmt = Number($("#fincBurdAmt").data("kendoExtNumericTextBox").value());
            fincBurdAmt = fincBurdAmt < 0 ? 0 : fincBurdAmt;
            var fincReqAmt = carTotAmt - fincBurdAmt;
            $("#fincReqAmt").data("kendoExtNumericTextBox").value(fincReqAmt);

            if( fincReqAmt > 0  && carTotAmt > 0){
                   $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / carTotAmt) * 100 );
               }else{
                   $("#fincLoadRate").data("kendoExtNumericTextBox").value(0.00);
               }
        }
     }

     // 중고차치환 여부 변경 change
     bf_uatcCarPurcYnChk = function(chk){
         if(chk == "Y"){
             $("#sUsrVinNo").attr("disabled", false);
             $("#purcNo").attr("disabled", false);
             $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(true);
             $("#subsidyAmt").data("kendoExtNumericTextBox").enable(true);
             $('input[name="tabSbusTp"]').prop("disabled", false);
         }else{
             $("#sUsrVinNo").val('');
             $("#usrVinNo").val('');
             $("#purcNo").val('');
             $("#beforPurcNo").val('');

             $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
             $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
             $("#sbusTp").val('1');
             $("#tabSbusTp01").attr("checked", true);

             bf_addUsrSbstAmt();

             $("#sUsrVinNo").attr("disabled", true);
             $("#purcNo").attr("disabled", true);
             $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
             $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
             $('input[name="tabSbusTp"]').prop("disabled", true);
         }
     }

     // 중고차 치환 ( 음수로 표시 요청 )
     bf_addUsrSbstAmt = function(){
         var usrSbstAmt = $("#usrSbstAmt").data("kendoExtNumericTextBox").value();
         if(usrSbstAmt == null){
             usrSbstAmt = 0;
             $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
         }
         $("#sbstAmt").data("kendoExtNumericTextBox").value( Number(usrSbstAmt) * -1 );

         // 중고차 기업보조금
         var subsidyAmt = $("#subsidyAmt").data("kendoExtNumericTextBox").value();
         if(subsidyAmt == null){
             subsidyAmt = 0;
             $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
         }

         bf_sumCarAmt();
     }

     // 번호판 등록처리
     /*
     bf_addRegAmt = function(){
         var regPreAmt = $("#regPreAmt").data("kendoExtNumericTextBox").value();
         if(regPreAmt == null){
             regPreAmt = 0;
             $("#regPreAmt").data("kendoExtNumericTextBox").value(0.00);
         }
         $("#aapAmt").data("kendoExtNumericTextBox").value( regPreAmt );
         bf_sumCarAmt();
     }
     */

     // 번호판 차익계산
     /*
     bf_sumRegAmt = function(){
         var purcTaxPreAmt  = $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value();
         var realPurcTaxAmt = $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value();

         if(purcTaxPreAmt == null){
             purcTaxPreAmt = 0;
             $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(0.00);
         }

         if(realPurcTaxAmt == null){
             realPurcTaxAmt = 0;
             $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(0.00);
         }

         $("#regDifferenceAmt").data("kendoExtNumericTextBox").value( purcTaxPreAmt - realPurcTaxAmt );
     }
     */

     // 대행 - 계약금 포함여부
     bf_checkAapAmmt = function(obj, uid){
         var uidVal = uid;

         var grid = $("#aapGrid").data("kendoExtGrid");
         var selectRow = grid.dataSource.getByUid(uid);
         if(obj.checked){
             selectRow[obj.id] = "Y";
         }else{
             selectRow[obj.id] = "N";
         }
         selectRow["dirty"] = true;

         var rows = grid.tbody.find("tr");
         var chkAmt = 0;
         $.each(rows, function(idx, row){
             var item = grid.dataItem(row);
             if(item.aapImplyYn == "Y"){
                 chkAmt += Number(item.realAapAmt);
             }
         });

         $("#aapAmt").data("kendoExtNumericTextBox").value(chkAmt);
         bf_sumCarAmt();
     }
     //대행업무 그리드 초기화
     function initAapGrid(){
         var grid = $("#aapGrid").data('kendoExtGrid');
         grid.dataSource.data([]);

         var rowNum = 0;
         $.each(aapWorkList, function(index, row){
             if( row["useYn"] == "Y" && row["remark1"] == "P" ){
                 grid.dataSource.insert(rowNum, {
                     "aapWorkTp":row["cmmCd"]
                     ,"realAapAmt":0
                     ,"aapImplyYn":"Y"
                 }).set("dirty", true);
             }
         });
     }


     // 보험 : 총금액포함여부 체크
     bf_incImplyYn = function(){
       if( $("#incImplyYn").prop('checked') ){
           bf_onIncAmt();
       }else{
           $("#incAmt").data("kendoExtNumericTextBox").value(0.00);
           bf_sumCarAmt();
       }
     }

     // 보험예상금액
     bf_sumIncAmt = function(){
         var incExpcAmt  = $("#incExpcAmt").data("kendoExtNumericTextBox").value();
         var realIncAmt = $("#realIncAmt").data("kendoExtNumericTextBox").value();

         if(incExpcAmt == null){
             incExpcAmt = 0;
             $("#incExpcAmt").data("kendoExtNumericTextBox").value(0.00);
         }

         if(realIncAmt == null){
             realIncAmt = 0;
             $("#realIncAmt").data("kendoExtNumericTextBox").value(0.00);
         }
         $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( incExpcAmt - realIncAmt );
     }

     //용품Grid 수량 및 값 입력시 계산.
     bf_gridSumGoodsAmt = function(){
          var grid = $("#goodsGrid").data("kendoExtGrid");
          var rows = grid.tbody.find("tr");
          var oItem, oRealGoodsAmt = 0;

          rows.each(function(index, row) {
              oItem = grid.dataItem(rows[index]);
             if(oItem.realGoodsAmt != null){
                 oRealGoodsAmt += Number(oItem.totAmt);
             }
          });

         $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
         $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
         bf_sumCarAmt();
     }

     // 포인트 금액
     bf_sumPointAmt = function(){
         var blueMembershipPointVal  = $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value();

         if(blueMembershipPointVal == null || blueMembershipPointVal < 0){
             blueMembershipPointVal = 0;
             $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0);
         }

         var bmRate = Number($("#bluePointApplyRate").val()) ;
         var bmPointAmt = Number($("#point").data("kendoExtNumericTextBox").value()) / (bmRate * 100) ;
         bmPointAmt = Math.floor(bmPointAmt);
         if( (bmPointAmt - blueMembershipPointVal) < 0 ){
             blueMembershipPointVal = bmPointAmt;
             $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( bmPointAmt );
             mob.notification.info("<spring:message code='global.lbl.savePoint' var='globalLblSavePoint' /><spring:message code='crm.lbl.amount' var='crmLblAmount' /><spring:message code='sal.info.maxInfoChk' arguments='${globalLblSavePoint},${crmLblAmount}' />");
         }
         $("#tBlueAmount").data("kendoExtNumericTextBox").value( blueMembershipPointVal * (bmRate * 100) );

         // [TOBE] Dlr포인트 미확정 대기.

         // 포인트 금액
         $("#pointAmt").data("kendoExtNumericTextBox").value( blueMembershipPointVal * -1 );
         bf_sumCarAmt();
     }

     // 포인트 조회
     function fn_bmPointLoad(custNo){
         $.ajax({
            url :"<c:url value='/sal/cnt/contractMnt/selectBuleMemeberInfoSearch.do' />"
            ,data :JSON.stringify({"dlrCd":dlrCd, "custNo":custNo})
            ,type :'POST'
            ,dataType :'json'
            ,contentType :'application/json'
            ,error :function(jqXHR,status,error) {
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }else{
                    //mob.notification.error(error);
                }
                $("#blueMembershipId").val('');
                $("#bluePointApplyRate").val('0.1');
                $("#mLevel").data("kendoExtDropDownList").value('');
                $("#point").data("kendoExtNumericTextBox").value(0.00);
            }
            ,success :function(jqXHR, textStatus) {
                 if(jqXHR.Data != null){
                     //console.log("BM Point result : ", jqXHR);
                     //$("#blueMembershipId").val(dms.string.strNvl(jqXHR.Data.BlueMembership_Id));
                     $("#blueMembershipId").val(dms.string.strNvl(jqXHR.Data.BlueMembership_No));
                     $("#bluePointApplyRate").val(dms.string.strNvl(jqXHR.Data.Scale));
                     $("#mLevel").data("kendoExtDropDownList").value(dms.string.strNvl(jqXHR.Data.Mlevel));
                     $("#point").data("kendoExtNumericTextBox").value(Number(jqXHR.Data.Point));
                     //$("#blueMembershipNo").val(jqXHR.blueMembershipNo);
                     //console.log("jqXHR.Data.Mlevel : ",jqXHR.Data.Mlevel);
                 }else{
                     $("#blueMembershipId").val('');
                     $("#bluePointApplyRate").val('0.1');
                     $("#mLevel").data("kendoExtDropDownList").value('');
                     $("#point").data("kendoExtNumericTextBox").value(0.00);
                 }
            }
        });
     }

     // 딜러조회
     bf_dealerSearchPopup = function(){
         return ;
         dealerSearchPopupWin = dms.window.popup({
             windowId :"dealerSearchPopupWin"
             ,title :"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
             ,modal:true
             , content :{
                 url :"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                     , data:{
                         "autoBind" :false
                         ,"dlrCd":$("#sDlrCd").val()
                         ,"closeAfterSelect":true
                         ,"callbackFunc" :function(data){
                             if(data.length >= 1) {
                                 $("#dlrCd").val(data[0].dlrCd);
                                 $("#dlrNm").val(data[0].dlrNm);
                             }
                         }
                     }
             }
         });
     }

     // 2급딜러 조회
     function fn_secondDealerSearch(){
         var obj = {};
         obj["lv2DlrYn"] = $("#lv2DlrYn").data("kendoExtDropDownList").value();
         obj["lv2DlrOrgCd"] = $("#lv2DlrOrgCd").val();

         parent.bf_searchSecondDealerSearchPopup(obj);
     }

     // 2급딜러조회 call back
     function bf_searchSecondDealerSearchPopupCallBack(data){
         if(data.length > 0){
              $("#lv2DlrOrgCd").val(data[0].lv2DlrCd);
              $("#lv2DlrOrgNm").val(data[0].lv2DlrNm);
          }
     }

     // 고객조회 버튼
     $("#custSearch").bind("click", function() {
         var custTp = $("#custTp").val();
         var custNm = $("#vCustNm_01").val();
         if (custTp == "02") {
             custNm = $("#vCustNm_02").val();
         }

         bf_searchCustomer(custNm);

     });

     // CRM 고객 데이터 조회
     bf_searchCustomer = function(custNm){

         // 판매기회로 넘어온 고객은 고객변경 불가.
         if($("#saleOpptNo").val() != ""){ return;}

         // 집단판매는 고객정보 변경 불가
         if($("#contractTp").data("kendoExtDropDownList").value() == "G"){ return;}

         var responseJson = {};
/*          if( dms.string.trim($("#"+sIdNm).val()).length > 0 ){
             responseJson = dms.ajax.getJson({
                 url :"<c:url value='/sal/cnt/contractMnt/selectCrmCustomerInfo.do' />"
                 ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#"+custNm).val()})
                 ,async :false
             });
         } */

         if(responseJson != null && responseJson.total == 1){
             bf_customerSet(responseJson.data);
         }else{
             /* var obj = {};
             obj["sIdNm"] = $("#"+sIdNm).val(); */
             bf_pSearchCustomer(custNm);
         }
     }

     //고객조회 팝업
     function bf_pSearchCustomer(custNm) {

         popupWindow = mob.window.popup({
             windowId:"customerSearchPopupMain"
             , content:{
                 url:"<c:url value='/mob/crm/cif/customerInfo/selectContractCustSearchPopup.do'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                 , data:{
                     "autoBind":false
                     , "custNm":custNm
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data != null) {
                             //console.log(data);
                             bf_customerSet(data);
                         }
                         popupWindow.close();

                     }
                 }
             }
         });

     }

     function bf_customerSet(data){
         var custTp = data[0].custTp;
         $("#custTp").val(custTp);

         if(custTp == "02"){  // 법인
             $("#cust_01").hide();
             $("#cust_02").show();
         }
         else{            // 개인
             $("#cust_02").hide();
             $("#cust_01").show();
         }

         fn_bmPointLoad(data[0].custNo);
         $("#custCd_"+custTp).val(data[0].custNo);        // 고객코드
         $("#custNm_"+custTp).val(data[0].custNm);        // 고객명
         $("#vCustNm_"+custTp).val(data[0].custNm);       // 고객명
         $("#taxPayNo_"+custTp).val(data[0].taxpayerNo);  // 납세번호
         $("#purcMngNm_"+custTp).val(dms.string.strNvl(data[0].purcMngNm));    // 구매담당자명
         $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
         $("#ssnCrnTp_"+custTp).change();
         $("#ssnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
         $("#telNo1_"+custTp).val(data[0].hpNo);        // 전화번호1
         $("#telNo2_"+custTp).val(data[0].telNo);       // 전화번호2
         $("#emailNm_"+custTp).val(data[0].emailNm);    // 이메일명

         //$("#sungNm_"+custTp).val(data[0].sungNm);
         $("#sungCd_"+custTp).data("kendoExtDropDownList").value(data[0].sungCd);

         // 시
         if(dms.string.isNotEmpty(data[0].sungCd)){
             var rsJsonCity = dms.ajax.getJson({
                 url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                 ,data :JSON.stringify({"sungCd":data[0].sungCd})
                 ,async :false
             });
             $("#cityCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonCity.data);
             //$("#cityNm_"+custTp).val(data[0].cityNm);
             $("#cityCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(data[0].cityCd));

             // 구
             if(dms.string.isNotEmpty(data[0].cityCd)){
                 var rsJsonDist = dms.ajax.getJson({
                     url :"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
                     ,data :JSON.stringify({"sungCd":data[0].sungCd, "cityCd":data[0].cityCd})
                     ,async :false
                 });
                 $("#distCd_"+custTp).data("kendoExtDropDownList").enable(true);
                 $("#distCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonDist.data);
                 //$("#distNm_"+custTp).val(data[0].distNm);
                 $("#distCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(data[0].distCd));
             }else{
                 $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
                 $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
             }
         }else{
             $("#cityCd_"+custTp).data("kendoExtDropDownList").value("");
             $("#cityCd_"+custTp).data("kendoExtDropDownList").enable(false);
             $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
             $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
         }

         $("#zipCd_"+custTp).val(data[0].zipCd);      // 우편번호

         if(dms.string.isEmpty(data[0].addrTp)){
             $("#addrTp_"+custTp).data("kendoExtDropDownList").value("03");   //주소유형
         }else{
             $("#addrTp_"+custTp).data("kendoExtDropDownList").value(data[0].addrTp);   //주소유형
         }

         $("#addrDetlCont_"+custTp).val(data[0].addrDetlCont);   // 상세주소
     }

     //우편번호 찾기
     bf_custZipCodeSearch = function (custTp){
         var obj = {};
         obj["custTp"] = custTp;
         obj["sZipCd"] = $("#zipCd_"+custTp).val();
         parent.bf_pSearchZipCode(obj);
     }
     //우편번호 찾기 call back
     function bf_custZipCodeSearchCallBack(data){
         if(data.length > 0){
             var custTp = data[0].custTp;

             $("#zipCd_"+custTp).val(data[0].zipCd);
             $("#addrDetlCont_"+custTp).val('');

             // 성
             //$("#sungNm_"+custTp).val(data[0].sungNm);
             $("#sungCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(data[0].sungCd));

             // 시
             if(dms.string.isNotEmpty(data[0].sungCd)){
                 var rsJsonCity = dms.ajax.getJson({
                     url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                     ,data :JSON.stringify({"sungCd":data[0].sungCd})
                     ,async :false
                 });
                 $("#cityCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonCity.data);
                 //$("#cityNm_"+custTp).val(data[0].cityNm);    // 시
                 $("#cityCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(data[0].cityCd));    // 시
                 $("#cityCd_"+custTp).data("kendoExtDropDownList").enable(true);

                 // 구
                 if(dms.string.isNotEmpty(data[0].cityCd)){
                     var rsJsonDist = dms.ajax.getJson({
                         url :"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
                         ,data :JSON.stringify({"sungCd":data[0].sungCd, "cityCd":data[0].cityCd})
                         ,async :false
                     });
                     $("#distCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonDist.data);
                     //$("#distNm_"+custTp).val(data[0].distNm);    // 구
                     $("#distCd_"+custTp).data("kendoExtDropDownList").value(dms.string.strNvl(data[0].distCd));    // 구
                     $("#distCd_"+custTp).data("kendoExtDropDownList").enable(true);
                 }else{
                     $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
                     $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
                 }
             }else{
                 $("#cityCd_"+custTp).data("kendoExtDropDownList").value("");
                 $("#cityCd_"+custTp).data("kendoExtDropDownList").enable(false);
                 $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
                 $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
             }
          }
     }

     //용품조회
     selectGoodsSearchPopup = function(goodsCd, pkgItemCd){
         var obj = {};
         obj["dlrCd"] = dlrCd;
         obj["carlineCd"] = $("#carlineCd").data("kendoExtDropDownList").value();
         obj["goodsCd"] = goodsCd;
         obj["pkgItemCd"] = pkgItemCd;

         parent.bf_pSearchGoodsSearchPopup(obj);
     }
     //용품조회 call back
     function bf_goodsSearchPopupCallBack(data, type){
         var tData = {};
         var grid = $("#goodsGrid").data("kendoExtGrid");
         var selectItem = grid.dataItem(grid.select());

         if(type == "01"){       // 패키지
             var pkgItemCd = "", isPackageFlag = false;

             for(var i=0; i<data.length; i++){
                 tData = data[i];
                 pkgItemCd = tData["pkgItemCd"];

                 if(i == 0){

                     var rowNum = 0;
                     var rows = grid.tbody.find("tr");
                     $.each(rows, function(index, row) {
                         var rowItem = grid.dataItem(row);

                         if(pkgItemCd == rowItem.pkgItemCd){
                             isPackageFlag = true;
                         }

                         if(selectItem.uid == rowItem.uid ){
                             rowNum = index;
                         }
                     });

                     if(isPackageFlag){
                         // 동일한 패키지가 존재합니다.
                         mob.notification.info("<spring:message code='sal.info.IsPackageMsg'/>");
                         return false;
                     }
                     selectItem.set("dlrCd", dlrCd);
                     selectItem.set("contractNo", $("#contractNo").val());
                     selectItem.set("statCd", "10");
                     selectItem.set("goodsCd", tData.itemCd);
                     selectItem.set("goodsNm", tData.itemNm);
                     selectItem.set("goodsCnt", 1);
                     selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd:tData.itemUnitCd );
                     selectItem.set("goodsPrc", Number(tData.itemPrc));
                     selectItem.set("dcRate", Number(tData.pkgDetlDcRate));
                     selectItem.set("dcAmt",   Number(tData.itemPrc) - (Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) )  );
                     selectItem.set("goodsAmt", Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) );
                     selectItem.set("realGoodsAmt", (Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) ) );
                     selectItem.set("eqipCostAmt", 0 );
                     selectItem.set("totAmt", (Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) ) );
                     selectItem.set("expcEqipDt", "");
                     selectItem.set("eqipPrsnId", "");
                     selectItem.set("expcGiEndDt", "");
                     selectItem.set("realDlDt", "");
                     selectItem.set("pkgItemCd", pkgItemCd);
                     selectItem.set("grStrgeCd",   tData.grStrgeCd);
                     selectItem.set("giStrgeCd",   tData.giStrgeCd);
                     selectItem.set("eqipEndDt", "");
                     selectItem.set("dirty", true);
                 }else{
                     grid.dataSource.insert(rowNum+i, {
                         "dlrCd":dlrCd
                         ,"contractNo":$("#contractNo").val()
                         ,"statCd":"10"
                         ,"goodsCd":tData.itemCd
                         ,"goodsNm":tData.itemNm
                         ,"goodsCnt":1
                         ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd :tData.itemUnitCd
                         ,"goodsPrc":Number(tData.itemPrc)
                         ,"dcRate":Number(tData.pkgDetlDcRate)
                         ,"dcAmt":Number(tData.itemPrc) - (Number(tData.itemPrc) - (Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100)) )
                         ,"goodsAmt":Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100))
                         ,"realGoodsAmt":Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) )
                         ,"eqipCostAmt":0
                         ,"totAmt":0
                         ,"expcEqipDt":""
                         ,"eqipPrsnId":""
                         ,"expcGiEndDt":""
                         ,"realDlDt":""
                         ,"pkgItemCd":pkgItemCd
                         ,"grStrgeCd":tData.grStrgeCd
                         ,"giStrgeCd":tData.giStrgeCd
                         ,"eqipEndDt":""
                     }).set("dirty", true);
                 }
             }
         }
         else{

             for(var i=0; i<data.length; i++){
                 tData = data[i];

                 if(i == 0){
                     var rowNum = 0;
                     var rows = grid.tbody.find("tr");
                     $.each(rows, function(index, row) {
                         var rowItem = grid.dataItem(row);
                         if(selectItem.uid == rowItem.uid ){
                             rowNum = index;
                         }
                     });

                     selectItem.set("dlrCd", dlrCd);
                     selectItem.set("contractNo", $("#contractNo").val());
                     selectItem.set("goodsCd", tData.itemCd);
                     selectItem.set("goodsNm", tData.itemNm);
                     selectItem.set("goodsCnt", 1);
                     selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd) );
                     selectItem.set("goodsPrc", Number(tData.salePrcAmt));
                     selectItem.set("dcRate", 0);
                     selectItem.set("dcAmt", 0);
                     selectItem.set("goodsAmt", Number(tData.salePrcAmt) );
                     selectItem.set("realGoodsAmt", Number(tData.salePrcAmt) * 1);
                     selectItem.set("eqipCostAmt", 0 );
                     selectItem.set("totAmt", Number(tData.salePrcAmt) );
                     selectItem.set("expcEqipDt", "");
                     selectItem.set("eqipPrsnId", "");
                     selectItem.set("expcGiEndDt", "");
                     selectItem.set("realDlDt", "");
                     selectItem.set("pkgItemCd", "");
                     selectItem.set("grStrgeCd",   tData.grStrgeCd);
                     selectItem.set("giStrgeCd",   tData.giStrgeCd);
                     selectItem.set("eqipEndDt", "");
                     selectItem.set("dirty", true);
                 }else{
                     grid.dataSource.insert(rowNum+i, {
                         "dlrCd":dlrCd
                         ,"contractNo":$("#contractNo").val()
                         ,"goodsCd":tData.itemCd
                         ,"goodsNm":tData.itemNm
                         ,"goodsCnt":1
                         ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd)
                         ,"goodsPrc":Number(tData.salePrcAmt)
                         ,"dcRate":0
                         ,"dcAmt":0
                         ,"goodsAmt":Number(tData.salePrcAmt)
                         ,"realGoodsAmt":Number(tData.salePrcAmt) * 1
                         ,"eqipCostAmt":0
                         ,"totAmt":Number(tData.salePrcAmt)
                         ,"expcEqipDt":""
                         ,"eqipPrsnId":""
                         ,"expcGiEndDt":""
                         ,"realDlDt":""
                         ,"pkgItemCd":""
                         ,"grStrgeCd":tData.grStrgeCd
                         ,"giStrgeCd":tData.giStrgeCd
                         ,"eqipEndDt":""
                     }).set("dirty", true);
                 }
             }
         }

     }

     // 보험 item 추가 call back
     function bf_incItemPopupCallBack(data, num){
         var grid = $("#incGrid").data("kendoExtGrid");

         var sDt = kendo.parseDate(toDay);
             sDt.setMonth(sDt.getMonth() + 12);
             sDt.setDate(sDt.getDate() -1);
         var eDt = kendo.toString(sDt, "<dms:configValue code='dateFormat' />");

         var tData = {};

         if(typeof(num) == "undefined" ){
             for(var i=0; i<data.length; i++){
                 tData = data[i];
                 if(!isincDtlItem(tData.cmmCd)){
                     grid.dataSource.insert(i, {
                         "incTp":tData.cmmCd
                        ,"valRecAmt":""
                        ,"incExpcAmt":""
                        ,"realIncAmt":""
                        ,"incPrid":12
                        ,"incStartDt":kendo.parseDate(toDay)
                        ,"incEndDt":kendo.parseDate(eDt)
                    }).set("dirty", true);
                 }
             }
         }else{
             for(var i=0; i<data.length; i++){
                 tData = data[i];
                 if(!isincDtlItem(tData.incTp)){
                     grid.dataSource.insert(i, {
                         "incTp":tData.incTp
                        ,"valRecAmt":""
                        ,"incExpcAmt":""
                        ,"realIncAmt":""
                        ,"incPrid":12
                        ,"incStartDt":kendo.parseDate(toDay)
                        ,"incEndDt":kendo.parseDate(eDt)
                    }).set("dirty", true);
                 }
             }
         }

     }
     // 보험Grid 보험유형 중복체크
     function isincDtlItem(iTp){
         var flag = false;
         var grid = $('#incGrid').data('kendoExtGrid');
         var rows = grid.tbody.find("tr");

         rows.each(function(index, row){
             var data = grid.dataItem(row);
             if(iTp == data.incTp){
                 flag = true;
             }
         });
         return flag;
     }

     //보험 : 제3자 책임보험 금액표시
     function bf_incAmtTemplate(incTp, amt) {
         if(incTp == "03"){
             return dms.string.strNvl(threeIncTpAmtObj[amt]);
         }else{
             return kendo.toString(Number(amt), "n2");
         }
     }

     //대행업무 item 추가 call back
     function bf_aapItemPopupCallBack(data){
         var grid = $("#aapGrid").data("kendoExtGrid");
         var tData = {};

         for(var i=0; i<data.length; i++){
             tData = data[i];
             if(!isAapDtlItem(tData.cmmCd)){
                 grid.dataSource.insert(i, {
                     "aapWorkTp":tData.cmmCd
                    ,"realAapAmt":0
                    ,"aapImplyYn" :"Y"
                }).set("dirty", true);
             }
         }
     }


     //대행업무 Grid 보험유형 중복체크
     function isAapDtlItem(iTp){
         var flag = false;
         var grid = $('#aapGrid').data('kendoExtGrid');
         var rows = grid.tbody.find("tr");

         rows.each(function(index, row){
             var data = grid.dataItem(row);
             if(iTp == data.aapWorkTp){
                 flag = true;
             }
         });
         return flag;
     }



     //중고차 VIN NO 조회 검색
     bf_searchUsedCarVinNo = function(){
         if( dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "N" ){ return ;}

         var obj = {};
         obj["sDlrCd"] = dlrCd;
         obj["sVinNo"] = $("#sUsrVinNo").val().toUpperCase();
         parent.bf_pSearchUsedCarVinNo(obj);
     }
     //중고차 vin no call back
     function bf_searchUsedCarVinNoCallBack(data){
         $("#sUsrVinNo").val(dms.string.strNvl(data[0].vinNo));
         $("#usrVinNo").val(dms.string.strNvl(data[0].vinNo));
         $("#purcNo").val(dms.string.strNvl(data[0].purcNo));
         $("#beforPurcNo").val(dms.string.strNvl(data[0].purcNo));

         $("#usrSbstAmt").data("kendoExtNumericTextBox").value(Number(data[0].exchAmt));
         bf_addUsrSbstAmt();
     }
     $("#sUsrVinNo").keyup(function(e){
         if (e.keyCode == 13) {
             if($(this).val() != "") {
                 bf_searchUsedCarVinNo();
             }
         }else{
             if(dms.string.strNvl($("#sUsrVinNo").val().toUpperCase()) != dms.string.strNvl($("#usrVinNo").val().toUpperCase()) ){
                 $("#usrVinNo").val('');
             }
         }
     });



     //차량 조회
    $("#btnSearchVinNo").bind("click", function() {
        bf_searchVinNo();
    });


    $("#btnCancelVinNo").bind("click", function() {
        bf_initVinNo();
    });

     //신차 VIN NO 조회 검색
     bf_searchVinNo = function(){

         var responseJson = {};
/*          if( dms.string.trim($("#sVinNo").val()).length > 0 ){
             responseJson = dms.ajax.getJson({
                 url :"<c:url value='/sal/cnt/contractMnt/selectContractReVinNoSearch.do' />"
                 ,data :JSON.stringify({"lastIndex":2, "firstIndex":0
                         , "sDlrCd":dlrCd
                         , "sVinNo":$("#sVinNo").val().toUpperCase()
                         , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                         , "sModelCd" :$("#modelCd").data("kendoExtDropDownList").value()
                         , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                         , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                         , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                       })
                 ,async :false
             });
         } */

         if(responseJson != null && responseJson.total == 1){

             // block된 차량은 선택이 불가능 합니다.
             /*
             if(dms.string.strNvl(saleAdminYn) == "N"
                 && dms.string.strNvl(saleEmpYn) == "Y"
                 && responseJson.data[0].blockYn == "Y"
                 && responseJson.data[0].blockSaleAdvNo != dms.string.strNvl(userId)
             ){
                 mob.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
                 return;
             }
             */

             if( dms.string.strNvl(saleEmpYn) == "Y"
                 && responseJson.data[0].blockYn == "Y"
                 && responseJson.data[0].blockSaleAdvNo != dms.string.strNvl(userId)
               ){
                   // block된 차량은 선택이 불가능 합니다.
                   mob.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
                   return false;
             }
             if(responseJson.data[0].damageCd == "01"){
                 // 손상된 차량은 선택이 불가능 합니다.
                 mob.notification.info("<spring:message code='sal.info.damageBlockMsg'/>");
                 return false;
             }
             if(responseJson.data[0].ownStatCd == "A"){
                 // 배정된 차량은 선택이 불가능 합니다.
                 mob.notification.info("<spring:message code='sal.info.ownStatMsg'/>");
                 return false;
             }
             if(responseJson.data[0].expAprYn == "Y"){
                 // 이상출고된 차량은 선택이 불가능 합니다.
                 mob.notification.info("<spring:message code='sal.info.expAprMsg'/>");
                 return false;
             }

             bf_vinNoSet(responseJson.data);
         }else{
             var obj = {"sDlrCd" :dlrCd
                      , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                      , "sCarlineNm" :$("#carlineCd").data("kendoExtDropDownList").text()
                      , "sModelCd" :$("#modelCd").data("kendoExtDropDownList").value()
                      , "sModelNm" :$("#modelCd").data("kendoExtDropDownList").text()
                      , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                      , "sOcnNm" :$("#ocnCd").data("kendoExtDropDownList").text()
                      , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                      , "sExtColorNm" :$("#extColorCd").data("kendoExtDropDownList").text()
                      , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                      , "sIntColorNm" :$("#intColorCd").data("kendoExtDropDownList").text()
                      , "sVinNo" :$("#sVinNo").val().toUpperCase()
                     };

             bf_pSearchVinNo(obj);
         }

     }
     function bf_vinNoSet(data){
         if(dms.string.strNvl(data.vinNo) != ""){
             //$("#sVinNo2").val(data[0].vinNo.substring(11,17));
             $("#sVinNo").val(data.vinNo);
         }
         $("#vinNo").val(dms.string.strNvl(data.vinNo));
         //$("#carRetlAmt").data("kendoExtNumericTextBox").value(data[0].retlPrc);
         $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data.msPrc));

         if($("#carlineCd").data("kendoExtDropDownList").value() != data.carlineCd){
             $("#carlineCd").data("kendoExtDropDownList").value(data.carlineCd);
         }

         if($("#modelCd").data("kendoExtDropDownList").value() == ""
                 || $("#modelCd").data("kendoExtDropDownList").value() != data.modelCd){
            var modelCd = $("#modelCd").data("kendoExtDropDownList");
            modelCd.setDataSource([{modelNm:data.modelNm, modelCd:data.modelCd}]);
            modelCd.value(data.modelCd);
            modelCd.enable(false);
         }

         if($("#ocnCd").data("kendoExtDropDownList").value() == ""
                 || $("#ocnCd").data("kendoExtDropDownList").value() != data.ocnCd){
            var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
            ocnCd.setDataSource([{ocnNm:data.ocnNm, ocnCd:data.ocnCd}]);
            ocnCd.value(data.ocnCd);
            ocnCd.enable(false);
         }

         if($("#extColorCd").data("kendoExtDropDownList").value() == ""
                 || $("#extColorCd").data("kendoExtDropDownList").value() != data.extColorCd){
            var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
            extColorCd.setDataSource([{extColorNm:data.extColorNm, extColorCd:data.extColorCd}]);
            extColorCd.value(data.extColorCd);
            extColorCd.enable(false);
         }

         if($("#intColorCd").data("kendoExtDropDownList").value() == ""
                 || $("#intColorCd").data("kendoExtDropDownList").value() != data.intColorCd){
            var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
            intColorCd.setDataSource([{intColorNm:data.intColorNm, intColorCd:data.intColorCd}]);
            intColorCd.value(data.intColorCd);
            intColorCd.enable(false);
         }

         // 소매, 도매가
         //$("#whslAmt").data("kendoExtNumericTextBox").value(Number(data[0].whPrc));
         $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data.msPrc));
         $("#realCarAmt").data("kendoExtNumericTextBox").value(Number(data.msPrc));
         //$("#realCarAmt").val(Number(data[0].msPrc));
         bf_addDcRealAmt();

     }

     // 신차 vin no조회
     function bf_pSearchVinNo(obj) {

         popupWindow = mob.window.popup({
             windowId:"customerSearchPopupMain"
             , content:{
                 url:"<c:url value='/mob/sal/cnt/contract/selectContractReVinNoSearchPopup.do'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                 , data:{
                     "autoBind":false
                     , "sDlrCd" :obj["sDlrCd"]
                     , "sCarlineCd" :obj["sCarlineCd"]
                     , "sCarlineNm" :obj["sCarlineNm"]
                     , "sModelCd" :obj["sModelCd"]
                     , "sModelNm" :obj["sModelNm"]
                     , "sOcnCd" :obj["sOcnCd"]
                     , "sOcnNm" :obj["sOcnNm"]
                     , "sExtColorCd" :obj["sExtColorCd"]
                     , "sExtColorNm" :obj["sExtColorNm"]
                     , "sIntColorCd" :obj["sIntColorCd"]
                     , "sIntColorNm" :obj["sIntColorNm"]
                     , "sVinNo" :obj["sVinNo"]
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data != null) {
                             console.log("Popup Search Result111:::");
                             //console.log(data);

                             if( dms.string.strNvl(data.saleEmpYn) == "Y"
                                 && data.blockYn == "Y"
                                 && data.blockSaleAdvNo != dms.string.strNvl(parent.userId)
                               ){
                                   // block된 차량은 선택이 불가능 합니다.
                                   mob.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
                                   return false;
                               }

                               if(data.damageCd == "01"){
                                   // 손상된 차량은 선택이 불가능 합니다.
                                   mob.notification.info("<spring:message code='sal.info.damageBlockMsg'/>");
                                   return false;
                               }

                               if(data.ownStatCd == "A"){
                                   // 배정된 차량은 선택이 불가능 합니다.
                                   mob.notification.info("<spring:message code='sal.info.ownStatMsg'/>");
                                   return false;
                               }

                               if(data.expAprYn == "Y"){
                                   // 이상출고된 차량은 선택이 불가능 합니다.
                                   mob.notification.info("<spring:message code='sal.info.expAprMsg'/>");
                                   return false;
                               }

                             bf_vinNoSet(data);
                         }
                         popupWindow.close();
                     }
                 }
             }
         });
     }


     $("#sVinNo").keyup(function(e){
         if (e.keyCode == 13) {
             if($(this).val() != "") {
                 bf_searchVinNo();
             }
         }

         if($(this).val() == ""){
             $("#vinNo").val("");
         }

     });

     //임시배정 취소
     function bf_initVinNo(){
         if($("#contractTp").data("kendoExtDropDownList").value() == "D"){
             return ;
         }

         $("#carlineCd").data("kendoExtDropDownList").value("");

         $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#modelCd").data("kendoExtDropDownList").enable(false);

         $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
         $("#ocnCd").data("kendoExtDropDownList").enable(false);

         $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#extColorCd").data("kendoExtDropDownList").enable(false);

         $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#intColorCd").data("kendoExtDropDownList").enable(false);

         $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
         //$("#promotionAmt").data("kendoExtNumericTextBox").value(0);    // 프로모션 :치환차감
         $("#promotionAmt").val(0);
         bf_sumCarAmt();

         $("#sVinNo").val('');  // Vin_No
         $("#vinNo").val('');    // vin no
     }

     //판매기회, 집단판매 CRM고객정보 갱신 조회
     function bf_crmCustSearch(){
         var sCustTp = $("#custTp").val();
         var sCustCd = $("#custCd_"+sCustTp).val();

         $.ajax({
             url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
             ,data :JSON.stringify({"sDlrCd":dlrCd, "sCustNo":sCustCd})
             ,type :'POST'
             ,dataType :'json'
             ,contentType :'application/json'
             ,error :function(jqXHR,status,error) {
                 mob.notification.error(error);
             }
             ,success :function(jqXHR, textStatus) {

                 var dataItem = jqXHR.data[0]
                   , cuTp = dataItem.custTp;

                 $("#custTp").val(cuTp);
                 if(cuTp == "02"){  // 법인
                     $("#cust_01").hide();
                     $("#cust_02").show();
                 }else{            // 개인
                     $("#cust_02").hide();
                     $("#cust_01").show();
                 }
                 $("#custCd_"+cuTp).val(dataItem.custNo);       // 고객코드
                 $("#custNm_"+cuTp).val(dataItem.custNm);       // 고객명
                 $("#ssnCrnTp_"+cuTp).data("kendoExtDropDownList").value(dataItem.mathDocTp); // 신분증유형 / 법인유형
                 $("#ssnCrnTp_"+cuTp).change();
                 $("#ssnCrnNo_"+cuTp).val(dataItem.ssnCrnNo);   // 증서번호
                 $("#taxPayNo_"+cuTp).val(dataItem.taxpayerNo);  // 납세번호
                 $("#purcMngNm_"+cuTp).val(dms.string.strNvl(dataItem.purcMngNm));    // 구매담당자명
                 $("#telNo1_"+cuTp).val(dataItem.hpNo);         // 전화번호1
                 $("#telNo2_"+cuTp).val(dataItem.telNo);        // 전화번호2
                 $("#emailNm_"+cuTp).val(dataItem.emailNm);     // 이메일명

                 // 판매기회 고객의 대표주소
                 $("#addr1_"+cuTp).val(dataItem.sungNm +" "+dataItem.cityNm +" "+dataItem.distNm);    // 주소1
                 $("#addr2_"+cuTp).val(dataItem.addrDetlCont);         // 주소2
                 $("#addrDetlCont_"+cuTp).val(dataItem.addrDetlCont);   // 상세주소

                 //$("#sungNm_"+cuTp).val(dataItem.sungNm);    // 성
                 $("#sungCd_"+cuTp).data("kendoExtDropDownList").value(dms.string.strNvl(dataItem.sungCd));    // 성

                  // 시
                 if(dms.string.isNotEmpty(dataItem.sungCd)){
                     var rsJsonCity = dms.ajax.getJson({
                         url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                         ,data :JSON.stringify({"sungCd":dataItem.sungCd})
                         ,async :false
                     });
                     $("#cityCd_"+cuTp).data("kendoExtDropDownList").enable(true);
                     $("#cityCd_"+cuTp).data("kendoExtDropDownList").setDataSource(rsJsonCity.data);
                     //$("#cityNm_"+cuTp).val(dataItem.cityNm);    // 시
                     $("#cityCd_"+cuTp).data("kendoExtDropDownList").value(dms.string.strNvl(dataItem.cityCd));    // 시

                     // 구
                     if(dms.string.isNotEmpty(dataItem.cityCd)){
                         var rsJsonDist = dms.ajax.getJson({
                             url :"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
                             ,data :JSON.stringify({"sungCd":dataItem.sungCd, "cityCd":dataItem.cityCd})
                             ,async :false
                         });
                         $("#distCd_"+cuTp).data("kendoExtDropDownList").enable(true);
                         $("#distCd_"+cuTp).data("kendoExtDropDownList").setDataSource(rsJsonDist.data);
                         //$("#distNm_"+cuTp).val(dataItem.distNm);    // 구
                         $("#distCd_"+cuTp).data("kendoExtDropDownList").value(dms.string.strNvl(dataItem.distCd));    // 구
                     }else{
                         $("#distCd_"+cuTp).data("kendoExtDropDownList").value("");
                         $("#distCd_"+cuTp).data("kendoExtDropDownList").enable(false);
                     }
                 }else{
                     $("#cityCd_"+cuTp).data("kendoExtDropDownList").value("");
                     $("#cityCd_"+cuTp).data("kendoExtDropDownList").enable(false);
                     $("#distCd_"+cuTp).data("kendoExtDropDownList").value("");
                     $("#distCd_"+cuTp).data("kendoExtDropDownList").enable(false);
                 }

             }
         });
     }

     //견적 버튼 클릭
     bf_clickEstimate = function (){
         // [TOBE] 인터페이스로 견적정보 불러옴. - 임시 화면
         popupWindow = dms.window.popup({
             windowId:"fincInfoItemPopup"
             , title:"<spring:message code='sal.title.fincEstimate' />"   // 금융상품 견적
             , height:600
             , content:{
                 url:"https://m.bhaf-bhmc.com.cn/buy/calculator"
             }
         });

     }


   /** 무결성 검사 **/
   function save_Validate(){

       // 계약일
       //if($("#contractDt").data("kendoExtMaskedDatePicker").value() == "" ){
       if($("#contractDt").val() == "" ){
           mob.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
           //$("#contractDt").focus();
           return false;
       }

       if( dms.string.strNvl($("#contractNo").val()) == ""
               /* && kendo.toString($("#contractDt").data("kendoExtMaskedDatePicker").value(),"yyyy-MM-dd") < toDay ){ */
               && kendo.toString($("#contractDt").val(),"yyyy-MM-dd") < toDay ){

           // {계약일자}은 {현재일자}보다 작을 수 없습니다.
           mob.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='sal.lbl.toDay' var='salLblToDay' /><spring:message code='sal.info.CheckDateForm' arguments='${globalLblContractDt},${salLblToDay}' />");
           //$("#contractDt").focus();
           return false;
       }

       // 계약유형
       if( dms.string.isEmpty($("#contractTp").data("kendoExtDropDownList").value())){
           mob.notification.info("<spring:message code='global.lbl.contractType' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
           //$("#contractTp").focus();
           return false;
       }

       // 인도요청일
       //if( dms.string.isEmpty($("#dlReqDt").data("kendoExtMaskedDatePicker").value())){
       if( dms.string.isEmpty($("#dlReqDt").val())){
           mob.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
           //$("#dlReqDt").focus();
           return false;
       }

       // 판매담당자
       if( dms.string.isEmpty($("#saleEmpNo").data("kendoExtDropDownList").value())){
           mob.notification.info("<spring:message code='global.lbl.salPrsnNm' var='globalLblSalPrsnNm' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblSalPrsnNm}' />");
           //$("#saleEmpNo").data("kendoExtDropDownList").focus();
           return false;
       }

        // 2급딜러여부
        if( $("#lv2DlrYn").data("kendoExtDropDownList").value() == "Y" ){
           if( $("#lv2DlrOrgCd").val() == ""){
               // 2급딜러을 선택하여 주세요.
               mob.notification.info("<spring:message code='sal.lbl.lv2DlrOrg' var='salLblLv2DlrOrg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblLv2DlrOrg}' />");
               return false;
           }
       }

       var custTp = $("#custTp").val();
       if( $("#custCd_"+custTp).val() == ""){
           // {고객}를(을) 선택해주세요. : 계약고객
           mob.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
           //$("#custCd_"+custTp == "" ? "01" :custTp).focus();
           return false;
       }

       if( dms.string.isEmpty($("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value())){
           // {ID유형}를(을) 선택해주세요. : 계약고객
           mob.notification.info("<spring:message code='global.lbl.mathDocTp' var='globalLblMathDocTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblMathDocTp}' />");
           //$("#ssnCrnTp_"+custTp == "" ? "01" :custTp).focus();
           return false;
       }

       if( dms.string.isEmpty($("#ssnCrnNo_"+custTp).val())){
           // {증서번호}를(을) 선택해주세요. : 계약고객
           mob.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblSsnCrnNo}' />");
           //$("#ssnCrnNo_"+custTp == "" ? "01" :custTp).focus();
           return false;
       }

       if(custTp == "01"
               && $("#ssnCrnTp_01").data("kendoExtDropDownList").value() == "01"
               && ($("#ssnCrnNo_01").val().length != 15 && $("#ssnCrnNo_01").val().length != 18 )
          ){
           // {증서번호}의 자릿수를 확인해주세요.
           mob.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
           //$("#ssnCrnTp_01").focus();
           return false;
       }

       if(custTp == "01"
               && $("#ssnCrnTp_01").data("kendoExtDropDownList").value() != "01" && $("#ssnCrnNo_01").val().length > 20 ){
           // {증서번호}의 자릿수를 확인해주세요.
           mob.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
           //$("#ssnCrnTp_01").focus();
           return false;
       }

       if(custTp == "02"
               && $("#ssnCrnTp_02").data("kendoExtDropDownList").value() == "08"
               && $("#ssnCrnNo_02").val().length > 10 ){
           // {증서번호}의 자릿수를 확인해주세요.
           mob.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
           //$("#ssnCrnTp_02").focus();
           return false;
       }

       if(custTp == "02"
               && $("#ssnCrnTp_02").data("kendoExtDropDownList").value() == "10"
               && $("#ssnCrnNo_02").val().length > 18 ){
           // {증서번호}의 자릿수를 확인해주세요.
           mob.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
           //$("#ssnCrnTp_02").focus();
           return false;
       }

       if(dms.string.isEmpty($("#telNo1_" +custTp).val())){
           // {이동전화}을(를) 입력해주세요.
           mob.notification.info("<spring:message code='global.lbl.hpNo' var='globalLblHpNo' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblHpNo}' />");
           //$("#telNo1_" +custTp).focus();
           return false;
       }

       // 차종
       if( dms.string.isEmpty($("#carlineCd").data("kendoExtDropDownList").value()) ){
           mob.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
           //$("#carlineCd").focus();
           return false;
       }

       // 모델
       if( dms.string.isEmpty($("#modelCd").data("kendoExtDropDownList").value()) ){
           mob.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
           //$("#modelCd").focus();
           return false;
       }

       // ocn
       /*
       if(dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value()) ){
           mob.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOcn}' />");
           $("#ocnCd").focus();
           return false;
       }

       // 외색
       if(dms.string.isEmpty($("#extColorCd").data("kendoExtDropDownList").value())){
           mob.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblExtColor}' />");
           $("#extColorCd").focus();
           return false;
       }

       // 내색
       if(dms.string.isEmpty($("#intColorCd").data("kendoExtDropDownList").value())){
           mob.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIntColor}' />");
           $("#intColorCd").focus();
           return false;
       }

       // 지불방식
       if( dms.string.isEmpty($("#payTp").data("kendoExtDropDownList").value())){
           // {지불방식}를(을) 선택해주세요.
           mob.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
           $("#payTp").focus();
           return false;
       }
       */

       //순차량금액
       if( Number($("#realCarAmt").data("kendoExtNumericTextBox").value()) <= 0  ){
           mob.notification.info("<spring:message code='sal.lbl.realCarAmts' var='salLblRealCarAmts' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRealCarAmts}' />");
           //$("#realCarAmt").focus();
           return false;
       }

       // 실판매 금액
       if( Number($("#realPayAmt").data("kendoExtNumericTextBox").value()) <= 0  ){
           mob.notification.info("<spring:message code='sal.lbl.realPayAmts' var='salLblRealPayAmts' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRealPayAmts}' />");
           //$("#realCarAmt").focus();
           return false;
       }

       // 보험서비스
       //if($("#incAapTp").val() == "A"){}

       // 금융
       if($("#fincReqYn").val() == "Y"){
           // 금융-vinNo 필수
           if(dms.string.isEmpty($("#vinNo").val())){
               mob.notification.info("<spring:message code='sal.lbl.carVinNo' var='salLblCarVinNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblCarVinNo}' />");
               //$("#sVinNo").focus();
               return false;
           }

           // 금융사
           if( dms.string.strNvl($("#fincCmpCd").data("kendoExtDropDownList").value()) == "" ){
               mob.notification.info("<spring:message code='global.lbl.fincCmp' var='globalLblFincCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincCmp}' />");
               //$("#tabstrip").data("kendoExtTabStrip").select(2);
               return false;
           }

           // 상품
           /*
           if( dms.string.strNvl($("#fincItemCd").data("kendoExtDropDownList").value()) == "" ){
               mob.notification.info("<spring:message code='sal.lbl.fincItem' var='globalLblFincItem' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincItem}' />");
               $("#tabstrip").data("kendoExtTabStrip").select(2);
               return false;
           }
           */
       }

       // 중고차 치환
       if(dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "Y"){
           if($("#usrVinNo").val().toUpperCase() == "" && $("#sUsrVinNo").val().toUpperCase() == "" ){
               // VIN NO 을(를) 올바르게 입력하여 주십시오.
               mob.notification.info("<spring:message code='global.lbl.vinNum' var='globalLblVinNum' /><spring:message code='global.info.validation.pattern' arguments='${globalLblVinNum}' />");
               $("#tabstrip").data("kendoExtTabStrip").select(3);
               //$("#sUsrVinNo").focus();
               return false;
           }

           if($("#purcNo").val() == ""){
               // 매입번호 을(를) 올바르게 입력하여 주십시오.
               mob.notification.info("<spring:message code='sal.lbl.documentNo' var='salLblDocumentNo' /><spring:message code='global.info.validation.pattern' arguments='${salLblDocumentNo}' />");
               $("#tabstrip").data("kendoExtTabStrip").select(3);
               //$("#purcNo").focus();
               return false;
           }
       }

       // 번호판 등록서비스
       if($("#regTp").val() == "A"){

       }

       return true;
   }

   /**
    * 직책별 할인금액 관리.
    */
   function dlrPromotionAmtChk(mFlag){

       mob.loading.show();
       /** 무결성 검사 **/
       if( !save_Validate() ){
          return false;
       }

       var param = {
               ///"sStartContractDt" :$("#contractDt").data("kendoExtMaskedDatePicker").value()
               "sStartContractDt" : chgDate($("#contractDt").val())
               ,"sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
               ,"sModelCd" :$("#modelCd").data("kendoExtDropDownList").value()
               ,"sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
               //, "sPromotionAmt" :Number($("#promotionAmt").data("kendoExtNumericTextBox").value())
               , "sPromotionAmt" :Number($("#promotionAmt").val())
       }

       $.ajax({
           url :"<c:url value='/sal/cnt/contractMnt/selectDlrDcLevel.do' />"
           ,data :JSON.stringify(param)
           ,type :'POST'
           ,dataType :'json'
           ,contentType :'application/json'
           ,async :false
           ,error :function(jqXHR,status,error) {
               mob.notification.error(error);
               mob.loading.hide();
           }
           ,success :function(jqXHR, textStatus) {

               mob.loading.hide();
               if(jqXHR != null && jqXHR.total > 0
                 && dms.string.strNvl(jqXHR.data[0].prcNregYn) == "Y" && dms.string.isNotEmpty(jqXHR.data[0].dcLvlCd) ){

                  dms.window.confirm({
                      message:"["+ dms.string.strNvl(dcLvlCdObj[jqXHR.data[0].dcLvlCd]) +"] <spring:message code='sal.lbl.dcLvMsg' /> \n <spring:message code='sal.lbl.isContinueMsg' />"
                      ,title :"<spring:message code='global.lbl.info' />"
                      ,callback:function(result){
                          if(result){
                              $("#dcLvlCd").val(jqXHR.data[0].dcLvlCd);
                              $("#dcApproveYn").val("Y");
                              save(mFlag);
                          }else{
                              return false;
                          }
                      }
                  });

               }else{
                   save(mFlag);
               }
           }

       }).done(function(result) {
           console.log("Done!!!!");
           parent.$("#formarea").show();
       });
   }


   /*********
    * 저장
    *********/
   function save(mFlag){
       /** 무결성 검사 **/
       //if( !save_Validate() ){
       //   return false;
       //}

       mob.loading.show();     // 로딩 시작

       var param = {
           "contractReVO" :$("#contractMntForm").serializeObject($("#contractMntForm").serializeArrayInSelector("[data-json-obj='true']"))
           ,"goodsVO" :$("#goodsGrid").data("kendoExtGrid").getCUDData("insertGoodsList", "updateGoodsList", "deleteGoodsList")
           ,"incVO" :$("#incGrid").data("kendoExtGrid").getCUDData("insertIncList", "updateIncList", "deleteIncList")
           ,"aapsVO" :$("#aapGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
           ,"multiFlag" :mFlag
       };

       if( $("#contractStatCd").val() == "" ){
           param.contractReVO.contractStatCd = "10";
       }

       if( $("#usrVinNo").val() == "" ){
           param.contractReVO.usrVinNo = $("#sUsrVinNo").val().toUpperCase();
       }

       param.contractReVO.saleEmpNo = $("#saleEmpNo").data("kendoExtDropDownList").value();           // 판매인
       param.contractReVO.contractTp = $("#contractTp").data("kendoExtDropDownList").value();

//       param.contractReVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();           // 계약일
       param.contractReVO.contractDt = chgDate($("#contractDt").val());           // 계약일
//       param.contractReVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();                 // 인도요청일
       param.contractReVO.dlReqDt = chgDate($("#dlReqDt").val());                 // 인도요청일
//       param.contractReVO.regExpcDt = $("#regExpcDt").data("kendoExtMaskedDatePicker").value();             // 등록예상일자
       param.contractReVO.fincReqDt = $("#fincReqDt").data("kendoExtMaskedDatePicker").value();             // 신청일자
       param.contractReVO.fincEndDt = $("#fincEndDt").data("kendoExtMaskedDatePicker").value();             // 만기일자

       // 금액
       param.contractReVO.goodsAmt = $("#goodsAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.reservContAmt = $("#reservContAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.incAmt   = $("#incAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.sbstAmt  = $("#sbstAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.aapAmt   = $("#aapAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.pointAmt = $("#pointAmt").data("kendoExtNumericTextBox").value();
       //param.contractReVO.promotionAmt = $("#promotionAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.promotionAmt = Number($("#promotionAmt").val());
       param.contractReVO.realPayAmt   = $("#realPayAmt").data("kendoExtNumericTextBox").value();
       param.contractReVO.retlAmt   = $("#retlAmt").data("kendoExtNumericTextBox").value();   // 지도가


       // 차종
       param.contractReVO.carlineCd  = $("#carlineCd").data("kendoExtDropDownList").value();
       param.contractReVO.modelCd    = $("#modelCd").data("kendoExtDropDownList").value();
       param.contractReVO.ocnCd      = $("#ocnCd").data("kendoExtDropDownList").value();
       param.contractReVO.extColorCd = $("#extColorCd").data("kendoExtDropDownList").value();
       param.contractReVO.intColorCd = $("#intColorCd").data("kendoExtDropDownList").value();

       // 계약고객정보
       var custTp = $("#custTp").val();
       param.contractReVO.custTp = custTp;                             // 고객유형
       param.contractReVO.custCd = $("#custCd_"+custTp).val();         // 고객코드
       param.contractReVO.contractCustNo = $("#custCd_"+custTp).val(); // 고객코드 0201T

       param.contractReVO.custNm = $("#custNm_"+custTp).val();         // 고객명
       param.contractReVO.taxPayNo = $("#taxPayNo_"+custTp).val();     // 납세번호
       param.contractReVO.purcMngNm = $("#purcMngNm_"+custTp).val();   // 구매담당자명
       param.contractReVO.ssnCrnTp = $("#ssnCrnTp_"+custTp).val();     //신분증유형
       param.contractReVO.ssnCrnNo = $("#ssnCrnNo_"+custTp).val();     //증서번호
       param.contractReVO.telNo1 = $("#telNo1_"+custTp).val();         // 전화번호1
       param.contractReVO.telNo2 = $("#telNo2_"+custTp).val();         // 전화번호2
       //param.contractReVO.emailNm = $("#emailNm_"+custTp).val();
       param.contractReVO.emailNm = "";
       param.contractReVO.sungNm = $("#sungCd_"+custTp).data("kendoExtDropDownList").text();
       param.contractReVO.sungCd = $("#sungCd_"+custTp).data("kendoExtDropDownList").value();
       param.contractReVO.cityNm = $("#cityCd_"+custTp).data("kendoExtDropDownList").text();
       param.contractReVO.cityCd = $("#cityCd_"+custTp).data("kendoExtDropDownList").value();
       param.contractReVO.distNm = $("#distCd_"+custTp).data("kendoExtDropDownList").text();
       param.contractReVO.distCd = $("#distCd_"+custTp).data("kendoExtDropDownList").value();
       param.contractReVO.zipCd  = $("#zipCd_"+custTp).val();          // 우편번호
       param.contractReVO.addrTp = $("#addrTp_"+custTp).data("kendoExtDropDownList").value(); //주소유형
       param.contractReVO.addrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

       // 실운전자
       param.contractReVO.realDriverSameYn = "Y";
       param.contractReVO.drvCustTp = custTp;                            // 고객유형
       param.contractReVO.drvCustCd = $("#custCd_"+custTp).val();        // 고객코드
       param.contractReVO.realDriverCustNo = $("#custCd_"+custTp).val(); // 고객코드 0201T

       param.contractReVO.drvCustNm    = $("#custNm_"+custTp).val();     // 고객명
       param.contractReVO.drvTaxPayNo  = $("#taxPayNo_"+custTp).val();   // 납세번호
       param.contractReVO.drvPurcMngNm = $("#purcMngNm_"+custTp).val();   // 납세번호
       param.contractReVO.drvSsnCrnTp  = $("#ssnCrnTp_"+custTp).val();   //신분증유형
       param.contractReVO.drvSsnCrnNo  = $("#ssnCrnNo_"+custTp).val();   //증서번호
       param.contractReVO.drvTelNo1    = $("#telNo1_"+custTp).val();     // 전화번호1
       param.contractReVO.drvTelNo2    = $("#telNo2_"+custTp).val();     // 전화번호2
       param.contractReVO.drvEmailNm   = $("#emailNm_"+custTp).val();
       param.contractReVO.drvSungNm    = $("#sungCd_"+custTp).data("kendoExtDropDownList").text();
       param.contractReVO.drvSungCd    = $("#sungCd_"+custTp).data("kendoExtDropDownList").value();
       param.contractReVO.drvCityNm    = $("#cityCd_"+custTp).data("kendoExtDropDownList").text();
       param.contractReVO.drvCityCd    = $("#cityCd_"+custTp).data("kendoExtDropDownList").value();
       param.contractReVO.drvDistNm    = $("#distCd_"+custTp).data("kendoExtDropDownList").text();
       param.contractReVO.drvDistCd    = $("#distCd_"+custTp).data("kendoExtDropDownList").value();
       param.contractReVO.drvZipCd     = $("#zipCd_"+custTp).val();          // 우편번호
       param.contractReVO.drvAddrTp    = $("#addrTp_"+custTp).data("kendoExtDropDownList").value(); //주소유형
       param.contractReVO.drvAddrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

       // 보험
       param.contractReVO.implyYn = $("#incImplyYn").prop('checked') == true ? "Y":"N";             //재무수납여부
       param.contractReVO.finImplyYn = $("#finImplyYn").prop('checked') == true ? "Y":"N";
       param.contractReVO.incAapTp = "A";
       //param.contractReVO.incJoinDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();
       param.contractReVO.incJoinDt = chgDate($("#contractDt").val());

       /*
       $.ajax({
           url :"<c:url value='/sal/cnt/contractMnt/multiContractMnts.do' />"
           ,data :JSON.stringify(param)
           ,type :'POST'
           ,dataType :'json'
           ,contentType :'application/json'
           ,error :function(jqXHR,status,error) {
               mob.loading.hide();   // 로딩 종료
               if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                   mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
           }
           ,success :function(jqXHR, textStatus) {
               mob.loading.hide();   // 로딩 종료
               if(mFlag == "save"){
                   approval(jqXHR);
               }else{
                   var data = {};
                   data.msg = 'save';
                   data.cntTp = '01';      // 저장
                   data.cntNo = jqXHR;
                   options.callbackFunc(data);
                   refreshAll();
                   parent.mainPopupWindow.close();
               }
           }
       });
       */

       var URLAddr = "";
       if(mFlag == "save"){
           URLAddr = "<c:url value='/sal/cnt/contractMnt/approvalContractMnts.do' />";
       }else{
           URLAddr = "<c:url value='/sal/cnt/contractMnt/multiContractMnts.do' />";
       }
       console.log("mob param",param);

       $.ajax({
           url:URLAddr
           ,data:JSON.stringify(param)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error :function(jqXHR,status,error) {
               mob.loading.hide();   // 로딩 종료

               if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                   mob.notification.error(jqXHR.responseJSON.errors);
               }else{
                   mob.notification.error(error);
               }
           }
           ,success :function(jqXHR, textStatus) {
               mob.loading.hide();   // 로딩 종료
               var data = {};
               data.msg = 'save';
               if(mFlag != "save"){
                   data.cntTp = '01';      // 저장
               }
               data.cntNo = jqXHR;
               options.callbackFunc(data);
               refreshAll();
               parent.mainPopupWindow.close();
           }
       });
   }

   /**
    * 계약생성
    */
   function approval(vContNo){
       var cNo    = $("#contractNo").val()
         , cState = $("#contractStatCd").val();

       if(typeof(vContNo) != "undefined" ){
           cNo = vContNo;
           cState = "20";
       }
        console.log("===========approval ");
       mob.loading.show();     // 로딩 시작

       var param = {};
       param.contractNo = cNo;
       param.contractStatCd = cState;

       $.ajax({
           url :"<c:url value='/sal/cnt/contractMnt/approval.do' />",
           data :JSON.stringify(param),
           type :'POST',
           dataType :'json',
           contentType :'application/json',
           error :function(jqXHR,status,error) {
               mob.loading.hide();   // 로딩 종료
               //mob.notification.error(jqXHR.responseJSON.errors);
               if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                   mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
           },
           success :function(jqXHR, textStatus) {
               mob.loading.hide();   // 로딩 종료

               var data = {};
               data.msg = 'save';
               data.cntNo = jqXHR;
               options.callbackFunc(data);
               refreshAll();
               parent.mainPopupWindow.close();

               //var grid = $("#contGrid").data("kendoExtGrid");
               //reSearch(jqXHR);                    // 조회조건 세팅
               //$("#savedContractNo").val(jqXHR);   // 승인한 계약번호
               //grid.dataSource.page(1);

               //정상적으로 반영 되었습니다.
               //mob.notification.success("<spring:message code='global.info.success'/>");
           }
       });
   }

   /**
    * 삭제
    */
   function remove(){

       if($("#contractNo").val() == ""){
           // 삭제할 대상을 선택하십시오.
           mob.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
           return false;
       }

       // 계약삭제 승인전
       if( $("#contractStatCd").val() == "10" ){
           var param = {};
           param.contractNo = $("#contractNo").val();          // 계약번호

           $.ajax({
               url :"<c:url value='/sal/cnt/contractMnt/deleteContract.do' />",
               data :JSON.stringify(param),
               type :'POST',
               dataType :'json',
               contentType :'application/json',
               error :function(jqXHR,status,error) {
                   //mob.notification.error(jqXHR.responseJSON.errors);
                   if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                       mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
               },
               success :function(jqXHR, textStatus) {

                   var data = {};
                   data.msg = 'save';
                   data.cntNo = jqXHR;
                   options.callbackFunc(data);
                   refreshAll();
                   parent.mainPopupWindow.close();

                   /*
                   var grid = $("#contGrid").data("kendoExtGrid");
                   grid.dataSource.read();
                   refreshAll();
                   fn_btnState();  // 버튼처리 초기화 상태

                   $("#callContractReWindow").data("kendoWindow").close();

                   //정상적으로 반영 되었습니다.
                   mob.notification.success("<spring:message code='global.info.success'/>");
                   */
               }
           });

       }else if($("#contractStatCd").val() == ""){
           refreshAll();
           parent.mainPopupWindow.close();
       }else{
           // 계약승인 이전단계에서만 삭제가 가능합니다.
           mob.notification.info("<spring:message code='global.lbl.contractAcptReq' var='globalLblContractAcptReq' /><spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalLblContractAcptReq}, ${globalLblDel}' />");
           return false;
       }

   }

   // 계약취소
   function cancel(){

       if($("#contractNo").val() == ""){
           // 삭제할 대상을 선택하십시오.
           mob.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
           return false;
       }

       // 계약생성이후
       if( $("#contractStatCd").val() == "20" ){
           var param = {};
           param.contractNo = $("#contractNo").val();          // 계약번호

           $.ajax({
               url :"<c:url value='/sal/cnt/contractMnt/cancelContract.do' />",
               data :JSON.stringify(param),
               type :'POST',
               dataType :'json',
               contentType :'application/json',
               error :function(jqXHR,status,error) {
                   //mob.notification.error(jqXHR.responseJSON.errors);
                   if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                       mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
               },
               success :function(jqXHR, textStatus) {
                   var data = {};
                   data.msg = 'save';
                   data.cntNo = jqXHR;
                   options.callbackFunc(data);
                   refreshAll();
                   parent.mainPopupWindow.close();

                   /*
                   var grid = $("#contGrid").data("kendoExtGrid");
                   grid.dataSource.read();
                   refreshAll();
                   fn_btnState();  // 버튼처리 초기화 상태

                   $("#callContractReWindow").data("kendoWindow").close();

                   //정상적으로 반영 되었습니다.
                   mob.notification.success("<spring:message code='global.info.success'/>");
                   */
               }
           });

       }else{
           // 계약생성된 이후 삭제처리가 가능합니다.
           mob.notification.info("<spring:message code='sal.info.contAfterMsg'/>");
           return false;
       }

   }


   // 폐기
   function deleteContract(){

       //var grid = $("#contGrid").data("kendoExtGrid");
       //var rows = grid.select();
       mob.loading.show();
       var cancelList = []        // 계약취소
         , deleteList = []        // 계약삭제
         , isError = false;

       var item = {};

       item.dlrCd = dlrCd;
       item.contractNo = $("#contractNo").val();;
       item.vinNo = $("#vinNo").val();
       item.sDlrCd = $("#sDlrCd").val();
       item.sContractNo = $("#sContractNo").val();

       var stat = Number($("#contractStatCd").val());   // 계약상태

       if(stat >= 90 ){
           isError = true;
       }
       if(Number($("#contractStatCd").val()) < 20 ){
           deleteList.push(item)

       }else{

           cancelList.push(item);
       }

       if(isError){
           // 삭제 또는 취소된 계약건은 처리할 수 없습니다.
           mob.notification.error("<spring:message code='sal.err.contMultiDel'/>");
           return false;
       }

       var param = {
               "deleteList": deleteList, "cancelList": cancelList
           };

       $.ajax({
           url :"<c:url value='/sal/cnt/contractMnt/deleteContractMnt.do' />"
           ,data :JSON.stringify(param)
           ,type :'POST'
           ,dataType :'json'
           ,contentType :'application/json'
           ,async :false
           ,error :function(jqXHR,status,error) {
               mob.notification.error(error);
           }
           ,success :function(jqXHR, textStatus) {
               //grid.dataSource._destroyed = [];
               //grid.dataSource.page(1);

               //정상적으로 반영 되었습니다.
               //mob.notification.success("<spring:message code='global.info.success'/>");

               mob.loading.hide();   // 로딩 종료

               var data = {};
               data.msg = 'delete';
               options.callbackFunc(data);
               refreshAll();
               parent.mainPopupWindow.close();
           }
       });

   }



   /**
    * 버튼 상태 관리
    */
   function fn_btnState(state, ste){
       switch(state){
           case '10':     // 계약등록
               /* $("#btnPayPrint").data("kendoButton").enable(false);
               $("#btnContPrint").data("kendoButton").enable(false);
               $("#btnViewPrint").data("kendoButton").enable(false);
               $("#btnPayPrint").hide();
               $("#btnContPrint").hide();
               $("#btnViewPrint").hide() */;

               //$("#btnCancel").data("kendoButton").enable(true);
               $("#btnCreate").data("kendoButton").enable(true);
               //$("#btnRemove").data("kendoButton").enable(true);
               //$("#btnUpdate").data("kendoButton").enable(true);
               $("#btnSave").data("kendoButton").enable(true);
               $("#btnSave").show();
           break;
           case '20':     // 계약생성
               /* $("#btnPayPrint").data("kendoButton").enable(true);
               $("#btnContPrint").data("kendoButton").enable(true);
               $("#btnViewPrint").data("kendoButton").enable(false);
               $("#btnPayPrint").show();
               $("#btnContPrint").show();
               $("#btnViewPrint").hide() */;

               //$("#btnCancel").data("kendoButton").enable(true);
               $("#btnCreate").data("kendoButton").enable(true);
               //$("#btnRemove").data("kendoButton").enable(false);
               //$("#btnUpdate").data("kendoButton").enable(false);
               $("#btnSave").data("kendoButton").enable(false);
               $("#btnSave").hide();
               break;
           case '50':     // 고객인도
               /* $("#btnPayPrint").data("kendoButton").enable(true);
               $("#btnContPrint").data("kendoButton").enable(true);
               $("#btnViewPrint").data("kendoButton").enable(true);
               $("#btnPayPrint").show();
               $("#btnContPrint").show();
               $("#btnViewPrint").show(); */

               //$("#btnCancel").data("kendoButton").enable(false);
               $("#btnCreate").data("kendoButton").enable(false);
               //$("#btnRemove").data("kendoButton").enable(false);
               $("#btnSave").data("kendoButton").enable(false);
               //$("#btnUpdate").data("kendoButton").enable(false);
               $("#btnSave").hide();
               break;
           case '90':     // 계약삭제 - 계약생성전
           case '91':     // 계약해지
               /* $("#btnPayPrint").data("kendoButton").enable(false);
               $("#btnContPrint").data("kendoButton").enable(false);
               $("#btnViewPrint").data("kendoButton").enable(false);
               $("#btnPayPrint").hide();
               $("#btnContPrint").hide();
               $("#btnViewPrint").hide(); */

               //$("#btnCancel").data("kendoButton").enable(false);
               $("#btnCreate").data("kendoButton").enable(false);
               //$("#btnRemove").data("kendoButton").enable(false);
               $("#btnSave").data("kendoButton").enable(false);
               //$("#btnUpdate").data("kendoButton").enable(false);
               $("#btnSave").hide();
               break;
           case '900':
               switch(ste){
                   case '20':
                       /* $("#btnPayPrint").data("kendoButton").enable(true);
                       $("#btnContPrint").data("kendoButton").enable(true);
                       $("#btnViewPrint").data("kendoButton").enable(false);
                       $("#btnPayPrint").show();
                       $("#btnContPrint").show();
                       $("#btnViewPrint").show(); */
                       break;
                   case '50':
                       /* $("#btnPayPrint").data("kendoButton").enable(true);
                       $("#btnContPrint").data("kendoButton").enable(true);
                       $("#btnViewPrint").data("kendoButton").enable(true);
                       $("#btnPayPrint").show();
                       $("#btnContPrint").show();
                       $("#btnViewPrint").show(); */
                       break;
                   default :
                       /* $("#btnPayPrint").data("kendoButton").enable(false);
                       $("#btnContPrint").data("kendoButton").enable(false);
                       $("#btnViewPrint").data("kendoButton").enable(false);
                       $("#btnPayPrint").hide();
                       $("#btnContPrint").hide();
                       $("#btnViewPrint").hide(); */
                       break;
               }

               //$("#btnCancel").data("kendoButton").enable(false);
               $("#btnCreate").data("kendoButton").enable(false);
               $("#btnSave").data("kendoButton").enable(false);

               //$("#btnCancel").hide();
               $("#btnCreate").hide();
               $("#btnSave").hide();

               // 용품
               $("#btnGoodsAdd").hide();
               $("#btnGoodsDel").hide();
               $("#btnGoodsCancel").hide();

               // 보험
               $("#btnIncAllChange").hide();
               $("#btnIncAdd").hide();
               $("#btnIncDel").hide();
               $("#btnIncCancel").hide();
               break;
           default :      // 작성전
               /* $("#btnPayPrint").data("kendoButton").enable(false);
               $("#btnContPrint").data("kendoButton").enable(false);
               $("#btnViewPrint").data("kendoButton").enable(false);
               $("#btnPayPrint").hide();
               $("#btnContPrint").hide();
               $("#btnViewPrint").hide(); */

               //$("#btnCancel").data("kendoButton").enable(false);
               $("#btnCreate").data("kendoButton").enable(true);
               $("#btnSave").data("kendoButton").enable(true);
               //$("#btnRemove").data("kendoButton").enable(false);
               //$("#btnUpdate").data("kendoButton").enable(false);
               $("#btnSave").show();
               break;
       }

   }

   // 대문자
   //$(".upper").bind("keyup", function(){
//       $(this).val($(this).val().toUpperCase());
   //});


   // 숫자
   var onlyNum = new RegExp("[^0-9]","i");
   $(".numberic").keyup(function(e){
       var content = $(this).val();
       if(content.match(onlyNum)){
           $(this).val('');
       }
   });

   // 숫자와 알파벳   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
   var onlyNumAlpha = new RegExp("[^A-Z0-9]");
   $(".numberandalpha").keyup(function(e)
   {
       var contents = $(this).val();
       if(onlyNumAlpha.test(contents)){
           $(this).val('');
       }
   });

   //고객명 enter
   $(".onKey_bulr").blur(function(e){
       var cId = dms.string.strNvl($(this).context.id);
       if(cId != ""){
           cleanCustCheck(cId);
       }
   });

   // 고객명 enter
   $(".onKey_up").keyup(function(e){
       var cId = dms.string.strNvl($(this).context.id);
       if(cId == ""){
           return ;
       }

       if (e.keyCode == 13) {
           if($(this).val() != "") {
               bf_searchCustomer(cId);
           }
       }else{
           cleanCustCheck(cId);
       }
   });


   // 고객명 변경시 고객정보 clean
   function cleanCustCheck(cId){
       if(cId == "vCustNm_01"){
           if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_01").val()) ){
               $("#custCd_01").val('');       // 고객코드
               $("#taxPayNo_01").val('');     // 납세번호
               $("#purcMngNm_01").val('');     // 구매담당자명
               $("#ssnCrnTp_01").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
               $("#ssnCrnNo_01").val('');  // 증서번호
               $("#ssnCrnNo_01").attr('maxlength','20');
               $("#telNo1_01").val('');       // 전화번호1
               $("#telNo2_01").val('');       // 전화번호2
               $("#emailNm_01").val('');    // 이메일명

               //$("#sungNm_01").val('');    // 성
               $("#sungCd_01").data("kendoExtDropDownList").value('');    // 성

               //$("#cityNm_01").val('');    // 시
               $("#cityCd_01").data("kendoExtDropDownList").value('');    // 시
               $("#cityCd_01").data("kendoExtDropDownList").setDataSource([]);
               $("#cityCd_01").data("kendoExtDropDownList").enable(false);

               //$("#distNm_01").val('');    // 구
               $("#distCd_01").data("kendoExtDropDownList").value('');    // 구
               $("#distCd_01").data("kendoExtDropDownList").setDataSource([]);
               $("#distCd_01").data("kendoExtDropDownList").enable(false);

               $("#zipCd_01").val('');      // 우편번호
               $("#addrTp_01").data("kendoExtDropDownList").value('03');
               $("#addrDetlCont_01").val('');   // 상세주소

               $("#blueMembershipId").val('');
               $("#bluePointApplyRate").val('0.1');
               $("#mLevel").data("kendoExtDropDownList").value('');
               $("#point").data("kendoExtNumericTextBox").value(0.00);
               $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0.00);
               $("#tBlueAmount").data("kendoExtNumericTextBox").value(0.00);
               bf_sumCarAmt();
           }
       }else if(cId == "vCustNm_02"){
           if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_02").val()) ){
               $("#custCd_02").val('');       // 고객코드
               $("#taxPayNo_02").val('');     // 납세번호
               $("#purcMngNm_02").val('');     // 구매담당자명
               $("#ssnCrnTp_02").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
               $("#ssnCrnNo_02").val('');  // 증서번호
               $("#ssnCrnNo_02").attr('maxlength','25');
               $("#telNo1_02").val('');    // 전화번호1
               $("#telNo2_02").val('');    // 전화번호2
               $("#emailNm_02").val('');   // 이메일명

               //$("#sungNm_02").va('');    // 성
               $("#sungCd_02").data("kendoExtDropDownList").value('');    // 성

               //$("#cityNm_02").val('');    // 시
               $("#cityCd_02").data("kendoExtDropDownList").value('');    // 시
               $("#cityCd_02").data("kendoExtDropDownList").setDataSource([]);
               $("#cityCd_02").data("kendoExtDropDownList").enable(false);

               //$("#distNm_02").val('');    // 구
               $("#distCd_02").data("kendoExtDropDownList").value('');    // 구
               $("#distCd_02").data("kendoExtDropDownList").setDataSource([]);
               $("#distCd_02").data("kendoExtDropDownList").enable(false);

               $("#zipCd_02").val('');      // 우편번호
               $("#addrTp_02").data("kendoExtDropDownList").value('03');
               $("#addrDetlCont_02").val('');   // 상세주소

               $("#blueMembershipId").val('');
               $("#bluePointApplyRate").val('0.1');
               $("#mLevel").data("kendoExtDropDownList").value('');
               $("#point").data("kendoExtNumericTextBox").value(0.00);
               $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0.00);
               $("#tBlueAmount").data("kendoExtNumericTextBox").value(0.00);
               bf_sumCarAmt();
           }
       }
   }

   // 고객정보 수정링크
   $(document).on("click", ".linkCustNo", function(e){
       if(dms.string.isEmpty($(this).val())){return ;}
       parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+$(this).val(), "VIEW-D-10272");
   });



   // 저장팝업 - 저장버튼
   $(document).on("click", "#btnSavePopup", function(e){
       dlrPromotionAmtChk('create');
   });


   // 계약생성팝업 - 저장버튼
   $(document).on("click", "#btnSaveApprovalPopup", function(e){
       dlrPromotionAmtChk('save');
   });

    // 폐기팝업 - 저장버튼
   $(document).on("click", "#btnDeletePopup", function(e){
       deleteContract();

   });



    /******************************************
     * 함수영역 - end
     ******************************************/
//-->

</script>

 <script type="text/javascript">

 function goMain(){
     parent.mainPopupWindow.close();
 }

</script>
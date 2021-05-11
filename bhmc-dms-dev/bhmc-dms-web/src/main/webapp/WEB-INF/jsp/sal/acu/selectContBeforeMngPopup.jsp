<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style type="text/css">
.form_readonly_text_blue {background-color:#dbdbdb!important; -webkit-text-fill-color:#45b4e8; color:#45b4e8!important; -webkit-opacity:1; opacity:1;}
</style>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 예판관리 상세 -->
<section id="window" class="pop_wrap">
<form id="beforeForm" name="beforeForm" method="POST">

    <!-- 예판상세정보 -->
    <section class="group">
        <div class="header_area">
            <div class="left_area">
                <!-- 판매기회여부 -->
                <h2 class="title_basic"><spring:message code='global.title.custinfo' /></h2>

                <%-- <input id="saleOpptYn" type="checkbox" class="form_check" disabled /><spring:message code='global.lbl.saleOpptYn' /> --%>
                <span id="saleOpptTxt" class="txt_label bg_green" style="display:none"> <spring:message code='global.lbl.saleOppt' /> </span>   <!-- 판매기회 -->
            </div>
            <div class="btn_right">
                <button id="btnPrint" type="button" class="btn_m"><spring:message code='sal.btn.print' /></button> <!-- 주문서인쇄 -->
                <button id="btnSave"   type="button" class="btn_m"><spring:message code='global.btn.save' /></button>     <!-- 저장 -->
                <button id="btnCreate" type="button" class="btn_m"><spring:message code='sal.btn.complete' /></button>     <!-- 완성 -->
                <button id="btnCancel" type="button" class="btn_m" style="display:none;"><spring:message code='global.btn.cancel' /></button>     <!-- 취소 -->
            </div>
        </div>
    </section>
    <!-- //계약상세정보 -->

    <!-- 고객정보 -->
    <section class="group">
        <div class="header_area">
            <%-- <h2 class="title_basic"><spring:message code='global.title.custinfo' /></h2> --%>  <!-- 고객정보 -->
        </div>

        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm_01" class="form_input onKey_up onKey_bulr" />
                                        <a href="javascript:bf_searchCustomer('vCustNm_01');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_01" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custNo_01" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>   <!-- 고객유형 -->
                        <td>
                            <input id="personalTxt_01" value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">       <!-- 개인 -->
                        </td>
                        <td colspan="4">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.mathDocTp' /></th>  <!-- 증서유형 -->
                        <td>
                            <input id="ssnCrnTp_01" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>   <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_01" type="text" readonly class="form_input form_readonly numberandalpha" pattern="[0-9A-Z]" maxlength="20" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.hpNo' /></span></th>        <!-- 전화번호 -->
                        <td>
                            <input id="telNo1_01" type="text" readonly class="form_input form_readonly numberic" data-type="mobile" pattern="\d" maxlength="11" />
                            <input type="hidden" id="telNo2_01">         <!-- 전화번호2 화면에 없음 -->
                            <input type="hidden" id="emailNm_01" />      <!-- 이메일 -->
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='sal.lbl.addrTp' /></span></th><!-- 주소유형 -->
                        <td>
                            <input id="addrTp_01" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span name="spanImplys"><spring:message code='global.lbl.sung' /></span></th>  <!-- 성 -->
                        <td>
                            <input id="sungCd_01" class="form_comboBox" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='sal.lbl.cityCd' /></span></th>  <!-- 시 -->
                        <td>
                             <input id="cityCd_01" class="form_comboBox" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='sal.lbl.dist' /></span></th>  <!-- 구 -->
                        <td>
                             <input id="distCd_01" class="form_comboBox" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='global.lbl.zipCd' /></span></th>
                        <td>
                            <input id="zipCd_01" class="form_input" maxlength="6" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='global.lbl.detlAddr' /></span></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_01" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //개인 -->
        <!-- 법인 -->
        <div id="cust_02" class="table_form" style="display:none">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm_02" class="form_input onKey_up onKey_bulr">
                                        <a href="javascript:bf_searchCustomer('vCustNm_02');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_02" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custNo_02" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                        <td>
                            <input id="personalTxt_02" value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">        <!-- 법인 -->
                        </td>
                        <th scope="row"><spring:message code='sal.taxPayNo' /></th>   <!-- 납세번호 -->
                        <td>
                            <input id="taxpayerNo_02" readonly value="" class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.corpPurcMng" /></th> <!-- 구매담당자명 -->
                        <td>
                            <input id="purcMngNm_02" type="text" value="" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <%--
                        <td colspan="2">
                             <button type="button" class="btn_s" id="btnCrmCustSearch_02" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='sal.btn.refresh' /></button>   <!-- 갱신 -->
                        </td>
                        --%>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.mathDocTp' /></span></th>       <!-- 증서유형 -->
                        <td>
                            <input id="ssnCrnTp_02" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>         <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_02" type="text" readonly class="form_input form_readonly" maxlength="25" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.hpNo' /></th>          <!-- 전화번호 -->
                        <td>
                            <input id="telNo1_02" type="text" readonly class="form_input form_readonly numberic" data-type="mobile" pattern="\d" maxlength="11" />
                            <input type="hidden" id="telNo2_02" />    <!-- 전화번호2 화면에 없음 -->
                            <input type="hidden" id="emailNm_02" />      <!-- 이메일 -->
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='sal.lbl.addrTp' /></span></th><!-- 주소유형 -->
                        <td>
                            <input id="addrTp_02" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span name="spanImplys"><spring:message code='global.lbl.sung' /></span></th>  <!-- 성 -->
                        <td>
                            <input id="sungCd_02" class="form_comboBox" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='sal.lbl.cityCd' /></span></th>  <!-- 시 -->
                        <td>
                            <input id="cityCd_02" class="form_comboBox" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='sal.lbl.dist' /></span></th>  <!-- 구 -->
                        <td>
                            <input id="distCd_02" class="form_comboBox" />
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='global.lbl.zipCd' /></span></th>      <!-- 우편번호 -->
                        <td>
                            <input id="zipCd_02" class="form_input" readonly maxlength="6" />
                            <%--
                            <div class="form_search">
                            <a href="javascript:bf_custZipCodeSearch('02');"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                            </div>
                            --%>
                        </td>
                        <th scope="row"><span name="spanImplys"><spring:message code='global.lbl.detlAddr' /></span></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_02" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //법인 -->
    </section>
    <!-- //계약고객정보 -->

    <!-- 차량정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2>   <!-- 차량정보 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carLine' /></span></th>  <!-- 차종 -->
                        <td>
                            <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>   <!-- 차관 -->
                        <td>
                            <input id="fscCd" name="fscCd" class="form_comboBox" data-json-obj="true" />
                            <input id="modelCd" type="hidden" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>  <!-- OCN -->
                        <td>
                            <input id="ocnCd" name="ocnCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>  <!-- 외장색 -->
                        <td>
                            <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>  <!-- 내장색 -->
                        <td>
                            <input id="intColorCd" name="intColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /></th>   <!-- 지도가:공장지도가 -->
                        <td>
                            <input id="retlAmt" name="retlAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량정보 -->

    <!-- 예약판매정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.lbl.beforeContInfo' /></h2>  <!-- 예약판매정보 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.beforeNo' /></th> <!-- 예약번호 -->
                        <td>
                            <input id="beforeNo" name="beforeNo" class="form_input form_readonly" readonly data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.orderDate' /></th> <!-- 예약일자 -->
                        <td>
                            <input id="beforeDt" name="beforeDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                        <td>
                            <input id="contractNo" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <input id="contractDt" class="form_datepicker" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.salPrsnNm' /></span></th>  <!-- 판매담당자 -->
                        <td>
                            <input id="saleEmpNo" name="saleEmpNo" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><span name="tpImply" class="bu_required"><spring:message code='global.lbl.contractAmt' /></span></th>   <!-- 계약금 -->
                        <td>
                            <input id="beforeAmt" name="beforeAmt" onfocus="fnOnfocus(this.id);" type="text" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.fincBank' /></th> <!-- 대출은행 -->
                        <td colspan="3">
                            <input id="fincBank" name="fincBank" type="text" class="form_input" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.finImplysYn' /></th> <!-- 수납여부 -->
                        <td>
                            <input type="checkbox" id="implyYn" '${finImplyYn}' == 'Y'?checked:'' class="form_check" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //예약판매정보 -->

<!-- hidden값  -->
<span style="display:none">

    <!-- 계약예정일자 -->
    <input id="beforeContractDt" name="beforeContractDt" class="form_datepicker" data-json-obj="true" />

    <!-- 계약고객유형 :SAL028 C:계약자, D:실운전자 -->
    <!-- 계약자 고객유형 :01:개인, 02:법인 -->
    <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

    <!--
        상태 :SAL208
        10      예판등록
        20      예판생성
        90      예판삭제
        91      예판해지
    -->
    <input id="beforeStatCd" name="beforeStatCd" type="hidden" data-json-obj="true" />

    <!-- 저장 후 선택될 예판번호 -->
    <input id="savedBeforeNo" value="" />

    <!-- 판매기회번호 -->
    <input id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />

    <!-- 개인-납세번호 -->
    <input id="taxpayerNo_01" type="hidden" value="" class="form_input" />

    <!-- 개인-구매담당자명 -->
    <input id="purcMngNm_01" type="hidden" value="" class="form_input" />
</span>
</form>
</section>
<!-- //계약관리 화면 -->

<!-- #스크립트 영역# -->
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

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매관리자 여부 : 판매인도 판매관리자도 아닌 사람은 관리자와 같은 권한을 갖는다. [2016.10.27 : 구상우D ]
var saleAdminYn = "${saleAdminYn}";

//임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

var implyYn = "${finImplyYn}";

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

//상태 SAL208
var statCdList = [];
var statCdArray = {};
<c:forEach var="obj" items="${statCdDS}">
    statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    statCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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
var addrTpList  = [];
var addrTpLists = [];
<c:forEach var="obj" items="${addrTpDS}">
    <c:if test="${obj.cmmCd eq '02'}">
        addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    addrTpLists.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 팝업 설정값
var options = parent.mainPopupWindow.options.content.data;

var popupWindow;
var dealerSearchPopupWin;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

            dms.window.confirm({
                message:"<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />"
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        save("SAVE");
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    // 예판생성
    $("#btnCreate").kendoButton({
        enable:false,
        click:function(e){
            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.btn.complete' var='salBtnComplete' /><spring:message code='global.info.cnfrmMsg' arguments='${salBtnComplete}' />"
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        save("COMPLETE");
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    // 예판취소
    $("#btnCancel").kendoButton({
        enable:false,
        click:function(e){
            dms.window.confirm({
                message:"<spring:message code='global.lbl.cancel' var='globalLblCancel' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCancel}' />"
                ,title:"<spring:message code='global.btn.cancel' />"
                ,callback:function(result){
                    if(result){
                        if($("#beforeStatCd").val() == "" || $("#beforeStatCd").val() == "10" ){
                            remove();
                        }else{
                            cancel();
                        }
                    }else{
                        return false;
                    }
                }
            });
        }
    });



    $("#sDlrCd").val(dlrCd);        // 딜러코드
    $("#sDlrNm").val(dlrNm);        // 딜러명
    $("#personalTxt_01").val(" ");     // 개인고객

    if("${finImplyYn}" == "Y"){
        $("span[name='tpImply']").addClass("bu_required");
    }else{
        $("span[name='tpImply']").removeClass("bu_required");
    }

    $("#btnPrint").kendoButton({//결산서출력
        //enable:false,
        click:function(e){
            var beforeNo = $("#beforeNo").val();
            if(dms.string.isNotEmpty(beforeNo)) {
                //parent.parent._createOrReloadTabMenu("<spring:message code='sal.lbl.beforeContReport'/>", "<c:url value='/ReportServer?reportlet=sale/selectPresellOrder.cpt'/>&sDlrCd="+dlrCd+"&sBeforeNo="+beforeNo);
                var iReportParam = "&sDlrCd="+dlrCd+"&sBeforeNo="+beforeNo;
                var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectPresellOrder.cpt' />"+iReportParam;
                var newWindow=open(iReportUrl, "<spring:message code='sal.lbl.beforeContReport' />", 'top=0,left=0,width=800,height=700,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
            } else {
                // {예판목록}을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='sal.lbl.beforeContInfo' var='arg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arg}' />");
            };
        }
    });

    // 예판계약일
    $("#beforeDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
    });
    $("#beforeDt").data("kendoExtMaskedDatePicker").enable(false);

    //계약일자
    $("#contractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(false);

    // 계약예정일
    $("#beforeContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매담당자
    $("#saleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y"){
        $("#saleEmpNo").data("kendoExtDropDownList").value(userId);
    }else{
        $("#saleEmpNo").data("kendoExtDropDownList").value("");
    }
    $("#saleEmpNo").data("kendoExtDropDownList").enable(false);

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
       ,optionLabel:" "
       ,change:function(){
           var addrTp = this.dataItem(this.select()).cmmCd;
           if(dms.string.strNvl(addrTp) == ""){
               $("span[name='spanImplys']").removeClass("bu_required");
           }else{
               $("span[name='spanImplys']").addClass("bu_required");
           }
       }
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
       ,optionLabel:" "
       ,change:function(){
           var addrTp = this.dataItem(this.select()).cmmCd;
           if(dms.string.strNvl(addrTp) == ""){
               $("span[name='spanImplys']").removeClass("bu_required");
           }else{
               $("span[name='spanImplys']").addClass("bu_required");
           }
       }
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

    // 차량
    $("#carlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,filter :"contains"
       ,change :onSelectCarlineCd
       ,optionLabel:" "
    });

    // 차관
    $("#fscCd").kendoExtDropDownList({
        dataTextField :"fscNm"
       ,dataValueField :"fscCd"
       ,filter :"contains"
       ,change :onSelectFscCd
       ,optionLabel:" "
    });
    $("#fscCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,filter :"contains"
        ,optionLabel:" "
        ,change :onSelectOcnCd
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,filter :"contains"
        ,change :onSelectExtColorCd
        ,optionLabel:" "
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,filter :"contains"
        ,optionLabel:" "
        ,change :function(e){
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

    // 예약금액
    $("#beforeAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 수납여부
    $("#implyYn").click(function(){
       if(this.checked){
           $("span[name='tpImply']").addClass("bu_required");
       }else{
           $("span[name='tpImply']").removeClass("bu_required");
       }
    });



   // DB동기화 - 재조회.
   function fn_contOnLoad(selectedItem){
       dms.loading.show();
       $.ajax({
          url :"<c:url value='/sal/acu/contBeforeMng/selectContBeforeMngSearch.do' />"
          ,data :JSON.stringify({"sDlrCd":selectedItem.sDlrCd, "sBeforeNo":selectedItem.sBeforeNo})
          ,type :'POST'
          ,dataType :'json'
          ,contentType :'application/json'
          ,error :function(jqXHR,status,error) {
              dms.loading.hide();
              if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
              }else{
                  dms.notification.error(error);
              }
          }
          ,success :function(jqXHR, textStatus) {
              dms.loading.hide();
              if(jqXHR.total > 0){
                refreshAll();
                fn_contGridDBclick(jqXHR.data[0]);
              }else{
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
              }
          }
      });
   }

   // 그리드 주문번호 더블클릭.
   fn_contGridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){

           $("#beforeNo").val(selectedItem.beforeNo);                           // 예약번호
           if(dms.string.strNvl(selectedItem.beforeDt) == ""){
               $("#beforeDt").data("kendoExtMaskedDatePicker").value( toDay );   // 예약일자
           }else{
               $("#beforeDt").data("kendoExtMaskedDatePicker").value(selectedItem.beforeDt);   // 예약일자
           }

           $("#contractNo").val(selectedItem.contractNo);                           // 계약번호
           $("#contractDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractDt);    // 계약일자
           $("#beforeContractDt").data("kendoExtMaskedDatePicker").value( dms.string.isNotEmpty(selectedItem.beforeContractDt) ? selectedItem.beforeContractDt:toDay);   // 계약예정일자
           $("#beforeStatCd").val(selectedItem.beforeStatCd);                     // 계약상태

           $("#saleOpptNo").val(selectedItem.saleOpptNo);   //판매기회번호

           $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자
           $("#saleEmpNo").data("kendoExtDropDownList").enable(false);

           /* 계약 고객정보 세팅 */
           var custTp = selectedItem.custTp;
           if(custTp != null){
               $("#custTp").val(custTp);       // 계약 고객유형
               /** 계약고객정보 **/
               if(custTp == "02"){  // 법인
                   $("#cust_01").hide();
                   $("#cust_02").show();
                   $("#personalTxt_02").val("<spring:message code='global.lbl.corporation' />"); //법인
               }
               else{            // 개인
                   $("#cust_02").hide();
                   $("#cust_01").show();
                   $("#personalTxt_01").val("<spring:message code='global.lbl.personal' />"); //개인
               }

               $("#custNo_"+custTp).val(selectedItem.custNo);       // 고객코드
               $("#custNm_"+custTp).val(selectedItem.custNm);       // 고객명
               $("#vCustNm_"+custTp).val(selectedItem.custNm);      // 고객명
               $("#taxpayerNo_"+custTp).val(selectedItem.taxpayerNo);   // 납세번호
               $("#purcMngNm_"+custTp).val(selectedItem.purcMngNm);   // 구매담당자명
               $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.ssnCrnTp); // 신분증유형 / 법인유형
               $("#ssnCrnTp_"+custTp).change();
               $("#ssnCrnNo_"+custTp).val(selectedItem.ssnCrnNo);  // 증서번호
               $("#telNo1_"+custTp).val(selectedItem.telNo1);      // 전화번호1
               $("#telNo2_"+custTp).val(selectedItem.telNo2);      // 전화번호2
               $("#emailNm_"+custTp).val(selectedItem.emailNm);    // 이메일명


               $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);

               // 보유고객은 신분증유형, 신분증 번호 변경 불가[2016.12.08 구상우K]
               /*
               if( dms.string.strNvl(selectedItem.custCcd) == "02" ){
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
                   $("#ssnCrnNo_"+custTp).attr("disabled", true);
               }else{
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
                   $("#ssnCrnNo_"+custTp).attr("disabled", false);
               }
               */

               // CRM 고객정보 블락요청[2017.03.21 이교진 요청]
               /*
               var blockYn = bf_blockSsnCrnNo(selectedItem.dlrCd, selectedItem.custCd);
               if(blockYn == "Y"){
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
                   $("#ssnCrnNo_"+custTp).attr("disabled", false);
               }else{
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
                   $("#ssnCrnNo_"+custTp).attr("disabled", true);
               }
               */

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
               if(dms.string.isEmpty($("#addrTp_"+custTp).data("kendoExtDropDownList").value())){
                   $("span[name='spanImplys']").removeClass("bu_required");
               }else{
                   $("span[name='spanImplys']").addClass("bu_required");
               }
               $("#addrDetlCont_"+custTp).val(selectedItem.addrDetlCont);   // 상세주소

               // 판매 기회일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
               if(!dms.string.isEmpty(selectedItem.saleOpptNo)){
                   $("#vCustNm_"+custTp).attr("disabled", true);
                   //$("#btnCrmCustSearch_"+custTp).show();
               }
           }

           /* 차량정보 */
           var fscDS = null;
           var ocnDS = null;
           var extColorDS = null;
           var intColorDS = null;
           var fscCd = $("#fscCd").data("kendoExtDropDownList");
           var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
           var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
           var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
           fscCd.enable(false);
           ocnCd.enable(false);
           extColorCd.enable(false);
           intColorCd.enable(false);

           if(dms.string.isNotEmpty(selectedItem.carlineCd)){
               $("#carlineCd").data("kendoExtDropDownList").enable(true);
               $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd);
               fscDS = setModelDataSource(selectedItem.carlineCd);

               fscCd.setDataSource(fscDS!=null?fscDS:[]);
               fscCd.enable(true);
           }


           if(dms.string.isNotEmpty(selectedItem.fscCd)){
               if(fscDS == null){
                   fscCd.setDataSource([{fscNm:selectedItem.fscNm, fscCd:selectedItem.fscCd}]);
                   fscCd.enable(false);
               }
               fscCd.value(selectedItem.fscCd);
           }

           ocnDS = setOcnDataSource(dms.string.strNvl(selectedItem.carlineCd), dms.string.strNvl(selectedItem.fscCd));
           if(ocnDS != null){
               ocnCd.setDataSource(ocnDS!=null?ocnDS:[]);
               ocnCd.enable(true);
           }

           if(dms.string.isNotEmpty(selectedItem.modelCd)){
               $("#modelCd").val(selectedItem.modelCd);

               extColorDS = setExtColorDataSource(selectedItem.modelCd);
               intColorDS = setIntColorDataSource(selectedItem.modelCd);

               extColorCd.setDataSource(extColorDS!=null?extColorDS:[]);
               intColorCd.setDataSource(intColorDS!=null?intColorDS:[]);
           }

           if(dms.string.isNotEmpty(selectedItem.ocnCd)){
               if(ocnDS == null){
                   ocnCd.setDataSource([{ocnNm:selectedItem.ocnNm, ocnCd:selectedItem.ocnCd}]);
                   ocnCd.enable(false);
               }
               ocnCd.value(selectedItem.ocnCd);
               extColorCd.enable(true);
           }

           if(dms.string.isNotEmpty(selectedItem.extColorCd)){
               if(extColorDS == null){
                   extColorCd.setDataSource([{extColorNm:selectedItem.extColorNm, extColorCd:selectedItem.extColorCd}]);
                   extColorCd.enable(false);
               }
               extColorCd.value(selectedItem.extColorCd);
               intColorCd.enable(true);
           }

           if(dms.string.isNotEmpty(selectedItem.intColorCd)){
               if(intColorDS == null){
                   intColorCd.setDataSource([{intColorNm:selectedItem.intColorNm, intColorCd:selectedItem.intColorCd}]);
                   intColorCd.enable(false);
               }
               intColorCd.value(selectedItem.intColorCd);
           }

           $("#retlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt :0);               // 공장지도가
           $("#beforeAmt").data("kendoExtNumericTextBox").value(selectedItem.beforeAmt != null ? selectedItem.beforeAmt :0);         // 예약금액

           if(selectedItem.implyYn == "Y"){
               $("#implyYn").prop('checked', true);
           }else{
               $("#implyYn").prop('checked', false);
           }
           $("#fincBank").val(selectedItem.fincBank);

           fn_btnState(selectedItem.beforeStatCd);   // 버튼상태

           //과거 주소유형 데이터처리
           if(custTp != null
               && Number(selectedItem.beforeStatCd) >= 20){
               $("#addrTp_01").data("kendoExtDropDownList").enable(false);
               $("#addrTp_"+custTp).data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(addrTpLists));
               $("#addrTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.addrTp);
           }
       }
   }

   fnOnfocus = function(id){
       $("#"+ id +" ").select();
   }

   // 더블클릭.
   if( dms.string.isNotEmpty(options.sBeforeNo)){
       fn_contOnLoad(options);
   }else{
       refreshAll();
       fn_btnState();
   }

});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/

// 초기화
function refreshAll() {

    $("#beforeNo").val("");      // 예판번호
    $("#beforeDt").data("kendoExtMaskedDatePicker").value(toDay);              // 예약일자
    $("#beforeContractDt").data("kendoExtMaskedDatePicker").value(toDay);      // 계약예정일자
    $("#contractNo").val("");   // 계약번호
    $("#contractDt").data("kendoExtMaskedDatePicker").value("");      // 계약일자

    $("#saleOpptNo").val("");      // 판매기회번호
    $("#saleOpptTxt").hide();

    if(saleEmpYn == "Y"){
        $("#saleEmpNo").data("kendoExtDropDownList").value(userId);    // 판매담당자
    }else{
        $("#saleEmpNo").data("kendoExtDropDownList").value('');       // 판매담당자
    }
    $("#saleEmpNo").data("kendoExtDropDownList").enable(false);

    $("#custTp").val("01");       // 고객유형
    $("#beforeStatCd").val("");   // 상태

    $("#vCustNm_01").attr("disabled", false);
    $("#vCustNm_02").attr("disabled", false);

    $("#cust_02").hide();
    $("#cust_01").show();
    $("#personalTxt_01").val(" "); //개인
    $("#custNo_01").val("");     // 고객코드
    $("#custNm_01").val("");     // 고객명
    $("#vCustNm_01").val("");    // 고객명
    $("#taxpayerNo_01").val("");   // 납세번호
    $("#purcMngNm_01").val(""); //구매담당자명
    $("#ssnCrnTp_01").data("kendoExtDropDownList").enable(false);
    $("#ssnCrnTp_01").val("");   //신분증유형
    $("#ssnCrnTp_01").change();
    //$("#ssnCrnNo_01").attr("disabled", false);
    $("#ssnCrnNo_01").val("");   //증서번호
    $("#telNo1_01").val("");     //전화번호
    $("#telNo2_01").val("");
    $("#emailNm_01").val("");    //이메일
    $("#sungCd_01").data("kendoExtDropDownList").value("");

    $("#cityCd_01").data("kendoExtDropDownList").value("");
    $("#cityCd_01").data("kendoExtDropDownList").setDataSource([]);
    $("#cityCd_01").data("kendoExtDropDownList").enable(false);
    $("#distCd_01").data("kendoExtDropDownList").value("");
    $("#distCd_01").data("kendoExtDropDownList").setDataSource([]);
    $("#distCd_01").data("kendoExtDropDownList").enable(false);

    $("#zipCd_01").val("");
    $("#addrTp_01").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(addrTpList));
    $("#addrTp_01").data("kendoExtDropDownList").value("");
    $("#addrDetlCont_01").val("");

    $("#custNo_02").val("");      // 고객코드
    $("#custNm_02").val("");      // 고객명
    $("#vCustNm_02").val("");     // 고객명
    $("#taxpayerNo_02").val("");    // 납세번호
    $("#purcMngNm_02").val(""); //구매담당자명
    $("#ssnCrnTp_02").data("kendoExtDropDownList").enable(false);
    $("#ssnCrnTp_02").val("");    //신분증유형
    $("#ssnCrnTp_02").change();
    //$("#ssnCrnNo_02").attr("disabled", false);
    $("#ssnCrnNo_02").val("");    //증서번호
    $("#telNo1_02").val("");      //전화번호
    $("#telNo2_02").val("");
    $("#emailNm_02").val("");     //이메일

    $("#sungCd_02").data("kendoExtDropDownList").value("");

    $("#cityCd_02").data("kendoExtDropDownList").value("");
    $("#cityCd_02").data("kendoExtDropDownList").setDataSource([]);
    $("#cityCd_02").data("kendoExtDropDownList").enable(false);

    $("#distCd_02").data("kendoExtDropDownList").value("");
    $("#distCd_02").data("kendoExtDropDownList").setDataSource([]);
    $("#distCd_02").data("kendoExtDropDownList").enable(false);
    $("#zipCd_02").val("");
    $("#addrTp_02").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(addrTpList));
    $("#addrTp_02").data("kendoExtDropDownList").value("");
    $("#addrDetlCont_02").val("");

    $("span[name='spanImplys']").removeClass("bu_required");

    /* 차량 */
    $("#carlineCd").data("kendoExtDropDownList").enable(true);
    $("#carlineCd").data("kendoExtDropDownList").value('');
    $("#modelCd").val("");

    var fscCd = $("#fscCd").data("kendoExtDropDownList");
    fscCd.setDataSource([]);
    fscCd.enable(false);
    fscCd.value('');

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

    $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);     // 지도가
    $("#beforeAmt").data("kendoExtNumericTextBox").value(0.00);   // 계약금

    if(implyYn == "Y"){
        $("#implyYn").prop('checked', true);
    }else{
        $("#implyYn").prop('checked', false);
    }
    $("#fincBank").val("");
}

/** [차량영역] ComboBox Select() **/
//차종에 따른 모델검색 [차량영역]
function onSelectCarlineCd(e){
    $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#fscCd").data("kendoExtDropDownList").enable(true);

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
    $("#ocnCd").data("kendoExtDropDownList").enable(true);       // OCN 닫음

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);         // 지도가
    //$("#beforeAmt").data("kendoExtNumericTextBox").value(0.00);      // 순차량금액

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#fscCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    $("#fscCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(),""));
}

// 모델에 따른 OCN검색 [차량영역]
function onSelectFscCd(e){
    $("#modelCd").val("");

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(true);

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    var dataItem = this.dataItem(e.item);
    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), dataItem.fscCd));

    $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
    //$("#beforeAmt").data("kendoExtNumericTextBox").value(0);      // 순차량금액
}

//OCN에 따른 외장색 검색
function onSelectOcnCd(e){
    $("#modelCd").val("");

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(true);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    if(this.dataItem(e.item).ocnCd == ""){
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    if(Number(this.dataItem(e.item).modelCnt) > 1){
        dms.notification.error("<spring:message code='sal.info.modelCntCheck' arguments='"+this.dataItem(e.item).ocnNm+","+this.dataItem(e.item).modelCnt+"' />");
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").value("");
        return false;
    }

    $("#modelCd").val(this.dataItem(e.item).modelCd);

    //차량 가격 세팅
    $("#retlAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).msPrc);       // 지도가
    //$("#beforeAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).msPrc);    // 순차량금액

    $("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource($("#modelCd").val()));
}

// 외장색에 따른 내장색 검색
function onSelectExtColorCd(e){
    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(true);

    if(this.dataItem(e.item).ocnCd == ""){
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    $("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#modelCd").val()));
}

// 차관(모델)의 DataSource를 불러온다.
function setModelDataSource(carlineCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectFsc.do' />"
        ,data :JSON.stringify({"sCarlineCd":carlineCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }
    return responseJson.data;
}

// OCN의 DataSource를 불러온다.
function setOcnDataSource(carlineCd, fscCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectOcn.do' />"
        ,data :JSON.stringify({"sCarlineCd":carlineCd, "sFscCd":fscCd})
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

// CRM 고객 데이터 조회
bf_searchCustomer = function(sIdNm){

    // 판매기회로 넘어온 고객은 고객변경 불가.
    if($("#saleOpptNo").val() != ""){ return;}

    if($("#"+sIdNm).prop("disabled")){ return; }

    var sMngScId = "";
    //if(saleAdminYn != "Y"){   //전체권한자는 고객전체 검색 가능.
        sMngScId = userId;
    //}

    var responseJson = {};
    if( dms.string.trim($("#"+sIdNm).val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractMnt/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sAddrTp":"02", "sCustNm":$("#"+sIdNm).val(), "sMngScId":sMngScId})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        bf_customerSet(responseJson.data);
    }else{
        var obj = {};
        obj["sIdNm"] = $("#"+sIdNm).val();
        obj["sMngScId"] = sMngScId;
        obj["sAddrTp"] = "02";
        parent.bf_pSearchCustomer(obj);
    }
}

function bf_customerSet(data){
    var custTp = data[0].custTp;
    $("#custTp").val(custTp);

    if(custTp == "02"){  // 법인
        $("#cust_01").hide();
        $("#cust_02").show();
        $("#personalTxt_02").val("<spring:message code='global.lbl.corporation' />"); //법인
    }
    else{            // 개인
        $("#cust_02").hide();
        $("#cust_01").show();
        $("#personalTxt_01").val("<spring:message code='global.lbl.personal' />"); //개인
    }

    $("#custNo_"+custTp).val(data[0].custNo);        // 고객코드
    $("#custNm_"+custTp).val(data[0].custNm);        // 고객명
    $("#vCustNm_"+custTp).val(data[0].custNm);       // 고객명
    $("#taxpayerNo_"+custTp).val(data[0].taxpayerNo);  // 납세번호
    $("#purcMngNm_"+custTp).val(dms.string.strNvl(data[0].purcMngNm));    // 구매담당자명
    $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
    $("#ssnCrnTp_"+custTp).change();
    $("#ssnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
    $("#telNo1_"+custTp).val(data[0].hpNo);        // 전화번호1
    $("#telNo2_"+custTp).val(data[0].telNo);       // 전화번호2
    $("#emailNm_"+custTp).val(data[0].emailNm);    // 이메일명

    // CRM 고객정보 블락요청[2017.03.21 이교진 요청]
    /*
    var blockYn = bf_blockSsnCrnNo(dlrCd, data[0].custNo);
    if(blockYn == "Y"){
        $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
        $("#ssnCrnNo_"+custTp).attr("disabled", false);
    }else{
        $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
        $("#ssnCrnNo_"+custTp).attr("disabled", true);
    }
    */

    if(dms.string.strNvl(data[0].addrTp) == "02"){
        $("#sungCd_"+custTp).data("kendoExtDropDownList").value(data[0].sungCd);

        // 시
        if(dms.string.isNotEmpty(data[0].sungCd)){
            var rsJsonCity = dms.ajax.getJson({
                url :"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
                ,data :JSON.stringify({"sungCd":data[0].sungCd})
                ,async :false
            });
            $("#cityCd_"+custTp).data("kendoExtDropDownList").setDataSource(rsJsonCity.data);
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
            $("#addrTp_"+custTp).data("kendoExtDropDownList").value("");   //주소유형
            $("span[name='spanImplys']").removeClass("bu_required");
        }else{
            $("#addrTp_"+custTp).data("kendoExtDropDownList").value(data[0].addrTp);   //주소유형
            $("span[name='spanImplys']").addClass("bu_required");
        }
        $("#addrDetlCont_"+custTp).val(data[0].addrDetlCont);   // 상세주소

    }else{
        $("span[name='spanImplys']").removeClass("bu_required");
        $("#addrTp_"+custTp).data("kendoExtDropDownList").value("");   //주소유형
        $("#sungCd_"+custTp).data("kendoExtDropDownList").value("");
        $("#cityCd_"+custTp).data("kendoExtDropDownList").value("");
        $("#cityCd_"+custTp).data("kendoExtDropDownList").setDataSource([]);
        $("#cityCd_"+custTp).data("kendoExtDropDownList").enable(false);
        $("#distCd_"+custTp).data("kendoExtDropDownList").value("");
        $("#distCd_"+custTp).data("kendoExtDropDownList").setDataSource([]);
        $("#distCd_"+custTp).data("kendoExtDropDownList").enable(false);
        $("#zipCd_"+custTp).val("");
        $("#addrDetlCont_"+custTp).val("");
    }
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

//판매기회, 집단판매 CRM고객정보 갱신 조회
function bf_crmCustSearch(){
    var sCustTp = $("#custTp").val();
    var sCustNo = $("#custNo_"+sCustTp).val();

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
        ,data :JSON.stringify({"sDlrCd":dlrCd, "sAddrTp":"02", "sCustNo":sCustNo})
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success :function(jqXHR, textStatus) {

            var dataItem = jqXHR.data[0]
              , cuTp = dataItem.custTp;

            $("#custTp").val(cuTp);
            if(cuTp == "02"){  // 법인
                $("#cust_01").hide();
                $("#cust_02").show();
                $("#personalTxt_02").val("<spring:message code='global.lbl.corporation' />"); //법인
            }else{            // 개인
                $("#cust_02").hide();
                $("#cust_01").show();
                $("#personalTxt_01").val("<spring:message code='global.lbl.personal' />"); //개인
            }
            $("#custNo_"+cuTp).val(dataItem.custNo);       // 고객코드
            $("#custNm_"+cuTp).val(dataItem.custNm);       // 고객명
            $("#ssnCrnTp_"+cuTp).data("kendoExtDropDownList").value(dataItem.mathDocTp); // 신분증유형 / 법인유형
            $("#ssnCrnTp_"+cuTp).change();
            $("#ssnCrnNo_"+cuTp).val(dataItem.ssnCrnNo);   // 증서번호
            $("#taxpayerNo_"+cuTp).val(dataItem.taxpayerNo);  // 납세번호
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

            $("#zipCd_"+cuTp).val(dataItem.zipCd);      // 우편번호

            if(dms.string.isEmpty(dataItem.addrTp)){
                $("#addrTp_"+cuTp).data("kendoExtDropDownList").value("");   //주소유형
                $("span[name='spanImplys']").removeClass("bu_required");
            }else{
                $("#addrTp_"+cuTp).data("kendoExtDropDownList").value(dataItem.addrTp);   //주소유형
                $("span[name='spanImplys']").addClass("bu_required");
            }

            $("#addrDetlCont_"+cuTp).val(dataItem.addrDetlCont);   // 상세주소
        }
    });
}

//증서유형, 증서번호 수정 제한.
function bf_blockSsnCrnNo(dlrCd, custNo){
    if(dms.string.isEmpty(custNo)){
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectAbleToEditSsnCrnNoSearch.do' />"
        ,data :JSON.stringify({"dlrCd":dlrCd, "contractCustNo":custNo})
        ,async :false
    });

    return dms.string.strNvl(responseJson);
}

/** 무결성 검사 **/
function save_Validate(){

    // 계약일
    /*
    if($("#beforeContractDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("계약예정일이 없습니다.");
        $("#beforeContractDt").focus();
        return false;
    }
    */

    if( dms.string.strNvl($("#beforeNo").val()) == ""
            && kendo.toString($("#beforeDt").data("kendoExtMaskedDatePicker").value(),"yyyy-MM-dd") < toDay ){
        // {계약일자}은 {현재일자}보다 작을 수 없습니다.
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='sal.lbl.toDay' var='salLblToDay' /><spring:message code='sal.info.CheckDateForm' arguments='${globalLblContractDt},${salLblToDay}' />");
        $("#beforeDt").focus();
        return false;
    }

    // 판매담당자
    if( dms.string.isEmpty($("#saleEmpNo").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.salPrsnNm' var='globalLblSalPrsnNm' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblSalPrsnNm}' />");
        $("#saleEmpNo").data("kendoExtDropDownList").focus();
        return false;
    }

    var custTp = $("#custTp").val();
    if( $("#custNo_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요. : 계약고객
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        $("#custNo_"+custTp == "" ? "01" :custTp).focus();
        return false;
    }

    if(custTp == "01"
            && dms.string.isNotEmpty($("#ssnCrnNo_01").val())
            && $("#ssnCrnTp_01").data("kendoExtDropDownList").value() == "01"
            && ($("#ssnCrnNo_01").val().length != 15 && $("#ssnCrnNo_01").val().length != 18 )
       ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_01").focus();
        return false;
    }

    if(custTp == "01"
            && dms.string.isNotEmpty($("#ssnCrnNo_01").val())
            && $("#ssnCrnTp_01").data("kendoExtDropDownList").value() != "01" && $("#ssnCrnNo_01").val().length > 20 ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnNo_01").focus();
        return false;
    }

    if(custTp == "02"
            && dms.string.isNotEmpty($("#ssnCrnNo_02").val())
            && $("#ssnCrnTp_02").data("kendoExtDropDownList").value() == "08"
            && $("#ssnCrnNo_02").val().length > 10 ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_02").focus();
        return false;
    }

    if(custTp == "02"
            && dms.string.isNotEmpty($("#ssnCrnNo_02").val())
            && $("#ssnCrnTp_02").data("kendoExtDropDownList").value() == "10"
            && $("#ssnCrnNo_02").val().length > 18 ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_02").focus();
        return false;
    }

    if(dms.string.isEmpty($("#telNo1_" +custTp).val())){
        // {이동전화}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='global.lbl.hpNo' var='globalLblHpNo' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblHpNo}' />");
        $("#telNo1_" +custTp).focus();
        return false;
    }

    // 주소유형
    if(dms.string.isNotEmpty($("#addrTp_"+custTp).data("kendoExtDropDownList").value())){
        if(dms.string.isEmpty($("#sungCd_"+custTp).data("kendoExtDropDownList").value())){
            // {성}을(를) 입력해주세요.
            dms.notification.info("<spring:message code='global.lbl.sung' var='globalLblSung' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblSung}' />");
            $("#sungCd_"+custTp).focus();
            return false;
        }
        if(dms.string.isEmpty($("#cityCd_"+custTp).data("kendoExtDropDownList").value())){
            // {시}을(를) 입력해주세요.
            dms.notification.info("<spring:message code='sal.lbl.cityCd' var='salLblCityCd' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblCityCd}' />");
            $("#cityCd_"+custTp).focus();
            return false;
        }
        if(dms.string.isEmpty($("#distCd_"+custTp).data("kendoExtDropDownList").value())){
            // {구}을(를) 입력해주세요.
            dms.notification.info("<spring:message code='sal.lbl.dist' var='salLblDist' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblDist}' />");
            $("#distCd_"+custTp).focus();
            return false;
        }
        if(dms.string.isEmpty($("#zipCd_"+custTp).val())){
            // {우편번호}을(를) 입력해주세요.
            dms.notification.info("<spring:message code='global.lbl.zipCd' var='globalLblZipCd' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblZipCd}' />");
            $("#zipCd_"+custTp).focus();
            return false;
        }
        if(dms.string.isEmpty($("#addrDetlCont_"+custTp).val())){
            // {상세주소}을(를) 입력해주세요.
            dms.notification.info("<spring:message code='global.lbl.detlAddr' var='globalLblDetlAddr' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblDetlAddr}' />");
            $("#addrDetlCont_"+custTp).focus();
            return false;
        }
    }

    // 차종
    if( dms.string.isEmpty($("#carlineCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
        $("#carlineCd").focus();
        return false;
    }

    // 차관
    /*
    if( dms.string.isEmpty($("#fscCd").data("kendoExtDropDownList").value())
            && dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value())
    ){
        dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
        $("#fscCd").focus();
        return false;
    }
    */

    //순차량금액
    if( $("#implyYn").prop('checked')
            && Number($("#beforeAmt").data("kendoExtNumericTextBox").value()) <= 0  ){
        dms.notification.info("<spring:message code='global.lbl.contractAmt' var='globalLblContractAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractAmt}' />");
        $("#beforeAmt").focus();
        return false;
    }

    return true;
}


/*********
 * 저장
 *********/
function save(mFlag){
    dms.loading.show();     // 로딩 시작

    var param = $("#beforeForm").serializeObject($("#beforeForm").serializeArrayInSelector("[data-json-obj='true']"));

    if( $("#beforeStatCd").val() == "" ){
        param.beforeStatCd = "10";
    }

    param.saleEmpNo = $("#saleEmpNo").data("kendoExtDropDownList").value();           // 판매인
    param.beforeDt = $("#beforeDt").data("kendoExtMaskedDatePicker").value();      // 계약일
    param.beforeContractDt = $("#beforeContractDt").data("kendoExtMaskedDatePicker").value();      // 계약예정일
    param.implyYn = $("#implyYn").prop('checked')==true?"Y":"N";
    param.retlAmt = $("#retlAmt").data("kendoExtNumericTextBox").value();
    param.beforeAmt = $("#beforeAmt").data("kendoExtNumericTextBox").value();

    // 차종
    param.carlineCd  = $("#carlineCd").data("kendoExtDropDownList").value();
    param.fscCd      = $("#fscCd").data("kendoExtDropDownList").value();
    param.modelCd    = $("#modelCd").val();
    param.ocnCd      = $("#ocnCd").data("kendoExtDropDownList").value();
    param.extColorCd = $("#extColorCd").data("kendoExtDropDownList").value();
    param.intColorCd = $("#intColorCd").data("kendoExtDropDownList").value();

    // 계약고객정보
    var custTp = $("#custTp").val();
    param.custTp = custTp;                             // 고객유형
    param.custNo = $("#custNo_"+custTp).val();         // 고객코드

    param.custNm = $("#custNm_"+custTp).val();         // 고객명
    param.taxpayerNo = $("#taxpayerNo_"+custTp).val();     // 납세번호
    param.purcMngNm = $("#purcMngNm_"+custTp).val();   // 구매담당자명
    param.ssnCrnTp = $("#ssnCrnTp_"+custTp).val();     //신분증유형
    param.ssnCrnNo = $("#ssnCrnNo_"+custTp).val();     //증서번호
    param.telNo1 = $("#telNo1_"+custTp).val();         // 전화번호1
    param.telNo2 = $("#telNo2_"+custTp).val();         // 전화번호2
    param.emailNm = $("#emailNm_"+custTp).val();
    param.sungNm = $("#sungCd_"+custTp).data("kendoExtDropDownList").text();
    param.sungCd = $("#sungCd_"+custTp).data("kendoExtDropDownList").value();
    param.cityNm = $("#cityCd_"+custTp).data("kendoExtDropDownList").text();
    param.cityCd = $("#cityCd_"+custTp).data("kendoExtDropDownList").value();
    param.distNm = $("#distCd_"+custTp).data("kendoExtDropDownList").text();
    param.distCd = $("#distCd_"+custTp).data("kendoExtDropDownList").value();
    param.zipCd  = $("#zipCd_"+custTp).val();          // 우편번호
    param.addrTp = $("#addrTp_"+custTp).data("kendoExtDropDownList").value(); //주소유형
    param.addrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

    param.mFlag = mFlag;

    $.ajax({
        url :"<c:url value='/sal/acu/contBeforeMng/multiContBeforeMngs.do' />"
        ,data :JSON.stringify(param)
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            dms.loading.hide();   // 로딩 종료
            if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        }
        ,success :function(jqXHR, textStatus) {
            dms.loading.hide();   // 로딩 종료

            var data = {};
            data.msg = 'save';
            data.cntNo = jqXHR;
            options.callbackFunc(data);
            refreshAll();
            parent.mainPopupWindow.close();
        }
    });
}

/**
 * 삭제
 */
function remove(){

    if($("#beforeNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약삭제 승인전
    if( $("#beforeStatCd").val() == "10" ){
        var param = {};
        param.beforeNo = $("#beforeNo").val();          // 예약번호

        $.ajax({
            url :"<c:url value='/sal/acu/contBeforeMng/deleteContBefore.do' />",
            data :JSON.stringify(param),
            type :'POST',
            dataType :'json',
            contentType :'application/json',
            error :function(jqXHR,status,error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            },
            success :function(jqXHR, textStatus) {
                var data = {};
                data.msg = 'save';
                data.cntNo = jqXHR;
                options.callbackFunc(data);
                refreshAll();
                parent.mainPopupWindow.close();
            }
        });

    }else if($("#contractStatCd").val() == ""){
        refreshAll();
        parent.mainPopupWindow.close();
    }else{
        // 계약승인 이전단계에서만 삭제가 가능합니다.
        dms.notification.info("<spring:message code='global.lbl.contractAcptReq' var='globalLblContractAcptReq' /><spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalLblContractAcptReq}, ${globalLblDel}' />");
        return false;
    }

}

// 예판취소
function cancel(){

    if($("#beforeNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약생성이후
    if( $("#beforeStatCd").val() == "20" ){
        var param = {};
        param.beforeNo = $("#beforeNo").val();          // 계약번호

        $.ajax({
            url :"<c:url value='/sal/acu/contBeforeMng/cancelContBefore.do' />",
            data :JSON.stringify(param),
            type :'POST',
            dataType :'json',
            contentType :'application/json',
            error :function(jqXHR,status,error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            },
            success :function(jqXHR, textStatus) {
                var data = {};
                data.msg = 'save';
                data.cntNo = jqXHR;
                options.callbackFunc(data);
                refreshAll();
                parent.mainPopupWindow.close();
            }
        });

    }else{
        // 계약생성된 이후 삭제처리가 가능합니다.
        dms.notification.info("<spring:message code='sal.info.contAfterMsg'/>");
        return false;
    }
}

/**
 * 버튼 상태 관리
 */
function fn_btnState(state){
    switch(state){
        case '10':     // 저장
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCreate").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            fn_readOnlyStat(false);
        break;
        case '20':     // 생성
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(true);
            fn_readOnlyStat(true);
            break;
        case '90':     // 삭제
        case '91':     // 취소
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            fn_readOnlyStat(true);
            break;
        default :      // 작성전
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCreate").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            fn_readOnlyStat(false);
            break;
    }
}
function fn_readOnlyStat(state){

    if(state){
        $("#implyYn").attr("disabled", true);

        $("#beforeContractDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#beforeAmt").data("kendoExtNumericTextBox").enable(false);
        $("#fincBank").prop("disabled", true);

        $("#carlineCd").data("kendoExtDropDownList").enable(false);
        $("#fscCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        $("#intColorCd").data("kendoExtDropDownList").enable(false);

        $("#vCustNm_01").attr("disabled", true);
        $("#ssnCrnTp_01").data("kendoExtDropDownList").enable(false);
        $("#ssnCrnNo_01").attr("disabled", true);
        $("#telNo1_01").attr("disabled", true);
        $("#addrTp_01").data("kendoExtDropDownList").enable(false);
        $("#emailNm_01").attr("disabled", true);
        $("#sungCd_01").data("kendoExtDropDownList").enable(false);
        $("#cityCd_01").data("kendoExtDropDownList").enable(false);
        $("#distCd_01").data("kendoExtDropDownList").enable(false);
        $("#zipCd_01").attr("disabled", true);
        $("#addrDetlCont_01").attr("disabled", true);

        $("#vCustNm_02").attr("disabled", true);
        $("#taxpayerNo_02").attr("disabled", true);
        $("#purcMngNm_02").attr("disabled", true);
        $("#ssnCrnTp_02").data("kendoExtDropDownList").enable(false);
        $("#ssnCrnNo_02").attr("disabled", true);
        $("#telNo1_02").attr("disabled", true);
        $("#addrTp_02").data("kendoExtDropDownList").enable(false);
        $("#emailNm_02").attr("disabled", true);
        $("#sungCd_02").data("kendoExtDropDownList").enable(false);
        $("#cityCd_02").data("kendoExtDropDownList").enable(false);
        $("#distCd_02").data("kendoExtDropDownList").enable(false);
        $("#zipCd_02").attr("disabled", true);
        $("#addrDetlCont_02").attr("disabled", true);

    }else{
        $("#implyYn").attr("disabled", false);

        $("#beforeContractDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#beforeAmt").data("kendoExtNumericTextBox").enable(true);
        $("#fincBank").prop("disabled", false);

        //$("#carlineCd").data("kendoExtDropDownList").enable(true);
        //$("#fscCd").data("kendoExtDropDownList").enable(true);
        //$("#ocnCd").data("kendoExtDropDownList").enable(true);
        //$("#extColorCd").data("kendoExtDropDownList").enable(true);
        //$("#intColorCd").data("kendoExtDropDownList").enable(true);

        if(dms.string.isEmpty($("#saleOpptNo").val())){
            $("#vCustNm_01").attr("disabled", false);
        }
        //$("#ssnCrnTp_01").data("kendoExtDropDownList").enable(true);
        //$("#ssnCrnNo_01").attr("disabled", false);
        //$("#telNo1_01").attr("disabled", false);
        $("#addrTp_01").data("kendoExtDropDownList").enable(true);
        $("#emailNm_01").attr("disabled", false);
        $("#sungCd_01").data("kendoExtDropDownList").enable(true);
        //$("#cityCd_01").data("kendoExtDropDownList").enable(true);
        //$("#distCd_01").data("kendoExtDropDownList").enable(true);
        $("#zipCd_01").attr("disabled", false);
        $("#addrDetlCont_01").attr("disabled", false);

        if(dms.string.isEmpty($("#saleOpptNo").val())){
            $("#vCustNm_02").attr("disabled", false);
        }
        //$("#taxpayerNo_02").attr("disabled", false);
        //$("#purcMngNm_02").attr("disabled", false);
        //$("#ssnCrnTp_02").data("kendoExtDropDownList").enable(true);
        //$("#ssnCrnNo_02").attr("disabled", false);
        //$("#telNo1_02").attr("disabled", false);
        $("#addrTp_02").data("kendoExtDropDownList").enable(true);
        $("#emailNm_02").attr("disabled", false);
        $("#sungCd_02").data("kendoExtDropDownList").enable(true);
        //$("#cityCd_02").data("kendoExtDropDownList").enable(true);
        //$("#distCd_02").data("kendoExtDropDownList").enable(true);
        $("#zipCd_02").attr("disabled", false);
        $("#addrDetlCont_02").attr("disabled", false);
    }
}


// 대문자
//$(".upper").bind("keyup", function(){
//    $(this).val($(this).val().toUpperCase());
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
            $("#ssnCrnTp_01").data("kendoExtDropDownList").enable(false);
            $("#ssnCrnNo_01").attr("disabled", false);

            $("#personalTxt_01").val(" "); //개인
            $("#custNo_01").val('');       // 고객코드
            $("#taxpayerNo_01").val('');     // 납세번호
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
            $("#addrTp_01").data("kendoExtDropDownList").value('');
            $("#addrDetlCont_01").val('');   // 상세주소
            $("span[name='spanImplys']").removeClass("bu_required");
        }
    }else if(cId == "vCustNm_02"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_02").val()) ){
            $("#ssnCrnTp_02").data("kendoExtDropDownList").enable(false);
            $("#ssnCrnNo_02").attr("disabled", false);

            $("#personalTxt_02").val(" "); //법인
            $("#custNo_02").val('');       // 고객코드
            $("#taxpayerNo_02").val('');     // 납세번호
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
            $("#addrTp_02").data("kendoExtDropDownList").value('');
            $("#addrDetlCont_02").val('');   // 상세주소
            $("span[name='spanImplys']").removeClass("bu_required");
        }
    }
}

// 고객정보 수정링크
$(document).on("click", ".linkCustNo", function(e){
    if(dms.string.isEmpty($(this).val())){return ;}
    parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+$(this).val(), "VIEW-D-10272");
});


 /******************************************
  * 함수영역 - end
  ******************************************/
//-->
</script>
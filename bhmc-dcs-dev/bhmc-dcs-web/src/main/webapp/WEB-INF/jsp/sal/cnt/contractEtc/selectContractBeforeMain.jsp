<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 전략출고(선출고) -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">전략출고</h1>    <!-- 전략출고 -->
        <div class="btn_right">
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            <button id="btnRefresh" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
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
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>       <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input onKey_up onKey_bulr" >
                                    <a href="javascript:bf_searchCustomer('search', 'vContractCustNm');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="mainGrid"></div>
    </div>
</section>
<!-- //전략출고(선출고) -->

<section id="callContractBeforeWindow" class="pop_wrap">
<form id="contForm" name="contForm" method="POST">

    <!-- 계약상세정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.retailContractDetail' /></h2>       <!-- 계약상세정보 -->
            <div class="btn_right">
                <button id="btnApproval"  type="button" class="btn_m btn_save">전략출고</button>               <!-- 전략출고 -->
            </div>
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
                        <th scope="row">전략출고 번호</th>        <!-- 전략출고 번호 -->
                        <td>
                            <input id="beContractNo" name="beContractNo" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <input id="contractDt" name="contractDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractType' /></th>              <!-- 계약유형 -->
                        <td>
                            <input id="contractTp" name="contractTp" readonly class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>   <!-- 판매담당자 -->
                        <td>
                            <input id="saleEmpNo" name="saleEmpNo" class="form_comboBox" data-json-obj="true" />
                        </td>

                        <th scope="row"><spring:message code='sal.lbl.payTp' /></th>   <!-- 지불방식 -->
                        <td>
                            <input id="payTp" name="payTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th>      <!-- 인도요청일 -->
                        <td>
                            <input id="dlReqDt" name="dlReqDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약상세정보 -->

    <!-- 고객정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.custinfo' /></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:6%;">
                    <col style="width:10%;">
                    <col style="width:6%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm_01" class="form_input onKey_up onKey_bulr" />
                                        <a href="javascript:bf_searchCustomer('cust', 'vCustNm_01');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_01" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custCd_01" readonly class="form_input form_readonly">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>   <!-- 고객유형 -->
                        <td>
                            <input value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">       <!-- 개인 -->
                        </td>
                        <td colspan="4">
                            <button type="button" class="btn_s" id="btnCrmCustSearch" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='global.btn.search' /></button>   <!-- 조회 -->
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>  <!-- ID유형 -->
                        <td class="readonly_area">
                            <input id="mathDoc_01" readonly class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>   <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_01" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.telNo' /></th>        <!-- 전화번호 -->
                        <td>
                            <input id="telNo1_01" readonly class="form_input form_readonly"/>
                            <input type="hidden" id="telNo2_01">                            <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                        <td>
                            <input id="emailNm_01" readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                        <td>
                            <input id="sungNm_01" readonly class="form_input form_readonly" />
                            <input type="hidden" id="sungCd_01" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                        <td>
                            <input id="cityNm_01" readonly class="form_input form_readonly" />
                            <input type="hidden" id="cityCd_01" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                        <td>
                            <input id="distNm_01" readonly class="form_input form_readonly" />
                            <input type="hidden" id="distCd_01" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.zipCd' /></th>      <!-- 우편번호 -->
                        <td>
                            <input id="zipCd_01" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_01" readonly class="form_input form_readonly" />
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
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:6%;">
                    <col style="width:10%;">
                    <col style="width:6%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm_02" class="form_input onKey_up onKey_bulr">
                                        <a href="javascript:bf_searchCustomer('cust', 'vCustNm_02');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_02" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custCd_02" readonly class="form_input form_readonly" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                        <td>
                            <input value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">        <!-- 법인 -->
                        </td>
                        <td colspan="4">
                            <button type="button" class="btn_s" id="btnCrmCustSearch" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='global.btn.search' /></button>   <!-- 조회 -->
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.corpSsnCrnTp' /></th>       <!-- 법인유형 -->
                        <td>
                            <input id="mathDoc_02" readonly class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>         <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_02" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.telNo' /></th>            <!-- 전화번호 -->
                        <td>
                            <input id="telNo1_02" readonly class="form_input form_readonly" />
                            <input type="hidden" id="telNo2_02" />    <!-- 전화번호2 화면에 없음 -->

                        </td>
                        <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                        <td>
                            <input id="emailNm_02" readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                        <td>
                            <input id="sungNm_02" readonly class="form_input form_readonly" />
                            <input type="hidden" id="sungCd_02" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                        <td>
                            <input id="cityNm_02" readonly class="form_input form_readonly" />
                            <input type="hidden" id="cityCd_02" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                        <td>
                            <input id="distNm_02" readonly class="form_input form_readonly" />
                            <input type="hidden" id="distCd_02" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_02" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.zipCd' /></th>      <!-- 우편번호 -->
                        <td>
                            <input id="zipCd_02" readonly class="form_input form_readonly" />
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
            <div class="btn_right">
                <button id="btnSearch" type="button" class="btn_s"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </div>
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
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>       <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                        <td>
                            <input id="sModelCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                        <td>
                            <input id="sOcnCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>     <!-- 외장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>     <!-- 내장색 -->
                        <td>
                            <input id="sIntColorCd" class="form_comboBox" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt5">
            <div id="subGrid"></div>
        </div>
        <div class="table_form mt10">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:90%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.remark' /></th>        <!-- 비고 -->
                        <td>
                            <textarea id="remark" name="remark" rows="2" cols="" class="form_textarea" data-json-obj="true"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량정보 -->

    <!-- hidden값  -->
    <span style="display:none">
       <!-- 고객유형 -->
       <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

       <!-- 저장 후 선택될 그룹계약번호 -->
       <input id="savedBeContractNo"/>

       <!-- 딜러코드 -->
       <input id="dlrCd" />

    </span>
</form>
</section>

<script>
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
//yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
//HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일

//차종조회
var carLineCdList = [];
var carLineCdObj = {};
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};

// 그리드 OCN 콤보 DataSource
var ocnCdDSList = [];
var ocnCdObj = {};

// 그리드 외장색 콤보 DataSource
var extColorCdDSList = [];
var extColorCdObj = {};

// 그리드 내장색 콤보 DataSource
var intColorCdDSList = [];
var intColorCdObj = {};

//판매사원 리스트
var selectSaleEmpDSList = [];
var selectSaleEmpObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
    selectSaleEmpObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];       // 선출고 판매만.
var contractTpObj = {};        // 그리드용
<c:forEach var="obj" items="${contractTpDS}">
    <c:if test="${obj.cmmCd eq 'P'}">
        sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//지불방식:SAL071
var amtPayTpDSList = [];
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//주요인증문서유형(신분증유형):CRM024
var ssnCrnTpPList = [];        // remark1 - P:개인
var ssnCrnTpCList = [];        // remark1 - C:법인
<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//창고
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 위치
var locCdObj = {};
<c:forEach var="obj" items="${locDSList}">
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
</c:forEach>

//차량상태 SAL001
var carStatCdObj = {};
<c:forEach var="obj" items="${carStatCdDS}">
    carStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 보유상태 SAL149
var ownStatCdObj = {};
<c:forEach var="obj" items="${ownStatCdDS}">
    ownStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//오더유형 SAL137
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var popupWindow;
var dealerSearchPopupWin;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callContractBeforeWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
         ,title:"전략출고상세"    //전략출고상세
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");


    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                fn_mainGridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            if( ($("#sStartContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndContractDt").data("kendoExtMaskedDatePicker").value() == null)
              ||($("#sEndContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartContractDt").data("kendoExtMaskedDatePicker").value() == null)){
              //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.read();
            refreshAll();
        }
   });

   // 전략 출고생성
   $("#btnApproval").kendoButton({
       enable:true,
       click:function(e){

           if( $("#subGrid").data("kendoExtGrid").select().length == 0 ){
               dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
               return false;
           }

           var custTp = $("#custTp").val();
           if( $("#custCd_"+custTp).val() == ""){
               // {고객}를(을) 선택해주세요.:계약고객
               dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");

               $("#tabstrip").data("kendoExtTabStrip").select(0);
               $("#custCd_"+custTp == "" ? "01":custTp).focus();
               return false;
           }

           // 지불방식
           if( $("#payTp").data("kendoExtDropDownList").value() == "" ){
               // {지불방식}를(을) 선택해주세요.
               dms.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
               $("#tabstrip").data("kendoExtTabStrip").select(0);
               $("#payTp").focus();
               return false;
           }

           popupWindow = dms.window.popup({
               windowId:"messagePopup"
               ,title:false
               ,width :300
               ,height:110
               ,content:{
                   url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                   ,data:{
                       "type":null
                       ,"autoBind":false
                           // 전략출고를 하시겠습니까?
                       , msg:"("+$("#grpContractNo").val() +")"+" <spring:message code='sal.info.contractCreateMsg' />"
                       , btnMsg01:"<spring:message code='sal.btn.contractCreate' />"
                       , btnMsg02:"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc":function(data){
                           if (data.msg == "01"){
                               save();      // 저장 & 선출고 처리
                           }else{
                                return false;
                            }
                        }
                   }
               }
           });


       }
   });

   $("#btnRefresh").kendoButton({ // 초기화
       click:function(e){
           refreshAll();
           $("#subGrid").data("kendoExtGrid").dataSource.page(1);
           viewDetailPopup();  // 상세팝업.
       }
   });

   $("#btnCarSearch").kendoButton({   // 차량 - 조회
        click:function(e){

        }
    });

   $("#custTp").val("01");        // 계약자 고객유형

   //판매담당자
   $("#sSaleEmpNo").kendoExtDropDownList({
       dataTextField:"saleEmpNm"
      ,dataValueField:"saleEmpCd"
      ,dataSource:selectSaleEmpDSList
      ,optionLabel:" "
   });

   // 계약 시작일
   $("#sStartContractDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });

   // 계약 종료일
   $("#sEndContractDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

   // 계약시작일은 계약종료일보다 클수가 없다.
   $("#sStartContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);
   $("#sEndContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);


   // 계약일
   $("#contractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

   // 지불방식
   $("#payTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:amtPayTpDSList
      ,optionLabel:" "
      ,index:0
   });

   // 인도요청일
   $("#dlReqDt").kendoExtMaskedDatePicker({
       value:toDay
       ,format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 계약유형
   $("#contractTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:sContractTpList
      ,index:0
   });

   // 판매담당자
   $("#saleEmpNo").kendoExtDropDownList({
       dataTextField:"saleEmpNm"
      ,dataValueField:"saleEmpCd"
      ,dataSource:selectSaleEmpDSList
      ,optionLabel:" "
      ,index:0
   });

   $("#custTpNm").val("<spring:message code='global.lbl.personal' />");     // 개인

   // 개인:신분증유형
   $("#mathDoc_01").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ssnCrnTpPList
      ,optionLabel:" "
   });

   // 법인:법인유형
   $("#mathDoc_02").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ssnCrnTpCList
      ,optionLabel:" "
   });


   //차종
   $("#sCarlineCd").kendoExtDropDownList({
       dataTextField:"carlineNm"
      ,dataValueField:"carlineCd"
      ,dataSource:carLineCdList
      ,optionLabel:" "   // 전체
      ,select:function(e){
          var dataItem = this.dataItem(e.item);
          $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sModelCd").data("kendoExtDropDownList").enable(true);

          $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
          $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

          $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

          $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

          if(dataItem.carlineCd == ""){
              $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sModelCd").data("kendoExtDropDownList").enable(false);
              return false;
          }

          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/cnt/contractBefore/selectModel.do' />"
              ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
              ,async:false
          });
          $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
      }
   });

   // 모델
   $("#sModelCd").kendoExtDropDownList({
       dataTextField:"modelNm"
      ,dataValueField:"modelCd"
      ,optionLabel:" "   // 전체
      ,select:function(e){
          var dataItem = this.dataItem(e.item);
          $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sOcnCd").data("kendoExtDropDownList").enable(true);

          $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

          $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

          if(dataItem.modelCd == ""){
              $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sOcnCd").data("kendoExtDropDownList").enable(false);
              return false;
          }
          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/cnt/contractBefore/selectOcn.do' />"
              ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
              ,async:false
          });
          $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
      }
   });
   $("#sModelCd").data("kendoExtDropDownList").enable(false);

   // ocn
   $("#sOcnCd").kendoExtDropDownList({
        dataTextField: "ocnNm"
       ,dataValueField:"ocnCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(this.dataItem(e.item).ocnCd == ""){
               $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contractBefore/selectExtColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
               ,async:false
           });
           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
   });
   $("#sOcnCd").data("kendoExtDropDownList").enable(false);

   //외장색
   $("#sExtColorCd").kendoExtDropDownList({
        dataTextField: "extColorNm"
       ,dataValueField:"extColorCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           if(this.dataItem(e.item).extColorCd == ""){
               $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contractBefore/selectIntColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
               ,async:false
           });
           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
   });
   $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

   //내장색
   $("#sIntColorCd").kendoExtDropDownList({
        dataTextField: "intColorNm"
       ,dataValueField:"intColorCd"
       ,optionLabel:" "   // 전체
   });
   $("#sIntColorCd").data("kendoExtDropDownList").enable(false);


   // 메인 그리드
   $("#mainGrid").kendoExtGrid({
       gridId:"G-SAL-0831-173321"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/cnt/contractBefore/selectcontractBeforeSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       // 판매사원
                       params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                       // 고객
                       params["sCustNo"] = $("#sContractCustNo").val();
                       // 계약일자
                       params["sStartContractDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                       params["sEndContractDt"]   = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();

                       // 전략출고 계약번호
                       params["sBeContractNo"] = $("#sBeContractNo").val();

                       return kendo.stringify(params);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch:false
           ,schema:{
               model:{
                   id:"grpContractNo",
                   fields:{
                        dlrCd         :{type:"string", editable:false} //딜러코드
                       ,beContractNo  :{type:"string"}                 //선출고계약번호
                       ,saleEmpNo     :{type:"string"}                 //판매담당자
                       ,contractTp    :{type:"string"}                 //계약유형
                       ,custNm        :{type:"string"}                 //고객명
                       ,carCnt        :{type:"number"}                 //차량수량
                       ,regUsrId      :{type:"string"}
                       ,regDt         :{type:"date"}
                   }
               }
           }
       }
       ,dataBound:function(e) {
           // 저장시에만 계약번호가 1회 들어있음.
           var saveContNo = $("#savedBeContractNo").val();

           if(saveContNo != ""){
               var rows = e.sender.tbody.children();

               $.each(rows, function(idx, row){
                   var dataItem = e.sender.dataItem(row);
                   if(dataItem.grpContractNo == saveContNo){
                       fn_mainGridDBclick(dataItem);
                   }
               });
           }
           $("#savedBeContractNo").val("");      // 초기화
       }
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,appendEmptyColumn:true           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,pageable:{
          refresh:true
          ,pageSize:40
          ,pageSizes:[ "40", "80", "100", "200" ]
      }
      ,height:434
      ,editable   :false
      ,resizable:true
      ,autoBind:false
      ,selectable:"row"
      ,navigatable:true
      //,sortable:false
      //,edit:onEditMainCd
      ,columns:[
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}         // 딜러코드
         ,{field:"beContractNo", title:"전략출고번호", width:100}      //전략출고번호
         ,{field:"saleEmpNo", title:"판매담당자", attributes:{"class":"ac"}, width:90}      //판매담당자
         ,{field:"contractTp", title:"<spring:message code='global.lbl.contractType' />", attributes:{"class":"ac"}, width:90, template:"#= dms.string.strNvl(contractTpObj[contractTp])#" }    //계약유형
         ,{field:"custNm", title:"고객명", width:150}             //고객명
         ,{field:"carCnt", title:"<spring:message code='sal.lbl.carCnt' />", attributes:{"class":"ar"}, width:80, format:"{0:n0}"}            //차량수량
         ,{field:"regUsrId", title:"등록자", attributes:{"class":"ar"}, width:80}            //등록자
         ,{field:"regDt", title:"등록일", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}"}      //등록일
      ]
  });

   // 그리드 더블클릭.
  $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
      var grid = $("#contGrid").data("kendoExtGrid");
      var selectedItem = grid.dataItem(grid.select());
      fn_mainGridDBclick(selectedItem);
      viewDetailPopup();
  });


  // 그리드 주문번호 더블클릭.
  fn_mainGridDBclick = function(selectedItem){
      if( selectedItem != null && selectedItem != 'undefined'){

          $("#dlrCd").val(selectedItem.dlrCd);
          $("#beContractNO").val(selectedItem.beContractNO);  // 전략출고 번호
          $("#contractDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractDt);   // 계약일
          $("#contractDt").data("kendoExtMaskedDatePicker").enable(false);                    // 계약일 수정불가
          //fn_btnState(selectedItem.contractStatCd);                                  // 버튼숨김
          $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);       // 계약유형
          $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자
          $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);           // 지불방식
          $("#dlReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.dlReqDt);      // 인도요청일

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
              $("#vCustNm_"+custTp).val(selectedItem.custNm);       // 고객명

              $("#mathDoc_"+custTp).data("kendoExtDropDownList").value(selectedItem.mathDoc); // 신분증유형 / 법인유형
              $("#ssnCrnNo_"+custTp).val(selectedItem.ssnCrnNo);  // 증서번호
              $("#telNo1_"+custTp).val(selectedItem.telNo);       // 전화번호1
              $("#telNo2_"+custTp).val(selectedItem.telNo);       // 전화번호2
              $("#emailNm_"+custTp).val(selectedItem.emailNm);    // 이메일명
              $("#sungCd_"+custTp).val(selectedItem.sungCd);    // 성
              $("#sungNm_"+custTp).val(selectedItem.sungNm);    // 성
              $("#cityCd_"+custTp).val(selectedItem.cityCd);    // 시
              $("#cityNm_"+custTp).val(selectedItem.cityNm);    // 시
              $("#distCd_"+custTp).val(selectedItem.distCd);    // 구
              $("#distNm_"+custTp).val(selectedItem.distNm);    // 구
              $("#zipCd_"+custTp).val(selectedItem.zipCd);      // 우편번호
              $("#addrDetlCont_"+custTp).val(selectedItem.addrDetlCont);   // 상세주소
          }

          $("#remark").val(selectedItem.remark);    // 비고
          $("#subGrid").data('kendoExtGrid').dataSource.read();     // vin 조회
      }
  }

  // 출고가능한 vin grid
  $("#subGrid").kendoExtGrid({
      gridId:"G-SAL-0901-100222"
      ,dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/sal/cnt/contractBefore/selectcontractBeforeItemSearch.do' />"
              },
              parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};
                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      // 딜러코드
                      params["sDlrCd"] = $("#dlrCd").val();
                      // 전략판매 번호
                      params["sBeContractNo"] = $("#beContractNO").val();

                      //console.log('grid params:',kendo.stringify(params) );
                      return kendo.stringify(params);

                  }else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,requestEnd:function(e) {
              if (e.type != "read") {}
          }
          ,schema:{
              model:{
                  id:"carId",
                  fields:{
                      carId:{type:"string", editable:false}  //
                      ,chkYn:{type:"string"}                 //
                      ,vinNo:{type:"string"}                 //vin no
                      ,mmCnt  :{type:"number"}             // 재고월령
                      ,retlPrc  :{type:"number"}           // 구매가격
                      ,carlineNm  :{type:"string"}          // 차종
                      ,modelNm    :{type:"string"}          // 모델
                      ,ocnNm      :{type:"string"}          // OCN
                      ,extColorNm :{type:"string"}          // 외장색명
                      ,intColorNm :{type:"string"}          // 내장색명
                      ,strgeCd  :{type:"string"}            // 창고
                      ,locCd    :{type:"string"}            // 위치
                      ,carStatCd:{type:"string"}            // 차량상태
                      ,ownStatCd:{type:"string"}            // 보유상태
                      ,ordTp    :{type:"string"}            // 주문유형
                      ,grDt     :{type:"date"}              // 입고일
                      ,preGiYn :{type:"string"}             // 선출고여부
                      ,rfidNo :{type:"string"}              // RFID NO
                  }
              }
          }
      }
      ,dataBound:function(e) {
          var rows = e.sender.tbody.children();
      }
     ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
     ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
     ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
     ,appendEmptyColumn:false           //빈컬럼 적용. default:false
     ,enableTooltip:true               //Tooltip 적용, default:false
     ,height:227
     ,editable:false
     ,autoBind:false
     ,navigatable:false
     ,selectable:"multiple, row"
     ,autoBind:false
     ,sortable:false
     ,pageable:{
         refresh:true
         ,pageSize:40
         ,pageSizes:[ "40", "80", "100", "200"]
     }
     ,filterable:false
     ,change:onChangeSelection
     ,columns:[
         {field:"carId", hidden:true}
        , {
            field:"chkYn", title :"<spring:message code='global.lbl.chk' />", width:50
            ,headerAttributes:{"class":"ac"}
            ,attributes:{"class":"ac"}
            ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" name="chkYn" #= chkYn=="Y" ? checked="checked":"" # />'
            ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
        }
        ,{field:"vinNo", title:"VIN NO", width:130, attributes:{"class":"al"}} //vin no
        ,{field:"mmCnt", title:"<spring:message code='global.lbl.stockMonth' />", attributes:{"class":"ar"}, width:80, format:"{0:n0}"} //재고월령
        ,{field:"retlPrc", title:"<spring:message code='sal.lbl.retlPrc' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 구매가격
        ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:140, attributes:{"class":"al"}}    // 차종
        ,{field:"modelNm",       title:"<spring:message code='global.lbl.modelNm' />",      width:140, attributes:{"class":"al"}}    // 모델
        ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:170, attributes:{"class":"al"}}    // OCN
        ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",   width:100, attributes:{"class":"al"}}    // 외장색명
        ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",   width:140, attributes:{"class":"al"}}    // 내장색명
        ,{ // 창고
            field:"strgeCd"
           ,title:"<spring:message code='global.lbl.strge' />"
           ,width:100
           ,attributes:{"class":"al"}
           ,template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"
       }
       ,{ // 위치
            field:"locCd"
           ,title:"<spring:message code='sal.lbl.location' />"
           ,width:100
           ,attributes:{"class":"al"}
           ,template:"#= dms.string.strNvl(locCdObj[locCd]) #"
       }
       ,{field:"carStatCd",     title:"<spring:message code='global.lbl.vinSts' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(carStatCdObj[carStatCd]) #"}       // 차량상태
       ,{field:"ownStatCd",     title:"<spring:message code='global.lbl.ownStatCd' />", width:100, attributes:{"class":"al"}, template:"#= ownStatCdObj[ownStatCd] #"}    // 보유상태
       ,{field:"ordTp",         title:"<spring:message code='global.lbl.orderType' />", width:140, attributes:{"class":"al"}, template:"#= ordTpObj[ordTp] #"}            // 주문유형
       ,{field:"grDt",          title:"<spring:message code='global.lbl.grDt' />", width:100, attributes:{"class":"al"}, format:"{0:"+vDtyyyyMMdd+"}"}     // 입고일
       ,{
           field:"preGiYn", title:"<spring:message code='sal.lbl.preGiYn' />", attributes:{"class":"al"}, width:80
           ,template:"#=dms.string.strNvl(ynObj[preGiYn])#"
       }       // 선출고여부
       ,{field:"rfidNo", title:"<spring:message code='global.lbl.rfidNo' />", width:150}               // RFID NO
     ]
 });

});
/******************************************
 * ready () = End =
 ******************************************/


 /**
  * 그리드 선택 이벤트 핸들러
  */
 onChangeSelection = function(e){
     var rows = e.sender.tbody.find("tr");
     //var rows = $("#"+this.element[0].id).data("kendoGrid").tbody.find("tr");

     rows.each(function(index, row) {
         if($(this).hasClass("k-state-selected")){
             $(this).find(".grid-checkbox-item").prop("checked", true);
         }else{
             $(this).find(".grid-checkbox-item").prop("checked", false);
         }
     });
 }

 /**
 * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
 */
 $(document).on("click", ".grid-checkbox-item", function(e){

     var grid = $("#subGrid").data("kendoExtGrid");
     var row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");

     if($(this).is(":checked")){
         grid.select(row);
     }else{
         $(e.currentTarget).closest("tr").removeClass("k-state-selected");
         $(row).removeClass("k-state-selected");
     }

 });

 $(document).on("click", ".grid-checkAll", function(e){
     var grid = $("#subGrid").data("kendoExtGrid");
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


 // 초기화
function refreshAll() {

    $("#dlrCd").val('');
    $("#beContractNO").val('');  // 전략출고 번호
    $("#savedBeContractNo").val('');
    $("#contractDt").data("kendoExtMaskedDatePicker").value(toDay);        // 계약일
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(true);     // 계약일 수정불가
    $("#contractTp").data("kendoExtDropDownList").select(0);      // 계약유형
    $("#saleEmpNo").data("kendoExtDropDownList").value('');       // 판매담당자
    $("#payTp").data("kendoExtDropDownList").value('');           // 지불방식
    $("#dlReqDt").data("kendoExtMaskedDatePicker").value('');  // 인도요청일


    $("#cust_02").hide();
    $("#cust_01").show();
    $("#custCd_01").val("");     // 고객코드
    $("#custNm_01").val("");     // 고객명
    $("#vCustNm_01").val("");    // 고객명
    $("#mathDoc_01").val("");    //신분증유형
    $("#ssnCrnNo_01").val("");   //증서번호
    $("#telNo1_01").val("");     //전화번호
    $("#telNo2_01").val("");
    $("#emailNm_01").val("");    //이메일
    $("#sungNm_01").val("");
    $("#sungCd_01").val("");
    $("#cityNm_01").val("");
    $("#cityCd_01").val("");
    $("#distNm_01").val("");
    $("#distCd_01").val("");
    $("#zipCd_01").val("");
    $("#addrDetlCont_01").val("");

    $("#custCd_02").val("");      // 고객코드
    $("#custNm_02").val("");      // 고객명
    $("#vCustNm_02").val("");     // 고객명
    $("#mathDoc_02").val("");     //신분증유형
    $("#ssnCrnNo_02").val("");    //증서번호
    $("#telNo1_02").val("");      //전화번호
    $("#telNo2_02").val("");
    $("#emailNm_02").val("");     //이메일
    $("#sungNm_02").val("");
    $("#sungCd_02").val("");
    $("#cityNm_02").val("");
    $("#cityCd_02").val("");
    $("#distNm_02").val("");
    $("#distCd_02").val("");
    $("#zipCd_02").val("");
    $("#addrDetlCont_02").val("");

    $("#remark").val('');    // 비고

    $("#subGrid").data('kendoExtGrid').dataSource.data([]);
}

 //검색조건
 function reSearch(contNo){
     $("#sSaleEmpNo").data("kendoExtDropDownList").value('');      // 판매담당자

     $("#vContractCustNm").val('');      // 고객
     $("#sContractCustNm").val('');      // 고객명
     $("#sContractCustNo").val('');      // 고객번호

     $("#sStartContractDt").data("kendoExtMaskedDatePicker").value('');
     $("#sEndContractDt").data("kendoExtMaskedDatePicker").value('');
 }


/** 무결성 검사 **/
function save_Validate(){

    // 계약일자
    if( $("#contractDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
        $("#contractDt").focus();
        return false;
    }

    // 지불방식
    if( $("#payTp").data("kendoExtDropDownList").value() == "" ){
        // {지불방식}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
        return false;
    }

    // 인도요청일
    if( $("#dlReqDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        $("#dlReqDt").focus();
        return false;
    }

    // 고객코드
    var custTp = $("#custTp").val();
    if( $("#custCd_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요.:계약고객
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        $("#custCd_"+custTp == "" ? "01":custTp).focus();
        return false;
    }
    return true;
}

// 저장 & 선출고 처리
function save(){

    /** 무결성 검사 **/
    if( !save_Validate() ){
       return false;
    }

    var grid = $("#subGrid").data("kendoExtGrid");
    var rows = grid.select();
    var insertList = [];

    if(rows.length  == 0 ){
        dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
        return false;
    }else{
        rows.each(function(index, row) {
           var dataItem = grid.dataItem(row);
           insertList.push(dataItem);
        });
    }

    var param = {
              "beforeVO":$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"))
             , "insertList":insertList
    };

    param.beforeVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();     // 계약일
    param.beforeVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();           // 인도요청일

    $.ajax({
        url:"<c:url value='/sal/cnt/contractBefore/multiContractBefore.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success:function(jqXHR, textStatus) {
            var grid = $("#contGrid").data("kendoExtGrid");
            refreshAll();
            $("#savedBeContractNo").val(jqXHR);   // 저장된 계약번호
            reSearch(jqXHR);                      // 조회조건 세팅
            grid.dataSource.read();
            $("#callContractBeforeWindow").data("kendoWindow").close();

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });

}


//상세내용 팝업 호출
function viewDetailPopup(){
    var win = $("#callContractBeforeWindow").data("kendoWindow").center().open();
}

// 검색조건:계약일자의 시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    //if(dms.string.isEmpty($(this).val())){return;}
    if(dms.string.isEmpty(e.data.from.val())){return;}
    if(dms.string.isEmpty(e.data.to.val())){return;}

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

//CRM 고객 데이터 조회
bf_searchCustomer = function(obCd, sIdNm){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":false
                , "custNm":$("#"+sIdNm).val()
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        //console.log(data);

                        var custTp = data[0].custTp;
                        var custTpNm = "";
                        // 계약고객
                        if(obCd == 'cust'){
                            $("#custTp").val(custTp);

                            if(custTp == "02"){  // 법인
                                $("#cust_01").hide();
                                $("#cust_02").show();
                            }
                            else{            // 개인
                                $("#cust_02").hide();
                                $("#cust_01").show();
                            }

                            $("#custCd_"+custTp).val(data[0].custNo);       // 고객코드
                            $("#custNm_"+custTp).val(data[0].custNm);       // 고객명
                            $("#vCustNm_"+custTp).val(data[0].custNm);       // 고객명

                            $("#mathDoc_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
                            $("#ssnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
                            $("#telNo1_"+custTp).val(data[0].telNo);       // 전화번호1
                            $("#telNo2_"+custTp).val(data[0].telNo);       // 전화번호2
                            $("#emailNm_"+custTp).val(data[0].emailNm);    // 이메일명
                            $("#sungCd_"+custTp).val(data[0].sungCd);    // 성
                            $("#sungNm_"+custTp).val(data[0].sungNm);    // 성
                            $("#cityCd_"+custTp).val(data[0].cityCd);    // 시
                            $("#cityNm_"+custTp).val(data[0].cityNm);    // 시
                            $("#distCd_"+custTp).val(data[0].distCd);    // 구
                            $("#distNm_"+custTp).val(data[0].distNm);    // 구
                            $("#zipCd_"+custTp).val(data[0].zipCd);      // 우편번호
                            $("#addrDetlCont_"+custTp).val(data[0].addrDetlCont);   // 상세주소
                        }
                        else{
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vContractCustNm").val(data[0].custNm);
                        }
                    }
                    popupWindow.close();
                }
            }
        }
    });
}


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
            searchCustEnter(cId);
        }
    }else{
        cleanCustCheck(cId);
    }
});

// 고객명 Enter로 검색
function searchCustEnter(cId){
    var key = "";
    if(cId == "vContractCustNm"){
        key = 'search';
    }else if(cId == "vCustNm_01"){
        key = 'cust';
    }else if(cId == "vCustNm_02"){
        key = 'cust';
    }

    bf_searchCustomer(key, cId);
}

// 고객명 변경시 고객정보 clean
function cleanCustCheck(cId){
    if(cId == "vContractCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
            $("#sContractCustNo").val('');
        }
    }else if(cId == "vCustNm_01"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_01").val()) ){
            $("#custCd_01").val('');       // 고객코드
            $("#mathDoc_01").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#ssnCrnNo_01").val('');  // 증서번호
            $("#telNo1_01").val('');       // 전화번호1
            $("#telNo2_01").val('');       // 전화번호2
            $("#emailNm_01").val('');    // 이메일명
            $("#sungCd_01").val('');    // 성
            $("#sungNm_01").val('');    // 성
            $("#cityCd_01").val('');    // 시
            $("#cityNm_01").val('');    // 시
            $("#distCd_01").val('');    // 구
            $("#distNm_01").val('');    // 구
            $("#zipCd_01").val('');      // 우편번호
            $("#addrDetlCont_01").val('');   // 상세주소
        }
    }else if(cId == "vCustNm_02"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_02").val()) ){
            $("#custCd_02").val('');       // 고객코드
            $("#mathDoc_02").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#ssnCrnNo_02").val('');  // 증서번호
            $("#telNo1_02").val('');    // 전화번호1
            $("#telNo2_02").val('');    // 전화번호2
            $("#emailNm_02").val('');   // 이메일명
            $("#sungCd_02").val('');    // 성
            $("#sungNm_02").val('');    // 성
            $("#cityCd_02").val('');    // 시
            $("#cityNm_02").val('');    // 시
            $("#distCd_02").val('');    // 구
            $("#distNm_02").val('');    // 구
            $("#zipCd_02").val('');      // 우편번호
            $("#addrDetlCont_02").val('');   // 상세주소
        }
    }
}


</script>
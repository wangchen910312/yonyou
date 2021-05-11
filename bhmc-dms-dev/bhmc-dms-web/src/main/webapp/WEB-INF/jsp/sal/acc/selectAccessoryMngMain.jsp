<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 경품판매관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.accessory' /></h1> <!-- 경품정보 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12785" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>               <!-- 상세 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12784" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnRefresh" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>             <!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12783" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>        <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.goodsTp' /></th>     <!-- 경품업무유형 -->
                    <td>
                        <input id="sGoodsTp" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.goodsContractNo' /></th>     <!-- 경품오더번호 -->
                    <td>
                        <input id="sGoodsContractNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.orderDate' /></th>       <!-- 오더일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartGoodsContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndGoodsContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>     <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vsContractCustNm" class="form_input onKey_up onKey_bulr" />
                                    <a href="javascript:bf_searchCustomer('search', 'vsContractCustNm');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.goodsStat' /></th> <!-- 용품상태 -->
                    <td>
                        <input id="sContractStatCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.expcGiEndDt' /></th> <!-- 예정출고일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartExpcGiEndDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndExpcGiEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>     <!-- 계약번호 -->
                    <td>
                        <input id="sSaleContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>        <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" maxlength="17" class="form_input"/>
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 경품판매내역 그리드 시작 -->
    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
    <!-- 경품판매내역 그리드 종료 -->
</section>
</div>

<section id="callAccessoryMngWindow" class="pop_wrap">
    <form id="goodsForm" name="goodsForm" method="POST">

    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12782" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnApplyReq" class="btn_m"><spring:message code='sal.btn.complete' /></button>                   <!-- 완성 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12781" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnApplyCancel" class="btn_m"><spring:message code='ser.btn.cancel' /></button>                  <!-- 취소 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12780" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnPrint" class="btn_m"><spring:message code='sal.btn.accStatPrint' /></button>                  <!-- 정산서출력 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12779" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>               <!-- 저장 -->
            </dms:access>
        </div>
    </div>

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.goodsTp' /></span></th> <!-- 경품업무유형 -->
                    <td>
                        <input id="goodsTp" name="goodsTp" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.goodsContractNo' /></th> <!-- 경품오더번호 -->
                    <td>
                        <input id="goodsContractNo" name="goodsContractNo" type="text" readonly class="form_input form_readonly" data-json-obj="true" />
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>  <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vcontractCustNm" class="form_input onKey_up onKey_bulr" />
                                    <a href="javascript:bf_searchCustomer('cust', 'vcontractCustNm');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    <input id="contractCustNm" name="contractCustNm" type="hidden" data-json-obj="true" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="contractCustNo" name="contractCustNo" readonly class="form_input form_readonly" data-json-obj="true" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.relCustInfo' /></th>    <!-- 연계인 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vpconCustNm" class="form_input onKey_up onKey_bulr" />
                                    <a href="javascript:bf_searchCustomer('pcon', 'vpconCustNm');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    <input id="pconCustNm" type="hidden"/>
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="pconCustNo" name="pconCustNo" readonly class="form_input form_readonly" data-json-obj="true" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.telNo' /></th>   <!-- 전화번호 -->
                    <td>
                        <input id="telNo" name="telNo" type="text" class="form_input" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.brand' /></span></th>    <!-- 브랜드 -->
                    <td>
                        <input id="carBrandCd" name="carBrandCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                    <td>
                        <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="modelCd" name="modelCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                    <td>
                        <input id="ocnCd" name="ocnCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th>  <!-- 외장색 -->
                    <td>
                        <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th>  <!-- 내장색 -->
                    <td>
                        <input id="intColorCd" name="intColorCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>     <!-- VIN NO -->
                    <td>
                        <input id="vinNo" name="vinNo" type="text" class="form_input" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th>    <!-- 차량번호 -->
                    <td>
                        <input id="carRegNo" name="carRegNo" type="text" class="form_input" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.saleContractNo' /></th> <!-- 판매계약번호 -->
                    <td>
                        <input id="saleContractNo" name="saleContractNo" type="text" readonly class="form_input form_readonly" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
<%--
                    <th scope="row"><spring:message code='sal.lbl.expcGiEndsDt' /></th>    <!-- 예정출고완료일 -->
                    <td>
                        <input id="expcGiEndDt" name="expcGiEndDt" class="form_datepicker" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.eqipPrsnId' /></th>  <!-- 설치책임자 -->
                    <td>
                        <input id="eqipPrsnId" name="eqipPrsnId" type="text" class="form_comboBox" data-json-obj="true" />
                    </td>
 --%>
                    <th scope="row"><spring:message code='sal.lbl.paysTp' /></th> <!-- 납부방식 -->
                    <td>
                        <input id="paysTpCb" name="paysTpCb" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.realDlsDt' /></th>   <!-- 완료일자 -->
                    <td class="readonly_area">
                        <input id="realDlDt" name="realDlDt" readonly class="form_datepicker" data-json-obj="true" />
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.goodsTotAmt' /></th>   <!-- 용품합계금액 -->
                    <td>
                        <input id="goodsAmt" name="goodsAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.prenAmt' /></th>   <!-- 증정금액 -->
                    <td>
                        <input id="prenAmt" name="prenAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.addPrenAmt' /></th>   <!-- 추가증정금액 -->
                    <td>
                        <input id="addPrenAmt" name="addPrenAmt" class="form_numeric ar" onfocus="fnOnfocus(this.id);" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.goodsRealAmt' /></th>   <!-- 판매합계금액 -->
                    <td>
                        <input id="goodsRealAmt" name="goodsRealAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.prenSumAmt' /></th>   <!-- 증정합계금액 -->
                    <td>
                        <input id="prenSumAmt" readonly class="form_numeric form_readonly ar">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.custPayAmt' /></th>   <!-- 고객납부금액 -->
                    <td>
                        <input id="custPayAmt" name="custPayAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- hidden값  -->
    <span style="display:none">
        <!-- 상태 -->
        <input id="contractStatCd" name="contractStatCd" type="hidden" data-json-obj="true" />

        <!-- 고객유형 -->
        <input id="contractCustTp" name="contractCustTp" type="hidden" data-json-obj="true" />

        <!-- 할인레벨 코드 -->
        <input id="dcLvlCd" name="dcLvlCd" data-json-obj="true" />

        <!-- 할인승인여부 -->
        <input id="dcApproveYn" name="dcApproveYn" value="N" data-json-obj="true" />

        <!-- 저장 후 선택될 금융관리번호 -->
        <input id="savedGoodsContractNo" />
    </span>
    </form>

    <!-- 경품 세부 내역 그리드 -->
    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12778" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnAdd" type="button"  class="btn_s mt0"><spring:message code='global.btn.rowAdd' /></button>        <!-- 행추가 -->
                </dms:access>
                <dms:access viewId="VIEW-D-12777" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnDel" type="button" class="btn_s mt0"><spring:message code='global.btn.rowDel' /></button>         <!-- 행삭제 -->
                </dms:access>
                <dms:access viewId="VIEW-D-12776" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnCancel" type="button" class="btn_s mt0"><spring:message code='global.btn.cancel' /></button>      <!-- 취소 -->
                </dms:access>
            </div>
        </div>
        <div class="table_grid">
            <div id="itemGrid"></div>
        </div>
    </section>
    <!-- //경품 세부 내역 그리드 -->
</section>
<!-- //경품판매관리 -->


<!-- #스크립트 영역# -->
<script type="text/javascript">
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

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var vCustNo = "";               // 검색 조회 고객

// 경품업무유형:SAL158
var sGoodsTpList = [];
var goodsTpList = [];       // 용품제외
var goodsTpObj = {};
<c:forEach var="obj" items="${goodsTpDS}">
    <c:if test="${obj.cmmCd ne '03' }">
        goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    sGoodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    goodsTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 용품상태 SAL185
var goodsStatList = [];
var goodsStatObj = {};
<c:forEach var="obj" items="${goodsStatDS}">
    goodsStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    goodsStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 브랜드 COM019
var carBrandList = [];
<c:forEach var="obj" items="${carBrandDS}">
    carBrandList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 납부방식:SAL012
var ioTpList = [];
var ioTpObj = {};
<c:forEach var="obj" items="${ioTpDS}">
    ioTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ioTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//할인레벨 :SAL156
var dcLvlCdObj = {};
<c:forEach var="obj" items="${dcLvlCdDS}">
    dcLvlCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//서비스고문
var tecIdList = [];
var tecIdObj = {};
<c:forEach var="obj" items="${serviceAdList}">
    tecIdList.push({tecId:"${obj.tecId}", tecNm:"${obj.tecNm}"});
    tecIdObj["${obj.tecId}"] = "${obj.tecNm}";
</c:forEach>


var popupWindow;

/******************************************
 * ready ()
 ****************************************/
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callAccessoryMngWindow").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.accessory' />"      // 경품정보
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");

    // 상세내용 팝업 호출
    function viewDetailPopup(){
        var win = $("#callAccessoryMngWindow").data("kendoWindow").center().open();
    }

    //버튼 - 상세조회.
    $("#btnViewDetail").kendoButton({
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                refreshAll();
                fn_GridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            var gFromDt = $("#sStartGoodsContractDt").data("kendoExtMaskedDatePicker").value();
            var gToDt = $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(gFromDt, gToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartGoodsContractDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(gToDt, gFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndGoodsContractDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(gFromDt, gToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndGoodsContractDt").focus();
               return false;
            }

            var sFromDt = $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
            var sToDt = $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(sFromDt, sToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartExpcGiEndDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(sToDt, sFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndExpcGiEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(sFromDt, sToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndExpcGiEndDt").focus();
               return false;
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.read();
            refreshAll();
            fn_btnState();  // 버튼상태
        }
    });
    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

            popupWindow = dms.window.popup({
                windowId :"messagePopup"
                ,title :false
                ,width :300
                ,height:110
                ,modal:true
                ,content :{
                    url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                    ,data :{
                        "type" :null
                        ,"autoBind" :false
                        , msg :"<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblSave}' />"
                        , btnMsg01 :"<spring:message code='global.btn.save' />"
                        , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc" :function(data){
                            if (data.msg == "01"){

                                if(dms.string.isNotEmpty($("#saleContractNo").val())){
                                    // 직책별 할인금액 검사 로직 추가
                                    dlGoodsPromotionAmtChk('save');
                                }else{
                                    save('save');
                                }
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });

        }
    });
    // 초기화
    $("#btnRefresh").kendoButton({
        click:function(e){
            refreshAll();
            fn_btnState();  // 버튼상태
            viewDetailPopup();
        }
    });
    //정산서 출력
    $("#btnPrint").kendoButton({
        enable:false,
        click:function(e){
            // 정산서 출력 팝업 호출
            // 정산서 출력 개발진행 예정중입니다.
            alert("<spring:message code='sal.btn.accStatPrint' /> <spring:message code='global.info.developIng' />");
        }
    });

    //출고요청
    $("#btnApplyReq").kendoButton({
        enable:false,
        click:function(e){
            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }
            popupWindow = dms.window.popup({
                windowId :"messagePopup"
                ,title :false
                ,width :300
                ,height:110
                ,modal:true
                ,content :{
                    url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                    ,data :{
                        "type" :null
                        ,"autoBind" :false
                        , msg :"<spring:message code='sal.btn.itemOut' var='salBtnItemOut' /><spring:message code='global.info.cnfrmMsg' arguments='${salBtnItemOut}' />"
                        , btnMsg01 :"<spring:message code='sal.btn.complete' />"
                        , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc" :function(data){
                            if (data.msg == "01"){
                                if(dms.string.isNotEmpty($("#saleContractNo").val())){
                                    //직책별 할인금액 검사 로직 추가
                                    dlGoodsPromotionAmtChk('apply');
                                }else{
                                    save('apply');
                                }
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });
        }
    });

    // 출고취소
    $("#btnApplyCancel").kendoButton({
        enable:false,
        click:function(e){
            $.ajax({
                url:"<c:url value='/sal/acc/accessoryMng/applyCancel.do' />",
                data:JSON.stringify({"sGoodsContractNo":$("#goodsContractNo").val()}),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
                    if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                },
                success:function(jqXHR, textStatus) {
                    var grid = $("#mainGrid").data("kendoExtGrid");
                    refreshAll();
                    reSearch(jqXHR);                       // 조회조건 세팅
                    $("#savedGoodsContractNo").val(jqXHR);   // 저장된 계약번호
                    grid.dataSource.read();
                    $("#callAccessoryMngWindow").data("kendoWindow").close();
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });


    /* 용품 */
    $("#btnAdd").kendoButton({   // 용품 - 행추가
        click:function(e){
            $('#itemGrid').data('kendoExtGrid').dataSource.insert(0, {
                 "dlrCd":""
                ,"goodsContractNo":""
                //,"seq":""
                ,"chk":""
                ,"goodsCd":""
                ,"goodsNm":""
                ,"carlineCd":""
                ,"goodsCnt":""
                ,"goodsUnitCd":""
                ,"retlPrc":""
                ,"dcRate":""
                ,"saleAmt":""
                ,"payTp":$("#paysTpCb").data("kendoExtDropDownList").value()
                ,"dcAmt":""
                ,"totAmt":""
                ,"pkgItemCd":""
                ,"grStrgeCd":""
                ,"giStrgeCd":""
                ,"expcEqipDt":""
                ,"eqipPrsnId":""
                ,"expcEqipDt":""
                ,"eqipEndDt":""
                ,"eqipCostAmt":""
            });
        }
    });

    $("#btnDel").kendoButton({      // 용품 - 행삭제
        click:function(e){
            var grid = $("#itemGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");
            var item;
            var isChk = false, removeRow = [];

            rows.each(function(index, row) {
                if( $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked") ){
                    isChk = true;
                    removeRow.push(row);
                }
            });

            if (!isChk) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return false;
            }

            $.each(removeRow, function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancel").kendoButton({    // 용품 - 취소
        click:function(e) {
            var grid = $("#itemGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");
            var inputRows = grid.tbody.find("tr > td > input");
            var tData;
            var i = 0;
            var arrGoodsList = [];
            rows.each(function(index, row) {
                var rowItem = grid.dataItem(row);
                if(inputRows[index].checked == true){
                    tData = grid.dataItem(rows[index]);
                    arrGoodsList.push({"dlrCd":tData.dlrCd
                                      ,"goodsContractNo":$("#goodsContractNo").val()
                                      ,"carlineCd":tData.carlineCd
                                      ,"goodsCd":tData.goodsCd
                                      ,"goodsNm":tData.goodsNm
                                      ,"goodsCnt":(tData.goodsCnt * -1)
                                      ,"retlPrc":tData.retlPrc
                                      ,"dcRate":tData.dcRate
                                      ,"saleAmt":tData.saleAmt
                                      ,"payTp":tData.payTp
                                      ,"totAmt":(tData.totAmt * -1)
                                      ,"pkgItemCd":tData.pkgItemCd
                                      ,"grStrgeCd":tData.grStrgeCd
                                      ,"giStrgeCd":tData.giStrgeCd
                                      ,"goodsUnitCd":dms.string.strNvl(tData.goodsUnitCd)
                                       });
                    i++;
                }
            });
            var goodsData;
            var length = arrGoodsList.length;
            for(var i = 0; i < length; i++){
                goodsData = arrGoodsList.pop();
                $('#itemGrid').data('kendoExtGrid').dataSource.insert(0, goodsData);
            }
        }
    });

    //경품업무유형
    $("#sGoodsTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:goodsTpList
      ,optionLabel:" "
    });

    //납부방식
    $("#paysTpCb").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ioTpList
      ,optionLabel:""
    });

    // 오더일자 시작일
    $("#sStartGoodsContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 오더일자 종료일
    $("#sEndGoodsContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 예정출고일자 시작일
    $("#sStartExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예정출고일자 종료일
    $("#sEndExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //용품상태
    $("#sContractStatCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:goodsStatList
      ,optionLabel:" "
    });

    //경품업무유형
    $("#goodsTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:goodsTpList
      ,optionLabel:""
    });

    //브랜드
    $("#carBrandCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:carBrandList
      ,optionLabel:" "
      ,select:function(e){
          var dataItem = this.dataItem(e.item);
          //console.log(dataItem.cmmCd);

          if(dataItem.cmmCd == "HD" || dataItem.cmmCd == ""){
              $("#carlineCd").data("kendoExtDropDownList").enable(true);
          }else{
              $("#carlineCd").data("kendoExtDropDownList").setDataSource([]);
              $("#carlineCd").data("kendoExtDropDownList").enable(false);

              $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
              $("#modelCd").data("kendoExtDropDownList").enable(false);

              $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
              $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

              $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#extColorCd").data("kendoExtDropDownList").enable(false);

              $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#intColorCd").data("kendoExtDropDownList").enable(false);
          }
      }
    });

    //차종
    $("#carlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#modelCd").data("kendoExtDropDownList").enable(true);

           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#extColorCd").data("kendoExtDropDownList").enable(false);

           $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#modelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/acc/accessoryMng/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#ocnCd").data("kendoExtDropDownList").enable(true);

           $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#extColorCd").data("kendoExtDropDownList").enable(false);

           $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#ocnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/acc/accessoryMng/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#carlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#extColorCd").data("kendoExtDropDownList").enable(true);

            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#extColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/acc/accessoryMng/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#extColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#intColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/acc/accessoryMng/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#intColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "
    });
    $("#intColorCd").data("kendoExtDropDownList").enable(false);


    // 예정출고완료일
/*     $("#expcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }); */

    //설치책임자
    $("#eqipPrsnId").kendoExtDropDownList({
        dataTextField :"tecNm"
       ,dataValueField:"tecId"
       ,dataSource:tecIdList
       ,optionLabel:" "
    });

    // 완료일
    $("#realDlDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 용품합계금액
    $("#goodsAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2
      ,value:0.00
      ,spinners:false
    });
    $("#goodsAmt").data("kendoExtNumericTextBox").enable(false);

    // 증정금액
    $("#prenAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2
      ,value:0.00
      ,spinners:false
    });
    $("#prenAmt").data("kendoExtNumericTextBox").enable(false);

    // 추가증정금액
    $("#addPrenAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2
      ,value:0.00
      ,spinners:false
    });
    $("#addPrenAmt").on("change", sumItemAmt);

    // 판매합계금액
    $("#goodsRealAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2
      ,value:0.00
      ,spinners:false
    });
    $("#goodsRealAmt").data("kendoExtNumericTextBox").enable(false);

    // 증정합계금액
    $("#prenSumAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2
      ,value:0.00
      ,spinners:false
    });
    $("#prenSumAmt").data("kendoExtNumericTextBox").enable(false);

    // 고객납부금액
    $("#custPayAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2
      ,value:0.00
      ,spinners:false
    });
    $("#custPayAmt").data("kendoExtNumericTextBox").enable(false);

    fn_btnState();

    // 용품번호로 조회
    if("${accessoryMngNo}" != ""){
        reSearch("${accessoryMngNo}");
        $("#savedGoodsContractNo").val("${accessoryMngNo}");
    }

    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-2017-051920"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/accessoryMng/selectAccessoryMngSearch.do' />"
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
                        params["sDlrCd"] = dlrCd;
                        // 경품업무유형
                        params["sGoodsTp"] = $("#sGoodsTp").data("kendoExtDropDownList").value();
                        // 경품오더번호
                        params["sGoodsContractNo"] = $("#sGoodsContractNo").val();
                        // 오더일자
                        params["sStartGoodsContractDt"] = $("#sStartGoodsContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndGoodsContractDt"]   = $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value();
                        // 고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        // 상태
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        //예정출고일자
                        params["sStartExpcGiEndDt"] = $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndExpcGiEndDt"]   = $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value();

                        params["sSaleContractNo"] = $("#sSaleContractNo").val();
                        params["sVinNo"] = $("#sVinNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"goodsContractNo",
                    fields:{
                         dlrCd          :{type:"string", editable:false} // 딜러코드
                        ,goodsContractNo:{type:"string", editable:false} // 용품계약번호
                        ,contractStatCd :{type:"string"}                 // 용품상태
                        ,goodsTp        :{type:"string"}                 // 업무유형
                        ,contractCustNm :{type:"string"}                 // 고객명
                        ,carlineCd      :{type:"string"}                 // 차종
                        ,goodsNm        :{type:"string"}                 // 경품명칭
                        ,goodsCnt       :{type:"number"}                 // 수량
                        ,saleContractNo :{type:"string"}                 // 계약번호
                        ,vinNo          :{type:"string"}                 // vinNo
                    }
                }
            }
        }
        ,dataBound:function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var savedNo = $("#savedGoodsContractNo").val();

            if(savedNo != ""){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.goodsContractNo == savedNo){

                        var selectRow = $("#mainGrid").data("kendoExtGrid").tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                        $("#mainGrid").data("kendoExtGrid").select(selectRow);

                        //fn_GridDBclick(dataItem);
                    }
                });
            }
            $("#savedfincNo").val("");      // 초기화
        }
       ,multiSelectWithCheckbox:false
       ,appendEmptyColumn:true           //빈컬럼 적용
       ,height:435
       ,editable   :false
       ,resizable:true
       ,autoBind:true
       ,selectable:"row"
       ,navigatable:true
       ,columns:[
          {field:"dlrCd",     title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드

          ,{field:"contractStatCd", title:"<spring:message code='sal.lbl.goodsStat'/>"
              ,width:100
              ,attributes:{"class":"ac"}
              ,template:function(dataItem){
                  var spanObj = "";
                  switch(dataItem.contractStatCd){
                      case "10":// save
                          spanObj = "<span class='txt_label bg_blue'>"+dms.string.strNvl(goodsStatObj[dataItem.contractStatCd])+"</span>";
                          break;
                      case "20":// complete
                          spanObj = "<span class='txt_label bg_red'>"+dms.string.strNvl(goodsStatObj[dataItem.contractStatCd])+"</span>";
                          break;
                      default: // ready:request
                          spanObj = "<span class='txt_label bg_gray'>"+dms.string.strNvl(goodsStatObj[dataItem.contractStatCd])+"</span>";
                          break;
                  }
                  return spanObj;
              }
          }

          ,{
              field:"goodsTp", title:"<spring:message code='sal.lbl.goodsTp' />", attributes:{"class":"ac"}, width:90
              , template:"#= dms.string.strNvl(goodsTpObj[goodsTp]) #"
          }  //경품업무유형
          ,{field:"contractCustNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:130}  //고객명
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", attributes:{"class":"ac"}, width:100}  //차종
          ,{field:"goodsContractNo", title:"<spring:message code='sal.lbl.goodsContractNo' />", attributes:{"class":"ac"}, width:140}  //경품오더번호
          ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", attributes:{"class":"al"}, width:250}  //경품명칭
          ,{
              field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", attributes:{"class":"ar"}, width:80
              , format:"{0:n0}"
          }  //수량
          ,{field:"saleContractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"ac"}, width:120} // 계약번호
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"ac"}, width:150} // VIN_NO
       ]
   });

   // 그리드 더블클릭.
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       refreshAll();
       fn_GridDBclick(selectedItem);
       viewDetailPopup();
   });

   // 그리드 더블클릭.
   fn_GridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){

        // 경품업무유형
        if(selectedItem.goodsTp == "03"){       // 용품:03
            $("#goodsTp").data("kendoExtDropDownList").setDataSource(sGoodsTpList);
            $("#goodsTp").data("kendoExtDropDownList").value(selectedItem.goodsTp);
            $("#goodsTp").data("kendoExtDropDownList").enable(false);
        }else{
            $("#goodsTp").data("kendoExtDropDownList").value(selectedItem.goodsTp);
        }

        $("#goodsContractNo").val(selectedItem.goodsContractNo);
        $("#contractStatCd").val(selectedItem.contractStatCd);

        /*
        var parReqStatCd = dms.string.strNvl(selectedItem.parReqStatCd);

        var spanObj = "";
        switch(parReqStatCd){
            case "02":// ok
                spanObj = "<span class='txt_label bg_blue'>"+dms.string.strNvl(partsParReqStatCdMap[parReqStatCd])+"</span>";
                break;
            case "03":// cancel
                spanObj = "<span class='txt_label bg_red'>"+dms.string.strNvl(partsParReqStatCdMap[parReqStatCd])+"</span>";
                break;
            default: // ready:request
                //spanObj = "<span class='txt_label bg_gray'>"+dms.string.strNvl(partsParReqStatCdMap[parReqStatCd])+"</span>";
                break;
        }
        $("#parReqStatCd").html(spanObj);
        */

        fn_btnState(selectedItem.contractStatCd);       // 버튼 상태

        $("#contractCustNo").val(selectedItem.contractCustNo);
        $("#contractCustTp").val(selectedItem.contractCustTp);
        $("#contractCustNm").val(selectedItem.contractCustNm);
        $("#vcontractCustNm").val(selectedItem.contractCustNm);
        $("#pconCustNo").val(selectedItem.pconCustNo);
        $("#pconCustNm").val(selectedItem.pconCustNm);
        $("#vpconCustNm").val(selectedItem.pconCustNm);
        $("#telNo").val(selectedItem.telNo);

        $("#carBrandCd").data("kendoExtDropDownList").value(selectedItem.carBrandCd);
        $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd);

        if(selectedItem.saleContractNo == null){
            $("#btnAdd").data("kendoButton").enable(true);
        }else{
            $("#btnAdd").data("kendoButton").enable(false);
        }

        if(selectedItem.modelCd != null &&  selectedItem.modelCd != ""){
            var modelCd = $("#modelCd").data("kendoExtDropDownList");
            modelCd.setDataSource([{modelNm:selectedItem.modelNm, modelCd:selectedItem.modelCd}]);
            modelCd.enable(true);
            modelCd.value(selectedItem.modelCd); // 모델
        }

        if(selectedItem.ocnCd != null &&  selectedItem.ocnCd != ""){
            var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
            ocnCd.setDataSource([{ocnNm:selectedItem.ocnNm, ocnCd:selectedItem.ocnCd}]);
            ocnCd.enable(true);
            ocnCd.value(selectedItem.ocnCd); // OCN
        }

        if(selectedItem.extColorCd != null &&  selectedItem.extColorCd != ""){
            var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
            extColorCd.setDataSource([{extColorNm:selectedItem.extColorNm, extColorCd:selectedItem.extColorCd}]);
            extColorCd.enable(true);
            extColorCd.value(selectedItem.extColorCd); // 외장색
        }

        if(selectedItem.intColorCd != null &&  selectedItem.intColorCd != ""){
            var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
            intColorCd.setDataSource([{intColorNm:selectedItem.intColorNm, intColorCd:selectedItem.intColorCd}]);
            intColorCd.enable(true);
            intColorCd.value(selectedItem.intColorCd); // 내장색
        }

        $("#vinNo").val(selectedItem.vinNo);
        $("#carRegNo").val(selectedItem.carRegNo);
        $("#saleContractNo").val(selectedItem.saleContractNo);
        //$("#expcGiEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.expcGiEndDt);
        //$("#eqipPrsnId").data("kendoExtDropDownList").value(selectedItem.eqipPrsnId);
        $("#realDlDt").data("kendoExtMaskedDatePicker").value(selectedItem.realDlDt);

        $("#goodsAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.goodsAmt));
        $("#prenAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.prenAmt));
        $("#addPrenAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.addPrenAmt));
        $("#goodsRealAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.goodsRealAmt));
        $("#custPayAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.custPayAmt));
        $("#prenSumAmt").data("kendoExtNumericTextBox").value( (Number(selectedItem.prenAmt) + Number(selectedItem.addPrenAmt)) );

        $("#dcLvlCd").val(selectedItem.dcLvlCd);
        $("#dcApproveYn").val(selectedItem.dcApproveYn);

        // 그리드 조회
        $("#itemGrid").data('kendoExtGrid').dataSource.read();
       }
   }

   // 경품 item 그리드
   $("#itemGrid").kendoExtGrid({
         gridId:"G-SAL-1219-103001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/accessoryMng/selectAccessoryMngItemSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sDlrCd"] = dlrCd;
                        params["sGoodsContractNo"] = $("#goodsContractNo").val();
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
/*             ,batch:false
            ,requestEnd:function(e){
                if(e.type =="read" && e.response.total > 0){
                    //console.log(e.sender._data);
                }
            } */
            ,schema:{
                model:{
                    id:"seq",
                    fields:{
                           dlrCd :{type:"string"}
                         , goodsContractNo :{type:"string"}
                         , seq :{type:"number"}
                         , chk:{type:"string", editable:false}
                         , goodsCd:{type:"string"}
                         , goodsNm:{type:"string"}
                         , carlineCd:{type:"string"}
                         , goodsCnt:{type:"number"}
                         , goodsUnitCd:{type:"string"}
                         , retlPrc:{type:"number"}      //단가
                         , dcRate:{type:"number"}
                         , saleAmt:{type:"number"}      //판매가
                         , payTp:{type:"string"}
                         , dcAmt:{type:"number"}
                         , totAmt:{type:"number"}       //금액
                         , pkgItemCd:{type:"string"}
                         , grStrgeCd:{type:"string"}
                         , giStrgeCd:{type:"string"}
                         , expcEqipDt:{type:"date"}     //예정설치일
                         , eqipPrsnId:{type:"string"}   //설치담당
                         , expcEqipDt:{type:"date"}     //설치완료일
                         , eqipEndDt:{type:"date"}      //출고일
                         , eqipCostAmt:{type:"number"}  //설치비용
                         , realDlDt:{type:"string"}
                    }
                }
            }
            ,aggregate:[
                        { field:"goodsCnt", aggregate:"sum" }
                       ,{ field:"dcAmt", aggregate:"sum" }
                       ,{ field:"eqipCostAmt", aggregate:"sum" }
                       ,{ field:"totAmt", aggregate:"sum"}
             ]
        }
       ,dataBound:function(e) {
           var rows = e.sender.tbody.children();

           var vGoodsAmt   = 0          // 용품금액
             , vSaleAmt    = 0;         // 판매합계금액

            $.each(rows, function(idx, row){
                var item = e.sender.dataItem(row);
                vGoodsAmt += Number(item.retlPrc) * Number(item.goodsCnt);
                vSaleAmt += Number(item.saleAmt) * Number(item.goodsCnt) + Number(item.eqipCostAmt);
            });

            $("#goodsAmt").data("kendoExtNumericTextBox").value(vGoodsAmt);
            $("#goodsRealAmt").data("kendoExtNumericTextBox").value(vSaleAmt);

            sumItemAmt();       // 금액계산
       }
       ,multiSelectWithCheckbox:false
       ,height:214
       ,pageable:false
       ,resizable:true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,sortable:false
       ,filterable:false
       ,edit:function(e){
           var eles = e.container.find("input");

           var fieldName;

           var grid = $("#itemGrid").data("kendoExtGrid");
           var item = grid.dataItem(grid.select());

           if(eles.length > 1){
               fieldName = eles[eles.length-1].getAttribute("name");
           }else{
               fieldName = eles.attr("name");
           }
           var input = e.container.find(".k-input");
           if(fieldName == "goodsNm"){
               this.closeCell();
           }
           if(fieldName == "carlineCd"){
               this.closeCell();
           }
           if(fieldName == "realDlDt"){
               this.closeCell();
           }
           if(fieldName == "saleAmt"){
               this.closeCell();
           }
           if(fieldName == "goodsUnitCd"){
               this.closeCell();
           }
           if(fieldName == "pkgItemCd"){
               this.closeCell();
           }
           if(fieldName == "totAmt"){
               this.closeCell();
           }

           if(fieldName == "goodsCnt"){
               if(item.realDlDt == null){
                   input.blur(function(){
                       var item = e.model;

                       item.set("totAmt", Number(item.saleAmt) * Number(item.goodsCnt));
                       //item.set("dcAmt", (Number(item.retlPrc) * Number(item.goodsCnt)) - Number(item.totAmt));
                       item.set("dirty", true);

                       bf_gridSumGoodsAmt();
                   });
                   input.select();
               }else{
                   this.closeCell();
               }
           }

           if(fieldName == "retlPrc"){
               if(item.realDlDt == null){
                   input.blur(function(){
                       var item = e.model;

                       item.set("dcAmt", (Number(item.dcRate)/100)*Number(item.retlPrc));
                       item.set("saleAmt", Number(item.retlPrc)-Number(item.dcAmt));
                       item.set("totAmt", (Number(item.retlPrc)-((Number(item.dcRate)/100)*Number(item.retlPrc)))* Number(item.goodsCnt));
                       item.set("dirty", true);
                       bf_gridSumGoodsAmt();
                   });
                   input.select();
               }else{
                   this.closeCell();
               }
           }

           if(fieldName == "dcRate"){
               if(item.realDlDt == null){
                   input.blur(function(){
                       var item = e.model;
                       item.set("dcAmt", (Number(item.dcRate)/100)*Number(item.retlPrc));
                       item.set("saleAmt", Number(item.retlPrc)-Number(item.dcAmt));
                       item.set("totAmt", (Number(item.retlPrc)-((Number(item.dcRate)/100)*Number(item.retlPrc)))* Number(item.goodsCnt));
                       item.set("dirty", true);
                       bf_gridSumGoodsAmt();
                   });
                   input.select();
               }else{
                   this.closeCell();
               }
           }

           if(fieldName == "dcAmt"){
               if(item.realDlDt == null){
                   input.blur(function(){
                       var item = e.model;
                       item.set("dcRate", Number(item.dcAmt)/Number(item.retlPrc)*100);
                       item.set("saleAmt", Number(item.retlPrc)-Number(item.dcAmt));
                       item.set("totAmt", (Number(item.retlPrc)-((Number(item.dcRate)/100)*Number(item.retlPrc)))* Number(item.goodsCnt));
                       item.set("dirty", true);
                       bf_gridSumGoodsAmt();
                   });
                   input.select();
               }else{
                   this.closeCell();
               }
           }

           if(fieldName == "eqipCostAmt"){
               if(item.realDlDt == null){
                   input.blur(function(){
                       var item = e.model;
                       item.set("totAmt", (Number(item.retlPrc)-((Number(item.dcRate)/100)*Number(item.retlPrc)))* Number(item.goodsCnt)+Number(item.eqipCostAmt));
                       item.set("dirty", true);
                       bf_gridSumGoodsAmt();
                   });
                   input.select();
               }else{
                   this.closeCell();
               }
           }

           if(fieldName == "eqipPrsnId"){
               if(item.realDlDt != null){
                   this.closeCell();
               }
           }

           if(fieldName == "eqipEndDt"){
               if(item.realDlDt != null){
                   this.closeCell();
               }
           }

           if(fieldName == "expcEqipDt"){
               if(item.realDlDt != null){
                   this.closeCell();
               }
           }
       }
       ,columns:[
            {field:"dlrCd", hidden:true}
           ,{field:"goodsContractNo", hidden:true}
           ,{field:"seq", hidden:true}
           ,{       // 표시
                field:"chk", title:"<spring:message code='global.lbl.chk' />", width:45
               ,headerAttributes:{style:"text-align:center;"}
               ,attributes:{style:"text-align:center;"}
               ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" onclick="bf_checkGrid(this, \'#= pkgItemCd #\')" id="chk" #= chk=="Y"? checked="checked":"" #  />'
            }
           , {field:"goodsCd", title:"*<spring:message code='sal.lbl.goodsCd' />", width:100 //용품코드
               ,attributes:{"class":"ac"}
               ,editor:function(container, options) {
                   if( dms.string.isNotEmpty(options.model.pkgItemCd) ||  Number($("#contractStatCd").val()) >= 20 ){
                       container.context.innerText = dms.string.strNvl(options.model.goodsCd);
                       return;
                   }
                   $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectGoodsSearchPopup();"></a></div>')
                   .appendTo(container);
               }
             }
           ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:150, attributes:{"class":"al"}} //경품명칭
           ,{field:"carlineCd", title:"<spring:message code='sal.lbl.carLineCd' />", width:80, attributes:{"class":"ac"}} //적용차종
           ,{field:"goodsCnt", title:"*<spring:message code='global.lbl.qty' />", width:80, attributes:{"class":"ar"},format:"{0:n0}",footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}} //수량
           ,{field:"goodsUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:70, attributes:{"class":"ac"}} //단위
           ,{field:"retlPrc", title:"<spring:message code='global.lbl.prc' />", width:110, attributes:{"class":"ar"}, format:"{0:n2}"} //단가
           ,{field:"dcRate", title:"<spring:message code='sal.lbl.upgrdRate' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}%"}    //우대율
           ,{field:"dcAmt",  title:"<spring:message code='sal.lbl.upgrdAmt' />",width:90, attributes:{"class":"ar"}, format:"{0:n2}",format:"{0:n0}",footerTemplate:"#=kendo.toString(sum, 'n2')#", footerAttributes:{style:"text-align:right;"}}  //우대가
           ,{field:"saleAmt", title:"<spring:message code='sal.lbl.saleAmt' />", width:110, attributes:{"class":"ar"}, format:"{0:n2}"} //실제판매가
           ,{field:"expcEqipDt", title:"<spring:message code='sal.lbl.expEqipDt' />", width:100, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //예정설치일
           ,{field:"eqipCostAmt",  title:"<spring:message code='sal.lbl.eqipCost' />",width:90, attributes:{"class":"ar"}, format:"{0:n2}",format:"{0:n0}",footerTemplate:"#=kendo.toString(sum, 'n2')#", footerAttributes:{style:"text-align:right;"}}  //설치비용
           ,{field:"eqipPrsnId"
            ,title:"<spring:message code='sal.lbl.eqipEmp' />"
            ,width:90
            ,attributes:{"class":"ac"}
            ,template:"#=dms.string.strNvl(tecIdObj[eqipPrsnId])#"
            ,editor:function (container, options){
                $('<input required name="eqipPrsnId" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoExtDropDownList({
                      valuePrimitive:true
                    , dataTextField: "tecNm"
                    , dataValueField:"tecId"
                    , dataSource:dms.data.cmmCdFilter(tecIdList)
                });
                $('<span class="k-invalid-msg" data-for="eqipPrsnId"></span>').appendTo(container);
            }
           }    //설치담당
           /*            ,{field:"dcAmt", title:"<spring:message code='sal.lbl.upgrdAmt' />", width:80, attributes:{"class":"ar"}
           ,editor:function(container, options){
              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtNumericTextBox({
                  min:0
                  ,max:999999
                  ,format:"n2"                // n0:###,###, n2:###,###.##
                  ,decimals:2                 // 소숫점
                  ,spinners:false

              }); */
           ,{field:"eqipEndDt", title:"<spring:message code='sal.lbl.eqipEndDt' />", width:100, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //설치완료일
           ,{field:"realDlDt", title:"<spring:message code='global.lbl.giDt' />", width:100, attributes:{"class":"ac"}} //출고일
           ,{field:"totAmt", title:"<spring:message code='global.lbl.amt' />", width:110, attributes:{"class":"ar"}, format:"{0:n2}",format:"{0:n0}",footerTemplate:"#=kendo.toString(sum, 'n2')#", footerAttributes:{style:"text-align:right;"}} //총가격
           ,{field:"pkgItemCd", title:"<spring:message code='sal.lbl.pkgItemCd' />", width:120, attributes:{"class":"al"}, format:"{0:n2}"} //패키지번호
           ,{field:"payTp", hidden:true}
           ,{field:"grStrgeCd", hidden:true}
           ,{field:"giStrgeCd", hidden:true}
       ]
   });

});
/******************************************
 * ready () = End =
 ******************************************/

//초기화
function refreshAll() {
    $("#goodsTp").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(goodsTpList));    // 용품항목 제외
    $("#goodsTp").data("kendoExtDropDownList").enable(true);
    $("#goodsTp").data("kendoExtDropDownList").select(0);          //업무유형
    $("#goodsContractNo").val('');
    $("#contractStatCd").val('');
    $("#contractCustNo").val('');
    $("#contractCustTp").val('');
    $("#contractCustNm").val('');
    $("#vcontractCustNm").val('');
    $("#pconCustNo").val('');
    $("#pconCustNm").val('');
    $("#vpconCustNm").val('');
    $("#telNo").val('');

    $("#carBrandCd").data("kendoExtDropDownList").value('');
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

    $("#vinNo").val('');
    $("#carRegNo").val('');
    $("#saleContractNo").val('');
    //$("#expcGiEndDt").data("kendoExtMaskedDatePicker").value('');
    //$("#eqipPrsnId").data("kendoExtDropDownList").value('');

    $("#realDlDt").data("kendoExtMaskedDatePicker").value('');

    $("#goodsAmt").data("kendoExtNumericTextBox").value(0);
    $("#prenAmt").data("kendoExtNumericTextBox").value(0);
    $("#addPrenAmt").data("kendoExtNumericTextBox").value(0);
    $("#goodsRealAmt").data("kendoExtNumericTextBox").value(0);
    $("#custPayAmt").data("kendoExtNumericTextBox").value(0);
    $("#prenSumAmt").data("kendoExtNumericTextBox").value(0);

    $("#dcLvlCd").val('');
    $("#dcApproveYn").val('N');

    // 그리드 조회
    $("#itemGrid").data('kendoExtGrid').dataSource.data([]);
}

// 검색조건
function reSearch(orderNo){
    $("#sGoodsTp").data("kendoExtDropDownList").value('');  // 경품업무유형
    $("#sGoodsContractNo").val(orderNo);      // 경품오더번호
    $("#sStartGoodsContractDt").data("kendoExtMaskedDatePicker").value(oneDay);
    $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value(lastDay);
    $("#sContractCustNo").val('');      //고객
    $("#sContractCustNm").val('');      //고객명
    $("#sContractStatCd").data("kendoExtDropDownList").value('');  // 오더상태
    $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value('');
    $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value('');
    $("#sSaleContractNo").val('');
}

/** 무결성 검사 **/
function save_Validate(){

    if( $("#goodsTp").data("kendoExtDropDownList").value() == "" ){
        // 경품업무유형을 선택하여 주세요.
        dms.notification.info("<spring:message code='sal.lbl.goodsTp' var='saLblGoodsTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${saLblGoodsTp}' />");
        return fasle;
    }

    // 고객코드
    if( $("#contractCustNo").val() == "" ){
        // 고객을 선택하여 주세요.
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        return false;
    }

    // 브랜드
    if( $("#carBrandCd").data("kendoExtDropDownList").value() == "" ){
        // 브랜드을 선택하여 주세요.
        dms.notification.info("<spring:message code='global.lbl.brand' var='globalLblBrand' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblBrand}' />");
        return fasle;
    }

    return true;
}

function save(mFlag){

    if( !save_Validate() ){
       return false;
    }

    dms.loading.show($("#callAccessoryMngWindow"));

    var param = $.extend(
            { "goodsMainVO":$("#goodsForm").serializeObject($("#goodsForm").serializeArrayInSelector("[data-json-obj='true']")) }
            , $("#itemGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
        );

    var dataValidate = false;
    $.each(param.insertList, function(idx, row){
        if(row.goodsCd == ""){
           // 용품코드을 선택하여 주세요.
           dms.notification.info("<spring:message code='sal.lbl.goodsCd' var='salLblGoodsCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblGoodsCd}' />");
           dataValidate = true;
           return false;
        }

        if(Number(row.goodsCnt) == 0){
            // 수량을 선택하여 주세요.
            dms.notification.info("<spring:message code='global.lbl.qty' var='globalLblQty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblQty}' />");
            dataValidate = true;
            return false;
        }
     });
    $.each(param.updateList, function(idx, row){
        if(row.goodsCd == ""){
            // 용품코드을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.goodsCd' var='salLblGoodsCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblGoodsCd}' />");
            dataValidate = true;
            return false;
         }

         if(Number(row.goodsCnt) == 0){
             // 수량을 선택하여 주세요.
             dms.notification.info("<spring:message code='global.lbl.qty' var='globalLblQty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblQty}' />");
             dataValidate = true;
             return false;
         }
    });

    if(dataValidate){ dms.loading.hide($("#callAccessoryMngWindow")); return false; }

    // 계약상태
    if( $("#contractStatCd").val() == "" ){
        param.goodsMainVO.contractStatCd = "10";        // 저장상태
    }

    param.goodsMainVO.goodsTp = $("#goodsTp").data("kendoExtDropDownList").value();
    //param.goodsMainVO.expcGiEndDt = $("#expcGiEndDt").data("kendoExtMaskedDatePicker").value();
    //param.goodsMainVO.realDlDt = $("#realDlDt").data("kendoExtMaskedDatePicker").value();

    param.goodsMainVO.goodsAmt = $("#goodsAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.prenAmt = $("#prenAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.goodsRealAmt = $("#goodsRealAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.addPrenAmt = $("#addPrenAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.custPayAmt = $("#custPayAmt").data("kendoExtNumericTextBox").value();

    $.ajax({
        url:"<c:url value='/sal/acc/accessoryMng/multiAccessoryMng.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error) {
            dms.loading.hide($("#callAccessoryMngWindow"));
            dms.notification.error(error);
        }
        ,success:function(jqXHR, textStatus) {
            dms.loading.hide($("#callAccessoryMngWindow"));

            if(mFlag == "apply"){
                applyReq();
            }else{
                var grid = $("#mainGrid").data("kendoExtGrid");
                refreshAll();
                reSearch(jqXHR);                         // 조회조건 세팅
                $("#savedGoodsContractNo").val(jqXHR);   // 저장된 계약번호
                grid.dataSource.read();

                $("#callAccessoryMngWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        }
    });
}


function applyReq(){

    if( !save_Validate() ){
        return false;
     }

    dms.loading.show($("#callAccessoryMngWindow"));

    var itemGrid = $("#itemGrid").data("kendoExtGrid");
    var rows = itemGrid.tbody.find("tr");
    var itemList = [];

    var dataValidate = false;
    $.each(rows, function(idx, row){
        var item = itemGrid.dataItem(row);

        if(dms.string.strNvl(item.goodsCd) == ""){
            // 용품코드을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.goodsCd' var='salLblGoodsCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblGoodsCd}' />");
            dataValidate = true;
            return false;
         }
    });

    if(dataValidate){ dms.loading.hide($("#callAccessoryMngWindow")); return false; }

    /*
    rows.each(function(index, row){
        var dataItem = itemGrid.dataItem(row);
        itemList.push(dataItem);
    });
    */

    var param = {"goodsMainVO":$("#goodsForm").serializeObject($("#goodsForm").serializeArrayInSelector("[data-json-obj='true']"))
               //, "aItemList":itemList
               };

    // 계약상태
    if( $("#contractStatCd").val() == "" ){
        param.goodsMainVO.contractStatCd = "20";        // 출고요청
    }

    param.goodsMainVO.goodsTp = $("#goodsTp").data("kendoExtDropDownList").value();
    //param.goodsMainVO.expcGiEndDt = $("#expcGiEndDt").data("kendoExtMaskedDatePicker").value();
    param.goodsMainVO.realDlDt = $("#realDlDt").data("kendoExtMaskedDatePicker").value();

    param.goodsMainVO.goodsAmt = $("#goodsAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.prenAmt = $("#prenAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.goodsRealAmt = $("#goodsRealAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.addPrenAmt = $("#addPrenAmt").data("kendoExtNumericTextBox").value();
    param.goodsMainVO.custPayAmt = $("#custPayAmt").data("kendoExtNumericTextBox").value();

    $.ajax({
        url:"<c:url value='/sal/acc/accessoryMng/applyReq.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.loading.hide($("#callAccessoryMngWindow"));
            if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        },
        success:function(jqXHR, textStatus) {
            dms.loading.hide($("#callAccessoryMngWindow"));
            var grid = $("#mainGrid").data("kendoExtGrid");
            refreshAll();
            reSearch(jqXHR);                       // 조회조건 세팅
            $("#savedGoodsContractNo").val(jqXHR);   // 저장된 계약번호
            grid.dataSource.read();

            $("#callAccessoryMngWindow").data("kendoWindow").close();

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }

    });
}


/**
 * 버튼 상태관리
 */
function fn_btnState(state){
    switch(state){
        case '10':         // 저장
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnApplyReq").data("kendoButton").enable(true);
            $("#btnApplyCancel").data("kendoButton").enable(false);
            $("#btnRefresh").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);

            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            break;
        case '20':         // 출고신청
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnApplyReq").data("kendoButton").enable(false);
            $("#btnApplyCancel").data("kendoButton").enable(true);
            $("#btnRefresh").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);

            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDel").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            break;
        default :
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnApplyReq").data("kendoButton").enable(false);
            $("#btnApplyCancel").data("kendoButton").enable(false);
            $("#btnRefresh").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);

            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            break;
    }
}

/**
 * 용품 직책별 할인금액 관리
 */
function dlGoodsPromotionAmtChk(mFlag){

    dms.loading.show($("#callAccessoryMngWindow"));
    var param = {
            "sSaleContractNo" :$("#saleContractNo").val()
            , "sPrenSumAmt" :Number($("#prenSumAmt").data("kendoExtNumericTextBox").value())
    }

    $.ajax({
        url :"<c:url value='/sal/acc/accessoryMng/selectDlrGoodsDcLevel.do' />"
        ,data :JSON.stringify(param)
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,async :false
        ,error :function(jqXHR,status,error) {
            dms.loading.hide($("#callAccessoryMngWindow"));
            dms.notification.error(error);
        }
        ,success :function(jqXHR, textStatus) {
            dms.loading.hide($("#callAccessoryMngWindow"));
           if(jqXHR != null && jqXHR.total > 0
             && dms.string.strNvl(jqXHR.data[0].prcNregYn) == "Y" && dms.string.isNotEmpty(jqXHR.data[0].dcLvlCd) ){

               if(!confirm("["+ dms.string.strNvl(dcLvlCdObj[jqXHR.data[0].dcLvlCd]) +"] <spring:message code='sal.lbl.dcLvMsg' /> \n <spring:message code='sal.lbl.isContinueMsg' />")){
                   return false;
               }
               $("#dcLvlCd").val(jqXHR.data[0].dcLvlCd);
               $("#dcApproveYn").val("Y");
               save(mFlag);

           }else{
               save(mFlag);
           }
        }
    });

}


// item 가격 계산
sumItemAmt = function(){
    var vGoodsAmt   = 0          // 용품금액
      , vSaleAmt    = 0          // 판매합계금액
      , vPrenAmt    = 0          // 증정금액
      , vAddPrenAmt = 0          // 추가증정금액
      , vPrenSumAmt = 0          // 증정합계금액
      , vCustPayAmt = 0;         // 고객납부금액

    vGoodsAmt   = $("#goodsAmt").data("kendoExtNumericTextBox").value();
    vSaleAmt    = $("#goodsRealAmt").data("kendoExtNumericTextBox").value();
    vPrenAmt    = $("#prenAmt").data("kendoExtNumericTextBox").value();
    vAddPrenAmt = $("#addPrenAmt").data("kendoExtNumericTextBox").value();
    vPrenSumAmt = vPrenAmt + vAddPrenAmt;
    vCustPayAmt = vSaleAmt - vPrenSumAmt;

    $("#prenSumAmt").data("kendoExtNumericTextBox").value(vPrenSumAmt);
    $("#custPayAmt").data("kendoExtNumericTextBox").value(vCustPayAmt);
}

//용품Grid 수량 및 값 입력시 계산.
bf_gridSumGoodsAmt = function(){
     var grid = $("#itemGrid").data("kendoExtGrid");
     var rows = grid.tbody.find("tr");
     var oItem, oGoodsAmt = 0, oSaleAmt = 0, oPrenAmt = 0;

     rows.each(function(index, row) {
         oItem = grid.dataItem(rows[index]);

        if(oItem.retlPrc != null){
           oGoodsAmt += Number(oItem.retlPrc) * Number(oItem.goodsCnt);
        }

        if(oItem.saleAmt != null){
           oSaleAmt += Number(oItem.saleAmt) * Number(oItem.goodsCnt) + Number(oItem.eqipCostAmt);
        }

        if(oItem.dcAmt != null){
            oPrenAmt += Number(oItem.dcAmt);
        }

     });

    $("#goodsAmt").data("kendoExtNumericTextBox").value(oGoodsAmt);
    $("#goodsRealAmt").data("kendoExtNumericTextBox").value(oSaleAmt);
    $("#prenAmt").data("kendoExtNumericTextBox").value(oPrenAmt);

    sumItemAmt();
}

//용품조회
selectGoodsSearchPopup = function(){

    popupWindow = dms.window.popup({
        windowId:"GoodsItemSearchPopup"
        ,width:700
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":dlrCd
                ,"callbackFunc":function(data, type){
                    var tData = {};
                    var grid = $("#itemGrid").data("kendoExtGrid");
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
                                    dms.notification.info("<spring:message code='sal.info.IsPackageMsg'/>");
                                    return false;
                                }
                                selectItem.set("dlrCd", dlrCd);
                                selectItem.set("goodsContractNo", $("#goodsContractNo").val());
                                selectItem.set("carlineCd", tData.carlineCd);
                                selectItem.set("goodsCd", tData.itemCd);
                                selectItem.set("goodsNm", tData.itemNm);
                                selectItem.set("goodsCnt", 1);
                                selectItem.set("retlPrc", Number(tData.itemPrc));
                                selectItem.set("dcRate", Number(tData.pkgDetlDcRate));
                                selectItem.set("saleAmt", Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) );
                                selectItem.set("payTp", $("#paysTpCb").data("kendoExtDropDownList").value() );
                                selectItem.set("totAmt", (Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) ) * 1 );
                                selectItem.set("pkgItemCd", pkgItemCd);
                                selectItem.set("grStrgeCd",   tData.grStrgeCd);
                                selectItem.set("giStrgeCd",   tData.giStrgeCd);
                                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd:tData.itemUnitCd);
                                selectItem.set("expcEqipDt", "");
                                selectItem.set("eqipPrsnId", "");
                                selectItem.set("expcEqipDt", "");
                                selectItem.set("eqipEndDt", "");
                                selectItem.set("eqipCostAmt", 0);
                                selectItem.set("dcAmt", 0);
                                selectItem.set("dirty", true);
                            }else{
                                grid.dataSource.insert(rowNum+i, {
                                    "dlrCd":dlrCd
                                    //,"seq":""
                                    ,"goodsContractNo":$("#goodsContractNo").val()
                                    ,"carlineCd":tData.carlineCd
                                    ,"goodsCd":tData.itemCd
                                    ,"goodsNm":tData.itemNm
                                    ,"goodsCnt":1
                                    ,"retlPrc":Number(tData.itemPrc)
                                    ,"dcRate":Number(tData.pkgDetlDcRate)
                                    ,"saleAmt":Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) )
                                    ,"payTp":$("#paysTpCb").data("kendoExtDropDownList").value()
                                    ,"totAmt":( Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) ) * 1
                                    ,"pkgItemCd":pkgItemCd
                                    ,"grStrgeCd":tData.grStrgeCd
                                    ,"giStrgeCd":tData.giStrgeCd
                                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd:tData.itemUnitCd
                                    ,"expcEqipDt":""
                                    ,"eqipPrsnId":""
                                    ,"expcEqipDt":""
                                    ,"eqipEndDt":""
                                    ,"eqipCostAmt":0
                                    ,"dcAmt":0
                                })
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
                                selectItem.set("goodsContractNo", $("#goodsContractNo").val());
                                selectItem.set("carlineCd", tData.carlineCd);
                                selectItem.set("goodsCd", tData.itemCd);
                                selectItem.set("goodsNm", tData.itemNm);
                                selectItem.set("goodsCnt", 1);
                                selectItem.set("retlPrc", Number(tData.salePrcAmt));
                                selectItem.set("dcRate", 0);
                                selectItem.set("saleAmt", Number(tData.salePrcAmt) );
                                selectItem.set("payTp", $("#paysTpCb").data("kendoExtDropDownList").value() );
                                selectItem.set("totAmt", Number(tData.salePrcAmt) * 1 );
                                selectItem.set("pkgItemCd", "");
                                selectItem.set("grStrgeCd",   tData.grStrgeCd);
                                selectItem.set("giStrgeCd",   tData.giStrgeCd);
                                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) );
                                selectItem.set("expcEqipDt", "");
                                selectItem.set("eqipPrsnId", "");
                                selectItem.set("expcEqipDt", "");
                                selectItem.set("eqipEndDt", "");
                                selectItem.set("eqipCostAmt", 0);
                                selectItem.set("dcAmt", 0);
                                selectItem.set("dirty", true);
                            }else{
                                grid.dataSource.insert(rowNum+i, {
                                    "dlrCd":dlrCd
                                    //,"seq":""
                                    ,"goodsContractNo":$("#goodsContractNo").val()
                                    ,"carlineCd":tData.carlineCd
                                    ,"goodsCd":tData.itemCd
                                    ,"goodsNm":tData.itemNm
                                    ,"goodsCnt":1
                                    ,"retlPrc":Number(tData.salePrcAmt)
                                    ,"dcRate":0
                                    ,"saleAmt":Number(tData.salePrcAmt)
                                    ,"payTp":$("#paysTpCb").data("kendoExtDropDownList").value()
                                    ,"totAmt":( Number(tData.salePrcAmt) * 1)
                                    ,"pkgItemCd":""
                                    ,"grStrgeCd":tData.grStrgeCd
                                    ,"giStrgeCd":tData.giStrgeCd
                                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd)
                                    ,"expcEqipDt":""
                                    ,"eqipPrsnId":""
                                    ,"expcEqipDt":""
                                    ,"eqipEndDt":""
                                    ,"eqipCostAmt":0
                                    ,"dcAmt":0
                                })
                            }
                        }
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

// 동일 패키지 체크 표시 및 해제.
bf_checkGrid = function (obj, pkgItemCd){

    /*if(pkgItemCd != ""){
        var grid = $("#itemGrid").data("kendoExtGrid");
        var rows = grid.tbody.find("tr");
        var inputRows = grid.tbody.find("tr > td > input");

        rows.each(function(index, row) {
            var rowItem = grid.dataItem(row);
            if(pkgItemCd == rowItem.pkgItemCd){
                inputRows[index].checked = obj.checked;
            }
        });
    }*/
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
    if(cId == "vsContractCustNm"){
        key = 'search';
    }else if(cId == "vcontractCustNm"){
        key = 'cust';
    }else if(cId == "vpconCustNm"){
        key = 'pcon';
    }

    bf_searchCustomer(key, cId);
}

//고객명 변경시 고객정보 clean
function cleanCustCheck(cId){
    if(cId == "vsContractCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
            $("#sContractCustNo").val('');
            $("#sContractCustNm").val('');
        }
    }else if(cId == "vcontractCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#contractCustNm").val()) ){
            $("#contractCustNo").val('');       // 고객코드
            $("#contractCustTp").val('');
            $("#contractCustNm").val('');
            $("#telNo").val('');
        }
    }else if(cId == "vpconCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#pconCustNm").val()) ){
            $("#pconCustNo").val('');       // 고객코드
            $("#pconCustNm").val('');
        }
    }
}


//CRM 고객 데이터 조회
bf_searchCustomer = function(obCd, sIdNm){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        //, draggable:false
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":$("#"+sIdNm).val()
                , "closeYn":"Y"
                , "type":null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        // 계약고객
                        if(obCd == 'cust'){
                            $("#contractCustNo").val(data[0].custNo);       // 고객코드
                            $("#contractCustTp").val(data[0].custTp);       // 고객유형
                            $("#contractCustNm").val(data[0].custNm);       // 고객명
                            $("#vcontractCustNm").val(data[0].custNm);       // 고객명

                            if( dms.string.strNvl(data[0].telNo) == "" ){
                                $("#telNo").val(dms.string.strNvl(data[0].hpNo));
                            }else{
                                $("#telNo").val(data[0].telNo);       // 전화번호
                            }
                        }
                        else if(obCd == 'pcon'){
                            $("#pconCustNo").val(data[0].custNo);           // 고객코드
                            $("#pconCustNm").val(data[0].custNm);           // 고객명
                            $("#vpconCustNm").val(data[0].custNm);           // 고객명
                        }       // 검색
                        else{
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vsContractCustNm").val(data[0].custNm);       // 고객명
                        }
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

fnOnfocus = function(id){
    $("#"+ id +" ").select();
}

//-->
</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
        <input type="hidden" id="roDocNo" name="roDocNo" data-json-obj="true">
        <!-- 보증현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <%-- <dms:access viewId="VIEW-D-12986" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                    </dms:access> --%>
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </div>
                <div class="btn_right">
                    <%-- <dms:access viewId="VIEW-D-11601" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                        <button type="button" class="btn_m" id="btnExcelExport2"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11600" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access> --%>
                    <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                </div>
            </div>
            <form id="form">
                <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup id="roStatColCroup">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.dlrCd' /><!-- 딜러코드 --></th>
                                <td>
                                    <input type="text" id="sDlrCd" class="form_input">
                                </td>
                                <th></th><td></td>
                                <th></th><td></td>
                                <th></th><td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                                <td>
                                    <input type="text" id="sCarRegNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDocNo' /><!-- RO번호 --></th>
                                <td>
                                    <input type="text" id="sRoDocNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                                <td>
                                    <input id="sRoTp" data-type="multicombo" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- RO일자 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRoFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRoToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                             </tr>
                             <tr>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                                <td>
                                    <input type="text" id="sVinNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roWrtrNm' /><!-- 정비위탁자 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sRegUsrNm" class="form_input">
                                        <a href="javascript:userSearch();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roStatus' /><!-- RO 상태 --></th>
                                <td>
                                    <input type="text" id="sRoStatCd" name="sRoStatCd" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.expcDlvDt' /></th><!-- 예정인도시간 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sExpcDlFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sExpcDlToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 차량소유자 --></th>
                                <td>
                                    <input type="text" id="sCarOwnerNm" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.settlement' /><!-- 정비정산자 --></th>
                                <td>
                                    <input type="text" id="sCalcPrsnNm" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.calcNo' /><!-- 결제문서번호 --></th>
                                <td>
                                    <input type="text" id="sCalcDocNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carSaleDt' /></th><!-- 차량판매일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sCustSaleFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sCustSaleToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.salDlrComp' /><!-- 판매딜러 --></th>
                                <td>
                                    <input type="text" id="sOrdDlrCd" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.bmMembNo' /><!-- BM회원번호 --></th>
                                <td>
                                    <input type="text" id="sBlueMembershipNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.dlrRoTp' /><!-- 자체RO유형 --></th>
                                <td>
                                    <input id="sDlrRoTp" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payEndDt' /></th><!-- 지불완료시간 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sPayEndFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sPayEndToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="table_grid mt10" id="table_gridForiPad">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>
        <!-- 일반 -->
        <div id="tabstrip2" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                <li class="k-state-active"><spring:message code="ser.lbl.rpipProject" /><!-- 정비항목 --></li>
                <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                <li><spring:message code="ser.lbl.calcCost" /><!-- 정산비용 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 고객요청사항 & 고장설명 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp" />
            <!-- //고객요청사항 & 고장설명 -->

            <!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrList.jsp" />
            <!-- //정비항목 -->

            <!-- 부품 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
            <!-- //부품 -->

            <!-- 기타 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->

            <!-- 비용 -->
            <div style="height:205px;">
                <div class="table_list table_list_v1">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"><spring:message code="ser.lbl.calcCost" /></th>      <!--정산비용  -->
                                <th scope="col"><spring:message code="ser.lbl.calcAmt" /></th>       <!--정산금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dcRate" /></th>        <!--할인율  -->
                                <th scope="col"><spring:message code="ser.lbl.dcAmt" /></th>         <!--할인금액  -->
                                <th scope="col"><spring:message code="ser.lbl.whDcAmt" /></th>       <!--할인후금액  -->
                                <th scope="col"><spring:message code="ser.lbl.bmPointUseAmt" /></th> <!--BM포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.bmCupnUseAmt" /></th>  <!--BM쿠폰사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dlrPointUseAmt" /></th><!--회원포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.etcSaleAmt" /></th>    <!--기타혜택금액  -->
                                <th scope="col"><spring:message code="ser.lbl.finalCalcAmt" /></th>  <!--최종정산금액  -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcLbrSubAmt" /></th><!--공임비소계  -->
                                <td class="ar child_borderNone"><input id="lbrCalcAmt" name="lbrCalcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrDcRate" name="lbrDcRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrDcAmt" name="lbrDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrWhDcAmt" name="lbrWhDcAmt" class="form_numeric ar" readonly="readonly" /></td>
                                <td class="ar child_borderNone"><input id="lbrBmPointUseAmt" name="lbrBmPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrBmCupnUseAmt" name="lbrBmCupnUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrPointUseAmt" name="lbrPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrEtcDcAmt" name="lbrEtcDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lbrCalcSumAmt" name="lbrCalcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcParSubCamt" /></th><!--부품비소계  -->
                                <td class="ar child_borderNone"><input id="parCalcAmt" name="parCalcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parDcRate" name="parDcRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parDcAmt" name="parDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parWhDcAmt" name="parWhDcAmt" class="form_numeric ar" readonly="readonly" /></td>
                                <td class="ar child_borderNone"><input id="parBmPointUseAmt" name="parBmPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parBmCupnUseAmt" name="parBmCupnUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parPointUseAmt" name="parPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parEtcDcAmt" name="parEtcDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="parCalcSumAmt" name="parCalcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcEtcSubAmt" /></th><!--기타비용소계  -->
                                <td class="ar child_borderNone"><input id="etcCalcAmt" name="etcCalcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="etcDcRate" name="etcDcRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="etcDcAmt" name="etcDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="etcWhDcAmt" name="etcWhDcAmt" class="form_numeric ar" readonly="readonly" /></td>
                                <td class="ar child_borderNone"><input id="etcBmPointUseAmt" name="etcBmPointUseAmt" class="form_numeric ar" readonly="readonly"/></td>
                                <td class="ar child_borderNone"><input id="etcBmCupnUseAmt" name="etcBmCupnUseAmt" class="form_numeric ar" readonly="readonly"/></td>
                                <td class="ar child_borderNone"><input id="etcPointUseAmt" name="etcPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="etcOtherDcAmt" name="etcOtherDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="etcCalcSumAmt" name="etcCalcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcSerTotAmt" /></th><!--서비스총계  -->
                                <td class="ar child_borderNone"><input id="calcTotAmt" name="calcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="dcTotRate" name="dcTotRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="dcTotAmt" name="dcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="dcWhTotDcAmt" name="dcWhTotDcAmt" class="form_numeric ar" readonly="readonly" /></td>
                                <td class="ar child_borderNone"><input id="bmPointTotAmt" name="bmPointTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="bmCupnTotAmt" name="bmCupnTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="pointTotAmt" name="pointTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="etcTotAmt" name="etcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                                <td class="ar child_borderNone"><input id="lastCalcTotAmt" name="lastCalcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //정산비용 -->
        </div>
        <!-- //일반 -->
        <div id="excelProgress" class="demo-section k-content mt10">
            <h4>Excel Export</h4>
            <div id="progressBar"></div>
        </div>
    </div>
</div>

<!-- script -->
<script>

var userSearchPopupWin;

var isTablet="${isTablet}";
if(isTablet == "true"){
    _width=950;//tablet
    _height=600;//tablet
}
var sDlrCd;


//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

/** RO 상태 **/
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
    <c:if test="${obj.cmmCd ne '07'}">  // 정산취소(07)
    roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

//공통코드:RO취소구분
var roCancCdList = [];
<c:forEach var="obj" items="${roCancCdList}">
roCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roCancCdMap = dms.data.arrayToMap(roCancCdList, function(obj){return obj.cmmCd;});

//공통코드:자체정의RO유형
var dlrRoTpCdList = [];
<c:forEach var="obj" items="${dlrRoTpCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
        dlrRoTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var dlrRoTpCdMap = dms.data.arrayToMap(dlrRoTpCdList, function(obj){return obj.cmmCd;});

//공통코드:사용여부
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd;});

//자체정의RO유형
dlrRoTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(dlrRoTpCdMap[val] != undefined)
        returnVal = dlrRoTpCdMap[val].cmmCdNm;
    }
    return returnVal;
}

//RO취소구분
roCancCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roCancCdMap[val] != undefined)
        returnVal = roCancCdMap[val].cmmCdNm;
    }
    return returnVal;
}

// 상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
}

// RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}

//캠페인유형
crTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(crTpMap[val] != undefined)
        returnVal = crTpMap[val].cmmCdNm;
    }
    return returnVal;
}

//사용여부
setUseYnCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(useYnMap[val] != undefined)
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    $(document).on("click", ".linkRoDocNo", function(e){
        var grid = $("#gridHeader").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.roCreate' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do'/>?roDocNo="+selectedVal.roDocNo+"&infoType=RO", "VIEW-D-10337"); // RO Main
    });

    $("#tabstrip, #tabstrip2").kendoExtTabStrip({
        animation:false
    });

    // 정산공임비소계
    $("#lbrCalcAmt, #lbrDcRate, #lbrDcAmt, #lbrWhDcAmt, #lbrBmPointUseAmt, #lbrBmCupnUseAmt, #lbrPointUseAmt, #lbrEtcDcAmt, #lbrCalcSumAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 정산부품비소계
    $("#parCalcAmt, #parDcRate, #parDcAmt, #parWhDcAmt, #parBmPointUseAmt, #parBmCupnUseAmt, #parPointUseAmt, #parEtcDcAmt, #parCalcSumAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 정산기타비소계
    $("#etcCalcAmt, #etcDcRate, #etcDcAmt, #etcWhDcAmt, #etcBmPointUseAmt, #etcBmCupnUseAmt, #etcPointUseAmt, #etcOtherDcAmt, #etcCalcSumAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 정산정비총비용
    $("#calcTotAmt, #dcTotRate, #dcTotAmt, #dcWhTotDcAmt, #bmPointTotAmt, #bmCupnTotAmt,#pointTotAmt, #etcTotAmt, #lastCalcTotAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // RO유형
    /* $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:" "
        ,index:0
    }); */

    $("#sRoTp").kendoExtMultiSelectDropDownList({
        dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,index:0
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectRoTp = e.dataItem.cmmCd;

            if(dms.string.isEmpty(selectRoTp)){
                $("#sRoTp").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sRoTp").data("kendoExtMultiSelectDropDownList").value([]);
            }
        }
    });

    // RO상태
    $("#sRoStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // 자체RO유형
    $("#sDlrRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dlrRoTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // Excel Export 상태바
    $("#progressBar").kendoProgressBar({
        min: 0,
        max: 100,
        type: "percent",
        change: onChange,
        complete: onComplete
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
            serviceJs.commonListInit();     // service 공통 JS
        }
    });

    //초기화
    $("#btnReset").kendoButton({
        click:function(e){

            $("#form").get(0).reset();
            initAll();
            $("#sRoTp").data("kendoExtMultiSelectDropDownList").refresh();
            $("#sRoTp").data("kendoExtMultiSelectDropDownList").value([]);
            $("#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sRoFromDt}");
            $("#sRoToDt").data("kendoExtMaskedDatePicker").value("${sRoToDt}");
            $("#btnSearch").click();

        }
    });

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoFromDt}"
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoToDt}"
    });

    // 예상인도 일자
    $("#sExpcDlFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // 예상인도 일자
    $("#sExpcDlToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // 차량판매일
    $("#sCustSaleFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // 차량판매일
    $("#sCustSaleToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // 지불완료시간
    $("#sPayEndFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // 지불완료시간
    $("#sPayEndToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1026-000001"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersList.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"]        = $("#sDlrCd").val();
                            params["sCarRegNo"]     = $("#sCarRegNo").val();
                            params["sRoStatCd"]     = $("#sRoStatCd").val();
                            params["sRegUsrNm"]     = $("#sRegUsrNm").val();
                            params["sVinNo"]        = $("#sVinNo").val();
                            params["sRoDocNo"]      = $("#sRoDocNo").val();
                            //params["sRoTp"]         = $("#sRoTp").val();

                            var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
                            if(dms.string.isEmpty(sRoTpList[0])){
                                sRoTpList.splice(0,1);
                            }
                            params["sRoTpList"]     = sRoTpList;

                            params["sExpcDlToDt"]   = $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value();
                            params["sExpcDlFromDt"] = $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoFromDt"]     = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoToDt"]       = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                            params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
                            params["sCalcPrsnNm"]   = $("#sCalcPrsnNm").val();
                            params["sCalcDocNo"]    = $("#sCalcDocNo").val();
                            params["sDlrRoTp"]      = $("#sDlrRoTp").val();

                            params["sOrdDlrCd"]         = $("#sOrdDlrCd").val();
                            params["sBlueMembershipNo"] = $("#sBlueMembershipNo").val();
                            params["sCustSaleFromDt"]   = $("#sCustSaleFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sCustSaleToDt"]     = $("#sCustSaleToDt").data("kendoExtMaskedDatePicker").value();
                            params["sPayEndFromDt"]     = $("#sPayEndFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sPayEndToDt"]       = $("#sPayEndToDt").data("kendoExtMaskedDatePicker").value();

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
                            ,roDocNo:{type:"string", editable:false}
                            ,roDt:{type:"date"}
                            ,roPrintDt:{type:"date"}
                            ,calcDt:{type:"date"}
                            ,expcDlDt:{type:"date"}
                            ,updtDt:{type:"date"}
                            ,calcRegDt:{type:"date"}
                            ,roCancDt:{type:"date"}
                            ,roDtFormat:{type:"date"}
                            ,roPrintDtFormat:{type:"date"}
                            ,calcDtFormat:{type:"date"}
                            ,expcDlDtFormat:{type:"date"}
                            ,updtDtFormat:{type:"date"}
                            ,calcRegDtFormat:{type:"date"}
                            ,roCancDtFormat:{type:"date"}
                            ,custSaleDt:{type:"date"}
                            ,payEndDt:{type:"date"}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                                elem.roPrintDtFormat = kendo.parseDate(elem.roPrintDt, "<dms:configValue code='dateFormat' />");
                                elem.calcDtFormat = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                                elem.expcDlDtFormat = kendo.parseDate(elem.expcDlDt, "<dms:configValue code='dateFormat' />");
                                elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                                elem.calcRegDtFormat = kendo.parseDate(elem.calcRegDt, "<dms:configValue code='dateFormat' />");
                                elem.roCancDtFormat = kendo.parseDate(elem.roCancDt, "<dms:configValue code='dateFormat' />");
                                elem.custSaleDt = kendo.parseDate(elem.custSaleDt, "<dms:configValue code='dateFormat' />");
                                elem.payEndDtFormat = kendo.parseDate(elem.payEndDt, "<dms:configValue code='dateFormat' />");
                            });
                        }

                        return d;
                    }

                }
                ,aggregate:[
                              { field:"lbrAmt", aggregate:"sum" }
                             ,{ field:"parAmt", aggregate:"sum" }
                             ,{ field:"etcAmt", aggregate:"sum" }
                             ,{ field:"sumAmt", aggregate:"sum" }
                             ,{ field:"calcLbrAmt", aggregate:"sum" }
                             ,{ field:"calcParAmt", aggregate:"sum" }
                             ,{ field:"calcEtcAmt", aggregate:"sum" }
                             ,{ field:"lbrDcAmt", aggregate:"sum" }
                             ,{ field:"parDcAmt", aggregate:"sum" }
                             ,{ field:"pointUseAmt", aggregate:"sum" }
                             ,{ field:"bmPointUseAmt", aggregate:"sum" }
                             ,{ field:"bmCupnUseAmt", aggregate:"sum" }
                             ,{ field:"calcEtcDcAmt", aggregate:"sum" }
                             ,{ field:"calcSumAmt", aggregate:"sum" }
                             ,{ field:"wonUnitCutAmt", aggregate:"sum" }
                             ,{ field:"demicPointCutAmt", aggregate:"sum" }
                             ,{ field:"paymAmt", aggregate:"sum" }
                             ,{ field:"rcvAmt", aggregate:"sum" }
                             ,{ field:"npayAmt", aggregate:"sum" }
                          ]
            }
            ,height:300
            ,editable:false
            ,selectable:"row"
            ,dataBinding:function(e) {
                //화면높이조정
                if(isTablet == "true"){
                    var windowHeight = $(window).height();
                    var contentHeight = $("#resizableContainer").height();
                    if(windowHeight<contentHeight+50){
                        $("#resizableContainer").height(contentHeight+50);
                    }
                }
            }
            ,change:function(e){
                if(!e.sender.dataItem(e.sender.select()).isNew()){

                    initAll();
                    var selectedVal = this.dataItem(this.select());
                    sDlrCd = selectedVal.dlrCd;
                    var roDocNo = selectedVal.roDocNo;
                    var calcDocNo = selectedVal.calcDocNo;
                    $("#roDocNo").val(roDocNo);
                    lbrInfo(roDocNo, "RO");
                    partInfo(roDocNo, "RO");
                    trobleDescInfo(roDocNo, "RO");  // 고객요구사항및 고장설명
                    etcIssueSet(roDocNo, "RO");     // 기타사항

                    if(dms.string.strNvl(calcDocNo) != ""){
                        $.ajax({
                            url:"<c:url value='/ser/cal/calculate/selectCalculateByKey.do' />"
                            ,data:JSON.stringify({"sDlrCd":sDlrCd, sRoDocNo:roDocNo, sCalcDocNo:calcDocNo,sSerHistYn:"Y"})
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR, status, error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(result, textStatus){
                                if(dms.string.strNvl(result.calcDocNo) != ""){
                                    $("#lbrCalcAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.lbrCalcAmt));
                                    $("#lbrDcRate").data("kendoExtNumericTextBox").value(setNvlDefault(result.lbrDcRate));
                                    $("#lbrDcAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.lbrDcAmt));
                                    $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.lbrBmPointUseAmt));
                                    $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.lbrBmCupnUseAmt));
                                    $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.lbrPointUseAmt));
                                    $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value( setNvlDefault(result.lbrEtcDcAmt) );
                                    $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value(result.lbrCalcSumAmt);

                                    $("#parCalcAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.parCalcAmt));
                                    $("#parDcRate").data("kendoExtNumericTextBox").value(setNvlDefault(result.parDcRate));
                                    $("#parDcAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.parDcAmt));
                                    $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.parBmPointUseAmt));
                                    $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.parBmCupnUseAmt));
                                    $("#parPointUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.parPointUseAmt));
                                    $("#parEtcDcAmt").data("kendoExtNumericTextBox").value( setNvlDefault(result.parEtcDcAmt));
                                    $("#parCalcSumAmt").data("kendoExtNumericTextBox").value( setNvlDefault(result.parCalcSumAmt));

                                    $("#etcCalcAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcCalcAmt));
                                    $("#etcDcRate").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcDcRate));
                                    $("#etcDcAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcDcAmt));
                                    $("#etcBmPointUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcBmPointUseAmt));
                                    $("#etcBmCupnUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcBmCupnUseAmt));
                                    $("#etcPointUseAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcPointUseAmt));
                                    $("#etcOtherDcAmt").data("kendoExtNumericTextBox").value( setNvlDefault(result.etcOtherDcAmt));
                                    $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value(result.etcCalcSumAmt);

                                    $("#calcTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.calcTotAmt));
                                    $("#dcTotRate").data("kendoExtNumericTextBox").value(setNvlDefault(result.dcTotRate));
                                    $("#dcTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.dcTotAmt));
                                    $("#bmPointTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.bmPointTotAmt));
                                    $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.bmCupnTotAmt));
                                    $("#pointTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.pointTotAmt));
                                    $("#etcTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.etcTotAmt));
                                    $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value(setNvlDefault(result.lastCalcTotAmt));
                                }
                            }
                        });
                    }

                };
            }
            ,columns:[
                 {field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100}                      // 딜러코드
                ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                      // 차량번호
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                        // VIN
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}                // 소유자
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                     // 방문자
                ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}// 차종명칭
                ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}    // 모델명칭
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100
                    , attributes :{"class":"ar"}, format:"{0:n0}"}                     // 현주행거리
                ,{field:"giRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal' />"
                    , attributes :{"class":"ar"}, width:100 , format:"{0:n0}"
                    , template:function(dataItem){
                        var giRunDistVal = dataItem.giRunDistVal;
                        if(dataItem.giRunDistVal <= 0){
                            giRunDistVal = " ";
                        }
                        return dms.string.addThousandSeparatorCommas(giRunDistVal);
                    }
                }                // 인도주행거리
                ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", width:100
                    , attributes:{"class":"ac"}}   // RO상태
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110                             // RO번호
                    /* , template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoDocNo'>"+dataItem.roDocNo+"</a>";
                        return spanObj;
                    } */
                }
                ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100
                    , attributes:{"class":"ac"}}     // RO유형
                ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:120                                   // RO확인일자
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}          // 위탁인
                ,{field:"roPrintDtFormat", title:"<spring:message code='ser.lbl.roPrintDt' />", width:120                         // 최종프린트시간
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.roPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.roUpdtDt' />", width:120                             // 정비위탁변경시간
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.roUpdtUsrNm' />", width:100}      // 변경정비위탁자
                ,{field:"roCancDtFormat", title:"<spring:message code='ser.lbl.roCancDt' />", width:120                           // RO취소시간
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.roCancDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"roCancNm", title:"<spring:message code='ser.lbl.roCancUsr' />", width:100}         // ro취소자
                ,{field:"cancReasonNm", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100}  // 취소원인
                ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.preLbrSubAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}        //예정공임비
                ,{field:"parAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}        //예정부품비
                ,{field:"etcAmt", title:"<spring:message code='ser.lbl.preEtcSubAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}        //에정기타비
                ,{field:"sumAmt", title:"<spring:message code='ser.lbl.preTotAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}           //예정총금액
                ,{field:"expcDlDtFormat", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:140                           //예정인도시간
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.expcDlDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"wrkStatNm", title:"<spring:message code='ser.lbl.repairSerStat' />", width:100
                    , attributes:{"class":"ac"}}          // 수리서비스상태
                ,{field:"atqProcTpNm", title:"<spring:message code='ser.lbl.OldItemHandTp' />", width:100}  //고품처리
                ,{field:"carWashTpNm", title:"<spring:message code='ser.lbl.carWash' />", width:100}        //차량세차
                ,{field:"custWaitMthNm", title:"<spring:message code='ser.lbl.custStbyMth' />", width:100}  //고객대기
                ,{field:"qtTestMthNm", title:"<spring:message code='ser.lbl.qtTest' />", width:100}         //품질검사
                ,{field:"goodwillYnNm", title:"<spring:message code='ser.lbl.goodWillYn' />", width:120
                    , template:"<spring:message code='ser.lbl.goodWillYn' />(#=goodwillYnNm#)"
                }        //정비배정
                ,{field:"carDriveReqTpNm", title:"<spring:message code='ser.lbl.tdrvReq' />", width:100}    //시승요청유형
                ,{field:"roRemark", title:"<spring:message code='ser.lbl.roRemark' />", width:100}          //RO비고
                ,{field:"dlrRoTpNm", title:"<spring:message code='ser.lbl.dlrRoTp' />", width:100}          //자체정의RO유형
                ,{field:"diagDocNo", title:"<spring:message code='ser.lbl.preInsNo' />", width:110}         //사전점검번호
                ,{field:"incReqNo", title:"<spring:message code='ser.lbl.incReqNo' />", width:100}          //보험번호
                ,{field:"baseRoNo", title:"<spring:message code='ser.lbl.origRorcptNo' />", width:100}      //원RO번호
                ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:110}           //정산번호
                ,{field:"calcRegDtFormat", title:"<spring:message code='ser.lbl.calcDt' />", width:120                            //정산시간
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.calcRegDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"calcPrsnNm", title:"<spring:message code='ser.lbl.settlement' />", width:100}      //정비정산자
                ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120                            //정산완료시간
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }
                ,{field:"calcLbrAmt", title:"<spring:message code='ser.lbl.lbrCalcAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //공임정산금액
                ,{field:"calcParAmt", title:"<spring:message code='ser.lbl.parCalcAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //부품정산금액
                ,{field:"calcEtcAmt", title:"<spring:message code='ser.lbl.etcCalcAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //기타정산금액
                ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.lbrCdDcAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}        //공임할인금액
                ,{field:"parDcAmt", title:"<spring:message code='ser.lbl.parDcAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}          //부품할인금액
                ,{field:"pointUseAmt", title:"<spring:message code='ser.lbl.dlrPointUseAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}    //포인트사용금액
                ,{field:"bmPointUseAmt", title:"<spring:message code='ser.lbl.bmPointUseAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}//BM포인트사용금액
                ,{field:"bmCupnUseAmt", title:"<spring:message code='ser.lbl.bmCupnUseAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}//BM쿠폰사용금액
                ,{field:"calcEtcDcAmt", title:"<spring:message code='ser.lbl.etcSaleAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}    //최종기타혜텍금액
                ,{field:"calcSumAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}    //최종정산서비스비용
                ,{field:"paidYnNm", title:"<spring:message code='ser.lbl.paidYn' />", width:100
                    , attributes:{"class":"ac"}}       //지불완료여부
                ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //공임정산금액
                ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //공임정산금액
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //실수금액
                ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //수납금액
                ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:100
                    , attributes:{"class":"ar"} ,format:"{0:n2}"
                    , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}      //미수금액
                ,{field:"resvYnNm", title:"<spring:message code='ser.lbl.resvYn' />", width:100
                    , attributes:{"class":"ac"}}      //예약여부
                ,{field:"custSaleDt", title:"<spring:message code='ser.lbl.carSaleDt' />", width:100
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                    , attributes:{"class":"ac tooltip-enabled"}
                    , template:"#if (custSaleDt !== null ){# #= kendo.toString(data.custSaleDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                } //차량판매일
                ,{field:"payEndDtFormat", title:"<spring:message code='ser.lbl.payEndDt' />", width:120                  //지불완료시간
                        , attributes:{"class":"ac tooltip-enabled"}
                        , template:"#= dms.string.strNvl(kendo.toString(data.payEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                    }
                ,{field:"ordDlrCd", title:"<spring:message code='ser.lbl.salDlrComp' />", width:80, attributes:{"class":"ac"}}       // 판매딜러
                ,{field:"blueMembershipNo", title:"<spring:message code='ser.lbl.bmMembNo' />", width:100} // BM회원번호
                ,{field:"membershipNo", title:"<spring:message code='ser.lbl.membNo' />", width:145}       // 딜러회원번호
            ]
        });

    //초기화
    initAll = function(){

       $("#lbrCalcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrDcRate").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrWhDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value(0.00);

        $("#parCalcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parDcRate").data("kendoExtNumericTextBox").value(0.00);
        $("#parDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parWhDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(0.00);

        $("#etcCalcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcDcRate").data("kendoExtNumericTextBox").value(0.00);
        $("#etcDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcWhDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcBmPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcOtherDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value(0.00);

        $("#calcTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#dcTotRate").data("kendoExtNumericTextBox").value(0.00);
        $("#dcTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#bmPointTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#pointTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#etcTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value(0.00);
    };

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
            if(dms.string.isEmpty(sRoTpList[0])){
                sRoTpList.splice(0,1);
            }

            var param = $.extend(
                     {"sDlrCd"               :$("#sDlrCd").val()}
                    ,{"sCarRegNo"            :$("#sCarRegNo").val()}
                    ,{"sRoStatCd"            :$("#sRoStatCd").val()}
                    ,{"sRegUsrNm"            :$("#sRegUsrNm").val()}
                    ,{"sVinNo"               :$("#sVinNo").val()}
                    ,{"sRoDocNo"             :$("#sRoDocNo").val()}
                    ,{"sRoTpList"            :sRoTpList}
                    ,{"sExpcDlToDt"          :$("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sExpcDlFromDt"        :$("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sRoFromDt"            :$("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sRoToDt"              :$("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCarOwnerNm"          :$("#sCarOwnerNm").val()}
                    ,{"sCalcPrsnNm"          :$("#sCalcPrsnNm").val()}
                    ,{"sCalcDocNo"           :$("#sCalcDocNo").val()}
                    ,{"sDlrRoTp"             :$("#sDlrRoTp").val()}
                    ,{"sOrdDlrCd"            :$("#sOrdDlrCd").val()}
                    ,{"sBlueMembershipNo"    :$("#sBlueMembershipNo").val()}
                    ,{"sCustSaleFromDt"      :$("#sCustSaleFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCustSaleToDt"        :$("#sCustSaleToDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sPayEndFromDt"        :$("#sPayEndFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sPayEndToDt"          :$("#sPayEndToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderStatusCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"              :"repairOrderService"
                            ,"templateFile"         :"RepairOrderStatusList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='ser.menu.roStatus' />.xlsx"
                            ,"sDlrCd"               :$("#sDlrCd").val()
                            ,"sCarRegNo"            :$("#sCarRegNo").val()
                            ,"sRoStatCd"            :$("#sRoStatCd").data("kendoExtDropDownList").value()
                            ,"sRegUsrNm"            :$("#sRegUsrNm").val()
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sRoDocNo"             :$("#sRoDocNo").val()
                            //,"sRoTp"                :$("#sRoTp").val()
                            ,"sRoTpList"            :sRoTpList
                            ,"sExpcDlToDt"          :$("#sExpcDlToDt").val()
                            ,"sExpcDlFromDt"        :$("#sExpcDlFromDt").val()
                            ,"sRoFromDt"            :$("#sRoFromDt").val()
                            ,"sRoToDt"              :$("#sRoToDt").val()
                            ,"sCarOwnerNm"          :$("#sCarOwnerNm").val()
                            ,"sCalcPrsnNm"          :$("#sCalcPrsnNm").val()
                            ,"sCalcDocNo"           :$("#sCalcDocNo").val()
                            ,"sDlrRoTp"             :$("#sDlrRoTp").data("kendoExtDropDownList").value()
                            ,"sOrdDlrCd"            :$("#sOrdDlrCd").val()
                            ,"sBlueMembershipNo"    :$("#sBlueMembershipNo").val()
                            ,"sCustSaleFromDt"      :$("#sCustSaleFromDt").val()
                            ,"sCustSaleToDt"        :$("#sCustSaleToDt").val()
                            ,"sPayEndFromDt"        :$("#sPayEndFromDt").val()
                            ,"sPayEndToDt"          :$("#sPayEndToDt").val()
                            ,"sListType"            :"RS"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });


        }
    });

    var sRoTpList;
    //엑셀버튼
    $("#btnExcelExport2").kendoButton({

        click:function(e){
            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
            if(dms.string.isEmpty(sRoTpList[0])){
                sRoTpList.splice(0,1);
            }

            var param = $.extend(
                     {"sDlrCd"               :$("#sDlrCd").val()}
                    ,{"sCarRegNo"            :$("#sCarRegNo").val()}
                    ,{"sRoStatCd"            :$("#sRoStatCd").val()}
                    ,{"sRegUsrNm"            :$("#sRegUsrNm").val()}
                    ,{"sVinNo"               :$("#sVinNo").val()}
                    ,{"sRoDocNo"             :$("#sRoDocNo").val()}
                    ,{"sRoTpList"            :sRoTpList}
                    ,{"sExpcDlToDt"          :$("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sExpcDlFromDt"        :$("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sRoFromDt"            :$("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sRoToDt"              :$("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCarOwnerNm"          :$("#sCarOwnerNm").val()}
                    ,{"sCalcPrsnNm"          :$("#sCalcPrsnNm").val()}
                    ,{"sCalcDocNo"           :$("#sCalcDocNo").val()}
                    ,{"sDlrRoTp"             :$("#sDlrRoTp").val()}
                    ,{"sOrdDlrCd"            :$("#sOrdDlrCd").val()}
                    ,{"sBlueMembershipNo"    :$("#sBlueMembershipNo").val()}
                    ,{"sCustSaleFromDt"      :$("#sCustSaleFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCustSaleToDt"        :$("#sCustSaleToDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sPayEndFromDt"        :$("#sPayEndFromDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sPayEndToDt"          :$("#sPayEndToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수 체크
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderStatusCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){

                   var maxRow = 30000;
                   var fileCnt = 0;
                   var downCnt = 0;
                   var totRow = result.total;
                   fileCnt = Math.ceil(totRow / maxRow);
                   //console.log("maxRow : "+maxRow+", totRow : "+totRow+", fileCnt : "+fileCnt);

                   callExcelDownload(0, maxRow, maxRow, fileCnt, downCnt);

               }
           });
        }
    });

    callExcelDownload = function(firstIdx, lastIdx, maxRow, fileCnt, downCnt){
        //showProgressBar();
        dms.ajax.excelProgressExport({
            "beanName"              :"repairOrderService"
            ,"templateFile"         :"RepairOrderStatusList_Tpl.xlsx"
            ,"fileName"             :"<spring:message code='ser.menu.roStatus' />.xlsx"
            ,"sDlrCd"               :$("#sDlrCd").val()
            ,"sCarRegNo"            :$("#sCarRegNo").val()
            ,"sRoStatCd"            :$("#sRoStatCd").data("kendoExtDropDownList").value()
            ,"sRegUsrNm"            :$("#sRegUsrNm").val()
            ,"sVinNo"               :$("#sVinNo").val()
            ,"sRoDocNo"             :$("#sRoDocNo").val()
            //,"sRoTp"                :$("#sRoTp").val()
            ,"sRoTpList"            :sRoTpList
            ,"sExpcDlToDt"          :$("#sExpcDlToDt").val()
            ,"sExpcDlFromDt"        :$("#sExpcDlFromDt").val()
            ,"sRoFromDt"            :$("#sRoFromDt").val()
            ,"sRoToDt"              :$("#sRoToDt").val()
            ,"sCarOwnerNm"          :$("#sCarOwnerNm").val()
            ,"sCalcPrsnNm"          :$("#sCalcPrsnNm").val()
            ,"sCalcDocNo"           :$("#sCalcDocNo").val()
            ,"sDlrRoTp"             :$("#sDlrRoTp").data("kendoExtDropDownList").value()
            ,"sOrdDlrCd"            :$("#sOrdDlrCd").val()
            ,"sBlueMembershipNo"    :$("#sBlueMembershipNo").val()
            ,"sCustSaleFromDt"      :$("#sCustSaleFromDt").val()
            ,"sCustSaleToDt"        :$("#sCustSaleToDt").val()
            ,"sPayEndFromDt"        :$("#sPayEndFromDt").val()
            ,"sPayEndToDt"          :$("#sPayEndToDt").val()
            ,"sListType"            :"RS"
            ,"firstIndex"           :firstIdx
            ,"lastIndex"            :lastIdx
        }, maxRow, fileCnt, downCnt);
    };

    showProgressBar = function(){
        $("#excelProgress").slideDown();
    };

    hideProgressBar = function(){
        $("#excelProgress").slideUp();
    };

    setNvlDefault = function( value){
        var resultVal = 0;
        if( (dms.string.strNvl (value) != "" )){
            resultVal = value;
        }
        return resultVal;
    };

    if(isTablet=="true") {
        $("#tabstrip2>div").eq(1).height(280);
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#roStatColCroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[2]).css("width","7%");

            $("#table_gridForiPad").attr("style","width:958px !important; max-width:958px !important");
        }
    }

    // progress bar 숨김
    hideProgressBar();
});

$(".btn_right_absolute").hide();
$(".form_search a").hide();

function onChange(e) {
    //console.log("Change event :: value is " + e.value);
}

function onComplete(e) {
    //console.log("Complete event :: value is " + e.value);
    //$("#startProgress").text("Restart Progress").removeClass("k-state-disabled");
    hideProgressBar();
}

userSearch = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0) {
                        $("#sRegUsrNm").val(data[0].usrNm)
                    }
                }
            }
        }
    });
}
</script>
<!-- //script -->

<style>
    #progressBar {
        display: block;
        width: 100%;
        margin-bottom: 10px;
    }
 </style>
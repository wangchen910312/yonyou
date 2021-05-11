<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12930" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    <dms:access viewId="VIEW-D-12097" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="roHistoryForm">
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col>
                            <col style="width:10%;">
                            <col style="width:13%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.vinNo' /></span></th><!-- VIN -->
                                <td>
                                    <input type="text" id="sVinNo" name="sVinNo" maxlength="17" class="form_input upper" data-name="<spring:message code="ser.lbl.vinNo" />" required />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.searchTp" /></th><!-- 검색구분 -->
                                <td>
                                    <input id="sSearchGubun" name="sSearchGubun" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- ro일자 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRoFromDt" class="form_datepicker ac"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRoToDt" class="form_datepicker ac"/>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.rpirNm" /></th><!-- 정비명칭 -->
                                <td>
                                    <input id="sLbrNm" name="sLbrNm" type="text" class="form_input"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /></th>
                                <td>
                                    <input id="sCarRegNo" name="sCarRegNo" type="text" class="form_input"/> <!-- 차량번호 -->
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></th>
                                <td>
                                    <input id="sDriverNm" name="sDriverNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roTp' /></th> <!-- RO유형  -->
                                <td>
                                    <input id="sRoTp" name="sRoTp" value="" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></th>
                                <td>
                                    <input id="sItemNm" name="sItemNm" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 차량소유자 -->
                                <td>
                                    <input id="sCarOwnerNm" name="sCarOwnerNm" type="text" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roWrtrNm' /></th><!-- RO발행자 -->
                                <td>
                                    <input id="sRegUsrNm" name="sRegUsrNm" type="text" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roStatus' /><!-- RO 상태 --></th>
                                <td>
                                    <input type="text" id="sRoStatCd" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호  -->
                                <td>
                                    <input type="text" id="sRoDocNo" class="form_input"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <input type="hidden" id="sDlrCd" name="sDlrCd" class="form_input"/>
                <input type="hidden" id="roDocNo" name="roDocNo">
                <input type="hidden" id="calcDocNo" name="calcDocNo">
                <input type="hidden" id="close" name="close" />
                <input type="hidden" id="searchGubun" name="searchGubun" />
            </form>
        </section>
        <div class="table_grid mt5">
            <div id="grid" class="resizable_grid"></div>
        </div>

        <div id="tabstrip1" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                <li class="k-state-active"><spring:message code="ser.lbl.lbr" /><!-- 정비항목 --></li>
                <li><spring:message code="ser.lbl.part" /><!-- 부품수령 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                <li><spring:message code='ser.lbl.calcCost' /><!-- 정산비용 --></li>
                <li><spring:message code='ser.lbl.serviceCont' /><!-- 수리건의 --></li>
            </ul>
            <!-- //탭메뉴 -->


            <!-- 고객요청사항 & 고장설명 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp">
                <c:param name="gubun" value="P"></c:param>
            </c:import>

            <!-- //고객요청사항 & 고장설명 -->

            <!-- 공임 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- //공임 -->

            <!-- 부품 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="partGrid" class="grid"></div>
                </div>
            </div>
            <!-- //부품 -->

            <!-- 기타 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->

            <div style="min-height:205px;">
                <!-- 정산비용 -->
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
                                <th scope="col"><spring:message code="ser.lbl.calcCost" /></th><!--정산비용  -->
                                <th scope="col"><spring:message code="ser.lbl.calcAmt" /></th><!--정산금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dcRate" /></th><!--할인율  -->
                                <th scope="col"><spring:message code="ser.lbl.dcAmt" /></th><!--할인금액  -->
                                <th scope="col"><spring:message code="ser.lbl.whDcAmt" /></th><!--할인후금액  -->
                                <th scope="col"><spring:message code="ser.lbl.bmPointUseAmt" /></th><!--BM포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.bmCupnUseAmt" /></th><!-- BM쿠폰사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dlrPointUseAmt" /></th><!--포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.etcSaleAmt" /></th><!--기타혜택금액  -->
                                <th scope="col"><spring:message code="ser.lbl.finalCalcAmt" /></th><!--최종정산금액  -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcLbrSubAmt" /></th><!--공임비소계  -->
                                <td class="ar" id="lbrCalcAmt"></td>
                                <td class="ar" id="lbrDcRate"></td>
                                <td class="ar" id="lbrDcAmt"></td>
                                <td class="ar" id="lbrWhDcAmt"></td>
                                <td class="ar" id="lbrBmPointUseAmt"></td>
                                <td class="ar" id="lbrBmCupnUseAmt"></td>
                                <td class="ar" id="lbrPointUseAmt"></td>
                                <td class="ar" id="lbrEtcDcAmt"></td>
                                <td class="ar" id="lbrCalcSumAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcParSubCamt" /></th><!--부품비소계  -->
                                <td class="ar" id="parCalcAmt"></td>
                                <td class="ar" id="parDcRate"></td>
                                <td class="ar" id="parDcAmt"></td>
                                <td class="ar" id="parWhDcAmt"></td>
                                <td class="ar" id="parBmPointUseAmt"></td>
                                <td class="ar" id="parBmCupnUseAmt"></td>
                                <td class="ar" id="parPointUseAmt"></td>
                                <td class="ar" id="parEtcDcAmt"></td>
                                <td class="ar" id="parCalcSumAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcEtcSubAmt" /></th><!--기타비용소계  -->
                                <td class="ar" id="etcCalcAmt"></td>
                                <td class="ar" id="etcDcRate"></td>
                                <td class="ar" id="etcDcAmt"></td>
                                <td class="ar" id="etcWhDcAmt"></td>
                                <td class="ar" id="etcBmPointUseAmt"></td>
                                <td class="ar" id="etcBmCupnUseAmt"></td>
                                <td class="ar" id="etcPointUseAmt"></td>
                                <td class="ar" id="etcOtherDcAmt"></td>
                                <td class="ar" id="etcCalcSumAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcSerTotAmt" /></th><!--서비스총계  -->
                                <td class="ar" id="calcTotAmt"></td>
                                <td class="ar" id="dcTotRate"></td>
                                <td class="ar" id="dcTotAmt"></td>
                                <td class="ar" id="dcWhTotDcAmt"></td>
                                <td class="ar" id="bmPointTotAmt"></td>
                                <td class="ar" id="bmCupnTotAmt"></td>
                                <td class="ar" id="pointTotAmt"></td>
                                <td class="ar" id="etcTotAmt"></td>
                                <td class="ar" id="lastCalcTotAmt"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt5">
                    <div id="calcGrid" class="grid"></div>
                </div>
            </div>
            <!-- //정산비용 -->

            <!-- 수리건의-->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrSuggest.jsp" />
            <!-- //수리건의 -->
        </div>

        <div class="table_form mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roRemark" /><!-- 서비스건의비고 --></th>
                        <td>
                            <input type="text" id="roRemark" name="roRemark" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.CalcRemark" /><!-- 서비스정산비고 --></th>
                        <td>
                            <input type="text" id="calcRemark" name="calcRemark" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

$("#tabstrip,#tabstrip1,#tabstrip2").kendoExtTabStrip({
    animation:false
});

var sDlrCd = "${dlrCd}";

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});

//영수증유형 Array
var rcptTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd;});

//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd;});

//공통코드:정비유형(수리유형)
var lbrTpCdList = [];
<c:forEach var="obj" items="${lbrTpCdList}">
lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

var searchTpCdList = [];
<c:forEach var="obj" items="${searchTpCdList}">
searchTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var searchTpCdArr = dms.data.arrayToMap(searchTpCdList, function(obj){return obj.cmmCd;});

//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd;});

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

/** RO상태 **/
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
<c:if test="${obj.remark2 eq 'comp'}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

setLbrTpMap = function(val){
    var resultVal = "";
    if(dms.string.strNvl(val) != ""){
        if(lbrTpCdArr[val] != undefined)
            resultVal = lbrTpCdArr[val].cmmCdNm;
    }
    return resultVal;
};

//수납 구분
receiveCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(receiveCdMap[val] != undefined)
            returnVal = receiveCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//결제유형
paymTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymTpCdArr[val] != undefined)
            returnVal = paymTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//지불방식
paymMthCdGrid = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(paymMthCdMap[val] != undefined)
     returnVal = paymMthCdMap[val].cmmCdNm;
 }
 return returnVal;
};

//결제기간
paymPridCdGrid = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(paymPridCdArr[val] != undefined)
     returnVal = paymPridCdArr[val].cmmCdNm;
 }
 return returnVal;
};

//캠페인유형
crTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(crTpMap[val] != undefined)
        returnVal = crTpMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function(){

    /**주행거리**/
    $("#sRunDistFromVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    /**주행거리**/
    $("#sRunDistToVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // 정산From일자
    $("#sCalcFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // 정산TO일자
    $("#sCalcToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });


    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            dms.ajax.excelExport({
                "beanName"              :"repairOrderService"
                ,"templateFile"         :"RepairOrderHistoryList_Tpl.xlsx"
                ,"fileName"             :"<spring:message code='ser.menu.serviceHistory' />.xlsx"
                ,"sVinNo"               :$("#sVinNo").val()
                ,"sCarRegNo"            :$("#sCarRegNo").val()
                ,"sDriverNm"            :$("#sDriverNm").val()
                ,"sRoTp"                :$("#sRoTp").val()
                ,"sRoFromDt"            :$("#sRoFromDt").val()
                ,"sRoToDt"              :$("#sRoToDt").val()
                ,"sLbrNm"               :$("#sLbrNm").val()
                ,"sItemNm"              :$("#sItemNm").val()
                ,"sSearchGubun"         :$("#sSearchGubun").val()
                ,"sCarOwnerNm"          :$("#sCarOwnerNm").val()
                ,"sRoStatCd"            :$("#sRoStatCd").val()
                ,"sRegUsrNm"            :$("#sRegUsrNm").val()
                ,"sRoDocNo"             :$("#sRoDocNo").val()
                ,"sListType"            :"RH"
            });
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            var validator = $("#roHistoryForm").kendoExtValidator().data("kendoExtValidator");
            if (validator.validate()) {
                if( $("#sVinNo").val().length != 17 ){
                    dms.notification.warning("<spring:message code='ser.lnfo.chkVinNoLength' />");
                    return;
                }
                $("#grid").data("kendoExtGrid").dataSource.data([]);
                $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
                $("#partGrid").data("kendoExtGrid").dataSource.data([]);

                $("#grid").data("kendoExtGrid").dataSource.read();

                initCalData();


             }
        }
    });

    //취소
    $("#btnReset").kendoButton({
        click:function(e) {
            $("#roHistoryForm").get(0).reset();
            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
            $("#partGrid").data("kendoExtGrid").dataSource.data([]);
            $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
            $("#custRemarkGrid").data('kendoExtGrid').dataSource.data([]);
            $("#etcIssueGrid").data('kendoExtGrid').dataSource.data([]);
            $(".btn_s.btn_s_v4.troble").removeClass("btn_active");
            initCalData();
        }
    });

    initCalData = function(){
        $("#lbrCalcAmt").html("");
        $("#lbrDcRate").html("");
        $("#lbrDcAmt").html("");
        $("#lbrWhDcAmt").html("");
        $("#lbrBmPointUseAmt").html("");
        $("#lbrBmCupnUseAmt").html("");
        $("#lbrPointUseAmt").html("");
        $("#lbrEtcDcAmt").html("");
        $("#parCalcAmt").html("");
        $("#parDcRate").html("");
        $("#parDcAmt").html("");
        $("#parWhDcAmt").html("");
        $("#parBmPointUseAmt").html("");
        $("#parBmCupnUseAmt").html("");
        $("#parPointUseAmt").html("");
        $("#parEtcDcAmt").html("");
        $("#etcCalcAmt").html("");
        $("#etcDcRate").html("");
        $("#etcDcAmt").html("");
        $("#etcWhDcAmt").html("");
        $("#etcBmPointUseAmt").html("");
        $("#etcBmCupnUseAmt").html("");
        $("#etcPointUseAmt").html("");
        $("#etcOtherDcAmt").html("");
        $("#calcTotAmt").html("");
        $("#dcTotRate").html("");
        $("#dcTotAmt").html("");
        $("#dcWhTotDcAmt").html("");
        $("#bmPointTotAmt").html("");
        $("#bmCupnTotAmt").html("");
        $("#pointTotAmt").html("");
        $("#etcTotAmt").html("");
        $("#calcRemark").val("");
        $("#lbrCalcSumAmt").html("");
        $("#parCalcSumAmt").html("");
        $("#etcCalcSumAmt").html("");
        $("#lastCalcTotAmt").html("");
        $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
    }

    // RO상태
    $("#sRoStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 검색구분
    $("#sSearchGubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:searchTpCdList
        ,value : dms.string.isEmpty("${searchGubun}") ? "MD" : "${searchGubun}"
        //,index:1
    });

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000133"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersHistory.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }

                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var dlrCd;
                        if($("#othDlrHis").checked){
                            dlrCd = "";
                        } else {
                            dlrCd = $("sDlrCd").val();
                        }
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        params["sDriverNm"] = $("#sDriverNm").val();
                        params["sRoTp"] = $("#sRoTp").val();
                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sLbrNm"] = $("#sLbrNm").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sSearchGubun"] = $("#sSearchGubun").val();
                        params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                        params["sRegUsrNm"] = $("#sRegUsrNm").val();
                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sRoStatCd"] = $("#sRoStatCd").val();

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

                        ,roDtFormat:{type:"date"}
                        ,roPrintDtFormat:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                        ,calcRegDtFormat:{type:"date"}
                        ,calcDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            elem.calcRegDtFormat = kendo.parseDate(elem.calcRegDt, "<dms:configValue code='dateFormat' />");
                            elem.calcDtFormat = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                            elem.roPrintDtFormat = kendo.parseDate(elem.roPrintDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:150
        ,pageable:false
        ,selectable:"row"
        ,autoBind:false
        ,editable:false
        ,change:function(e){

            var selectedVal = this.dataItem(this.select());
            var roDocNo = selectedVal.roDocNo;
            var sDlrCd = selectedVal.dlrCd; //tianjx
            $("#roDocNo").val(roDocNo);
            $("#searchGubun").val(selectedVal.searchGubun);
            $("#sDlrCd").val(selectedVal.dlrCd);
            $("#roRemark").val(selectedVal.roRemark);
            $("#calcRemark").val(selectedVal.calcRemark);
            $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
            $("#lbrGrid").data("kendoExtGrid").dataSource.read();
            $("#partGrid").data("kendoExtGrid").dataSource.data([]);
            $("#partGrid").data("kendoExtGrid").dataSource.read();
            $("#lbrSuggestGrid").data("kendoExtGrid").dataSource.data([]);
            $("#lbrSuggestGrid").data("kendoExtGrid").dataSource.read();

            trobleDescInfo(roDocNo, "RO",sDlrCd);     //传入相关店代码   tianjx 20191021
            etcIssueSet(roDocNo, "RO");     // 기타사항
            lbrSuggestSet(roDocNo, "RO");   //수리건의(selectLbrSuggest.jsp)

            if(sDlrCd == selectedVal.dlrCd){
                $.ajax({
                    url:"<c:url value='/ser/cal/calculate/selectCalculateByKey.do' />"
                    ,data:JSON.stringify({"sRoDocNo":roDocNo ,"sDlrCd":selectedVal.dlrCd})  //传入相关店代码   tianjx 20191118
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        initCalData();
                    }
                    ,success:function(dataItem, textStatus) {

                        $("#lbrCalcAmt").html(dataItem.lbrCalcAmt);
                        $("#lbrDcRate").html(dataItem.lbrDcRate);
                        $("#lbrDcAmt").html(dataItem.lbrDcAmt);
                        $("#lbrWhDcAmt").html(dataItem.lbrWhDcAmt);
                        $("#lbrBmPointUseAmt").html(dataItem.lbrBmPointUseAmt);
                        $("#lbrBmCupnUseAmt").html(dataItem.lbrBmCupnUseAmt);
                        $("#lbrPointUseAmt").html(dataItem.lbrPointUseAmt);
                        $("#lbrEtcDcAmt").html(dataItem.lbrEtcDcAmt);
                        $("#lbrCalcSumAmt").html(dataItem.lbrCalcSumAmt);

                        $("#parCalcAmt").html(dataItem.parCalcAmt);
                        $("#parDcRate").html(dataItem.parDcRate);
                        $("#parDcAmt").html(dataItem.parDcAmt);
                        $("#parWhDcAmt").html(dataItem.parWhDcAmt);
                        $("#parBmPointUseAmt").html(dataItem.parBmPointUseAmt);
                        $("#parBmCupnUseAmt").html(dataItem.parBmCupnUseAmt);
                        $("#parPointUseAmt").html(dataItem.parPointUseAmt);
                        $("#parEtcDcAmt").html(dataItem.parEtcDcAmt);
                        $("#parCalcSumAmt").html(dataItem.parCalcSumAmt);

                        $("#etcCalcAmt").html(dataItem.etcCalcAmt);
                        $("#etcDcRate").html(dataItem.etcDcRate);
                        $("#etcDcAmt").html(dataItem.etcDcAmt);
                        $("#etcWhDcAmt").html(dataItem.etcWhDcAmt);
                        $("#etcBmPointUseAmt").html(dataItem.etcBmPointUseAmt);
                        $("#etcBmCupnUseAmt").html(dataItem.etcBmCupnUseAmt);
                        $("#etcPointUseAmt").html(dataItem.etcPointUseAmt);
                        $("#etcOtherDcAmt").html(dataItem.etcOtherDcAmt);
                        $("#etcCalcSumAmt").html(dataItem.etcCalcSumAmt);

                        $("#calcTotAmt").html(dataItem.calcTotAmt);
                        $("#dcTotRate").html(dataItem.dcTotRate);
                        $("#dcTotAmt").html(dataItem.dcTotAmt);
                        $("#dcWhTotDcAmt").html(dataItem.dcWhTotDcAmt);
                        $("#bmPointTotAmt").html(dataItem.bmPointTotAmt);
                        $("#bmCupnTotAmt").html(dataItem.bmCupnTotAmt);
                        $("#pointTotAmt").html(dataItem.pointTotAmt);
                        $("#etcTotAmt").html(dataItem.etcTotAmt);
                        $("#calcDocNo").val(dataItem.calcDocNo);
                        $("#calcRemark").val(dataItem.calcRemark);
                        $("#lastCalcTotAmt").html(dataItem.lastCalcTotAmt);

                        $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
                        $("#calcGrid").data("kendoExtGrid").dataSource.read();
                    }
                });
            }else{
                $("#lbrCalcAmt").html("**.**");
                $("#lbrDcRate").html("**.**");
                $("#lbrDcAmt").html("**.**");
                $("#lbrWhDcAmt").html("**.**");
                $("#lbrBmPointUseAmt").html("**.**");
                $("#lbrBmCupnUseAmt").html("**.**");
                $("#lbrPointUseAmt").html("**.**");
                $("#lbrEtcDcAmt").html("**.**");
                $("#lbrCalcSumAmt").html("**.**");

                $("#parCalcAmt").html("**.**");
                $("#parDcRate").html("**.**");
                $("#parDcAmt").html("**.**");
                $("#parWhDcAmt").html("**.**");
                $("#parBmPointUseAmt").html("**.**");
                $("#parBmCupnUseAmt").html("**.**");
                $("#parPointUseAmt").html("**.**");
                $("#parEtcDcAmt").html("**.**");
                $("#parCalcSumAmt").html("**.**");

                $("#etcCalcAmt").html("**.**");
                $("#etcDcRate").html("**.**");
                $("#etcDcAmt").html("**.**");
                $("#etcWhDcAmt").html("**.**");
                $("#etcBmPointUseAmt").html("**.**");
                $("#etcBmCupnUseAmt").html("**.**");
                $("#etcPointUseAmt").html("**.**");
                $("#etcOtherDcAmt").html("**.**");
                $("#etcCalcSumAmt").html("**.**");

                $("#calcTotAmt").html("**.**");
                $("#dcTotRate").html("**.**");
                $("#dcTotAmt").html("**.**");
                $("#dcWhTotDcAmt").html("**.**");
                $("#bmPointTotAmt").html("**.**");
                $("#bmCupnTotAmt").html("**.**");
                $("#pointTotAmt").html("**.**");
                $("#etcTotAmt").html("**.**");
                $("#calcDocNo").val("**.**");
                $("#calcRemark").val("**.**");
                $("#lastCalcTotAmt").html("**.**");

                $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
            }
        }
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='ser.lbl.dealer' />", sortable:false, width:100, attributes:{"class":"ac"}}        // 딜러
            ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", sortable:false, width:100, attributes:{"class":"ac"}}  // RO 상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", sortable:false, width:120}    // RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", sortable:false, width:100}
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", sortable:false, width:100}  // 위탁인
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // RO확인시간
            ,{field:"roPrintDtFormat", title:"<spring:message code='ser.lbl.roPrintDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 최종프린트시간
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.roUpdtDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 수정일자
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
            ,{field:"calcRegDtFormat", title:"<spring:message code='ser.lbl.calcDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.calcRegDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 정산일자
            ,{field:"calcPrsnNm", title:"<spring:message code='ser.lbl.calcWrtrNm' />", sortable:false, width:100} // 정산자
            ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 정산완료일자
            ,{field:"calcCompUsrNm", title:"<spring:message code='ser.lbl.calcCompNm' />", sortable:false, width:100}   // 정산완료자
            ,{field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", sortable:false, width:80,attributes:{"class":"ac"}} //청산완료여부
        ]
    });

    // 정비 그리드
    $("#lbrGrid").kendoExtGrid({
        gridId:"G-SER-1011-000134"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceLaborsHist.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sPreFixId"] = "RO";
                        params["sDocNo"] = $("#roDocNo").val();
                        params["sDlrCd"] = $("#sDlrCd").val();

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
                        ,roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string", editable:false}
                        ,lbrCd:{type:"string", editable:false}
                        ,lbrNm:{type:"string", editable:false}
                        ,lbrTp:{type:"string", editable:false}
                        ,lbrPrc:{type:"number"}
                        ,expcLbrAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,selectable:"row"
        ,appendEmptyColumn:false
        ,columns:[
            {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:80}                              // 정비코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250}                             // 정비항목
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80
                ,template:"#= setLbrTpMap(lbrTp)#"
                ,attributes:{"class":"ac"}
            }                              // 정비유형
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:60, attributes:{"class":"ar"}, format:"{0:n2}"}   // 수불공임
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:60, attributes:{"class":"ar"} ,format:"{0:n0}", hidden:true }// 정비수량
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var lbrPrc = Number(data.lbrPrc).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        lbrPrc = "**.**";
                    }
                    return lbrPrc;
                }
            }      // 공임단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var lbrAmt = Number(data.lbrAmt).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        lbrAmt = "**.**";
                    }
                    return lbrAmt;
                }
            }       // 공임금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var dcRate = Number(data.dcRate).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        dcRate = "**.**";
                    }
                    return dcRate;
                }
            }         // 할인율
            ,{field:"dcAmt", title:"<spring:message code='ser.lbl.dcAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var dcAmt = Number(data.dcAmt).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        dcAmt = "**.**";
                    }
                    return dcAmt;
                }
            }         // 할인금액
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var lbrTotAmt = Number(data.lbrTotAmt).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        lbrTotAmt = "**.**";
                    }
                    return lbrTotAmt;
                }
            }  // 예정공임비
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100, attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
            }// 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100} // 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}// 지불자
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}// 패키지코드
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}    // 캠페인번호
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}    // 캠페인명
        ]
    });

    // 부품 그리드
    $("#partGrid").kendoExtGrid({
        gridId:"G-SER-1011-000135"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServicePartsHist.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sPreFixId"] = "RO";
                        params["sDocNo"] = $("#roDocNo").val();
                        params["sDlrCd"] = $("#sDlrCd").val();

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
                        roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false, validation:{required:true}}
                        ,itemPrc:{type:"number", editable:false}
                        ,itemQty:{type:"number"}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,editable:false
        ,sortable:false
        ,selectable:"row"
        ,filterable:false
        ,appendEmptyColumn:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                 // 부품번호
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300}                                // 부품명
            ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:80, attributes:{"class":"ac"}}  // 계산단위
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}    // 부품수량
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"
                ,template:function(data){
                    var itemPrc = Number(data.itemPrc).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        itemPrc = "**.**";
                    }
                    return itemPrc;
                }
            }  // 부품단가
            ,{field:"itemSaleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var itemSaleAmt = Number(data.itemSaleAmt).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        itemSaleAmt = "**.**";
                    }
                    return itemSaleAmt;
                }
            }  // 부품금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,template:function(data){
                    var dcRate = Number(data.dcRate).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        dcRate = "**.**";
                    }
                    return dcRate;
                }
            } // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(data){
                    var dcAmt = Number(data.dcAmt).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        dcAmt = "**.**";
                    }
                    return dcAmt;
                }
            } // 할인금액
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.parAmt' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"
                ,template:function(data){
                    var itemTotAmt = Number(data.itemTotAmt).toFixed(2);
                    if($("#searchGubun").val() == "OD"){
                        itemTotAmt = "**.**";
                    }
                    return itemTotAmt;
                }
            }                     // 예정부품대
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
            }// 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100}     // 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}    // 지불자
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}// 패키지코드
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}    // 캠페인번호
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}    // 캠페인명
        ]
    });

    $("#calcGrid").kendoExtGrid({
        gridId:"G-SER-1011-000136"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceives.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sRoDocNo"] = $("#roDocNo").val();
                        params["sDlrCd"] = $("#sDlrCd").val();

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
                        paymTp:{type:"string"}
                        ,paymCd:{type:"string"}
                        ,paymUsrNm:{type:"string"}
                        ,paymPrid:{type:"string"}
                        ,calcAmt:{type:"number"}
                        ,wonUnitCutAmt:{type:"number"}
                        ,demicPointCutAmt:{type:"number"}
                        ,paymAmt:{type:"number"}
                        ,paymRemark:{type:"string"}
                    }
                }
            }
        }
        ,height:75
        ,pageable:false
        ,autoBind:false
        ,editable:false
        ,sortable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,resizable:false
        ,columns:[
            {field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                    });
                }
            }          // 지불유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100}       // 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}       // 지불자
            ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90
                ,template:"#=paymPridCdGrid(paymPrid)#"
                ,editor:function(container, options){
                    $('<input required name="paymPrid" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymPridCdList
                    });
                }
            }       // 지불기한
            ,{field:"calcAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"} , format:"{0:n2}"}       // 최종정산금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}    //정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}//정산제로
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}
                ,template:function(data){
                    var paymAmt = 0;
                    if(data.paymAmt != null){
                        paymAmt = data.paymAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(paymAmt);
                }
            }       // 발생금액
            ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90}    // 지불비고
        ]
    });

    $(".upper").bind("keyup", function(){
        $(this).val($(this).val().toUpperCase());
    });

    $("#custAdd").data("kendoButton").enable(false);
    $("#custDel").data("kendoButton").enable(false);
    $("#etcIssueAdd").data("kendoButton").enable(false);
    $("#etcIssueDel").data("kendoButton").enable(false);

    $("#sVinNo").val("${vinNo}");

    var validator = $("#roHistoryForm").kendoExtValidator().data("kendoExtValidator");
    if (validator.validate()) {
        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
        $("#partGrid").data("kendoExtGrid").dataSource.data([]);

        $("#grid").data("kendoExtGrid").dataSource.read();
     }

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#roHistoryForm  col");
             $(colEmt[4]).css("width","7%");
            var iPadTebletGrids=$($(".table_grid"));
            $(iPadTebletGrids[0]).attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});



</script>


<style>
.uppercase
 {
  text-transform:uppercase;
 }
 </style>
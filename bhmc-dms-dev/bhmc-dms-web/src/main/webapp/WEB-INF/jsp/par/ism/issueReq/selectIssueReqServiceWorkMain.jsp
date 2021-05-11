<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">

    <!-- issueReqMng -->
    <section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.issueReqMng" /><!-- issueReqMng --></h1> --%>
        <div class="btn_left">
            <dms:access viewId="VIEW-D-11760"
                hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit"
                    class="btn_m btn_reset">
                    <spring:message code="par.btn.init" />
                </button>
                <!--btnInit  -->
            </dms:access>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11759"
                hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvReqSave"
                    class="btn_m btn_save btn_m_min">
                    <spring:message code="par.btn.save" />
                    <!-- btnInvReqSave -->
                </button>
            </dms:access>
            <dms:access viewId="VIEW-D-11758"
                hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvReq"
                    class="btn_m btn_m_min">
                    <spring:message code="par.btn.invConfirm" />
                    <!-- btnInvReq -->
                </button>
            </dms:access>
            <dms:access viewId="VIEW-D-11757"
                hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvReturn"
                    class="btn_m btn_m_min">
                    <spring:message code="par.btn.invReturn" />
                    <!-- btnInvReturn -->
                </button>
            </dms:access>
            <dms:access viewId="VIEW-D-11756"
                hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint"
                    class="btn_m btn_print btn_m_min">
                    <spring:message code="par.btn.print" />
                </button>
                <!--btnPrint  -->
            </dms:access>
            <dms:access viewId="VIEW-D-11755"
                hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch"
                    class="btn_m btn_search btn_m_min">
                    <spring:message code="par.btn.search" />
                </button>
                <!--btnSearch  -->
            </dms:access>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search"
        data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width: 8%;">
                <col style="width: 17%;">
                <col style="width: 8%;">
                <col style="width: 17%;">
                <col style="width: 8%;">
                <col style="width: 17%;">
                <col style="width: 8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message
                            code="par.lbl.carNo" />
                        <!-- carNo -->
                    </th>
                    <td><input id="sCarNo" name="sCarNo"
                        class="form_input" /></td>
                    <th scope="row"><spring:message
                            code="par.lbl.parReqDocNo" />
                        <!-- parReqDocNo -->
                    </th>
                    <td><input id="sParReqDocNo"
                        name="sParReqDocNo" class="form_input" /></td>
                    <th scope="row"><spring:message
                            code="par.lbl.parGiTp" />
                        <!-- parGiTp -->
                    </th>
                    <td><input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message
                            code="par.lbl.parGiStatCd" />
                        <!-- parGiStatCd -->
                    </th>
                    <td><input id="sParReqStatCd02"
                        class="form_comboBox" /></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message
                            code="par.lbl.vin" />
                    </th>
                    <td><input id="sVinNo" name="sVinNo"
                        class="form_input" /></td>
                    <th scope="row"><span class="bu_required"><spring:message
                                code="par.lbl.issueRegDt" />
                            <!-- issueRegDt -->
                    </th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sReqStartDt"
                                    class="form_datepicker"
                                    data-type="maskDate" /> <span
                                    class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sReqEndDt"
                                    class="form_datepicker"
                                    data-type="maskDate" />
                            </div>
                        </div></td>
                    <th scope="row"><spring:message
                            code="par.lbl.invRoManNm" />
                    </th>
                    <td><input id="sSaId" name="sSaId"
                        class="form_comboBox hidden" /> <input
                        id="sSerPrsnNm" name="sSerPrsnNm"
                        class="form_input" /></td>
                    <th scope="row"><spring:message
                            code="par.lbl.parReqStatNm" />
                        <!-- parReqStatNm -->
                    </th>
                    <td><input id="sParReqStatCd"
                        class="form_comboBox" /></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message
                            code="par.lbl.carLine" />
                        <!-- 차종 -->
                    </th>
                    <td><input id="sCarlineCd" name="sCarlineCd"
                        type="text" class="form_comboBox" /></td>
                    <th scope="row"><spring:message
                            code="par.lbl.issueCstNm" />
                        <!-- 고객명칭 -->
                    </th>
                    <td><input id="sCustNm" name="sCustNm"
                        class="form_input" /></td>
                    <th scope="row"><spring:message
                            code="par.lbl.serPrsnGroup" />
                    </th>
                    <td><input id="sWkgrpNm" name="sWkgrpNm"
                        class="form_input" /></td>
                    <th scope="row"><spring:message
                            code="par.lbl.tecNm" />
                    </th>
                    <td><input id="sRealTecNm" name="sRealTecNm"
                        class="form_input" /></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- // tab start-->
    <div id="tabstripHeader" class="tab_area mt10">
        <ul>
            <li id="tabPartOutTarget" class="k-state-active"><spring:message
                    code="par.title.partOutTarget" />
            </li>
            <li id="tabPartOutEnd"><spring:message
                    code="par.title.partOutEnd" />
            </li>
        </ul>
        <!--tabstrip Header tab area -->
        <div class="mt0">
            <section class="group">
            <div class="header_area">
                <div class="btn_right"></div>
            </div>
            <div class="table_grid">
                <!-- targetReqHeaderGrid -->
                <div id="targetReqHeaderGrid"></div>
                <!-- targetReqHeaderGrid -->
            </div>
            </section>
        </div>
        <div class="mt0">
            <section class="group">
            <div class="header_area">
                <div class="btn_right"></div>
            </div>
            <div class="table_grid">
                <!-- targetReqHeaderEndGrid -->
                <div id="targetReqHeaderEndGrid"></div>
                <!-- targetReqHeaderEndGrid -->
            </div>
            </section>
        </div>
    </div>
    <!-- tabRoWorkInfo tab area -->

    <div class="hidden">
        <input type="hidden" id="parGiTp" name="parGiTp" /> <input
            type="hidden" id="parReqDocNo" name="parReqDocNo" /> <input
            type="hidden" id="roDocNo" name="roDocNo" /> <input
            type="hidden" id="roTp" name="roTp" /> <input type="hidden"
            id="parGiTp" name="parGiTp" /> <input type="hidden"
            id="resvDocNo" name="resvDocNo" /> <input type="hidden"
            id="borrowDocNo" name="resvDocNo" /> <input type="hidden"
            id="parReqStatCd" name="parReqStatCd" /> <input
            type="hidden" id="parReqStatNm" name="parReqStatNm" /> <input
            type="hidden" id="reqStartDt" name="reqStartDt" /> <input
            type="hidden" id="custNm" name="custNm" /> <input
            type="hidden" id="custCd" name="custCd" /> <input
            type="hidden" id="carNo" name="carNo" /> <input
            type="hidden" id="vinNo" name="vinNo" /> <input
            type="hidden" id="serPrsnId" name="serPrsnId" /> <input
            type="hidden" id="driverId" name="driverId" /> <input
            type="hidden" id="driverNm" name="driverNm" /> <input
            type="hidden" id="carOwnerId" name="carOwnerId" /> <input
            type="hidden" id="carOwnerNm" name="carOwnerNm" />
    </div>

    <!-- // tab start-->
    <div id="tabstrip" class="tab_area mt10">
        <ul>
            <li id="tabPartOutStock" class="k-state-active"><spring:message
                    code="par.title.partOutStock" />
            </li>
            <li id="tabRoWorkInfo"><spring:message
                    code="par.title.roWorkInfo" />
            </li>
            <li id="tabPartsBorrowInfo"><spring:message
                    code="par.title.partOutStockBorrow" />
            </li>
            <li id="tabPartsReserve"><spring:message
                    code="par.title.issueReqResvReadyAct" />
            </li>
        </ul>
        <!--tabPartOutStock tab area -->
        <div class="mt0">
            <section class="group">
            <div class="header_area">
                <div class="btn_right">
                </div>
            </div>

            <div class="btn_right_absolute">
            <table>
            <tr>
                <td>
                    <div style="width:400px">
                    <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:37%;">
                        <col style="width:13%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                        <th scope="row"><spring:message code="par.lbl.itemInnerOutTotQty" /></th>
                        <td><input id="sItemTotQty" data-type="number" class="form_numeric ar" readonly /></td>
                        <th scope="row"><spring:message code="par.lbl.itemInnerOutTotAmt" /></th>
                        <td><input id="sItemTotAmt" data-type="number" class="form_numeric ar" readonly /></td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                </td>
                <td></td>
                <td>
                    <button type="button" id="btnPrint02" class="btn_s btn_s_min5 "><spring:message code="par.btn.print" /></button>
                    <!--btnPrint  -->
                    <dms:access viewId="VIEW-D-11749" hasPermission="${dms:getPermissionMask('READ')}">
                    <!-- btnOrderReq -->
                    <button id="btnOrderReq" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.orderReq" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11754" hasPermission="${dms:getPermissionMask('READ')}">
                    <!-- btnPakage -->
                    <button type="button" id="btnPakage" class="btn_s btn_s_min5"><spring:message code="par.btn.pakage" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11753" hasPermission="${dms:getPermissionMask('READ')}">
                    <!-- btnPartsAdd -->
                    <button type="button" id="btnPartsAdd" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.rowAdd" /></button>
                    <button type="button" id="btnAddSVC" name="btnAddSVC" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.rowAdd" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11748" hasPermission="${dms:getPermissionMask('READ')}">
                    <!-- returnPartsAdd -->
                    <button type="button" id="btnPartsReturnAdd" class="btn_s btn_s_min5 hidden"> <spring:message code="par.btn.returnPartsAdd" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11752" hasPermission="${dms:getPermissionMask('READ')}">
                    <!--rowDel  -->
                    <button type="button" id="btnDel" class="btn_s btn_s_min5"><spring:message code="par.btn.rowDel" /></button>
                    </dms:access>

                </td>
            </tr>
            </table>
            </div>
            <div class="table_grid">
                <!-- targetReqDetailGrid -->
                <div id="targetReqDetailGrid" class="resizable_grid"></div>
                <!-- targetReqDetailGrid -->
            </div>
            </section>
        </div>
        <!-- tabRoWorkInfo tab area -->

        <div class="mt0">
            <section class="group">
            <div class="header_area">
                <div class="btn_right"></div>
            </div>
            <div class="table_grid">
                <div id="targetLbrGrid" class="resizable_grid"></div>
            </div>
            </section>
        </div>

        <div class="mt0">
            <section class="group">
            <div class="header_area">
                <div class="btn_right"></div>
            </div>
            <div class="btn_right_absolute">
                <dms:access viewId="VIEW-D-11751"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnIssueOutMove01"
                        name="btnIssueOutMove01"
                        class="btn_s btn_s_min5">
                        <spring:message code="par.btn.issueOutMove" />
                    </button>
                    <!--issueOutMove  -->
                </dms:access>
            </div>
            <div class="table_grid">
                <div id="targetReqBorrowGrid" class="resizable_grid"></div>
            </div>
            </section>
        </div>

        <div class="mt0">
            <section class="group">
            <div class="header_area">
                <div class="btn_right"></div>
            </div>
            <div class="btn_right_absolute">
                <dms:access viewId="VIEW-D-11750"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnIssueOutMove02"
                        name="btnIssueOutMove02"
                        class="btn_s btn_s_min5">
                        <spring:message code="par.btn.issueOutMove" />
                    </button>
                    <!--issueOutMove  -->
                </dms:access>
            </div>
            <div class="table_grid">
                <div id="targetPartsReserveGrid" class="resizable_grid"></div>
            </div>
            </section>
        </div>
    </div>
    <!-- // tab end --> </section>
    <!-- //issueReqMng -->
</div>

<!-- script -->
<script>
//parGiTp
var parGiTpList = [],
    gVatCd = Number("${vatCd}");
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//parGiTpSr
var parGiTpSrList = [];
<c:forEach var="obj" items="${parGiTpSrList}">
parGiTpSrList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpSrMap = {};
$.each(parGiTpSrList, function(idx, obj){
    parGiTpSrMap[obj.cmmCd] = obj.cmmCdNm;
});
//etcGiTp
var etcGiTpList = [];
<c:forEach var="obj" items="${etcGiTpList}">
etcGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var etcGiTpMap = {};
$.each(etcGiTpList, function(idx, obj){
    etcGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd02
var partsParReqStatCdList02 = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
    if("${obj.cmmCd}" !== '03'){
        partsParReqStatCdList02.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = {};
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
var borrowStatCdList = [];
//borrowStatCdList
<c:forEach var="obj" items="${borrowStatCdList}" varStatus="status">
borrowStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var borrowStatCdMap = {};
$.each(borrowStatCdList, function(idx, obj){
    borrowStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
var carlineCdList = [],
carlineCdObj = {};
<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//roStatusCdList
var roStatusCdList = [],
roStatusCdAllList = [];
<c:forEach var="obj" items="${roStatusCdList}">
if("${obj.cmmCd}" == "01" || "${obj.cmmCd}" == "02"){
    roStatusCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
roStatusCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatusCdMap = {},
roStatusCdAllMap = {};
$.each(roStatusCdList, function(idx, obj){
    roStatusCdMap[obj.cmmCd] = obj.cmmCdNm;
});
$.each(roStatusCdAllList, function(idx, obj){
    roStatusCdAllMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = {};
$.each(roTpCdList, function(idx, obj){
    roTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//lbrTpCdList
var lbrTpCdList = [];
<c:forEach var="obj" items="${lbrTpCdList}">
lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdMap = {};
$.each(lbrTpCdList, function(idx, obj){
    lbrTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//tecCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.usrId}", "tecNm":"${obj.usrNm}"});
</c:forEach>
var tecCdMap = {};
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});
//service parts out switch
var partRcvYnValue = "N";
<c:forEach var="obj" items="${partRcvYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    partRcvYnValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = {};
$.each(crTpList, function(idx, obj){
    crTpMap[obj.cmmCd] = obj.cmmCdNm;
});

//공통코드:결제유형 01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
//공통코드:결제유형 01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
var paymTpCdList  = []; //전부
var paymTpCdList1 = []; //보증
var paymTpCdList2 = []; //보험
var paymTpCdList3 = []; //기타고객 , 고객
var paymTpCdList4 = []; //딜러
var paymTpCdList5 = []; //보증(K-Type)

<c:forEach var="obj" items="${paymTpCdList}">
<c:if test='${obj.useYn eq "Y"}' >
    <c:if test='${(obj.remark1 eq "01")}'> //보증
        paymTpCdList1.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "02" or obj.remark1 eq "03"}'>//보험
        paymTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "03"}'>//고객
        paymTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "04"}'>//딜러
        paymTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${(obj.remark1 eq "01") or (obj.remark1 eq "03")}'> //보증(K-Type)
        paymTpCdList5.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var paymTpCdArr = {};
$.each(paymTpCdList, function(idx, obj){
    paymTpCdArr[obj.cmmCd] = obj.cmmCdNm;
});

if(dms.string.isEmpty(gVatCd)){
   // gVatCd = .16;
	 gVatCd = .13;
}

//order request popup Func
var issueReqPopupButtonWindow;
function selectIssueReqPopupButtonWindow(dataItem){
    issueReqPopupButtonWindow = dms.window.popup({
        windowId:"issueReqPopupButtonWindow"
        ,title:false
        ,width:400
        ,height:120
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReqCheckPopup.do'/>"
            ,data:{
                "reqStrgeCdList":dataItem
                ,"callbackFunc":function(data){
                    // order reqeust y or n
                    if(data.flag == "Y"){
                        $("#btnOrderReq").click();
                    }
                }
            }
        }
    });
}

//order retrun popup Func
var issueReturnPopupButtonWindow;
function selectIssueReturnPopupButtonWindow(gridObj, selectedItems, parReqStatCd, outItemList, endQtyItemTot){

    if(endQtyItemTot <= 0){
        //returnPartsQty count over check message
        dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.lbl.itemReturnCompleteMsg' />");

        return false;
    }else{
        issueReturnPopupButtonWindow = dms.window.popup({
            windowId:"issueReturnPopupButtonWindow"
            ,title:""
            ,width:500
            ,height:450
            ,modal:true
            ,content:{
                url:"<c:url value='/par/ism/issueReq/selectIssueReturnCheckDetailPopup.do'/>"
                ,data:{
                    "receiveId":selectedRowDetailItem.receiveId
                    ,"endQty":selectedRowDetailItem.endQty
                    ,"endQtyItemTot":endQtyItemTot
                    ,"endQtyTot":outItemList[selectedRowDetailItem.itemCd+selectedRowDetailItem.parReqDocStockLineNo+selectedRowDetailItem.reqStrgeCd]
                    ,"callbackFunc":function(data){
                        //receive y or n
                        if(data.flag == "Y"){

                            var dataItems = [ ],
                            grid = gridObj.grid,
                            tabIndex = gridObj.tabIndex,
                            vSerPrsnId  = "",
                            vCustCd  = "",
                            vCustNm  = "",
                            vVinNo  = "",
                            vCarNo  = "",
                            //set selected Item
                            dataItems = selectedItems;
                            //checked list.
                            for (i = 0; i < dataItems.length; i++) {
                                var item  = dataItems[i];
                                item.receiveId = data.returnNm;//반품인.
                                item.returnId = data.returnNm;//반품인.
                                item.resvQty = data.returnPartsQty;//반품수량.
                                item.endQty = data.returnPartsQty;//반품수량.
                                item.returnPartsQty = data.returnPartsQty;//반품수량.
                                item.itemAmt = Math.round(Number(item.itemPrc) * Number(data.returnPartsQty) * 100)/100;//부품금액.
                                item.taxDdctAmt = Math.round((Math.round(Number(item.itemPrc) * Number(data.returnPartsQty) * 100)/100) / ( 1 + gVatCd ) * 100)/100;
                                item.taxAmt = item.itemAmt - item.taxDdctAmt;
                                item.movingAvgAmt = Math.round(Number(item.movingAvgPrc) * Number(data.returnPartsQty) * 100)/100;//부품원가금액.
                                item.movingAvgTaxDdctAmt = Math.round(Number(item.movingAvgTaxDdctPrc) * Number(data.returnPartsQty) * 100)/100;//부품원가금액.
                                item.remark = data.remark;//비고
                                item.readyRegDt = null;
                            }

                            if(tabIndex === 0){
                                vSerPrsnId  = $("#serPrsnId").val();
                                vCustCd  = $("#custCd").val();
                                vCustNm  = $("#custNm").val();
                                vVinNo  = $("#vinNo").val();
                                vCarNo  = $("#carNo").val();
                            }else{
                                vCustCd  = dataItems[0].custCd;
                                vCustNm  = dataItems[0].custNm;
                            }

                            var issuePartsOutVO = {
                                dlrCd:""
                                ,giDocNo:dataItems[0].giDocNo
                                ,giDocTp:parReqStatCd
                                ,giDocStatCd:parReqStatCd
                                ,cancYn:"N"
                                ,parReqDocNo:dataItems[0].parReqDocNo
                                ,roDocNo:dataItems[0].roDocNo
                                ,roTp:dataItems[0].roTp
                                ,pltCd:""
                                ,serPrsnId:vSerPrsnId
                                ,custCd:vCustCd
                                ,custNm:vCustNm
                                ,vinNo:vVinNo
                                ,carNo:vCarNo
                                ,mvtDocYyMm:""
                                ,mvtDocNo:""
                                ,parGiTp:dataItems[0].parGiTp
                                ,regUsrId:null
                                ,regDt:null
                                ,updtUsrId:null
                                ,updtDt:null
                            }

                            var issueReqSaveVO = {
                                "issuePartsOutVO":issuePartsOutVO
                                ,"issueReqDetailVO":dataItems
                                ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
                            };

                            $.ajax({
                                url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutInves.do' />"
                                ,data:JSON.stringify(issueReqSaveVO)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,success:function(jqXHR, textStatus){

                                    if(tabIndex === 0){
                                        grid.dataSource.read();
                                        $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                                        $("#targetReqHeaderEndGrid").data("kendoExtGrid").dataSource.read();
                                    }else{
                                        $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.read();
                                    }

                                    //return complete message.
                                    dms.notification.success("<spring:message code='par.lbl.returnCnfm' var='returnCnfm' /><spring:message code='global.info.successMsg' arguments='${returnCnfm}' />");
                                }
                                ,beforeSend:function(xhr){
                                    dms.loading.show($("#resizableContainer"));
                                }
                                ,complete:function(xhr,status){
                                    dms.loading.hide($("#resizableContainer"));
                                }
                            });
                        }
                    }
                }
            }
        });
    }


}
//order receive popup Func
var issueReceivePopupButtonWindow;
function selectIssueReceivePopupButtonWindow(gridObj, selectedItem, parReqStatCd){
    issueReceivePopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePopupButtonWindow"
        ,title:""
        ,width:500
        ,height:400
        ,modal:true
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceiveCheckDetailPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    //receive y or n
                    if(data.flag == "Y"){

                        var dataItems = [ ],
                        grid = gridObj.grid,
                        tabIndex = gridObj.tabIndex,
                        parGiTp = gridObj.parGiTp,
                        vSerPrsnId  = "",
                        vCustCd  = "",
                        vCustNm  = "",
                        vVinNo  = "",
                        vCarNo  = "";
                        //set selected Item
                        dataItems = selectedItem;
                        //checked list.
                        for (i = 0; i < dataItems.length; i++) {
                            var item  = dataItems[i];
                            item.receiveId = data.receiveNm;
                        }

                        if(tabIndex === 0){
                            vSerPrsnId  = $("#serPrsnId").val();
                            vCustCd  = $("#custCd").val();
                            vCustNm  = $("#custNm").val();
                            vVinNo  = $("#vinNo").val();
                            vCarNo  = $("#carNo").val();
                        }else{
                            vCustCd  = dataItems[0].custCd;
                            vCustNm  = dataItems[0].custNm;
                        }

                        var issuePartsOutVO = {
                            dlrCd:""
                            ,giDocNo:dataItems[0].giDocNo
                            ,giDocTp:parReqStatCd
                            ,giDocStatCd:parReqStatCd
                            ,cancYn:"N"
                            ,parReqDocNo:dataItems[0].parReqDocNo
                            ,parGiTp:parGiTp
                            ,roDocNo:dataItems[0].roDocNo
                            ,roTp:dataItems[0].roTp
                            ,pltCd:""
                            ,serPrsnId:vSerPrsnId
                            ,custCd:vCustCd
                            ,custNm:vCustNm
                            ,vinNo:vVinNo
                            ,carNo:vCarNo
                            ,mvtDocYyMm:""
                            ,mvtDocNo:""
                            ,regUsrId:null
                            ,regDt:null
                            ,updtUsrId:null
                            ,updtDt:null
                        }

                        var issueReqSaveVO = {
                            "issuePartsOutVO":issuePartsOutVO
                            ,"issueReqDetailVO":dataItems
                            ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
                        };

                        $.ajax({
                            url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutInves.do' />"
                            ,data:JSON.stringify(issueReqSaveVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(jqXHR, textStatus){

                                if(tabIndex === 0){
                                    grid.dataSource.read();
                                    $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                                    $("#targetReqHeaderEndGrid").data("kendoExtGrid").dataSource.read();
                                }else{
                                    $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.read();
                                }

                                //parts Out complete message.
                                dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                            }
                            ,beforeSend:function(xhr){
                                dms.loading.show($("#resizableContainer"));
                            }
                            ,complete:function(xhr,status){
                                dms.loading.hide($("#resizableContainer"));
                            }
                        });
                    }
                }
            }
        }
    });
}

//order receive parts out print popup Func
var issueReceivePartsOutPrintPopupButtonWindow;
function selectIssueReceivePartsOutPrintPopupButtonWindow(bFlag){

    var giDocNoListStrBody = "";    /*출고문서리스트*/
    var giDocNoListStrEnd = "";     /*출고문서 쿼리 리스트*/

    if(bFlag){//출고문서선택 팝업 호출없음.
        $.ajax({
            url:"<c:url value='/par/ism/issueReq/selectIssuePartsOutDetailMaxGiDocNoByKey.do' />"
            ,data:JSON.stringify({sParReqDocNo:$("#parReqDocNo").val()})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                var giDocNo = jqXHR.giDocNo;

                if(giDocNo !== null){//출고문서번호 있을때
                    giDocNoListStrEnd = "('"+giDocNo+"')";
                    var urlInfo = "<c:url value='/ReportServer?reportlet=par/selectIssueReqServiceWorkPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sPltCd=${pltCd}&sParReqDocNo="+$("#parReqDocNo").val()+"&sGiDocNoList="+giDocNoListStrEnd;
                    //파마메터 : title, url, viewId, isReload
                    //parent._createOrReloadTabMenu("<spring:message code='par.title.receiverPrintDoc' />", urlInfo,"VIEW-D-10646", true);
                    //파인리포트 빠른인쇄 기능 적용 by 한강석 2017.08.02
                    dms.fineReport.print(urlInfo, false, false);
                }else{
                    //giDocNo empty message
                    dms.notification.info("<spring:message code='par.lbl.giDocNo' var='giDocNo' /><spring:message code='par.info.itemInsertNotMsg' arguments='${giDocNo}' />");
                }
            }
        });
    }else{//출고문서선택 팝업 호출
        issueReceivePartsOutPrintPopupButtonWindow = dms.window.popup({
            windowId:"issueReceivePartsOutPrintPopupButtonWindow"
            ,title:""
            ,width:500
            ,height:312
            ,content:{
                url:"<c:url value='/par/ism/issueReq/selectIssueReceivePartsOutPrintPopup.do'/>"
                ,data:{
                    "parReqDocNo":$("#parReqDocNo").val()
                    ,"callbackFunc":function(data){

                        if(data.flag =="Y"){
                            var giDocNoList = data.giDocNoList;

                            for (i = 0; i < giDocNoList.length; i++) {
                                var item = giDocNoList[i];
                                giDocNoListStrBody += "'"+item.giDocNo+"',";
                            }

                            giDocNoListStrEnd = "("+giDocNoListStrBody.substring(0,giDocNoListStrBody.length-1)+")";

                            issueReceivePartsOutPrintPopupButtonWindow.close();

                            var urlInfo = "<c:url value='/ReportServer?reportlet=par/selectIssueReqServiceWorkPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sPltCd=${pltCd}&sParReqDocNo="+$("#parReqDocNo").val()+"&sGiDocNoList="+giDocNoListStrEnd;
                            //파마메터 : title, url, viewId, isReload
                            //parent._createOrReloadTabMenu("<spring:message code='par.title.receiverPrintDoc' />", urlInfo,"VIEW-D-10646", true);

                            //파인리포트 빠른인쇄 기능 적용 by 한강석 2017.08.02
                            dms.fineReport.print(urlInfo, false, false);
                        }
                    }
                }
            }
        });
    }
}

//page init Func
function pageInit(){
   var minDate = new Date("${sysStartDate}"),
       maxDate = new Date("${sysEndDate}"),
       toYY,
       toMM,
       toDD,
       frYY,
       frMM,
       frDD;

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    //header grid selected row item.
    selectedRowHeaderItem = {};
    //detail grid selected row item.
    selectedRowDetailItem = {};
    //detail grid selected row return item.
    selectedRowDetailReturnItem = {};

    $("#sParGiTp").data("kendoExtDropDownList").select(0);
    $("#sParReqDocNo").val("");
    $("#sParReqStatCd").data("kendoExtDropDownList").select(0);
    $("#sParReqStatCd02").data("kendoExtDropDownList").select(0);
    $("#sReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sReqStartDt").data("kendoExtMaskedDatePicker").value(minDate);
    $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(maxDate);

    $("#sSaId").data("kendoExtDropDownList").select(0);
    $("#sCarNo").val("");
    $("#sCustNm").val("");

    $("#parGiTp").val("");
    $("#parReqDocNo").val("");
    $("#roDocNo").val("");
    $("#roTp").val("");
    $("#parGiTp").val("");
    $("#resvDocNo").val("");
    $("#parReqStatCd").val("");
    $("#parReqStatNm").val("");
    $("#reqStartDt").val("");

    $("#carNo").val("");
    $("#vinNo").val("");
    $("#serPrsnId").val("");

    $("#driverId").val("");
    $("#driverNm").val("");
    $("#carOwnerId").val("");
    $("#carOwnerNm").val("");

    $("#sCarlineCd").data("kendoExtDropDownList").select(0);
    $("#sWkgrpNm").val("");
    $("#sRealTecNm").val("");

    $("#chkAll").prop("checked", false);
    $("#chkAll02").prop("checked", false);
    $("#chkAll03").prop("checked", false);

    //grid datasoure data clear.
    $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqHeaderEndGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetLbrGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetPartsReserveGrid").data("kendoExtGrid").dataSource.data([]);

    //button disable
    buttonEnableDisable(false, null, null, null);
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag, parReqStatCd, parGiTp, roStatCd){
    //page button list
    $("#btnInvReq").data("kendoButton").enable(bFlag);

    if(roStatCd === null){
        $("#btnPrint").data("kendoButton").enable(false);
    }else{
        $("#btnPrint").data("kendoButton").enable(true);
    }

    $("#btnInvReqSave").data("kendoButton").enable(bFlag);

    //parts button list
    $("#btnPrint02").data("kendoButton").enable(bFlag);
    $("#btnPakage").data("kendoButton").enable(bFlag);
    $("#btnOrderReq").data("kendoButton").enable(bFlag);
    //$("#btnPartsAdd").data("kendoButton").enable(bFlag);
    $("#btnAddSVC").data("kendoButton").enable(bFlag);
    $("#btnPartsReturnAdd").data("kendoButton").enable(bFlag);
    $("#btnInvReturn").data("kendoButton").enable(bFlag);
    $("#btnDel").data("kendoButton").enable(bFlag);

    $("#btnIssueOutMove01").data("kendoButton").enable(bFlag);
    $("#btnIssueOutMove02").data("kendoButton").enable(bFlag);
}

//updateIssuePartsRoes Func
function updateIssuePartsRoes(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dataItems = [ ];

    if(rowCnt == 0){
        //line select message
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqDbYnCnt = 0;
        //checked list
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);
            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }

            //요청수량보다 가용수량이 적을 때
            if(item.reqQty > (item.avlbStockQty + item.resvStockQty)){
                dataItems.push(item);
            }
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd message
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
             //save continue message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }

        var multiIssueReqDetailPartsRoes = { insertList:[], updateList:dataItems, deleteList:[] };

        $.ajax({
            url:"<c:url value='/par/pcm/purcRqst/multiIssueReqDetailPartsRoes.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsRoes)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // orderReq complete message.
                dms.notification.success("<spring:message code='par.lbl.orderReq' var='orderReq' /><spring:message code='global.info.successMsg' arguments='${orderReq}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}

//RO InvsReq Func.
function updateIssuePartsInves(gridObj, parReqStatCd){

    var tabIndex = gridObj.tabIndex,
    grid = gridObj.grid,
    parGiTp = gridObj.parGiTp,
    items = grid.dataSource.data(),
    rowCnt = 0,
    issueReqItemCheckCnt = 0,
    issueReqGiStrgeCdCheckCnt = 0,
    issueReqGiLocCdCheckCnt = 0,
    issueReqCheckCnt = 0,
    issueReqDbYnCnt = 0,
    issueReqRequestCnt = 0,
    issueReqIssueComItemCnt = 0,
    issueReqIssueEndQtyZeroCnt = 0,
    issueReqIssueAblvStockCnt = 0,
    issueReqIssueItemPriceAmt = 0,
    outItemStockKey = "",
    outItemStockList = {},
    dataReqStrgeCdItems = [ ];
    dataItems = [ ];

    //checked list.
    for (i = 0; i < items.length; i++) {

        var item = items[i];
        var elementRow = null;
        if(parGiTp === "RO"){
            elementRow = grid.tbody.find(".checkbox01")[i];
        }else if(parGiTp === "BR"){
            elementRow = grid.tbody.find(".checkbox02")[i];
        }else if(parGiTp === "RE"){
            elementRow = grid.tbody.find(".checkbox03")[i];
        }else{
            return false;
        }

        outItemStockKey = item.itemCd+item.reqStrgeCd;

        if(outItemStockList[outItemStockKey] == undefined){
            outItemStockList[outItemStockKey] = item.avlbStockQty + item.resvStockQty;
        }else{
            outItemStockList[outItemStockKey] = item.avlbStockQty + item.resvStockQty;
        }

        if(parGiTp ==="RO"){
            if(item.dbYn === "N"){
                issueReqDbYnCnt++;
            }
        }

        if(elementRow.checked){
            if(item.parReqStatCd == "01"){//요청건만

                if(item.endQty > (item.avlbStockQty+item.resvStockQty)){
                    issueReqCheckCnt++;
                    dataReqStrgeCdItems.push(item);
                }
                if(item.itemCd == ""){
                    issueReqItemCheckCnt++;
                }
                if(item.giStrgeCd == ""){
                    issueReqGiStrgeCdCheckCnt++;
                }
                if(item.giLocCd == ""){
                    issueReqGiLocCdCheckCnt++;
                }
                if(item.comItemCd != undefined && item.comItemCd != ""){
                    issueReqIssueComItemCnt++;
                }

                if(item.endQty <= 0 || item.resvQty <= 0){
                    issueReqIssueEndQtyZeroCnt++;
                }

                //부품금액 = 0
                if(item.roTp !== "02"){//RO유형  보증 아닐 때 유효성 체크.
                    if(item.itemAmt < 0){
                        issueReqIssueItemPriceAmt++;
                    }
                }

                //DB 저장유무.
                if(item.dbYn == "N"){
                    issueReqDbYnCnt++;
                }

                dataItems.push(item);
                issueReqRequestCnt++;
            }
            rowCnt++;
        }
    }

    if(issueReqDbYnCnt > 0){
        //is Save Run message
        dms.notification.info("<spring:message code='global.info.isSaveRun' />");
        return false;
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(issueReqRequestCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.issueReqParts' var='issueReqParts' /><spring:message code='par.info.itemInsertNotMsg' arguments='${issueReqParts}' />");
        return false;
    }

    if(issueReqItemCheckCnt > 0){
        //itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    //구매요청 팝업 호출.
    if(issueReqCheckCnt > 0){
        //order Req popup show.
        selectIssueReqPopupButtonWindow(dataReqStrgeCdItems);
    }else{

        if(issueReqGiStrgeCdCheckCnt > 0){
            //giStrgeCd check message
            dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giStrgeCd}' />");
            return false;
        }

        if(issueReqIssueComItemCnt > 0){
            //comItemCd check message
            dms.notification.info("<spring:message code='par.lbl.issueComItemCd' var='comItemCd' /><spring:message code='par.info.itemInsertUseMsg' arguments='${comItemCd}' />");
            return false;
        }

        if(issueReqIssueEndQtyZeroCnt > 0){
            //resv count zero check message
            dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.issueOutZeroMsg' arguments='${giQty}' />");
            return false;
        }

        //최종 출고 수량 체크.
        for(j=0;j < dataItems.length;j++){
            var outItem = dataItems[j];
            var outItemKey = outItem.itemCd + outItem.reqStrgeCd;

            if(outItemStockList[outItemKey] >= outItem.endQty){
                outItemStockList[outItemKey] = outItemStockList[outItemKey] - outItem.endQty;
            }else{
                issueReqIssueAblvStockCnt++;
            }
        }

        if(issueReqIssueAblvStockCnt > 0){
            dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${giQty},${avlbStockQty}' />");
            return false;
        }

        if(issueReqIssueItemPriceAmt > 0){
            dms.notification.info("<spring:message code='par.info.salePriceZeroMsg' />");
            return false;
        }

        //정비 스위치 기능.
        var wrkStatCd = selectedRowHeaderItem.wrkStatCd;
        if(partRcvYnValue == "Y" && wrkStatCd == "01"){
            dms.notification.info("<spring:message code='par.info.partOutSwitchMsg'/>");
        }else{
            //receive Popup show.
            selectIssueReceivePopupButtonWindow(gridObj, dataItems, parReqStatCd);
        }

    }
}
//RO InvsReqReturn Func.
function updateIssuePartsReturnInves(gridObj, parReqStatCd){

    var tabIndex = gridObj.tabIndex,
    grid = gridObj.grid,
    parGiTp = gridObj.parGiTp,
    items = grid.dataSource.data(),
    length = items.length,
    rowCnt = 0,
    issueReqItemCheckCnt = 0,
    issueReqGiStrgeCdCheckCnt = 0,
    issueReqGiLocCdCheckCnt = 0,
    issueReqCheckCnt = 0,
    issueReqDbYnCnt = 0,
    issueReqRequestReturnCnt = 0,
    issueReqRequestReturnMinCnt = 0,
    issueReqRequestReturnMaxCnt = 0,
    outItemList = {},
    dataItems = [ ];

    //checked list.
    for(i = length-1; i>=0;i--){

        var item = items[i];
        var itemCdKey = item.itemCd+item.parReqDocStockLineNo+item.reqStrgeCd;
        var elementRow = null;
        if(parGiTp === "RO"){
            elementRow = grid.tbody.find(".checkbox01")[i];
        }else if(parGiTp === "BR"){
            elementRow = grid.tbody.find(".checkbox02")[i];
        }else if(parGiTp === "RE"){
            elementRow = grid.tbody.find(".checkbox03")[i];
        }else{
            return false;
        }

        if(item.parReqStatCd == "02" && item.giDocStatCd == "02"){//출고완료 부품만

            if(outItemList[itemCdKey] == undefined){
                outItemList[itemCdKey] = item.endQty;
            }else{
                outItemList[itemCdKey] = outItemList[itemCdKey] + item.endQty;
            }

        }else if(item.parReqStatCd == "03" && item.giDocStatCd == "03"){//반품완료 부품만

            if(outItemList[itemCdKey] == undefined){
                outItemList[itemCdKey] = - (item.endQty * -1);
            }else{
                outItemList[itemCdKey] = outItemList[itemCdKey] - (item.endQty * -1);
            }

        }

        if(elementRow.checked){

            if(item.parReqStatCd == "03" && item.giDocStatCd == "01"){//부품반품 및 출고등록 01 부품만

                item.returnPartsQty = item.endQty;//출고수량 ==>반품수량
                dataItems.push(item);
                issueReqRequestReturnCnt++;
            }

            rowCnt++;
        }
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(rowCnt > 1){
        // one row select message.
        dms.notification.info("<spring:message code='par.info.onlyOneRowSelectMsg' />");
        return false;
    }

    //최종 반품 수량 체크.
    for(j=0;j < dataItems.length;j++){
        var returnItem = dataItems[j];
        var returnItemCdKey = returnItem.itemCd+returnItem.parReqDocStockLineNo+returnItem.reqStrgeCd;
        outItemList[returnItemCdKey] = outItemList[returnItemCdKey] - (returnItem.endQty * -1);

        if(outItemList[returnItemCdKey] < 0 ){
            issueReqRequestReturnMaxCnt++;
        }
    }

    if(selectedRowDetailItem.parReqStatCd === undefined){
        // 반품처리 할 부품을 선택하세요.
        // return item select message
        dms.notification.info("<spring:message code='par.lbl.returnParts' var='returnParts' /><spring:message code='par.info.stdPrcSelectMsg' arguments='${returnParts}' />");
        return false;
    }else if(selectedRowDetailItem.parReqStatCd !== "02"){//출고완료부품만.
        // end item select message
        dms.notification.info("<spring:message code='par.lbl.giEndParts' var='giEndParts' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${giEndParts}' />");
        return false;
    }
    else{
        //반품행 추가 처리.
        //반품 허용 카운트 체크.(최대 10개)
        var itemViews = grid.dataSource.view(),
        length = itemViews.length,
        endQtyItemTot = 0,
        returnPartsMaxCnt = 0;

        endQtyItemTot = selectedRowDetailItem.endQty;

        for (i = length-1; i>=0; i--){
            var item = items[i];
            if(item.parReqStatCd === "03" && item.itemCd ===selectedRowDetailItem.itemCd && item.reqStrgeCd === selectedRowDetailItem.reqStrgeCd && item.roLineNo === selectedRowDetailItem.roLineNo && item.parReqDocStockLineNo === selectedRowDetailItem.parReqDocStockLineNo && item.roTp === selectedRowDetailItem.roTp){
                returnPartsMaxCnt++;
                endQtyItemTot += item.endQty;
                endQtyItemTot = Number(endQtyItemTot.toFixed(3));
            }
        }

        //반품 그리드 부품 추가.
        if(returnPartsMaxCnt < 110){

            var vEndQty = -1;// 기본 반품수량 -1
            var vItemPrc = selectedRowDetailItem.itemPrc;//단가정보 마이너스  제외.
            var vItemAmt = Math.round(Number(selectedRowDetailItem.itemPrc) * Number(vEndQty)*100)/100;
            var vTaxDdctAmt = Math.round(vItemAmt / ( 1 + gVatCd )*100)/100;
            var vTaxAmt = vItemAmt - vTaxDdctAmt;

            var IssueReqDetailVO = {
                "rnum":selectedRowDetailItem.rnum
                ,"dlrCd":null
                ,"pltCd":null
                ,"parReqDocNo":selectedRowDetailItem.parReqDocNo
                ,"parReqDocLineNo":selectedRowDetailItem.parReqDocLineNo
                ,"parReqDocStockLineNo":selectedRowDetailItem.parReqDocLineNo
                ,"parReqStatCd":"03"
                ,"purcReqNo":"01"
                ,"reqStrgeCd":selectedRowDetailItem.reqStrgeCd
                ,"cancYn":"N"
                ,"parGiTp":selectedRowDetailItem.parGiTp
                ,"roDocNo":selectedRowDetailItem.roDocNo
                ,"roStatCd":selectedRowDetailItem.roStatCd
                ,"roTp":selectedRowDetailItem.roTp
                ,"roLineNo":selectedRowDetailItem.roLineNo
                ,"resvDocNo":selectedRowDetailItem.resvDocNo
                ,"resvDocLineNo":0
                ,"grStrgeCd":selectedRowDetailItem.grStrgeCd
                ,"giStrgeCd":selectedRowDetailItem.giStrgeCd
                ,"giLocCd":selectedRowDetailItem.giLocCd
                ,"dbItemCd":selectedRowDetailItem.itemCd
                ,"pkgDocNo":selectedRowDetailItem.pkgDocNo
                ,"pkgItemCd":selectedRowDetailItem.pkgItemCd
                ,"itemCd":selectedRowDetailItem.itemCd
                ,"itemNm":selectedRowDetailItem.itemNm
                ,"unitCd":selectedRowDetailItem.unitCd
                ,"reqQty":selectedRowDetailItem.reqQty
                ,"endQty":vEndQty
                ,"avlbStockQty":selectedRowDetailItem.avlbStockQty
                ,"totStockQty":selectedRowDetailItem.totStockQty
                ,"resvStockQty":null
                ,"clamStockQty":null
                ,"grScheQty":null
                ,"giScheQty":null
                ,"resvQty":vEndQty
                ,"purcReqDt":null
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":"01"
                ,"dbYn":"N"
                ,"itemPrc":vItemPrc
                ,"movingAvgPrc":selectedRowDetailItem.movingAvgPrc
                ,"movingAvgTaxDdctPrc":selectedRowDetailItem.movingAvgTaxDdctPrc
                ,"movingAvgAmt":kendo.parseFloat(Math.round(Number(selectedRowDetailItem.movingAvgPrc) * Number(vEndQty) * 100)/100)
                ,"movingAvgTaxDdctAmt":kendo.parseFloat(Math.round(Number(selectedRowDetailItem.movingAvgTaxDdctPrc) * Number(vEndQty) * 100)/100)
                ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n4'))
                ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n4'))
                ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n4'))
                ,"receiveDt":null
                ,"receiveId":selectedRowDetailItem.receiveId //반품 시 출고완료 된 수령인 넣기.
                ,"returnPartsQty":vEndQty
                ,"mvtDocYyMm":selectedRowDetailItem.mvtDocYyMm
                ,"mvtDocNo":selectedRowDetailItem.mvtDocNo
                ,"returnDt":null
                ,"returnId":null
                ,"remark":null
                ,"readyRegDt":null
                ,"paymTp":selectedRowDetailItem.paymTp
                ,"paymCd":selectedRowDetailItem.paymCd
                ,"paymUsrNm":selectedRowDetailItem.paymUsrNm
                ,"partsPrcTp":selectedRowDetailItem.partsPrcTp
                ,"regUsrNm":"${usrNm}"
                ,"updtUsrNm":"${usrNm}"
            }
            //반품정보 넣기.
            selectedRowDetailReturnItem = selectedRowDetailItem;
            dataItems.push(IssueReqDetailVO);
            //반품팝업 호출.
            selectIssueReturnPopupButtonWindow(gridObj, dataItems, parReqStatCd, outItemList, endQtyItemTot);
        }else{
          // max retrun parts item select message
          dms.notification.info("<spring:message code='par.lbl.returnPartsMaxCnt' var='returnPartsMaxCnt' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${returnPartsMaxCnt}' />");
        }
    }
}


//updateIssuePartsSaves Func.
function updateIssuePartsSaves(parReqStatCd){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
    targetReqBorrowGrid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
    targetPartsReserveGrid = $("#targetPartsReserveGrid").data("kendoExtGrid"),
    targetReqHeaderGrid = $("#targetReqHeaderGrid").data("kendoExtGrid"),
    rows = grid.dataSource.data(),
    dataItems = [ ],
    issueReqItemQtyMinusCnt = 0,
    issueReqItemCheckCnt = 0;

    //checked list
    $.each(rows, function(idx, row){
        var item = row;
        if(item.itemCd == ""){
            issueReqItemCheckCnt++;
        }
        if(item.unitCd == "" || item.unitCd == null){
            item.unitCd = "EA";
        }

        if(item.parReqStatCd == "01" && item.resvQty <= 0){
            issueReqItemQtyMinusCnt++;
        }
        dataItems.push(item);
    });

    if(issueReqItemCheckCnt > 0){
        // itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    if(issueReqItemQtyMinusCnt > 0){
        // itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.itemReqZeroCntMsg' arguments='${giQty},0' />");
        return false;
    }

    var multiIssueReqDetails = grid.getCUDData("insertList", "updateList", "deleteList",["taxRate"]);
    if(grid.cudDataLength == 0){
        dms.notification.info("<spring:message code='global.info.required.change'/>");
        return false;
    }

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parGiTp":$("#parGiTp").val()
            ,"parReqStatCd":parReqStatCd
            ,"cancYn":"N"
            ,"roDocNo":$("#roDocNo").val()
            ,"roTp":$("#roTp").val()
            ,"resvDocNo":$("#resvDocNo").val()
            ,"pltCd":null
            ,"serPrsnId":$("#serPrsnId").val()
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":$("#vinNo").val()
            ,"carNo":$("#carNo").val()
            ,"carlineCd":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
        }
        ,"issueReqDetailVO":multiIssueReqDetails
        ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
        ,"reservationLaborVO":null
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/multiIssueReqDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            //destroy data clear and data reload
            grid.dataSource._destroyed = [];
            grid.dataSource.read();
            targetReqBorrowGrid.dataSource.read();
            targetPartsReserveGrid.dataSource.read();
            targetReqHeaderGrid.dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
        ,beforeSend:function(xhr){
            dms.loading.show($("#resizableContainer"));
        }
        ,complete:function(xhr,status){
            dms.loading.hide($("#resizableContainer"));
        }
    });

}

//updateIssuePartsBorrowSaves Func.
function updateIssuePartsBorrowSaves(gridObj){

    var tabIndex = gridObj.tabIndex,
    grid = gridObj.grid,
    items = grid.dataSource.data(),
    rowCnt = 0,
    borrowItemCnt = 0,
    dataItems = [ ];

    var paymInfo = getPaymTpList(selectedRowHeaderItem.roTp);

    //checked list.
    for (i = 0; i < items.length; i++) {
        var item = items[i];
        var elementRow = grid.tbody.find(".checkbox02")[i];

        if(elementRow.checked){
            if(item.borrowStatCd == "02"){
                borrowItemCnt++;

                item.paymTp = paymInfo.paymTp;
                item.paymCd = paymInfo.paymCd;
                item.paymUsrNm = paymInfo.paymUsrNm;
                item.partsPrcTp  = paymInfo.partsPrcTp;
                //부품이동 시 가격계산
                var vItem = setItemPriceInfo(item);

                dataItems.push(vItem);

            }
            rowCnt++;
        }
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(borrowItemCnt == 0){
        // borrow item selected message.
        dms.notification.info("<spring:message code='par.lbl.borrowItem' var='borrowItem' /><spring:message code='par.info.itemInsertNotMsg' arguments='${borrowItem}' />");
        return false;
    }

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parGiTp":$("#parGiTp").val()
            ,"parReqStatCd":"01"
            ,"cancYn":"N"
            ,"roDocNo":$("#roDocNo").val()
            ,"roTp":$("#roTp").val()
            ,"resvDocNo":$("#resvDocNo").val()
            ,"pltCd":null
            ,"serPrsnId":$("#serPrsnId").val()
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":$("#vinNo").val()
            ,"carNo":$("#carNo").val()
            ,"carlineCd":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
            ,"borrowDocNo":$("#borrowDocNo").val()
            ,"borrowStatCd":"02"
        }
        ,"issueReqDetailVO":dataItems
        ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
        ,"borrowStatCd":"05"//상태코드 : 차용대기 : 부품출고 시 정비차용확정
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/insertIssueBorrowDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            // destroy data clear and data reload
            grid.dataSource._destroyed = [];
            grid.dataSource.read();

            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

function setItemPriceInfo(item){
    var salePrcAmt = 0,
    itemQty = 0,
    prcTp = "01";

    prcTp = item.partsPrcTp;

    if(prcTp === "04"){//보증가
        salePrcAmt = item.grtePrc;
    }else if(prcTp === "03"){//보험가
        salePrcAmt = item.incPrc;
    }else{//일반가
        salePrcAmt = item.retlPrc;
    }

    itemQty = item.endQty;

    var vItemQty = itemQty;// 기본 출고수량 -1
    var vItemPrc = salePrcAmt;
    var vItemAmt = vItemPrc * vItemQty;
    var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vItemQty;
    var vTaxAmt = vItemAmt - vTaxDdctAmt;

    item.itemPrc = vItemPrc;
    item.itemAmt = kendo.parseFloat(kendo.toString(vItemAmt,'n4'));
    item.taxDdctAmt = kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n4'));
    item.taxAmt = kendo.parseFloat(kendo.toString(vTaxAmt,'n4'));

    return item;
}

//updateIssuePartsResvSaves Func.
function updateIssuePartsResvSaves(gridObj){

    var tabIndex = gridObj.tabIndex,
    grid = gridObj.grid,
    items = grid.dataSource.data(),
    rowCnt = 0,
    readyItemCnt = 0,
    dataItems = [ ];

    var paymInfo = getPaymTpList(selectedRowHeaderItem.roTp);

    //checked list.
    for (i = 0; i < items.length; i++) {
        var item = items[i];
        var elementRow = grid.tbody.find(".checkbox03")[i];

        if(elementRow.checked){

            if(item.readyStatCd == "03"){//예류만

                var salePrcAmt = 0,
                itemQty = 0,
                prcTp = "01";

                item.paymTp = paymInfo.paymTp;
                item.paymCd = paymInfo.paymCd;
                item.paymUsrNm = paymInfo.paymUsrNm;
                item.partsPrcTp  = paymInfo.partsPrcTp;
                //부품이동 시 가격계산
                var vItem = setItemPriceInfo(item);

                dataItems.push(vItem);

                readyItemCnt++;
            }
            rowCnt++;
        }
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(readyItemCnt == 0){
        // borrow item selected message.
        dms.notification.info("<spring:message code='par.lbl.invResvReadyAct' var='invResvReadyAct' /><spring:message code='par.info.itemInsertNotMsg' arguments='${invResvReadyAct}' />");
        return false;
    }

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parGiTp":$("#parGiTp").val()
            ,"parReqStatCd":"01"
            ,"roTp":selectedRowHeaderItem.roTp
            ,"cancYn":"N"
            ,"roDocNo":$("#roDocNo").val()
            ,"roTp":$("#roTp").val()
            ,"resvDocNo":$("#resvDocNo").val()
            ,"pltCd":null
            ,"serPrsnId":$("#serPrsnId").val()
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":$("#vinNo").val()
            ,"carNo":$("#carNo").val()
            ,"carlineCd":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
            ,"borrowDocNo":$("#borrowDocNo").val()
            ,"borrowStatCd":""
        }
        ,"issueReqDetailVO":dataItems
        ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
        ,"readyStatCd": "06"//변경할 준비수령상태코드 : 정비예약(06).
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/insertIssueResvDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            // destroy data clear and data reload
            grid.dataSource._destroyed = [];
            grid.dataSource.read();

            $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

// reqHeaderChanged
function selectTargetReqHeaderChanged(selectedItem){
    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);//parGiTp
    //buttonEnableDisable Func  RO상태 : 위탁확인, 수리서비스 일때 쓰기 작업 가능.
    var roStatCd = selectedItem.roStatCd;
    if(roStatCd === "01" || roStatCd === "02"){
        buttonEnableDisable(true, selectedItem.parReqStatCd, selectedItem.parGiTp, roStatCd);
    }else{
        buttonEnableDisable(false, selectedItem.parReqStatCd, selectedItem.parGiTp, roStatCd);
    }

    $("#parReqDocNo").val(selectedItem.parReqDocNo);    //parReqDocNo
    $("#roDocNo").val(selectedItem.roDocNo);            //roDocNo
    $("#roTp").val(selectedItem.roTp);                  //roTp
    $("#parGiTp").val(selectedItem.parGiTp);            //parGiTp
    $("#resvDocNo").val(selectedItem.resvDocNo);        //resvDocNo
    $("#parReqStatCd").val(selectedItem.parReqStatCd);  //parReqStatCd
    $("#parReqStatNm").val(partsParReqStatCdMap[selectedItem.parReqStatCd]);  //parReqStatNm
    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));     // regDt
    $("#custCd").val(selectedItem.custCd);              //custCd
    $("#custNm").val(selectedItem.custNm);              //custNm
    $("#carNo").val(selectedItem.carNo);                //carNo
    $("#vinNo").val(selectedItem.vinNo);                //vinNo
    $("#serPrsnId").val(selectedItem.serPrsnId);        //serPrsnId

    $("#driverId").val(selectedItem.driverId);          //driverId
    $("#driverNm").val(selectedItem.driverNm);          //driverNm
    $("#carOwnerId").val(selectedItem.carOwnerId);      //carOwnerId
    $("#carOwnerNm").val(selectedItem.carOwnerNm);      //carOwnerNm

    $("#borrowDocNo").val(selectedItem.borrowDocNo);    //borrowDocNo
    //targetReqDetailGrid
    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
    //targetReqBorrowGrid
    $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.read();
    //targetPartsReserveGrid
    $("#targetPartsReserveGrid").data("kendoExtGrid").dataSource.read();
    //targetLbrGrid
    $("#targetLbrGrid").data("kendoExtGrid").dataSource.read();


}
//package popup Func
var selectIssueWorkPackagePopup;
function selectWorkPackagePopupWindow(){
    selectIssueWorkPackagePopup = dms.window.popup({
        windowId:"selectIssueWorkPackagePopup"
        ,width:800
        ,height:350
        ,title:"<spring:message code='par.title.packageSelect' />"
        ,content:{
            url:"<c:url value='/par/cmm/selectIssuePackageWorkPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"multiple"
                ,"pkgTp":"02"//패키지유형코드 : 02(부품)
                ,"callbackFunc":function(parData, lbrData){

                    //partItems, lbrItems Add Func call
                    setPartsItemsAndLbrItems(parData, lbrData, "P");
                    selectIssueWorkPackagePopup.close();
                }
            }
        }
    });
}
//PartItemLbrItem Add Func
function setPartsItemsAndLbrItems(parData, lbrData, itemSendTp){
    var bDuplicateItemCheck = false;
    var bDuplicateItemConfirm = false;
    var parDataLn = parData.length;
    //중복부품 체크.
    for(var i=0; i < parDataLn; i++){
        var data = parData[i],
        sRnum = 0,
        sMaxRolineNo = 0,
        itemCheckCnt = 0,
        grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
        items = grid.dataSource.view(),
        length = items.length;

        for (j = length-1; j>=0;j--) {
            dataItem = items[j];
            //중복부품처리.
            if(dataItem.itemCd === data.itemCd){
                itemCheckCnt++;
            }

            if(itemCheckCnt > 0){
                break;
            }
        }

        if(itemCheckCnt > 0){
            bDuplicateItemCheck = true;
            break;
        }

    }

    //중복체크허용 확인창 호출
    if(bDuplicateItemCheck){
        $("#messageId").html("<spring:message code='par.info.itemDuplicateMsg' />");//부품중복 메시지 적용.
        conformKendoWindow.content( $(".msgDiv").html());
        conformKendoWindow.open();
        $(".yes, .no").click(function(){
            if($(this).hasClass("yes")){
                //중복허용승인.
                bDuplicateItemConfirm = true;
            }
            setPartsItemsAndLbrItemsCheck(parData, lbrData, itemSendTp, bDuplicateItemConfirm);

            conformKendoWindow.close();
        }).end();
    }else{
        setPartsItemsAndLbrItemsCheck(parData, lbrData, itemSendTp, bDuplicateItemConfirm);
    }
}

function setPartsItemsAndLbrItemsCheck(parData, lbrData, itemSendTp, bDuplicateItemConfirm){

    var prcTp = getPriceTpRoTp();

    //parts Item add
    for(var i=0; i<parData.length; i++){
        var data = parData[i],
        sRnum = 0,
        sMaxRolineNo = 0,
        itemCheckCnt = 0,
        grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
        items = grid.dataSource.view(),
        length = items.length;

        for (j = length-1; j>=0;j--) {
            dataItem = items[j];

            sRnum = sRnum + 1;
            //중복부품처리.
            if(dataItem.itemCd === data.itemCd){
                itemCheckCnt++;
            }

            //ro 라인번호 최대값 처리.
            if(dataItem.roLineNo > sMaxRolineNo){
                sMaxRolineNo = dataItem.roLineNo;
            }

        }

        if(itemCheckCnt > 0){
            sRnum = length + 1;
        }else{
            sRnum = length + 1;
        }

        //ro 라인번호 1증가.
        sMaxRolineNo++;

        var itemQty = 1;
        var salePrcAmt = 0;
        var unitCd = "EA";

        if(itemSendTp == "P"){//type package
            unitCd = data.itemUnitCd;
            itemQty = data.itemQty;
        }else if(itemSendTp == "I"){//type general
            unitCd = data.stockUnitCd;
            if(data.giQty !== undefined){//출고수량 필드 정의 체크.
                itemQty = data.giQty;
            }
        }

        if(prcTp === "04"){//보증가
            salePrcAmt = data.grtePrc;
        }else if(prcTp === "03"){//보험가
            salePrcAmt = data.incPrc;
        }else{//일반가
            if(itemSendTp == "P"){//type package
                salePrcAmt = data.itemPrc;
            }else{
                salePrcAmt = data.retlPrc;
            }
        }

        var vItemQty = itemQty;// 기본 출고수량 -1
        var vItemPrc = salePrcAmt;
        var vItemAmt = vItemPrc * vItemQty;
        var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vItemQty;
        var vTaxAmt = vItemAmt - vTaxDdctAmt;

        var paymInfo = getPaymTpList(selectedRowHeaderItem.roTp);

        var IssueReqDetailVO = {
            "rnum":sRnum
            ,"dlrCd":null
            ,"pltCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parReqDocLineNo":sRnum
            ,"parReqDocStockLineNo":sRnum
            ,"parReqStatCd":"01"
            ,"purcReqNo":"01"
            ,"reqStrgeCd":data.giStrgeCd
            ,"cancYn":"N"
            ,"parGiTp":$("#parGiTp").val()
            ,"roDocNo":$("#roDocNo").val()
            ,"roStatCd":selectedRowHeaderItem.roStatCd
            ,"roTp":selectedRowHeaderItem.roTp
            ,"roLineNo":sMaxRolineNo
            ,"resvDocNo":$("#resvDocNo").val()
            ,"resvDocLineNo":0
            ,"grStrgeCd":data.giStrgeCd
            ,"giStrgeCd":data.giStrgeCd
            ,"giLocCd":data.locCd
            ,"dbItemCd":data.itemCd
            ,"pkgDocNo":data.pkgDocNo
            ,"pkgItemCd":data.pkgItemCd
            ,"itemCd":data.itemCd
            ,"itemNm":data.itemNm
            ,"unitCd":unitCd
            ,"reqQty":vItemQty
            ,"endQty":vItemQty
            ,"avlbStockQty":data.avlbStockQty
            ,"totStockQty":data.stockQty
            ,"taxDdctGrtePrc":data.taxDdctGrtePrc
            ,"resvStockQty":null
            ,"clamStockQty":null
            ,"grScheQty":null
            ,"giScheQty":null
            ,"resvQty":vItemQty
            ,"purcReqDt":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
            ,"dbYn":"N"
            ,"itemPrc":vItemPrc
            ,"movingAvgPrc":data.movingAvgPrc
            ,"movingAvgTaxDdctPrc":data.movingAvgTaxDdctPrc
            ,"movingAvgAmt":Math.round(Number(data.movingAvgPrc) * Number(vItemQty) * 100)/100
            ,"movingAvgTaxDdctAmt":Math.round(Number(data.movingAvgTaxDdctPrc) * Number(vItemQty) * 100)/100
            ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n4'))
            ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n4'))
            ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n4'))
            //,"taxRate": 16
            ,"taxRate":13
            ,"receiveDt":null
            ,"receiveId":null
            ,"returnPartsQty":null
            ,"returnDt":null
            ,"returnId":null
            ,"remark":null
            ,"retlPrc":data.retlPrc
            ,"whslPrc":data.whslPrc
            ,"incPrc":data.incPrc
            ,"grtePrc":data.grtePrc
            ,"paymTp":paymInfo.paymTp
            ,"paymCd":paymInfo.paymCd
            ,"paymUsrNm":paymInfo.paymUsrNm
            ,"partsPrcTp":prcTp
            ,"regUsrNm":"${usrNm}"
            ,"updtUsrNm":"${usrNm}"
            ,"markUp":data.markUp
        }

        if(itemCheckCnt > 0){//중복부품카운트 > 0
            if(bDuplicateItemConfirm){//중복부품카운트 허용유무.
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
            }
        }else{//제한없음.
            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
        }
    }

    //lbr Item add
    for(var j=0; j<lbrData.length; j++){
        var data = lbrData[j];

        if(data.lbrCd !== undefined){
            var itemCheckCnt = 0;
            var lbrGrid = $("#targetLbrGrid").data("kendoExtGrid");
            var sRnum = lbrGrid.dataSource.total();
            lbrGrid.tbody.find('>tr').each(function(){
                var dataItem = lbrGrid.dataItem(this);
                if(dataItem.lbrCd === data.lbrCd){
                    itemCheckCnt++;
                }
            });

            if(itemCheckCnt === 0){
                var lbrVO = {
                    rnum:sRnum + 1
                    ,dlrCd:null
                    ,roTp:"01"
                    ,docNo:$("#roDocNo").val()
                    ,lbrCd:data.lbrCd
                    ,lbrNm:data.lbrNm
                    ,lbrTp:data.lbrTp
                    ,lbrPrc:data.lbrPrc
                    ,lbrHm:data.lbrHm
                    ,dstbHm:null
                    ,dcAmt:null
                    ,lbrTotAmt:null
                    ,lineNo:null
                }
                $("#targetLbrGrid").data("kendoExtGrid").dataSource.add(lbrVO);
            }
        }
    }
}

//priceTp Func
function getPriceTpRoTp(){
    var prcTp = "01";//일반
    var roTp = selectedRowHeaderItem.roTp;
    if(roTp === "02"){//보증
        prcTp = "04";
    }else if(roTp === "04" || roTp === "05"){
    }else{
        prcTp = roTp;
    }
    return prcTp;
}

//item search popup Func
var selectStockGiItemForServicePopupWindow;
function selectPartsMasterPopupWindow(){

    //get PriceTp
    var prcTp = getPriceTpRoTp();

    selectStockGiItemForServicePopupWindow = dms.window.popup({
        windowId:"selectStockGiItemForServicePopupWindow"
        ,width:900
        ,height:550
        ,title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
        ,content:{
            url:"<c:url value='/par/cmm/selectStockGiItemForServicePopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"prcTp": prcTp
                ,"carlineCd":selectedRowHeaderItem.carlineCd
                ,"avlbStockQtyZeroYn": "N"
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    if(data.length > 0){

                        setPartsItemsAndLbrItems(data,[{}],"I");

                        selectStockGiItemForServicePopupWindow.close();
                    }
                }
            }
        }
    });
}

/**
* hyperlink in grid event
*/
$(document).on("click", ".linkRoNo", function(e){
     var thisName = $(this).data("name");
     var grid = $("#targetReqHeaderGrid").data("kendoExtGrid"),
     row = $(e.target).closest("tr");
     // k-state-selected remove all
     grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");
     var dataItem = grid.dataItem(row);
     selectTargetReqHeaderChanged(dataItem);
     // Ro detail tab window open
     window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd+"&infoType=RO", "VIEW-D-10337"); // RO Main
});

$(document).on("click", ".linkEndRoNo", function(e){
    var thisName = $(this).data("name");
    var grid = $("#targetReqHeaderEndGrid").data("kendoExtGrid"),
    row = $(e.target).closest("tr");
    // k-state-selected remove all
    grid.tbody.find('>tr').each(function(){
       $(this).removeClass("k-state-selected");
    });
    // k-state-selected add
    row.addClass("k-state-selected");
    var dataItem = grid.dataItem(row);
    selectTargetReqHeaderChanged(dataItem);
    // Ro detail tab window open
    window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd+"&infoType=RO", "VIEW-D-10337"); // RO Main
});

/**
* hyperlink in grid event
*/
$(document).on("click", ".linkResvNo", function(e){
     var thisName = $(this).data("name");
     var grid = $("#targetPartsReserveGrid").data("kendoExtGrid"),
     row = $(e.target).closest("tr");
     // k-state-selected remove all
     grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");
     var dataItem = grid.dataItem(row);
     // Resv detail tab window open
     window.parent._createOrReloadTabMenu("<spring:message code='par.menu.partInterReserve' />", "<c:url value='/par/ism/issueReserve/selectIssuePartsReserveReadyActMain.do' />?resvDocNo="+dataItem.resvDocNo+"parGiTp="+dataItem.parGiTp); // Resv Main
});

//get tab info and type and grid info
function getSelectedGridObj(){
    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
    var tabIndex = tabStrip.select().index();

    var grid = null;
    var vParGiTp = "";
    if(tabIndex === 0){//ro parts
        grid = $("#targetReqDetailGrid").data("kendoExtGrid");
        vParGiTp = "RO";
    }else if(tabIndex === 1){//ro works
        grid = $("#targetLbrGrid").data("kendoExtGrid");
        vParGiTp = "LT";
    }else if(tabIndex === 2){//borrow
        grid = $("#targetReqBorrowGrid").data("kendoExtGrid");
        vParGiTp = "BR";
    }
    else if(tabIndex === 3){//reserve
        grid = $("#targetPartsReserveGrid").data("kendoExtGrid");
        vParGiTp = "RE";
    }

    var gridObj = {
        "grid":grid
        ,"tabIndex":tabIndex
        ,"parGiTp":vParGiTp
    }

    return gridObj;
}

//부품출고 저장.(부품출고,정비차용,부품예류)
function saveIssueReqSave(parReqStatCd){
    var gridObj = getSelectedGridObj();
    var tabIndex = gridObj.tabIndex;

    if(tabIndex === 0){//parts out
        //updateIssuePartsInves Func call
        updateIssuePartsInves(gridObj, parReqStatCd);
    }else if(tabIndex === 2){//parts borrow
        //updateIssuePartsBorrowSaves Func call
        updateIssuePartsBorrowSaves(gridObj);
    }else if(tabIndex === 3){//parts resv
        //updateIssuePartsResvSaves Func call
        updateIssuePartsResvSaves(gridObj);
    }else{
        return false;
    }
}

//보험 조회 팝업
var insurancePopup;
function insurancePopupWindow(grid,flag){

    insurancePopup = dms.window.popup({
        windowId:"insurancePopup"
        ,title:"<spring:message code='ser.lbl.insurance' />"
        ,height:250
        ,width:300
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectInsuSearchPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"selectable":"single"
                ,"callbackFunc":function(data){
                    if(data.length > 0) {

                        if(flag == "Y"){

                            var lbrGridData = grid.lbrGrid.dataSource._data;
                            var partGridData = grid.partGrid.dataSource._data;

                            $.each(lbrGridData, function(i, grid){
                                grid.set("paymCd",data[0].incCmpCd);//지불자코드
                                grid.set("paymUsrNm",data[0].incCmpNm);//지불자명
                            });

                            $.each(partGridData, function(i, grid){
                                grid.set("paymCd",data[0].incCmpCd);//지불자코드
                                grid.set("paymUsrNm",data[0].incCmpNm);//지불자명
                            });

                        }else{
                            var selectedVal = grid.dataItem(grid.select());
                            selectedVal.set("paymCd",data[0].incCmpCd);//지불자코드
                            selectedVal.set("paymUsrNm",data[0].incCmpNm);//지불자명
                        }

                    }
                }
            }
        }

    });

};

//고객팝업
var popupWindow;
function custSearchPopupWindow(grid){
    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , width:900
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":false
                , "type"  :null
                , "custCd":"02"// null:all, 01:잠재, 02:보유
                //, "dlrMbrYn":"N"        // 딜러 멤버십 가입 여부
                , "closeYn" : "N"
                , "callbackFunc":function(data){

                    if(data.length >= 1) {

                        var selectedVal = grid.dataItem(grid.select());
                        selectedVal.set("paymCd",data[0].custNo);//지불자코드
                        selectedVal.set("paymUsrNm",data[0].custNm);//지불자명
                        popupWindow.close();
                    }//end if
                }//end callbackFunc
            }//end data
        }// end content
    });
}

function getLbrData(){
    return $("#targetLbrGrid").data("kendoExtGrid").dataSource.data();
}

var crTpYn = false;
//RO 유형별 결제변경
function setPaymTpList(roTp){

    crTpYn = false;
    $.each(getLbrData(), function(index, item){

        if(item.crTp === "K"){
            crTpYn = true;
        }
    });
    if(roTp == "01"){//일반
        paymTpCdList = paymTpCdList3; //고객정보
    }else if(roTp == "02"){//보증
        if(crTpYn){
            paymTpCdList = paymTpCdList5;//K-Type
        } else {
            paymTpCdList = paymTpCdList1;//보증정보
        }
    }else if(roTp == "03"){//보험
        paymTpCdList = paymTpCdList2;//보험정보
    }else if(roTp == "04" || roTp == "05"){//내부  , 리워크
        paymTpCdList = paymTpCdList4;//딜러정보
    }

}

//결재유형 데이타소스 가져오기.
function getPaymTpList(roTp){

    var vPaymTp = "";
    var vPaymCd = "";
    var vPaymUsrNm = "";
    var lbrDataDs = getLbrData();

    crTpYn = false;
    $.each(lbrDataDs, function(index, item){
        if(item.crTp === "K"){
            crTpYn = true;
        }
    });

    if(roTp === "02"){//보증
        vPaymTp = "01";
        vPaymCd = "${bhmcCd}";
        vPaymUsrNm = "${bhmcNm}";
    }else if(roTp === "03"){//보험
        vPaymTp = "02";

        for (i = 0; i < lbrDataDs.length; i++) {
            var dataItem = lbrDataDs[i];
            if(dataItem.paymTp === vPaymTp){
                vPaymCd = dataItem.paymCd;
                vPaymUsrNm = dataItem.paymUsrNm;
            }
        }

    }else if(roTp === "04" || roTp === "05"){//내부, 리워크
        vPaymTp = "05";
        vPaymCd = "${dlrCd}";//딜러
        vPaymUsrNm = "${dlrNm}";
    }else{//일반
        var custNm = (dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val();
        var custNo = (dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val();
        vPaymTp = "04";//기타고객 , 고객
        vPaymCd = custNo;
        vPaymUsrNm = custNm;
    }

    var paymInfo = {
        "paymTp" : vPaymTp          //지불자유형
        ,"paymCd" : vPaymCd         //지불자코드
        ,"paymUsrNm" : vPaymUsrNm   //결제자명
        ,"crTpYn" : crTpYn          //K Type여부
        ,"partsPrcTp" : getPriceTpRoTp() //가격유형
    }

    return paymInfo;
}

var selectedRowHeaderItem = {};
var selectedRowDetailItem = {};
var reHiddenColYn = false;

    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            enable:true
            ,click:function(e){
                //pageInit Func call
                pageInit();
            }
        });
        //btnInvReqSave(저장)
        $("#btnInvReqSave").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsSaves Func call
                updateIssuePartsSaves("01");
            }
        });
        //btnInvReq(정비수령)
        $("#btnInvReq").kendoButton({
            enable:false
            ,click:function(e){
                //부품출고 처리.
                saveIssueReqSave("02");
            }
        });

        //btnInvReturn(정비반품)
        $("#btnInvReturn").kendoButton({
            enable:false
            ,click:function(e){

                var gridObj = getSelectedGridObj();
                var tabIndex = gridObj.tabIndex;

                if(tabIndex === 0){//parts out
                    //updateIssuePartsReturnInves Func call
                    updateIssuePartsReturnInves(gridObj, "03");
                }else{
                    //정비출고에서만 반품처리 가능합니다.
                    dms.notification.info("<spring:message code='par.info.useIssueReqTab' />");
                    return false;
                }
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){

                selectIssueReceivePartsOutPrintPopupButtonWindow(false);

            }
        });
        //btnPrint02(마지막출고번호출력)
        $("#btnPrint02").kendoButton({
            enable:false
            ,click:function(e){

                selectIssueReceivePartsOutPrintPopupButtonWindow(true);

            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                // reqEndDt value not empty
                if($("#sReqEndDt").val() != ""){
                    // reqEndDt value empty
                    if($("#sReqStartDt").val() == ""){
                        // sReqStartDt value check message
                        dms.notification.info("<spring:message code='par.lbl.regStartDt' var='regStartDt' /><spring:message code='global.info.emptyCheckParam' arguments='${regStartDt}' />");
                        return false;
                    }
                }
                //detail grid datasoure data clear.
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.data([]);
                $("#targetLbrGrid").data("kendoExtGrid").dataSource.data([]);
                $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.data([]);
                $("#targetPartsReserveGrid").data("kendoExtGrid").dataSource.data([]);
                // reqHeaderGrid datasource read.
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                $("#targetReqHeaderEndGrid").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnPakage
        $("#btnPakage").kendoButton({
            enable:false
            ,click:function(e){
                //selectWorkPackagePopupWindow Func call
                selectWorkPackagePopupWindow();
            }
        });
        //btnOrderReq(구매요청버튼)
        $("#btnOrderReq").kendoButton({
            enable:false
            ,click:function(e){
                // RO OrderReq
                updateIssuePartsRoes();
            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                //selectPartsMasterPopupWindow Func call.
                selectPartsMasterPopupWindow();
            }
        });
         //버튼 - 추가2(Key In 서비스용)
        $("#btnAddSVC").kendoButton({
            enable:false
            ,click:function(e) {

                if(dms.string.isEmpty(getPriceTpRoTp())){
                    //판매유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.saleType' var='saleType' /><spring:message code='global.info.required.field' arguments='${saleType}'/>");
                    return false;
                }

                selectServiceItemSalePrcPopupWindow();
            }
        });
        //btnPartsReturnAdd
        $("#btnPartsReturnAdd").kendoButton({
            enable:false
            ,click:function(e){

                //반품처리.
                if(selectedRowDetailItem.parReqStatCd === undefined){
                    // 반품처리 할 부품을 선택하세요.
                    // return item select message
                    dms.notification.info("<spring:message code='par.lbl.returnParts' var='returnParts' /><spring:message code='par.info.stdPrcSelectMsg' arguments='${returnParts}' />");
                    return false;
                }else if(selectedRowDetailItem.parReqStatCd !== "02"){//출고완료부품만.
                    // end item select message
                    dms.notification.info("<spring:message code='par.lbl.giEndParts' var='giEndParts' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${giEndParts}' />");
                    return false;
                }
                else{

                    //반품선택 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.returnPartsUseYnMsg' />");
                        conformKendoWindow.content( $(".msgDiv").html());
                        conformKendoWindow.open();
                        $(".yes, .no").click(function(){
                            if($(this).hasClass("yes")){

                                conformKendoWindow.close();
                                //반품행 추가 처리.
                                //반품 허용 카운트 체크.(최대 10개)
                                var detailGrid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                items = detailGrid.dataSource.view(),
                                length = items.length,
                                returnPartsMaxCnt = 0;

                                for (i = length-1; i>=0; i--){
                                    item = items[i];
                                    if(item.parReqStatCd === "03" && item.itemCd ===selectedRowDetailItem.itemCd){
                                        returnPartsMaxCnt++;
                                    }
                                }
                                //반품 그리드 부품 추가.
                                if(returnPartsMaxCnt < 11){

                                    var vEndQty = -1;// 기본 반품수량 -1
                                    var vItemPrc = selectedRowDetailItem.itemPrc;
                                    var vItemAmt = selectedRowDetailItem.itemPrc * vEndQty;
                                    var vTaxDdctAmt = kendo.parseFloat(selectedRowDetailItem.itemPrc / ( 1 + gVatCd )) * vEndQty;
                                    var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                    var IssueReqDetailVO = {
                                        "rnum":selectedRowDetailItem.rnum
                                        ,"dlrCd":null
                                        ,"pltCd":null
                                        ,"parReqDocNo":selectedRowDetailItem.parReqDocNo
                                        ,"parReqDocLineNo":length + 1
                                        ,"parReqDocStockLineNo":selectedRowDetailItem.parReqDocLineNo
                                        ,"parReqStatCd":"03"
                                        ,"purcReqNo":"01"
                                        ,"reqStrgeCd":selectedRowDetailItem.reqStrgeCd
                                        ,"cancYn":"N"
                                        ,"parGiTp":selectedRowDetailItem.parGiTp
                                        ,"roDocNo":selectedRowDetailItem.roDocNo
                                        ,"roStatCd":selectedRowDetailItem.roStatCd
                                        ,"roTp":selectedRowDetailItem.roTp
                                        ,"roLineNo":selectedRowDetailItem.roLineNo
                                        ,"resvDocNo":selectedRowDetailItem.resvDocNo
                                        ,"resvDocLineNo":0
                                        ,"grStrgeCd":selectedRowDetailItem.grStrgeCd
                                        ,"giStrgeCd":selectedRowDetailItem.giStrgeCd
                                        ,"giLocCd":selectedRowDetailItem.giLocCd
                                        ,"dbItemCd":selectedRowDetailItem.itemCd
                                        ,"pkgDocNo":selectedRowDetailItem.pkgDocNo
                                        ,"pkgItemCd":selectedRowDetailItem.pkgItemCd
                                        ,"itemCd":selectedRowDetailItem.itemCd
                                        ,"itemNm":selectedRowDetailItem.itemNm
                                        ,"unitCd":selectedRowDetailItem.unitCd
                                        ,"reqQty":selectedRowDetailItem.reqQty
                                        ,"endQty":vEndQty
                                        ,"avlbStockQty":selectedRowDetailItem.avlbStockQty
                                        ,"totStockQty":selectedRowDetailItem.totStockQty
                                        ,"resvStockQty":null
                                        ,"clamStockQty":null
                                        ,"grScheQty":null
                                        ,"giScheQty":null
                                        ,"resvQty":vEndQty
                                        ,"purcReqDt":null
                                        ,"giDocNo":null
                                        ,"giDocTp":null
                                        ,"giDocStatCd":"01"
                                        ,"dbYn":"N"
                                        ,"itemPrc":vItemPrc
                                        ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n4'))
                                        ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n4'))
                                        ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n4'))
                                        ,"receiveDt":null
                                        ,"receiveId":selectedRowDetailItem.receiveId //반품 시 출고완료 된 수령인 넣기.
                                        ,"returnPartsQty":vEndQty
                                        ,"mvtDocYyMm":selectedRowDetailItem.mvtDocYyMm
                                        ,"mvtDocNo":selectedRowDetailItem.mvtDocNo
                                        ,"returnDt":null
                                        ,"returnId":null
                                    }

                                    var selectedItemIndex = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.indexOf(selectedRowDetailItem);
                                    //반품정보 넣기.
                                    selectedRowDetailReturnItem = selectedRowDetailItem;
                                    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.insert(selectedItemIndex + 1, IssueReqDetailVO);

                                }else{
                                  // max retrun parts item select message
                                  dms.notification.info("<spring:message code='par.lbl.returnPartsMaxCnt' var='returnPartsMaxCnt' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${returnPartsMaxCnt}' />");
                                }
                            }
                            conformKendoWindow.close();

                        }).end();
                    }
                }
        });

        // btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                items = grid.dataSource.view(),
                rows = grid.tbody.find('>tr'),
                length = items.length,
                rowCnt = 0,
                retrunPartsCnt = 0,
                outPartsCnt = 0,
                item,
                i,
                elementRow,
                removePkgDelCnt = 0,
                removePkgList = [],
                removeList = [];

                //delete item checked
                $.each(rows, function(index, row){
                    item = grid.dataItem(row);
                    elementRow = grid.tbody.find(".checkbox01")[index];

                    if(elementRow.checked){

                        if(item.parReqStatCd === "01"){//요청건만
                            //delete item adding.
                            removeList[item.uid] = true;

                        }else if(item.parReqStatCd === "03" && item.giDocStatCd === "01"){//반품부품 및 출고등록상태 01 것만
                            //delete item adding.
                            removeList[item.uid] = true;
                        }else if(item.parReqStatCd === "03"){//반품부품 삭제 시
                            retrunPartsCnt++;
                        }else if(item.parReqStatCd === "02"){//완료부품 삭제 시
                            outPartsCnt++;
                        }
                        rowCnt++;
                    }
                });

                if(rowCnt == 0){
                    // delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                    return false;
                }
                else{
                    //삭제 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지 적용.
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            if(retrunPartsCnt > 0){
                                //return parts not delete message
                                dms.notification.info("<spring:message code='par.info.returnPartsNotDeleteMsg' />");
                                return false;
                            }else if(outPartsCnt > 0){
                                //out parts not delete message
                                dms.notification.info("<spring:message code='par.info.outPartsNotDeleteMsg' />");
                                return false;
                            }else{
                                //grid dataSource Deleting.
                                for (i = length-1; i>=0; i--) {
                                    var item = items[i];
                                    if(removeList[item.uid]){
                                        grid.dataSource.remove(item);
                                    }
                                }
                            }
                        }
                        conformKendoWindow.close();
                    }).end();
                }
            }
        });
        //btnIssueOutMove01(정비차용)
        $("#btnIssueOutMove01").kendoButton({
            enable:false
            ,click:function(e){
                saveIssueReqSave();
            }
        });
        //btnIssueOutMove02(부품예류)
        $("#btnIssueOutMove02").kendoButton({
            enable:false
            ,click:function(e){
                saveIssueReqSave();
            }
        });
        //sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roTpCdList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sSaId dropdownlist
        $("#sSaId").kendoExtDropDownList({
            dataTextField:"tecNm"
            ,dataValueField:"tecId"
            ,dataSource:tecCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //parReqStatCd dropdownlist
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //parReqSattCd02 dropdownlist
        $("#sParReqStatCd02").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roStatusCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //차종(검색))
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            ,index:0
        });
        //sCarlineCd onchange event
        $("#sCarlineCd").on("change", function (){
        });
        // reqStartDt datepicker
        $("#sReqStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        // reqEndDt datepicker
        $("#sReqEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysEndDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //tabstrip
        $("#tabstripHeader").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //sItemTotQty
        $("#sItemTotQty").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,value:0
            ,spinners:false
        });
        $("#sItemTotQty").data("kendoExtNumericTextBox").enable(false);
        //sItemTotAmt
        $("#sItemTotAmt").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,value:0
            ,spinners:false
        });
        $("#sItemTotAmt").data("kendoExtNumericTextBox").enable(false);
        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //targetReqHederGrid.
        $("#targetReqHeaderGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153201"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sParGiTp"] = "RO";
                            params["sRoTp"] = $("#sParGiTp").val();
                            params["sRoDocNo"] = $("#sParReqDocNo").val();
                            params["sRoDocNoLikeUseYn"] = "Y";
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();
                            params["sRoStatCd"] = $("#sParReqStatCd02").val();
                            params["sRoStatCdYn"] = "Y";//RO상태 위탁확인,수리서비스 만
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();

                            params["sSaId"] = $("#sSaId").val();
                            params["sCarNo"] = $("#sCarNo").val();
                            params["sVinNo"] = $("#sVinNo").val();

                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sCustNm"] = $("#sCustNm").val();

                            params["sWkgrpNm"] = $("#sWkgrpNm").val();
                            params["sRealTecNm"] = $("#sRealTecNm").val();

                            params["sReadyStatCd"] = "RE03";//부품준비상태코드:01(요청),02(준비)

                            params["sItemCntYn"] = "N";//부품없을 때 헤더 조회 가능

                            params["sSerPrsnNm"] = $("#sSerPrsnNm").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,parReqDocNo:{ type:"string"}
                            ,parGiTp:{ type:"string"}
                            ,parReqStatCd:{ type:"string"}
                            ,readyStatCd:{ type:"string"}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,roStatCd:{ type:"string"}
                            ,roTp:{ type:"string"}
                            ,wrkStatCd:{ type:"string"}
                            ,resvStatCd:{ type:"string"}
                            ,dlStatCd:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,resvDocNo:{ type:"string"}
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string" }
                            ,custCd:{ type:"string" }
                            ,custNm:{ type:"string" }
                            ,vinNo:{ type:"string" }
                            ,enginNo:{ type:"string" }
                            ,carNo:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,carlineNm:{ type:"string" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,roDt:{ type:"date" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,height:219//list 7
            ,indvColumnRows:3
            ,appendEmptyColumn:true
            ,selectable:"row"
            ,change:function(e){

                selectedRowHeaderItem = {};
                selectedRowDetailItem = {};
                selectedRowDetailReturnItem = {};

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedRowHeaderItem = selectedItem;
                    selectTargetReqHeaderChanged(selectedItem);
                }
            }
            ,dataBound:function(e) {

                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        if(dataItem.parReqDocNo == $("#parReqDocNo").val()){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                            selectedRowHeaderItem = dataItem;
                        }
                    }
                });
            }
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parReqStatCd
                ,{ field:"roDt", title:"<spring:message code='par.lbl.issueReqDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{ field:"roTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.roTp+"]"+roTpCdMap[dataItem.roTp]+"</span>";
                        return spanObj;
                    }
                }//roTp
                ,{ field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoNo'>"+dataItem.roDocNo+"</a>";
                        return spanObj;
                    }
                } //roDocNo
                ,{ field:"roStatCd", title:"<spring:message code='par.lbl.roStatus'/>"
                    ,width:110
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.roStatCd){
                            case "02":
                                spanObj = "<span class='txt_label bg_orange'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "03":
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "04":
                                spanObj = "<span class='txt_label bg_purple'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "05":
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "06":
                                spanObj = "<span class='txt_label bg_red'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            default: //01
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//roStatCd
                ,{ field:"custNm", title:"<spring:message code='par.lbl.vsitr'/>", width:100 }//custNm
                ,{ field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }//vinNo
                ,{ field:"enginNo", title:"<spring:message code='par.lbl.enginNo'/>", width:100 }//enginNo
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{ field:"carlineNm", title:"<spring:message code='par.lbl.carLine'/>", width:100 }//carlineCd
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.serPrsnId'/>", width:100 }//serPrsnId
                ,{ field:"bigo", title:"<spring:message code='par.lbl.remark'/>", width:100, sortable:false }//bigo
            ]
        });
        //targetReqHederEndGrid.
        $("#targetReqHeaderEndGrid").kendoExtGrid({
            gridId:"G-PAR-0719-133601"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sParGiTp"] = "RO";
                            params["sRoTp"] = $("#sParGiTp").val();
                            params["sRoDocNo"] = $("#sParReqDocNo").val();
                            params["sRoDocNoLikeUseYn"] = "Y";
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();
                            params["sRoStatCd"] = $("#sParReqStatCd02").val();
                            params["sRoStatCdYn"] = "E";//RO상태 위탁확인,수리서비스 외  모두

                            //  2019-7-8 update by zqh CC:R19070500568 添加委托日期添加查询 start

                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();

                            //  2019-7-8 update by zqh CC:R19070500568 添加委托日期添加查询 end

                            params["sSaId"] = $("#sSaId").val();
                            params["sCarNo"] = $("#sCarNo").val();
                            params["sVinNo"] = $("#sVinNo").val();

                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sCustNm"] = $("#sCustNm").val();

                            params["sWkgrpNm"] = $("#sWkgrpNm").val();
                            params["sRealTecNm"] = $("#sRealTecNm").val();

                            params["sReadyStatCd"] = "RE03";//부품준비상태코드:01(요청),02(준비)

                            params["sItemCntYn"] = "N";//부품없을 때 헤더 조회 가능

                            params["sSerPrsnNm"] = $("#sSerPrsnNm").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,parReqDocNo:{ type:"string"}
                            ,parGiTp:{ type:"string"}
                            ,parReqStatCd:{ type:"string"}
                            ,readyStatCd:{ type:"string"}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,roStatCd:{ type:"string"}
                            ,roTp:{ type:"string"}
                            ,wrkStatCd:{ type:"string"}
                            ,resvStatCd:{ type:"string"}
                            ,dlStatCd:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,resvDocNo:{ type:"string"}
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string" }
                            ,custCd:{ type:"string" }
                            ,custNm:{ type:"string" }
                            ,vinNo:{ type:"string" }
                            ,enginNo:{ type:"string" }
                            ,carNo:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,carlineNm:{ type:"string" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,roDt:{ type:"date" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,height:219//list 7
            ,indvColumnRows:3
            ,appendEmptyColumn:true
            ,selectable:"row"
            ,change:function(e){

                selectedRowHeaderItem = {};

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedRowHeaderItem = selectedItem;
                    selectTargetReqHeaderChanged(selectedItem);
                }
            }
            ,columns :[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parReqStatCd
                ,{field:"roDt", title:"<spring:message code='par.lbl.issueReqDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{field:"roTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.roTp+"]"+roTpCdMap[dataItem.roTp]+"</span>";
                        return spanObj;
                    }
                }//roTp
                ,{field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkEndRoNo'>"+dataItem.roDocNo+"</a>";
                        return spanObj;
                    }
                } //roDocNo
                ,{field:"roStatCd", title:"<spring:message code='par.lbl.roStatus'/>"
                    ,width:110
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.roStatCd){
                            case "02":
                                spanObj = "<span class='txt_label bg_orange'>"+"["+dataItem.roStatCd+"]"+roStatusCdAllMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "03":
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.roStatCd+"]"+roStatusCdAllMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "04":
                                spanObj = "<span class='txt_label bg_purple'>"+"["+dataItem.roStatCd+"]"+roStatusCdAllMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "05":
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.roStatCd+"]"+roStatusCdAllMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "06":
                                spanObj = "<span class='txt_label bg_red'>"+"["+dataItem.roStatCd+"]"+roStatusCdAllMap[dataItem.roStatCd]+"</span>";
                                break;
                            default: //01
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.roStatCd+"]"+roStatusCdAllMap[dataItem.roStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//roStatCd
                ,{field:"custNm", title:"<spring:message code='par.lbl.vsitr'/>", width:100 }//custNm
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }//vinNo
                ,{field:"enginNo", title:"<spring:message code='par.lbl.enginNo'/>", width:100 }//enginNo
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{field:"carlineNm", title:"<spring:message code='par.lbl.carLine'/>", width:100 }//carlineCd
                ,{field:"serPrsnId", title:"<spring:message code='par.lbl.serPrsnId'/>", width:100 }//serPrsnId
                ,{field:"bigo", title:"<spring:message code='par.lbl.remark'/>", width:100, sortable:false }//bigo
            ]
        });
        //targetLbrGrid.
        $("#targetLbrGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153401"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sPreFixId"] = "RO";
                            var sRoDocNo = $("#roDocNo").val() == "" ? "X":$("#roDocNo").val();
                            params["sDocNo"] = sRoDocNo;

                            return kendo.stringify(params);
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
                            ,lbrNm:{type:"string" ,validation:{required:true}}
                            ,crNo:{type:"string", editable:false}
                            ,crTp:{type:"string", editable:false}
                            ,crNm:{type:"string", editable:false}
                            ,paymCd:{type:"string"}
                            ,paymTp:{type:"string"}
                            ,paymUsrNm:{type:"string"}
                            ,pkgItemCd:{type:"string", editable:false}
                            ,lbrTp:{type:"string"}
                            ,lbrPrc:{type:"number"}
                            ,lbrHm:{type:"number"}
                            ,lbrQty:{type:"number"}
                            ,lbrAmt:{type:"number"}
                            ,lbrTotAmt:{type:"number"}
                            ,dstbHm:{type:"number", editable:false}
                            ,dstinCd:{type:"string"}
                            ,diffVal:{type:"number"}
                            ,lbrCnt:{type:"number"}
                            ,serCnt:{type:"number"}
                            ,realTecNm:{type:"string", editable:false}
                            ,wkgrpNm:{type:"string", editable:false}
                            ,bayNm:{type:"string", editable:false}
                        }
                    }
                }
            }
            ,height:219
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,indvColumnRows:3
            ,appendEmptyColumn:true
            ,editable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });

                //RO유형별 결제유형 데이타소스 변경.
                setPaymTpList(selectedRowHeaderItem.roTp);

            }
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='par.lbl.lbrCd' />", width:100}
                ,{field:"lbrNm", title:"<spring:message code='par.lbl.lbrNm' />", width:200}
                ,{field:"lbrTp", title:"<spring:message code='par.lbl.lbrTp' />", width:100
                    ,template:'#if(lbrTpCdMap[lbrTp] !== undefined){# #= lbrTpCdMap[lbrTp]# #}#'
                }
                ,{field:"lbrPrc", title:"<spring:message code='par.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"lbrHm", title:"<spring:message code='par.lbl.custLbr' />", width:70, attributes:{"class":"ar"} }
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80}//정비반조
                ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80}//테크니션
                ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:'#if(crTpMap[crTp] !== undefined){# #= crTpMap[crTp]# #}#'
                }//캠페인유형
                ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:150}// 캠페인명
            ]
        });
        //targetReqDetailGrid.
        $("#targetReqDetailGrid").kendoExtGrid({
            gridId:"G-PAR-0519-181505"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#parReqDocNo").val() == "" ? "X":$("#parReqDocNo").val();
                            //get PriceTp
                            var prcTp = getPriceTpRoTp();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sPrcTp"] = prcTp;
                            params["sBorrowStatCd"] = "BORROW_STAT_02";
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,batch:true
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqDocStockLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,roTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,totStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,borrowStockQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:true }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,receiveNm:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,returnNm:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:true }
                            ,movingAvgAmt:{ type:"number" , editable:true }
                            ,movingAvgTaxDdctPrc:{ type:"number", editable: true } //이동평균단가(세금제외)
                            ,movingAvgTaxDdctAmt:{ type:"number", editable: true } //이동평균금액(세금제외)
                            ,taxRate:{ type:"number", editable: false } //세율
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,readyCancRegDt:{ type:"date" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:true }
                            ,borrowLineNo:{ type:"number", editable:true }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowUsrNm:{ type:"string", editable:false }
                            ,borrowDeptNm:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:true }
                            ,etcRvLineNo:{ type:"number", editable:true }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:true }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,remark:{ type:"string" , editable:false }
                            ,paymTp:{type:"string"}
                            ,paymCd:{type:"string"}
                            ,paymUsrNm:{type:"string"}
                            ,partsPrcTp:{type:"string"}
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regUsrNm:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtUsrNm:{ type:"string" , editable:false }
                            ,updtDt:{ type:"date" , editable:false }
                            ,markUp:{ type:"number" , editable:false }
                            ,taxDdctGrtePrc:{ type:"number" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                // complete close cell
                if (e.model.parReqStatCd === "02") {//출고완료상태코드
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="reqStrgeCd" || fieldName=="giLocCd" || fieldName=="returnPartsQty" || fieldName=="itemPrc"  || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="paymTp" || fieldName=="paymCd" || fieldName=="paymUsrNm"){
                        this.closeCell();
                    }
                }else if (e.model.parReqStatCd === "03" && e.model.giDocStatCd ==="01") {//출고반품상태코드 03, 출고상태코드 01 : 등록
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="reqStrgeCd" || fieldName=="giLocCd" || fieldName=="returnPartsQty" || fieldName=="itemPrc"  || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="paymTp" || fieldName=="paymCd" || fieldName=="paymUsrNm"){
                        this.closeCell();
                    }
                }else if (e.model.parReqStatCd === "03" && e.model.giDocStatCd !=="02") {//출고반품상태코드 03, 출고상태코드 03 : 반품
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="reqStrgeCd" || fieldName=="giLocCd" || fieldName=="returnPartsQty" || fieldName=="itemPrc"  || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="paymTp" || fieldName=="paymCd" || fieldName=="paymUsrNm"){
                        this.closeCell();
                    }
                }else{//출고요청상태코드

                    if(selectedRowHeaderItem.roTp === "01"){//RO유형:일반
                        if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="returnPartsQty" || fieldName=="giLocCd" || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="paymCd" || fieldName=="paymUsrNm"){
                            this.closeCell();
                        }
                    }else if(selectedRowHeaderItem.roTp == "03"){//RO유형:보험
                        if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="returnPartsQty" || fieldName=="giLocCd" || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="paymCd" || fieldName=="paymUsrNm"){
                            this.closeCell();
                        }
                    }
                    else{//RO유형:보증
                        if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="returnPartsQty" || fieldName=="giLocCd" || fieldName=="itemPrc" || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="paymCd" || fieldName=="paymUsrNm"){
                            this.closeCell();
                        }
                    }
                }

                if(fieldName=="movingAvgPrc" || fieldName=="movingAvgAmt" || fieldName=="movingAvgTaxDdctPrc" || fieldName=="movingAvgTaxDdctAmt"){
                    this.closeCell();
                }
            }
            ,height:219
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,indvColumnRows:3
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,dataBound:function(e){

                var rows = e.sender.tbody.children(),
                sItemTotQty = 0,
                sItemTotAmt = 0;

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var resvQty = row.children().eq(10);
                        var itemPrc = row.children().eq(15);
                        var returnPartsQty = row.children().eq(21);

                        sItemTotQty += dataItem.endQty;
                        sItemTotAmt += dataItem.itemAmt;    //보증의 경우 동일 부품 다른 라인으로 저장 되었을때 금액 합계가 ro의 금액 합계와 다를 수 있다.

                        if(dataItem.parReqStatCd == "01"){
                            resvQty.addClass("bg_white");

                            if(selectedRowHeaderItem.roTp != "02"){//RO유형 보증 아닐때
                                itemPrc.addClass("bg_white");
                            }

                        }else if(dataItem.parReqStatCd == "03" && dataItem.giDocStatCd == "01"){
                            resvQty.addClass("bg_white");
                        }
                    }
                });

                $("#sItemTotQty").data("kendoExtNumericTextBox").value(sItemTotQty);
                $("#sItemTotAmt").data("kendoExtNumericTextBox").value(sItemTotAmt);

                $(".checkbox01").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);
                    //check item selectedRowDetailItem
                    selectedRowDetailItem = dataItem;

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }
                });
            }
            ,change:function(e) {

                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);

                selectedRowDetailItem = {};
                selectedRowDetailReturnItem = {};

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedRowDetailItem = selectedItem;
                }

            }
            ,columns :
                [
                {title:"", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox01' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' type='checkbox' />"
                }
                ,{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:110 }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{ field:"roTp", title:"<spring:message code='par.lbl.parGiTpStandBy'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.roTp+"]"+roTpCdMap[dataItem.roTp]+"</span>";
                        return spanObj;
                    }
                }//roTp
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>" ,width:150}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{field:"pkgItemCd", title:"<spring:message code='par.lbl.packageCd'/>", width:80 }
                ,{field:"comItemCd", title:"<spring:message code='par.lbl.issueComItemCd'/>", width:120}
                ,{field:"comItemNm", title:"<spring:message code='par.lbl.issueComItemNm'/>", width:150}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.outQty'/>", attributes:{"class":"ar"}, width:90
                    ,format:"{0:n2}"
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '" class="numeric"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n2"
                            ,decimals:2
                            ,restrictDecimals: true
                            ,spinners:false
                            ,min:0
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr")),
                                vItemAmt = 0;

                                var endQty = this.value() == null ? 0 : this.value();

                                //출고 최대수량  가용수량 일치화.
                                if(endQty > kendo.parseFloat(model.get("avlbStockQty"))){
                                    endQty = kendo.parseFloat(model.get("avlbStockQty"));
                                }

                                model.set("resvQty", endQty);
                                var parReqStatCd = model.get("parReqStatCd");

                                var vEndQty = endQty;
                                var vItemPrc = model.get("itemPrc");
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vMovingAvgTaxDdctPrc = model.get("movingAvgTaxDdctPrc");
                                var vTaxDdctGrtePrc = model.get("taxDdctGrtePrc");
                                var vMarkUp = model.get("markUp");
                                var vPaymTp = model.get("paymTp");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(endQty) * 100)/100;
                                var vMovingAvgAmt = Math.round(Number(vMovingAvgPrc) * Number(endQty) * 100)/100;
                                var vMovingAvgTaxDdctAmt = Math.round(Number(vMovingAvgTaxDdctPrc) * Number(endQty) * 100)/100;
                                var vTaxDdctAmt = Math.round(Number(vItemAmt) / Number( 1 + gVatCd ) * 100)/100;
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                if(parReqStatCd === "03"){//반품일때
                                    model.set("endQty", endQty);
                                    model.set("returnPartsQty", endQty);

                                    model.set("itemAmt", vItemAmt * -1);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt * -1,"n4")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt * -1,"n4")));

                                }else{

                                    model.set("endQty", endQty);

                                    model.set("itemAmt", vItemAmt);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n4")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n4")));
                                }

                                model.set("movingAvgAmt", vMovingAvgAmt);
                                model.set("movingAvgTaxDdctAmt", vMovingAvgTaxDdctAmt);
                            }
                        });
                    }
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:80 }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:90 }
                ,{field:"reqStrgeCd", title:"<spring:message code='par.lbl.strge' />"
                    ,width:120
                    ,editor:function(container, options){
                        var input = $('<input id="reqStrgeCd" name="reqStrgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCdMap[reqStrgeCd] !== undefined){# #= giStrgeCdMap[reqStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:120}
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.itemPrc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n2"
                            ,decimals:2
                            ,restrictDecimals: true
                            ,min:0
                            ,max:10000000000
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                var itemPrc = this.value() == null ? 0 : this.value();
                                var parReqStatCd = model.get("parReqStatCd");

                                var vItemPrc = itemPrc;
                                var vEndQty = model.get("endQty");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(vEndQty)*100)/100;
                                var vTaxDdctAmt = Math.round(Number(vItemAmt) / Number( 1 + gVatCd ) * 100)/100;
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                if(parReqStatCd === "03"){//반품일때
                                    model.set("itemPrc", itemPrc * -1);
                                    model.set("itemAmt", vItemAmt * -1);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt * -1,"n4")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt * -1,"n4")));
                                }else{
                                    model.set("itemPrc", itemPrc);
                                    model.set("itemAmt", vItemAmt);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n4")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n4")));
                                }
                            }
                        });
                    }
                }
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100}
                ,{//이동단가(세금제외)
                    field      :"movingAvgTaxDdctPrc"
                   ,title      :"<spring:message code='par.lbl.movingAvgPrc' />(<spring:message code='par.lbl.taxSprt' />)"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                 }
                ,{//이동금액
                    field      :"movingAvgAmt"
                   ,title      :"<spring:message code='par.lbl.movingAvgCost' />"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                 }
                ,{//이동금액(세금제외)
                    field      :"movingAvgTaxDdctAmt"
                   ,title      :"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                 }
                ,{field:"taxRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:120 ,attributes:{ "class":"ar"}}//할인율
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.taxDdctAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100}
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.taxAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.itemAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100}
                ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:'#if(paymTpCdArr[paymTp] !== undefined){# #= paymTpCdArr[paymTp]# #}#'
                    ,editor:function(container, options){
                        $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:paymTpCdList
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),//그리드
                                model = grid.dataItem(grid.select()),//모델
                                paymTp,         //지불자유형
                                paymCd,         //지불자코드
                                paymUsrNm,      //지불자명
                                vEndQty = 0,    //계산식에 사용할 저장수량
                                endQty = 0;     //저장수량

                                endQty = model.get("endQty");
                                vEndQty = endQty;

                                //소매가 가격 부품가격 적용.
                                model.set("itemPrc", model.get("retlPrc"));
                                model.set("partsPrcTp", "01");

                                //01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
                                if(model.paymTp == "01"){//보증
                                    paymTp = "01";
                                    paymCd = "${bhmcCd}";
                                    paymUsrNm = "${bhmcNm}";
                                    //보증가격 적용.
                                    model.set("itemPrc", model.get("grtePrc"));
                                    //가격유형적용.
                                    model.set("partsPrcTp", "04");
                                }else if(model.paymTp == "02"){//보험
                                    paymTp = "02";
                                    //보험가격 적용
                                    model.set("itemPrc", model.get("incPrc"));
                                    //가격유형적용.
                                    model.set("partsPrcTp", "03");
                                    //보험팝업 호출.
                                    insurancePopupWindow(grid);
                                }else if(model.paymTp == "03"){//기타고객
                                    paymTp = "03";
                                    //고객팝업 호출.
                                    custSearchPopupWindow(grid);

                                }else if(model.paymTp == "04"){//고객 孙旭
                                    var custNm = (dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val();
                                    var custNo = (dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val();
                                    paymTp = "04";//기타고객 , 고객
                                    paymCd = custNo;
                                    paymUsrNm = custNm;

                                }else {//딜러
                                    paymTp = "05";
                                    paymCd = "${dlrCd}";
                                    paymUsrNm = "${dlrNm}";
                                }

                                model.set("paymTp", paymTp);
                                model.set("paymCd", paymCd);
                                model.set("paymUsrNm", paymUsrNm);

                                //가격변경.
                                var vItemPrc = model.get("itemPrc");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(endQty) * 100)/100;

                                var vTaxDdctAmt = Math.round(Number(vItemAmt) / Number( 1 + gVatCd ) * 100)/100;
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                model.set("itemPrc", vItemPrc);
                                model.set("itemAmt", vItemAmt);
                                model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n4")));
                                model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n4")));


                            }
                        });
                    },hidden :reHiddenColYn
                }// 결제유형
                ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100
                    ,editor:function(container, options) {
                        var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                        var selectedVal = grid.dataItem(grid.select());
                        var innerHtml = '';
                        if(selectedVal.paymTp == "02" || selectedVal.paymTp == "03"){
                            innerHtml += '<div class="form_search">';
                            innerHtml += '<input type="text" name="paymCd" class="form_input"  readonly="true"/>';
                            innerHtml += '<a href="#" onclick="insuPartPopup()" >&nbsp;</a></div>';
                        }else{
                            innerHtml += '<input type="text" name="paymCd" class="form_input" readonly="true" />';
                        }
                        $(innerHtml)
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="paymCd"></span>')
                        .appendTo(container);
                     },hidden :reHiddenColYn
                }// 지불자코드
                ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100 ,hidden :reHiddenColYn}// 지불자
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveDt' />", format:"{0:<dms:configValue code='dateFormat' />:HH:mm}", width:120 }
                ,{field:"receiveNm", title:"<spring:message code='par.lbl.receiveMan' />", width:80}
                ,{field:"updtUsrNm", title:"<spring:message code='par.lbl.handler' />", width:80}
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />", width:100}
            ]
        });

        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqDetailGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox01")[i];
                elementRow.checked = checked;
                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });
        //targetReqBorrowGrid.
        $("#targetReqBorrowGrid").kendoExtGrid({
            gridId:"G-PAR-0817-095901"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if(operation === "read"){

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#parReqDocNo").val() == "" ? "X":$("#parReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sBorrowStatCd"] = "BORROW_STAT_03";
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:true }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,receiveNm:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,returnNm:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:true }
                            ,movingAvgAmt:{ type:"number" , editable:true }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:false }
                            ,borrowLineNo:{ type:"number", editable:false }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowDeptNm:{ type:"string", editable:false }
                            ,borrowUsrNm:{ type:"string", editable:false }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,deptCd:{ type:"string" , editable:false }
                            ,deptNm:{ type:"string" , editable:false }
                            ,paymTp:{ type:"string"}
                            ,paymCd:{ type:"string"}
                            ,paymUsrNm:{ type:"string"}
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regUsrNm:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtUsrNm:{ type:"string" , editable:false }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                if (e.model.parReqStatCd == "02") {
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="giStrgeCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }

                if(fieldName=="movingAvgPrc"){
                    this.closeCell();
                }
            }
            ,height:219
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,indvColumnRows:3
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:false
            ,dataBound:function(e){

                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });

                $(".checkbox02").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqBorrowGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    if(checked){
                        row.addClass("k-state-selected");
                    }else{
                        row.removeClass("k-state-selected");
                    }
                });
            }
            ,change:function(e) {
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [{title:"", width:40 ,_field:"_checkAll02" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox02' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll02' type='checkbox' />"
                }
                ,{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    ,editor:function(container, options){
                        var input = $('<input id="strgeCd" name="strgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCdMap[giStrgeCd] !== undefined){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:180}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>" ,width:150}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{field:"unitCd", title:"<spring:message code='par.lbl.stockUnitCd'/>", width:50}
                ,{field:"borrowDocNo", title:"<spring:message code='par.lbl.borrowDocNo'/>", width:100}//borrowDocNo
                ,{field:"borrowQty", title:"<spring:message code='par.lbl.borrowQty'/>", width:90
                    ,format:"{0:n2}"
                    ,attributes:{"class":"ar bg_white"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n2"
                            ,decimals:2
                            ,max:100
                            ,min:0
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                model.set("reqQty", this.value());
                                model.set("endQty", this.value());

                                var endQty = this.value() == null ? 0 : this.value();

                                var vEndQty = endQty;
                                var vItemPrc = model.get("itemPrc");
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vMovingAvgTaxDdctPrc = model.get("movingAvgTaxDdctPrc");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(endQty) * 100)/100;

                                var vTaxDdctAmt = Math.round(vItemAmt / Number( 1 + gVatCd ) * 100)/100;
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                var vMovingAvgAmt = Math.round(Number(vMovingAvgPrc) * Number(endQty) * 100)/100;
                                var vMovingAvgTaxDdctAmt = Math.round(Number(vMovingAvgTaxDdctPrc) * Number(endQty) * 100)/100;

                                model.set("movingAvgAmt", vMovingAvgAmt);
                                model.set("movingAvgTaxDdctAmt", vMovingAvgTaxDdctAmt);
                                model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n4")));
                                model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n4")));
                            }
                        });
                    }
                }
                ,{field:"borrowDeptNm", title:"<spring:message code='par.lbl.borrowTp' />", width:80 }
                ,{field:"borrowUsrNm", title:"<spring:message code='par.lbl.borrowUsrId' />", width:80 }
                ,{field:"borrowStatCd", title:"<spring:message code='par.lbl.borrowStatCd' />", width:80
                    ,attributes:{"class":"ac"}
                    ,template:'#if(borrowStatCdMap[borrowStatCd] !== undefined){# #= borrowStatCdMap[borrowStatCd]# #}#'
                }
            ]
        });

        //grid checkbox all
        $("#chkAll02").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqBorrowGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox02")[i];
                elementRow.checked = checked;
                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });

        //targetPartsReserveGrid
        $("#targetPartsReserveGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailResves.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sReadyStatCd"] = "03";//상태 : 부품예류
                            params["sCancYn"] = "N";
                            //차량번호 가져오기.
                            var sCarNo = selectedRowHeaderItem.carNo == "" ? "X" : selectedRowHeaderItem.carNo;
                            params["sCarNo"] = sCarNo;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,receiveNm:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,returnNm:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:false }
                            ,movingAvgAmt:{ type:"number" , editable:false }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:true }
                            ,borrowLineNo:{ type:"number", editable:true }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,paymTp:{ type:"string"}
                            ,paymCd:{ type:"string"}
                            ,paymUsrNm:{ type:"string"}
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,height:219
            ,editable:false
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,indvColumnRows:3
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:false
            ,dataBound:function(e){

                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });

                $(".checkbox03").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetPartsReserveGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    if(checked){
                        row.addClass("k-state-selected");
                    }else{
                        row.removeClass("k-state-selected");
                    }
                });
            }
            ,change:function(e) {
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [
                {title:"", width:40 ,_field:"_checkAll03" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox03' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll03' type='checkbox' />"
                }
                ,{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{field:"regDt", title:"<spring:message code='par.lbl.resvDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"resvStatus", title:"<spring:message code='par.lbl.resvStatus'/>"
                    ,width:60
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"parGiTp", title:"<spring:message code='par.lbl.resvTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpSrMap[dataItem.parGiTp]+"</span>";
                        return spanObj;
                    }
                }
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.resvDocNo'/>", width:120
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkResvNo'>"+dataItem.resvDocNo+"</a>";
                        return spanObj;
                    }
                }
                ,{field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:80 }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:80 }
                ,{field:"techNm", title:"<spring:message code='par.lbl.techNm'/>", width:70 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:110 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:120 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", width:80, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", width:80, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", width:80 , attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100}

            ]
        });
        //grid checkbox all
        $("#chkAll03").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetPartsReserveGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox03")[i];
                elementRow.checked = checked;
                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });
        pageInit();
    });
    //부품(서비스용) 팝업 열기 함수.
    function selectServiceItemSalePrcPopupWindow(){

        selectStockGiItemForServicePopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,width:900
            ,height:450
            ,title:"<spring:message code='par.title.partSearch' />"//부품 조회
            ,content:{
                url:"<c:url value='/par/cmm/selectStockGiItemForIssueReqPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"prcTp":getPriceTpRoTp()
                    ,"itemDstinCd":'02'
                    ,"itemCd":$("#sItemCd").val()
                    ,"carlineCd":selectedRowHeaderItem.carlineCd
                    ,"avlbStockQtyZeroYn":"N"
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){
                        setPartsItemsAndLbrItems(data,[{}],"I");
                    }
                }
            }
        });
    }

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sReqStartDt'){
                var minDate = new Date("${sysStartDate}");
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sReqStartDt").data("kendoExtMaskedDatePicker").value("${sysStartDate}");
                $("#sReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sReqEndDt'){
                var maxDate = new Date("${sysEndDate}");
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sReqEndDt").data("kendoExtMaskedDatePicker").value("${sysEndDate}");
                $("#sReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sReqStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sReqEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }
</script>
<!-- //script -->

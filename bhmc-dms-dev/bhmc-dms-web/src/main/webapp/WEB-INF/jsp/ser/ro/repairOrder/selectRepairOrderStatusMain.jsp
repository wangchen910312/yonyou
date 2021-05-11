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
                    <dms:access viewId="VIEW-D-12986" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11600" hasPermission="${dms:getPermissionMask('READ')}">
                        <%-- <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button> --%>
                        <button type="button" class="btn_m" id="btnExcelExport2"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11601" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
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
            <div style="height:205px;">
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- //정비항목 -->

            <!-- 부품 -->
            <div style="height:205px;">
                <div class="table_grid">
                    <div id="partGrid" class="grid"></div>
                </div>
            </div>
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

var comItemUseYn;

var userSearchPopupWin;

var isTablet="${isTablet}";
if(isTablet == "true"){
    _width=950;//tablet
    _height=600;//tablet
}


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

//공통코드:정비유형(수리유형)
var lbrTpCdList  = []; //기본 수리유형
var lbrTpCdList2 = []; //보증수리용 수리유형
var lbrTpCdList3 = []; //딜러 공임 전용 수리유형
var lbrTpCdList4 = []; //BHMC 공임 전용 수리유형
<c:forEach var="obj" items="${lbrTpCdList}">
    <c:if test="${obj.remark1 eq '02'}">
        lbrTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test="${obj.remark2 eq 'E'}">
        lbrTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    lbrTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

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
    <c:if test='${obj.remark1 eq "04" or obj.remark1 eq "03"}'>//딜러
        paymTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${(obj.remark1 eq "01") or (obj.remark1 eq "03")}'> //보증(K-Type)
        paymTpCdList5.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd;});

//공통코드:부품수령상태
var partRcvCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${partRcvCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
    partRcvCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var partRcvCdMap = dms.data.arrayToMap(partRcvCdList, function(obj){return obj.cmmCd;});

//공통코드:부품가격유형
var partPrcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${partPrcTpList}">
    <c:if test="${obj.useYn eq 'Y'}">
    partPrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var partPrcTpMap = dms.data.arrayToMap(partPrcTpList, function(obj){return obj.cmmCd;});

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

//결제유형
paymTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymTpCdArr[val] != undefined)
        returnVal = paymTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 정비유형(수리유형)
lbrTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(lbrTpCdArr[val] != undefined)
        returnVal = lbrTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//부품수령상태
setPartRcvCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(partRcvCdMap[val] != undefined)
        returnVal = partRcvCdMap[val].cmmCdNm;
    }
    return returnVal;
};


//부품가격유형
partPrcTpGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(partPrcTpMap[val] != undefined)
        returnVal = partPrcTpMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    $(window).resize(function() {
        var gridElement = $("#lbrGrid"),
            newHeight = gridElement.innerHeight(),
            otherElements = gridElement.children().not(".k-grid-content"),
            otherElementsHeight = 0;

        otherElements.each(function(){
            otherElementsHeight += $(this).outerHeight();
        });

        gridElement.children(".k-grid-content").height(newHeight - otherElementsHeight);
    });

    $(document).on("click", ".linkRoDocNo", function(e){
    	//2020.09.25 TJX 判断是否有维修委托权限
    	$.ajax({
           url:"<c:url value='/ser/ro/repairOrder/selectUsrServicePower.do' />"
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR, status, error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result, textStatus){
        	   var grid = $("#gridHeader").data("kendoExtGrid");
               var row = $(e.target).closest("tr");
               grid.tbody.find('>tr').each(function(){
                   $(this).removeClass("k-state-selected");
                });
                row.addClass("k-state-selected");

               var selectedVal = grid.dataItem(row);
               parent._createOrReloadTabMenu("<spring:message code='ser.menu.roCreate' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do'/>?roDocNo="+selectedVal.roDocNo+"&infoType=RO", "VIEW-D-10337"); // RO Main
           }
       });
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
        gridId:"G-SER-1011-000094"
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
                            ,data:JSON.stringify({sRoDocNo:roDocNo, sCalcDocNo:calcDocNo,sSerHistYn:"Y"})
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
                {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                      // 차량번호
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
                    , template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoDocNo'>"+dataItem.roDocNo+"</a>";
                        return spanObj;
                    }
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
                ,{field:"firstRoYnNm", title:"<spring:message code='ser.lbl.firstRoYn' />", width:100
                    , attributes:{"class":"ac"}}       //처음수리여부
                ,{field:"freeRoYnNm", title:"<spring:message code='ser.lbl.freeRoYn' />", width:100
                    , attributes:{"class":"ac"}}       //처음보양여부
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

    // 정비 그리드
    $("#lbrGrid").kendoExtGrid({
        gridId:"G-SER-1011-000056"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sPreFixId"] = lbrPreFixId;
                        params["sDocNo"] = lbrDocNo;
                        if( dms.string.isNotEmpty(ltsModelCd)){
                            params["sLtsModelCd"] = ltsModelCd;
                        }

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
                        ,dstbHm:{type:"number"}
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
            ,aggregate:[
                            { field:"lbrAmt", aggregate:"sum" }
                            ,{ field:"dcAmt", aggregate:"sum" }
                            ,{ field:"lbrTotAmt", aggregate:"sum" }
            ]
        }
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:false
        ,filterable:false
        ,editable:{
            confirmation:false
        }
        ,resizable:false
        ,selectable:"row"
        ,edit:function(e){

            this.closeCell();

            var grid = $("#lbrGrid").data("kendoExtGrid");//.dataSource._data;
            var selectedVal = grid.dataItem(grid.select());

            var editRateYn = false;
            var lbrTpYn = false;

        }
        ,columns:[
              {field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100 , hidden:true
                 ,template:"#=roTpCdGrid(roTp)#"
                 ,editor:function(container, options){
                     $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:roTpCdList
                     });
                 }
             }   // RO유형
            ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200
                ,editor:function(container, options) {
                    $('<input required type="text" name="lbrNm" data-name="<spring:message code="ser.lbl.rpirNm" />" data-bind="value:' + options.field + '"  maxLength="200" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="lbrNm"></span>')
                    .appendTo(container);
                 }
             }// 공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=lbrTpCdGrid(lbrTp)#"
                ,editor:function(container, options){
                    $('<input required name="lbrTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:lbrTpCdList
                        ,change:function(){

                            var selectVal = this.value();

                            lbrTpChkYn = setLbrTp(preLbrTp);

                            if(lbrTpChkYn){
                                var roTpCd;

                                    roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드

                                var lbrAmt = 0;
                                var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                                var lbrTp = (lbrRowData != null) ? dms.string.defaultString(lbrRowData.lbrTp, "01") :"01";

                                /** 임률 함수 serviceJs.setRpirRate(임률공통코드 , "RO유형" , "수리유형" ); **/
                                //var lbrRate = serviceJs.setRpirRate(rateList, roTpCd, lbrTp);

                                $.each(getLbrData() , function(i , gridData){
                                    var lbrTp = dms.string.defaultString(gridData.lbrTp, "01");
                                    var lbrPrc = Number(serviceJs.setRpirRate(rateList, roTpCd, lbrTp));
                                    var lbrAmt = Number((gridData.lbrQty * gridData.lbrHm * lbrPrc).toFixed(2));
                                    gridData.set("lbrPrc", lbrPrc);
                                    gridData.set("lbrTotAmt", lbrAmt);
                                    gridData.set("lbrAmt", lbrAmt);
                                });

                                setLaborAmt(lbrRowData,"Amt");

                            }
                        }
                        ,select:function(e){
                            preLbrTp = this.value();
                        }

                    });
                }
            } // 공임유형(정비유형)
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input required name="lbrHm" data-name="<spring:message code="ser.lbl.lbrHm" />" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0.00
                        ,max:9999999
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var totLbrHm = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                            setLaborAmt(lbrRowData,"Rate");
                            if(preFixId == "RO"){
                                $.each(getLbrData() , function(i , gridData){
                                    totLbrHm += gridData.lbrHm;
                                });
                                setExpcDlDt(totLbrHm);
                                lbrRowData.set("dstbHm", lbrRowData.lbrHm);
                            }
                        }
                    });
                }
            } // 수리시간
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="lbrPrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:100000
                        ,decimals:0
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var totLbrHm = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                            setLaborAmt(lbrRowData,"Amt");

                            if(preFixId == "RO"){
                                $.each(getLbrData() , function(i , gridData){
                                    totLbrHm += gridData.lbrHm;
                                });
                                setExpcDlDt(totLbrHm);
                            }
                        }
                    });
                }
            }// 공임단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                }       // 공임금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input name="dcRate" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:lbrDcRateMax
                        ,spinners:false
                        ,change : function(){
                            var lbrAmt = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                            setLaborAmt(lbrRowData,"Rate");
                            lbrDcRateEditable = true;
                        }
                    });
                }
            }        // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
                ,footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="dcAmt" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:lbrDcAmtMax
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                            setLaborAmt(lbrRowData,"Amt");
                            lbrDcRateEditable = true;
                        }
                    });
                }
            } // 할인금액
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:100, attributes:{"class":"ar"}
                ,footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                ,format:"{0:n2}"
                ,template:function(data){
                    changeTotalAmt();
                    var lbrTotAmt = 0;
                    if(data.lbrTotAmt != null){
                        lbrTotAmt = data.lbrTotAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(Number(lbrTotAmt).toFixed(2));
                }
            }  // 공임비
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100, attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                        ,change:function(e){
                            var grid = $("#lbrGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());
                            chagePayTp(grid, "lbr", "N");
                        }
                    });
                }
            }// 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100
                ,editor:function(container, options) {
                    var grid = $("#lbrGrid").data("kendoExtGrid");
                    var selectedVal = grid.dataItem(grid.select());
                    var innerHtml = '';
                    if(selectedVal.paymTp == "02"|| selectedVal.paymTp == "03"){
                        innerHtml += '<div class="form_search">';
                        innerHtml += '<input type="text" name="paymCd" class="form_input"  readonly="true"/>';
                        innerHtml += '<a href="#" onclick="insuLbrPopup()" >&nbsp;</a></div>';
                    }else{
                        innerHtml += '<input type="text" name="paymCd" class="form_input" readonly="true" />';
                    }
                    $(innerHtml)
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="paymCd"></span>')
                    .appendTo(container);
                 }
            } // 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}// 지불자
            ,{field:"subBpCd", title:"<spring:message code='ser.lbl.checkCd' />", width:100
                ,editor:function(container, options) {
                    $('<input type="text" name="subBpCd" maxLength="10" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="subBpCd"></span>')
                    .appendTo(container);
                 }
            }// 점검코드
            ,{field:"subBpNm", title:"<spring:message code='ser.lbl.custReqCd' />", width:100
                ,editor:function(container, options) {
                    $('<input type="text" name="subBpNm" maxLength="10" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="subBpNm"></span>')
                    .appendTo(container);
                 }
            }// 점검명
            ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="phenCd" data-name="<spring:message code='ser.lbl.phenCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(1)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="phenCd"></span>')
                    .appendTo(container);
                 }
            }    //현상코드
            ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="cauCd" data-name="<spring:message code='ser.lbl.cauCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(1)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="cauCd"></span>')
                    .appendTo(container);
                 }
            }      //원인코드
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}// 패키지코드
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}    // 캠페인번호
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
                ,editor:function(container, options) {
                     $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         valuePrimitive:true
                         ,dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:crTpList
                     });
                     $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                 }
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}    // 캠페인명
            ,{field:"dstbHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            }// 배분공임
            ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}// 정비건수
            ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }// 난의도계수
            ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,hidden:true
            }// 공임계수
            ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:100}// 테크니션
            ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100}// 정비소조
            ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:100}// BAY 번호
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payerNm' />", width:100, hidden:true}// 결제자
            ,{field:"payCmpNm", title:"<spring:message code='ser.lbl.payCmpNm' />", width:100, hidden:true}// 지불사
            ,{field:"lbrOrgHm", title:"lbrOrgHm", width:100, hidden:true}
            ,{field:"dstinCd", title:"dstinCd", width:100, hidden:true}
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:100, attributes:{"class":"ar"} , hidden: true
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                        ,decimals:0                // 소숫점
                        ,min:1
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                            setLaborAmt(lbrRowData,"Amt");

                        }
                    });
                    $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
                }
            }// 정비수량
        ]
    });

    var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
    lbrGrid.refresh();

    // 부품 그리드
    $("#partGrid").kendoExtGrid({
        gridId:"G-SER-1011-000069"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sPreFixId"] = partPreFixId;
                        params["sDocNo"] = partDocNo;
                        if(preFixId == "CA" && comItemUseYn != "Y"){
                            params["sGiQtyExist"] = "Y";
                        }
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
                        itemReqStatCd:{type:"string", editable:false}
                        ,roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string"}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", validation:{required:true}}
                        ,itemReqStatCd:{type:"string", validation:{required:true}}
                        ,parReadyStatCdNm:{type:"string" , editable:false}
                        ,itemPrc:{type:"number"}
                        ,itemSalePrc:{type:"number"}
                        ,crNo:{type:"string", editable:false}
                        ,crTp:{type:"string", editable:false}
                        ,crNm:{type:"string", editable:false}
                        ,paymTp:{type:"string"}
                        ,paymCd:{type:"string"}
                        ,paymUsrNm:{type:"string"}
                        ,pkgDocNo:{type:"number", editable:false}
                        ,pkgItemCd:{type:"string", editable:false}
                        ,itemSaleAmt:{type:"number"}
                        ,itemTotAmt:{type:"number"}
                        ,parResvStatNm:{type:"string", editable:false}
                        ,calcUnitCd:{type:"string", editable:false}
                        ,itemQty:{type:"number"}
                        ,comItemPrc:{type:"number"}
                        ,giQty:{type:"number"}
                        ,reqQty:{type:"number"}
                        ,partsPrcTp:{type:"string"}
                        ,movingAvgPrc:{type:"number"}
                        ,movingAvgAmt:{type:"number"}
                    }
                }
            }
            ,aggregate:[
                        { field:"itemQty", aggregate:"sum" }
                        ,{ field:"itemPrc", aggregate:"sum" }
                        ,{ field:"dcAmt", aggregate:"sum" }
                        ,{ field:"itemTotAmt", aggregate:"sum" }
            ]
        }
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,resizable:false
        ,sortable:false
        ,filterable:false
        ,editable:false
        ,editable:{
            confirmation:false
        }
        ,selectable:"row"
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
            var fieldName2 = $(e.container.find("input")[0]).attr("name");

            this.closeCell();

            var grid = $("#partGrid").data("kendoExtGrid");//.dataSource._data;
            var selectedVal = grid.dataItem(grid.select());

            var roTp = "01";
            var editRateYn = false;
            var giQtyYn = false;
        }
        ,columns:[
             {field:"itemReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm' />", width:80
                 ,attributes:{"class":"ac"}
                 ,template:"#=setPartRcvCd(itemReqStatCd)#"
             } // 부품요청상태
            ,{field:"parReadyStatCdNm", title:"<spring:message code='serl.lbl.parReadyStatCd' />", width:80
                 ,attributes:{"class":"ac"}
                 ,hidden:true
             } // 부품준비상태
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:200} // 부품번호
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:300
                ,editor:function(container, options) {
                    $('<input required type="text" name="itemNm" data-name="<spring:message code="par.lbl.itemNm" />" data-bind="value:' + options.field + '" maxLength="200" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="itemNm"></span>')
                    .appendTo(container);
                 }
             } // 부품명
            ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:70}  // 계산단위
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}
                ,footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="itemQty" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:100
                        ,spinners:false
                        ,change:function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));
                            setPartAmt(rowData,"Rate");
                        }
                    });
                }
            }// 부품수량
            ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="itemSalePrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0.00
                        ,max:100000000
                        ,spinners:false
                        ,change:function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));
                            setPartAmt(rowData,"Amt");
                        }
                    });
                } , hidden:true
            }// 부품금액단가
            ,{field:"itemPrc", title:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90 , hidden:false
                ,footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                ,format:"{0:n2}"
                ,attributes:{"class":"ar"}
            }//금액
            ,{field:"itemSaleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }  // 부품금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input name="dcRate" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0
                        ,max:parDcRateMax
                        ,spinners:false
                        ,change : function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));
                            setPartAmt(rowData,"Rate");
                            parDcRateEditable = true;
                        }
                    });
                }
             } // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
                ,footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="dcAmt" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:parDcAmtMax
                        ,spinners:false
                        ,change:function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));
                            setPartAmt(rowData,"Amt");
                            parDcRateEditable = true;
                        }
                    });
                }
            } // 할인금액
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.parAmt' />", width:90, attributes:{"class":"ar"}
                ,footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}
                ,template:function(data){
                    changeTotalAmt();
                    var itemTotAmt = 0;
                    if(data.itemTotAmt != null){
                        itemTotAmt = data.itemTotAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(Number(itemTotAmt).toFixed(2));
                }
            }  // 부품대
            ,{field:"parResvStatNm", title:"<spring:message code='serl.lbl.parReadyStatCd' />", width:100, attributes:{"class":"ac"}} // 부품준비상태
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                        ,change:function(){
                            var grid = $("#partGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            chagePayTp(grid, "par", "N");
                        }
                    });
                }
            }// 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100
                ,editor:function(container, options) {
                    var grid = $("#partGrid").data("kendoExtGrid");
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
                 }
            }// 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}       // 지불자
            ,{field:"comItemNm", title:"<spring:message code='ser.lbl.comItemNm' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="comItemNm" data-name="<spring:message code='ser.lbl.bayNo'/>" class="form_input" readonly="true" /><a href="#" onclick="comItemAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="comItemNm"></span>')
                    .appendTo(container);
                 }
            }      // 부품대체수령
            ,{field:"comItemPrc", title:"<spring:message code='ser.lbl.comItemPrc' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input id="comItemPrc" name="comItemPrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100000000
                        ,decimals:2
                        ,spinners:false
                    });
                }
            }    // 부품대체차액
            ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="phenCd" data-name="<spring:message code='ser.lbl.phenCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(2)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="phenCd"></span>')
                    .appendTo(container);
                 },hidden:true
            }    //현상코드
            ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="cauCd" data-name="<spring:message code='ser.lbl.cauCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(2)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="cauCd"></span>')
                    .appendTo(container);
                 },hidden:true
            }      //원인코드
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}  // 패키지코드
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}    // 캠페인번호
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
                ,editor:function(container, options) {
                     $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         valuePrimitive:true
                         ,dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:crTpList
                     });
                     $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                 }
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}    // 캠페인명
            ,{_field:"custmrOpin", title:"<spring:message code='ser.lbl.custReqCd' />", width:100}   // 고객의견
            ,{_field:"checkedCd", title:"<spring:message code='ser.lbl.checkCd' />", width:100}     // 점검코드
            ,{field:"partsPrcTp", title:"<spring:message code='ser.lbl.partAmtTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=partPrcTpGrid(partsPrcTp)#"
            }   // 부품가격유형
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:70
                ,template:"#=roTpCdGrid(roTp)#"
                ,editor:function(container, options){
                    $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:roTpCdList
                        ,optionLabel:"<spring:message code='global.btn.select' />"
                        ,index:0
                    });
                }
                , hidden:true
            }   // RO유형
            ,{field:"comItemCd", title:"配件预付款", width:100,hidden:true }
            ,{field:"reqQty", title:"<spring:message code='ser.lbl.reqQty' />", width:70, attributes:{"class":"ar"}, hidden:true}    // 요청수량
            ,{field:"giQty", title:"<spring:message code='ser.lbl.giQty' />", width:70, attributes:{"class":"ar"} , hidden:true
                ,format:"{0:n0}"
                ,decimal:0
                ,template:function(data){
                    changeTotalAmt();
                    var giQty = 0;
                    if(data.giQty != null){
                        giQty = data.giQty;
                    }
                    return giQty;
                }
            }    // 출고수량
            ,{field:"movingAvgPrc", title:"movingAvgPrc", width:100 ,hidden:true}
            ,{field:"movingAvgAmt", title:"movingAvgAmt", width:100 ,hidden:true}
            ,{field:"parResvStatCd", hidden:true} // 부품준비상태
        ]
    });

    var partGrid = $("#partGrid").data("kendoExtGrid");

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
                     {"sCarRegNo"            :$("#sCarRegNo").val()}
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
                     {"sCarRegNo"            :$("#sCarRegNo").val()}
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

    lbrInfo = function(docNo, preFixId ,ltsCd) {
        lbrPreFixId = preFixId;
        lbrDocNo = docNo;
        ltsModelCd = ltsCd;
        lbrGrid.dataSource.read();
    };

    getLbrData = function() {
        var lbrSaveData = lbrGrid.dataSource.data();
        return lbrSaveData;
    };

    changeTotalAmt = function() {
        var parAmt = 0;
        var parDcAmt = 0;
        var parDcRate = 0;
        var firstParDcRate = 0;
        var lbrAmt = 0;
        var lbrDcAmt = 0;
        var lbrDcRate = 0;
        var firstLbrDcRate = 0;
        var etcReqPrc = 0;


        var partsData = $("#partGrid").data("kendoExtGrid").dataSource.data();

        //부품금액
        $.each(partsData, function(index, item){
            if(comItemUseYn == "Y"){
                if(this.paymTp == "01"){
                    parAmt += Number(this.itemTotAmt);
                } else {
                    parAmt += Number(this.comItemPrc);
                }
            } else {
                parAmt += Number(this.itemTotAmt);
            }
        });

        //기타비용
        $.each(getEtcIssueData(), function(index, item) {
            etcReqPrc += Number(this.etcReqPrc);
        });


        $.each(getLbrData(), function(index, item){
            lbrAmt += Number(this.lbrTotAmt);
        });

        if(dms.string.strNvl(preFixTp) == ""){
            // 예정부품대 소계
            $("#parAmt").data("kendoExtNumericTextBox").value(parAmt.toFixed(2));
            $("#lbrAmt").data("kendoExtNumericTextBox").value(lbrAmt.toFixed(2));
            $("#etcAmt").data("kendoExtNumericTextBox").value(etcReqPrc.toFixed(2));
            $("#totAmt").data("kendoExtNumericTextBox").value((parAmt + lbrAmt + etcReqPrc).toFixed(2));
        }

    };

    partInfo = function(docNo, preFixId, comItemYn) {
        partPreFixId = preFixId;
        partDocNo = docNo;
        comItemUseYn = comItemYn;
        partGrid.dataSource.read();
    };

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
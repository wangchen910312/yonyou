<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 정산 -->
<div id="resizableContainer">
    <div class="content_v1">
        <form id="dmsForm" name="dmsForm" method="POST">
        <div style="display:none;">
            <input type="text" id="rcvDocNo" name="rcvDocNo" data-json-obj="true">
            <input type="text" id="roGrpNo" name="roGrpNo" data-json-obj="true">
            <input type="text" id="serParDstinCd" name="serParDstinCd" data-json-obj="true">
            <input type="text" id="nextFreeMonth" name="nextFreeMonth" >
            <input type="text" id="nextFreeRunDistVal" name="nextFreeRunDistVal" >
            <input type="text" id="etcDcCd" name="etcDcCd" data-json-obj="true">
            <input type="text" id="roTp" name="roTp" data-json-obj="true">
            <input type="text" id="saId" name="saId" data-json-obj="true">
            <input type="text" id="saNm" name="saNm" data-json-obj="true">
            <input type="text" id="runDistVal" name="runDistVal" data-json-obj="true">
        </div>

        <!-- 차량정보, 운전자정보 공통 페이지 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp" />
        <!-- 차량정보, 운전자정보 공통 페이지 -->

        <section class="group">
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.calcNo" /></th><!-- 정산번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="calcDocNo" name="calcDocNo" class="form_input" data-json-obj="true" style="text-transform:uppercase">
                                    <a href="javascript:goCalcStatus();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.calcDt" /></th><!-- 정산일시 -->
                            <td class="readonly_area">
                                <input id="regDt" name="regDt" class="form_datetimepicker" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.calcStat" /></th><!-- 서비스정산상태 -->
                            <td class="readonly_area">
                                <input id="roStatCd" name="roStatCd" class="form_comboBox" data-json-obj="true" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.calcWrtrNm" /></th><!-- 발행자 -->
                            <td class="readonly_area">
                                <input type="text" id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.roDocNo' /><!-- RO번호 --></th>
                            <td class="keyNumber">
                                <div class="form_search">
                                    <input type="text" id="roDocNo" name="roDocNo" class="form_input" data-json-obj="true" style="text-transform:uppercase">
                                    <a href="javascript:roSearchPopupWindow();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                            <td class="readonly_area">
                                <input type="text" id="roTpNm" name="roTpNm" class="form_input" readonly >
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roDt' /><!-- RO일자 --></th>
                            <td class="readonly_area">
                                <input id="roDt" name="roDt" class="form_datetimepicker" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!-- 발행자 -->
                            <td class="readonly_area">
                                <input type="text" id="roUsrNm" name="roUsrNm" class="form_input" readonly>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <th scope="row"><spring:message code='ser.title.resvDocNo' /><!-- 예약번호 --></th>
                            <td class="readonly_area"><input type="text" id="resvDocNo" name="resvDocNo" class="form_input" readonly data-json-obj="true" ></td>
                            <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                            <td class="readonly_area"><input type="text" id="diagDocNo" name="diagDocNo" class="form_input" readonly data-json-obj="true" ></td>
                            <th scope="row"><spring:message code='ser.lbl.incReqNo' /><!-- 보험신청번호 --></th>
                            <td class="readonly_area"><input type="text" id="incReqNo" name="incReqNo" class="form_input" data-json-obj="true" ></td>
                            <th scope="row"><spring:message code='ser.lbl.origRorcptNo' /><!-- 원 RO번호 --></th>
                            <td class="readonly_area"><input type="text" id="baseRoNo" name="baseRoNo" class="form_input" readonly data-json-obj="true" ></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section class="group">
            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip2" class="tab_area mt5">
                <!-- 탭메뉴 -->
                <ul>
                    <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                    <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                    <li><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></li>
                    <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                    <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                    <li><spring:message code='ser.lbl.serviceCont' /><!-- 수리건의 --></li>
                    <li class="k-state-active"><spring:message code='ser.lbl.calcCost' /><!-- 정비비용 --></li>
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
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp">
                    <c:param name="gubun" value="S"></c:param>
                </c:import>
                <!-- //기타 -->

                <!-- 수리건의-->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrSuggest.jsp" >
                    <%-- <c:param name="gubun" value="S"></c:param> --%>
                </c:import>
                <!-- //수리건의 -->

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
                                <col>
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
                                    <td class="ar child_borderNone"><input id="lbrCalcAmt" name="lbrCalcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>             <!-- 공임정산금액 -->
                                    <td class="ar child_borderNone"><input id="lbrDcRate" name="lbrDcRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>               <!-- 공임할인율 -->
                                    <td class="ar child_borderNone"><input id="lbrDcAmt" name="lbrDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                 <!-- 공임할인금액 -->
                                    <td class="ar child_borderNone"><input id="lbrWhDcAmt" name="lbrWhDcAmt" class="form_numeric ar" readonly="readonly" /></td>                                  <!-- 공임할인후금액 -->
                                    <td class="ar child_borderNone"><input id="lbrBmPointUseAmt" name="lbrBmPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td> <!-- 공임BM포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="lbrBmCupnUseAmt" name="lbrBmCupnUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>   <!-- 공임BM쿠폰사용금액 -->
                                    <td class="ar child_borderNone"><input id="lbrPointUseAmt" name="lbrPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>     <!-- 공임포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="lbrEtcDcAmt" name="lbrEtcDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>           <!-- 공임기타혜택금액 -->
                                    <td class="ar child_borderNone"><input id="lbrCalcSumAmt" name="lbrCalcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>       <!-- 공임정산금액 -->
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.calcParSubCamt" /></th><!--부품비소계  -->
                                    <td class="ar child_borderNone"><input id="parCalcAmt" name="parCalcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>              <!-- 부품정산금액 -->
                                    <td class="ar child_borderNone"><input id="parDcRate" name="parDcRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                <!-- 부품할인율 -->
                                    <td class="ar child_borderNone"><input id="parDcAmt" name="parDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                  <!-- 부품할인금액 -->
                                    <td class="ar child_borderNone"><input id="parWhDcAmt" name="parWhDcAmt" class="form_numeric ar" readonly="readonly" /></td>                                   <!-- 부품할인후금액 -->
                                    <td class="ar child_borderNone"><input id="parBmPointUseAmt" name="parBmPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>  <!-- 부품BM포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="parBmCupnUseAmt" name="parBmCupnUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>    <!-- 부품BM쿠폰사용금액 -->
                                    <td class="ar child_borderNone"><input id="parPointUseAmt" name="parPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>      <!-- 부품포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="parEtcDcAmt" name="parEtcDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>            <!-- 부품기타혜택금액 -->
                                    <td class="ar child_borderNone"><input id="parCalcSumAmt" name="parCalcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>        <!-- 부품정산금액 -->
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.calcEtcSubAmt" /></th><!--기타비용소계  -->
                                    <td class="ar child_borderNone"><input id="etcCalcAmt" name="etcCalcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>              <!-- 기타정산금액 -->
                                    <td class="ar child_borderNone"><input id="etcDcRate" name="etcDcRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                <!-- 기타할인율 -->
                                    <td class="ar child_borderNone"><input id="etcDcAmt" name="etcDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                  <!-- 기타할인금액 -->
                                    <td class="ar child_borderNone"><input id="etcWhDcAmt" name="etcWhDcAmt" class="form_numeric ar" readonly="readonly" /></td>                                   <!-- 기타할인후금액 -->
                                    <td class="ar child_borderNone"><input id="etcBmPointUseAmt" name="etcBmPointUseAmt" class="form_numeric ar" readonly="readonly"/></td>                        <!-- 기타BM포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="etcBmCupnUseAmt" name="etcBmCupnUseAmt" class="form_numeric ar" readonly="readonly"/></td>                          <!-- 기타BM쿠폰사용금액 -->
                                    <td class="ar child_borderNone"><input id="etcPointUseAmt" name="etcPointUseAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>      <!-- 기타포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="etcOtherDcAmt" name="etcOtherDcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>        <!-- 기타혜택금액 -->
                                    <td class="ar child_borderNone"><input id="etcCalcSumAmt" name="etcCalcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>        <!-- 기타정산금액 -->
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.calcSerTotAmt" /></th><!--서비스총계  -->
                                    <td class="ar child_borderNone"><input id="calcTotAmt" name="calcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>              <!-- 총정산금액 -->
                                    <td class="ar child_borderNone"><input id="dcTotRate" name="dcTotRate" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                <!-- 총할인율 -->
                                    <td class="ar child_borderNone"><input id="dcTotAmt" name="dcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                  <!-- 총할인금액 -->
                                    <td class="ar child_borderNone"><input id="dcWhTotDcAmt" name="dcWhTotDcAmt" class="form_numeric ar" readonly="readonly" /></td>                               <!-- 총할인후금액 -->
                                    <td class="ar child_borderNone"><input id="bmPointTotAmt" name="bmPointTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>        <!-- 총BM포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="bmCupnTotAmt" name="bmCupnTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>          <!-- 총BM쿠폰사용금액 -->
                                    <td class="ar child_borderNone"><input id="pointTotAmt" name="pointTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>            <!-- 총포인트사용금액 -->
                                    <td class="ar child_borderNone"><input id="etcTotAmt" name="etcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                <!-- 총기타혜택금액 -->
                                    <td class="ar child_borderNone"><input id="lastCalcTotAmt" name="lastCalcTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>      <!-- 총정산금액 -->
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //정산비용 -->
            </div>
        </section>
        <div class="tabletGroup">
        <div class="table_grid mt5">
            <div id="calcGrid" class="grid"></div>
        </div>

        <div class="table_form mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.scheChkDt" /><!-- 예정점검일자 --></th>
                        <td>
                            <input id="expcChkDt" name="expcChkDt" class="form_datepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.scheChkDist" /><!-- 정비예정 주행거리 --></th>
                        <td>
                            <input type="text" id="expcChkRunDistVal" name="expcChkRunDistVal" class="form_numeric ar" style="width:70%" data-json-obj="true"> KM
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.mainContactTime" /></th><!--메인연락시간  -->
                        <td>
                            <input id="mainCtnoDtTp" name="mainCtnoDtTp" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.mainContactMth" /></th><!--메인연락방식  -->
                        <td>
                            <input id="mainCtnoTp" name="mainCtnoTp" class="form_comboBox" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.CalcRemark" /></th><!--서비스정산비고  -->
                        <td colspan="7">
                            <input type="text" id="calcRemark" name="calcRemark" class="form_input" data-json-obj="true">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11608" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="calAdd" class="btn_m" disabled><spring:message code="ser.btn.seperate" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11607" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="wonUnitCut" class="btn_m"><spring:message code="ser.lbl.interSett" /><!-- 정산절사 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11606" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="demicalPointCut" class="btn_m"><spring:message code='ser.lbl.settClZero' /><!-- 정산제로 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11605" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="dcRole" class="btn_m"><spring:message code="ser.lbl.dcRole" /><!-- 할인권한 --></button>
                </dms:access>
            </div>
            <div class="btn_right">
                <button type="button" id="repairComfirm" class="btn_m btn_link"><spring:message code="ser.lbl.repairComfirmPrint" /><!-- 수리합격증 --></button>
                <dms:access viewId="VIEW-D-11603" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="estimate" class="btn_m btn_link"><spring:message code="ser.lbl.rpirEst" /><!-- 정비견적 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11604" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="serDlAlram" class="btn_m"><spring:message code="ser.lbl.deliveryHint" /></button><!-- 서비스인도알람 -->
                </dms:access>
            </div>
        </div>
        </div>
    </form>
    </div>
</div>
<!-- //정산 -->

<!-- 우측 메뉴 -->
<c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanCustInfo.jsp" />
<!-- //우측 메뉴 -->

<!-- script -->
<script>

var popupWindow;
var tecSearchPopup;
var bayManagePopup;
var roCancelPopup;
var repairOrderSearchPopup;
var cardPointUseParam;
var isTablet="${isTablet}";
var _width=920;//web
var _width2=900;//web
var _height2=570;//web
var loginUsrId = "${loginUsrId}";
if(isTablet == "true"){
    _width=950;//tablet
    _width2=950;//web
    _height2=550;//web
}

var gDcType;
var totCustPaymAmt;

//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd;});

//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd;});

//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//정산절사 Array
var wonUnitCutSetValue;
<c:forEach var="obj" items="${wonUnitCutCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    wonUnitCutSetValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

//정산제로 Array
var demicalPointCutValue;
var demicalPointCutCdNm;
<c:forEach var="obj" items="${demicalPointCutCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    demicalPointCutValue = "${obj.cmmCd}";
    demicalPointCutCdNm = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//고객전화표시여부
var custTelYnValue;
<c:forEach var="obj" items="${custTelYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    custTelYnValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

// 결제기간
paymPridCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymPridCdArr[val] != undefined)
        returnVal = paymPridCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rcptTpCdMap[val] != undefined)
        returnVal = rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymMthCdMap[val] != undefined)
        returnVal = paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};


goCalcStatus = function(){
    parent._createOrReloadTabMenu("<spring:message code='ser.menu.calcualateStatus'/>", "<c:url value='/ser/cal/calculate/selectCalculateStatusMain.do'/>", "VIEW-D-10349"); // 정산현황
};

//공통코드:RO상태
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//var dcData = {};

$(document).ready(function() {
    // 정산일자
    $("#regDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예정점검일자
    $("#expcChkDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // RO일자
    $("#roDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 메인연락방식
    $("#mainCtnoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:prefContactMthCdList
        ,optionLabel:" "
    });

    // 메인연락시간
    $("#mainCtnoDtTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:prefContactTimeCdList
        ,optionLabel:" "
    });

    // RO 상태
    $("#roStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
        ,optionLabel:" "
        ,index:0
    });

    $("#expcChkRunDistVal").kendoExtNumericTextBox({
       format:"n0"                // n0:###,###, n2:###,###.##
      ,min:0
      ,spinners:false
    });

    $("#giRunDistVal").kendoExtNumericTextBox({
       format:"n0"                // n0:###,###, n2:###,###.##
      ,min:0
      ,spinners:false
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
    $("#etcCalcAmt, #etcDcRate, #etcDcAmt, #etcWhDcAmt, #etcPointUseAmt, #etcBmPointUseAmt, #etcBmCupnUseAmt, #etcOtherDcAmt, #etcCalcSumAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 정산정비총비용
    $("#calcTotAmt, #dcTotRate, #dcTotAmt, #dcWhTotDcAmt, #pointTotAmt, #bmPointTotAmt, #bmCupnTotAmt, #etcTotAmt, #lastCalcTotAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 할인권한
    $("#dcRole").kendoButton({
        click:function(e) {
            dcSearchPopup = dms.window.popup({
                windowId:"dcSearchWin"
                , title:"<spring:message code='ser.lbl.dcRole'/>"
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectDcRatePopup.do'/>"
                    , data:{
                         "dcTp":"01"
                         ,"custNo" : $("#carOwnerId").val()
                         ,"remark" : 'P' //할인구분 부품제외
                         ,"callbackFunc":function(jsonObj) {
                            if(jsonObj!=null){
                                //dcData = jsonObj;
                                setDcData(jsonObj, "dcRole");
                                $("#calculate").click();
                            } else {
                                dcCancel();
                                dcRoleCancel()
                            }
                        }
                    }
                }
                ,height:400
            });
        }
        ,enable:false
    });

    // 정산절사
    $("#wonUnitCut").kendoButton({
        click:function(e) {
            var grid = $("#calcGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if(rowData != null){
                var calcAmt = Number(rowData.paymAmt);
                var paymAmt;
                var wonUnitCutAmt;

                if(wonUnitCutSetValue === "01") {
                    paymAmt = Number(Math.round(calcAmt));
                    wonUnitCutAmt = paymAmt - calcAmt;
                } else if(wonUnitCutSetValue === "02") {
                    paymAmt = Number(Math.ceil(calcAmt));
                    wonUnitCutAmt = paymAmt - calcAmt;
                } else if(wonUnitCutSetValue === "03") {
                    paymAmt = Number(Math.floor(calcAmt));
                    wonUnitCutAmt = paymAmt - calcAmt;
                } else if(wonUnitCutSetValue === "04") {
                    paymAmt = Number(Math.round(calcAmt*10)/10);
                    wonUnitCutAmt = paymAmt - calcAmt;
                }
                rowData.set("wonUnitCutAmt", wonUnitCutAmt);
                rowData.set("paymAmt", paymAmt);
            } else {
                dms.notification.info("<spring:message code='ser.info.noWonUnitCutAmt'/>");
            }
        }
        ,enable:false
    });

    // 정산제로
    $("#demicalPointCut").kendoButton({
        click:function(e) {

            var grid = $("#calcGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if(rowData != null){
                pointCutPopup = dms.window.popup({
                    windowId:"pointCutPopup"
                    ,title:"<spring:message code='ser.lbl.settClZero' />"
                    ,height:150
                    ,width:500
                    ,content:{
                        url:"<c:url value='/ser/cmm/popup/selectPointCutPopup.do'/>"
                        ,data:{
                            "selectable":"single"
                            ,"rowData":rowData
                            ,"demicalPoint":demicalPointCutValue
                            ,"demicalPointCutCdNm":demicalPointCutCdNm
                            ,"callbackFunc":function(data){
                                rowData.set("demicPointCutAmt", data.demicPointCutAmt);
                                rowData.set("paymAmt", data.paymAmt);
                            }
                        }
                    }
                });
            } else {
                dms.notification.info("<spring:message code='ser.info.noDemicalPointCut'/>");
            }
        }
        ,enable:false
    });

    // 서비스인도알람
    $("#serDlAlram").kendoButton({
        click:function(e) {

            var formParam = $("dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));
            formParam.expcChkDt = $("#expcChkDt").data("kendoExtMaskedDatePicker").value();
            formParam.saNm = $("#saNm").val();
            formParam.driverHpNo = $("#driverHpNo").val();

            $.ajax({
                url:"<c:url value='/ser/cal/calculate/serDlAlramCall.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    $("#serDlAlram").data("kendoButton").enable(false);
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
    });

    // 견적
    $("#estimate").kendoButton({
        click:function(e) {
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.estCreate' />" ,"<c:url value='/ser/est/estimate/selectEstimateManageMain.do?vinNo="+$("#vinNo").val()+"&roDocNo="+$("#roDocNo").val()+"&ltsModelCd="+$("#ltsModelCd").val()+"'/>", "VIEW-D-10335");
        }
    });

    //보험 조회 팝업
    insuPopupWindow = function(iframe){

        insurancePopup = dms.window.popup({
            windowId:"insurancePopup"
            ,title:"<spring:message code='ser.lbl.insurance' />"
            ,height:250
            ,width:400
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectInsuSearchPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"selectable":"single"
                    ,"callbackFunc":function(data){
                        if(data.length > 0) {
                            var windowElement = $("#"+iframe);
                            var iframeDomElement = windowElement.children("iframe")[0];
                            var iframeWindowObject = iframeDomElement.contentWindow;

                            iframeWindowObject.setInsuPaymInfoSet(data);

                            insurancePopup.close();
                        }
                    }
                }
            }
        });
    };

    etcCustSearchPopup = function(iframe){

        //고객팝업
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , width:_width //todo khskhs 사이즈변경완료
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

                            var windowElement = $("#"+iframe);
                            var iframeDomElement = windowElement.children("iframe")[0];
                            var iframeWindowObject = iframeDomElement.contentWindow;
                            iframeWindowObject.setEtcCustpaymInfoSet(data);
                            popupWindow.close();
                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    };

    // 분리 팝업
    $("#calAdd").kendoButton({
        click:function(e)
        {
            var calcGrid = $("#calcGrid").data("kendoExtGrid");

            var selectedVal = calcGrid.dataItem(calcGrid.select());
            if(selectedVal==null||selectedVal==""){  //
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'  />");
                 return;
            }

            var calcData = calcGrid.dataItem("tr:eq(0)");
            var calcAmt = Number(calcData.calcAmt);

            // 공임 팝업 열기 함수.
            calcAddPopup = dms.window.popup({
                windowId:"calcAddPopup"
                ,height:200
                ,width:650
                ,title:"<spring:message code='ser.lbl.seperate' />"
                ,content:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculatePopup.do'/>"
                    ,data:{
                         "roTp":$("#roTp").val()
                        ,"selectedVal":selectedVal
                        ,"dlrCd":"${dlrCd}"
                        ,"dlrNm":"${dlrNm}"
                        ,"custNm":(dms.string.isEmpty($("#carOwnerNm").val()))? $("#driverNm").val() : $("#carOwnerNm").val()
                        ,"custNo":(dms.string.isEmpty($("#carOwnerId").val()))? $("#driverId").val() : $("#carOwnerId").val()
                        ,"callbackFunc":function(calcData){

                            var calcGrid = $("#calcGrid").data("kendoExtGrid");
                            var rowData = calcGrid.dataItem("tr:eq(0)");

                            calcGrid.dataSource.add(calcData);
                            rowData.set("paymAmt", Number(rowData.paymAmt - calcData.paymAmt).toFixed(2));
                            rowData.set("calcAmt", Number(rowData.calcAmt - calcData.calcAmt).toFixed(2));

                        }
                    }
                }
            });
        }
        ,enable:false
    });

    $("#calcGrid").kendoExtGrid({
        gridId:"G-SER-1011-000002"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculateDetails.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,async:false
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sCalcDocNo"] = $("#calcDocNo").val();

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
                        paymTp:{type:"string", editable:false}
                        ,rcptTp:{type:"string"}
                        ,calcAmt:{type:"number", editable:true}
                        ,preAmt:{type:"number"}
                        ,balAmt:{type:"number"}
                        ,paymPrid:{type:"string", validation:{required:true}}
                        ,dcPermNm:{type:"string", editable:false}
                        ,wonUnitCutAmt:{type:"number"}
                        ,demicPointCutAmt:{type:"number"}
                        ,paymAmt:{type:"number"}
                        ,cupnAmt:{type:"number"}
                        ,paymCd:{type:"string", editable:false}
                        ,paymUsrNm:{type:"string", editable:false}
                    }
                }
            }
        }
        ,height:91
        ,pageable:false
        ,autoBind:false
        ,resizable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = e.container.find("input").attr("name");
            var numberFieldName = $(e.container.find("input")[1]).attr("name");
            if(numberFieldName == "wonUnitCutAmt" || numberFieldName == "demicPointCutAmt" || numberFieldName == "balAmt" || numberFieldName == "calcAmt" || numberFieldName == "paymAmt") {
                this.closeCell();
            }

            var fieldName2 = $(e.container.find("input")[1]).attr("data-bind");
            var grid = $("#calcGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if(fieldName2 == "value:cupnAmt"){
                rowData.set("paymAmt", rowData.paymAmt + rowData.cupnAmt);
            } else if(fieldName2 == "value:preAmt") {
                rowData.set("paymAmt", rowData.paymAmt + rowData.preAmt);
            } else if(fieldName2 == "value:balAmt") {
                rowData.set("paymAmt", rowData.paymAmt + rowData.balAmt);
            }
        }
        ,change:function(e){
            var statusYn = (status == undefined) ? false : ( ($("#roTp").val() == "02") ? false : true );

            var grid = $("#calcGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            var roTp = $("#roTp").val();
            var enableYn = false;

            if( roTp == "02"){
                if(selectedVal.paymTp == "01"){
                    enableYn = false;
                }else{
                    enableYn = true;
                }
            }else {
                enableYn = true;
            }

            $("#calAdd").data("kendoButton").enable(true);
            $("#wonUnitCut").data("kendoButton").enable(enableYn);
            $("#demicalPointCut").data("kendoButton").enable(enableYn);
            $("#dcRole").data("kendoButton").enable(enableYn);

        }
        ,columns:[
            {field:"calcSubDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:150,hidden:true}          // 정산번호
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
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
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.arLbrAmt' />", width:90, attributes:{"class":"ar"}, hidden:true}       // 발생공임비
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.arItemAmt' />", width:90, attributes:{"class":"ar"}, hidden:true}       // 발생부품비
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.arOtherAmt' />", width:90, attributes:{"class":"ar"}, hidden:true}       // 발생기타비
            ,{field:"calcAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"} , format:"{0:n2}"}           // 최종정산금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}     //정산절사금액
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}   //정산제로금액
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                ,template:function(data){
                    var paymAmt = 0;
                    if(data.paymAmt != null){
                        paymAmt = data.paymAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(Number(paymAmt).toFixed(2));
                }
            }       // 발생금액
            ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.expcPayMethod' />", width:70
                ,template:"#=paymMthCdGrid(paymMthCd)#"
                ,editor:function(container, options){
                    $('<input required name="paymMthCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymMthCdList
                    });
                }
	            }    
	//          tjx 注释蓝缤相关 
	//             ,{field:"cupnNo", title:"CouponNo", width:90, hidden:true}       // BM쿠폰번호
	//             ,{field:"cupnNm", title:"CouponNm", width:90, hidden:true}       // BM쿠폰명칭
	//             ,{field:"atvtTp", title:"ActivityTp", width:90, hidden:true}       // BM캠페인명칭
				,{field:"lanBinCardNo", title:"<spring:message code='ser.lbl.cardNumber' />", width:90, hidden:true}   //卡券编号
				,{field:"lanBinCardType", title:"<spring:message code='sal.lbl.LanBinCardType' />", width:90, hidden:true}   //卡券类型
				,{field:"lanBinUseNotice", title:"<spring:message code='sal.lbl.LanBinUseNotice' />", width:90, hidden:true}   //使用须知
				,{field:"lanBinCardName", title:"<spring:message code='ser.lbl.cardName' />", width:90, hidden:true}   //卡券名称
				,{field:"lanBinCardAmount", title:"<spring:message code='sal.lbl.LanBinCardAmount' />", width:90, hidden:true,attributes:{"class":"ar"}
	            ,format:"{0:n2}"}   //卡券面额
	            ,{field:"lanBinCouponAdju", title:"<spring:message code='sal.lbl.prcChgAmt' />", width:90, hidden:true
	                ,attributes:{"class":"ar"}
	                ,format:"{0:n2}"
	            }       // 调整金额
	            ,{field:"lanBinCouponClaim", title:"<spring:message code='par.lbl.claimantTargetAmount' />", width:90, hidden:true
	                ,attributes:{"class":"ar"}
	                ,format:"{0:n2}"
	            }       // 结算金额&索赔金额
	            ,{field:"cardAdjust", title:"<spring:message code='ser.lbl.adjustment' />", width:90, hidden:true}   //调整项
	//             ,{field:"cupnStartDt", title:"cupnStartDt", width:90, hidden:true
	//                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
	//             }       // BM쿠폰시작일자
	//             ,{field:"cupnEndDt", title:"cupnEndDt", width:90, hidden:true
	//                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
	//             }       // BM쿠폰종료일자
				,{field:"lanBinCardEffeDt", title:"<spring:message code='sal.lbl.LanBinCardEffeDate' />", width:90, hidden:true
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
	             }       //截至日期
	//             ,{field:"cupnRemark", title:"cupnRemark", width:90, hidden:true}       // BM쿠폰비고
	            ,{field:"cupnUsage", title:"cupnUsage", width:90, hidden:true}       // 调整项
	//             ,{field:"cupnChangeAmt", title:"cupnChangeAmt", width:90, hidden:true
	//                 ,attributes:{"class":"ar"}
	//                 ,format:"{0:n2}"
	//             }       // BM쿠폰조정금액

            ,{field:"cupnAmt", title:"CouponPrice", width:90, attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:10000
                        ,format:"n2"                // n0:###,###, n2:###,###.##
                        ,decimals:2                // 소숫점
                        ,spinners:false
                        ,change:function(e){
                            var calcGrid = $("#calcGrid").data("kendoExtGrid");
                            var calcData = calcGrid.dataItem("tr:eq(0)");
                            var paymAmt = Number(calcData.paymAmt - this.value());

                            if(paymAmt < 0) {
                                calcData.set("cupnAmt", 0);
                                dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.finalCalcAmt' var='finalCalcAmt' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${finalCalcAmt}' />");
                            } else {
                                lastPaymAmt();
                            }
                        }
                    });
                }, hidden:true
            }       // 쿠폰금액
            ,{field:"rcptTp", title:"<spring:message code='ser.lbl.expcInvoiceTp' />", width:80
                ,template:"#=rcptTpCdGrid(rcptTp)#"
                ,editor:function(container, options){
                    $('<input required name="rcptTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:rcptTpCdList
                    });
                }
            }//예상영수증유형
            ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90}    // 지불비고
            ,{field:"preAmt", title:"<spring:message code='ser.lbl.preDoUseAmt' />", width:80, attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:10000
                        ,format:"n2"                // n0:###,###, n2:###,###.##
                        ,decimals:2                // 소숫점
                        ,spinners:false
                        ,change:function(e){
                            var calcGrid = $("#calcGrid").data("kendoExtGrid");
                            var calcData = calcGrid.dataItem("tr:eq(0)");
                            var paymAmt = Number(calcData.paymAmt - this.value());

                            if(paymAmt < 0) {
                                calcData.set("preAmt", 0);
                                dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.finalCalcAmt' var='finalCalcAmt' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${finalCalcAmt}' />");
                            } else {
                                lastPaymAmt();
                            }
                        }
                    });
                }
                , hidden:true
            }//선수금 금액 사용
            ,{field:"balAmt", title:"<spring:message code='ser.lbl.advance' />", width:80, attributes:{"class":"ar"}, hidden:true}//선불금금액
            ,{field:"dcPermNm", title:"<spring:message code='ser.lbl.dcRole' />", width:80, attributes:{"class":"ac"}, hidden:true}//할인권한
            ,{field:"dcPermCd", hidden:true}
        ]
    });

    // 정산
    $("#calcConfirm").kendoButton({
        click:function(e) {
            //fnComfirm("04");
	        		//需求编号 327 针对需要APP确认的工单，结算时校验是否已收到APP的确认 服务结算，
	        		//当点击【确认】按钮时，判断对象工单是否APP确认通过，或者送修人是否在APP上确认或特殊申请是否通过，否则不允许结算。jiaMing 2021-4-1 start
	        		//DMS服务结算，校验是否 蓝缤APP/厂端审批 已确认 （阻断）
	        		var confirmYn = true;
	        		var params = {};
	        		params["sRoDocNo"] = $("#roDocNo").val();
	        		$.ajax({
	                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
	                   ,data:JSON.stringify(params)
	                   ,type:'POST'
	                   ,dataType:'json'
	                   ,contentType:'application/json'
	                   ,error:function(jqXHR, status, error){
	                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
	                  }
	                ,success:function(result, textStatus){
	                   //console.log("",result);
	                   var data = result.data;
	                   if("Y" == data[0].custConfirmYn){
	                	   if(null == data[0].custConfirmCd || "" == data[0].custConfirmCd ){
	                		   confirmYn = false;
	                		   dms.notification.warning("<spring:message code='ser.info.warrAppConfirmInfo'/>");
	                           return false;
	                	   }
	                   }
	                   
	                   if(confirmYn){
	                	   fnComfirm("04");
	                   }
	                }
	                ,beforeSend:function(xhr){
	                  dms.loading.show($("#resizableContainer"));
	                }
	                ,complete:function(xhr,status){
	                  dms.loading.hide($("#resizableContainer"));
	                }
	             });
	        	//需求编号 327 针对需要APP确认的工单，结算时校验是否已收到APP的确认 服务结算 jiaMing 2021-4-1 end
        }
        ,enable:false
    });

    // 서비스수납
    $("#serviceReceive").kendoButton({
        click:function(e) {
            fnComfirm("00");
        }
        ,enable:false
    });

    // 계산
    $("#calculate").kendoButton({
        click:function(e) {
            btnControll("02");
            fnCalculate();
        }
        ,enable:false
    });

    $("#init").kendoButton({
        click:function(e) {
            initAll();
        }
    });

    // 인쇄
    $("#print").kendoButton({

        click:function(e) {

            var param = {
                    calcDocNo : $("#calcDocNo").val()
                   ,roTp : $("#roTp").val()
            };

            $.ajax({
                url:"<c:url value='/ser/cal/calculate/updateCalculatePrint.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    var rptNm = ("${rptNm}"=="")? "selectCalculatePrintMain.cpt" : "${rptNm}"
                    parent._createOrReloadTabMenu("<spring:message code='ser.lbl.calculateDoc' />", "<c:url value='/ReportServer?reportlet=ser/" + rptNm + "'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCalcDocNo="+$("#calcDocNo").val()+"&sTelShowYn="+custTelYnValue); // RO Main
                }
            });
        }
        ,enable:false
    });

    // 인쇄
    $("#print2").kendoButton({

        click:function(e) {

            var param = {
                calcDocNo : $("#calcDocNo").val()
                ,roTp : $("#roTp").val()
            };

            $.ajax({
                url:"<c:url value='/ser/cal/calculate/updateCalculatePrint.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
//                     parent._createOrReloadTabMenu("<spring:message code='ser.lbl.calculateDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectCalculatePrintMain.cpt'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCalcDocNo="+$("#calcDocNo").val()+"&sTelShowYn="+custTelYnValue); // RO Main
                    //파인리포트 빠른인쇄 기능 적용 by 한강석 2017.08.02
                    //파라메터 : 리포트URL, 인쇄팝업화면출력여부, 용지에맞게축소여부
                    var rptNm = ("${rptNm}"=="")? "selectCalculatePrintMain.cpt" : "${rptNm}"
                    dms.fineReport.print("<c:url value='/ReportServer?reportlet=ser/" + rptNm + "'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCalcDocNo="+$("#calcDocNo").val()+"&sTelShowYn="+custTelYnValue, false, true);
                }
            });
        }
        ,enable:false
    });

    // 수리합격증
    $("#repairComfirm").kendoButton({

        click:function(e) {

            var param = {
                    calcDocNo : $("#calcDocNo").val()
                   ,roTp : $("#roTp").val()
            }
            parent._createOrReloadTabMenu("<spring:message code='ser.lbl.repairComfirmPrint' />", "<c:url value='/ReportServer?reportlet=ser/selectRepairComfirm.cpt'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCalcDocNo="+$("#calcDocNo").val()); // RO Main
        }
        ,enable:false
    });

    $("#calcDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#calcDocNo").val()) != ""){
            e.preventDefault();
            var data = {"calcDocNo":$("#calcDocNo").val()};
            detailSet(data, false, "CA");
        }
    });

    $("#roDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#roDocNo").val()) != ""){
            e.preventDefault();
            var data = {"roDocNo":$("#roDocNo").val()};
            detailSet(data, false, "RO");
        }
    });

    fnComfirm = function(status){
        var formParam = $("dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

        formParam.lbrCalcAmt = $("#lbrCalcAmt").data("kendoExtNumericTextBox").value();
        formParam.lbrDcRate = $("#lbrDcRate").data("kendoExtNumericTextBox").value();
        formParam.lbrDcAmt = $("#lbrDcAmt").data("kendoExtNumericTextBox").value();
        formParam.lbrBmPointUseAmt = $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value();
        formParam.lbrBmCupnUseAmt = $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value();
        formParam.lbrPointUseAmt = $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value();
        formParam.lbrEtcDcAmt = $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value();
        formParam.lbrCalcSumAmt = $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value();
        formParam.parCalcAmt = $("#parCalcAmt").data("kendoExtNumericTextBox").value();
        formParam.parDcRate = $("#parDcRate").data("kendoExtNumericTextBox").value();
        formParam.parDcAmt = $("#parDcAmt").data("kendoExtNumericTextBox").value();
        formParam.parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value();
        formParam.parBmCupnUseAmt = $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value();
        formParam.parPointUseAmt = $("#parPointUseAmt").data("kendoExtNumericTextBox").value();
        formParam.parEtcDcAmt = $("#parEtcDcAmt").data("kendoExtNumericTextBox").value();
        formParam.parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();
        formParam.etcCalcAmt = $("#etcCalcAmt").data("kendoExtNumericTextBox").value();
        formParam.etcDcRate = $("#etcDcRate").data("kendoExtNumericTextBox").value();
        formParam.etcDcAmt = $("#etcDcAmt").data("kendoExtNumericTextBox").value();
        formParam.etcPointUseAmt = $("#etcPointUseAmt").data("kendoExtNumericTextBox").value();
        formParam.etcBmPointUseAmt = $("#etcBmPointUseAmt").data("kendoExtNumericTextBox").value();
        formParam.etcBmCupnUseAmt = $("#etcBmCupnUseAmt").data("kendoExtNumericTextBox").value();
        formParam.etcOtherDcAmt = $("#etcOtherDcAmt").data("kendoExtNumericTextBox").value();
        formParam.etcCalcSumAmt = $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value();
        formParam.calcTotAmt = $("#calcTotAmt").data("kendoExtNumericTextBox").value();
        formParam.dcTotRate = $("#dcTotRate").data("kendoExtNumericTextBox").value();
        formParam.dcTotAmt = $("#dcTotAmt").data("kendoExtNumericTextBox").value();
        formParam.bmPointTotAmt = $("#bmPointTotAmt").data("kendoExtNumericTextBox").value();
        formParam.bmCupnTotAmt = $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value();
        formParam.pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value();
        formParam.etcTotAmt = $("#etcTotAmt").data("kendoExtNumericTextBox").value();
        formParam.lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
        formParam.expcChkDt = $("#expcChkDt").data("kendoExtMaskedDatePicker").value();
        formParam.expcChkRunDistVal = $("#expcChkRunDistVal").data("kendoExtNumericTextBox").value();
        formParam.giRunDistVal = $("#giRunDistVal").data("kendoExtNumericTextBox").value();
        formParam.runDistVal = $("#runDistVal").val();
        if(isTablet == "true")formParam.giRunDistVal = $("#runDistValTablet").val();//khs
        formParam.serParDstinCd = "SER";
        formParam.calcStatCd = status;
        formParam.pdiYn =  $("#pdiYn").val();

        var grid = $("#calcGrid").data("kendoExtGrid").dataSource.data();

        var finalPaymAmt = 0;   // 정산금액합계
        totCustPaymAmt = 0; // 고객지불금액합계
        $.each(grid, function(index, item){
            finalPaymAmt += Number(this.calcAmt);
            if(this.paymTp == "04"){
                totCustPaymAmt += Number(this.paymAmt);
            }
        });

        if(Number(finalPaymAmt).toFixed(2) != Number(formParam.lastCalcTotAmt).toFixed(2)){
            dms.notification.info("<spring:message code='ser.info.notTotCalculate'/>");
            return false;
        }

        // 정비예정일자 필수체크
        if(dms.string.strNvl(formParam.expcChkDt) == ""){
            dms.notification.info("<spring:message code='ser.lbl.scheChkDt' var='expcChkDt' /><spring:message code='global.info.required.field' arguments='${expcChkDt},' />");
            return false;
        }

        // bm포인트 사용시 bm회원번호 여부 체크
        if(formParam.bmPointTotAmt > 0){
            if(dms.string.strNvl($("#bmMembershipNo").val()) == ""){
                dms.notification.info("<spring:message code='ser.lbl.bmMembNo' var='bmMembNo' /><spring:message code='crm.info.findFail' arguments='${bmMembNo},' />");
                return false;
            }
        }

        // BM쿠폰 검증 후 확인 안눌렀을 때 체크
        var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
        var bmCupnData = bmCupnGrid.dataItem("tr:eq(0)");
        if(dms.string.isNotEmpty(bmCupnData.cardNo) && bmCupnData.cardNo != undefined){ //쿠폰번호가 있을 경우
            if(bmCupnUseYn != "Y"){ // 확인을 안눌렀을 경우
                dms.notification.info("<spring:message code='ser.lbl.coupon' var='coupon' /><spring:message code='global.info.confirmMsgParam' arguments='${coupon},' />");
                return false;
            }
        }

        // form 데이터 및 그리드 변경 데이터 세팅
        var param = $.extend(
            {"calculateVO":formParam}
            ,{"servicePartListVO":getPartData()}
            ,{"serviceLaborListVO":getLbrData()}
            ,{"calculateDetailSaveVO":grid}
            ,{"trobleDescVO":trobleDescParam()}
            ,{"custDemandListVO":custDemandParam()}
            ,{"etcIssueListVO":getEtcIssueData()}
            ,{"lbrSuggestListVO":getLbrSuggestData()}
            ,{"blueMembershipJoinVO":bmSaveParam()}
            ,{"membershipPointHisVO":dlrPointSaveParam()}
            ,{"cardPointHisVO":cardPointUseParam}
	            //tjx 新增其他优惠(卡券信息)
	            ,{"fmsCardNoJoinVO":fmsSaveParam()}
        );

        $.ajax({
            url:"<c:url value='/ser/cal/calculate/multiCalculate.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                $("#calcDocNo").val(result.calcDocNo);
                $("#rcvDocNo").val(result.rcvDocNo);
                $("#roStatCd").data("kendoExtDropDownList").value(result.calcStatCd);

                tabInfoSet(result.roDocNo, "RO");
                $("#calcGrid").data("kendoExtGrid").dataSource.read();
                dms.notification.success("<spring:message code='global.info.success'/>");
                btnControll(status);
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    };

    fnCalculate = function(type, jsonObj){
        if($("#vinNo").val() == "" || $("#vinNo").val() == null){
            dms.notification.info("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='global.info.required.field' arguments='${vinNo},' />");
            return;
        }

        if($("#pdiYn").val() != "Y" ){
            if($("#carOwnerNm").val() == "" || $("#carOwnerNm").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.carOwner' var='carOwnerNm' /><spring:message code='global.info.required.field' arguments='${carOwnerNm},' />");
                return;
            }
        }

        /* 방문자
        if($("#pdiYn").val() != "Y" ){

            if($("#driverNm").val() == "" || $("#driverNm").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.vsitr' var='driverNm' /><spring:message code='global.info.required.field' arguments='${driverNm},' />");
                return;
            }
        } */

        // BM포인트 취소
        bmCancel("C");
        // 회원포인트 취소
        dealerCancel("C");
        // BM쿠폰 취소
        bmCupnCancel("C");
        // 기타혜택 취소
        //dcCancel();
        //dcRoleCancel();

        var calcGrid = $("#calcGrid").data("kendoExtGrid");
        calcGrid.dataSource.data([]);

        var calAmt1 = 0;
        var calAmt2 = 0;
        var calAmt3 = 0;
        var calAmt4 = 0;
        var calAmt5 = 0;
        var paymTp1 = "";
        var paymTp2 = "";
        var paymTp3 = "";
        var paymTp4 = "";
        var paymTp5 = "";
        var paymCd1 = "";
        var paymCd2 = "";
        var paymCd3 = "";
        var paymCd4 = "";
        var paymCd5 = "";
        var paymUsrNm1 = "";
        var paymUsrNm2 = "";
        var paymUsrNm3 = "";
        var paymUsrNm4 = "";
        var paymUsrNm5 = "";
        var parAmt1 = 0;
        var parAmt2 = 0;
        var parAmt3 = 0;
        var parAmt4 = 0;
        var parAmt5 = 0;
        var lbrAmt1 = 0;
        var lbrAmt2 = 0;
        var lbrAmt3 = 0;
        var lbrAmt4 = 0;
        var lbrAmt5 = 0;

        var  paymTpYn = true;

        // 지불유형별 계산
        $.each(getPartData(), function(index, item){

            if(dms.string.isEmpty(this.paymTp)){
                dms.notification.info("<spring:message code='ser.lbl.payWay' var='payWay' />"+
                                      "<spring:message code='global.info.required.field' arguments='${payWay},' />");
                paymTpYn = false;
                return false;
            }
            if(dms.string.isEmpty(this.paymUsrNm)){
                dms.notification.info("<spring:message code='ser.lbl.payer' var='payer' />"+
                                      "<spring:message code='global.info.required.field' arguments='${payer},' />");
                paymTpYn = false;
                return false;
            }

            if(this.paymTp == "01"){  // 보증
                calAmt1 += Number(this.itemTotAmt);
                paymTp1 = this.paymTp;
                paymCd1 = this.paymCd;
                parAmt1 += Number(this.itemTotAmt);
                paymUsrNm1 = this.paymUsrNm;
            } else if(this.paymTp == "02") { // 보험
                calAmt2 += Number(this.itemTotAmt);
                paymCd2 = this.paymCd;
                paymTp2 = this.paymTp;
                parAmt2 += Number(this.itemTotAmt);
                paymUsrNm2 = this.paymUsrNm;
            } else if(this.paymTp == "03") { // 기타고객
                calAmt3 += Number(this.itemTotAmt);
                paymTp3 = this.paymTp;
                paymCd3 = this.paymCd;
                parAmt3 += Number(this.itemTotAmt);
                paymUsrNm3 = this.paymUsrNm;
            } else if(this.paymTp == "04") { // 고객
                calAmt4 += Number(this.itemTotAmt);
                paymTp4 = this.paymTp;
                paymCd4 = this.paymCd;
                parAmt4 += Number(this.itemTotAmt);
                paymUsrNm4 = this.paymUsrNm;
            } else if(this.paymTp == "05") { // 딜러
                calAmt5 += Number(this.itemTotAmt);
                paymTp5 = this.paymTp;
                paymCd5 = this.paymCd;
                parAmt5 += Number(this.itemTotAmt);
                paymUsrNm5 = this.paymUsrNm;
            }
        });

        if(paymTpYn){
            $.each(getLbrData(), function(index, item){

                if(dms.string.isEmpty(this.paymTp)){
                    dms.notification.info("<spring:message code='ser.lbl.payWay' var='payWay' />"+
                                          "<spring:message code='global.info.required.field' arguments='${payWay},' />");
                    paymTpYn = false;
                    return false;
                }
                if(dms.string.isEmpty(this.paymUsrNm)){
                    dms.notification.info("<spring:message code='ser.lbl.payer' var='payer' />"+
                                          "<spring:message code='global.info.required.field' arguments='${payer},' />");
                    paymTpYn = false;
                    return false;
                }
                if(this.paymTp == "01"){  // 보증
                    calAmt1 += Number(this.lbrTotAmt);
                    paymTp1 = this.paymTp;
                    paymCd1 = this.paymCd;
                    lbrAmt1 += Number(this.lbrTotAmt);
                    paymUsrNm1 = this.paymUsrNm;
                } else if(this.paymTp == "02") { // 보험
                    calAmt2 += Number(this.lbrTotAmt);
                    paymTp2 = this.paymTp;
                    paymCd2 = this.paymCd;
                    lbrAmt2 += Number(this.lbrTotAmt);
                    paymUsrNm2 = this.paymUsrNm;
                } else if(this.paymTp == "03") { // 기타고객
                    calAmt3 += Number(this.lbrTotAmt);
                    paymTp3 = this.paymTp;
                    paymCd3 = this.paymCd;
                    lbrAmt3 += Number(this.lbrTotAmt);
                    paymUsrNm3 = this.paymUsrNm;
                } else if(this.paymTp == "04") { // 고객
                    calAmt4 += Number(this.lbrTotAmt);
                    paymTp4 = this.paymTp;
                    paymCd4 = this.paymCd;
                    lbrAmt4 += Number(this.lbrTotAmt);
                    paymUsrNm4 = this.paymUsrNm;
                } else if(this.paymTp == "05") { // 딜러
                    calAmt5 += Number(this.lbrTotAmt);
                    paymTp5 = this.paymTp;
                    paymCd5 = this.paymCd;
                    lbrAmt5 += Number(this.lbrTotAmt);
                    paymUsrNm5 = this.paymUsrNm;
                }
            });
        }

        if(!paymTpYn) return false;


        var bmPointTotAmt = $("#bmPointTotAmt").data("kendoExtNumericTextBox").value();
        var bmCupnTotAmt = $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value();
        var pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value();
        var etcTotAmt = $("#etcTotAmt").data("kendoExtNumericTextBox").value();
        var lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
        var etcIssueAmt = $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value();

        // 서비스운영관리 디폴트 값가져오기
        var defaultPaymMthCd;
        var defaultRcptTpCd;

        $.each(paymMthCdList, function(index, item){
            if(this.remark10 === "default") {
                defaultPaymMthCd = this.cmmCd;
            }
        });

        $.each(rcptTpCdList, function(index, item){
            if(this.remark10 === "default") {
                defaultRcptTpCd = this.cmmCd;
            }
        });

        if(paymTp1 != ""){
            var copyData1 =
            {
                dlrCd:""
                ,calcDocNo:""
                ,paymTp:paymTp1
                ,paymCd:paymCd1
                ,paymPrid:"01"
                ,paymMthCd:defaultPaymMthCd
                ,paymAmt:(Number(lbrAmt1 + parAmt1 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt1 + parAmt1 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt1 + parAmt1 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt1 + parAmt1 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,npayAmt:""
                ,paymUsrId:""
                ,paymUsrNm:paymUsrNm1
                ,rcptTp:defaultRcptTpCd
                ,cupnAmt:0
                ,preAmt:0
                ,balAmt:0
                ,demicPointCutAmt:0
                ,wonUnitCutAmt:0
            };
            calcGrid.dataSource.insert(copyData1);
        }

        if(paymTp2 != "") {
            var copyData2 = {
                dlrCd:""
                ,calcDocNo:""
                ,paymTp:paymTp2
                ,paymCd:paymCd2
                ,paymPrid:"01"
                ,paymMthCd:defaultPaymMthCd
                ,paymAmt:(Number(lbrAmt2 + parAmt2 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt2 + parAmt2 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt2 + parAmt2 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt2 + parAmt2 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,npayAmt:""
                ,paymUsrId:"<spring:message code='global.lbl.incCmp' />"
                ,paymUsrNm:paymUsrNm2
                ,rcptTp:defaultRcptTpCd
                ,cupnAmt:0
                ,preAmt:0
                ,balAmt:0
                ,demicPointCutAmt:0
                ,wonUnitCutAmt:0
            };
            calcGrid.dataSource.insert(copyData2);
        }

        if(paymTp3 != "") {
            var copyData3 = {
                dlrCd:""
                ,calcDocNo:""
                ,paymTp:paymTp3
                ,paymCd:paymCd3
                ,paymPrid:"01"
                ,paymMthCd:defaultPaymMthCd
                ,paymAmt:(Number(lbrAmt3 + parAmt3 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt3 + parAmt3 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt3 + parAmt3 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt3 + parAmt3 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,npayAmt:""
                ,paymUsrId:""
                ,paymUsrNm:paymUsrNm3
                ,rcptTp:defaultRcptTpCd
                ,cupnAmt:0
                ,preAmt:0
                ,balAmt:0
                ,demicPointCutAmt:0
                ,wonUnitCutAmt:0
            };
            calcGrid.dataSource.insert(copyData3);
        }

        if(paymTp4 != "") {
            var copyData4 = {
                dlrCd:""
                ,calcDocNo:""
                ,paymTp:paymTp4
                ,paymCd:paymCd4
                ,paymPrid:"01"
                ,paymMthCd:defaultPaymMthCd
                ,paymAmt:(Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,npayAmt:""
                ,paymUsrId:paymCd4
                ,paymUsrNm:paymUsrNm4
                ,rcptTp:defaultRcptTpCd
                ,cupnAmt:0
                ,preAmt:0
                ,balAmt:0
                ,demicPointCutAmt:0
                ,wonUnitCutAmt:0
            };
            calcGrid.dataSource.insert(copyData4);
        }

        if(paymTp5 != "") {
            var copyData5 = {
                dlrCd:""
                ,calcDocNo:""
                ,paymTp:paymTp5
                ,paymCd:paymCd5
                ,paymPrid:"01"
                ,paymMthCd:defaultPaymMthCd
                ,paymAmt:(Number(lbrAmt5 + parAmt5 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt5 + parAmt5 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt5 + parAmt5 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt5 + parAmt5 + etcIssueAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,npayAmt:""
                ,paymUsrId:""
                ,paymUsrNm:paymUsrNm5
                ,rcptTp:defaultRcptTpCd
                ,cupnAmt:0
                ,preAmt:0
                ,balAmt:0
                ,demicPointCutAmt:0
                ,wonUnitCutAmt:0
            };
            calcGrid.dataSource.insert(copyData5);
        }
    };

    detailSet = function(data, slide, infoType){
        initAll();
        if(infoType == "RO") {
            $.ajax({
                url:"<c:url value='/ser/cal/calculate/selectCalculateByKey.do' />"
                ,data:JSON.stringify({sRoDocNo:data.roDocNo, sCalcDocNo:data.calcDocNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){

                    if(dms.string.strNvl(result.calcDocNo) == "") {

                        $.ajax({
                            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderByKey.do' />"
                            ,data:JSON.stringify({sRoDocNo:data.roDocNo})
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR, status, error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(result, textStatus){
                                if(dms.string.strNvl(result.roDocNo) == "") {

                                    dms.notification.info("<spring:message code='ser.lbl.ro' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");

                                } else {
                                    var goodwillYn = dms.string.defaultString(result.goodwillYn,"N");
                                    if(goodwillYn == "N"){
                                        if(result.qtTestMthCd  == "01" && result.qtTestStatCd != "Q2"){
                                            dms.notification.warning("<spring:message code='ser.lbl.qtTest' var='qtTest' /><spring:message code='global.info.required.preprocess' arguments='${qtTest}' />");
                                            return;
                                        }
                                        if(result.roStatCd  == "01" || (result.roStatCd  == "02" && result.dlStatCd != "02")){
                                            dms.notification.warning("<spring:message code='ser.lbl.deliveryChk' var='deliveryChk' /><spring:message code='global.info.required.preprocess' arguments='${deliveryChk}' />");
                                            return;
                                        }
                                    } else {
                                        if(result.roStatCd == "06"){
                                            dms.notification.warning("<spring:message code='ser.lbl.calc' var='calc' /><spring:message code='par.err.paramNotAvailable' arguments='${calc}' />");
                                            return;
                                        }
                                    }

                                    getCustInfo(result,"N");                        // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                                    tabInfoSet(result.roDocNo, "RO");
                                    calcInfoSet(result, infoType);
                                 }
                            }
                        });
                    } else {

                        getCustInfo(result,"N");    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                        calcInfoSet(result, "CA");
                        tabInfoSet(result.roDocNo, "RO");

                    }
                }
            });
        } else if(infoType == "CA") {
            var data = {"calcDocNo":data.calcDocNo};
            callCalcData(data);
        }

        changeTotalAmt();
    };

    callCalcData = function(data){
        $.ajax({
            url:"<c:url value='/ser/cal/calculate/selectCalculateByKey.do' />"
            ,data:JSON.stringify({sRoDocNo:data.roDocNo, sCalcDocNo:data.calcDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){

                if(dms.string.strNvl(result.calcDocNo) == ""){
                    dms.notification.info("<spring:message code='ser.lbl.calc' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                } else {
                    $("#demicalPointCut").data("kendoButton").enable(true);
                    $("#wonUnitCut").data("kendoButton").enable(true);
                    $("#dcRole").data("kendoButton").enable(true);

                    getCustInfo(result,"N");    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                    tabInfoSet(result.roDocNo, "RO");
                    calcInfoSet(result, "CA");
                }
            }
        });
    };


    setNvlDefault = function( value){
        var resultVal = 0;
        if( (dms.string.strNvl (value) != "" )){
            resultVal = value;
        }
        return resultVal;
    };

    // 정산정보 셋팅
    calcInfoSet = function(result, infoType){

        $("#runDistVal").val(result.runDistVal);//khs
        $("#calcDocNo").val(result.calcDocNo);
        $("#roDocNo").val(result.roDocNo);
        $("#roStatCd").data("kendoExtDropDownList").value(result.roStatCd);

        var i=0;
        for(i=0; i<roStatCdList.length; i++){
            if(roStatCdList[i].cmmCd == result.roStatCd){
                $("#roStatCdTablet").val(roStatCdList[i].cmmCdNm);//khs
                break;
            }
        }
        $("#regUsrNmTablet").val(result.regUsrNm);

        $("#calcDocNo").attr("readonly", true);
        $("#roDocNo").attr("readonly", true);
        $(".keyNumber").addClass("readonly_area");
        $("#roGrpNo").val(result.roGrpNo);
        $("#resvDocNo").val(result.resvDocNo);
        $("#diagDocNo").val(result.diagDocNo);
        $("#rcvDocNo").val(result.rcvDocNo);
        $("#roTpNm").val(roTpCdGrid(result.roTp));
        $("#roDt").data("kendoExtMaskedDatePicker").value(result.roDt);
        $("#roTp").val(result.roTp);
        $("#saId").val(result.saId);
        $("#saNm").val(result.saNm);
        if(infoType == "RO"){
            $("#roUsrNm").val(result.regUsrNm);
        } else {
            $("#roUsrNm").val(result.roUsrNm);
            $("#regUsrNm").val(result.regUsrNm);
        }

        $("#calcRemark").val(result.calcRemark);
        $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
        $("#giRunDistVal").data("kendoExtNumericTextBox").value(setNvlDefault(result.giRunDistVal));
        $("#giRunDistValTablet").val(result.giRunDistVal);//khs

        $("#nextFreeMonth").val(result.nextFreeMonth);
        $("#nextFreeRunDistVal").val(result.nextFreeRunDistVal);

        // 정비예정일자, 예정주행거리값 설정
        // 해당 정비 항목에 BH공임이 없는경우 해당 vin의 max값을 읽어와서 세팅
        // 해당 정비 항목에 BH공임이 있는경우 설정값을 가져와서 계산하여 세팅.(selectLbrList.jsp)
        if(result.expcChkDt != undefined){
            $("#expcChkDt").data("kendoExtMaskedDatePicker").value(result.expcChkDt);
        } else {
            var expcChkDt = kendo.parseDate("${sysDate}");
            expcChkDt.setMonth(expcChkDt.getMonth() + Number($("#nextFreeMonth").val()));
            $("#expcChkDt").data("kendoExtMaskedDatePicker").value(expcChkDt);
        }
        if(result.expcChkRunDistVal != undefined && result.expcChkRunDistVal != 0){
            $("#expcChkRunDistVal").data("kendoExtNumericTextBox").value(result.expcChkRunDistVal);
        } else {
            var expcChkRunDistVal = $("#giRunDistVal").data("kendoExtNumericTextBox").value() + Number($("#nextFreeRunDistVal").val());
            if(isTablet == "true")expcChkRunDistVal = Number($("#runDistValTablet").val())+Number($("#nextFreeRunDistVal").val());//khs
            $("#expcChkRunDistVal").data("kendoExtNumericTextBox").value(expcChkRunDistVal);
        }
        if(result.mainCtnoDtTp != undefined){
            $("#mainCtnoDtTp").data("kendoExtDropDownList").value(result.mainCtnoDtTp);
        } else {
            $("#mainCtnoDtTp").data("kendoExtDropDownList").value("02");
        }
        if(result.mainCtnoTp != undefined){
            $("#mainCtnoTp").data("kendoExtDropDownList").value(result.mainCtnoTp);
        } else {
            $("#mainCtnoTp").data("kendoExtDropDownList").value("01");
        }

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
        $("#etcDcCd").val(result.etcDcCd);
        $("#pdiYn").val(result.pdiYn);
        $("#calcGrid").data("kendoExtGrid").dataSource.read();
	//blueMemberInfo();去掉蓝缤相关的积分查询部分，只保留自店会员部分  贾明 2020-6-2 
        dealerMemberInfo();

        // 블루멤버스 쿠폰 사용 시 쿠폰 조회.
        // 정산금액이 0일 경우에도 사용 쿠폰이 조회되도록 함.
	        /**蓝缤信息回显 注释
	        var cardNo = "";     //卡券编号
        var cupnNm = "";
        var atvtTp = "";
        var cupnAmt = ""; //0;
        var cupnChangeAmt = ""; //0;
        var cupnUsage = "";
        var cupnStartDt = ""; //new Date;
        var cupnEndDt = "";
        var cupnRemark = "";
        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();
        $.each(calcData, function(i,v){
            if(this.paymTp == "04" && this.cupnNo != null && this.cupnNo != ""){
                cardNo = this.cupnNo;
                cupnNm = this.cupnNm;
                atvtTp = this.atvtTp;
                cupnAmt = this.cupnAmt;
                cupnChangeAmt = this.cupnChangeAmt;
                cupnUsage = this.cupnUsage;
                cupnStartDt = this.cupnStartDt;
                cupnEndDt = this.cupnEndDt;
                cupnRemark = this.cupnRemark;
            }
        });
        var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
        var bmCupnData = bmCupnGrid.dataItem("tr:eq(0)");
        bmCupnData.set("cardNo", cardNo);
        bmCupnData.set("cupnNm", cupnNm);
        bmCupnData.set("atvtTp", atvtTp);
        bmCupnData.set("reduceCost", cupnAmt);
        bmCupnData.set("cupnChangeAmt", cupnChangeAmt);
        bmCupnData.set("bmCupnTp", cupnUsage);
        bmCupnData.set("couponBeginDate", cupnStartDt);
        bmCupnData.set("couponEndDate", cupnEndDt);
        bmCupnData.set("remark", cupnRemark);
	*/
	//tjx 卡券信息回显
			var cardNo = "";     //卡券编号
		    var cardNm = "";     //卡券名称
		    var cardTp = "";     //卡券类型
		    var cardDeno = "";   //卡券面额
		    var claimAmo = "";   //索赔金额
		    var cardAdjust = ""; //调整项
		    var cupnChangeAmt = ""; //调整金额
		    var cardUseNoti = "";  //使用须知
		    var expirationDate = ""; //截止日期
		    var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();
		    $.each(calcData, function(i,v){
		        if(this.paymTp == "04" && this.cupnNo != null && this.cupnNo != ""){
		            cardNo = this.lanBinCardNo;
		            cardNm = this.lanBinCardName;
		            cardTp = this.lanBinCardType;
		            cardDeno = this.lanBinCardAmount;
		            claimAmo = this.lanBinCouponClaim;
		            cardAdjust = this.cupnUsage;
		            cupnChangeAmt = this.lanBinCouponAdju;
		            cardUseNoti = this.lanBinUseNotice;
		            expirationDate = this.lanBinCardEffeDt;
		        }
		    });
		    var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
		    var bmCupnData = bmCupnGrid.dataItem("tr:eq(0)");
		    bmCupnData.set("cardNo", cardNo);
		    bmCupnData.set("cardNm", cardNm);
		    bmCupnData.set("cardTp", cardTp);
		    bmCupnData.set("cardDeno", cardDeno);
		    bmCupnData.set("claimAmo", claimAmo);
		    bmCupnData.set("cardAdjust", cardAdjust);
		    bmCupnData.set("cupnChangeAmt", cupnChangeAmt);
		    bmCupnData.set("cardUseNoti", cardUseNoti);
		    bmCupnData.set("expirationDate", expirationDate);
        if(dms.string.isNotEmpty(bmCupnData.cardNo)){
            $("#bmCupnVerify").click();
        }

        if(result.calcStatCd == "04"){          // 정산확인
            btnControll("04");
        } else if(result.calcStatCd == "00"){   // 수납완료
            btnControll("00");
        } else if(result.calcStatCd == "03") {  // 정산대기
            btnControll("03");
        } else if(result.calcStatCd == "07"){   // 정산취소
            btnControll("07");
        }else {
            btnControll("01");
        }
    };

    $("#tabstrip2").kendoExtTabStrip({
        animation:false
    });

    //RO검색 팝업
    roSearchPopupWindow = function(){
        repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:_width2 //todo khskhs 사이즈변경완료
            , height:_height2
            , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "close" :"Y"
                    , "listType":"CA"
                    , "callbackFunc":function(data){
                        detailSet(data[0], false, "RO");
                    }
                }
            }
        });
    };

    //초기화
    initAll = function(){

        serviceJs.commonInit(preFixId);     // service 공통 JS
        btnControll();

        parDcRateMax = 100;
        lbrDcRateMax = 100;

        crTpYn = false;     // 캠페인여부 초기화
        $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
	//$("#bmPointGrid").data("kendoExtGrid").dataSource.data([{blueMembershipNo:"", bmMemberTp:"", consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]); 去掉蓝缤相关的积分查询部分，只保留自店会员部分 注掉贾明 2020-6-2
        $("#dlrPointGrid").data("kendoExtGrid").dataSource.data([{memberTp:"", membershipNo:"", gradeCd:"", lastPointVal:"", occrPointVal:"", cardNo:"", dlrUseAmt:"", dlrUsePurpose:""}]);
        $("#bmCupnGrid").data("kendoExtGrid").dataSource.data([{cardType:"", cardNo:"", couponBeginDate:"", couponEndDate:""}]);
        $("#dcGrid").data("kendoExtGrid").dataSource.data([]);
        $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);

        $("#calcDocNo").attr("readonly", false);
        $("#roDocNo").attr("readonly", false);
        $(".keyNumber").removeClass("readonly_area");

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

    // BM포인트 셋팅
    setBmPointData = function(){
        bmCancel();

        var grid = $("#bmPointGrid").data("kendoExtGrid");
        var rowData = grid.dataItem("tr:eq(0)");

        var calcGrid = $("#calcGrid").data("kendoExtGrid");
        var calcData = calcGrid.dataSource.data();

        var bmUseAmt = Number(rowData.bmUseAmt);
        var bmUsePurpose = rowData.bmUsePurpose;

        // 가용포인트보다 클수 없다
        if(rowData.point < rowData.consumePoints){
            rowData.set("consumePoints", 0);
            rowData.set("bmUseAmt", 0);
            dms.notification.info("<spring:message code='ser.lbl.thisUsePoint' var='pointUseAmt' /><spring:message code='ser.lbl.bmAvlbPoint' var='avlbPoint' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${avlbPoint}' />");
            return false;
        }

        if(calcData.length > 0){

            var custYn = false;

            $.each(calcData, function(i,v){
                if(this.paymTp == "04"){
                    custYn = true;
                    return false;
                }
            });

            if(custYn){
                $.each(calcData, function(i,v){
                    if(this.paymTp == "04"){
                        var paymAmt = Number(this.paymAmt - bmUseAmt);
                        if(paymAmt < 0) {
                            rowData.set("consumePoints", 0);
                            rowData.set("bmUseAmt", 0);
                            dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.finalCalcAmt' var='finalCalcAmt' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${finalCalcAmt}' />");
                        } else {
                            if(bmUsePurpose == "01"){
                                $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value(Number(bmUseAmt).toFixed(2));
                                $("#bmPointTotAmt").data("kendoExtNumericTextBox").value(Number(bmUseAmt).toFixed(2));
                            } else if(bmUsePurpose == "02"){
                                $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(Number(bmUseAmt).toFixed(2));
                                $("#bmPointTotAmt").data("kendoExtNumericTextBox").value(Number(bmUseAmt).toFixed(2));
                            } else {
                                $("#bmPointTotAmt").data("kendoExtNumericTextBox").value(Number(bmUseAmt).toFixed(2));
                            }

                            fnLastCalcAmt();   // 최종정산금액 계산
                            this.calcAmt = (Number(this.calcAmt) - Number(bmUseAmt)).toFixed(2);
                            this.paymAmt = (Number(this.paymAmt) - Number(bmUseAmt)).toFixed(2);
                            calcGrid.refresh();
                            grid.refresh();
                        }
                    }
                });
            } else {
                dms.notification.warning("<spring:message code='ser.info.pointUseCustNotExist'/>");
                return false;
            }

        } else {
            dms.notification.warning("<spring:message code='global.lbl.calculation' var='calculate' /><spring:message code='global.info.required.preprocess' arguments='${calculate}' />");
            return false;
        }
    };

    // 블루멤버스 취소
    bmCancel = function(type){
        var bmPointTotAmt = $("#bmPointTotAmt").data("kendoExtNumericTextBox").value();

        $("#bmPointTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(0.00);

        if(type == "C"){
	        	//tjx 取消蓝缤积分计算
	            //var bmPointGrid = $("#bmPointGrid").data("kendoExtGrid");
	            //var bmRowData = bmPointGrid.dataItem("tr:eq(0)");
	            //bmRowData.set("consumePoints", 0);
	            //bmRowData.set("bmUseAmt", 0);
            fnLastCalcAmt();
        }

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();
        $.each(calcData, function(i,v){
            if(this.paymTp == "04"){
                this.calcAmt = (Number(this.calcAmt) + Number(bmPointTotAmt)).toFixed(2);
                this.paymAmt = (Number(this.paymAmt) + Number(bmPointTotAmt)).toFixed(2);
                this.dcPermNm = "";
                this.dcPermCd = "";
            }
        });
        $("#calcGrid").data("kendoExtGrid").refresh();
    };

    // 딜러포인트 적용
    setDlrPointData = function(){
        dealerCancel();

        var grid = $("#dlrPointGrid").data("kendoExtGrid");
        var rowData = grid.dataItem("tr:eq(0)");

        var calcGrid = $("#calcGrid").data("kendoExtGrid");
        var calcData = calcGrid.dataSource.data();

        var dlrUseAmt = Number(rowData.dlrUseAmt);  // 이번사용금액
        var dlrUsePurpose = rowData.dlrUsePurpose;  // 사용용도

        // 가용포인트보다 클수 없다
        if(rowData.lastPointVal < rowData.occrPointVal){
            rowData.set("occrPointVal", 0);
            rowData.set("dlrUseAmt", 0);
            dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.avlbPoint' var='avlbPoint' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${avlbPoint}' />");
            return false;
        }

        if(calcData.length > 0){
            var custYn = false;

            $.each(calcData, function(i,v){
                if(this.paymTp == "04"){
                    custYn = true;
                    return false;
                }
            });

            if(custYn){
                $.each(calcData, function(i,v){
                    if(this.paymTp == "04"){
                        var paymAmt = Number(this.paymAmt) - Number(dlrUseAmt);
                        if(paymAmt < 0) {
                            rowData.set("occrPointVal", 0);
                            rowData.set("dlrUseAmt", 0);
                            dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.finalCalcAmt' var='finalCalcAmt' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${finalCalcAmt}' />");
                        } else {
                            if(dlrUsePurpose == "01"){
                                $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value(Number(dlrUseAmt).toFixed(2));
                                $("#pointTotAmt").data("kendoExtNumericTextBox").value(Number(dlrUseAmt).toFixed(2));
                            } else if(dlrUsePurpose == "02"){
                                $("#parPointUseAmt").data("kendoExtNumericTextBox").value(Number(dlrUseAmt).toFixed(2));
                                $("#pointTotAmt").data("kendoExtNumericTextBox").value(Number(dlrUseAmt).toFixed(2));
                            } else {
                                $("#pointTotAmt").data("kendoExtNumericTextBox").value(Number(dlrUseAmt).toFixed(2));
                            }

                            fnLastCalcAmt();   // 최종정산금액 계산
                            this.paymAmt = (Number(this.paymAmt) - Number(dlrUseAmt)).toFixed(2);
                            this.calcAmt = (Number(this.calcAmt) - Number(dlrUseAmt)).toFixed(2);
                            calcGrid.refresh();
                            grid.refresh();
                        }
                    }
                });
            } else {
	            	if(this.paymTp != "04"){                            
	            		dms.notification.warning("<spring:message code='ser.info.notCustomerPayment'/>");
	            	}else{
                dms.notification.warning("<spring:message code='ser.info.pointUseCustNotExist'/>");
	            	}
                return false;
            }
        } else {
            dms.notification.warning("<spring:message code='global.lbl.calculation' var='calculate' /><spring:message code='global.info.required.preprocess' arguments='${calculate}' />");
            return false;
        }

    };

    // 딜러포인트 취소
    dealerCancel = function(type){
        var pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value();

        $("#pointTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parPointUseAmt").data("kendoExtNumericTextBox").value(0.00);

        if(type == "C"){
            var dlrPointGrid = $("#dlrPointGrid").data("kendoExtGrid");
            var dlrRowData = dlrPointGrid.dataItem("tr:eq(0)");
            dlrRowData.set("occrPointVal", 0);
            dlrRowData.set("dlrUseAmt", 0);
            fnLastCalcAmt();
        }

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();

        $.each(calcData, function(i,v){
            if(this.paymTp == "04"){
                this.calcAmt = (Number(this.calcAmt) + Number(pointTotAmt)).toFixed(2);
                this.paymAmt = (Number(this.paymAmt) + Number(pointTotAmt)).toFixed(2);
                this.dcPermNm = "";
                this.dcPermCd = "";
            }
        });
        $("#calcGrid").data("kendoExtGrid").refresh();
    };

    // BM쿠폰 셋팅
    setBmCupnData = function(){

        bmCupnCancel();
        var grid = $("#bmCupnGrid").data("kendoExtGrid");
        var rowData = grid.dataItem("tr:eq(0)");

        if(rowData.cupnChangeAmt == "" || rowData.cupnChangeAmt == null){
            rowData.cupnChangeAmt = 0;
        }

        var calcGrid = $("#calcGrid").data("kendoExtGrid");
        var calcData = calcGrid.dataSource.data();
        //var reduceCost = Number(rowData.reduceCost).toFixed(1); //쿠폰적용금액
	        //var reduceCost = eval(rowData.reduceCost) + eval(rowData.cupnChangeAmt); //쿠폰적용금액 + 쿠폰조정금액
	        var cardDeno  = eval(rowData.cardDeno) + eval(rowData.cupnChangeAmt);//tjx 优惠金额  + 调整金额
	        //var bmCupnTp = rowData.bmCupnTp;
	        var cardAdjust = rowData.cardAdjust;//tjx 调整项修改
	
	        //cardAdjust 调整项 01 工时 , 02 : 配件
        if(calcData.length > 0){
            var custYn = false;

            $.each(calcData, function(i,v){
                if(this.paymTp == "04"){
                    custYn = true;
                    return false;
                }
            });

            if(custYn){
                $.each(calcData, function(i,v){
                    if(this.paymTp == "04" && custYn){ //고객유형
	                        //var paymAmt = Number(this.paymAmt - reduceCost);
	                    	var paymAmt = Number(this.paymAmt - cardDeno);
                        if(paymAmt < 0) {
                            $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(this.paymAmt));
	                            //reduceCost = Number(this.paymAmt);
	                            cardDeno = Number(this.paymAmt);
                        } else {
	                            /**if(bmCupnTp == "01"){
                                $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                            } else if(bmCupnTp == "02"){
                                $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                            } else {
                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
	                            }*/
	                        	if(cardAdjust == "01"){
	                                $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(Number(cardDeno).toFixed(2));
	                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(cardDeno).toFixed(2));
	                            } else if(cardAdjust == "02"){
	                                $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(Number(cardDeno).toFixed(2));
	                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(cardDeno).toFixed(2));
	                            } else {
	                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(cardDeno).toFixed(2));
                            }
                        }
                        fnLastCalcAmt();   // 최종정산금액 계산
	                        //this.calcAmt = (Number(this.calcAmt) - Number(reduceCost)).toFixed(2);
	                        this.calcAmt = (Number(this.calcAmt) - Number(cardDeno)).toFixed(2);
	                        //this.paymAmt = (Number(this.paymAmt) - Number(reduceCost)).toFixed(2);
	                        this.paymAmt = (Number(this.paymAmt) - Number(cardDeno)).toFixed(2);
                        this.cupnNo = rowData.cardNo;
                        this.cupnNm = rowData.cupnNm;
                        this.atvtTp = rowData.atvtTp;
	                        //this.cupnAmt = rowData.reduceCost;
	                        this.cupnAmt = rowData.cardDeno;
                        this.cupnChangeAmt = rowData.cupnChangeAmt;
	                        //this.cupnUsage = rowData.bmCupnTp;
	                        this.cupnUsage = rowData.cardAdjust
                        this.cupnStartDt = rowData.couponBeginDate;
                        this.cupnEndDt = rowData.couponEndDate;
                        this.cupnRemark = rowData.remark;

                        calcGrid.refresh();
                        bmCupnUseYn = "Y"; // BM쿠폰 확인을 누른 상태
                        // 지불유형이 고객이 n건인경우 중복적용을 막기위함.
                        custYn = false;
                    }
                });
	            } else {
	            	//20200611 updateby tjx 修改提醒内容 
	            	if(this.paymTp != "04"){                            
	            		dms.notification.warning("<spring:message code='ser.info.notCustomerPayment'/>");
            } else {
                dms.notification.warning("<spring:message code='ser.info.pointUseCustNotExist'/>");
	            	}
                return false;
            }
        } else {
            dms.notification.warning("<spring:message code='global.lbl.calculation' var='calculate' /><spring:message code='global.info.required.preprocess' arguments='${calculate}' />");
            return false;
        }
    };

    // BM쿠폰 취소
    bmCupnCancel = function(type){
        var bmCupnAmt = $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value();

        $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(0.00);

        if(type == "C"){
            fnLastCalcAmt();
            bmCupnUseYn = null;
        }

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();
        $.each(calcData, function(i,v){
            if(this.paymTp == "04" && this.cupnNo != null && this.cupnNo != ""){
                this.calcAmt = (Number(this.calcAmt) + Number(bmCupnAmt)).toFixed(2);
                this.paymAmt = (Number(this.paymAmt) + Number(bmCupnAmt)).toFixed(2);
                this.dcPermNm = "";
                this.dcPermCd = "";
                this.cupnNo = "";
                this.cupnNm = "";
                this.atvtTp = "";
                this.cupnStartDt = "";
                this.cupnEndDt = "";
                this.cupnRemark = "";
                this.cupnUsage = "";
                this.cupnChangeAmt = "";
                this.cupnAmt = "";
            }
        });
        $("#calcGrid").data("kendoExtGrid").refresh();
    };

    // 기타할인
    setEtcDcAmt = function() {
        var grid = $("#dcGrid").data("kendoExtGrid");
        var rowData = grid.dataItem(grid.select());

        if(rowData != null){
            if(rowData.dcPermTp == "02" && (rowData.totCnt - rowData.useCnt) <= 0){
                dms.notification.info("<spring:message code='ser.info.dcCntNotUse'/>");
                return false;
            }

            // 할인권한의 할인율과 기타할인의 할인금액을 동시게 적용시키기 위함
            //dcCancel();
            //dcRoleCancel();

            var calcGrid = $("#calcGrid").data("kendoExtGrid");
            var calcData = calcGrid.dataSource.data();

            var lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
            var lbrCalcSumAmt = $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value();
            var parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();

            if(rowData.dcTp == "01"){   // 할인방식 : 금액
                // 할인권한의 할인율과 기타할인의 할인금액을 동시게 적용시키기 위함
                if($("#etcDcCd").val() != ""){
                    if(gDcType == "01"){
                        dcCancel();
                        dcRoleCancel();
                    }else{
                        dcCancel();
                    }
                }else{
                    dcCancel();
                }
                lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
                lbrCalcSumAmt = $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value();
                parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();

                if(rowData.subDcAmt > 0){
                    var subDcAmt =  Number(lastCalcTotAmt) - Number(rowData.subDcAmt);
                    if(subDcAmt < 0){
                        $("#etcTotAmt").data("kendoExtNumericTextBox").value(Number(lastCalcTotAmt).toFixed(2));
                    } else {
                        $("#etcTotAmt").data("kendoExtNumericTextBox").value(Number(rowData.subDcAmt).toFixed(2));
                    }
                } else {
                    var lbrTotAmt = Number(lbrCalcSumAmt) - Number(rowData.lbrDcAmt);
                    var parTotAmt = Number(parCalcSumAmt) - Number(rowData.parDcAmt);
                    var lbrEtcDcAmt = 0;
                    var parEtcDcAmt = 0;

                    if(lbrTotAmt < 0){
                        lbrEtcDcAmt = Number(lbrCalcSumAmt).toFixed(2);
                    } else {
                        lbrEtcDcAmt = Number(rowData.lbrDcAmt).toFixed(2);
                    }

                    if(parTotAmt < 0){
                        parEtcDcAmt = Number(parCalcSumAmt).toFixed(2);
                    } else {
                        parEtcDcAmt = Number(rowData.parDcAmt).toFixed(2);
                    }
                    $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value(Number(lbrEtcDcAmt));
                    $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(Number(parEtcDcAmt));
                    $("#etcTotAmt").data("kendoExtNumericTextBox").value(Number(lbrEtcDcAmt) + Number(parEtcDcAmt));
                }

                fnLastCalcAmt();

                $.each(calcData, function(i,v){
                    if(this.paymTp == "04"){
                        this.calcAmt = (Number(this.calcAmt) - Number($("#etcTotAmt").data("kendoExtNumericTextBox").value())).toFixed(2);
                        this.paymAmt = (Number(this.paymAmt) - Number($("#etcTotAmt").data("kendoExtNumericTextBox").value())).toFixed(2);
                    }
                });
                gDcType = "01";
            } else {    // 할인방식 : 할인율
                dcCancel();
                dcRoleCancel();
                lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
                lbrCalcSumAmt = $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value();
                parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();
                if(rowData.subDcAmt > 0){
                    var subDcRate =  ((rowData.subDcAmt / 100) ).toFixed(2); // 할인율
                    var calcTotAmt = $("#calcTotAmt").data("kendoExtNumericTextBox").value();
                    $("#dcTotRate").data("kendoExtNumericTextBox").value(Number(rowData.subDcAmt).toFixed(2));
                    $("#dcTotAmt").data("kendoExtNumericTextBox").value(Number(calcTotAmt) - Number(calcTotAmt * (1-subDcRate)).toFixed(2));
                    $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value(Number(calcTotAmt - $("#dcTotAmt").data("kendoExtNumericTextBox").value()).toFixed(2));
                    fnLastCalcAmt();
                } else {
                    var jsonObj = {
                            lbrDcRate:rowData.lbrDcAmt
                            ,parDcRate:rowData.parDcAmt
                            ,dcTp:rowData.dcTp
                    }
                    setDcData(jsonObj, "etcDc");
                }
            }
            $("#etcDcCd").val(rowData.dcCd);
            calcGrid.refresh();
            gDcType = "02";
        }
    };

    // 기타할인 초기화
    dcCancel = function() {
        // 할인권한의 할인율과 기타할인의 할인금액을 동시게 적용시키기 위함
        //dcRoleCancel();
        var etcTotAmt = $("#etcTotAmt").data("kendoExtNumericTextBox").value();
        $("#etcTotAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#dcTotRate").data("kendoExtNumericTextBox").value(0.00);
        $("#etcDcCd").val("");

        fnLastCalcAmt();

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();

        $.each(calcData, function(i,v){
            if(this.paymTp == "04"){
                this.calcAmt = (Number(this.calcAmt) + Number(etcTotAmt)).toFixed(2);
                this.paymAmt = (Number(this.paymAmt) + Number(etcTotAmt)).toFixed(2);
            }
        });
        $("#calcGrid").data("kendoExtGrid").refresh();
        gDcType = "";
    };

    // 할인권한 셋팅
    setDcData = function(jsonObj, dcType){
        dcRoleCancel();
        dcCancel();

        var lbrDcRate = Number(jsonObj.lbrDcRate).toFixed(2);
        var parDcRate = Number(jsonObj.parDcRate).toFixed(2);
        var lbrDcAmt = Number(jsonObj.lbrDcAmt).toFixed(2);
        var parDcAmt = Number(jsonObj.parDcAmt).toFixed(2);
        var dcTp =  jsonObj.dcTp; // 01 : 금액 , 02 : 할인률

        var partGrid = $("#partGrid").data("kendoExtGrid");
        var lbrGrid = $("#lbrGrid").data("kendoExtGrid");

        $(partGrid.dataSource.data()).each(function(index, item){
            var dataItem = partGrid.dataSource._data;
            var rowData = dataItem[index];

            var parCalAmt =0,
            dcCalRate = 0,
            parTotAmt = 0,
            dcCalAmt = 0;

            if(dcTp == "01"){
                if(parDcRate >= this.dcRate){

                    parCalAmt = (this.itemPrc * this.itemQty);
                    dcCalAmt  = parDcAmt;
                    parTotAmt = (parCalAmt - parDcAmt).toFixed(2);
                    dcCalRate = Number(Math.abs((parTotAmt / parCalAmt) -1 )).toFixed(2); // 할인율

                }

            }else if(dcTp == "02"){
                if(parDcRate >= this.dcRate){
                    parCalAmt = (this.itemPrc * this.itemQty);
                    dcCalRate =  Number(parDcRate).toFixed(2) / 100;// 할인율
                    parTotAmt =  (parCalAmt * (1-dcCalRate)).toFixed(2);
                    dcCalAmt  =  (parCalAmt - parTotAmt).toFixed(2);
                }
            }
            rowData.set("dcRate", parDcRate);
            rowData.set("reqQty", rowData.itemQty);
            rowData.set("itemTotAmt", parTotAmt);
            rowData.set("dcAmt",  dcCalAmt);

        });

        var lbrCalAmt = 0,
            lbrTotAmt = 0 ;
            dcCalRate = 0;
            dcCalAmt = 0 ;

         $(lbrGrid.dataSource.data()).each(function(index, item){

             var dataItem = lbrGrid.dataSource._data;
             var lbrRowData = dataItem[index];


            if(dcTp == "01"){
                if(lbrDcAmt >= this.dcAmt){

                    lbrCalAmt = (this.lbrQty * this.lbrHm * this.lbrPrc);
                    lbrTotAmt = (lbrCalAmt - lbrDcAmt).toFixed(2);
                    dcCalAmt  = lbrDcAmt;
                    dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                }
            }else if(dcTp == "02"){
                if(lbrDcRate >= this.dcRate ){
                    lbrCalAmt = (this.lbrQty * this.lbrHm * this.lbrPrc);
                    dcCalRate =  Number(lbrDcRate).toFixed(2) / 100  // 할인율
                    lbrTotAmt =  (lbrCalAmt * (1-dcCalRate)).toFixed(2);
                    dcCalAmt =  (lbrCalAmt - lbrTotAmt).toFixed(2);
                }
            }
            lbrRowData.set("dcRate", lbrDcRate);
            lbrRowData.set("dcAmt",  dcCalAmt );
            lbrRowData.set("lbrTotAmt", lbrTotAmt );
            lbrRowData.set("lbrAmt", (this.lbrQty * this.lbrHm * this.lbrPrc).toFixed(2));
        });

        var lbrCalcSumAmt = $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value();
        var parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();
        var lbrCalcAmt = $("#lbrCalcAmt").data("kendoExtNumericTextBox").value();
        var lbrDcAmt = $("#lbrDcAmt").data("kendoExtNumericTextBox").value();
        var parDcAmt = $("#parDcAmt").data("kendoExtNumericTextBox").value();
        var lbrWhDcAmt = $("#lbrWhDcAmt").data("kendoExtNumericTextBox").value();
        var parWhDcAmt = $("#parWhDcAmt").data("kendoExtNumericTextBox").value();
        var lbrEtcDcAmt = 0;
        var parEtcDcAmt = 0;

        if(lbrCalcSumAmt <= 0){
            $("#lbrWhDcAmt").data("kendoExtNumericTextBox").value((Number(lbrWhDcAmt) - Number(lbrCalcSumAmt)).toFixed(2));
            $("#lbrDcAmt").data("kendoExtNumericTextBox").value((Number(lbrDcAmt)+ Number(lbrCalcSumAmt)).toFixed(2));
            $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value(0.00);
        }

        if(parCalcSumAmt <= 0){
            $("#parWhDcAmt").data("kendoExtNumericTextBox").value((Number(parWhDcAmt) - Number(parCalcSumAmt)).toFixed(2));
            $("#parDcAmt").data("kendoExtNumericTextBox").value((Number(parDcAmt)+ Number(parCalcSumAmt)).toFixed(2));
            $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(0.00);
        }

        $("#dcTotAmt").data("kendoExtNumericTextBox").value((Number($("#lbrDcAmt").data("kendoExtNumericTextBox").value()) + Number($("#parDcAmt").data("kendoExtNumericTextBox").value())).toFixed(2));
        $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value((Number($("#lbrWhDcAmt").data("kendoExtNumericTextBox").value()) + Number($("#parWhDcAmt").data("kendoExtNumericTextBox").value()) + Number($("#etcWhDcAmt").data("kendoExtNumericTextBox").value())).toFixed(2));

        fnLastCalcAmt();

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();

        $.each(calcData, function(i,v){
            if(this.paymTp == "04"){
                this.calcAmt = (Number(this.calcAmt)-Number($("#dcTotAmt").data("kendoExtNumericTextBox").value())).toFixed(2);
                this.paymAmt = (Number(this.paymAmt)-Number($("#dcTotAmt").data("kendoExtNumericTextBox").value())).toFixed(2);
                this.dcPermNm = "";
                this.dcPermCd = "";
            }
        });
        $("#calcGrid").data("kendoExtGrid").refresh();

        // 할인율 맥스제한
        if(dcType == "dcRole"){
            parDcRateMax = parDcRate;
            lbrDcRateMax = lbrDcRate;
            parDcRateEditable = true;
            lbrDcRateEditable = true;
        }

        gDcType = "02";

    };

    // 할인권한 취소
    dcRoleCancel = function(){
        var lbrData = getLbrData();
        var partData = getPartData();

        var lbrDcAmt = $("#lbrDcAmt").data("kendoExtNumericTextBox").value();
        var parDcAmt = $("#parDcAmt").data("kendoExtNumericTextBox").value();

        $.each(getPartData(), function(i, item){
            var itemQty = 0;

            this.dcRate = 0.00;
            this.dcAmt = 0.00;

            if(this.giQty > 0){
                itemQty = Number(this.giQty);
            } else {
                itemQty = Number(this.itemQty);
            }
            this.itemTotAmt = Number(this.itemPrc*itemQty);
        });

        $.each(getLbrData(), function(i, item){
            this.dcRate = 0.00;
            this.dcAmt = 0.00;

            var lbrTotAmt = Number(this.lbrQty * this.lbrHm * this.lbrPrc).toFixed(2);
            this.lbrTotAmt = lbrTotAmt;
            this.lbrAmt = lbrTotAmt;
        });

        $("#lbrGrid").data("kendoExtGrid").refresh();
        $("#partGrid").data("kendoExtGrid").refresh();

        $("#dcTotAmt").data("kendoExtNumericTextBox").value(0.00);
        changeTotalAmt();

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();

        $.each(calcData, function(i,v){
            if(this.paymTp == "04"){
                this.paymAmt = (Number(this.paymAmt) + Number(lbrDcAmt) + Number(parDcAmt)).toFixed(2);
                this.calcAmt = (Number(this.calcAmt) + Number(lbrDcAmt) + Number(parDcAmt)).toFixed(2);
                this.dcPermNm = "";
                this.dcPermCd = "";
            }
        });
        $("#calcGrid").data("kendoExtGrid").refresh();
        parDcRateMax = 100;
        lbrDcRateMax = 100;
        parDcRateEditable = false;
        lbrDcRateEditable = false;

        gDcType = "";
    };

    changePaymUsr = function(id) {

        var grid = $("#"+id).data("kendoExtGrid");
        var rowData = grid.dataItem(grid.select());

        if(rowData != null){
            var paymTp = rowData.paymTp;
            var paymUsrNm;

            if(paymTp == "01") {
                paymUsrNm = "BHMC";
            } else if(paymTp == "03") {
                paymUsrNm = "<spring:message code='global.lbl.incCmp' />";
            } else {
                paymUsrNm = $("#carOwnerNm").val();
            }
        }
    };

    // 최종정산금액
    fnLastCalcAmt = function(){

        var lbrWhDcAmt = $("#lbrWhDcAmt").data("kendoExtNumericTextBox").value();
        var parWhDcAmt = $("#parWhDcAmt").data("kendoExtNumericTextBox").value();
        var etcWhDcAmt = $("#etcWhDcAmt").data("kendoExtNumericTextBox").value();
        var dcWhTotDcAmt = $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value();

        var lbrPointUseAmt = $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value();
        var parPointUseAmt = $("#parPointUseAmt").data("kendoExtNumericTextBox").value();
        var lbrBmPointUseAmt = $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value();
        var parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value();
        var lbrBmCupnUseAmt = $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value();
        var parBmCupnUseAmt = $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value();

        var bmPointTotAmt = $("#bmPointTotAmt").data("kendoExtNumericTextBox").value();
        var bmCupnTotAmt = $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value();
        var pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value();
        var etcTotAmt = $("#etcTotAmt").data("kendoExtNumericTextBox").value();
        var lbrEtcDcAmt = $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value();
        var parEtcDcAmt = $("#parEtcDcAmt").data("kendoExtNumericTextBox").value();

        var lbrCalcSumAmt = Number(lbrWhDcAmt - lbrEtcDcAmt - lbrBmPointUseAmt - lbrBmCupnUseAmt - lbrPointUseAmt);
        var parCalcSumAmt = Number(parWhDcAmt - parEtcDcAmt - parBmPointUseAmt - parBmCupnUseAmt - parPointUseAmt);

        $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value(lbrCalcSumAmt <= 0 ? 0.00 : Number(lbrCalcSumAmt).toFixed(2));
        $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(parCalcSumAmt <= 0 ? 0.00 : Number(parCalcSumAmt).toFixed(2));
        $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value(Number(etcWhDcAmt) <= 0 ? 0.00 : Number(etcWhDcAmt));
        $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value(Number(dcWhTotDcAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt));
    };

    btnControll = function(status,paymTp){

        var statusYn = (status == undefined) ? false : ( ($("#roTp").val() == "02") ? false : true );


        //보증일경우
        //보증 : 분리
        //그외 : 전부 활성화

        if(status == "01"){
            $("#calcConfirm").data("kendoButton").enable(false);
            $("#calculate").data("kendoButton").enable(true);
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(false);
            //임의추가
            $("#print2").data("kendoButton").enable(false);
            $("#serviceReceive").data("kendoButton").enable(false);
            $("#lbrSuggestAdd").data("kendoButton").enable(false);
            $("#lbrSuggestDel").data("kendoButton").enable(false);
            $("#repairComfirm").data("kendoButton").enable(false);
        } else if(status == "02"){
            $("#calcConfirm").data("kendoButton").enable(true);
            $("#calculate").data("kendoButton").enable(true);
            $("#wonUnitCut").data("kendoButton").enable(statusYn);//정산절사
            $("#demicalPointCut").data("kendoButton").enable(statusYn);//정산제로
            $("#dcRole").data("kendoButton").enable(statusYn); //할인권한
            $("#calAdd").data("kendoButton").enable(true); //분리
            $("#print").data("kendoButton").enable(true);
            //임의추가
            $("#print2").data("kendoButton").enable(true);
            $("#serviceReceive").data("kendoButton").enable(false);
            $("#lbrSuggestAdd").data("kendoButton").enable(true);
            $("#lbrSuggestDel").data("kendoButton").enable(true);
            $("#repairComfirm").data("kendoButton").enable(true);
        } else if(status == "03"){
            $("#calcConfirm").data("kendoButton").enable(true);
            $("#calculate").data("kendoButton").enable(true);
            $("#wonUnitCut").data("kendoButton").enable(statusYn);
            $("#demicalPointCut").data("kendoButton").enable(statusYn);
            $("#dcRole").data("kendoButton").enable(statusYn);
            $("#calAdd").data("kendoButton").enable(true);
            $("#print").data("kendoButton").enable(true);
            //임의추가
            $("#print2").data("kendoButton").enable(true);
            $("#serviceReceive").data("kendoButton").enable(false);
            $("#lbrSuggestAdd").data("kendoButton").enable(true);
            $("#lbrSuggestDel").data("kendoButton").enable(true);
            $("#repairComfirm").data("kendoButton").enable(true);
        } else if(status == "04" || status == "00"){ //정산확인 , 정산완료
            $("#calcConfirm").data("kendoButton").enable(false);
            $("#calculate").data("kendoButton").enable((status == "04") ? true : false);
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(true);
            //임의추가
            $("#print2").data("kendoButton").enable(true);
            $("#serviceReceive").data("kendoButton").enable((status == "04") ? true : false);
            $("#lbrSuggestAdd").data("kendoButton").enable(true);
            $("#lbrSuggestDel").data("kendoButton").enable(true);
            $("#repairComfirm").data("kendoButton").enable(true);
        } else if (status == "07"){
            $("#calcConfirm").data("kendoButton").enable(false);
            $("#calculate").data("kendoButton").enable(false);
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(false);
            //임의추가
            $("#print2").data("kendoButton").enable(false);
            $("#serviceReceive").data("kendoButton").enable(false);
            $("#lbrSuggestAdd").data("kendoButton").enable(false);
            $("#lbrSuggestDel").data("kendoButton").enable(false);
            $("#estimate").data("kendoButton").enable(false);
            $("#repairComfirm").data("kendoButton").enable(false);
        }else {
            $("#calcConfirm").data("kendoButton").enable(false);
            $("#calculate").data("kendoButton").enable(false);
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(false);
            //임의추가
            $("#print2").data("kendoButton").enable(false);
            $("#serviceReceive").data("kendoButton").enable(false);
            $("#lbrSuggestAdd").data("kendoButton").enable(false);
            $("#lbrSuggestDel").data("kendoButton").enable(false);
            $("#estimate").data("kendoButton").enable(true);
            $("#repairComfirm").data("kendoButton").enable(false);
        }

        $("#dealerSet").data("kendoButton").enable(statusYn);
        $("#dealerCancel").data("kendoButton").enable(statusYn);
	        /** 去掉蓝缤相关的积分查询部分，只保留自店会员部分  注掉贾明 2020-6-2
        $("#bmSearch").data("kendoButton").enable(statusYn);
        $("#bmSet").data("kendoButton").enable(statusYn);
        $("#bmCancel").data("kendoButton").enable(statusYn);
	        **/
        $("#dcSet").data("kendoButton").enable(statusYn);
        $("#dcCancel").data("kendoButton").enable(statusYn);
	        /**20200728 update by tjx 不做车辆品牌限制
        // 브랜드코드(현대 : N, 기타 : O)가 타차이면 BM관련 버튼 막는다.
        if($("#carBrandCd").val() == "O"){
	           
	                                          注掉 贾明 2020-6-2 去掉蓝缤相关的积分查询部分，只保留自店会员部分
            $("#bmSearch").data("kendoButton").enable(false);
            $("#bmSet").data("kendoButton").enable(false);
            $("#bmCancel").data("kendoButton").enable(false);
	            
            $("#bmCupnVerify").data("kendoButton").enable(false);
            $("#bmCupnSet").data("kendoButton").enable(false);
            $("#bmCupnCancel").data("kendoButton").enable(false);
        }
	        **/
    };

    //TAB 정보
    tabInfoSet = function(docNo , preFixId){
        etcIssueSet(docNo, preFixId);       //기타사항(selectEtcIssue.jsp)
        trobleDescInfo(docNo, preFixId);    //고객요구사항및 고장설명(selectTabInfo.jsp)
        lbrSuggestSet(docNo, preFixId);     //수리건의(selectLbrSuggest.jsp)
        partInfo(docNo, preFixId);          //부품(selectPartList.jsp)
        lbrInfo(docNo, preFixId);           //공임(selectLbrList.jsp)
    };

    <c:if test="${calcDocNo ne ''}">
        var data = {"roDocNo":"", "calcDocNo":"${calcDocNo}"};
        detailSet(data, false, "CA");
    </c:if>
    <c:if test="${roDocNo ne ''}">
        var data = {"roDocNo":"${roDocNo}", "calcDocNo":""};
        detailSet(data, false, "RO");
    </c:if>

    custInfoUseControll(false);

    if(isTablet == "true"){
        $("#serLblCalcNo").css("width","27%");
        $("#serLblCalcDt").css("width","26%");
        if(window.matchMedia('(max-width:1024px)').matches){
            $("#calcGrid").parents(".table_grid").attr("style","width:938px !important; max-width:938px !important");
        }
    }

});
</script>
<!-- //script -->

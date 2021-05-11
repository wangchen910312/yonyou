<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 견적 -->
<div id="resizableContainer">
    <div class="content_v1">
        <form id="dmsForm" name="dmsForm" method="POST">
        <input type="hidden" id="roGrpNo" name="roGrpNo" data-json-obj="true">
        <input type="hidden" id="serParDstinCd" name="serParDstinCd" data-json-obj="true">
        <input type="hidden" id="nextFreeMonth" name="nextFreeMonth" >
        <input type="hidden" id="nextFreeRunDistVal" name="nextFreeRunDistVal" >
        <input type="hidden" id="etcDcCd" name="etcDcCd" data-json-obj="true">
        <input type="hidden" id="etcDcSeq" name="etcDcSeq" data-json-obj="true">

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
                            <th scope="row"><spring:message code="ser.lbl.estDocNo" /></th><!-- 견적번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="estDocNo" name="estDocNo" class="form_input" data-json-obj="true">
                                    <a href="javascript:goEstStatus();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.estDt" /><!-- 견적일자 --></th>
                            <td class="readonly_area">
                                <input id="estDt" name="estDt" class="form_datetimepicker" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.estimateStatCd" /></th><!-- 견적상태 -->
                            <td class="readonly_area">
                                <input type="text" id="estStatCd" name="estStatCd" readonly class="form_comboBox" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.estWrtrNm" /></th><!-- 견적조작자 -->
                            <td class="readonly_area">
                                <input id="regUsrNm" name="regUsrNm" readonly class="form_input" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.roDocNo' /><!-- RO번호 --></th>
                            <td class="keyNumber">
                                <div class="form_search">
                                    <input type="text" id="roDocNo" name="roDocNo" class="form_input" data-json-obj="true" >
                                    <a href="javascript:roSearchPopupWindow();"></a>
                                </div>
                            </td>

                            <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!-- RO유형 -->
                            <td>
                                <input id="roTp" name="roTp" class="form_comboBox" value="01" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roDt' /><!-- RO일자 --></th>
                            <td class="readonly_area"><input type="text" id="roDt" name="roDt" class="form_datetimepicker" readonly></td>
                            <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!-- 발행자 -->
                            <td class="readonly_area">
                                <input id="roUsrNm" name="roUsrNm" readonly class="form_input" >
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <th scope="row"><spring:message code='ser.title.resvDocNo' /><!-- 예약번호 --></th>
                            <td class="readonly_area"><input type="text" id="resvDocNo" name="resvDocNo" class="form_input" readonly data-json-obj="true" ></td>
                            <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                            <td class="readonly_area"><input type="text" id="diagDocNo" name="diagDocNo" class="form_input" readonly data-json-obj="true" ></td>
                            <th scope="row"><spring:message code='ser.lbl.incReqNo' /><!-- 보험신청번호 --></th>
                            <td><input type="text" id="incReqNo" name="incReqNo" class="form_input form_readonly" data-json-obj="true" readonly></td>
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
                    <li class="k-state-active"><spring:message code='ser.lbl.estCost' /><!-- 견적비용 --></li>
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

                <!-- 수리건의-->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrSuggest.jsp" />
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
                                    <th scope="col"><spring:message code="ser.lbl.estCost" /></th><!--견적비용  -->
                                    <th scope="col"><spring:message code="ser.lbl.estAmt" /></th><!--견적금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.dcRate" /></th><!--할인율  -->
                                    <th scope="col"><spring:message code="ser.lbl.dcAmt" /></th><!--할인금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.whDcAmt" /></th><!--할인후금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.bmPointUseAmt" /></th><!--BM포인트사용금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.bmCupnUseAmt" /></th>  <!--BM쿠폰사용금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.dlrPointUseAmt" /></th><!--포인트사용금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.etcSaleAmt" /></th><!--기타혜택금액  -->
                                    <th scope="col"><spring:message code="ser.lbl.finalEstAmt" /></th><!--최종견적금액  -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.estLbrSubAmt" /></th><!--견적공임비소계  -->
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
                                    <th scope="row"><spring:message code="ser.lbl.estParSubCamt" /></th><!--견적부품비소계  -->
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
                                    <th scope="row"><spring:message code="ser.lbl.estEtcSubAmt" /></th><!--견적기타비용소계  -->
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
                                    <th scope="row"><spring:message code="ser.lbl.estSerTotAmt" /></th><!--견적서비스총계  -->
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
                <!-- //기타사항 -->

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
                            <input type="text" id="mainCtnoDtTp" name="mainCtnoDtTp" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.mainContactMth" /></th><!--메인연락방식  -->
                        <td>
                            <input type="text" id="mainCtnoTp" name="mainCtnoTp" class="form_comboBox" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.estRemark" /></th><!--견적비고  -->
                        <td colspan="7">
                            <input type="text" id="estRemark" name="estRemark" class="form_input" data-json-obj="true">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11560" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="calAdd" class="btn_m" disabled><spring:message code="ser.btn.seperate" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11559" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="wonUnitCut" class="btn_m"><spring:message code="ser.lbl.interSettByEst" /><!-- 견적절사 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11558" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="demicalPointCut" class="btn_m"><spring:message code='ser.lbl.settClZeroByEst' /><!-- 견적제로 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11557" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="dcRole" class="btn_m" style="display:none"><spring:message code="ser.lbl.dcRole" /><!-- 할인권한 --></button>
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11556" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="roCreate" class="btn_m btn_link" style="display:none"><spring:message code="ser.btn.roInsert" /><!-- 수리위탁 --></button>
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
var estCancelPopup;
var repairOrderSearchPopup;
var cardPointUseParam;
var isTablet="${isTablet}";
var _width=920;//web
var _width2=900;//web
var _height2=570;//web
if(isTablet == "true"){
    _width=950;//tablet
    _width2=950;//web
    _height2=550;//web
}

//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd;});

//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd;});

//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//견적상태 Array
var estStatCdList = [];
<c:forEach var="obj" items="${estStatCdList}">
estStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//견적제로 Array
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

//견적상태 Map
var estStatCdMap = dms.data.arrayToMap(estStatCdList, function(obj){ return obj.cmmCd; });

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

goEstStatus = function(){
    parent._createOrReloadTabMenu("<spring:message code='ser.menu.estList'/>", "<c:url value='/ser/est/estimate/selectEstimateListMain.do'/>", "VIEW-D-10336"); // 견적접수현황
};

var dcData = {};

$(document).ready(function() {
    // 견적일자
    $("#estDt").kendoExtMaskedDatePicker({
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

    // 견적 상태
    $("#estStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:estStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO유형
    var preRoTp = "";
    $("#roTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,select:function(e){
            var selectVal = this.value();
            preRoTp = selectVal;
        }
        ,change:function(e){

            var partGridData = $("#partGrid").data("kendoExtGrid").dataSource._data;
            var roTp = this.value();
            var selectRoTp = preRoTp;


            if(partGridData.length > 0){

                setChangeRoTpValue(roTp,preRoTp); //selectPartList.jsp 로 이동

                if(chkRsultYn){
                    $("#messageId").html("<spring:message code='ser.info.deletePartsAndNew' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){

                            conformKendoWindow.close();
                            paymTpDataRstl(roTp);
                            roTpChangeSet(roTp);

                            $("#partGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#parAdd").click();

                        }else{
                            conformKendoWindow.close();
                            $("#roTp").data("kendoExtDropDownList").value(selectRoTp);
                            return false;
                        }

                    }).end();
                }else{
                    $("#roTp").data("kendoExtDropDownList").value(selectRoTp);
                }

            } else {
                setChangeRoTpValue(roTp,selectRoTp); //selectPartList.jsp 로 이동
                if(chkRsultYn){
                   paymTpDataRstl(roTp);
                   roTpChangeSet(roTp);
               }
            }
            // RO 유형별 결제유형 셋팅
            setPaymTpList(roTp);
            lbrDlrDcSet();
        }
        ,index:0
    });

    roTpChangeSet = function(roTp){

        if(roTp == '03'){
            var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
            var partGrid = $("#partGrid").data("kendoExtGrid");
            var grid = {
                    lbrGrid : lbrGrid
                   ,partGrid : partGrid
            };
            /* if(getPartData().length > 0 || getLbrData().length > 0){
                insurancePopupWindow(grid, "Y", "");
            } */
            insurancePopupWindow(grid, "Y", "");
            $("#incReqNo").prop("readonly", false);
            $("#incReqNo").removeClass("form_readonly");
        } else if(roTp == '05') {
            //RO검색 팝업
            roSearchPopupWindow("RW");
        } else {
            $("#incReqNo").val("");
            $("#incReqNo").prop("readonly", true);
            $("#incReqNo").addClass("form_readonly");
        }
    };

    $("#expcChkRunDistVal").kendoExtNumericTextBox({
       format:"n0"                // n0:###,###, n2:###,###.##
      ,min:0
      ,spinners:false
    });

    $("#runDistVal").kendoExtNumericTextBox({
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
                , title:"?惠?限"
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectDcRatePopup.do'/>"
                    , data:{
                         "dcTp":"01"
                         ,"callbackFunc":function(jsonObj) {
                            if(jsonObj!=null){
                                dcData = jsonObj;
                                setDcData(jsonObj);
                            } else {

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

    // 견적절사
    $("#wonUnitCut").kendoButton({
        click:function(e) {
            var grid = $("#calcGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if(rowData != null){
                var paymAmt = Number(rowData.paymAmt);
                var wonUnitCutAmt =  Number(paymAmt - Math.floor(paymAmt/10)*10).toFixed(2);
                rowData.set("wonUnitCutAmt", wonUnitCutAmt);
                rowData.set("paymAmt", Math.floor(paymAmt/10)*10);
            } else {
                dms.notification.success("<spring:message code='ser.info.noWonUnitCutAmt'/>");
            }
        }
        ,enable:false
    });

    // 견적제로
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
                dms.notification.success("<spring:message code='ser.info.noDemicalPointCut'/>");
            }
        }
        ,enable:false
    });

    // RO
    $("#roCreate").kendoButton({
        click:function(e) {
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.roCreate' />" ,"<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do?infoType=ET&vinNo="+$("#vinNo").val()+"&estDocNo="+$("#estDocNo").val()+"&ltsModelCd="+$("#ltsModelCd").val()+"&roTp="+$("#roTp").data("kendoExtDropDownList").value()+"'/>", "VIEW-I-10309");
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

            var estData = calcGrid.dataItem("tr:eq(0)");
            var calcAmt = Number(estData.calcAmt);

            // 공임 팝업 열기 함수.
            calcAddPopup = dms.window.popup({
                windowId:"calcAddPopup"
                ,height:200
                ,width:500
                //,modal:true
                ,title:"<spring:message code='ser.lbl.seperate' />"
                ,content:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculatePopup.do'/>"
                    ,data:{
                         "roTp":$("#roTp").data("kendoExtDropDownList").value()
                        ,"selectedVal":selectedVal
                        ,"dlrCd":"${dlrCd}"
                        ,"dlrNm":"${dlrNm}"
                        ,"preFixId":"ET"
                        ,"custNm":(dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val()
                        ,"custNo":(dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val()
                        ,"callbackFunc":function(estData){

                            var calcGrid = $("#calcGrid").data("kendoExtGrid");
                            var rowData = calcGrid.dataItem("tr:eq(0)");

                            calcGrid.dataSource.add(estData);
                            rowData.set("paymAmt", Number(rowData.paymAmt - estData.paymAmt).toFixed(2));
                            rowData.set("calcAmt", Number(rowData.calcAmt - estData.calcAmt).toFixed(2));

                        }
                    }
                }
            });
        }
        ,enable:false
    });

    $("#calcGrid").kendoExtGrid({
        gridId:"G-SER-0318-001001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/est/estimate/selectEstimateDetails.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sEstDocNo"] = $("#estDocNo").val();

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
                        ,cupnAmt:{type:"number"}
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
            if(numberFieldName == "wonUnitCutAmt" || numberFieldName == "demicPointCutAmt" || numberFieldName == "balAmt" || numberFieldName == "calcAmt") {
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

            var statusYn = (status == undefined) ? false : ( ($("#roTp").data("kendoExtDropDownList").value() == "02") ? false : true );

            $("#demicalPointCut").data("kendoButton").enable(statusYn);
            $("#wonUnitCut").data("kendoButton").enable(statusYn);
        }
        ,columns:[
            {field:"estSubDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:150,hidden:true}          // 정산번호
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
            ,{field:"calcAmt", title:"<spring:message code='ser.lbl.finalEstAmt' />", width:90, attributes:{"class":"ar"} , format:"{0:n2}"}            // 최종견적금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.estInterSettAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}    //정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.estZeroAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}//정산제로
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}
                ,template:function(data){
                    var paymAmt = 0;
                    if(data.paymAmt != null){
                        paymAmt = data.paymAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(paymAmt);
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
            }    // 지불방식
            ,{field:"cupnNo", title:"CouponNo", width:90, hidden:true}       // 쿠폰번호
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
                            var estData = calcGrid.dataItem("tr:eq(0)");
                            var paymAmt = Number(estData.paymAmt - this.value());

                            if(paymAmt < 0) {
                                estData.set("cupnAmt", 0);
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
            }//영수증유형
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
                            var estData = calcGrid.dataItem("tr:eq(0)");
                            var paymAmt = Number(estData.paymAmt - this.value());

                            if(paymAmt < 0) {
                                estData.set("preAmt", 0);
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
    $("#estConfirm").kendoButton({
        click:function(e) {
            btnControll("F");
            fnComfirm("F");
        }
        ,enable:false
    });

    // 계산
    $("#estCalculate").kendoButton({
        click:function(e) {
            btnControll("F");
            fnCalculate();
        }
        ,enable:false
    });

    $("#init").kendoButton({
        click:function(e) {
            initAll();
        }
    });

 // 취소 버튼.
    $("#estCancel").kendoButton({
        click:function(e){


            estCancelPopup = dms.window.popup({
                windowId:"estCancelPopup"
                , title:"<spring:message code='ser.lbl.estCancel'/>"   // 견적취소
                , width:400
                , height:200
                , content:{
                    url:"<c:url value='/ser/est/estimate/selectEstimateCancelPopup.do'/>"
                    ,data:{
                         "estDocNo": $("#estDocNo").val()
                        ,"callbackFunc":function(data){

                            var params = {
                                    estDocNo          : $("#estDocNo").val()
                                   ,estCancReasonCont : data.estCancReasonCont
                                   ,estCancReasonCd   : data.estCancReasonCd
                                   ,estStatCd         : data.estStatCd
                            };

                            if(data != null){
                                $.ajax({
                                    url:"<c:url value='/ser/est/estimate/cancelEstimate.do' />"
                                    ,data:JSON.stringify(params)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result, textStatus){

                                        dms.notification.success("<spring:message code='ser.lbl.estimate' var='estimate' /><spring:message code='global.info.cancelSuccessParam' arguments='${estimate}' />");
                                        //$("#btnSearch").click();
                                        initAll();
                                        btnControll("C");

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
        ,enable:false
    });

    // 인쇄
    $("#print").kendoButton({
        click:function(e) {
            estPrintPopup = dms.window.popup({
                windowId:"estPrintPopup"
                , title:""
                , width:400
                , height:100
                , content:{
                    url:"<c:url value='/ser/est/estimate/selectEstimatePrintPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(data){

                            $.ajax({
                                url:"<c:url value='/ser/est/estimate/updateEstimatePrint.do' />"
                                ,data:JSON.stringify({estDocNo : $("#estDocNo").val() })
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR, status, error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,success:function(result, textStatus){
                                    if(data === "est") {
                                        parent._createOrReloadTabMenu("<spring:message code='ser.lbl.estimateDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectEstimatePrintMain.cpt'/>&sDlrCd=${dlrCd}&sEstDocNo="+$("#estDocNo").val()+"&sTelShowYn="+custTelYnValue);
                                    } else {
                                        parent._createOrReloadTabMenu("<spring:message code='ser.title.calculatePrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectEstCalulatePrintMain.cpt'/>&sDlrCd=${dlrCd}&sEstDocNo="+$("#estDocNo").val()+"&sTelShowYn="+custTelYnValue);
                                    }
                                }
                            });
                        }
                    }
                }
            });
        }
        ,enable:false
    });

    $("#estDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#estDocNo").val()) != ""){
            e.preventDefault();
            var data = {"estDocNo":$("#estDocNo").val()};
            detailSet(data, false, "ET");
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
        
        formParam.roTp = $("#roTp").val();
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
        formParam.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
        if(isTablet == "true")formParam.runDistVal = $("#runDistValTablet").val();//khs
        formParam.serParDstinCd = "SER";
        formParam.estStatCd = status;

        var grid = $("#calcGrid").data("kendoExtGrid").dataSource.data();

        var finalPaymAmt = 0;
        $.each(grid, function(index, item){
            finalPaymAmt += (Number(this.paymAmt) + Number(this.wonUnitCutAmt) + Number(this.demicPointCutAmt));
        });

        /* if(Number(finalPaymAmt) != Number(formParam.lastCalcTotAmt)){
            dms.notification.info("<spring:message code='ser.info.notTotCalculate'/>");
            return false;
        } */

        // form 데이터 및 그리드 변경 데이터 세팅
        var param = $.extend(
            {"estimateVO":formParam}
            ,{"servicePartListVO":getPartData()}
            ,{"serviceLaborListVO":getLbrData()}
            ,{"estimateDetailSaveVO":grid}
            ,{"trobleDescVO":trobleDescParam()}
            ,{"custDemandListVO":custDemandParam()}
            ,{"etcIssueListVO":getEtcIssueData()}
            ,{"lbrSuggestListVO":getLbrSuggestData()}
        );

        $.ajax({
            url:"<c:url value='/ser/est/estimate/mulitEstimates.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                $("#estDocNo").val(result);
                var data = {"roDocNo":"", "estDocNo":result};
                detailSet(data, false, "ET");
                dms.notification.success("<spring:message code='global.info.success'/>");
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

        if($("#driverNm").val() == "" || $("#driverNm").val() == null){
            dms.notification.info("<spring:message code='ser.lbl.vsitr' var='driverNm' /><spring:message code='global.info.required.field' arguments='${driverNm},' />");
            return;
        }

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
        var pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value();
        var etcTotAmt = $("#etcTotAmt").data("kendoExtNumericTextBox").value();
        var lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
        var etcIssueAmt = $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value();

        if(paymTp1 != ""){
            var copyData1 =
            {
                dlrCd:""
                ,estDocNo:""
                ,paymTp:paymTp1
                ,paymCd:paymCd1
                ,paymPrid:"01"
                ,paymMthCd:"01"
                ,paymAmt:(Number(lbrAmt1) + Number(parAmt1) + Number(etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt1) + Number(parAmt1) + Number(etcIssueAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt1) + Number(parAmt1) + Number(etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt1) + Number(parAmt1) + Number(etcIssueAmt)).toFixed(2)
                ,paymUsrNm:paymUsrNm1
                ,rcptTp:""
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
                ,estDocNo:""
                ,paymTp:paymTp2
                ,paymCd:paymCd2
                ,paymPrid:"01"
                ,paymMthCd:"01"
                ,paymAmt:(Number(lbrAmt2) + Number(parAmt2) + Number(etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt2) + Number(parAmt2) + Number(etcIssueAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt2) + Number(parAmt2) + Number(etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt2) + Number(parAmt2) + Number(etcIssueAmt)).toFixed(2)
                ,paymUsrNm:paymUsrNm2
                ,rcptTp:""
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
                ,estDocNo:""
                ,paymTp:paymTp3
                ,paymCd:paymCd3
                ,paymPrid:"01"
                ,paymMthCd:"01"
                ,paymAmt:(Number(lbrAmt3) + Number(parAmt3) + Number(etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt3) + Number(parAmt3) + Number(etcIssueAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt3) + Number(parAmt3) + Number(etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt3) + Number(parAmt3) + Number(etcIssueAmt)).toFixed(2)
                ,paymUsrNm:paymUsrNm3
                ,rcptTp:""
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
                ,estDocNo:""
                ,paymTp:paymTp4
                ,paymCd:paymCd4
                ,paymPrid:"01"
                ,paymMthCd:"01"
                ,paymAmt:(Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - pointTotAmt - etcTotAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt4 + parAmt4 + etcIssueAmt - bmPointTotAmt - pointTotAmt - etcTotAmt)).toFixed(2)
                ,paymUsrNm:paymUsrNm4
                ,rcptTp:""
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
                ,estDocNo:""
                ,paymTp:paymTp5
                ,paymCd:paymCd5
                ,paymPrid:"01"
                ,paymMthCd:"01"
                ,paymAmt:(Number(lbrAmt5 + parAmt5 + etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt5 + parAmt5 + etcIssueAmt)).toFixed(2)
                ,calcAmt:(Number(lbrAmt5 + parAmt5 + etcIssueAmt)).toFixed(2) <= 0 ? 0.00 : (Number(lbrAmt5 + parAmt5 + etcIssueAmt)).toFixed(2)
                ,paymUsrNm:paymUsrNm5
                ,rcptTp:""
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

        if(infoType == "RO") {
            $.ajax({
                url:"<c:url value='/ser/est/estimate/selectEstimateManageMains.do' />"
                ,data:JSON.stringify({sRoDocNo:data.roDocNo, sEstDocNo:data.estDocNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(dms.string.strNvl(result.estDocNo) == "") {

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
                                    getCustInfo(result,"N");                     // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                                    tabInfoSet(result.roDocNo, infoType, result.ltsModelCd);
                                    estInfoSet(result, infoType);
                                }
                            }
                        });
                    } else {
                        getCustInfo(result,"N");    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                        estInfoSet(result, "ET");
                        tabInfoSet(result.estDocNo, "ET", result.ltsModelCd);

                    }
                }
            });
        } else if(infoType == "ET") {
            var data = {"estDocNo":data.estDocNo , "ltsModelCd":data.ltsModelCd};
            callCalcData(data);
        }
        changeTotalAmt();
    };

    callCalcData = function(data){
        $.ajax({
            url:"<c:url value='/ser/est/estimate/selectEstimateManageMains.do' />"
            ,data:JSON.stringify({sRoDocNo:data.roDocNo, sEstDocNo:data.estDocNo, sLtsModelCd:data.ltsModelCd})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){

                if(dms.string.strNvl(result.estDocNo) == ""){
                    dms.notification.info("<spring:message code='ser.lbl.estimate' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                } else {
                    $("#demicalPointCut").data("kendoButton").enable(true);
                    $("#wonUnitCut").data("kendoButton").enable(true);
                    $("#dcRole").data("kendoButton").enable(true);

                    getCustInfo(result,"N");    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                    tabInfoSet(result.estDocNo, "ET",  result.ltsModelCd);
                    estInfoSet(result, "ET");
                }
            }
        });
    };

    // 견적정보 셋팅
    estInfoSet = function(result, infoType){

        $("#estDocNo").val(result.estDocNo);
        $("#roDocNo").val(result.roDocNo);
        $("#estStatCd").data("kendoExtDropDownList").value(result.estStatCd);
        var i=0;
        for(i=0; i<estStatCdList.length; i++){
            if(estStatCdList[i].cmmCd == result.estStatCd){
                $("#estStatCdTablet").val(estStatCdList[i].cmmCdNm);//khs
                break;
            }
        }
        $("#regUsrNmTablet").val(result.regUsrNm);

        if(infoType == "RO"){
            $("#roUsrNm").val(result.regUsrNm);
        } else {
            $("#roUsrNm").val(result.roUsrNm);
            $("#regUsrNm").val(result.regUsrNm);
        }

        $("#estDocNo").attr("readonly", true);
        $("#roDocNo").attr("readonly", true);
        $(".keyNumber").addClass("readonly_area");
        $("#roGrpNo").val(result.roGrpNo);
        $("#resvDocNo").val(result.resvDocNo);
        $("#diagDocNo").val(result.diagDocNo);
        $("#roDt").data("kendoExtMaskedDatePicker").value(result.roDt);
        $("#roTp").data("kendoExtDropDownList").value(result.roTp);

        $("#estRemark").val(result.estRemark);
        $("#estDt").data("kendoExtMaskedDatePicker").value(result.estDt);
        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
        $("#runDistValTablet").val(result.runDistVal);//khs

        $("#nextFreeMonth").val(result.nextFreeMonth);
        $("#nextFreeRunDistVal").val(result.nextFreeRunDistVal);


        if(result.expcChkDt != undefined){
            $("#expcChkDt").data("kendoExtMaskedDatePicker").value(result.expcChkDt);
        } else {
            var expcChkDt = kendo.parseDate("${sysDate}");
            expcChkDt.setMonth(expcChkDt.getMonth() + Number($("#nextFreeMonth").val()));
            $("#expcChkDt").data("kendoExtMaskedDatePicker").value(expcChkDt);
        }
        if(result.expcChkRunDistVal != undefined){
            $("#expcChkRunDistVal").data("kendoExtNumericTextBox").value(result.expcChkRunDistVal);
        } else {
            var expcChkRunDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value() + Number($("#nextFreeRunDistVal").val());
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
        $("#etcDcSeq").val(result.etcDcSeq);

        $("#calcGrid").data("kendoExtGrid").dataSource.read();

        if(result.bmPointTotAmt > 0){   // 블루멤버쉽 포인트를 사용했을 경우
            blueMemberInfo();
        }

        if(result.pointTotAmt > 0){   // 블루멤버쉽 포인트를 사용했을 경우
            dealerMemberInfo();
        }

        if(result.bmCupnTotAmt > 0){    // 블루멤버스 쿠폰을 사용했을 경우
            var cardNo = "";
            var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();
            $.each(calcData, function(i,v){
                if(this.paymTp == "04"){
                    cardNo = this.cupnNo;
                }
            });
            var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
            var bmCupnData = bmCupnGrid.dataItem("tr:eq(0)");
            bmCupnData.set("cardNo", cardNo);
            $("#bmCupnVerify").click();
        }

        if(result.estStatCd == "F"){          // 견적완료
            btnControll("F");
        } else if(result.estStatCd == "C") {  // 취소
            btnControll("C");
        } else {
            btnControll("U");
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
                    , "listType":"ET"
                    , "callbackFunc":function(data){

                        detailSet(data[0], false, "RO");

                    }
                }
            }
        });
    };

    //초기화
    initAll = function(){

        serviceJs.commonInit();     // service 공통 JS
        crTpYn = false;     // 캠페인여부 초기화
        btnControll();

        $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
        //$("#bmPointGrid").data("kendoExtGrid").dataSource.data([{blueMembershipNo:"", bmMemberTp:"", consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]);
        $("#dlrPointGrid").data("kendoExtGrid").dataSource.data([{memberTp:"", membershipNo:"", gradeCd:"", lastPointVal:"", occrPointVal:"", cardNo:"", dlrUseAmt:"", dlrUsePurpose:""}]);
        $("#bmCupnGrid").data("kendoExtGrid").dataSource.data([{cardType:"", cardNo:"", couponBeginDate:"", couponEndDate:""}]);
        $("#dcGrid").data("kendoExtGrid").dataSource.data([]);
        $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);
        $("#lbrSuggestGrid").data("kendoExtGrid").dataSource.data([]);


        $("#estDocNo").attr("readonly", false);
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
            var bmPointGrid = $("#bmPointGrid").data("kendoExtGrid");
            var bmRowData = bmPointGrid.dataItem("tr:eq(0)");
            bmRowData.set("consumePoints", 0);
            bmRowData.set("bmUseAmt", 0);
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
                dms.notification.warning("<spring:message code='ser.info.pointUseCustNotExist'/>");
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

        var calcGrid = $("#calcGrid").data("kendoExtGrid");
        var calcData = calcGrid.dataSource.data();
        var reduceCost = Number(rowData.reduceCost).toFixed(1); //쿠폰적용금액
        var bmCupnTp = rowData.bmCupnTp;

        //bmCupnTp 01 공임비 , 02 : 부품
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
                    if(this.paymTp == "04"){ //고객유형
                        var paymAmt = Number(this.paymAmt - reduceCost);
                        if(paymAmt < 0) {
                            $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(this.paymAmt));
                            reduceCost = Number(this.paymAmt);
                        } else {
                            if(bmCupnTp == "01"){
                                $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                            } else if(bmCupnTp == "02"){
                                $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                            } else {
                                $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(Number(reduceCost).toFixed(2));
                            }
                        }
                        fnLastCalcAmt();   // 최종정산금액 계산
                        this.calcAmt = (Number(this.calcAmt) - Number(reduceCost)).toFixed(2);
                        this.paymAmt = (Number(this.paymAmt) - Number(reduceCost)).toFixed(2);
                        this.cupnNo = rowData.cardNo;
                        calcGrid.refresh();
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

    // BM쿠폰 취소
    bmCupnCancel = function(type){
        var bmCupnAmt = $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value();

        $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value(0.00);

        if(type == "C"){
            fnLastCalcAmt();
        }

        var calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();
        $.each(calcData, function(i,v){
            if(this.paymTp == "04"){
                this.calcAmt = (Number(this.calcAmt) + Number(bmCupnAmt)).toFixed(2);
                this.paymAmt = (Number(this.paymAmt) + Number(bmCupnAmt)).toFixed(2);
                this.dcPermNm = "";
                this.dcPermCd = "";
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

            dcCancel();
            dcRoleCancel();

            var calcGrid = $("#calcGrid").data("kendoExtGrid");
            var calcData = calcGrid.dataSource.data();

            var lastCalcTotAmt = $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value();
            var lbrCalcSumAmt = $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value();
            var parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();

            if(rowData.dcTp == "01"){   // 할인방식 : 금액
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
            } else {    // 할인방식 : 할인율

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
                    setDcData(jsonObj);
                }
            }
            $("#etcDcCd").val(rowData.dcCd);
            calcGrid.refresh();
        }
    };

    // 기타할인 초기화
    dcCancel = function() {
        dcRoleCancel();
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
    };

    // 할인권한 셋팅
    setDcData = function(jsonObj){

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
                if(parDcRate > this.dcRate){

                    parCalAmt = (this.itemPrc * this.itemQty);
                    dcCalAmt  = parDcAmt;
                    parTotAmt = (parCalAmt - parDcAmt).toFixed(2);
                    dcCalRate = Number(Math.abs((parTotAmt / parCalAmt) -1 )).toFixed(2); // 할인율

                }

            }else if(dcTp == "02"){
                if(parDcRate > this.dcRate){
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
        // 공임할인금액
       /*   $.each(getLbrData(), function(index, item){
            var lbrRowData = lbrGrid.dataItem("tr:eq("+ index +")");

            if(dcTp == "01"){
                if(lbrDcAmt > this.dcAmt){

                    lbrCalAmt = (this.lbrQty * this.lbrHm * this.lbrPrc);
                    lbrTotAmt = (lbrCalAmt - lbrDcAmt).toFixed(2);
                    dcCalAmt  = lbrDcAmt;
                    dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                }
            }else if(dcTp == "02"){
                if(lbrDcRate > this.dcRate){
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
         */

         $(lbrGrid.dataSource.data()).each(function(index, item){

             var dataItem = lbrGrid.dataSource._data;
             var lbrRowData = dataItem[index];


            if(dcTp == "01"){
                if(lbrDcAmt > this.dcAmt){

                    lbrCalAmt = (this.lbrQty * this.lbrHm * this.lbrPrc);
                    lbrTotAmt = (lbrCalAmt - lbrDcAmt).toFixed(2);
                    dcCalAmt  = lbrDcAmt;
                    dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                }
            }else if(dcTp == "02"){
                if(lbrDcRate > this.dcRate){
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
        $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value((Number($("#lbrWhDcAmt").data("kendoExtNumericTextBox").value()) + Number($("#parWhDcAmt").data("kendoExtNumericTextBox").value())).toFixed(2));

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
                paymUsrNm = $("#driverNm").val();
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

    btnControll = function(status){

        var statusYn = (status == undefined) ? false : ( ($("#roTp").data("kendoExtDropDownList").value() == "02") ? false : true );
        var estStatCd = $("#estStatCd").data("kendoExtDropDownList").value();

        if(dms.string.strNvl(estStatCd) == ""){
            if(status == "U"){
                $("#estConfirm").data("kendoButton").enable(false);
                $("#estCalculate").data("kendoButton").enable(true);
                $("#wonUnitCut").data("kendoButton").enable(false);
                $("#demicalPointCut").data("kendoButton").enable(false);
                $("#dcRole").data("kendoButton").enable(false);
                $("#calAdd").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);
                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                $("#estCancel").data("kendoButton").enable( dms.string.isEmpty($("#estDocNo").val()) ? false : true);
                $("#moveRepair").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
            } else if(status == "F") {
                $("#estConfirm").data("kendoButton").enable(true);
                $("#estCalculate").data("kendoButton").enable(true);
                $("#wonUnitCut").data("kendoButton").enable(statusYn);
                $("#demicalPointCut").data("kendoButton").enable(statusYn);
                $("#dcRole").data("kendoButton").enable(statusYn);
                $("#calAdd").data("kendoButton").enable(true);
                $("#print").data("kendoButton").enable(false);
                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                $("#estCancel").data("kendoButton").enable(true);
                $("#moveRepair").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
            }else {
                $("#estConfirm").data("kendoButton").enable(false);
                $("#estCalculate").data("kendoButton").enable(false);
                $("#wonUnitCut").data("kendoButton").enable(false);
                $("#demicalPointCut").data("kendoButton").enable(false);
                $("#dcRole").data("kendoButton").enable(false);
                $("#calAdd").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);
                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                $("#estCancel").data("kendoButton").enable(false);
                $("#moveRepair").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
            }
        } else {
            if(estStatCd == "F"){
                $("#estConfirm").data("kendoButton").enable(true);
                $("#estCalculate").data("kendoButton").enable(true);
                $("#wonUnitCut").data("kendoButton").enable(statusYn);
                $("#demicalPointCut").data("kendoButton").enable(statusYn);
                $("#dcRole").data("kendoButton").enable(statusYn);
                $("#calAdd").data("kendoButton").enable(true);
                $("#print").data("kendoButton").enable(true);
                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                $("#estCancel").data("kendoButton").enable(true);
                $("#moveRepair").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
            } else {
                $("#estConfirm").data("kendoButton").enable(false);
                $("#estCalculate").data("kendoButton").enable(false);
                $("#wonUnitCut").data("kendoButton").enable(false);
                $("#demicalPointCut").data("kendoButton").enable(false);
                $("#dcRole").data("kendoButton").enable(false);
                $("#calAdd").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);
                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                $("#estCancel").data("kendoButton").enable(false);
                $("#moveRepair").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
            }

            $("#dealerSet").data("kendoButton").enable(statusYn);
            $("#dealerCancel").data("kendoButton").enable(statusYn);
            /** 去掉蓝缤相关的积分查询部分，只保留自店会员部分  注掉 田佳兴 2020-6-17
            $("#bmSet").data("kendoButton").enable(statusYn);
            $("#bmCancel").data("kendoButton").enable(statusYn);
			**/
            $("#dcSet").data("kendoButton").enable(statusYn);
            $("#dcCancel").data("kendoButton").enable(statusYn);

        }
    };

    setNvlDefault = function( value){
        var resultVal = 0;
        if( (dms.string.strNvl (value) != "" )){
            resultVal = value;
        }
        return resultVal;
    };

    //TAB 정보
    tabInfoSet = function(docNo , preFixId , ltsModelCd){
        partInfo(docNo, preFixId);        //부품(selectPartList.jsp)
        lbrInfo(docNo, preFixId, ltsModelCd);         //공임(selectLbrList.jsp)
        trobleDescInfo(docNo, preFixId);  //고객요구사항및 고장설명(selectTabInfo.jsp)
        etcIssueSet(docNo, preFixId);     //기타사항(selectEtcIssue.jsp)
        lbrSuggestSet(docNo, preFixId);   //수리건의(selectLbrSuggest.jsp)
    };

    <c:if test="${estDocNo ne ''}">
        var data = {"roDocNo":"", "estDocNo":"${estDocNo}"};
        detailSet(data, false, "ET");
    </c:if>
    <c:if test="${roDocNo ne ''}">
        var data = {"roDocNo":"${roDocNo}", "estDocNo":""};
        detailSet(data, false, "RO");
    </c:if>

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

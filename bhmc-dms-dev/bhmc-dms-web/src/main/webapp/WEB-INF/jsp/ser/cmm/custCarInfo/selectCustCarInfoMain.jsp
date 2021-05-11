<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div class="header_area">
    <div class="btn_left">
        <button type="button" id="init" class="btn_m btn_reset"><spring:message code="global.btn.init" /><!-- 초기화 --></button>
        <button type="button" id="roSearch" class="btn_m btn_search"><spring:message code="ser.btn.btnRoHist" /><!-- 정비이력조회 --></button>
        <button type="button" id="custInfoMng" class="btn_m btn_link"><spring:message code="ser.btn.custInfoRegUpdt" /><!--고객정보관리 --></button>
        <button type="button" id="carMasterMng" class="btn_m btn_link"><spring:message code="ser.btn.carMaster" /><!-- 차량정보 --></button>
        <button type="button" id="btnDriverReg" class="btn_m btn_add"><spring:message code="ser.btn.custInfoUpdt" /><!--고객정보등록/변경 --></button>
        <button type="button" id="chgV" class="btn_m btn_add" style="display:none;"><spring:message code="global.lbl.cont" /></button>
    </div>
    <div class="btn_right">
        <c:choose>
            <c:when test="${preFixId eq 'RE'}">
                <button type="button" id="resvCreate" class="btn_m"><spring:message code="ser.btn.confirm" /><!-- 확인 --></button>
                <button type="button" id="resvCancel" class="btn_m"><spring:message code="ser.btn.cancel" /><!-- 예약취소 --></button>
                <button type="button" id="print" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
            </c:when>
            <c:when test="${preFixId eq 'RO'}">
                <button type="button" id="roUpdate" class="btn_m"><spring:message code="ser.btn.confirm" /><!-- RO변경 --></button>
                <button type="button" id="roCancel" class="btn_m"><spring:message code="ser.btn.cancel" /><!-- RO취소 --></button>
                <button type="button" id="print" class="btn_m"><spring:message code="global.btn.preview" /><!-- 미리보기 --></button>
                <button type="button" id="print2" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
            </c:when>
            <c:when test="${preFixId eq 'CA'}">
                <button type="button" id="calcConfirm" class="btn_m"><spring:message code="global.btn.confirm" /><!-- 확인 --></button>
                <button type="button" id="calculate" class="btn_m"><spring:message code='ser.btn.returnCalc' /><!-- 계산 --></button>
                <button type="button" id="print" class="btn_m"><spring:message code="global.btn.preview" /><!-- 미리보기 --></button>
                <!-- 파인리포트 빠른인쇄 기능 적용 by 한강석 2017.08.03 -->
                <button type="button" id="print2" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
                <dms:access viewId="VIEW-D-11602" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="serviceReceive" class="btn_m"><spring:message code="sal.btn.complete" /></button><!-- 완료  -->
                </dms:access>
            </c:when>
            <c:when test="${preFixId eq 'ET'}">
                <button type="button" id="estConfirm" class="btn_m"><spring:message code="global.btn.confirm" /><!-- 확인 --></button>
                <button type="button" id="estCalculate" class="btn_m"><spring:message code='ser.btn.returnCalc' /><!-- 계산 --></button>
                <button type="button" id="print" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
                <button type="button" id="estCancel" class="btn_m"><spring:message code="ser.btn.cancel" /><!-- 견적취소 --></button>
            </c:when>
            <c:when test="${preFixId eq 'PC'}">
                <button type="button" id="btnModify" class="btn_m" disabled><spring:message code="ser.btn.confirm" /><!-- 사전점검변경 --></button>
                <button type="button" id="btnCancel" class="btn_m" disabled><spring:message code="ser.btn.cancel" /><!-- 사전점검취소 --></button>
                <button type="button" id="btnPrint" class="btn_m" disabled><spring:message code="global.btn.print" /><!-- 사전점검프린트 --></button>
                <button type="button" id="takePicture" class="btn_m useTablet" style="display: none;"><spring:message code="global.lbl.takepicture" /><!--사진촬영--></button>
                <button type="button" id="openSign" class="btn_m useTablet" disabled="disabled" style="display: none;"><spring:message code="ser.lbl.sign" /><!--서명--></button>
            </c:when>
            <c:when test="${preFixId eq 'PRE'}">
                <button type="button" id="resvCreate" class="btn_m"><spring:message code="ser.btn.confirm" /><!-- 확인 --></button>
                <button type="button" id="resvCancel" class="btn_m"><spring:message code="ser.btn.cancel" /><!-- 예약취소 --></button>
                <button type="button" id="print" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
            </c:when>
            <c:when test="${preFixId eq 'RES'}">
                <button type="button" id="resvCreate" class="btn_m"><spring:message code="ser.btn.confirm" /><!-- 확인 --></button>
                <button type="button" id="resvCancel" class="btn_m"><spring:message code="ser.btn.cancel" /><!-- 취소 --></button>
                <button type="button" id="carAccept" class="btn_m" style="display:none;"><spring:message code="global.btn.carAccept" /><!-- 차량접수 --></button>
                <button type="button" id="print" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
            </c:when>
            <c:when test="${preFixId eq 'CH'}">
                <button type="button" id="btnModify" class="btn_m"><spring:message code="ser.btn.confirm" /><!-- 차량점검확인 --></button>
                <button type="button" id="btnCancel" class="btn_m"><spring:message code="ser.btn.cancel" /><!-- 차량점검취소 --></button>
                <button type="button" id="btnPrint" class="btn_m"><spring:message code="global.btn.print" /><!-- 차량점검프린트 --></button>
            </c:when>
        </c:choose>
    </div>
</div>

<!-- <div class="clfix reservation_top tablet_hide"> -->
<div class="clfix reservation_top">
    <!-- 차량정보 -->
    <section class="left_areaStyle">
        <!-- 탭메뉴 전체 영역 -->
        <div id="campaignTab" class="tab_area tab_area_min mt0">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.title.carInfo" /></li><!-- 차량정보 -->
                <li><spring:message code="ser.lbl.serCampn" /><span id="serCampnCnt"></span></li><!-- 서비스 캠페인 -->
                <li><spring:message code="ser.lbl.collectCampn" /><span id="collectCampnCnt"></span></li><!-- 일괄 캠페인 -->
                <li><span class="sanbaoTabMsg"><spring:message code="ser.lbl.sampoAlarm" /></span></li><!-- 삼보알람 -->
            </ul>
            <!-- //탭메뉴 -->

            <!-- 车辆信息 -->
            <div style="min-height:142px;">
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" style="text-decoration:underline;"><a href="javascript:carInfo();"><spring:message code="ser.lbl.vinNo" /></a><!-- 차량VIN --></th>
                                <td class="useable" colspan="3">
                                    <div class="form_search">
                                        <input type="text" id="vinNo" name="vinNo" class="form_input form_use" data-json-obj="true" data-name="<spring:message code="ser.lbl.vinNo" />" style="text-transform:uppercase" required />
                                        <a href="javascript:custPopupWindow('${preFixId}');"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carNo" /></span><!-- 차량번호 --></th>
                                <td class="useable">
                                    <div class="form_search">
                                        <input type="text" id="carRegNo" name="carRegNo" class="form_input form_use" data-json-obj="true" data-name="<spring:message code="ser.lbl.carNo" />" style="text-transform:uppercase" required />
                                        <a href="javascript:custPopupWindow('${preFixId}');"></a>
                                    </div>
                                </td>
                                <th scope="row">
                                <%-- <c:if test="${preFixId ne 'RE'}"><span class="bu_required"></c:if><spring:message code="ser.lbl.nowRunDist" /><c:if test="${preFixId ne 'RE'}"></span></c:if></th> <!-- 사전점검주행거리 --> --%>
                                <c:choose>
                                    <c:when test="${preFixId eq 'RE'}">
                                        <spring:message code="ser.lbl.nowRunDist" /></th> <!-- 사전점검주행거리 -->
                                    </c:when>
                                    <c:when test="${preFixId eq 'CA'}">
                                        <spring:message code="ser.lbl.dlRunDistVal" /></th> <!-- 인도주행거리 -->
                                    </c:when>
                                    <c:otherwise>
                                        <span class="bu_required"><spring:message code="ser.lbl.nowRunDist" /></span></th> <!-- 사전점검주행거리 -->
                                    </c:otherwise>
                                </c:choose>
                                <td class="runDist">
                                <c:choose>
                                    <c:when test="${preFixId eq 'CA'}">
                                        <input id="giRunDistVal" name="giRunDistVal" class="form_numeric ar" data-type="number" min="0" maxlength="7" />
                                    </c:when>
                                    <c:otherwise>
                                        <input id="runDistVal" name="runDistVal" class="form_numeric ar" data-type="number" min="0" maxlength="7"  value="0"/>
                                        
                                    </c:otherwise>
                                </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.brandNm" /><!-- 브랜드명 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carBrandNm" name="carBrandNm" class="form_input" readonly/>
                                    <input type="hidden" id="carBrandCd" name="carBrandCd" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /><!-- 누계주행거리 --></th>
                                <td class="readonly_area">
                                    <input id="carRunDistVal" name="carRunDistVal" class="form_numeric ar" data-type="number" min="0" maxlength="6" value="0"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carlineNm" name="carlineNm" class="form_input" data-name="<spring:message code="ser.lbl.carlineNm" />" readonly/>
                                    <input type="hidden" id="carlineCd" name="carlineCd" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.realDrivDis" /><!-- 실제주행거리 --></th>
                                <td class="readonly_area">
                                    <input id="preRunDistVal" name="preRunDistVal" class="form_numeric ar" data-type="number" min="0" maxlength="6"  value="0"/>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.model" /><!-- 모델 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="modelNm" name="modelNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.wcEndDt" /><!-- 보증만료일 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="grteStartDt" name="grteStartDt" class="form_datepicker ac" readonly/>
                                    <input type="hidden" id="grteEndDt" name="grteEndDt"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="carInfo" class="table_form form_width_100per mt10" style="display:none;">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.engnNo" /><!-- 엔진번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="enginNo" name="enginNo" class="form_input" data-json-obj="true" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.incCmpNm" /><!-- 보험회사명 --></th>
                                <td class="readonly_area">
                                    <input type="hidden" id="incNo" name="incNo" readonly/>
                                    <input type="text" id="incCorpCd" name="incCorpCd" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.color" /><!-- 외장 색상 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="extColorNm" name="extColorNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.incEndDt" /><!-- 보험완료일 --></th>
                                <td class="readonly_area">
                                    <input id="incEndDt" name="incEndDt" class="form_datepicker" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vehicleUse" /><!-- 차량용도 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carDstinCdNm" name="carDstinCdNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.scheChkDt" /><!-- 정비예정일자 --></th>
                                <td class="readonly_area">
                                    <input id="expcChkDt2" name="expcChkDt2" class="form_datepicker" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.saleOutDt" /><!-- 판매출고일자 --></th>
                                <td class="readonly_area">
                                    <input id="custSaleDt" name="custSaleDt" class="form_datepicker" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.scheChkDist" /><!-- 정비예정 주행거리 --></th>
                                <td class="readonly_area">
                                    <input id="expcChkRunDistVal2" name="expcChkRunDistVal2" class="form_numeric ar" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.salDlrComp" /><!-- 판매딜러사 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="ordDlrCd" name="ordDlrCd" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.chaDrivDis" /><!-- 교환시 주행거리 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="chaDrivDis" name="chaDrivDis" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //车辆信息 -->

            <!-- 服务活动 -->
            <div style="min-height:142px;">
                <div id="serCampaignGrid" class="grid"></div>
            </div>
            <!-- //服务活动 -->

            <!-- 批量活动 -->
            <div style="min-height:142px;">
                <div id="allCampaignGrid" class="grid"></div>
            </div>
            <!-- //批量活动 -->

            <!-- 三包提示 -->
            <div style="min-height:132px;">
                <div class="table_form table_form_info">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:16%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:18%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"><spring:message code="ser.lbl.gubun" /></th>                        <!-- 구분 -->
                                <th scope="col" colspan="2"><spring:message code="ser.lbl.appyStd" /></th>          <!-- 적용기준 -->
                                <th scope="col" colspan="2"><spring:message code="ser.lbl.sanbaoRemainPrid" /></th> <!-- 삼보잔여기간 -->
                                <th scope="col"><spring:message code="ser.lbl.targYn" /></th>                       <!-- 대상여부 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoWartPrid" /></th>         <!-- 삼보보증기간 -->
                                <td class="ar" id="sanbaoWartPrid">&nbsp;<spring:message code="ser.lbl.yy" /></td>        <!-- 삼보 보증기간 적용기준 년 -->
                                <td class="ar" id="sanbaoWartRunDistVal">&nbsp; KM</td>                            <!-- 삼보보증기간 적용기준 주행거리-->
                                <td class="ar" id="sanbaoWartRmPrid">&nbsp; <spring:message code="ser.lbl.monday" /></td> <!-- 삼보보증기간 잔여 월-->
                                <td class="ar" id="sanbaoWartRmRunDistVal">&nbsp; KM</td>                                 <!-- 삼보보증기간 잔여 주행거리-->
                                <td class="ar" id="sanbaoWartkYn"></td> <!-- 삼보보증 대상여부 -->
                            </tr>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoNewCar" /></th>           <!-- 신차보증기간 -->
                                <td class="ar" id="newCarWartPrid">&nbsp; <spring:message code="ser.lbl.day" /></td>      <!-- 신차보증기간 적용 일-->
                                <td class="ar" id="newCarWartRunDistVal">&nbsp; KM</td>                                   <!-- 신차보증기간 적용 주행거리-->
                                <td class="ar" id="newCarWartRmPrid">&nbsp; <spring:message code="ser.lbl.day" /></td>    <!-- 신차보증기간 잔여 일-->
                                <td class="ar" id="newCarWartRmRunDistVal">&nbsp; KM</td>                                 <!-- 신차보증기간 잔여 주행거리-->
                                <td class="ar" id="newCarWartYn"></td>                <!-- 신차보증기간 대상여부-->
                            </tr>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoWorkrOver" /></th>               <!-- 작업일수 초과 -->
                                <td class="ar" colspan="2" id="workOverPrid">&nbsp; <spring:message code="ser.lbl.day" /></td>   <!-- 작업일수 초과 적용 일-->
                                <td class="ar" colspan="2" id="workOverRmPrid">&nbsp; <spring:message code="ser.lbl.day" /></td> <!-- 작업일수 초과 잔여 일-->
                                <td class="ar" id="workOverYn"></td> <!-- 작업일수 초과 대상여부-->
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btn_left mt5">
                    <button id="btnSanbaoAlarm" type="button" class="btn_s"><spring:message code='ser.lbl.sameFauExchHist' /></button>   <!-- 동일하자이력 -->
                    <button id="btnSanbaoPrint" type="button" class="btn_s"><spring:message code='ser.btn.sanbaoPrint' /></button>       <!-- 삼포증출력 -->
                </div>
            </div>
            <!-- //三包提示 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //차량정보 -->

    <!-- 고객정보 -->
    <section class="right_areaStyle">
        <!-- 탭메뉴 전체 영역 -->
        <div id="custInfoTab" class="tab_area tab_area_min mt0">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자 --></li>
                <li><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></li>
                <li><spring:message code="ser.lbl.dealerMember" /><!-- 딜러회원 --></li>
                <li><spring:message code="ser.lbl.bmMemb" /><!-- BM회원 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 车辆所有者 -->
            <div style="min-height:142px;z-index:110;">
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" style="text-decoration:underline;"><a href="javascript:custInfo();"><spring:message code="ser.lbl.carOwner" /></a><!-- 차량소유자 --></th>
                                <td class="useable" colspan="3">
                                    <div class="form_search">
                                        <input type="text" id="carOwnerNm" name="carOwnerNm" class="form_input form_use" data-json-obj="true" data-name="<spring:message code="ser.lbl.carOwner" />" required/>
                                        <a href="#" onclick="javascript:custPopupWindow('${preFixId}');"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required carChk"><spring:message code="ser.lbl.hpNo" /></span><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerHpNo" name="carOwnerHpNo" class="form_input numberic" data-name="<spring:message code="ser.lbl.hpNo" />" required readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certTp" /><!-- 증서유형 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerMathDocTp" name="carOwnerMathDocTp" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" class="form_input numberic" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certNo" /><!-- 증서번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerSsnCrnNo" name="carOwnerSsnCrnNo" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.email" /><!-- 이메일 --></th>
                                <td class="readonly_area">
                                    <input type="mail" id="carOwnerMailNm" name="carOwnerMailNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactMth" /><!-- 메인연락방식 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerPrefContactMthCd" name="carOwnerPrefContactMthCd" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.custTag" /><!-- 고객태그 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="custTag" name="custTag" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactTime" /><!-- 메인연락시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerPrefContactTimeCd" name="carOwnerPrefContactTimeCd" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="ownerInfo" class="table_form form_width_100per mt10 " style="display:none;z-index:110;">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carIfNm" /><!-- 차량연계인 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carIfNm" name="carIfNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.sex" /><!-- 성별 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerSexNm" name="carOwnerSexNm" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.custTp" /><!-- 고객유형 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerCustTpNm" name="carOwnerCustTpNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.birthDt" /><!-- 생일 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerBirthDt" name="carOwnerBirthDt" class="form_input" readonly/>
                                    <input type="hidden" id="serParDcRate" name="serParDcRate" />
                                    <input type="hidden" id="serLbrDcRate" name="serLbrDcRate" />
                                </td>

                            </tr>
                            <tr>

                                <th scope="row"><spring:message code="ser.lbl.custNo" /><!-- 고객번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerId" name="carOwnerId" class="form_input" data-json-obj="true" readonly/>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerRegDt" name="carOwnerRegDt" class="form_datepicker" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.etcCommMthCd" /><!-- 기타연락방법 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="etcCommMthCd" name="etcCommMthCd" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preDeposit" /><!-- 예치금 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="preBalAmt" name="preBalAmt" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.etcContactNo" /><!-- 기타연락번호 --></th>
                                <td class="readonly_area">
                                    <input id="etcContactNo" name="etcContactNo" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.solubePrepaid" /><!-- 가용선수금 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="preBalBalc" name="preBalBalc" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr style="display:none">
                                <th scope="row"><spring:message code="ser.lbl.samPoEndDt" /><!-- 삼포완료일 --></th>
                                <td class="readonly_area">
                                    <input id="samPoEndDt" name="samPoEndDt" class="form_datepicker" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //车辆所有者 -->

            <!-- 送修者 -->
            <div style="min-height:142px;">
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required carChk"><spring:message code="ser.lbl.vsitr" /></span><!-- 방문자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverNm" name="driverNm" class="form_input" data-json-obj="true" readonly/>
                                    <input type="hidden" id="driverId" name="driverId" data-json-obj="true" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.sex" /><!-- 성별 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverSexCd" name="driverSexCd" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required carChk"><spring:message code="ser.lbl.hpNo" /></span><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverHpNo" name="driverHpNo" class="form_input form_numeric" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certTp" /><!-- 증서유형 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverMathDocTp" name="driverMathDocTp" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverTelNo" name="driverTelNo" class="form_input form_numeric" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certNo" /><!-- 증서번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverSsnCrnNo" name="driverSsnCrnNo" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.email" /><!-- 이메일 --></th>
                                <td class="readonly_area">
                                    <input type="mail" id="driverMailNm" name="driverMailNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactMth" /><!-- 메인연락방식 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverPrefContactMth" name="driverPrefContactMth" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carOwnerRelCd" /><!-- 차량소유자관계 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerRelCd" name="carOwnerRelCd" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactTime" /><!-- 메인연락시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverPrefContactTime" name="driverPrefContactTime" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //送修者 -->

            <!-- 特约店会员 -->
            <div style="min-height:142px;">
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membNo" /><!-- 회원번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="membershipNo" name=membershipNo class="form_input" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.lbrDcRate" /><!-- 공임할인율 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="serDlrLbrDcRate" name="serDlrLbrDcRate" class="form_numeric ar" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membGrade" /><!-- 회원등급 --></th>
                                <td class="readonly_area">
                                    <input type="hidden" id="gradeCd" name="gradeCd"/>
                                    <input type="text" id="gradeNm" name="gradeNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.parDcRate" /><!-- 부품할인율 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="serDlrParDcRate" name="serDlrParDcRate" class="form_numeric ar" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membJoinDt" /><!-- 회원등록일 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="memberJoinDt" name="memberJoinDt" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.serDcRate" /><!-- 수리할인율 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="serDlrTotDcRate" name="serDlrTotDcRate" class="form_numeric ar" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membSaveMileage" /><!-- 회원누적마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.membPreBalAmt" /><!-- 회원선수금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membUseMileage" /><!-- 회원가용마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="lastPointVal" name="lastPointVal" class="form_input ar" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.remainPreBalAmt" /><!-- 회원가용선수금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="dlrRealTotAmt" name="dlrRealTotAmt" class="form_input ar" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //特约店会员 -->

            <!-- BM会员 -->
            <div style="min-height:142px;">
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col style="width:28%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembNo" /><!-- BM회원번호 --></th>
                                <td class="readonly_area">
                                    <div class="form_search">
                                        <input type="text" id="bmMembershipNo" name="bmMembershipNo" class="form_input" readonly />
                                        <!--  <a href="javascript:blueMemberInfo();"></a> 20200902 update by tjx 取消蓝缤会员查询的按钮 -->
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.lbrDcRate" /><!-- 공임할인율 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="serBmLbrDcRate" name="serBmLbrDcRate" class="form_numeric ar" readonly/>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembGrade" /><!-- BM회원등급 --></th>
                                <td class="readonly_area">
                                    <input type="hidden" id="bmGradeCd" name="bmGradeCd" />
                                    <input type="text" id="bmGradeNm" name="bmGradeNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.parDcRate" /><!-- 부품할인율 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="serBmParDcRate" name="serBmParDcRate" class="form_numeric ar" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembJoinDt" /><!-- BM회원가입시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="bmRegDt" name="bmRegDt" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.serDcRate" /><!-- 수리할인율 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="serBmTotDcRate" name="serBmTotDcRate" class="form_numeric ar" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembSaveMileage" /><!-- BM회원누적마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="bmTotalSavePoint" name="bmTotalSavePoint" class="form_numeric ar" data-type="number" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.bmMembPreBalAmt" /><!-- BM회원선수금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembUseMileage" /><!-- BM회원가용마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="bmLastPointVal" name="bmLastPointVal" class="form_numeric ar" data-type="number" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.remainPreBalAmt" /><!-- 회원가용선수금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input ar" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //BM会员 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //고객정보 -->
</div>

<%-- <div class="table_form table_form_v2 pt0 tablet_show">
    <table border="0" style="margin-bottom:10px;">
        <tr style="text-align: center; font-weight: bold;">
            <td><spring:message code="ser.lbl.carNo" /> / <spring:message code="ser.lbl.model" /></td>
            <td><spring:message code="ser.lbl.carOwner" /> / <spring:message code="ser.lbl.hpNo" /></td>
            <td><spring:message code="ser.lbl.nowRunDist" /> / <spring:message code="ser.lbl.accuDrivDis" /></td>
        </tr>
        <tr>
            <td>
                <div class="form_search">
                    <input type="text" id="carRegNoTablet"
                        name="carRegNoTablet" class="form_input">
                    <a href="javascript:custPopupWindow('${preFixId}');"></a>
                </div>
            </td>
            <td>
                <input type="text" id="carOwnerNmTablet"
                name="carOwnerNmTablet" class="form_input form_readonly"
                readonly>
            </td>
            <td>
                <input type="text" id="runDistValTablet"
                name="runDistValTablet" class="form_input">
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" id="modelNmTablet"
                name="modelNmTablet" class="form_input form_readonly"
                readonly>
            </td>
            <td>
                <input type="text" id="carOwnerHpNoTablet"
                name="carOwnerHpNoTablet"
                class="form_input form_readonly" readonly>
            </td>
            <td>
                <input type="text" id="carRunDistValTablet"
                name="carRunDistValTablet" class="form_input form_readonly"
                readonly>
            </td>
        </tr>
    </table>
</div> --%>

<div style="display:none;">
    <input type="text" id="preFixId" name="preFixId" value="${preFixId}" data-json-obj="true"/>
    <input type="text" id="pdiYn" name="pdiYn"  /> <!-- PDI 여부 -->
    <input type="text" id="signOffDt" name="signOffDt" /> <!-- 생산일자 -->
    <input type="text" id="carId" name="carId" <c:if test="${preFixId eq 'CA' or preFixId eq 'RE' or preFixId eq 'PC' }"> data-json-obj="true" </c:if>/>
    <input type="text" id="carOwnerSeq" name="carOwnerSeq"/>
    <input type="text" id="driverSeq" name="driverSeq"/>
    <input type="text" id="ltsModelCd" name="ltsModelCd"/>
    <input type="text" id="dlrPointCardNo" name="dlrPointCardNo"  />
    <input type="text" id="bmPointScale" name="bmPointScale"  />
    <input type="text" id="bmMaxConsumInte" name="bmMaxConsumInte"  />
    <input type="text" id="pointExchgScale" name=pointExchgScale />
    <input type="text" id="membershipPointUseMaxPoint" name="membershipPointUseMaxPoint" />
    <input type="text" id="custLvl" name="custLvl" /> <!-- 고객레벨 -->
    <input type="text" id="preBalDt" name="preBalDt" /> <!-- 예치금 일자-->
    <input type="text" id="cotcEndDt" name="cotcEndDt" /> <!-- 정비계약시작일 -->
    <input type="text" id="orgCd" name="orgCd" />  <!-- 정비계약종료일 -->
    <input type="text" id="driverBirthDt" name="driverBirthDt"  /> <!-- 운전자생일 -->
    <input type="text" id="sanbaoEndDt" name="sanbaoEndDt"  /> <!-- 삼보만료일자 -->
    <input type="text" id="carRegDt" name="carRegDt"  /> <!-- 차량등록일자 -->
    <input type="text" id="carDstinCd" name="carDstinCd"  />
</div>

<!--
<input type="hidden" id="carOwnerBirthDt" name="carOwnerBirthDt"  /> 소유자생일
<input type="hidden" id="carOwnerBirthRemainDay" name="carOwnerBirthRemainDay"  /> 소유자생일
<input type="hidden" id="driverBirthRemainDay" name="driverBirthRemainDay"  /> 소유자생일
-->


<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- script -->
<script>
var isTablet=${isTablet}+""; //khskhs  문제시 삭제

var vehOfCustInfoSearchPopup;
var campaignInfoSearchPopup;
var sanBaoAlarmPopup;
var custInfoRegPopup;
var preChkInfoPopup;
var campaignInfoOfDcsPopup;

var preFixId = "${preFixId}";

var gResult;

var warrYn = false; //是否发送保修索赔app


/** 고객  유형 **/
var custTpList = [];
<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var custTpMap = dms.data.arrayToMap(custTpList, function(obj){return obj.cmmCd;});

/** 승/상용  유형 **/
var carDstinTpCdList = [];
<c:forEach var="obj" items="${carDstinTpCdList}">
carDstinTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carDstinTpMap = dms.data.arrayToMap(carDstinTpCdList, function(obj){return obj.cmmCd;});

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

/** 브랜드 코드 **/
var brandCdList = [];
<c:forEach var="obj" items="${brandCdDs}">
    brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd;});

/** 증서유형 코드 **/
var mathDocTpList = [];
<c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var mathDocTpMap = dms.data.arrayToMap(mathDocTpList, function(obj){return obj.cmmCd;});

/** 메인연락방식 코드 **/
var prefContactMthCdList = [];
<c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var prefContactMthCdMap = dms.data.arrayToMap(prefContactMthCdList, function(obj){return obj.cmmCd;});

/** 메인연락시간 코드 **/
var prefContactTimeCdList = [];
<c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var prefContactTimeCdMap = dms.data.arrayToMap(prefContactTimeCdList, function(obj){return obj.cmmCd;});

var sexCdList = [];
<c:forEach var="obj" items="${sexCdList}">
sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var sexCdMap = dms.data.arrayToMap(sexCdList, function(obj){return obj.cmmCd;});

/** 사용여부 **/
var useYnList = [];
<c:forEach var="obj" items="${useYnDs}">
   useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});

/** 블루멤버쉽 등급 **/
var bmMemberGradeCdList = [];
<c:forEach var="obj" items="${bmMemberGradeCdList}">
   bmMemberGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var bmMemberGradeCdMap = dms.data.arrayToMap(bmMemberGradeCdList, function(obj){return obj.cmmCd;});

/** 소유자관계 코드 **/
var ownerRelCdList = [];
<c:forEach var="obj" items="${ownerRelCdDs}">
ownerRelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var ownerRelCdMap = dms.data.arrayToMap(ownerRelCdList, function(obj){return obj.cmmCd;});

/** 소유자관계  유형 **/
getOwnerRelCdMap = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
        if(ownerRelCdMap[val] != undefined)
            returnVal =  ownerRelCdMap[val].cmmCdNm;
    }
    return returnVal;
};

/** 고객  유형 **/
getCustTpMap = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
        if(custTpMap[val] != undefined)
            returnVal =  custTpMap[val].cmmCdNm;
    }
    return returnVal;
};

/** 승/상용  유형 **/
getCarDstinTpMap = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
        if(carDstinTpMap[val] != undefined)
            returnVal =  carDstinTpMap[val].cmmCdNm;
    }
    return returnVal;
};

//브랜드 코드
getBrandCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(brandCdMap[val] != undefined)
        returnVal = brandCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//블루멤버쉽 등급 코드
getBmMemberGradeCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(bmMemberGradeCdMap[val] != undefined)
        returnVal = bmMemberGradeCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//증서유형
getMathDocTpMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(mathDocTpMap[val] != undefined)
        returnVal = mathDocTpMap[val].cmmCdNm;
    }
    return returnVal;
};

//메인연락방식 코드
getPrefContactMthCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(prefContactMthCdMap[val] != undefined)
        returnVal = prefContactMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//메인연락시간 코드
getPrefContactTimeCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(prefContactTimeCdMap[val] != undefined)
        returnVal = prefContactTimeCdMap[val].cmmCdNm;
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

//성별유형
sexCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(sexCdMap[val] != undefined)
        returnVal = sexCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//사용여부
setUseYnCdMap = function(value){
    var resultVal ="";
    if( dms.string.strNvl(value) != ""){
        if(useYnMap[value] != undefined)
        resultVal =  useYnMap[value].cmmCdNm;
    }
    return resultVal;
};

//tablet tap width
window.onload=function(){
    if(isTablet=="true") {
        //tab tittle width
          $("#campaignTab li, #custInfoTab li").each(function(idx,obj){
              $(obj).css("width","25%");
              var kLink = $(obj).find("a")[0];
              $(kLink).css("width","100%");
          });
      }
};

$(document).ready(function() {
    if(isTablet=="true"){
        $(".group").hide();
        $(".tabletGroup").hide();
        $(".left_areaStyle").css({"float":"none","width":"100%"});
        $(".right_areaStyle").css({"float":"none","width":"100%","margin-top":"70px"});
        /* $(".reservation_top").height(500); */
        $("#chgV").text(parent.$("#tabMenu > ul:eq(0) > .k-state-active > .k-link").text());
        $("#chgV").show();
        $(".useTablet").show();
        $("#btnPrint").hide();
        $("#print2").hide();//pad端打印隐藏
        $(".left_areaStyle").css("z-index",111);
        //tab height
        var campaignTab = $("#campaignTab");
        var childOfCampaignTab = $(campaignTab).children("div");
        childOfCampaignTab.each(function(idx,obj){
            if(idx!=0){
                $(obj).height(192);
                if(idx==(childOfCampaignTab.length-1)) {
                    var content = $(obj).find("table")[0];
                    $(content).height(130);
                }
            }
        });
    }
    if(preFixId == "RE") {
        $("#runDistVal").attr("readonly", true);
        $(".runDist").addClass("readonly_area");
    } else {
        $("#runDistVal").attr("readonly", false);
        $(".runDist").removeClass("readonly_area");
    }

    // 차량점검일 경우 방문자, 후대전화 필수값 체크 해제
    if(preFixId == "CH") {
        $(".carChk").removeClass("bu_required");
    }

    if(preFixId == "PRE" || preFixId == "RE") {
        $("#driverHpNo").attr("data-json-obj", "true");
    } else {
        $("#driverHpNo").attr("data-json-obj", "false");
    }

    $("#campaignTab, #custInfoTab").kendoExtTabStrip({
        animation:false
    });

    $("#vinNo, #carRegNo, #carOwnerNm").keypress(function(e){
        if(e.keyCode === 13){
           e.preventDefault();
           custPopupWindow(preFixId);
       }
    });
    
    //id="carRunDistVal"
    /**현재주행거리, 누적주행거리, 정비예정주행거리**/
    $("#preRunDistVal, #runDistVal, #giRunDistVal, #totRunDistVal, #carRunDistVal, #expcChkRunDistVal2").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    $("#preRunDistVal, #carRunDistVal").on("focus",function(){
    	document.activeElement.blur();//屏蔽默认键盘弹出；
    });
    /**현재주행거리, 누적주행거리, 정비예정주행거리**/
    $("#serDlrLbrDcRate, #serDlrParDcRate, #serDlrTotDcRate, #serBmLbrDcRate, #serBmParDcRate, #serBmTotDcRate").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    $("#bmTotalSavePoint, #bmLastPointVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    // 보증만료일자
    $("#grteStartDt,#samPoEndDt,#incEndDt,#expcChkDt2,#custSaleDt,#carOwnerRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    $("#init").kendoButton({
        click:function(e) {
            custInfoUseControll(true);
            initSanbaoField();
            initAll();
        }
    });

    $("#init_Wa").kendoButton({
        click:function(e) {
            custInfoUseControll(true);
            initSanbaoField();
            initAll();
        }
    });

    /* $("#carDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carDstinTpCdList
        ,optionLabel : " "
        ,index:0
    }); */

    // 딜러 캠페인 더블 클릭 이벤트.
    $("#serCampaignGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var grid = $("#serCampaignGrid").data("kendoExtGrid");
        var rows = grid.select();

        var selectedVal = grid.dataItem(rows);

        var data = {
                crNo:selectedVal.crNo
               ,crNm:selectedVal.crNm
               ,ltsModelCd:$("#ltsModelCd").val()
               ,hostCd:"02"
               ,carBrandCd:$("#carBrandCd").val()
               ,vinNo:$("#vinNo").val()
               ,preFixId:$("#preFixId").val()
        };
        if($("#preFixId").val() != "CH"){
            campaignPopupWindow(data);
        }
        //$("#btnSelect").click();
    });

    // 제조자 캠페인 더블 클릭 이벤트.
    $("#allCampaignGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#allCampaignGrid").data("kendoExtGrid");
        var rows = grid.select();

        var selectedVal = grid.dataItem(rows);

        var data = {
                crNo:selectedVal.crNo
               ,crNm:selectedVal.crNm
               ,ltsModelCd:$("#ltsModelCd").val()
               ,hostCd:"01"
               ,carBrandCd:$("#carBrandCd").val()
               ,vinNo:$("#vinNo").val()
               ,preFixId:$("#preFixId").val()
        };

        if($("#preFixId").val() != "CH"){
            campaignPopupWindow(data);
        }
    });


 // 딜러 캠페인 더블 탭 이벤트.
    $("#serCampaignGrid").on("doubletap", "tr.k-state-selected", function (e) {

        var grid = $("#serCampaignGrid").data("kendoExtGrid");
        var rows = grid.select();

        var selectedVal = grid.dataItem(rows);

        var data = {
                crNo:selectedVal.crNo
               ,crNm:selectedVal.crNm
               ,ltsModelCd:$("#ltsModelCd").val()
               ,hostCd:"02"
               ,carBrandCd:$("#carBrandCd").val()
               ,vinNo:$("#vinNo").val()
               ,preFixId:$("#preFixId").val()
        };
        if($("#preFixId").val() != "CH"){
            campaignPopupWindow(data);
        }
        //$("#btnSelect").click();
    });

    // 제조자 캠페인 더블 탭 이벤트.
    $("#allCampaignGrid").on("doubletap", "tr.k-state-selected", function (e) {

        var grid = $("#allCampaignGrid").data("kendoExtGrid");
        var rows = grid.select();

        var selectedVal = grid.dataItem(rows);

        var data = {
                crNo:selectedVal.crNo
               ,crNm:selectedVal.crNm
               ,ltsModelCd:$("#ltsModelCd").val()
               ,hostCd:"01"
               ,carBrandCd:$("#carBrandCd").val()
               ,vinNo:$("#vinNo").val()
               ,preFixId:$("#preFixId").val()
        };
        if($("#preFixId").val() != "CH"){
            campaignPopupWindow(data);
        }
        //$("#btnSelect").click();
    });

    // 캠페인 그리드(딜러 캠페인)
    $("#serCampaignGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/campaign/selectCampaignForVinInfos.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sVinNo"]      = $("#vinNo").val();
                         params["sPdiYn"]      = dms.string.defaultString($("#pdiYn").val(),"N");
                         params["sCarDstinCd"] = $("#carDstinCd").val();
                         params["sLtsModelCd"] = $("#ltsModelCd").val();
                         params["sHostCd"]     = "02";

                         params["sSignOffDt"] = kendo.parseDate( $("#signOffDt").val());
                         params["sCustSaleDt"] = $("#custSaleDt").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,crNo:{type:"string" }
                       ,crTp:{type:"string" }
                       ,crNm:{type:"string" }
                       ,crStartDt:{type:"date" }
                       ,crEndDt:{type:"date" }
                       ,ltsModelCd:{type:"string" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,resizable:false
        ,editable:false
        ,height:(isTablet=="true")? 170 : 120
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,selectable:"row"
        ,autoBind:false
        ,reorderable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBinding:function(e){

            if(this.dataSource._total > 0 ){
                $("#serCampnCnt").text("("+this.dataSource._total+")");
            }else{
                $("#serCampnCnt").text("");
            }
        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, hidden:true}          // NUMBER
             ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}           // 캠페인 코드
             ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100,attributes:{"class":"ac"}
                 ,template:"#=crTpCdGrid(crTp)#"
                 ,editor:function(container, options) {
                      $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:crTpList
                      });
                      $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                  }
              }         // 정비유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}          // 캠페인명
            ,{field:"crStartDt", title:"<spring:message code='ser.lbl.crStartDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required name="crStartDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="crStartDt"></span>').appendTo(container);
                }
            } // 캠페인 시작일자
            ,{field:"crEndDt", title:"<spring:message code='ser.lbl.crEndDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required name="crEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="crEndDt"></span>').appendTo(container);
                }
            } // 캠페인 종료일자
           ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:100 ,hidden:true}          // 캠페인 LTS MODEL 내용
        ]
    });

    // 일괄캠페인 그리드 (제조사 캠페인)
    $("#allCampaignGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/campaign/selectCampaignForVinInfos.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sVinNo"]      = $("#vinNo").val();
                         params["sPdiYn"]      = dms.string.defaultString($("#pdiYn").val(),"N");
                         params["sCarDstinCd"] = $("#carDstinCd").val();
                         params["sLtsModelCd"] = $("#ltsModelCd").val();
                         params["sHostCd"]     = "01";

                         params["sSignOffDt"] = kendo.parseDate( $("#signOffDt").val());
                         params["sCustSaleDt"] = $("#custSaleDt").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,crNo:{type:"string" }
                       ,crTp:{type:"string" }
                       ,crNm:{type:"string" }
                       ,crStartDt:{type:"date" }
                       ,crEndDt:{type:"date" }
                       ,ltsModelCd:{type:"string" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,resizable:false
        ,selectable:"row"
        ,height:(isTablet=="true")? 170 : 120
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,reorderable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBinding:function(e){
            if(this.dataSource._total > 0 ){
                $("#collectCampnCnt").text("("+this.dataSource._total+")");
            }else{
                $("#collectCampnCnt").text("");
            }
            //tjx 添加活动inf连接校验
            campaignInfo();
        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, hidden:true}          // NUMBER
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}           // 캠페인 코드
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100,attributes:{"class":"ac"}
                ,template:"#=crTpMap[crTp].cmmCdNm#"
                ,editor:function(container, options) {
                     $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:crTpList
                     });
                     $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                 }
             }         // 정비유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}          // 캠페인명
            ,{field:"crStartDt", title:"<spring:message code='ser.lbl.crStartDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required name="crStartDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="crStartDt"></span>').appendTo(container);
                }
            } // 캠페인 시작일자
            ,{field:"crEndDt", title:"<spring:message code='ser.lbl.crEndDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required name="crEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="crEndDt"></span>').appendTo(container);
                }
            }
           ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:100 ,hidden:true}          // 캠페인 LTS MODEL 내용
        ]
    });

    carInfo = function(){
        if($("#carInfo").is(":hidden")){
            $("#carInfo").slideDown();
        }else{
            $("#carInfo").slideUp();
        }
    };

    custInfo = function(){
        if($("#ownerInfo").is(":hidden")){
            $("#ownerInfo").slideDown();
            if(isTablet=="true"){
                $("#custInfoTab > div:eq(0)").css("height","280px");
            }
        }else{
            $("#ownerInfo").slideUp();
            if(isTablet=="true"){
                $("#custInfoTab > div:eq(0)").css("height","auto");
            }
        }
    };

    // 휴대전화
    $("#carOwnerHpNo").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });

    $("#carOwnerHpNo").focusout(function(){
        $(this).val($.trim($(this).val()));
    });

    // 차량마스터
    $("#carMasterMng").kendoButton({
        click:function(e) {
            parent.parent._createOrReloadTabMenu("<spring:message code='sal.menu.vehicleMasterMgmt'/>", "<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do'/>?sSerFg=Y&sCarId="+$("#carId").val(), "VIEW-D-10396");
        }
    });

    // 차량마스터
    $("#carMasterMng_Wa").kendoButton({
        click:function(e) {
            parent.parent._createOrReloadTabMenu("<spring:message code='sal.menu.vehicleMasterMgmt'/>", "<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do'/>?sCarId="+$("#carId").val(), "VIEW-D-10396");
        }
    });

    // 고객마스터
    $("#custInfoMng").kendoButton({
        click:function(e) {
            if(dms.string.strNvl($("#carOwnerId").val()) == ""){
                dms.notification.info("<spring:message code='ser.lbl.carOwner' var='carOwner' /><spring:message code='ser.info.noInfoData' arguments='${carOwner}' />");
                return false;
            }
            parent.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo'/>", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do'/>?custNo="+$("#carOwnerId").val(), "VIEW-D-10272");
        }
    });

    // 고객마스터
    $("#custInfoMng_Wa").kendoButton({
        click:function(e) {
            if(dms.string.strNvl($("#carOwnerId").val()) == ""){
                dms.notification.info("<spring:message code='ser.lbl.carOwner' var='carOwner' /><spring:message code='ser.info.noInfoData' arguments='${carOwner}' />");
                return false;
            }
            parent.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo'/>", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do'/>?custNo="+$("#carOwnerId").val(), "VIEW-D-10272");
        }
    });

    // 고객view
    $("#custInfo").kendoButton({
        click:function(e) {
           dms.notification.info('<spring:message code="global.msg.eveloping" />');
        }
    });

    // 고객view
    $("#btnDriverReg").kendoButton({
        click:function(e) {
            var data = "";
             //console.log("点击后",preFixId);
            if(preFixId != "CA"){
                data = {
                    "vinNo":$("#vinNo").val()
                    ,"carId":$("#carId").val()
                    ,"isNew":"update"
                    ,"preFixId":preFixId
                };
                custReg(data);
            }
        }
    });

    $("#chgV").kendoButton({
        click:function(e) {
            if(!$(".group").is(":visible")){
                $("#chgV").text("<spring:message code='global.btn.searchCondition' />");
            }else{
                $("#chgV").text(parent.$("#tabMenu > ul:eq(0) > .k-state-active > .k-link").text());
            }
            $(".group").toggle();
            $(".tabletGroup").toggle();
            $(".left_areaStyle").toggle();
            $(".right_areaStyle").toggle();
        }
    });

    $("#btnSanbaoAlarm").kendoButton({      //동일하자이력
        enable:false,
        click:function(e){
            sanbaoAlarmSearchPopup(gResult);
        }
    });

    $("#btnSanbaoPrint").kendoButton({      //삼포증출력
        enable:false,
        click:function(e){
            var iReportParam = "&sVinNo="+$("#vinNo").val();
            var iReportUrl = "<c:url value='/ReportServer?reportlet=ser/selectSanbaoDocRpt.cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='ser.btn.sanbaoPrint' />", 'top=0,left=0,width=925,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
        }
    });

    custReg = function(data){
        var title;
        var height;
        if(data.isNew == "new"){
            title = "<spring:message code='ser.lbl.custNew' />";     // 고객신규등록
        } else {
            title = "<spring:message code='ser.lbl.custInfoRegUpdt' />";     // 고객정보등록/변경
        }

        if(isTablet=="true"){
        //20191231 update by sunzq3 低分辨率平板，验证按钮遮挡修复 start
//            height=605;
            height=405;
        //20191231 update by sunzq3 低分辨率平板，验证按钮遮挡修复 end
        }else{
            height=405;
        }

        custInfoRegPopup = dms.window.popup({
            windowId:"custInfoRegPopup"
            , title:title
            , height : height
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectCustInfoRegPopup.do'/>"
                , data:{
                    "vinNo":data.vinNo
                    ,"carId":data.carId
                    ,"isNew":data.isNew
                    ,"preFixId":preFixId
                    ,"callbackFunc":function(data){
                    	//点击后 RO 是 维修委托  PC 是接车检查
                      //console.log("preFixId",preFixId);
                        if(preFixId == "RO"){
                            setBizDataSearch(data, preFixId);
                        } else {
                            //getCustInfo(data);
                            //接车检查画面变更信息时 原有信息不被清空 如 接车检查号码等2018-12-18 贾明 start 
                            getCustInfo(data,"N");
                            //接车检查画面变更信息时 原有信息不被清空 如 接车检查号码等2018-12-18 贾明 start 	
                        }
                    }//callback
                }
            }
        });
    };

    //고객 팝업
    custPopupWindow = function(preFixId){

        var autoBind = false;

        if(preFixId != "CA"){
        	//20201209 update by tjx 维修预约,接车检查,维修委托三个页面存在单号不能修改车架号等信息  start
        	//维修预约界面,预约单生成状态为确认或完成时,不能修改车架号等信息
        	if(preFixId == "RE"){
        		if(dms.string.strNvl($("#resvStatCd").val()) != ""){
                    dms.notification.info("<spring:message code='global.resvcar.info' />");//已生成的预约单不能修改车辆
                    return;
                }
        	}   
        	//接车界面,接车单生成,接车单状态不为空不能修改车架号等信息
        	if(preFixId == "PC"){
        		if(dms.string.strNvl($("#diagStatCd").val()) != ""){
                    dms.notification.info("<spring:message code='global.diagcar.info' />");//已生成的接车单不能修改车辆
                    return;
                }
        	}
        	//维修委托页面,工单生成,工单状态不为空不能修改车架号等信息
        	if(preFixId == "RO"){
        		if(dms.string.strNvl($("#roStatCd").val()) != ""){
                    dms.notification.info("<spring:message code='global.rocar.info' />");//已生成的委托单不能修改车辆
                    return;
                }
        	}   
        	//20201209 update by tjx 维修预约,接车检查,维修委托三个页面存在单号不能修改车架号等信息  end
        	
            // 멤버쉽정보가 그대로 남아있어서 초기화후 진행하도록 유도 20170612
            if(dms.string.strNvl($("#membershipNo").val()) != "" || dms.string.strNvl($("#bmMembershipNo").val()) != ""){
                dms.notification.info("<spring:message code='global.btn.init' var='init' /><spring:message code='global.info.required.preprocess' arguments='${init}' />");
                return;
            }

            if(dms.string.strNvl($("#vinNo").val()) != "" || dms.string.strNvl($("#carRegNo").val()) != "" || dms.string.strNvl($("#carOwnerNm").val()) != ""){
                autoBind = true;
            }

            _carRegNo=$("#carRegNo").val();


            vehOfCustInfoSearchPopup = dms.window.popup({
                windowId:"vehOfCustInfoSearchPopup"
                , title:"<spring:message code='ser.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                    , data:{
                        "autoBind":autoBind
                        , "type"  :null
                        , "vinNo":$("#vinNo").val()
                        , "carId":$("#carId").val()
                        , "carRegNo":_carRegNo//khskhs  문제시 삭제  $("#carRegNo").val()
                        , "carOwnerNm":$("#carOwnerNm").val()
                        , "preFixId":preFixId
                        , "callbackFunc":function(data){
                            if(data.isNew == "new" || data.isNew == "update"){
                                custReg(data);
                            } else {
                                setBizDataSearch(data[0], preFixId);
                            }
                        }//callback
                    }
                }
            });
        }

    };

    // RO , 예약은 업무별 상세 데이터 조회
    // RO:vin별 당일 차량점검 존재여부 , 예약:vin별 당일  예약정보 확인
    setBizDataSearch = function(data , preFixId){

        //initAll();

        if(preFixId != undefined && preFixId == "RO"){

            $.ajax({
                url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfPreCheckInfos.do' />"
               ,data:JSON.stringify({sCarId:data.carId, sVinNo:data.vinNo, sPreFixId:preFixId, sSerResvStartDt:new Date("${sysDate}")})
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,error:function(jqXHR, status, error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function(result, textStatus){
                   if(result.total <= 0 ){
                   	//2020/01/03   tianjx   没有接车检查单,接车检查号码置空
                	$("#diagDocNo").val("");
                    getCustInfo(data,"N");//维修委托功能 中 在 变更信息时,点击登记后 ,主页车辆所有者信息页卡 车辆所有者、移动电话等没有更改  维修委托号码、客户主诉等 要保持不变 贾明 start 2018-12-13
                       $("#messageId").html("<spring:message code='ser.lbl.preChkInfo' var='preChkInfo' />"+
                                            "<spring:message code='ser.menu.preCheckCreate' var='preCheckCreate' />"+
                                            "<spring:message code='ser.info.preInfoData' arguments='${preChkInfo},${preCheckCreate}' />"  );
                          conformKendoWindow.content($(".msgDiv").html());
                          conformKendoWindow.open();
                          $(".yes, .no").click(function(){
                              if($(this).hasClass("yes")){
                                  conformKendoWindow.close();
                                  parent._createOrReloadTabMenu('<spring:message code="ser.menu.preCheckCreate" />'
                                          ,"<c:url value='/ser/ro/preCheck/selectPreCheckMain.do?vinNo="+data.vinNo+"'/>", "VIEW-D-10333");
                              }
                              conformKendoWindow.close();

                          }).end();

                       return;
                   } else {
                       if(preFixId == "RO"){
                           //console.log("执行4444");
                           getCustInfo(data,"N");//维修委托功能 中 在 变更信息时,点击登记后 ,主页车辆所有者信息页卡 车辆所有者、移动电话等没有更改  维修委托号码、客户主诉等 要保持不变 贾明 start 2018-12-13
                           setPreCheckInfoPopupWindow(result.data[0].vinNo);
                       }else{
                          //console.log("执行3");
                          //getCustInfo(data);
                           getCustInfo(data,"N");//维修委托功能 中 在 变更信息时,点击登记后 ,主页车辆所有者信息页卡 车辆所有者、移动电话等没有更改  维修委托号码、客户主诉等 要保持不变 贾明 start 2018-12-13
                           $("#roGrpNo").val(result.data[0].roGrpNo);
                           $("#diagDocNo").val(result.data[0].diagDocNo);
                       }
                   }
               }
           });
        } else {
            //console.log("执行1");
            getCustInfo(data, "N");
            //liuxueing  接车检查自动弹出预约单  start//
            if(preFixId == 'PC'){
            	slidePlay2();
            }
            //lixueying  接车检查自动弹出预约单 end  //
        }
    };

    saveDcsVin = function(data){

        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/insertDcsVehicleInfo.do' />"
           ,data:JSON.stringify({sVinNo:data.vinNo })
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR, status, error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result, textStatus){
               if( dms.string.isNotEmpty(result)){
                   getCustInfo(data);
               }
           }
       });
    };

    /** 캠페인 정보 팝업 **/
    campaignPopupWindow = function(params){
        campaignInfoSearchPopup = dms.window.popup({
            windowId:"campaignInfoSearchPopup"
            , title:"<spring:message code='ser.title.campaignSearch' />"   // 고객 조회
            , height:400
            , modal : true
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectCampaignPopup.do'/>"
                , data:{
                    "autoBind":true
                    ,"type"  :null
                    ,"params":params
                    ,"callbackFunc":function(lbrData, partData,result,callData){
                        if(isTablet=="true"){
                            //campaignInfoSearchPopup.close();
                            $("#chgV").click();
                        }
                        if(lbrData.length > 0){
                            lbrCampaignAdd(lbrData, partData,'Y');
                        }

                        if(callData == 'Y'){
                            var height = '380';
                            campaignInfoOfDcsPopup = dms.window.popup({
                                windowId:"campaignInfoOfDcsPopup"
                                , title:"<spring:message code='crm.title.campaignInfo'/>"
                                , height : height
                                , content:{
                                    url:"<c:url value='/ser/cmm/popup/selectCampaignInfoOfDcsPopup.do'/>"
                                    ,data:{
                                        "result":result
                                    }
                                }
                            });
                        }
                    }

                }
            }
        });
    };

    custInfoUseControll = function(useable){ //runDist


        if(preFixId == "CA") {
            $(".useable").addClass("readonly_area");
            $(".form_use").attr("readonly", true);
            $(".runDist").addClass("readonly_area", true);
        }else{
            if(useable) {
                $(".useable").removeClass("readonly_area");
                $(".form_use").attr("readonly", false);
            } else {
                $(".useable").addClass("readonly_area");
                $(".form_use").attr("readonly", true);
            }
        }
    };

    /** 삼보 알람 조회 팝업 **/
    sanbaoAlarmSearchPopup = function(result){
        sanBaoAlarmPopup = dms.window.popup({
            windowId:"sanBaoAlarmPopup"
            , width:600
            , height:380
            , title:"<spring:message code='ser.lbl.sampoAlarm'/>"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectSanbaoAlarmPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "listType":"01"
                    , "result":result
                      , "callbackFunc":function(data){

                    }
                }
            }
        });
    };


    /**삼보 알람 정보 조회**/
    sanbaoDetailSet = function(){
        if($("#carDstinCd").val() == "P"){
            $("#btnSanbaoPrint").data("kendoButton").enable(true);
        }
        $.ajax({
            url:"<c:url value='/ser/cmm/popup/selectSanbaoAlarmInfoByKey.do' />"
            ,data:JSON.stringify({sVinNo:$("#vinNo").val()})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result){
                gResult = result;

                if(dms.string.strNvl(result.vinNo) != ""){

                    setSanbaoResult(result);

                    if(dms.string.strNvl(result.sanbaoWartYn) == "Y"){
                        $(".sanbaoTabMsg").attr("style","color:#ff4848");
                    }
                    if(preFixId == "PC" || preFixId == "RE"){

                        if( dms.string.isEmpty($("#diagDocNo").val()) ){
                            if(dms.string.strNvl(result.sanbaoWartAlarmYn) == "Y" ||
                                 dms.string.strNvl(result.newCarWartAlarmYn) == "Y"||
                                 dms.string.strNvl(result.workOverAlarmYn) == "Y"
                            ){
                                 sanbaoAlarmSearchPopup(result);
                            }
                        }
                    }
                    if($("#carDstinCd").val() == "P"){
                        $("#btnSanbaoAlarm").data("kendoButton").enable(true);
                    }
                }else{
                    $(".sanbaoTabMsg").attr("style","color:#505050");
                    $("#btnSanbaoAlarm").data("kendoButton").enable(false);
                }
            }
            ,timeout : 10000
        });
    };

    relCustSearchPopUp = function(iframe, searchType, custTp, custNm) {
        var height=(isTablet=="true")? 600 : 520;

        popupWindow = dms.window.popup({
            windowId:"popupWindow"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , height:height
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "custCd":null         // null:all, 01:잠재, 02:보유
                    , "custTp":custTp
                    , "custNm":custNm
                    , "closeYn" : "Y"
                    , "callBackTp" : "BTN_CREATE"
                    , "callbackFunc":function(data){
                    	//console.log("返回值",data);
                        if(data.callBackTp == "BTN_CREATE" ){
                            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custReg' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do?custCollSrcCd=02' />", "VIEW-D-10623");
                        }
                        if (data.length >= 1) {
                        	//console.log("返回值1",data);
                            var windowElement = $("#"+iframe);
                            var iframeDomElement = (isTablet=="true")? windowElement.find("iframe")[0] : windowElement.children("iframe")[0];
                            var iframeWindowObject = iframeDomElement.contentWindow;
                            iframeWindowObject.custDataSet(data, searchType);
                           // popupWindow.close();
                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    }

    zipCodeSearchPopUp = function(iframe, saveType) {
        var height = (isTablet=="true")? 420 : 400;
        zipCodeSearchPopupWin = dms.window.popup({
            windowId:"zipCodeSearchPopupWin"
            , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
            , width:600
            , height:height
            , content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    , "callbackFunc":function(data){
                        if (data.length >= 1) {
                            var windowElement = $("#"+iframe);
                            var iframeDomElement = (isTablet=="true")? windowElement.find("iframe")[0] : windowElement.children("iframe")[0];
                            var iframeWindowObject = iframeDomElement.contentWindow;
                            iframeWindowObject.zipInfoDataSet(data, saveType);
                            zipCodeSearchPopupWin.close();
                        }
                    }
                }
            }
        });
    }
});

initSanbaoField = function(){

    $("#sanbaoWartPrid").html("");
    $("#sanbaoWartRunDistVal").html("");
    $("#sanbaoWartRmPrid").html("");
    $("#sanbaoWartRmRunDistVal").html("");
    $("#sanbaoWartkYn").html("");

    $("#newCarWartPrid").html("");
    $("#newCarWartRunDistVal").html("");
    $("#newCarWartRmPrid").html("");
    $("#newCarWartRmRunDistVal").html("");
    $("#newCarWartYn").html("");

    $("#workOverPrid").text("");
    $("#workOverRmPrid").text("");
    $("#workOverYn").html("");

    if($("#sanbaoAlramKanban").val() != undefined){

        $("#sanbaoWartPridKan").html("");
        $("#sanbaoWartRunDistValKan").html("");
        $("#sanbaoWartRmPridKan").html("");
        $("#sanbaoWartRmRunDistValKan").html("");
        $("#sanbaoWartkYnKan").html("");

        $("#newCarWartPridKan").html("");
        $("#newCarWartRunDistValKan").html("");
        $("#newCarWartRmPridKan").html("");
        $("#newCarWartRmRunDistValKan").html("");
        $("#newCarWartYnKan").html("");

        $("#workOverPridKan").text("");
        $("#workOverRmPridKan").text("");
        $("#workOverYnKan").html("");
    }
    $("#btnSanbaoAlarm").data("kendoButton").enable(false);
    $("#btnSanbaoPrint").data("kendoButton").enable(false);
};

setSanbaoResult = function (result){

    $("#sanbaoWartPrid").html( result.sanbaoWartPrid+"&nbsp;<spring:message code='ser.lbl.yy' />");
    $("#sanbaoWartRunDistVal").html(result.sanbaoWartRunDistVal+"&nbsp; KM");
    $("#sanbaoWartRmPrid").html( result.sanbaoWartRmPrid +"&nbsp; <spring:message code='ser.lbl.monday' />");
    $("#sanbaoWartRmRunDistVal").html( result.sanbaoWartRmRunDistVal +"&nbsp; KM");
    $("#sanbaoWartkYn").html(  setUseYnCdMap(result.sanbaoWartYn) );

    $("#newCarWartPrid").html( result.newCarWartPrid +"&nbsp; <spring:message code='ser.lbl.day' />" );
    $("#newCarWartRunDistVal").html( result.newCarWartRunDistVal+"&nbsp; KM" );
    $("#newCarWartRmPrid").html( result.newCarWartRmPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
    $("#newCarWartRmRunDistVal").html( result.newCarWartRmRunDistVal +"&nbsp; KM");
    $("#newCarWartYn").html(setUseYnCdMap(result.newCarWartYn ));

    $("#workOverPrid").html( result.workOverPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
    $("#workOverRmPrid").html( result.workOverRmPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
    $("#workOverYn").html( setUseYnCdMap(result.workOverYn) );
    /*
    if($("#sanbaoAlramKanban").val() == undefined){
        alert("sanbaoAlramKanban not exists ");      */

    if($("#sanbaoAlramKanban").val() != undefined){

        $("#sanbaoWartPridKan").html( result.sanbaoWartPrid+"&nbsp;<spring:message code='ser.lbl.yy' />");
        $("#sanbaoWartRunDistValKan").html(result.sanbaoWartRunDistVal+"&nbsp; KM");
        $("#sanbaoWartRmPridKan").html( result.sanbaoWartRmPrid +"&nbsp; <spring:message code='ser.lbl.monday' />");
        $("#sanbaoWartRmRunDistValKan").html( result.sanbaoWartRmRunDistVal +"&nbsp; KM");
        $("#sanbaoWartkYnKan").html(  setUseYnCdMap(result.sanbaoWartYn) );

        $("#newCarWartPridKan").html( result.newCarWartPrid +"&nbsp; <spring:message code='ser.lbl.day' />" );
        $("#newCarWartRunDistValKan").html( result.newCarWartRunDistVal+"&nbsp; KM" );
        $("#newCarWartRmPridKan").html( result.newCarWartRmPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
        $("#newCarWartRmRunDistValKan").html( result.newCarWartRmRunDistVal +"&nbsp; KM");
        $("#newCarWartYnKan").html(setUseYnCdMap(result.newCarWartYn ));

        $("#workOverPridKan").html( result.workOverPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
        $("#workOverRmPridKan").html( result.workOverRmPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
        $("#workOverYnKan").html( setUseYnCdMap(result.workOverYn) );
    }

};

getCustInfo = function(data, clearYn){

    if(data == undefined){
        return;
    }

    if(clearYn == undefined){
         //console.log("我的值");
        initAll();
    }

    $.ajax({
        url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
        ,data:JSON.stringify({sCarId:data.carId, sVinNo:data.vinNo, sCarNo:data.carRegNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            if(result != null){
                if(result.total > 0 ){
                   
                    custInfoSet(result.data[0]);
                    if(dms.string.strNvl($("#carOwnerId").val()) != "" && preFixId != 'CA') {
                        dealerMemberInfo();
                        //blueMemberInfo();
                    }
                    custInfoUseControll(false);
                }else{
                    var msg =   "<spring:message code='ser.lbl.vinNo' var='vinNo' />"+
                                "<spring:message code='ser.info.noInfoData' arguments='${vinNo}' />";
                     dms.notification.warning(msg);
                     return;
                }
            }
        }
    });
};

//차량정보, 고객정보 셋팅
custInfoSet = function(data){

    $("#carId").val(dms.string.strNvl(data.carId));
    $("#vinNo").val(dms.string.strNvl(data.vinNo));
    $("#carNo").val(dms.string.strNvl(data.carNo));
    $("#carRegNo").val(dms.string.strNvl(data.carRegNo));
    $("#enginNo").val(dms.string.strNvl(data.enginNo));
    $("#modelNm").val(dms.string.strNvl(data.modelNm));
    $("#ordDlrCd").val(dms.string.strNvl(data.ordDlrCd));
    $("#extColorNm").val(dms.string.strNvl(data.extColorNm));
    $("#carlineCd").val(dms.string.strNvl(data.carlineCd));
    $("#carlineNm").val(dms.string.strNvl(data.carlineNm));
    $("#grteEndDt").val(kendo.toString(kendo.parseDate(data.grteEndDt) , "<dms:configValue code='dateFormat' />"));
    $("#grteStartDt").val(kendo.toString(kendo.parseDate(data.grteStartDt), "<dms:configValue code='dateFormat' />"));
  	//2021.03.31 判断是否需要发送保修索赔app
    dms.string.strNvl(data.warrantyYn) == "Y"? warrYn = true : warrYn = false;
    //2021.03.31 判断是否需要发送保修索赔app
    $("#carBrandCd").val(dms.string.strNvl(data.ncarDstinCd));
    $("#carBrandNm").val(dms.string.strNvl(getBrandCdMap(data.ncarDstinCd)));
    $("#grteEndRemainDay").val(dms.string.strNvl(data.grteEndRemainDay));
    $("#carRunDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
    $("#preRunDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
    $("#expcChkDt2").data("kendoExtMaskedDatePicker").value(data.expcChkDt);
    $("#expcChkRunDistVal2").data("kendoExtNumericTextBox").value(data.expcChkRunDistVal);

    $("#carOwnerId").val(dms.string.strNvl(data.carOwnerId));
    $("#carOwnerNm").val(dms.string.strNvl(data.carOwnerNm));
    $("#carOwnerHpNo").data("kendoMaskedTextBox").value(data.carOwnerHpNo);
    $("#carOwnerTelNo").val(dms.string.strNvl(data.carOwnerTelNo));
    $("#carOwnerZipCd").val(dms.string.strNvl(data.carOwnerZipCd));
    $("#carOwnerMailNm").val(dms.string.strNvl(data.carOwnerMailNm));
    $("#carOwnerAddr").val(dms.string.strNvl(data.carOwnerAddr));
    $("#carOwnerSsnCrnNo").val(dms.string.strNvl(data.carOwnerSsnCrnNo));
    $("#carOwnerMathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.carOwnerMathDocTp)));
    $("#carOwnerPrefContactMthCd").val(dms.string.strNvl(getPrefContactMthCdMap(data.carOwnerPrefContactMthCd)));
    $("#carOwnerPrefContactTimeCd").val(dms.string.strNvl(getPrefContactTimeCdMap(data.carOwerPrefContactTimeCd)));
    $("#carOwnerBirthDt").val(dms.string.strNvl(kendo.toString(kendo.parseDate(data.carOwnerBirthDt), "<dms:configValue code='dateFormat' />")));
    $("#carOwnerBirthRemainDay").val(dms.string.strNvl(data.carOwnerBirthRemainDay));
    $("#carOwnerCustTpNm").val(getCustTpMap(data.carOwnerCustTp));
    $("#carOwnerSexNm").val(data.carOwnerSexNm);
    $("#carIfNm").val(data.carOwnerPurcMngNm);
    $("#custTag").val(data.custTag);
    //$("#carIfNm").val(data.carIfNm);

    $("#driverId").val(dms.string.strNvl(data.driverId));
    $("#driverNm").val(dms.string.strNvl(data.driverNm));
    $("#driverHpNo").val(dms.string.strNvl(data.driverHpNo));
    $("#driverTelNo").val(dms.string.strNvl(data.driverTelNo));
    $("#driverMailNm").val(dms.string.strNvl(data.driverMailNm));
    $("#driverSsnCrnNo").val(dms.string.strNvl(data.driverSsnCrnNo));
    $("#driverMathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.driverMathDocTp)));
    $("#driverPrefContactMth").val(dms.string.strNvl(getPrefContactMthCdMap(data.driverPrefContactMthCd)));
    $("#driverPrefContactTime").val(dms.string.strNvl(getPrefContactTimeCdMap(data.driverPrefContactTimeCd)));
    $("#carOwnerRelCd").val(getOwnerRelCdMap(data.carOwnerRelCd));
    //$("#driverBirthDt").val(dms.string.strNvl(kendo.toString(kendo.parseDate(data.driverBirthDt), "yyyy-MM-dd")));
    $("#driverBirthDt").val(dms.string.strNvl(data.driverBirthDt));
    $("#driverBirthRemainDay").val(dms.string.strNvl(data.driverBirthRemainDay));
    $("#driverSexCd").val(dms.string.strNvl(sexCdGrid(data.driverSexCd)));
    $("#custTp").val(dms.string.strNvl(data.custTp));
    $("#carDstinCd").val(dms.string.strNvl(data.carDstinCd));
    $("#carDstinCdNm").val(dms.string.strNvl(getCarDstinTpMap(data.carDstinCd)));
    $("#signOffDt").val(kendo.toString( kendo.parseDate(data.signOffDt), "<dms:configValue code='dateFormat' />" ));
    $("#custSaleDt").data("kendoExtMaskedDatePicker").value(data.custSaleDt);
    $("#carOwnerRegDt").data("kendoExtMaskedDatePicker").value(data.carOwnerRegDt);
    $("#carOwnerSeq").val(dms.string.strNvl(data.carOwnerSeq));
    $("#driverSeq").val(dms.string.strNvl(data.driverSeq));
    $("#ltsModelCd").val(dms.string.strNvl(data.ltsModelCd));

    var incTpStr = (dms.string.strNvl(data.incTp)=="")? "" : "(" + data.incTp + ")";
    $("#incCorpCd").val(dms.string.strNvl(data.incCmpCd) + incTpStr);
    $("#incEndDt").val(kendo.toString(kendo.parseDate(data.incEndDt)  ,"<dms:configValue code='dateFormat' />"));
    $("#kanbanIncEndDt").val(kendo.toString(kendo.parseDate(data.incEndDt), "<dms:configValue code='dateFormat' />"));
    $("#incEndRemainDay").val(dms.string.strNvl(data.incEndRemainDay));

    $("#sanbaoEndDt").val(dms.string.strNvl(data.sanbaoEndDt));
    $("#carRegDt").val(dms.string.strNvl(data.carRegDt));
//    if(dms.string.strNvl(data.custSaleDt) != "" && dms.string.strNvl(data.signOffDt) != ""){
    if(dms.string.strNvl(data.signOffDt) != ""){
        $("#serCampaignGrid").data("kendoExtGrid").dataSource.data([]);
        $("#serCampaignGrid").data("kendoExtGrid").dataSource.read();
        $("#allCampaignGrid").data("kendoExtGrid").dataSource.data([]);
        $("#allCampaignGrid").data("kendoExtGrid").dataSource.read();
    }

    if(dms.string.strNvl(data.vinNo) != "" ){
        sanbaoDetailSet();
    }

    // TODO:[김경목] 버튼 컨트롤 수정 필요

    if(preFixId != "CA") {
        btnControll("U");
    };

    if(preFixId == "RO" || preFixId == "CH"){

        if(preFixId == "CH"){
            if(dms.string.isEmpty($("#carChkDocNo").val())){
                $("#carChkEmpCd").val("${usrId}")
                $("#carChkEmpNm").val("${usrNm}")
            }
        }

        var sendParam = "GV_TMP_VEHL_MD1="+$("#carlineCd").val()+"&GV_TMP_VEHL_NM=&GV_TMP_VIN_NO="+$("#vinNo").val();
        sendParam += "&GV_TMP_REPR_DATE="+$("#roDt").val()+"&GV_TMP_ODOMETER="+$("#runDistVal").val();
        sendParam += "&GV_TMP_OCCU_CNT=&GV_TMP_DELV_DATE=";
        sendParam += "&GV_TMP_PROD_DATE=&GV_TMP_ENGN_NO="+$("#enginNo").val();
        sendParam += "&GV_TMP_MI_CD=&GV_TMP_PART_NO=&GV_TMP_PART_NM=&GV_TMP_NAT_NM=&GV_TMP_NAT_CD=";
        sendParam += "&GV_TMP_CAUS_CD=&GV_TMP_PRBM_VEHL_SPD_CD=&GV_TMP_N1_DTC_CD=&GV_TMP_N2_DTC_CD=";
        sendParam += "&GV_TMP_N3_DTC_CD=&GV_TMP_SUBJECT=&GV_TMP_DELR_DESC=&GV_TMP_SCR_ID=QIMS_CRUD_COMN_0710&TEMP_VAL=A";

        $.ajax({
            url:"<c:url value='/ser/ro/repairOrder/getQirSendData.do' />"
            ,data:JSON.stringify({"sBayNo":sendParam})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                $("#sendParam").val(result);
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    }

    if(preFixId == "RE"){
        <c:if test="${sLinkType eq 'A'}">
            $("#resvTp").data("kendoExtDropDownList").value("${sResvTp}");
        </c:if>
    }

    //서비스알람 상단 정보
    if($("#kanbanCarOwnerBirthDt").val() != undefined){
            serviceAlramInfoSet();
    }
};

// 20200706 updateBy tjx 批量活动经销商因vpn或inf项目连接问题导致没有获取到信息,增加提醒   start
campaignInfo = function() {
	var params = {};
    params["sVinNo"]      = $("#vinNo").val();
    params["sPdiYn"]      = dms.string.defaultString($("#pdiYn").val(),"N");
    params["sCarDstinCd"] = $("#carDstinCd").val();
    params["sLtsModelCd"] = $("#ltsModelCd").val();
    params["sHostCd"]     = "01";
    params["sSignOffDt"] = kendo.parseDate( $("#signOffDt").val());
    params["sCustSaleDt"] = $("#custSaleDt").data("kendoExtMaskedDatePicker").value();
	if(dms.string.strNvl($("#vinNo").val()) != "") {
		 $.ajax({
	            url:"<c:url value='/ser/svi/campaign/selectCampaignForVinInfos.do' />"
	            ,data:JSON.stringify(params)
	            ,type:'POST'
	            ,dataType:'json'
	            ,contentType:'application/json'
	            ,error:function(jqXHR, status, error) {
	            	$("#messageIdNext").html("<spring:message code='ser.lbl.CamelCampaign'/>");
                    conformKendoWindow.content( $(".msgDivNext").html());
                    conformKendoWindow.open();
                    $(".confirm").click(function(){
                        conformKendoWindow.close();
                    }).end();
	            }
	        });
	}
};
//20200706 updateBy tjx 批量活动经销商因vpn或inf项目连接问题导致没有获取到信息,增加提醒   end
dealerMemberInfo = function() {
    if(dms.string.strNvl($("#carOwnerId").val()) != "") {
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectDealerMemberShipInfo.do' />"
            ,data:JSON.stringify({sCustNo:$("#carOwnerId").val(), sVinNo:$("#vinNo").val()})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(dms.string.strNvl(result.membershipNo) != ""){
                    $("#membershipNo").val(result.membershipNo);
                    $("#gradeCd").val(result.gradeCd);
                    $("#gradeNm").val(result.gradeNm);
                    $("#lastPointVal").val(result.lastPointVal);
                    $("#dlrPointCardNo").val(result.cardNo);
                    $("#memberJoinDt").val(result.regDt);
                    $("#pointExchgScale").val(result.pointExchgScale);
                    $("#membershipPointUseMaxPoint").val(result.membershipPointUseMaxPoint);
                    $("#dlrRealTotAmt").val(result.realTotAmt);

                    $.each(result.membershipGradeMngList, function(index, item){
                        if(result.gradeCd == this.gradeSeq){
                            $("#serDlrLbrDcRate").data("kendoExtNumericTextBox").value(this.serLbrDcRate);
                            $("#serDlrParDcRate").data("kendoExtNumericTextBox").value(this.serParDcRate);
                            $("#serDlrTotDcRate").data("kendoExtNumericTextBox").value(this.serTotDcRate);
                        }
                    });

                    if(preFixId == "CA" || preFixId == "PC"){
                        setMemberShipInfo();
                    }
                }
            }
        });
    }
};

blueMemberInfo = function() {
    if(dms.string.strNvl($("#carOwnerId").val()) != "") {
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectBuleMemeberInfo.do' />"
            ,data:JSON.stringify({vin:$("#vinNo").val(), custNo:$("#carOwnerId").val()})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result){
                if(result.IsSuccess){
                    $("#bmMembershipNo").val(result.Data.BlueMembership_No);
                    $("#bmGradeCd").val(result.Data.Mlevel);
                    $("#bmGradeNm").val(getBmMemberGradeCdMap(result.Data.Mlevel));
                    $("#bmRegDt").val(kendo.toString(kendo.parseDate(result.Data.regDt)  ,"<dms:configValue code='dateFormat' />"));
                    $("#bmTotalSavePoint").data("kendoExtNumericTextBox").value(result.Data.TotalPoint);
                    $("#bmLastPointVal").data("kendoExtNumericTextBox").value(result.Data.Point);
                    $("#bmPointScale").val(result.Data.Scale);
                    $("#bmMaxConsumInte").val(result.Data.MaxConsumInte);
                    if(preFixId == "CA" || preFixId == "PC"){
                        setBmMemberShipInfo();
                    }
                } else {
                    if(result.Errors == ""){
                        dms.notification.info(result.Message);
                    }
                }
            }
            ,timeout : 10000
        });
    }
};

//사전점검 팝업
setPreCheckInfoPopupWindow = function(vinNo) {


    preChkInfoPopup = dms.window.popup({
        windowId:"preChkInfoPopup"
        ,width:900
        ,height:380
        ,modal:true
        ,title:"<spring:message code='ser.title.preCheck'/>"
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectPreCheckInfoPopup.do'/>"
            , data:{
                "autoBind":true
                 ,"vinNo":vinNo
                 ,"callbackFunc":function(data){
                     var data = {
                             "vinNo":data.vinNo
                            ,"carId":data.carId
                            ,"diagDocNo":data.diagDocNo
                            ,"roGrpNo":data.roGrpNo
                            ,"runDistVal":data.runDistVal
                            ,"carAcptTp":data.carAcptTp
                         };
                     detailSet(data, true, 'PC');
                 }
            }
        }
    });
};

//RO검색 팝업
$("#roSearch").kendoButton({
    click:function(e) {

        parent._createOrReloadTabMenu("<spring:message code='ser.menu.serviceHistory'/>", "<c:url value='/ser/svi/serviceHistory/selectServiceHistoryMain.do?vinNo=" + $("#vinNo").val() + "'/>", "VIEW-D-10371"); // 예약접수현황
        /* repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:920
            , height:560
            , title:"<spring:message code='ser.menu.roHisSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderHistorySearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "listType":"01"
                    , "vinNo":$("#vinNo").val()
                }
            }
        }); */
    }
});

//RO검색 팝업
$("#roSearch_Wa").kendoButton({
    click:function(e) {

        parent._createOrReloadTabMenu("<spring:message code='ser.menu.serviceHistory'/>", "<c:url value='/ser/svi/serviceHistory/selectServiceHistoryMain.do?vinNo=" + $("#vinNo").val() + "'/>", "VIEW-D-10371"); // 예약접수현황
        /* repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:920
            , height:560
            , title:"<spring:message code='ser.menu.roHisSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderHistorySearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "listType":"01"
                    , "vinNo":$("#vinNo").val()
                }
            }
        }); */
    }
});

//khskhs doubletab
(function($){

    $.event.special.doubletap = {
      bindType: 'touchend',
      delegateType: 'touchend',

      handle: function(event) {
        var handleObj   = event.handleObj,
            targetData  = jQuery.data(event.target),
            now         = new Date().getTime(),
            delta       = targetData.lastTouch ? now - targetData.lastTouch : 0,
            delay       = delay == null ? 300 : delay;

        if (delta < delay && delta > 30) {
          targetData.lastTouch = null;
          event.type = handleObj.origType;
          ['clientX', 'clientY', 'pageX', 'pageY'].forEach(function(property) {
            event[property] = event.originalEvent.changedTouches[0][property];
          })

          // let jQuery handle the triggering of "doubletap" event handlers
          handleObj.handler.apply(this, arguments);
        } else {
          targetData.lastTouch = now;
        }
      }
    };

  })(jQuery);
//khskhs doubletab


</script>
<!-- script -->

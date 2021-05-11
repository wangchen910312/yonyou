<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/signaturePad/signature-pad.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/bxslider/jquery.bxslider.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/html2canvas.js"/>"></script>
<script src="<c:url value="/resources/js/mob/signaturePad/signature_pad.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<style>
#_overlay {
    background-repeat: no-repeat;
    background-position: 50% 45%;
    background-size: 48px 48px;
}
</style>

<div id="_overlay" class="k-overlay" style="display: block; z-index: 10002; opacity: 0.5; background-image:url('<c:url value="/resources/img/loading-image_t.gif"/>')"></div>
<form id="preChkForm" style="width: 98.2%">
    <!-- 차량정보, 운전자정보 공통 페이지 -->
    <c:import url="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp" />
    <!-- 차량정보, 운전자정보 공통 페이지 -->
    <div class="group">
        <div class="table_form form_width_100per mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">
                            <spring:message code="ser.lbl.preInsNo" />
                        </th>
                        <!-- 사전점검번호 -->
                        <td>
                            <div class="form_search">
                                <input type="text" id="diagDocNo" name="diagDocNo" class="form_input" style="width: 110px;" data-json-obj="true">
                                <a href="javascript:goPreChkStatus();"></a>
                            </div>
                        </td>
                        <th scope="row">
                            <spring:message code="ser.lbl.preCheckTp" />
                        </th>
                        <!-- 입고점검유형 -->
                        <td>
                            <input id="carAcptTp" name="carAcptTp" value="02" class="form_comboBox" data-json-obj="true"></td>
                        <th scope="row">
                            <spring:message code="ser.lbl.preChkStatus" />
                        </th>
                        <!-- 사전점검상태 -->
                        <td class="readonly_area">
                            <input id="diagStatCd" name="diagStatCd" class="form_comboBox" readonly>
                        </td>
                        <th scope="row">
                            <spring:message code="ser.lbl.preChkNm" />
                        </th>
                        <!-- 발행자 -->
                        <td class="readonly_area">
                            <input id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab_area preCheck_tab">
            <!-- 탭메뉴 -->
            <ul>
                <li id="CQ">
                    <spring:message code="ser.lbl.custRemark" />
                    <!-- 고객요청사항 -->
                </li>
                <li id="RD" class="k-state-active">
                    <span id="L01" name="L01"><spring:message code="ser.lbl.trblExpl" /></span>
                <!-- 고장설명 -->
                </li>
                <li id="C1">
                    <span id="L02" name="L02" class="TabId"><spring:message code="ser.lbl.dashInChk" /></span>
                </li>
                <!-- Dashboard 검사/내부검사 -->
                <li id="C2">
                    <span id="L03" name="L03" class="TabId"><spring:message code="ser.lbl.outChk" /></span>
                </li>
                <!-- 외부검사 -->
                <li id="C3">
                    <span id="L04" name="L04" class="TabId"><spring:message code="ser.lbl.engnNaclChk" /></span>
                </li>
                <!-- 엔진룸 검사 -->
                <li id="C4">
                    <span id="L05" name="L05" class="TabId"><spring:message code="ser.lbl.lightCheck" /></span>
                </li>
                <!-- 조명검사 -->
                <li id="C5">
                    <span id="L06" name="L06" class="TabId"><spring:message code="ser.lbl.underCheck" /></span>
                </li>
                <!-- 하부검사 -->
                <li id="LS">
                    <spring:message code='ser.lbl.serviceCont' />
                </li>
                <!-- 수리건의 -->
            </ul>
            <!-- //탭메뉴 -->

            <span class="btn_right_absolute2" id="btn_status_check" style="display: none;">
                <!-- 전부정상 -->
                <button type="button" id="allNormal" class="btn_m btn_m_normal">
                    <spring:message code="ser.btn.allNormal" />
                </button>
                <!-- 정상 -->
                <button type="button" class="btn_m btn_m_normal btn_active">
                    <spring:message code="ser.btn.normal" />
                </button>
                <!-- 주의 -->
                <button type="button" class="btn_m btn_m_warning">
                    <spring:message code="ser.btn.warning" />
                </button>
                <!-- 이상 -->
                <button type="button" class="btn_m btn_m_error">
                    <spring:message code="ser.btn.problem" />
                </button>
            </span>

            <!-- 고객요청사항 -->

            <div style="min-height: 205px; height: 205px;">
                <div class="btn_right_absolute">
                    <c:if test="${param.gubun ne 'S'}">
                        <button type="button" id="custAdd" class="btn_s btn_add btn_s_min5">
                            <spring:message code="global.btn.add" />
                        </button>
                        <button type="button" id="custDel" class="btn_s btn_delete btn_s_min5">
                            <spring:message code="global.btn.del" />
                        </button>
                    </c:if>
                </div>
                <div class="table_grid">
                    <div id="custRemarkGrid" class="grid"></div>
                </div>
            </div>

            <!-- //고객요청사항-->

            <!--  고장설명  -->
            <div>
                <div class="preCheck_other">
                    <div class="table_form table_preChk">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width: 10.5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 14.5%;">
                            </colgroup>
                            <c:choose>
                                <c:when test="${param.gubun eq 'P'}">
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                                <span id="roadTerm" name="roadTerm">
                                                    <spring:message code="ser.lbl.roadCondition" />
                                                </span>
                                            </th>
                                            <!-- 도로조건 -->
                                            <td>
                                                <button type="button" id="roadTermCd1" name="roadTermCd1" value="Y" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.highway" />
                                                </button>
                                            </td>
                                            <!-- 고속도로 -->
                                            <td>
                                                <button type="button" id="roadTermCd2" name="roadTermCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.asphalt" />
                                                </button>
                                            </td>
                                            <!-- asphalt -->
                                            <td>
                                                <button type="button" id="roadTermCd3" name="roadTermCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.cementRoad" />
                                                </button>
                                            </td>
                                            <!-- 시멘트 도로 -->
                                            <td>
                                                <button type="button" id="roadTermCd4" name="roadTermCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.stonyRoad" />
                                                </button>
                                            </td>
                                            <!-- 모래돌 도로 -->
                                            <td>
                                                <button type="button" id="roadTermCd5" name="roadTermCd5" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.soilRoad" />
                                                </button>
                                            </td>
                                            <!-- 흙 도로 -->
                                            <td>
                                                <input type="text" id="roadTermCont" name="roadTermCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="roadPrcn" name="roadPrcn">
                                                    <spring:message code="ser.lbl.roadState" />
                                                </span>
                                            </th>
                                            <!-- 도로현황 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd1" name="roadPrcnCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.ground" />
                                                </button>
                                            </td>
                                            <!-- 수평 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd2" name="roadPrcnCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.uphill" />
                                                </button>
                                            </td>
                                            <!-- 오름막 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd3" name="roadPrcnCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.downhill" />
                                                </button>
                                            </td>
                                            <!-- 내리막 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd4" name="roadPrcnCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.sharpCurve" />
                                                </button>
                                            </td>
                                            <!-- 코너(급) -->
                                            <td>
                                                <button type="button" id="roadPrcnCd5" name="roadPrcnCd5" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.curve" />
                                                </button>
                                            </td>
                                            <!-- 코너(일반) -->
                                            <td>
                                                <input type="text" id="roadPrcnCont" name="roadPrcnCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="wetrTerm" name="wetrTerm">
                                                    <spring:message code="ser.lbl.weatherCondition" />
                                                </span>
                                            </th>
                                            <!-- 날씨조건 -->
                                            <td>
                                                <button type="button" id="wetrTermCd1" name="wetrTermCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.fineWeather" />
                                                </button>
                                            </td>
                                            <!-- 개임 -->
                                            <td>
                                                <button type="button" id="wetrTermCd2" name="wetrTermCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.windyWeather" />
                                                </button>
                                            </td>
                                            <!-- 바람 -->
                                            <td>
                                                <button type="button" id="wetrTermCd3" name="wetrTermCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.rainWeather" />
                                                </button>
                                            </td>
                                            <!-- 비 -->
                                            <td>
                                                <button type="button" id="wetrTermCd4" name="wetrTermCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.snowWeather" />
                                                </button>
                                            </td>
                                            <!-- 눈 -->
                                            <td>
                                                <input type="text" id="wetrTermCd5" name="wetrTermCd5" class="form_input ar form_input2"
                                                    maxlength="3" data-type="number" data-name="<spring:message code='ser.lbl.temperature' />"
                                                    style="width: 70%;">
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.temperature" />
                                                </span>
                                            </td>
                                            <!-- ℃ -->
                                            <td>
                                                <input type="text" id="wetrTermCont" name="wetrTermCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="occrFreq" name="occrFreq">
                                                    <spring:message code="ser.lbl.frequency" />
                                                </span>
                                            </th>
                                            <!-- 발생빈도 -->
                                            <td>
                                                <button type="button" id="occrFreqCd1" name="occrFreqCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.once" />
                                                </button>
                                            </td>
                                            <!-- 한번만 -->
                                            <td>
                                                <button type="button" id="occrFreqCd2" name="occrFreqCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.often" />
                                                </button>
                                            </td>
                                            <!-- 자주 -->
                                            <td>
                                                <button type="button" id="occrFreqCd3" name="occrFreqCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.reqular" />
                                                </button>
                                            </td>
                                            <!-- 정기적 -->
                                            <td>
                                                <button type="button" id="occrFreqCd4" name="occrFreqCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.occasionality" />
                                                </button>
                                            </td>
                                            <!-- 비정기적 -->
                                            <td>
                                                <input type="text" id="occrFreqCd5" name="occrFreqCd5" class="form_input ar form_input2" data-type="number"
                                                    min="1" data-name="<spring:message code='ser.lbl.repeat'/>" style="width: 70%;">
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.repeat" />
                                                </span>
                                            </td>
                                            <!-- 차수 -->
                                            <td>
                                                <input type="text" id="occrFreqCont" name="occrFreqCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="driveStat" name="driveStat">
                                                    <spring:message code="ser.lbl.driveState" />
                                                </span>
                                            </th>
                                            <!-- 운전상태 -->
                                            <td>
                                                <button type="button" id="driveStatCd1" name="driveStatCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.accelerateFast" />
                                                </button>
                                            </td>
                                            <!-- 가속(급) -->
                                            <td>
                                                <button type="button" id="driveStatCd2" name="driveStatCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.accelerate" />
                                                </button>
                                            </td>
                                            <!-- 가속(일반) -->
                                            <td>
                                                <button type="button" id="driveStatCd3" name="driveStatCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.suddenStop" />
                                                </button>
                                            </td>
                                            <!-- 감속(급) -->
                                            <td>
                                                <button type="button" id="driveStatCd4" name="driveStatCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.slowDown" />
                                                </button>
                                            </td>
                                            <!-- 감속(일반) -->
                                            <td>
                                                <input type="text" id="driveStatCd5" name="driveStatCd5" class="form_input ar form_input2"
                                                    data-type="number" min="1" maxlength="3" data-name="<spring:message code='ser.lbl.kmH' />"
                                                    style="width: 70%;">
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.kmH" />
                                                </span>
                                            </td>
                                            <!-- KM/H -->
                                            <td>
                                                <input type="text" id="driveStatCont" name="driveStatCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="operStat" name="operStat">
                                                    <spring:message code="ser.lbl.workState" />
                                                </span>
                                            </th>
                                            <!-- 작업상태 -->
                                            <td>
                                                <button type="button" id="operStatCd1" name="operStatCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.cooling" />
                                                </button>
                                            </td>
                                            <!-- 냉강 -->
                                            <td>
                                                <button type="button" id="operStatCd2" name="operStatCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.heatUp" />
                                                </button>
                                            </td>
                                            <!-- 열강 -->
                                            <td>
                                                <button type="button" id="operStatCd3" name="operStatCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.startUp" />
                                                </button>
                                            </td>
                                            <!-- 시동 -->
                                            <td>
                                                <button type="button" id="operStatCd4" name="operStatCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.airConOn" />
                                                </button>
                                            </td>
                                            <!-- 에어컨가동 -->
                                            <td>
                                                <input type="text" id="operStatCd5" name="operStatCd5" class="form_input ar form_input2"
                                                    min="1" maxlength="3" data-type="number" data-name="<spring:message code='ser.lbl.step' />"
                                                    style="width: 70%;" />
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.step" />
                                                </span>
                                            </td>
                                            <!-- 단계 -->
                                            <td>
                                                <input type="text" id="operStatCont" name="operStatCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                    </tbody>
                                </c:when>
                                <c:otherwise>
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                                <span id="roadTerm" name="roadTerm">
                                                    <spring:message code="ser.lbl.roadCondition" />
                                                </span>
                                            </th>
                                            <!-- 도로조건 -->
                                            <td>
                                                <button type="button" id="roadTermCd1" name="roadTermCd1" value="Y" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.highway" />
                                                </button>
                                            </td>
                                            <!-- 고속도로 -->
                                            <td>
                                                <button type="button" id="roadTermCd2" name="roadTermCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.asphalt" />
                                                </button>
                                            </td>
                                            <!-- asphalt -->
                                            <td>
                                                <button type="button" id="roadTermCd3" name="roadTermCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.cementRoad" />
                                                </button>
                                            </td>
                                            <!-- 시멘트 도로 -->
                                            <td>
                                                <button type="button" id="roadTermCd4" name="roadTermCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.stonyRoad" />
                                                </button>
                                            </td>
                                            <!-- 모래돌 도로 -->
                                            <td>
                                                <button type="button" id="roadTermCd5" name="roadTermCd5" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.soilRoad" />
                                                </button>
                                            </td>
                                            <!-- 흙 도로 -->
                                            <td>
                                                <input type="text" id="roadTermCont" name="roadTermCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="roadPrcn" name="roadPrcn">
                                                    <spring:message code="ser.lbl.roadState" />
                                                </span>
                                            </th>
                                            <!-- 도로현황 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd1" name="roadPrcnCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.ground" />
                                                </button>
                                            </td>
                                            <!-- 수평 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd2" name="roadPrcnCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.uphill" />
                                                </button>
                                            </td>
                                            <!-- 오름막 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd3" name="roadPrcnCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.downhill" />
                                                </button>
                                            </td>
                                            <!-- 내리막 -->
                                            <td>
                                                <button type="button" id="roadPrcnCd4" name="roadPrcnCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.sharpCurve" />
                                                </button>
                                            </td>
                                            <!-- 코너(급) -->
                                            <td>
                                                <button type="button" id="roadPrcnCd5" name="roadPrcnCd5" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.curve" />
                                                </button>
                                            </td>
                                            <!-- 코너(일반) -->
                                            <td>
                                                <input type="text" id="roadPrcnCont" name="roadPrcnCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="wetrTerm" name="wetrTerm">
                                                    <spring:message code="ser.lbl.weatherCondition" />
                                                </span>
                                            </th>
                                            <!-- 날씨조건 -->
                                            <td>
                                                <button type="button" id="wetrTermCd1" name="wetrTermCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.fineWeather" />
                                                </button>
                                            </td>
                                            <!-- 개임 -->
                                            <td>
                                                <button type="button" id="wetrTermCd2" name="wetrTermCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.windyWeather" />
                                                </button>
                                            </td>
                                            <!-- 바람 -->
                                            <td>
                                                <button type="button" id="wetrTermCd3" name="wetrTermCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.rainWeather" />
                                                </button>
                                            </td>
                                            <!-- 비 -->
                                            <td>
                                                <button type="button" id="wetrTermCd4" name="wetrTermCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.snowWeather" />
                                                </button>
                                            </td>
                                            <!-- 눈 -->
                                            <td>
                                                <input type="text" id="wetrTermCd5" name="wetrTermCd5" class="form_input ar form_input2"
                                                    maxlength="3" data-type="number" data-name="<spring:message code='ser.lbl.temperature' />"
                                                    style="width: 50%;">
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.temperature" />
                                                </span>
                                            </td>
                                            <!-- ℃ -->
                                            <td>
                                                <input type="text" id="wetrTermCont" name="wetrTermCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="occrFreq" name="occrFreq">
                                                    <spring:message code="ser.lbl.frequency" />
                                                </span>
                                            </th>
                                            <!-- 발생빈도 -->
                                            <td>
                                                <button type="button" id="occrFreqCd1" name="occrFreqCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.once" />
                                                </button>
                                            </td>
                                            <!-- 한번만 -->
                                            <td>
                                                <button type="button" id="occrFreqCd2" name="occrFreqCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.often" />
                                                </button>
                                            </td>
                                            <!-- 자주 -->
                                            <td>
                                                <button type="button" id="occrFreqCd3" name="occrFreqCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.reqular" />
                                                </button>
                                            </td>
                                            <!-- 정기적 -->
                                            <td>
                                                <button type="button" id="occrFreqCd4" name="occrFreqCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.occasionality" />
                                                </button>
                                            </td>
                                            <!-- 비정기적 -->
                                            <td>
                                                <input type="text" id="occrFreqCd5" name="occrFreqCd5" class="form_input ar form_input2"
                                                    data-type="number" min="1" data-name="<spring:message code='ser.lbl.repeat'/>" style="width: 50%;">
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.repeat" />
                                                </span>
                                            </td>
                                            <!-- 차수 -->
                                            <td>
                                                <input type="text" id="occrFreqCont" name="occrFreqCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="driveStat" name="driveStat">
                                                    <spring:message code="ser.lbl.driveState" />
                                                </span>
                                            </th>
                                            <!-- 운전상태 -->
                                            <td>
                                                <button type="button" id="driveStatCd1" name="driveStatCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.accelerateFast" />
                                                </button>
                                            </td>
                                            <!-- 가속(급) -->
                                            <td>
                                                <button type="button" id="driveStatCd2" name="driveStatCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.accelerate" />
                                                </button>
                                            </td>
                                            <!-- 가속(일반) -->
                                            <td>
                                                <button type="button" id="driveStatCd3" name="driveStatCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.suddenStop" />
                                                </button>
                                            </td>
                                            <!-- 감속(급) -->
                                            <td>
                                                <button type="button" id="driveStatCd4" name="driveStatCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.slowDown" />
                                                </button>
                                            </td>
                                            <!-- 감속(일반) -->
                                            <td>
                                                <input type="text" id="driveStatCd5" name="driveStatCd5" class="form_input ar form_input2"
                                                    data-type="number" min="1" maxlength="3" data-name="<spring:message code='ser.lbl.kmH' />"
                                                    style="width: 50%;">
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.kmH" />
                                                </span>
                                            </td>
                                            <!-- KM/H -->
                                            <td>
                                                <input type="text" id="driveStatCont" name="driveStatCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <span id="operStat" name="operStat">
                                                    <spring:message code="ser.lbl.workState" />
                                                </span>
                                            </th>
                                            <!-- 작업상태 -->
                                            <td>
                                                <button type="button" id="operStatCd1" name="operStatCd1" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.cooling" />
                                                </button>
                                            </td>
                                            <!-- 냉강 -->
                                            <td>
                                                <button type="button" id="operStatCd2" name="operStatCd2" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.heatUp" />
                                                </button>
                                            </td>
                                            <!-- 열강 -->
                                            <td>
                                                <button type="button" id="operStatCd3" name="operStatCd3" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.startUp" />
                                                </button>
                                            </td>
                                            <!-- 시동 -->
                                            <td>
                                                <button type="button" id="operStatCd4" name="operStatCd4" class="btn_s btn_s_v4 troble">
                                                    <spring:message code="ser.lbl.airConOn" />
                                                </button>
                                            </td>
                                            <!-- 에어컨가동 -->
                                            <td>
                                                <input type="text" id="operStatCd5" name="operStatCd5" class="form_input ar form_input2"
                                                    min="1" maxlength="3" data-type="number" data-name="<spring:message code='ser.lbl.step' />"
                                                    style="width: 50%;" />
                                                <span class="span_txt">
                                                    <spring:message code="ser.lbl.step" />
                                                </span>
                                            </td>
                                            <!-- 단계 -->
                                            <td>
                                                <input type="text" id="operStatCont" name="operStatCont" class="form_input form_input2" maxlength="100" />
                                            </td>
                                            <!-- 기타 -->
                                        </tr>
                                    </tbody>
                                </c:otherwise>
                            </c:choose>
                        </table>
                    </div>
                </div>
            </div>
            <!-- //고장설명 -->

            <!-- 내부검사 -->
            <div>
                <div class="preCheck_box">
                    <div class="left_area">
                        <div class="preChk_carImg inside_img">
                            <span class="preChk_icon J01"></span>
                            <!-- 클락션 -->
                            <span class="preChk_icon J02"></span>
                            <!-- 핸들 -->
                            <span class="preChk_icon J03"></span>
                            <!-- 계기판 -->
                            <span class="preChk_icon J04"></span>
                            <!-- 모니터 -->
                            <!-- 좌표 필요 -->
                            <span class="preChk_icon J05"></span>
                            <!-- 오디오 -->
                            <span class="preChk_icon J07"></span>
                            <!-- 트렁크 -->
                            <span class="preChk_icon J08"></span>
                            <!-- 시가잭 -->
                            <span class="preChk_icon J09"></span>
                            <!-- 기어핸들 -->
                            <span class="preChk_icon J10"></span>
                            <!-- 주차브레이크 -->
                            <span class="preChk_icon J11"></span>
                            <!-- 내부백미러 -->
                            <span class="preChk_icon J14"></span>
                            <!-- 선루프 -->
                            <span class="preChk_icon J15"></span>
                            <!-- 창문(좌앞) -->
                            <span class="preChk_icon J16"></span>
                            <!-- 창문(우앞) -->
                            <span class="preChk_icon J17"></span>
                            <!-- 창문(좌뒤) -->
                            <span class="preChk_icon J18"></span>
                            <!-- 창문(우뒤) -->
                            <span class="preChk_icon J23"></span>
                            <!-- 밸트 -->
                            <span class="preChk_icon J19"></span>
                            <!-- 좌석(좌앞) -->
                            <span class="preChk_icon J20"></span>
                            <!-- 좌석(우앞) -->
                            <span class="preChk_icon J21"></span>
                            <!-- 좌석(좌뒤) -->
                            <span class="preChk_icon J22"></span>
                            <!-- 좌석(우뒤) -->
                            <span class="preChk_icon J13"></span>
                            <!-- 바퀴 및 타이어 -->
                            <span class="preChk_icon J12"></span>
                            <!-- OVM공구 -->
                            <!-- 좌표 필요 -->
                            <span class="preChk_icon J06"></span>
                            <!-- 에어컨 -->
                        </div>
                    </div>
                    <div class="right_area">
                        <div class="table_form table_preChk">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <button type="button" id="J01" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="global.lbl.clockLine" />
                                                <!--클락션-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J02" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.lever" />
                                                <!--핸들-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J03" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.dashBoard" />
                                                <!--계기판-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J04" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.monitor" />
                                                <!--모니터-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J05" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.audio" />
                                                <!--오디오-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="J07" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.trunk" />
                                                <!--트렁크-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J08" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.cigarJack" />
                                                <!--시가잭-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J09" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.gearHander" />
                                                <!--기어핸들-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J10" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.parkingBrake" />
                                                <!--주차브레이크-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J11" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.insideBackMirror" />
                                                <!--내부백미러-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="J14" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.sunroof" />
                                                <!--선루프-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J15" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.leftFrontSash" />
                                                <!--창문(좌앞)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J16" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="global.lbl.rightFrontSash" />
                                                <!--창문(우앞)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J17" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.leftAfterSash" />
                                                <!--창문(좌뒤)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J18" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.rightAfterSash" />
                                                <!--창문(우뒤)-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="J23" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.belt" />
                                                <!--밸트-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J19" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.leftFrontSeat" />
                                                <!--좌석(좌앞)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J20" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="global.lbl.rightFrontSeat" />
                                                <!--좌석(우앞)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J21" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.leftAfterSeat" />
                                                <!--좌석(좌뒤)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J22" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.rightAfterSeat" />
                                                <!--좌석(우뒤)-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="J13" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.tire" />
                                                <!--바퀴 및 타이어-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J12" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.ovmTool" />
                                                <!--OVM공구-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="J06" class="btn_s btn_s_v4 preChk btn_active_normal btn_jList">
                                                <spring:message code="ser.lbl.airCon" />
                                                <!--에어컨-->
                                            </button>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="table_form table_preChk table_preChk_v1">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: 30%;">
                                    <col style="width: 20%;">
                                    <col style="width: 30%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <spring:message code="global.lbl.fuelvolume" />
                                            <!-- 연료량 -->
                                        </th>
                                        <td colspan="3">
                                            <div class="clfix" id="I01" name="I01">
                                                <button type="button" class="btn_s btn_s_v4 btn_oil">0</button>
                                                <button type="button" class="btn_s btn_s_v4 btn_oil btn_active_error">1/4</button>
                                                <button type="button" class="btn_s btn_s_v4 btn_oil">2/4</button>
                                                <button type="button" class="btn_s btn_s_v4 btn_oil">3/4</button>
                                                <button type="button" class="btn_s btn_s_v4 btn_oil">4/4</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="vt">
                                            <spring:message code="global.lbl.dashboardsign" />
                                            <!-- 계기판표시 -->
                                        </th>
                                        <td colspan="3">
                                            <div class="clfix">
                                                <a href="javascript:;" id="I02" name="I02" class="preChk_img I02 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I03" name="I03" class="preChk_img I03 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I04" name="I04" class="preChk_img I04 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I05" name="I05" class="preChk_img I05 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I06" name="I06" class="preChk_img I06 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I07" name="I07" class="preChk_img I07 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I08" name="I08" class="preChk_img I08 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I09" name="I09" class="preChk_img I09 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I10" name="I10" class="preChk_img I10 btn_iList"><span></span>
                                                </a>
                                            </div>
                                            <div class="clfix mt5">
                                                <a href="javascript:;" id="I11" name="I11" class="preChk_img I11 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I12" name="I12" class="preChk_img I12 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I13" name="I13" class="preChk_img I13 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I14" name="I14" class="preChk_img I14 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I15" name="I15" class="preChk_img I15 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I16" name="I16" class="preChk_img I16 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I17" name="I17" class="preChk_img I17 btn_iList"><span></span>
                                                </a>
                                                <a href="javascript:;" id="I18" name="I18" class="preChk_img I18 btn_iList"><span></span>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //내부검사 -->

            <!-- 외부검사 -->
            <div>
                <div class="preCheck_box">
                    <div class="left_area carBody_left" id="carBody_left" style="width: 520px;">
                        <div class="carBody_area" id="carBody_area" style="width: 520px;">
                            <div class="carBody_img_t"></div>
                            <div class="carBody_Chk">
                                <img src="<c:url value='/resources/img/wa/bg_carbody_r.png' />" alt="" usemap="#map">
                                <map name="map" id="carBodyChk">
                                    <area shape="poly" coords="5,133,4,158,14,162,12,260,2,262,3,286,64,290,92,274,114,288,176,289,186,306,157,319,101,332,83,355,80,388,84,400
                                                                ,111,402,126,415,140,419,162,412,173,404,322,405,338,418,359,419,380,401,421,390,426,359,420,346,415,317,386,310
                                                                ,334,286,410,279,427,277,436,284,510,288,513,266,497,257,497,163,512,158,509,142,509,131,434,136,332,131,382,110
                                                                ,415,104,422,71,426,62,424,29,383,17,362,3,342,2,321,15,172,15,156,2,135,2,118,4,113,14,82,20,79,57,85,66,98,82
                                                                ,161,98,184,111,178,131,114,132,96,147,64,131">
                                </map>
                            </div>
                        </div>
                    </div>
                    <div class="right_area carBody_right" style="margin-left: 520px;">
                        <div class="carBody_btn carBody_btn_status">
                            <button type="button" id="checkErrFl01" name="check_errFl" onclick="fncCheckErrFl(this);" class="btn_cb btn_ok btn_active">
                                <em></em>
                                OK
                            </button>
                            <button type="button" id="checkErrFl02" name="check_errFl" onclick="fncCheckErrFl(this);" class="btn_cb btn_error">
                                <em></em>
                                <spring:message code="ser.btn.problem" />
                            </button>
                            <!--이상-->
                            <button type="button" id="checkUse01" name="check_use" onclick="fncCheckUse(this);" disabled class="btn_cb btn_back">
                                <em></em>
                                Back
                            </button>
                            <button type="button" id="checkUse02" name="check_use" onclick="fncCheckUse(this);" disabled class="btn_cb btn_write">
                                <em></em>
                                <spring:message code="global.btn.writebtn" />
                            </button>
                            <!--작성-->
                            <button type="button" id="checkUse03" name="check_use" onclick="fncCheckUse(this);" disabled class="btn_cb btn_modify">
                                <em></em>
                                <spring:message code="global.btn.update" />
                            </button>
                            <!--수정-->
                        </div>
                        <div class="carBody_btn">
                            <button type="button" id="checkErrType01" name="check_errType" onclick="fncCheckErrType(this);" disabled class="btn_cb btn_scratch">
                                <em></em>
                                <spring:message code="wa.lbl.scratch" />
                            </button>
                            <!--긁힘-->
                            <button type="button" id="checkErrType02" name="check_errType" onclick="fncCheckErrType(this);" disabled class="btn_cb btn_damage">
                                <em></em>
                                <spring:message code="wa.lbl.destroy" />
                            </button>
                            <!--파손-->
                            <button type="button" id="checkErrType03" name="check_errType" onclick="fncCheckErrType(this);" disabled class="btn_cb btn_hollow">
                                <em></em>
                                <spring:message code="wa.lbl.dug" />
                            </button>
                            <!--움폭 파임-->
                            <br>
                            <button type="button" id="checkErrType04" name="check_errType" onclick="fncCheckErrType(this);" disabled class="btn_cb btn_paint">
                                <em></em>
                                <spring:message code="wa.lbl.paintbad" />
                            </button>
                            <!--페인트벗겨짐-->
                            <button type="button" id="checkErrType05" name="check_errType" onclick="fncCheckErrType(this);" disabled class="btn_cb btn_crack">
                                <em></em>
                                <spring:message code="ser.lbl.crack" />
                            </button>
                            <button type="button" id="checkErrType06" name="check_errType" onclick="fncCheckErrType(this);" disabled class="btn_cb btn_other">
                                <em></em>
                                <spring:message code="global.lbl.other" />
                            </button>
                            <!--기타-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- //외부검사 -->
            <!-- 엔진룸 검사 -->
            <div>
                <div class="preCheck_box">
                    <div class="left_area" style="width: 415px;">
                        <div class="preChk_carImg engineRoom_img"></div>
                    </div>
                    <div class="right_area" style="margin-left: 415px;">
                        <div class="table_form table_preChk">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 33%;">
                                    <col style="width: 34%;">
                                    <col style="width: 33%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <button type="button" id="K01" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.enginOilPosition" />
                                                <!--엔진오일 위치-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="K02" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.enginOilQuality" />
                                                <!--엔진오일 품질-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="K03" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.enginCoolant" />
                                                <!--엔진 COOLANT-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="K04" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.breakOil" />
                                                <!--제동기 오일-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="K05" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.powerSteeringOil" />
                                                <!--POWER STEERING 오일-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="K06" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.screenWash" />
                                                <!--워셔액-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="K07" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.airConditioner" />
                                                <!--에어컨-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="K08" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.radiator" />
                                                <!--라디에이터-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="K09" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.battery" />
                                                <!--배터리-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="K10" class="btn_s btn_s_v4 btn_kList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.driveBelt" />
                                                <!--벨트류-->
                                            </button>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //엔진룸 검사 -->
            <!-- 조명검사 -->
            <div>
                <div class="preCheck_other">
                    <div class="table_form table_preChk">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width: 16%;">
                                <col style="width: 17%;">
                                <col style="width: 17%;">
                                <col style="width: 17%;">
                                <col style="width: 17%;">
                                <col style="width: 16%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        <button type="button" id="M01" name="M01" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.frontLightS" />
                                        </button>
                                    </td>
                                    <!-- 전조등(하향) -->
                                    <td>
                                        <button type="button" id="M02" name="M02" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.frontLightL" />
                                        </button>
                                    </td>
                                    <!-- 전조등(상향) -->
                                    <td>
                                        <button type="button" id="M03" name="M03" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.frontLightF" />
                                        </button>
                                    </td>
                                    <!-- 전조등(점멸) -->
                                    <td>
                                        <button type="button" id="M04" name="M04" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.frontFogLight" />
                                        </button>
                                    </td>
                                    <!-- 앞안개등 -->
                                    <td>
                                        <button type="button" id="M05" name="M05" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.frontTurnLeft" />
                                        </button>
                                    </td>
                                    <!-- 앞방향등(좌,우) -->
                                    <td>
                                        <button type="button" id="M19" name="M19" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.frontTurnLight" />
                                        </button>
                                    </td>
                                    <!-- 앞방향등(좌,우) -->
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" id="M07" name="M07" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.rearFogLight" />
                                        </button>
                                    </td>
                                    <!-- 후방안개등 -->
                                    <td>
                                        <button type="button" id="M08" name="M08" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.reverseLight" />
                                        </button>
                                    </td>
                                    <!-- 후진등 -->
                                    <td>
                                        <button type="button" id="M09" name="M09" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.plateLight" />
                                        </button>
                                    </td>
                                    <!-- 번호판등 -->
                                    <td>
                                        <button type="button" id="M10" name="M10" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.brakeLight" />
                                        </button>
                                    </td>
                                    <!-- 제동등 -->
                                    <td>
                                        <button type="button" id="M11" name="M11" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.rearTurnLeft" />
                                        </button>
                                    </td>
                                    <!-- 뒤방향등(좌) -->
                                    <td>
                                        <button type="button" id="M20" name="M20" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.rearTurnLight" />
                                        </button>
                                    </td>
                                    <!-- 뒤방향등(우) -->
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" id="M13" name="M13" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.readLight" />
                                        </button>
                                    </td>
                                    <!-- 독서등 -->
                                    <td>
                                        <button type="button" id="M14" name="M14" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.makeupLight" />
                                        </button>
                                    </td>
                                    <!-- 화장거울등(옵션) -->
                                    <td>
                                        <button type="button" id="M15" name="M15" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.gloveboxLight" />
                                        </button>
                                    </td>
                                    <!-- 글러브박스등 -->
                                    <td>
                                        <button type="button" id="M16" name="M16" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.insideLight" />
                                        </button>
                                    </td>
                                    <!-- 실내천장등 -->
                                    <td>
                                        <button type="button" id="M17" name="M17" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.dashBTurnLight" />
                                        </button>
                                    </td>
                                    <!-- 계기판 지시등 -->
                                    <td>
                                        <button type="button" id="M18" name="M18" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.trunkLight" />
                                        </button>
                                    </td>
                                    <!-- 트렁크등 -->
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" id="M06" name="M06" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.sideLight" />
                                        </button>
                                    </td>
                                    <!--차폭등 -->
                                    <td>
                                        <button type="button" id="M12" name="M12" class="btn_s btn_s_v4 btn_mList preChk btn_active_normal">
                                            <spring:message code="ser.lbl.alertLight" />
                                        </button>
                                    </td>
                                    <!-- 위험경고등 -->
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- //조명검사 -->
            <!-- 하부검사 -->
            <div>
                <div class="preCheck_box">
                    <div class="left_area">
                        <div class="preChk_carImg bottom_img"></div>
                    </div>
                    <div class="right_area">
                        <div class="table_form table_preChk">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 25%;">
                                    <col style="width: 25%;">
                                    <col style="width: 25%;">
                                    <col style="width: 25%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <button type="button" id="N01" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.underWOleak" />
                                                <!--하부누수 및 누유-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N02" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.tierodConD" />
                                                <!--조항장치상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N03" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.tierodCoverConD" />
                                                <!--타이로드 먼지커버상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N04" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.tierodChainLConD" />
                                                <!--타이로드 체인링크상태-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="N05" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.tierodLowerAConD" />
                                                <!--타이로드 로어망-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N06" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.driveCovConD" />
                                                <!--구동축과 먼지커버상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N07" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.missionBerConD" />
                                                <!--변속기 및 베어링상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N08" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.frontSusConD" />
                                                <!--앞현가장치(링크, 볼조인트)-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="N09" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.rearSusConD" />
                                                <!-- 뒤현가장치(링크, 볼조인트)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N10" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.damperConD" />
                                                <!--댐퍼상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N11" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.susBoltConD" />
                                                <!--현가장비 볼트상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N12" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.mufflerConD" />
                                                <!--배기관설치-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="N13" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.carbonCaniConD" />
                                                <!-- 활성캐니스터상태 -->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N14" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.brkLineConD" />
                                                <!--브레이크라인 호스연결부-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N15" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.brkpistonConD" />
                                                <!--브레이크 피스톤 및 볼트-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N16" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.diskBrkConD" />
                                                <!--디스크 브레이크 상태-->
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" id="N17" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.brkPadConD" />
                                                <!-- 브레이크패드 마모 및 손상 -->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N18" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.wheelConD" />
                                                <!--휠상태-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N19" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.tireConD" />
                                                <!--타이어마모 및 손상(트레이)-->
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="N20" class="btn_s btn_s_v4 btn_nList preChk btn_active_normal">
                                                <spring:message code="ser.lbl.tireairConD" />
                                                <!--타이어 공기압 검사-->
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //하부검사 -->
            <!-- 수리건의-->
            <div class="mt0" style="height: 261px;">
                <div class="mt10">
                    <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrSuggest.jsp" />
                </div>
            </div>
            <!-- //수리건의 -->
        </div>
        <div class="preCheck_bottom" style="height: inherit; padding: 9px">
            <div class="opinion_area" style="width: 100%; float: left; margin-right: 0px; border-right: 0px; padding: 0px">
                <input id="open_saInput" class="txt_area" placeholder="<spring:message code='ser.lbl.preChkRemark' />" style="width: 100%">
                <!-- 사전점검비고 -->
            </div>
            <div class="img_area" style="width: 100%; float: left">
                <ul class="sImg_slider">
                </ul>
            </div>
        </div>
        <!-- //사전점검 -->
        <!-- 요청내용 -->
        <section id="window_sa" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button class="btn_m" id="save_open_saInput">
                        <spring:message code="global.btn.save" />
                    </button>
                </div>
            </div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 100%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>
                                <textarea rows="6" cols="" class="form_textarea" id="open_saInput_textarea"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- img_slider 팝업 -->
        <section id="window_img" class="pop_wrap">
            <div class="imgSlider_wrap wa_imgSlider">
                <div class="imgSlider_scrollbox">
                    <ul class="bImg_slider"></ul>
                </div>
            </div>
        </section>
        <!-- tjx 平板转维修委托后与pc差异端未传参数 start-->
    	<input type="hidden" id="tecId" name="tecId" data-json-obj="true" />
        <input type="hidden" id="tecNm" name="tecNm" data-json-obj="true" />
        <input type="hidden" id="saId" name="saId" data-json-obj="true" />
        <input type="hidden" id="saNm" name="saNm" data-json-obj="true" />
        <input type="hidden" id="roGrpNo" name="roGrpNo" data-json-obj="true" />
        <input type="hidden" id="roDocNo" name="roDocNo" />
        <input type="hidden" id="resvDocNo" name="resvDocNo" data-json-obj="true" />
        <input type="hidden" id="custRemark" name="custRemark" data-json-obj="true" />
        <!-- tjx 平板转维修委托后与pc差异端未传参数  end-->
        <!-- 파일 -->
        <input type="hidden" id="fileKeyNm" name="fileKeyNm" data-json-obj="true" />
        <input type="hidden" id="fileKeyNm2" name="fileKeyNm2" data-json-obj="true" />
        <input type="hidden" id="fileKeyNm3" name="fileKeyNm3" data-json-obj="true" />
        <div id="imgDataSig" style="width: 960px; word-wrap: break-word; text-align: center; display: none;"></div>
    </div>
</form>
<div class="header_area" style="margin-top: 60px;margin-right: 20px;"> <!-- 变更PAD“维修委托”按钮位置 -->
    <div class="btn_right">
        <dms:access viewId="VIEW-D-11592" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnPwaHistPopup" class="btn_m btn_link" disabled>PWA</button>
            <!-- PWA -->
        </dms:access>
        <dms:access viewId="VIEW-D-11593" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_roCreate btn_s_min5" id="btnRoReq" disabled>
                <spring:message code="ser.btn.roInsert" />
            </button>
            <!--RO-->
        </dms:access>
    </div>
</div>
<!-- 更改PAD端签字模版，目的：为解决pc端签子不清楚  贾明2018-8-22 start -->
<style>
 .m-signature-pads {
  position: absolute;
  font-size: 10px;
  width: 400px;
  height: 210px;
  top: 50%;
  left: 50%;
  margin-left: -350px;
  margin-top: -200px;
  border: 1px solid #e8e8e8;
  background-color: #fff;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.08) inset;
  border-radius: 4px;
}

.m-signature-pad--bodys {
  position: absolute;
  left: 20px;
  right: 20px;
  top: 20px;
  bottom: 60px;
  border: 1px solid #f4f4f4;
}

.m-signature-pad--bodys
  canvas {
    position: absolute;
    left: 0;
    top: 0;
    width: 360px;
    height: 200px;
    border-radius: 4px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.02) inset;
  }

</style>
<!-- 更改PAD端签字模版，目的：为解决pc端签子不清楚  贾明2018-8-22 end -->
<!-- 싸인 -->
<div id="signature-pad" class="m-signature-pads" style="display: none; z-index: 9999;">
    <div class="m-signature-pad--bodys">
        <canvas></canvas>
    </div>
    <div class="m-signature-pad--footer">
        <button data-action="clear" type="button" class="btn_m">
            <spring:message code="global.btn.cancel" />
        </button>
        <button data-action="save" type="button" class="btn_m">
            <spring:message code="global.btn.save" />
        </button>
        <button data-action="closeSig" type="button" class="btn_m">
            <spring:message code="global.btn.close" />
        </button>
    </div>
</div>

<!-- 우측 메뉴 간반보드 공통 페이지 -->
<c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp" />
<!-- 우측 메뉴 간반보드 공통 페이지 -->

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">
    var captrueData = null;
    var pdiChkList = [];

    <c:forEach var="obj" items="${pdiChkList}">
    pdiChkList.push({
        "chkCd" : "${obj.carChkAtcCd}",
        "chkTpCd" : "${obj.carTpCd}"
    });
    </c:forEach>

    var selectedTabId = "CQ";

    /*-- selectCustCarInfomMain.jsp [init] [Start] */
    var vehOfCustInfoSearchPopup;
    var campaignInfoSearchPopup;
    var sanBaoAlarmPopup;
    var custInfoRegPopup;

    var preFixId = "${preFixId}";

    /** 캠페인 유형 **/
    var crTpList = [];
    <c:forEach var="obj" items="${campaignDs}">
    crTpList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>
    var crTpMap = dms.data.arrayToMap(crTpList, function(obj) {
        return obj.cmmCd;
    });

    /** 브랜드 코드 **/
    var brandCdList = [];
    <c:forEach var="obj" items="${brandCdDs}">
    brandCdList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>

    var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj) {
        return obj.cmmCd
    });

    /** 증서유형 코드 **/
    var mathDocTpList = [];
    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>
    var mathDocTpMap = dms.data.arrayToMap(mathDocTpList, function(obj) {
        return obj.cmmCd
    });

    /** 메인연락방식 코드 **/
    var prefContactMthCdList = [];
    <c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>
    var prefContactMthCdMap = dms.data.arrayToMap(prefContactMthCdList, function(obj){return obj.cmmCd});

    /** 메인연락시간 코드 **/
    var prefContactTimeCdList = [];
    <c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>
    var prefContactTimeCdMap = dms.data.arrayToMap(prefContactTimeCdList,function(obj){return obj.cmmCd});

    var sexCdList = [];
    <c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>
    var sexCdMap = dms.data.arrayToMap(sexCdList, function(obj){return obj.cmmCd});

    //브랜드 코드
    ///증서유형
    //메인연락방식 코드
    //메인연락시간 코드
    //캠페인유형
    crTpCdGrid = function(val) {
        var returnVal = "";
        if(val != null && val != "") {
            if(crTpMap[val] != undefined){
                returnVal = crTpMap[val].cmmCdNm;
            }
        }
        return returnVal;
    }

    //캠페인유형
    sexCdGrid = function(val) {
        var returnVal = "";
        if(val != null && val != "") {
            if (sexCdMap[val] != undefined)
                returnVal = sexCdMap[val].cmmCdNm;
        }
        return returnVal;
    }

    var diagStatCdList = [];
    <c:forEach var="obj" items="${diagStatCdList}">
    diagStatCdList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}"
    });
    </c:forEach>

    //고객전화표시여부
    var custTelYnValue;
    <c:forEach var="obj" items="${custTelYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    custTelYnValue = "${obj.cmmCd}";
    </c:if>
    </c:forEach>

    var sysDate = new Date("<c:out value='${sysDate}' />");

    var defaultImgUrl = '<img src="<c:url value='/resources/img/wa/img_carbody_r.png'/>" style="width:306px;" alt="">';

    var imageSearchPopupWin;

    //공통코드:RO유형
    var roTpCdList = [];
    <c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({
        "cmmCd" : "${obj.cmmCd}",
        "cmmCdNm" : "${obj.cmmCdNm}",
        "useYn" : "${obj.useYn}"
    });
    </c:forEach>
    var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});
    /*-- selectCustCarInfomMain.jsp [init] [End] */

    var preFixTp = "${preFixTp}";
    $(document).ready(function(){
        var editYn = true;
        if (preFixTp == "ROSTATUS") {
            editYn = false;
        }

        $(".preCheck_tab > div").each(function(inx, obj) {
            $(obj).height(430);
            $(obj).find(".left_area").height(430);
            $(obj).find(".grid").height(430);
        });

        /** 요청사항 추가  **/
        $("#custAdd").kendoButton({
            click : function(e) {
                var grid = $("#custRemarkGrid").data("kendoExtGrid");
                var length = grid.dataSource.data().length;
                if (length > 0) {
                    length = length - 1;
                }
                var data = grid.dataItem("tr:eq("+ length + ")");

                if (dms.string.isNotEmpty(data.custReqCont)) {
                    custDemandAdd();
                }
            }
        });

        /** 요청사항 삭제  **/
        $("#custDel").kendoButton({
            click : function(e) {
                var grid = $("#custRemarkGrid").data("kendoExtGrid");
                var rows = grid.select();
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        // 고객요청사항 그리드
        $("#custRemarkGrid").kendoExtGrid({
            dataSource : {
                transport : {
                    read : {
                        url : "<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                    },
                    parameterMap : function(options, operation) {
                        if (operation == "read") {
                            // 검색 조건을 파라미터로 담는다.
                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;
                            params["sPreFixId"] = tabInfoPreFixId;
                            params["sJobNo"] = tabInfoJobNo;
                            return kendo.stringify(params);
                        }else if(operation != "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }//parameterMap
                },//transport
                schema : {
                    model : {
                        id : "lineNo",
                        fields : {
                            lineNo : {
                                type : "number",
                                editable : false
                            },
                            custReqCont : {
                                type : "string",
                                editable : true
                            },
                            preFixId : {
                                type : "string",
                                editable : false
                            },
                            dlrCd : {
                                type : "string",
                                editable : false
                            }
                        }
                    }
                //model
                }
            //schema
            },//dataSource
            height : 430,
            pageable : false,
            autoBind : false,
            sortable : false,
            editable : editYn,
            editable : {
                confirmation : false
            },
            enableTooltip : true, //Tooltip 적용, default:false
            filterable : false, // 필터링 기능 사용안함
            resizable : false,
            edit : function(e) {
                if (preFixTp == "ROSTATUS") {
                    this.closeCell();
                }
            },
            dataBound : function() {
                var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
                if (grid.data().length <= 0) {
                    custDemandAdd();
                }
                $("td[role='gridcell']").css("padding", "0px");
            },
            columns : [
                    {
                    field : "lineNo",
                    title : "<spring:message code='ser.lbl.custReqCd' />",
                    width : 50,
                    attributes : {"class" : "ac"}
                    },
                    {
                    field : "custReqCont",
                    title : "<spring:message code='ser.lbl.reqCont' />",
                    width : 400
                    },
                    {
                    field : "preFixId",
                    title : "preFixId",
                    hidden : true,
                    width : 100
                    },
                    {
                    field : "dlrCd",
                    title : "dlrCd",
                    hidden : true,
                    width : 100
                    } ]
        });

        var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
        if (grid.data().length <= 0) {
            custDemandAdd();
        }

        // RO유형
        roTpCdGrid = function(val) {
            var returnVal = "";
            if (val != null && val != "") {
                if (roTpCdArr[val] != undefined)
                    returnVal = roTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        };

        $(".oil_25p").addClass("oil_active1");

        /********************** 초기 데이터  설정 ***************************/

        //공통코드:정비유형(수리유형)
        var lbrTpCdList = []; //기본 수리유형
        var lbrTpCdList2 = []; //보증수리용 수리유형
        var lbrTpCdList3 = []; //딜러 공임 전용 수리유형
        var lbrTpCdList4 = []; //BHMC 공임 전용 수리유형
        <c:forEach var="obj" items="${lbrTpCdList}">
        <c:if test="${obj.remark1 eq '02'}">
        lbrTpCdList2.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:if>
        <c:if test="${obj.remark2 eq 'E'}">
        lbrTpCdList4.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:if>
        lbrTpCdList3.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        lbrTpCdList.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:forEach>
        var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj) {return obj.cmmCd;});

        //공통코드:예약상태
        var resvStatList = [];
        <c:forEach var="obj" items="${resvStatDs}">
        resvStatList.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:forEach>
        var resvStatMap = dms.data.arrayToMap(resvStatList, function(obj) {return obj.cmmCd;});

        // 정비유형(수리유형)
        lbrTpCdGrid = function(val) {
            var returnVal = "";
            if (val != null && val != "") {
                if (lbrTpCdArr[val] != undefined)
                    returnVal = lbrTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        };

        // 예약상태
        setResvStatMap = function(value) {
            var resultVal = "";
            if (dms.string.isNotEmpty(value)) {
                if (resvStatMap[value] != undefined)
                    resultVal = resvStatMap[value].cmmCdNm;
            }
            return resultVal;
        };

        //공통코드:입고점검유형
        var carAcptTpList = [];
        <c:forEach var="obj" items="${carAcptTp}">
        <c:if test="${obj.useYn eq 'Y'}">
        carAcptTpList.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:if>
        </c:forEach>
        var carAcptTpMap = dms.data.arrayToMap(carAcptTpList, function(obj) {return obj.cmmCd;});

        // 입고점검유형
        setCarAcptTpMap = function(value) {
            var resultVal = "";
            if (dms.string.isNotEmpty(value)) {
                if (carAcptTpMap[value] != undefined)
                    resultVal = carAcptTpMap[value].cmmCdNm;
            }
            return resultVal;
        };

        //입고유형 dropDownList
        $("#carAcptTp").kendoExtDropDownList({
            dataTextField : "cmmCdNm",
            dataValueField : "cmmCd",
            dataSource : carAcptTpList,
            change : function(e) {
                var selectVal = this.value();
                if (selectVal == '02') {
                    var diagStatCd = $("#diagStatCd").data("kendoExtDropDownList").value();
                    if (dms.string.strNvl(diagStatCd) === "O") {
                        $(".btn_roCreate").data("kendoButton").enable(true);
                    }
                } else {
                    $(".btn_roCreate").data("kendoButton").enable(false);
                }
            }
        });

        //사전점검상태 dropDownList
        $("#diagStatCd").kendoExtDropDownList({
            dataTextField : "cmmCdNm",
            dataValueField : "cmmCd",
            dataSource : diagStatCdList,
            optionLabel : " "
        });

        /********************** 초기 데이터  설정 ***************************/
        $("#_overlay").hide();

        //sa kendowindow open
        var mTarget;

        //khs 싸인 sign
        var _wrapper = document.getElementById("signature-pad"),
            clearButton = _wrapper.querySelector("[data-action=clear]"),
            saveButton = _wrapper.querySelector("[data-action=save]"),
            closeSigButton = _wrapper.querySelector("[data-action=closeSig]"),
            canvas = _wrapper.querySelector("canvas"), signaturePad;

        clearButton.addEventListener("click", function(event) {
            signaturePad.clear();
        });

        saveButton.addEventListener("click",function(event) {
            if (signaturePad.isEmpty()) {
                dms.notification.info("<spring:message code='ser.lbl.sign' var='_sign' /><spring:message code='par.info.issueCheckMsg' arguments='${_sign}' />");
            } else {
                //window.open(signaturePad.toDataURL());
                $("#_overlay").show();
                var sigData = signaturePad.toDataURL("image/png");
                $("#imgDataSig").text(sigData);
                storedSignImage();
            }
        });

        closeSigButton.addEventListener("click",function(event) {
            $("#signature-pad").hide();
        });

        $("#openSign").kendoButton({
            click : function(e) {
                $("#signature-pad").show();
                function resizeCanvas() {
                    var ratio = Math.max(window.devicePixelRatio || 1, 1);
                    canvas.width = canvas.offsetWidth * ratio;
                    canvas.height = canvas.offsetHeight * ratio;
                    canvas.getContext("2d").scale(ratio, ratio);
                }
                window.onresize = resizeCanvas;
                resizeCanvas();
                signaturePad = new SignaturePad(canvas);
            },
            enable : false
        });
        //khs 싸인 sign

        //요청사항, 수리건의비고 입력팝업
        $("#save_open_saInput").click(function() {
            var win = $("#window_sa").data("kendoWindow");
            var td = $(".mTarget")[0];
            var tr = $(td).closest("tr")[0];
            var grid = $(tr).closest(".k-grid").data("kendoExtGrid");
            var dataItem = grid.dataItem(tr);

            dataItem[popupCellColumnNm] = $("#open_saInput_textarea").val();    //popupCellColumnNm은 dms.tablet-common-1.0.js에 할당
            $(td).text($("#open_saInput_textarea").val());
            $(".mTarget").removeClass("mTarget");
            win.close();
        });

        //사진촬영 클릭
        $("#takePicture").click(function() {
            drawTakePircute();
        });

        $("#initField").click(function() {
            $("#carRegNo").val("");
            $("#modelNm").val("");
            $("#carOwnerNm").val("");
            $("#carOwnerHpNo").val("");
            $(".sImg_slider").html("");
            initAll();
        });

        //kendoExtTabStrip
        $(".tab_area").kendoExtTabStrip({
            animation : false,
            select : function(e) {
                captrue();
                selectedTabId = e.item.id;
                var kendoTab = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                if (selectedTabId == "RD" || selectedTabId == "C2" || selectedTabId == "LS" || selectedTabId == "CQ") {
                    $("#btn_status_check").css("display", "none");
                } else {
                    $("#btn_status_check").css("display", "block");
                }
            }
        });

        //상단 상태 버튼
        $("#btn_status_check > .btn_m").on("click", function() {
            $("#btn_status_check > .btn_m").removeClass("btn_active");
            $(this).addClass("btn_active");
        });

        //내부, 엔진룸, 타이어&하부검사 - 버튼
        $(".preChk").on("click", function() {
            var class_name = $(this).attr("id");
            var tr_num = $(this).parents("tr").index();
            var td_num = $(this).parent("td").index();
            if ($(".btn_m_warning").hasClass("btn_active")) {
                $(this).removeClass("btn_active_normal btn_active_error")
                        .addClass("btn_active_warning");
                $(".preChk_carImg>.preChk_icon." + class_name).removeClass("ico_active_error")
                                                                .addClass("ico_active_warning").show();
            } else if ($(".btn_m_error").hasClass("btn_active")) {
                $(this).removeClass("btn_active_normal btn_active_warning")
                        .addClass("btn_active_error");
                $(".preChk_carImg>.preChk_icon." + class_name).removeClass("ico_active_warning")
                                                                .addClass("ico_active_error").show();
            } else if ($(".btn_m_normal").hasClass("btn_active")) {
                $(this).removeClass("btn_active_warning btn_active_error")
                        .addClass("btn_active_normal");
                $(".preChk_carImg>.preChk_icon." + class_name).removeClass("ico_active_warning ico_active_error").hide();
            }
        });

        //내부 - 연료량 버튼
        $(".btn_oil").on("click", function() {
            $(".btn_oil").removeClass("btn_active_error");
            $(this).addClass("btn_active_error");
        });

        //내부 - 아이콘
        $(".preChk_img").on("click", function() {
            if ($(".btn_m_warning").hasClass("btn_active")) {
                $(this).removeClass("ico_active_normal ico_active_error");
                $(this).toggleClass("ico_active_warning");
            } else if ($(".btn_m_error").hasClass("btn_active")) {
                $(this).removeClass("ico_active_normal ico_active_warning");
                $(this).toggleClass("ico_active_error");
            } else {
                $(this).removeClass("ico_active_warning ico_active_error");
                $(this).toggleClass("ico_active_normal");
            }
        });

        //기타사항 - 버튼
        $(".btn_s.btn_s_v4.troble").on("click", function() {
            $(this).toggleClass("btn_active");
        });

        //sa kendowindow 요구사항
        $("#window_sa").kendoWindow({
            animation : false,
            draggable : false,
            modal : true,
            resizable : false,
            visible : false,
            width : "400px"
        }).data("kendoWindow");

        //img kendowindow
        $("#window_img").kendoWindow({
            animation : false,
            draggable : false,
            modal : true,
            resizable : false,
            visible : false,
            title : "<spring:message code='sal.lbl.image' />", //이미지
            width : "712px"
        }).data("kendoWindow");

        //공통코드:예약상태
        var resvStatList = [];
        <c:forEach var="obj" items="${resvStatDs}">
        resvStatList.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:forEach>
        var resvStatMap = dms.data.arrayToMap(resvStatList, function(obj) {return obj.cmmCd});

        // 예약상태
        setResvStatMap = function(value) {
            var resultVal = "";
            if (dms.string.isNotEmpty(value)) {
                if (resvStatMap[value] != undefined)
                    resultVal = resvStatMap[value].cmmCdNm;
            }
            return resultVal;
        };

        //공통코드:입고점검유형
        var carAcptTpList = [];
        <c:forEach var="obj" items="${carAcptTp}">
        carAcptTpList.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:forEach>
        var carAcptTpMap = dms.data.arrayToMap(carAcptTpList, function(obj) {return obj.cmmCd});

        // 입고점검유형
        setCarAcptTpMap = function(value) {
            var resultVal = "";
            if (dms.string.isNotEmpty(value)) {
                if (carAcptTpMap[value] != undefined)
                    resultVal = carAcptTpMap[value].cmmCdNm;
            }
            return resultVal;
        };

        //견적유형
        var estTpList = [];
        <c:forEach var="obj" items="${estTpDs}">
        estTpList.push({
            "cmmCd" : "${obj.cmmCd}",
            "cmmCdNm" : "${obj.cmmCdNm}",
            "useYn" : "${obj.useYn}"
        });
        </c:forEach>
        var estTpMap = dms.data.arrayToMap(estTpList, function(obj) {return obj.cmmCd;});

        // 견적상태
        setEstpMap = function(value) {
            var resultVal = "";
            if (dms.string.isNotEmpty(value)) {
                if (estTpMap[value] != undefined)
                    resultVal = estTpMap[value].cmmCdNm;
            }
            return resultVal;
        };

        /********************** 초기 데이터  설정 ***************************/

        /****************** 버튼 이벤트 ***********************/

        runDistValConfirm = function() {
            var validOk = false;
            //更新 接车行驶里程 和  累计行驶里程 取值方式 贾明 2018-8-2 start
            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();//khskhs runDistVal  接车行驶里程
            var carRunDistVal = $("#carRunDistVal").data("kendoExtNumericTextBox").value();//khskhs carRunDistVal 累计行驶里程
            //更新 接车行驶里程 和  累计行驶里程 取值方式 贾明 2018-8-2 end
            //var runDistVal = $("#runDistVal").val();//khskhs runDistVal  接车行驶里程
            //console.log("接车行驶里程",typeof(runDistVal));
            //console.log("接车行驶里程",runDistVal);
            //var carRunDistVal = $("#carRunDistVal").val();//khskhs carRunDistVal 累计行驶里程
            //console.log("累计行驶里程",typeof(carRunDistVal));
            //console.log("累计行驶里程",carRunDistVal);
            var carRegNoVal = $("#carRegNo").val();

            if (runDistVal < carRunDistVal) {
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#runDistVal").focus();
                return false;
            }

            if (runDistVal - carRunDistVal >= 10000) {
                if (confirm("<spring:message code='ser.info.distValConfirm'/>")) {
                    //requestSaveData();
                } else {
                    return false;
                }
            }

            if (dms.string.isEmpty(carRegNoVal)) {
                dms.notification.info("<spring:message code='ser.title.carInfo' var='returnMsg1' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg1}' />");
                $("#carRegNo").focus();
                return false;
            }
            return true;
        }

        /** 저장 데이터  **/
        
        function requestSaveData(status) {
            if ($("#vinNo").val() == "") {
                dms.notification.info("<spring:message code='ser.title.carInfo' var='carInfo' /><spring:message code='global.info.emptyParamInfo' arguments='${carInfo}' />");
                $("#_overlay").hide();
                return false;
            }
            //更新 接车行驶里程 和  累计行驶里程 取值方式 贾明 2018-8-2 start
            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();//khskhs runDistVal  接车行驶里程
            var carRunDistVal = $("#carRunDistVal").data("kendoExtNumericTextBox").value();//khskhs carRunDistVal 累计行驶里程
          //更新 接车行驶里程 和  累计行驶里程 取值方式 贾明 2018-8-2 end
            //if ($("#runDistVal").val() <= 0) {
            if ( runDistVal <= 0) {
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#_overlay").hide();
                return false;
            }

            //if ($("#runDistVal").val() < $("#carRunDistVal").val()) {
            if(runDistVal < carRunDistVal){
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#runDistVal").focus();
                $("#_overlay").hide();
                return false;
            }

            var tabParams = [];
            var params = [];
            var tDstinCd = "", tDstinNm = "", tChkCd = "", tChkCdNatNm = "", tRsltGradeCd = "", tRsltGradeNm = "", tRsltVal = "";

            // PDI 점검리스트
            // TAB 별로 각각의 ROW 로 저장 하기 위하여 사용 한다.
            $.each(pdiChkList, function(i, pdiChk) {
                var tabId = pdiChk.chkCd.substr(0, 1); // 탭의 아이디 앞지리
                var rowCnt = 0;
                // 선택 버튼만 루프
                $.each($(".btn_active_normal ,.btn_active_warning ,.btn_active_error , .ico_active_normal, .ico_active_warning"
                        + ", .ico_active_error, .oil_active0, .oil_active2, .oil_active3, .oil_active4"), function(j, obj) {
                        var distinCd = pdiChk.chkTpCd; //구분코드
                        var distinNm = dms.string.trim($("#" + pdiChk.chkTpCd).text()); //구분명
                        var chkCd = (obj.id.substr(0,2) + "0"); //점검코드:I00 , J00 , K00 , M00 , N00 , Z00
                        var chkCdNatNm = dms.string.trim($("#" + (obj.id.substr(0,2) + "0")).text());//점검코드현지명
                        var rsltGradeCd = obj.id; //결과등급코드
                        var rsltGradeNm = dms.string.trim($("#" + obj.id)
                                        .text()); //결과등급명
                        var rsltVal = ""; //버튼 상태 값(정상:N , 주의:W , 이상:E )
                        var subTabId = chkCd.substr(0,1);
                        var objName = obj.className;
                        //신호등 버튼 결과값 세팅
                        // 정상:N , 주의:W , 이상:E
                        if (objName.indexOf("btn_oil") >= 0) {
                            if (objName.indexOf("btn_active_error") > 0) { //oil 계기판 선택
                                rsltVal = obj.innerText.substr(0,1);
                                chkCd = "I00";
                                rsltGradeCd = "I01";
                                subTabId = chkCd.substr(0,1);
                            } else {
                                return false;//btn_oil중 btn_active_error인경우 skip
                            }
                        } else if (objName.indexOf("btn_active_normal") > 0 || objName.indexOf("ico_active_normal") > 0) {
                            rsltVal = "N";
                        } else if (objName.indexOf("btn_active_warning") > 0 || objName.indexOf("ico_active_warning") > 0) {
                            rsltVal = "W";
                        } else if (objName.indexOf("btn_active_error") > 0 || objName.indexOf("ico_active_error") > 0) {
                            rsltVal = "E";
                        }

                        //버튼을 Tab 별로 담는다.
                        if (tabId == subTabId) {
                            if (rowCnt == 0) {
                                tDstinCd = pdiChk.chkTpCd;
                                tDstinNm = $("#" + pdiChk.chkTpCd).text();
                                tChkCd = chkCd;
                                tChkCdNatNm = chkCdNatNm;
                                tRsltGradeCd = rsltGradeCd;
                                tRsltGradeNm = rsltGradeNm;
                                tRsltVal = rsltVal;
                            } else {
                                tRsltGradeCd += ("|" + rsltGradeCd);
                                tRsltGradeNm += ("|" + rsltGradeNm);
                                tRsltVal += ("|" + rsltVal);
                            }
                            rowCnt++;
                        }
                    });//선택 버튼 루프

                if (rowCnt > 0) {
                    tabParams.push({
                        dstinCd : tDstinCd,
                        dstinNm : tDstinNm,
                        chkCd : tChkCd,
                        chkCdNatNm : tChkCdNatNm,
                        rsltGradeCd : tRsltGradeCd,
                        rsltGradeNm : tRsltGradeNm,
                        rsltVal : tRsltVal
                    });
                }
            }); //PDI 점검리스트

            var formSaveData = $("#preChkForm").serializeObject($("#preChkForm").serializeArrayInSelector("[data-json-obj='true']"));
            formSaveData.runDistVal = $("#runDistVal").val();//khskhs

            formSaveData.carAcptTp = $("#carAcptTp").val();

            formSaveData.diagStatCd = status; //20170601 hg

            // 저장시 wa default값 제거
            if ($("#remark").val() == '<spring:message code="ser.lbl.preChkRemark" />') { //전송 remark값이  default값[사전점검비고]이면 공백저장
                formSaveData.remark = '';
            } else {
                formSaveData.remark = $("#open_saInput").val();
            }

            // 차신(외부체크) 항목 세팅 (WA기능 추가)
            formSaveData.imgCrdnCont = makeDataImgMap();

            //console.log(formSaveData);
            //임시테스트//임시테스트//임시테스트
            //return ;
            var params = $.extend({"preCheckVO" : formSaveData},
                                    {"preCheckDetailVO" : tabParams},
                                    {"trobleDescVO" : trobleDescParam()},
                                    {"custDemandListVO" : custDemandParam()}, //wa에서는 사용안함
                                    {"etcIssueListVO" : null},
                                    {"servicePartListVO" : null},
                                    {"serviceLaborListVO" : null},
                                    {"lbrSuggestListVO" : getLbrSuggestData()});

            $.ajax({
                url : "<c:url value='/mob/waSer/ro/preCheck/multiPreChecks.do' />",
                data : JSON.stringify(params),
                type : 'POST',
                dataType : 'json',
                contentType : 'application/json',
                error : function(jqXHR, status, error) {
                    dms.notification.error("<spring:message code='global.err.mobSystemError'/>");
                    $("#_overlay").hide();
                },
                success : function(result, textStatus) {
                    $("#diagDocNo").val(result);
                    var data = {
                        vinNo : $("#vinNo").val(),
                        diagDocNo : $("#diagDocNo").val()
                    };
                    detailSet(data, false);

                    btnControll("U"); //버튼 세팅
                    dms.notification.success("<spring:message code='global.info.success' />");
                    $("#openSign").data("kendoButton").enable(true);
                    $("#_overlay").hide();
                }
            }); //ajax
        };

        /** 버튼 세팅 **/
        btnControll = function(status) {

            var statCd = $("#diagStatCd").data("kendoExtDropDownList").value();
            if (dms.string.strNvl(statCd) == "") {
                if (status == "U") {
                    $("#btnModify").data("kendoButton").enable(true);
                    $("#btnCancel").data("kendoButton").enable(true);
                    $("#btnPrint").data("kendoButton").enable(true);
                    $("#btnPwaHistPopup").data("kendoButton").enable(true);
                    $("#custAdd").data("kendoButton").enable(true);
                    $("#custDel").data("kendoButton").enable(true);
                    $("#lbrSuggestAdd").data("kendoButton").enable(true);
                    $("#lbrSuggestDel").data("kendoButton").enable(true);
                    $("#btnRoReq").data("kendoButton").enable(false);
                } else {
                    $("#btnModify").data("kendoButton").enable(true);
                    $("#btnCancel").data("kendoButton").enable(false);
                    $("#btnPrint").data("kendoButton").enable(false);
                    $("#btnPwaHistPopup").data("kendoButton").enable(false);
                    $("#custAdd").data("kendoButton").enable(false);
                    $("#custDel").data("kendoButton").enable(false);
                    $("#lbrSuggestAdd").data("kendoButton").enable(false);
                    $("#lbrSuggestDel").data("kendoButton").enable(false);
                    $("#btnRoReq").data("kendoButton").enable(false);
                }
            } else {
                if (statCd == "O") {
                    $("#btnModify").data("kendoButton").enable(true);
                    $("#btnCancel").data("kendoButton").enable(true);
                    $("#btnPrint").data("kendoButton").enable(true);
                    $("#btnPwaHistPopup").data("kendoButton").enable(true);
                    $("#custAdd").data("kendoButton").enable(true);
                    $("#custDel").data("kendoButton").enable(true);
                    $("#lbrSuggestAdd").data("kendoButton").enable(true);
                    $("#lbrSuggestDel").data("kendoButton").enable(true);
                    $("#btnRoReq").data("kendoButton").enable(true);
                } else if (statCd == "F") {
                    $("#btnModify").data("kendoButton").enable(false);
                    $("#btnCancel").data("kendoButton").enable(false);
                    $("#btnPrint").data("kendoButton").enable(true);
                    $("#btnPwaHistPopup").data("kendoButton").enable(true);
                    $("#custAdd").data("kendoButton").enable(false);
                    $("#custDel").data("kendoButton").enable(false);
                    $("#lbrSuggestAdd").data("kendoButton").enable(false);
                    $("#lbrSuggestDel").data("kendoButton").enable(false);
                    $("#btnRoReq").data("kendoButton").enable(true);
                } else if (statCd == "C") {
                    $("#btnModify").data("kendoButton").enable(false);
                    $("#btnCancel").data("kendoButton").enable(false);
                    $("#btnPrint").data("kendoButton").enable(true);
                    $("#btnPwaHistPopup").data("kendoButton").enable(false);
                    $("#custAdd").data("kendoButton").enable(false);
                    $("#custDel").data("kendoButton").enable(false);
                    $("#lbrSuggestAdd").data("kendoButton").enable(false);
                    $("#lbrSuggestDel").data("kendoButton").enable(false);
                    $("#btnRoReq").data("kendoButton").enable(false);
                }
            }
        };

        /**************** 입고 점검 정보 ********************/
        $("#diagDocNo").keypress(function(e){
            if (e.keyCode === 13 && dms.string.strNvl($("#diagDocNo").val()) != "") {
                e.preventDefault();
                var data = {"diagDocNo" : $("#diagDocNo").val()};
                detailSet(data, false);
            }
        });

        /**************** 입고 점검 정보 ********************/

        /* 사전 점검 정보 */
        detailSet = function(data, slide) {
            //console.log("data", data);
            $.ajax({
                url : "<c:url value='/ser/ro/preCheck/selectPreCheckByKey.do' />",
                data : JSON.stringify({
                    sVinNo : data.vinNo,
                    sDiagDocNo : data.diagDocNo
                }),
                type : 'POST',
                dataType : 'json',
                contentType : 'application/json',
                error : function(jqXHR, status, error) {
                    dms.notification.error("<spring:message code='global.err.mobSystemError'/>");
                },
                success : function(result, textStatus) {
                	//console.log("diagDocNo的值",result.diagDocNo);
                    if (dms.string.strNvl(result.diagDocNo) == "") {
                        dms.notification.info("<spring:message code='ser.lbl.preChkInfo' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                    } else {
                        //console.log("result", result);
                        getCustInfo(result, "N");
                        getPreCheckInfoSet(result);
                        getReservePreCheckDetailInfo(result);
                        tabInfoSet(result.diagDocNo, "${preFixId}")
                        btnControll(result.diagStatCd);

                        // 차신(외부체크) 항목 세팅 (WA기능 추가)
                        if (result.imgCrdnCont != null && result.imgCrdnCont != "") {
                            drawDataImgMap(result.imgCrdnCont);
                        }
                        //이미지 슬라이딩 로직 추가
                        if (result.fileKeyNm != null && result.fileKeyNm != "") {
                            $("#fileKeyNm").val(result.fileKeyNm);
                            getSlideImages(result.fileKeyNm);
                        }
                    }
                }
            });
        };

        /* 삭제후  예약 사전 점검 정보 */
        getDeletePreCheckInfo = function() {
            $.ajax({
                url : "<c:url value='/ser/cmm/vehOfCustInfo/selectReservePreCheckInfos.do' />",
                data : JSON.stringify({sVinNo : $("#vinNo").val()}),
                type : 'POST',
                dataType : 'json',
                contentType : 'application/json',
                error : function(jqXHR, status, error) {
                    dms.notification.error("<spring:message code='global.err.mobSystemError'/>");
                },
                success : function(result, textStatus) {
                    if (result.total > 0) {
                        getPreCheckInfoSet(result.data[0]);
                        getReservePreCheckDetailInfo(result.data[0]);
                    }
                }
            });
        };

        /* 예약 사전 점검 상세 정보 */
        getReservePreCheckDetailInfo = function(data) {
            $.ajax({
                url : "<c:url value='/ser/ro/preCheck/selectReserveDetailInfoByKey.do' />",
                data : JSON.stringify({
                    sVinNo : data.vinNo,
                    sDiagDocNo : data.diagDocNo
                }),
                type : 'POST',
                dataType : 'json',
                contentType : 'application/json',
                error : function(jqXHR, status, error) {
                    dms.notification.error("<spring:message code='global.err.mobSystemError'/>");
                },
                success : function(result, textStatus) {
                    if (result != null) {
                        if (result.total > 0) {
                            getPreCheckToggleSet(result);
                            btnControll(""); //버튼 세팅
                        }
                    }
                }
            });
        };

        /* 입고점검 정보 세팅*/
        getPreCheckInfoSet = function(result) {
            $("#diagStatCd").data("kendoExtDropDownList").value(result.diagStatCd);
            $("#diagDocNo").val(dms.string.strNvl(result.diagDocNo));
            $("#remark").val(dms.string.strNvl(result.remark)); // 사전점검비고 값을 hidden으로 관리

            if (dms.string.strNvl(result.remark) != "") {//사전점검비고 값 셋팅
                $("#open_saInput").text(dms.string.strNvl(result.remark));
            }
            $("#custRemark").val(dms.string.strNvl(result.custRemark));
            $("#resvDocNo").val(dms.string.strNvl(result.resvDocNo));
            $("#serResvStartDt").val(result.serResvStartDt);
            $("#tecId").val(dms.string.strNvl(result.tecId));
            $("#tecNm").val(dms.string.strNvl(result.tecNm));
            $("#saId").val(dms.string.strNvl(result.saId));
            $("#saNm").val(dms.string.strNvl(result.saNm));
            $("#roGrpNo").val(dms.string.strNvl(result.roGrpNo));
            $("#regUsrNm").val(dms.string.strNvl(result.regUsrNm));

            $("#hpNo").val(dms.string.strNvl(result.hpNo));
            $("#cauCd1").val(dms.string.strNvl(result.cauCd1));
            $("#cauNm1").val(dms.string.strNvl(result.cauNm1));
            $("#phenCd1").val(dms.string.strNvl(result.phenCd1));
            $("#phenNm1").val(dms.string.strNvl(result.phenNm1));
            $("#cauCd2").val(dms.string.strNvl(result.cauCd2));
            $("#cauNm2").val(dms.string.strNvl(result.cauNm2));
            $("#phenCd2").val(dms.string.strNvl(result.phenCd2));
            $("#phenNm2").val(dms.string.strNvl(result.phenNm2));
            $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
            $("#runDistVal").val(result.runDistVal);//khskhs
            $("#carAcptTp").val(dms.string.strNvl(result.carAcptTp));
        };

        /**   data setting **/
        getPreCheckToggleSet = function(result) {
            var resultList = [];
            $.each(result.data, function(i, obj) {
                if (dms.string.strNvl(obj.rsltGradeCd) != "") {
                    var rsltGradeCdList = obj.rsltGradeCd.split("|");
                    var rsltValList = obj.rsltVal.split("|");

                    $.each(rsltGradeCdList, function(j, rsltGradeCd) {
                        var rsltVal = rsltValList[j];
                        var cssId = "";
                        if (obj.chkCd == "I00") { //이미지 버튼
                            if (rsltVal == "N") {
                                cssId = "ico_active_normal";
                                $(".preChk_img." + rsltGradeCd).removeClass("ico_active_warning ico_active_error")
                                                                .addClass("ico_active_normal").show();
                            } else if (rsltVal == "W") {
                                cssId = "ico_active_warning";
                                $(".preChk_img." + rsltGradeCd).removeClass("ico_active_error ico_active_normal")
                                                                .addClass("ico_active_warning").show();
                            } else if (rsltVal == "E") {
                                cssId = "ico_active_error";
                                $(".preChk_img." + rsltGradeCd).removeClass("ico_active_warning ico_active_normal")
                                                                .addClass("ico_active_error").show();
                            } else if (dms.string.isNotEmpty(rsltVal)) { //오일계기판
                                $(".btn_oil").removeClass("btn_active_error");
                                $(".btn_oil")[rsltVal].className = $(".btn_oil")[rsltVal].className + " btn_active_error";
                            }
                        } else {
                            //wa에서 이미지 불러오기 기능추가
                            if (rsltVal == "N") {
                                cssId = "btn_active_normal";
                                $("#" + rsltGradeCd).addClass(cssId);
                                $(".preChk_carImg>.preChk_icon." + rsltGradeCd).removeClass("ico_active_warning ico_active_error").hide();
                            } else if (rsltVal == "W") {
                                cssId = "btn_active_warning";
                                $("#" + rsltGradeCd).addClass(cssId);
                                $("#" + rsltGradeCd).removeClass("btn_active_normal");
                                $(".preChk_carImg>.preChk_icon." + rsltGradeCd).removeClass("ico_active_error")
                                                                                .addClass("ico_active_warning").show();
                            } else if (rsltVal == "E") {
                                cssId = "btn_active_error";
                                $("#" + rsltGradeCd).addClass(cssId);
                                $("#" + rsltGradeCd).removeClass("btn_active_normal");
                                $(".preChk_carImg>.preChk_icon." + rsltGradeCd).removeClass("ico_active_warning")
                                                                                .addClass("ico_active_error").show();
                            }
                        }
                    });
                }
            });
        };

        /**************** 예약 사전 점검 정보 ********************/

        /****************** 버튼 이벤트 ***********************/

        $(".btn_roCreate").kendoButton({
            click : function(e) {
                $("#messageId").html("<spring:message code='ser.info.moveRoMenu'/>");
                conformKendoWindow.content($(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function() {
                    if ($(this).hasClass("yes")) {
                        var param = "?vinNo=" + $("#vinNo").val();
                        param += "&carId=" + $("#carId").val();
                        param += "&diagDocNo=" + $("#diagDocNo").val();
                        param += "&resvDocNo=" + $("#resvDocNo").val();
                        param += "&runDistVal=" + $("#runDistVal").val();
                        param += "&roGrpNo=" + $("#roGrpNo").val();
                        param += "&carAcptTp=" + $("#carAcptTp").data("kendoExtDropDownList").value();
                        param += "&infoType=PC";
                        param += "&remark=" + $("#remark").val();
                        conformKendoWindow.close();
                        return parent._createOrReloadTabMenu('<spring:message code="ser.menu.roCreate" />',
                                                                "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do"+param+"'/>",
                                                                "VIEW-D-10337");
                    }
                    conformKendoWindow.close();
                }).end();
            }
        });

        /** 수정 **/
        $("#btnModify").kendoButton({
            click : function(e) {
                if (runDistValConfirm()) {
                    $("#_overlay").show();
                    captrue();
                    setTimeout(function() {
                        imageSave();
                    }, 1000);
                }
            }
        });

        /** 삭제 **/
        $("#btnCancel").kendoButton({
            click : function(e) {
                preChkCancelPopup = dms.window.popup({
                    windowId : "preChkCancelPopup",
                    title : "<spring:message code='ser.lbl.preInsCanc'/>", // 사전점검취소
                    width : 400,
                    height : 200,
                    content : {
                        url : "<c:url value='/ser/ro/preCheck/selectPreCheckCancelPopup.do'/>",
                        data : {
                            "diagDocNo" : $("#diagDocNo").val(),
                            "callbackFunc" : function() {
                                dms.notification.success("<spring:message code='ser.lbl.preCheck' var='resv' /><spring:message code='global.info.cancelSuccessParam' arguments='${resv}' />");
                                var data = {
                                    vinNo : $("#vinNo").val(),
                                    diagDocNo : $("#diagDocNo").val()
                                };
                                detailSet(data, false);
                                btnControll("C"); //버튼 세팅
                            }
                        }
                    }
                });
            }
        });

        /** 인도체크확인 **/
        $("#btnCheck").kendoButton({
            click : function(e) {
                dms.notification.warning("<spring:message code='global.info.developIng' />");
            }
        });

        /** 프린터 **/
        $("#btnPrint").kendoButton({
            click : function(e) {
                $.ajax({
                    url : "<c:url value='/ser/ro/preCheck/updatePreCheck.do' />",
                    data : JSON.stringify({"diagDocNo" : $("#diagDocNo").val(), "printYn" : "Y"}),
                    type : 'POST',
                    dataType : 'json',
                    contentType : 'application/json',
                    error : function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });
                parent._createOrReloadTabMenu("<spring:message code='ser.lbl.preChkDoc' />",
                                                "<c:url value='/ReportServer?reportlet=ser/selectPreCheckPrintMain.cpt'/>&locale=zh&sDiagDocNo="
                                                    + $("#diagDocNo").val()
                                                    + "&sDlrCd=${dlrCd}&sTelShowYn="
                                                    + custTelYnValue); // RO Main
            }
        });

        /** PWA 이력**/
        $("#btnPwaHistPopup").kendoButton({
            click : function(e) {
                parent._createOrReloadTabMenu("<spring:message code='ser.menu.pwaReqMng'/>",
                                                "<c:url value='/ser/wac/pwaReq/selectPwaRequestMain.do'/>?vinNo="
                                                    + $("#vinNo").val()
                                                    + "&diagDocNo="
                                                    + $("#diagDocNo").val()
                                                    + "&infoType=PC",
                                                "VIEW-D-10352"); // PWA신청
            }
        });

        /** 전부정상 **/
        $("#allNormal").kendoButton({
            click : function(e) {
                if (selectedTabId == "C1") {
                    $.each($(".btn_iList"), function(j, obj) { // 선택한 toggle 리스트 loop
                        $("#" + obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                        $("#" + obj.id).addClass("ico_active_normal");
                    });
                    $.each($(".btn_jList"), function(j, obj) { // 선택한 toggle 리스트 loop
                        $("#" + obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                        $("#"+ obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                        $("#" + obj.id).addClass("btn_active_normal");
                    });
                } else if (selectedTabId == "C3") {
                    $.each($(".btn_kList"), function(j, obj) { // 선택한 toggle 리스트 loop
                        $("#" + obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                        $("#" + obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                        $("#" + obj.id).addClass("btn_active_normal");
                    });
                } else if (selectedTabId == "C4") {
                    $.each($(".btn_mList"), function(j, obj) { // 선택한 toggle 리스트 loop
                        $("#" + obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                        $("#" + obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                        $("#" + obj.id).addClass("btn_active_normal");
                    });
                } else if (selectedTabId == "C5") {
                    $.each($(".btn_nList"), function(j, obj) { // 선택한 toggle 리스트 loop
                        $("#" + obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                        $("#" + obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                        $("#" + obj.id).addClass("btn_active_normal");
                    });
                }
                $(".preChk_carImg>.preChk_icon").removeClass("ico_active_warning ico_active_error").hide();
            }
        });

        $("#tabstrip, #tabstrip2").kendoExtTabStrip({
            animation : false,
            select : function(e) {
                selectedTabId = e.item.id;
                var kendoTab = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");

                if (selectedTabId == "CQ" || selectedTabId == "RD" || selectedTabId == "LS") {
                    $("#btn_status_check").css("display", "none");
                } else {
                    $("#btn_status_check").css("display", "block");
                }

                if (selectedTabId == "C2") {
                    $("#allNormal").data("kendoButton").enable(false);
                } else {
                    $("#allNormal").data("kendoButton").enable(true);
                }
            }
        });

        //button active
        $("#btn_status_check > .btn_m").click(
            function() {
                $("#btn_status_check > .btn_m").removeClass("btn_active");
                $(this).addClass("btn_active");
            }
        );

        $(".btn_s.btn_s_v4.preChk").click(
            function() {
                if ($(".btn_m_warning").hasClass("btn_active")) {
                    $(this).addClass("btn_active_warning");
                    $(this).removeClass("btn_active_normal btn_active_error");
                } else if ($(".btn_m_error").hasClass("btn_active")) {
                    $(this).addClass("btn_active_error");
                    $(this).removeClass("btn_active_normal btn_active_warning");
                } else {
                    $(this).addClass("btn_active_normal");
                    $(this).removeClass("btn_active_warning btn_active_error");
                }
            }
        );

        $(".preCheck_ico").click(
            function() {
                if ($(".btn_m_warning").hasClass("btn_active")) {
                    $(this).removeClass("ico_active_normal ico_active_error");
                    $(this).toggleClass("ico_active_warning");
                } else if ($(".btn_m_error").hasClass("btn_active")) {
                    $(this).removeClass("ico_active_normal ico_active_warning");
                    $(this).toggleClass("ico_active_error");
                } else {
                    $(this).removeClass("ico_active_warning ico_active_error");
                    $(this).toggleClass("ico_active_normal");
                }
            }
        );

        $(".oiling_ico>div>a").click(
            function() {
                $(this).parent().removeClass().addClass("oil_active" + $(this).index());
            }
        );

        var slideClickBinder = function() {
            var win = $("#window_img").data("kendoWindow");
            win.center();
            win.open();

            var li_num = $(this).index();
            bImgSlider.goToSlide(li_num);
        };

        $("ul.sImg_slider>li").bind("click", slideClickBinder);

        //sImg_slider
        var sImgSlider = $('ul.sImg_slider').bxSlider({
            slideWidth : 74,
            minSlides : 1,
            maxSlides : 8,
            moveSlides : 7,
            slideMargin : 5,
            pager : false,
            auto : false,
            infiniteLoop : false,
            hideControlOnEnd : true
        });

        //bImg_slider
        var bImgSlider = $("ul.bImg_slider").bxSlider({
            pager : false,
            infiniteLoop : false,
            hideControlOnEnd : true
        });

        //사진촬영
        function drawTakePircute() {
            var userAgent = navigator.userAgent.toLowerCase();
            try {
                if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1) || (userAgent.search("ipad") > -1)) {
                    document.location = 'bhmccp://openCamera?type=data&return_func=getImgDataUseMobileFunc';
                } else {
                    window.bhmccp.openCamera('data', 'getImgDataUseMobileFunc');
                }
            } catch (e) {
            }
            var getRoopImgDataInfo = setInterval(function() {
                if (parent._imgDataUseMobile != "") {
                    $("ul.sImg_slider").append('<li><img src="data:image/png;base64,'+parent._imgDataUseMobile+'" id="append1"></li>');
                    $("ul.bImg_slider").append('<li><img src="data:image/png;base64,'+parent._imgDataUseMobile+'"></li>');
                    // slider 재설정
                    sImgSlider.reloadSlider();
                    bImgSlider.reloadSlider();
                    // 이미지 변경시 bind 재 설정
                    $("ul.sImg_slider>li").unbind("click", slideClickBinder);
                    $("ul.sImg_slider>li").bind("click", slideClickBinder);

                    clearInterval(getRoopImgDataInfo);
                    parent._imgDataUseMobile = "";
                }
            }, 1000);
        }

        //저장시 이미지 업로드 먼저 실행후 데이터 저장 프로세스 수행
        function imageSave() {
            //selectFileInfo.jsp 파일 참조
            if (dms.string.isEmpty($("#fileKeyNm").val())) {
                //파일Key 취득 로직 실행
                $.ajax({
                    url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                    dataType : "json",
                    type : "get",
                    async : false,
                    cache : false,
                    success : function(id) {
                        $("#fileKeyNm").val(id);
                        uploadFilePreCheck(id);
                    }
                });
            } else {
                uploadFilePreCheck($("#fileKeyNm").val());
            }
        }

        //이미지 저장 프로세스 실행
        function uploadFilePreCheck(fileKeyNm) {
            var srcData = "";
            var updCnt = 0;
            var totCnt = 0;
            var slidImgArr = $("ul.sImg_slider>li>img");
            if (slidImgArr.length > 0) {
                $("ul.sImg_slider>li>img").each(function(cnt, obj) {
                    totCnt++;
                    //console.log("$(this).attr(src):" + $(this).attr("src"));
                    srcData = $(this).attr("src");
                    if (srcData.indexOf("data:image") > -1) { // 사진촬영 데이터의 경우 업로드 실행
                        $.ajax({
                            url : "<c:url value='/mob/cmm/sci/fileUpload/selectFileUpload.do'/>",
                            type : 'POST',
                            async : false,
                            data : JSON.stringify({
                                        "fileDocNo" : fileKeyNm,
                                        "fileTp" : "image/jpeg",
                                        "fileData" : srcData.substring(22, (srcData.length)), //update by yonyou-jiaming 20180326,
                                        "fileNm" : $("#carRegNo").val() + "_" + fileKeyNm + "_" + cnt, // 차량번호+파일키명+loop순번
                                        "fileSize" : ""
                                    }),
                            dataType : 'json',
                            contentType : 'application/json',
                            success : function(result) {
                                updCnt++;
                            }
                        });
                    }
                });
            } else {
                $("#fileKeyNm").val("");
            }
            //console.log("uploadFilePreCheck updCnt:" + updCnt);

            uploadFileCarBodyImage($("#fileKeyNm2").val());
        }

        function storedCarBodyImage() {
            if (dms.string.isEmpty($("#fileKeyNm2").val())) {
                //파일Key 취득 로직 실행
                $.ajax({
                    url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                    dataType : "json",
                    type : "get",
                    async : false,
                    cache : false,
                    success : function(id) {
                        $("#fileKeyNm2").val(id);
                    }
                });
            }
        }

        function storedSignImage() {
            if (dms.string.isEmpty($("#fileKeyNm3").val())) {
                //파일Key 취득 로직 실행
                $.ajax({
                    url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                    dataType : "json",
                    type : "get",
                    async : false,
                    cache : false,
                    success : function(id) {
                        $("#fileKeyNm3").val(id);
                        uploadFileSignImage($("#fileKeyNm3").val());
                    }
                });
            } else {
                $.ajax({
                    url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                    dataType : "json",
                    type : "get",
                    async : false,
                    cache : false,
                    success : function(id) {
                        $("#fileKeyNm3").val(id);
                        uploadFileSignImage($("#fileKeyNm3").val());
                    }
                });
            }
        }

        function captrue() {
            var canvas = "";
            html2canvas($("#carBody_area"), {//원래 carBody_left
                onrendered : function(canvas) {
                    // canvas is the final rendered <canvas> element
                    if (canvas.width > 0) {
                        captrueData = canvas.toDataURL().toString().split(",");
                        //console.log(captrueData);
                        storedCarBodyImage();
                    }
                }
            });
        }

        function uploadFileCarBodyImage(fileKeyNm2) {
            if (captrueData != null) {
                $.ajax({
                    url : "<c:url value='/mob/cmm/sci/fileUpload/selectFileUpload.do'/>",
                    type : 'POST',
                    async : false,
                    data : JSON.stringify({
                        "fileDocNo" : fileKeyNm2,
                        "fileTp" : "image/png",
                        "fileData" : captrueData[1],
                        "fileNm" : $("#carRegNo").val() + "_" + fileKeyNm2,
                        "fileSize" : ""
                    }),
                    dataType : 'json',
                    contentType : 'application/json',
                    success : function(result) {
                        console.log("uploadFileCarBodyImage success !!! ");
                    }
                });
            }
            requestSaveData("O"); //데이터 저장 영역 실행
        }

        function uploadFileSignImage(fileKeyNm3) {
            var signImageData = $("#imgDataSig").text().toString().split(",");
            if (signImageData != null) {
                $.ajax({
                    url : "<c:url value='/mob/cmm/sci/fileUpload/selectFileUpload.do'/>",
                    type : 'POST',
                    async : false,
                    data : JSON.stringify({
                        "fileDocNo" : fileKeyNm3,
                        "fileTp" : "image/png",
                        "fileData" : signImageData[1],
                        "fileNm" : $("#carRegNo").val() + "_" + fileKeyNm3,
                        "fileSize" : ""
                    }),
                    dataType : 'json',
                    contentType : 'application/json',
                    success : function(result) {
                        console.log("uploadFileSignImage success !!! ");
                        requestSaveData("O"); //데이터 저장 영역 실행
                    }
                });
            }
        }

        //화면로딩시 사진이미지 슬라이딩 데이터 취득
        function getSlideImages(fileKeyNm) {
            var fileParam = {};
            fileParam["sFileDocNo"] = fileKeyNm;
            //selectCallCenterActionMain.jsp 파일 참조
            $.ajax({
                url : "<c:url value='/cmm/sci/fileUpload/selectFiles.do' />",
                data : JSON.stringify(fileParam), //파라미터
                type : 'POST', //조회요청
                dataType : 'json', //json 응답
                contentType : 'application/json', //문자열 파라미터
                error : function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
            })
            .done(function(body) {
                var rows = body.data;
                var fileDocNo = "";
                var fileNo = "";
                var curLi = "";
                var curUrl = "";
                $("ul.sImg_slider li").remove();
                $("ul.bImg_slider li").remove();
                if (rows.length > 0) {
                    $.each(rows, function(index, row) {
                        //링크 URL
                        curUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo=" + row.fileDocNo
                                    + "&fileNo=" + row.fileNo;
                        //이미지  로직
                        curLi = '<li><img src="'+curUrl+'" id="append1" alt=""></li>';

                        $("ul.sImg_slider").append(curLi);
                        $("ul.bImg_slider").append(curLi);
                    });
                }
                // slider 재설정
                sImgSlider.reloadSlider();
                bImgSlider.reloadSlider();
                // 이미지 변경시 bind 재 설정
                $("ul.sImg_slider>li").unbind("click", slideClickBinder);
                $("ul.sImg_slider>li").bind("click", slideClickBinder);
            });

        }
        /* 사진 촬영 로직 추가 [End] */

        /** 사전점검 번호가 있을경우 자동 조회**/
        <c:if test="${diagDocNo ne ''}">
        var data = {
            "diagDocNo" : "${diagDocNo}",
            "vinNo" : "${vinNo}"
        };
        detailSet(data, false);
        </c:if>
        <c:if test="${vinNo ne '' and diagDocNo eq''}">
        var data = {"vinNo" : "${vinNo}"};
        getCustInfo(data);
        </c:if>

        if (window.matchMedia('(max-width:1024px)').matches) {
            $("#checkErrFl02").after("<br>");
        }
    });
</script>

<!-- wa 스크립트 구현 영역[Start] -->
<script type="text/javascript">
    //브랜드 코드
    getBrandCdMap = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = brandCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //증서유형
    getMathDocTpMap = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = mathDocTpMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //메인연락방식 코드
    getPrefContactMthCdMap = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = prefContactMthCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //메인연락시간 코드
    getPrefContactTimeCdMap = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = prefContactTimeCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //고객 팝업
    custPopupWindow = function(preFixId){
        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId : "vehOfCustInfoSearchPopup",
            title : "<spring:message code='ser.title.custSearch' />", // 고객 조회
            content : {
                url : "<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>",
                data : {
                    "autoBind" : true,
                    "type" : null,
                    "vinNo" : $("#vinNo").val(),
                    "carRegNo" : $("#carRegNo").val(),
                    "carOwnerNm" : $("#carOwnerNm").val(),
                    "callbackFunc" : function(data) {
                        setBizDataSearch(data[0], preFixId);
                    }//callback
                }
            }
        });
    };

    // RO , 예약은 업무별 상세 데이터 조회
    // RO:vin별 당일 차량점검 존재여부 , 예약:vin별 당일  예약정보 확인
    setBizDataSearch = function(data, preFixId){
        initAll();
        if (preFixId != undefined && preFixId == "RO") {
            $.ajax({
                url : "<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfPreCheckInfos.do' />",
                data : JSON.stringify({
                    sVinNo : data.vinNo,
                    sPreFixId : preFixId,
                    sSerResvStartDt : new Date("${sysDate}")
                }),
                type : 'POST',
                dataType : 'json',
                contentType : 'application/json',
                error : function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success : function(result, textStatus) {
                    if(result.total <= 0) {
                        return;
                    }else{
                        getCustInfo(data);
                        $("#roGrpNo").val(result.data[0].roGrpNo);
                        $("#diagDocNo").val(result.data[0].diagDocNo);
                    }
                }
            });
        }else{
            getCustInfo(data);
        }
    };

    /** 전체 필드 초기화 **/
    initAll = function(){
        $("#preChkForm").get(0).reset();
        $.each($(".btn_active_normal ,.btn_active_warning ,.btn_active_error , .ico_active_normal, .ico_active_warning , .ico_active_error"),function(j, obj) {
         // 선택한 toggle 리스트 loop
            $("#" + obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
            $("#" + obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
        });
        $.each($(".btn_s.btn_s_v4.preChk"), function(j, obj) { // 선택한 toggle 리스트 loop
            $("#" + obj.id).addClass("btn_active_normal");
        });
        $(".btn_s.btn_s_v4.troble").removeClass("btn_active");

        //wa기능 추가[Start]
        deleteMakerDivAll(); // 외부 검사 선택영역 Clear;
        $("#open_saInput").text('<spring:message code="ser.lbl.preChkRemark" />'); //사전점검영역 textarea 클리어

        //내부, 엔진룸, 타이어&하부검사 이미지 선택 부분 Clear
        $(".preChk_carImg>.preChk_icon").each(function(cnt, obj) {
                $(this).removeClass("ico_active_error ico_active_warning ico_active_normal");
        });
        //계기판 오일 cllear
        $(".btn_oil").removeClass("btn_active_error");
        $(".btn_oil")[1].className = $(".btn_oil")[1].className + " btn_active_error"; // 1/4로 초기화
        //wa기능 추가[End]
     // 20201217 update by tjx 初始化确认,取消按钮不可用  
        $("#btnModify").data("kendoButton").enable(false);
        $("#btnCancel").data("kendoButton").enable(false);
    };

    //TAB 정보
    tabInfoSet = function(docNo, preFixId){
        trobleDescInfo(docNo, preFixId); //고객요구사항및 고장설명(selectTabInfo.jsp)
        lbrSuggestSet(docNo, preFixId); //수리건의(selectLbrSuggest.jsp)
    };

    getCustInfo = function(data){
        $.ajax({
            url : "<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />",
            data : JSON.stringify({sVinNo : data.vinNo}),
            type : 'POST',
            dataType : 'json',
            contentType : 'application/json',
            error : function(jqXHR, status, error) {
                dms.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success : function(result, textStatus) {
                if (result != null) {
                    custInfoSet(result.data[0]);
                    $("#custRemarkGrid").data("kendoExtGrid").dataSource.read();
                }
            }
        });
    };

    custInfoUseControll = function(useable){
        if (useable){
            $(".useable").removeClass("readonly_area");
            $(".form_use").attr("readonly", false);
        }else{
            $(".useable").addClass("readonly_area");
            $(".form_use").attr("readonly", true);
        }
    };
    var tabInfoPreFixId = "";
    var tabInfoJobNo = "";
    //고장설명 조회
    trobleDescInfo = function(jobNo, listType){
        tabInfoPreFixId = dms.string.strNvl(listType) == "" ? $("#preFixId").val() : listType;
        tabInfoJobNo = jobNo;

        var params = {
            "sPreFixId" : tabInfoPreFixId,
            "sJobNo" : tabInfoJobNo
        };

        $.ajax({
            url : "<c:url value='/ser/cmm/tabInfo/selectTrobleDescs.do' />",
            data : JSON.stringify(params),
            type : 'POST',
            dataType : 'json',
            contentType : 'application/json',
            error : function(jqXHR, status, error) {
                dms.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success : function(result, textStatus) {
                if (result != null) {
                    trobleDescInfoSet(result);
                }
            }
        });
    };

    /** 고장서술 정보**/
    trobleDescParam = function(e){
        //고장서술 저장
        var trobleParam = {
            "preFixId" : $("#preFixId").val(),
            "roadTermCd1" : ($("#roadTermCd1")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadTermCd2" : ($("#roadTermCd2")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadTermCd3" : ($("#roadTermCd3")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadTermCd4" : ($("#roadTermCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadTermCd5" : ($("#roadTermCd5")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadTermCont" : $("#roadTermCont").val(),
            "roadPrcnCd1" : ($("#roadPrcnCd1")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadPrcnCd2" : ($("#roadPrcnCd2")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadPrcnCd3" : ($("#roadPrcnCd3")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadPrcnCd4" : ($("#roadPrcnCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadPrcnCd5" : ($("#roadPrcnCd5")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "roadPrcnCont" : $("#roadPrcnCont").val(),
            "wetrTermCd1" : ($("#wetrTermCd1")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "wetrTermCd2" : ($("#wetrTermCd2")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "wetrTermCd3" : ($("#wetrTermCd3")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "wetrTermCd4" : ($("#wetrTermCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "wetrTermCd5" : $("#wetrTermCd5").val(),
            "wetrTermCont" : $("#wetrTermCont").val(),
            "occrFreqCd1" : ($("#occrFreqCd1")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "occrFreqCd2" : ($("#occrFreqCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "occrFreqCd3" : ($("#occrFreqCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "occrFreqCd4" : ($("#occrFreqCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "occrFreqCd5" : $("#occrFreqCd5").val(),
            "occrFreqCont" : $("#occrFreqCont").val(),
            "driveStatCd1" : ($("#driveStatCd1")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "driveStatCd2" : ($("#driveStatCd2")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "driveStatCd3" : ($("#driveStatCd3")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "driveStatCd4" : ($("#driveStatCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "driveStatCd5" : $("#driveStatCd5").val(),
            "driveStatCont" : $("#driveStatCont").val(),
            "operStatCd1" : ($("#operStatCd1")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "operStatCd2" : ($("#operStatCd2")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "operStatCd3" : ($("#operStatCd3")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "operStatCd4" : ($("#operStatCd4")[0].className.indexOf("btn_active") > -1) ? "Y" : "N",
            "operStatCd5" : $("#operStatCd5").val(),
            "operStatCont" : $("#operStatCont").val()
        };
        return trobleParam;
    };

    //고장설명 결과값 세팅
    trobleDescInfoSet = function(result){
        $(".btn_s.btn_s_v4.troble").removeClass("btn_active");

        if(result.roadTermCd1 == "Y")
            $("#roadTermCd1").toggleClass("btn_active");
        if(result.roadTermCd2 == "Y")
            $("#roadTermCd2").toggleClass("btn_active");
        if(result.roadTermCd3 == "Y")
            $("#roadTermCd3").toggleClass("btn_active");
        if(result.roadTermCd4 == "Y")
            $("#roadTermCd4").toggleClass("btn_active");
        if(result.roadTermCd5 == "Y")
            $("#roadTermCd5").toggleClass("btn_active");
        $("#roadTermCont").val(result.roadTermCont);

        if(result.roadPrcnCd1 == "Y")
            $("#roadPrcnCd1").toggleClass("btn_active");
        if(result.roadPrcnCd2 == "Y")
            $("#roadPrcnCd2").toggleClass("btn_active");
        if(result.roadPrcnCd3 == "Y")
            $("#roadPrcnCd3").toggleClass("btn_active");
        if(result.roadPrcnCd4 == "Y")
            $("#roadPrcnCd4").toggleClass("btn_active");
        if(result.roadPrcnCd5 == "Y")
            $("#roadPrcnCd5").toggleClass("btn_active");
        $("#roadPrcnCont").val(result.roadPrcnCont);

        if(result.wetrTermCd1 == "Y")
            $("#wetrTermCd1").toggleClass("btn_active");
        if(result.wetrTermCd2 == "Y")
            $("#wetrTermCd2").toggleClass("btn_active");
        if(result.wetrTermCd3 == "Y")
            $("#wetrTermCd3").toggleClass("btn_active");
        if(result.wetrTermCd4 == "Y")
            $("#wetrTermCd4").toggleClass("btn_active");
        $("#wetrTermCd5").val(result.wetrTermCd5);
        $("#wetrTermCont").val(result.wetrTermCont);

        if(result.occrFreqCd1 == "Y")
            $("#occrFreqCd1").toggleClass("btn_active");
        if(result.occrFreqCd2 == "Y")
            $("#occrFreqCd2").toggleClass("btn_active");
        if(result.occrFreqCd3 == "Y")
            $("#occrFreqCd3").toggleClass("btn_active");
        if(result.occrFreqCd4 == "Y")
            $("#occrFreqCd4").toggleClass("btn_active");
        $("#occrFreqCd5").val(result.occrFreqCd5);
        $("#occrFreqCont").val(result.occrFreqCont);

        if(result.driveStatCd1 == "Y")
            $("#driveStatCd1").toggleClass("btn_active");
        if(result.driveStatCd2 == "Y")
            $("#driveStatCd2").toggleClass("btn_active");
        if(result.driveStatCd3 == "Y")
            $("#driveStatCd3").toggleClass("btn_active");
        if(result.driveStatCd4 == "Y")
            $("#driveStatCd4").toggleClass("btn_active");
        $("#driveStatCd5").val(result.driveStatCd5);
        $("#driveStatCont").val(result.driveStatCont);

        if(result.operStatCd1 == "Y")
            $("#operStatCd1").toggleClass("btn_active");
        if(result.operStatCd2 == "Y")
            $("#operStatCd2").toggleClass("btn_active");
        if(result.operStatCd3 == "Y")
            $("#operStatCd3").toggleClass("btn_active");
        if(result.operStatCd4 == "Y")
            $("#operStatCd4").toggleClass("btn_active");
        $("#operStatCd5").val(result.operStatCd5);
        $("#operStatCont").val(result.operStatCont);

        $("#custRemarkGrid").data("kendoExtGrid").dataSource.read();
    };

    /***** 차신(외부검사) [Start] *****/
    /***** 차신(외부검사) *****/
    //파손유형
    var checkCurrentErrType = "";

    //ie check
    var isIE;
    (function(){
        var ua = window.navigator.userAgent,
            msie = ua.indexOf('MSIE '),
            trident = ua.indexOf('Trident/'),
            edge = ua.indexOf('Edge/');
        isIE = (msie > -1 || trident > -1 || edge > -1) ? true : false;
    })();

    $(document).ready(function(){
        $("#carBodyChk").click(function(event){
            if ($("#checkErrFl02").hasClass("btn_active") && $("#checkUse02").hasClass("btn_active")){
                if(isIE){
                    var x = parseInt(event.offsetX - 8);
                    var y = parseInt(event.offsetY - 8);
                }else{
                    var x = parseInt(event.pageX - $(this).offset().left - 8);
                    var y = parseInt(event.pageY - $(this).offset().top - 8);
                }
                if(checkCurrentErrType == null || checkCurrentErrType == "") {
                    mob.notification.info("<spring:message code='wa.info.selecterrortype' />");
                    return false;
                }
                makerDiv(x, y, checkCurrentErrType);
            } else{
                return false;
            }
        });
    });

    custDemandAdd = function() {
        var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
        grid.add({
            "lineNo" : grid.data().length + 1,
            "custReqCont" : ""
        });

        custRemarkSerAlramAdd = function(jsonObj) {
            var custGrid = $("#custRemarkGrid").data("kendoExtGrid");
            var custGridData = custGrid.dataSource._data;
            var preRoTp = "";

            if (jsonObj.total > 0) {
                $.each(jsonObj.data, function(idx, data) {
                    var copyData;
                    var checkVal = true;

                    // 중복값 체크
                    $.each(custGridData, function(idx, obj) {
                        if (data.preFixId == obj.preFixId && data.custReqCont == obj.custReqCont) {
                            checkVal = false;
                        }
                    });

                    if (checkVal && preFixId == "RO") {
                        data.lineNo = custGrid.dataSource.data().length + 1;
                        custGrid.dataSource.add(data);
                    }
                });
            }
        };
    };

    /** 고객요구사항 정보**/
    custDemandParam = function(e) {
        //고객요구사항
        var custDemandGrid = $("#custRemarkGrid").data("kendoExtGrid");
        var custSaveData = custDemandGrid.dataSource.data();

        return custSaveData;
    };

    function makerDiv(x, y, ErrType) {
        var divId = "div" + ErrType + "_" + x + "_" + y;
        //저장후 재호출시 버그 (다시그리는 현상 제거)
        //선택한 부분이 기존에 존재할경우
        var dupCheck = false;
        $.each($("div.carBody_Chk > div"), function(i, row) {
            if (row.id == divId) {
                dupCheck = true;
                return false;
            }
        });
        if (dupCheck) { //기존 데이터 존재함
            return false;
        }

        var divTxt = "";
        var divClass = "";
        switch (ErrType) {
            case "checkErrType01":
                divTxt = "<spring:message code='wa.lbl.scratch' />"; //긁힘
                divClass = "checkErrType01";
                break;
            case "checkErrType02":
                divTxt = "<spring:message code='wa.lbl.destroy' />"; //파손
                divClass = "checkErrType02";
                break;
            case "checkErrType03":
                divTxt = "<spring:message code='wa.lbl.dug' />"; //움푹파임
                divClass = "checkErrType03";
                break;
            case "checkErrType04":
                divTxt = "<spring:message code='wa.lbl.paintbad' />"; //페인트벗겨짐
                divClass = "checkErrType04";
                break;
            case "checkErrType05":
                divTxt = "Crack";
                divClass = "checkErrType05";
                break;
            case "checkErrType06":
                divTxt = "<spring:message code='global.lbl.other' />";//기타
                divClass = "checkErrType06";
                break;
            default:
                break;
        }

        $("div.carBody_Chk").append('<div id="' + divId + '" onclick="deleteMakerDiv(this)" class="problem_area '
                                    + divClass + '">' + divTxt + '</div>');
        var xpx = x + "px";
        var ypx = y + "px";
        $("#" + divId).css({
            "top" : ypx,
            "left" : xpx
        });
    }

    // 선택한 파손유형 제거
    function deleteMakerDiv(objParam) {
        if ($("#checkUse03").hasClass("btn_active")) {
            objParam.parentNode.removeChild(objParam);
        } else {
            return false;
        }
    }

    //파손유형 reset
    function deleteMakerDivAll() {
        // 파손데이터 reset 생성한div 삭제
        $("div.problem_area").remove();
        // 현재 선택한 파손 유형 reset
        checkCurrentErrType = "";
        // 선택한 파손유형 초기화
        $("button[name='check_errType']").each(function(cnt, obj) {
            $(this).removeClass("btn_active");
        });
    }

    // 이상 유무 선택
    function fncCheckErrFl(objParam) {
        var resetFl = objParam.id == 'checkErrFl01'; //이상유무 체크
        if (resetFl) { //Back 체크클릭시 전체 선택항목 삭제
            if (!confirm('<spring:message code="global.info.noproblemresetcarerror" />')) { //차량이상이 없습니다. 초기화 하시겠습니까?
                //OK 체크후 차량 초기화 질문에 대하여 취소 버튼 클릭시.
                return false;
            } else {
                deleteMakerDivAll(); //전체 선택항목 삭제
                //선택한 기능버튼 초기화
                $("button[name='check_use']").each(function(cnt, obj) {
                    $(this).removeClass("btn_active");
                    $(this).prop("disabled", true);
                });
                $("button[name='check_errType']").each(function() {
                    $(this).prop("disabled", true);
                });
            }
        }

        objParam.className += " btn_active";
        $("button[name='check_errFl']").each(function(cnt, obj) {
            if (obj.id != objParam.id) {
                $(this).removeClass("btn_active");
            }
        });

        var errorF2 = objParam.id == 'checkErrFl02';
        if (errorF2) {
            $("button[name='check_use']").each(function() {
                $(this).prop("disabled", false);
            });
        }
    }

    //사용할기능 선택
    function fncCheckUse(objParam) {
        var resetFl = objParam.id == 'checkUse01';
        if (resetFl) { //Back 체크클릭시 전체 선택항목 삭제
            if (!confirm('<spring:message code="global.info.selectAreaReset" />')) { //선택항목에 대하여 초기화 하시겠습니까?
                //OK 체크후 선택항목 초기화 질문에 대하여 취소 버튼 클릭시
                return false;
            } else {
                deleteMakerDivAll(); //전체 선택항목 삭제
            }
        }

        objParam.className += " btn_active";
        $("button[name='check_use']").each(function(cnt, obj) {
            if (obj.id != objParam.id) {
                $(this).removeClass("btn_active");
            }
        });
        $("button[name='check_errType']").each(function() {
            $(this).prop("disabled", true);
        });

        var writeF2 = objParam.id == 'checkUse02';
        if (writeF2) {
            $("button[name='check_errType']").each(function() {
                $(this).prop("disabled", false);
            });
        }
    }

    //파손유형 선택
    function fncCheckErrType(objParam) {
        objParam.className += " btn_active";
        $("button[name='check_errType']").each(function(cnt, obj) {
            if (obj.id != objParam.id) {
                $(this).removeClass("btn_active");
            }
        });
        checkCurrentErrType = objParam.id;
    }

    //외부검사 좌표 생성
    function makeOffSet(obj) { //  ex):divcheckErrType04_192_170
        var splitId = obj.id.split("_");
        return {
            "x" : splitId[1],
            "y" : splitId[2]
        };
    }

    //외부검사 버튼 클릭후 화면 세팅 및 불러오기
    function makeDataImgMap() {
        var divcheckErrType01List = [];
        var divcheckErrType02List = [];
        var divcheckErrType03List = [];
        var divcheckErrType04List = [];
        var divcheckErrType05List = [];
        var divcheckErrType06List = [];

        var data = [];
        $("div.checkErrType01").each(function(cnt, obj) {
            divcheckErrType01List.push(makeOffSet(obj));
        });
        $("div.checkErrType02").each(function(cnt, obj) {
            divcheckErrType02List.push(makeOffSet(obj));
        });
        $("div.checkErrType03").each(function(cnt, obj) {
            divcheckErrType03List.push(makeOffSet(obj));
        });
        $("div.checkErrType04").each(function(cnt, obj) {
            divcheckErrType04List.push(makeOffSet(obj));
        });
        $("div.checkErrType05").each(function(cnt, obj) {
            divcheckErrType05List.push(makeOffSet(obj));
        });
        $("div.checkErrType06").each(function(cnt, obj) {
            divcheckErrType06List.push(makeOffSet(obj));
        });
        var saveData = {
            "carBodyChkList01" : divcheckErrType01List,
            "carBodyChkList02" : divcheckErrType02List,
            "carBodyChkList03" : divcheckErrType03List,
            "carBodyChkList04" : divcheckErrType04List,
            "carBodyChkList05" : divcheckErrType05List,
            "carBodyChkList06" : divcheckErrType06List
        };
        return JSON.stringify(saveData);
    }

    //저장된 데이터 불러와서 화면 세팅
    function drawDataImgMap(paramData) {
        //console.log("drawDataImgMap > paramData :" + paramData);

        var paramJson = JSON.parse(paramData);
        var divcheckErrType01List = paramJson.carBodyChkList01;
        var divcheckErrType02List = paramJson.carBodyChkList02;
        var divcheckErrType03List = paramJson.carBodyChkList03;
        var divcheckErrType04List = paramJson.carBodyChkList04;
        var divcheckErrType05List = paramJson.carBodyChkList05;
        var divcheckErrType06List = paramJson.carBodyChkList06;
        if (divcheckErrType01List.length != 0) {
            $.each(divcheckErrType01List, function(i, row) {
                makerDiv(row.x, row.y, "checkErrType01");
            });
        }
        if (divcheckErrType02List.length != 0) {
            $.each(divcheckErrType02List, function(i, row) {
                makerDiv(row.x, row.y, "checkErrType02");
            });
        }
        if (divcheckErrType03List.length != 0) {
            $.each(divcheckErrType03List, function(i, row) {
                makerDiv(row.x, row.y, "checkErrType03");
            });
        }
        if (divcheckErrType04List.length != 0) {
            $.each(divcheckErrType04List, function(i, row) {
                makerDiv(row.x, row.y, "checkErrType04");
            });
        }
        if (divcheckErrType05List.length != 0) {
            $.each(divcheckErrType05List, function(i, row) {
                makerDiv(row.x, row.y, "checkErrType05");
            });
        }
        if (divcheckErrType06List.length != 0) {
            $.each(divcheckErrType06List, function(i, row) {
                makerDiv(row.x, row.y, "checkErrType06");
            });
        }
    }
    /***** 차신(외부검사) *****/
    /***** 차신(외부검사)[End] *****/
    goPreChkStatus = function() {
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.preCheckList'/>",
                                        "<c:url value='/ser/ro/preCheck/selectPreCheckListMain.do'/>",
                                        "VIEW-D-10334"); // 사전점검현황
    };
</script>
<!-- //script -->

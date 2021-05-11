<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div style="min-height:205px;">
    <div class="table_form table_form_btn">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10.5%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span id="roadTerm" name="roadTerm" ><spring:message code="ser.lbl.roadCondition" /></span></th>   <!-- 도로조건 -->
                    <td><button type="button" id="roadTermCd1" name="roadTermCd1" value="Y" class="btn_s btn_s_v4"><spring:message code="ser.lbl.highway" /></button></td> <!-- 고속도로 -->
                    <td><button type="button" id="roadTermCd2" name="roadTermCd2" class="btn_s btn_s_v4"><spring:message code="ser.lbl.asphalt" /></button></td> <!-- asphalt -->
                    <td><button type="button" id="roadTermCd3" name="roadTermCd3" class="btn_s btn_s_v4"><spring:message code="ser.lbl.cementRoad" /></button></td> <!-- 시멘트 도로 -->
                    <td><button type="button" id="roadTermCd4" name="roadTermCd4" class="btn_s btn_s_v4"><spring:message code="ser.lbl.stonyRoad" /></button></td> <!-- 모래돌 도로 -->
                    <td><button type="button" id="roadTermCd5" name="roadTermCd5" class="btn_s btn_s_v4"><spring:message code="ser.lbl.soilRoad" /></button></td> <!-- 흙 도로 -->
                    <td><input type="text" id="roadTermCont" name="roadTermCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                </tr>
                <tr>
                    <th scope="row"><span id="roadPrcn" name="roadPrcn" ><spring:message code="ser.lbl.roadState" /></span></th> <!-- 도로현황 -->
                    <td><button type="button" id="roadPrcnCd1" name="roadPrcnCd1" class="btn_s btn_s_v4"><spring:message code="ser.lbl.ground" /></button></td> <!-- 수평 -->
                    <td><button type="button" id="roadPrcnCd2" name="roadPrcnCd2" class="btn_s btn_s_v4"><spring:message code="ser.lbl.uphill" /></button></td> <!-- 오름막 -->
                    <td><button type="button" id="roadPrcnCd3" name="roadPrcnCd3" class="btn_s btn_s_v4"><spring:message code="ser.lbl.downhill" /></button></td> <!-- 내리막 -->
                    <td><button type="button" id="roadPrcnCd4" name="roadPrcnCd4" class="btn_s btn_s_v4"><spring:message code="ser.lbl.sharpCurve" /></button></td> <!-- 코너(급) -->
                    <td><button type="button" id="roadPrcnCd5" name="roadPrcnCd5" class="btn_s btn_s_v4"><spring:message code="ser.lbl.curve" /></button></td> <!-- 코너(일반) -->
                    <td><input type="text" id="roadPrcnCont" name="roadPrcnCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                </tr>
                <tr>
                    <th scope="row"><span id="wetrTerm" name="wetrTerm"><spring:message code="ser.lbl.weatherCondition" /></span></th> <!-- 날씨조건 -->
                    <td><button type="button" id="wetrTermCd1" name="wetrTermCd1" class="btn_s btn_s_v4"><spring:message code="ser.lbl.fineWeather" /></button></td> <!-- 개임 -->
                    <td><button type="button" id="wetrTermCd2" name="wetrTermCd2" class="btn_s btn_s_v4"><spring:message code="ser.lbl.windyWeather" /></button></td> <!-- 바람 -->
                    <td><button type="button" id="wetrTermCd3" name="wetrTermCd3" class="btn_s btn_s_v4"><spring:message code="ser.lbl.rainWeather" /></button></td> <!-- 비 -->
                    <td><button type="button" id="wetrTermCd4" name="wetrTermCd4" class="btn_s btn_s_v4"><spring:message code="ser.lbl.snowWeather" /></button></td> <!-- 눈 -->
                    <td><input type="text" id="wetrTermCd5" name="wetrTermCd5" class="form_input ar form_input2" maxlength="3" style="width:30%;" data-type="number" data-name="<spring:message code="ser.lbl.temperature" />"> <span class="span_txt"><spring:message code="ser.lbl.temperature" /></span></td> <!-- ℃ -->
                    <td><input type="text" id="wetrTermCont" name="wetrTermCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                </tr>
                <tr>
                    <th scope="row"><span id="occrFreq" name="occrFreq"><spring:message code="ser.lbl.frequency" /></span></th> <!-- 발생빈도 -->
                    <td><button type="button" id="occrFreqCd1" name="occrFreqCd1" class="btn_s btn_s_v4"><spring:message code="ser.lbl.once" /></button></td> <!-- 한번만 -->
                    <td><button type="button" id="occrFreqCd2" name="occrFreqCd2" class="btn_s btn_s_v4"><spring:message code="ser.lbl.often" /></button></td> <!-- 자주 -->
                    <td><button type="button" id="occrFreqCd3" name="occrFreqCd3" class="btn_s btn_s_v4"><spring:message code="ser.lbl.reqular" /></button></td> <!-- 정기적 -->
                    <td><button type="button" id="occrFreqCd4" name="occrFreqCd4" class="btn_s btn_s_v4"><spring:message code="ser.lbl.occasionality" /></button></td> <!-- 비정기적 -->
                    <td><input type="text" id="occrFreqCd5" name="occrFreqCd5" class="form_input ar form_input2" data-type="number" min="1" data-name="<spring:message code="ser.lbl.repeat"/>" style="width:30%;"/> <span class="span_txt"><spring:message code="ser.lbl.repeat" /></span></td> <!-- 차수 -->
                    <td><input type="text" id="occrFreqCont" name="occrFreqCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->

                </tr>
                <tr>
                    <th scope="row"><span id="driveStat" name="driveStat"><spring:message code="ser.lbl.driveState" /></span></th> <!-- 운전상태 -->
                    <td><button type="button" id="driveStatCd1" name="driveStatCd1" class="btn_s btn_s_v4"><spring:message code="ser.lbl.accelerateFast" /></button></td> <!-- 가속(급) -->
                    <td><button type="button" id="driveStatCd2" name="driveStatCd2" class="btn_s btn_s_v4"><spring:message code="ser.lbl.accelerate" /></button></td> <!-- 가속(일반) -->
                    <td><button type="button" id="driveStatCd3" name="driveStatCd3" class="btn_s btn_s_v4"><spring:message code="ser.lbl.suddenStop" /></button></td> <!-- 감속(급) -->
                    <td><button type="button" id="driveStatCd4" name="driveStatCd4" class="btn_s btn_s_v4"><spring:message code="ser.lbl.slowDown" /></button></td> <!-- 감속(일반) -->
                    <td><input type="text" id="driveStatCd5" name="driveStatCd5" class="form_input ar form_input2" data-type="number" min="1" maxlength="3" data-name="<spring:message code="ser.lbl.kmH" />" style="width:30%;" /> <span class="span_txt"><spring:message code="ser.lbl.kmH" /></span></td> <!-- KM/H -->
                    <td><input type="text" id="driveStatCont" name="driveStatCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                </tr>
                <tr>
                    <th scope="row"><span id="operStat" name="operStat"><spring:message code="ser.lbl.workState" /></span></th> <!-- 작업상태 -->
                    <td><button type="button" id="operStatCd1" name="operStatCd1" class="btn_s btn_s_v4"><spring:message code="ser.lbl.cooling" /></button></td> <!-- 냉강 -->
                    <td><button type="button" id="operStatCd2" name="operStatCd2" class="btn_s btn_s_v4"><spring:message code="ser.lbl.heatUp" /></button></td> <!-- 열강 -->
                    <td><button type="button" id="operStatCd3" name="operStatCd3" class="btn_s btn_s_v4"><spring:message code="ser.lbl.startUp" /></button></td> <!-- 시동 -->
                    <td><button type="button" id="operStatCd4" name="operStatCd4" class="btn_s btn_s_v4"><spring:message code="ser.lbl.airConOn" /></button></td> <!-- 에어컨가동 -->
                    <td><input type="text" id="operStatCd5" name="operStatCd5" class="form_input ar form_input2" min="1" maxlength="3" data-type="number" data-name="<spring:message code="ser.lbl.step" />"  style="width:30%;"/> <span class="span_txt"><spring:message code="ser.lbl.step" /></span></td> <!-- 단계 -->
                    <td><input type="text" id="operStatCont" name="operStatCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                </tr>
            </tbody>
        </table>
    </div>
</div>
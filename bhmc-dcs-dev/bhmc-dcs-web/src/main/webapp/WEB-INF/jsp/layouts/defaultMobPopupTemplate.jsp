<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocale}">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title><tiles:insertAttribute name="title" /></title>


<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>"> --%>


<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">


<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/mdms.css"/>">


<script type="text/javascript" src="<c:url value="/resources/js/mob/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bxslider/jquery.bxslider.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.culture.${springLocale}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->

<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<script type="text/javascript">
    kendo.culture("${springLocale}");
    var strY = '<spring:message code="mobile.lbl.year" />';
    var strM = '<spring:message code="mobile.lbl.month" />';
    var strPm = '<spring:message code="mobile.lbl.pm" />';
    var strAm = '<spring:message code="mobile.lbl.am" />';
    var strHour = '<spring:message code="mobile.lbl.hour" />';
    var strMinute = '<spring:message code="mobile.lbl.minute" />';
    var strSecond = '<spring:message code="mobile.lbl.second" />';
    var confirmMsgDel = "<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />";//삭제하시겟습니까?
    var confirmMsgSave = "<spring:message code='cmm.info.saveYn'/>";//저장 하시겠습니까??
    var confirmMsgUpdate = "<spring:message code='cmm.info.updtYn'/>";//수정 하시겠습니까??

    var y = "<spring:message code='global.lbl.yes'/>";
    var n = "<spring:message code='global.lbl.n'/>";

</script>
<script type="text/javascript" src="<c:url value="/resources/js/mob/mobCommon.js"/>"></script>


</head>

<body>

<!-- mwrap -->
<div>

    <!-- container -->
    <div>
        <tiles:insertAttribute name="body" />

        <!--  calendar picker  -->
        <section class="m_calpicker">
            <div class="choice_date"> <!--  코드 사이에 띄어쓰기 들어가면 안됩니다.  -->
                <span id="btnPrevYear" class="yprev">이전년도</span><span id="selectYear" class="yvalue">2016년</span><spring:message code="mobile.lbl.year" /><span id="btnNextYear" class="ynext">다음년도</span><span id="btnPrevMonth" class="mprev">이전달</span><span id="selectMonth" class="mvalue">4월</span><spring:message code="mobile.lbl.month" /><span id="btnNextMonth" class="mnext">다음달</span>
            </div>
            <div style="display:none"><span id="selectDate"></span></div>
            <div class="m_calendararea">
                <table>
                    <thead>
                        <tr>
                            <th scope="col"><spring:message code="global.lbl.sunday" /><!-- 일 --></th>
                            <th scope="col"><spring:message code="global.lbl.monday" /><!-- 월 --></th>
                            <th scope="col"><spring:message code="global.lbl.tuesday" /><!-- 화 --></th>
                            <th scope="col"><spring:message code="global.lbl.wednesday" /><!-- 수 --></th>
                            <th scope="col"><spring:message code="global.lbl.thursday" /><!-- 목 --></th>
                            <th scope="col"><spring:message code="global.lbl.friday" /><!-- 금 --></th>
                            <th scope="col"><spring:message code="global.lbl.saturday" /><!-- 토 --></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="r0">
                            <td id="r0c0td"><span id="r0c0t"></span><span id="r0c0d"></span></td>
                            <td id="r0c1td"><span id="r0c1t"></span><span id="r0c1d"></span></td>
                            <td id="r0c2td"><span id="r0c2t"></span><span id="r0c2d"></span></td>
                            <td id="r0c3td"><span id="r0c3t"></span><span id="r0c3d"></span></td>
                            <td id="r0c4td"><span id="r0c4t"></span><span id="r0c4d"></span></td>
                            <td id="r0c5td"><span id="r0c5t"></span><span id="r0c5d"></span></td>
                            <td id="r0c6td"><span id="r0c6t"></span><span id="r0c6d"></span></td>
                        </tr>
                        <tr id="r1">
                            <td id="r1c0td"><span id="r1c0t"></span><span id="r1c0d"></span></td>
                            <td id="r1c1td"><span id="r1c1t"></span><span id="r1c1d"></span></td>
                            <td id="r1c2td"><span id="r1c2t"></span><span id="r1c2d"></span></td>
                            <td id="r1c3td"><span id="r1c3t"></span><span id="r1c3d"></span></td>
                            <td id="r1c4td"><span id="r1c4t"></span><span id="r1c4d"></span></td>
                            <td id="r1c5td"><span id="r1c5t"></span><span id="r1c5d"></span></td>
                            <td id="r1c6td"><span id="r1c6t"></span><span id="r1c6d"></span></td>
                        </tr>
                        <tr id="r2">
                            <td id="r2c0td"><span id="r2c0t"></span><span id="r2c0d"></span></td>
                            <td id="r2c1td"><span id="r2c1t"></span><span id="r2c1d"></span></td>
                            <td id="r2c2td"><span id="r2c2t"></span><span id="r2c2d"></span></td>
                            <td id="r2c3td"><span id="r2c3t"></span><span id="r2c3d"></span></td>
                            <td id="r2c4td"><span id="r2c4t"></span><span id="r2c4d"></span></td>
                            <td id="r2c5td"><span id="r2c5t"></span><span id="r2c5d"></span></td>
                            <td id="r2c6td"><span id="r2c6t"></span><span id="r2c6d"></span></td>
                        </tr>
                        <tr id="r3">
                            <td id="r3c0td"><span id="r3c0t"></span><span id="r3c0d"></span></td>
                            <td id="r3c1td"><span id="r3c1t"></span><span id="r3c1d"></span></td>
                            <td id="r3c2td"><span id="r3c2t"></span><span id="r3c2d"></span></td>
                            <td id="r3c3td"><span id="r3c3t"></span><span id="r3c3d"></span></td>
                            <td id="r3c4td"><span id="r3c4t"></span><span id="r3c4d"></span></td>
                            <td id="r3c5td"><span id="r3c5t"></span><span id="r3c5d"></span></td>
                            <td id="r3c6td"><span id="r3c6t"></span><span id="r3c6d"></span></td>
                        </tr>
                        <tr id="r4">
                            <td id="r4c0td"><span id="r4c0t"></span><span id="r4c0d"></span></td>
                            <td id="r4c1td"><span id="r4c1t"></span><span id="r4c1d"></span></td>
                            <td id="r4c2td"><span id="r4c2t"></span><span id="r4c2d"></span></td>
                            <td id="r4c3td"><span id="r4c3t"></span><span id="r4c3d"></span></td>
                            <td id="r4c4td"><span id="r4c4t"></span><span id="r4c4d"></span></td>
                            <td id="r4c5td"><span id="r4c5t"></span><span id="r4c5d"></span></td>
                            <td id="r4c6td"><span id="r4c6t"></span><span id="r4c6d"></span></td>
                        </tr>
                        <tr id="r5">
                            <td id="r5c0td"><span id="r5c0t"></span><span id="r5c0d"></span></td>
                            <td id="r5c1td"><span id="r5c1t"></span><span id="r5c1d"></span></td>
                            <td id="r5c2td"><span id="r5c2t"></span><span id="r5c2d"></span></td>
                            <td id="r5c3td"><span id="r5c3t"></span><span id="r5c3d"></span></td>
                            <td id="r5c4td"><span id="r5c4t"></span><span id="r5c4d"></span></td>
                            <td id="r5c5td"><span id="r5c5t"></span><span id="r5c5d"></span></td>
                            <td id="r5c6td"><span id="r5c6t"></span><span id="r5c6d"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btnarea">
                <span id="btnCalendarConfirm" class="btnd1"><spring:message code="global.btn.confirm" /><!-- 확인 --></span>
            </div>
        </section>

        <!-- datepicker -->
        <section class="m_datepicker">
            <ul>
                <li class="year">
                    <span id="btnNextYear2" class="next2"></span>
                    <span id="nextYear2" class="next"></span>
                    <span id="selectYear2" class="choice"></span>
                    <span id="prevYear2" class="prev"></span>
                    <span id="btnPrevYear2" class="prev2"></span>
                </li>
                <li class="month">
                    <span id="btnNextMonth2" class="next2"></span>
                    <span id="nextMonth2" class="next"></span>
                    <span id="selectMonth2" class="choice"></span>
                    <span id="prevMonth2" class="prev"></span>
                    <span id="btnPrevMonth2" class="prev2"></span>
                </li>
            </ul>
            <div class="btnarea">
                <span id="btnMonthConfirm" class="btnd1"><spring:message code="global.btn.confirm" /><!-- 확인 --></span>
            </div>
        </section>

        <!-- timepicker -->
        <section class="m_timepicker">
            <ul>
                <li>
                    <span id="btnPrevAMPM" class="next"></span>
                    <span id="selectAMPM" class="choice"></span>
                    <span id="btnNextAMPM" class="prev"></span>
                </li>
                <li>
                    <span id="btnPrevHour" class="next"></span>
                    <span id="selectHour" class="choice"></span>
                    <span id="btnNextHour" class="prev"></span>
                </li>
                <li>
                    <span id="btnPrevMinute" class="next"></span>
                    <span id="selectMinute" class="choice"></span>
                    <span id="btnNextMinute" class="prev"></span>
                </li>
                <li>
                    <span id="btnPrevSecond" class="next"></span>
                    <span id="selectSecond" class="choice"></span>
                    <span id="btnNextSecond" class="prev"></span>
                </li>
            </ul>
            <div class="btnarea">
                <span id="btnTimeConfirm" class="btnd1"><spring:message code="global.btn.confirm" /><!-- 확인 --></span>
            </div>
        </section>
        <!-- timepicker2 -->
        <section class="m_timepicker2">
            <ul>
                <li>
                    <span id="btnPrevAMPM2" class="next"></span>
                    <span id="selectAMPM2" class="choice"></span>
                    <span id="btnNextAMPM2" class="prev"></span>
                </li>
                <li>
                    <span id="btnPrevHour2" class="next"></span>
                    <span id="selectHour2" class="choice"></span>
                    <span id="btnNextHour2" class="prev"></span>
                </li>
                <li>
                    <span id="btnPrevMinute2" class="next"></span>
                    <span id="selectMinute2" class="choice"></span>
                    <span id="btnNextMinute2" class="prev"></span>
                </li>
            </ul>
            <div class="btnarea">
                <span id="btnTimeConfirm2" class="btnd1"><spring:message code="global.btn.confirm" /><!-- 확인 --></span>
            </div>
        </section>

    </div>
</div>

<script type="text/javascript">
/**
 * 조회 영역[AREA]에서 엔터키 입력시 이벤트 처리
 * ex)<div class="table_form" role="search" data-btnid="btnSearch"></div>
 */
 $(".table_form[role=search]").keyup(function(e) {    	 
     var btnid = $(this).attr("data-btnid");
     if (e.keyCode == 13 && btnid) {
    	 setTimeout(function(){
    		 $("#"+btnid).click();
    	 });             
     }
 });



 $(document).ready(function() {

    /************************************************************
      * 달력 기능버튼 설정
      ************************************************************/
     $("#btnPrevYear").bind("click", function()
     {
         $("#selectYear").text(parseInt($("#selectYear").text()) - 1);
         $("#selectMonth").text(parseInt($("#selectMonth").text()) - 1);
         dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
         if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
         setCalendar(dt_curr);
     });

     $("#btnNextYear").bind("click", function()
     {
         $("#selectYear").text(parseInt($("#selectYear").text()) + 1);
         $("#selectMonth").text(parseInt($("#selectMonth").text()) - 1);
         dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
         if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
         setCalendar(dt_curr);
     });

     $("#btnPrevMonth").bind("click", function()
     {
         $("#selectMonth").text(parseInt($("#selectMonth").text()) - 2);
         dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
         if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
         setCalendar(dt_curr);
     });

     $("#btnNextMonth").bind("click", function()
     {
         dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
         if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
         setCalendar(dt_curr);
     });

     $("#btnCalendarConfirm").bind("click", function()
     {
         dt_curr = new Date($("#selectYear").text(), parseInt($("#selectMonth").text()) - 1, $("#selectDate").text());
         //objCal.val(kendo.toString(dt_curr, "<dms:configValue code='dateFormat' />"));
         objCal.val(kendo.toString(dt_curr, dateFormat));

         pickerClose();
     });

     /************************************************************
      * 년월 기능버튼 설정
      ************************************************************/
     $("#btnPrevYear2").bind("click", function()
     {
         var selYear = $("#selectYear2").text().split(" ");

         $("#prevYear2").text((parseInt(selYear[0]) - 2) + " " + "<spring:message code="mobile.lbl.year" />");
         $("#selectYear2").text((parseInt(selYear[0]) - 1) + " " + "<spring:message code="mobile.lbl.year" />");
         $("#nextYear2").text(selYear[0] + " " + "<spring:message code="mobile.lbl.year" />");
     });

     $("#btnNextYear2").bind("click", function()
     {
         var selYear = $("#selectYear2").text().split(" ");

         $("#prevYear2").text(selYear[0] + " " + "<spring:message code="mobile.lbl.year" />");
         $("#selectYear2").text((parseInt(selYear[0]) + 1) + " " + "<spring:message code="mobile.lbl.year" />");
         $("#nextYear2").text((parseInt(selYear[0]) + 2) + " " + "<spring:message code="mobile.lbl.year" />");
     });

     $("#btnPrevMonth2").bind("click", function()
     {
         var selMonth = $("#selectMonth2").text().split(" ");

         $("#prevMonth2").text(((parseInt(selMonth[0]) - 2) + (((parseInt(selMonth[0]) - 2) < 1) ? 12:0 )) + " " + "<spring:message code="mobile.lbl.month" />");
         $("#selectMonth2").text(((parseInt(selMonth[0]) - 1) + (((parseInt(selMonth[0]) - 1) < 1) ? 12:0 )) + " " + "<spring:message code="mobile.lbl.month" />");
         $("#nextMonth2").text(selMonth[0] + " " + "<spring:message code="mobile.lbl.month" />");
     });

     $("#btnNextMonth2").bind("click", function()
     {
         var selMonth = $("#selectMonth2").text().split(" ");

         $("#prevMonth2").text(selMonth[0] + " " + "<spring:message code="mobile.lbl.month" />");
         $("#selectMonth2").text(((parseInt(selMonth[0]) + 1) - (((parseInt(selMonth[0]) + 1) > 12) ? 12:0 )) + " " + "<spring:message code="mobile.lbl.month" />");
         $("#nextMonth2").text(((parseInt(selMonth[0]) + 2) - (((parseInt(selMonth[0]) + 2) > 12) ? 12:0 )) + " " + "<spring:message code="mobile.lbl.month" />");
     });

     $("#btnMonthConfirm").bind("click", function()
     {
         var selYear = $("#selectYear2").text().split(" ");
         var selMonth = $("#selectMonth2").text().split(" ");

         dt_curr = selYear[0] + "-" + (selMonth[0].length > 1 ? "":"0") + selMonth[0];
         objCal.val(dt_curr);
         pickerClose();
     });

     /************************************************************
      * 시간 기능버튼 설정
      ************************************************************/
     $("#btnPrevAMPM").bind("click", function()
     {
         $("#selectAMPM").text($("#selectAMPM").text() == "<spring:message code="mobile.lbl.am" />" ? "<spring:message code="mobile.lbl.pm" />":"<spring:message code="mobile.lbl.am" />");
     });

     $("#btnNextAMPM").bind("click", function()
     {
         $("#selectAMPM").text($("#selectAMPM").text() == "<spring:message code="mobile.lbl.am" />" ? "<spring:message code="mobile.lbl.pm" />":"<spring:message code="mobile.lbl.am" />");
     });

     $("#btnPrevHour").bind("click", function()
     {
         var selHour = $("#selectHour").text().split(" ");

         $("#selectHour").text(((selHour[0] == "1") ? "12":(parseInt(selHour[0]) - 1)) + " " + "<spring:message code="mobile.lbl.hour" />");
     });

     $("#btnNextHour").bind("click", function()
     {
         var selHour = $("#selectHour").text().split(" ");

         $("#selectHour").text(((selHour[0] == "12") ? "1":(parseInt(selHour[0]) + 1)) + " " + "<spring:message code="mobile.lbl.hour" />");
     });

     $("#btnPrevMinute").bind("click", function()
     {
         var selMinute = $("#selectMinute").text().split(" ");

         $("#selectMinute").text(((selMinute[0] == "0") ? "59":(parseInt(selMinute[0]) - 1)) + " " + "<spring:message code="mobile.lbl.minute" />");
     });

     $("#btnNextMinute").bind("click", function()
     {
         var selMinute = $("#selectMinute").text().split(" ");

         $("#selectMinute").text(((selMinute[0] == "59") ? "0":(parseInt(selMinute[0]) + 1)) + " " + "<spring:message code="mobile.lbl.minute" />");
     });

     $("#btnPrevSecond").bind("click", function()
     {
         var selSecond = $("#selectSecond").text().split(" ");

         $("#selectSecond").text(((selSecond[0] == "0") ? "59":(parseInt(selSecond[0]) - 1)) + " " + "<spring:message code="mobile.lbl.second" />");
     });

     $("#btnNextSecond").bind("click", function()
     {
         var selSecond = $("#selectSecond").text().split(" ");

         $("#selectSecond").text(((selSecond[0] == "59") ? "0":(parseInt(selSecond[0]) + 1)) + " " + "<spring:message code="mobile.lbl.second" />");
     });

     /************************************************************
      * 시간 기능버튼 설정(HH:MM)
      ************************************************************/

     $("#btnPrevAMPM2").bind("click", function()
     {
         $("#selectAMPM2").text($("#selectAMPM2").text() == "<spring:message code="mobile.lbl.am" />" ? "<spring:message code="mobile.lbl.pm" />":"<spring:message code="mobile.lbl.am" />");
     });

     $("#btnNextAMPM2").bind("click", function()
     {
         $("#selectAMPM2").text($("#selectAMPM2").text() == "<spring:message code="mobile.lbl.am" />" ? "<spring:message code="mobile.lbl.pm" />":"<spring:message code="mobile.lbl.am" />");
     });

     $("#btnPrevHour2").bind("click", function()
     {
         var selHour = $("#selectHour2").text().split(" ");

         //$("#selectHour2").text(((selHour[0] == "1") ? "12":(parseInt(selHour[0]) - 1)) + " " + "<spring:message code="mobile.lbl.hour" />");
         $("#selectHour2").text(((selHour[0] == "0" || selHour[0] == "1") ? "12":(parseInt(selHour[0]) - 1)) + " " + "<spring:message code="mobile.lbl.hour" />");
     });

     $("#btnNextHour2").bind("click", function()
     {
         var selHour = $("#selectHour2").text().split(" ");

         $("#selectHour2").text(((selHour[0] == "12") ? "1":(parseInt(selHour[0]) + 1)) + " " + "<spring:message code="mobile.lbl.hour" />");
     });

     $("#btnPrevMinute2").bind("click", function()
     {
         var selMinute = $("#selectMinute2").text().split(" ");

         $("#selectMinute2").text(((selMinute[0] == "0") ? "59":(parseInt(selMinute[0]) - 1)) + " " + "<spring:message code="mobile.lbl.minute" />");
     });

     $("#btnNextMinute2").bind("click", function()
     {
         var selMinute = $("#selectMinute2").text().split(" ");

         $("#selectMinute2").text(((selMinute[0] == "59") ? "0":(parseInt(selMinute[0]) + 1)) + " " + "<spring:message code="mobile.lbl.minute" />");
     });

     $("#btnPrevSecond2").bind("click", function()
     {
         var selSecond = $("#selectSecond2").text().split(" ");

         $("#selectSecond2").text(((selSecond[0] == "0") ? "59":(parseInt(selSecond[0]) - 1)) + " " + "<spring:message code="mobile.lbl.second" />");
     });

     $("#btnNextSecond2").bind("click", function()
     {
         var selSecond = $("#selectSecond2").text().split(" ");

         $("#selectSecond2").text(((selSecond[0] == "59") ? "0":(parseInt(selSecond[0]) + 1)) + " " + "<spring:message code="mobile.lbl.second" />");
     });


     $("#btnTimeConfirm").bind("click", function()
     {
         var selHour = $("#selectHour").text().split(" ");
         var selMinute = $("#selectMinute").text().split(" ");
         var selSecond = $("#selectSecond").text().split(" ");

         //dt_curr = $("#selectAMPM").text() + " " + (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] + ":" + (selSecond[0].length > 1 ? "":"0") + selSecond[0];

         if(strPm ==$("#selectAMPM").text()){ //오후인경우
             selHour[0] = parseInt(selHour[0]) +12+"";
             if(selHour[0] =="24")
                 selHour[0] = "0";
             dt_curr = (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] + ":" + (selSecond[0].length > 1 ? "":"0") + selSecond[0];
         } else { //오전
             dt_curr = (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] + ":" + (selSecond[0].length > 1 ? "":"0") + selSecond[0];
         }

         objCal.val(dt_curr);
         pickerClose();
     });

     /************************************************************
      * 시간 기능버튼 설정(HH:MM)
      ************************************************************/
     $("#btnTimeConfirm2").bind("click", function()
     {
         var selHour = $("#selectHour2").text().split(" ");
         var selMinute = $("#selectMinute2").text().split(" ");

         //dt_curr = $("#selectAMPM").text() + " " + (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] + ":" + (selSecond[0].length > 1 ? "":"0") + selSecond[0];

         if(strPm ==$("#selectAMPM2").text()){ //오후인경우
             selHour[0] = parseInt(selHour[0]) +12+"";
             /* if(selHour[0] =="24")
                 selHour[0] = "0"; */
             dt_curr = (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] ;
         } else { //오전
             dt_curr = (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] ;
         }

         objCal.val(dt_curr);
         pickerClose();
     });


     setMainListHeight();

 });



</script>
</body>
</html>

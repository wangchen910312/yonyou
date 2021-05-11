<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <div class="content_title">
            <h1><spring:message code='global.menu.config' /><!-- 설정 --></h1>
        </div>

            <div class="formarea">
                <table class="flist01">
                    <caption><spring:message code='global.menu.config' /><!-- 설정 --></caption>
                    <colgroup>
                        <col style="width:35%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.versionInfo' /><!-- 버전정보 --></th>
                            <td><spring:message code='global.lbl.currentVersion' /><!-- 현재버전 --> 1.1.1</td>
                        </tr>
                        <tr>
                            <td><spring:message code='global.lbl.newVersion' /><!-- 최신버전 --> 1.2.1</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.account' /><!-- 계정 --></th>
                            <td>张三</td><!-- 홍길동 -->
                        </tr>
                        <tr>
                            <td>hong</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.alarm' /><!-- 알람 --></th>
                            <td>接收</td><!-- 받기 -->
                        </tr>
                        <tr>
                            <td><spring:message code='global.lbl.alarmInterval' /><!-- 알람간격 -->
                                <select class="f_select" id="" >
                                    <option selected>5分</option><!-- 5분 -->
                                    <option>10分</option>
                                    <option>20分</option>
                                    <option>30分</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </section>

    <!--  calendar picker  -->
    <section class="m_calpicker">
        <div class="choice_date"> <!--  코드 사이에 띄어쓰기 들어가면 안됩니다.  -->
            <span id="btnPrevYear" class="yprev">이전년도</span><span id="selectYear" class="yvalue">2016</span><spring:message code="mobile.lbl.year" /><span id="btnNextYear" class="ynext">다음년도</span><span id="btnPrevMonth" class="mprev">이전달</span><span id="selectMonth" class="mvalue">4월</span><spring:message code="mobile.lbl.month" /><span id="btnNextMonth" class="mnext">다음달</span>
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

    <div id="docu_prev">이전</div>
    <div id="docu_top">TOP</div>


<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

$(document).ready(function() {
    //타이틀
    //$("#header_title").html("<spring:message code='global.title.sumOrderCntDlr' />");<!-- 종합오더현황-딜러 -->
    $("#header_title").on("click", contentSearch);

    //종합오더현황 목록 조회
    //$("#mainList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrList.do' />");

    //버튼 - 조회
    //$("#btnSearch").bind("click", function()
    //{
        //contentList();
        //$("#mainList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrList.do' />");
    //});

    //버튼 - 전체조건 삭제
    //$("#btnAllDelete").bind("click", function()
    //{
        //$("#sOrdStatCd").data("kendoExtDropDownList").value("");
        //$("#sCarlineCd").data("kendoExtDropDownList").value("");
        //$("#sModelCd").data("kendoExtDropDownList").value("");
        //$("#sOcnCd").data("kendoExtDropDownList").value("");
        //$("#sExtColorCd").data("kendoExtDropDownList").value("");
        //$("#sIntColorCd").data("kendoExtDropDownList").value("");
        //$("#btnSearch").click();
    //});

    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        goMain();
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });

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
        objCal.val(kendo.toString(dt_curr, "<dms:configValue code='dateFormat' />"));
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

    $("#btnTimeConfirm").bind("click", function()
    {
        var selHour = $("#selectHour").text().split(" ");
        var selMinute = $("#selectMinute").text().split(" ");
        var selSecond = $("#selectSecond").text().split(" ");

        dt_curr = $("#selectAMPM").text() + " " + (selHour[0].length > 1 ? "":"0") + selHour[0] + ":" + (selMinute[0].length > 1 ? "":"0") + selMinute[0] + ":" + (selSecond[0].length > 1 ? "":"0") + selSecond[0];
        objCal.val(dt_curr);
        pickerClose();
    });

});

// iframe 높이값 계산
function setMainListHeight() {
    //var lsitareaHeight = $(window).height() - $("#header").height() - $("#content_list > .content_title").height() - $("#content_list > .content_search").height() - 17;
    //$("#mainList").parent(".listarea").css("height", lsitareaHeight);
    //$("#mainList").css("height", lsitareaHeight - $("#content_list > .listarea > ul.dlist01").height());

    var lsitareaHeight = $(window).height() - $("#header").height() - $("#content_list > .content_title").height() - $("#content_list > .content_search").height() - $("#content_list > .listarea").height();
    //alert($(window).height());
    //alert($(document).height());
    $("#mainList").css("height", lsitareaHeight);
}

//메인화면 가기
function goMain() {
    window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_list").css("display","block");
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
}

//상세페이지 보기
function contentDetail() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
}

var objCal;
function calpicker(objName){
    var pickerWidth = $(".m_calpicker").innerWidth();
    var pickerHeight = $(".m_calpicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    objCal = $("#" + objName);
    var currDate = objCal.val();
    var dt_curr = (currDate == null || currDate == "" || currDate.length < 10 ?  new Date():kendo.parseDate(currDate, "<dms:configValue code='dateFormat' />"));
    setCalendar(dt_curr);
    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_calpicker").css({"left":left,"top":top,"display":"block"});
}

function datepicker(objName){
    var pickerWidth = $(".m_datepicker").innerWidth();
    var pickerHeight = $(".m_datepicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    objCal = $("#" + objName);
    var currDate = objCal.val();
    var selYear = (currDate == null || currDate == "" || currDate.length) < 6 ?  (new Date()).getFullYear():parseInt(currDate.substring(0, 4));
    $("#prevYear2").text((parseInt(selYear) - 1) + " " + "<spring:message code="mobile.lbl.year" />");
    $("#selectYear2").text(selYear + " " + "<spring:message code="mobile.lbl.year" />");
    $("#nextYear2").text((parseInt(selYear) + 1) + " " + "<spring:message code="mobile.lbl.year" />");
    var selMonth = (currDate == null || currDate == "" || currDate.length < 6) ? ((new Date()).getMonth() + 1):parseInt(currDate.substring(currDate.length - 2));
    $("#prevMonth2").text(((parseInt(selMonth) - 1) + (((parseInt(selMonth) - 1) < 1) ? 12:0 )) + " " + "<spring:message code="mobile.lbl.month" />");
    $("#selectMonth2").text(selMonth + " " + "<spring:message code="mobile.lbl.month" />");
    $("#nextMonth2").text(((parseInt(selMonth) + 1) - (((parseInt(selMonth) + 1) > 12) ? 12:0 )) + " " + "<spring:message code="mobile.lbl.month" />");

    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_datepicker").css({"left":left,"top":top,"display":"block"});
}

function timepicker(objName){
    var pickerWidth = $(".m_timepicker").innerWidth();
    var pickerHeight = $(".m_timepicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    objCal = $("#" + objName);
    var currDate = objCal.val();
    var ampm = "";
    var hours = 0;
    var minutes = 0;
    var seconds = 0;
    if (currDate == null || currDate == "" || currDate.split(" ").length < 2) {
        var dt_datetime = new Date();
        hours = dt_datetime.getHours();
        ampm = hours >= 12 ? "<spring:message code="mobile.lbl.pm" />":"<spring:message code="mobile.lbl.am" />";
        hours = hours % 12 ? hours % 12:12;
        minutes = dt_datetime.getMinutes();
        seconds = dt_datetime.getSeconds();
    }
    else {
        var currDates = currDate.split(" ");
        var currTimes = currDates[1].split(":");
        ampm = currDates[0];
        hours = currTimes[0];
        minutes = currTimes[1];
        seconds = currTimes[2];
    }
    $("#selectAMPM").text(ampm);
    $("#selectHour").text(hours + " " + "<spring:message code="mobile.lbl.hour" />");
    $("#selectMinute").text(minutes + " " + "<spring:message code="mobile.lbl.minute" />");
    $("#selectSecond").text(seconds + " " + "<spring:message code="mobile.lbl.second" />");
    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_timepicker").css({"left":left,"top":top,"display":"block"});
}
function pickerClose(){
    $(".m_calpicker").css("display","none");
    $(".m_datepicker").css("display","none");
    $(".m_timepicker").css("display","none");
    $(".blind").animate({opacity:'0'},200).queue(function(){$(".blind").remove();});
}

function setCalendar(dt_datetime){
    $("#selectYear").text(dt_datetime.getFullYear());
    $("#selectMonth").text(dt_datetime.getMonth() + 1);
    $("#selectDate").text(dt_datetime.getDate());

    var dt_today = new Date();
    var dt_firstday = new Date(dt_datetime.getFullYear(), dt_datetime.getMonth(), dt_datetime.getDate());
    dt_firstday.setDate(1);
    dt_firstday.setDate(1 - (dt_firstday.getDay() % 7));

    var dt_current_day = new Date(dt_firstday.getFullYear(), dt_firstday.getMonth(), dt_firstday.getDate());
    for (var ridx = 0; ridx < 6; ridx++) {
        for (var cidx = 0; cidx < 7; cidx++) {
            $("#r" + ridx + "c" + cidx + "td").unbind("click");
            $("#r" + ridx + "c" + cidx + "td").attr("class", "");
            $("#r" + ridx + "c" + cidx + "t").attr("class", "");
            $("#r" + ridx + "c" + cidx + "d").css("color", "");
            $("#r" + ridx + "c" + cidx + "d").text("");
        }
    }

    var ridx = 0;
    while (dt_current_day.getMonth() == dt_datetime.getMonth() || dt_current_day.getMonth() == dt_firstday.getMonth()) {
        for (var cidx = 0; cidx < 7; cidx++) {
            $("#r" + ridx + "c" + cidx + "d").text(dt_current_day.getDate());
            if (dt_current_day.getDay() == 0) $("#r" + ridx + "c" + cidx + "d").css("color", "red");
            if (dt_current_day.getDay() == 6) $("#r" + ridx + "c" + cidx + "d").css("color", "blue");
            if (dt_today.getFullYear() == dt_current_day.getFullYear() && dt_today.getMonth() == dt_current_day.getMonth() && dt_today.getDate() == dt_current_day.getDate()) $("#r" + ridx + "c" + cidx + "t").attr("class", "today");
            if (dt_current_day.getFullYear() == dt_datetime.getFullYear() && dt_current_day.getMonth() == dt_datetime.getMonth() && dt_current_day.getDate() == dt_datetime.getDate()) $("#r" + ridx + "c" + cidx + "td").attr("class", "event");

            if (dt_current_day.getMonth() == dt_datetime.getMonth()) {
                $("#r" + ridx + "c" + cidx + "td").bind("click", function()
                {
                    $("#selectMonth").text(parseInt($("#selectMonth").text()) - 1);
                    $("#selectDate").text(this.innerText);
                    dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
                    if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
                    setCalendar(dt_curr);
                });
            }
            else if (dt_current_day.getMonth() == dt_firstday.getMonth()) {
                $("#r" + ridx + "c" + cidx + "td").bind("click", function()
                {
                    $("#selectMonth").text(parseInt($("#selectMonth").text()) - 2);
                    $("#selectDate").text(this.innerText);
                    dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
                    if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
                    setCalendar(dt_curr);
                });
            }
            else {
                $("#r" + ridx + "c" + cidx + "td").bind("click", function()
                {
                    $("#selectDate").text(this.innerText);
                    dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
                    if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
                    setCalendar(dt_curr);
                });
            }

            dt_current_day.setDate(dt_current_day.getDate()+1);
        }
        ridx++;
    }
}
</script>
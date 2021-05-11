<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <!-- content -->
    <section id="content">
        <div class="content_title">
            <h1>2016<spring:message code='mobile.lbl.year' /><!-- 년 --> 4<spring:message code='mobile.lbl.month' /><!-- 월 --></h1>
        </div>
        <div class="m_calendar">
            <table onclick="javascript:goDaily();">
                <caption>달력입니다. </caption>
                <colgroup>
                    <col style="width:14%;">
                    <col style="width:14.5%;">
                    <col style="width:14.5%;">
                    <col style="width:14.5%;">
                    <col style="width:14.5%;">
                    <col style="width:14.5%;">
                    <col style="width:">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><spring:message code='global.lbl.sunday' /><!-- 일 --></th>
                        <th scope="col"><spring:message code='global.lbl.monday' /><!-- 월 --></th>
                        <th scope="col"><spring:message code='global.lbl.tuesday' /><!-- 화 --></th>
                        <th scope="col"><spring:message code='global.lbl.wednesday' /><!-- 수 --></th>
                        <th scope="col"><spring:message code='global.lbl.thursday' /><!-- 목 --></th>
                        <th scope="col"><spring:message code='global.lbl.friday' /><!-- 금 --></th>
                        <th scope="col"><spring:message code='global.lbl.saturday' /><!-- 토 --></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><span class="date">1</span></td>
                        <td><span class="date">2</span></td>
                    </tr>
                    <tr>
                        <td><span class="date">3</span></td>
                        <td><span class="date">4</span></td>
                        <td><span class="date">5</span></td>
                        <td><span class="date">6</span></td>
                        <td><span class="date">7</span></td>
                        <td><span class="date">8</span></td>
                        <td><span class="date">9</span></td>
                    </tr>
                    <tr>
                        <td><span class="date">10</span><span class="w1">事物1</span><span class="w2">事物2</span><span class="w3">事物3</span></td>
                        <td><span class="date">11</span><span class="w1">事物1</span><span class="w2">事物2</span><span class="w3">事物3</span></td>
                        <td><span class="date">12</span></td>
                        <td class="today"><span class="date">13</span></td>
                        <td><span class="date">14</span></td>
                        <td><span class="date">15</span></td>
                        <td><span class="date">16</span><span class="w1">事物1</span><span class="w2">事物2</span><span class="w3">事物3</span></td>
                    </tr>
                    <tr>
                        <td><span class="date">17</span></td>
                        <td><span class="date">18</span></td> 
                        <td><span class="date">19</span></td>
                        <td><span class="date">20</span></td>
                        <td><span class="date">21</span></td>
                        <td><span class="date">22</span></td>
                        <td><span class="date">23</span></td>
                    </tr>
                    <tr>
                        <td><span class="date">24</span><span class="w1">事物1</span><span class="w2">事物2</span><span class="w3">事物3</span></td>
                        <td><span class="date">25</span></td>
                        <td><span class="date">26</span></td>
                        <td><span class="date">27</span></td>
                        <td><span class="date">28</span></td>
                        <td><span class="date">29</span></td>
                        <td><span class="date">30</span></td>
                    </tr>
                </tbody>
            </table>
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
    var pressTimer;

    //버튼 - 이전
    $("#docu_prev").kendoButton({
        click:function(e) {
            goMain();
        }
    });

    //버튼 - TOP
    $("#docu_top").kendoButton({
        click:function(e) {
            $("body,html").animate({scrollTop:0}, 200);
        }
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
});

//메인화면 가기
function goMain() {
    window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}


//일별화면 가기 - 일자별로 설정해야함
function goDaily() {
    window.open("<c:url value='/mob/cmm/calendar/selectDailyMain.do'/>", "_self");
}
</script>
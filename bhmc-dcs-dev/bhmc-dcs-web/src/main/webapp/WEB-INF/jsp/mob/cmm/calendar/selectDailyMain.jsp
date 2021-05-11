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
            <h1>2016<spring:message code='mobile.lbl.year' /><!-- 년 --> 04<spring:message code='mobile.lbl.month' /><!-- 월 --> 16<spring:message code='mobile.lbl.day' /><!-- 일 --></h1>
        </div>
        <div class="m_calday">
            <table onclick="javascript:goDaily();">
                <caption>달력입니다. </caption>
                <colgroup>
                    <col style="width:70px;">
                    <col style="width:">
                </colgroup>
                <tbody>
                    <tr>
                        <td>11:30</td>
                        <td>
                            <ul>
                                <li><strong>张三</strong> <span class="point1"> 010-1111-1111</span></li><!-- 홍길동 -->
                                <li>伊兰特 1.6</li><!-- 아반떼 1.6 -->
                                <li>试驾预约</li><!-- 시승예약 -->
                                <li>1小时 担当SC 预约</li><!-- 1시간 담당SC 예약 -->
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>12:30</td>
                        <td>
                            <ul>
                                <li><strong>张三</strong> <span class="point1"> 010-1111-1111</span></li>
                                <li>伊兰特 1.6</li>
                                <li>试驾预约</li>
                                <li>1小时 担当SC 预约</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>14:30</td>
                        <td>
                            <ul>
                                <li><strong>张三</strong> <span class="point1"> 010-1111-1111</span></li>
                                <li>伊兰特 1.6</li>
                                <li>试驾预约</li>
                                <li>1小时 担当SC 预约</li>
                            </ul>
                        </td>
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


//달력화면 가기 - 임시
function goDaily() {
  window.open("<c:url value='/mob/cmm/calendar/selectCalendarMain.do'/>", "_self");
}
</script>
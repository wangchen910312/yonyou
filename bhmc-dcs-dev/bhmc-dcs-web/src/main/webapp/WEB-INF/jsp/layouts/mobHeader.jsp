<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />


<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

        <span class="allmenu">주요메뉴 열기</span>
        <nav id="nav">
            <div class="navarea">
                <!-- 개인정보 -->
                <div class="userinfo" id="userInfoArea">
                    <p class="user">${userNm}(${dlrNm})<!-- 관리자(연구원) --></p>
                    <div class="ubtnarea">
                        <span class="home" onclick="javascript:goMain();"><spring:message code='global.menu.home' /><!-- 홈 --></span>
                        <span class="setting" onclick="javascript:goConfigure();"><spring:message code='global.menu.config' /><!-- 설정 --></span>
                        <span class="logtout" onclick="javascript:goLogout();"><spring:message code='global.menu.logout' /><!-- 로그아웃 --></span>
                    </div>
                </div>
                <!-- // 개인정보 -->

                <!-- 메뉴 영역 -->
                <iframe id="mainMenu" border="0" frameborder="0" width="100%" height="100%" scrolling="yes"></iframe>
                <span class="closeallmenu"><spring:message code='global.btn.closeAllMenu' /><!-- 주요메뉴 닫기 --></span>
            </div>
        </nav>
        <h1 id="header_title"><spring:message code='global.title.dmsTitle' /><!-- 北京现代 DMS --></h1>
        <span class="alarm" onclick="javascript:goAlarm();">알림<span class="alarm_num">0</span></span>

<!-- script -->
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

// 랜드스케이프시 메뉴 높이 체크
$(window).resize(function(){
    $("#nav").css("height", $(window).height());
    $("#mainMenu").attr("height", $(window).height() - 60);
});

$(document).ready(function() {

    $("#mainMenu").attr("src", "<c:url value='/mob/cmm/main/selectMenuMain.do'/>");
    $("#mainMenu").attr("height", $(window).height() - 60);

    // var userInfoAreaHeight = 0;
    // userInfoAreaHeight = setTimeout(function(){$("#userInfoArea").outerHeight();}, 600);
    // $("#mainMenu").attr("height", $(window).height() - $("#userInfoArea").height());
    // $("#mainMenu").attr("height", $(window).height() - userInfoAreaHeight);
    //$("#nav").css("height", $(window).height());
    //$("#mainMenu").attr("src", "<c:url value='/mob/cmm/main/selectMenuMain.do'/>");
    //setTimeout(function(){ document.getElementById("mainMenu").contentWindow.document.location.reload();}, 600);

    // menu slider
    $(".allmenu").click(function(){
        $("body").append("<div class='mblind' onclick='allmenuClose()'></div>");
        $(".mblind").show().animate({opacity:'0.8'},500);
        $("#nav").show().animate({left:'0'},500);
        $('body').css({overflow:'hidden'});

        // $('body').css({overflow:'hidden'}).bind('touchmove', function(e){e.preventDefault()});
        //document.getElementById("mainMenu").contentWindow.document.location.reload();
        // $("iframe").load(function(){
        //  $(this).contents().find('body');
        // });
    });
    $(".closeallmenu").click(function(){
        allmenuClose();
    });

    $("#nav").css("height", $(window).height());

    //$(".alarm_num").text("1121");
    // 알림건수 취득 로직
    var alarmDbCnt = 0;
    var params = {};

    $.ajax({
        url:"<c:url value='/mob/cmm/alarm/selectAlarmCnt.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            addAlarmNum(alarmDbCnt);
        }
        ,success:function(result) {
            alarmDbCnt = result.total;
            addAlarmNum(alarmDbCnt);
        }
    });
    // alarm 데이터 건수 취득
    setTimeout(initAlarmReceive,10000);

});

function allmenuClose(){
    $(".mblind").animate({opacity:'0'},200).queue(function(){$(".mblind").remove();});
    $("#nav").hide().animate({left:'-350px'},500);
    jQuery('body').css({overflow:''});
    // jQuery('body').css({overflow:''}).unbind('touchmove');
}

//alarm 데이터 건수 취득 [S] //alarm WebSocket send측 구현후 추가예정
var client;
initAlarmReceive = function(){
    /*
    console.log("initAlarmReceive ::::::::::::::"+new Date());
    console.log("initAlarmReceive window.WebSocket ::::::::::::::"+window.WebSocket);
    //$("#connect_clientId").val("example-"+(Math.floor(Math.random() * 100000)));
    if( !window.WebSocket) {
        console.log("initAlarmReceive ::::::::::::::window.WebSocket fail");
    } else {


      //임시테스트
        var host = "localhost";
        var port = "61614";
        var clientId = "example";
        var user = "admin";
        var password = "password";

        client = new Messaging.Client(host, Number(port), clientId);

        client.onConnect = onConnectAlarm;

        client.onMessageArrived = onMessageArrived;
        client.onConnectionLost = onConnectionLost;

        client.connect({
          userName:user,
          password:password,
          onSuccess:onConnectAlarm,
          onFailure:onFailureAlarm
        });



      function onMessageArrived(message) {
          var curCnt = parseInt($(".alarm_num").text());
          $(".alarm_num").text(curCnt +1 );
          client.disconnect();

      }

      function onConnectionLost(responseObject) {
        if (responseObject.errorCode !== 0) {
            //debug(client.clientId + ":" + responseObject.errorCode + "\n");
            console.log(client.clientId + ":" + responseObject.errorCode + "\n");
        }
      }

    }
    */
};

/* // the client is notified when it is connected to the server.
var onConnectAlarm = function(frame) {
  var destination = "/topic/event";
  client.subscribe(destination);
};
//alarm 취득 실패시
function onFailureAlarm(failure) {
    console.log("failure");
    console.log(failure.errorMessage);
    client.disconnect();
} */
//alarm 데이터 건수 취득 [E]

function addAlarmNum(param){
    var curCnt = parseInt($(".alarm_num").text());
    $(".alarm_num").text(param + curCnt);
}

function goTodo(mode) {
    window.open("<c:url value='/mob/cmm/todo/selectTodoMain.do'/>?mode=" + mode, "_self");
}

function goBarcode() {
    alert("Device Not Found !");
}

function goCamera() {
    alert("Device Not Found !");
}

function goCalendar() {
    window.open("<c:url value='/mob/cmm/calendar/selectCalendarMain.do'/>", "_self");
}

function goOther4() {
    alert("Device Not Found !");
}

function goOther5() {
    alert("Device Not Found !");
}

function goMenu(goUrl) {
    window.open(goUrl, "_self");
}

function goAlarm() {
    //alert("준비중입니다.");
    alert("开发中 ");

    return;
    window.open("<c:url value='/mob/cmm/alarm/selectAlarmMain.do'/>", "_self");
}

function goConfigure() {
    window.open("<c:url value='/mob/cmm/configure/selectConfigureMain.do'/>", "_self");
}

function goLogout() {
window.open("<c:url value='/cmm/ath/login/selectLogoutAction.do'/>?logoutSuccessUrl=/mob/cmm/login/selectLoginMain.do", "_self");
//     window.open("<c:url value='/mob/cmm/login/selectLoginMain.do'/>", "_self");

}

function goMain() {
    window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}
</script>
<!-- //script -->

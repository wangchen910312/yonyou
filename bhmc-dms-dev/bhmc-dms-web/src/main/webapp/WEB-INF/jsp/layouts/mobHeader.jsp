<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <!-- <span class="alarm" onclick="javascript:goAlarm();">알림<span class="alarm_num">0</span></span> -->
        <span class="alarm" onclick="javascript:goMain();"><span class="home_bt"></span></span>
<!-- script -->
<script>


var alarmDbCnt = 0;

var isFirstTodo = true;
var todoDbCnt = 0;
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
var isFirst = true;

// 랜드스케이프시 메뉴 높이 체크
$(window).resize(function(){
    $("#nav").css("height", $(window).height());
    $("#mainMenu").attr("height", $(window).height() - 60);
});

$(document).ready(function() {

    $("#mainMenu").attr("src", "<c:url value='/mob/cmm/main/selectMenuMain.do'/>");
    $("#mainMenu").attr("height", $(window).height() - 60);

    // menu slider
    $(".allmenu").click(function(){
        $("body").append("<div class='mblind' onclick='allmenuClose()'></div>");
        $(".mblind").show().animate({opacity:'0.8'},500);
        $("#nav").show().animate({left:'0'},500,function() {

            /*ios때문에 ... 이거 아니면 초기에 메뉴가 화면만큼 짤려서 나온다*/
            var temp=$("#mainMenu").contents().find(".nav_favorites");
            $(temp).children('span').click();
            setTimeout(function(){$(temp).children('span').click();},1);
            /*ios때문에 ... 이거 아니면 초기에 메뉴가 화면만큼 짤려서 나온다*/
        });
        $('body').css({overflow:'hidden'});

    });
    $(".closeallmenu").click(function(){
        allmenuClose();
    });

    $("#nav").css("height", $(document).height());


    // alarm 데이터 건수 취득
    getAlarmInfo();
    getTodoInfo();

});

function allmenuClose(){
    $(".mblind").animate({opacity:'0'},200).queue(function(){$(".mblind").remove();});
    $("#nav").hide().animate({left:'-350px'},500);
    jQuery('body').css({overflow:''});
    // jQuery('body').css({overflow:''}).unbind('touchmove');
}

//alarm 데이터 건수 취득 [S] //alarm WebSocket send측 구현후 추가예정
getAlarmInfo = function(){
    var paramsA = {};
    paramsA["sMesgTp"] = "P";
    paramsA["sSendYn"] = "Y";
    paramsA["sReceiveYn"] = "N";
    $.ajax({
        url:"<c:url value='/mob/cmm/alarm/selectAlarmCnt.do' />"
        ,data:JSON.stringify(paramsA)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            //parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
        ,success:function(result) {
            var data = [];
            rowTotal = result.total;
            if(!isFirst){
                if(alarmDbCnt < result.total){
                    getAlarmInfoOneMsg();
                }
            }else{
                isFirst=false;
            }
            alarmDbCnt = result.total;
            $("#alarmCnt").text(alarmDbCnt);
        },
        complete:function(){
            setTimeout(getAlarmInfo,10000);
        }
    });
};


getAlarmInfoOneMsg = function(){
    var paramsA = {};
    /* var pageIndex = 0, pageSize = 100;
    var rowIndex = 0, rowTotal = 1000;
    paramsA["recordCountPerPage"] = pageSize;
    paramsA["pageIndex"] = pageIndex; */
    paramsA["firstIndex"] = 0;
    paramsA["lastIndex"] = 1;
    paramsA["sMesgTp"] = "P";
    paramsA["sSendYn"] = "Y";
    paramsA["sReceiveYn"] = "N";
    $.ajax({
        url:"<c:url value='/mob/cmm/alarm/selectAlarm.do' />"
        ,data:JSON.stringify(paramsA)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            //parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
        ,success:function(result) {
            mob.notification.show(result.data[0].mesgCont,"callFunc:goAlarm()");
        }
    });
};

function addAlarmNum(param){
    var curCnt = parseInt($(".alarm_num").text());
    $(".alarm_num").text(param + curCnt);
}

function goTodo(mode) {
    window.open("<c:url value='/mob/cmm/todo/selectTodoInfoMain.do'/>?mode=" + mode, "_self");
}
function goCustomerInfo(custNoKey) {
    window.open("<c:url value='/mob/crm/cif/customerInfo/selectCustomerInfoMain.do'/>?custNo=" + custNoKey, "_self");
}
function goBoard(mode) {
    window.open("<c:url value='/mob/cmm/bbs/generalBoard/selectBoardMain.do'/>?mode=" + mode, "_self");
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
    //alert("开发中 ");

    //return;
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
function goWhere(_url){
    //window.open(_contextPath + _url, "_self");
    window.open("${pageContext.request.contextPath}" + _url, "_self");
}


getTodoInfo = function(){
    var pageIndex = 0, pageSize = 100;
    var rowIndex = 0, rowTotal = 1000;

    if (rowIndex >= rowTotal)
    {
        return;
    }
    pageIndex++;

    var params = {};
    params["recordCountPerPage"] = pageSize;
    params["pageIndex"] = pageIndex;
    params["firstIndex"] = (pageIndex - 1) * pageSize;
    params["lastIndex"] = pageIndex * pageSize;
    params["sActionTargetTp"]="03";

    $.ajax({
        url:"<c:url value='/mob/cmm/todo/selectUnconfirmedTodoCnt.do'/>"
       ,data:JSON.stringify(params)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,success:function(result) {
           if(!isFirstTodo){
               if(todoDbCnt < result.total){
                   mob.notification.show("<spring:message code='global.lbl.add' var='added' /><spring:message code='global.title.workStatus' var='workStatus' /><spring:message code='global.info.stInfo' arguments='${added}, ${workStatus}'/>","callFunc:goTodo(1)");
               }
           }else{
               isFirstTodo=false;
           }
           todoDbCnt = result.total;
           $("#todoCnt").text(result.total);
       }
       ,error:function(jqXHR,status,error) {
           return false;
       }
       ,complete:function(){
           setTimeout(getTodoInfo,10000);
       }
   });

}

function resultSave(obj){
    //alert(obj);
}
</script>
<!-- //script -->

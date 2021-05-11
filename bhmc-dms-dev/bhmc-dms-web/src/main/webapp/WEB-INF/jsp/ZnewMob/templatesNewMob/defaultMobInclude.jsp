<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/mdms.css"/>">
<style type="text/css">
.k-list-scroller{overflow: scroll;}
input[type="date"]{-webkit-appearance: none;-moz-appearance: none;}</style>
<script type="text/javascript" src="<c:url value="/resources/js/mob/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.culture.${springLocale}.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/mob/_mobCommon.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>
<script type="text/javascript">
var strY = '<spring:message code="mobile.lbl.year" />';
var strM = '<spring:message code="mobile.lbl.month" />';
var strPm = '<spring:message code="mobile.lbl.pm" />';
var strAm = '<spring:message code="mobile.lbl.am" />';
var strHour = '<spring:message code="mobile.lbl.hour" />';
var strMinute = '<spring:message code="mobile.lbl.minute" />';
var strSecond = '<spring:message code="mobile.lbl.second" />';
var confirmMsgDel = "<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />";
var confirmMsgSave = "<spring:message code='cmm.info.saveYn'/>";
var confirmMsgUpdate = "<spring:message code='cmm.info.updtYn'/>";
var y = "<spring:message code='global.lbl.yes'/>";
var n = "<spring:message code='global.lbl.n'/>";

var _favoriteReloadFlag = true;
var alarmDbCnt = 0;
var todoDbCnt = 0;
var isFirstAlarm = true;
var isFirstTodo = true;
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
            if(!isFirstAlarm){
                if(alarmDbCnt < result.total){
                    getAlarmInfoOneMsg();
                }
            }else{
                isFirstAlarm=false;
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

getTodoInfo = function(){
    var params = {};
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
                   mob.notification.show("<spring:message code='global.lbl.add' var='added' /><spring:message code='global.title.workStatus' var='workStatus' /><spring:message code='global.info.stInfo' arguments='${added}, ${workStatus}'/>","callFunc:goTodo(3)");
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
function goAlarm() {
    window.open("<c:url value='/mob/cmm/alarm/selectAlarmMain.do'/>", "_self");
}

function goConfigure() {
    window.open("<c:url value='/mob/cmm/configure/selectConfigureMain.do'/>", "_self");
}
function goWhere(_url){
    window.open("${pageContext.request.contextPath}" + _url, "_self");
}
function favClick(e){
    var strViewUrl = $(e).attr("data-url");
    window.open(strViewUrl, "_self");
}
function allmenuClose(){
    $(".mblind").animate({opacity:'0'},200).queue(function(){$(".mblind").remove();});
    $("#nav").hide().animate({left:'-350px'},500);
    jQuery('body').css({overflow:''});
}
function goLogout() {
    $("#impoartPage, .allmenu").hide();
    $("#loadingScreen").show();
    window.open(_contextPath+"/cmm/ath/login/selectLogoutAction.do?logoutSuccessUrl=/mob/cmm/login/selectLoginMain.do", "_self");
}
function goMain(){
    $("#impoartPage, .allmenu").hide();
    $("#loadingScreen").show();
    setTimeout(function (){window.open(_contextPath+"/mob/cmm/main/selectMain.do", "_self");},100);
}
function showLoading(){
    $("#impoartPage, #nav").hide();
    $("#loadingScreen").show();
}
$(document).ready(function (){

    $("#loadingScreen").css(
            {"background-image":"url("+"<c:url value='/resources/img/mob/loading-image_t.gif' />"+")"
                ,"background-repeat":"no-repeat"
                ,"background-position":"center"
                ,"background-color":"white"});
    $("#loadingScreen").height($(window).height());
    $("#loadingScreen").hide();

    // menu slider
    $(".allmenu").click(function(){
        $("body").append("<div class='mblind' onclick='allmenuClose()'></div>");
        $(".mblind").show().animate({opacity:'0.8'},500);
        $("#nav").show().animate({left:'0'},500,function() {

        });
        $('body').css({overflow:'hidden'});

    });
    $(".closeallmenu").click(function(){
        allmenuClose();
    });

    $("#nav").css("height", $(document).height());


    $('#fav_cont').on("click", ".btn_favorites", function(e) {
        var strViewId= $(this).data("viewid");
        $('#menuFavIcon'+ strViewId).click();
    });

     $(".menu").click(function(e){
        showLoading();
        var strViewUrl = $(this).attr("data-url");
        window.open(strViewUrl, "_self");
    });

    // menu active
    $("#gnb > li > span, #gnb > li.nav_allmenu > ul > li > ul > li > span").click(function(){
        $(this).parent().toggleClass("active");
    });
    $("#gnb > li.nav_allmenu > ul > li > span").click(function(){
        if($(this).parent().hasClass("active") === true){
            $(this).parent().removeClass("active");
        }
        else{
            $(this).parent().siblings().removeClass("active");
            $(this).parent().addClass("active");
        }
    });

    //btn_favorites toggle
    $("#gnb .btn_favorites").click(function(){
        $(this).toggleClass("active");
    });

    getAlarmInfo();
    getTodoInfo();
});
</script>

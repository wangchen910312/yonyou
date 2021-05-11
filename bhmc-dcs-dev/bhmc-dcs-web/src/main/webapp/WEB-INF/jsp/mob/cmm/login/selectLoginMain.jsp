<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocale}">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/mdms.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/jquery.bxslider.css"/>">


<script type="text/javascript" src="<c:url value="/resources/js/mob/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bxslider/jquery.bxslider.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
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
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
</head>

<body>

<!-- login-->
<!-- <div class="k-loading-image" id="loadingDiv" style="display:none;"></div> -->
<div class="login_wrap" id="login_wrap">
    <section class="login">
        <h1><spring:message code='global.title.dmsFullTitle' /><!-- 北京现代 Dealer Management System  --></h1>
        <div class="login_form">
            <form id="f" name="f" action="<c:url value='/cmm/ath/login/selectLoginAction.do'/>" method='POST'>
            <input type="hidden" name="loginFailureUrl" value="/mob/cmm/login/selectLoginMain.do" />
            <input type="hidden" name="defaultTargetUrl" value="/mob/cmm/main/selectMain.do" />
            <input type="hidden" id="usrPwEnc" name="usrPwEnc" />
            <!-- <input type="hidden" name="loginFailureUrl" value="/mob/cmm/login/selectLoginMain.do" /> -->
               <div class="input_area">
                    <span class="icon_id"></span>
                    <input type="text" id="usrId" name="usrId" placeholder="User ID" value="" class="login_input">
                </div>
                <div class="input_area">
                    <span class="icon_pw"></span>
                    <input type="password" id="usrPw" name="usrPw" placeholder="Password" value="" class="login_input">
                </div>
                <div class="login_txt">
                   <input type="checkbox" class="form_check" id="rememberYn"><label for="rememberYn"> <spring:message code="global.lbl.usrIdSave" /><!-- 아이디 저장 --></label>
                </div>
            </form>
            <button class="btn_login" id="btnLogin"><spring:message code="global.btn.login" /><!-- 로그인 --></button>
        </div>
    </section>
    <p class="copyright">Copyright &copy; 2009-2016<br>BEIJING HYUNDAI MOTOR COMPANY Corporation,<br>All Rights Reserved.</p>



</div>
<!-- //login -->

<!-- script -->
<script type="text/javascript">

var isError  = "${error}";

$(document).ready(function() {
    //input focus
    $("input").focus(function(){ $(this).parent("div").addClass("f_focus");}).blur(function(){  $(this).parent("div").removeClass("f_focus"); });
    if(isError !=""){
        //pushLayer('#lay_01');
        //$("#lay_01 .lay_cont2").text("<spring:message code='global.err.invalid.idpw' />");
        notification.warning("<spring:message code='global.err.invalid.idpw' />");
        //return;
    }
    //버튼 - 로그인
/*     $("#btnLogin").click(function(){
        $("#f").submit();
    }); */

    $("#btnLogin").click(function(){


        if (dms.string.isEmpty($("#usrId").val())){

            //pushLayer('#lay_01');
            //$("#lay_01 .lay_cont2").text("<spring:message code='global.lbl.usrId' var='msgUsrId' /><spring:message code='global.info.validation.required' arguments='${msgUsrId}' />");
            notification.warning("<spring:message code='global.lbl.usrId' var='msgUsrId' /><spring:message code='global.info.validation.required' arguments='${msgUsrId}' />");
            return false;
        }

        if (dms.string.isEmpty($("#usrPw").val())){
            //pushLayer('#lay_01');
            //$("#lay_01 .lay_cont2").text("<spring:message code='global.lbl.usrPw' var='msgUsrPw' /><spring:message code='global.info.validation.required' arguments='${msgUsrPw}' />");
            notification.warning("<spring:message code='global.lbl.usrPw' var='msgUsrPw' /><spring:message code='global.info.validation.required' arguments='${msgUsrPw}' />");
            return false;
        }

        if ($("#rememberYn").prop("checked")) {
            dms.cookie.setCookie("rememberYn", 'Y', 7);
            dms.cookie.setCookie("usrId", $("#usrId").val(), 7);
        }else {
            dms.cookie.removeCookie("rememberYn");
            dms.cookie.removeCookie("usrId");
        }

        $("#loadingDiv").show();

        $("#usrPwEnc").val(hex_sha2($("#usrPw").val()));
        $("#usrPw").val("");

        $("#f").submit();
    });

});

//popup
function pushLayer(layerName){
    var layerName = $(layerName);
    var layWidth = layerName.width();
    var layHeight = layerName.height();
    var left=($(window).width()-layWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-layHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("body").append("<div class='blind' onclick='layerClose(" + layerName.attr("id") + ")'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(layerName).css({"left":left,"top":top,"display":"block"});
}
function layerClose(layerName){
    $(layerName).css("display","none");
    //$(".lay_pop").css("display","none");
    $(".blind").animate({opacity:'0'},200).queue(function(){$(".blind").remove();});
}



var notification = {
        show:function(messages, notificationType) {
            var tapTimer, isTapHold = false;
            var layerPopStr = "";
            //기존에 존재하던 메세지 삭제 , 재 호출시 기존 메세지 표시 되는 오류 수정
            $('#lay_pop').remove();
            layerPopStr += '<section id="lay_pop" class="lay_pop">';
            if(notificationType=="info"){
                layerPopStr += '    <div class="lay_title">';
                layerPopStr += '        <h1>提醒</h1>';
                layerPopStr += '    </div>';
            }
            if (typeof messages == "string") {
                layerPopStr += '    <div class="lay_cont2">';
                layerPopStr += '        <span class="contents">'+messages+'</span>';
            } else if(typeof messages == "object") {
                layerPopStr += '    <div class="lay_cont2 al">';
                layerPopStr += '        <span class="contents">';
                $.each(messages, function(idx, error){
                    layerPopStr +=  error + "<br/>";
                });
                layerPopStr += '        </span>';
            }
            layerPopStr += '        </div>';
            layerPopStr += '        <div class="btnarea">';
            layerPopStr += "            <span class='btnd1' onclick='layerClose(\"#lay_pop\");'>关闭</span>";
            layerPopStr += '        </div>';
            layerPopStr += '</section>';
            $("#login_wrap").append(layerPopStr);

            pushLayer('#lay_pop');

        },
        info:function(messages) {
            this.show(messages, "info");
        },
        success:function(messages) {
            this.show(messages, "success");
        },
        warning:function(messages) {
            this.show(messages, "warning");
        },
        error:function(messages) {
            this.show(messages, "error");
        }
    };

</script>
<!-- //script -->

</body>
</html>
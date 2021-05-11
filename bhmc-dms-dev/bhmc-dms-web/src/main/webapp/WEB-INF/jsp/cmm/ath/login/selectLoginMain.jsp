<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>

<!-- login -->
<div class="login_wrap">
    <section class="login">
        <h1>
            <spring:message code="global.title.dmsTitle" />
        </h1>
        <div class="login_box" id="loginFormContainer">

            <div class="img_car"><img src="<c:url value='/resources/img/img_login_car.png' />"></div>

            <h2>User Login</h2>
            <form id="loginForm" name='loginForm' action='<c:url value="/cmm/ath/login/selectLoginAction.do" />' method='post'>
                <input type="hidden" id="usrPwEnc" name="usrPwEnc" />
<!--                 <input type="hidden" id="defaultTargetUrl" name="defaultTargetUrl" value="/selectHome.do?viewId=VIEW-D-10313" /> -->
                <div class="input_area">
                    <span class="icon_id"></span>
                    <input type="text" id="usrId" name="usrId" placeholder="User ID" class="login_input">
                </div>

                <div class="input_area">
                    <span class="icon_pw"></span>
                    <input type="password" id="usrPw" name="usrPw" placeholder="Password" class="login_input">
                </div>
            </form>

            <button class="btn_login" id="btnLogin"><spring:message code="global.menu.login" /></button>

            <div class="login_txt">
                <label><input id="rememberYn" type="checkbox" class="form_check"> <spring:message code="global.lbl.usrIdSave" /></label>
            </div>

            <!-- login_error_message -->
            <div class="error_msg" id="errorMessageContext" <c:if test="${error == null}">style="display:none"</c:if>>
                <p id="errorMessageTxt">
                    <c:if test="${error != null}">
                    <strong>${error.errorMessage}</strong>
                    </c:if>
                </p>
            </div>
            <!-- //login_error_message -->

        </div>
    </section>
</div>

<script type="text/javascript">

$(document).ready(function() {

    //사용자 ID 저장 체크
    if (dms.cookie.getCookie("rememberYn") == 'Y') {
        var usrId = dms.cookie.getCookie("usrId");

        $("#rememberYn").prop("checked", true);
        $("#usrId").val(usrId);
    }

    $("#usrId").bind("change", function(){
        $("#errorMessageContext").hide();
    });

    $("#usrPw").bind("change", function(){
        $("#errorMessageContext").hide();
    });

    $("#btnLogin").click(function(){

        if (dms.string.isEmpty($("#usrId").val())){
            $("#errorMessageContext").show();
            $("#errorMessageTxt").text("<spring:message code='global.lbl.usrId' var='msgUsrId' /><spring:message code='global.info.validation.required' arguments='${msgUsrId}' />");
            return;
        }

        if (dms.string.isEmpty($("#usrPw").val())){
            $("#errorMessageContext").show();
            $("#errorMessageTxt").text("<spring:message code='global.lbl.usrPw' var='msgUsrPw' /><spring:message code='global.info.validation.required' arguments='${msgUsrPw}' />");
            return;
        }

        if ($("#rememberYn").prop("checked")) {
            dms.cookie.setCookie("rememberYn", 'Y', 7);
            dms.cookie.setCookie("usrId", $("#usrId").val(), 7);
        }else {
            dms.cookie.removeCookie("rememberYn");
            dms.cookie.removeCookie("usrId");
        }

        $("#usrPwEnc").val(hex_sha2($("#usrPw").val()));
        //$("#usrPw").val("");

        $("#loginForm").submit();
    });

    $("#loginFormContainer").keypress(function(event){
        if(event.which == 13){
            $("#btnLogin").click();
        }
    });
});
</script>







<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">

        <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code='mob.title.config' /><!-- 환경설정 --></h2>
            </div>
  <!-- setting_list -->
        <section class="settinglist">

            <ul>
                <li>
                    <strong><spring:message code='global.lbl.versionInfo' /></strong>
                    <span class="setcont newicon">
                        <span class="ver_present"><spring:message code='global.lbl.currentVersion' /><span id="appVersion"></span></span>
                        <%-- <span class="ver_latest newicon"><spring:message code='global.lbl.newVersion' /> 1.1.2</span> --%>
                    </span>
                </li>
                <li>
                    <strong><spring:message code='global.lbl.accountInfo' /></strong>
                    <span class="setcont">
                        <span class="setName">${userNm}</span>
                        <span class="setUserid">${userId}</span>
                    </span>
                </li>
                <%-- <li>
                    <strong><spring:message code='global.lbl.alarm' /></strong>
                    <span class="setcont">
                         <input type="checkbox" id="check01" name="check01" class="s_check" checked/>
                         <label for="check01"><span class="text">接收</span></label>
                    </span>
                </li> --%>
                <%-- <li>
                    <strong><spring:message code='global.lbl.alarmInterval' /><!-- 알람간격 --></strong>
                    <span class="setcont">
                        <div class="f_text"><input type="text" class="form_comboBox" /></div>
                    </span>
                </li> --%>
                <%-- <li>
                    <strong><spring:message code='mob.lbl.appVersion' /><!-- APP_VERSION --></strong>
                    <span class="setcont">
                       <span class="text" id="appVersion"></span>
                    </span>
                </li> --%>
                <li>
                    <strong><spring:message code='mob.lbl.deviceId' /><!-- DEVICE_ID --></strong>
                    <span class="setcont">
                        <span class="text" id="deviceId"></span>
                    </span>
                </li>
                <li>
                    <strong><spring:message code='mob.lbl.os' /><!-- OS --></strong>
                    <span class="setcont">
                        <span class="text" id="os"></span>
                    </span>
                </li>
                <li>
                    <strong><spring:message code='mob.lbl.deviceModel' /><!-- DEVICE_MODEL --></strong>
                    <span class="setcont">
                        <span class="text" id="deviceModel"></span>
                    </span>
                </li>
                <li>
                    <strong><spring:message code='mob.lbl.osVersion' /><!-- OS_VERSION --></strong>
                    <span class="setcont">
                        <span class="text" id="osVersion"></span>
                    </span>
                </li>
            </ul>
        </section>
        <!-- // setting_list -->

    </section>


    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


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


    includeList = "N";

    $(".form_comboBox").kendoExtDropDownList({
        optionLabel:"10분"
    });



    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        goMain();
    });


   /*  var browTp = "";
    browTp = getBrowTp(); */

/*

var userAgent = navigator.userAgent.toLowerCase();
    if (userAgent.search("android") > -1)
        currentOS = "android";
    else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
*/
    try{
        var userAgent = navigator.userAgent.toLowerCase();
    
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
        {
            document.location = 'bhmccp://getDeviceInfo?DEALER_CD='+dlrCd+'&USER_ID='+userId+'&LANGUAGE=&return_func=getDeviceInfo';
        }else /* if (userAgent.search("android") > -1) */
        {
            //alert("1");
            window.bhmccp.getDeviceInfo(dlrCd, userId, 'lannge', 'getDeviceInfo');
        }
    }catch(e){
        var data="{\"PHONE_NO\":\"12345678999\",\"DEVICE_ID\":\"1234\",\"OS\":\"A\",\"DEVICE_MODEL\":\"4321\",\"OS_VERSION\":\"1.0.1\",\"UPDATE_DATE\":\"20160828\"}";
        getDeviceInfo(data);
    }

/*
    if(browTp == "safari" || browTp == "mozilla" ){ // ios
        document.location = 'bhmccp://getDeviceInfo?DEALER_CD='+dlrCd+'&USER_ID='+userId+'&LANGUAGE=&return_func=getDeviceInfo';
        //getDeviceInfo?DEALER_CD=''&USER_ID=''&LANGUAGE=''&return_finc=''
        //window.bhmccp.getDeviceInfo(dlrCd, userId, 'lannge', 'getDeviceInfo');
    }else { // android
        window.bhmccp.getDeviceInfo(dlrCd, userId, 'lannge', 'getDeviceInfo');
        /*
        getDeviceInfo ('dlrCd', 'userId', 'lannge', return func)
        {
        "APP_VERSION":""
        "DEVICE_ID" " ""
        "OS":"A"
        "DEVICE_MODEL":""
        "OS_VERSION"
        }


    }
*/

});


function getDeviceInfo(param){ // js (앱에서 리턴되는 값 받는 스크립트)

    /*
    if( param != null && param != 'undefined'){
        $("#appVersion").val(param.APP_VERSION);
        $("#deviceId").val(param.DEVICE_ID);
        $("#os").val(param.OS);
        $("#deviceModel").val(param.DEVICE_MODEL);
        $("#osVersion").val(param.OS_VERSION);
    }
    */

    var resultList = JSON.parse(param);
    $("#appVersion").text(resultList.APP_VERSION);
    $("#deviceId").text(resultList.DEVICE_ID);
    $("#os").text(resultList.OS);
    $("#deviceModel").text(resultList.DEVICE_MODEL);
    $("#osVersion").text(resultList.OS_VERSION);
    /* $.each(resultList.data, function(index,data){
        $("#appVersion").text(data.APP_VERSION);
        $("#deviceId").text(data.DEVICE_ID);
        $("#os").text(data.OS);
        $("#deviceModel").text(data.DEVICE_MODEL);
        $("#osVersion").text(data.OS_VERSION);
    }); */

    /*
    var resultList = JSON.parse(param);
    $.each(resultList.data, function(index,data){
        $("#appVersion").text(data.appVersion);
        $("#deviceId").text(data.deviceId);
        $("#os").text(data.os);
        $("#deviceModel").text(data.deviceModel);
        $("#osVersion").text(data.osVersion);
    });
    */



};



/* function getBrowTp(){
    var userAgent = navigator.userAgent.toLowerCase();

    if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (userAgent.indexOf("msie") != -1) ) {
                    return "msie";
                } else if (userAgent.indexOf("chrome") > -1) {
                    return "chrome";
                } else if (userAgent.indexOf("safari") > -1) {
                    return "safari";
                } else if (userAgent.indexOf("firefox") > -1) {
                    return "firefox";
                } else if (userAgent.indexOf("opera") > -1) {
                    return "opera";
                } else if (userAgent.indexOf("mozilla") > -1) {
                    return "mozilla";
                } else {
                    return "unknown";
                }
} */


//메인화면 가기
function goMain() {
    window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}
</script>
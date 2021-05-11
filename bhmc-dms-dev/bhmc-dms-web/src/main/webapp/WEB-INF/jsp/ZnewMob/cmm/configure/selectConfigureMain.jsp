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
$(document).ready(function() {


    includeList = "N";

    $(".form_comboBox").kendoExtDropDownList({
        optionLabel:"10분"
    });


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

});


function getDeviceInfo(param){ // js (앱에서 리턴되는 값 받는 스크립트)
    var resultList = JSON.parse(param);
    $("#appVersion").text(resultList.APP_VERSION);
    $("#deviceId").text(resultList.DEVICE_ID);
    $("#os").text(resultList.OS);
    $("#deviceModel").text(resultList.DEVICE_MODEL);
    $("#osVersion").text(resultList.OS_VERSION);

};

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div class="pop_wrap msgDiv" style="display:none">
    <div class="msg_box" id="messageId"></div>
    <%-- <spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /> --%>
    <div class="btn_bottom">
        <button type="button" class="btn_m yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
<!--20200706 updateBy tjx 添加一种选项的弹窗  start -->
<div class="pop_wrap msgDivNext" style="display:none">
    <div class="msg_box" id="messageIdNext"></div>
    <div class="btn_bottom">
        <button type="button" class="confirm"><spring:message code='global.btn.confirm'/></button>
    </div>
</div>
<!--20200706 updateBy tjx 添加一种选项的弹窗  end -->
<div id="confirm"></div>
<script type="text/javascript">

$("#confirm").kendoWindow({
    modal: true
    ,title: false
    ,width: 400
    ,pinned: true
    ,visible: false
    ,resizable:false
});
var conformKendoWindow = $("#confirm").data("kendoWindow");
if("${isTablet}" == "true"){
    $(".k-window").css({top:"40%", left:"30%"});
}else{
    conformKendoWindow.center();
}

</script>
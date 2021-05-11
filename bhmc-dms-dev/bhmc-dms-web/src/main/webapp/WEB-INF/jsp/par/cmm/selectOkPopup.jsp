<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="pop_wrap msgDiv" style="display:none">
    <div class="msg_box" id="messageId"></div>
    <%-- <spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /> --%>
    <div class="btn_bottom">
        <button type="button" class="btn_m ok"><spring:message code='par.btn.confirm'/></button>
    </div>
</div>
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
conformKendoWindow.center();

</script>
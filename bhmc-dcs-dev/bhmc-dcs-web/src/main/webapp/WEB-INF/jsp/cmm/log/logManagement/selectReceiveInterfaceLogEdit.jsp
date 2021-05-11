<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<style type="text/css">
	#content {min-width: 100%;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:5%;">
                <col style="width:30%;">
                <col style="width:5%;">
                <col style="width:30%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='cmm.lbl.interfaceCode' /></th>
                    <td>
                        <input type="text" id="interfaceCode" name="interfaceCode" class="form_comboBox" readonly="readonly" style="width:100%" /> <!-- 구분 -->
                    </td>
                    <th scope="row"><spring:message code='cmm.lbl.interfaceName' /></th>
                    <td>
                        <input type="text" id="interfaceName" name="interfaceName" class="form_comboBox" readonly="readonly" style="width:100%" /> <!-- 구분 -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='cmm.lbl.receiveDate' /></th>
                    <td>
                        <input type="text" id="receiveTime" name="receiveTime" class="form_comboBox" readonly="readonly" style="width:100%" /> <!-- 구분 -->
                    </td>
                    <th scope="row"><spring:message code='cmm.lbl.interfaceStatusCode' /></th>
                    <td>
                        <input type="text" id="resultStatus" name="resultStatus" class="form_comboBox" readonly="readonly" style="width:100%" /> <!-- 구분 -->
                    </td>
                </tr>
                <tr id="isHiddent">
                    <th scope="row"><spring:message code='cmm.lbl.sendCount' /></th>
                    <td>
                        <input type="text" id="resendCount" name="resendCount" class="form_comboBox" readonly="readonly" style="width:100%" /> <!-- 구분 -->
                    </td>
                    <th scope="row"><spring:message code='cmm.lbl.returnResultTime' /></th>
                    <td>
                        <input type="text" id="returnResultTime" name="returnResultTime" class="form_comboBox" readonly="readonly" style="width:100%" /> <!-- 구분 -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="cmm.lbl.receiveMessage" /></th>
                    <td colspan="3">
                        <textarea id="receiveMessage" name="receiveMessage" class="form_comboBox" rows="20" readonly="readonly" style="width:99%" /></textarea> <!-- 구분 -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="cmm.lbl.resultMessage" /></th>
                    <td colspan="3">
                        <textarea id="resultMessage" name="resultMessage" class="form_comboBox" rows="15" readonly="readonly" style="width:99%" /></textarea> <!-- 구분 -->
                    </td>
                </tr>
                
            </tbody>
        </table>
    </div>
</section>

<script type="text/javascript">

var windowHeight = $(window).innerHeight();
var receiveInterfaceLog = parent.receiveInterfaceLogEdit.options.content.data.receiveInterfaceLog;
var type = parent.receiveInterfaceLogEdit.options.content.data.type;
console.log(receiveInterfaceLog);


$(document).ready(function() {
	if (type == "receive"){
		$("#isHiddent").hide();
		$("#receiveInterfaceLogId").val(receiveInterfaceLog.receiveInterfaceLogId);
		$("#interfaceCode").val(receiveInterfaceLog.interfaceCode);
		$("#interfaceName").val(receiveInterfaceLog.interfaceName);
		$("#receiveMessage").val(receiveInterfaceLog.receiveMessage);
		$("#resultMessage").val(receiveInterfaceLog.resultMessage);
		$("#resultStatus").val(receiveInterfaceLog.resultStatus);
		$("#receiveTime").val(receiveInterfaceLog.receiveTime);
	}else if (type == "send"){
		$("#receiveInterfaceLogId").val(receiveInterfaceLog.receiveInterfaceLogId);
		$("#interfaceCode").val(receiveInterfaceLog.interfaceCode);
		$("#interfaceName").val(receiveInterfaceLog.interfaceName);
		$("#receiveMessage").val(receiveInterfaceLog.requestMessage);
		$("#resultMessage").val(receiveInterfaceLog.resultMessage);
		$("#resultStatus").val(receiveInterfaceLog.resultStatus);
		$("#sendTime").val(receiveInterfaceLog.receiveTime);
		$("#resendCount").val(receiveInterfaceLog.resendCount);
		$("#returnResultTime").val(receiveInterfaceLog.returnResultTime);
	}
		
});
</script>
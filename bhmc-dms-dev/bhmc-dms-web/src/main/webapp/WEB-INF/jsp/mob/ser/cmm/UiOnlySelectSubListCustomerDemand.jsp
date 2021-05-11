<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 고객요청사항 -->
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList1Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
                    <div class="listhead dlistitem">
                        <span style="width:30%"><spring:message code="ser.lbl.custReqCd" /><!-- 의견코드 --></span>
                        <span style="width:70%"><spring:message code="ser.lbl.reqCont" /><!-- 요청내용 --></span>
                    </div>
            <iframe id="subList1" name="subList1" border="1" frameborder="0" width="100%" height="100px"></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub1"><span></span></div>
        </div>
    </div>
</div>
<!-- 고객요청사항 -->
<script>
$(document).ready(function() {
    $("#subList1Btn").bind("click", function()
    {
        if(!$(this).hasClass("co_close")){
            $("#subList1").attr("src", "<c:url value='/mob/ser/cmm/selectSubListCustomerDemand.do?fromWhere="+fromWhere+"' />");
        }
    });
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 기타사항 -->
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.othDetail" /><!-- 기타사항 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList4Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
                <div class="listhead dlistitem">
                    <span style="width:33%"><spring:message code="ser.lbl.etcCdTp" /><!-- 기타사항코드 --></span>
                    <span style="width:34%"><spring:message code="ser.lbl.etcCdNm" /><!-- 기타사항명칭 --></span>
                    <span style="width:33%"><spring:message code="ser.lbl.etcAmt" /><!-- 기타사항금액 --></span>
                </div>
            <iframe id="subList4" name="subList4" border="1" frameborder="0" width="100%" height="100"></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub4"><span></span></div>
        </div>
    </div>
</div>
<!-- 기타사항 -->
<script>
$(document).ready(function() {
    
    $("#subList4Btn").bind("click", function()
    {
        if(!$(this).hasClass("co_close")){
            $("#subList4").attr("src", "<c:url value='/mob/ser/cmm/selectSubListEtcIssues.do?fromWhere="+fromWhere+"' />");
        }
    });
});
</script>
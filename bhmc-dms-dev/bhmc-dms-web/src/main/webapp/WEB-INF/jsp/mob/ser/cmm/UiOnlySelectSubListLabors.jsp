<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비항목 -->
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.lbr" /><!-- 정비항목 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList2Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
                <div class="listhead dlistitem">
                    <span style="width:50%"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.rpirNm" /><!-- 정비명칭 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.lbrTp" /><!-- 정비유형 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.custLbr" /><!-- 수불공임 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.lbrUntPrc" /><!-- 공임단가 --></span>
                    <span style="width:50%" id="serlblconfirmLbrAmt"><spring:message code="ser.lbl.confirmLbrAmt" /><!-- 공임금액 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.dcAmt" /><!-- 할인금액 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.lbrCamt" /><!-- 공임비 --></span>
                    <span style="width:50%" id="serlbltecNm"><spring:message code="ser.lbl.tecNm" /><!-- 정비사 --></span>
                </div>
            <iframe id="subList2" name="subList2" border="1" frameborder="0" width="100%" height="100"></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub2"><span></span></div>
        </div>
    </div>
</div>
<!-- 정비항목 -->
<script>
$(document).ready(function() {
    $("#subList2Btn").bind("click", function()
    {
        if(!$(this).hasClass("co_close")){
            $("#subList2").attr("src", "<c:url value='/mob/ser/cmm/selectSubListLabors.do?fromWhere="+fromWhere+"' />");
        }
    });
    if(fromWhere == "selectWorkHistoryMain" ){
        $("#serlblconfirmLbrAmt").hide();
    }else {
        $("#serlbltecNm").hide();
    }
});

function openSubListLabors() {
    $("#subList2").attr("src", "<c:url value='/mob/ser/cmm/selectSubListLabors.do?fromWhere="+fromWhere+"' />");
}
</script>
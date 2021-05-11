<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 부품수령 -->
<div class="co_group">
    <div class="content_title">
        <h2 id="serlblpart"><spring:message code="ser.lbl.part" /><!-- 부품수령 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList3Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
                <div class="listhead dlistitem">
                    <span style="width:50%"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.calUnt" /><!-- 계량단위 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.itemQty" /><!-- 부품수량 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.itemUntPrc" /><!-- 부품단가 --></span>
                    <span style="width:50%" id="serlblitemAmt"><spring:message code="ser.lbl.itemAmt" /><!-- 부품금액 --></span>
                    <span style="width:50%" id="serlbldcAmt"><spring:message code="ser.lbl.dcAmt" /><!-- 할인금액 --></span>
                    <span style="width:50%" id="serlblparAmt"><spring:message code="ser.lbl.parAmt" /><!-- 부품비 --></span>
                    <span style="width:50%" id="serllblparReadyStatCd"><spring:message code="serl.lbl.parReadyStatCd" /><!-- 부품준비상태 --></span>
                    <span style="width:50%" id="parlblparReqStatNm"><spring:message code="par.lbl.parReqStatNm" /><!-- 부품요청상태 --></span>
                </div>
            <iframe id="subList3" name="subList3" border="1" frameborder="0" width="100%" height="100"></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub3"><span></span></div>
        </div>
    </div>
</div>
<!-- 부품수령 -->
<script>
$(document).ready(function() {

    $("#subList3Btn").bind("click", function()
        {
            if(!$(this).hasClass("co_close")){
                $("#subList3").attr("src", "<c:url value='/mob/ser/cmm/selectSubListParts.do?fromWhere="+fromWhere+"' />");
            }
        });
    if(fromWhere == "selectReservationReceiptMain" ){
        $("#serllblparReadyStatCd, #parlblparReqStatNm").hide();
    }else if(fromWhere == "selectPartReservationMain"){
        $("#serlblitemAmt, #parlblparReqStatNm").hide();
        $("#serlblpart").html("<spring:message code='ser.lbl.partsReserveInfo' />");
    }else if(fromWhere == "selectWorkHistoryMain"){
        $("#serlblitemAmt, #serllblparReadyStatCd").hide();
    }else if(fromWhere == "selectEstimateListMain"){
        $("#serllblparReadyStatCd, #parlblparReqStatNm").hide();
    }else if(fromWhere == "selectCalculateMain"){
        $("#serllblparReadyStatCd, #parlblparReqStatNm").hide();
    }
});

function openSubListParts() {
    $("#subList3").attr("src", "<c:url value='/mob/ser/cmm/selectSubListParts.do?fromWhere="+fromWhere+"' />");
}

</script>
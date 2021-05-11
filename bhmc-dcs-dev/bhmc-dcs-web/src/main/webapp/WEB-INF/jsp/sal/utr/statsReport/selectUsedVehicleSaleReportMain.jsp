<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="btn_right">
        <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
    </div>
</div>

<div class="table_form">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:10%;">
            <col style="width:24%;">
            <col style="width:10%;">
            <col style="width:23%;">
            <col style="width:10%;">
            <col style="width:23%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code='global.lbl.term' /></th>
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input id="sStartDt" class="form_datepicker" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sEndDt" class="form_datepicker" />
                        </div>
                    </div>
                </td>
                <th scope="row"></th>
                <td></td>
                <th scope="row"></th>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>

<br>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>
    </form>
</div>

<!-- script -->
<script type="text/javascript">

var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

$(document).ready(function() {

    /*
    // 전체화면보기 - 버튼
    $("#btnCycleSet").kendoButton({
        click:function(e) {
            var newWindow=open("/bhmc-dms-web/ReportServer?formlet=/mis/selectSaleTotalResultDate.frm","",'top=0,left=0,width='+(screen.availWidth)+',height='+(screen.availHeight)+',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
           }
    });
    */

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });


    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=sale/selectUsedVehicleSaleReportMain.cpt' />"
      , param = "";

    param += "&sDlrCd="+dlrCd;
    param += "&sFromDate="+kendo.toString($("#sStartDt").data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");
    param += "&sToDate="+kendo.toString($("#sEndDt").data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}

</script>
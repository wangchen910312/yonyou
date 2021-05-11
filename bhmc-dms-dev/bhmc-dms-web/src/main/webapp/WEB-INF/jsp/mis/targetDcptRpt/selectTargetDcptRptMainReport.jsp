<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectTargetDcptRptMain.jsp
    Description:목표 분해 보고서 메인 화면
    author chibeom.song
    since 2016. 9. 21.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 21.   chibeom.song     최초 생성
--%>
<!-- 목표 분해 보고서 - 메인 보고서-->
<form method="post" name="frmMainStatus" id="frmMainStatus">
<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.dcptdate" /></span>
        <input type="text" id="sDcptRptDate" name="sDcptRptDate" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
        <span class="span_txt"><spring:message code="mis.lbl.timeprocess" /></span>
        <input type="text" id="sTimeRptProcess" name="sTimeRptProcess" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
        <span class="span_txt"><spring:message code="mis.lbl.monitordate" /></span>
        <input type="text" id="sMonitorRptDate" name="sMonitorRptDate" value="${targetDcptRptVO.sMonitorRptDate}" style="width:150px;" class="form_comboBox" >
        <dms:access viewId="VIEW-D-10820" hasPermission="${dms:getPermissionMask('READ')}">
        	<button type="button" class="btn_s" id="btnTargetDcptRptSearch" name="btnTargetDcptRptSearch"><spring:message code="global.btn.search" /></button>
        </dms:access>
    </div>
    <div class="btn_right">
        <!-- <button type="button" class="btn_s" id="btnCycleSet" name="btnCycleSet">전체 화면 보기</button>  -->
    </div>
</div>
<br>
<div class="table_info table_info_v1">
<iframe id="iframeTargetDcptRptMain" name="iframeTargetDcptRptMain" src="" frameborder="0" scrolling="no" width="100%" height="1150"></iframe>
</div>
</form>

<script type="text/javascript">

function mainStatusCall(){

    var sDcptRptDate      = $("#sDcptRptDate").val();
    var sTimeRptProcess   = $("#sTimeRptProcess").val().replace("%", "");
    var sMonitorRptDate   = $("#sMonitorRptDate").val();

    var mainStatusUrl   = "<c:url value='/ReportServer?reportlet=mis/selectMisExcelRpt.cpt&sDcptRptDate="+sDcptRptDate+"&sTimeRptProcess="+sTimeRptProcess+"&sMonitorRptDate="+sMonitorRptDate+"' />";
    $("#iframeTargetDcptRptMain").attr("src", mainStatusUrl);
}

$(document).ready(function() {

    $("#sMonitorRptDate").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sMonitorRptDate").kendoMaskedTextBox({
        mask:"########"
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    if('${targetDcptRptVO.sMonitorRptDate}' == "" || '${targetDcptRptVO.sMonitorRptDate}' == 'null') {
        $("#sMonitorRptDate").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));

    } else {

        $("#sMonitorRptDate").val('${targetDcptRptVO.sMonitorRptDate}');
    }

    var sMonitorDate = $("#sMonitorRptDate").val();
    var sMonitorYear = sMonitorDate.substr(0,4);
    var sMonitorMonth = sMonitorDate.substr(4,2);
    var sMonitorDay = sMonitorDate.substr(6,2);
    var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

    $("#sDcptRptDate").val(sMonitorYear + sMonitorMonth + '01');
    $("#sTimeRptProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');


    $("#btnTargetDcptRptSearch").kendoButton({
        click:function(e) {

            var sMonitorDate = $("#sMonitorRptDate").val();
            var sMonitorYear = sMonitorDate.substr(0,4);
            var sMonitorMonth = sMonitorDate.substr(4,2);
            var sMonitorDay = sMonitorDate.substr(6,2);
            var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

            $("#sDcptRptDate").val(sMonitorYear + sMonitorMonth + '01');
            $("#sTimeRptProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

            $('#frmMainStatus').submit();
           }
    });

    $("#btnMainCycleSet").kendoButton({
        click:function(e) {
            var newWindow=open("/ReportServer?reportlet=mis/selectMisExcelRpt.cpt","",'top=0,left=0,width='+(screen.availWidth)+',height='+(screen.availHeight)+',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
           }
    });

    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

    mainStatusCall();

});
</script>
<!-- 목표 분해 보고서 - 메인 보고서-->
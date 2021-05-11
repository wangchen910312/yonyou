<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
        <input type="text" id="sCycleGubn" name="sCycleGubn" value="" class="form_comboBox" style="width:100px;"><!-- 주기 구분  -->
        <input type="text" id="sResultGubn" name="sResultGubn" value="" class="form_comboBox" style="width:100px;"><!-- 결과값 구분  -->
        <input type="text" id="sTotalStatusYear" name="sTotalStatusYear" value="" class="form_comboBox" style="width:100px;"><!-- 조회년도  -->
        <input type="text" id="sTotalStatusMonth" name="sTotalStatusMonth" value="" class="form_comboBox" style="width:100px;"><!-- 조회월  -->
        <input type="text" id="sTotalStatusDate" name="sTotalStatusDate" value="" class="form_comboBox" style="width:100px;"><!-- 조회일 -->
        <button type="button" class="btn_s" id="btnTotalStatusSearch" name="btnTotalStatusSearch"><spring:message code="global.btn.search" /></button>

    </div>
    <div class="btn_right">
        <!-- <button type="button" class="btn_s" id="btnCycleSet" name="btnCycleSet">전체 화면 보기</button>  -->
    </div>
</div>
<br>
<div class="table_info table_info_v1">
<form method="post" name="frmTotalStatus" id="frmTotalStatus">
<%
    String sTotalStatusYearParam = request.getParameter("sTotalStatusYearParam");
    pageContext.setAttribute("sTotalStatusYearParam", sTotalStatusYearParam);

    String sTotalStatusMonthParam = request.getParameter("sTotalStatusMonthParam");
    pageContext.setAttribute("sTotalStatusMonthParam", sTotalStatusMonthParam);

    String sTotalStatusDateParam = request.getParameter("sTotalStatusDateParam");
    pageContext.setAttribute("sTotalStatusDateParam", sTotalStatusDateParam);

%>
<input type="hidden" id="sTotalStatusYearParam" name="sTotalStatusYearParam" value="${pageContext.request.contextPath}">
<input type="hidden" id="sTotalStatusMonthParam" name="sTotalStatusMonthParam" value="${pageContext.request.contextPath}">
<input type="hidden" id="sTotalStatusDateParam" name="sTotalStatusDateParam" value="${pageContext.request.contextPath}">

<iframe id="iframeSubTotalStatus" name="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>

</form>
</div>

<!-- script -->
<script type="text/javascript">

function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?formlet=/mis/selectSaleTotalReport.frm' />";
    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl);
}

$(document).ready(function() {

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

    if('${sTotalStatusYearParam}' == "" || '${sTotalStatusYearParam}' == 'null') {
        $("#sTotalStatusYear").val(leadingZeros(now.getFullYear(), 4));
        $("#sTotalStatusYearParam").val(leadingZeros(now.getFullYear(), 4));
    } else {
        $("#sDealerStatusYear").val($("#sDealerStatusYearParam").val());
    }

    if('${sTotalStatusMonthParam}' == "" || '${sTotalStatusMonthParam}' == 'null') {
        $("#sTotalStatusMonth").val(leadingZeros(now.getMonth()+1, 2));
        $("#sTotalStatusMonthParam").val(leadingZeros(now.getMonth()+1, 2));
    } else {
        $("#sTotalStatusMonth").val($("#sTotalStatusMonthParam").val());
    }

    if('${sTotalStatusDateParam}' == "" || '${sTotalStatusDateParam}' == 'null') {
        $("#sTotalStatusDate").val(leadingZeros(now.getDate(), 2));
        $("#sTotalStatusDateParam").val(leadingZeros(now.getDate(), 2));
    } else {
        $("#sTotalStatusDate").val($("#sTotalStatusDateParam").val());
    }

    $("#sCycleGubn").kendoExtDropDownList({
        dataSource:["Year","Month","Day"]
        ,index:0
    });

    $("#sResultGubn").kendoExtDropDownList({
        dataSource:["All","Target","Result"]
        ,index:0
    });

    $("#sTotalStatusYear").kendoExtDropDownList({
        dataSource:["2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026"]
        ,index:0
    });

    $("#sTotalStatusMonth").kendoExtDropDownList({
        dataSource:["01","02","03","04","05","06","07","08","09","10","11","12"]
        ,index:0
    });

    $("#sTotalStatusDate").kendoExtDropDownList({
        dataSource:["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15"
                     ,"16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
        ,index:0
    });

    $("#btnCycleSet").kendoButton({
        click:function(e) {
            var newWindow=open("/bhmc-dms-web/ReportServer?formlet=/mis/selectSaleTotalReport.frm","",'top=0,left=0,width='+(screen.availWidth)+',height='+(screen.availHeight)+',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
           }
    });

    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

    subTotalStatusCall();

});
</script>
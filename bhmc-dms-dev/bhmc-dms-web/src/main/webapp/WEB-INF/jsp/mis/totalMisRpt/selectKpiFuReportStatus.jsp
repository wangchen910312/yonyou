<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectKpiReportStatus.jsp
    Description : [DMS] KPI FU표
    author chibeom.song
    since 2017. 1. 11.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 1. 11.   chibeom.song     최초 생성
--%>

<!-- [DCS] KPI FU표 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.menu.kpifureportstatus" /></h1>
        <div class="btn_right">
            <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.title.searchCondition" /></th>
                    <td>
                        <input type="text" id="sSrartYyMm" name="sSrartYyMm" value="" class="form_comboBox" style="width:80px;">
                        ~
                        <input type="text" id="sEndYyMm" name="sEndYyMm" value="" class="form_comboBox" style="width:80px;">
                    </td>
                    <th scope="row"></th>
                    <td></td>
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
        <iframe id="iframeKpiFuReportStatus" name="iframeKpiFuReportStatus" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

function mainCall(){
    var kpifureportstatusUrl = "<c:url value='/ReportServer?reportlet=/mis/selectKpiFuReportStatus.cpt' />";
    $("#iframeKpiFuReportStatus").attr("src", kpifureportstatusUrl);
}

$(document).ready(function() {

    $("#sSrartYyMm").kendoDatePicker({
         value:"${sysdate}"
        ,start:"year"
        ,depth:"year"
        ,format:"yyyyMM"
    });

    $("#sSrartYyMm").kendoMaskedTextBox({
        mask:"######"
    });

    $("#sEndYyMm").kendoDatePicker({
        value:"${sysdate}"
       ,start:"year"
       ,depth:"year"
       ,format:"yyyyMM"
   });

   $("#sEndYyMm").kendoMaskedTextBox({
       mask:"######"
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

    $("#sSrartYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
    $("#sEndYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#frmKpiFuReportStatus').submit();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] KPI FU표 -->
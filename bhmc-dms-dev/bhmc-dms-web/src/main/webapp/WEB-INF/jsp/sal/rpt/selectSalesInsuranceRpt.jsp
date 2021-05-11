<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSalesInsuranceRpt.jsp
    Description : 보험 보고서
    author chibeom.song
    since 2017. 1. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 1. 23.     chibeom.song     최초 생성
--%>

<!-- [DMS] 보험 보고서 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salesinsurancerpt" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11217" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
<%--
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
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sSrartYyMmDd" name="sSrartYyMmDd" value="" class="form_comboBox">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndYyMmDd" name="sEndYyMmDd" value="" class="form_comboBox">
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
--%>
    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeSalesInsuranceRpt" name="iframeSalesInsuranceRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

function mainCall(){
    //var sSrartYyMmDd = $("#sSrartYyMmDd").val();

    var salesinsurancerptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectSalesInsuranceRpt.cpt' />";
    $("#iframeSalesInsuranceRpt").attr("src", salesinsurancerptUrl);
}

$(document).ready(function() {
/*
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

    $("#sSrartYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth(), 2));
    $("#sEndYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
*/

    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#frmSalesInsuranceRpt').submit();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] 보험 보고서 -->
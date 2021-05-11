<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSalesCarDetailRpt.jsp
    Description : 차량판매명세 보고서
    author chibeom.song
    since 2017. 1. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 1. 23.   chibeom.song     최초 생성
--%>

<!-- [DMS] 차량판매명세 보고서 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salescardetailrpt" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11231" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
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
        <iframe id="iframeSalesCarDetailRpt" name="iframeSalesCarDetailRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

var dlrCd  = "${dlrCd}";

function mainCall(){

    var salescardetailrptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectSalesCarDetailRpt.cpt' />";
    var param = "";

    var sSrartYyMmDd = $("#sSrartYyMmDd").val();
    var sEndYyMmDd = $("#sEndYyMmDd").val();

    if(sEndYyMmDd-sSrartYyMmDd > 10000) {
        dms.notification.warning("<spring:message code='global.err.datePriodParam' />");
        return false;
    }

    param += "&sDlrCd="+dlrCd;
    param += "&sSrartYyMmDd="+sSrartYyMmDd;
    param += "&sEndYyMmDd="+sEndYyMmDd;

    $("#iframeSalesCarDetailRpt").attr("src", salescardetailrptUrl + param);

}

$(document).ready(function() {

    $("#sSrartYyMmDd").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sSrartYyMmDd").kendoMaskedTextBox({
        mask:"########"
    });

    $("#sEndYyMmDd").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sEndYyMmDd").kendoMaskedTextBox({
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

    $("#sSrartYyMmDd").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth(), 2) + leadingZeros(now.getDate(), 2));
    $("#sEndYyMmDd").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));


    $("#btnSearch").kendoButton({
        click:function(e) {
            mainCall();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] 차량판매명세 보고서 -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="fsearch_area">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnIdccReportSearch" name="btnIdccReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnCustSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:16%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.yyyyMM' /><!-- 년월 --></th>
                    <td>
                        <input id="sRegYyMmDt" name="sRegYyMmDt" class="form_datepicker" />
                    </td>
                    <th></th>
                    <td></td>
                    <th></th>
                    <td></td>
                    <th></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="table_info table_info_v1">
    <iframe id="iframeIdccReport" name="iframeIdccReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">

    function idccReportCall(){
        var idccReportParam =  "&sDlrCdParam="+"<c:out value='${sDlrCd}' />";
        idccReportParam += "&sMonthFormat=<dms:configValue code='monthFormat' />";
        idccReportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        idccReportParam += "&sRegYyMmDt="+$("#sRegYyMmDt").val();

        $("#iframeIdccReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/idccReport/selectIdccResvAbilityReport.cpt' />&op=view"+idccReportParam);
    }

    $(document).ready(function() {

        $("#btnIdccReportSearch").kendoButton({
            click:function(e) {
                idccReportCall();
            }
        });
        $("#sRegYyMmDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='monthFormat' />"
            ,value:"<c:out value='${sDt}'/>"
            ,start:"year"
            ,depth:"year"
       });
        idccReportCall();

    });
</script>
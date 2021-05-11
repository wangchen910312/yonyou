<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<div class="fsearch_area">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnCustInfoReportSearch" name="btnCustInfoReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
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
                    <th scope="row"><spring:message code='cmm.report_lbl.date' /><!-- 일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" name="sStartDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate" />
                                <span class="txt_from"  >~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" name="sEndDt" class="form_datepicker"  data-json-obj="true"  data-type="maskDate"/>
                            </div>
                        </div>
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
    <iframe id="iframeCustInfoReport" name="iframeCustInfoReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">

    var toDt            = new Date();
    var year = toDt.getFullYear();
    var month = toDt.getMonth();

    function custInfoReportCall(){
        var custInfoReportParam =  "&sDlrCdParam="+"<c:out value='${sDlrCd}' />";
        custInfoReportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        custInfoReportParam += "&sStartDtParam="+$("#sStartDt").val();
        custInfoReportParam += "&sEndDtParam="+$("#sEndDt").val();
        $("#iframeCustInfoReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/customerInfoReport/selectCarlineReport.cpt' />&op=view"+custInfoReportParam);
    }

    $(document).ready(function() {
        $("#btnCustInfoReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    custInfoReportCall();
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
        });
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sStartDt").data("kendoExtMaskedDatePicker").value(new Date(year,month,'01'));

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:new Date()
        });
        custInfoReportCall();
    });
</script>
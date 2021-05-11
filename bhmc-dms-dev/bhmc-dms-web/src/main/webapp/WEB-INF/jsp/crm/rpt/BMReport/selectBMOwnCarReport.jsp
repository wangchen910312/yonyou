<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<div class="fsearch_area">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnReportSearch" name="btnReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col style="width:14%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.saleDt' /><!-- 판매일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRealDlStartDt" class="form_datepicker"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRealDlEndDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.membershipRegistDt' /><!-- 入会时间 가입시간 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRegStartDt" class="form_datepicker"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRegEndDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>
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
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="605" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sRealDlStartDt="+$("#sRealDlStartDt").val();
        reportParam += "&sRealDlEndDt="+$("#sRealDlEndDt").val();
        reportParam += "&sRegStartDt="+$("#sRegStartDt").val();
        reportParam += "&sRegEndDt="+$("#sRegEndDt").val();

        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/BMReport/selectBMOwnCarReport.cpt' />&op=view"+reportParam);
    };

    $(document).ready(function() {

        $("#btnReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sRealDlStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sRealDlEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    if(crmJs.isDateValidPeriod($("#sRegStartDt").data("kendoExtMaskedDatePicker").value()
                            ,$("#sRegEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                        reportCall();
                    }else{
                        $("#sRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                        $("#sRegEndDt").focus();
                    }
                }else{
                    $("#sRealDlEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sRealDlEndDt").focus();
                }
            }
        });

        $("#sRealDlStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sRealDlEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sRegStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sRegEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        reportCall();

    });
</script>
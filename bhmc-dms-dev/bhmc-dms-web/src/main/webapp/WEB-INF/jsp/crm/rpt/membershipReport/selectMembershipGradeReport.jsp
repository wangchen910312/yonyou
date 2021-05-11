<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<div class="fsearch_area">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnGradeReportSearch" name="btnGradeReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnGradeReportSearch">
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
                    <th scope="row"><spring:message code='crm.lbl.membershipRegistDt' /><!-- 가입일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRegStartDt" name="sRegStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRegEndDt" name="sRegEndDt" class="form_datepicker" />
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

<!-- //판매목표 -->
<div class="table_info table_info_v1">
    <iframe id="iframeCouponReport" name="iframeCouponReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
</div>
<!-- script -->
<script type="text/javascript">

    function couponReportCall(){
        var couponReportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        couponReportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        couponReportParam += "&sMembershipStan="+"<c:out value='${sMembershipStan}' />";
        couponReportParam += "&sRegStartDt="+$("#sRegStartDt").val();
        couponReportParam += "&sRegEndDt="+$("#sRegEndDt").val();
        $("#iframeCouponReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/membership/membershipReport.cpt' />&op=view"+couponReportParam);
    }

    $(document).ready(function() {

        $("#btnGradeReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sRegStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sRegEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    couponReportCall();
                }else{
                    $("#sRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sRegEndDt").focus();
                }

            }
        });
        $("#sRegStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegStartDt}' />"
        });
        $("#sRegEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegEndDt}' />"
        });
        couponReportCall();
    });
</script>
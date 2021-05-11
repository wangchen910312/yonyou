<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>


<div class="fsearch_area">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnCouponReportSearch" name="btnCouponReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnCouponReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:14%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.roTimeReport' /><!-- 정비시간 --></th>
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
                    </td><%--
                    <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                    <td>
                        <input type="text" id="sCustNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                    <td>
                        <input type="text" id="sCarRegNo" class="form_input">
                    </td> --%>

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
    <iframe id="iframeCouponReport" name="iframeCouponReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
</div>
<!-- script -->
<script type="text/javascript">
    function couponReportCall(){
        var reportParam =  "&sDlrCdParam="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sMembershipStan="+"<c:out value='${sMembershipStan}' />";
        reportParam += "&sRoDtFr="+$("#sStartDt").val();
        reportParam += "&sRoDtTo="+$("#sEndDt").val();
        $("#iframeCouponReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/membership/membershipStatsReport.cpt' />&op=view"+reportParam);
    }
    $(document).ready(function() {
        $("#btnCouponReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    couponReportCall();
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
        });
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegStartDt}' />"
        });
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegEndDt}' />"
        });
        couponReportCall();
    });
</script>
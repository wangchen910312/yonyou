<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<div class="fsearch_area">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnPointHistoryReportSearch" name="btnPointHistoryReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnPointHistoryReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                    <td>
                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.carRegNo' /><!-- 차량번호 --></th>
                    <td>
                        <input type="text" id="sCarRegNo" name="sCarRegNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대폰번호=고객이동전화번호 --></th>
                    <td>
                        <input type="text" id="sHpNo" name="sHpNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.arDt' /><!-- 발생일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sOccrStartDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sOccrEndDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <!-- 멤버십기준 -->
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="table_info table_info_v1">
    <iframe id="iframePointHistoryReport" name="iframePointHistoryReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">

    function pointHistoryReportCall(){
        var pointHistoryReportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        pointHistoryReportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        pointHistoryReportParam += "&sMembershipStan="+"<c:out value='${sMembershipStan}' />";
        pointHistoryReportParam += "&sCustNm="+$("#sCustNm").val();
        pointHistoryReportParam += "&sCarRegNo="+$("#sCarRegNo").val();
        pointHistoryReportParam += "&sHpNo="+$("#sHpNo").val();
        pointHistoryReportParam += "&sRegStartDt="+$("#sOccrStartDt").val();
        pointHistoryReportParam += "&sRegEndDt="+$("#sOccrEndDt").val();
        $("#iframePointHistoryReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/membership/membershipPointHistoryReportQuarter.cpt' />&op=view"+pointHistoryReportParam);
    };

    $(document).ready(function() {

        $("#btnPointHistoryReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sOccrStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sOccrEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    pointHistoryReportCall();
                }else{
                    $("#sOccrEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sOccrEndDt").focus();
                }
            }
        });
        $("#sOccrStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sStartDt}' />"
        });
        $("#sOccrEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sEndDt}' />"
        });
        pointHistoryReportCall();
    });
</script>
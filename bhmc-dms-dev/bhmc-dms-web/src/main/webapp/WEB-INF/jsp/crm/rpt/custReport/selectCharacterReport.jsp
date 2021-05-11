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
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:23%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                        <td>
                            <input id="sCarLineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.saleDt" /><!-- 판매일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartDt" name="sStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndDt" name="sEndDt" class="form_datepicker" />
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
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report" data-offset="10"></iframe>
</div>

<script type="text/javascript">
var carlineList = [];
<c:forEach var="obj" items="${carlineCdList}" >
carlineList.push({"cmmCd":"${obj.carlineCd}", "cmmCdNm":"${obj.carlineNm}"});
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sStartDt="+$("#sStartDt").val();
        reportParam += "&sEndDt="+$("#sEndDt").val();
        reportParam += "&sCarLineCd="+$("#sCarLineCd").val();
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/custReport/selectCharacterReport.cpt' />&op=view"+reportParam);
    }
    $(document).ready(function() {
        // 조회 - 버튼
        $("#btnReportSearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    reportCall();
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
        });

        $("#sCarLineCd").kendoExtDropDownList({
            dataSource:carlineList
            ,dataTextField:'cmmCdNm'
            ,dataValueField:'cmmCd'
            ,optionLabel:'<spring:message code="crm.lbl.allCarLine"/>'
            ,index:0
        });

        // 시작일
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 종료일
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        reportCall();
    });
</script>
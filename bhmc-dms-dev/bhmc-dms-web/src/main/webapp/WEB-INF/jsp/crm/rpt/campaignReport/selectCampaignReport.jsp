<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<!--캠페인 결과 현황 -->
<div class="fsearch_area">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.campaignReport" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnReportSearch" name="btnReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col style="width:20%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.crNm' /><!-- 캠페인명 --></th>
                    <td>
                        <input id="sMakNm" name="sMakNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.hostCd' /><!-- 주최 --></th>
                    <td>
                        <input id="sHostCd" name="sHostCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.type' /><!-- 유형 --></th>
                    <td>
                        <input id="sMakTpCd" name="sMakTpCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.campaignDt' /><!-- 캠페인일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartMakDt" name="sStartMakDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndMakDt" name="sEndMakDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="650" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sMakNm="+$("#sMakNm").val();
        reportParam += "&sHostCd="+$("#sHostCd").data("kendoExtDropDownList").value();
        reportParam += "&sMakTpCd="+$("#sMakTpCd").data("kendoExtDropDownList").value();
        reportParam += "&sStartMakDt="+$("#sStartMakDt").val();
        reportParam += "&sEndMakDt="+$("#sEndMakDt").val();

        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/campaignReport/campaignReport.cpt' />&op=view"+reportParam);
    };

    var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    <c:forEach var="obj" items="${hostList}">
        hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makTpList}">
        makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {

        $("#btnReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sStartMakDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndMakDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    reportCall();
                }else{
                    $("#sEndMakDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndMakDt").focus();
                }
            }
        });

        // 주최.   hostList
        $("#sHostCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            ,dataSource:hostList
        });

        // 유형.   makTpList
        $("#sMakTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:makTpList
        });

        // 상태.   statList
        $("#sStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:statList
        });

        // 시작일
        $("#sStartMakDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 종료일
        $("#sEndMakDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        reportCall();
    });
</script>
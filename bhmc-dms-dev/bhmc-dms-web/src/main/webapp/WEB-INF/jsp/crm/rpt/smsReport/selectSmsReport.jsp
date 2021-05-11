<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<div class="fsearch_area">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.smsReport" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnReportSearch" name="btnReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:16%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.smsSendRsltCont' /></th><!-- sms 발송 결과 -->
                    <td>
                        <input id="sSmsSendRslt" name="sSmsSendRslt" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.wrkTp' /></th><!-- 업무 유형 业务类型 -->
                    <td>
                        <input id="sWrkTp" name="sWrkTp" class="form_comboBox" />
                    </td>

                    <th scope="row"><spring:message code='global.lbl.sendTime' /></th><!-- sms 발송 일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" name="sStartDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate" />
                            </div>
                        </div>
                    </td>
                    <th></th>
                    <td></td>
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
var smsSendRsltYn = [];
var wrkTpList = [];

smsSendRsltYn.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
smsSendRsltYn.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

<c:forEach var="obj" items="${wrkTpList}" >
<c:if test="${obj.remark1 == 'WEB'}">
wrkTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sSmsSendRslt="+$("#sSmsSendRslt").data("kendoExtDropDownList").value();
        reportParam += "&sWrkTp="+$("#sWrkTp").data("kendoExtDropDownList").value();
        reportParam += "&sStartDt="+$("#sStartDt").val();
        reportParam += "&sEndDt="+$("#sEndDt").val();
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/smsReport/smsReport.cpt' />&op=view"+reportParam);
    };

    $(document).ready(function() {

        $("#sSmsSendRslt").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:smsSendRsltYn
        });

        $("#sWrkTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:wrkTpList
        });

        $("#btnReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    reportCall();
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
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
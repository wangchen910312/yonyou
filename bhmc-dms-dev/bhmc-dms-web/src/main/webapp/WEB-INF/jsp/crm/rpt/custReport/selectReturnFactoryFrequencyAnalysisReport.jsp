<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<style>
.form_numberic { width:100%;}
</style>
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
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:19%;">
                <col style="width:8%;">
                <col style="width:19%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarLineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.finalCalcAmt' /></th><!-- 차종 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sCalcTotAmtFrom" name="sCalcTotAmtFrom" class="form_numberic ar" data-type="number" min="0"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sCalcTotAmtTo" name="sCalcTotAmtTo" class="form_numberic ar" data-type="number" min="0"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.saleDt' /><!-- 출고일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sCarSaleDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sCarSaleDtTo" class="form_datepicker"  data-json-obj="true"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.lbrDt' /><!-- 정비일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sCustCalcDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sCustCalcDtTo" class="form_datepicker"  data-json-obj="true"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report" data-offset="10"></iframe>
</div>

<!-- script -->
<script type="text/javascript">
var carlineList = [];
<c:forEach var="obj" items="${carlineCdList}" >
carlineList.push({"cmmCd":"${obj.carlineCd}", "cmmCdNm":"${obj.carlineNm}"});
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sCustCalcDtFrom="+$("#sCustCalcDtFrom").val();
        reportParam += "&sCustCalcDtTo="+$("#sCustCalcDtTo").val();
        reportParam += "&sCarSaleDtFrom="+$("#sCarSaleDtFrom").val();
        reportParam += "&sCarSaleDtTo="+$("#sCarSaleDtTo").val();
        reportParam += "&sCarLineCd="+$("#sCarLineCd").val();
        reportParam += "&sCalcTotAmtFrom="+$("#sCalcTotAmtFrom").val();
        reportParam += "&sCalcTotAmtTo="+$("#sCalcTotAmtTo").val();
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/custReport/selectReturnFactoryFrequencyAnalysisReport.cpt' />&op=view"+reportParam);
    };

    $(document).ready(function() {
        $("#btnReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sCustCalcDtFrom").data("kendoExtMaskedDatePicker").value()
                        ,$("#sCustCalcDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    reportCall();
                }else{
                    $("#sCustCalcDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sCustCalcDtTo").focus();
                }
            }
        });

        $("#sCarLineCd").kendoExtDropDownList({
            dataSource:carlineList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:'<spring:message code="crm.lbl.allCarLine"/>'
            ,index:0
        });

        //조회조건 - 포인트 From-To
        $("#sCalcTotAmtFrom, #sCalcTotAmtTo").kendoExtNumericTextBox({
            min:0
           ,format:"n0" //"{0:##,###}"
           ,spinners:false // 증,감 화살표
         });

        $("#sCustCalcDtFrom").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sCustCalcDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sCarSaleDtFrom, #sCarSaleDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        reportCall();
    });
</script>
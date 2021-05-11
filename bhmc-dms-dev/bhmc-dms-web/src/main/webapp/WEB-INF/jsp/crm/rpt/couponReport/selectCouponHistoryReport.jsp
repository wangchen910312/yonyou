<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<!-- 쿠폰 사용현황 -->
<div class="fsearch_area">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.couponHistoryReport" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnCouponHistoryReportSearch" name="btnCouponHistoryReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnCouponHistoryReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:18;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th> <!-- 고객 客?-->
                    <td>
                        <input type="text" id="sCustNmHpNo" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.carRegNo' /><!-- 차량번호 --></th>
                    <td>
                        <input type="text" id="sCarRegNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.cupnNm' /><!-- 쿠폰명 --></th>
                    <td>
                        <input type="sCupnNm" id="sCupnNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.publishDt' /><!-- 발행일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPubliStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPubliEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.cupnTp' /><!-- 쿠폰 유형 --></th>
                    <td>
                        <input id="sDcCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.useYn' /><!-- 사용여부 --></th>
                    <td>
                        <input id="sUseYn" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.mbrShipTpYn' /><!-- 딜러회원 --></th>
                    <td>
                        <input id="sMbrShipTpYn" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.effectiveDt' /><!-- 실효일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sEffeStartDt" class="form_datepicker" />
                                <span class="txt_from"  >~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEffeEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <iframe id="iframeCouponHistoryReport" name="iframeCouponHistoryReport" src="" frameborder="0" scrolling="auto" width="100%" height="650" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">
var dcCdList = [];
var ynListDS = [];

<c:forEach var="obj" items="${dcCdList}" >
dcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
ynListDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
ynListDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

    function couponHistoryReportCall(){
        var couponHistoryReportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        couponHistoryReportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        couponHistoryReportParam += "&sMembershipStan="+"<c:out value='${sMembershipStan}' />";
        couponHistoryReportParam += "&sCustNmHpNo="+$("#sCustNmHpNo").val();
        couponHistoryReportParam += "&sCarRegNo="+$("#sCarRegNo").val();
        couponHistoryReportParam += "&sCupnNm="+$("#sCupnNm").val();
        couponHistoryReportParam += "&sPubliStartDt="+$("#sPubliStartDt").val();
        couponHistoryReportParam += "&sPubliEndDt="+$("#sPubliEndDt").val();
        couponHistoryReportParam += "&sEffeStartDt="+$("#sEffeStartDt").val();
        couponHistoryReportParam += "&sEffeEndDt="+$("#sEffeEndDt").val();
        couponHistoryReportParam += "&sDcCd="+$("#sDcCd").data("kendoExtDropDownList").value();
        couponHistoryReportParam += "&sUseYn="+$("#sUseYn").data("kendoExtDropDownList").value();
        couponHistoryReportParam += "&sMbrShipTpYn="+$("#sMbrShipTpYn").data("kendoExtDropDownList").value();

        $("#iframeCouponHistoryReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/couponReport/selectCouponHistroyReport.cpt' />&op=view"+couponHistoryReportParam);
    };

    $(document).ready(function() {

        $("#sDcCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dcCdList
            , optionLabel:" "
         });

        $("#sMbrShipTpYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:ynListDS
        });

        $("#sUseYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , value:"N"
            , dataSource:ynListDS
        });

        $("#btnCouponHistoryReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sPubliStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sPubliEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    if(crmJs.isDateValidPeriod($("#sEffeStartDt").data("kendoExtMaskedDatePicker").value()
                            ,$("#sEffeEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                        couponHistoryReportCall();
                    }else{
                        $("#sEffeEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                        $("#sEffeEndDt").focus();
                    }
                }else{
                    $("#sPubliEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sPubliEndDt").focus();
                }
            }
        });

        $("#sPubliStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sPubliStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sPubliEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sPubliEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sEffeStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sEffeEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        couponHistoryReportCall();
    });
</script>
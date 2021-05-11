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
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.bhmcLeadyn' /></th><!-- 리드여부 -->
                    <td>
                        <input id="sBhmcYn" name="sBhmcYn" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.newRegDt' /></th><!-- 신규시간 -->
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
                    <th scope="row"><spring:message code='crm.lbl.approchLocation' /></th><!-- 리드출처 -->
                    <td>
                        <input id="sHoldTp" name="sHoldTp" class="form_comboBox" style="width:49%"/>
                        <input id="sHoldDetlTpSeq" name="sHoldDetlTpSeq" class="form_comboBox" style="width:49%"/>
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.opptActiveDt' /></th><!--活动开始时间 활동 시작시간  -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sActStartDt" name="sActStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sActEndDt" name="sActEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="auto" width="100%" height="600" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">
var ynListDS = [];
var holdTpList = [];

ynListDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
ynListDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

<c:forEach var="obj" items="${holdTpList}" >
holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sBhmcYn="+$("#sBhmcYn").data("kendoExtDropDownList").value();
        reportParam += "&sHoldTp="+$("#sHoldTp").data("kendoExtDropDownList").value();
        reportParam += "&sHoldDetlTpSeq="+$("#sHoldDetlTpSeq").data("kendoExtDropDownList").value();
        reportParam += "&sRegStartDt="+$("#sRegStartDt").val();
        reportParam += "&sRegEndDt="+$("#sRegEndDt").val();
        reportParam += "&sActStartDt="+$("#sActStartDt").val();
        reportParam += "&sActEndDt="+$("#sActEndDt").val();
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/opptReport/selectHoldTpReport.cpt' />&op=view"+reportParam);
    };

    $(document).ready(function() {
        $("#btnReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sRegStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sRegEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    reportCall();
                }else{
                    $("#sRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sRegEndDt").focus();
                }
            }
        });
        $("#sBhmcYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:ynListDS
        });
        // 고객확보유형1      holdTp      (CRM008)
        $("#sHoldTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , dataSource:holdTpList
           , dataSource:dms.data.cmmCdFilter(holdTpList)
           , optionLabel:" "
           , filter:"contains"
           , filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchHoldTp
       });
        // 고객확보유형2
        $("#sHoldDetlTpSeq").kendoExtDropDownList({
           dataTextField:"holdDetlTpNm"
           , dataValueField:"holdSeq"
           , filter:"contains"
           , optionLabel:" "
           , enable:false
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
        $("#sActStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sActEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        reportCall();

    });

    /** [조회조건 영역] ComboBox Select() **/
    // 정보경로에 따른 상세경로 조회
    function onSelectSearchHoldTp(e){
        $("#sHoldDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
        $("#sHoldDetlTpSeq").data("kendoExtDropDownList").enable(true);

        var flag = '01';
        var dataItem = this.dataItem(e.item);
        if(dataItem.cmmCd == ""){
            $("#sHoldDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
            $("#sHoldDetlTpSeq").data("kendoExtDropDownList").enable(false);
            return false;
        }
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
            ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
            ,data:JSON.stringify({"flag":flag})
            ,async:false
        });
        if (responseJson.total == 0) {
            $("#sHoldDetlTpSeq").data("kendoExtDropDownList").enable(false);
        } else {
            $("#sHoldDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    }
</script>
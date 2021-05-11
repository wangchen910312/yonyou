<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<div class="fsearch_area">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnReportSearch" name="btnReportSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnReportSearch">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.bizCd' /><!-- 업무구분 --></th>
                    <td>
                        <input id="sBizCd" class="form_comboBox" style="width:49%"/>
                        <input id="sBizSubCd" class="form_comboBox" style="width:49%"/>
                    </td>
                    <th scope="row"><spring:message code='crm.title.bizTitle' /><!-- 업무명 --></th>
                    <td>
                        <input type="text" id="sBizTitleNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.callRsltCd" /><!-- 콜결과 --></th>
                    <td>
                        <input id="sCallRsltCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.regDt' /></th> <!-- 등록일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartRegDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndRegDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="table_info table_info_v1">
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
</div>
<!-- script -->
<script type="text/javascript">
var bizCdListDs = [];
<c:forEach var="obj" items="${bizCdList}">
<c:if test="${obj.remark1 == '10'}">
    bizCdListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
//만족도 조사 타입 DS
var stsfIvstTpCdListDs = [];
<c:forEach var="obj" items="${stsfIvstTpCdList}">
    stsfIvstTpCdListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>
// 마케팅 유형 DS
var makTpListDs = [];
<c:forEach var="obj" items="${makTpList}">
    makTpListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>
//콜결과 DS
var callRsltCdDs = [];
<c:forEach var="obj" items="${callRsltCdList}">
    callRsltCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sBizCd="+$("#sBizCd").val();
        reportParam += "&sBizSubCd="+$("#sBizSubCd").val();
        reportParam += "&sBizTitleNm="+$("#sBizTitleNm").val();
        reportParam += "&sCallRsltCd="+$("#sCallRsltCd").val();
        reportParam += "&sStartRegDt="+$("#sStartRegDt").val();
        reportParam += "&sEndRegDt="+$("#sEndRegDt").val();

        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/OBReport/callCenterReportType.cpt' />&op=view"+reportParam);
    };
    $(document).ready(function() {
        $("#btnReportSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sStartRegDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    reportCall();
                }else{
                    $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndRegDt").focus();
                }

            }
        });
     // 리드출처
        $("#sBizCd").kendoExtDropDownList({
            dataSource:bizCdListDs
            , dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , index:0
            , select:function(e){
                var dataItem = this.dataItem(e.item);
                var cmmCd = dataItem.cmmCd;
                var sBizSubCd = $("#sBizSubCd").data("kendoExtDropDownList");
                sBizSubCd.setDataSource([]);
                sBizSubCd.enable(false);
                if ( cmmCd === "05" ) {
                    sBizSubCd.enable(true);
                    sBizSubCd.setDataSource(stsfIvstTpCdListDs);
                } else if ( cmmCd === "06" ) {
                    sBizSubCd.enable(true);
                    sBizSubCd.setDataSource(makTpListDs);
                };
            }
        });
        // 업무구분 SUB
        $("#sBizSubCd").kendoExtDropDownList({
              dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , enable:false
        });
        // 콜결과
        $("#sCallRsltCd").kendoExtDropDownList({
            dataSource:dms.data.cmmCdFilter(callRsltCdDs)
            , dataTextField:"text"
            , dataValueField:"value"
            , index:0
        });
        // 통화시간 시작일
        $("#sStartRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,value:"<c:out value='${sStartDt}' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // 통화시간 종료일
        $("#sEndRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,value:"<c:out value='${sEndDt}' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        reportCall();
    });
</script>
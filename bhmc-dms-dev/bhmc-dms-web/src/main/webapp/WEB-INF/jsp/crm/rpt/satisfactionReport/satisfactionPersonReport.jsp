<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>


<!-- 만족도 조사 담당자별 현황 -->
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
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.stsfIvstNm' /><!-- 만족도 조사 명 --></th>
                    <td>
                        <input id="sStsfIvstNm" name="sStsfIvstNm" type="text" class="form_input" maxlength="33" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.type' /><!-- 유형 --></th>
                    <td>
                        <input id="sStsfIvstTpCd" name="sStsfIvstTpCd" class="form_comboBox" style="width:49%"/>
                        <input id="sStsfIvstMthCd" name="sStsfIvstMthCd" class="form_comboBox" style="width:49%"/>
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.stsfIvstExpdCd' /><!-- 만족도 조사 수단 --></th>
                    <td>
                        <input id="sStsfIvstExpdCd" name="sStsfIvstExpdCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.saAndsc' /><!-- 서비스고문/판매고문 --></th>
                    <td>
                        <input id="sMngUsrNm" name="sMngUsrNm" type="text" class="form_input" maxlength="33" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartRegDt" name="sStartRegDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndRegDt" name="sEndRegDt" class="form_datepicker" />
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
<div class="table_info table_info_v1">
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="580" class="report"></iframe>
</div>
<!-- script -->
<script type="text/javascript">
    function reportCall(){
        var reportParam = "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sStsfIvstNm="+$("#sStsfIvstNm").val();
        reportParam += "&sStsfIvstTpCd="+$("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
        reportParam += "&sStsfIvstExpdCd="+$("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
        reportParam += "&sStsfIvstMthCd="+$("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
        reportParam += "&sStartRegDt="+$("#sStartRegDt").val();
        reportParam += "&sEndRegDt="+$("#sEndRegDt").val();
        reportParam += "&sMngUsrNm="+$("#sMngUsrNm").val();
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/satisfactionReport/satisfactionPersonReport.cpt' />&op=view"+reportParam);
    };

    //만족도 조사 유형
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
        stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //만족도 조사 수단
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
        stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

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

        //만족도 조사 유형
        $("#sStsfIvstTpCd").kendoExtDropDownList({
            dataSource:stsfIvstTpCdList
            , dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , select:function(e){
                var dataItem = this.dataItem(e.item);
                $("#sStsfIvstMthCd").data("kendoExtDropDownList").value("");
                onSelectStsfIvstMthCdSet(dataItem.cmmCd);
            }
        });

        //만족도 조사 타입
        $("#sStsfIvstMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , enable:false
        });

        //만족도 조사 수단
        $("#sStsfIvstExpdCd").kendoExtDropDownList({
            dataSource:stsfIvstExpdCdList
            , dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , index:0
        });

        // 등록 시작일
        $("#sStartRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,value:"<c:out value='${sStartDt}' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 등록 종료일
        $("#sEndRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,value:"<c:out value='${sEndDt}' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        reportCall();
    });

    // 만족도 유형 데이터를 조회한다.
    function onSelectStsfIvstMthCdSet(cmmCd) {
        var stsfIvstMthCdDs = [];
        if ( dms.string.isNotEmpty(cmmCd) ) {
            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/crm/css/satisFactionManage/selectStsfIvstMthCdList.do"
                ,data:JSON.stringify({"sCmmCd":cmmCd})
                ,async:false
            });
            stsfIvstMthCdDs = responseJson.data;
            $("#sStsfIvstMthCd").data("kendoExtDropDownList").enable(true);
        } else {
            $("#sStsfIvstMthCd").data("kendoExtDropDownList").enable(false);
        };
        $("#sStsfIvstMthCd").data("kendoExtDropDownList").setDataSource(stsfIvstMthCdDs);
    };

</script>
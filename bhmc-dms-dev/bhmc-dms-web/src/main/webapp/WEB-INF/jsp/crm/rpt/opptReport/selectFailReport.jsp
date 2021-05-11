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
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.intentionCarline' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                    <td>
                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 휴대폰번호=고객이동전화번호 -->
                    <td>
                        <input type="text" id="sHpNo" name="sHpNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.prsNm' /></th><!-- 판매고문 -->
                    <td>
                        <input id="sMngScId" name="sMngScId" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.failedReason' /></th><!-- 전폐 사유 -->
                    <td>
                        <input id="sFailCauCd" name="sFailCauCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.otherBrand' /></th><!-- 전폐 차형 -->
                    <td>
                        <input id="sOtherBrandCd" name="sOtherBrandCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.failReasonAly' /></th><!-- 실폐원인분석 -->
                    <td>
                        <input id="sFailCauReason" name="sFailCauReason" class="form_input"/>
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="570" class="report"></iframe>
</div>

<!-- script -->
<script type="text/javascript">
var userList = [];
var carlineCdList = []; //차종
var failCdList = []; //전폐사유

<c:forEach var="obj" items="${userList}" >
userList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

<c:forEach var="obj" items="${carlineCdList}">
carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

<c:forEach var="obj" items="${failCdList}">
failCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${dlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
        reportParam += "&sCustNm="+$("#sCustNm").val();
        reportParam += "&sHpNo="+$("#sHpNo").val();
        reportParam += "&sMngScId="+$("#sMngScId").data("kendoExtDropDownList").value();
        reportParam += "&sFailCauCd="+$("#sFailCauCd").data("kendoExtDropDownList").value();
        reportParam += "&sOtherBrandCd="+$("#sOtherBrandCd").val();
        reportParam += "&sFailCauReason="+$("#sFailCauReason").val();
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/opptReport/selectFailReport.cpt' />&op=view"+reportParam);
    };

    $(document).ready(function() {

        $("#btnReportSearch").kendoButton({
            click:function(e) {
                reportCall();
            }
        });

        //Car Line
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           ,filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
        });

        // 판매고문
        $("#sMngScId").kendoExtDropDownList({
            dataSource:userList
            , dataTextField:"usrNm"
            , dataValueField:"usrId"
            , optionLabel:" "
            , index:0
        });

        //전폐 원인
        $("#sFailCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:failCdList
            , optionLabel:" "
            , index:0
        });
        reportCall();

    });

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
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
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 销售顾问/直销员 판매고문 / 직판원 --></th>
                    <td>
                        <input id="sMngScId" name="sMngScId" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.custCd' /><!-- 客户类型 고객유형  --></th>
                    <td>
                        <input id="sCustCd" name="sCustCd" class="form_comboBox" />
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

<!-- script -->
<script type="text/javascript">
var custCdList = [];
var userList = [];

<c:forEach var="obj" items="${custCdList}" >
custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${userList}" >
userList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

    function reportCall(){
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sMngScId="+$("#sMngScId").data("kendoExtDropDownList").value();
        reportParam += "&sCustCd="+$("#sCustCd").data("kendoExtDropDownList").value();

        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/custReport/selectCustHpNoValidReport.cpt' />&op=view"+reportParam);
    };

    $(document).ready(function() {
        $("#btnReportSearch").kendoButton({
            click:function(e) {
                reportCall();
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

        // 고객유형
        $("#sCustCd").kendoExtDropDownList({
            dataSource:custCdList
            , dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , index:0
        });
        reportCall();
    });
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectRetailMissionAnnualRpt.jsp
    Description : 년간소매임무 모니터링 리포트
    author choi Byunggwon
    since 2017. 3. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 23.    choi Byunggwon   최초 생성
--%>

<!-- [DMS] 년간소매임무 모니터링 리포트 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salesretailmissionannual" /></h1>
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-13016" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            <%-- </dms:access> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.searchYy' /></span></th> <!-- 리포트 시간 -->
                    <td>
                        <input id="sStartDt" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carlineNm' /></th> <!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><input type="checkbox" id="sDelYn" class="form_check" checked /></th> <!-- 전략단말 포함/미포함 -->
                    <td>
                        <spring:message code="sal.lbl.strategyReleaseIn" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeRetailMissionAnnualRpt" name="iframeRetailMissionAnnualRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

//딜러코드
var dlrCd  = "${dlrCd}";

var oneDay = "${oneDay}";       // 해당월 1일

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
  carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
  carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

function mainCall(){
    var rptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectRetailMissionAnnualRpt.cpt' />&op=view";
    var param = "";

    var sStartDt = $("#sStartDt").val();

    param += "&sDlrCd="+dlrCd;
    param += "&sStartDt="+sStartDt;
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sDelYn="+sDelYn.checked;
    //param += "&__bypagesize__=false";

    $("#iframeRetailMissionAnnualRpt").attr("src", rptUrl + param);
}

$(document).ready(function() {

    // 조회조건 :  차종유형
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });


    $("#btnSearch").kendoButton({
        click:function(e) {

            if (dms.string.isEmpty($("#sStartDt").val())){
                dms.notification.warning("<spring:message code='sal.lbl.searchYy' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sStartDt").focus();
                return false;
            }

            mainCall();
           }
    });

    //시작일(년도)
    $("#sStartDt").kendoDatePicker({
        value:oneDay
        ,start:"decade"
        ,depth:"decade"
        ,format:"yyyy"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,parseFormats:["yyyy"]
    });

    mainCall();

});
</script>
<!-- //[DMS] 년간소매임무 모니터링 리포트 -->
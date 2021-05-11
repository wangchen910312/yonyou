<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSalesStatisticsRpt.jsp
    Description : 판매상황종합 통계
    author choi Byunggwon
    since 2017. 3. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 23.    choi Byunggwon   최초 생성
--%>

<!-- [DMS] 판매상황종합 통계 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salessalesstatistics" /></h1>
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-13016" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            <%-- </dms:access> --%>
        </div>
    </div>

    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:25%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.date' /></span></th><!-- 일자 -->
                    <td>
                         <input id="sVinStartDt" name="sVinStartDt" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carlineNm' /></th><!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row">
                        <input type="checkbox" id="sDelYn" class="form_check" />
                    </th>
                    <td>
                        <spring:message code="sal.lbl.strategyReleaseIn" /> <!-- 전략단말 포함/미포함 -->
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeSalesStatisticsRpt" name="iframeSalesStatisticsRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

//딜러코드
var dlrCd  = "${dlrCd}";

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

function mainCall(){
    var rptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectSalesStatisticsRpt.cpt&op=view' />";
    var param = "";
    var sVinStartDt = $("#sVinStartDt").val().replace("-","").replace("-","");

    param += "&sDlrCd="+dlrCd;
    param += "&sDelYn="+sDelYn.checked;
    param += "&sVinStartDt="+sVinStartDt;
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    //console.log(param);

    $("#iframeSalesStatisticsRpt").attr("src", rptUrl + param);
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

    $("#sVinStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"<c:out value='${toDay}' />"
    });
    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    $("#btnSearch").kendoButton({
        click:function(e) {

            if (dms.string.isEmpty($("#sVinStartDt").val())){
                dms.notification.warning("<spring:message code='sal.lbl.ordYyMm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sVinStartDt").focus();
                return false;
            }

            mainCall();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] 판매상황종합 통계 -->
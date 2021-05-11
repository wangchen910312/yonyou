<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSalesConsultantStatisticsRpt.jsp
    Description : 판매고문 업무 통계표
    author choi Byunggwon
    since 2017. 3. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 23.    choi Byunggwon   최초 생성
--%>

<!-- [DMS] 판매고문 업무 통계표 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salesconsultantstatistics" /></h1>
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
                <col style="width:19%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:11%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 SALE_RGST_EMP -->
                    <td>
                        <input id="saleRgstEmp" name="saleRgstEmp" type="text"class="form_comboBox" data-json-obj="true" maxlength="30" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.saleDt' /></span></th><!-- 판매일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_right">
                                <input id="sEndDt" name="sVinEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeSalesConsultantStatisticsRpt" name="iframeSalesConsultantStatisticsRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

var dlrCd  = "${dlrCd}";

var oneDay = "${oneDay}";

function mainCall(){
    var rptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectSalesConsultantStatisticsRpt.cpt' />&op=view";
    var param = "";

    var sEndDt   = $("#sEndDt").val().replace("-","").replace("-","");
    var sSaleRgstEmp = $("#saleRgstEmp").data("kendoExtDropDownList").value();

    param += "&sDlrCd="+dlrCd;
    param += "&sEndDt="+sEndDt;
    param += "&sSaleRgstEmp="+sSaleRgstEmp;

    $("#iframeSalesConsultantStatisticsRpt").attr("src", rptUrl + param);
}

//판매고문
var selectSaleEmpDSList = [{saleEmpNm : " " , saleEmpCd:" "}];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    <c:if test="${saleAdminYn eq 'N' && obj.usrId eq usrId}">
        selectSaleEmpDSList.push({saleEmpNm : "[${obj.usrId}]${obj.usrNm}",saleEmpCd : "${obj.usrId}"});
    </c:if>
    <c:if test="${saleAdminYn eq 'Y'}">
        selectSaleEmpDSList.push({saleEmpNm : "[${obj.usrId}]${obj.usrNm}",saleEmpCd : "${obj.usrId}"});
</c:if>
</c:forEach>
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

$(document).ready(function() {

    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"<c:out value='${toDay}' />"
    });

  //판매고문
    $("#saleRgstEmp").kendoExtDropDownList({
        dataTextField : "saleEmpNm",
        dataValueField : "saleEmpCd",
        dataSource : selectSaleEmpDSList,
        optionLabel : ""
    });

    if (saleAdminYn == "N") {
        $("#saleRgstEmp").data("kendoExtDropDownList").value("${usrId}");
        $("#saleRgstEmp").data("kendoExtDropDownList").enable(false);
    }
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

            if (dms.string.isEmpty($("#sEndDt").val())){
                dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sEndDt").focus();
                return false;
            }

            mainCall();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] 판매고문 업무 통계표 -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="btn_right">
        <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
    </div>
</div>

<div class="table_form">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:10%;">
            <col style="width:24%;">
            <col style="width:10%;">
            <col style="width:23%;">
            <col style="width:10%;">
            <col>
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>  <!-- 판매인 -->
                <td>
                    <input id="sSaleEmpNo" type="text" class="form_comboBox" />
                </td>
                <th scope="row"><spring:message code='global.lbl.carLine' /></th>  <!-- 차종 -->
                <td>
                    <input id="sCarlineCd" type="text" class="form_comboBox" />
                </td>
                <th scope="row"><spring:message code='global.lbl.year' /></th>    <!-- 년도 -->
                <td>
                    <input id="sYear" class="form_datepicker" />
                </td>
                <th scope="row"></th>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>

<br>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>
    </form>
</div>

<!-- script -->
<script type="text/javascript">

var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

$(document).ready(function() {

    // 판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField:"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    // 년도
    $("#sYear").kendoExtMaskedDatePicker({
        format:"yyyy"
        ,start:"decade"
        ,depth:"decade"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
    });

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=sale/selectSalesmanMonthResult.cpt' />"
      , param = "";

    param += "&sDlrCd="+dlrCd;
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sSaleEmpNo="+$("#sSaleEmpNo").data("kendoExtDropDownList").value();
    param += "&sYear="+kendo.toString($("#sYear").data('kendoExtMaskedDatePicker').value(), "yyyy");

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}

</script>
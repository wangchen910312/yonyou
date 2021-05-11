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
            <col style="width:23%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code='global.lbl.division' /></th>  <!-- 사업부 -->
                <td>
                    <input id="sSdptCd" type="text" class="form_input" />
                </td>
                <th scope="row"><spring:message code='sal.lbl.officeNm' /></th>    <!-- 사무소 -->
                <td>
                    <input id="sDistOfficeCd" type="text" class="form_input" />
                </td>
                <th scope="row"><spring:message code='global.lbl.dealer' /></th> <!-- 딜러 -->
                <td>
                    <input id="sDlrCd" type="text" class="form_input" />
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code='sal.lbl.saleDt' /></th>    <!-- 판매일자 -->
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input id="sYyyyMm" class="form_datepicker" />
                        </div>
                    </div>
                </td>
                <th scope="row"><spring:message code='global.lbl.carLine' /></th> <!-- 차종 -->
                <td>
                    <input id="sCarlineCd" type="text" class="form_comboBox" />
                </td>
                <th scope="row" class="bor_none"></th>
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

$(document).ready(function() {

    /*
    // 전체화면보기 - 버튼
    $("#btnCycleSet").kendoButton({
        click:function(e) {
            var newWindow=open("/bhmc-dms-web/ReportServer?formlet=/mis/selectSaleTotalResultDate.frm","",'top=0,left=0,width='+(screen.availWidth)+',height='+(screen.availHeight)+',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
           }
    });
    */

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });

    //년월
    $("#sYyyyMm").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,start:"year"
        ,depth:"year"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toMonth}"
    });

    // 차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=sale/selectDlrSalesReportMain.cpt' />"
      , param = "";

    param += "&sSdptCd="+$("#sSdptCd").val();
    param += "&sDistOfficeCd="+$("#sDistOfficeCd").val();
    param += "&sDlrCd="+$("#sDlrCd").val();
    param += "&sYyyy="+kendo.toString($("#sYyyyMm").data('kendoExtMaskedDatePicker').value(), "yyyy");
    param += "&sYyyyMm="+kendo.toString($("#sYyyyMm").data('kendoExtMaskedDatePicker').value(), "yyyy-MM");

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}

</script>
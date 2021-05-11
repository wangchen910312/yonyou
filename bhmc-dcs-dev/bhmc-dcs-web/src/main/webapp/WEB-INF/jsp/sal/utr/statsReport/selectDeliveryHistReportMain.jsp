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
                <td><input id="dtTp" class="form_comboBox" /></td> <!-- 기간 -->
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input id="sStartDt" class="form_datepicker" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sEndDt" class="form_datepicker" />
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

var dtTpList = [];
dtTpList.push({cmmCd:"01", cmmCdNm:'<spring:message       code="global.lbl.realDlDt" />'});     // 실제인도일자
dtTpList.push({cmmCd:"02", cmmCdNm:'<spring:message       code="global.lbl.contractDt" />'});   // 계약일자
dtTpList.push({cmmCd:"03", cmmCdNm:'<spring:message       code="global.lbl.dlReqDt" />'});      // 인도요청일


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

    //날짜구분
    $("#dtTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dtTpList
        ,index:0
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=sale/selectDeliveryHistReportMain.cpt' />"
      , param = "";

    param += "&sDlrCd="+dlrCd;
    if($("#dtTp").data("kendoExtDropDownList").value() == "01" ){
        param += "&sStartRealDlDt="+kendo.toString($("#sStartDt").data('kendoExtMaskedDatePicker').value(), "yyyy");
        param += "&sEndRealDlDt="+kendo.toString($("#sEndDt").data('kendoExtMaskedDatePicker').value(), "yyyy-MM");
        param += "&sStartDlReqDt=";
        param += "&sEndDlReqDt=";
        param += "&sStartContractDt=";
        param += "&sEndContractDt=";
    }else if($("#dtTp").data("kendoExtDropDownList").value() == "02"){
        param += "&sStartRealDlDt=";
        param += "&sEndRealDlDt=";
        param += "&sStartContractDt="+kendo.toString($("#sStartDt").data('kendoExtMaskedDatePicker').value(), "yyyy");
        param += "&sEndContractDt="+kendo.toString($("#sEndDt").data('kendoExtMaskedDatePicker').value(), "yyyy-MM");
        param += "&sStartDlReqDt=";
        param += "&sEndDlReqDt=";
    }else{
        param += "&sStartRealDlDt=";
        param += "&sEndRealDlDt=";
        param += "&sStartContractDt=";
        param += "&sEndContractDt=";
        param += "&sStartDlReqDt="+kendo.toString($("#sStartDt").data('kendoExtMaskedDatePicker').value(), "yyyy");
        param += "&sEndDlReqDt="+kendo.toString($("#sEndDt").data('kendoExtMaskedDatePicker').value(), "yyyy-MM");
    }

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}




</script>
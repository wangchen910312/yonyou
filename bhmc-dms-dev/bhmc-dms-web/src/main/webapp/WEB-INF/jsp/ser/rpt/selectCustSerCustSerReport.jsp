<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="fsearch_area">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.custSerReport" /></h1> <!-- 고객서비스 리포트 -->
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-12881" hasPermission="${dms:getPermissionMask('READ')}"> --%>
            <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
            <%-- </dms:access> --%></button>
        </div>
    </div>

    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:5%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.reportTime' /></th> <!-- 리포트 시간 -->
                    <td>
                        <input id="sStartDt" class="form_datepicker" />
                    </td>
                    <%-- <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th> <!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td> --%>
                    <th scope="row"><spring:message code='ser.lbl.sex' /></th> <!-- 성별 -->
                    <td>
                        <input id="sSexCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.age' /></th> <!-- 나이 -->
                    <td colspan="2">
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sAgeDtlFront" class="form_comboBox" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sAgeDtlEnd" class="form_comboBox" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.custDstin' /></th> <!-- 고객구분 -->
                    <td>
                        <input id="sCustTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="650"></iframe>
    </form>
</div>

<!-- script -->
<script type="text/javascript">

var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";
var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자
var sexCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var custTpList = [];
var selectTabId = "tab01";

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//성별
<c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객유형
<c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });

    //시작일(년도)
    $("#sStartDt").kendoDatePicker({
        value:oneDay
        ,format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,parseFormats:["yyyyMMdd"]
    });

    // 조회조건 :  차종유형
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });

    // 성별
    $("#sSexCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:" "
       , dataSource:sexCdList
       , index:0
    });

    // 고객구분
    $("#sCustTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
    });

    // 나이
    $("#sAgeDtlFront").kendoExtNumericTextBox({
        format:"n0"
       ,min:0
    });
    $("#sAgeDtlEnd").kendoExtNumericTextBox({
        format:"n0"
       ,min:0
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectCustSerCustSerReport.cpt' />"
      , param = "";

    param += "&sDlrCd="+dlrCd;
    param += "&sStartDt="+changeDate($("#sStartDt").val());
    //param += "&sCarlineCd="+$("#sCarlineCd").val();
    param += "&sSexCd="+$("#sSexCd").val();
    param += "&sCustTp="+$("#sCustTp").val();

    var startAge = $("#sAgeDtlFront").val();
    var endAge = $("#sAgeDtlEnd").val();

    if(!dms.string.isEmpty(startAge) || !dms.string.isEmpty(endAge)) {
        if(!dms.string.isEmpty(startAge) && dms.string.isEmpty(endAge)) {
            param += "&sAgeDtlFront="+ startAge;
            param += "&sAgeDtlEnd="+ "99";
        } else if (dms.string.isEmpty(startAge) && !dms.string.isEmpty(endAge)) {
            param += "&sAgeDtlFront="+ "0";
            param += "&sAgeDtlEnd="+ endAge;
        } else {
            param += "&sAgeDtlFront="+ startAge;
            param += "&sAgeDtlEnd="+ endAge;
        }
    } else {
        param += "&sAgeDtlFront="+ startAge;
        param += "&sAgeDtlEnd="+ endAge;
    }

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}

//날짜변환
function changeDate(val) {
    var dateParam = val.split("-");
    var returnDateParam = dateParam[0]+dateParam[1]+dateParam[2];
    return returnDateParam;
}
</script>
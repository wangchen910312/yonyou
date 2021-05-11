<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="fsearch_area">

    <div class="header_area">
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-12886" hasPermission="${dms:getPermissionMask('READ')}"> --%>
            <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
            <%-- </dms:access> --%>
        </div>
    </div>

    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col>
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.reportTime' /></th> <!-- 리포트 시간 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartYyMmDd" name="sStartYyMmDd" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndYyMmDd" name="sEndYyMmDd" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th> <!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.selfDefineTp' /></th> <!-- 자체정의유형 -->
                    <td>
                        <input id="sSelfDefineTp" class="form_comboBox" />
                    </td>
                    <%--
                    <th scope="row"><spring:message code='ser.lbl.rpirTp' /></th> <!-- 수리유형 -->
                    <td>
                        <input id="sRpirTp" class="form_comboBox" />
                    </td>
                    --%>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="580"></iframe>
    </form>
</div>

<!-- script -->
<script type="text/javascript">

$(document).ready(function() {

    // 조회조건 :  차종유형
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:parent.carlineCdList
        ,optionLabel:" "
        ,index:0
    });

    // 조회조건 :  자체유형
    $("#sSelfDefineTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:parent.selfDefineCdList
        ,optionLabel:" "
        ,index:0
    });

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });

    //일자
    $("#sStartYyMmDd").kendoDatePicker({
        value:parent.makeFromDate(parent.sysDate)
        ,format:"yyyy-MM-dd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sEndYyMmDd").kendoDatePicker({
        value:parent.sysDate
        ,format:"yyyy-MM-dd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sStartYyMmDd").kendoMaskedTextBox({
        mask:"####-##-##"
    });

    $("#sEndYyMmDd").kendoMaskedTextBox({
        mask:"####-##-##"
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectSerEffectFosterTpReport.cpt' />"
      , param = "";
    param += "&sDlrCd="+parent.dlrCd;
    param += "&sStartYyMmDd="+parent.changeDate($("#sStartYyMmDd").val());
    param += "&sEndYyMmDd="+parent.changeDate($("#sEndYyMmDd").val());
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sDlrRoTp="+$("#sSelfDefineTp").data("kendoExtDropDownList").value();
    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}
</script>
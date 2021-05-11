<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="fsearch_area">

    <div class="header_area">
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-12877" hasPermission="${dms:getPermissionMask('READ')}"> --%>
            <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
            <%-- </dms:access> --%>
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
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.reportTime' /></th> <!-- 리포트 시간 -->
                    <td>
                        <input id="sStartDt" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th> <!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.fosterTp' /></th> <!-- 위탁유형 -->
                    <td>
                        <input id="sFosterTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.selfDefineTp' /></th> <!-- 자체정의위탁유형 -->
                    <td>
                        <input id="sDlrRoTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="600"></iframe>
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

    //조회조건 :  위탁유형
    $("#sFosterTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:parent.roTpCdList
        ,optionLabel:" "
    });

    // 조회조건 :  자체유형
    $("#sDlrRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:parent.selfDefineCdList
        ,optionLabel:" "
        ,index:0
    });

/*
    // 조회조건 :  수리유형
    $("#sRpirTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:parent.rpirTpCdList
        ,optionLabel:" "
        ,index:0
    });
*/

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });

    //시작일(년도)
    $("#sStartDt").kendoDatePicker({
        value:parent.oneDay
        ,start:"decade"
        ,depth:"decade"
        ,format:"yyyy"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,parseFormats:["yyyy"]
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectSerTotTimeSearchReport.cpt' />"
      , param = "";

    param += "&sDlrCd="+parent.dlrCd;
    param += "&sStartDt="+$("#sStartDt").val();
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sFosterTp="+$("#sFosterTp").data("kendoExtDropDownList").value();
    param += "&sDlrRoTp="+$("#sDlrRoTp").data("kendoExtDropDownList").value();

    /*param += "&sRpirTp="+$("#sRpirTp").val();
    param += "&sHpNo="+$("#sHpNo").val();
    param += "&sMathDocTp="+$("#sMathDocTp").data("kendoExtDropDownList").value();
    param += "&sSsnCrnNo="+$("#sSsnCrnNo").val();
    param += "&sCarRegStartDt="+$("#sStartDt").data("kendoExtMaskedDatePicker").value();
    param += "&sCarRegStartDt="+$("#sEndDt").data("kendoExtMaskedDatePicker").value();
    param += "&sVinNo="+$("#sVinNo").val();
    param += "&sCarRegNo="+$("#sCarRegNo").val();
    param += "&sOrdTp="+$("#sOrdTp").data("kendoExtDropDownList").value();
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sModelCd="+$("#sModelCd").data("kendoExtDropDownList").value();
    param += "&sOcnCd="+$("#sOcnCd").data("kendoExtDropDownList").value();
    param += "&sExtColorCd="+$("#sExtColorCd").data("kendoExtDropDownList").value();
    param += "&sIntColorCd="+$("#sIntColorCd").data("kendoExtDropDownList").value(); */

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}
</script>
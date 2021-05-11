<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="fsearch_area">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </div>
    </div>

    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:5%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:19%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.sdpt' /></th> <!-- 사업부 -->
                    <td>
                        <input id="sDivision" type="text" class="form_comboBox">
                    </td>

                    <th scope="row"><spring:message code='sal.lbl.officeNm' /></th> <!-- 사무소 -->
                    <td>
                        <input id="sOffice" type="text" class="form_comboBox">
                    </td>

                    <th scope="row"><spring:message code='global.lbl.sung' /></th> <!-- 성 -->
                    <td>
                        <input id="sSung" type="text" class="form_comboBox">
                    </td>

                    <th scope="row"><spring:message code='crm.lbl.city' /></th> <!-- 도시  -->
                    <td>
                        <input id="sCity" type="text" class="form_comboBox">
                    </td>

                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.dealer' /></th> <!-- 딜러    -->
                        <td>
                            <input id="sDlrCd" type="text" class="form_comboBox">
                        </td>
                    <th scope="row"><spring:message code='cmm.report_lbl.date' /></th> <!-- 일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sSearchFromDt" name="sSearchFromDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sSearchToDt" name="sSearchToDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th> <!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th></th>
                    <td></td>
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

var divisionList = [{"diviNm":"", "diviCd":""}];
<c:forEach var="obj" items="${divisionList}">
divisionList.push({diviNm:"${obj.diviNm}", diviCd:"${obj.diviCd}"});
</c:forEach>

var officeList = [{"offNm":"", "offCd":""}];
<c:forEach var="obj" items="${officeList}">
officeList.push({offNm:"${obj.offNm}", offCd:"${obj.offCd}"});
</c:forEach>

var sungList = [{"sungNm":"", "sungCd":""}];
<c:forEach var="obj" items="${sungList}">
 sungList.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>

var cityList = [{"cityNm":"", "cityCd":""}];
<c:forEach var="obj" items="${cityList}">
 cityList.push({cityNm:"${obj.cityNm}", cityCd:"${obj.cityCd}"});
</c:forEach>

var dlrList = [{"dlrNm":"", "dlrCd":""}];
<c:forEach var="obj" items="${dlrList}">
 dlrList.push({dlrNm:"${obj.dlrNm}", dlrCd:"${obj.dlrCd}"});
</c:forEach>

var carlineCdList = [{"carlineNm":"", "carlineCd":""}];
<c:forEach var="obj" items="${carlineCdList}">
carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

$(document).ready(function() {

    //조회조건 :  사업부
    $("#sDivision").kendoExtDropDownList({
        dataTextField:"diviNm"
        ,dataValueField:"diviCd"
        ,dataSource:divisionList
        ,select:onSelectDiviCd
        ,optionLabel:""
        ,index:0
    });

    // 조회조건 :  사무소
    $("#sOffice").kendoExtDropDownList({
        dataTextField:"offNm"
        ,dataValueField:"offCd"
        ,dataSource:officeList
        ,select:onSelectOffCd
        ,optionLabel:" "
        ,index:0
    });

    // 조회조건 :  성
    $("#sSung").kendoExtDropDownList({
         dataTextField:"sungNm"
        ,dataValueField:"sungCd"
        ,dataSource:sungList
        ,select:onSelectSungCd
        ,optionLabel:" "
        ,index:0
    });

    // 조회조건 :  시
    $("#sCity").kendoExtDropDownList({
        dataTextField:"cityNm"
        ,dataValueField:"cityCd"
        ,dataSource:cityList
        ,select:getDealerList
        ,optionLabel:" "
        ,index:0
    });

    // 조회조건 : 딜러코드
    $("#sDlrCd").kendoExtDropDownList({
        dataTextField:"dlrNm"
        ,dataValueField:"dlrCd"
        ,dataSource:dlrList
        ,filter: "contains"
        ,optionLabel:" "
        ,index:0
    });

    // 조회조건 : 차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });

    function onSelectDiviCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/rpt/selectOfficeList.do'/>"
            ,data:JSON.stringify({"sDiviCd":dataItem.diviCd})
            ,async:false
        });

        $("#sOffice").data("kendoExtDropDownList").setDataSource(responseJson.data);
        getDealerList();
    };

    function onSelectOffCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/rpt/selectSungList.do'/>"
            ,data:JSON.stringify({"sOffCd":dataItem.offCd})
            ,async:false
        });

        $("#sSung").data("kendoExtDropDownList").setDataSource(responseJson.data);
        getDealerList();
    };

    function onSelectSungCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/rpt/selectCityList.do'/>"
            ,data:JSON.stringify({"sSungCd":dataItem.sungCd})
            ,async:false
        });

        $("#sCity").data("kendoExtDropDownList").setDataSource(responseJson.data);
        getDealerList();
    };

    function getDealerList() {
        var sDivision = $("#sDivision").val();
        var sOffice = $("#sOffice").val();
        var sSung = $("#sSung").val();
        var sCity = $("#sCity").val();
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/rpt/selectDealerList.do'/>"
            ,data:JSON.stringify({"sSdptCd":sDivision
                                 ,"sDistOfficeCd":sOffice
                                 ,"sSaleDlrSungCd":sSung
                                 ,"sSaleDlrCityCd":sCity})
            ,async:false
        });

        $("#sDlrCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            var sDivision = $("#sDivision").val();
            var sOffice = $("#sOffice").val();
            var sSung = $("#sSung").val();
            var sCity = $("#sCity").val();
            var sDlrCd = $("#sDlrCd").val();
            var sSearchFromDt = $("#sSearchFromDt").val();
            var sSearchToDt = $("#sSearchToDt").val();
            var sCarlineCd = $("#sCarlineCd").val();

            if(dms.string.isEmpty(sSearchFromDt) || dms.string.isEmpty(sSearchToDt)){
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
            }else{
                subTotalStatusCall();
            }
        }
    });

    //정비일자
    $("#sSearchFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${fromDt}"
    });

    $("#sSearchToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDt}"
    });

    $("#sSearchFromDt").kendoMaskedTextBox({
        mask:"####-##-##"
    });
    $("#sSearchToDt").kendoMaskedTextBox({
        mask:"####-##-##"
    });

});

// 레포트화면 호출
function subTotalStatusCall(){
    var sDivision = $("#sDivision").val();
    var sOffice = $("#sOffice").val();
    var sSung = $("#sSung").val();
    var sCity = $("#sCity").val();
    var sDlrCd = $("#sDlrCd").val();
    var sSearchFromDt = $("#sSearchFromDt").val();
    var sSearchToDt = $("#sSearchToDt").val();
    var sCarlineCd = $("#sCarlineCd").val();

    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=crm/report/selectSalesLeadAnalysisReport.cpt' />&op=view";
    var param = "";

    param += "&sSearchFromDt="+sSearchFromDt;
    param += "&sSearchToDt="+sSearchToDt;
    if(dms.string.isNotEmpty(sDivision)){
        param += "&sDivision="+sDivision;
    }
    if(dms.string.isNotEmpty(sOffice)){
        param += "&sOffice="+sOffice;
    }
    if(dms.string.isNotEmpty(sSung)){
        param += "&sSung="+sSung;
    }
    if(dms.string.isNotEmpty(sCity)){
        param += "&sCity="+sCity;
    }
    if(dms.string.isNotEmpty(sDlrCd)){
        param += "&sDlrCd="+sDlrCd;
    }
    if(dms.string.isNotEmpty(sCarlineCd)){
        param += "&sCarlineCd="+sCarlineCd;
    }
    console.log(param);
    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}
</script>
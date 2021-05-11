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
                    <th></th>
                    <td></td>
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

var regManJud = "${regManJud}"; //是否是区域经理，Y：是 N：否  贾明 2018-9-20
var deptCd = "${deptCd}";//是科长,上传部门编号查询全面区域经理的数据 tjx 2020-9-20
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

$(document).ready(function() {

    //조회조건 :  사업부
    $("#sDivision").kendoExtDropDownList({
        dataTextField:"diviNm"
        ,dataValueField:"diviCd"
        ,dataSource:divisionList
        ,select:onSelectDiviCd
        ,optionLabel:""
        ,index:0
        ,enable:regManJud ==='Y'?false:true  //是否是区域经理，Y：是 N：否  贾明 2018-9-20
    });

    // 조회조건 :  사무소
    $("#sOffice").kendoExtDropDownList({
        dataTextField:"offNm"
        ,dataValueField:"offCd"
        ,dataSource:officeList
        ,select:onSelectOffCd
        ,optionLabel:" "
        ,index:0
        ,enable:regManJud ==='Y'?false:true  //是否是区域经理，Y：是 N：否  贾明 2018-9-20
    });

    // 조회조건 :  성
    $("#sSung").kendoExtDropDownList({
         dataTextField:"sungNm"
        ,dataValueField:"sungCd"
        ,dataSource:sungList
        ,select:onSelectSungCd
        ,optionLabel:" "
        ,index:0
        ,enable:regManJud ==='Y'?false:true  //是否是区域经理，Y：是 N：否  贾明 2018-9-20
    });

    // 조회조건 :  시
    $("#sCity").kendoExtDropDownList({
        dataTextField:"cityNm"
        ,dataValueField:"cityCd"
        ,dataSource:cityList
        ,select:getDealerList
        ,optionLabel:" "
        ,index:0
        ,enable:regManJud ==='Y'?false:true  //是否是区域经理，Y：是 N：否  贾明 2018-9-20
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

    function onSelectDiviCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/ser/rpt/selectOfficeList.do'/>"
            ,data:JSON.stringify({"sDiviCd":dataItem.diviCd})
            ,async:false
        });

        $("#sOffice").data("kendoExtDropDownList").setDataSource(responseJson.data);
        getDealerList();
    };

    function onSelectOffCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/ser/rpt/selectSungList.do'/>"
            ,data:JSON.stringify({"sOffCd":dataItem.offCd})
            ,async:false
        });

        $("#sSung").data("kendoExtDropDownList").setDataSource(responseJson.data);
        getDealerList();
    };

    function onSelectSungCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/ser/rpt/selectCityList.do'/>"
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
            url:"<c:url value='/ser/rpt/selectDealerList.do'/>"
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
            var sStartYyMmDd = $("#sStartYyMmDd").val();
            var sEndYyMmDd = $("#sEndYyMmDd").val();

            if(dms.string.isEmpty(sStartYyMmDd) || dms.string.isEmpty(sEndYyMmDd)){
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
            }else{
                subTotalStatusCall();
            }
        }
    });

    //일자
    $("#sStartYyMmDd").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${fromDt}"
    });

    $("#sEndYyMmDd").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDt}"
    });

    $("#sStartYyMmDd").kendoMaskedTextBox({
        mask:"####-##-##"
    });
    $("#sEndYyMmDd").kendoMaskedTextBox({
        mask:"####-##-##"
    });

});

function changeDate(val) {
    var dateParam = val.split("-");
    var returnDateParam = dateParam[0]+dateParam[1]+dateParam[2];
    return returnDateParam;
}

// 레포트화면 호출
function subTotalStatusCall(){
    var sDivision = $("#sDivision").val();
    var sOffice = $("#sOffice").val();
    var sSung = $("#sSung").val();
    var sCity = $("#sCity").val();
    var sDlrCd = $("#sDlrCd").val();
    var sStartYyMmDd = changeDate($("#sStartYyMmDd").val());
    var sEndYyMmDd = changeDate($("#sEndYyMmDd").val());
    //var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectSerValueReport.cpt' />";
      // 服务产值报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 start
   var subTotalStatusUrl ="";
   var param = "";
    if("Y"===regManJud){
       var sCsAreaCcbzId = "${userId}";//用户id
       param += "&sCsAreaCcbzId="+sCsAreaCcbzId; 
       subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectSerValueRegManReport.cpt' />";
    }else{
       subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectSerValueReport.cpt' />";
    }
  //增加科长的判断 tjx 20200920
    if(deptCd != null && deptCd != ""){
    	var sCsAreaCcbzId = "";
    	var sDeptCd = deptCd
    	param += "&sCsAreaCcbzId="+sCsAreaCcbzId;
    	param += "&sDeptCd="+sDeptCd; 
    	subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=ser/selectSerValueRegManReport.cpt' />";
	}
   // 服务产值报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 end
    //var param = "";

    param += "&sStartYyMmDd="+sStartYyMmDd;
    param += "&sEndYyMmDd="+sEndYyMmDd;
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
    console.log(param);
    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}
</script>
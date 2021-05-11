<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 서비스경영 통계  -->
    <div class="header_area">
        <div class="btn_right">
             <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>

     <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.roDt" /></th><!--RO시간  -->
                    <td>
                       <div class="form_float">
                            <div class="date_left">
                                <input id="sRoFromDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRoToDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.carNo" /></th><!--차량번호  -->
                    <td>
                        <input type="text" class="form_input" id="sCarRegNo">
                        <input type="hidden" id="dlrCd">
                        <input type="hidden" id="roDocNo">
                        <input type="hidden" id="lineNo">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!--상태  -->
                    <td>
                        <input type="text" value="" class="form_comboBox" id="sRoTp">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.driver" /></th><!--운전자  -->
                    <td>
                        <input type="text" value="" class="form_input" id="sDriverNm">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_info table_info_v1 mt10">
        <form method="get" name="frmPoint" id="frmPoint" target="iframeReport" >
        </form>
        <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
    </div>



<!-- //작업진도관리 -->


<!-- script -->
<script>
//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO상태 Array
var roStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//RO상태 map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd});

//진행상태 Array
var progressStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//페인트상태 Array
var paintStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});

//품질검사
progressStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(progressStatMap[val] != undefined)
            returnVal = progressStatMap[val].cmmCdNm;
    }
    return returnVal;
};

roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
            returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

var popupWindow;

function reportCall(){

    var reportParam
      , reportUrl
    ;

    reportParam = "&sRoTp="+$("#sRoTp").val();
    reportParam += "&sDriverNm="+$("#sDriverNm").val();
    reportParam += "&sCarRegNo="+$("#sCarRegNo").val();
    reportParam += "&sRoFromDt="+$("#sRoFromDt").val();
    reportParam += "&sRoToDt="+$("#sRoToDt").val();

    reportUrl = "<c:url value='/ReportServer?reportlet=ser/selectServiceMisReportMain.cpt' />"+reportParam;

    $("#iframeReport").attr("src", reportUrl);
};
//버튼 - 조회
$("#btnSearch").kendoButton({
    click:function(e) {
       reportCall();
    }
});

$(document).ready(function() {


    $("#sRoFromDt").kendoExtMaskedDatePicker({
     format:"<dms:configValue code='dateFormat' />"
    });

    $("#sRoToDt").kendoExtMaskedDatePicker({
     format:"<dms:configValue code='dateFormat' />"
    });

    $("#sRoTp").kendoExtDropDownList({
    dataSource:roTpCdList
    ,dataValueField:"cmmCd"
    ,dataTextField:"cmmCdNm"
    ,index:0
    });
    $("#sRoStatCd").kendoExtDropDownList({
    dataSource:roStatCdList
    ,dataValueField:"cmmCd"
    ,dataTextField:"cmmCdNm"
    ,index:0
    });

    reportCall();

});

</script>
<!-- //script -->
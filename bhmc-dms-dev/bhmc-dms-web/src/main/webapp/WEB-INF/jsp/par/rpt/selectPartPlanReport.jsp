<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 부품임무관리리포트 -->
<div class="fsearch_area">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="par.title.partPlanReport" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11581" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
        </dms:access>
        </div>
    </div>

    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.year" /></th>
                    <td>
                        <input id="sYear" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.month" /></th>
                    <td>
                        <input id="sMonth" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                    <td>
                        <input id="sItemDstinCd" name="sItemDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePlanActTp" /></th>
                    <td>
                        <input id="sDstDstinCd" name="sDstDstinCd" value="" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="650" class="report"></iframe>
    </form>
</div>

<!-- script -->
<script>
var dlrCd           = "${dlrCd}";
var toDt            = "${toDt}"
    ,sevenDtBf      = "${sevenDtBf}"
    ,sysDateYY      = "${sysDateYY}"
    ,sysDateMM      = "${sysDateMM}";

 //dstDstinCdList
 var dstDstinCdList = [];
 <c:forEach var="obj" items="${dstDstinCdList}">
     dstDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 var dstDstinCdMap = {};
 $.each(dstDstinCdList, function(idx, obj){
     dstDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
 });
 //dstDstinTpList
 var dstDstinTpList = [];
 <c:forEach var="obj" items="${dstDstinTpList}">
 dstDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 var dstDstinTpMap = {};
 $.each(dstDstinTpList, function(idx, obj){
     dstDstinTpMap[obj.cmmCd] = obj.cmmCdNm;
 });

 var itemDstinCdList= [],
 itemDstinCdAllList= [],
 itemDstinTpMap = {};
 <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
 if("${obj.useYn}" !== 'N'){
     itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 }
 itemDstinCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 $.each(itemDstinCdAllList, function(idx, obj){
     itemDstinTpMap[obj.cmmCd] = obj.cmmCdNm;
 });
    $(document).ready(function() {
        //sYear
        $("#sYear").kendoExtDropDownList({
            dataSource:[{cmmCd:2015, cmmCdNm:2015},{cmmCd:2016,  cmmCdNm:2016},{cmmCd:2017,  cmmCdNm:2017},{cmmCd:2018,  cmmCdNm:2018}]
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            //,optionLabel:" "
            ,value:sysDateYY
            ,autoBind:true
            ,index:0
        });
        //sMonth
        $("#sMonth").kendoExtDropDownList({
            dataSource:[{cmmCd:'01', cmmCdNm:'01'},{cmmCd:'02',  cmmCdNm:'02'},{cmmCd:'03',  cmmCdNm:'03'},{cmmCd:'04',  cmmCdNm:'04'},{cmmCd:'05',  cmmCdNm:'05'},{cmmCd:'06',  cmmCdNm:'06'},{cmmCd:'07',  cmmCdNm:'07'},{cmmCd:'08',  cmmCdNm:'08'},{cmmCd:'09',  cmmCdNm:'09'},{cmmCd:'10',  cmmCdNm:'10'},{cmmCd:'11',  cmmCdNm:'11'},{cmmCd:'12',  cmmCdNm:'12'}]
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
            dataSource:itemDstinCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sDstDstinCd
        $("#sDstDstinCd").kendoExtDropDownList({
            dataSource:dstDstinTpList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        $("#btnSearch").kendoButton({
            click:function(e){
                subTotalStatusCall();
            }
        });

    initPage();
    subTotalStatusCall();

    });


    function initPage(){
        var minDate             = new Date(sevenDtBf),
        maxDate             = new Date(toDt),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();
    }

    // 레포트화면 호출
    function subTotalStatusCall(){
        var sYear = "",
        sMonth = "",
        sLastYy = "",
        sYyMm = "",
        sItemDstinCd = "",
        sDstDstinCd = "";

        sYear = $("#sYear").data("kendoExtDropDownList").value();
        sMonth = $("#sMonth").data("kendoExtDropDownList").value();

        sItemDstinCd = $("#sItemDstinCd").val();
        sDstDstinCd = $("#sDstDstinCd").val();

        var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=par/selectPartPlanReport.cpt' />",
        param = "";

        param += "&op=view";
        param += "&sDlrCd="+"${dlrCd}";
        param += "&sLangCd="+"${langCd}";

        sLastYy = kendo.parseInt(sYear)-1;
        sYyMm = kendo.toString(sYear)+kendo.toString(sMonth);

        param +="&sYy="+sYear;
        param +="&sLastYy="+sLastYy;
        param +="&sYyMm="+sYyMm;
        param +="&sMm="+sMonth;
        param +="&sItemDstinCd="+sItemDstinCd;
        param +="&sDstDstinCd="+sDstDstinCd;

        $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
    }
</script>
<!-- //script -->


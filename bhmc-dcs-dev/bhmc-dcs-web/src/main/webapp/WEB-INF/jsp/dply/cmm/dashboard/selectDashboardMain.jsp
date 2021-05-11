<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";


//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>


//DEPLOY유형:COM023
var deployTpList = [];
<c:forEach var="obj" items="${deployTpDS}">
 deployTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployTpArray = [];
$.each(deployTpList, function(idx, obj){
 deployTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY상태:COM024
var deployStatList = [];
<c:forEach var="obj" items="${deployStatDS}">
 deployStatList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployStatArray = [];
$.each(deployStatList, function(idx, obj){
 deployStatArray[obj.cmmCd] = obj.cmmCdNm;
});

//스케줄유형코드:COM034
var scheduleTpList = [];
<c:forEach var="obj" items="${scheduleTpDS}">
 scheduleTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var scheduleTpArray = [];
$.each(scheduleTpList, function(idx, obj){
 scheduleTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY서비스작업명령어코드:COM035
var operCmdTpList = [];
<c:forEach var="obj" items="${operCmdTpDS}">
operCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var operCmdTpArray = [];
$.each(operCmdTpList, function(idx, obj){
 operCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//PROPERTY파일타입코드:COM038
var prtyFileTpList = [];
<c:forEach var="obj" items="${prtyFileTpDS}">
prtyFileTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var prtyFileTpArray = [];
$.each(prtyFileTpList, function(idx, obj){
 prtyFileTpArray[obj.cmmCd] = obj.cmmCdNm;
});
prtyFileTpArray[""] = "";

//DEPLOY결과코드:COM041
var deployRsltCdList = [];
<c:forEach var="obj" items="${deployRsltCdDS}">
deployRsltCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployRsltCdArray = [];
$.each(deployRsltCdList, function(idx, obj){
 deployRsltCdArray[obj.cmmCd] = obj.cmmCdNm;
});
deployRsltCdArray[null] = "";


//REPOSITORY 작업명령어코드:COM042
var repositoryOperCmdTpList = [];
<c:forEach var="obj" items="${repositoryOperCmdTpDS}">
repositoryOperCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var repositoryOperCmdTpArray = [];
$.each(repositoryOperCmdTpList, function(idx, obj){
 repositoryOperCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});


// 대사결과코드:등록해야 함
/*
var compareResultTpList = [];
<c:forEach var="obj" items="${compareResultTpDS}">
    compareResultTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var compareResultTpArray = [];
$.each(compareResultTpList, function(idx, obj){
    compareResultTpArray[obj.cmmCd] = obj.cmmCdNm;
});

*/
var compareResultTpList = [];
compareResultTpList.push({cmmCdNm:"ACCORD", cmmCd:"ACCORD"});
compareResultTpList.push({cmmCdNm:"COMP_MISS", cmmCd:"COMP_MISS"});
compareResultTpList.push({cmmCdNm:"DISACCORD", cmmCd:"DISACCORD"});

</script>

<style>
    .total-area {
        background-color:#ecb50c;
    }
</style>

<!-- Dashboard 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='cmm.title.deployDashboard' /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12321" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch"   class="btn_m btn_search"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:5%;">
                <col style="width:95%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>
                        <label for="sTerm1Week" class="label_check"><input type="radio" id="sTerm1Week" name="sTerm" value="1w" class="form_check" /> <spring:message code='global.lbl.1Week' /></label>
                        <label for="sTerm1Month" class="label_check"><input type="radio" id="sTerm1Month" name="sTerm" value="1m" class="form_check" /> <spring:message code='global.lbl.1Month' /></label>
                        <label for="sTerm3Month" class="label_check"><input type="radio" id="sTerm3Month" name="sTerm" value="3m" class="form_check" /> <spring:message code='global.lbl.3Month' /></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <div class="clfix">
        <section class="content_left" style="width:200px;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.deployScheduleSummary' /></h2>
            </div>
            <div class="table_grid">
                <div id="scheduleSummaryGrid"></div>
            </div>
        </section>
        <section class="content_right" style="margin-left:210px;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.dailyDeploySchedule' /></h2>
            </div>
            <div class="table_grid">
                <div id="scheduleSummaryByDayGrid"></div>
            </div>
        </section>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.title.deployScheduleList' /></h2>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="scheduleListGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="clfix">
        <section class="content_left" style="width:360px;">
            <div class="header_area">
                <h2 class="title_basic"  id="dplyGrpGridHeader"><spring:message code='global.title.deployGroupList' /></h2>
            </div>
            <div class="table_grid">
                <div id="dplyGrpGrid"></div>
            </div>
        </section>
        <section class="content_right" style="margin-left:370px;">
            <div class="header_area">
                <h2 class="title_basic" id="dplyDlrGridHeader"><spring:message code='global.title.deployDmsList' /></h2>
            </div>
            <div class="table_grid">
                <div id="dplyDlrGrid"></div>
            </div>
        </section>
    </div>

    <div class="header_area">
        <h2 class="title_basic" id="deployFailContentsGridHeader" style="cursor:pointer"><spring:message code='global.title.dmsDplyFailCont' />&nbsp;<font color='#0100FF'>(+)</font></h2>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="deployFailContentsGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="header_area">
        <h2 class="title_basic" id="DMSConnectErrorsGridHeader" style="cursor:pointer"><spring:message code='global.title.dmsConFailCont' />&nbsp;<font color='#0100FF'>(+)</font></h2>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="DMSConnectErrorsGrid"></div>
    </div>
    <!-- 그리드 종료 -->



</section>

<script id="failColumn_template" type="text/x-kendo-template">
    <strong>#:failCnt #</strong>
</script>

<script type="text/javascript">

$(document).ready(function() {

    function initPage() {
        $("input[name=sTerm][value=1w]").attr("checked", true);

//         $("#dplyGrpGrid").hide();
//         $("#dplyDlrGrid").hide();
        $("#deployFailContentsGrid").hide();
        $("#DMSConnectErrorsGrid").hide();

        searchContents();
    }

    function searchContents() {
        $("#scheduleSummaryGrid").data("kendoExtGrid").dataSource.read();
        $("#scheduleSummaryByDayGrid").data("kendoExtGrid").dataSource.read();
        $("#scheduleListGrid").data("kendoExtGrid").dataSource.read();

    }

    $("#btnSearch").kendoButton({
        click:function(e) {
            searchContents();

//             alert($("input[name=sTerm]").val());
//             alert($("input[name=sTerm]:checked")[0].value);
        }
    });


    // 그리드 설정
    $("#scheduleSummaryGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectScheduleSummary.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sTerm"] = $("input[name=sTerm]:checked")[0].value;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                    }
                }
            }
        }

        ,height:210
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"flag", title:"<spring:message code='global.lbl.gubun' />", width:110
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    if(dataItem.flag == "Total") {
                        return "<span class='font_bold'>" + kendo.htmlEncode(dataItem.flag) + "</span>";
                    } else {
                        return kendo.htmlEncode(dataItem.flag);
                    }
                }

            }
            ,{field:"cnt", title:"COUNT", width:70
                ,attributes:{"class":"ar"}
                ,template:function(dataItem) {
                    if(dataItem.flag == "Total") {
                        return "<span class='font_bold'>" + kendo.htmlEncode(dataItem.cnt) + "</span>";
                    } else {
                        return kendo.htmlEncode(dataItem.cnt);
                    }
                }
            }
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

            } else {

            }
        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");

            if(row.length > 0) {
//                 grid.select(row);
            } else {

            }
        }
    });

    // 그리드 설정
    $("#scheduleSummaryByDayGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectScheduleSummaryByDay.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sTerm"] = $("input[name=sTerm]:checked")[0].value;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                    }
                }
            }
        }

        ,height:210
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"deployStartDtDisp", title:"<spring:message code='global.lbl.deployStartDt' />", width:110
                ,attributes:{"class":"ac"}
            }
            ,{field:"workingCnt", title:"Working", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"readyCnt", title:"Ready", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"runningCnt", title:"Running", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"stoppedCnt", title:"Stopped", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"cancelCnt", title:"Cancel", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"completedCnt", title:"Completed", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"failCnt", title:"Fail", width:70
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    if(dataItem.failCnt > 0) {
                        return "<span class='font_bold' style='color:red'>" + kendo.htmlEncode(dataItem.failCnt) + "</span>";
                    } else {
                        return kendo.htmlEncode(dataItem.failCnt);
                    }
                }
            }
            ,{field:"totalCnt", title:"Total", width:70
                ,attributes:{"class":"ac total-area"}
                ,headerAttributes:{style:"background-color:#006699; color:#fff;"}
            }
            ,{field:"scheduledCnt", title:"Scheduled", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"immediateCnt", title:"Immediate", width:70
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

            } else {

            }
        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");

            if(row.length > 0) {
//                 grid.select(row);
            } else {

            }
        }
    });

    // 그리드 설정
    $("#scheduleListGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectScheduleList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sTerm"] = $("input[name=sTerm]:checked")[0].value;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                    }
                }
            }
        }

        ,height:200
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"specCd", title:"<spring:message code='global.lbl.specCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"specNm", title:"<spring:message code='global.lbl.specNm' />", width:110
            }

            ,{field:"deployVerNo", title:"<spring:message code='global.lbl.deployVerNo' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"scheduleTpCd", title:"<spring:message code='global.lbl.scheduleTpCd' />", width:90
                ,template:"#=scheduleTpArray[scheduleTpCd]#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployTpCd", title:"<spring:message code='global.lbl.deployTpCd' />", width:90
                ,template:"#=deployTpArray[deployTpCd]#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployPlanStartDt", title:"<spring:message code='global.lbl.deployPlanStartDt' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployStartDt", title:"<spring:message code='global.lbl.deployStartDt' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployEndDt", title:"<spring:message code='global.lbl.deployEndDt' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployStatCd", title:"<spring:message code='global.lbl.deployStatCd' />", width:90
                ,template:"#=deployStatArray[deployStatCd]#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"trgtDmsCnt", title:"<spring:message code='global.lbl.trgtDmsCnt' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"failDmsCnt", title:"<spring:message code='global.lbl.deployFailDms' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"achkFailAlwCnt", title:"<spring:message code='global.lbl.achkFailAlwCnt' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"alwFailDmsCnt", title:"<spring:message code='global.lbl.alwFailDmsCnt' />", width:110
                ,attributes:{"class":"ac"}
            }
            ,{title:""}
        ]
        ,change:function(e) {
            var dataItem = e.sender.dataItem(e.sender.select());

            if(dataItem.failDmsCnt != null && dataItem.failDmsCnt > 0) {
                $("#deployFailContentsGridHeader").html("<spring:message code='global.title.dmsDplyFailCont' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
                $("#deployFailContentsGrid").show();

                $("#DMSConnectErrorsGridHeader").html("<spring:message code='global.title.dmsConFailCont' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
                $("#DMSConnectErrorsGrid").show();

            } else {
                $("#deployFailContentsGridHeader").html("<spring:message code='global.title.dmsDplyFailCont' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
                $("#deployFailContentsGrid").hide();

                $("#DMSConnectErrorsGridHeader").html("<spring:message code='global.title.dmsConFailCont' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
                $("#DMSConnectErrorsGrid").hide();

            }


            if(dataItem.specCd != null && dataItem.deployVerNo != null) {
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource.data([]);

                $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();

                $('#deployFailContentsGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#deployFailContentsGrid').data('kendoExtGrid').dataSource.read();

                $('#DMSConnectErrorsGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $("#DMSConnectErrorsGrid").data("kendoExtGrid").dataSource.read();
            } else {
//                 $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
//                 $('#dplyGrpGrid').data('kendoExtGrid').dataSource.data([]);

            }
        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");

            if(row.length > 0) {
//                 grid.select(row);
            } else {

            }
        }
    });

    // 그리드 설정
    $("#dplyGrpGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectDeployGroupForDashboard.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#scheduleListGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"]      = dataItem.specCd;
                        params["sDeployVerNo"] = dataItem.deployVerNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                    }
                }
            }
        }

        ,height:160
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"deployGrpId", title:"<spring:message code='global.lbl.deployGrpId' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployStatCd", title:"<spring:message code='global.lbl.deployStatCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployTargDlrCnt", title:"<spring:message code='global.lbl.deployTargDlrCnt' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployEndDlrCnt", title:"<spring:message code='global.lbl.deployEndDlrCnt' />", width:80
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource.read();
            } else {

            }
        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }
    });

    // Deploy Dealer 그리드 설정
    $("#dplyDlrGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectDeployGroupDealerForDashboard.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyGrpGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"]      = dataItem.specCd;
                        params["sDeployVerNo"] = dataItem.deployVerNo;
                        params["sDeployGrpId"] = dataItem.deployGrpId;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        rnum                  :{type:"number", editable:false}
                        ,specCd               :{type:"string"}
                        ,deployVerNo          :{type:"string"}
                        ,deployGrpId          :{type:"string"}
                        ,dlrCd                :{type:"string"}
                        ,deployExcpYn         :{type:"string"}
                        ,deployExcpReasonCont :{type:"string"}
                        ,regUsrId             :{type:"string"}
                        ,regDt                :{type:"date"}
                        ,updtUsrId            :{type:"string"}
                        ,updtDt               :{type:"date"}
                        ,deployProcCnt        :{type:"number"}
                        ,lastDeployProcDt     :{type:"date"}
                        ,deployReqEndYn       :{type:"string"}
                    }
                }
            }
        }

        ,selectable:"row"
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:140
            }
            ,{field:"deployProcCnt", title:"<spring:message code='global.lbl.deployProcCnt' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastDeployProcDt", title:"<spring:message code='global.lbl.lastDeployProcDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployReqEndYn", title:"<spring:message code='global.lbl.deployReqEndYn' />", width:120
                ,attributes:{"class":"ac"}
            }
//             ,{field:"deployExcpYn", title:"<spring:message code='global.lbl.deployExcpYn' />", width:120
//                 ,attributes:{"class":"ac"}
//             }
            ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:120
                ,attributes:{"class":"ac"}
                ,template:"#=deployRsltCdArray[deployRsltCd]#"
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

            } else {

            }
        }

    });


    // 그리드 설정
    $("#deployFailContentsGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectDeployFailContents.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#scheduleListGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"]      = dataItem.specCd;
                        params["sDeployVerNo"] = dataItem.deployVerNo;
//                         params["sSpecCd"]      = '2016050003';
//                         params["sDeployVerNo"] = '001';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                    }
                }
            }
        }

        ,height:200
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"specTpNm", title:"<spring:message code='global.lbl.deployItemType' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployItem", title:"<spring:message code='global.lbl.deployItem' />", width:250
            }
            ,{field:"errMsg", title:"<spring:message code='global.lbl.deployErrMsg' />", width:360
            }
            ,{field:"deployFailDmsCnt", title:"<spring:message code='global.lbl.deployFailDmsCnt' />", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

        },dataBound:function(e) {

        }
    });


    // 그리드 설정
    $("#DMSConnectErrorsGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/dashboard/selectDMSConnectErrors.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#scheduleListGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"]      = dataItem.specCd;
                        params["sDeployVerNo"] = dataItem.deployVerNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                    }
                }
            }
        }

        ,height:200
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:150
            }

            ,{field:"dmsIpNm", title:"<spring:message code='global.lbl.dmsIpNm' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsOperEmailNm", title:"<spring:message code='global.lbl.dmsOperEmailNm' />", width:130
            }
            ,{field:"dmsOperTelNo", title:"<spring:message code='global.lbl.dmsOperTelNo' />", width:130
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsUseYn", title:"<spring:message code='global.lbl.dmsUseYn' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:100
                ,template:"#=deployRsltCdArray[deployRsltCd]#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProcCnt", title:"<spring:message code='global.lbl.deployProcCnt' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastDeployProcDt", title:"<spring:message code='global.lbl.lastDeployProcDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

//             ,{field:"deployTargYn", title:"<spring:message code='global.lbl.deployTargYn'/>", width:70
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=deployTargYnTpArray[deployTargYn]#"
//             }
//             ,{field:"lastAchkReqDt", title:"<spring:message code='global.lbl.lastAchkReqDt'/>", width:140
//                 ,attributes:{"class":"ac"}
//                 ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
//             }

            ,{title:""}
        ]
        ,change:function(e) {

        },dataBound:function(e) {

        }
    });

/*
    $('#dplyGrpGridHeader').click(function() {
        var obj = $("#dplyGrpGrid");
        if(obj.css("display") == "none"){
            obj.show();
        } else {
            obj.hide();
        }

    });

    $('#dplyDlrGridHeader').click(function() {
        var obj = $("#dplyDlrGrid");
        if(obj.css("display") == "none"){
            obj.show();
        } else {
            obj.hide();
        }

    });
*/

    $('#deployFailContentsGridHeader').click(function() {
        var obj = $("#deployFailContentsGrid");
        if(obj.css("display") == "none"){
            $("#deployFailContentsGridHeader").html("<spring:message code='global.title.dmsDplyFailCont' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
            obj.show();
        } else {
            $("#deployFailContentsGridHeader").html("<spring:message code='global.title.dmsDplyFailCont' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
            obj.hide();
        }

    });

    $('#DMSConnectErrorsGridHeader').click(function() {
        var obj = $("#DMSConnectErrorsGrid");
        if(obj.css("display") == "none"){
            $("#DMSConnectErrorsGridHeader").html("<spring:message code='global.title.dmsConFailCont' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
            obj.show();
        } else {
            $("#DMSConnectErrorsGridHeader").html("<spring:message code='global.title.dmsConFailCont' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
            obj.hide();
        }

    });





    initPage();

});


</script>


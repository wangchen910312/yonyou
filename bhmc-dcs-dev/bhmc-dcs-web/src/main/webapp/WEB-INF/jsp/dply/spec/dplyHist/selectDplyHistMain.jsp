<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript" src="<c:url value='/resources/js/dms/comerstone.js' />"></script>
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

// 공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>


// DEPLOY유형:COM023
var deployTpList = [];
<c:forEach var="obj" items="${deployTpDS}">
    deployTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployTpArray = [];
$.each(deployTpList, function(idx, obj){
    deployTpArray[obj.cmmCd] = obj.cmmCdNm;
});

// DEPLOY상태:COM024
var deployStatList = [];
<c:forEach var="obj" items="${deployStatDS}">
    deployStatList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployStatArray = [];
$.each(deployStatList, function(idx, obj){
    deployStatArray[obj.cmmCd] = obj.cmmCdNm;
});

// 스케줄유형코드:COM034
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


</script>


<!--  화면 -->

<form id="dplyMastForm" name="dplyMastForm" method="POST" onsubmit="return false;">
    <!-- DEPLOY MASTER LIST -->
    <section class="group">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
            <h1 class="title_basic"><spring:message code='cmm.title.dplyHist'/></h1>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12310" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12309" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDplyStart" class="btn_m" ><spring:message code='global.btn.runDeploy' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12308" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDplyStop" class="btn_m"><spring:message code='global.btn.stop' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12307" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDplyRestart" class="btn_m"><spring:message code='global.btn.restart' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12306" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDplyCancel" class="btn_m"><spring:message code='global.btn.deployCancel' /></button>
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.deployPlanStartDay' /></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.specCd' /></th>
                        <td>
                            <input id="sSpecCd" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.deployTpCd' /></th>
                        <td>
                            <input id="sDeployTpCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.scheduleTpCd' /></th>
                        <td>
                            <input id="sScheduleTpCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="dplyHistGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="clfix">
            <section class="content_left" style="width:200px;">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.deployGroup' /></h2>
                </div>
                <div class="table_grid">
                    <div id="dplyGrpGrid"></div>
                </div>
            </section>
            <section class="content_right" style="margin-left:210px;">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.deployGroupDetail' /></h2>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12305" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnSearchReport" ><spring:message code='global.btn.deployResultDetail' /></button>
                        </dms:access>
                        <!-- button class="btn_s" id="btnTest" >Test</button -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="dplyDlrGrid"></div>
                </div>
            </section>
        </div>

    </section>
    <!--  DEPLOY MASTER LIST -->
</form>


<!-- // 화면 -->


<!-- #스크립트 영역# -->
<script type="text/javascript">

var indexOfDplyHistGrid = 0;
var searchBtnClicked = 'Y';

/******************************************
 * 함수영역 - start
******************************************/
function searchReployPopup() {

    var grid = $("#dplyHistGrid").data("kendoExtGrid");
    dataItem = grid.dataItem(grid.select());

    if(dataItem == null || dataItem == 'undefined') {
        return;
    }

    searchRedeployPopupWin = dms.window.popup({
        windowId:"searchRedeployPopupWin"
        ,title:"Redeploy"
        ,width:800
        ,height:400
        ,content:{
            url:"<c:url value='/dply/spec/dplyHist/selectRedeployPopup.do'/>"
            ,data:{
                 "autoBind"     :true
                ,"specCd"       :dataItem.specCd
                ,"deployVerNo"  :dataItem.deployVerNo
                ,"deployStartDt":dataItem.deployStartDt
                ,"deployEndDt"  :dataItem.deployEndDt
                ,"callbackFunc" :function(param) {
//                     alert(JSON.stringify(param));

                }
            }
        }

    });
}




/******************************************
 * 함수영역 - end
******************************************/
var searchDplyReportDetailPopupWin;
var searchRedeployPopupWin;

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            clearDetailGrid();

//             searchBtnClicked = 'Y';

            $('#dplyHistGrid').data('kendoExtGrid').dataSource.read();

        }
    });

    //버튼 - 배포실행
    $("#btnDplyStart").kendoButton({
        click:function(e) {
            execDeployStart();
        }
    });

    //버튼 - 조회
    $("#btnDplyStop").kendoButton({
        click:function(e) {
            execDeploy("S");
        }
    });

    //버튼 -
    $("#btnDplyRestart").kendoButton({
        click:function(e) {
            execDeploy("R");
        }
    });

    //버튼 -
    $("#btnDplyCancel").kendoButton({
        click:function(e) {
            execDeploy("C");
        }
    });

    //
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:processDate(toDay, cmmPrtyListObj['defaultDate.dplyHist.startRegDt'], vDtyyyyMMdd)
   });

    //
    $("#sEndDt").kendoExtMaskedDatePicker({
         format:"{0:"+vDtyyyyMMdd+"}"
        ,patternToMask:vDtyyyyMMdd
        ,value:processDate(toDay, cmmPrtyListObj['defaultDate.dplyHist.endRegDt'], vDtyyyyMMdd)
    });

    // Deploy유형
    $("#sDeployTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:deployTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // 스케쥴유형
    $("#sScheduleTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:scheduleTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // Deploy Master 그리드 설정
    $("#dplyHistGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/dplyHist/selectDeployHistory.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sSpecCd"]         = $("#sSpecCd").val();
                        params["sStartDt"]        = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndDt"]          = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sDeployTpCd"]     = $("#sDeployTpCd").data("kendoExtDropDownList").value();
                        params["sScheduleTpCd"]   = $("#sScheduleTpCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"deployVerNo"
                    ,fields:{
                         specCd        :{type:'string'}
                        ,specNm        :{type:'string'}
                        ,specCont      :{type:'string'}
                        ,deployVerNo   :{type:'string'}
                        ,startDt       :{type:'date'}
                        ,endDt         :{type:'date'}
                        ,status        :{type:'string'}
                        ,dmsCnt        :{type:'number'}
                        ,sucessCnt     :{type:'number'}
                        ,failCnt       :{type:'number'}
                        ,duration      :{type:'string'}
                        ,redeploy      :{type:'string'}
                        ,regUsrId      :{type:'string'}
                        ,regDt         :{type:'date'}
                        ,updtUsrId     :{type:'string'}
                        ,updtDt        :{type:'date'}
                        ,scheduleTpCd  :{type:'string'}
                        ,deployStatCd  :{type:'string'}
                        ,deployTpCd    :{type:'string'}
                        ,achkFailAlwCnt:{type:'number'}
                        ,alwFailDmsCnt :{type:'number'}
                    }
                }
            }
        }

//        ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
            $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:226
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"specCd", title:"<spring:message code='global.lbl.specCd' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"specNm", title:"<spring:message code='global.lbl.specNm' />", width:150
            }
            ,{field:"deployVerNo", title:"<spring:message code='global.lbl.deployVerNo' />", width:85
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployTpCd", title:"<spring:message code='global.lbl.deployTpCd' />", width:85
                ,attributes:{"class":"ac"}
                ,template:"#=deployTpArray[deployTpCd]#"
            }
            ,{field:"scheduleTpCd", title:"<spring:message code='global.lbl.scheduleTpCd' />", width:85
                ,attributes:{"class":"ac"}
                ,template:"#=scheduleTpArray[scheduleTpCd]#"
            }
            ,{field:"deployStartDt", title:"<spring:message code='global.lbl.deployPlanStartDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"startDt", title:"<spring:message code='global.lbl.deployStartDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"endDt", title:"<spring:message code='global.lbl.deployEndDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
//             ,{field:"status", title:"<spring:message code='global.lbl.deployStatCd' />", width:80
//                 ,attributes:{"class":"ac"}
//             }
            ,{field:"deployStatCd", title:"<spring:message code='global.lbl.deployStatCd' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=deployStatArray[deployStatCd]#"
            }
            ,{title:"<spring:message code='global.lbl.redeploy' />", width:100
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var flag = dataItem.redeploy;
                    var cellCont = '';

                    if(flag ==  'Y') {
//                     if(true) {
//                     if(dataItem.specCd == 'TEST040001') {
//                     if(dataItem.failCnt > 0) {
                        cellCont = "<span class='txt_label bg_yellow' onClick='searchReployPopup()'>Redeploy</span>";
                    }

                    return cellCont;
                }
            }
            ,{field:"dmsCnt", title:"<spring:message code='global.lbl.dmsCount' />", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"sucessCnt", title:"<spring:message code='global.lbl.successCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"failCnt", title:"<spring:message code='global.lbl.failCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"duration", title:"<spring:message code='global.lbl.durationHhMm' />", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"specCont", title:"<spring:message code='global.lbl.specCont' />", width:200
            }
            ,{field:"achkFailAlwCnt", title:"<spring:message code='global.lbl.achkFailAlwCnt' />", width:170
                ,attributes:{"class":"ac"}
            }
            ,{field:"alwFailDmsCnt", title:"<spring:message code='global.lbl.alwFailDmsCnt' />", width:115
                ,attributes:{"class":"ac"}
            }


            ,{title:""

            }
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                clearDetailGrid();

                $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();

            } else {

            }

        },dataBound:function(e) {
            var grid = e.sender;

            if(searchBtnClicked == 'Y') {
                var row = grid.tbody.find("tr:eq(0)");
                if(row.length > 0) {
                    grid.select(row);
                }
            } else if (searchBtnClicked == 'N') {
                var row = grid.tbody.find("tr:eq(" + indexOfDplyHistGrid +")");
                if(row.length > 0) {
                    grid.select(row);
                }

//                 searchBtnClicked = 'Y';

            }

        }


    });

    var grid = $('#dplyHistGrid').data('kendoExtGrid');

    $(grid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", grid.tbody).index(row);
        var colIdx = $("td", row).index(this);
        console.log(rowIdx + '-' + colIdx);

        indexOfDplyHistGrid = rowIdx;
    });

    // Deploy Group 그리드 설정
    $("#dplyGrpGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyGrpByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyHistGrid").data("kendoExtGrid");
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
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,deployStartDt:{type:"date"}
                        ,deployEndDt:{type:"date"}
                        ,procRsltNotiEndDt:{type:"date"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            $("#dplyDlrGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:232
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"deployGrpId", title:"<spring:message code='global.lbl.deployGrpId' />", width:140
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

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
//     $("#dplyCurrStateGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyCurrentState.do' />"
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
                          specCd              :{type:"string"}
                        , deployVerNo         :{type:"string"}
                        , deployGrpId         :{type:"string"}
                        , dlrCd               :{type:"string"}
                        , deployStartDt       :{type:"date"}
                        , deployEndDt         :{type:"date"}
                        , dlrNm               :{type:"string"}
                        , cnt                 :{type:"number"}
                        , retryCnt            :{type:"number"}
                        , status              :{type:"String"}
                        , rollbackStatus      :{type:"String"}
                        , startDt             :{type:"date"}
                        , endDt               :{type:"date"}
                        , duration            :{type:"number"}
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:false
        ,selectable:"row"
        ,height:232
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:120
            }

            ,{field:"status", title:"<spring:message code='global.lbl.deployStatCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"startDt", title:"<spring:message code='global.lbl.deployStartDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"endDt", title:"<spring:message code='global.lbl.deployEndDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"duration", title:"<spring:message code='global.lbl.durationSec' />", width:85
                ,attributes:{"class":"ac"}
            }
            ,{field:"retryCnt", title:"<spring:message code='global.lbl.deployRetryCnt' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackStatus", title:"<spring:message code='global.lbl.rollbackRsltMesgCont' />", width:70
                ,attributes:{"class":"ac"}
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

    function searchDplyReportDetailPopup() {

        var grid = $("#dplyDlrGrid").data("kendoExtGrid");
        dataItem = grid.dataItem(grid.select());

        if(dataItem == null || dataItem == 'undefined') {
            dms.notification.info("<spring:message code='cmm.info.notSelectDplyGrp' />");     // 배포그룹이 선택되지 않았습니다
            return;
        }

        searchDplyReportDetailPopupWin = dms.window.popup({
            windowId:"searchDplyReportDetailPopupWin"
            ,title:"<spring:message code='global.lbl.deployRsltCd' />"
            ,width:800
            ,height:550
            ,content:{
                url:"<c:url value='/dply/spec/dplyHist/selectDplyReportDetailPopup.do'/>"
                ,data:{
                     "autoBind"     :true
                    ,"specCd"       :dataItem.specCd
                    ,"deployVerNo"  :dataItem.deployVerNo
                    ,"deployGrpId"  :dataItem.deployGrpId
                    ,"dlrCd"        :dataItem.dlrCd
                    ,"callbackFunc" :function(param) {
//                         alert(JSON.stringify(param));

                    }
                }
            }

        });
    }


    // 버튼
    $("#btnSearchReport").kendoButton({
        click:function(e) {
            searchDplyReportDetailPopup();
        }
    });


    function clearDetailGrid() {
        $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
        $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);

        $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
        $("#dplyDlrGrid").data("kendoExtGrid").dataSource.data([]);
    }

    // 배포 실행 기능
    function execDeployStart() {
        var grid = $("#dplyHistGrid").data("kendoExtGrid");
        dataItem = grid.dataItem(grid.select());

        if(dataItem.deployStatCd != "N") {
            alert('The status must be Ready');
            return;
        }

        // 진행하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }

        searchBtnClicked = 'N';

        var param = {
            "specCd":dataItem.specCd
            ,"deployVerNo":dataItem.deployVerNo
        }

        $.ajax({
            url:"<c:url value='/dply/spec/dplyHist/updateDplyMastStateToRun.do'/>",
//             url:"<c:url value='/dply/spec/specMng/insertDplyDlr.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);

            },
            success:function(jqXHR, textStatus) {
//                 alert(jqXHR);
                if(jqXHR =! 1) {
                    dms.notification.warning("<spring:message code='cmm.info.notSaved' />");     // 저장되지 않았습니다.
                }
//                 alert(jqXHR.specCd);
//                 alert(jqXHR.deployVerNo);

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                var currentPage = grid.dataSource.page();
                grid.dataSource.page(currentPage);
            }
        });


    }

    // 배포 관련 기능
    function execDeploy(flag) {
        var grid = $("#dplyHistGrid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());

        if(dataItem == null || typeof dataItem == undefined) {
            return;
        }

        if(flag == 'S' && dataItem.deployStatCd != "N" && dataItem.deployStatCd != "R") { // STOP
            alert('The status must be READY or RUNNING');
            return;
        } else if(flag == 'R' && dataItem.deployStatCd != "S") { // RESTART
            alert('The status must be STOP');
            return;
        } else if(flag == 'C' && dataItem.deployStatCd != "N" && dataItem.deployStatCd != "R") { // CANCEL
            alert('The status must be READY or RUNNING');
            return;
        }

        // 진행하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }

        searchBtnClicked = 'N';

        var params = {};

        params["mesgGrpCd"]   = 'E';                         // SyncCommandSndr
        params["mesgCd"]      = '10002';                     // Immediately Deploy Request Message
        params["specCd"]      = dataItem.specCd;
        params["deployVerNo"] = dataItem.deployVerNo;
        params["deployOperCd"] = flag;

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);

            },
            success:function(jqXHR, textStatus) {
                processRsltOfSyncCmd(jqXHR, params);
            }
        });
    }

    function processRsltOfSyncCmd(jqXHR, params) {
        var grid = $("#dplyHistGrid").data("kendoExtGrid");
        dataItem = grid.dataItem(grid.select());

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        if(params["mesgCd"] == '10002') {  //
            var objTarget = $(objXML).find('mesg_code');

        }

/*
        //정상적으로 반영 되었습니다.
        dms.notification.success("<spring:message code='global.info.success'/>");
        var currentPage = grid.dataSource.page();
        grid.dataSource.page(currentPage);
*/
        if(objJson.result == 'OK') {
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
            var currentPage = grid.dataSource.page();
            grid.dataSource.page(currentPage);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }


    }





});

</script>


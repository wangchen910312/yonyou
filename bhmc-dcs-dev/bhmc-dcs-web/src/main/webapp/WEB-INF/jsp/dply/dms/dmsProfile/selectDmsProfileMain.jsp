<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript">

//DEPLOY대상여부:COM039
var deployTargYnTpList = [];
<c:forEach var="obj" items="${deployTargYnTpDS}">
    deployTargYnTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployTargYnTpArray = [];
$.each(deployTargYnTpList, function(idx, obj){
    deployTargYnTpArray[obj.cmmCd] = obj.cmmCdNm;
});

// 최종ALIVECHECK상태코드:COM043
var lastAchkResCdTpList = [];
<c:forEach var="obj" items="${lastAchkResCdTpDS}">
lastAchkResCdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var lastAchkResCdTpArray = [];
$.each(lastAchkResCdTpList, function(idx, obj){
    lastAchkResCdTpArray[obj.cmmCd] = obj.cmmCdNm;
});
lastAchkResCdTpArray[null] = '';

</script>
<div id="resizableContainer">
    <!-- DMS Profile 조회 -->
    <section class="group">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
            <h1 class="title_basic"><spring:message code='cmm.title.dmsProfile'/></h1>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12277" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
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
                        <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>
                        <td>
                            <input id="sDlrCd" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlrNm' /></th>
                        <td>
                            <input id="sDlrNm" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.deployTargYn'/></th>
                        <td>
                            <input id="sDeployTargYn" name="sDeployTargYn" data-json-obj="true" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.lastAchkResCd'/></th>
                        <td>
                            <input id="sLastAchkResCd" name="sLastAchkResCd" data-json-obj="true" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12276" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnCheck"><spring:message code='global.btn.checkState' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12275" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnProcessExclude"><spring:message code='global.btn.excludeProcess' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12274" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnProcessTarget"><spring:message code='global.btn.targetProcess' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12273" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDeployHistory"><spring:message code='global.btn.deployHistory' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12272" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnBundle"><spring:message code='global.btn.appInfo' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12271" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnUser"><spring:message code='global.btn.mobileAppInfo' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12270" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDatabaseObject"><spring:message code='global.btn.dbObject' /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12269" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnUpgradeAgent"><spring:message code='global.btn.agentUpgrade' /></button>
                </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->
    </section>
</div>

<script type="text/javascript">

var indexOfMainGrid = 0;
var searchBtnClicked = 'Y';

// 상태체크
function checkLocalDMS(mode, dlrCd) {
    var grid = $("#grid").data("kendoExtGrid");
    var rows = grid.select();
    var dataItem = grid.dataItem(rows);

    if(dataItem == null) {
        return;
    }

    if(dataItem.deployTpCd == "S") {

    }

    searchBtnClicked = 'N';

    var params = {};
    params["mesgGrpCd"]   = 'E';
    params["mesgCd"]      = '30001';
    params["dlrCd"]       = dataItem.dlrCd;

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
    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    if(params["mesgCd"] == '30001') {  //
        if(objJson.result == 'OK') {
            dms.notification.success("<spring:message code='cmm.info.normalForDms' />");    // LOCAL DMS 상태가 정상입니다.
            var currentPage = grid.dataSource.page();
            grid.dataSource.page(currentPage);
        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
            var currentPage = grid.dataSource.page();
            grid.dataSource.page(currentPage);
        }

    }
}


var searchDplyHistPopupWin;
function searchDplyHistPopup() {

    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    if(dataItem == null) {
        return;
    }

    var dlrCd = dataItem.dlrCd;

    searchDplyHistPopupWin = dms.window.popup({
        windowId:"searchDplyHistPopupWin"
        ,title:"<spring:message code='global.title.deployHistory' />"   // 배포이력
        ,width:800
        ,height:400
        ,content:{
            url:"<c:url value='/dply/dms/dmsProfile/selectDplyHistPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"displayGrid":true
                ,"dlrCd":dlrCd
                ,"callbackFunc":function(data) {
                    if(data.length >= 1) {

                    }
                }
            }
        }

    });
}

var searchDealerBundlePopupWin;
function searchDealerBundlePopup() {

    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    if(dataItem == null) {
        return;
    }

    var dlrCd = dataItem.dlrCd;

    searchDealerBundlePopupWin = dms.window.popup({
        windowId:"searchDealerBundlePopupWin"
        ,title:"<spring:message code='global.title.dmsAppStatusSearch' />"   // DMS Bundle Status Search
        ,width:800
        ,height:400
        ,content:{
            url:"<c:url value='/dply/dms/dmsProfile/selectDealerBundlePopup.do'/>"
            ,data:{
                "autoBind":false
                ,"displayGrid":true
                ,"dlrCd":dlrCd
                ,"callbackFunc":function(data) {
                    //alert(JSON.stringify(data));
                    if(data.length >= 1) {

                    }
                }
            }
        }

    });
}

var searchDMSMobileUserStatusPopupWin;
function searchDMSMobileUserStatusPopup() {

    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    if(dataItem == null) {
        return;
    }

    if(dataItem.deployTpCd == "S") {
        dms.notification.info("This action may not be accepted for Simulation Server.");
        return;
    }

    var dlrCd = dataItem.dlrCd;

    searchDMSMobileUserStatusPopupWin = dms.window.popup({
        windowId:"searchDMSMobileUserStatusPopupWin"
        ,title:"<spring:message code='global.title.dmsMobileUserInfo' />"   // DMS Mobile User Status Search
        ,width:800
        ,content:{
            url:"<c:url value='/dply/dms/dmsProfile/selectDMSMobileUserStatusPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"displayGrid":true
                ,"dlrCd":dlrCd
                ,"callbackFunc":function(data) {
                    //alert(JSON.stringify(data));
                    if(data.length >= 1) {

                    }
                }
            }
        }

    });
}

var searchDBObjectPopupWin;
function searchDBObjectPopup() {

    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    if(dataItem == null) {
        return;
    }

    var dlrCd = dataItem.dlrCd;

    searchDBObjectPopupWin = dms.window.popup({
        windowId:"searchDBObjectPopupWin"
        ,title:"<spring:message code='global.title.dbObjectSearch' />"   // DB Object 조회
        ,width:800
        ,height:400
        ,content:{
            url:"<c:url value='/dply/dms/dmsProfile/selectDBObjectPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"displayGrid":true
                ,"dlrCd":dlrCd
                ,"callbackFunc":function(data) {
                    //alert(JSON.stringify(data));
                    if(data.length >= 1) {

                    }
                }
            }
        }

    });
}

// Deploy 대상여부 반영 처리
function processDeployTargetYN(flag) {

    var grid = $("#grid").data("kendoExtGrid");
    var rows = grid.select();
    var updateList = [];

    if(rows == null) {
        return;
    }

    // 진행하시겠습니까?
    if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
        return;
    }

    for(var i=0; i<rows.length; i++) {
        if(grid.dataItem(rows[i]).deployTpCd == "S") {
            dms.notification.info("This action may not be accepted for Simulation Server.");
            return;
        }
    }

    searchBtnClicked = 'N';

    if(rows !== null) {
        $.each(rows, function(idx, row){
            var objRow = grid.dataItem(row);
            var obj = {dlrCd:objRow.dlrCd};
            updateList.push(obj);
        });

    }

    var param = {
        "updateList":updateList
        ,"flag":flag
    }

    $.ajax({
        url:"<c:url value='/dply/dms/dmsProfile/updateDeployTargetYN.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);
//             alert("error");

        },
        success:function(jqXHR, textStatus) {
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");

            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

}

var searchUpgradeAgentPopupWin;
function searchUpgradeAgentPopup() {
    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    if(dataItem == null) {
        return;
    }

    var dlrCd = dataItem.dlrCd;

    searchUpgradeAgentPopupWin = dms.window.popup({
        windowId:"searchUpgradeAgentPopupWin"
        ,title:"Upgrade Agent"   // Upgrade Agent
        ,width:800
        ,content:{
            url:"<c:url value='/dply/dms/dmsProfile/selectUpgradeAgentPopup.do'/>"
            ,data:{
                 "displayGrid":true
                ,"dlrCd":dlrCd
                ,"callbackFunc":function(param) {

                }
            }
        }

    });
}

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            searchBtnClicked = 'Y';

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 배포대상
    $("#sDeployTargYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:deployTargYnTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // 상태확인결과
    $("#sLastAchkResCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:lastAchkResCdTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/dms/dmsProfile/selectDmsProfile.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sDeployTargYn"] = $("#sDeployTargYn").data("kendoExtDropDownList").value();
                        params["sLastAchkResCd"] = $("#sLastAchkResCd").data("kendoExtDropDownList").value();

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
                        dlrCd              :{type:"string"}
                        ,deployTargYn      :{type:"string"}
                        ,lastAchkReqDt     :{type:"date"}
                        ,lastAchkResDt     :{type:"date"}
                        ,lastAchkResCd     :{type:"string"}
                        ,lastAchkResMsgCont:{type:"string"}
                        ,dlrNm             :{type:"string"}
                        ,dlrEngNm          :{type:"string"}
                        ,crnNo             :{type:"string"}
                        ,telNo             :{type:"string"}
                        ,faxNo             :{type:"string"}
                        ,ip                :{type:"string"}
                        ,port              :{type:"string"}
                        ,homepageUrl       :{type:"string"}
                        ,sqlDeploy         :{type:"string"}
                        ,repoDeploy        :{type:"string"}
                        ,fileDeploy        :{type:"string"}
                        ,deployProcess     :{type:"string"}
                        ,result            :{type:"string"}
                        ,resultMsg         :{type:"string"}
                        ,dmsOperEmailNm    :{type:"string"}
                        ,dmsOperTelNo      :{type:"string"}
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:true
        ,autoBind:false
        ,editable:false
        ,sortable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:170
            }

            ,{field:"deployTargYn", title:"<spring:message code='global.lbl.deployTargYn'/>", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=deployTargYnTpArray[deployTargYn]#"
            }
            ,{field:"lastAchkReqDt", title:"<spring:message code='global.lbl.lastAchkReqDt'/>", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"lastAchkResCd", title:"<spring:message code='global.lbl.lastAchkResCd'/>", width:90
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[lastAchkResCd]#"
            }

            ,{field:"sqlDeploy", title:"<spring:message code='global.lbl.sqlDeploy' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[sqlDeploy]#"
            }
            ,{field:"repoDeploy", title:"<spring:message code='global.lbl.repositoryDeploy' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[repoDeploy]#"
            }
            ,{field:"fileDeploy", title:"<spring:message code='global.lbl.fileDeploy' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[fileDeploy]#"
            }
            ,{field:"deployProcess", title:"<spring:message code='global.lbl.deployProcess' />", width:90
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[deployProcess]#"
            }
            ,{field:"resultMsg", title:"<spring:message code='global.lbl.lastAchkResMsgCont' />", width:170
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsOperTelNo", title:"<spring:message code='global.lbl.dmsOperTelNo' />", width:110
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsOperEmailNm", title:"<spring:message code='global.lbl.dmsOperEmailNm' />", width:120
            }
            ,{field:"ip", title:"<spring:message code='global.lbl.dlrIpAddrNm' />", width:120
            }
            ,{field:"port", title:"<spring:message code='global.lbl.dlrPortNo' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"homepageUrl", title:"<spring:message code='global.lbl.URL' />", width:300
            }


            ,{title:""}
        ],dataBound:function(e) {
            var grid = e.sender;

            if(searchBtnClicked == 'Y') {
                var row = grid.tbody.find("tr:eq(0)");
                if(row.length > 0) {
                    grid.select(row);
                }
            } else if (searchBtnClicked == 'N') {
                var row = grid.tbody.find("tr:eq(" + indexOfMainGrid +")");
                if(row.length > 0) {
                    grid.select(row);
                }
                searchBtnClicked = 'Y';

            }
        }
    });

    var grid = $('#grid').data('kendoExtGrid');

    $(grid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", grid.tbody).index(row);
        var colIdx = $("td", row).index(this);
        console.log(rowIdx + '-' + colIdx);

        indexOfMainGrid = rowIdx;
    });


    // 상태체크
    $("#btnCheck").kendoButton({
        click:function(e) {
            checkLocalDMS();
        }
    });

    // 제외처리
    $("#btnProcessExclude").kendoButton({
        click:function(e) {

            processDeployTargetYN('E');
        }
    });

    // 대상처리
    $("#btnProcessTarget").kendoButton({
        click:function(e) {

            processDeployTargetYN('Y');
        }
    });

    // 배포이력
    $("#btnDeployHistory").kendoButton({
        click:function(e) {
            searchDplyHistPopup();
        }
    });

    // Bundle정보
    $("#btnBundle").kendoButton({
        click:function(e) {
            searchDealerBundlePopup();
        }
    });

    // Mobile App
    $("#btnUser").kendoButton({
        click:function(e) {
            searchDMSMobileUserStatusPopup();
        }
    });

    // DB Object
    $("#btnDatabaseObject").kendoButton({
        click:function(e) {
            searchDBObjectPopup();
        }
    });

    // UPGRADE DMS AGENT
    $("#btnUpgradeAgent").kendoButton({
        click:function(e) {
            searchUpgradeAgentPopup();
        }
    });

    $('#grid').data('kendoExtGrid').dataSource.page(1);
});

</script>
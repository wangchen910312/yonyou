<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">

<!-- issueReqResvReady -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.issueReqResvReady" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11674" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnInit" name="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11673" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnExcelDownload" name="btnExcelDownload" class="btn_m hidden"><spring:message code="par.btn.excelDownload" /></button>
			</dms:access>

            <dms:access viewId="VIEW-D-11672" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvResvReady" class="btn_m btn_m_min hidden"><spring:message code="par.btn.invResvReady" /><!-- btnInvResvReady --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11671" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvResvCancel" class="btn_m btn_m_min hidden"><spring:message code="par.btn.invResvCancel" /><!-- btnInvResvCancel --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11669" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" class="btn_m btn_print btn_m_min hidden"><spring:message code="par.btn.print" /></button><!--btnSearch  -->
            </dms:access>
            <dms:access viewId="VIEW-D-11670" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </dms:access>
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="par.lbl.carNo" /></th>
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvReqDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvReqStartDt" name="sInvResvReqStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvReqEndDt" name="sInvResvReqEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvWorkDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvWorkStartDt" name="sInvResvWorkStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvWorkEndDt" name="sInvResvWorkEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.resvStatCd" /></th>
                    <td>
                        <input id="sResvStatCd" name="resvStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.vin" /></th>
                    <td>
                        <input id="sVin" name="sVin" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvDocNo" /></th>
                    <td class="required_area">
                        <input id="sInvResvDocNo" name="sInvResvDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoDocNo" /></th>
                    <td >
                        <input id="sInvRoDocNo" name="sInvRoDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.readyStatCd" /></th>
                    <td >
                        <input id="sReadyStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.visitNm" /></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvManNm" /></th>
                    <td>
                        <input id="sInvResvManNm" name="sInvResvManNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoManNm" /></th>
                    <td>
                        <input id="sInvRoManNm" name="sInvRoManNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoWorkDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvRoWorkStartDt" name="sInvRoWorkStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvRoWorkEndDt" name="sInvResvWorkEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"></th>
                    <td>
                        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- // tab start-->
    <div id="tabstrip" class="tab_area">
    <ul>
        <li id ="tabInvResvInfo" class="k-state-active"><spring:message code="par.title.invResvInfo" /></li>
        <li id ="tabRoWorkInfo"><spring:message code="par.title.invRoInfo" /></li>
    </ul>
    <!--tabPartOutStock tab area -->
    <div class="mt0">
        <section class="group">
            <div class="header_area">
            </div>
            <div class="table_grid">
                <!-- targetReqDetailGrid -->
                <div id="targetReqHeaderResvGrid" ></div>
                <!-- targetReqDetailGrid -->
            </div>
        </section>
    </div>
    <!-- tabRoWorkInfo tab area -->

    <div class="mt0">
        <section class="group">
            <div class="header_area">
            </div>
            <div class="table_grid">
                <div id="targetReqHeaderRoGrid" ></div>
            </div>
        </section>
    </div>

</div>
<!-- // tab end -->

    <div class="table_grid mt10">
        <!-- targetReqItemGrid -->
        <div id="targetReqItemGrid" class="resizable_grid"></div>
        <!-- targetReqItemGrid -->
    </div>

</section>
<!-- //issueReqResvReady -->

</div>
<!-- script -->
<script>
//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = {};
$.each(roTpCdList, function(idx, obj){
    roTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//readyStatCdList
var readyStatCdList = [],
readyStatCdAllList = [];
<c:forEach var="obj" items="${readyStatCdList}">
//준비상태코드 : 요청[01],준비[02],준비취소[04]
if("${obj.cmmCd}" == "01" || "${obj.cmmCd}" == "02" || "${obj.cmmCd}" == "04"){
    readyStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
readyStatCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var readyStatCdMap = {};
$.each(readyStatCdAllList, function(idx, obj){
    readyStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roStatusCdList
var roStatusCdList = [];
<c:forEach var="obj" items="${roStatusCdList}">
if("${obj.cmmCd}" == "01" || "${obj.cmmCd}" == "02"){
    roStatusCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
var roStatusCdMap = {};
$.each(roStatusCdList, function(idx, obj){
    roStatusCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = {};
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//location Array
var locCdList = [];
<c:forEach var="obj" items="${locCdList}">
locCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locCd}"
});
</c:forEach>
var locCdMap = {};
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//resvStatCdList
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var resvStatCdMap = {};
$.each(resvStatCdList, function(idx, obj){
    resvStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//dlStatCdList
var dlStatCdList = [];
<c:forEach var="obj" items="${dlStatCdList}">
dlStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dlStatCdMap = {};
$.each(dlStatCdList, function(idx, obj){
    dlStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}

var selectedIssueReqVO = {};
function getSelectedItem(){
    return selectedIssueReqVO;
}

var checkedIds01 = {},
checkedIds02 = {};

//page init Func
function pageInit(){
    var minDate = new Date('1990-01-01'),
        maxDate = new Date('9999-12-31'),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#sCarNo").val("");
    $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value("");
    $("#sInvResvWorkStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sInvResvWorkEndDt").data("kendoExtMaskedDatePicker").value("");

    $("#sVin").val("");
    $("#sInvResvDocNo").val("");
    $("#sInvRoDocNo").val("");
    $("#sReadyStatCd").data("kendoExtDropDownList").select(0);

    $("#sCustNm").val("");
    $("#sInvResvManNm").val("");
    $("#sInvRoManNm").val("");
    $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").value("");

    $("#targetReqHeaderResvGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqHeaderRoGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqItemGrid").data("kendoExtGrid").dataSource.data([]);

    //button disable
    buttonEnableDisable(true, "");

    checkedIds01 = {};
    checkedIds02 = {};

    $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sInvResvWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sInvResvWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

}

function buttonEnableDisable(bFlag, readyStatCd){
    $("#btnInvResvReady").data("kendoButton").enable(bFlag);
    $("#btnInvResvCancel").data("kendoButton").enable(bFlag);
    $("#btnPrint").data("kendoButton").enable(bFlag);

    if(readyStatCd == "01"){
        $("#btnInvResvReady").data("kendoButton").enable(true);
        $("#btnInvResvCancel").data("kendoButton").enable(false);
    }else if(readyStatCd == "02"){
        $("#btnInvResvReady").data("kendoButton").enable(false);
        $("#btnInvResvCancel").data("kendoButton").enable(true);
    }else if(readyStatCd == "04"){
        $("#btnInvResvReady").data("kendoButton").enable(false);
        $("#btnInvResvCancel").data("kendoButton").enable(false);
    }

}
//getSelectedGridObj Func
function getSelectedGridObj(){
    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
    var tabIndex = tabStrip.select().index();

    var grid = null;
    if(tabIndex === 0){//service reserve
        grid = $("#targetReqHeaderResvGrid").data("kendoExtGrid");

    }else if(tabIndex === 1){//service ro
        grid = $("#targetReqHeaderRoGrid").data("kendoExtGrid");
    }

    var gridObj = {
        "grid":grid
        ,"tabIndex":tabIndex
    }

    return gridObj;
}

function updateIssueResvReady(bFlag){

    var gridObj = getSelectedGridObj();

    var grid = gridObj.grid;
    items = grid.dataSource.data();
    rowCnt = 0;
    var dateItems = [ ];

    //checked list
    var readyStatCdList = { readyStatCd01:"01", readyStatCd02:"02", readyStatCd04:"04"};

    for (i = 0; i < items.length; i++) {
        var item = items[i];
        var elementRow = grid.tbody.find(".checkbox")[i];

        if(elementRow.checked){
            rowCnt++;
        }

        if(elementRow.checked){
            if(bFlag){
                item.readyStatCd = readyStatCdList.readyStatCd02;//ready
            }else{
                item.readyStatCd = readyStatCdList.readyStatCd01;//request
            }
            dateItems.push(item);
        }
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    var multiReqResvVOList = { insertList:[], updateList:dateItems, deleteList:[] };

    $.ajax({
        url:"<c:url value='/par/ism/issueReserve/multiIssuePartsResves.do' />"
        ,data:JSON.stringify(multiReqResvVOList)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            $("#targetReqHeaderResvGrid").data("kendoExtGrid").dataSource.read();
            $("#targetReqHeaderRoGrid").data("kendoExtGrid").dataSource.read();

            if(bFlag){
                //resvReady complete message
                dms.notification.success("<spring:message code='par.lbl.resvReady' var='resvReady' /><spring:message code='global.info.successMsg' arguments='${resvReady}' />");
            }else{
                //resvReadyCancel complete message
                dms.notification.success("<spring:message code='par.lbl.resvReadyCancel' var='resvReadyCancel' /><spring:message code='global.info.successMsg' arguments='${resvReadyCancel}' />");
            }
        }
        ,beforeSend:function(xhr){
            dms.loading.show($("#resizableContainer"));
        }
        ,complete:function(xhr,status){
            dms.loading.hide($("#resizableContainer"));
        }
    });
}
//parts reserve print popup Func
var issueReservePrintPopupButtonWindow;
function selectIssueReservePrintPopupButtonWindow(){
    issueReservePrintPopupButtonWindow = dms.window.popup({
        windowId:"issueReservePrintPopupButtonWindow"
        ,title:false
        ,width:800
        ,height:600
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReservePrintPopup.do'/>"
            ,data:{
                "parReqDocNo":$("#parReqDocNo").val()
                ,"carNo":$("#carNo").val()
                ,"custCd":$("#custCd").val()
                ,"custNm":$("#custNm").val()
                ,"callbackFunc":function(data){
                }
            }
        }
    });
}
//준비상태코드 가져오기.
function getSearchReadyStatCd(){
    var sReadyStatCd = $("#sReadyStatCd").val();
    if(sReadyStatCd == ""){
        sReadyStatCd ="RE01";
    }

    return sReadyStatCd;
}

    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                //pageInit Func call.
                pageInit();
            }
        });
        //btnInvResvReady
        $("#btnInvResvReady").kendoButton({
            click:function(e){
                //updateIssueResvReady Func call
                updateIssueResvReady(true);
            }
        });
        //btnInvResvCancel
        $("#btnInvResvCancel").kendoButton({
            click:function(e){
                //updateIssueResvReady Func call
                updateIssueResvReady(false);
            }
        });
        //btnExcelDownload
        $("#btnExcelDownload").kendoButton({
            click:function(e){
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            click:function(e){
                //selectIssueReceivePrintPopupButtonWindow Func call
                selectIssueReservePrintPopupButtonWindow();
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#targetReqHeaderResvGrid").data("kendoExtGrid").dataSource.read();
                $("#targetReqHeaderRoGrid").data("kendoExtGrid").dataSource.read();
            }
        });

        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //sResvStatCdList dropdownlist
        $("#sResvStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:resvStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // readyStatCd dropdownlist
        $("#sReadyStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:readyStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sInvResvReqStartDt datepicker
        $("#sInvResvReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvReqEndDt datepicker
        $("#sInvResvReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvWorkStartDt datepicker
        $("#sInvResvWorkStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvWorkEndDt datepicker
        $("#sInvResvWorkEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvRoWorkStartDt datepicker
        $("#sInvRoWorkStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvRoWorkEndDt datepicker
        $("#sInvRoWorkEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //targetReqHeaderResvGrid.
        $("#targetReqHeaderResvGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135497"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var sReadyStatCd = getSearchReadyStatCd();

                            params["sParGiTp"] = "SR";
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sResvDocNoLike"] = $("#sInvResvDocNo").val();//sResvDocNo
                            params["sReqStartDt"] = $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value();//sReqStartDt
                            params["sReqEndDt"] = $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value();//sReqEndDt
                            params["sCustNm"] = $("#sCustNm").val();//sCustNm
                            params["sSerPrsnId"] = $("#sInvResvManNm").val();//sSerPrsnId.
                            params["sReadyStatCd"] = sReadyStatCd;
                            params["sResvStatCd"] = $("#sResvStatCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,parReqDocNo:{ type:"string"}
                            ,parGiTp:{ type:"string"}
                            ,parReqStatCd:{ type:"string"}
                            ,readyStatCd:{ type:"string", editable:true}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,resvDocNo:{ type:"string"}
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string" }
                            ,custCd:{ type:"string" }
                            ,custNm:{ type:"string" }
                            ,vinNo:{ type:"string" }
                            ,carNo:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,itemCnt:{ type:"number" }
                            ,resvStatCd:{ type:"string" }
                            ,roStatCd:{ type:"string" }
                            ,dlStatCd:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,height:357
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column set:default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,indvColumnRows:3
            ,dataBound:function(e){

                var view = this.dataSource.view();
                for(var i = 0; i < view.length;i++){
                    if(checkedIds01[view[i].id]){
                        this.tbody.find("tr[data-uid='" + view[i].uid + "']")
                        .addClass("k-state-selected")
                        .find(".checkbox")
                        .attr("checked","checked");
                    }
                }

                $(".checkbox").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqHeaderResvGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    checkedIds01[dataItem.id] = checked;

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }
                });
            }
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#parReqDocNo").val(selectedItem.parReqDocNo);
                    $("#targetReqItemGrid").data("kendoExtGrid").dataSource.read();
                    buttonEnableDisable(true, selectedItem.readyStatCd);
                    selectedIssueReqVO = selectedItem;
                }
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [{title:"", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' type='checkbox' />"
                }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"custNm", title:"<spring:message code='par.lbl.vsitr'/>", width:100 }
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.invResvDocNo'/>", width:120 }
                ,{field:"resvStatCd", title:"<spring:message code='par.lbl.resvStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:'#if(resvStatCdMap[resvStatCd] !== undefined){# #= resvStatCdMap[resvStatCd]# #}#'
                }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvReqTime'/>", width:120, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.invResvManNm'/>", width:100 }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invRoWorkTime'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"parGiTp", title:"<spring:message code='par.lbl.parGiTpStandBy'/>", width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                        return spanObj;
                    }
                }
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,hidden:true
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.readyStatCd){
                            case "02"://준비
                                spanObj = "<span class='txt_label bg_yellow'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "03"://예류
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "04"://준비취소
                            case "05"://예류취소
                                spanObj = "<span class='txt_label bg_red'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "06"://정비예약
                                spanObj = "<span class='txt_label bg_green'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            default: //요청
                                spanObj = "<span class='txt_label bg_gray'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
            ]
        });
        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqHeaderResvGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox")[i];
                elementRow.checked = checked;

                checkedIds01[dataItem.id] = checked;

                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });

        //targetReqHeaderRoGrid.
        $("#targetReqHeaderRoGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135494"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {

                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var sReadyStatCd = getSearchReadyStatCd();

                            params["sParGiTp"] = "RO";
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sRoDocNo"] = $("#sInvRoDocNo").val();//sResvDocNo
                            params["sReqStartDt"] = $("#sInvResvWorkStartDt").data("kendoExtMaskedDatePicker").value();//sReqStartDt
                            params["sReqEndDt"] = $("#sInvResvWorkEndDt").data("kendoExtMaskedDatePicker").value();//sReqEndDt
                            params["sCustNm"] = $("#sCustNm").val();//sCustNm
                            params["sSerPrsnId"] = $("#sInvRoManNm").val();//sSerPrsnId.
                            params["sRoStatCdYn"] = "Y";
                            params["sReadyStatCd"] = sReadyStatCd;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,parReqDocNo:{ type:"string"}
                            ,parGiTp:{ type:"string"}
                            ,parReqStatCd:{ type:"string"}
                            ,readyStatCd:{ type:"string", editable:true}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string", editable:false}
                            ,resvDocNo:{ type:"string", editable:false}
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string", editable:false}
                            ,custCd:{ type:"string" , editable:false}
                            ,custNm:{ type:"string" , editable:false}
                            ,vinNo:{ type:"string" , editable:false}
                            ,carNo:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,resvStatCd:{ type:"string" }
                            ,roStatCd:{ type:"string" }
                            ,dlStatCd:{ type:"string" }
                            ,regUsrId:{ type:"string" , editable:false}
                            ,regDt:{ type:"date" , editable:false}
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,height:357
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//emptycolumn. default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,indvColumnRows:3
            ,dataBound:function(e){

                var view = this.dataSource.view();
                for(var i = 0; i < view.length;i++){
                    if(checkedIds02[view[i].id]){
                        this.tbody.find("tr[data-uid='" + view[i].uid + "']")
                        .addClass("k-state-selected")
                        .find(".checkbox")
                        .attr("checked","checked");
                    }
                }

                $(".checkbox").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqHeaderRoGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }
                });
            }
            ,change:function(e) {
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#parReqDocNo").val(selectedItem.parReqDocNo);
                    $("#targetReqItemGrid").data("kendoExtGrid").dataSource.read();
                    buttonEnableDisable(true, selectedItem.readyStatCd);
                    selectedIssueReqVO = selectedItem;
                }
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [{title:"", width:40,_field:"_checkAll02" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll02' type='checkbox' />"
                }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"custNm", title:"<spring:message code='par.lbl.vsitr'/>", width:100 }
                ,{field:"serPrsnId", title:"<spring:message code='par.lbl.prsNm'/>", width:100 }
                ,{field:"roDocNo", title:"<spring:message code='par.lbl.invRoDocNo'/>", width:140 }
                ,{ field:"roTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.roTp+"]"+roTpCdMap[dataItem.roTp]+"</span>";
                        return spanObj;
                    }
                }//roTp
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvWorkTime'/>", width:120, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.invRoManNm'/>", width:100 }
                ,{ field:"roStatCd", title:"<spring:message code='par.lbl.roStatus'/>"
                    ,width:110
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.roStatCd){
                            case "02":
                                spanObj = "<span class='txt_label bg_orange'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "03":
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "04":
                                spanObj = "<span class='txt_label bg_purple'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "05":
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "06":
                                spanObj = "<span class='txt_label bg_red'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            default: //01
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//roStatCd
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.readyStatCd){
                            case "02"://준비
                                spanObj = "<span class='txt_label bg_yellow'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "03"://예류
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "04"://준비취소
                            case "05"://예류취소
                                spanObj = "<span class='txt_label bg_red'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "06"://정비예약
                                spanObj = "<span class='txt_label bg_green'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            default: //요청
                                spanObj = "<span class='txt_label bg_gray'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
            ]
        });

        //grid checkbox all
        $("#chkAll02").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqHeaderRoGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox")[i];
                elementRow.checked = checked;

                checkedIds02[dataItem.id] = checked;

                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });

        //targetReqItemGrid
        $("#targetReqItemGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135403"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#parReqDocNo").val() == "" ? "X":$("#parReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,itemSalePrc:{ type:"number" , editable:false }
                            ,itemSaleAmt:{ type:"number" , editable:false }
                            ,dcRate:{ type:"number" , editable:false }
                            ,dcAmt:{ type:"number" , editable:false }
                            ,itemTotAmt:{ type:"number" , editable:false }
                            ,movingAvgPrc:{ type:"number" , editable:false }
                            ,movingAvgAmt:{ type:"number" , editable:false }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:false }
                            ,borrowLineNo:{ type:"number", editable:false }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,editable:false
            ,height:242
            ,filterable:false
            ,pageable:false
            ,autoBind:false
            ,selectable:"row"
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:false
            ,indvColumnRows:3
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:150}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unit' />", width:80}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvReqQty' />",format:"{0:n2}", width:80, attributes:{"class":"ar"}}
                ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"itemSaleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                    ,template:function(dataItem){
                        var itemSaleAmt = 0;
                        itemSaleAmt = dataItem.resvQty * dataItem.itemSalePrc;
                        return kendo.toString(itemSaleAmt,'n2');
                    }
                }
                ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"} ,format:"{0:n0}"}
                ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:90, attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    ,template:'#if(giStrgeCdMap[giStrgeCd] !== undefined){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"locId", title:"<spring:message code='par.lbl.locNm' />", width:150}
                ,{field:"readyRegDt", title:"<spring:message code='par.lbl.readyRegDt' />", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyUsrId", title:"<spring:message code='par.lbl.readyUsrId' />", width:100}
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyStatCd' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.readyStatCd){
                            case "02"://준비
                                spanObj = "<span class='txt_label bg_yellow'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "03"://예류
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "04"://준비취소
                            case "05"://예류취소
                                spanObj = "<span class='txt_label bg_red'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "06"://정비예약
                                spanObj = "<span class='txt_label bg_green'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "07"://정비완성
                                spanObj = "<span class='txt_label bg_blue'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            default: //요청
                                spanObj = "<span class='txt_label bg_gray'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
            ]
        });

    });

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sInvResvReqStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvWorkStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvWorkStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvWorkEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvWorkEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvRoWorkStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvRoWorkEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sInvResvReqStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvWorkStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvWorkEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvRoWorkStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvRoWorkEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }
</script>
<!-- //script -->

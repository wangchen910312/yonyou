<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issuePartsReserve -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.partsReserveInfo" /> --%><!-- partsReserveInfo --></h1>
            <div class="btn_right">
                <button class="btn_m btn_init" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.resvTp" /><!-- resvTp --></th>
                    <td>
                        <input id="sResvTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.partsResvDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sPartsResvDocNo" name="sPartsResvDocNo" class="form_input" />
                        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.saId" /><!-- par.lbl.saId --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sSaTp" class="form_comboBox" />
                                <span class="txt_from">-</span>
                            </div>
                            <div class="date_right">
                                <div class="form_search">
                                    <input id="sSaNm" name="sSaNm" class="form_input" />
                                        <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- search --></a>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.resvDt" /><!-- issueRegDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sResvStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sResvEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNo" /><!-- custNo --></th>
                    <td>
                        <div class="form_search">
                            <input type="hidden" id="sCustCd" name="sCustCd" />
                            <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- CustCd Search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- CarNo Search --></a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- targetResvHeaderGrid -->
        <div id="targetResvHeaderGrid" ></div>
        <!-- targetResvHeaderGrid -->
    </div>

    <!-- // tab start-->
    <div id="tabstrip" class="tab_area mt10">
    <ul>
        <li id ="tabPartsReserve" class="k-state-active"><spring:message code="par.title.partsReserveInfo" /><!-- partsReserveInfo --></li>
        <li id ="tabPartsReserveReady"><spring:message code="par.title.partsReserveReady" /><!-- partsReserveReady --></li>
    </ul>
    <!--tabPartResv tab area -->
    <div>
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnResvReq" class="btn_s btn_s_min5"><spring:message code="par.btn.resvReq" /><!-- btnResvReq --></button>
                    <button id="btnCopyFromExcel" class="btn_s btn_s_min5"><spring:message code="par.btn.copyFromTable" /><!-- btnCopyFromTable --></button>
                    <button id="btnPartsAdd" class="btn_s btn_s_min5"><spring:message code="par.btn.addItemPop" /><!-- btnPartsAdd --></button>
                    <button class="btn_s btn_s_min5 btn_add" id="btnAdd" type="button"><spring:message code="par.btn.rowAdd" /></button><!--rowAdd  -->
                    <button class="btn_s btn_s_min5 btn_del" id="btnDel" type="button"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
                    <button id="btnPakage" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.pakage" /><!-- btnPakage --></button>
                    <button id="btnOrderReq" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.orderReq" /><!-- btnOrderReq --></button>
                    <button id="btnAvlbReq" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.avlbReq" /><!-- btnAvlbReq --></button>
                </div>
            </div>
            <div class="table_grid">
                <!-- targetReqDetailGrid -->
                <div id="targetReqDetailGrid" ></div>
                <!-- targetReqDetailGrid -->
            </div>
        </section>
    </div>
    <!-- tabPartReadyResv tab area -->

    <div>
        <section class="group">
            <div class="header_area">
                <div class="btn_right" style="height:27px">
                    &nbsp;
                </div>
            </div>
            <div class="table_grid">
                <div id="targetPartsReserveGrid" ></div>
            </div>
        </section>
    </div>

</div>
<!-- // tab end -->

</section>
<!-- //issueReqMng -->

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
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});
//roTpCdGrid Func
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}
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
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var locCdMap = {};
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}

//order request popup Func
var issueReqPopupButtonWindow;
function selectIssueReqPopupButtonWindow(){
    issueReqPopupButtonWindow = dms.window.popup({
        windowId:"issueReqPopupButtonWindow"
        ,title:false
        ,width:300
        ,height:110
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReqCheckPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    // order reqeust y or n
                    if(data.flag == "Y"){
                        $("#btnOrderReq").click();
                    }
                }
            }
        }
    });
}
//order retrun popup Func
var issueReturnPopupButtonWindow;
function selectIssueReturnPopupButtonWindow(grid){
    issueReturnPopupButtonWindow = dms.window.popup({
        windowId:"issueReturnPopupButtonWindow"
        ,title:false
        ,width:300
        ,height:90
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReturnCheckPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    //receive y or n
                    if(data.flag == "Y"){

                        var dateItems = [ ];
                        var itemReturnCnt = 0;
                        var rows = grid.select();
                        $.each(rows, function(idx, row){
                            //출고상태 02 완료 인것만 반품 가능
                            var item = grid.dataItem(row);
                            if(parReqStatCd ==="02"){
                                item.returnId = data.receiveNm;
                                item.giDocStatCd = "03";
                                item.giStatCd = "03";
                                dateItems.push(item);
                                itemReturnCnt++;
                            }
                        });

                        if(itemReturnCnt ===0){
                            var issuePartsOutVO = {
                                    dlrCd:""
                                    ,giDocNo:dateItems[0].giDocNo
                                    ,giDocTp:"03"
                                    ,giDocStatCd:"03"
                                    ,cancYn:"Y"
                                    ,parReqDocNo:dateItems[0].parReqDocNo
                                    ,roDocNo:dateItems[0].roDocNo
                                    ,pltCd:""
                                    ,serPrsnId:$("#serPrsnId").val()
                                    ,custCd:$("#custCd").val()
                                    ,custNm:$("#custNm").val()
                                    ,vinNo:$("#vinNo").val()
                                    ,carNo:$("#carNo").val()
                                    ,mvtDocYyMm:""
                                    ,mvtDocNo:""
                                    ,regUsrId:null
                                    ,regDt:null
                                    ,updtUsrId:null
                                    ,updtDt:null
                                }

                            var issueReqSaveVO = { "issuePartsOutVO":issuePartsOutVO, "issueReqDetailVO":dateItems };
                            $.ajax({
                                url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutReturnInves.do' />"
                                ,data:JSON.stringify(issueReqSaveVO)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,success:function(jqXHR, textStatus){
                                    grid.dataSource.read();
                                    $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                                    //parts Out Return complete message.
                                    dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                                }
                            });
                        }
                    }
                }
            }
        }
    });
}
//order receive popup Func
var issueReceivePopupButtonWindow;
function selectIssueReceivePopupButtonWindow(grid){
    issueReceivePopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePopupButtonWindow"
        ,title:false
        ,width:400
        ,height:140
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceiveCheckPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    //receive y or n
                    if(data.flag == "Y"){

                        var dateItems = [ ];
                        var rows = grid.select();
                        $.each(rows, function(idx, row){
                            var item = grid.dataItem(row);
                            item.receiveId = data.receiveNm;
                            item.giDocStatCd = "02";
                            item.giStatCd = "02";
                            dateItems.push(item);
                        });

                        var issuePartsOutVO = {
                                dlrCd:""
                                ,giDocNo:dateItems[0].giDocNo
                                ,giDocTp:"02"
                                ,giDocStatCd:"02"
                                ,cancYn:"N"
                                ,parReqDocNo:dateItems[0].parReqDocNo
                                ,roDocNo:dateItems[0].roDocNo
                                ,pltCd:""
                                ,serPrsnId:$("#serPrsnId").val()
                                ,custCd:$("#custCd").val()
                                ,custNm:$("#custNm").val()
                                ,vinNo:$("#vinNo").val()
                                ,carNo:$("#carNo").val()
                                ,mvtDocYyMm:""
                                ,mvtDocNo:""
                                ,regUsrId:null
                                ,regDt:null
                                ,updtUsrId:null
                                ,updtDt:null
                            }

                        var issueReqSaveVO = {
                            "issuePartsOutVO":issuePartsOutVO
                            ,"issueReqDetailVO":dateItems
                            ,"repairOrderLaborVO":[]
                        }
                        $.ajax({
                            url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutInves.do' />"
                            ,data:JSON.stringify(issueReqSaveVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(jqXHR, textStatus){
                                grid.dataSource.read();
                                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                                //parts Out complete message.
                                dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                            }
                        });

                    }
                }
            }
        }
    });
}
//order receive print popup Func
var issueReceivePrintPopupButtonWindow;
function selectIssueReceivePrintPopupButtonWindow(){
    issueReceivePrintPopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePrintPopupButtonWindow"
        ,title:false
        ,width:800
        ,height:600
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceivePrintPopup.do'/>"
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

//page init Func
function pageInit(){
    $("#sResvTp").data("kendoExtDropDownList").select(0);
    $("#sParReqDocNo").val("");
    $("#sParReqStatCd").data("kendoExtDropDownList").select(0);
    $("#sResvStartDt").data("kendoExtMaskedDatePicker").value(new Date("${sysStartDate}"));
    $("#sResvEndDt").data("kendoExtMaskedDatePicker").value(new Date("${sysEndDate}"));
    $("#sCustCd").val("");
    $("#sCustNm").val("");
    $("#sSerPrsnId").val("");
    $("#sCarNo").val("");

    $("#parGiTp").val("");
    $("#parReqDocNo").val("");
    $("#roDocNo").val("");
    $("#parGiTp").val("");
    $("#resvDocNo").val("");
    $("#parReqStatCd").val("");
    $("#parReqStatNm").val("");
    $("#reqStartDt").val("");
    $("#custNm").val("");
    $("#custCd").val("");
    $("#carNo").val("");
    $("#vinNo").val("");
    $("#serPrsnId").val("");
    //button disable
    buttonEnableDisable(false, "00", "00");
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag, parReqStatCd, parGiTp){
    //page button list
    $("#btnInvReq").data("kendoButton").enable(false);
    $("#btnPrint").data("kendoButton").enable(false);
    $("#btnInvReqSave").data("kendoButton").enable(false);

    //parts button list
    $("#btnPakage").data("kendoButton").enable(false);
    $("#btnOrderReq").data("kendoButton").enable(false);
    $("#btnCopyFromExcel").data("kendoButton").enable(false);
    $("#btnPartsAdd").data("kendoButton").enable(false);
    $("#btnResvReq").data("kendoButton").enable(false);
    $("#btnAvlbReq").data("kendoButton").enable(false);
    $("#btnInvCancel").data("kendoButton").enable(false);
    $("#btnAdd").data("kendoButton").enable(false);
    $("#btnDel").data("kendoButton").enable(false);

    if(parReqStatCd === "01"){

        $("#btnInvReq").data("kendoButton").enable(true);
        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnInvReqSave").data("kendoButton").enable(true);

        $("#btnPakage").data("kendoButton").enable(true);
        $("#btnCopyFromExcel").data("kendoButton").enable(true);
        $("#btnPartsAdd").data("kendoButton").enable(true);

        if(parGiTp == "SR" || parGiTp == "RO"){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
        }
        if(bFlag){
            $("#btnResvReq").data("kendoButton").enable(true);
        }
        else{
            $("#btnPakage").data("kendoButton").enable(true);
            $("#btnOrderReq").data("kendoButton").enable(true);
            $("#btnCopyFromExcel").data("kendoButton").enable(true);
            $("#btnPartsAdd").data("kendoButton").enable(true);
            $("#btnResvReq").data("kendoButton").enable(true);
            $("#btnAvlbReq").data("kendoButton").enable(true);
            $("#btnInvCancel").data("kendoButton").enable(true);
        }
    }else if(parReqStatCd === "02"){
        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnInvCancel").data("kendoButton").enable(true);
    }
}
//updateIssuePartsResves Func
function updateIssuePartsResves(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line check
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        // checked list
        $.each(rows, function(idx, row){
            dateItems.push(grid.dataItem(row));
        });

        var multiIssueReqDetailPartsResves = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/ism/issuePartsResv/multiIssueReqDetailPartsResves.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsResves)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // resv complete message
                dms.notification.success("<spring:message code='par.lbl.resv' var='resv' /><spring:message code='global.info.successMsg' arguments='${resv}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsAvlbes Func
function updateIssuePartsAvlbes(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line selected message
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqDbYnCnt = 0;
        // checkbox selecte row list
        $.each(rows, function(idx, row){

            var item = grid.dataItem(row);

            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }

            dateItems.push(item);
        });

        if(issueReqItemCheckCnt > 0){
            // itemCd check message.
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
             // data save continue.
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }

        var multiIssueReqDetailPartsAvlbes = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/ism/issuePartsAvlb/multiIssueReqDetailPartsAvlbes.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsAvlbes)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // parts avlbes complete message
                dms.notification.success("<spring:message code='par.lbl.orderReq' var='orderReq' /><spring:message code='global.info.successMsg' arguments='${orderReq}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsRoes Func
function updateIssuePartsRoes(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        //line select message
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqDbYnCnt = 0;
        //checked list
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);
            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }
            dateItems.push(item);
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd message
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
             //save continue message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }

        var multiIssueReqDetailPartsRoes = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/pcm/purcRqst/multiIssueReqDetailPartsRoes.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsRoes)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // orderReq complete message.
                dms.notification.success("<spring:message code='par.lbl.orderReq' var='orderReq' /><spring:message code='global.info.successMsg' arguments='${orderReq}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//RO InvsReq Func.
function updateIssuePartsInves(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqGiStrgeCdCheckCnt = 0;
        var issueReqGiLocCdCheckCnt = 0;
        var issueReqCheckCnt = 0;
        var issueReqDbYnCnt = 0;

        //checked list.
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);
            if(item.reqQty > item.avlbStockQty){
                issueReqCheckCnt++;
            }
            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.giStrgeCd == ""){
                issueReqGiStrgeCdCheckCnt++;
            }
            if(item.giLocCd == ""){
                issueReqGiLocCdCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }
            dateItems.push(item);
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd check message.
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqGiStrgeCdCheckCnt > 0){
            //giStrgeCd check message
            dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giStrgeCd}' />");
            return false;
        }

        if(issueReqGiLocCdCheckCnt > 0){
            //giLocCd check message
            dms.notification.info("<spring:message code='par.lbl.giLocCd' var='giLocCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giLocCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
            //is Save Run message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }
        if(issueReqCheckCnt > 0){
            //order Req popup show.
            selectIssueReqPopupButtonWindow();
        }else{
            //receive Popup show.
            selectIssueReceivePopupButtonWindow(grid);
        }

    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsSaves Func.
function updateIssuePartsSaves(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.dataSource.data();

    var dateItems = [ ];
    var issueReqItemCheckCnt = 0;
    //checked list
    $.each(rows, function(idx, row){
        var item = row;
        if(item.itemCd == ""){
            issueReqItemCheckCnt++;
        }
        dateItems.push(item);
    });

    if(issueReqItemCheckCnt > 0){
        // itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    var multiIssueReqDetails = grid.getCUDData("insertList", "updateList", "deleteList");
    if(grid.cudDataLength == 0){
        dms.notification.info("<spring:message code='global.info.required.change'/>");
        return;
    }

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parGiTp":$("#parGiTp").val()
            ,"parReqStatCd":$("#parReqStatCd").val()
            ,"cancYn":"N"
            ,"roDocNo":$("#roDocNo").val()
            ,"resvDocNo":$("#resvDocNo").val()
            ,"pltCd":null
            ,"serPrsnId":$("#serPrsnId").val()
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":$("#vinNo").val()
            ,"carNo":$("#carNo").val()
            ,"carlineCd":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
        }
        ,"issueReqDetailVO":multiIssueReqDetails
        ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/multiIssueReqDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            // destroy data clear and data reload
            grid.dataSource._destroyed = [];
            grid.dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}
//updateIssueInvReturn(InvCancel) Func
function updateIssueInvReturn(statCd){

    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReturnCheckCnt = 0;
        var issueReqDbYnCnt = 0;

        //checked list.
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);

            //TODO:[InBoShim] return  item operate ready.
            if(item.parReqStatCd == "02"){
                if(item.returnQty > item.avlbStockQty){
                    issueReqCheckCnt++;
                }
                if(item.itemCd == ""){
                    issueReqItemCheckCnt++;
                }
                if(item.dbYn == "N"){
                    issueReqDbYnCnt++;
                }
                if(item.parReqStatCd == "02"){
                    issueReturnCheckCnt++;
                }
                dateItems.push(item);
            }
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd check message.
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
            //is Save Run message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }
        if(issueReturnCheckCnt > 0){
            //returnQty check message.
            dms.notification.info("<spring:message code='par.lbl.returnQty' var='returnQty' /><spring:message code='par.info.issueCheckMsg' arguments='${returnQty}' />");
            return false;
        }else{
            //return Popup show.
            selectIssueReturnPopupButtonWindow(grid);
        }

    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
// reqHeaderChanged
function selectTargetReqHeaderChanged(selectedItem){
    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);//parGiTp
    if(selectedItem.parGiTp == "SR") //giTp Resv(SR)
        buttonEnableDisable(true, selectedItem.parReqStatCd, selectedItem.parGiTp);
    else
        buttonEnableDisable(false, selectedItem.parReqStatCd, selectedItem.parGiTp);
    $("#parReqDocNo").val(selectedItem.parReqDocNo);    //parReqDocNo
    $("#roDocNo").val(selectedItem.roDocNo);            //roDocNo
    $("#parGiTp").val(selectedItem.parGiTp);            //parGiTp
    $("#resvDocNo").val(selectedItem.resvDocNo);        //resvDocNo
    $("#parReqStatCd").val(selectedItem.parReqStatCd);  //parReqStatCd
    $("#parReqStatNm").val(partsParReqStatCdMap[selectedItem.parReqStatCd]);  //parReqStatNm
    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));     // regDt
    $("#custCd").val(selectedItem.custCd);              //custCd
    $("#custNm").val(selectedItem.custNm);              //custNm
    $("#carNo").val(selectedItem.carNo);                //carNo
    $("#vinNo").val(selectedItem.vinNo);                //vinNo
    $("#serPrsnId").val(selectedItem.serPrsnId);        //serPrsnId
    //targetLbrGrid
    $("#targetLbrGrid").data("kendoExtGrid").dataSource.read();
    //tergetReqDetailGrid
    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
}
// targetReqDetailGrid Change Func
function targetReqDetailGridChanged(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    // k-state-selected add all
    grid.tbody.find('>tr').each(function(){
        var dataItem = grid.dataItem(this);
        if(dataItem.dirty)
            $(this).addClass("k-state-selected");
    });
}
//package popup Func
var workPackagePopup;
function selectWorkPackagePopupWindow(){
    workPackagePopup = dms.window.popup({
        windowId:"workPackagePopup"
        ,height:600
        ,title:"<spring:message code='par.lbl.pakage' />"   //pakage
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectWorkPackagePopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"multiple"
                ,"callbackFunc":function(parData, lbrData){
                    //partItems, lbrItems Add Func call
                    setPartsItemsAndLbrItems(parData, lbrData);


                }
            }
        }
    });
}
//PartItemLbrItem Add Func
function setPartsItemsAndLbrItems(parData, lbrData){
    //parts Item add
    for(var i=0; i<parData.length; i++){
        var data = parData[i];
        var sRnum = 1;
        var itemCheckCnt = 0;
        var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
        grid.tbody.find('>tr').each(function(){
            var dataItem = grid.dataItem(this);
            var vRoLineNoFr = dataItem.roLineNo;
            if(sRnum < vRoLineNoFr){
                sRnum = vRoLineNoFr;
            }
            sRnum = sRnum + 1;
            if(dataItem.itemCd === data.itemCd){
                itemCheckCnt++;
            }

        });

        if(itemCheckCnt === 0){
            var IssueReqDetailVO = {
                "rnum":sRnum
                ,"dlrCd":null
                ,"pltCd":null
                ,"parReqDocNo":$("#parReqDocNo").val()
                ,"parReqDocLineNo":sRnum
                ,"parReqStatCd":"01"
                ,"purcReqNo":"01"
                ,"reqStrgeCd":""
                ,"cancYn":"N"
                ,"parGiTp":$("#parGiTp").val()
                ,"roDocNo":$("#roDocNo").val()
                ,"roLineNo":sRnum
                ,"resvDocNo":$("#resvDocNo").val()
                ,"resvDocLineNo":sRnum
                ,"grStrgeCd":""
                ,"giStrgeCd":""
                ,"giLocCd":""
                ,"dbItemCd":data.itemCd
                ,"pkgItemCd":data.pkgItemCd
                ,"itemCd":data.itemCd
                ,"itemNm":data.itemNm
                ,"unitCd":data.stockUnitCd
                ,"reqQty":1
                ,"endQty":0
                ,"avlbStockQty":null
                ,"resvStockQty":null
                ,"clamStockQty":null
                ,"grScheQty":null
                ,"giScheQty":null
                ,"resvQty":1
                ,"purcReqDt":null
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":null
                ,"dbYn":"N"
                ,"itemPrc":data.itemPrc
                ,"taxAmt":data.itemAmt
                ,"taxDdctAmt":data.itemAmt
                ,"taxAmt":null
                ,"receiveDt":null
                ,"receiveId":null
                ,"returnPartsQty":null
                ,"returnDt":null
                ,"returnId":null
            }
            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
        }
    }
    //lbr Item add
    for(var j=0; j<lbrData.length; j++){
        var data = lbrData[j];
        if(data.lbrCd !== ""){
            var itemCheckCnt = 0;
            var lbrGrid = $("#targetLbrGrid").data("kendoExtGrid");
            var sRnum = lbrGrid.dataSource.total();
            lbrGrid.tbody.find('>tr').each(function(){
                var dataItem = lbrGrid.dataItem(this);
                if(dataItem.lbrCd === data.lbrCd){
                    itemCheckCnt++;
                }
            });

            if(itemCheckCnt === 0){
                var lbrVO = {
                    rnum:sRnum + 1
                    ,dlrCd:null
                    ,roTp:"01"
                    ,roDocNo:$("#roDocNo").val()
                    ,lbrCd:data.lbrCd
                    ,lbrNm:data.lbrNm
                    ,lbrTp:data.lbrTp
                    ,lbrPrc:data.lbrPrc
                    ,lbrHm:data.lbrHm
                    ,dstbHm:null
                    ,dcAmt:null
                    ,expcLbrAmt:null
                    ,payCmpNm:null
                    ,remark:null
                    ,lineNo:null
                }
                $("#targetLbrGrid").data("kendoExtGrid").dataSource.add(lbrVO);
            }
        }
    }
}
//item search popup Func
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   //itemInfo
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        setPartsItemsAndLbrItems(data,[{}]);
                    }
                }
            }
        }
    });
}
function selectCellPartsMasterPopupWindow(){
    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   // itemInfo
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"autoClose":true
                ,"itemCd":$("#sItemCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        var bCheck = false;
                        var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                        var dataItemList = grid.dataSource._data;

                        for(var i = 0;i < dataItemList.length ;i++){
                            if(dataItemList[i].itemCd !== "" && dataItemList[i].itemCd == data[0].itemCd){
                                bCheck = true;
                                break;
                            }
                        }

                        if(!bCheck){
                            var rows = grid.tbody.find("tr");

                            rows.each(function(index, row) {

                                if(index == 0){

                                    var dataItem = grid.dataItem(row);
                                    dataItem.itemCd = data[0].itemCd;
                                    if(dataItem.dbItemCd == ""){
                                        dataItem.dbItemCd = data[0].itemCd;
                                    }
                                    dataItem.dirty = true;

                                    dataItem.itemNm = data[0].itemNm;
                                    dataItem.unitCd = data[0].stockUnitCd;
                                    dataItem.giStrgeCd = data[0].giStrgeCd;
                                    dataItem.grStrgeCd = data[0].grStrgeCd;

                                    if(data[0].reqStrgeCd === null){
                                        dataItem.reqStrgeCd = "-";
                                    }else{
                                        dataItem.reqStrgeCd = data[0].reqStrgeCd;
                                    }
                                    dataItem.avlbStockQty = 0;
                                    dataItem.resvStockQty = 0;
                                    dataItem.clamStockQty = 0;
                                    dataItem.grScheQty = 0;
                                    dataItem.giScheQty = 0;

                                    //selectStockInOutByKey get data
                                    /* $.ajax({
                                        url:"<c:url value='/par/stm/stockInOut/selectStockInOutByKey.do' />"
                                        ,data:JSON.stringify({sStrgeCd:data[0].giStrgeCd, sItemCd:data[0].itemCd})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,async:false
                                        ,error:function(jqXHR,status,error){

                                        }
                                        ,success:function(jqXHR, textStatus){
                                            dataItem[index].avlbStockQty = jqXHR.avlbStockQty;
                                            dataItem[index].resvStockQty = jqXHR.resvStockQty;
                                            dataItem[index].clamStockQty = jqXHR.clamStockQty;
                                            dataItem[index].grScheQty = jqXHR.grScheQty;
                                            dataItem[index].giScheQty = jqXHR.giScheQty;
                                        }
                                    }); */

                                    dataItem.dirty = true;
                                }
                            });

                            grid.refresh();

                        }else{
                            // message
                            dms.notification.info("<spring:message code='global.info.already' />");
                        }
                    }
                }
            }
        }
    });
}
/**
* hyperlink in grid event
*/
$(document).on("click", ".linkRoNo", function(e){
     var thisName = $(this).data("name");
     var grid = $("#targetReqHeaderGrid").data("kendoExtGrid"),
     row = $(e.target).closest("tr");
     // k-state-selected remove all
     grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");
     var dataItem = grid.dataItem(row);
     selectTargetReqHeaderChanged(dataItem);
     // Ro detail tab window open
     window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd, "VIEW-D-10337"); // RO Main
 });

    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            enable:true
            ,click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnPakage
        $("#btnPakage").kendoButton({
            enable:false
            ,click:function(e){
                //selectWorkPackagePopupWindow Func call
                selectWorkPackagePopupWindow();
            }
        });
        // btnOrderReq
        $("#btnOrderReq").kendoButton({
            enable:false
            ,click:function(e){
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        //btnCopyFromExcel
        $("#btnCopyFromExcel").kendoButton({
            enable:false
            ,click:function(e){
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        // btnResvReq
        $("#btnResvReq").kendoButton({
            enable:false
            ,click:function(e){
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        // btnAvlbReq.
        $("#btnAvlbReq").kendoButton({
            enable:false
            ,click:function(e){
                // TODO:[InBoShim] is not Func
                // Avlb Req
                //updateIssuePartsAvlbes();
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        // btnAdd
        $("#btnAdd").kendoButton({
            enable:false
            ,click:function(e){
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        // btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        // sResvTp dropdownlist
        $("#sResvTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[{cmmCd:"SR", cmmCdNm:"预约"},{cmmCd:"SR", cmmCdNm:"预留"},{cmmCd:"SR", cmmCdNm:"等待"},{cmmCd:"04", cmmCdNm:"领料"}]
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sSaTp dropdownlist
        $("#sSaTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[{cmmCd:"01", cmmCdNm:"服务顾问"}]
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // resvStartDt datepicker
        $("#sResvStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // resvEndDt datepicker
        $("#sResvEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysEndDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //targetResvHederGrid.
        $("#targetResvHeaderGrid").kendoExtGrid({
            gridId:"G-PAR-0808-154101"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            //params["sort"] = options.sort;

                            params["sParGiTp"] = $("#sResvTp").val();                  //sResvTp
                            var sParResvDocNo = $("#sParResvDocNo").val() == "" ? "X" :$("#sParResvDocNo").val();
                            params["sParReqDocNo"] = sParResvDocNo;        //sParResvDocNo.
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();        //sParReqStatCd.
                            params["sReqStartDt"] = $("#sResvStartDt").data("kendoExtMaskedDatePicker").value();     //sReqStartDt
                            params["sReqEndDt"] = $("#sResvEndDt").data("kendoExtMaskedDatePicker").value();         //sReqEndDt
                            params["sCustCd"] = $("#sCustCd").val();                    //sCustCd.
                            params["sCustNm"] = $("#sCustNm").val();                    //sCustNm.
                            params["sSerPrsnId"] = $("#sSerPrsnId").val();              //sSerPrsnId.
                            params["sCarNo"] = $("#sCarNo").val();                      //sCarNo.

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,pltCd:{ type:"string" }
                            ,itemCd:{ type:"string" , validation:{required:true} }
                            ,itemNm:{ type:"string" , validation:{required:true} }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,sortable:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectTargetReqHeaderChanged(selectedItem);
                }
            }
            ,dataBound:function(e) {
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
                $("#targetPartsReserveGrid").data("kendoExtGrid").dataSource.read();
            }
            ,height:173
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.resvTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR"://SR
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO"://RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "SA"://SA(Parts Sale)
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"regDt", title:"<spring:message code='par.lbl.resvDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{ field:"resvDocNo", title:"<spring:message code='par.lbl.partsResvDocNo'/>", width:130
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoNo'>"+dataItem.resvDocNo+"</a>";
                        return spanObj;
                    }
                } //roDocNo
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.saId'/>", width:100 }//serPrsnId
                ,{ field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:100 }//custNm
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
            ]
        });
        // targetReqDetailGrid.
        $("#targetReqDetailGrid").kendoExtGrid({
            gridId:"G-PAR-0808-154102"
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
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
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
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                if (e.model.parReqStatCd == "02") {
                    if(fieldName=="itemCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }
            }
            ,height:150
            ,pageable:false
            ,sortable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>"
                    ,width:150
                    ,editor:function(container, options){
                        $('<div class="form_search" style="width:100%"><input required data-bind="value:' + options.field + '" class="form_input" readonly style="width:100%"  /><a href="#" onclick="javascript:selectCellPartsMasterPopupWindow(this);"></a></div>').appendTo(container);
                    }
                }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>",format:"{0:n2}", attributes:{"class":"ar"}, width:80 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", attributes:{"class":"ar"}, width:90
                    ,format:"{0:n2}"
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n2"
                            ,decimals:2
                            ,spinners:false
                        });
                    }
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>",format:"{0:n2}", attributes:{"class":"ar"}, width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.resvDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"receiveId", title:"<spring:message code='par.lbl.reserveCustNm' />", width:80 }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", attributes:{"class":"ar"}, width:120
                    ,editor:function(container, options){
                        var input = $('<input id="strgeCd" name="strgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCd !== "" && giStrgeCd !== null){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", attributes:{"class":"ar"}, width:120
                    ,editor:function(container, options){
                        //location Array
                        var locCdList = [{"locCd":"", "locNm":""}];
                        <c:forEach var="obj" items="${locCdList}">
                        if(options.model.giStrgeCd === "${obj.strgeCd}" && options.model.itemCd === "${obj.itemCd}"){
                            locCdList.push({
                                "locCd":"${obj.locCd}"
                                ,"locNm":"${obj.locNm}"
                            });
                        }
                        </c:forEach>

                        var input = $('<input id="locCd" name="locCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"locNm"
                            ,dataValueField:"locCd"
                            ,valuePrimitive:true
                            ,dataSource:locCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giLocCd !== "" && giLocCd !== null){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.statNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }

            ]
        });
        //targetPartsReserveGrid
        $("#targetPartsReserveGrid").kendoExtGrid({
            gridId:"G-PAR-0808-154103"
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
                            ,resvDt:{ type:"date" , validation:{required:true}, editable:false }
                            ,resvStatus:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,custNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,carNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,techNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,readyQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,borrowStatus:{ type:"string" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,height:150
            ,editable:false
            ,pageable:false
            ,sortable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:110 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:120 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", width:50, attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", width:50, attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"readyQty", title:"<spring:message code='par.lbl.readyQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", width:50 , attributes:{"class":"ar"}}

            ]
        });
    });
</script>
<!-- //script -->

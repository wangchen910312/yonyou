<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 내부수령 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.otherGiInfo" /> --%><!-- otherGiInfo --></h1>
            <div class="btn_right">
                <button type="button" id="btnInvCancel" class="btn_m"><spring:message code="par.btn.invReturn" /><!-- btnInvCancel --></button>
                <button type="button" id="btnPrint" class="btn_m btn_print"><spring:message code="par.btn.print" /></button><!--btnSearch  -->
                <button type="button" id="btnInvReq" class="btn_m"><spring:message code="par.btn.invConfirm" /><!-- btnInvReq --></button>
                <button type="button" id="btnInvReqSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- btnInvReqSave --></button>
                <button type="button" id="btnInit" class="btn_m btn_init" ><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button type="button" id="btnSearch" class="btn_m btn_search" ><spring:message code="par.btn.search" /></button><!--btnSearch  -->
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
                    <th scope="row"><spring:message code="par.lbl.otherGiTp" /><!-- otherGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.receiveId" /><!-- receiveId --></th>
                    <td>
                        <div class="form_search">
                            <input id="sReceiveId" name="sReceiveId" class="form_input" />
                            <input type="hidden" id="custCd" name="custCd" value="${custCd}" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.receiveNm" /><!-- receiveNm --></th>
                    <td>
                        <input id="sReceiveNm" name="sReceiveNm" class="form_input form_disabled" />
                        <input type="hidden" id="custNm" name="custNm" value="${custNm}" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- giDocNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sParReqDocNo" name="sParReqDocNo" class="form_input form_disabled" />
                            <input type="hidden" id="parReqStatCd" name="parReqStatCd" />
                                <a href="javascript:;" onclick="javascript:selectIssueInnerWorkPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.parInnerTp" /><!-- sEtcGiTp --></th>
                    <td>
                        <input id="sEtcGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd--></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" name="sItemCd" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectPartsMasterSearchPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDt" /><!-- giDt --></th>
                    <td colspan="2">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemInnerOutTotQty" /><!-- itemInnerOutTotQty --></th>
                    <td>
                        <input id="sTotQty" name="TotQty" class="form_comboBox form_disabled ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemInnerOutTotAmt" /><!-- itemInnerOutTotAmt --></th>
                    <td>
                        <input id="sTotAmt" name="sTotAmt" class="form_comboBox form_disabled ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.remark" /></th>
                    <td colspan="3">
                        <input id="sRemark" name="sRemark" class="form_input" style="width:100%" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <button id="btnCopyFromExcel" class="btn_s"><spring:message code="par.btn.copyFromExcel" /><!-- btnCopyFromExcel --></button>
                <button id="btnPartsAdd" class="btn_s"><spring:message code="par.btn.addItem" /><!-- btnPartsAdd --></button>
                <button class="btn_s btn_add" id="btnAdd" type="button"><spring:message code="par.btn.rowAdd" /></button><!--rowAdd  -->
                <button class="btn_s btn_del" id="btnDel" type="button"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
            </div>
        </div>
        <div class="table_grid">
            <!-- targetReqDetailGrid -->
            <div id="targetReqDetailGrid" ></div>
            <!-- targetReqDetailGrid -->
        </div>
    </section>
</section>
<!-- //내부수령 -->

<!-- script -->
<script>
//parGiTp
var gVatCd = Number("${vatCd}");

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    gVatCd = .16;
}
console.log('gVatCd:',gVatCd);

var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//parInnerTp
var parInnerTpList = [];
<c:forEach var="obj" items="${parInnerTpList}">
parInnerTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var parInnerTpMap = [];
$.each(parInnerTpList, function(idx, obj){
    parInnerTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
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
var giStrgeCdMap = [];
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
var locCdMap = [];
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}
//issueInnerWork Popup Func
var searchIssueInnerPopupWin;
function selectIssueInnerWorkPopupWindow(){
    searchIssueInnerPopupWin = dms.window.popup({
        windowId:"searchIssueInnerPopupWin"
        ,title:"<spring:message code = 'par.title.otherGiInfo'/>"   // parReqDocNo select
        ,content:{
            url:"<c:url value='/par/cmm/selectIssueInnerWorkPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"parReqDocNo":$("#sParReqDocNo").val()
                ,"selectable":"row"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sParReqDocNo").val(data[0].parReqDocNo);
                        searchIssueInnerPopupWin.close();
                    }
                }
            }
        }
    });
}


//item search popup Func
var searchItemPopupWindow;
function selectPartsMasterSearchPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   //itemInfo
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sItemCd").val(data[0].itemCd);
                    }
                }
            }
        }
    });
}
//item search popup Func
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
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        setPartsItemsAndLbrItems(data,[{}]);
                    }
                }
            }
        }
    });
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
                        var rows = grid.select();
                        $.each(rows, function(idx, row){
                            var item = grid.dataItem(row);
                            item.returnId = data.returnNm;
                            item.giDocStatCd = "03";
                            item.giStatCd = "03";
                            dateItems.push(item);
                        });

                        var issuePartsOutVO = {
                            dlrCd:""
                            ,giDocNo:dateItems[0].giDocNo
                            ,giDocTp:"03"
                            ,giDocStatCd:"03"
                            ,cancYn:"N"
                            ,parReqDocNo:dateItems[0].parReqDocNo
                            ,roDocNo:dateItems[0].roDocNo
                            ,pltCd:""
                            ,serPrsnId:null
                            ,custCd:$("#custCd").val()
                            ,custNm:$("#custNm").val()
                            ,vinNo:null
                            ,carNo:null
                            ,mvtDocYyMm:""
                            ,mvtDocNo:""
                            ,regUsrId:null
                            ,regDt:null
                            ,updtUsrId:null
                            ,updtDt:null
                        }

                        console.log("issuePartsOutVO:",issuePartsOutVO);

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
                                //parts Out Return complete message.
                                dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                            }
                        });

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
        ,width:300
        ,height:90
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
                            item.etcGiTp = $("#sEtcGiTp").val();
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
                            ,serPrsnId:null
                            ,custCd:$("#custCd").val()
                            ,custNm:$("#custNm").val()
                            ,vinNo:null
                            ,carNo:null
                            ,mvtDocYyMm:""
                            ,mvtDocNo:""
                            ,regUsrId:null
                            ,regDt:null
                            ,updtUsrId:null
                            ,updtDt:null
                        }

                        var issueReqSaveVO = { "issuePartsOutVO":issuePartsOutVO, "issueReqDetailVO":dateItems };
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
                "parReqDocNo":$("#sParReqDocNo").val()
                ,"carNo":null
                ,"custCd":$("#sReceiveId").val()
                ,"custNm":$("#sReceiveNm").val()
                ,"callbackFunc":function(data){
                }
            }
        }
    });
}

//page init Func
function pageInit(){
    $("#sParGiTp").data("kendoExtDropDownList").select(0);
    $("#sEtcGiTp").data("kendoExtDropDownList").select(0);
    $("#sParReqDocNo").val("");
    $("#sReqStartDt").data("kendoExtMaskedDatePicker").value(new Date("${sysStartDate}"));
    $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(new Date("${sysEndDate}"));
    $("#sReceiveId").val("");
    $("#sReceiveNm").val("");

    $("#parGiTp").val("");
    $("#parReqDocNo").val("");
    $("#roDocNo").val("");
    $("#resvDocNo").val("");
    $("#parReqStatCd").val("");
    $("#parReqStatNm").val("");
    $("#reqStartDt").val("");

    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.data([]);

    //button disable
    buttonEnableDisable(false, "00", "00", $("#sEtcGiTp").val());
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag, parReqStatCd, parGiTp, etcGiTp){
    //page button list
    $("#btnInvReq").data("kendoButton").enable(false);
    $("#btnPrint").data("kendoButton").enable(false);
    $("#btnInvReqSave").data("kendoButton").enable(false);

    //parts button list
    $("#btnCopyFromExcel").data("kendoButton").enable(false);
    $("#btnPartsAdd").data("kendoButton").enable(false);
    $("#btnInvCancel").data("kendoButton").enable(false);
    $("#btnAdd").data("kendoButton").enable(false);
    $("#btnDel").data("kendoButton").enable(false);

    if(parReqStatCd === "01"){
        $("#btnInvReq").data("kendoButton").enable(true);
        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnInvReqSave").data("kendoButton").enable(true);

        $("#btnCopyFromExcel").data("kendoButton").enable(true);
        $("#btnPartsAdd").data("kendoButton").enable(true);

        if(parGiTp == "SR" || parGiTp == "RO" || parGiTp == "IN"){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
        }
        if(bFlag){
        }
        else{
            $("#btnCopyFromExcel").data("kendoButton").enable(true);
            $("#btnPartsAdd").data("kendoButton").enable(true);
            $("#btnInvCancel").data("kendoButton").enable(true);
        }
    }else if(parReqStatCd === "02"){
        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnInvCancel").data("kendoButton").enable(true);
    }else{

        if(etcGiTp === "02"){
            $("#btnInvReqSave").data("kendoButton").enable(true);
            $("#btnCopyFromExcel").data("kendoButton").enable(true);
            $("#btnPartsAdd").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
        }else{
            //parts button list
            $("#btnInvReq").data("kendoButton").enable(true);
            $("#btnInvReqSave").data("kendoButton").enable(true);
            $("#btnCopyFromExcel").data("kendoButton").enable(true);
            $("#btnPartsAdd").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
        }
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
    var issueReqRoDocNoCheckCnt = 0;
    //checked list
    $.each(rows, function(idx, row){
        var item = row;

        if(item.itemCd === ""){
            issueReqItemCheckCnt++;
        }
        if(item.roDocNo === ""){
            issueReqRoDocNoCheckCnt++;
        }
        dateItems.push(item);
    });

    if(issueReqItemCheckCnt > 0){
        // itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    console.log("roDocNo Cnt:"+issueReqRoDocNoCheckCnt);
    if(issueReqRoDocNoCheckCnt > 0){
        // roDocNo check message.
        dms.notification.info("<spring:message code='par.lbl.roDocNo' var='roDocNo' /><spring:message code='par.info.issueCheckMsg' arguments='${roDocNo}' />");
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
            ,"parReqDocNo":$("#sParReqDocNo").val()
            ,"parGiTp":$("#sParGiTp").val()
            ,"parReqStatCd":"01"
            ,"cancYn":"N"
            ,"roDocNo":multiIssueReqDetails.updateList[0].roDocNo
            ,"resvDocNo":null
            ,"pltCd":null
            ,"serPrsnId":null
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":null
            ,"carNo":null
            ,"carlineCd":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":"01"
            ,"giStatCd":$("#sEtcGiTp").val()
        }
        ,"issueReqDetailVO":multiIssueReqDetails
        ,"repairOrderLaborVO":[{}]
    }

    //console.log("save data:"+kendo.stringify(issueReqDetailSaveVO));
    console.log("save data:",issueReqDetailSaveVO);

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/multiIssueReqInnerDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            // destroy data clear and data reload

            var issueReqVO = jqXHR.issueReqVO;
            $("#sParReqDocNo").val(issueReqVO.parReqDocNo);

            grid.dataSource._destroyed = [];
            grid.dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}
//updateIssueInvReturn(InvCancel) Func
function updateIssueInvReturn(){

    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    console.log("rowCnt:"+rowCnt);

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    var issueReqItemCheckCnt = 0;
    var issueReturnCheckCnt = 0;
    var issueReturnCheckZeroCnt = 0;
    var issueReqDbYnCnt = 0;

    //checked list.
    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);
        console.log("item:",item);
        if(item.returnPartsQty > item.resvQty){
            issueReturnCheckCnt++;
        }
        if(item.returnPartsQty <= 0){
            issueReturnCheckZeroCnt++;
        }
        if(item.itemCd == ""){
            issueReqItemCheckCnt++;
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

    if(issueReqDbYnCnt > 0){
        //is Save Run message
        dms.notification.info("<spring:message code='global.info.isSaveRun' />");
        return false;
    }

    if(issueReturnCheckZeroCnt > 0){
        //return parts count zero message
        dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.info.itemReqZeroCntMsg' arguments='${returnPartsQty},0' />");
        return false;
    }

    if(issueReturnCheckCnt > 0){
        //returnQty check message.
        dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnPartsQty},${giQty}' />");
        return false;
    }else{
        //return Popup show.
        selectIssueReturnPopupButtonWindow(grid);
    }
}
// reqHeaderChanged
function selectTargetReqHeaderChanged(selectedItem){
    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);//parGiTp
    if(selectedItem.parGiTp == "SR") //giTp Resv(SR)
        buttonEnableDisable(true, selectedItem.parReqStatCd, selectedItem.parGiTp, $("#sEtcGiTp").val());
    else
        buttonEnableDisable(false, selectedItem.parReqStatCd, selectedItem.parGiTp, $("#sEtcGiTp").val());
    $("#parReqDocNo").val(selectedItem.parReqDocNo);    //parReqDocNo
    $("#roDocNo").val(selectedItem.roDocNo);            //roDocNo
    $("#parGiTp").val(selectedItem.parGiTp);            //parGiTp
    $("#resvDocNo").val(selectedItem.resvDocNo);        //resvDocNo
    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));     // regDt
    $("#custCd").val(selectedItem.custCd);              //custCd
    $("#custNm").val(selectedItem.custNm);              //custNm
    //tergetReqDetailGrid
    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
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

            //selectIssuePartsOutDetailInfoByKey get data
            $.ajax({
                url:"<c:url value='/par/ism/issueReq/selectIssuePartsOutDetailInfoByKey.do' />"
                ,data:JSON.stringify({sItemCd:data.itemCd})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,error:function(jqXHR,status,error){

                }
                ,success:function(jqXHR, textStatus){

                    var IssueReqDetailVO = {
                        "rnum":sRnum
                        ,"dlrCd":null
                        ,"pltCd":null
                        ,"parReqDocNo":$("#sParReqDocNo").val()
                        ,"parReqDocLineNo":sRnum
                        ,"parReqStatCd":"01"
                        ,"purcReqNo":"01"
                        ,"reqStrgeCd":""
                        ,"cancYn":"N"
                        ,"parGiTp":$("#sParGiTp").val()
                        ,"roDocNo":""
                        ,"roLineNo":sRnum
                        ,"resvDocNo":""
                        ,"resvDocLineNo":sRnum
                        ,"grStrgeCd":jqXHR.giStrgeCd
                        ,"giStrgeCd":jqXHR.giStrgeCd
                        ,"giLocCd":jqXHR.giLocCd
                        ,"dbItemCd":data.itemCd
                        ,"pkgItemCd":data.pkgItemCd
                        ,"itemCd":data.itemCd
                        ,"itemNm":data.itemNm
                        ,"unitCd":data.stockUnitCd
                        ,"reqQty":1
                        ,"endQty":0
                        ,"avlbStockQty":jqXHR.avlbStockQty
                        ,"resvStockQty":jqXHR.resvStockQty
                        ,"clamStockQty":jqXHR.clamStockQty
                        ,"grScheQty":jqXHR.grScheQty
                        ,"giScheQty":jqXHR.giScheQty
                        ,"resvQty":1
                        ,"purcReqDt":null
                        ,"giDocNo":null
                        ,"giDocTp":null
                        ,"giDocStatCd":null
                        ,"giStatCd":$("#sEtcGiTp").val()
                        ,"dbYn":"N"
                        ,"itemPrc":jqXHR.itemPrc
                        ,"itemAmt":jqXHR.itemAmt
                        ,"taxDdctAmt":jqXHR.itemPrc + (jqXHR.itemPrc * gVatCd)
                        ,"taxAmt":jqXHR.itemPrc * gVatCd
                        ,"receiveDt":null
                        ,"receiveId":null
                        ,"returnPartsQty":null
                        ,"returnDt":null
                        ,"returnId":null
                    }
                    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
                }
            });
        }
    }
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
                                //var dataItem = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource._data;

                                console.log("index:"+index);

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

                                    //selectIssuePartsOutDetailInfoByKey get data
                                    $.ajax({
                                        url:"<c:url value='/par/ism/issueReq/selectIssuePartsOutDetailInfoByKey.do' />"
                                        ,data:JSON.stringify({sItemCd:data[0].itemCd})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,async:false
                                        ,error:function(jqXHR,status,error){

                                        }
                                        ,success:function(jqXHR, textStatus){
                                            dataItem.giStrgeCd = jqXHR.giStrgeCd;
                                            dataItem.giLocCd = jqXHR.giLocCd;
                                            dataItem.itemPrc = jqXHR.itemPrc;
                                            dataItem.itemAmt = jqXHR.itemAmt;
                                            dataItem.taxDdctAmt = jqXHR.itemPrc + (jqXHR.itemPrc * gVatCd);
                                            dataItem.taxAmt = jqXHR.itemPrc * gVatCd;
                                            dataItem.avlbStockQty = jqXHR.avlbStockQty;
                                            dataItem.resvStockQty = jqXHR.resvStockQty;
                                            dataItem.clamStockQty = jqXHR.clamStockQty;
                                            dataItem.grScheQty = jqXHR.grScheQty;
                                            dataItem.giScheQty = jqXHR.giScheQty;
                                        }
                                    });

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
     var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
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
     window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd, "VIEW-I-10319"); // RO Main
 });

    $(document).ready(function() {
        //btnInvReq
        $("#btnInvReq").kendoButton({
            click:function(e){
                //updateIssuePartsInves Func call
                updateIssuePartsInves();
            }
        });
        //btnInvReqSave
        $("#btnInvReqSave").kendoButton({
            click:function(e){
                //updateIssuePartsSaves Func call
                updateIssuePartsSaves();
            }
        });
        // btnInvCancel
        $("#btnInvCancel").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueInvReturn(InvCancel) Func call
                updateIssueInvReturn();
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){
                //selectIssueReceivePrintPopupButtonWindow Func call
                selectIssueReceivePrintPopupButtonWindow();
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            enable:true
            ,click:function(e){
                //pageInit Func call
                pageInit();
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                // reqEndDt value not empty
                if($("#sReqEndDt").val() != ""){
                    // reqEndDt value empty
                    if($("#sReqStartDt").val() == ""){
                        // sReqStartDt value check message
                        dms.notification.info("<spring:message code='par.lbl.regStartDt' var='regStartDt' /><spring:message code='global.info.emptyCheckParam' arguments='${regStartDt}' />");
                        return false;
                    }
                }

                if($("#sParReqDocNo").val() !== ""){
                  //selectIssueReqByKey get data
                    $.ajax({
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqByKey.do' />"
                        ,data:JSON.stringify({sParReqDocNo:$("#sParReqDocNo").val(),sParGiTp:$("#sParGiTp").val()})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,error:function(jqXHR,status,error){

                        }
                        ,success:function(jqXHR, textStatus){
                            $("#parReqStatCd").val(jqXHR.parReqStatCd);
                            $("#custCd").val(jqXHR.custCd);
                            $("#custNm").val(jqXHR.custNm);
                            buttonEnableDisable(false, jqXHR.parReqStatCd, jqXHR.parGiTp, $("#sEtcGiTp").val());
                            //targetReqDetailGrid read.
                            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });
                }
            }
        });
        //btnCopyFromExcel
        $("#btnCopyFromExcel").kendoButton({
            click:function(e){
                //excel file copy
                var data = dms.string.parseClipboardDataToExcelFormat();
                if(data === undefined || data.length === 0) {
                    //excel copy data empty message.
                    dms.notification.info("<spring:message code='par.lbl.excelCopyData' var='excelCopyData' /><spring:message code='par.info.itemInsertNotMsg' arguments='${excelCopyData}' />");
                    return false;
                }

                for(var i=0; i<data.length; i++){
                    var cells = data[i];

                    var itemCheckCnt = 0;
                    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                    grid.tbody.find('>tr').each(function(){
                        var dataItem = grid.dataItem(this);
                        if(dataItem.itemCd === cells[0]){
                            itemCheckCnt++;
                        }
                    });

                    if(itemCheckCnt === 0){
                        var total = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.total()+1;

                        //selectIssuePartsOutDetailInfoByKey get data
                        $.ajax({
                            url:"<c:url value='/par/ism/issueReq/selectIssuePartsOutDetailInfoByKey.do' />"
                            ,data:JSON.stringify({sItemCd:cells[0]})
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,error:function(jqXHR,status,error){

                            }
                            ,success:function(jqXHR, textStatus){

                                var IssueReqDetailVO = {
                                    "rnum":total
                                    ,"dlrCd":null
                                    ,"pltCd":null
                                    ,"parReqDocNo":$("#sParReqDocNo").val()
                                    ,"parReqDocLineNo":total
                                    ,"parReqStatCd":"01"
                                    ,"purcReqNo":"01"
                                    ,"reqStrgeCd":""
                                    ,"cancYn":"N"
                                    ,"parGiTp":$("#sParGiTp").val()
                                    ,"roDocNo":""
                                    ,"roLineNo":total
                                    ,"resvDocNo":""
                                    ,"resvDocLineNo":total
                                    ,"grStrgeCd":jqXHR.giStrgeCd
                                    ,"giStrgeCd":jqXHR.giStrgeCd
                                    ,"giLocCd":jqXHR.giLocCd
                                    ,"dbItemCd":cells[0]
                                    ,"pkgItemCd":data.pkgItemCd
                                    ,"itemCd":cells[0]
                                    ,"itemNm":jqXHR.itemNm
                                    ,"unitCd":data.stockUnitCd === "" ? "EA":data.stockUnitCd
                                    ,"reqQty":cells[1]
                                    ,"endQty":0
                                    ,"avlbStockQty":jqXHR.avlbStockQty
                                    ,"resvStockQty":jqXHR.resvStockQty
                                    ,"clamStockQty":jqXHR.clamStockQty
                                    ,"grScheQty":jqXHR.grScheQty
                                    ,"giScheQty":jqXHR.giScheQty
                                    ,"resvQty":cells[1]
                                    ,"purcReqDt":null
                                    ,"giDocNo":null
                                    ,"giDocTp":null
                                    ,"giDocStatCd":null
                                    ,"giStatCd":$("#sEtcGiTp").val()
                                    ,"dbYn":"N"
                                    ,"itemPrc":jqXHR.itemPrc
                                    ,"itemAmt":jqXHR.itemAmt
                                    ,"taxDdctAmt":jqXHR.itemPrc + (jqXHR.itemPrc * gVatCd)
                                    ,"taxAmt":jqXHR.itemPrc * gVatCd
                                    ,"receiveDt":null
                                    ,"receiveId":null
                                    ,"returnPartsQty":null
                                    ,"returnDt":null
                                    ,"returnId":null
                                }
                                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
                            }
                        });
                    }
                }

            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            click:function(e){
                // TODO:[InBoShim] sub parts popup not linked
                // ready message
                //dms.notification.info("<spring:message code='global.info.ready' />");
                selectPartsMasterPopupWindow();
            }
        });
        // btnAdd
        $("#btnAdd").kendoButton({
            click:function(e){
                var sRnum = 1;
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                grid.tbody.find('>tr').each(function(){
                    var dataItem = grid.dataItem(this);
                    var vRoLineNoFr = dataItem.roLineNo;

                    if(sRnum < vRoLineNoFr){
                        sRnum = vRoLineNoFr;
                    }
                    sRnum = sRnum + 1;
                });

                var IssueReqDetailVO = {
                    "rnum":sRnum
                    ,"dlrCd":null
                    ,"pltCd":null
                    ,"parReqDocNo":$("#sParReqDocNo").val()
                    ,"parReqDocLineNo":sRnum
                    ,"parReqStatCd":"01"
                    ,"purcReqNo":"01"
                    ,"reqStrgeCd":""
                    ,"cancYn":"N"
                    ,"parGiTp":$("#sParGiTp").val()
                    ,"roDocNo":""
                    ,"roLineNo":sRnum
                    ,"resvDocNo":""
                    ,"resvDocLineNo":sRnum
                    ,"grStrgeCd":""
                    ,"giStrgeCd":""
                    ,"giLocCd":""
                    ,"dbItemCd":""
                    ,"pkgItemCd":""
                    ,"itemCd":""
                    ,"itemNm":""
                    ,"unitCd":""
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
                    ,"itemPrc":null
                    ,"itemAmt":null
                    ,"taxDdctAmt":null
                    ,"taxAmt":null
                    ,"receiveDt":null
                    ,"receiveId":null
                    ,"returnPartsQty":null
                    ,"returnDt":null
                    ,"returnId":null
                }
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.insert(0, IssueReqDetailVO);
            }
        });
        // btnDel
        $("#btnDel").kendoButton({
            click:function(e){
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                var rows = grid.select();
                var rowCnt = rows.length;

                if(rowCnt > 0){
                    rows.each(function(index, row) {
                        grid.removeRow(row);
                    });

                    // rnum, parDocLineNo, roLineNo update
                    var dataItemList = grid.dataSource._data;
                    var j= 0;
                    for(var i = 0; i < dataItemList.length; i++){
                        dataItemList[i].rnum = i+1;
                        dataItemList[i].parReqDocLineNo = i+1;
                        dataItemList[i].roLineNo = i+1;
                        dataItemList[i].dirty = true;
                    }
                    grid.refresh();
                }
                else{
                    // delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                }
            }
        });
        //sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,autoBind:true
            ,index:0
        });
        //sParInnerTp dropdownlist
        $("#sEtcGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parInnerTpList
            ,autoBind:true
            ,index:0
            ,change:function(){
                if(this.value() === "01"){//소분류 내부수령일때만
                    $("#btnInvReq").data("kendoButton").enable(true);
                }
                else{
                    $("#btnInvReq").data("kendoButton").enable(false);
                }
            }
        });
        // reqStartDt datepicker
        $("#sReqStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // reqEndDt datepicker
        $("#sReqEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysEndDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sTotQty
        $("#sTotQty").kendoExtNumericTextBox({
            enable:false
            ,format:"n0"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        $("#sTotQty").data("kendoExtNumericTextBox").readonly();
        //sTotAmt
        $("#sTotAmt").kendoExtNumericTextBox({
            enable:false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        $("#sTotAmt").data("kendoExtNumericTextBox").readonly();
        // targetReqDetailGrid.
        $("#targetReqDetailGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#sParReqDocNo").val() == "" ? "X":$("#sParReqDocNo").val();
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
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:true }
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
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:true }
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
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:true }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                if (e.model.parReqStatCd == "02") {
                    if(fieldName=="itemCd" || fieldName=="reqQty" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt"){
                        this.closeCell();
                    }
                }
            }
            ,height:403
            ,pageable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
                var itemQty = 0;
                var itemAmt = 0;
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        // parReqStatCd 02 checkbox remove
                        if(dataItem.parReqStatCd !== "01"){
                            var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                            multiCheckBox.remove();
                        }

                        itemQty += dataItem.reqQty;
                        itemAmt += dataItem.itemAmt;
                    }
                });

                $("#sTotQty").data("kendoExtNumericTextBox").value(itemQty);
                $("#sTotAmt").data("kendoExtNumericTextBox").value(itemAmt);
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"parReqDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:100 }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatCd'/>"
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
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>"
                    ,width:120
                    ,editor:function(container, options){
                        $('<div class="form_search" style="width:100%"><input required data-bind="value:' + options.field + '" class="form_input" readonly style="width:100%"  /><a href="#" onclick="javascript:selectCellPartsMasterPopupWindow(this);"></a></div>').appendTo(container);
                    }
                }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.qty'/>", attributes:{"class":"ar"}, width:70
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                var vItemPrc = model.get("itemPrc");
                                var vItemAmt = this.value() * vItemPrc;
                                model.set("itemAmt", vItemAmt);
                                model.set("taxDdctAmt", vItemAmt + (vItemAmt * gVatCd));
                                model.set("taxAmt", vItemAmt * gVatCd);
                                model.set("reqQty", this.value());
                            }
                        });
                    }
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"resvStockQty", title:"<spring:message code='par.lbl.resvQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"grScheQty", title:"<spring:message code='par.lbl.grScheQty'/>", attributes:{"class":"ar"}, width:90 }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", attributes:{"class":"ar"}, width:100
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
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", attributes:{"class":"ar"}, width:100
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
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.taxAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }
                ,{field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130
                    ,editor:function(container, options){
                        $('<input required data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength="16" /></div>').appendTo(container);
                    }
                } //roDocNo
                ,{field:"giCauNm", title:"<spring:message code='par.lbl.giCauNm'/>", width:130}//giCauNm
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"receiveId", title:"<spring:message code='par.lbl.receiveId' />", width:80 }
                ,{field:"returnPartsQty", title:"<spring:message code='par.lbl.returnPartsQty' />"
                    ,width:80
                    ,attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"
                            ,spinners:false
                        });
                    }
                }
                ,{field:"returnDt", title:"<spring:message code='par.lbl.returnDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"returnDt", title:"<spring:message code='par.lbl.returnTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"returnId", title:"<spring:message code='par.lbl.returnId' />", width:80 }
            ]
        });
    });
</script>
<!-- //script -->

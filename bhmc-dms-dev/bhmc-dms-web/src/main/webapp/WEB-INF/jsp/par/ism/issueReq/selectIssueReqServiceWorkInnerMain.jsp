<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">

<!-- 내부수령 -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.otherGiInfo" /></h1> --%>
        <div class="btn_left">
            <button type="button" id="btnInit" class="btn_m btn_init" ><spring:message code="par.btn.init" /></button><!--btnInit  -->
        </div>
        <div class="btn_right">
            <button type="button" id="btnInvReqSave" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.save" /></button>
            <button type="button" id="btnInvReq" class="btn_m btn_m_min"><spring:message code="par.btn.innerReceive" /></button>
            <button type="button" id="btnInvCancel" class="btn_m btn_m_min"><spring:message code="par.btn.innerReturn" /></button>
            <button type="button" id="btnPrint" class="btn_m btn_m_min btn_print"><spring:message code="par.btn.print" /></button>
            <button type="button" id="btnSearch" class="btn_m btn_m_min btn_search hidden" ><spring:message code="par.btn.search" /></button>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.receiveNo" /><!-- receiveNo --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox hidden" />
                        <input id="sEtcGiTp" class="form_comboBox hidden" />
                        <div class="form_search">
                            <input id="sReceiveId" name="sReceiveId" class="form_input form_readonly" readonly="readonly" />
                            <input type="hidden" id="custCd" name="custCd" value="" />
                            <a href="javascript:;" onclick="javascript:selectCustSearchPopupWindow();"></a>
                        </div>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.receiveNm" /><!-- receiveNm --></th>
                    <td>
                        <div class="form_search">
                            <input id="sReceiveNm" name="sReceiveNm" class="form_input form_readonly" readonly="readonly" />
                            <input type="hidden" id="custNm" name="custNm" value="" />
                            <a href="javascript:;" onclick="javascript:selectCustSearchPopupWindow();"></a>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDt" /><!-- giDt --></th>
                    <td>
                        <input id="sReqEndDt" disabled="disabled" class="form_datepicker form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.issueReqInnerDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" maxlength="20" />
                            <input type="hidden" id="sParReqDocNoVal" name="sParReqDocNoVal" />
                            <input type="hidden" id="parReqStatCd" name="parReqStatCd" />
                            <input type="hidden" id="roDocNo" name="roDocNo" />
                            <a href="javascript:;" onclick="javascript:selectIssueInnerWorkPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.remark" /></th>
                    <td colspan="3">
                        <input id="sRemark" name="sRemark" class="form_input" maxlength="100"  />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemInnerOutTotQty" /><!-- itemInnerOutTotQty --></th>
                    <td>
                        <input id="sTotQty" name="TotQty" disabled="disabled" class="form_comboBox form_disabled ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemInnerOutTotAmt" /><!-- itemInnerOutTotAmt --></th>
                    <td>
                        <input id="sTotAmt" name="sTotAmt" disabled="disabled" class="form_comboBox form_disabled ar" />
                    </td>

                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="btnPartsAdd" class="btn_s btn_s_min5"><spring:message code="par.btn.rowAdd" /><!-- btnPartsAdd --></button>
                <button type="button" id="btnPartsReturnAdd" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.returnPartsAdd" /><!-- returnPartsAdd --></button>
                <button type="button" id="btnDel" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
            </div>
        </div>
        <div class="table_grid">
            <!-- targetReqDetailGrid -->
            <div id="targetReqDetailGrid" class="resizable_grid"></div>
            <!-- targetReqDetailGrid -->
        </div>
    </section>
</section>

<div class="hidden">
    <input type="hidden" id="sInsertUpdateFlag" name="sInsertUpdateFlag" value="INSERT" />
</div>

</div>

<!-- //내부수령 -->

<!-- script -->
<script>
//parGiTp
var parGiTpList = [],
    gVatCd = Number("${vatCd}");
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
   // gVatCd = .16;
    gVatCd = .13;
}
console.log('gVatCd:',gVatCd);

//parInnerTp
var parInnerTpList = [];
<c:forEach var="obj" items="${parInnerTpList}">
parInnerTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parInnerTpMap = {};
$.each(parInnerTpList, function(idx, obj){
    parInnerTpMap[obj.cmmCd] = obj.cmmCdNm;
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
    "locCd":"${obj.locId}"
    ,"locNm":"${obj.locId}"
});
</c:forEach>
var locCdMap = {};
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//tecCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
</c:forEach>
var tecCdMap = {};
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});
//brandCdList
var brandCdList = [];
var brandCdMap = {};
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
brandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//header grid selected row item.
var selectedRowHeaderItem = {};
//detail grid selected row item.
var selectedRowDetailItem = {};
//detail grid selected row return item.
var selectedRowDetailReturnItem = {};

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
        ,title:"<spring:message code = 'par.title.innerDocNoRequest' />"//출고문서신청
        ,width : 800
        ,height: 500
        ,content:{
            url:"<c:url value='/par/cmm/selectIssueInnerWorkPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"parReqDocNo":$("#sParReqDocNo").val()
                ,"selectable":"row"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sInsertUpdateFlag").val("UPDATE");
                        $("#sParReqDocNo").val(data[0].parReqDocNo);
                        $("#sParReqDocNoVal").val(data[0].parReqDocNo);
                        $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(data[0].updtDt);
                        $("#sRemark").val(data[0].remark);
                        searchIssueInnerPopupWin.close();
                        $("#btnSearch").click();
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
        ,width : 840
        ,height: 400
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
var selectShareStockGiItemPopupWindow;
function selectPartsMasterPopupWindow(){

    selectShareStockGiItemPopupWindow = dms.window.popup({
        windowId:"selectShareStockGiItemPopupWindow"
        ,width:900
        ,height:550
        ,title:"<spring:message code='par.title.partSearch' />"//부품조회
        ,content:{
            url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"prcTp": "01" //가격유형 : 일반
                ,"pageTp": ""//내부수령(부품 전체조회).
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    if(data.length > 0){

                        setItemGrpItemList(data, true);

                        setPartsItemsAndLbrItems(data,[{}],"I");

                        selectShareStockGiItemPopupWindow.close();
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
function selectIssueReturnPopupButtonWindow(gridObj, selectedItems, parReqStatCd, outItemList, endQtyItemTot){

    if(endQtyItemTot <= 0){
        //returnPartsQty count over check message
        dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.lbl.itemReturnCompleteMsg' />");

        return false;
    }else{
        issueReturnPopupButtonWindow = dms.window.popup({
            windowId:"issueReturnPopupButtonWindow"
                ,title:false
                ,width:300
                ,height:170
                ,modal:true
                ,content:{
                    url:"<c:url value='/par/ism/issueReq/selectIssueReturnCheckUserPopup.do'/>"
                ,data:{
                    "receiveId":selectedRowDetailItem.receiveId
                    ,"receiveNm":selectedRowDetailItem.receiveNm
                    ,"endQty":selectedRowDetailItem.endQty
                    ,"endQtyItemTot":endQtyItemTot
                    ,"endQtyTot":outItemList[selectedRowDetailItem.itemCd + selectedRowDetailItem.reqStrgeCd]
                    ,"callbackFunc":function(data){
                        //receive y or n
                        if(data.flag == "Y"){
                            /*반품부품정보*/
                            var dataItems = [ ];
                            /*반품부품담기*/
                            dataItems = selectedItems;
                            /*반품정보 데이타 적용*/
                            for (i = 0; i < dataItems.length; i++) {
                                var item  = dataItems[i];
                                item.receiveId = data.returnNm;//반품인.
                                item.returnId = data.returnNm;//반품인.
                                item.resvQty = data.returnPartsQty;//반품수량.
                                item.endQty = data.returnPartsQty;//반품수량.
                                item.returnPartsQty = data.returnPartsQty;//반품수량.
                                item.itemAmt = item.itemPrc * data.returnPartsQty;//부품금액.
                                item.movingAvgAmt = item.movingAvgPrc * data.returnPartsQty;//부품원가금액.
                                item.remark = data.remark;//비고
                                item.readyRegDt = null;
                            }
                            /*출고요청정보*/
                            var issuePartsOutVO = {
                                dlrCd:""
                                ,giDocNo:dataItems[0].giDocNo
                                ,giDocTp:parReqStatCd
                                ,giDocStatCd:parReqStatCd
                                ,cancYn:"N"
                                ,parReqDocNo:dataItems[0].parReqDocNo
                                ,roDocNo:dataItems[0].roDocNo
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
                            //부품수령 Save VO
                            var issueReqSaveVO = {
                                "issuePartsOutVO":issuePartsOutVO   /*출고요청정보*/
                                ,"issueReqDetailVO":dataItems       /*출고부품정보*/
                                ,"repairOrderLaborVO":[]
                            }

                            //출고 및 반품 출고수불처리.
                            $.ajax({
                                url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutInnerInves.do' />"
                                ,data:JSON.stringify(issueReqSaveVO)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,success:function(jqXHR, textStatus){
                                    gridObj.grid.dataSource.read();
                                    //parts Out Return complete message.  par.btn.innerReturn  par.lbl.releaseComf
                                   //R19083101003客户反馈内部领用单号RQ20190817182操作配件退回提示已完成出库确定，客户需要把所有配件操作退回 贾明  2019-9-17 start
                                    dms.notification.success("<spring:message code='par.btn.innerReturn' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                                   //R19083101003客户反馈内部领用单号RQ20190817182操作配件退回提示已完成出库确定，客户需要把所有配件操作退回 贾明  2019-9-17 end
                                }
                                ,beforeSend:function(xhr){
                                    dms.loading.show($("#resizableContainer"));
                                }
                                ,complete:function(xhr,status){
                                    dms.loading.hide($("#resizableContainer"));
                                }
                            });
                        }
                    }
                }
            }
        });
    }
}
//order receive popup Func
var issueReceivePopupButtonWindow;
function selectIssueReceivePopupButtonWindow(gridObj, selectedItem, parReqStatCd){

    /*
       내부수령 출고 시  수령자 팝업 사용 안함..
    */

    var dataItems = [ ];
    //set selected Item
    dataItems = selectedItem;
    //checked list.
    for (i = 0; i < dataItems.length; i++) {
        var item  = dataItems[i];
        item.receiveId = $("#custCd").val();//수령자ID : 수령인번호
        item.receiveNm = $("#custNm").val();//수령자 명 : 수령인명칭
    }

    var issuePartsOutVO = {
        dlrCd:""
        ,giDocNo:dataItems[0].giDocNo
        ,giDocTp:parReqStatCd
        ,giDocStatCd:parReqStatCd
        ,cancYn:"N"
        ,parReqDocNo:dataItems[0].parReqDocNo
        ,roDocNo:dataItems[0].roDocNo
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

    var issueReqSaveVO = {
        "issuePartsOutVO":issuePartsOutVO
        ,"issueReqDetailVO":dataItems
        ,"repairOrderLaborVO":[]
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutInnerInves.do' />"
        ,data:JSON.stringify(issueReqSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            gridObj.dataSource.read();
            //parts Out complete message.
            dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
        }
        ,beforeSend:function(xhr){
            dms.loading.show($("#resizableContainer"));
        }
        ,complete:function(xhr,status){
            dms.loading.hide($("#resizableContainer"));
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

//customer Popup Func
var customerSearchPopupWin;
function selectVenderMasterPopupWindow(){
    customerSearchPopupWin = dms.window.popup({
        windowId:"customerSearchPopupWin"
        ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // customer select
        ,width : 840
        ,height: 400
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sReceiveId").val()
                ,"bpNm":$("#sReceiveNm").val()
                ,"bpTp":""
                ,"selectable":"row"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#custCd").val(data[0].bpCd);
                        $("#sReceiveId").val(data[0].bpCd);
                        $("#custNm").val(data[0].bpNm);
                        $("#sReceiveNm").val(data[0].bpNm);

                        buttonEnableDisable(true);

                        customerSearchPopupWin.close();
                    }
                }
            }
        }
    });
}

var userSearchPopupWin;
function selectCustSearchPopupWindow(){

    /*
    * 내부수령 수령인 조회  및 등록 시 사용자정보 팝업을 사용함.
    */
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,title:"<spring:message code='cmm.title.user.search' />"//사용자조회
        ,width:800
        ,height:500
        ,content:{
            url:"<c:url value='/par/cmm/selectIssueInnerUserPopup.do'/>"
            , data:{
                "autoBind":true
                ,"usrId":$("#sReceiveId").val()
                ,"usrNm":$("#sReceiveNm").val()
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"pageable":true
                ,"callbackFunc":function(data){
                    if(data.length > 0) {

                        $("#custCd").val(data[0].usrId);
                        $("#sReceiveId").val(data[0].usrId);
                        $("#custNm").val(data[0].usrNm);
                        $("#sReceiveNm").val(data[0].usrNm);

                        buttonEnableDisable(true);

                    }
                }
            }
        }
    });
}

//page init Func
function pageInit(){
    //header grid selected row item.
    selectedRowHeaderItem = {};
    //detail grid selected row item.
    selectedRowDetailItem = {};
    //detail grid selected row return item.
    selectedRowDetailReturnItem = {};
    //itemGrpCntList
    itemGrpCntList = {};

    $("#sInsertUpdateFlag").val("INSERT");

    $("#sParGiTp").data("kendoExtDropDownList").select(0);
    $("#sReceiveId").val("");
    $("#custCd").val("");
    $("#sReceiveNm").val("");
    $("#custNm").val("");
    $("#sParReqDocNo").val("");
    $("#parReqStatCd").val("");

    $("#sEtcGiTp").data("kendoExtDropDownList").select(0);
    $("#sItemCd").val("");
    $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(null);

    $("#sReceiveId").val("");

    $("#sTotQty").data("kendoExtNumericTextBox").value(0);
    $("#sTotAmt").data("kendoExtNumericTextBox").value(0);
    $("#sRemark").val("");

    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.data([]);

    //button disable
    buttonEnableDisable(false);
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag){
    //page button list
    $("#btnInvReqSave").data("kendoButton").enable(bFlag);
    $("#btnInvReq").data("kendoButton").enable(bFlag);
    $("#btnInvCancel").data("kendoButton").enable(bFlag);
    $("#btnPrint").data("kendoButton").enable(bFlag);

    //parts button list
    $("#btnPartsAdd").data("kendoButton").enable(bFlag);
    $("#btnPartsReturnAdd").data("kendoButton").enable(bFlag);
    $("#btnDel").data("kendoButton").enable(bFlag);
}

//Inner Parts Outs InvsReq Func.
function updateIssuePartsInves(gridObj, parReqStatCd){
    var grid = gridObj.grid,            /* 그리드 */
    items = grid.dataSource.data(),     /* 데이타소스 */
    rowCnt = 0,                         /* 행증가 카운트 수 */
    issueReqItemCheckCnt = 0,           /* 부품코드 확인 카운트 수 */
    issueReqGiStrgeCdCheckCnt = 0,      /* 입고창고 확인 카운트 수 */
    issueReqCheckCnt = 0,               /* 부품수령 수 > 가용수량 시(구매요청 카운트 수) */
    issueReqDbYnCnt = 0,                /* 그리드 DB저장 유무 카운트 수. */
    issueReqRequestCnt = 0,             /* 체크부품 카운트 수 */
    issueReqIssueComItemCnt = 0,        /* 대체부품 카운트 수 */
    issueReqIssueEndQtyZeroCnt = 0,     /* 수량 0 부품 카운트 수 */
    issueReqIssueAblvStockCnt = 0,      /* 가용수량 카운트 수 */
    issueReqIssueItemPriceAmt = 0,      /* 부품가격 0 이하 카운트 수 */
    issueReqIssueDbYnCnt = 0,           /* 부품 DB 저장유무 카운트 수 */
    outItemStockList = {},              /* 부품재고 배열. */
    dataItems = [ ];                    /* 수령부품 배열. */

    //checked list.
    for (i = 0; i < items.length; i++) {

        var item = items[i];
        var elementRow = grid.tbody.find(".checkbox01")[i];
        //부품재고 배열 접두어/접미어 추가 부품코드.
        var itemCdKey = item.itemCd+item.reqStrgeCd;

        //부품 별 가용수량 담기.
        if(outItemStockList[itemCdKey] == undefined){
            outItemStockList[itemCdKey] = item.avlbStockQty;
        }else{
            outItemStockList[itemCdKey] = item.avlbStockQty;
        }

        if(elementRow.checked){
            if(item.parReqStatCd == "01"){//요청건만
                if(item.endQty > item.avlbStockQty){
                    issueReqCheckCnt++;
                }
                if(item.itemCd == ""){
                    issueReqItemCheckCnt++;
                }
                if(item.giStrgeCd == ""){
                    issueReqGiStrgeCdCheckCnt++;
                }

                if(item.dbYn == "N"){
                    issueReqIssueDbYnCnt++;
                }

                if(item.comItemCd != undefined && item.comItemCd != ""){
                    issueReqIssueComItemCnt++;
                }


                if(item.endQty <= 0){
                    issueReqIssueEndQtyZeroCnt++;
                }

                //부품금액 = 0
                if(item.itemAmt < 0){
                    issueReqIssueItemPriceAmt++;
                }

                dataItems.push(item);
                issueReqRequestCnt++;
            }
            rowCnt++;
        }
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(issueReqRequestCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.issueReqParts' var='issueReqParts' /><spring:message code='par.info.itemInsertNotMsg' arguments='${issueReqParts}' />");
        return false;
    }

    if(issueReqItemCheckCnt > 0){
        //itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    if(issueReqIssueDbYnCnt > 0){
        //itemCd check message.
        dms.notification.info("<spring:message code='global.info.isSaveRun' />");
        return false;
    }

    //구매요청 팝업 호출.
    if(issueReqCheckCnt > 0){
        //order Req popup show.
        selectIssueReqPopupButtonWindow();
    }else{

        if(issueReqGiStrgeCdCheckCnt > 0){
            //giStrgeCd check message
            dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giStrgeCd}' />");
            return false;
        }

        if(issueReqIssueComItemCnt > 0){
            //comItemCd check message
            dms.notification.info("<spring:message code='par.lbl.issueComItemCd' var='comItemCd' /><spring:message code='par.info.itemInsertUseMsg' arguments='${comItemCd}' />");
            return false;
        }

        if(issueReqIssueEndQtyZeroCnt > 0){
            //resv count zero check message
            dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.issueOutZeroMsg' arguments='${giQty}' />");
            return false;
        }

        //최종 출고 수량 체크.
        for(j=0;j < dataItems.length;j++){
            var outItem = dataItems[j];
            var itemCdKey = outItem.itemCd + outItem.reqStrgeCd;

            if(outItemStockList[itemCdKey] >= outItem.endQty){
                outItemStockList[itemCdKey] = outItemStockList[itemCdKey] - outItem.endQty;
            }else{
                issueReqIssueAblvStockCnt++;
            }
        }

        if(issueReqIssueAblvStockCnt > 0){
            dms.notification.info("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${giQty},${avlbStockQty}' />");
            return false;
        }

        if(issueReqIssueItemPriceAmt > 0){
            dms.notification.info("<spring:message code='par.info.salePriceZeroMsg' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
            //is Save Run message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }

        //receive Popup show.
        selectIssueReceivePopupButtonWindow(grid, dataItems, parReqStatCd);
    }

}

//updateIssuePartsSaves Func.
function updateIssuePartsSaves(parReqStatCd){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
    rows = grid.dataSource.data(),
    dataItems = [ ],
    issueReqItemCheckCnt = 0;
    //checked list
    $.each(rows, function(idx, row){
        var item = row;
        if(item.itemCd == ""){
            issueReqItemCheckCnt++;
        }
        if(item.unitCd == "" || item.unitCd == null){
            item.unitCd = "EA";
        }
        dataItems.push(item);
    });

    if(issueReqItemCheckCnt > 0){
        // itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    var multiIssueReqDetails = grid.getCUDData("insertList", "updateList", "deleteList");
    if(grid.cudDataLength == 0){
        dms.notification.info("<spring:message code='global.info.required.change'/>");
        return false;
    }

    //출고일자
    var giDt = "";

    if($("#sReqEndDt").val() !== ""){
        giDt = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();
    }

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#sParReqDocNo").val()
            ,"parGiTp":$("#sParGiTp").val()
            ,"parReqStatCd":parReqStatCd
            ,"cancYn":"N"
            ,"roDocNo":null
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
            ,"giDocStatCd":null
            ,"giStatCd":$("#sEtcGiTp").val()
            ,"remark":$("#sRemark").val()
            ,"updtDt":giDt//내부수령 수정일자 출고일자로 대체.
        }
        ,"issueReqDetailVO":multiIssueReqDetails
        ,"repairOrderLaborVO":[{}]
    }

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

            $("#btnSearch").click();

            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
        ,beforeSend:function(xhr){
            dms.loading.show($("#resizableContainer"));
        }
        ,complete:function(xhr,status){
            dms.loading.hide($("#resizableContainer"));
        }
    });
}

//Inner Parts InvsReqReturn Func.
function updateIssuePartsReturnInves(gridObj, parReqStatCd){

    var grid = gridObj.grid,            /* 그리드 */
    parGiTp = gridObj.parGiTp,          /* 요청유형 */
    items = grid.dataSource.data(),     /* 부품 그리드 데이타 */
    length = items.length,              /* 부품 수*/
    rowCnt = 0,                         /* 부품 행증가 카운트 수*/
    issueReqItemCheckCnt = 0,           /* 부품코드 확인 카운트 수 */
    issueReqGiStrgeCdCheckCnt = 0,      /* 입고창고 확인 카운트 수 */
    issueReqRequestReturnCnt = 0,
    issueReqRequestReturnMinCnt = 0,
    issueReqRequestReturnMaxCnt = 0,
    outItemList = {},
    dataItems = [ ];

    //checked list.
    for(i = length-1; i>=0;i--){
        var item = items[i];
        var itemCdKey = item.itemCd + item.reqStrgeCd;
        var elementRow = grid.tbody.find(".checkbox01")[i];

        if(item.parReqStatCd == "02" && item.giDocStatCd == "02"){//출고완료 부품만
            if(outItemList[itemCdKey] == undefined){
                outItemList[itemCdKey] = item.endQty;
            }else{
                outItemList[itemCdKey] = outItemList[itemCdKey] + item.endQty;
            }
        }else if(item.parReqStatCd == "03" && item.giDocStatCd == "03"){//반품완료 부품만
            if(outItemList[itemCdKey] == undefined){
                outItemList[itemCdKey] = - (item.endQty * -1);
            }else{
                outItemList[itemCdKey] = outItemList[itemCdKey] - (item.endQty * -1);
            }
        }

        if(elementRow.checked){

            if(item.parReqStatCd == "03" && item.giDocStatCd == "01"){//부품반품 및 출고등록 01 부품만
                item.returnPartsQty = item.endQty;//출고수량 ==>반품수량
                dataItems.push(item);
                issueReqRequestReturnCnt++;
            }

            rowCnt++;
        }
    }

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(rowCnt > 1){
        // one row select message.
        dms.notification.info("<spring:message code='par.info.onlyOneRowSelectMsg' />");
        return false;
    }

    //최종 반품 수량 체크.
    for(j=0;j < dataItems.length;j++){
        var returnItem = dataItems[j];
        var returnItemCdKey = returnItem.itemCd + returnItem.reqStrgeCd;
        outItemList[returnItemCdKey] = outItemList[returnItemCdKey] - (returnItem.endQty * -1);

        if(outItemList[returnItemCdKey] < 0 ){
            issueReqRequestReturnMaxCnt++;
        }
    }

    if(selectedRowDetailItem.parReqStatCd === undefined){
        // 반품처리 할 부품을 선택하세요.
        // return item select message
        dms.notification.info("<spring:message code='par.lbl.returnParts' var='returnParts' /><spring:message code='par.info.stdPrcSelectMsg' arguments='${returnParts}' />");
        return false;
    }else if(selectedRowDetailItem.parReqStatCd !== "02"){//출고완료부품만.
        // end item select message
        dms.notification.info("<spring:message code='par.lbl.giEndParts' var='giEndParts' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${giEndParts}' />");
        return false;
    }
    else{
        //반품행 추가 처리.
        //반품 허용 카운트 체크.(최대 10개)
        var itemViews = grid.dataSource.view(),
        length = itemViews.length,
        endQtyItemTot = 0,
        returnPartsMaxCnt = 0;

        endQtyItemTot = selectedRowDetailItem.endQty;

        for (i = length-1; i>=0; i--){
            var item = items[i];
            if(item.parReqStatCd === "03" && item.itemCd ===selectedRowDetailItem.itemCd && item.roLineNo === selectedRowDetailItem.roLineNo){
                returnPartsMaxCnt++;
                endQtyItemTot += item.endQty;
            }
        }
        //반품 그리드 부품 추가.
        if(returnPartsMaxCnt < 110){

            var vEndQty = -1;// 기본 반품수량 -1
            var vItemPrc = selectedRowDetailItem.itemPrc;//단가정보 마이너스  제외.
            var vItemAmt = selectedRowDetailItem.itemPrc * vEndQty;
            var vTaxDdctAmt = kendo.parseFloat(selectedRowDetailItem.itemPrc / ( 1 + gVatCd )) * vEndQty;
            var vTaxAmt = vItemAmt - vTaxDdctAmt;

            var IssueReqDetailVO = {
                "rnum":selectedRowDetailItem.rnum
                ,"dlrCd":null
                ,"pltCd":null
                ,"parReqDocNo":selectedRowDetailItem.parReqDocNo
                ,"parReqDocLineNo":length + 1
                ,"parReqDocStockLineNo":selectedRowDetailItem.parReqDocLineNo
                ,"parReqStatCd":"03"
                ,"purcReqNo":"01"
                ,"reqStrgeCd":selectedRowDetailItem.reqStrgeCd
                ,"cancYn":"N"
                ,"parGiTp":selectedRowDetailItem.parGiTp
                ,"roDocNo":selectedRowDetailItem.roDocNo
                ,"roStatCd":selectedRowDetailItem.roStatCd
                ,"roTp":selectedRowDetailItem.roTp
                ,"roLineNo":selectedRowDetailItem.roLineNo
                ,"resvDocNo":selectedRowDetailItem.resvDocNo
                ,"resvDocLineNo":0
                ,"grStrgeCd":selectedRowDetailItem.grStrgeCd
                ,"giStrgeCd":selectedRowDetailItem.giStrgeCd
                ,"giLocCd":selectedRowDetailItem.giLocCd
                ,"dbItemCd":selectedRowDetailItem.itemCd
                ,"pkgDocNo":selectedRowDetailItem.pkgDocNo
                ,"pkgItemCd":selectedRowDetailItem.pkgItemCd
                ,"itemCd":selectedRowDetailItem.itemCd
                ,"itemNm":selectedRowDetailItem.itemNm
                ,"unitCd":selectedRowDetailItem.unitCd
                ,"reqQty":selectedRowDetailItem.reqQty
                ,"endQty":vEndQty
                ,"avlbStockQty":selectedRowDetailItem.avlbStockQty
                ,"totStockQty":selectedRowDetailItem.totStockQty
                ,"resvStockQty":null
                ,"clamStockQty":null
                ,"grScheQty":null
                ,"giScheQty":null
                ,"resvQty":vEndQty
                ,"purcReqDt":null
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":"01"
                ,"dbYn":"N"
                ,"itemPrc":vItemPrc
                ,"movingAvgPrc":selectedRowDetailItem.movingAvgPrc
                ,"movingAvgAmt":selectedRowDetailItem.movingAvgAmt * vEndQty
                ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n2'))
                ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n2'))
                ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n2'))
                ,"receiveDt":null
                ,"receiveId":selectedRowDetailItem.receiveId //반품 시 출고완료 된 수령인 넣기.
                ,"returnPartsQty":vEndQty
                ,"mvtDocYyMm":selectedRowDetailItem.mvtDocYyMm
                ,"mvtDocNo":selectedRowDetailItem.mvtDocNo
                ,"returnDt":null
                ,"returnId":null
                ,"remark":null
                ,"readyRegDt":null

            }

            //var selectedItemIndex = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.indexOf(selectedRowDetailItem);
            //반품정보 넣기.
            selectedRowDetailReturnItem = selectedRowDetailItem;
            //$("#targetReqDetailGrid").data("kendoExtGrid").dataSource.insert(selectedItemIndex + 1, IssueReqDetailVO);

            dataItems.push(IssueReqDetailVO);

            //반품팝업 호출.
            selectIssueReturnPopupButtonWindow(gridObj, dataItems, parReqStatCd, outItemList, endQtyItemTot);

        }else{
          // max retrun parts item select message
          dms.notification.info("<spring:message code='par.lbl.returnPartsMaxCnt' var='returnPartsMaxCnt' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${returnPartsMaxCnt}' />");
        }
    }
}

// reqHeaderChanged
function selectTargetReqHeaderChanged(selectedItem){
    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);//parGiTp
    buttonEnableDisable(true);
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
            if(dataItem.itemCd === data.itemCd && dataItem.reqStrgeCd == data.giStrgeCd){
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

                    var itemQty = 1;
                    var salePrcAmt = 0;
                    var unitCd = "EA";

                    unitCd = data.itemUnitCd;
                    itemQty = data.giQty;
                    salePrcAmt = data.salePrcAmt;

                    var vItemQty = itemQty;// 기본 출고수량 -1
                    var vItemPrc = salePrcAmt;
                    var vItemAmt = vItemPrc * vItemQty;
                    var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vItemQty;
                    var vTaxAmt = vItemAmt - vTaxDdctAmt;

                    var IssueReqDetailVO = {
                        "rnum":sRnum
                        ,"dlrCd":null
                        ,"pltCd":null
                        ,"parReqDocNo":$("#sParReqDocNoVal").val()
                        ,"parReqDocLineNo":sRnum
                        ,"parReqStatCd":"01"
                        ,"purcReqNo":"01"
                        ,"reqStrgeCd":data.giStrgeCd
                        ,"cancYn":"N"
                        ,"parGiTp":$("#sParGiTp").val()
                        ,"roDocNo":""
                        ,"roLineNo":sRnum
                        ,"resvDocNo":""
                        ,"resvDocLineNo":sRnum
                        ,"grStrgeCd":data.giStrgeCd
                        ,"giStrgeCd":data.giStrgeCd
                        ,"giLocCd":""
                        ,"dbItemCd":data.itemCd
                        ,"pkgDocNo":data.pkgDocNo
                        ,"pkgItemCd":data.pkgItemCd
                        ,"itemCd":data.itemCd
                        ,"itemNm":data.itemNm
                        ,"brandCd":data.brandCd
                        ,"unitCd":unitCd
                        ,"reqQty":itemQty
                        ,"endQty":itemQty
                        ,"totStockQty":data.stockQty
                        ,"avlbStockQty":data.avlbStockQty
                        ,"resvStockQty":data.resvStockQty
                        ,"clamStockQty":null
                        ,"rentQty":data.rentQty
                        ,"borrowStockQty":data.borrowQty
                        ,"grScheQty":null
                        ,"giScheQty":null
                        ,"resvQty":itemQty
                        ,"purcReqDt":null
                        ,"giDocNo":null
                        ,"giDocTp":null
                        ,"giDocStatCd":null
                        ,"giStatCd":$("#sEtcGiTp").val()
                        ,"dbYn":"N"
                        ,"itemPrc":vItemPrc
                        ,"movingAvgPrc":data.movingAvgPrc
                        ,"movingAvgAmt":data.movingAvgPrc
                        ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n2'))
                        ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n2'))
                        ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n2'))
                        ,"receiveDt":null
                        ,"receiveId":$("#custCd").val()
                        ,"receiveNm":$("#custNm").val()
                        ,"returnPartsQty":null
                        ,"returnDt":null
                        ,"returnId":null
                        ,"etcGiTp":$("#sEtcGiTp").val()
                        ,"regUsrNm":"${usrNm}"
                        ,"updtUsrNm":"${usrNm}"
                    }
                    console.log("item obj : ", IssueReqDetailVO);
                    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
                }
            });
        }
    }
}

//get tab info and type and grid info
function getSelectedGridObj(){
    var gridObj = {
        "grid":$("#targetReqDetailGrid").data("kendoExtGrid")
        ,"tabIndex":1
        ,"parGiTp":"IN"
    }

    return gridObj;
}

//order receive parts out print popup Func
var issueReceivePartsOutPrintPopupButtonWindow;
function selectIssueReceivePartsOutPrintPopupButtonWindow(){
    issueReceivePartsOutPrintPopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePartsOutPrintPopupButtonWindow"
        ,title:""
        ,width:370
        ,height:330
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceivePartsOutPrintPopup.do'/>"
            ,data:{
                "parReqDocNo":$("#sParReqDocNo").val()
                ,"callbackFunc":function(data){

                    var giDocNoListStrBody = "";    /*출고문서리스트*/
                    var giDocNoListStrEnd = "";     /*출고문서 쿼리 리스트*/

                    if(data.flag =="Y"){
                        var giDocNoList = data.giDocNoList;

                        for (i = 0; i < giDocNoList.length; i++) {
                            var item = giDocNoList[i];
                            giDocNoListStrBody += "'"+item.giDocNo+"',";
                        }

                        giDocNoListStrEnd = "("+giDocNoListStrBody.substring(0,giDocNoListStrBody.length-1)+")";

                        var urlInfo = "<c:url value='/ReportServer?reportlet=par/selectIssueReqServiceWorkInnerPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sPltCd=${pltCd}&sParReqDocNo="+$("#sParReqDocNo").val()+"&sGiDocNoList="+giDocNoListStrEnd;

                        issueReceivePartsOutPrintPopupButtonWindow.close();
                        //param title, url, viewId, isReload
                        parent._createOrReloadTabMenu("<spring:message code='par.title.receiverInnerPrintDoc' />", urlInfo,"VIEW-D-12998", true);
                    }
                }
            }
        }
    });
}

    var itemGrpCntList = {};//부품품종수량 리스트.

    /*
            부품품종 수량 계산 함수.
      itemList : 데이타 아이템 리스트
      addFlag  : 더하기/빼기 구분자. 더하기(true), 빼기(false)
    */
    function setItemGrpItemList(itemList,addFlag){

        $.each(itemList, function(idx, elem) {
            if(itemGrpCntList[elem.itemCd] == undefined){
                if(addFlag){
                    itemGrpCntList[elem.itemCd] = 1;
                }else{
                    itemGrpCntList[elem.itemCd] = -1;
                }

            }else{
                if(addFlag){
                    itemGrpCntList[elem.itemCd] = itemGrpCntList[elem.itemCd] + 1;
                }else{
                    itemGrpCntList[elem.itemCd] = itemGrpCntList[elem.itemCd] - 1;
                }
            }
        });

    }

    $(document).ready(function() {
        //btnInvReq
        $("#btnInvReq").kendoButton({
            enable:false
            ,click:function(e){

                var gridObj = getSelectedGridObj();
                //updateIssuePartsInves Func call
                updateIssuePartsInves(gridObj, "02");
            }
        });
        //btnInvReqSave
        $("#btnInvReqSave").kendoButton({
            enable:false
            ,click:function(e){
                var custCd = $("#custCd").val();

                if(custCd === ""){
                    //custCd check message.
                    dms.notification.info("<spring:message code='par.lbl.receiveId' var='receiveId' /><spring:message code='par.info.issueCheckMsg' arguments='${receiveId}' />");
                    return false;
                }

                //updateIssuePartsSaves Func call
                updateIssuePartsSaves("01");
                $("#chkAll").prop("checked",false);
            }
        });
        // btnInvCancel
        $("#btnInvCancel").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueInvReturn(InvCancel) Func call
                var gridObj = getSelectedGridObj();
                updateIssuePartsReturnInves(gridObj, "03");
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){

                selectIssueReceivePartsOutPrintPopupButtonWindow();

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

                if($("#sParReqDocNo").val() === ""){
                    //sParReqDocNo value check message
                    dms.notification.info("<spring:message code='par.lbl.giDocNo' var='giDocNo' /><spring:message code='par.info.itemInsertNotMsg' arguments='${giDocNo}' />");
                    return false;
                }else{
                    //selectIssueReqByKey get data
                    $.ajax({
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqByKey.do' />"
                        ,data:JSON.stringify({sParReqDocNo:$("#sParReqDocNo").val(),sParGiTp:$("#sParGiTp").val()})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,error: function(jqXHR,status,error){

                        }
                        ,success:function(jqXHR, textStatus){

                            $("#parReqStatCd").val(jqXHR.parReqStatCd);
                            $("#roDocNo").val(jqXHR.roDocNo);
                            $("#custCd").val(jqXHR.custCd);
                            $("#sReceiveId").val(jqXHR.custCd);
                            $("#custNm").val(jqXHR.custNm);
                            $("#sReceiveNm").val(jqXHR.custNm);
                            $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(jqXHR.updtDt);
                            //targetReqDetailGrid read.
                            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
                            buttonEnableDisable(true);
                        }
                    });
                }
            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                //item search Popup call.
                selectPartsMasterPopupWindow();
            }
        });
        //btnPartsReturnAdd
        $("#btnPartsReturnAdd").kendoButton({
            enable:false
            ,click:function(e){

                if(selectedRowDetailItem.parReqStatCd === undefined){
                    // 반품처리 할 부품을 선택하세요.
                    // return item select message
                    dms.notification.info("<spring:message code='par.lbl.returnParts' var='returnParts' /><spring:message code='par.info.stdPrcSelectMsg' arguments='${returnParts}' />");
                    return false;
                }else if(selectedRowDetailItem.parReqStatCd !== "02"){//출고완료부품만.
                    // end item select message
                    dms.notification.info("<spring:message code='par.lbl.giEndParts' var='giEndParts' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='${giEndParts}' />");
                    return false;
                }
                else{

                    $("#messageId").html("<spring:message code='par.info.returnPartsUseYnMsg' />");
                      conformKendoWindow.content( $(".msgDiv").html());
                      conformKendoWindow.open();
                      $(".yes, .no").click(function(){
                          if($(this).hasClass("yes")){
                              conformKendoWindow.close();

                              //반품행 추가 처리.
                              //반품 허용 카운트 체크.(1개)
                              var detailGrid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                              items = detailGrid.dataSource.view(),
                              length = items.length,
                              returnPartsMaxCnt = 0;

                              for (i = length-1; i>=0; i--) {
                                  var item = items[i];
                                  if(item.parReqStatCd !== "02" && item.itemCd ===selectedRowDetailItem.itemCd){
                                      returnPartsMaxCnt++;
                                  }
                              }
                              //반품 그리드 부품 추가.
                              if(returnPartsMaxCnt == 0){

                                  var vEndQty = -1;// 기본 반품수량 -1
                                  var vItemPrc = selectedRowDetailItem.itemPrc;//단가정보 마이너스  제외.
                                  var vItemAmt = selectedRowDetailItem.itemPrc * vEndQty;
                                  var vTaxDdctAmt = kendo.parseFloat(selectedRowDetailItem.itemPrc / ( 1 + gVatCd )) * vEndQty;
                                  var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                  var IssueReqDetailVO = {
                                      "rnum":selectedRowDetailItem.rnum
                                      ,"dlrCd":null
                                      ,"pltCd":null
                                      ,"parReqDocNo":selectedRowDetailItem.parReqDocNo
                                      ,"parReqDocLineNo":length + 1
                                      ,"parReqStatCd":"03"
                                      ,"custCd":selectedRowDetailItem.custCd
                                      ,"custNm":selectedRowDetailItem.custNm
                                      ,"purcReqNo":"01"
                                      ,"reqStrgeCd":selectedRowDetailItem.reqStrgeCd
                                      ,"cancYn":"N"
                                      ,"parGiTp":selectedRowDetailItem.parGiTp
                                      ,"roDocNo":selectedRowDetailItem.roDocNo
                                      ,"roStatCd":selectedRowDetailItem.roStatCd
                                      ,"roTp":selectedRowDetailItem.roTp
                                      ,"roLineNo":selectedRowDetailItem.roLineNo
                                      ,"resvDocNo":selectedRowDetailItem.resvDocNo
                                      ,"resvDocLineNo":0
                                      ,"grStrgeCd":selectedRowDetailItem.grStrgeCd
                                      ,"giStrgeCd":selectedRowDetailItem.giStrgeCd
                                      ,"giLocCd":selectedRowDetailItem.giLocCd
                                      ,"dbItemCd":selectedRowDetailItem.itemCd
                                      ,"pkgDocNo":selectedRowDetailItem.pkgDocNo
                                      ,"pkgItemCd":selectedRowDetailItem.pkgItemCd
                                      ,"itemCd":selectedRowDetailItem.itemCd
                                      ,"itemNm":selectedRowDetailItem.itemNm
                                      ,"unitCd":selectedRowDetailItem.unitCd
                                      ,"reqQty":vEndQty
                                      ,"endQty":vEndQty
                                      ,"avlbStockQty":selectedRowDetailItem.avlbStockQty
                                      ,"totStockQty":selectedRowDetailItem.totStockQty
                                      ,"resvStockQty":null
                                      ,"clamStockQty":null
                                      ,"grScheQty":null
                                      ,"giScheQty":null
                                      ,"resvQty":vEndQty
                                      ,"purcReqDt":null
                                      ,"giDocNo":null
                                      ,"giDocTp":null
                                      ,"giDocStatCd":"01"
                                      ,"dbYn":"N"
                                      ,"itemPrc":vItemPrc
                                      ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n2'))
                                      ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n2'))
                                      ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n2'))
                                      ,"receiveDt":null
                                      ,"receiveId":selectedRowDetailItem.receiveId
                                      ,"returnPartsQty":vEndQty
                                      ,"mvtDocYyMm":selectedRowDetailItem.mvtDocYyMm
                                      ,"mvtDocNo":selectedRowDetailItem.mvtDocNo
                                      ,"returnDt":null
                                      ,"returnId":selectedRowDetailItem.receiveId
                                  }

                                  var selectedItemIndex = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.indexOf(selectedRowDetailItem);
                                  //반품정보 넣기.
                                  selectedRowDetailReturnItem = selectedRowDetailItem;
                                  $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.insert(selectedItemIndex + 1, IssueReqDetailVO);

                              }else{
                                  // max retrun parts item select message
                                  dms.notification.info("<spring:message code='par.lbl.returnPartsMaxCnt' var='returnPartsMaxCnt' /><spring:message code='par.info.giEndPartsOnlyMsg' arguments='1' />");
                              }

                          }
                          conformKendoWindow.close();

                      }).end();

                }
            }
        });
        // btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                items = grid.dataSource.view(),
                rows = grid.tbody.find('>tr'),
                length = items.length,
                rowCnt = 0,
                item,
                i,
                elementRow,
                removeList = [],
                removeItemCntList = [];

                //delete item checked
                $.each(rows, function(index, row){
                    item = grid.dataItem(row);
                    elementRow = grid.tbody.find(".checkbox01")[index];

                    if(elementRow.checked){
                        if(item.parReqStatCd === "01"){//요청건만
                            //delete item adding.
                            removeList[item.uid] = true;
                        }else if(item.parReqStatCd === "03" && item.giDocStatCd === "01"){//반품부품 및 출고등록상태 01 것만
                            //delete item adding.
                            removeList[item.uid] = true;
                        }

                        removeItemCntList.push({itemCd:item.itemCd});

                        rowCnt++;
                    }
                });

                if(rowCnt == 0){
                    // delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                }
                else{

                    setItemGrpItemList(removeItemCntList, false);

                    //grid dataSource Deleting.
                    for (i = length-1; i>=0; i--) {
                        item = items[i];
                        if(removeList[item.uid]){
                            grid.dataSource.remove(item);
                        }
                    }
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
            enable:false
            ,dataTextField:"cmmCdNm"
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
        // reqEndDt datepicker
        $("#sReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sTotQty
        $("#sTotQty").kendoExtNumericTextBox({
            enable:false
            ,format:"n2"
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
            gridId:"G-PAR-0808-153101"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqInnerDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#sParReqDocNo").val() == "" ? "X":$("#sParReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sRoDocNo"] = $("#roDocNo").val();
                            params["sParGiTp"] = "IN"; //내부수령 구분자.
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){

                        itemGrpCntList = {};//부품품종수량 리스트.

                        setItemGrpItemList(result.data, true);

                        return result.data;
                    }
                    ,model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,custCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,custNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemGrpCnt:{ type:"number" , validation:{required:true}, editable:false }
                            ,brandCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,totStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,borrowStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:true }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,receiveNm:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:true }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:true }
                            ,movingAvgAmt:{ type:"number" , editable:true }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:true }
                            ,borrowLineNo:{ type:"number", editable:true }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:true }
                            ,etcRvLineNo:{ type:"number", editable:true }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:true }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regUsrNm:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtUsrNm:{ type:"string", editable:false }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                // complete close cell
                if (e.model.parReqStatCd === "02") {//출고완료상태코드
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="returnPartsQty" || fieldName=="itemPrc"  || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="giCauNm"){
                        this.closeCell();
                    }
                }else if (e.model.parReqStatCd === "03" && e.model.giDocStatCd ==="01") {//출고반품상태코드 03, 출고상태코드 01 : 등록
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="returnPartsQty" || fieldName=="itemPrc"  || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt" || fieldName=="giCauNm"){
                        this.closeCell();
                    }
                }else if (e.model.parReqStatCd === "03" && e.model.giDocStatCd !=="02") {//출고반품상태코드 03, 출고상태코드 03 : 반품
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="returnPartsQty" || fieldName=="itemPrc"  || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt"  || fieldName=="giCauNm"){
                        this.closeCell();
                    }
                }else{//출고요청상태코드
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="returnPartsQty" || fieldName=="giLocCd" || fieldName=="itemAmt" || fieldName=="taxDdctAmt" || fieldName=="taxAmt"){
                        this.closeCell();
                    }
                }
                if(fieldName=="movingAvgPrc" || fieldName=="movingAvgAmt"){
                    this.closeCell();
                }
            }
            ,height:449
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:false
            //,groupable: true,
            ,selectable:"row"
            ,dataBound:function(e){

                var itemQty = 0;
                var itemAmt = 0;
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){

                        if(dataItem.parReqStatCd == "03"){
                            itemQty += dataItem.endQty;
                            itemAmt += dataItem.itemAmt;
                        }else{
                            itemQty += dataItem.endQty;
                            itemAmt += dataItem.itemAmt;
                        }

                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var resvQty = row.children().eq(10);
                        var itemPrc = row.children().eq(18);
                        var giCauNm = row.children().eq(20);

                        if(dataItem.parReqStatCd == "01"){
                            resvQty.addClass("bg_white");
                            itemPrc.addClass("bg_white");
                            giCauNm.addClass("bg_white");
                        }else if(dataItem.parReqStatCd == "03" && dataItem.giDocStatCd == "01"){
                            resvQty.addClass("bg_white");
                        }
                    }
                });

                $("#sTotQty").data("kendoExtNumericTextBox").value(itemQty);
                $("#sTotAmt").data("kendoExtNumericTextBox").value(itemAmt);

                $(".checkbox01").bind("change", function (e){
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
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

                selectedRowDetailItem = {};
                selectedRowDetailReturnItem = {};

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedRowDetailItem = selectedItem;
                }
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [{title: "", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox01' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' type='checkbox' />"
                }
                ,{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field: "rowCnt",
                    aggregates: ["sum", "average"],
                    groupFooterTemplate: "Sum: #= sum # || Average: #= average #"
                }
                ,{field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:100 }
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
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>" ,width:120}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"itemGrpCnt", title:"<spring:message code='par.lbl.itemGrpCnt'/>" , attributes: {"class":"ar"}, width:80
                    ,template:function(dataItem){
                        //부품별 부품품종 수량 가져오기.
                        var itemGrpCnt = itemGrpCntList[dataItem.itemCd];
                        return itemGrpCnt;
                    }
                }
                ,{field:"comItemCd", title:"<spring:message code='par.lbl.issueComItemCd'/>", width:120 }
                ,{field:"comItemNm", title:"<spring:message code='par.lbl.issueComItemNm'/>", width:150 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.giQty'/>", attributes: {"class":"ar"}, width:70
                    ,format:"{0:n2}"
                    ,editor: function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n2"
                            ,decimals:2
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                var endQty = this.value() == null ? 0 : this.value();

                                //출고 최대수량  가용수량 일치화.
                                if(endQty > kendo.parseFloat(model.get("avlbStockQty"))){
                                    endQty = kendo.parseFloat(model.get("avlbStockQty"));
                                }

                                model.set("resvQty", endQty);
                                var parReqStatCd = model.get("parReqStatCd");

                                var vEndQty = endQty;
                                var vItemPrc = model.get("itemPrc");
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vItemAmt = kendo.parseFloat(vItemPrc * endQty);
                                var vTaxAmt = kendo.parseFloat((vItemPrc * endQty) * gVatCd);

                                model.set("itemAmt", vItemAmt);
                                model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n2")));

                                var vMovingAvgAmt = kendo.parseFloat(vMovingAvgPrc * endQty);

                                var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vEndQty;
                                var vItemAmt = kendo.parseFloat(vItemPrc * vEndQty);
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                if(parReqStatCd === "03"){//반품일때
                                    model.set("endQty", endQty);
                                    model.set("returnPartsQty", endQty);

                                    model.set("itemAmt", vItemAmt * -1);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt * -1,"n2")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt * -1,"n2")));

                                }else{
                                    model.set("endQty", endQty);

                                    model.set("itemAmt", vItemAmt);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n2")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n2")));
                                }

                                model.set("movingAvgAmt", vMovingAvgAmt);
                            }
                        });
                    }
                }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", attributes:{"class":"ar"}, format:"{0:n2}" ,decimal:2, width:80}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.realAvlbStockQty'/>", attributes:{"class":"ar"}, format:"{0:n2}" ,decimal:2, width:80}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}" ,decimal:2,width:80}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />", attributes:{"class":"ar"}, format:"{0:n2}" ,decimal:2,width:80}//대출(차출)수량
                ,{field:"borrowStockQty" ,title:"<spring:message code='par.lbl.loanQty' />", attributes:{"class":"ar"}, format:"{0:n2}" ,decimal:2,width:80 }//차입수량
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    ,editor:function(container, options){
                        var input = $('<input id="giStrgeCd" name="giStrgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCdMap[giStrgeCd] !== undefined){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:120
                    ,template:'#if(locCdMap[giLocCd] !== undefined){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes: {"class":"ar"}, format:"{0:n2}", width:100
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n2"
                            ,min:0
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                var itemPrc = this.value() == null ? 0 : this.value();
                                var parReqStatCd = model.get("parReqStatCd");

                                var vItemPrc = itemPrc;
                                var vEndQty = model.get("endQty");

                                var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vEndQty;
                                var vItemAmt = kendo.parseFloat(vItemPrc * vEndQty);
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                if(parReqStatCd === "03"){//반품일때
                                    model.set("itemPrc", itemPrc * -1);
                                    model.set("itemAmt", vItemAmt * -1);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt * -1,"n2")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt * -1,"n2")));
                                }else{
                                    model.set("itemPrc", itemPrc);
                                    model.set("itemAmt", vItemAmt);
                                    model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n2")));
                                    model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n2")));
                                }
                            }
                        });
                    }
                }
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt' />", attributes: {"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"giCauNm", title:"<spring:message code='par.lbl.giCauNm'/>", width:130}//giCauNm
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"receiveNm", title:"<spring:message code='par.lbl.receiveMan' />", width:80}
                ,{field:"updtUsrNm", title:"<spring:message code='par.lbl.handler' />", width:80}

            ]
        });
        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqDetailGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox01")[i];
                elementRow.checked = checked;
                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });
    });
</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">

<!-- issueReqMng -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.issueReqMng" /><!-- issueReqMng --></h1> --%>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
            </div>
            <div class="btn_right">
                <button type="button" id="btnInvReqSave" name="btnInvReqSave" class="btn_m btn_save btn_m_min"><spring:message code="par.btn.save" /><!-- btnInvReqSave --></button>
                <button type="button" id="btnBorrowSave" name="btnBorrowSave" class="btn_m btn_m_min"><spring:message code="par.btn.borrowSave" /><!-- btnBorrowSave --></button>
                <button type="button" id="btnBorrowReturn" name="btnBorrowReturn" class="btn_m btn_m_min"><spring:message code="par.btn.borrowReturn" /><!-- btnBorrowReturn --></button>
                <button type="button" id="btnPrint" name="btnPrint" class="btn_m btn_print btn_m_min"><spring:message code="par.btn.print" /></button><!--btnSearch  -->
                <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
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
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.borrowDocNo" /></th>
                    <td>
                        <input id="sBorrowDocNo" name="sBorrowDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.borrowTp" /></th>
                    <td>
                        <input id="sBorrowDeptNm" name="sBorrowDeptNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.borrowUsrId" /></th>
                    <td>
                        <input id="sBorrowUsrNm" name="sBorrowUsrNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.borrowRegDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sBorrowStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sBorrowEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sRoDocNo" name="sRoDocNo" class="form_input" />
                        <input type="hidden" id="sParReqDocNo" name="sParReqDocNo" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>

                    <th scope="row"><spring:message code="par.lbl.parReqStatNm" /><!-- parReqStatNm --></th>
                    <td>
                        <input id="sParReqStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.vin" /></th>
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoWorkTime" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvRoWorkStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvRoWorkEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoManNm" /></th>
                    <td>
                        <input id="sSaId" name="sSaId" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.borrowStatCd" /></th>
                    <td>
                        <input id="sBorrowStatCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- targetReqHeaderGrid -->
        <div id="targetReqHeaderGrid" ></div>
        <!-- targetReqHeaderGrid -->
    </div>

    <div class="hidden">
        <input type="hidden" id="vinNo" name="vinNo" />
        <input type="hidden" id="custCd" name="custCd" />
        <input type="hidden" id="custNm" name="custNm" />
        <input type="hidden" id="parReqStatCd" name="parReqStatCd" />
        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
        <input type="hidden" id="roDocNo" name="roDocNo" />
        <input type="hidden" id="roTp" name="roTp" />
        <input type="hidden" id="parGiTp" name="parGiTp" />
        <input type="hidden" id="resvDocNo" name="resvDocNo" />
        <input type="hidden" id="carNo" name="carNo" />
        <input type="hidden" id="vinNo" name="vinNo" />
        <input type="hidden" id="carlineCd" name="carlineCd" />
        <input type="hidden" id="serPrsnId" name="serPrsnId" />
        <input type="hidden" id="borrowDocNo" name="borrowDocNo" />
        <input type="hidden" id="borrowDocNoDb" name="borrowDocNoDb" />
        <input type="hidden" id="borrowStatCd" name="borrowStatCd" />
    </div>

    <!--tabPartOutStock tab area -->
    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnPartsAdd" class="btn_s btn_s_min5"><spring:message code="par.btn.rowAdd" /><!-- btnPartsAdd --></button>
                    <button type="button" id="btnDel" class="btn_s btn_s_min5"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
                </div>
            </div>
            <div class="table_grid">
                <!-- targetReqBorrowGrid -->
                <div id="targetReqBorrowGrid" class="resizable_grid"></div>
                <!-- targetReqBorrowGrid -->
            </div>
        </section>
    </div>
    <!-- tabRoWorkInfo tab area -->

    <div class="hidden">
        <section class="group">
            <div class="header_area">
                <div class="btn_right btn_right_v1">
                    &nbsp;
                </div>
            </div>
            <div class="table_grid">
                <div id="targetLbrGrid" ></div>
            </div>
        </section>
    </div>

</section>
<!-- //issueReqMng -->

</div>

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

//parGiTpSr
var parGiTpSrList = [];
<c:forEach var="obj" items="${parGiTpSrList}">
parGiTpSrList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpSrMap = {};
$.each(parGiTpSrList, function(idx, obj){
    parGiTpSrMap[obj.cmmCd] = obj.cmmCdNm;
});
//etcGiTp
var etcGiTpList = [];
<c:forEach var="obj" items="${etcGiTpList}">
etcGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var etcGiTpMap = {};
$.each(etcGiTpList, function(idx, obj){
    etcGiTpMap[obj.cmmCd] = obj.cmmCdNm;
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
//roStatusCdList
var roStatusCdList = [];
<c:forEach var="obj" items="${roStatusCdList}">
    roStatusCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatusCdMap = {};
$.each(roStatusCdList, function(idx, obj){
    roStatusCdMap[obj.cmmCd] = obj.cmmCdNm;
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

var carlineCdList = [],
    carlineCdObj = {},
    modelCdList = [],
    modelCdObj = [],
    borrowStatCdList = [],
    borrowStatCdList02 = [],
    borrowStatCdMap = {};
//carlineCdList
<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>
//modelCdList
<c:forEach var="obj" items="${modelCdList}">
if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}else{
    modelCdObj["${obj.carlineCd}"] = [];
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}
</c:forEach>
//borrowStatCdList
<c:forEach var="obj" items="${borrowStatCdList}" varStatus="status">
borrowStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//borrowStatCdList02
<c:forEach var="obj" items="${borrowStatCdList}" varStatus="status">
if("${obj.cmmCd}" == "01" || "${obj.cmmCd}"=="02" || "${obj.cmmCd}"=="03" || "${obj.cmmCd}"=="04"){//정비차용상태  : 01, 02, 03, 04만
    borrowStatCdList02.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
var borrowStatCdMap = [];
$.each(borrowStatCdList, function(idx, obj){
    borrowStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//tecCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.usrId}", "tecNm":"${obj.usrNm}"});
</c:forEach>
var tecCdMap = [];
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});

//order receive print popup Func
var issueReceivePrintPopupButtonWindow;
function selectIssueReceivePrintPopupButtonWindow(){
    issueReceivePrintPopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePrintPopupButtonWindow"
        ,title:false
        ,width:800
        ,height:450
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
    var minDate = new Date("${sysStartDate}"),
        maxDate = new Date("${sysEndDate}"),
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

    $("#sBorrowDocNo").val("");
    $("#sBorrowDeptNm").val("");
    $("#sBorrowUsrNm").val("");
    $("#sBorrowStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sBorrowEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sBorrowStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sBorrowEndDt").data("kendoExtMaskedDatePicker").value("");

    $("#sCarNo").val("");
    $("#sRoDocNo").val("");
    $("#sParReqDocNo").val("");
    $("#sParGiTp").data("kendoExtDropDownList").select(0);
    $("#sParReqStatCd").data("kendoExtDropDownList").select(0);

    $("#sVinNo").val("");
    $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").value("");

    $("#sSaId").data("kendoExtDropDownList").select(0);
    $("#sBorrowStatCd").data("kendoExtDropDownList").select(0);

    $("#vinNo").val("");
    $("#custCd").val("");
    $("#parReqStatCd").val("");
    $("#parReqDocNo").val("");
    $("#roDocNo").val("");
    $("#roTp").val("");
    $("#parGiTp").val("");
    $("#resvDocNo").val("");
    $("#carNo").val("");
    $("#vinNo").val("");
    $("#carlineCd").val("");
    $("#borrowDocNo").val("");
    $("#borrowStatCd").val("");

    $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.data([]);

    //buttonEnableDisable Func call.
    buttonEnableDisable(false, "00", "00");
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag, borrowStatCd, parGiTp){
    //page button list
    $("#btnInvReqSave").data("kendoButton").enable(true);//저장버튼
    $("#btnBorrowSave").data("kendoButton").enable(false);//정비차용버튼
    $("#btnBorrowReturn").data("kendoButton").enable(false);//정비반환버튼

    $("#btnPrint").data("kendoButton").enable(false);//출력버튼

    //parts button list
    $("#btnPartsAdd").data("kendoButton").enable(false);//부품추가
    $("#btnDel").data("kendoButton").enable(false);//부품삭제

    if(bFlag){

        $("#btnInvReqSave").data("kendoButton").enable(true);
        $("#btnBorrowSave").data("kendoButton").enable(true);
        $("#btnBorrowReturn").data("kendoButton").enable(true);

        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnPartsAdd").data("kendoButton").enable(true);
        $("#btnDel").data("kendoButton").enable(true);

    }

}
//updateIssuePartsBorrowSaves Func.
function updateIssuePartsBorrowSaves(){
    var gridHeader = $("#targetReqHeaderGrid").data("kendoExtGrid"),
    grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
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

    if(issueReqItemCheckCnt > 0){
        //itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    var multiIssueReqDetails = grid.getCUDData("insertList", "updateList", "deleteList");

    if(grid.cudDataLength == 0){
        dms.notification.info("<spring:message code='global.info.required.change'/>");
        return false;
    }else{
        var issueReqDetailSaveVO = {
            "issueReqVO":{
                "dlrCd":null
                ,"parReqDocNo":$("#parReqDocNo").val()
                ,"parGiTp":$("#parGiTp").val()
                ,"parReqStatCd":"01"
                ,"cancYn":"N"
                ,"roDocNo":$("#roDocNo").val()
                ,"resvDocNo":$("#resvDocNo").val()
                ,"pltCd":null
                ,"serPrsnId":$("#serPrsnId").val()
                ,"custCd":$("#custCd").val()
                ,"custNm":$("#custNm").val()
                ,"vinNo":$("#vinNo").val()
                ,"carNo":$("#carNo").val()
                ,"carlineCd":$("#carlineCd").val()
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":null
                ,"borrowDocNo":$("#borrowDocNo").val()
                ,"borrowDocNoDb":$("#borrowDocNoDb").val()
                ,"borrowStatCd":"01"
            }
            ,"issueReqDetailVO":multiIssueReqDetails
            ,"repairOrderLaborVO":null
            ,"reservationLaborVO":null
        }

        $.ajax({
            url:"<c:url value='/par/ism/issueReq/multiIssueBorrowDetails.do' />"
            ,data:JSON.stringify(issueReqDetailSaveVO)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                //header grid reload.
                gridHeader.dataSource.read();
                // destroy data clear and data reload
                grid.dataSource._destroyed = [];
                grid.dataSource.read();
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
}

//order receive popup Func
var issueReceivePopupButtonWindow;
//updateIssueBorrowConfirm(InvCancel) Func
function updateIssueBorrowConfirm(statCd){
    var gridHeader = $("#targetReqHeaderGrid").data("kendoExtGrid"),
    grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
    items = grid.dataSource.data(),
    rowCnt = 0,
    issueReqItemCheckCnt = 0,
    issueReqRequestCnt = 0,
    dataItems = [ ];
    //checked list.
    for (i = 0; i < items.length; i++) {

        var item = items[i];
        var elementRow = elementRow = grid.tbody.find(".checkbox01")[i];

        if(elementRow.checked){
            if(item.borrowStatCd == "01" || item.borrowStatCd == "03"){//대기,정비반환 건만

                if(item.itemCd == ""){
                    issueReqItemCheckCnt++;
                }
                //차용상태:정비차용.
                item.borrowUpdateStatCd = statCd;
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
        dms.notification.info("<spring:message code='par.lbl.issueBorrowParts' var='issueBorrowParts' /><spring:message code='par.info.itemInsertNotMsg' arguments='${issueBorrowParts}' />");
        return false;
    }

    if(issueReqItemCheckCnt > 0){
        //itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    issueReceivePopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePopupButtonWindow"
        ,title:""
        ,width:500
        ,height:400
        ,modal:true
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceiveCheckDetailPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    //receive y or n
                    if(data.flag == "Y"){

                        //checked list.
                        for (i = 0; i < dataItems.length; i++) {
                            var item  = dataItems[i];
                            item.borrowUsrId = data.receiveNm;
                            item.reqQty = item.borrowQty;
                            item.endQty = item.borrowQty;
                        }

                        //정비차용처리
                        var multiIssueReqDetails = { insertList:[], updateList:dataItems, deleteList:[] };

                        var issueReqDetailSaveVO = {
                            "issueReqVO":{
                                "dlrCd":null
                                ,"parReqDocNo":$("#parReqDocNo").val()
                                ,"parGiTp":$("#parGiTp").val()
                                ,"parReqStatCd":"01"
                                ,"cancYn":"N"
                                ,"roDocNo":$("#roDocNo").val()
                                ,"resvDocNo":$("#resvDocNo").val()
                                ,"pltCd":null
                                ,"serPrsnId":$("#serPrsnId").val()
                                ,"custCd":$("#custCd").val()
                                ,"custNm":$("#custNm").val()
                                ,"vinNo":$("#vinNo").val()
                                ,"carNo":$("#carNo").val()
                                ,"carlineCd":$("#carlineCd").val()
                                ,"giDocNo":null
                                ,"giDocTp":null
                                ,"giDocStatCd":null
                                ,"borrowDocNo":$("#borrowDocNo").val()
                                ,"borrowDocNoDb":$("#borrowDocNoDb").val()
                                ,"borrowStatCd":"01"
                            }
                            ,"issueReqDetailVO":multiIssueReqDetails
                            ,"repairOrderLaborVO":null
                            ,"reservationLaborVO":null
                        }

                        $.ajax({
                            url:"<c:url value='/par/ism/issueReq/multiIssueBorrowDetails.do' />"
                            ,data:JSON.stringify(issueReqDetailSaveVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(jqXHR, textStatus){
                                //header grid reload.
                                gridHeader.dataSource.read();
                                // destroy data clear and data reload
                                grid.dataSource._destroyed = [];
                                grid.dataSource.read();
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
                }
            }
        }
    });


}

//updateIssueBorrowReturn(InvCancel) Func
function updateIssueBorrowReturn(statCd){
    var gridHeader = $("#targetReqHeaderGrid").data("kendoExtGrid"),
    grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
    items = grid.dataSource.data(),
    rowCnt = 0,
    issueReqItemCheckCnt = 0,
    issueReqRequestCnt = 0,
    dataItems = [ ];
    //checked list.
    for (i = 0; i < items.length; i++) {

        var item = items[i];
        var elementRow = elementRow = grid.tbody.find(".checkbox01")[i];

        if(elementRow.checked){
            if(item.borrowStatCd == "01" || item.borrowStatCd == "02"){//대기,정비차용 건만 취소처리
                if(item.itemCd == ""){
                    issueReqItemCheckCnt++;
                }
                //차용상태:정비반환.
                item.borrowUpdateStatCd = statCd;
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
        dms.notification.info("<spring:message code='par.lbl.issueBorrowReturnParts' var='issueBorrowReturnParts' /><spring:message code='par.info.itemInsertNotMsg' arguments='${issueBorrowReturnParts}' />");
        return false;
    }

    if(issueReqItemCheckCnt > 0){
        //itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    var multiIssueReqDetails = { insertList:[], updateList:dataItems, deleteList:[] };

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parGiTp":$("#parGiTp").val()
            ,"parReqStatCd":"01"
            ,"cancYn":"N"
            ,"roDocNo":$("#roDocNo").val()
            ,"resvDocNo":$("#resvDocNo").val()
            ,"pltCd":null
            ,"serPrsnId":$("#serPrsnId").val()
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":$("#vinNo").val()
            ,"carNo":$("#carNo").val()
            ,"carlineCd":$("#carlineCd").val()
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
            ,"borrowDocNo":$("#borrowDocNo").val()
            ,"borrowDocNoDb":$("#borrowDocNoDb").val()
            ,"borrowStatCd":"01"
        }
        ,"issueReqDetailVO":multiIssueReqDetails
        ,"repairOrderLaborVO":null
        ,"reservationLaborVO":null
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/multiIssueBorrowDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            //header grid reload.
            gridHeader.dataSource.read();
            // destroy data clear and data reload
            grid.dataSource._destroyed = [];
            grid.dataSource.read();
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
// reqHeaderChanged
function selectTargetReqHeaderChanged(selectedItem){
    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);//parGiTp

    buttonEnableDisable(true, selectedItem.borrowStatCd, selectedItem.parGiTp);

    $("#parReqDocNo").val(selectedItem.parReqDocNo);        //parReqDocNo
    $("#borrowDocNo").val(selectedItem.borrowDocNo);        //borrowDocNo
    $("#borrowDocNoDb").val(selectedItem.borrowDocNoDb);    //borrowDocNoDb
    $("#roDocNo").val(selectedItem.roDocNo);                //roDocNo
    $("#roTp").val(selectedItem.roTp);                      //roTp
    $("#parGiTp").val(selectedItem.parGiTp);                //parGiTp
    $("#resvDocNo").val(selectedItem.resvDocNo);            //resvDocNo
    $("#parReqStatCd").val(selectedItem.parReqStatCd);      //parReqStatCd
    $("#parReqStatNm").val(partsParReqStatCdMap[selectedItem.parReqStatCd]);  //parReqStatNm
    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));     // regDt
    $("#custCd").val(selectedItem.custCd);                  //custCd
    $("#custNm").val(selectedItem.custNm);                  //custNm
    $("#carNo").val(selectedItem.carNo);                    //carNo
    $("#vinNo").val(selectedItem.vinNo);                    //vinNo
    $("#carlineCd").val(selectedItem.carlineCd);            //carlineCd
    $("#serPrsnId").val(selectedItem.serPrsnId);            //serPrsnId

    $("#borrowDocNo").val(selectedItem.borrowDocNo);        //borrowDocNo
    $("#borrowStatCd").val(selectedItem.borrowStatCd);      //borrowStatCd

    //targetLbrGrid
    $("#targetLbrGrid").data("kendoExtGrid").dataSource.read();
    //tergetReqDetailGrid
    $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.read();
}
// targetReqBorrowGrid Change Func
function targetReqBorrowGridChanged(){
    var grid = $("#targetReqBorrowGrid").data("kendoExtGrid");
    // k-state-selected add all
    grid.tbody.find('>tr').each(function(){
        var dataItem = grid.dataItem(this);
        if(dataItem.dirty)
            $(this).addClass("k-state-selected");
    });
}
//PartItemLbrItem Add Func
function setPartsItemsAndLbrItems(parData, lbrData){
    //parts Item add

    var dupIssueWorkItemCnt = 0,
    dupIssueWorkItemList = [],
    dupBorrowItemCnt = 0,
    dupBorrowItemList = [],
    prcTp = "01";

    prcTp = getPriceTpRoTp();

    for(var i=0; i<parData.length; i++){

        $.ajax({
            url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
            ,data:JSON.stringify({sParReqDocNo:$("#parReqDocNo").val(), sItemCd:parData[i].itemCd, sReqStrgeCd:parData[i].giStrgeCd})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,error:function(jqXHR,status,error){
                // itemCd not use check message
            }
            ,success:function(jqXHR, textStatus){

                if(jqXHR.total === 0){
                    var data = parData[i],
                    sRnum = 1,
                    itemCheckCnt = 0,
                    grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
                    items = grid.dataSource.view(),
                    length = items.length;

                    grid.tbody.find('>tr').each(function(){
                        var dataItem = grid.dataItem(this);
                        var vRoLineNoFr = dataItem.roLineNo;
                        if(sRnum < vRoLineNoFr){
                            sRnum = vRoLineNoFr;
                        }
                        sRnum = sRnum + 1;

                        if(dataItem.itemCd === data.itemCd && dataItem.reqStrgeCd === data.giStrgeCd){
                            itemCheckCnt++;
                        }
                    });

                    if(itemCheckCnt === 0){

                        var itemQty = 1;
                        var salePrcAmt = 0;
                        var unitCd = "EA";

                        unitCd = data.stockUnitCd;
                        itemQty = data.giQty;

                        if(prcTp === "04"){//보증가
                            salePrcAmt = data.grtePrc;
                        }else if(prcTp === "03"){//보험가
                            salePrcAmt = data.incPrc;
                        }else{//일반가
                            salePrcAmt = data.retlPrc;
                        }

                        var vItemQty = itemQty;// 기본 출고수량 -1
                        var vItemPrc = salePrcAmt;
                        var vItemAmt = vItemPrc * vItemQty;
                        var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vItemQty;
                        var vTaxAmt = vItemAmt - vTaxDdctAmt;

                        var IssueReqDetailVO = {
                            "rnum":sRnum
                            ,"dlrCd":null
                            ,"pltCd":null
                            ,"parReqDocNo":$("#parReqDocNo").val()
                            ,"parReqDocLineNo":sRnum
                            ,"parReqStatCd":"01"
                            ,"purcReqNo":"01"
                            ,"reqStrgeCd":data.giStrgeCd
                            ,"cancYn":"N"
                            ,"parGiTp":$("#parGiTp").val()
                            ,"roDocNo":$("#roDocNo").val()
                            ,"roLineNo":sRnum
                            ,"roTp":$("#roTp").val()
                            ,"resvDocNo":$("#resvDocNo").val()
                            ,"resvDocLineNo":sRnum
                            ,"grStrgeCd":data.giStrgeCd
                            ,"giStrgeCd":data.giStrgeCd
                            ,"giLocCd":""
                            ,"dbItemCd":data.itemCd
                            ,"pkgDocNo":data.pkgDocNo
                            ,"pkgItemCd":data.pkgItemCd
                            ,"itemCd":data.itemCd
                            ,"itemNm":data.itemNm
                            ,"unitCd":data.stockUnitCd
                            ,"reqQty":1
                            ,"endQty":1
                            ,"totStockQty":data.stockQty
                            ,"avlbStockQty":data.avlbStockQty
                            ,"resvStockQty":data.resvStockQty
                            ,"clamStockQty":data.resvStockQty
                            ,"borrowStockQty":data.borrowQty
                            ,"rentQty":data.rentQty
                            ,"grScheQty":null
                            ,"giScheQty":null
                            ,"resvQty":1
                            ,"purcReqDt":null
                            ,"giDocNo":null
                            ,"giDocTp":null
                            ,"giDocStatCd":null
                            ,"dbYn":"N"
                            ,"itemPrc":vItemPrc
                            ,"movingAvgPrc":data.movingAvgPrc
                            ,"movingAvgAmt":data.movingAvgPrc
                            ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n2'))
                            ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n2'))
                            ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n2'))
                            ,"receiveDt":null
                            ,"receiveId":null
                            ,"returnPartsQty":null
                            ,"returnDt":null
                            ,"returnId":null
                            ,"borrowDocNo":$("#borrowDocNoDb").val()
                            ,"borrowLineNo":null
                            ,"borrowTp":null
                            ,"borrowStatCd":"01"
                            ,"borrowUpdateStatCd":"01"
                            ,"borrowQty":1
                            ,"borrowUsrId":null
                            ,"borrowUsrNm":null
                            ,"borrowRegDt":null
                        }

                        $("#targetReqBorrowGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
                    }
                    else{
                        dupBorrowItemCnt++;
                        dupBorrowItemList.push(parData[i].itemCd);
                    }
                }else{
                    dupIssueWorkItemCnt++,
                    dupIssueWorkItemList.push(parData[i].itemCd);
                }
            }
        });
    }

    if(dupBorrowItemCnt > 0){
        dms.notification.info("<spring:message code='par.info.duplicateIssueReqBorrowPartInfoChk' arguments='"+dupBorrowItemList+"' />");
    }

    if(dupIssueWorkItemCnt > 0){
        dms.notification.info("<spring:message code='par.info.duplicateIssueReqWorkPartInfoChk' arguments='"+dupIssueWorkItemList+"' />");
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

//priceTp Func
function getPriceTpRoTp(){
    var prcTp = "01";//일반
    var roTp = selectedRowHeaderItem.roTp;
    if(roTp === "02"){//보증
        prcTp = "04";
    }else if(roTp === "04" || roTp === "05"){
    }else{
        prcTp = roTp;
    }
    return prcTp;
}

//item search popup Func
var selectStockGiItemForServicePopupWindow;
function selectPartsMasterPopupWindow(){

    //get PriceTp
    var prcTp = getPriceTpRoTp();

    selectStockGiItemForServicePopupWindow = dms.window.popup({
        windowId:"selectStockGiItemForServicePopupWindow"
        ,width:900
        ,height:550
        ,title:""
        ,content:{
            url:"<c:url value='/par/cmm/selectStockGiItemForServicePopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"selectable":"multiple"
                ,"prcTp": prcTp
                ,"carlineCd":selectedRowHeaderItem.carlineCd
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        setPartsItemsAndLbrItems(data,[{}]);
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
     window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd+"&infoType=RO", "VIEW-D-10337"); // RO Main
 });

var selectedRowHeaderItem = {};

    $(document).ready(function() {
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){
                //param title, url, viewId, isReload
                parent._createOrReloadTabMenu("<spring:message code='par.title.receiverBorrowPrintDoc' />", "<c:url value='/ReportServer?reportlet=par/selectIssueReqServiceWorkBorrowPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sPltCd=${pltCd}&sParReqDocNo="+$("#parReqDocNo").val(),"VIEW-D-12824", true);
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
        //btnBorrowSave
        $("#btnBorrowSave").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueBorrowConfirm Func call.
                updateIssueBorrowConfirm("02");
            }
        });
        //btnBorrowReturn
        $("#btnBorrowReturn").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueBorrowReturn Func call.
                updateIssueBorrowReturn("03");
            }
        });
        // btnInvReqSave
        $("#btnInvReqSave").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsBorrowSaves Func call
                updateIssuePartsBorrowSaves();
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
                // reqHeaderGrid datasource read.
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                //selectPartsMasterPopupWindow Func call.
                selectPartsMasterPopupWindow();
            }
        });
        // btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){

                var grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
                items = grid.dataSource.view(),
                rows = grid.tbody.find('>tr'),
                length = items.length,
                rowRemoveCnt = 0,
                rowCnt = 0,
                item,
                i,
                elementRow,
                removeList = [];

                //delete item checked
                $.each(rows, function(index, row){
                    item = grid.dataItem(row);
                    elementRow = grid.tbody.find(".checkbox01")[index];

                    if(elementRow.checked){
                        if(item.parReqStatCd === "01" && item.borrowStatCd != "04" && item.borrowStatCd != "05"){//요청건만
                            //delete item adding.
                            removeList[item.uid] = true;
                            rowRemoveCnt++;
                        }
                        rowCnt++;
                    }
                });

                if(rowCnt == 0){
                    // delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                }else if(rowRemoveCnt == 0){
                 // delete item not message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='par.info.itemInsertNotMsg' arguments='${delItemMsg}' />");
                }
                else{

                    //반품선택 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.delYn' />");
                        conformKendoWindow.content( $(".msgDiv").html());
                        conformKendoWindow.open();
                        $(".yes, .no").click(function(){
                            if($(this).hasClass("yes")){
                                conformKendoWindow.close();
                                //grid dataSource Deleting.
                                for (i = length-1; i>=0; i--) {
                                    item = items[i];
                                    if(removeList[item.uid]){
                                        grid.dataSource.remove(item);
                                    }
                                }
                            }
                            conformKendoWindow.close();
                        }).end();
                }
            }
        });

        // sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roTpCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sSaId dropdownlist
        $("#sSaId").kendoExtDropDownList({
            dataTextField:"tecNm"
            ,dataValueField:"tecId"
            ,dataSource:tecCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });

        //sBorrowStatCd dropdownlist
        $("#sBorrowStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:borrowStatCdList02
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // parReqStatCd dropdownlist
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:partsParReqStatCdList
            ,index:0
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
        //sBorrowStartDt datepicker
        $("#sBorrowStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sBorrowEndDt datepicker
        $("#sBorrowEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //targetReqHederGrid.
        $("#targetReqHeaderGrid").kendoExtGrid({
            gridId:"G-PAR-0815-135501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            if($("#sParGiTp").val() == ""){
                                params["sParGiTp"] = "RO";                              //sParGiTp.
                            }else{
                                params["sRoTp"] = $("#sParGiTp").val();
                            }

                            params["sRoDocNo"] = $("#sRoDocNo").val();                  //sRoDocNo.
                            params["sRoDocNoLikeUseYn"] = "Y";                          //sRoDocNoLikeUseYn.
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();        //sParReqStatCd.
                            params["sRoStatCdYn"] = "Y";//RO상태 위탁확인,수리서비스 만
                            params["sBorrowDocNo"] = $("#sBorrowDocNo").val();          //sBorrowDocNo.
                            params["sBorrowStartDt"] = $("#sBorrowStartDt").data("kendoExtMaskedDatePicker").value();     //sReqStartDt
                            params["sBorrowEndDt"] = $("#sBorrowEndDt").data("kendoExtMaskedDatePicker").value();         //sReqEndDt
                            params["sInvRoWorkStartDt"] = $("#sInvRoWorkStartDt").data("kendoExtMaskedDatePicker").value();     //sReqStartDt
                            params["sInvRoWorkEndDt"] = $("#sInvRoWorkEndDt").data("kendoExtMaskedDatePicker").value();         //sReqEndDt

                            params["sBorrowDeptNm"] = $("#sBorrowDeptNm").val();        //sBorrowDeptNm.
                            params["sBorrowUsrNm"] = $("#sBorrowUsrNm").val();          //sBorrowUsrNm.

                            params["sBorrowStatCd"] = $("#sBorrowStatCd").val();        //sBorrowStatCd.
                            params["sCustCd"] = $("#sCustCd").val();                    //sCustCd.
                            params["sCustNm"] = $("#sCustNm").val();                    //sCustNm.
                            params["sSaId"] = $("#sSaId").val();                        //sSaId.
                            params["sCarNo"] = $("#sCarNo").val();                      //sCarNo.
                            params["sVinNo"] = $("#sVinNo").val();                      //sVinNo.

                            params["sItemCntYn"] = "N";//부품없을 때 헤더 조회 가능

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
                            ,readyStatCd:{ type:"string"}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,roStatCd:{ type:"string"}
                            ,roTp:{ type:"string"}
                            ,resvStatCd:{ type:"string"}
                            ,dlStatCd:{ type:"string"}
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
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,filterable:false
            ,height:219
            ,autoBind:false
            ,appendEmptyColumn:true//empty column. default:false
            ,indvColumnRows:5
            ,selectable:"row"
            ,change:function(e){

                selectedRowHeaderItem = {};

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedRowHeaderItem = selectedItem;
                    selectTargetReqHeaderChanged(selectedItem);
                }
            }
            ,dataBound:function(e) {
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        if(dataItem.parReqDocNo == $("#parReqDocNo").val()){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                    }
                });
            }
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"borrowDocNo", title:"<spring:message code='par.lbl.borrowDocNo'/>", width:100 }//borrowDocNo
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{ field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }//vinNo
                ,{ field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoNo'>"+dataItem.roDocNo+"</a>";
                        return spanObj;
                    }
                }//roDocNo
                ,{ field:"regDt", title:"<spring:message code='par.lbl.issueReqDt'/>", format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", width:120 }//regDt
                ,{ field:"roTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.roTp+"]"+roTpCdMap[dataItem.roTp]+"</span>";
                        return spanObj;
                    }
                }//roTp
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
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.parGiMan'/>", width:100 }//serPrsnId
                ,{ field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
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
                }//parReqStatCd
                ,{field:"borrowStatCd", title:"<spring:message code='par.lbl.borrowStatCd' />", width:90
                    ,attributes:{"class":"ac"}
                    ,template:'#if(borrowStatCdMap[borrowStatCd] !== undefined){# #= borrowStatCdMap[borrowStatCd]# #}#'
                }
            ]
        });
        //targetLbrGrid.
        $("#targetLbrGrid").kendoExtGrid({
            gridId:"G-PAR-0815-135502"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            var sRoDocNo = $("#roDocNo").val() == "" ? "X":$("#roDocNo").val();
                            params["sDocNo"] = sRoDocNo;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,roTp:{type:"string", validation:{required:true}}
                            ,roDocNo:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,lbrCd:{type:"string", editable:false}
                            ,lbrNm:{type:"string", editable:false}
                            ,lbrTp:{type:"string", editable:false}
                            ,lbrTime:{type:"string", editable:false}
                            ,lbrPrc:{type:"number"}
                        }
                    }
                }
            }
            ,height:219
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,editable:false
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='par.lbl.lbrCd' />", width:100}
                ,{field:"lbrNm", title:"<spring:message code='par.lbl.lbrNm' />", width:200}
                ,{field:"lbrTp", title:"<spring:message code='par.lbl.lbrTp' />", width:100}
                ,{field:"lbrTime", title:"<spring:message code='par.lbl.lbrTime' />", width:100}
                ,{field:"lbrPrc", title:"<spring:message code='par.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"lbrHm", title:"<spring:message code='par.lbl.lbrHm' />", width:70, attributes:{"class":"ar"} }
            ]
        });
        //targetReqBorrowGrid.
        $("#targetReqBorrowGrid").kendoExtGrid({
            gridId:"G-PAR-0519-181502"
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
                            params["sBorrowStatCd"] = "BORROW_STAT_04";
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
                            ,reqStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
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
                            ,returnPartsQty:{ type:"number" , editable:false }
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
                            ,borrowDocNo:{ type:"string", editable:false }
                            ,borrowLineNo:{ type:"number", editable:true }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowUsrNm:{ type:"string", editable:false }
                            ,borrowDeptNm:{ type:"string", editable:false }
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
                            ,regUsrNm:{ type:"string" , editable:false }
                            ,deptCd:{ type:"string" , editable:false }
                            ,deptNm:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                if(e.model.borrowStatCd == "02" || e.model.borrowStatCd == "03" || e.model.borrowStatCd == "04" || e.model.borrowStatCd == "05"){
                    this.closeCell();
                }
                else{
                    if(fieldName=="itemNm" || fieldName=="unitCd"){
                        this.closeCell();
                    }
                }
            }
            ,height:242
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //empty column. default:false
            ,multiSelectWithCheckbox:false
            ,indvColumnRows:5
            ,selectable:"row"
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var resvQty = row.children().eq(8);

                        if(dataItem.borrowStatCd == "01"){
                            resvQty.addClass("bg_white");
                        }
                    }
                });

                $(".checkbox01").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqBorrowGrid").data("kendoExtGrid");
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
                    //버튼 활성화
                    buttonEnableDisable(true, selectedItem.borrowStatCd, null);
                }
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);

            }
            ,columns :
                [{title:"", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox01' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' type='checkbox' />"
                }
                ,{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
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
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:180}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>"
                    ,width:150
                }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"unitCd", title:"<spring:message code='par.lbl.stockUnitCd'/>", width:50 }
                ,{field:"borrowDocNo", title:"<spring:message code='par.lbl.borrowDocNo'/>", width:100 }//borrowDocNo
                ,{field:"borrowQty", title:"<spring:message code='par.lbl.borrowQty'/>", attributes:{"class":"ar"}, width:90
                    ,format:"{0:n2}"
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n2"
                            ,decimals:2
                            ,min:0
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqBorrowGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                var endQty = this.value() == null ? 0 : this.value();

                                //차용 최대수량  가용수량 일치화.
                                if(endQty > kendo.parseFloat(model.get("avlbStockQty"))){
                                    endQty = kendo.parseFloat(model.get("avlbStockQty"));
                                }

                                model.set("reqQty", endQty);
                                model.set("resvQty", endQty);
                                model.set("borrowQty", endQty);

                                var vEndQty = endQty;
                                var vItemPrc = model.get("itemPrc");
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vItemAmt = kendo.parseFloat(vItemPrc * endQty);
                                var vTaxAmt = kendo.parseFloat((vItemPrc * endQty) * gVatCd);

                                var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vEndQty;
                                var vItemAmt = kendo.parseFloat(vItemPrc * vEndQty);
                                var vTaxAmt = vItemAmt - vTaxDdctAmt;

                                var vMovingAvgAmt = kendo.parseFloat(vMovingAvgPrc * vEndQty);
                                model.set("movingAvgAmt", vMovingAvgAmt);

                                model.set("itemAmt", vItemAmt);
                                model.set("taxDdctAmt", kendo.parseFloat(kendo.toString(vTaxDdctAmt,"n2")));
                                model.set("taxAmt", kendo.parseFloat(kendo.toString(vTaxAmt,"n2")));

                            }
                        });
                    }
                }
                ,{field:"borrowDeptNm", title:"<spring:message code='par.lbl.borrowTp' />", width:80 }
                ,{field:"borrowUsrNm", title:"<spring:message code='par.lbl.borrowUsrId' />", width:80 }
                ,{field:"borrowStatCd", title:"<spring:message code='par.lbl.borrowStatCd' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:'#if(borrowStatCdMap[borrowStatCd] !== undefined){# #= borrowStatCdMap[borrowStatCd]# #}#'
                }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", attributes:{"class":"ar"},format:"{0:n2}" ,decimal:2, width:90 }//장면수량
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"},format:"{0:n2}" ,decimal:2, width:80 }//가용수량
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
                ,{field:"borrowStockQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차입수량
            ]
        });

        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqBorrowGrid').data('kendoExtGrid');
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
            if(id === 'sBorrowStartDt'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sBorrowStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sBorrowEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sBorrowEndDt'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sBorrowEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sBorrowStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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
            if(id === 'sBorrowStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sBorrowEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sBorrowEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sBorrowStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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

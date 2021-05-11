<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- issueReqConfirm -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.giDocSearch" /> --%><!-- giDocSearch --></h1>
            <div class="btn_right">
                <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--search  -->
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
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- giDocNo --></th>
                    <td>
                        <input id="sGiDocNo" name="sGiDocNo" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.regDt" /><!-- regDt --></th>
                    <td>
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
                    <th scope="row"><spring:message code="par.lbl.custNo" /><!-- custNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCustCd" name="sCustCd" class="form_input" />
                            <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocStatCd" /><!-- giDocStatCd --></th>
                    <td>
                        <input id="sGiDocStatCd" class="form_comboBox" />
                    </td>

                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId--></th>
                    <td>
                        <div class="form_search">
                            <input id="sSerPrsnId" name="sSerPrsnId" class="form_input" />
                            <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                            <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="targetGiHeaderGrid" class="grid"></div>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.giDocInfo" /><!-- giDocInfo --></h2>
        <div class="btn_right">
            <button id="btnInvConfirm" class="btn_s"><spring:message code="par.btn.invConfirm" /><!-- invConfirm --></button>
            <button id="btnInvCancel" class="btn_s"><spring:message code="par.btn.invCancel" /><!-- invCancel --></button>
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
                <col style="width:21%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- giDocNo --></th>
                    <td>
                        <input id="giDocNo" name="giDocNo" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocStatCd" /><!-- giDocStatCd --></th>
                    <td>
                        <input id="giDocStatCd" name="giDocStatCd" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="parGiTp" name="parGiTp" readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.regDt" /><!-- regDt --></th>
                    <td>
                        <input id="reqStartDt" name="reqStartDt" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="custNm" name="custNm" readonly class="form_input form_readonly" />
                        <input type="hidden" id="custCd" name="custCd" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="parReqDocNo" name="sParReqDocNo" readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.giDocRegDt" /><!-- giDocRegDt --></th>
                    <td>
                        <input id="reqDt" name="reqDt" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <input id="serPrsnId" name="serPrsnId" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <input id="carNo" name="carNo" readonly class="form_input form_readonly" />
                        <input type="hidden" id="vinNo" name="vinNo" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="targetGiDetailGrid" class="grid"></div>
    </div>

</section>
<!-- //issueReqConfirm -->
<!-- script -->
<script>
//parGiTpList
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
//TODO:[InBoShim] SR is not push
if("${obj.cmmCd}" !== "SR"){
    parGiTpList.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
}
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCdList
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
//giLocCdList
var giLocCdList = [];
<c:forEach var="obj" items="${giLocCdList}">
giLocCdList.push({
    "locCd":"${obj.locCd}"
    , "locNm":"${obj.locNm}"
});
</c:forEach>
var giLocCdMap = [];
$.each(giLocCdList, function(idx, obj){
    giLocCdMap[obj.locCd] = obj.locNm;
});
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
                        $("#sItemCd").val(data[0].itemCd);
                    }
                }
            }
        }
    });
}
//page init Func
function pageInit(){
    $("#giDocNo").val("");
    $("#giDocStatCd").val("");
    $("#parGiTp").val("");
    $("#parReqDocNo").val("");
    $("#reqStartDt").val("");
    $("#custNm").val("");
    $("#custCd").val("");
    $("#carNo").val("");
    $("#vinNo").val("");
    $("#serPrsnId").val("");
    $("#reqDt").val("");
    //button enable false
    $("#btnInvConfirm").data("kendoButton").enable(false);
    $("#btnInvCancel").data("kendoButton").enable(false);
}
//selectIssueGiHeaders Func
function selectIssueGiHeaders(){
    $("#targetGiHeaderGrid").data("kendoExtGrid").dataSource.read();
    $("#targetGiDetailGrid").data("kendoExtGrid").dataSource.data([]);
}
//updateIssueGiDetails Func
function updateIssueGiDetails(giDocStatCd){
    var grid = $("#targetGiDetailGrid").data("kendoExtGrid");
    rows = grid.dataSource.data();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(grid.gridValidation()){
        if(rowCnt == 0){
            dms.notification.info("<spring:message code='global.info.required.change'/>");
            return;
        }
        //checked list
        $.each(rows, function(idx, row){
            row.giDocStatCd = giDocStatCd;
            dateItems.push(row);
        });

        var multiIssueGiDetails = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/ism/issueReq/multiIssueReqDetailConfirms.do' />"
            ,data:JSON.stringify(multiIssueGiDetails)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                grid.dataSource.read();
                $("#targetGiHeaderGrid").data("kendoExtGrid").dataSource.read();
                //buttonEnableDisable Func call
                buttonEnableDisable(giDocStatCd);
                if(giDocStatCd == "02"){
                    //releaseComf message
                    dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                }else if(giDocStatCd == "03"){
                    //releaseComfCanc message
                    dms.notification.success("<spring:message code='par.lbl.releaseComfCanc' var='releaseComfCanc' /><spring:message code='global.info.successMsg' arguments='${releaseComfCanc}' />");
                }
            }
        });
    }else{
        //input value check message
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//buttonEnableDisable Func
function buttonEnableDisable(giStatCd){
    $("#btnInvConfirm").data("kendoButton").enable(false);
    $("#btnInvCancel").data("kendoButton").enable(false);
    if(giStatCd == "02"){//releaseComf
        $("#btnInvCancel").data("kendoButton").enable(true);
    }else if(giStatCd == "03"){//releaseComfCanc
        $("#btnInvConfirm").data("kendoButton").enable(true);
    }else if(giStatCd == "01"){//release
        $("#btnInvConfirm").data("kendoButton").enable(true);
        $("#btnInvCancel").data("kendoButton").enable(true);
    }
}

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                //sReqEndDt is not empty value
                if($("#sReqEndDt").val() != ""){
                    //sReqStartDt is empty value
                    if($("#sReqStartDt").val() == ""){
                        //regStartDt check message
                        dms.notification.info("<spring:message code='par.lbl.regStartDt' var='regStartDt' /><spring:message code='global.info.emptyCheckParam' arguments='${regStartDt}' />");
                        return false;
                    }
                }
                //selectIssueGiHeaders Func call
                selectIssueGiHeaders();
            }
        });
        //btnInvConfirm
        $("#btnInvConfirm").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueGiDetails Func call
                updateIssueGiDetails("02");
            }
        });
        //btnInvCancel
        $("#btnInvCancel").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueGiDetails Func call
                updateIssueGiDetails("03");
            }
        });
        //sParGiTp
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sGiDocStatCd
        $("#sGiDocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sReqStartDt
        $("#sReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sReqEndDt
        $("#sReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //targetGiHeaderGrid
        $("#targetGiHeaderGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqConfirms.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sParGiTp"] = $("#sParGiTp").val();
                            params["sParReqDocNo"] = $("#sParReqDocNo").val();
                            params["sGiDocNo"] = $("#sGiDocNo").val();
                            params["sGiDocStatCd"] = $("#sGiDocStatCd").val();

                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();

                            params["sCustCd"] = $("#sCustCd").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sSerPrsnId"] = $("#sSerPrsnId").val();
                            params["sCarNo"] = $("#sCarNo").val();

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
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,cancYn:{ type:"string" }
                            ,parReqDocNo:{ type:"string" }
                            ,roDocNo:{ type:"string" }
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string" }
                            ,custCd:{ type:"string" }
                            ,custNm:{ type:"string" }
                            ,vinNo:{ type:"string" }
                            ,carNo:{ type:"string" }
                            ,mvtDocYyMm:{ type:"string" }
                            ,mvtDocNo:{ type:"string" }
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
            ,height:200
            ,multiSelectWithCheckbox:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){

                    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);
                    //buttonEnableDisable Func call
                    buttonEnableDisable(selectedItem.giDocStatCd);

                    $("#giDocNo").val(selectedItem.giDocNo);
                    $("#giDocStatCd").val(partsParReqStatCdMap[selectedItem.giDocStatCd]);
                    $("#parReqDocNo").val(selectedItem.parReqDocNo);
                    $("#parReqStatCd").val(partsParReqStatCdMap[selectedItem.parReqStatCd]);
                    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));
                    //mvtDocNo and selectedItem.mvtDocNo is not empty reqDt set updtDt value
                    if(selectedItem.mvtDocNo != null && $.trim(selectedItem.mvtDocNo) != "" ){
                        $("#reqDt").val(kendo.toString(kendo.parseDate(selectedItem.updtDt), "<dms:configValue code='dateFormat' />"));
                    }
                    else{
                        $("#reqDt").val("");
                    }
                    $("#custCd").val(selectedItem.custCd);
                    $("#custNm").val(selectedItem.custNm);
                    $("#carNo").val(selectedItem.carNo);
                    $("#vinNo").val(selectedItem.vinNo);
                    $("#serPrsnId").val(selectedItem.serPrsnId);
                    //targetGiDetailGrid data clear
                    $("#targetGiDetailGrid").data("kendoExtGrid").dataSource.data([]);
                    //targetGiDetailGrid data clear
                    $("#targetGiDetailGrid").data("kendoExtGrid").dataSource.read();
                }
             }
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 } //rnum
                ,{ field:"giDocStatCd", title:"<spring:message code='par.lbl.giDocStatCd'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.giDocStatCd){
                            case "02" ://releaseConfirm
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                            case "03" ://releaseCanc
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                            default ://release
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                 }//giDocStatCd
                ,{ field:"regDt", title:"<spring:message code='par.lbl.giRegDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }     //regDt
                ,{ field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:150 }                                                         //giDocNo
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR" :// SR
                                spanObj = "<span class='txt_label bg_yellow'>"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO" :// RO
                                spanObj = "<span class='txt_label bg_green'>"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default :// request
                                spanObj = "<span class='txt_label bg_gray'>"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"parReqDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:150 } //parReqDocNo
                ,{ field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:100 }           //custNm
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }             //carNo
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.serPrsnId'/>", width:100 }     //serPrsnId
            ]
        });
        //targetGiDetailGrid
        $("#targetGiDetailGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailConfirms.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            var giDocNo = $("#giDocNo").val() == "" ? "X":$("#giDocNo").val();
                            params["sGiDocNo"] = giDocNo;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"giDocNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,giDocNo:{ type:"string", validation:{required:true}, editable:false }
                            ,giDocLineNo:{ type:"string", validation:{required:true}, editable:false }
                            ,giDocStatCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string", validation:{required:true} }
                            ,giLocCd:{ type:"string", validation:{required:true} }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,giQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,mvtDocYyMm:{ type:"string" , validation:{required:true}, editable:false }
                            ,mvtDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,mvtDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,custCd:{ type:"string", validation:{required:true} }
                            ,custNm:{ type:"string", validation:{required:true} }
                        }
                    }
                }
            }
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"giDocStatCd", title:"<spring:message code='par.lbl.statNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.giDocStatCd){
                            case "02"://releaseConfirm
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                            case "03"://releaseCanc
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                            default: //release
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//giDocStatCd
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:150 }                               //itemCd
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:250 }                               //itemNm
                ,{ field:"unitCd", title:"<spring:message code='par.lbl.unitNm'/>", width:50 }                                //unitCd
                ,{ field:"giQty", title:"<spring:message code='par.lbl.giQty'/>", attributes:{"class":"ar"}, width:80 }    //giQty
                ,{ field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd'/>"
                    ,width:150
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        });
                    }
                    ,template:"#if(giStrgeCd != null){# #= giStrgeCdMap[giStrgeCd] # #}#"
                }//giStrgeCd
                ,{ field:"giLocCd", title:"<spring:message code='par.lbl.giLocCd'/>"
                    ,width:150
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"locNm",
                            dataValueField:"locCd",
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            dataSource:giLocCdList
                        });
                    }
                    ,template:"#if(giLocCd != null){# #= giLocCdMap[giLocCd] # #}#"
                }//giLocCd
            ]
        });
    });
</script>
<!-- //script -->

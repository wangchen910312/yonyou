<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- issueReq -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.issueReqMng" /> --%><!-- issueReqMng --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!-- search -->
            </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqStatNm" /><!-- parReqStatNm --></th>
                    <td>
                        <input id="sParReqStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.regDt" /><!-- regDt --></th>
                    <td>
                        <input id="sReqStartDt" style="width:45%" /> ~
                        <input id="sReqEndDt" style="width:45%" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNo" /><!-- custNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCustCd" name="sCustCd" class="form_input" />
                                <a href="#"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <div class="form_search">
                            <input id="sSerPrsnId" name="sSerPrsnId" class="form_input" />
                                <a href="#"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                                <a href="#"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row">&nbsp;</th>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="targetReqHeaderGrid" ></div>
        </div>
    </section>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.issueReqInfo" /><!-- issueReqInfo --></h2>
            <div class="btn_right">
                <button id="btnOrderReq" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.orderReq" /><!-- btnOrderReq --></button>
                <button id="btnResvReq" class="btn_s btn_delete btn_s_min5"><spring:message code="par.btn.resvReq" /><!-- btnResvReq --></button>
                <button id="btnInvReq" class="btn_s btn_delete btn_s_min5"><spring:message code="par.btn.invReq" /><!-- btnInvReq --></button>
            </div>
    </div>

    <div class="table_form form_width_70per">
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
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="parGiTp" name="parGiTp" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="parReqDocNo" name="sParReqDocNo" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqStatNm" /><!-- parReqStatNm --></th>
                    <td>
                        <input id="parReqStatCd" name="parReqStatCd" readonly class="form_input form_readonly" />
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
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <input id="carNo" name="carNo" readonly class="form_input form_readonly" />
                        <input type="hidden" id="vinNo" name="vinNo" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <input id="serPrsnId" name="serPrsnId" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row">&nbsp;</th>
                    <td>
                        &nbsp;
                    </td>
                    <th scope="row">&nbsp;</th>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="targetReqDetailGrid" ></div>
        </div>
    </section>

</section>
<!-- //issueReq -->

<!-- script -->
<script>
//parGiTpList
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCdList
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
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
    $("#parGiTp").val("");
    $("#parReqDocNo").val("");
    $("#parReqStatCd").val("");
    $("#reqStartDt").val("");
    $("#custNm").val("");
    $("#custCd").val("");
    $("#carNo").val("");
    $("#vinNo").val("");
    $("#serPrsnId").val("");
    //button enable false
    $("#btnOrderReq").data("kendoButton").enable(false);
    $("#btnResvReq").data("kendoButton").enable(false);
    $("#btnInvReq").data("kendoButton").enable(false);
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag){
    $("#btnOrderReq").data("kendoButton").enable(false);
    $("#btnResvReq").data("kendoButton").enable(false);
    $("#btnInvReq").data("kendoButton").enable(false);

    if(bFlag){
        $("#btnResvReq").data("kendoButton").enable(true);
    }else{
        $("#btnOrderReq").data("kendoButton").enable(true);
        $("#btnInvReq").data("kendoButton").enable(true);
    }
}
//updateIssuePartsResves Func
function updateIssuePartsResves(){
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
        //checked list
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
                grid.dataSource.read();
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                //resv success message
                dms.notification.success("<spring:message code='par.lbl.resv' var='resv' /><spring:message code='global.info.successMsg' arguments='${resv}' />");
            }
        });
    }else{
        //input value check
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
        //checked list
        $.each(rows, function(idx, row){
            dateItems.push(grid.dataItem(row));
        });

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
                grid.dataSource.read();
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                //order reqeust success message
                dms.notification.success("<spring:message code='par.lbl.orderReq' var='orderReq' /><spring:message code='global.info.successMsg' arguments='${orderReq}' />");
            }
        });
    }else{
        //input value check message
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsInves Func
function updateIssuePartsInves(){
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
        //checked list
        $.each(rows, function(idx, row){
            dateItems.push(grid.dataItem(row));
        });

        var issuePartsOutVO = {
                dlrCd:""
                ,giDocNo:dateItems[0].giDocNo
                ,giDocTp:"01"
                ,giDocStatCd:"01"
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
                //parts out success message
                dms.notification.success("<spring:message code='par.lbl.giReg' var='giReg' /><spring:message code='global.info.successMsg' arguments='${giReg}' />");

            }
        });
    }else{
        //input value check message
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                //sReqEndDt is not empty value
                if($("#sReqEndDt").val() != ""){
                    //sReqEndDt is empty value
                    if($("#sReqStartDt").val() == ""){
                        //sReqEndDt check message
                        dms.notification.info("<spring:message code='par.lbl.regStartDt' var='regStartDt' /><spring:message code='global.info.emptyCheckParam' arguments='${regStartDt}' />");
                        return false;
                    }
                }
                //targetReqHeaderGrid datasource read
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnOrderReq
        $("#btnOrderReq").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsRoes Func call
                updateIssuePartsRoes();
            }
        });
        //btnResvReq
        $("#btnResvReq").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsResves Func call
                updateIssuePartsResves();
            }
        });
        //btnInvReq
        $("#btnInvReq").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsInves Func call
                updateIssuePartsInves();
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
        //sParReqStatCd
        $("#sParReqStatCd").kendoExtDropDownList({
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
        //targetReqHeaderGrid
        $("#targetReqHeaderGrid").kendoExtGrid({
            gridId:"G-PAR-0808-152702"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sParGiTp"] = $("#sParGiTp").val();
                            params["sParReqDocNo"] = $("#sParReqDocNo").val();
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();
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
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){

                    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);

                    if(selectedItem.parGiTp == "SR") //SR
                        buttonEnableDisable(true);
                    else
                        buttonEnableDisable(false);

                    $("#parReqDocNo").val(selectedItem.parReqDocNo);
                    $("#parReqStatCd").val(partsParReqStatCdMap[selectedItem.parReqStatCd]);

                    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));
                    $("#custCd").val(selectedItem.custCd);
                    $("#custNm").val(selectedItem.custNm);
                    $("#carNo").val(selectedItem.carNo);
                    $("#vinNo").val(selectedItem.vinNo);
                    $("#serPrsnId").val(selectedItem.serPrsnId);
                    //targetReqDetailGrid datasource read
                    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
                }
            }
            ,dataBound:function(e) {
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.data([]);
            }
            ,height:295
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"parReqStatCd", title:"<spring:message code='par.lbl.statNm'/>"
                    ,width:80
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
                            default: // request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parReqStatCd
                ,{ field:"regDt", title:"<spring:message code='par.lbl.reqDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR":// SR
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO":// RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // request
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"parReqDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:150 }//parReqDocNo
                ,{ field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:100 }//custNm
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{ field:"carlineCd", title:"<spring:message code='par.lbl.carLine'/>", width:100 }//carlineCd
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.serPrsnId'/>", width:100 }//serPrsnId
                ,{ field:"bigo", title:"<spring:message code='par.lbl.remark'/>", width:100 }//bigo
                ]
        });
        //targetReqDetailGrid
        $("#targetReqDetailGrid").kendoExtGrid({
            gridId:"G-PAR-0808-152703"
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
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,calmStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e)
            {
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        // 요청상태:완료
                        if(dataItem.parReqStatCd !== "01"){
                            var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                            multiCheckBox.remove();
                        }

                        // TODO:[InBoShim] cell add remove class
                        /* var reqQty = row.children().eq(6);
                        reqQty.addClass("bg_blue");

                        var endQty = row.children().eq(7);
                        // endQty <> reqQty or endQty  <> resvQty
                        if(dataItem.endQty != dataItem.reqQty || dataItem.endQty != dataItem.resvQty){
                            endQty.addClass("bg_red");
                        }
                        var avlbStockQty = row.children().eq(8);
                        // avlbStockQty < 0 or avlbStockQty < reqQty
                        if(dataItem.avlbStockQty < 0 || dataItem.avlbStockQty < dataItem.reqQty){
                            avlbStockQty.addClass("bg_red");
                        }
                        var grScheQty = row.children().eq(9);
                        if(dataItem.grScheQty <= 0) // grScheQty  <= 0
                        {
                            grScheQty.addClass("bg_red");
                        }

                        var resvQty = row.children().eq(10);
                        resvQty.addClass("bg_blue"); */
                    }
                });

            }
            ,change:function(e) {
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());

                if( dataItem != null && dataItem != 'undefined'){
                    //parReqStatCd ok removeClass
                    if(dataItem.parReqStatCd !== "01"){
                        $(grid.select()).removeClass("k-state-selected");
                    }
                }
            }
            ,height:250
            ,columns :
                [{ field:"purcReqDt", title:"<spring:message code='par.lbl.reqDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }//purcReqDt
                ,{ field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatCd'/>"
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
                            default: // request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parReqStatCd
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:150 }//itemCd
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:250 }//itemNm
                ,{ field:"unitCd", title:"<spring:message code='par.lbl.unitNm'/>", width:50 }//unitCd
                ,{ field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", attributes:{"class":"ar"}, width:60 }//reqQty
                ,{ field:"endQty", title:"<spring:message code='par.lbl.endQty'/>", attributes:{"class":"ar"}, width:80 }//endQty
                ,{ field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }//avlbStockQty
                ,{ field:"grScheQty", title:"<spring:message code='par.lbl.grScheQty'/>", attributes:{"class":"ar"}, width:90 }//grScheQty
                ,{ field:"resvQty", title:"<spring:message code='par.lbl.purcReqQty'/>", attributes:{"class":"ar"}, width:90
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            spinners:false
                        });
                    }
                    ,template:'#if(resvQty === 0 || resvQty === null){# #= "" # #} else {# #= resvQty # #}#'
                }//resvQty
            ]
        });

    });
</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectStorageMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.stockMovStorage" /> --%><!-- stockMovStorage --></h1>
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            <button class="btn_m btn_init" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
            <button id="btnSearch" class="btn_m btn_search hidden"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:12%;">
                <col style="width:11%;">
                <col style="width:12%;">
                <col style="width:11%;">
                <col style="width:12%;">
                <col style="width:11%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.mvtTp" /></th>
                    <td>
                        <input id="sMvtTp" name="sMvtTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giStrgeCd" /></th>
                    <td>
                        <input id="sOutStrgeCd" name="sOutStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.grStrgeCd" /></th>
                    <td>
                        <input id="sInStrgeCd" name="sInStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.docNo" /></th>
                    <td>
                        <input id="sEtcGiDocNo" name="sEtcGiDocNo" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="btnExcelUpload" class="btn_s btn_add" ><spring:message code="par.btn.uploadExcel" /></button>
                <button type="button" id="btnCopyFromExcel" class="btn_s btn_add"><spring:message code="par.btn.copyFromExcel" /></button>
                <button type="button" id="btnAdd" class="btn_s btn_add"><spring:message code="par.btn.addItem" /></button>
                <button type="button" id="btnDel" class="btn_s btn_del"><spring:message code="par.btn.rowDel" /></button>
            </div>
        </div>
        <div class="table_grid">
            <div id="storageMoveGrid" ></div>
        </div>
    </section>

    <div class="table_form form_width_70per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.remark" />:</th>
                    <td rowspan="3">
                        <textarea id="remark" name="remark" rows="4" class="form_textarea" /></textarea>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.totalQty" />:</th>
                    <td>
                        <span id="itemTotal" name="itemTotal" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.totalAmt" />:</th>
                    <td>
                        <span id="itemTotalPrice" name="itemTotalPrice" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- script -->
<script type="text/javascript">
//mvtTpList
var mvtTpList = [];
<c:forEach var="obj" items="${mvtTpList}">
    mvtTpList.push({cmmCd:"${obj.mvtTp}", cmmCdNm:"${obj.mvtTpNm}"});
</c:forEach>
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
//storge move reason Array
var storgeMoveReasonCdList = [];
<c:forEach var="obj" items="${storgeMoveReasonCdList}">
storgeMoveReasonCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var storgeMoveReasonCdMap = [];
$.each(storgeMoveReasonCdList, function(idx, obj){
    storgeMoveReasonCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//item search Popup Func
var searchStorgeItemPopupWindow;
function selectStorageItemPopupWindow(e){

    if($("#sOutStrgeCd").val() === ""){
        // giStrgeCd check
        dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='global.info.check.field' arguments='${giStrgeCd}' />");
        return;
    }

    searchStorgeItemPopupWindow = dms.window.popup({
        windowId:"searchStorgeItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   //itemInfo
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectStorageItemAvlbPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"autoClose":true
                ,"selectable":"multiple"
                ,"strgeCd":$("#sOutStrgeCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){

                        for(var i=0; i<data.length; i++){
                            console.log("data:"+kendo.stringify(data[i]));
                            var bCheck = false;
                            var grid = $('#storageMoveGrid').data('kendoExtGrid');
                            var checkRows = grid.tbody.find("tr");
                            checkRows.each(function(index, checkRow) {
                                var dataItem = grid.dataItem(checkRow);
                                if(dataItem.itemCd == data[i].itemCd){
                                    bCheck = true;
                                }
                            });

                            if(!bCheck){
                                if(data[i].baseAvlbStockQty > 0){
                                    var total = $("#storageMoveGrid").data("kendoExtGrid").dataSource.total()+1;
                                    BinLocationItemVO = {
                                        rnum:total + 1
                                        ,dlrCd:null
                                        ,etcGiDocNo:$("#sEtcGiDocNo").val()
                                        ,etcGiDocLineNo:total + 1
                                        ,cancYn:"N"
                                        ,itemCd:data[i].itemCd
                                        ,itemNm:data[i].itemNm
                                        ,unitCd:data[i].unitCd
                                        ,strgeStockQty:data[i].baseAvlbStockQty
                                        ,strgeMoveStockQty:1
                                        ,giStrgeCd:data[i].strgeCd
                                        ,giLocCd:data[i].locCd
                                        ,grStrgeCd:$("#sInStrgeCd").val()
                                        ,grLocCd:""
                                        ,grReasonCd:null
                                        ,mvtDocYyMm:""
                                        ,mvtDocNo:""
                                        ,mvtDocLineNo:0
                                    }
                                    $("#storageMoveGrid").data("kendoExtGrid").dataSource.add(BinLocationItemVO).set("dirty", true);
                                }
                            }
                        }

                    }
                }
            }
        }
    });
}
//storage item excel file upload Popup Func
var storageItemExcelUploadPopupWin;
function selectStorgeItemExcelUploadPopupWindow(){

    if($("#sOutStrgeCd").val() === ""){
        // giStrgeCd check
        dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='global.info.check.field' arguments='${giStrgeCd}' />");
        return;
    }

    storageItemExcelUploadPopupWin = dms.window.popup({
        windowId:"storageItemExcelUploadPopupWin"
        ,title:"<spring:message code='par.title.stmMovExcelUpload' />"   //stmMovExcelUpload
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectStorageItemExcelUploadPopup.do'/>"
            ,data:{
                "strgeCd":$("#sOutStrgeCd").val()
                ,"autoClose":true
                ,"callbackFunc":function(data){
                    if(data.length > 0){

                        for(var i=0; i<data.length; i++){
                            //console.log("data:"+kendo.stringify(data[i]));
                            var bCheck = false;
                            var grid = $('#storageMoveGrid').data('kendoExtGrid');
                            var checkRows = grid.tbody.find("tr");
                            checkRows.each(function(index, checkRow) {
                                var dataItem = grid.dataItem(checkRow);
                                if(dataItem.itemCd == data[i].itemCd){
                                    bCheck = true;
                                }
                            });

                            if(!bCheck){
                                if(data[i].avlbStockQty > 0){
                                    var total = $("#storageMoveGrid").data("kendoExtGrid").dataSource.total()+1;
                                    BinLocationItemVO = {
                                        rnum:total + 1
                                        ,dlrCd:null
                                        ,etcGiDocNo:$("#sEtcGiDocNo").val()
                                        ,etcGiDocLineNo:total + 1
                                        ,cancYn:"N"
                                        ,itemCd:data[i].itemCd
                                        ,itemNm:data[i].itemNm
                                        ,unitCd:data[i].unitCd
                                        ,strgeStockQty:data[i].baseAvlbStockQty
                                        ,strgeMoveStockQty:data[i].avlbStockQty
                                        ,giStrgeCd:$("#sOutStrgeCd").val()
                                        ,giLocCd:""
                                        ,grStrgeCd:""
                                        ,grLocCd:""
                                        ,grReasonCd:null
                                        ,mvtDocYyMm:""
                                        ,mvtDocNo:""
                                        ,mvtDocLineNo:0
                                    }
                                    $("#storageMoveGrid").data("kendoExtGrid").dataSource.add(BinLocationItemVO).set("dirty", true);
                                }
                            }
                        }
                    }
                }
            }
        }
    });
}
//page init Func
function pageInit(){
    $("#sMvtTp").data("kendoExtDropDownList").select(11);
    $("#sOutStrgeCd").data("kendoExtDropDownList").select(3);
    $("#sInStrgeCd").data("kendoExtDropDownList").select(3);
    $("#sEtcGiDocNo").val("");
    $("#remark").val("");
    $("#itemTotal").text(0);
    $("#itemTotalPrice").text(0);
    $("#storageMoveGrid").data("kendoExtGrid").dataSource.data([]);
}

$(document).ready(function() {
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            var grid = $("#storageMoveGrid").data("kendoExtGrid");
            rows = grid.dataSource.data();

            var dateItems = [ ];
            var issueGrStrgeCheckCnt = 0;
            var issueGrLocCdCheckCnt = 0;
            var issueStrgeMoveStockQtyCheckCnt = 0;

            //checked list
            $.each(rows, function(idx, row){
                var item = row;
                if(item.grStrgeCd == ""){
                    issueGrStrgeCheckCnt++;
                }
                if(item.strgeStockQty < item.strgeMoveStockQty){
                    issueStrgeMoveStockQtyCheckCnt++;
                }

                dateItems.push(item);
            });

            if(issueGrStrgeCheckCnt > 0){
                // grStrge check message.
                dms.notification.info("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${grStrgeCd}' />");
                return false;
            }

            if(issueStrgeMoveStockQtyCheckCnt > 0){
                // grLocCd check message.
                dms.notification.info("<spring:message code='par.lbl.strgeMoveStockQty' var='strgeMoveStockQty' /><spring:message code='par.lbl.strgeStockQty' var='strgeStockQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${strgeMoveStockQty},${strgeStockQty}' />");
                return false;
            }

            var multiStockMovStorageDetails = grid.getCUDData("insertList", "updateList", "deleteList");
            if(grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            var StockMovStorageSaveVO = {
                "stockMovStorageHeaderVO":{
                    "dlrCd":null
                    ,"etcGiDocNo":$("#sEtcGiDocNo").val()
                    ,"statCd":"01"
                    ,"mvtTp":$("#sMvtTp").val()
                    ,"pltCd":"N"
                    ,"strgeCd":dateItems[0].giStrgeCd
                    ,"locCd":dateItems[0].giLocCd
                    ,"remark":$("#remark").val()
                }
                ,"stockMovStorageDetailVO":multiStockMovStorageDetails
            }

            $.ajax({
                url:"<c:url value='/par/stm/stockMovement/insertStockMovStorageSave.do' />"
                ,data:JSON.stringify(StockMovStorageSaveVO)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    //set etcGiDocNo
                    $("#sEtcGiDocNo").val(jqXHR.stockMovStorageHeaderVO.etcGiDocNo);
                    // destroy data clear and data reload
                    grid.dataSource._destroyed = [];
                    grid.dataSource.read();

                    // success message
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call
            pageInit();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnExcelUpload
    $("#btnExcelUpload").kendoButton({
        click:function(e){
            //selectStorgeItemExcelUploadPopupWindow Func call
            selectStorgeItemExcelUploadPopupWindow();
        }
    });
    //btnCopyFromExcel
    $("#btnCopyFromExcel").kendoButton({
        click:function(e){
            if($("#sOutStrgeCd").val() === ""){
                // giStrgeCd check
                dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='global.info.check.field' arguments='${giStrgeCd}' />");
                return;
            }
            //get excel file copy data.
            var data = dms.string.parseClipboardDataToExcelFormat();

            if(data.length <= 1) {
                //excel copy data empty message.
                dms.notification.info("<spring:message code='par.lbl.excelCopyData' var='excelCopyData' /><spring:message code='par.info.itemInsertNotMsg' arguments='${excelCopyData}' />");
                return false;
            }

            for(var i=0; i<data.length; i++){
                var cells = data[i];

                var sRnum = 1;
                var itemCheckCnt = 0;
                var grid = $("#storageMoveGrid").data("kendoExtGrid");
                grid.tbody.find('>tr').each(function(){
                    var dataItem = grid.dataItem(this);
                    var vRoLineNoFr = dataItem.roLineNo;
                    if(sRnum < vRoLineNoFr){
                        sRnum = vRoLineNoFr;
                    }
                    sRnum = sRnum + 1;
                    if(dataItem.itemCd === cells[0]){
                        itemCheckCnt++;
                    }

                });

                if(itemCheckCnt === 0){
                    var total = $("#storageMoveGrid").data("kendoExtGrid").dataSource.total()+1;

                    $.ajax({
                        url:"<c:url value='/par/stm/stockInOut/selectStockInOutByKey.do' />"
                        ,data:JSON.stringify({sStrgeCd:$("#sOutStrgeCd").val(), sItemCd:cells[0]})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,error:function(jqXHR,status,error){

                        }
                        ,success:function(jqXHR, textStatus){

                            BinLocationItemVO = {
                                rnum:total + 1
                                ,dlrCd:null
                                ,etcGiDocNo:$("#sEtcGiDocNo").val()
                                ,etcGiDocLineNo:total + 1
                                ,cancYn:"N"
                                ,itemCd:jqXHR.itemCd
                                ,itemNm:jqXHR.itemNm
                                ,unitCd:jqXHR.stockUnitCd
                                ,strgeStockQty:jqXHR.avlbStockQty
                                ,strgeMoveStockQty:cells[1]
                                ,giStrgeCd:$("#sOutStrgeCd").val()
                                ,giLocCd:""
                                ,grStrgeCd:""
                                ,grLocCd:""
                                ,grReasonCd:null
                                ,mvtDocYyMm:""
                                ,mvtDocNo:""
                                ,mvtDocLineNo:0
                            }
                            $("#storageMoveGrid").data("kendoExtGrid").dataSource.add(BinLocationItemVO).set("dirty", true);
                        }
                    });

                }
            }

        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
        click:function(e){
            //selectStorageItemPopupWindow Func call
            selectStorageItemPopupWindow();
        }
    });
    //btnDel
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#storageMoveGrid").data("kendoExtGrid");
            var rows = grid.select();
            var rowCnt = rows.length;

            if(rowCnt > 0){
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
            else{
                //delete item select message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //sMvtTp
    $("#sMvtTp").kendoExtDropDownList({
        dataSource:mvtTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:11
    });
    $("#sMvtTp").data("kendoExtDropDownList").enable(false);
    //sOutStrgeCd
    $("#sOutStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:true
        ,index:6
    });
    //sInStrgeCd
    $("#sInStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:true
        ,index:6
    });
    /* //itemTotal
    $("#itemTotal").kendoExtNumericTextBox({
        format:"n2"
        ,spinners:false
    });
    //itemTotalPrice
    $("#itemTotalPrice").kendoExtNumericTextBox({
        format:"n2"
        ,spinners:false
    }); */
    //storageMoveGrid
    $("#storageMoveGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/stm/stockMovement/selectStockMovStorageDetails.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        //console.log("sEtcGiDocNo:"+$("#sEtcGiDocNo").val());
                        var sEtcGiDocNo = $("#sEtcGiDocNo").val() == "" ? "X":$("#sEtcGiDocNo").val();
                        params["sEtcGiDocNo"] = sEtcGiDocNo;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mvtTp"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,etcGiDocNo:{ type:"string", validation:{required:true}, editable:false }
                        ,etcGiDocLineNo:{ type:"number", validation:{required:true}, editable:false }
                        ,cancYn:{ type:"string", validation:{required:true}, editable:false }
                        ,itemCd:{ type:"string", validation:{required:true}, editable:false }
                        ,itemNm:{ type:"string", validation:{required:true}, editable:false }
                        ,unitCd:{ type:"string", validation:{required:true}, editable:false }
                        ,strgeStockQty:{ type:"number" , editable:false}
                        ,strgeMoveStockQty:{ type:"number" , editable:true}
                        ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,giLocCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,grLocCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,grReasonCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,mvtDocYyMm:{ type:"string" , validation:{required:true}, editable:false }
                        ,mvtDocNo:{ type:"string" , validation:{required:true}, editable:false }
                        ,mvtDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
        }
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,dataBound:function(e){
            var vItemTotal = 0;
            var vItemTotalPrice = 0;
            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    vItemTotal += kendo.parseInt(dataItem.strgeMoveStockQty);
                }
            });

            $("#itemTotal").text(vItemTotal);
            $("#itemTotalPrice").text(vItemTotalPrice);
        }
        ,columns:[
            {field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:100 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
            ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm'/>", width:50 }
            ,{field:"strgeStockQty", title:"<spring:message code='par.lbl.strgeStockQty' />", width:80 }//nowSftyStockQty
            ,{field:"strgeMoveStockQty", title:"<spring:message code='par.lbl.strgeMoveStockQty' />", width:80
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"
                        ,spinners:false
                    });
                }
            }//rflSftyStockQty
            ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />", width:80
                ,template:'#if(giStrgeCd !== "" && giStrgeCd !== null){# #= giStrgeCdMap[giStrgeCd]# #}#'
            }//giStrgeCd
            ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:100
                ,template:'#if(giLocCd !== "" && giLocCd !== null){# #= locCdMap[giLocCd]# #}#'
            }//giLocCd
            ,{field:"grStrgeCd", title:"<spring:message code='par.lbl.grStrgeCd' />", width:80
                ,editor:function(container, options){
                    var input = $('<input id="strgeCd" name="grStrgeCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container);

                    input.kendoExtDropDownList({
                        dataTextField:"strgeNm"
                        ,dataValueField:"strgeCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:giStrgeCdList
                    }).appendTo(container);
                }
                ,template:'#if(grStrgeCd !== "" && grStrgeCd !== null){# #= giStrgeCdMap[grStrgeCd]# #}#'
            }//grStrgeCd
            ,{field:"grLocCd", title:"<spring:message code='par.lbl.locId' />", width:80
                ,editor:function(container, options){
                    //location Array
                    var locCdList = [{"locCd":"", "locNm":""}];
                    <c:forEach var="obj" items="${locCdList}">
                    if(options.model.giStrgeCd !== "${obj.strgeCd}" && options.model.grStrgeCd === "${obj.strgeCd}" && options.model.itemCd === "${obj.itemCd}"){
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
                ,template:'#if(grLocCd !== "" && grLocCd !== null){# #= locCdMap[grLocCd]# #}#'
            }//grLocCd
            ,{field:"grReasonCd", title:"<spring:message code='par.lbl.reasonCd' />", width:80
                ,editor:function(container, options){
                    var input = $('<input id="grReasonCd" name="grReasonCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container);

                    input.kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:storgeMoveReasonCdList
                    }).appendTo(container);
                }
                ,template:'#if(grReasonCd !== "" && grReasonCd !== null){# #= storgeMoveReasonCdMap[grReasonCd]# #}#'
            }//grReasonCd
        ]
    });


});

</script>
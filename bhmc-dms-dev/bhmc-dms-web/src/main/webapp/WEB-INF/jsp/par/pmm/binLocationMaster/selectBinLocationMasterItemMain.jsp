<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- location Master Item -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.locMaster" /> --%><!-- locMaster --></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            <button class="btn_m btn_cancel" id="btnCancel" type="button"><spring:message code="par.btn.cancel" /></button><!--btnCancel  -->
        </div>
    </div>

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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.strge" /><!-- strge --></span></th>
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<div class="clfix">
    <!-- content_left -->
    <section class="location_left">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="par.title.locTree" /><!-- locTree  --></h1>
            <div class="btn_right">
                <button id="btnExpand" type="button" class="btn_s btn_up"><spring:message code="par.btn.up" /></button><!-- up  -->
                <button id="btnCollapse" type="button" class="btn_s btn_down"><spring:message code="par.btn.down" /></button><!-- down  -->
            </div>
        </div>
        <div class="table_grid">
            <div id="treelist"></div>
        </div>
    </section>
    <!-- content_left -->
    <!-- content_right -->
    <section class="location_right">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="par.title.locInfo" /><!-- locInfo  --></h1>
            <div class="btn_right">
                <button class="btn_s btn_add btn_s_min5" id="btnAdd" type="button"><spring:message code="par.btn.rowAdd" /></button><!--rowAdd  -->
                <button class="btn_s btn_del btn_s_min5" id="btnDel" type="button"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
            </div>
        </div>
        <div class="table_grid">
            <div id="grid"></div>
        </div>
    </section>
    <!-- content_right -->
</div>

<!-- //location Master Item -->

<!-- script -->
<script>
/**
* checkbox click event
*/
$(document).on("click", ".lmtmngyn-chk", function(e){
     var thisName = $(this).data("name");
     var grid = $("#grid").data("kendoExtGrid"),
     dataItem = grid.dataItem($(e.target).closest("tr"));

     if($(this).is(":checked")){
        dataItem.set(thisName, "Y");
     }else{
        dataItem.set(thisName, "N");
     }
 });
/**
* checkbox click event
*/
$(document).on("click", ".mainlocyn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
});
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
//tree Expanded Func
function treelistExpanded(bFlag){
    var treelist = $("#treelist").data("kendoTreeList");
    var dataItems = treelist.dataSource.data();
    $.each(dataItems, function(idx,item){
        item.expanded = bFlag;
    });
    treelist.dataSource.data(dataItems);
}
//location member
var selectedLocId = null;
var selectedLvlId = 0;
var selectedLocCd = "";
selectedUpperLocId = "";
var selectedItemCd = "";
var selectedMainLocYn = "N";
var selectedLastLvlYn = "N";
//page init Func
function pageInit(){
    selectedLocId = null;
    selectedLvlId = 0;
    selectedLocCd = "";
    selectedUpperLocId = "";
    selectedItemCd = "";
    selectedMainLocYn = "N";
    selectedLastLvlYn = "N";
}
//item search popup Func
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(e){
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
                        var bCheck = false;
                        var grid = $('#grid').data('kendoExtGrid');
                        var dataItemList = grid.dataSource._data;

                        var rows = grid.tbody.find("tr");
                        rows.each(function(index, row) {
                            var dataItem = grid.dataSource._data;

                            for(var i = 0;i < dataItemList.length ;i++){
                                if(dataItemList[i].itemCd !== "" && dataItemList[i].itemCd == data[0].itemCd){
                                    bCheck = true;
                                    break;
                                }
                            }

                            if($(this).hasClass("k-state-selected")){
                                if(!bCheck){
                                    dataItem[index].itemCd = data[0].itemCd;
                                }
                            }
                        });
                        grid.refresh();
                    }
                }
            }
        }
    });
}

$(document).ready(function() {
    //btnExpand
    $("#btnExpand").kendoButton({
        click:function(e){
            treelistExpanded(false);
        }
    });
    //btnCollapse
    $("#btnCollapse").kendoButton({
        click:function(e){
            treelistExpanded(true);
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            //strgeCd value check
            if($("#sStrgeCd").val() != ""){
                pageInit();
                // treelist dataSource read
                treeDataSource.read();

            }else{
                // strgeCd check message
                dms.notification.info("<spring:message code='par.lbl.strge' var='strge' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strge}' />");
            }
        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
        click:function(e){
            //strgeCd value check
            if($("#sStrgeCd").val() != ""){
                //lvlId
                var vLvlId = selectedLvlId + 1;
                var binLocationMasterVO = {
                    "rnum":$('#grid').data('kendoExtGrid').dataSource.total() + 1
                    ,"dlrCd":""
                    ,"locId":""
                    ,"pltCd":""
                    ,"strgeCd":$("#sStrgeCd").val()
                    ,"lvlId":vLvlId
                    ,"locCd":""
                    ,"dbLocCd":""
                    ,"locNm":""
                    ,"upperLocId":selectedLocCd
                    ,"lmtMngYn":"N"
                    ,"itemCd":""
                    ,"maxQty":0
                    ,"remark":""
                    ,"mainLocYn":"N"
                    ,"baseLvlId":vLvlId
                    ,"upperLvlId":selectedLocId
                    ,"avlbStockQty":0
                    ,"resvStockQty":0
                    ,"clamStockQty":0
                    ,"dbYn":"N"
                    ,"lgthCnt":10
                    ,"cdTp":"A"
                    ,"lastLvlYn":""
                    ,"regUsrId":null
                    ,"regDt":null
                    ,"updtUsrId":null
                    ,"updtDt":null
                }
                $('#grid').data('kendoExtGrid').dataSource.insert(0, binLocationMasterVO);
            }else{
                //strge selected message
                dms.notification.info("<spring:message code='par.lbl.strge' var='strge' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strge}' />");
            }
        }
    });
    //btnDel
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var rowCnt = rows.length;

            if(rowCnt > 0){
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
            else{
                //delete item selected message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiBinLocationMasters = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/binLocationMaster/multiBinLocationMasterItems.do' />"
                    ,data:JSON.stringify(multiBinLocationMasters)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();
                        //tree datasource read
                        treeDataSource.read();
                        //success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //input value check message
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });
    //sStrgeCd
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:false
        ,index:0
    });
    //tree datasource
    var treeDataSource = new kendo.data.TreeListDataSource({
        transport:{
            read:{
                url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterTreeLists.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};
                    //strgeCd
                    var sStrgeCd = $("#sStrgeCd").val() == "" ? "X":$("#sStrgeCd").val();
                    params["sStrgeCd"] = sStrgeCd;

                    return kendo.stringify(params);
                }
            }
            ,batch:true
            ,schema:{
                model:{
                    id:"id"
                    ,expanded:true
                }
            }
        }
    });
    //treelist
    $("#treelist").kendoTreeList({
        dataSource:treeDataSource
        ,height:377
        ,selectable:"row"
        ,recorderable:true
        ,change:function(e) {
            var selectedRows = this.select();

            if(selectedRows.length > 0){
                pageInit();
                var dataItem = this.dataItem(selectedRows[0]);
                selectedLocId = dataItem.id;
                selectedLvlId = dataItem.lvlId;
                selectedLocCd = dataItem.locCd;
                selectedUpperLocId = dataItem.parentId;
                selectedMainLocYn = dataItem.mainLocYn;
                selectedLastLvlYn = dataItem.lastLvlYn;

                if(selectedLastLvlYn == "Y"){
                    $('#grid').data('kendoExtGrid').dataSource.read();
                }else{
                    //last level check message
                    dms.notification.info("<spring:message code='par.lbl.lastLocCd' var='lastLocCd' /><spring:message code='global.info.check.field' arguments='${lastLocCd}' />");
                }
            }
        }
        ,columns:[
            { field:"locNm", title:"<spring:message code='par.lbl.locTree'/>" }    //locNm
            ,{ field:"locCd", title:"<spring:message code='par.lbl.locId'/>" }      //locCd
        ]

    });
    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
            autoSync:false
            ,transport:{
                read:{
                    url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        //strgeCd
                        var sStrgeCd = $("#sStrgeCd").val() == "" ? "X":$("#sStrgeCd").val();
                        params["sStrgeCd"] = sStrgeCd;
                        params["sMaxLvlId"] = selectedLvlId;
                        params["sUpperLocId"] = selectedLocCd;
                        params["sMainLocYn"] = "N";
                        params["sItemCdNullYn"] = "N";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"locId"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,locId:{ type:"string" , validation:{required:true} }
                        ,pltCd:{ type:"string" , validation:{required:true} }
                        ,strgeCd:{ type:"string" , validation:{required:true} }
                        ,lvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,locCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,dbLocCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,locNm:{ type:"string" , validation:{required:true} }
                        ,upperLocId:{ type:"string" , editable:false }
                        ,lmtMngYn:{ type:"string", defaultValue:"Y", editable:true }
                        ,mainLocYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,itemCd:{ type:"string", editable:true }
                        ,maxQty:{ type:"number"}
                        ,remark:{ type:"string" }
                        ,upperLvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,avlbStockQty:{ type:"number"}
                        ,resvStockQty:{ type:"number"}
                        ,clamStockQty:{ type:"number"}
                        ,dbYn:{ type:"string" , defaultValue:"N" }
                        ,lgthCnt:{ type:"number" }
                        ,cdTp:{ type:"string" }
                        ,lastLvlYn:{ type:"string" }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,pageable:false
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if (e.model.dbYn == "Y") {
                if(fieldName=="locId"){
                    this.closeCell();
                }
            }

            if (e.model.lastLvlYn == "Y") {
                if(fieldName=="itemCd"){
                    this.closeCell();
                }
            }

            if(fieldName=="lmtMngYn"){
                this.closeCell();
            }

            if(fieldName=="mainLocYn"){
                this.closeCell();
            }
        }
        ,selectable:"row"
        ,editable:true
        ,sortable:false
        ,multiSelectWithCheckbox:false
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem.dbYn === "N"){
                    //row add cell foucs
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(3)");
                    sender.editCell(cellToEdit);
                }
            }
        }
        ,columns:[
            { field:"lvlId", title:"<spring:message code='par.lbl.lvlId'/>", width:70 }                                                   //lvlId
            ,{ field:"locCd", title:"<spring:message code='par.lbl.locId'/>",  width:70, hidden:true }                                  //locCd
            ,{ field:"upperLocId", title:"<spring:message code='par.lbl.locId'/>", width:100, headerAttributes:{ "colspan":"2" }}     //upperLocId
            ,{ field:"locId", title:"", width:200, headerAttributes:{ "style":"display:none" }
                ,editor:function(container, options){
                    var strAlpaCdTp = "L";
                    var strAllCdTp = "C";
                    var strMask = "";
                    var iLgthCnt = options.model.lgthCnt;
                    var cdTp = options.model.cdTp;

                    if(cdTp == "N"){
                        strCdTp = "0";
                    }else if(cdTp == "U" || cdTp == "L"){
                        strCdTp = strAlpaCdTp;
                    }else{
                        strCdTp = strAllCdTp;
                    }

                    for(var i = 0; i < iLgthCnt;i++){
                        strMask += strCdTp;
                    }

                    $('<input required name="locId" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:strMask
                        ,promptChar:" "
                    })
                    .bind("keyup", function(){
                        var that = $(this).data("kendoMaskedTextBox");
                        if (cdTp == "U") {
                            this.value = that.raw().toUpperCase();
                        } else if (cdTp == "L") {
                            this.value = that.raw().toLowerCase();
                        } else {
                            this.value = that.raw();
                        }
                    });
                }
            }//locId
            ,{ field:"locNm", title:"<spring:message code='par.lbl.locNm'/>", width:120 }//locNm
            ,{ field:"itemCd", title:"<spring:message code='par.lbl.mgrItemCd'/>"
                ,width:150
                ,editor:function(container, options){
                    $('<div class="form_search" style="width:100%"><input required data-bind="value:' + options.field + '" readonly="readonly" class="form_input" style="width:100%"  /><a href="#" onclick="javascript:selectPartsMasterPopupWindow(this);"></a></div>').appendTo(container);
                }

            }//itemCd
            ,{ field:"maxQty", title:"<spring:message code='par.lbl.maxQty'/>", width:100 }//maxQty
            ,{ field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", width:100 }//avlbStockQty
            ,{ field:"resvStockQty", title:"<spring:message code='par.lbl.resvStockQty'/>", width:100 }//resvStockQty
            ,{ field:"clamStockQty", title:"<spring:message code='par.lbl.clamStockQty'/>", width:100 }//clamStockQty
        ]
    });

});
</script>
<!-- //script -->


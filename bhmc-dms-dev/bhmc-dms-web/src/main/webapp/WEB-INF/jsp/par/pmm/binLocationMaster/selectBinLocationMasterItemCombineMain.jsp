<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- location Level  -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.locDefine" /></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11534" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnInit01" name="btnInit01" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11533" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnAdd01" name="btnAdd01" class="btn_m btn_m_min btn_add"><spring:message code="par.btn.add" /></button><!--btnAdd  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11532" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnDel01" name="btnDel01" class="btn_m btn_m_min btn_del"><spring:message code="par.btn.del" /></button><!--btnDel  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11531" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave01" name="btnSave01" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.confirm" /></button><!--btnSave  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11530" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch01" name="btnSearch01" class="btn_m btn_search" ><spring:message code="par.btn.search" /></button><!--btnSearch  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11524" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnCancel01" name="btnCancel01" class="btn_m btn_m_min btn_cancel hidden"><spring:message code="par.btn.cancel" /></button><!--btnCancel -->
        </dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="gridDefine" class="grid"></div>
    </div>
</section>
<!-- //location Level -->

<!-- location Master Item -->
<section class="group">
    <div class="header_area">
        <div class="btn_left">
        <dms:access viewId="VIEW-D-11529" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnInit02" name="btnInit02" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
        </dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11528" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnAdd02" name="btnAdd02" class="btn_m btn_add btn_m_min"><spring:message code="par.btn.rowAdd" /></button><!--rowAdd  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11527" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnDel02" name="btnDel02" class="btn_m btn_del btn_m_min"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11526" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave02" name="btnSave02" class="btn_m btn_save btn_m_min"><spring:message code="par.btn.confirm" /></button><!--btnSave  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11525" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch02" name="btnSearch02" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11523" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnCancel02" name="btnCancel02" class="btn_m btn_cancel btn_m_min hidden"><spring:message code="par.btn.cancel" /></button><!--btnCancel  -->
        </dms:access>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch02">
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
                    <th scope="row"><spring:message code="par.lbl.locStrgeCd" /><!-- strge --></th>
                    <td>
                        <input id="sStrgeCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.locStrgeNm" /></th>
                    <td>
                        <input id="sStrgeNm" class="form_input" />
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- //창고조회 -->
    <div class="table_grid mt10">
        <div id="gridStrge" class="grid"></div>
    </div>

</section>

<div class="clfix">
    <!-- content_left -->
    <section class="location_left">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="par.title.locTree" /><!-- locTree  --></h1>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11522" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExpand" name="btnExpand" class="btn_s btn_up"><spring:message code="par.btn.up" /></button><!-- up  -->
            </dms:access>
            <dms:access viewId="VIEW-D-11521" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCollapse" name="btnCollapse" class="btn_s btn_down"><spring:message code="par.btn.down" /></button><!-- down  -->
            </dms:access>
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

            </div>
        </div>
        <div class="table_grid mt2">
            <div id="gridLoc" class="grid"></div>
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
     var grid = $("#gridLoc").data("kendoExtGrid"),
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
    var grid = $("#gridLoc").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
});

//locationTpCdList
var locationTpCdList = [];
<c:forEach var="obj" items="${locationTpCdList}">
locationTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//locationTpCdMap
var locationTpCdMap = {};
$.each(locationTpCdList, function(idx, obj){
    locationTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//useYnCdList
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//useYnCdMap
var useYnCdMap = {};
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
//strgeTpList
var strgeTpList = [];
<c:forEach var="obj" items="${strgeTpList}">
strgeTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//strgeTpMap
var strgeTpMap = {};
$.each(strgeTpList, function(idx, obj){
    strgeTpMap[obj.cmmCd] = obj.cmmCdNm;
});
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
var selectedLocId = null,
selectedLvlId = 0,
selectedLocCd = "",
selectedUpperLocId = "",
selectedItemCd = "",
selectedMainLocYn = "N",
selectedStrgeRow = {},
seletedTreeItems = {};
//page init Func
function pageInit(){
    selectedLocId = null;
    selectedLvlId = 0;
    selectedLocCd = "";
    selectedUpperLocId = "";
    selectedItemCd = "";
    selectedMainLocYn = "N";
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
                        var checkRows = grid.tbody.find("tr");
                        checkRows.each(function(index, checkRow) {
                            var dataItem = grid.dataItem(checkRow);
                            if(dataItem.itemCd == data[0].itemCd){
                                bCheck = true;
                            }
                        });

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
                                }
                            });
                            grid.refresh();
                        }else{
                            //already message
                            dms.notification.info("<spring:message code='global.info.already' />");
                        }
                    }
                }
            }
        }
    });
}

$(document).ready(function() {

    //btnInit01
    $("#btnInit01").kendoButton({
        click:function(e){
            $('#gridDefine').data('kendoExtGrid').cancelChanges();
        }
    });
    //btnInit02
    $("#btnInit02").kendoButton({
        click:function(e){
            $('#sStrgeCd').val("");
            $('#sStrgeNm').val("");
        }
    });


    //btnAdd01
    $("#btnAdd01").kendoButton({
        click:function(e){
            var rowCnt = $("#gridDefine").data("kendoExtGrid").dataSource.total();
            $("#gridDefine").data("kendoExtGrid").dataSource.insert(0, {
                "dlrCd":""
                ,"lvlId":rowCnt+1
                ,"lvlTxt":""
                ,"lgthCnt":0
                ,"cdTp":""
                ,"lastLvlYn":"N"
                ,"dbYn":"N"
                ,"remark":""
                ,"regUsrId":null
                ,"regDt":null
                ,"updtUsrId":null
                ,"updtDt":null
            });
        }
    });
    //btnDel01
    $("#btnDel01").kendoButton({
        click:function(e){
            var grid = $("#gridDefine").data("kendoExtGrid");
            var rows = grid.select();
            var rowCnt = rows.length;

            if(rowCnt > 0){
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
            else{
                // delete item check message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //btnSave01
    $("#btnSave01").kendoButton({
        click:function(e){

            var grid = $("#gridDefine").data("kendoExtGrid"),
            rows = grid.dataSource.data(),
            lastLvlYnCnt = 0;

            if(grid.gridValidation()){
                var multiItemGroups = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                //checked list
                $.each(rows, function(idx, row){
                    var item = row;
                    item.lastLvlYn = "N";//최종레벨N처리.
                });

                $.ajax({
                    url:"<c:url value='/par/pmm/binLocationMaster/multiBinLocationDefines.do' />"
                    ,data:JSON.stringify(multiItemGroups)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
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
    //btnCancel01
    $("#btnCancel01").kendoButton({
        click:function(e){
            $('#gridDefine').data('kendoExtGrid').cancelChanges();
        }
    });
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
    //btnSearch01
    $("#btnSearch01").kendoButton({
        click:function(e){
            $("#gridDefine").data("kendoExtGrid").dataSource.read();
        }
    });
    //btnSearch02
    $("#btnSearch02").kendoButton({
        click:function(e){
            $("#gridStrge").data("kendoExtGrid").dataSource.read();
        }
    });
    //btnAdd02
    $("#btnAdd02").kendoButton({
        click:function(e){
            //strgeCd value check
            if(selectedStrgeRow.strgeCd != undefined){

                //lvlId
                var vLvlId = selectedLvlId + 1;

                $.ajax({
                    url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationDefineByKey.do' />"
                    ,data:JSON.stringify({"sLvlId": vLvlId})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){

                        var insertLocData = {
                                "rnum":$('#gridLoc').data('kendoExtGrid').dataSource.total() + 1
                                ,"dlrCd":""
                                ,"locId":""
                                ,"pltCd":""
                                ,"strgeCd":selectedStrgeRow.strgeCd
                                ,"lvlId":vLvlId
                                ,"lvlTxt":jqXHR.lvlTxt
                                ,"locCd":""
                                ,"dbLocCd":selectedLocCd
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
                                ,"lgthCnt":jqXHR.lgthCnt
                                ,"cdTp":jqXHR.cdTp
                                ,"lastLvlYn":""
                                ,"regUsrId":null
                                ,"regDt":null
                                ,"updtUsrId":null
                                ,"updtDt":null
                                ,"cudType": 'C'
                        };

                        fnNewLocPopupWindow(insertLocData);
                    }
                });



            }else{
                //strge selected message
                dms.notification.info("<spring:message code='par.lbl.strge' var='strge' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strge}' />");
            }
        }
    });
    //btnDel02
    $("#btnDel02").kendoButton({
        click:function(e){
            var grid      = $("#gridLoc").data("kendoExtGrid"),
                rows      = grid.select(),
                l_rowData = grid.dataItem(rows[0]),
                rowCnt    = rows.length;

            if(rowCnt > 1){
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }else if(rowCnt === 0){
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }else{
                deleteObj = {
                        strgeCd:l_rowData.strgeCd
                       ,dbLocCd:l_rowData.dbLocCd
                       ,lvlId:l_rowData.lvlId
                       ,cudType: 'D'
                };

                dms.window.confirm({
                    message:"<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmsMsg' arguments='"+l_rowData.dbLocCd+",${del}'/>"
                   ,title :"<spring:message code='global.lbl.info' />"
                   ,callback:function(result){
                        if(result){
                            //확인버튼 클릭 로직
                            $.ajax({
                                url:"<c:url value='/par/pmm/binLocationMaster/callSpParLocationUpdate.do' />"
                                ,data:JSON.stringify(deleteObj)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.warning("<spring:message code='par.lbl.childLocId' var='childLocId' /><spring:message code='par.info.itemInsertUseMsg' arguments='${childLocId}'/>");
                                    grid.cancelChanges();
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
                            //취소버튼 클릭 로직
                            grid.cancelChanges();
                            return false;
                        }
                    }
                });

            }
        }
    });
    //btnSave02
    $("#btnSave02").kendoButton({
        click:function(e){

            var grid = $("#gridLoc").data("kendoExtGrid"),
                rows = grid.select(),
                l_rowData = grid.dataItem(rows[0]),
                saveBinLocationMasters;

                saveBinLocationMasters = l_rowData;

                //신규 생성 시
                if(!dms.string.isEmpty(saveBinLocationMasters.cudType)){
                    saveBinLocationMasters.dbLocCd = l_rowData.upperLocId;
                    $.ajax({
                        url:"<c:url value='/par/pmm/binLocationMaster/callSpParLocationUpdate.do' />"
                        ,data:JSON.stringify(saveBinLocationMasters)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){

                            dms.notification.warning("<spring:message code='par.lbl.locId' var='locId' /><spring:message code='par.info.itemInsertMsg' arguments='${locId}'/>");
                            grid.cancelChanges();
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
                    saveBinLocationMasters.cudType = 'U';
                    dms.window.confirm({
                        message:"<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.cnfrmsMsg' arguments='"+l_rowData.dbLocCd+",${save}'/>"
                       ,title :"<spring:message code='global.lbl.info' />"
                       ,callback:function(result){
                            if(result){
                                //확인버튼 클릭 로직
                                $.ajax({
                                    url:"<c:url value='/par/pmm/binLocationMaster/callSpParLocationUpdate.do' />"
                                    ,data:JSON.stringify(saveBinLocationMasters)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR,status,error){
                                        dms.notification.warning("<spring:message code='par.lbl.locId' var='locId' /><spring:message code='par.info.itemInsertMsg' arguments='${locId}'/>");
                                        grid.cancelChanges();
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
                                //취소버튼 클릭 로직
                                grid.cancelChanges();
                                return false;
                            }
                        }
                    });
                }
        }
    });
    //btnCancel02
    $("#btnCancel02").kendoButton({
        click:function(e){
            $('#gridLoc').data('kendoExtGrid').cancelChanges();
        }
    });
    //gridDefine
    $("#gridDefine").kendoExtGrid({
        gridId:"G-PAR-0928-164001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationDefines.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"lvlId"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,lvlId:{ type:"number" , validation:{required:true} , editable:true }
                        ,lvlTxt:{ type:"string" , validation:{required:true, min:0} , editable:true }
                        ,lgthCnt:{ type:"number", defaultValue:0 , validation:{required:true, min:0} , editable:true }
                        ,cdTp:{ type:"string" , validation:{required:true} }
                        ,lastLvlYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,dbYn:{ type:"string" , defaultValue:"N" }
                        ,remark:{ type:"string" , editable:true }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if (!e.model.isNew()) {
                if(fieldName=="lvlId"){
                    this.closeCell();
                }
            }
            e.container.find("input[name='length']").attr('maxlength', '2');
        }
        ,pageable:false
        ,height:150
        ,selectable:"multiple,row"
        ,multiSelectWithCheckbox:false
        ,autoBind:true
        ,appendEmptyColumn:true//empty column. default:false
        ,filterable:false
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();
            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem.dbYn === "N"){
                    // row cell focus
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(1)");
                    sender.editCell(cellToEdit);
                }
            }

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
            });

        }
        ,columns:[
            { field:"lvlId", title:"<spring:message code='par.lbl.lvlId' />", width:120,attributes:{"class":"bg_white"} }     //lvlId
            ,{ field:"lvlTxt", title:"<spring:message code='par.lbl.lvlTxt' />", width:150,attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="lvlTxt" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "30" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                    });
                }
            }  //lvlTxt
            ,{ field:"lgthCnt", title:"<spring:message code='par.lbl.lgthCnt' />"
                ,width:150
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input data-value-field="lgthCnt" data-bind="value:' + options.field + '" maxlength="2" style="width:100%" />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:2
                        ,format:"{0:n0}"
                        ,spinners:false
                    });
                }
            }//lgthCnt
            ,{ field:"cdTp", title:"<spring:message code='par.lbl.cdTp' />"
                ,width:150
                ,attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:locationTpCdList
                    });
                }
                ,template:'#if(cdTp !== ""){# #= locationTpCdMap[cdTp]# #}#'
            }//cdTp
            ,{ field:"remark", title:"<spring:message code='par.lbl.remark' />", width:300,attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="lvlTxt" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "100" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                    });
                }
            }//remark
        ]
    });

    //gridStrge
    $("#gridStrge").kendoExtGrid({
        gridId:"G-PAR-0928-174301"
        ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/cmm/cmp/storage/selectStorages.do' />"
                }
                ,parameterMap:function(options, operation)
                {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sStrgeCd"] = $("#sStrgeCd").val();
                        params["sStrgeNm"] = $("#sStrgeNm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}}
                        ,pltCd:{type:"string", validation:{required:true}}
                        ,pltNm:{type:"string", validation:{required:true}, editable:false}
                        ,strgeCd:{type:"string", validation:{required:true}}
                        ,strgeNm:{type:"string", validation:{required:true}}
                        ,netingUseYn:{type:"string", validation:{required:true}}
                        ,locMngYn:{type:"string", validation:{required:true}}
                        ,strgeCreDt:{type:"date"}
                        ,strgeRegPrsnNm:{type:"string"}
                        ,remark:{type:"string"}
                    }
                }
            }
        }
        ,height:150
        ,editable:false
        ,pageable:false
        ,multiSelectWithCheckbox:false
        ,autoBind:true
        ,appendEmptyColumn:true//empty column. default:false
        ,filterable:false
        ,selectable:"row"
        ,change:function(e) {

            pageInit();

            selectedStrgeRow = {};

            var selectedItem = this.dataItem(this.select());

            if( selectedItem != null && selectedItem != 'undefined'){
                selectedStrgeRow = selectedItem;
                //treelist dataSource read
                treeDataSource.read();
                // grid dataSource read
                $("#gridLoc").data("kendoExtGrid").dataSource.read();
            }
        }
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
            });

        }
        ,columns:[
            {field:"strgeCd", title:"<spring:message code='par.lbl.locStrgeCd' />", width:270}
            ,{field:"strgeNm", title:"<spring:message code='par.lbl.locStrgeNm' />", width:300}
        ]
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
                    var sStrgeCd = selectedStrgeRow.strgeCd == undefined ? "X":selectedStrgeRow.strgeCd;

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
        //,autoBind:false
        ,height:278
        ,selectable:"row"
        ,recorderable:false
        ,change:function(e) {
            var selectedRows = this.select();

            if(selectedRows.length > 0){
                pageInit();
                var dataItem = this.dataItem(selectedRows[0]);
                seletedTreeItems = dataItem;
                selectedLocId = dataItem.id;
                selectedLvlId = dataItem.lvlId;
                selectedLocCd = dataItem.locCd;
                selectedUpperLocId = dataItem.parentId;
                selectedMainLocYn = dataItem.mainLocYn;
                $('#gridLoc').data('kendoExtGrid').dataSource.read();
            }
        }
        ,dataBound: function(e) {

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    //update row reselect.
                    if(dataItem.locCd === seletedTreeItems.locCd){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                }

            });

        }
        ,columns:[
            {field:"locNm", title:"<spring:message code='par.lbl.locTree'/>"}//locNm
            ,{field:"locCd", title:"<spring:message code='par.lbl.locLvlCnt'/>"}//locLvlCnt
        ]

    });
    //gridLoc
    $("#gridLoc").kendoExtGrid({
        gridId:"G-PAR-0805-191297"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        //strgeCd
                        var sStrgeCd = selectedStrgeRow.strgeCd == undefined ? "X":selectedStrgeRow.strgeCd;
                        params["sStrgeCd"] = sStrgeCd;
                        params["sLvlId"] = selectedLvlId + 1;
                        params["sUpperLocId"] = selectedLocCd;
                        params["sMainLocYn"] = "N";

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
                        ,locNm:{ type:"string"}
                        ,upperLocId:{ type:"string" , editable:false }
                        ,lmtMngYn:{ type:"string", defaultValue:"Y", editable:true }
                        ,mainLocYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,lastLvlYn:{ type:"string" , defaultValue:"Y", editable:false }
                        ,itemCd:{ type:"string" }
                        ,maxQty:{ type:"number" , editable:false}
                        ,remark:{ type:"string" }
                        ,upperLvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,avlbStockQty:{ type:"number" , editable:false}
                        ,resvStockQty:{ type:"number" , editable:false}
                        ,clamStockQty:{ type:"number" , editable:false}
                        ,dbYn:{ type:"string" , defaultValue:"N" }
                        ,lgthCnt:{ type:"number" }
                        ,cdTp:{ type:"string" }
                        ,lastLvlYn:{ type:"string" }
                        ,upperLvlTxt:{ type:"string" , editable:false }
                        ,lvlTxt:{ type:"string" , editable:false }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
                rows = e.sender.select(),
                selectedItem = e.sender.dataItem(rows[0]),
                fieldName = grid.columns[e.container.index()].field;

            if(fieldName === "locId"){
                if(!dms.string.isEmpty(selectedItem) && !dms.string.isEmpty(selectedItem.dlrCd)){
                    //this.closeCell();
                }
            }
        }
        ,selectable:"row"
        ,height:278
        ,multiSelectWithCheckbox:false
        ,appendEmptyColumn:true//default:false
        ,filterable:false
        ,pageable:false
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem.dbYn === "N"){
                    //row add cell focus
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(2)");
                    sender.editCell(cellToEdit);
                }
            }

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
            });
        }
        ,columns:[
            /* {field:"upperLvlTxt", title:"<spring:message code='par.lbl.locTree'/>", width:120 }//locTree
            ,{field:"upperLvlId", title:"<spring:message code='par.lbl.locLvlCnt'/>", attributes:{"class":"ar"}, width:100 }//locLvlCnt */
            {field:"lvlId", title:"<spring:message code='par.lbl.lvlId'/>", attributes:{"class":"ar"}, width:100 }//lvlId
            ,{field:"lvlTxt", title:"<spring:message code='par.lbl.lvlTxt'/>", width:150 }//lvlTxt
            ,{field:"locId", title:"<spring:message code='par.lbl.locId'/>"
                , width:200
                ,attributes:{"class":"bg_white"}
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

                    if(cdTp == "N"){

                        $('<input required name="locId" data-bind="value:' + options.field + '" maxLength="'+iLgthCnt+'" />')
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

                    }else{

                        var txtTranVal = "none";

                        if(cdTp == "U"){
                            txtTranVal = "uppercase";
                        }else if(cdTp == "L"){
                            txtTranVal = "lowercase";
                        }

                        $('<input required name="locId" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxLength="'+iLgthCnt+'" style="text-transform:'+txtTranVal+'" />')
                        .appendTo(container);
                    }
                }
            }//locId
            ,{ field:"locNm", title:"<spring:message code='par.lbl.locNm'/>", width:200,attributes:{"class":"bg_white"} }//locNm
            /* ,{ field:"itemCd", title:"<spring:message code='par.lbl.mgrItemCd'/>"
                ,width:150
                ,editor:function(container, options){
                    $('<div class="form_search" style="width:100%"><input required data-bind="value:' + options.field + '" class="form_input" style="width:100%"  /><a href="#" onclick="javascript:selectPartsMasterPopupWindow(this);"></a></div>').appendTo(container);
                }

            }//itemCd */
        ]
    });

    // 로케이션 추가 팝업 열기 함수.
    function fnNewLocPopupWindow(pInsertLocData){

        setNewLocPopupWindow = dms.window.popup({
            windowId:"setNewLocPopup"
            ,title:"<spring:message code='par.menu.partLocMgr' />"   // 로케이션 등록
            ,width :400
            ,height:250
            ,content:{
                url:"<c:url value='/par/cmm/setNewLocPopup.do'/>"
                ,data:{
                      "newLocData":pInsertLocData
                    , "callbackFunc":function(data){
                            var grid = $("#gridLoc").data("kendoExtGrid");

                            $.ajax({
                                url:"<c:url value='/par/pmm/binLocationMaster/callSpParLocationUpdate.do' />"
                                ,data:JSON.stringify(data)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.warning("<spring:message code='par.lbl.locId' var='locId' /><spring:message code='par.info.itemInsertMsg' arguments='${locId}'/>");
                                    grid.cancelChanges();
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
                            setNewLocPopupWindow.close();
                    }
                }
            }
        });
    }

});
</script>
<!-- //script -->


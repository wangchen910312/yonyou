<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- itemGroupMgr -->
<section class="group">

    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.itemGrpNm" /> --%><!-- itemGrpNm --></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></span></th>
                    <td class="required_area">
                        <input id="sItemDstinCd" class="form_comboBox" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- grid button list -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnAdd" type="button"><spring:message code="par.btn.rowAdd" /></button><!--btnAdd  -->
            <button class="btn_s btn_del" id="btnDel" type="button"><spring:message code="par.btn.rowDel" /></button><!--btnDel  -->
        </div>
    </div>
    <!-- grid button list -->
    <div class="table_grid">
        <!-- grid -->
        <div id="grid"></div>
    </div>
</section>
<!-- //itemGroupMgr -->

<!-- script -->
<script>

/**
* checkbox click event
*/
$(document).on("click", ".aprv-chk", function(e){
     var thisName = $(this).data("name");
     var grid = $("#grid").data("kendoExtGrid"),
     dataItem = grid.dataItem($(e.target).closest("tr"));

     if($(this).is(":checked")){
        dataItem.set(thisName, "Y");
     }else{
        dataItem.set(thisName, "N");
     }
 });
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

$(document).ready(function() {
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            var ds = $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
        click:function(e){
            // sItemDstinCd empty value checked
            if($("#sItemDstinCd").val() != ""){

                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                    "dlrCd":""
                    ,"itemDstinCd":$("#sItemDstinCd").val()
                    ,"itemGrpCd":null
                    ,"itemGrpNm":$("#sItemDstinCd").data("kendoExtDropDownList").text()
                    ,"useYn":"Y"
                    ,"dbYn":"N"
                    ,"remark":$("#sItemDstinCd").data("kendoExtDropDownList").text()
                    ,"regUsrId":null
                    ,"regDt":null
                    ,"updtUsrId":null
                    ,"updtDt":null
                });
            }
            else{
                // sItemDstinCd dropdown select check message
                dms.notification.info("<spring:message code='par.lbl.itemDstinCd' var='itemDstinCdMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemDstinCdMsg}' />");
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
                // delete item check message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiItemGroups = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/itemGroup/multiItemGroups.do' />"
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
                // input value check message
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    //sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,optionLabel:" "
        ,autoBind:false
        ,index:0
    });
    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/itemGroup/selectItemGroups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sDlrCd"] = "";
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();
                        params["sItemGrpCd"] = "";
                        params["sItemGrpNm"] = "";
                        params["sUseYn"] = "";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemGrpCd"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,itemDstinCd:{ type:"string" , validation:{required:true} }
                        ,itemGrpCd:{ type:"string" , validation:{required:true} }
                        ,itemGrpNm:{ type:"string" , validation:{required:true} }
                        ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,dbYn:{ type:"string" , defaultValue:"Y" }
                        ,remark:{ type:"string" }
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

            if (e.model.dbYn == "Y") {
                if(fieldName=="itemGrpCd"){
                    this.closeCell();
                }
            }

            if(fieldName=="useYn"){
                this.closeCell();
            }
        }
        ,pageable:false
        ,navigatable:true
        ,selectable:"multiple,row"
        ,multiSelectWithCheckbox:true
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem.dbYn === "N"){
                    // row add after cell focus
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(1)");
                    sender.editCell(cellToEdit);
                }
            }
            //TODO:[InboShim] Tab Focus Func Ready
            /* $("#grid").on("focus","td",function(e){
                $("#input").on("keydown",function(event){
                    if(event.keyCode === 13){
                        setTimeout(function(){
                            var grid = $("#grid").data("kendoExtGrid");
                            var curCell = grid.find(".k-state-selected");
                            var eCell = grid.find(".k-edit-cell");

                            curCell.removeClass("k-state-selected");
                            curCell.removeClass("k-state-focused");
                            curCell.removeAttr("data-role");

                            curCell.next().addClass("k-state-selected");
                            curCell.next().addClass("k-state-focused");

                            try{
                                grid.closeCell(eCell);
                            }catch(ex){

                            }
                            grid.select();
                            grid.editCell(curCell.next());

                            //grid.editCell(currCell.next());
                        },50);
                    }

                });
            }); */

        }
        ,columns:[
            {field:"itemGrpCd", title:"<spring:message code='par.lbl.itemGrpCd' />"
                ,width:120
                ,attributes:{"class":"editable-cell"}
                ,editor:function(container, options){
                    $('<input required name="itemGrpCd" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:"CCCC"
                        ,promptChar:" "
                    });
                    $('<span class="k-invalid-msg" data-for="itemGrpCd"></span>').appendTo(container);
                }
            }//itemGrpCd
            ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.itemGrpNm' />",width:150
                ,attributes:{"class":"editable-cell"}
            }//itemGrpNm
            ,{field:"useYn", title:"<spring:message code='par.lbl.useYn' />"
                ,width:80
                ,attributes:{"class":"ac editable-cell"}
                ,template:'<input type="checkbox" class="aprv-chk" data-name="useYn" #= useYn=="Y"? checked="checked":"" # disabled="true" />'
            }//useYn
            ,{field:"remark", title:"<spring:message code='par.lbl.remark' />"
                ,width:300
            }//remark
        ]
    });
});
</script>
<!-- //script -->


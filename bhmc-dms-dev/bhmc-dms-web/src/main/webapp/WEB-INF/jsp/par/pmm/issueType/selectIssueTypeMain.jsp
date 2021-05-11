<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- partsOutTypeMgr -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.lbl.giTpMgr" /></h1> --%>
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            <button class="btn_m btn_add" id="btnAdd" type="button"><spring:message code="par.btn.add" /></button><!--btnAdd  -->
            <button class="btn_m btn_del" id="btnDel" type="button"><spring:message code="par.btn.del" /></button><!--btnDel  -->
            <button class="btn_m btn_cancel" id="btnCancel" type="button"><spring:message code="par.btn.cancel" /></button><!-- btnCancel  -->
        </div>
    </div>
    <div class="table_grid">
        <div id="grid"></div>
    </div>
</section>
<!-- //partsOutTypeMgr -->
<!-- script -->
<script>
// row select Func
function setRowSelected(grid,uid){
    var row = grid.table.find("[data-uid="+uid+"]");
    grid.select(row);
    //selected row scrollTop
    grid.content.scrollTop(grid.select().position().top);
}
/**
* checkbox click event
*/
$(document).on("click", ".reqMngYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func Call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".resvMngYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func Call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".giOrdMngYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func Call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".purcYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func Call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".useYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func Call
    setRowSelected(grid,dataItem.uid);
 });
//combiMvtTpList
var combiMvtTpList = [];
<c:forEach var="obj" items="${combiMvtTpList}">
combiMvtTpList.push({
    "mvtTp":"${obj.mvtTp}"
    , "mvtTpNm":"${obj.mvtTpNm}"
});
</c:forEach>
//combiMvtTpMap
var combiMvtTpMap = {};
$.each(combiMvtTpList, function(idx, obj){
    combiMvtTpMap[obj.mvtTp] = obj.mvtTpNm;
});

$(document).ready(function() {

    // 추가 버튼
    $("#btnAdd").kendoButton({
        enable:false
        ,click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "dlrCd":""
                ,"parGiTp":""
                ,"dbYn":"N"
                ,"giTpNm":""
                ,"baseGiTpYn":"Y"
                ,"reqMngYn":"Y"
                ,"resvMngYn":"Y"
                ,"purcYn":"Y"
                ,"giOrdMngYn":"Y"
                ,"mvtTp":""
                ,"useYn":"Y"
            });
        }
    });

    // 삭제 버튼
    $("#btnDel").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var rowCnt = rows.length;

            if(rowCnt > 0){
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
            else{
                //delete item check message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });

    //btnCancel
    $("#btnCancel").kendoButton({
        enable:false
        ,click:function(e){
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //btnSave
    $("#btnSave").kendoButton({
        enable:false
        ,click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiIssueTypes = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/issueType/multiIssueTypes.do' />"
                    ,data:JSON.stringify(multiIssueTypes)
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

    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/issueType/selectIssueTypes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"parGiTp"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,parGiTp:{ type:"string" , validation:{required:true} }
                        ,giTpNm:{ type:"string" , validation:{required:true} }
                        ,dbYn:{ type:"string" , defaultValue:"Y", editable:false }
                        ,giTpNm:{ type:"string" , validation:{required:true} }
                        ,baseGiTpYn:{ type:"string" , validation:{required:true} }
                        ,reqMngYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,resvMngYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,purcYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,giOrdMngYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,mvtTp:{ type:"string"}
                        ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,remark:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){

            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if (e.model.dbYn == "Y") {
                if(fieldName=="parGiTp"){
                    this.closeCell();
                }
            }
            if(fieldName=="baseGiTpYn"){
                this.closeCell();
            }
            if(fieldName=="reqMngYn"){
                this.closeCell();
            }
            if(fieldName=="resvMngYn"){
                this.closeCell();
            }
            if(fieldName=="purcYn"){
                this.closeCell();
            }
            if(fieldName=="giOrdMngYn"){
                this.closeCell();
            }
            if(fieldName=="useYn"){
                this.closeCell();
            }

        }
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,dataBound:function(e)
        {
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem.dbYn === "N"){
                    //row add after cell focus
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(1)");
                    sender.editCell(cellToEdit);
                }
            }
        }
        ,columns:[
            {field:"parGiTp", title:"<spring:message code='par.lbl.parGiTp' />", width:120
                ,editor:function(container, options){
                    $('<input required name="parGiTp" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:"00"
                        ,promptChar:" "
                    });
                    $('<span class="k-invalid-msg" data-for="parGiTp"></span>').appendTo(container);
                }
            }//parGiTp
            ,{field:"giTpNm", title:"<spring:message code='par.lbl.parGiTpNm' />", width:150 }//giTpNm
            ,{field:"reqMngYn", title:"<spring:message code='par.lbl.reqMngYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="reqMngYn-chk" data-name="reqMngYn" #= reqMngYn=="Y"? checked="checked":"" # />'
            }//reqMngYn
            ,{field:"resvMngYn", title:"<spring:message code='par.lbl.resvMngYn' />", width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="resvMngYn-chk" data-name="resvMngYn" #= resvMngYn=="Y"? checked="checked":"" # />'
            }//resvMngYn
            ,{field:"purcYn", title:"<spring:message code='par.lbl.purcYn' />", width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="purcYn-chk" data-name="purcYn" #= purcYn=="Y"? checked="checked":"" # />'
            }//purcYn
            ,{field:"giOrdMngYn", title:"<spring:message code='par.lbl.giOrdMngYn' />", width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="giOrdMngYn-chk" data-name="giOrdMngYn" #= giOrdMngYn=="Y"? checked="checked":"" # />'
            }//giOrdMngYn
            ,{field:"mvtTp", title:"<spring:message code='par.lbl.mvtTp' />"
                ,width:200
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"mvtTpNm"
                        ,dataValueField:"mvtTp"
                        ,optionLabel:" "
                        ,dataSource:combiMvtTpList
                    });
                 }
                ,template:'#if(mvtTp !== ""){# #= combiMvtTpMap[mvtTp]# #}#'
            }//mvtTp
            ,{field:"useYn", title:"<spring:message code='par.lbl.useYn' />"
                ,width:120
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="useYn-chk" data-name="useYn" #= useYn=="Y"? checked="checked":"" # />'
            }//useYn
            ,{title:"" }
        ]
    });

});
</script>
<!-- //script -->


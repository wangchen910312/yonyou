<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- MvtTypeMgr -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.mvtTpMng" /> --%><!-- mvtTpMng --></h1>
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            <button class="btn_m btn_add" id="btnAdd" type="button"><spring:message code="par.btn.add" /></button><!--btnAdd  -->
            <button class="btn_m btn_del" id="btnDel" type="button"><spring:message code="par.btn.del" /></button><!--btnDel  -->
            <button class="btn_m btn_cancel" id="btnCancel" type="button"><spring:message code="par.btn.cancel" /></button><!--btnCancel  -->
        </div>
    </div>
    <div class="table_grid">
        <div id="grid"></div>
    </div>
</section>
<!-- //MvtTypeMgr -->
<!-- script -->
<script>
//mvtGrGiTpList
var mvtGrGiTpList = [];
<c:forEach var="obj" items="${mvtGrGiTpList}">
mvtGrGiTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//mvtGrGiTpMap
var mvtGrGiTpMap = [];
$.each(mvtGrGiTpList, function(idx, obj){
    mvtGrGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//stockCalcTpList
var stockCalcTpList = [];
<c:forEach var="obj" items="${stockCalcTpList}">
stockCalcTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//stockCalcTpMap
var stockCalcTpMap = [];
$.each(stockCalcTpList, function(idx, obj){
    stockCalcTpMap[obj.cmmCd] = obj.cmmCdNm;
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
var combiMvtTpMap = [];
$.each(combiMvtTpList, function(idx, obj){
    combiMvtTpMap[obj.mvtTp] = obj.mvtTpNm;
});
//processTpList
var processTpList = [];
<c:forEach var="obj" items="${processTpList}">
processTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//processTpMap
var processTpMap = [];
$.each(processTpList, function(idx, obj){
    processTpMap[obj.cmmCd] = obj.cmmCdNm;
});

// row select Fucn
function setRowSelected(grid,uid){
    // row selected
    var row = grid.table.find("tr[data-uid="+uid+"]");
    grid.select(row);
    // selcted row scroll top
    grid.content.scrollTop(grid.select().position().top);
}
/**
* checkbox click event
*/
$(document).on("click", ".cenMvtYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".strgeMvtYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
  //row select Func call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".cancMvtYn-chk", function(e){

    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".mvtReasonReqsYn-chk", function(e){

    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".otherGrYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".otherGiYn-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#grid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
       dataItem.set(thisName, "Y");
    }else{
       dataItem.set(thisName, "N");
    }
    //row select Func call
    setRowSelected(grid,dataItem.uid);
});
/**
* checkbox click event
*/
$(document).on("click", ".dmndAnalyzeYn-chk", function(e){
     var thisName = $(this).data("name");
     var grid = $("#grid").data("kendoExtGrid"),
     dataItem = grid.dataItem($(e.target).closest("tr"));

     if($(this).is(":checked")){
        dataItem.set(thisName, "Y");
     }else{
        dataItem.set(thisName, "N");
     }
     //row select Func call
     setRowSelected(grid,dataItem.uid);
 });

$(document).ready(function() {
    //btnSave
    $("#btnSave").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#grid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiMvtTpes = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }
                $.ajax({
                    url:"<c:url value='/par/pmm/movementType/multiMovementTypes.do' />"
                    ,data:JSON.stringify(multiMvtTpes)
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
                //input value check
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    //btnDel
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
    //btnAdd
    $("#btnAdd").kendoButton({
        enable:false
        ,click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "dlrCd":""
                ,"mvtTp":""
                ,"mvtTpNm":""
                ,"baseMvtTpYn":"Y"
                ,"cenMvtYn":"Y"
                ,"strgeMvtYn":"Y"
                ,"mvtGrGiTp":""
                ,"stockCalcTp":""
                ,"combiMvtTp":""
                ,"cancMvtYn":"Y"
                ,"processTp":""
                ,"costCenReqsYn":"Y"
                ,"mvtReasonReqsYn":"Y"
                ,"useYn":"Y"
                ,"dmndAnalyzeYn":"Y"
                ,"otherGrYn":"N"
                ,"otherGiYn":"N"
                ,"dbYn":"N"
                ,"remark":""
                ,"stockStatCd":""
                ,"rectGrGiDtUpdtYn":"N"
            });
        }
    });
    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/movementType/selectMovementTypes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sUseYn"] = "Y";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mvtTp"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,mvtTp:{ type:"string" , validation:{required:true} }
                        ,mvtTpNm:{ type:"string" , validation:{required:true} }
                        ,baseMvtTpYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,cenMvtYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,strgeMvtYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,mvtGrGiTp:{ type:"string" , validation:{required:true} , editable:true }
                        ,stockCalcTp:{ type:"string" , validation:{required:true} }
                        ,combiMvtTp:{ type:"string" , validation:{required:true} }
                        ,cancMvtYn:{ type:"string" , defaultValue:"Y" }
                        ,processTp:{ type:"string" , validation:{required:true} }
                        ,costCenReqsYn:{ type:"string" , defaultValue:"Y" }
                        ,mvtReasonReqsYn:{ type:"string" , defaultValue:"Y" }
                        ,useYn:{ type:"string" , defaultValue:"Y" }
                        ,dmndAnalyzeYn:{ type:"string" , defaultValue:"Y" }
                        ,otherGrYn:{ type:"string" , defaultValue:"Y" }
                        ,otherGiYn:{ type:"string" , defaultValue:"Y" }
                        ,dbYn:{ type:"string" , defaultValue:"Y" }
                        ,remark:{ type:"string" }
                        ,stockStatCd:{ type:"string" }
                        ,rectGrGiDtUpdtYn:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){

            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if (e.model.dbYn == "Y") {
                if(fieldName=="mvtTp"){
                    this.closeCell();
                }
            }

            if(fieldName=="baseMvtTpYn"){
                this.closeCell();
            }
            if(fieldName=="cenMvtYn"){
                this.closeCell();
            }
            if(fieldName=="strgeMvtYn"){
                this.closeCell();
            }

            if(fieldName=="cancMvtYn"){
                this.closeCell();
            }
            if(fieldName=="costCenReqsYn"){
                this.closeCell();
            }

            if(fieldName=="mvtReasonReqsYn"){
                this.closeCell();
            }
            if(fieldName=="useYn"){
                this.closeCell();
            }
            if(fieldName=="dmndAnalyzeYn"){
                this.closeCell();
            }
            if(fieldName=="otherGrYn"){
                this.closeCell();
            }
            if(fieldName=="otherGiYn"){
                this.closeCell();
            }

        }
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,height:900
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
        }
        ,columns:[
            {field:"mvtTp", title:"<spring:message code='par.lbl.mvtTp' />", width:70
                ,editor:function(container, options){
                    $('<input required name="mvtTp" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:"00"
                        ,promptChar:" "
                    });
                    $('<span class="k-invalid-msg" data-for="mvtTp"></span>').appendTo(container);
                }
            }//mvtTp
            ,{field:"mvtTpNm", title:"<spring:message code='par.lbl.mvtTpNm' />", width:180 } //mvtTpNm
            ,{field:"cenMvtYn", title:"<spring:message code='par.lbl.cenMvtYn' />"
                ,width:90
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="cenMvtYn-chk" data-name="cenMvtYn" #= cenMvtYn=="Y"? checked="checked":"" # />'
            }//cenMvtYn
            ,{field:"strgeMvtYn", title:"<spring:message code='par.lbl.strgeMvtYn' />"
                ,width:90
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="strgeMvtYn-chk" data-name="strgeMvtYn" #= strgeMvtYn=="Y"? checked="checked":"" # />'
            }//strgeMvtYn
            ,{field:"mvtGrGiTp", title:"<spring:message code='par.lbl.mvtGrGiTp' />"
                ,width:120
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:mvtGrGiTpList
                    });
                }
                ,template:'#if(mvtGrGiTp !== ""){# #= mvtGrGiTpMap[mvtGrGiTp]# #}#'
            }//mvtGrGiTp
            ,{field:"stockCalcTp", title:"<spring:message code='par.lbl.stockCalcTp' />"
                ,width:80
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:stockCalcTpList
                    });
                 }
                ,template:'#if(stockCalcTp !== ""){# #= stockCalcTpMap[stockCalcTp]# #}#'
            }//stockCalcTp
            ,{field:"combiMvtTp", title:"<spring:message code='par.lbl.combiMvtTp' />"
                ,width:180
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"mvtTpNm"
                        ,dataValueField:"mvtTp"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:combiMvtTpList
                    });
                 }
                ,template:'#if(combiMvtTp !== ""){# #= combiMvtTpMap[combiMvtTp]# #}#'
            }//combiMvtTp
            ,{field:"cancMvtYn", title:"<spring:message code='par.lbl.backWayYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="cancMvtYn-chk" data-name="cancMvtYn" #= cancMvtYn=="Y"? checked="checked":"" # />'
            }//cancMvtYn
            ,{field:"mvtReasonReqsYn", title:"<spring:message code='par.lbl.mvtReasonReqsYn' />"
                ,width:110
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="mvtReasonReqsYn-chk" data-name="mvtReasonReqsYn" #= mvtReasonReqsYn=="Y"? checked="checked":"" # />'
            }//mvtReasonReqsYn
            ,{field:"otherGrYn", title:"<spring:message code='par.lbl.otherGrYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="otherGrYn-chk" data-name="otherGrYn" #= otherGrYn=="Y"? checked="checked":"" # />'
            }//otherGrYn
            ,{field:"otherGiYn", title:"<spring:message code='par.lbl.otherGiYn' />"
                , width:90
                , attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="otherGiYn-chk" data-name="otherGiYn" #= otherGiYn=="Y"? checked="checked":"" # />'
            }//otherGiYn
            ,{field:"processTp", title:"<spring:message code='par.lbl.processTp' />"
                ,width:100
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:processTpList
                    });
                 }
                ,template:'#if(processTp !== ""){# #= processTpMap[processTp]# #}#'
            }//processTp
            ,{field:"dmndAnalyzeYn", title:"<spring:message code='par.lbl.dmndAnalyzeYn' />"
                , width:90
                , attributes:{"class":"ac"}
                , template:'<input type="checkbox" class="dmndAnalyzeYn-chk" data-name="dmndAnalyzeYn" #= dmndAnalyzeYn=="Y"? checked="checked":"" # />'
            }//dmndAnalyzeYn
        ]
    });
});
</script>
<!-- //script -->


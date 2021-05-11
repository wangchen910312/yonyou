<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- location Level  -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.locDefine" /> --%><!-- locDefine  --></h1>
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            <button class="btn_m btn_add" id="btnAdd" type="button"><spring:message code="par.btn.add" /></button><!--btnAdd  -->
            <button class="btn_m btn_del" id="btnDel" type="button"><spring:message code="par.btn.del" /></button><!--btnDel  -->
            <button class="btn_m btn_cancel" id="btnCancel" type="button"><spring:message code="par.btn.cancel" /></button><!--btnCancel -->
        </div>
    </div>
    <div class="table_grid">
        <div id="grid"></div>
    </div>
</section>
<!-- //location Level -->

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
//locationTpCdList
var locationTpCdList = [];
<c:forEach var="obj" items="${locationTpCdList}">
locationTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//locationTpCdMap
var locationTpCdMap = [];
$.each(locationTpCdList, function(idx, obj){
    locationTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});

$(document).ready(function() {
    //btnAdd
    $("#btnAdd").kendoButton({
        click:function(e){
            var rowCnt = $('#grid').data('kendoExtGrid').dataSource.total();
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
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
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });
    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
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
            if(fieldName=="lastLvlYn"){
                this.closeCell();
            }
            e.container.find("input[name='length']").attr('maxlength', '2');
        }
        ,pageable:false
        ,selectable:"multiple,row"
        ,multiSelectWithCheckbox:false
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
            { field:"lvlId", title:"<spring:message code='par.lbl.lvlId' />", width:120 }     //lvlId
            ,{ field:"lvlTxt", title:"<spring:message code='par.lbl.lvlTxt' />", width:150 }  //lvlTxt
            ,{ field:"lgthCnt", title:"<spring:message code='par.lbl.lgthCnt' />"
                ,width:150
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input required data-value-field="lgthCnt" data-bind="value:' + options.field + '" maxlength="2" style="width:100%" />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,format:"{0:n0}"
                        ,spinners:false
                    });
                }
            }//lgthCnt
            ,{ field:"cdTp", title:"<spring:message code='par.lbl.cdTp' />"
                ,width:150
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
            ,{ field:"lastLvlYn", title:"<spring:message code='par.lbl.lastLvlYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="aprv-chk" data-name="lastLvlYn" #= lastLvlYn=="Y"? checked="checked":"" # />'
            }//lastLvlYn
            ,{ field:"remark", title:"<spring:message code='par.lbl.remark' />", width:300 }//remark
        ]
    });
});
</script>
<!-- //script -->


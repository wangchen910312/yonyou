<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- location Level  -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.locDefine" /></h1> --%>
        <div class="btn_left">
            <button id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
        </div>
        <div class="btn_right">
            <button type="button" id="btnSave" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.fix" /></button><!--btnSave  -->
            <button type="button" id="btnAdd" class="btn_m btn_m_min btn_add"><spring:message code="par.btn.add" /></button><!--btnAdd  -->
            <button type="button" id="btnDel" class="btn_m btn_m_min btn_del" disabled="disabled"><spring:message code="par.btn.del" /></button><!--btnDel  -->
            <button type="button" id="btnCancel" class="btn_m btn_m_min btn_cancel hidden"><spring:message code="par.btn.cancel" /></button><!--btnCancel -->
        </div>
    </div>
    <div class="table_grid">
        <div id="gridDefine"></div>
    </div>
</section>
<!-- //location Level -->

<!-- script -->
<script>
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

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            $('#gridDefine').data('kendoExtGrid').cancelChanges();
        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
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
    //btnDel
    $("#btnDel").kendoButton({
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
    //btnSave
    $("#btnSave").kendoButton({
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
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            $('#gridDefine').data('kendoExtGrid').cancelChanges();
        }
    });
    //gridDefine
    $("#gridDefine").kendoExtGrid({
        gridId:"G-PAR-0805-160201"
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
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    //lastLvlYn row reselect.
                    if(dataItem.lastLvlYn === "Y"){
                        var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                    }
                }
            });
        }
        ,pageable:false
        ,height:520
        ,selectable:"multiple,row"
        ,multiSelectWithCheckbox:false
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
                        min:2
                        ,max:5
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
            /* ,{ field:"lastLvlYn", title:"<spring:message code='par.lbl.lastLvlYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options){
                    var input = $('<input id="strgeCd" name="lastLvlYn" data-bind="value:' + options.field + '"  />')
                    .appendTo(container);

                    input.kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,valuePrimitive:true
                        ,dataSource:useYnCdList
                    }).appendTo(container);
                }
                ,template:'#if(useYnCdMap[lastLvlYn] !== undefined){# #= useYnCdMap[lastLvlYn]# #}#'
            }//lastLvlYn */
            ,{ field:"remark", title:"<spring:message code='par.lbl.remark' />", width:300 }//remark
        ]
    });
});
</script>
<!-- //script -->


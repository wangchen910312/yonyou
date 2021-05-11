<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section id="content">

    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.partItemGrp" /> --%></h1>
        </div>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpType" /></h2>
                <div class="btn_right">
                    <button id="btnSearch01" type="button" class="btn_s btn_search"><spring:message code="par.btn.search" /></button>
                    <button id="btnSave01" type="button" class="btn_s btn_save"><spring:message code="par.btn.save" /></button>
                    <button id="btnAdd01" type="button" class="btn_s btn_add"><spring:message code="par.btn.rowAdd" /></button>
                    <button id="btnDel01" type="button" class="btn_s btn_del"><spring:message code="par.btn.rowDel" /></button>
                </div>
            </div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:75%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></span></th>
                            <td>
                                <input id="sItemDstinCd" class="form_comboBox" />
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <!-- grid -->
                <div id="grid01"></div>
                <!-- grid -->
                <%-- <table class="grid">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th scope="col" data-field="data1"><spring:message code="par.lbl.check" /></th>
                            <th scope="col" data-field="data2"><spring:message code="par.lbl.partItemGrpCd" /></th>
                            <th scope="col" data-field="data3"><spring:message code="par.lbl.partItemGrpNm" /></th>
                            <th scope="col" data-field="data4"><spring:message code="par.lbl.partItemGrpUse" /></th>
                            <th scope="col" data-field="data5"><spring:message code="par.lbl.remark" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table> --%>
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeOne" /></h2>
                <div class="btn_right">
                    <button id="btnSearch02" type="button" class="btn_s btn_search"><spring:message code="par.btn.search" /></button>
                    <button id="btnSave02" type="button" class="btn_s btn_save"><spring:message code="par.btn.save" /></button>
                    <button id="btnAdd02" type="button" class="btn_s btn_add"><spring:message code="par.btn.rowAdd" /></button>
                    <button id="btnDel02" type="button" class="btn_s btn_del"><spring:message code="par.btn.rowDel" /></button>
                </div>
            </div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:75%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.partItemGrpType" /></th>
                            <td>
                                <input id="sPartItemGrpTypeOne" type="text" value="" class="form_comboBox">
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <!-- grid -->
                <div id="grid02"></div>
                <!-- grid -->
                <%-- <table class="grid">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th scope="col" data-field="data1"><spring:message code="par.lbl.check" /></th>
                            <th scope="col" data-field="data2"><spring:message code="par.lbl.partItemGrpCd" /></th>
                            <th scope="col" data-field="data3"><spring:message code="par.lbl.partItemGrpNm" /></th>
                            <th scope="col" data-field="data4"><spring:message code="par.lbl.partItemGrpUse" /></th>
                            <th scope="col" data-field="data5"><spring:message code="par.lbl.remark" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table> --%>
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeTwo" /></h2>
                <div class="btn_right">
                    <button id="btnSearch03" type="button" class="btn_s btn_search"><spring:message code="par.btn.search" /></button>
                    <button id="btnSave03" type="button" class="btn_s btn_save"><spring:message code="par.btn.save" /></button>
                    <button id="btnAdd03" type="button" class="btn_s btn_add"><spring:message code="par.btn.rowAdd" /></button>
                    <button id="btnDel03" type="button" class="btn_s btn_del"><spring:message code="par.btn.rowDel" /></button>
                </div>
            </div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:75%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.partItemGrpTypeOne" /></th>
                            <td>
                                <input id="sPartItemGrpTypeTwo" type="text" value="" class="form_comboBox">
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <!-- grid -->
                <div id="grid03"></div>
                <!-- grid -->
                <%-- <table class="grid">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th scope="col" data-field="data1"><spring:message code="par.lbl.check" /></th>
                            <th scope="col" data-field="data2"><spring:message code="par.lbl.partItemGrpCd" /></th>
                            <th scope="col" data-field="data3"><spring:message code="par.lbl.partItemGrpNm" /></th>
                            <th scope="col" data-field="data4"><spring:message code="par.lbl.partItemGrpUse" /></th>
                            <th scope="col" data-field="data5"><spring:message code="par.lbl.remark" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table> --%>
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeThree" /></h2>
                <div class="btn_right">
                    <button id="btnSearch04" type="button" class="btn_s btn_search"><spring:message code="par.btn.search" /></button>
                    <button id="btnSave04" type="button" class="btn_s btn_save"><spring:message code="par.btn.save" /></button>
                    <button id="btnAdd04" type="button" class="btn_s btn_add"><spring:message code="par.btn.rowAdd" /></button>
                    <button id="btnDel04" type="button" class="btn_s btn_del"><spring:message code="par.btn.rowDel" /></button>
                </div>
            </div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:75%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.partItemGrpTypeTwo" /></th>
                            <td>
                                <input id="sPartItemGrpTypeThree" type="text" value="" class="form_comboBox">
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <!-- grid -->
                <div id="grid04"></div>
                <!-- grid -->
                <%-- <table class="grid">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th scope="col" data-field="data1"><spring:message code="par.lbl.check" /></th>
                            <th scope="col" data-field="data2"><spring:message code="par.lbl.partItemGrpCd" /></th>
                            <th scope="col" data-field="data3"><spring:message code="par.lbl.partItemGrpNm" /></th>
                            <th scope="col" data-field="data4"><spring:message code="par.lbl.partItemGrpUse" /></th>
                            <th scope="col" data-field="data5"><spring:message code="par.lbl.remark" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table> --%>
            </div>
        </section>

    </section>


</section>
<!-- //content -->

<!-- script -->
<script>
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//partItemGrpTypeOneCdList
var partItemGrpTypeOneCdList = [];
<c:forEach var="obj" items="${partItemGrpTypeOneCdList}">
partItemGrpTypeOneCdList.push({
    "cmmCd":"${obj.itemGrpCd}"
    ,"cmmCdNm":"${obj.itemGrpNm}"
});
</c:forEach>
//partItemGrpTypeTwoCdList
var partItemGrpTypeTwoCdList = [];
<c:forEach var="obj" items="${partItemGrpTypeTwoCdList}">
partItemGrpTypeTwoCdList.push({
    "cmmCd":"${obj.itemGrpCd}"
    ,"cmmCdNm":"${obj.itemGrpNm}"
});
</c:forEach>
//partItemGrpTypeThreeCdList
var partItemGrpTypeThreeCdList = [];
<c:forEach var="obj" items="${partItemGrpTypeThreeCdList}">
partItemGrpTypeThreeCdList.push({
    "cmmCd":"${obj.itemGrpCd}"
    ,"cmmCdNm":"${obj.itemGrpNm}"
});
</c:forEach>
    $(document).ready(function() {
        //btnSearch01
        $("#btnSearch01").kendoButton({
            click:function(e){
                $("#grid01").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnSave01
        $("#btnSave01").kendoButton({
            click:function(e){
                var grid = $("#grid01").data("kendoExtGrid");

                if(grid.gridValidation()){
                    var multiItemGroups = grid.getCUDData("insertList", "updateList", "deleteList");
                    if(grid.cudDataLength == 0){
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    $.ajax({
                        url:"<c:url value='/par/pmm/itemGroup/multiItemGroupLevels.do' />"
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

                            //partItemGrpTypeOneCdList set datasource
                            $.ajax({
                                url:"<c:url value='/par/pmm/itemGroup/selectComboItemGroupLevels.do' />"
                                ,data:JSON.stringify({sLvlVal:1, sUseYn:"Y"})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,error:function(jqXHR,status,error){

                                }
                                ,success:function(jqXHR, textStatus){
                                    var partItemGrpTypeOneCdList = [];
                                    $.each(jqXHR, function(idx, row){
                                        console.log("row:"+kendo.stringify(row));
                                        partItemGrpTypeOneCdList.push({
                                            "cmmCd":row.itemGrpCd
                                            ,"cmmCdNm":row.itemGrpNm
                                        });
                                    });

                                    $("#sPartItemGrpTypeOne").data("kendoExtDropDownList").dataSource.data(partItemGrpTypeOneCdList);
                                }
                            });


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
        //btnAdd01
        $("#btnAdd01").kendoButton({
            click:function(e){
                // sItemDstinCd empty value checked
                if($("#sItemDstinCd").val() != ""){

                    $('#grid01').data('kendoExtGrid').dataSource.insert(0, {
                        "dlrCd":""
                        ,"itemDstinCd":$("#sItemDstinCd").val()
                        ,"itemGrpCd":null
                        ,"itemGrpNm":$("#sItemDstinCd").data("kendoExtDropDownList").text()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#sItemDstinCd").data("kendoExtDropDownList").text()
                        ,"lvlVal":1
                        ,"pentItemDstinCd":$("#sItemDstinCd").val()
                        ,"baseTreeLvlId":null
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
        //btnDel01
        $("#btnDel01").kendoButton({
            click:function(e){
                var grid = $("#grid01").data("kendoExtGrid");
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
        //btnSearch02
        $("#btnSearch02").kendoButton({
            click:function(e){
                $("#grid02").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnSave02
        $("#btnSave02").kendoButton({
            click:function(e){
                var grid = $("#grid02").data("kendoExtGrid");

                if(grid.gridValidation()){
                    var multiItemGroups = grid.getCUDData("insertList", "updateList", "deleteList");
                    if(grid.cudDataLength == 0){
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    $.ajax({
                        url:"<c:url value='/par/pmm/itemGroup/multiItemGroupLevels.do' />"
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

                            //partItemGrpTypeTwoCdList set datasource
                            $.ajax({
                                url:"<c:url value='/par/pmm/itemGroup/selectComboItemGroupLevels.do' />"
                                ,data:JSON.stringify({sLvlVal:2, sUseYn:"Y"})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,error:function(jqXHR,status,error){

                                }
                                ,success:function(jqXHR, textStatus){
                                    var partItemGrpTypeTwoCdList = [];
                                    $.each(jqXHR, function(idx, row){
                                        partItemGrpTypeTwoCdList.push({
                                            "cmmCd":row.itemGrpCd
                                            ,"cmmCdNm":row.itemGrpNm
                                        });
                                    });

                                    $("#sPartItemGrpTypeTwo").data("kendoExtDropDownList").dataSource.data(partItemGrpTypeTwoCdList);
                                }
                            });


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
        //btnAdd02
        $("#btnAdd02").kendoButton({
            click:function(e){
                // sPartItemGrpTypeOne empty value checked
                if($("#sPartItemGrpTypeOne").val() != ""){

                    $('#grid02').data('kendoExtGrid').dataSource.insert(0, {
                        "dlrCd":""
                        ,"itemDstinCd":$("#sPartItemGrpTypeOne").val()
                        ,"itemGrpCd":null
                        ,"itemGrpNm":$("#sPartItemGrpTypeOne").data("kendoExtDropDownList").text()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#sPartItemGrpTypeOne").data("kendoExtDropDownList").text()
                        ,"lvlVal":2
                        ,"pentItemDstinCd":$("#sPartItemGrpTypeOne").val()
                        ,"baseTreeLvlId":null
                        ,"regUsrId":null
                        ,"regDt":null
                        ,"updtUsrId":null
                        ,"updtDt":null
                    });
                }
                else{
                    // sPartItemGrpTypeOne dropdown select check message
                    dms.notification.info("<spring:message code='par.lbl.partItemGrpType' var='partItemGrpType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${partItemGrpType}' />");
                }
            }
        });
        //btnDel02
        $("#btnDel02").kendoButton({
            click:function(e){
                var grid = $("#grid02").data("kendoExtGrid");
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
        //btnSearch03
        $("#btnSearch03").kendoButton({
            click:function(e){
                $("#grid03").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnSave03
        $("#btnSave03").kendoButton({
            click:function(e){
                var grid = $("#grid03").data("kendoExtGrid");

                if(grid.gridValidation()){
                    var multiItemGroups = grid.getCUDData("insertList", "updateList", "deleteList");
                    if(grid.cudDataLength == 0){
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    $.ajax({
                        url:"<c:url value='/par/pmm/itemGroup/multiItemGroupLevels.do' />"
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

                            //partItemGrpTypeThreeCdList set datasource
                            $.ajax({
                                url:"<c:url value='/par/pmm/itemGroup/selectComboItemGroupLevels.do' />"
                                ,data:JSON.stringify({sLvlVal:3, sUseYn:"Y"})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,error:function(jqXHR,status,error){

                                }
                                ,success:function(jqXHR, textStatus){
                                    var partItemGrpTypeThreeCdList = [];
                                    $.each(jqXHR, function(idx, row){
                                        partItemGrpTypeThreeCdList.push({
                                            "cmmCd":row.itemGrpCd
                                            ,"cmmCdNm":row.itemGrpNm
                                        });
                                    });

                                    $("#sPartItemGrpTypeThree").data("kendoExtDropDownList").dataSource.data(partItemGrpTypeThreeCdList);
                                }
                            });


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
        //btnAdd03
        $("#btnAdd03").kendoButton({
            click:function(e){
                // sPartItemGrpTypeTwo empty value checked
                if($("#sPartItemGrpTypeTwo").val() != ""){

                    $('#grid03').data('kendoExtGrid').dataSource.insert(0, {
                        "dlrCd":""
                        ,"itemDstinCd":$("#sPartItemGrpTypeTwo").val()
                        ,"itemGrpCd":null
                        ,"itemGrpNm":$("#sPartItemGrpTypeTwo").data("kendoExtDropDownList").text()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#sPartItemGrpTypeTwo").data("kendoExtDropDownList").text()
                        ,"lvlVal":3
                        ,"pentItemDstinCd":$("#sPartItemGrpTypeTwo").val()
                        ,"baseTreeLvlId":null
                        ,"regUsrId":null
                        ,"regDt":null
                        ,"updtUsrId":null
                        ,"updtDt":null
                    });
                }
                else{
                    // sPartItemGrpTypeOne dropdown select check message
                    dms.notification.info("<spring:message code='par.lbl.partItemGrpTypeOne' var='partItemGrpTypeOne' /><spring:message code='global.info.chkSelectItemMsg' arguments='${partItemGrpTypeOne}' />");
                }
            }
        });
        //btnDel03
        $("#btnDel03").kendoButton({
            click:function(e){
                var grid = $("#grid03").data("kendoExtGrid");
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
        //btnSearch04
        $("#btnSearch04").kendoButton({
            click:function(e){
                $("#grid04").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnSave04
        $("#btnSave04").kendoButton({
            click:function(e){
                var grid = $("#grid04").data("kendoExtGrid");

                if(grid.gridValidation()){
                    var multiItemGroups = grid.getCUDData("insertList", "updateList", "deleteList");
                    if(grid.cudDataLength == 0){
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    $.ajax({
                        url:"<c:url value='/par/pmm/itemGroup/multiItemGroupLevels.do' />"
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
        //btnAdd04
        $("#btnAdd04").kendoButton({
            click:function(e){
                // sPartItemGrpTypeThree empty value checked
                if($("#sPartItemGrpTypeThree").val() != ""){

                    $('#grid04').data('kendoExtGrid').dataSource.insert(0, {
                        "dlrCd":""
                        ,"itemDstinCd":$("#sPartItemGrpTypeThree").val()
                        ,"itemGrpCd":null
                        ,"itemGrpNm":$("#sPartItemGrpTypeThree").data("kendoExtDropDownList").text()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#sPartItemGrpTypeThree").data("kendoExtDropDownList").text()
                        ,"lvlVal":4
                        ,"pentItemDstinCd":$("#sPartItemGrpTypeThree").val()
                        ,"baseTreeLvlId":null
                        ,"regUsrId":null
                        ,"regDt":null
                        ,"updtUsrId":null
                        ,"updtDt":null
                    });
                }
                else{
                    // sPartItemGrpTypeTwo dropdown select check message
                    dms.notification.info("<spring:message code='par.lbl.partItemGrpTypeTwo' var='partItemGrpTypeTwo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${partItemGrpTypeTwo}' />");
                }
            }
        });
        //btnDel04
        $("#btnDel04").kendoButton({
            click:function(e){
                var grid = $("#grid04").data("kendoExtGrid");
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

        //sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });

        //sPartItemGrpTypeOne
        $("#sPartItemGrpTypeOne").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partItemGrpTypeOneCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sPartItemGrpTypeTwo
        $("#sPartItemGrpTypeTwo").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partItemGrpTypeTwoCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sPartItemGrpTypeThree
        $("#sPartItemGrpTypeThree").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partItemGrpTypeThreeCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //grid01
        $("#grid01").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "1";

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
            }
            ,height:173
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:true
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
            }
            ,columns:[
                {field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpCd' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />",width:150
                    ,attributes:{"class":"editable-cell"}
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell"}
                    ,editor:function(container, options){
                        var input = $('<input id="useYn" name="useYn" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:[{ cmmCd:"Y",cmmCdNm:"Y" },{ cmmCd:"N",cmmCdNm:"N" }]
                        }).appendTo(container);
                    }
                }//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />"
                    ,width:300
                }//remark
            ]
        });
        //grid02
        $("#grid02").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            params["sItemDstinCd"] = $("#sPartItemGrpTypeOne").val();
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "2";

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
            }
            ,height:173
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:true
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
            }
            ,columns:[
                {field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpCd' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />",width:150
                    ,attributes:{"class":"editable-cell"}
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell"}
                    ,editor:function(container, options){
                        var input = $('<input id="useYn" name="useYn" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:[{ cmmCd:"Y",cmmCdNm:"Y" },{ cmmCd:"N",cmmCdNm:"N" }]
                        }).appendTo(container);
                    }
                }//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />"
                    ,width:300
                }//remark
            ]
        });
        //grid03
        $("#grid03").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            params["sItemDstinCd"] = $("#sPartItemGrpTypeTwo").val();
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "3";

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
            }
            ,height:173
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:true
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
            }
            ,columns:[
                {field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpCd' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />",width:150
                    ,attributes:{"class":"editable-cell"}
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell"}
                    ,editor:function(container, options){
                        var input = $('<input id="useYn" name="useYn" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:[{ cmmCd:"Y",cmmCdNm:"Y" },{ cmmCd:"N",cmmCdNm:"N" }]
                        }).appendTo(container);
                    }
                }//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />"
                    ,width:300
                }//remark
            ]
        });
        //grid04
        $("#grid04").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            params["sItemDstinCd"] =$("#sPartItemGrpTypeThree").val();
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "4";

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
            }
            ,height:173
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:true
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
            }
            ,columns:[
                {field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpCd' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />",width:150
                    ,attributes:{"class":"editable-cell"}
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell"}
                    ,editor:function(container, options){
                        var input = $('<input id="useYn" name="useYn" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:[{ cmmCd:"Y",cmmCdNm:"Y" },{ cmmCd:"N",cmmCdNm:"N" }]
                        }).appendTo(container);
                    }
                }//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />"
                    ,width:300
                }//remark
            ]
        });
    });
</script>
<!-- //script -->


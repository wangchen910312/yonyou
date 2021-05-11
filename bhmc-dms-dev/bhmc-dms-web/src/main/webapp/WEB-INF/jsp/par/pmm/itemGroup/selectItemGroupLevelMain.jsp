<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- content -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.partItemGrp" /></h1> --%>
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11461" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnInit" name="btnInit" class="btn_m btn_s_min5 btn_reset"><spring:message code="par.btn.init" /></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11460" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_s_min5 hidden" id="btnExcelDownload" name="btnExcelDownload"><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11459" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_s_min5 btn_search hidden" id="btnSearch01" name="btnSearch01"><spring:message code="par.btn.search" /></button>
            </dms:access>
            </div>
        </div>
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpType" /></h2>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11473" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave01" class="btn_s btn_s_min5 btn_save"><spring:message code="par.btn.confirm" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11472" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnAdd01" class="btn_s btn_s_min5 btn_add"><spring:message code="par.btn.rowAdd" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11471" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnDel01" class="btn_s btn_s_min5 btn_del"><spring:message code="par.btn.rowDel" /></button>
                </dms:access>
                </div>
            </div>
            <div class="table_grid">
                <!-- grid -->
                <div id="grid01"></div>
                <!-- grid -->
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeOne" /></h2>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11475" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSearch02" class="btn_s btn_search hidden"><spring:message code="par.btn.search" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11470" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave02" class="btn_s btn_s_min5 btn_save"><spring:message code="par.btn.confirm" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11469" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnAdd02" class="btn_s btn_s_min5 btn_add"><spring:message code="par.btn.rowAdd" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11468" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnDel02" class="btn_s btn_s_min5 btn_del"><spring:message code="par.btn.rowDel" /></button>
                </dms:access>
                </div>
            </div>

            <div class="table_grid">
                <!-- grid -->
                <div id="grid02"></div>
                <!-- grid -->
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeTwo" /></h2>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11476" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSearch03" type="button" class="btn_s btn_search hidden"><spring:message code="par.btn.search" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11467" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSave03" type="button" class="btn_s btn_s_min5 btn_save"><spring:message code="par.btn.confirm" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11466" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnAdd03" type="button" class="btn_s btn_s_min5 btn_add"><spring:message code="par.btn.rowAdd" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11465" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDel03" type="button" class="btn_s btn_s_min5 btn_del"><spring:message code="par.btn.rowDel" /></button>
                </dms:access>
                </div>
            </div>

            <div class="table_grid">
                <!-- grid -->
                <div id="grid03"></div>
                <!-- grid -->
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeThree" /></h2>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11464" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSearch04" type="button" class="btn_s btn_search hidden"><spring:message code="par.btn.search" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11477" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSave04" type="button" class="btn_s btn_s_min5 btn_save"><spring:message code="par.btn.confirm" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11463" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnAdd04" type="button" class="btn_s btn_s_min5 btn_add"><spring:message code="par.btn.rowAdd" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11462" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDel04" type="button" class="btn_s btn_s_min5 btn_del"><spring:message code="par.btn.rowDel" /></button>
                </dms:access>
                </div>
            </div>

            <div class="table_grid">
                <!-- grid -->
                <div id="grid04"></div>
                <!-- grid -->
            </div>
        </section>

    </section>

    <section class="group hidden">
        <input id="itemGrpCd01" type="hidden" value="" />
        <input id="itemGrpNm01" type="hidden" value="" />
        <input id="pentItemDstinCd01" type="hidden" value="" />
        <input id="itemGrpCd02" type="hidden" value="" />
        <input id="itemGrpNm02" type="hidden" value="" />
        <input id="pentItemDstinCd02" type="hidden" value="" />
        <input id="itemGrpCd03" type="hidden" value="" />
        <input id="itemGrpNm03" type="hidden" value="" />
        <input id="pentItemDstinCd03" type="hidden" value="" />

        <input id="sPartItemGrpTypeOne" type="text" value="" class="form_comboBox" />
        <input id="sPartItemGrpTypeTwo" type="text" value="" class="form_comboBox" />
        <input id="sPartItemGrpTypeThree" type="text" value="" class="form_comboBox" />

    </section>
    <!-- //content -->

<!-- script -->
<script>
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){

                $("#sPartItemGrpTypeOne").data("kendoExtDropDownList").select(0);
                $("#sPartItemGrpTypeTwo").data("kendoExtDropDownList").select(0);
                $("#sPartItemGrpTypeThree").data("kendoExtDropDownList").select(0);

                $('#grid01').data('kendoExtGrid').dataSource.data([]);
                $('#grid02').data('kendoExtGrid').dataSource.data([]);
                $('#grid03').data('kendoExtGrid').dataSource.data([]);
                $('#grid04').data('kendoExtGrid').dataSource.data([]);

                $('#itemGrpCd01').val("");
                $('#itemGrpNm01').val("");
                $('#pentItemDstinCd01').val("");
                $('#itemGrpCd02').val("");
                $('#itemGrpNm02').val("");
                $('#pentItemDstinCd02').val("");
                $('#itemGrpCd03').val("");
                $('#itemGrpNm03').val("");
                $('#pentItemDstinCd03').val("");

                $("#grid01").data("kendoExtGrid").dataSource.read();
            }
        });

        //btnExcelDownload
        $("#btnExcelDownload").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
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

                var rnum = $('#grid01').data('kendoExtGrid').dataSource.total();

                $('#grid01').data('kendoExtGrid').dataSource.insert(0, {
                    "rnum":rnum +1
                    ,"dlrCd":""
                    ,"itemDstinCd":"02"
                    ,"itemGrpCd":""
                    ,"itemGrpNm":""
                    ,"useYn":"Y"
                    ,"dbYn":"N"
                    ,"remark":""
                    ,"lvlVal":1
                    ,"pentItemDstinCd":"02"
                    ,"baseTreeLvlId":""
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
                if($("#itemGrpCd01").val() != ""){

                    var rnum = $('#grid02').data('kendoExtGrid').dataSource.total();

                    $('#grid02').data('kendoExtGrid').dataSource.insert(0, {
                        "rnum":rnum + 1
                        ,"dlrCd":""
                        ,"itemDstinCd":$("#itemGrpCd01").val()
                        ,"itemGrpCd":""
                        ,"itemGrpNm":$("#itemGrpNm01").val()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#itemGrpNm01").val()
                        ,"lvlVal":2
                        ,"pentItemDstinCd":$("#itemGrpCd01").val()
                        ,"baseTreeLvlId":""
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
                if($("#itemGrpCd02").val() != ""){

                    var rnum = $('#grid03').data('kendoExtGrid').dataSource.total();

                    $('#grid03').data('kendoExtGrid').dataSource.insert(0, {
                        "rnum":rnum + 1
                        ,"dlrCd":""
                        ,"itemDstinCd":$("#itemGrpCd02").val()
                        ,"itemGrpCd":""
                        ,"itemGrpNm":$("#itemGrpNm02").val()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#itemGrpNm02").val()
                        ,"lvlVal":3
                        ,"pentItemDstinCd":$("#itemGrpCd02").val()
                        ,"baseTreeLvlId":""
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
                if($("#itemGrpCd03").val() != ""){

                    var rnum = $('#grid04').data('kendoExtGrid').dataSource.total();

                    $('#grid04').data('kendoExtGrid').dataSource.insert(0, {
                        "rnum":rnum + 1
                        ,"dlrCd":""
                        ,"itemDstinCd":$("#itemGrpCd03").val()
                        ,"itemGrpCd":""
                        ,"itemGrpNm":$("#itemGrpNm03").val()
                        ,"useYn":"Y"
                        ,"dbYn":"N"
                        ,"remark":$("#itemGrpNm03").val()
                        ,"lvlVal":4
                        ,"pentItemDstinCd":$("#itemGrpCd03").val()
                        ,"baseTreeLvlId":""
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
            gridId:"G-PAR-0804-113701"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
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
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:94
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:true
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if (e.model.dbYn == "Y") {
                    if(fieldName=="itemGrpCd"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#itemGrpCd01").val(selectedItem.itemGrpCd);
                    $("#itemGrpNm01").val(selectedItem.itemGrpNm);
                    $("#pentItemDstinCd01").val(selectedItem.pentItemDstinCd);

                    $('#grid02').data('kendoExtGrid').dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                if(rows.length > 0){
                    var row = $(rows[0]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem.dbYn === "N"){
                        // row add after cell focus
                        var sender = e.sender;
                        var cellToEdit = sender.content.find("td:eq(2)");
                        sender.editCell(cellToEdit);
                    }
                }

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.dbYn === "Y"){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpCd' />"
                    ,width:120
                    ,attributes:{"class":"editable-cell"}
                    ,editor:function(container, options){
                        $('<input required name="itemGrpCd" data-bind="value:' + options.field + '" type="text" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                            mask:"CCCC"
                            ,promptChar:" "
                        });
                    }
                }//itemGrpCd
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />" ,width:270 ,attributes:{"class":"editable-cell bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "30" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell bg_white"}
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
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300,attributes:{"class":"bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "1000" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//remark
                ,{field:"updtUsrId", title:"<spring:message code='par.lbl.checkUsrNm' />" ,width:100 }//updtUsrId
                ,{field:"updtDt", title:"<spring:message code='par.lbl.checkUsrDt' />" , width:100, format:"{0:<dms:configValue code='dateFormat' />}" }//updtDt
            ]
        });
        //grid02
        $("#grid02").kendoExtGrid({
            gridId:"G-PAR-0804-113702"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemGrpCd01 = $('#itemGrpCd01').val() == "" ? "X":$('#itemGrpCd01').val();
                            params["sItemDstinCd"] = $('#itemGrpCd01').val();
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
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:94
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if(fieldName=="itemDstinCd"){
                    this.closeCell();
                }

                if (e.model.dbYn == "Y") {
                    if(fieldName=="itemGrpCd"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#itemGrpCd02").val(selectedItem.itemGrpCd);
                    $("#itemGrpNm02").val(selectedItem.itemGrpNm);
                    $("#pentItemDstinCd02").val(selectedItem.pentItemDstinCd);

                    $('#grid03').data('kendoExtGrid').dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                if(rows.length > 0){
                    var row = $(rows[0]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem.dbYn === "N"){
                        // row add after cell focus
                        var sender = e.sender;
                        var cellToEdit = sender.content.find("td:eq(3)");
                        sender.editCell(cellToEdit);
                    }
                }

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.dbYn === "Y"){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }

                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrp' />", width:120}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpTypeOne' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpTypeOneNm' />", width:150, attributes:{"class":"editable-cell bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "30" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                }
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell bg_white"}
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
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300,attributes:{"class":"bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "1000" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//remark
                ,{field:"updtUsrId", title:"<spring:message code='par.lbl.checkUsrNm' />" ,width:100 }//updtUsrId
                ,{field:"updtDt", title:"<spring:message code='par.lbl.checkUsrDt' />" , width:100, format:"{0:<dms:configValue code='dateFormat' />}" }//updtDt
            ]
        });
        //grid03
        $("#grid03").kendoExtGrid({
            gridId:"G-PAR-0804-113703"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemGrpCd02 = $('#itemGrpCd02').val() == "" ? "X":$('#itemGrpCd02').val();
                            params["sItemDstinCd"] = itemGrpCd02;
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
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:127
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,edit:function(e){

                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if(fieldName=="itemDstinCd"){
                    this.closeCell();
                }

                if (e.model.dbYn == "Y") {
                    if(fieldName=="itemGrpCd"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#itemGrpCd03").val(selectedItem.itemGrpCd);
                    $("#itemGrpNm03").val(selectedItem.itemGrpNm);
                    $("#pentItemDstinCd03").val(selectedItem.pentItemDstinCd);

                    $('#grid04').data('kendoExtGrid').dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                if(rows.length > 0){
                    var row = $(rows[0]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem.dbYn === "N"){
                        // row add after cell focus
                        var sender = e.sender;
                        var cellToEdit = sender.content.find("td:eq(3)");
                        sender.editCell(cellToEdit);
                    }
                }

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.dbYn === "Y"){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }

                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrpTypeOne' />", width:120}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpTypeTwo' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpTypeTwoNm' />", width:150, attributes:{"class":"editable-cell bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "30" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell bg_white"}
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
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300,attributes:{"class":"bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "1000" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//remark
                ,{field:"updtUsrId", title:"<spring:message code='par.lbl.checkUsrNm' />" ,width:100 }//updtUsrId
                ,{field:"updtDt", title:"<spring:message code='par.lbl.checkUsrDt' />" , width:100, format:"{0:<dms:configValue code='dateFormat' />}" }//updtDt
            ]
        });
        //grid04
        $("#grid04").kendoExtGrid({
            gridId:"G-PAR-0804-113704"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemGrpCd03 = $('#itemGrpCd03').val() == "" ? "X":$('#itemGrpCd03').val();
                            params["sItemDstinCd"] = itemGrpCd03;
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
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){

                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if(fieldName=="itemDstinCd"){
                    this.closeCell();
                }

                if (e.model.dbYn == "Y") {
                    if(fieldName=="itemGrpCd"){
                        this.closeCell();
                    }
                }
            }
            ,height:127
            ,pageable:false
            ,navigatable:true
            ,selectable:"multiple, row"
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,dataBound:function(e){

                var rows = e.sender.tbody.children();

                if(rows.length > 0){
                    var row = $(rows[0]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.dbYn === "N"){
                        // row add after cell focus
                        var sender = e.sender;
                        var cellToEdit = sender.content.find("td:eq(3)");
                        sender.editCell(cellToEdit);
                    }
                }

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.dbYn === "Y"){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }

                });

            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrpTypeTwo' />", width:120}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpTypeThree' />"
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
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpTypeThreeNm' />", width:150, attributes:{"class":"editable-cell bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "30" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />"
                    ,width:80
                    ,attributes:{"class":"ac editable-cell bg_white"}
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
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300,attributes:{"class":"bg_white"}
                    ,editor:function(container, options){
                        $('<input name="itemGrpNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "1000" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//remark
                ,{field:"updtUsrId", title:"<spring:message code='par.lbl.checkUsrNm' />" ,width:100 }//updtUsrId
                ,{field:"updtDt", title:"<spring:message code='par.lbl.checkUsrDt' />" , width:100, format:"{0:<dms:configValue code='dateFormat' />}" }//updtDt
            ]
        });
    });
</script>
<!-- //script -->


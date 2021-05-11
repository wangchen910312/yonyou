<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.stdrdStockParameter" /><!-- 合理库存参数管理 --></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11869" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11868" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" type="button" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.confirm" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11867" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnCancel" type="button" class="btn_m btn_m_min btn_cancel"><spring:message code="par.btn.cancel" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11866" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" type="button" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button>
        </dms:access>
        </div>
    </div>
    <div class="table_form">
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.stdDmndPrid" /></span></th>
                    <td>
                        <input id="sStdDmndPrid" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td>
                        <label class="label_check"><input id="sAvgDvsRflYn" type="checkbox" name="" class="form_check"><spring:message code="par.lbl.avgDvsRflYn" /><!-- 平均偏差反应与否 --></label>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.avgDvsRflRate" /><!-- 平均偏差反应比例 --></th>
                    <td>
                        <input id="sAvgDvsRflRate" class="ar"  />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <%-- <h2 class="title_basic"><spring:message code="par.title.safetyWeightInfo" /><!-- 需求期间加权值信息 --></h2> --%>
    </div>
    <div class="table_grid">
        <div id="safetyWeightGrid" class="grid" ></div>
    </div>

    <div class="table_grid mt10">
        <div id="supplyRuleGrid" class="grid" ></div>
    </div>
    <div class="mt10">
        <p class="mt5"><spring:message code="par.lbl.saftyStockCalFormular04" />:=<spring:message code="par.lbl.saftyStockCalFormular03" />*（<spring:message code="par.lbl.saftyStockCalFormular01" /><input id="sVal01" class="ar" style="width:50px;padding-bottom:1px" />/30+<spring:message code="par.lbl.saftyStockCalFormular02" /><input id="sVal02" class="ar" style="width:50px;padding-bottom:1px" /><span>/30+<spring:message code="par.lbl.saftyStockCalFormular05" />+<spring:message code="par.lbl.saftyStockCalFormular06" />）</span></p>
    </div>

    </section>
<!-- script -->
<script type="text/javascript">

//saveMultiSafetyStockSetting Func
function saveSafetyStockSetting(){
    var vStdDmndPrid, vAvgDvsRflRate;
    vStdDmndPrid = $("#sStdDmndPrid").val();
    vAvgDvsRflRate = $("#sAvgDvsRflRate").val();

    if(vStdDmndPrid === ""){
        dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='global.info.required.field' arguments='${stdDmndPrid}' />");
        $("#sStdDmndPrid").focus();
        return false;
    }

    if(vAvgDvsRflRate === ""){
        dms.notification.info("<spring:message code='par.lbl.avgDvsRflRate' var='avgDvsRflRate' /><spring:message code='global.info.required.field' arguments='${avgDvsRflRate}' />");
        $("#sAvgDvsRflRate").focus();
        return false;
    }

    var sStdDmndPrid = $("#sStdDmndPrid").val();

    var SaftyStockSettingVO = {
        "dlrCd" :null
        ,"pltCd":null
        ,"dmndStartPrid":sStdDmndPrid
        ,"dmndEndPrid":sStdDmndPrid
        ,"stdDmndPrid":sStdDmndPrid
        ,"avgDvsRflYn":$("#sAvgDvsRflYn").is(":checked") == true ? "Y":"N"
        ,"avgDvsRflRate":$("#sAvgDvsRflRate").val()
    }

    var safetyWeightItems = $("#safetyWeightGrid").data("kendoExtGrid").dataSource.data();
    var safetyWeightSaveItems = [ ];
    var vAvgDmndPrid = 0;
    for (i = 0; i < safetyWeightItems.length; i++) {
        var dataItem = safetyWeightItems[i];
        dataItem.dmndPrid = kendo.parseFloat(dataItem.dmndPrid);

        if(i == 0){
            vAvgDmndPrid = dataItem.dmndPrid;
        }

        dataItem.totalRate = kendo.parseFloat(dataItem.totalRate);
        dataItem.rate1 = kendo.parseFloat(dataItem.rate1);
        dataItem.rate2 = kendo.parseFloat(dataItem.rate2);
        dataItem.rate3 = kendo.parseFloat(dataItem.rate3);
        dataItem.rate4 = kendo.parseFloat(dataItem.rate4);
        dataItem.rate5 = kendo.parseFloat(dataItem.rate5);
        dataItem.rate6 = kendo.parseFloat(dataItem.rate6);
        safetyWeightSaveItems.push(dataItem);

    }

    //기준수요기간, 그리드 첫행 기준수요기간 미만 확인 메시지.
    if(vAvgDmndPrid < sStdDmndPrid){
        //stdDmndPrid check message.
        dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridUnderCheckMsg' arguments='${stdDmndPrid}' />");
        return false;
    }else if(vAvgDmndPrid > sStdDmndPrid){
        //stdDmndPrid check message.
        dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
        return false;
    }
    else{
        var SaftyStockSettingSaveVO = {
            "saftyStockSettingVO":SaftyStockSettingVO
            ,"saftyStockWeightDetailVO":safetyWeightSaveItems
            ,"supplyRuleDetailVO":$("#supplyRuleGrid").data("kendoExtGrid").dataSource.data()
        }

        $.ajax({
            url:"<c:url value='/par/pmm/safetyStock/multiSafetyStockInfoes.do' />"
            ,data:JSON.stringify(SaftyStockSettingSaveVO)
            ,type:"POST"
            ,dataType:"json"
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                // success message
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }
}

//selctSafetyStockSetting Func
function selectSafetyStockSetting(){
    var vStdDmndPrid;
    vStdDmndPrid = $("#sStdDmndPrid").val();

    if(vStdDmndPrid === ""){
        dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='global.info.required.field' arguments='${stdDmndPrid}' />");
        $("#sStdDmndPrid").focus();
        return false;
    }

    $("#safetyWeightGrid").data("kendoExtGrid").dataSource.read();
}

function selectSupplyRules(){
    $("#supplyRuleGrid").data("kendoExtGrid").dataSource.read();
}

//getSafetyStockSetting Func
function getSafetyStockSetting(){

    var sStdDmndPridVal = $("#sStdDmndPrid").data("kendoExtDropDownList").value();

    $.ajax({
        url:"<c:url value='/par/pmm/safetyStock/selectSafetyStockParameterSingleByKey.do' />"
        ,data:JSON.stringify({sStdDmndPrid:sStdDmndPridVal})
        ,type:"POST"
        ,dataType:"json"
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){

            if(jqXHR.avgDvsRflYn === "Y"){
                $("#sAvgDvsRflYn").prop("checked", true);
            }else{
                $("#sAvgDvsRflYn").prop("checked", false);
            }
            $("#sAvgDvsRflRate").data("kendoExtNumericTextBox").value(jqXHR.avgDvsRflRate);
        }
    });
}

function changeSupplyRuleGrid(calVal,lineIndex){
    var grid = $("#supplyRuleGrid").data("kendoExtGrid"),
    items = grid.dataSource.data();

    var sCalVal = calVal / 30;

    for (i = 0; i < items.length; i++) {
        var item = items[i];
        if(i == lineIndex){
            item.a1 = sCalVal;
            item.a2 = sCalVal;
            item.a3 = sCalVal;
            item.a4 = sCalVal;
            item.b1 = sCalVal;
            item.b2 = sCalVal;
            item.b3 = sCalVal;
            item.b4 = sCalVal;
            item.c1 = sCalVal;
            item.c2 = sCalVal;
            item.c3 = sCalVal;
            item.c4 = sCalVal;
            item.d1 = sCalVal;
            item.d2 = sCalVal;
            item.e1 = sCalVal;
            item.e2 = sCalVal;
            item.e3 = sCalVal;
            item.e4 = sCalVal;
        }
    }
    grid.refresh();
}


var initFlag = "N";

$(document).ready(function() {

    //sStdDmndPrid
    $("#sStdDmndPrid").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:[{cmmCd:6, cmmCdNm:6}]
        ,autoBind:true
        ,index:0
    });
    //sAvgDvsRflRate
    $("#sAvgDvsRflRate").kendoExtNumericTextBox({
        format:"#.## \\\%"
        ,spinners:false
        ,max:1
        ,min:0
        ,format:"n2"
        ,decimals:2
        ,restrictDecimals: true
        ,value:0
        ,change:function(){
        }
    });
    //sVal02
    $("#sVal01").kendoExtNumericTextBox({
        spinners:false
        ,format:"n0"
        ,decimals:0
        ,restrictDecimals: true
        ,max:30000
        ,min:0
        ,value:0
        ,change:function(){
            changeSupplyRuleGrid(this.value(), 0);
        }
    });
    //sVal02
    $("#sVal02").kendoExtNumericTextBox({
        spinners:false
        ,format:"n0"
        ,decimals:0
        ,restrictDecimals: true
        ,max:30000
        ,min:0
        ,value:0
        ,change:function(){
            changeSupplyRuleGrid(this.value(), 1);
        }
    });
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            $("#sStdDmndPrid").data("kendoExtDropDownList").select(0);
            $("#sAvgDvsRflYn").prop("checked", false);
            $("#sAvgDvsRflRate").data("kendoExtNumericTextBox").value(0);

            $("#sVal01").data("kendoExtNumericTextBox").value(0);
            $("#sVal02").data("kendoExtNumericTextBox").value(0);

        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            //saveSafetyStockSetting Func
            saveSafetyStockSetting();
        }
    });
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            $("#safetyWeightGrid").data("kendoExtGrid").cancelChanges();
            $("#supplyRuleGrid").data("kendoExtGrid").cancelChanges();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            initFlag = "N";
            //getSafetyStockSetting Func
            getSafetyStockSetting();
            //selctSafetyStockSetting Func
            selectSafetyStockSetting();
        }
    });
    //safetyWeightGrid
    $("#safetyWeightGrid").kendoExtGrid({
        gridId:"G-PAR-0712-141394"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/safetyStock/selectSafetyStockWeights.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sUseYn"] = "Y";
                        params["sStdDmndPrid"] = $("#sStdDmndPrid").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"dmndPrid"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,useYn:{ type:"string" , defaultValue:"N" }
                        ,lineNo:{ type:"number" }
                        ,dmndPridTp:{ type:"string" }
                        ,dmndPrid:{ type:"number" }
                        ,totalRate:{ type:"number" }
                        ,rate1:{ type:"number" }
                        ,rate2:{ type:"number" }
                        ,rate3:{ type:"number" }
                        ,rate4:{ type:"number" }
                        ,rate5:{ type:"number" }
                        ,rate6:{ type:"number" }
                        ,rate7:{ type:"number" }
                        ,rate8:{ type:"number" }
                        ,rate9:{ type:"number" }
                        ,rate10:{ type:"number" }
                        ,rate11:{ type:"number" }
                        ,rate12:{ type:"number" }
                        ,rate13:{ type:"number" }
                        ,rate14:{ type:"number" }
                        ,rate15:{ type:"number" }
                        ,rate16:{ type:"number" }
                        ,rate17:{ type:"number" }
                        ,rate18:{ type:"number" }
                        ,rate19:{ type:"number" }
                        ,rate20:{ type:"number" }
                        ,rate21:{ type:"number" }
                        ,rate22:{ type:"number" }
                        ,rate23:{ type:"number" }
                        ,rate24:{ type:"number" }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
            //Line 1 only EditMode
            if(e.model.lineNo == 1){
                if(fieldName=="dmndPridTp" || fieldName=="dmndPrid"){
                    this.closeCell();
                }
            }else{
                this.closeCell();
            }
        }
        ,editable:true
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,filterable:false
        ,multiSelectWithCheckbox:false
        ,height:71
        ,dataBound:function(e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                if(dataItem.lineNo < 2){
                    for(i = 2;i < 8;i++){
                        var cell = row.children().eq(i);
                        cell.addClass("bg_white");
                    }
                }
            });

            if(initFlag == "N"){
                selectSupplyRules();
                initFlag = "Y";
            }
        }
        ,columns:[
            {field:"dmndPridTp", title:" ", width:100 }
            ,{field:"dmndPrid", title:"<spring:message code='par.lbl.weightTotal' />", width:100
                ,attributes:{"class":"td_total ac bob_none"}
                ,template:'#if( lineNo == 2){# #= kendo.toString(dmndPrid,"p2")# #}else{# #= kendo.toString(dmndPrid,"n0")# #}#'
            }
            ,{field:"rate1", title:"M", width:100
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="rate1"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals: true
                        ,change:function(){

                            var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var lineNo = model.get("lineNo");

                            var rate1 = model.get("rate1");
                            var rate2 = model.get("rate2");
                            var rate3 = model.get("rate3");
                            var rate4 = model.get("rate4");
                            var rate5 = model.get("rate5");
                            var rate6 = model.get("rate6");
                            rate1 = this.value();
                            var toDmndPrid = $("#sStdDmndPrid").val();
                            var fromDmndPrid = kendo.parseFloat(rate1+rate2+rate3+rate4+rate5+rate6);

                            if(toDmndPrid < fromDmndPrid){
                                //stdDmndPrid check message.
                                dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
                            }

                            var items = grid.dataSource.data();
                            for (i = 0; i < items.length; i++) {
                                var item = items[i];
                                if(i == 1){
                                    rate1 = kendo.parseFloat( this.value() / toDmndPrid);
                                    item.rate1 = kendo.toString(rate1,"p2");
                                    rate2 = kendo.parseFloat( rate2 / toDmndPrid);
                                    rate3 = kendo.parseFloat( rate3 / toDmndPrid);
                                    rate4 = kendo.parseFloat( rate4 / toDmndPrid);
                                    rate5 = kendo.parseFloat( rate5 / toDmndPrid);
                                    rate6 = kendo.parseFloat( rate6 / toDmndPrid);
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(rate1 + rate2 + rate3 + rate4 + rate5 + rate6),"p2");

                                }else{
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(fromDmndPrid),"n2");
                                }
                            }
                            grid.refresh();

                        }
                    });
                }
                ,template:'#if( lineNo == 2){# #= kendo.toString(rate1,"p2")# #}else{# #= kendo.toString(rate1,"n2")# #}#'
            }
            ,{field:"rate2", title:"M-1", width:100
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="rate2"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals: true
                        ,change:function(){
                            var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var lineNo = model.get("lineNo");

                            var rate1 = model.get("rate1");
                            var rate2 = model.get("rate2");
                            var rate3 = model.get("rate3");
                            var rate4 = model.get("rate4");
                            var rate5 = model.get("rate5");
                            var rate6 = model.get("rate6");
                            rate2 = this.value();
                            var toDmndPrid = $("#sStdDmndPrid").val();
                            var fromDmndPrid = kendo.parseFloat(rate1+rate2+rate3+rate4+rate5+rate6);
                            if(toDmndPrid < fromDmndPrid){
                                //stdDmndPrid check message.
                                dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
                            }

                            var items = grid.dataSource.data();
                            for (i = 0; i < items.length; i++) {
                                var item = items[i];
                                if(i == 1){
                                    rate1 = kendo.parseFloat( rate1 / toDmndPrid);
                                    rate2 = kendo.parseFloat( this.value() / toDmndPrid);
                                    item.rate2 = kendo.toString(rate2,'p2');
                                    rate3 = kendo.parseFloat( rate3 / toDmndPrid);
                                    rate4 = kendo.parseFloat( rate4 / toDmndPrid);
                                    rate5 = kendo.parseFloat( rate5 / toDmndPrid);
                                    rate6 = kendo.parseFloat( rate6 / toDmndPrid);
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(rate1 + rate2 + rate3 + rate4 + rate5 + rate6),'p2');
                                }else{
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(fromDmndPrid),'n2');
                                }
                            }
                            grid.refresh();

                        }
                    });
                }
                ,template:'#if( lineNo == 2){# #= kendo.toString(rate2,"p2")# #}else{# #= kendo.toString(rate2,"n2")# #}#'
            }
            ,{field:"rate3", title:"M-2", width:100
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="rate3"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals: true
                        ,change:function(){
                            var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var lineNo = model.get("lineNo");

                            var rate1 = model.get("rate1");
                            var rate2 = model.get("rate2");
                            var rate3 = model.get("rate3");
                            var rate4 = model.get("rate4");
                            var rate5 = model.get("rate5");
                            var rate6 = model.get("rate6");
                            rate3 = this.value();
                            var toDmndPrid = $("#sStdDmndPrid").val();
                            var fromDmndPrid = kendo.parseFloat(rate1+rate2+rate3+rate4+rate5+rate6);
                            if(toDmndPrid < fromDmndPrid){
                                //stdDmndPrid check message.
                                dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
                            }

                            var items = grid.dataSource.data();
                            for (i = 0; i < items.length; i++) {
                                var item = items[i];
                                if(i == 1){
                                    rate1 = kendo.parseFloat( rate1 / toDmndPrid);
                                    rate2 = kendo.parseFloat( rate2 / toDmndPrid);
                                    rate3 = kendo.parseFloat( this.value() / toDmndPrid);
                                    item.rate3 = kendo.toString(rate3,'p2');
                                    rate4 = kendo.parseFloat( rate4 / toDmndPrid);
                                    rate5 = kendo.parseFloat( rate5 / toDmndPrid);
                                    rate6 = kendo.parseFloat( rate6 / toDmndPrid);
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(rate1 + rate2 + rate3 + rate4 + rate5 + rate6),'p2');
                                }else{
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(fromDmndPrid),'n2');
                                }
                            }
                            grid.refresh();

                        }
                    });
                }
                ,template:'#if( lineNo == 2){# #= kendo.toString(rate3,"p2")# #}else{# #= kendo.toString(rate3,"n2")# #}#'
            }
            ,{field:"rate4", title:"M-3", width:100
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="rate4"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals: true
                        ,change:function(){
                            var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var lineNo = model.get("lineNo");

                            var rate1 = model.get("rate1");
                            var rate2 = model.get("rate2");
                            var rate3 = model.get("rate3");
                            var rate4 = model.get("rate4");
                            var rate5 = model.get("rate5");
                            var rate6 = model.get("rate6");
                            rate4 = this.value();
                            var toDmndPrid = $("#sStdDmndPrid").val();
                            var fromDmndPrid = kendo.parseFloat(rate1+rate2+rate3+rate4+rate5+rate6);
                            if(toDmndPrid < fromDmndPrid){
                                //stdDmndPrid check message.
                                dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
                            }
                            var items = grid.dataSource.data();
                            for (i = 0; i < items.length; i++) {
                                var item = items[i];
                                if(i == 1){
                                    rate1 = kendo.parseFloat( rate1 / toDmndPrid);
                                    rate2 = kendo.parseFloat( rate2 / toDmndPrid);
                                    rate3 = kendo.parseFloat( rate3 / toDmndPrid);
                                    rate4 = kendo.parseFloat( this.value() / toDmndPrid);
                                    item.rate4 = kendo.toString(rate4,'p2');
                                    rate5 = kendo.parseFloat( rate5 / toDmndPrid);
                                    rate6 = kendo.parseFloat( rate6 / toDmndPrid);
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(rate1 + rate2 + rate3 + rate4 + rate5 + rate6),'p2');
                                }else{
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(fromDmndPrid),'n2');
                                }
                            }
                            grid.refresh();
                        }
                    });
                }
                ,template:'#if( lineNo == 2){# #= kendo.toString(rate4,"p2")# #}else{# #= kendo.toString(rate4,"n2")# #}#'
            }
            ,{field:"rate5", title:"M-4", width:100
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="rate5"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals: true
                        ,change:function(){
                            var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var lineNo = model.get("lineNo");

                            var rate1 = model.get("rate1");
                            var rate2 = model.get("rate2");
                            var rate3 = model.get("rate3");
                            var rate4 = model.get("rate4");
                            var rate5 = model.get("rate5");
                            var rate6 = model.get("rate6");
                            rate5 = this.value();
                            var toDmndPrid = $("#sStdDmndPrid").val();
                            var fromDmndPrid = kendo.parseFloat(rate1+rate2+rate3+rate4+rate5+rate6);
                            if(toDmndPrid < fromDmndPrid){
                                //stdDmndPrid check message.
                                dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
                            }
                            var items = grid.dataSource.data();
                            for (i = 0; i < items.length; i++) {
                                var item = items[i];
                                if(i == 1){
                                    rate1 = kendo.parseFloat( rate1 / toDmndPrid);
                                    rate2 = kendo.parseFloat( rate2 / toDmndPrid);
                                    rate3 = kendo.parseFloat( rate3 / toDmndPrid);
                                    rate4 = kendo.parseFloat( rate4 / toDmndPrid);
                                    rate5 = kendo.parseFloat( this.value() / toDmndPrid);
                                    item.rate5 = kendo.toString(rate5,'p2');
                                    rate6 = kendo.parseFloat( rate6 / toDmndPrid);
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(rate1 + rate2 + rate3 + rate4 + rate5 + rate6),'p2');
                                }else{
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(fromDmndPrid),'n2');
                                }
                            }
                            grid.refresh();
                        }
                    });
                }
                ,template:'#if( lineNo == 2){# #= kendo.toString(rate5,"p2")# #}else{# #= kendo.toString(rate5,"n2")# #}#'
            }
            ,{field:"rate6", title:"M-5", width:100
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="rate6"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals: true
                        ,change:function(){
                            var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var lineNo = model.get("lineNo");

                            var rate1 = model.get("rate1");
                            var rate2 = model.get("rate2");
                            var rate3 = model.get("rate3");
                            var rate4 = model.get("rate4");
                            var rate5 = model.get("rate5");
                            var rate6 = model.get("rate6");
                            rate6 = this.value();
                            var toDmndPrid = $("#sStdDmndPrid").val();
                            var fromDmndPrid = kendo.parseFloat(rate1+rate2+rate3+rate4+rate5+rate6);
                            if(toDmndPrid < fromDmndPrid){
                                //stdDmndPrid check message.
                                dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='par.info.stdDmndPridCheckMsg' arguments='${stdDmndPrid}' />");
                            }
                            var items = grid.dataSource.data();
                            for (i = 0; i < items.length; i++) {
                                var item = items[i];
                                if(i == 1){
                                    rate1 = kendo.parseFloat( rate1 / toDmndPrid);
                                    rate2 = kendo.parseFloat( rate2 / toDmndPrid);
                                    rate3 = kendo.parseFloat( rate3 / toDmndPrid);
                                    rate4 = kendo.parseFloat( rate4 / toDmndPrid);
                                    rate5 = kendo.parseFloat( rate5 / toDmndPrid);
                                    rate6 = kendo.parseFloat( this.value() / toDmndPrid);
                                    item.rate6 = kendo.toString(rate6,'p2');
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(rate1 + rate2 + rate3 + rate4 + rate5 + rate6),'p2');
                                }else{
                                    item.dmndPrid = kendo.toString(kendo.parseFloat(fromDmndPrid),'n2');
                                }
                            }
                            grid.refresh();


                        }
                    });
                }
                ,template:'#if( lineNo == 2){# #= kendo.toString(rate6,"p2")# #}else{# #= kendo.toString(rate6,"n2")# #}#'
            }

        ]
    });
    //supplyRuleGrid
    $("#supplyRuleGrid").kendoExtGrid({
        gridId:"G-PAR-0712-141994"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/supplyRule/selectSupplyRulesPivotByCondition.do' />"
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
                    id:"a1"
                    ,fields:{
                        abcIndTp:{ type:"string" }
                        ,a1:{ type:"number" }
                        ,a2:{ type:"number" }
                        ,a3:{ type:"number" }
                        ,a4:{ type:"number" }
                        ,b1:{ type:"number" }
                        ,b2:{ type:"number" }
                        ,b3:{ type:"number" }
                        ,b4:{ type:"number" }
                        ,c1:{ type:"number" }
                        ,c2:{ type:"number" }
                        ,c3:{ type:"number" }
                        ,c4:{ type:"number" }
                        ,d1:{ type:"number" }
                        ,d2:{ type:"number" }
                        ,e1:{ type:"number" }
                        ,e2:{ type:"number" }
                        ,e3:{ type:"number" }
                        ,e4:{ type:"number" }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if(fieldName=="abcIndTp"){
                this.closeCell();
            }
        }
        ,editable:true
        ,pageable:false
        ,autoBind:false
        ,filterable:false
        ,sortable:false
        ,multiSelectWithCheckbox:false
        ,height:117
        ,dataBound:function(e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                for(i = 1;i < 19;i++){
                    var cell = row.children().eq(i);
                    cell.addClass("bg_white");
                }

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

            });
        }
        ,columns:[
            {field:"abcIndTp", title:"<spring:message code='par.lbl.dmndPridTp' />", width:80 }
            ,{field:"a1", title:"A1", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="a1"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"a2", title:"A2", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="a2"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"a3", title:"A3", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="a3"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"a4", title:"A4", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="a4"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"b1", title:"B1", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="b1"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"b2", title:"B2", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="b2"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"b3", title:"B3", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="b3"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"b4", title:"B4", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="b4"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"c1", title:"C1", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="c1"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"c2", title:"C2", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="c2"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"c3", title:"C3", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="c3"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"c4", title:"C4", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="c4"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"d1", title:"D1", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="d1"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"d2", title:"D2", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="d2"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"e1", title:"E1", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="e1"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"e2", title:"E2", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="e2"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"e3", title:"E3", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="e3"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"e4", title:"E4", width:50
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '" name="e4"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,min:0
                        ,format:"n2"
                        ,decimals:2
                        ,restrictDecimals:true
                        ,change:function(){
                        }
                    });
                }
            }

        ]
    });

    //적정재고산출정보 가져오기.
    getSafetyStockSetting();
});

</script>
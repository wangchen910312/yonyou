<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- content -->
    <section id="content">
        <!-- 부품임무관리 -->
        <section class="group">
            <div class="header_area">
                <%-- <h1 class="title_basic"><spring:message code="par.title.corpSalesAchievement" /></h1> --%>
                <div class="btn_left">
    			<dms:access viewId="VIEW-D-11480" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
    			</dms:access>
                </div>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11479" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave" class="btn_m btn_add" ><spring:message code="par.btn.salePlan" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11478" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
                </dms:access>
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
                            <th scope="row"><spring:message code="par.lbl.year" /></th>
                            <td>
                                <input id="sYear" value="" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.month" /></th>
                            <td>
                                <input id="sMonth" value="" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                            <td>
                                <input id="sItemDstinCd" name="sItemDstinCd" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.salePlanActTp" /></th>
                            <td>
                                <input id="sDstDstinCd" name="sDstDstinCd" value="" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area mt5">
        <ul>
            <li id ="tabPlanTp01" class="k-state-active"><spring:message code="par.title.planTp01" /></li>
            <li id ="tabPlanTp02"><spring:message code="par.title.planTp02" /></li>
            <li id ="tabPlanTp03"><spring:message code="par.title.planTp03" /></li>
        </ul>
            <!--tabPlanTp01 tab area -->
            <div class="mt0">
                <section class="group">
                <div class="header_area">
                    <div class="btn_right_absolute">
                        <spring:message code="par.lbl.planUnit" />
                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridPlan01" class="resizable_grid"></div>
                </div>
                </section>

            </div>

            <!--tabPlanTp02 tab area -->
            <div class="mt0">
                <section class="group">
                <div class="header_area">
                    <div class="btn_right_absolute">
                        <spring:message code="par.lbl.planUnit" />
                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridPlan02" class="resizable_grid"></div>
                </div>
                </section>
            </div>

            <!--tabPlanTp03 tab area -->
            <div class="mt0">
                <section class="group">
                <div class="header_area">
                    <div class="btn_right_absolute">
                        <spring:message code="par.lbl.planUnit" />
                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridPlan03" class="resizable_grid"></div>
                </div>
                </section>
            </div>

        </div>

        <!-- // 업무관리(계획실적) -->
    </section>
</div>

<!-- //content -->

<!-- script -->
<script>
//dstDstinCdList
var dstDstinCdList = [];
<c:forEach var="obj" items="${dstDstinCdList}">
    dstDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dstDstinCdMap = {};
$.each(dstDstinCdList, function(idx, obj){
    dstDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//dstDstinTpList
var dstDstinTpList = [];
var dstDstinTpList02 = [];
<c:forEach var="obj" items="${dstDstinTpList}">
    dstDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dstDstinTpList02.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dstDstinTpMap = {};
$.each(dstDstinTpList02, function(idx, obj){
    dstDstinTpMap[obj.cmmCd] = obj.cmmCdNm;
});

var itemDstinCdList= [],
itemDstinCdAllList= [],
itemDstinTpMap = {};
<c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
if("${obj.useYn}" !== 'N'){
    itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
itemDstinCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
$.each(itemDstinCdAllList, function(idx, obj){
    itemDstinTpMap[obj.cmmCd] = obj.cmmCdNm;
});

function pageInit(){
    $("#sYear").data("kendoExtDropDownList").select(0);
    $("#sMonth").data("kendoExtDropDownList").select(0);
    $("#gridPlan01").data('kendoExtGrid').cancelChanges();
}

//get tab info and type and grid info
function getSelectedGridObj(){
    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
    var tabIndex = tabStrip.select().index();

    var grid = null;
    if(tabIndex === 0){
        grid = $("#gridPlan01").data("kendoExtGrid");

    }else if(tabIndex === 1){
        grid = $("#gridPlan02").data("kendoExtGrid");

    }else if(tabIndex === 2){
        grid = $("#gridPlan03").data("kendoExtGrid");

    }else{
        return false;
    }

    var gridObj = {
        "grid":grid
        ,"tabIndex":tabIndex
    }

    return gridObj;
}

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call.
            pageInit();
        }
    });
    //btnExcelUpload
    $("#btnExcelUpload").kendoButton({
        click:function(e){
            //ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){

            var vYy = $("#sYear").val();
            if(vYy == ""){
                //sYear check message
                dms.notification.info("<spring:message code='par.lbl.year' var='yearMsg' /><spring:message code='global.info.check.field' arguments='${yearMsg}' />");
                return false;
            }

            var gridObj = getSelectedGridObj();
            var grid = gridObj.grid;
            grid.dataSource.read();
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            var gridObj = getSelectedGridObj();
            var grid = gridObj.grid;

            if(grid.gridValidation()){
                var multiSalePlans = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/cpm/corpSalesAchievements/multiSalePlans.do' />"
                    ,data:JSON.stringify(multiSalePlans)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){

                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

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

    //sYear
    $("#sYear").kendoExtDropDownList({
        dataSource:[{cmmCd:2015, cmmCdNm:2015},{cmmCd:2016,  cmmCdNm:2016},{cmmCd:2017,  cmmCdNm:2017},{cmmCd:2018,  cmmCdNm:2018}]
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    $("#sYear").data("kendoExtDropDownList").value("${sysNowDateYear}");
    //sMonth
    $("#sMonth").kendoExtDropDownList({
        dataSource:[{cmmCd:'01', cmmCdNm:'01'},{cmmCd:'02',  cmmCdNm:'02'},{cmmCd:'03',  cmmCdNm:'03'},{cmmCd:'04',  cmmCdNm:'04'},{cmmCd:'05',  cmmCdNm:'05'},{cmmCd:'06',  cmmCdNm:'06'},{cmmCd:'07',  cmmCdNm:'07'},{cmmCd:'08',  cmmCdNm:'08'},{cmmCd:'09',  cmmCdNm:'09'},{cmmCd:'10',  cmmCdNm:'10'},{cmmCd:'11',  cmmCdNm:'11'},{cmmCd:'12',  cmmCdNm:'12'}]
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
        ,change:function(){
            var gridObj = getSelectedGridObj();
            var grid = gridObj.grid;
            grid.dataSource.read();
        }
    });
    $("#sMonth").data("kendoExtDropDownList").value("${sysNowDateMonth}");
    //sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
        dataSource:itemDstinCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    //sDstDstinCd
    $("#sDstDstinCd").kendoExtDropDownList({
        dataSource:dstDstinTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    // tabStrip
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;
        }
    });
    //gridPlan01
    $("#gridPlan01").kendoExtGrid({
        gridId:"G-PAR-0727-111301"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/corpSalesAchievements/selectSalesAchievementsPlans.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sYy"] = $("#sYear").val();
                        params["sLastYy"] = $("#sYear").val()-1;
                        params["sMm"] = $("#sMonth").val();
                        params["sYyMm"] = $("#sYear").val()+$("#sMonth").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val()
                        params["sDstDstinTp"] = "01";//임무구분

                        var sSaleTp = "";
                        if($("#sDstDstinCd").val() == "01"){
                            sSaleTp = "N";
                        }else if($("#sDstDstinCd").val() == "02"){
                            sSaleTp = "Y";
                        }else if($("#sDstDstinCd").val() == "03"){
                            sSaleTp = "Z";
                        }

                        params["sSaleTp"] = sSaleTp;//계획, 목표 구분

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"yyMm"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,itemDstinCd:{ type:"string", editable:false}
                        ,saleTp:{ type:"string", editable:false}
                        ,dstDstinCd:{ type:"string", editable:false}
                        ,dstDstinTp:{ type:"string", editable:false}
                        ,thisYear:{ type:"number", editable:false}
                        ,lastYear:{ type:"number", editable:false}
                        ,yyMm:{ type:"string", editable:false}
                        ,thisYearTot:{ type:"number", editable:false}
                        ,lastYearTot:{ type:"number", editable:false}
                        ,month01:{ type:"number"}
                        ,month01Cost:{ type:"number", editable:false}
                        ,month02:{ type:"number"}
                        ,month02Cost:{ type:"number", editable:false}
                        ,month03:{ type:"number"}
                        ,month03Cost:{ type:"number", editable:false}
                        ,month04:{ type:"number"}
                        ,month04Cost:{ type:"number", editable:false}
                        ,month05:{ type:"number"}
                        ,month05Cost:{ type:"number", editable:false}
                        ,month06:{ type:"number"}
                        ,month06Cost:{ type:"number", editable:false}
                        ,month07:{ type:"number"}
                        ,month07Cost:{ type:"number", editable:false}
                        ,month08:{ type:"number"}
                        ,month08Cost:{ type:"number", editable:false}
                        ,month09:{ type:"number"}
                        ,month09Cost:{ type:"number", editable:false}
                        ,month10:{ type:"number"}
                        ,month10Cost:{ type:"number", editable:false}
                        ,month11:{ type:"number"}
                        ,month11Cost:{ type:"number", editable:false}
                        ,month12:{ type:"number"}
                        ,month12Cost:{ type:"number", editable:false}
                    }
                }
            }
        }
        ,edit:function(e){

            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if(e.model.saleTp == "Y" || e.model.saleTp == "Z") {
                if(fieldName=="month01" || fieldName=="month02" || fieldName=="month03" || fieldName=="month04" || fieldName=="month05" || fieldName=="month06" || fieldName=="month07" || fieldName=="month08" || fieldName=="month09" || fieldName=="month10" || fieldName=="month11" || fieldName=="month12"){
                    this.closeCell();
                }
            }
        }
        ,dataBound:function(e){

            var sMonth = $("#sMonth").val();
            var sMonthVal = 0;

            if(sMonth != ""){
                sMonthVal = kendo.parseInt(sMonth);
                sMonthVal += 4;
            }

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                if(dataItem.saleTp == "N"){
                    for(i = 5;i < 17;i++){
                        var cell = row.children().eq(i);

                        if(sMonthVal == i){
                            cell.addClass("bg_red");
                        }else{
                            cell.addClass("bg_white");
                        }
                    }
                }
            });
        }
        ,selectable:"row"
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,height:484
        ,columns:[
            {field:"itemDstinCd", title:"<spring:message code='par.lbl.salePlanTp' />", width:80
                ,template:'#if(itemDstinTpMap[itemDstinCd] !== undefined ){# #= itemDstinTpMap[itemDstinCd]# #}#'
            }
            ,{field:"saleTp", title:"<spring:message code='par.lbl.salePlanActTp' />", width:50
                //,hidden:true
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "N"){
                        spanObj = dstDstinTpMap["01"];
                    }else if(dataItem.saleTp == "Y"){
                        spanObj = dstDstinTpMap["02"];
                    }else{
                        spanObj = dstDstinTpMap["03"];
                    }
                    return spanObj;
                }
            }
            ,{field:"thisYear", title:"<spring:message code='par.lbl.year' />", width:50}
            ,{field:"lastYearTot", title:"N-1<spring:message code='par.lbl.year' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.lastYearTot / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.lastYearTot,"n2");
                    }
                    return spanObj;
                }
            }
            ,{field:"thisYearTot", title:"N<spring:message code='par.lbl.year' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.thisYearTot / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.thisYearTot,"n2");
                    }
                    return spanObj;
                }
            }
            ,{field:"month01", title:"1<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month01 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month01,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month02", title:"2<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month02 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month02,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month03", title:"3<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month03 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month03,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{ field:"month04", title:"4<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month04 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month04,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month05", title:"5<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month05 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month05,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month06", title:"6<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month06 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month06,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month07", title:"7<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month07 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month07,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month08", title:"8<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month08 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month08,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month09", title:"9<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month09 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month09,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month10", title:"10<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month10 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month10,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month11", title:"11<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month11 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month11,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month12", title:"12<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month12 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month12,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
        ]
    });
    //gridPlan02
    $("#gridPlan02").kendoExtGrid({
        gridId:"G-PAR-0927-102301"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/corpSalesAchievements/selectSalesAchievementsPlans.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sYy"] = $("#sYear").val();
                        params["sLastYy"] = $("#sYear").val()-1;
                        params["sMm"] = $("#sMonth").val();
                        params["sYyMm"] = $("#sYear").val()+$("#sMonth").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val()
                        params["sDstDstinTp"] = "02";//임무구분

                        var sSaleTp = "";
                        if($("#sDstDstinCd").val() == "01"){
                            sSaleTp = "N";
                        }else if($("#sDstDstinCd").val() == "02"){
                            sSaleTp = "Y";
                        }else if($("#sDstDstinCd").val() == "03"){
                            sSaleTp = "Z";
                        }

                        params["sSaleTp"] = sSaleTp;//계획, 목표 구분

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"yyMm"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,itemDstinCd:{ type:"string", editable:false}
                        ,saleTp:{ type:"string", editable:false}
                        ,dstDstinCd:{ type:"string", editable:false}
                        ,dstDstinTp:{ type:"string", editable:false}
                        ,thisYear:{ type:"number", editable:false}
                        ,lastYear:{ type:"number", editable:false}
                        ,yyMm:{ type:"string", editable:false}
                        ,thisYearTot:{ type:"number", editable:false}
                        ,lastYearTot:{ type:"number", editable:false}
                        ,month01:{ type:"number"}
                        ,month01Cost:{ type:"number", editable:false}
                        ,month02:{ type:"number"}
                        ,month02Cost:{ type:"number", editable:false}
                        ,month03:{ type:"number"}
                        ,month03Cost:{ type:"number", editable:false}
                        ,month04:{ type:"number"}
                        ,month04Cost:{ type:"number", editable:false}
                        ,month05:{ type:"number"}
                        ,month05Cost:{ type:"number", editable:false}
                        ,month06:{ type:"number"}
                        ,month06Cost:{ type:"number", editable:false}
                        ,month07:{ type:"number"}
                        ,month07Cost:{ type:"number", editable:false}
                        ,month08:{ type:"number"}
                        ,month08Cost:{ type:"number", editable:false}
                        ,month09:{ type:"number"}
                        ,month09Cost:{ type:"number", editable:false}
                        ,month10:{ type:"number"}
                        ,month10Cost:{ type:"number", editable:false}
                        ,month11:{ type:"number"}
                        ,month11Cost:{ type:"number", editable:false}
                        ,month12:{ type:"number"}
                        ,month12Cost:{ type:"number", editable:false}
                    }
                }
            }
        }
        ,edit:function(e){

            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if(e.model.saleTp == "Y" || e.model.saleTp == "Z") {
                if(fieldName=="month01" || fieldName=="month02" || fieldName=="month03" || fieldName=="month04" || fieldName=="month05" || fieldName=="month06" || fieldName=="month07" || fieldName=="month08" || fieldName=="month09" || fieldName=="month10" || fieldName=="month11" || fieldName=="month12"){
                    this.closeCell();
                }
            }
        }
        ,dataBound:function(e){

            var sMonth = $("#sMonth").val();
            var sMonthVal = 0;

            if(sMonth != ""){
                sMonthVal = kendo.parseInt(sMonth);
                sMonthVal += 4;
            }

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                if(dataItem.saleTp == "N"){
                    for(i = 5;i < 17;i++){
                        var cell = row.children().eq(i);

                        if(sMonthVal == i){
                            cell.addClass("bg_red");
                        }else{
                            cell.addClass("bg_white");
                        }
                    }
                }
            });
        }
        ,selectable:"row"
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,height:484
        ,columns:[
            {field:"itemDstinCd", title:"<spring:message code='par.lbl.salePlanTp' />", width:80
                ,template:'#if(itemDstinTpMap[itemDstinCd] !== undefined ){# #= itemDstinTpMap[itemDstinCd]# #}#'
            }
            ,{field:"saleTp", title:"<spring:message code='par.lbl.salePlanActTp' />", width:50
                //,hidden:true
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "N"){
                        spanObj = dstDstinTpMap["01"];
                    }else if(dataItem.saleTp == "Y"){
                        spanObj = dstDstinTpMap["02"];
                    }else{
                        spanObj = dstDstinTpMap["03"];
                    }
                    return spanObj;
                }
            }
            ,{field:"thisYear", title:"<spring:message code='par.lbl.year' />", width:50}
            ,{field:"lastYearTot", title:"N-1<spring:message code='par.lbl.year' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.lastYearTot / 100,"p2");
                    }else{
                        spanObj = dataItem.lastYearTot;
                    }
                    return spanObj;
                }
            }
            ,{field:"thisYearTot", title:"N<spring:message code='par.lbl.year' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.thisYearTot / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.thisYearTot,"n2");
                    }
                    return spanObj;
                }
            }
            ,{field:"month01", title:"1<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month01 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month01,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month02", title:"2<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month02 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month02,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month03", title:"3<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month03 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month03,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{ field:"month04", title:"4<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month04 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month04,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month05", title:"5<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month05 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month05,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month06", title:"6<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month06 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month06,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month07", title:"7<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month07 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month07,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month08", title:"8<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month08 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month08,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month09", title:"9<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month09 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month09,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month10", title:"10<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month10 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month10,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month11", title:"11<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month11 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month11,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month12", title:"12<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month12 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month12,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
        ]
    });
    //gridPlan03
    $("#gridPlan03").kendoExtGrid({
        gridId:"G-PAR-0927-102302"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/corpSalesAchievements/selectSalesAchievementsPlans.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sYy"] = $("#sYear").val();
                        params["sLastYy"] = $("#sYear").val()-1;
                        params["sMm"] = $("#sMonth").val();
                        params["sYyMm"] = $("#sYear").val()+$("#sMonth").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val()
                        params["sDstDstinTp"] = "03";//임무구분

                        var sSaleTp = "";
                        if($("#sDstDstinCd").val() == "01"){
                            sSaleTp = "N";
                        }else if($("#sDstDstinCd").val() == "02"){
                            sSaleTp = "Y";
                        }else if($("#sDstDstinCd").val() == "03"){
                            sSaleTp = "Z";
                        }

                        params["sSaleTp"] = sSaleTp;//계획, 목표 구분

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"yyMm"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,itemDstinCd:{ type:"string", editable:false}
                        ,saleTp:{ type:"string", editable:false}
                        ,dstDstinCd:{ type:"string", editable:false}
                        ,dstDstinTp:{ type:"string", editable:false}
                        ,thisYear:{ type:"number", editable:false}
                        ,lastYear:{ type:"number", editable:false}
                        ,yyMm:{ type:"string", editable:false}
                        ,thisYearTot:{ type:"number", editable:false}
                        ,lastYearTot:{ type:"number", editable:false}
                        ,month01:{ type:"number"}
                        ,month01Cost:{ type:"number", editable:false}
                        ,month02:{ type:"number"}
                        ,month02Cost:{ type:"number", editable:false}
                        ,month03:{ type:"number"}
                        ,month03Cost:{ type:"number", editable:false}
                        ,month04:{ type:"number"}
                        ,month04Cost:{ type:"number", editable:false}
                        ,month05:{ type:"number"}
                        ,month05Cost:{ type:"number", editable:false}
                        ,month06:{ type:"number"}
                        ,month06Cost:{ type:"number", editable:false}
                        ,month07:{ type:"number"}
                        ,month07Cost:{ type:"number", editable:false}
                        ,month08:{ type:"number"}
                        ,month08Cost:{ type:"number", editable:false}
                        ,month09:{ type:"number"}
                        ,month09Cost:{ type:"number", editable:false}
                        ,month10:{ type:"number"}
                        ,month10Cost:{ type:"number", editable:false}
                        ,month11:{ type:"number"}
                        ,month11Cost:{ type:"number", editable:false}
                        ,month12:{ type:"number"}
                        ,month12Cost:{ type:"number", editable:false}
                    }
                }
            }
        }
        ,edit:function(e){

            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if(e.model.saleTp == "Y" || e.model.saleTp == "Z") {
                if(fieldName=="month01" || fieldName=="month02" || fieldName=="month03" || fieldName=="month04" || fieldName=="month05" || fieldName=="month06" || fieldName=="month07" || fieldName=="month08" || fieldName=="month09" || fieldName=="month10" || fieldName=="month11" || fieldName=="month12"){
                    this.closeCell();
                }
            }
        }
        ,dataBound:function(e){

            var sMonth = $("#sMonth").val();
            var sMonthVal = 0;

            if(sMonth != ""){
                sMonthVal = kendo.parseInt(sMonth);
                sMonthVal += 4;
            }

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                if(dataItem.saleTp == "N"){
                    for(i = 5;i < 17;i++){
                        var cell = row.children().eq(i);

                        if(sMonthVal == i){
                            cell.addClass("bg_red");
                        }else{
                            cell.addClass("bg_white");
                        }
                    }
                }
            });
        }
        ,selectable:"row"
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,height:484
        ,columns:[
            {field:"itemDstinCd", title:"<spring:message code='par.lbl.salePlanTp' />", width:80
                ,template:'#if(itemDstinTpMap[itemDstinCd] !== undefined ){# #= itemDstinTpMap[itemDstinCd]# #}#'
            }
            ,{field:"saleTp", title:"<spring:message code='par.lbl.salePlanActTp' />", width:50
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "N"){
                        spanObj = dstDstinTpMap["01"];
                    }else if(dataItem.saleTp == "Y"){
                        spanObj = dstDstinTpMap["02"];
                    }else{
                        spanObj = dstDstinTpMap["03"];
                    }
                    return spanObj;
                }
            }
            ,{field:"thisYear", title:"<spring:message code='par.lbl.year' />", width:50}
            ,{field:"lastYearTot", title:"N-1<spring:message code='par.lbl.year' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.lastYearTot / 100,"p2");
                    }else{
                        spanObj = dataItem.lastYearTot;
                    }
                    return spanObj;
                }
            }
            ,{field:"thisYearTot", title:"N<spring:message code='par.lbl.year' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.thisYearTot / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.thisYearTot,"n2");
                    }
                    return spanObj;
                }
            }
            ,{field:"month01", title:"1<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month01 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month01,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month02", title:"2<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month02 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month02,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month03", title:"3<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month03 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month03,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{ field:"month04", title:"4<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month04 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month04,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month05", title:"5<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month05 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month05,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month06", title:"6<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month06 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month06,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month07", title:"7<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month07 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month07,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month08", title:"8<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month08 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month08,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month09", title:"9<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month09 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month09,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month10", title:"10<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month10 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month10,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month11", title:"11<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month11 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month11,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
            ,{field:"month12", title:"12<spring:message code='par.lbl.month' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(dataItem){
                    var spanObj = "";

                    if(dataItem.saleTp == "Z"){
                        spanObj = kendo.toString(dataItem.month12 / 100,"p2");
                    }else{
                        spanObj = kendo.toString(dataItem.month12,"n2");
                    }
                    return spanObj;
                }
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        spinners:false
                        ,decimals:2
                        ,min:0
                        ,max:10000000000
                        ,change:function(){
                        }
                    });
                }
            }
        ]
    });

});
</script>
<!-- //script -->
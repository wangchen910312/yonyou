<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- salePriceTarget -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.salePriceTarget" /> --%><!-- salePriceTarget --></h1>
        <div class="btn_right">
            <button type="button" id="btnSalPriceRealtime" class="btn_m"><spring:message code="par.btn.salePriceCreate" /></button><!-- Create -->
            <button type="button" id="btnHistoryPopup" class="btn_m"><spring:message code="par.btn.salePriceHistory" /></button><!-- History  -->
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--Select -->
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                        <div class="form_search">
                            <input id="sBpNm" name="sBpNm" class="form_input" value="${bpNm}" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- bpCd Search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></th>
                    <td>
                        <input id="sItemDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>

                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.salePriceTp" /><!-- salePriceTp --></th>
                    <td colspan="5">
                        <label class="label_check"><input type="checkbox" id="sSalPriceYn01" checked="checked" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost01" /><span>=0</span></label>
                        <label class="label_check"><input type="checkbox" id="sSalPriceYn02" checked="checked" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost02" /><span>=0</span></label>
                        <label class="label_check"><input type="checkbox" id="sSalPriceYn03" checked="checked" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost03" /><span>=0</span></label>
                        <label class="label_check"><input type="checkbox" id="sSalPriceYn04" checked="checked" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost04" /><span>=0</span></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="tableForm" class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:12%;">
                <col style="width:7%;">
                <col style="width:12%;">
                <col style="width:7%;">
                <col style="width:12%;">
                <col style="width:7%;">
                <col style="width:12%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.markUp" />:<!-- Mark Up --><spring:message code="par.lbl.salePriceCost01" /><!-- salePriceCost01 --></th>
                    <td>
                        <input id="sSalPriceCost01" name="sSalPriceCost01" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost02" /><!-- salePriceCost02 --></th>
                    <td>
                        <input id="sSalPriceCost02" name="sSalPriceCost02" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost03" /><!-- salePriceCost03 --></th>
                    <td>
                        <input id="sSalPriceCost03" name="sSalPriceCost03" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost04" /><!-- salePriceCost04 --></th>
                    <td>
                        <input id="sSalPriceCost04" name="sSalPriceCost04" class="form_numeric ar" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.applyDt" /><!-- applyDt --></span></th>
                    <td class="required_area">
                        <input data-type="date" id="sApplyDt" name="sApplyDt" required class="form_datepicker" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- salePrice grid -->
        <div id="grid" ></div>
    </div>

</section>
<!-- //salePriceTarget -->

<!-- script -->
<script>
// unitCd
var unitCdDs = [];
<c:forEach var="obj" items="${unitCdDs}">
unitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitNm}"
});
</c:forEach>
var unitCdMap = [];
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});
// carlineCd
var partsCarTpDs = [];
<c:forEach var="obj" items="${partsCarTpDs}">
partsCarTpDs.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//abcInd
var abcIndDs = [];
<c:forEach var="obj" items="${abcIndDs}">
abcIndDs.push({
    "abcCd":"${obj.abcCd}"
    ,"abcCdNm":"${obj.abcCd}"
});
</c:forEach>
//itemDstinCd
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var itemDstinCdMap = [];
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//supply popup
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code = 'par.title.supplyInfo'/>"   // supplyInfo
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sBpCd").val(data[0].bpCd);
                        $("#sBpNm").val(data[0].bpNm);
                    }
                }
            }
        }
    });
}

// item search popup
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(){
    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   // itemInfo
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sItemCd").val(data[0].itemCd);
                        $("#sItemNm").val(data[0].itemNm);
                    }
                }
            }
        }
    });
}

// salePriceHistory popup
var searchSalPriceHistoryPopupWindow;
function selectSalPriceHistoryPopupWindow(){
    searchSalPriceHistoryPopupWindow = dms.window.popup({
        windowId:"searchSalPriceHistoryPopupWindow"
        ,title:"<spring:message code='par.title.salePriceHistoryTarget' />"   // salePriceHistoryTarget
        ,width:900
        ,height:400
        ,content:{
            url:"<c:url value='/par/cmm/selectPartsPriceSalHistoryPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"prcTp":$("#sPrcTp").val()
                ,"itemCd":$("#sItemCd").val()
                ,"itemNm":$("#sItemNm").val()
                ,"itemDstinCd":$("#sItemDstinCd").val()
                ,"carlineCd":$("#sCarlineCd").val()
                ,"abcInd":$("#sAbcInd").val()
                ,"callbackFunc":function(data){
                }
            }
        }
    });
}

//targetPriceGridChanged Change Func
function targetPriceGridChanged(){
    var grid = $("#grid").data("kendoExtGrid");
    // k-state-selected add all
    grid.tbody.find('>tr').each(function(){
        var dataItem = grid.dataItem(this);
        if(dataItem.dirty)
            $(this).addClass("k-state-selected");
            $(this).prop("checked", true);
            //$("input.grid-checkbox-item", this).prop("checked", true);
    });
}

    var validator = $("#tableForm").kendoValidator().data("kendoValidator");

    $(document).ready(function() {
        // create button
        $("#btnSalPriceRealtime").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");

                if(validator.validate()){
                    if(grid.gridValidation()){
                        var multiItemHistorys = grid.getCUDData("insertList", "updateList", "deleteList");
                        if(grid.cudDataLength == 0){
                            dms.notification.info("<spring:message code='global.info.required.change'/>");
                            return;
                        }

                        var partsVenderSalPriceTargetHistoryVO = {
                            applyDt:$("#sApplyDt").data("kendoExtMaskedDatePicker").value()
                        }

                        var partsVenderSalPriceTargetSaveVO = { "partsVenderSalPriceTargetHistoryVO":partsVenderSalPriceTargetHistoryVO, "partsVenderSalPriceTargetMasterDetailVO":multiItemHistorys.updateList }

                        $.ajax({
                            url:"<c:url value='/par/pmm/partsPriceMaster/multiPartsVenderSalPriceTargetMasters.do' />"
                            ,data:JSON.stringify(partsVenderSalPriceTargetSaveVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(jqXHR, textStatus){
                                grid.dataSource.read();
                                //success
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });
                    }else{
                        // input value checked
                        dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }
                }
            }
        });
        // history button
        $("#btnHistoryPopup").kendoButton({
            click:function(e){
                var vBpCd = $("#sBpCd").val();
                var vBpNm = $("#sBpNm").val();
                if(vBpCd === ""){
                   // bpCd validate Message.
                    dms.notification.info("<spring:message code='par.lbl.supplyCd' var='supplyCd' /><spring:message code='global.info.required.field' arguments='${supplyCd}' />");
                    $("#sBpNm").focus();

                    return false;
                }
                // Sale Price History Popup Open
                selectSalPriceHistoryPopupWindow();
            }
        });
        // select button
        $("#btnSearch").kendoButton({
            click:function(e){
                var vBpCd = $("#sBpCd").val();
                var vBpNm = $("#sBpNm").val();
                if(vBpCd === ""){
                    // bpCd validate Message.
                    dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}' />");
                    $("#sBpNm").focus();

                    return false;
                }
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // itemCd focus
        $("#sItemCd").focus();
        // carlineCd dropdownlist
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,optionLabel:" "
            ,dataSource:partsCarTpDs
            ,autoBind:false
            ,index:0
        });
        // abcInd dropdownlist
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndDs
            ,autoBind:false
            ,index:0
        });
        // itemDstinCd dropdownlist
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:itemDstinCdList
            ,autoBind:false
            ,index:0
        });
        // salPrice01 mark up
        $("#sSalPriceCost01").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
            ,change:function(){
                var grid = $("#grid").data("kendoExtGrid");
                var vSaleTaxRate01 = this.value();
                rows = grid.select();
                rowCnt = rows.length;

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                $.each(rows, function(idx, row){
                    var dataItem = grid.dataItem(this);
                    var vPurcPrc = dataItem.purcPrc;
                    dataItem.saleTaxRate01 = vSaleTaxRate01;
                    dataItem.salePrcAmt01 = vPurcPrc * vSaleTaxRate01;
                    dataItem.dirty = true;
                    //$(this).addClass("k-state-selected");
                });

                grid.refresh();
                targetPriceGridChanged();
            }
        });
        // salPrice02 mark up
        $("#sSalPriceCost02").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
            ,change:function(){
                var grid = $("#grid").data("kendoExtGrid");
                var vSaleTaxRate02 = this.value();
                rows = grid.select();
                rowCnt = rows.length;

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                $.each(rows, function(idx, row){
                    var dataItem = grid.dataItem(this);
                    var vPurcPrc = dataItem.purcPrc;
                    dataItem.saleTaxRate02 = vSaleTaxRate02;
                    dataItem.salePrcAmt02 = vPurcPrc * vSaleTaxRate02;
                    dataItem.dirty = true;
                });

                grid.refresh();
            }
        });
        // salPrice03 mark up
        $("#sSalPriceCost03").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
            ,change:function(){
                var grid = $("#grid").data("kendoExtGrid");
                var vSaleTaxRate03 = this.value();
                rows = grid.select();
                rowCnt = rows.length;

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                $.each(rows, function(idx, row){
                    var dataItem = grid.dataItem(this);
                    var vPurcPrc = dataItem.purcPrc;
                    dataItem.saleTaxRate03 = vSaleTaxRate03;
                    dataItem.salePrcAmt03 = vPurcPrc * vSaleTaxRate03;
                    dataItem.dirty = true;
                });

                grid.refresh();
            }
        });
        // salPrice04 mark up
        $("#sSalPriceCost04").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
            ,change:function(){
                var grid = $("#grid").data("kendoExtGrid");
                var vSaleTaxRate04 = this.value();
                rows = grid.select();
                rowCnt = rows.length;

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                $.each(rows, function(idx, row){
                    var dataItem = grid.dataItem(this);
                    var vPurcPrc = dataItem.purcPrc;
                    dataItem.saleTaxRate04 = vSaleTaxRate04;
                    dataItem.salePrcAmt04 = vPurcPrc * vSaleTaxRate04;
                    dataItem.dirty = true;
                });

                grid.refresh();
            }
        });
        // applyDt
        $("#sApplyDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // salePrice grid
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // search area
                            params["sBpCd"] = $("#sBpCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sSalePrcAmtZeroYn01"] = $("#sSalPriceYn01").prop("checked") == true ? "Y":"N"
                            params["sSalePrcAmtZeroYn02"] = $("#sSalPriceYn02").prop("checked") == true ? "Y":"N"
                            params["sSalePrcAmtZeroYn03"] = $("#sSalPriceYn03").prop("checked") == true ? "Y":"N"
                            params["sSalePrcAmtZeroYn04"] = $("#sSalPriceYn04").prop("checked") == true ? "Y":"N"

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpCd:{ type:"string" ,editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,purcPrc:{ type:"number" , editable:false}
                            ,salPrcTp01:{ type:"string" }
                            ,dbSalePrcAmt01:{ type:"number" , editable:false}
                            ,salePrcAmt01:{ type:"number" , editable:true}
                            ,saleTaxRate01:{ type:"number" , editable:true}
                            ,salPrcTp02:{ type:"string" }
                            ,dbSalePrcAmt02:{ type:"number" , editable:false}
                            ,salePrcAmt02:{ type:"number", editable:true}
                            ,saleTaxRate02:{ type:"number", editable:true}
                            ,salPrcTp03:{ type:"string" }
                            ,dbSalePrcAmt03:{ type:"number" , editable:false}
                            ,salePrcAmt03:{ type:"number", editable:true}
                            ,saleTaxRate03:{ type:"number", editable:true}
                            ,salPrcTp04:{ type:"string" }
                            ,dbSalePrcAmt04:{ type:"number" , editable:false}
                            ,salePrcAmt04:{ type:"number", editable:true}
                            ,saleTaxRate04:{ type:"number", editable:true}
                        }
                    }
                }
            }
            ,editable:true
            ,sortable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,multiSelectWithCheckbox:true
            ,select:function(e){
                /* var grid = $("#grid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());
                if( dataItem != null && dataItem != 'undefined'){
                    // dirty targetPriceGridChanged Func Call
                    if(dataItem.dirty){
                      targetPriceGridChanged();
                    }
                } */
            }
            ,change:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());
                if( dataItem != null && dataItem != 'undefined'){
                    // dirty targetPriceGridChanged Func Call
                    if(dataItem.dirty){
                      targetPriceGridChanged();
                    }
                }
            }
            ,columns :
                [{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:100 }              //itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:150 }              //itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:80
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }           //carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }               //abcInd
                ,{ title:"<spring:message code='par.lbl.purcAmt' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }   //purcPrc
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost01' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"salePrcAmt01"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate01 = model.get("saleTaxRate01");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt01", vPurcPrc * vSaleTaxRate01);
                                }
                            });
                        }
                    },{
                        field:"saleTaxRate01"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:50
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"##.## \\%"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate01 = model.get("saleTaxRate01");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt01", vPurcPrc * vSaleTaxRate01);
                                }
                            });
                         }
                    }]
                }
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost02' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"salePrcAmt02"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate02 = model.get("saleTaxRate02");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt02", vPurcPrc * vSaleTaxRate02);
                                }
                            });
                        }
                    },{
                        field:"saleTaxRate02"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:50
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"##.## \\%"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate02 = model.get("saleTaxRate02");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt02", vPurcPrc * vSaleTaxRate02);
                                }
                            });
                         }
                    }]
                }
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost03' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"salePrcAmt03"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate03 = model.get("saleTaxRate03");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt03", vPurcPrc * vSaleTaxRate03);
                                }
                            });
                        }
                    },{
                        field:"saleTaxRate03"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:50
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"##.## \\%"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate03 = model.get("saleTaxRate03");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt03", vPurcPrc * vSaleTaxRate03);
                                }
                            });
                         }
                    }]
                }
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost04' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"salePrcAmt04"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate04 = model.get("saleTaxRate04");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt04", vPurcPrc * vSaleTaxRate04);
                                }
                            });
                        }
                    },{
                        field:"saleTaxRate04"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:50
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"##.## \\%"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));
                                    var vSaleTaxRate04 = model.get("saleTaxRate04");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("salePrcAmt04", vPurcPrc * vSaleTaxRate04);
                                }
                            });
                         }
                    }]
                }
            ]
        });
    });
</script>
<!-- //script -->


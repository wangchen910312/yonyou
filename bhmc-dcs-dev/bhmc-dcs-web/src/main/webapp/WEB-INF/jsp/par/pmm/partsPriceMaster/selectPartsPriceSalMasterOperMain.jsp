<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- salePriceTarget -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.salePriceTarget" /> --%><!-- salePriceTarget --></h1>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--Select -->
            <button type="button" id="btnExcelUpload" class="btn_m btn_add" ><spring:message code="par.btn.uploadExcel" /></button>
            <button type="button" id="btnHistoryPopup" class="btn_m"><spring:message code="par.btn.salePriceHistory" /></button><!-- History  -->
        </div>
    </div>

    <div id="tableForm" class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:21%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:9%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
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
                    <th scope="row"><spring:message code="par.lbl.strge" />/<spring:message code="par.lbl.locId" /></th>
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                        <div class="form_float">
                            <div class="date_left">
                            </div>
                            <div class="date_right">
                                <input id="sLocCd" class="form_input hidden" />
                            </div>
                        </div>
                        <input id="sItemDstinCd" class="form_comboBox hidden" />
                    </td>
                </tr>
                <tr>
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
                    <th></th>
                    <td></td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.salePriceTp" /><!-- salePriceTp --></th>
                    <td>
                        <div class="dis_table">
                            <span class="dis_table_cell2" style="width:30%;">
                                <label class="label_check" style="top:2px;"><input type="checkbox" id="sSalPriceYn01" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost01" /></label>
                            </span>
                            <div class="dis_table_cell" style="width:70%;">
                                <input id="sPrcTp01" class="form_comboBox" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><label class="label_check"><input type="checkbox" id="sSalPriceYn02" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost02" /></label></th>
                    <td>
                        <input id="sPrcTp02" class="form_comboBox" />
                    </td>
                    <th scope="row"><label class="label_check"><input type="checkbox" id="sSalPriceYn03" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost03" /></label></th>
                    <td>
                        <input id="sPrcTp03" class="form_comboBox" />
                    </td>
                    <th scope="row"><label class="label_check"><input type="checkbox" id="sSalPriceYn04" value="N" class="form_check" /> <spring:message code="par.lbl.salePriceCost04" /></label></th>
                    <td>
                        <input id="sPrcTp04" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:21%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:9%;">
                <col style="width:14%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.addPriceRate" />:</th>
                    <td>
                        <div class="dis_table">
                            <span class="dis_table_cell2" style="position:relative;top:2px;width:30%;">
                                <spring:message code="par.lbl.salePriceCost01" />
                            </span>
                            <div class="dis_table_cell" style="width:70%;">
                                <input id="sSalPriceCost01" name="sSalPriceCost01" class="form_numeric ar" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost02" /></th>
                    <td>
                        <input id="sSalPriceCost02" name="sSalPriceCost02" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost03" /></th>
                    <td>
                        <input id="sSalPriceCost03" name="sSalPriceCost03" class="form_numeric ar" />
                    </td>
                    <td class="ar">
                        <button type="button" id="btnConfirm" class="btn_m"><spring:message code="par.btn.confirm" /></button><!-- confirm -->
                        <button type="button" id="btnSalPriceRealtime" class="btn_m"><spring:message code="par.btn.salePriceCreate" /></button><!-- Create -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.addPriceRate" />:</th>
                    <td>
                        <input id="sBasePrice" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pricePointNum" /></th>
                    <td>
                        <input id="sPricePointNum" type="text" value="" class="form_comboBox">
                    </td>
                    <td colspan="3"></td>
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
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
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
//salePrcTpList
var salePrcTpList = [];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
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
        ,height:600
        ,content:{
            url:"<c:url value='/par/cmm/selectPartsPriceSalHistoryOperPopup.do'/>"
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
//parts price excel file upload Popup Func
var partsPriceExcelUploadPopupWin;
function selectPartsPriceExcelUploadPopupWindow(){

    if(dms.string.isEmpty($("#sBpCd").val())){
        // sBpCd check
        dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.check.field' arguments='${bpCd}' />");
        return;
    }

    partsPriceExcelUploadPopupWin = dms.window.popup({
        windowId:"partsPriceExcelUploadPopupWin"
        ,title:"<spring:message code='par.title.uploadFile' />"   //excelFileExcelUpload
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectPartsPriceExcelUploadPopup.do'/>"
            ,data:{
                "bpCd":$("#sBpCd").val()
                ,"autoClose":true
                ,"callbackFunc":function(data){
                    /* if(data.length > 0){

                        for(var i=0; i<data.length; i++){
                            //console.log("data:"+kendo.stringify(data[i]));
                            var bCheck = false;
                            var grid = $('#grid').data('kendoExtGrid');
                            var checkRows = grid.tbody.find("tr");
                            checkRows.each(function(index, checkRow) {
                                var dataItem = grid.dataItem(checkRow);
                                if(dataItem.itemCd == data[i].itemCd){
                                    bCheck = true;
                                }
                            });

                            if(!bCheck){
                                if(data[i].avlbStockQty > 0){
                                    var total = $("#storageMoveGrid").data("kendoExtGrid").dataSource.total()+1;
                                    BinLocationItemVO = {
                                        rnum:total + 1
                                        ,dlrCd:null
                                        ,etcGiDocNo:$("#sEtcGiDocNo").val()
                                        ,etcGiDocLineNo:total + 1
                                        ,cancYn:"N"
                                        ,itemCd:data[i].itemCd
                                        ,itemNm:data[i].itemNm
                                        ,unitCd:data[i].unitCd
                                        ,strgeStockQty:data[i].baseAvlbStockQty
                                        ,strgeMoveStockQty:data[i].avlbStockQty
                                        ,giStrgeCd:$("#sOutStrgeCd").val()
                                        ,giLocCd:""
                                        ,grStrgeCd:""
                                        ,grLocCd:""
                                        ,grReasonCd:null
                                        ,mvtDocYyMm:""
                                        ,mvtDocNo:""
                                        ,mvtDocLineNo:0
                                    }
                                    $("#grid").data("kendoExtGrid").dataSource.add(BinLocationItemVO).set("dirty", true);
                                }
                            }
                        }
                    } */
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

    var selected = {};

    $(document).ready(function() {
        // create button
        $("#btnSalPriceRealtime").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");

                if(grid.gridValidation()){
                    var multiItemHistorys = grid.getCUDData("insertList", "updateList", "deleteList");
                    if(grid.cudDataLength == 0){
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    var partsVenderSalPriceTargetHistoryVO = {
                        applyDt:new Date("${sysDate}")
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
        });
        // history button
        $("#btnHistoryPopup").kendoButton({
            click:function(e){
                // Sale Price History Popup Open
                selectSalPriceHistoryPopupWindow();
            }
        });
        // select button
        $("#btnSearch").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                grid.dataSource.read();
            }
        });
        // excel upload button
        $("#btnExcelUpload").kendoButton({
            click:function(e){
                //selectPartsPriceExcelUploadPopupWindow Func call
                selectPartsPriceExcelUploadPopupWindow();
            }
        });

        // confirm button
        $("#btnConfirm").kendoButton({
            click:function(e){
                // ready message
                //dms.notification.success("<spring:message code='global.info.ready'/>");
                var grid = $("#grid").data("kendoExtGrid");
                var vSaleTaxRate01 = $("#sSalPriceCost01").val();
                var vSaleTaxRate02 = $("#sSalPriceCost02").val();
                var vSaleTaxRate03 = $("#sSalPriceCost03").val();
                var vBasePriceTp = $("#sBasePrice").val();
                rows = grid.select();
                rowCnt = rows.length;

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                $.each(rows, function(idx, row){
                    var dataItem = grid.dataItem(this);
                    var vPurcPrc = 0;
                    dataItem.retlAddTaxRate = vSaleTaxRate01;
                    dataItem.whslAddTaxRate = vSaleTaxRate02;
                    dataItem.incAddTaxRate = vSaleTaxRate03;
                    dataItem.grteAddTaxRate = 0;

                    vPurcPrc = dataItem.stdPrc;

                    /* switch(vBasePriceTp){
                        case "01":
                            vPurcPrc = dataItem.rectGiPrc;
                            break;
                        case "02":
                            vPurcPrc = dataItem.bmpOpnPrc;
                            break;
                        case "03":
                            vPurcPrc = dataItem.stdPrc;
                            break;
                        default:
                            vPurcPrc = dataItem.purcPrc;
                    } */

                    dataItem.retlPrc = kendo.toString(vPurcPrc + (vPurcPrc * (vSaleTaxRate01 / 100)), $("#sPricePointNum").val());
                    dataItem.whslPrc = kendo.toString(vPurcPrc + (vPurcPrc * (vSaleTaxRate02 / 100)), $("#sPricePointNum").val());
                    dataItem.incPrc = kendo.toString(vPurcPrc + (vPurcPrc * (vSaleTaxRate03 / 100)), $("#sPricePointNum").val());
                    dataItem.grtePrc = kendo.toString(vPurcPrc + (vPurcPrc * (0 / 100)), $("#sPricePointNum").val());
                    dataItem.dirty = true;
                });

                grid.refresh();

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
        //sStrgeCd
        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"strgeNm"
            ,dataValueField:"strgeCd"
            ,dataSource:giStrgeCdList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sPrcTp01 dropdownlist
        $("#sPrcTp01").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:null
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sPrcTp02 dropdownlist
        $("#sPrcTp02").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:null
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sPrcTp03 dropdownlist
        $("#sPrcTp03").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:null
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sPrcTp04 dropdownlist
        $("#sPrcTp04").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:null
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sBasePrice dropdownlist TODO:[InBoShim] common code deifine.
        $("#sBasePrice").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[{cmmCd:"01", cmmCdNm:"采购价(BMP)"},{cmmCd:"02", cmmCdNm:"库存单价"},{cmmCd:"03", cmmCdNm:"入库价"}]
            ,optionLabel:" "
            ,autoBind:true
            ,index:1
            ,change:function(){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //sPricePointNum dropdownlist
        $("#sPricePointNum").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[{cmmCd:"n2", cmmCdNm:"2"},{cmmCd:"n3", cmmCdNm:"3"},{cmmCd:"n4", cmmCdNm:"4"},{cmmCd:"n5", cmmCdNm:"5"}]
            ,autoBind:true
            ,index:0
            ,change:function(){

                /* var grid = $("#grid").data("kendoExtGrid"),
                column01  = grid.thread.find("th[data-field=retlPrc]").data("kendoFilterMenu");

                if(this.value() === ""){
                    column01.form.find("["+kendo.attr("type")+"=number]").data("kendoExtNumericTextBox").options.format = "n0";
                }
                else{
                    column01.form.find("["+kendo.attr("type")+"=number]").data("kendoExtNumericTextBox").options.format = "n"+this.value();
                }

                $("#grid").data("kendoExtGrid").dataSource.read(); */
            }
        });

        // salPrice01 mark up
        $("#sSalPriceCost01").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
        });
        // salPrice02 mark up
        $("#sSalPriceCost02").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
        });
        // salPrice03 mark up
        $("#sSalPriceCost03").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
        });
        // salPrice04 mark up
        $("#sSalPriceCost04").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
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
                            params["sBasePrice"] = $("#sBasePrice").val();
                            params["sSalePrcAmtZeroYn01"] = $("#sSalPriceYn01").prop("checked") == true ? "Y":"N"
                            params["sSalePrcAmtZeroYn02"] = $("#sSalPriceYn02").prop("checked") == true ? "Y":"N"
                            params["sSalePrcAmtZeroYn03"] = $("#sSalPriceYn03").prop("checked") == true ? "Y":"N"
                            params["sSalePrcAmtZeroYn04"] = $("#sSalPriceYn04").prop("checked") == true ? "Y":"N"

                            return kendo.stringify(params);
                        }
                    }
                }
                ,batch:true
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpCd:{ type:"string" ,editable:false}
                            ,bpNm:{ type:"string" ,editable:false}
                            ,lineNo:{ type:"number" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,purcPrc:{ type:"number" , editable:false}
                            ,prcQty:{ type:"number" , editable:false}
                            ,prcQtyUnitCd:{ type:"string" , editable:false}
                            ,startDt:{ type:"date" , editable:false}
                            ,endDt:{ type:"date" , editable:false}
                            ,applyDt:{ type:"date" , editable:false}
                            ,saleTaxRate:{ type:"number" , editable:false}
                            ,delYn:{ type:"string" , editable:false}
                            ,retlPrc:{ type:"number"}
                            ,whslPrc:{ type:"number"}
                            ,incPrc:{ type:"number"}
                            ,grtePrc:{ type:"number"}
                            ,retlAddTaxRate:{ type:"number"}
                            ,whslAddTaxRate:{ type:"number"}
                            ,incAddTaxRate:{ type:"number"}
                            ,grteAddTaxRate:{ type:"number"}
                            ,bmpOpnPrc:{ type:"number" , editable:false}
                            ,rectGiPrc:{ type:"number" , editable:false}
                            ,stdPrc:{ type:"number" , editable:false}
                            ,etcPrc1:{ type:"number" , editable:false}
                            ,etcPrc2:{ type:"number" , editable:false}
                            ,etcPrc3:{ type:"number" , editable:false}
                            ,taxDdctRetlPrc:{ type:"number"}
                            ,taxDdctWhslPrc:{ type:"number"}
                            ,taxDdctIncPrc:{ type:"number"}
                            ,taxDdctGrtePrc:{ type:"number"}
                            ,taxDdctEtcPrc1:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc2:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc3:{ type:"number" , editable:false}
                        }
                    }
                }
            }
            ,editable:true
            ,sortable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,multiSelectWithCheckbox:true
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if(fieldName=="retlPrc" || fieldName=="whslPrc" || fieldName=="incPrc"){
                    this.closeCell();
                }
            }
            ,change:function(e) {
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                console.log("row length:"+rows.length);
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        //update row reselect.
                        if(dataItem.dirty){
                            var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                            multiCheckBox.prop("checked", true);
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                    }
                });

            }
            ,columns :
                [{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
                ,{ title:"<spring:message code='par.lbl.purcPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.grRecentPrice' />", field:"rectGiPrc", attributes:{"class":"ar"}, width:70}//grRecentPrice
                ,{ title:"<spring:message code='par.lbl.bmpBasePrice' />", field:"bmpOpnPrc", attributes:{"class":"ar"}, width:90}//bmpBasePrice
                ,{ title:"<spring:message code='par.lbl.basePrice' />", field:"stdPrc", attributes:{"class":"ar"}, width:70}//basePrice
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost01' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"retlPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                }
                            });
                        }
                    },{
                        field:"retlAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
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
                                    var vRetlAddTaxRate = model.get("retlAddTaxRate");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("retlPrc", kendo.toString(vPurcPrc + (vPurcPrc * vRetlAddTaxRate)), $("#sPricePointNum").val());
                                }
                            });
                         }
                    }]
                }
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost02' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"whslPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                }
                            });
                        }
                    },{
                        field:"whslAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
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
                                    var vWhslAddTaxRate = model.get("whslAddTaxRate");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("whslPrc", kendo.toString(vPurcPrc + (vPurcPrc * vWhslAddTaxRate)), $("#sPricePointNum").val());
                                }
                            });
                         }
                    }]
                }
                ,{
                    title:"<spring:message code='par.lbl.salePriceCost03' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"incPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                }
                            });
                        }
                    },{
                        field:"incAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
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
                                    var vIncAddTaxRate = model.get("incAddTaxRate");
                                    var vPurcPrc = model.get("purcPrc");
                                    model.set("incPrc", kendo.toString(vPurcPrc + (vPurcPrc * vIncAddTaxRate)), $("#sPricePointNum").val());
                                }
                            });
                         }
                    }]
                }
                ,{  field:"grtePrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost04' />"
                    ,width:70
                    ,attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            spinners:false
                            ,change:function(){
                            }
                        });
                    }
                }//basePrice
            ]
        });
    });
</script>
<!-- //script -->


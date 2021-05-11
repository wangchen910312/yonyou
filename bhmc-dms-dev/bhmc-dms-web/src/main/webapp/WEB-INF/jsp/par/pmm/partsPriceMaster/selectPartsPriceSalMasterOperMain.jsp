<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- salePriceTarget -->
<div id="resizableContainer">

<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.salePriceTarget" /><!-- salePriceTarget --></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11486" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11485" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnExcelImport" name="btnExcelImport" class="btn_m btn_m_min5"><spring:message code="par.btn.excelUpload" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11484" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min5"><spring:message code="par.btn.excelDownload" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11483" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnConfirm" class="btn_m btn_m_min5 btn_confirm"><spring:message code="par.btn.confirm" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11482" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSalPriceRealtime" class="btn_m btn_m_min5 btn_save"><spring:message code="par.btn.save" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11481" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min5"><spring:message code="par.btn.search" /></button><!--Select -->
        </dms:access>
        <dms:access viewId="VIEW-D-11487" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnHistoryPopup" class="btn_m hidden"><spring:message code="par.btn.salePriceHistory" /></button><!-- History  -->
            <button type="button" id="btnPartsPriceBatch" name="btnSearch" class="btn_m btn_m_min hidden"><span><spring:message code="par.btn.partsPriceBatch" /></span></button><!--부품가격배치실행  -->
        </dms:access>
        </div>
    </div>

    <div id="tableForm" class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:6%;">
                <col style="width:18%;">
                <col style="width:9%;">
                <col style="width:18%;">
                <col style="width:6%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.strge" /></th>
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox hidden" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <input id="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>
                    <th scope="row"><%-- <spring:message code="par.lbl.locId" /> --%></th>
                    <td>
                        <!-- <input id="sLocCd" class="form_comboBox" /> -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.sBpTp" /><!-- sBpTp --></th>
                    <td>
                        <input id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                        <div class="form_search">
                            <input id="sBpNm" name="sBpNm" class="form_input" value="${bpNm}" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- bpCd Search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemTpCd" /></th>
                    <td>
                        <input id="sItemDstinCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost01" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPrcTpFrom01" class="form_numeric ar" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPrcTpTo01" class="form_numeric ar" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost02" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPrcTpFrom02" class="form_numeric ar" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPrcTpTo02" class="form_numeric ar" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost03" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPrcTpFrom03" class="form_numeric ar" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPrcTpTo03" class="form_numeric ar" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.basePrice" /></th>
                    <td>
                        <input id="sBasePrice01" type="text" value="" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form mt5">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:6%;">
                <col style="width:13%;">
                <col style="width:6%;">
                <col style="width:13%;">
                <col style="width:6%;">
                <col style="width:13%;">
                <col style="width:6%;">
                <col style="width:12%;">
                <col style="width:7%;">
                <col >
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost01" /></th>
                    <td>
                        <input id="sSalPriceCost01" name="sSalPriceCost01" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost02" /></th>
                    <td>
                        <input id="sSalPriceCost02" name="sSalPriceCost02" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePriceCost03" /></th>
                    <td>
                        <input id="sSalPriceCost03" name="sSalPriceCost03" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.basePrice" />:</th>
                    <td>
                        <input id="sBasePrice02" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pricePointNum" /></th>
                    <td>
                        <input id="sPricePointNum" type="text" value="" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- //salePriceTarget -->

<section class="group">
    <div class="header_area">
        <div class="btn_right">

        </div>
    </div>
    <div class="table_grid">
        <!-- salePrice grid -->
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>

</div>

<!-- script -->
<script>
//giStrgeCdList
var giStrgeCdList = []
    ,giStrgeCdObj = {}
    ,gVatCd       = Number("${vatCd}");

<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
giStrgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>
//로케이션
var giLocCdObj = [];
<c:forEach var="obj" items="${giLocCdList}">
if(giLocCdObj.hasOwnProperty("${obj.strgeCd}")){
    giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
}else{
    giLocCdObj["${obj.strgeCd}"] = [];
    giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
}
</c:forEach>

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    //gVatCd = .16;
    gVatCd = .13;
}
console.log('gVatCd:',gVatCd);

// unitCd
var unitCdDs = [];
<c:forEach var="obj" items="${unitCdDs}">
unitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitNm}"
});
</c:forEach>
var unitCdMap = {};
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});
// carlineCd
var carlineCdList = [];
var carlineCdObj = {};
<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>
var modelCdObj = {};
<c:forEach var="obj" items="${modelCdList}">
if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}else{
    modelCdObj["${obj.carlineCd}"] = [];
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}
</c:forEach>
//abcInd
var abcIndList = [];
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({
    "abcCd":"${obj.cmmCd}"
    ,"abcCdNm":"${obj.cmmCd}"
});
</c:forEach>
//itemDstinCd
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
    if("${obj.useYn}" !== 'N'){
        itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//salePrcTpList
var salePrcTpList = [];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//basePriceCalTpList
var basePriceCalTpList = [];
<c:forEach var="obj" items="${basePriceCalTpList}">
if("${obj.useYn}" !== 'N'){
    basePriceCalTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
var basePriceCalTpMap = {};
$.each(basePriceCalTpList, function(idx, obj){
    basePriceCalTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//pricePointNumCdList
var pricePointNumCdList = [];
<c:forEach var="obj" items="${pricePointNumCdList}">
pricePointNumCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//bpTpList
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//bpTpMap
var bpTpMap = {};
$.each(bpTpList, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});

//supply popup
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code = 'par.title.supplyInfo'/>"   // supplyInfo
        ,width : 840
        ,height: 400
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

    partsPriceExcelUploadPopupWin = dms.window.popup({
        windowId:"partsPriceExcelUploadPopupWin"
        ,title:"<spring:message code='par.title.uploadFile' />"   //excelFileExcelUpload
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectPartsPriceExcelUploadPopup.do'/>"
            ,data:{
                "autoClose":true
                ,"callbackFunc":function(data){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#grid").data("kendoExtGrid").dataSource.read();

                    partsPriceExcelUploadPopupWin.close();
                }
            }
        }
    });
}

    var validator = $("#tableForm").kendoValidator().data("kendoValidator");

    var selected = {};

    $(document).ready(function() {

        // history button
        $("#btnHistoryPopup").kendoButton({
            click:function(e){
                // Sale Price History Popup Open
                selectSalPriceHistoryPopupWindow();
            }
        });
        //init button
        $("#btnInit").kendoButton({
            click:function(e){

                $("#sBpTp").data("kendoExtDropDownList").select(0);

                $("#sBpCd").val("");
                $("#sBpNm").val("");
                $("#sAbcInd").data("kendoExtDropDownList").select(0);
                $("#sCarlineCd").data("kendoExtDropDownList").select(0);

                $("#sStrgeCd").data("kendoExtDropDownList").select(0);

                $("#sItemCd").val("");
                $("#sItemNm").val("");

                $("#sBasePrice01").data("kendoExtDropDownList").select("");
                $("#sBasePrice02").data("kendoExtDropDownList").select("");

                $("#sPrcTpFrom01").data("kendoExtNumericTextBox").value("");
                $("#sPrcTpTo01").data("kendoExtNumericTextBox").value("");
                $("#sPrcTpFrom02").data("kendoExtNumericTextBox").value("");
                $("#sPrcTpTo02").data("kendoExtNumericTextBox").value("");
                $("#sPrcTpFrom03").data("kendoExtNumericTextBox").value("");
                $("#sPrcTpTo03").data("kendoExtNumericTextBox").value("");

                $("#sSalPriceCost01").data("kendoExtNumericTextBox").value(0);
                $("#sSalPriceCost02").data("kendoExtNumericTextBox").value(0);
                $("#sSalPriceCost03").data("kendoExtNumericTextBox").value(0);

                $("#sPricePointNum").data("kendoExtDropDownList").select(0);

                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // select button
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.page(1);
            }
        });
        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){
                //excel export all
                dms.ajax.excelExport({
                    "beanName":"partsVenderSalPriceTargetMasterService"
                    ,"templateFile":"PartsVenderSalPriceTargetMaster_Tpl.xlsx"
                    ,"fileName":"PartsVenderSalPriceTargetMaster_Tpl.xlsx"
                    ,"sBpCd":$("#sBpCd").val()
                    ,"sBpNm":$("#sBpNm").val()
                    ,"sBpTp":$("#sBpTp").data("kendoExtDropDownList").value()
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sAbcInd":$("#sAbcInd").val()
                    ,"sItemDstinCd":$("#sItemDstinCd").val()
                    ,"sCarlineCd":$("#sCarlineCd").val()
                    ,"sBasePrice":$("#sBasePrice01").val()
                    ,"sStrgeCd":$("#sStrgeCd").data("kendoExtDropDownList").value()
                    ,"sLocCd":""
                    ,"sStdPrcCd":$("#sBasePrice01").val()
                    ,"sSalePrcAmtZeroYn01":"N"
                    ,"sSalePrcAmtZeroYn02":"N"
                    ,"sSalePrcAmtZeroYn03":"N"
                    ,"sSalePrcAmtZeroYn04":"N"
                    ,"sPrcTpFrom01":$("#sPrcTpFrom01").data("kendoExtNumericTextBox").value()
                    ,"sPrcTpTo01":$("#sPrcTpTo01").data("kendoExtNumericTextBox").value()
                    ,"sPrcTpFrom02":$("#sPrcTpFrom02").data("kendoExtNumericTextBox").value()
                    ,"sPrcTpTo02":$("#sPrcTpTo02").data("kendoExtNumericTextBox").value()
                    ,"sPrcTpFrom03":$("#sPrcTpFrom03").data("kendoExtNumericTextBox").value()
                    ,"sPrcTpTo03":$("#sPrcTpTo03").data("kendoExtNumericTextBox").value()
                });
            }
        });
        //btnExcelImport
        $("#btnExcelImport").kendoButton({
            click:function(e){
                selectPartsPriceExcelUploadPopupWindow();
            }
        });

        // confirm button
        $("#btnConfirm").kendoButton({
            click:function(e){

                var stdPrcTp = $("#sBasePrice02").data("kendoExtDropDownList").value();

                if(stdPrcTp === ""){
                    //stdPrcTp check
                    //dms.notification.info("<spring:message code='par.lbl.stdPrcCd' var='stdPrcCd' /><spring:message code='par.info.stdPrcSelectMsg' arguments='${stdPrcCd}' />");
                    return false;
                }

                var grid = $("#grid").data("kendoExtGrid"),
                vSaleTaxRate01 = $("#sSalPriceCost01").val(),
                vSaleTaxRate02 = $("#sSalPriceCost02").val(),
                vSaleTaxRate03 = $("#sSalPriceCost03").val(),
                items = grid.dataSource.view(),
                rowCheckCnt = 0;

                //checked list.
                for (i = 0; i < items.length; i++) {
                    var dataItem = items[i];
                    var elementRow = grid.tbody.find(".checkbox")[i];

                    if(elementRow.checked){
                        var vPurcPrc = 0;

                        if(vSaleTaxRate01.length > 0){
                            dataItem.retlAddTaxRate = vSaleTaxRate01;
                        }

                        if(vSaleTaxRate02.length > 0){
                            dataItem.whslAddTaxRate = vSaleTaxRate02;
                        }

                        if(vSaleTaxRate03.length > 0){
                            dataItem.incAddTaxRate = vSaleTaxRate03;
                        }

                        switch(stdPrcTp){
                            case "01":
                                vPurcPrc = dataItem.bmpOpnPrc;
                                break;
                            case "02":
                                vPurcPrc = dataItem.stockGiPrc;
                                break;
                            case "03":
                                vPurcPrc = dataItem.rectGiPrc;
                                break;
                            case "04":
                                vPurcPrc = dataItem.movingAvgPrc;
                                break;
                            default:
                                vPurcPrc = dataItem.rectGiPrc;
                                break;
                        }

                        dataItem.retlPrc = kendo.parseFloat(kendo.toString(vPurcPrc + (vPurcPrc * (vSaleTaxRate01 / 100)), "n4"));
                        dataItem.taxDdctRetlPrc = kendo.parseFloat(kendo.toString(dataItem.retlPrc / ( 1 + gVatCd ), "n4"));

                        dataItem.whslPrc = kendo.parseFloat(kendo.toString(vPurcPrc + (vPurcPrc * (vSaleTaxRate02 / 100)), "n4"));
                        dataItem.taxDdctWhslPrc = kendo.parseFloat(kendo.toString(dataItem.whslPrc / ( 1 + gVatCd ), "n4"));

                        dataItem.incPrc = kendo.parseFloat(kendo.toString(vPurcPrc + (vPurcPrc * (vSaleTaxRate03 / 100)), "n4"));
                        dataItem.taxDdctIncPrc = kendo.parseFloat(kendo.toString(dataItem.incPrc / ( 1 + gVatCd ), "n4"));

                        dataItem.stdPrc = kendo.parseFloat(kendo.toString(vPurcPrc, "n4"));
                        dataItem.stdPrcCd = stdPrcTp;

                        dataItem.dirty = true;

                        rowCheckCnt++;
                    }
                }

                if(rowCheckCnt === 0){
                    //line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }else{
                    grid.refresh();
                }
            }
        });
        //btnSalPriceRealtime button
        $("#btnSalPriceRealtime").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                items = grid.dataSource.data(),
                rowCheckCnt = 0;

                //checked list.
                for (i = 0; i < items.length; i++) {
                    var dataItem = items[i];
                    var elementRow = grid.tbody.find(".checkbox")[i];

                    if(elementRow.checked){

                        dataItem.taxDdctRetlPrc = kendo.parseFloat(kendo.toString(dataItem.retlPrc / ( 1 + gVatCd ), "n4"));
                        dataItem.taxDdctWhslPrc = kendo.parseFloat(kendo.toString(dataItem.whslPrc / ( 1 + gVatCd ), "n4"));
                        dataItem.taxDdctIncPrc = kendo.parseFloat(kendo.toString(dataItem.incPrc / ( 1 + gVatCd ), "n4"));

                        dataItem.dirty = true;

                        rowCheckCnt++;
                    }
                }

                if(rowCheckCnt === 0){
                    //line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }else{
                    if(grid.gridValidation()){
                        var partsVenderSalPriceTargetMasterDetailVO = grid.getCUDData("insertList", "updateList", "deleteList");
                        if(grid.cudDataLength == 0){
                            dms.notification.info("<spring:message code='global.info.required.change'/>");
                            return;
                        }

                        var partsVenderSalPriceTargetHistoryVO = {
                            applyDt:new Date("${sysDate}")
                        }

                        var partsVenderSalPriceTargetSaveVO = { "partsVenderSalPriceTargetHistoryVO":partsVenderSalPriceTargetHistoryVO, "partsVenderSalPriceTargetMasterDetailVO":partsVenderSalPriceTargetMasterDetailVO.updateList }

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
        //btnPartsPriceBatch
        $("#btnPartsPriceBatch").kendoButton({
            click:function(e){
                $.ajax({
                    url:"<c:url value='/bat/par/partsPriceMaster/executeItemPriceProcedure.do' />"
                    ,data:JSON.stringify({})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){
                        selectDataSourceGridReload();
                        // success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        //itemCd focus
        $("#sItemCd").focus();
        //sBpTp
        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
            ,optionLabel:" "
            ,index:0
        });
        //carlineCd dropdownlist
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //abcInd dropdownlist
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndList
            ,autoBind:false
            ,index:0
        });
        //itemDstinCd dropdownlist
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
        //sStrgeCd onchange event
        $("#sStrgeCd").on("change", function (){
        });
        //sBasePrice01 dropdownlist
        $("#sBasePrice01").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:basePriceCalTpList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
            ,change:function(){
            }
        });
        //sBasePrice02 dropdownlist
        $("#sBasePrice02").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:basePriceCalTpList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
            ,change:function(){

                var stdPrcCd = this.value();
                var stdPrcPer01 = 10;
                var stdPrcPer03 = 0;
                var stdPrcPer04 = 20;

                if(stdPrcCd === "01"){
                    $("#sSalPriceCost01").data("kendoExtNumericTextBox").value(stdPrcPer01);
                    $("#sSalPriceCost02").data("kendoExtNumericTextBox").value(stdPrcPer01);
                    $("#sSalPriceCost03").data("kendoExtNumericTextBox").value(stdPrcPer01);
                }else if(stdPrcCd === "04"){
                    $("#sSalPriceCost01").data("kendoExtNumericTextBox").value(stdPrcPer04);
                    $("#sSalPriceCost02").data("kendoExtNumericTextBox").value(stdPrcPer04);
                    $("#sSalPriceCost03").data("kendoExtNumericTextBox").value(stdPrcPer04);
                }else{
                    $("#sSalPriceCost01").data("kendoExtNumericTextBox").value(stdPrcPer03);
                    $("#sSalPriceCost02").data("kendoExtNumericTextBox").value(stdPrcPer03);
                    $("#sSalPriceCost03").data("kendoExtNumericTextBox").value(stdPrcPer03);
                }

            }
        });
        //sPricePointNum dropdownlist
        $("#sPricePointNum").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:pricePointNumCdList
            ,autoBind:true
            ,index:0
        });
        //sPrcTpFrom01
        $("#sPrcTpFrom01").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,spinners:false
        });
        //sPrcTpTo01
        $("#sPrcTpTo01").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,spinners:false
        });
        //sPrcTpFrom02
        $("#sPrcTpFrom02").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,spinners:false
        });
        //sPrcTpTo02
        $("#sPrcTpTo02").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,spinners:false
        });
        //sPrcTpFrom03
        $("#sPrcTpFrom03").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,spinners:false
        });
        //sPrcTpTo03
        $("#sPrcTpTo03").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,spinners:false
        });
        //salPrice01 mark up
        $("#sSalPriceCost01").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //salPrice02 mark up
        $("#sSalPriceCost02").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //salPrice03 mark up
        $("#sSalPriceCost03").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        // salPrice04 mark up
        $("#sSalPriceCost04").kendoExtNumericTextBox({
            format:"##.## \\%"
            ,decimals:2
            ,spinners:false
            ,value:1
        });
        //salePrice grid
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0622-091548"
            ,dataSource:{
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
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sBasePrice"] = $("#sBasePrice01").val();
                            params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sLocCd"] = "";
                            params["sStdPrcCd"] = $("#sBasePrice01").val();

                            params["sSalePrcAmtZeroYn01"] = "N";
                            params["sSalePrcAmtZeroYn02"] = "N";
                            params["sSalePrcAmtZeroYn03"] = "N";
                            params["sSalePrcAmtZeroYn04"] = "N";

                            params["sPrcTpFrom01"] = $("#sPrcTpFrom01").data("kendoExtNumericTextBox").value();
                            params["sPrcTpTo01"] = $("#sPrcTpTo01").data("kendoExtNumericTextBox").value();
                            params["sPrcTpFrom02"] = $("#sPrcTpFrom02").data("kendoExtNumericTextBox").value();
                            params["sPrcTpTo02"] = $("#sPrcTpTo02").data("kendoExtNumericTextBox").value();
                            params["sPrcTpFrom03"] = $("#sPrcTpFrom03").data("kendoExtNumericTextBox").value();
                            params["sPrcTpTo03"] = $("#sPrcTpTo03").data("kendoExtNumericTextBox").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,batch:true
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpTp:{ type:"string" ,editable:false}
                            ,bpCd:{ type:"string" ,editable:false}
                            ,bpNm:{ type:"string" ,editable:false}
                            ,lineNo:{ type:"number" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,strgeCd:{ type:"string" , editable:false}
                            ,grStrgeCd:{ type:"string" , editable:false}
                            ,locCd:{ type:"string" , editable:false}
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
                            ,bmpOpnPrc:{ type:"number", editable:false}
                            ,stockGiPrc:{ type:"number", editable:false}
                            ,rectGiPrc:{ type:"number", editable:false}
                            ,movingAvgPrc:{ type:"number", editable:false}
                            ,movingAvgTaxDdctPrc:{ type:"number", editable:false}
                            ,retlPrc:{ type:"number", editable:true}
                            ,whslPrc:{ type:"number", editable:true}
                            ,incPrc:{ type:"number", editable:true}
                            ,grtePrc:{ type:"number", editable:true}
                            ,retlAddTaxRate:{ type:"number", editable:true}
                            ,whslAddTaxRate:{ type:"number", editable:true}
                            ,incAddTaxRate:{ type:"number", editable:true}
                            ,grteAddTaxRate:{ type:"number", editable:false}
                            ,bmpOpnPrc:{ type:"number" , editable:false}
                            ,rectGiPrc:{ type:"number" , editable:false}
                            ,stdPrc:{ type:"number" , editable:false}
                            ,stdPrcCd:{ type:"string", editable:true}
                            ,etcPrc1:{ type:"number" , editable:false}
                            ,etcPrc2:{ type:"number" , editable:false}
                            ,etcPrc3:{ type:"number" , editable:false}
                            ,taxDdctRetlPrc:{ type:"number" ,editable:true}
                            ,taxDdctWhslPrc:{ type:"number" ,editable:true}
                            ,taxDdctIncPrc:{ type:"number" ,editable:true}
                            ,taxDdctGrtePrc:{ type:"number" ,editable:true}
                            ,taxDdctEtcPrc1:{ type:"number" ,editable:false}
                            ,taxDdctEtcPrc2:{ type:"number" ,editable:false}
                            ,taxDdctEtcPrc3:{ type:"number" ,editable:false}
                            ,updtUsrNm:{ type:"string" ,editable:false}
                        }
                    }
                }
            }
            ,editable:true
            ,sortable:false
            ,autoBind:false
            ,selectable:"row"
            ,multiSelectWithCheckbox:false
            ,filterable:false
            ,height:430
            ,edit:function(e){
                var grid = this,
                fieldName = e.container.find("input[name][data-bind]").attr("name");

                if(fieldName=="stdPrcCd"){
                    this.closeCell();
                }

                if (e.model.bpTp === "01") {//BMP 부품 보증가 쓰기 방지.
                    if(fieldName=="grtePrc"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e) {
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);

                var selectedItem = this.dataItem(this.select());
                var grid = $("#grid").data("kendoExtGrid");
                var items = grid.dataSource.data();

                for (i = 0; i < items.length; i++) {
                    var dataItem = items[i];

                    if(dataItem.uid == selectedItem.uid){
                        dataItem.dirty = true;
                    }else{
                        dataItem.dirty = false;
                    }
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){

                        var retlPrc = row.children().eq(14);
                        var retlAddTaxRate = row.children().eq(15);
                        var whslPrc = row.children().eq(16);
                        var whslAddTaxRate = row.children().eq(17);
                        var incPrc = row.children().eq(18);
                        var incAddTaxRate = row.children().eq(19);
                        var grtePrc = row.children().eq(20);

                        //update row reselect.
                        if(dataItem.dirty){
                            var elementRow = e.sender.tbody.find(".checkbox")[idx];
                            elementRow.checked = true;
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");

                            retlPrc.addClass("bg_red");
                            retlAddTaxRate.addClass("bg_red");
                            whslPrc.addClass("bg_red");
                            whslAddTaxRate.addClass("bg_red");
                            incPrc.addClass("bg_red");
                            incAddTaxRate.addClass("bg_red");

                        }else{
                            retlPrc.addClass("bg_white");
                            retlAddTaxRate.addClass("bg_white");
                            whslPrc.addClass("bg_white");
                            whslAddTaxRate.addClass("bg_white");
                            incPrc.addClass("bg_white");
                            incAddTaxRate.addClass("bg_white");
                        }

                        if(dataItem.bpTp !== "01"){//BMP외 부품 보증가 쓰기 가능.(백그라운 컬러 화이트 처리)
                            grtePrc.addClass("bg_white");
                        }

                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }

                });

                $(".checkbox").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#grid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }
                });
            }
            ,columns :
                [
                {title:"", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' class='checkbox' type='checkbox' />"
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:110 }//itemCd
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:150 }//itemNm
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    , template:'#= changeGiStrgeCd(strgeCd)#'
                }//grStrgeCd
                ,{field:"locCd", title:"<spring:message code='par.lbl.locCd' />", width:140 }//locCd
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />", width:70 }//carlineCd
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />", width:60 }//abcInd
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", width:70
                    ,template:'#if(itemDstinCdMap[itemDstinCd] !== undefined){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpTp' />", width:100 }//bpNm
                ,{field:"bmpOpnPrc", title:"<spring:message code='par.lbl.bmpOpnPrc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100}//bmpOpnPrc
                ,{field:"stockGiPrc", title:"<spring:message code='par.lbl.purcPrice' />", attributes:{"class":"ar"}, format:"{0:n2}", width:70 , hidden:true}//stockGiPrc
                ,{field:"rectGiPrc", title:"<spring:message code='par.lbl.grRecentPrice' />", attributes:{"class":"ar"}, format:"{0:n2}", width:70}//rectGiPrc
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />", attributes:{"class":"ar"}, format:"{0:n2}", width:90}//movingAvgPrc
                ,{field:"movingAvgTaxDdctPrc", title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)", attributes:{"class":"ar"}, format:"{0:n2}", width:90}//movingAvgPrc
                ,{field:"stdPrcCd" , title:"<spring:message code='par.lbl.basePrice' />", width:80
                    ,template:'#if(basePriceCalTpMap[stdPrcCd] !== undefined){# #= basePriceCalTpMap[stdPrcCd]# #}#'
                }
                ,{
                    _field:"retlPrcHd"
                    ,title:"<spring:message code='par.lbl.salePriceCost01' />"
                    ,headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"retlPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="retlPrc"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,min:0
                                ,decimals:2
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));

                                    var vPurcPrc = 0,       //입력가격
                                    vPurcBasePrc = 0,       //기준가격
                                    vPurcCalPrc = 0,        //계산가격
                                    vPurcPrcString = "",    //가격문자열
                                    vPurcPrcFloat = 0,      //실가격
                                    stdPrcCd = "03",        //기준가격코드(기본:최신입고가)
                                    taxDdctRetlPrc = 0,
                                    addTaxRate = 0,         //MarkUp
                                    calAddVal = 0;          //MarkUp적용 가산금액

                                    stdPrcCd = model.get("stdPrcCd");
                                    vPurcPrc = this.value();

                                    if(stdPrcCd === "01"){
                                        vPurcBasePrc = model.get("bmpOpnPrc");
                                    }else if(stdPrcCd === "04"){
                                        vPurcBasePrc = model.get("movingAvgPrc");
                                    }else{
                                        vPurcBasePrc = model.get("rectGiPrc");
                                    }

                                    vPurcCalPrc = vPurcPrc - vPurcBasePrc;
                                    if(vPurcBasePrc !== 0){
                                        addTaxRate = kendo.parseFloat(kendo.toString((vPurcCalPrc / vPurcBasePrc),"n4")) * 100;
                                    }else{
                                        addTaxRate = 0;
                                    }
                                    taxDdctRetlPrc = kendo.parseFloat(kendo.toString(vPurcPrc / ( 1 + gVatCd ),"n4"));

                                    model.set("retlPrc", vPurcPrc);//소매가
                                    model.set("retlAddTaxRate", addTaxRate);//소매가 가산율
                                    model.set("taxDdctRetlPrc", taxDdctRetlPrc);//소매가(세금미포함)

                                }
                            });
                        }
                    },{
                        field:"retlAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="retlAddTaxRate" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"{0:n2}"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));

                                    var vPurcPrc = 0,       //입력가격
                                    vPurcBasePrc = 0,       //기준가격
                                    vPurcCalPrc = 0,        //계산가격
                                    vPurcPrcString = "",    //가격문자열
                                    vPurcPrcFloat = 0,      //실가격
                                    stdPrcCd = "03",        //기준가격코드(기본:최신입고가)
                                    taxDdctRetlPrc = 0,
                                    addTaxRate = 0,         //MarkUp
                                    calAddVal = 0;          //MarkUp적용 가산금액

                                    stdPrcCd = model.get("stdPrcCd");
                                    addTaxRate = this.value();

                                    if(stdPrcCd === "01"){
                                        vPurcBasePrc = model.get("bmpOpnPrc");
                                    }else if(stdPrcCd === "04"){
                                        vPurcBasePrc = model.get("movingAvgPrc");
                                    }else{
                                        vPurcBasePrc = model.get("rectGiPrc");
                                    }

                                    vPurcCalPrc = (vPurcBasePrc * (addTaxRate/100));
                                    vPurcPrc = vPurcBasePrc + vPurcCalPrc;
                                    taxDdctRetlPrc = kendo.parseFloat(kendo.toString(vPurcPrc / ( 1 + gVatCd ),"n4"));

                                    if(vPurcPrc < 0){
                                        vPurcPrc = 0;
                                    }

                                    model.set("retlPrc", vPurcPrc);//소매가
                                    model.set("retlAddTaxRate", addTaxRate);//소매가 가산율
                                    model.set("taxDdctRetlPrc", taxDdctRetlPrc);//소매가(세금미포함)
                                }
                            });
                         }
                    }]
                }
                ,{
                    _field:"whslPrcHd"
                    ,title:"<spring:message code='par.lbl.salePriceCost02' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"whslPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="whslPrc"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,min:0
                                ,decimals:2
                                ,format:"{0:n2}"
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));

                                    var vPurcPrc = 0,       //입력가격
                                    vPurcBasePrc = 0,       //기준가격
                                    vPurcCalPrc = 0,        //계산가격
                                    vPurcPrcString = "",    //가격문자열
                                    vPurcPrcFloat = 0,      //실가격
                                    stdPrcCd = "03",        //기준가격코드(기본:최신입고가)
                                    taxDdctWhslPrc = 0,
                                    addTaxRate = 0,         //MarkUp
                                    calAddVal = 0;          //MarkUp적용 가산금액

                                    stdPrcCd = model.get("stdPrcCd");
                                    vPurcPrc = this.value();

                                    if(stdPrcCd === "01"){
                                        vPurcBasePrc = model.get("bmpOpnPrc");
                                    }else if(stdPrcCd === "04"){
                                        vPurcBasePrc = model.get("movingAvgPrc");
                                    }else{
                                        vPurcBasePrc = model.get("rectGiPrc");
                                    }

                                    vPurcCalPrc = vPurcPrc - vPurcBasePrc;
                                    if(vPurcBasePrc !== 0){
                                        addTaxRate = kendo.parseFloat(kendo.toString((vPurcCalPrc / vPurcBasePrc),"n4")) * 100;
                                    }else{
                                        addTaxRate = 0;
                                    }
                                    taxDdctWhslPrc = kendo.parseFloat(kendo.toString(vPurcPrc / ( 1 + gVatCd ),"n4"));

                                    model.set("whslPrc", vPurcPrc);//도매가
                                    model.set("whslAddTaxRate", addTaxRate);//도매가 가산율
                                    model.set("taxDdctWhslPrc", taxDdctWhslPrc);//도매가(세금미포함)
                                }
                            });
                        }
                    },{
                        field:"whslAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="whslAddTaxRate" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"{0:n2}"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));

                                    var vPurcPrc = 0,       //입력가격
                                    vPurcBasePrc = 0,       //기준가격
                                    vPurcCalPrc = 0,        //계산가격
                                    vPurcPrcString = "",    //가격문자열
                                    vPurcPrcFloat = 0,      //실가격
                                    stdPrcCd = "03",        //기준가격코드(기본:최신입고가)
                                    taxDdctWhslPrc = 0,
                                    addTaxRate = 0,         //MarkUp
                                    calAddVal = 0;          //MarkUp적용 가산금액

                                    stdPrcCd = model.get("stdPrcCd");
                                    addTaxRate = this.value();

                                    if(stdPrcCd === "01"){
                                        vPurcBasePrc = model.get("bmpOpnPrc");
                                    }else if(stdPrcCd === "04"){
                                        vPurcBasePrc = model.get("movingAvgPrc");
                                    }else{
                                        vPurcBasePrc = model.get("rectGiPrc");
                                    }

                                    vPurcCalPrc = (vPurcBasePrc * (addTaxRate/100));
                                    vPurcPrc = vPurcBasePrc + vPurcCalPrc;
                                    taxDdctWhslPrc = kendo.parseFloat(kendo.toString(vPurcPrc / ( 1 + gVatCd ),"n4"));

                                    if(vPurcPrc < 0){
                                        vPurcPrc = 0;
                                    }

                                    model.set("whslPrc", vPurcPrc);//도매가
                                    model.set("whslAddTaxRate", addTaxRate);//도매가 가산율
                                    model.set("taxDdctWhslPrc", taxDdctWhslPrc);//도매가(세금미포함)
                                }
                            });
                         }
                    }]
                }
                ,{
                    _field:"incPrcHd"
                    ,title:"<spring:message code='par.lbl.salePriceCost03' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"incPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="incPrc" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,min:0
                                ,decimals:2
                                ,format:"{0:n2}"
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));

                                    var vPurcPrc = 0,       //입력가격
                                    vPurcBasePrc = 0,       //기준가격
                                    vPurcCalPrc = 0,        //계산가격
                                    vPurcPrcString = "",    //가격문자열
                                    vPurcPrcFloat = 0,      //실가격
                                    stdPrcCd = "03",        //기준가격코드(기본:최신입고가)
                                    taxDdctIncPrc = 0,
                                    addTaxRate = 0,         //MarkUp
                                    calAddVal = 0;          //MarkUp적용 가산금액

                                    stdPrcCd = model.get("stdPrcCd");
                                    vPurcPrc = this.value();

                                    if(stdPrcCd === "01"){
                                        vPurcBasePrc = model.get("bmpOpnPrc");
                                    }else if(stdPrcCd === "04"){
                                        vPurcBasePrc = model.get("movingAvgPrc");
                                    }else{
                                        vPurcBasePrc = model.get("rectGiPrc");
                                    }

                                    vPurcCalPrc = vPurcPrc - vPurcBasePrc;
                                    if(vPurcBasePrc !== 0){
                                        addTaxRate = kendo.parseFloat(kendo.toString((vPurcCalPrc / vPurcBasePrc),"n4")) * 100;
                                    }else{
                                        addTaxRate = 0;
                                    }
                                    taxDdctIncPrc = kendo.parseFloat(kendo.toString(vPurcPrc / ( 1 + gVatCd ),"n4"));

                                    model.set("incPrc", vPurcPrc);//보험가
                                    model.set("incAddTaxRate", addTaxRate);//보험가 가산율
                                    model.set("taxDdctIncPrc", taxDdctIncPrc);//보험가(세금미포함)
                                }
                            });
                        }
                    },{
                        field:"incAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="incAddTaxRate" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"{0:n2}"
                                ,decimals:2
                                ,spinners:false
                                ,change:function(){
                                    var grid = $("#grid").data("kendoExtGrid"),
                                    model = grid.dataItem(this.element.closest("tr"));

                                    var vPurcPrc = 0,       //입력가격
                                    vPurcBasePrc = 0,       //기준가격
                                    vPurcCalPrc = 0,        //계산가격
                                    vPurcPrcString = "",    //가격문자열
                                    vPurcPrcFloat = 0,      //실가격
                                    stdPrcCd = "03",        //기준가격코드(기본:최신입고가)
                                    taxDdctIncPrc = 0,
                                    addTaxRate = 0,         //MarkUp
                                    calAddVal = 0;          //MarkUp적용 가산금액

                                    stdPrcCd = model.get("stdPrcCd");
                                    addTaxRate = this.value();

                                    if(stdPrcCd === "01"){
                                        vPurcBasePrc = model.get("bmpOpnPrc");
                                    }else if(stdPrcCd === "04"){
                                        vPurcBasePrc = model.get("movingAvgPrc");
                                    }else{
                                        vPurcBasePrc = model.get("rectGiPrc");
                                    }

                                    vPurcCalPrc = (vPurcBasePrc * (addTaxRate/100));
                                    vPurcPrc = vPurcBasePrc + vPurcCalPrc;
                                    taxDdctIncPrc = kendo.parseFloat(kendo.toString(vPurcPrc / ( 1 + gVatCd ),"n4"));

                                    if(vPurcPrc < 0){
                                        vPurcPrc = 0;
                                    }

                                    model.set("incPrc", vPurcPrc);//보험가
                                    model.set("incAddTaxRate", addTaxRate);//보험가 가산율
                                    model.set("taxDdctIncPrc", taxDdctIncPrc);//보험가(세금미포함)
                                }
                            });
                         }
                    }]
                }
                ,{
                    _field:"grtePrcHd"
                    ,title:"<spring:message code='par.lbl.salePriceCost04' />"
                    , headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"grtePrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '" name="grtePrc" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                spinners:false
                                ,change:function(){
                                }
                            });
                        }
                    },{
                        field:"grteAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    }]
                }//grtePrc
                ,{field:"updtUsrNm", title:"<spring:message code='par.lbl.updtUsrId' />", width:100 }//updtUsrNm
            ]
        });

        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#grid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox")[i];
                elementRow.checked = checked;
                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });


      //창고
        changeGiStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(giStrgeCdObj[val]))
                returnVal = giStrgeCdObj[val];
            }
            return returnVal;
        };
    });
</script>
<!-- //script -->


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- priceMaterMgr -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.search" /> --%><!-- search --></h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
        </div>
    </div>
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- dlrCd --></th>
                    <td>
                        <input type="text" id="sDlrCd"  readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- spyrCd --></th>
                    <td>
                        <input id="sSpyrCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="sItemCd" class="form_input" value="${itemCd}" />
                            <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input type="text" id="sItemNm" class="form_input" value="${itemNm}" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></th>
                    <td>
                        <input id="sItemDstinCd" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <!-- gridItem -->
        <div id="gridItem"></div>
        <!-- gridItem -->
    </div>
</section>
<!-- // priceMaterMgr -->

<!-- itemInfo -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.itemInfo" /><!-- itemInfo --></h2>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <input id="itemCd" name="itemCd" readonly="readonly" class="form_input form_readonly"  maxlength="18" />
                        <input type="hidden" id="InsertUpdateFlag" value="INSERT" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="itemNm" name="itemNm" readonly="readonly" class="form_input form_readonly"  maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></th>
                    <td>
                        <input id="itemDstinCd" name="itemDstinCd" readonly="readonly" class="form_input form_readonly"  maxlength="50" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemGrpNm" /><!-- itemGrpNm --></th>
                    <td>
                        <input id="itemGrpCd" name="itemGrpCd" readonly="readonly" class="form_input form_readonly"  maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.prcTp" /><!-- prcTp --></th>
                    <td>
                        <label for="prcTp1" class="label_check">
                            <input id="prcTp1" name="endYn" type="radio" value="Y" checked="checked" onclick="javascript:changedPrcTp(true);" class="form_check" />
                            <spring:message code="par.lbl.purcPrc" /><!-- purcPrc-->
                        </label>
                        <label for="prcTp2" class="label_check">
                            <input id="prcTp2" name="endYn" type="radio" value="N" onclick="javascript:changedPrcTp(false);" class="form_check" />
                            <spring:message code="par.lbl.salePrcAmt" /><!-- salePrcAmt -->
                        </label>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // itemInfo -->

<!-- supplyComplayInfo -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.supplyInfo" /><!-- supplyInfo --></h2>
    </div>
</section>
<!-- // tab start-->
<div id="tabstrip" class="tab_area mt0">
    <ul>
        <li id ="tabTargetOn" class="k-state-active"><spring:message code="par.title.targetOn" /><!-- targetOn --></li>
        <li id ="tabTargetOff"><spring:message code="par.title.targetOff" /><!-- targetOff --></li>
    </ul>
    <!--targetOn tab area -->
    <div class="mt0">
        <div class="header_area">
            <div class="btn_right">
                <button id="btnAdd" name="btnAdd" class="btn_s btn_s_min5" ><spring:message code="par.btn.add" /><!-- btnAdd --></button>
                <button id="btnTargetOff" name="btnTargetOff" class="btn_s btn_s_min5" ><spring:message code="par.btn.targetOff" /><!-- btnTargetOff --></button>
            </div>
        </div>
        <div class="table_grid">
            <!-- targetOnGrid -->
            <div id="targetOnGrid" ></div>
            <!-- targetOnGrid -->
        </div>

    </div>
    <!-- targetOff tab area -->
    <div class="mt0">
        <div class="header_area">
            <div class="btn_right">
                <button id="btnTargetOn" name="btnTargetOn" class="btn_s btn_s_min5" ><spring:message code="par.btn.targetOn" /><!-- btnTargetOn --></button>
            </div>
        </div>
        <div class="table_grid">
            <!-- targetOffGrid -->
            <div id="targetOffGrid" ></div>
            <!-- targetOffGrid -->
        </div>
    </div>

</div>
<!-- // tab end -->
<!-- supplyComplayInfo -->

<!-- priceMaster -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.priceList" /><!-- priceList --></h2>
        <div class="btn_right">
            <button id="btnPartsPriceSave" name="btnPartsPriceSave" class="btn_s btn_s_min5" ><spring:message code="par.btn.save" /><!-- btnPartsPriceSave --></button>
            <button id="btnPartsPriceAdd" name="btnPartsPriceAdd" class="btn_s btn_s_min5" ><spring:message code="par.btn.rowAdd" /><!-- btnPartsPriceAdd --></button>
            <button id="btnPartsPriceDel" name="btnPartsPriceDel" class="btn_s btn_s_min5" ><spring:message code="par.btn.rowDel" /><!-- btnPartsPriceDel --></button>
            <button id="btnPartsSalPriceSave" name="btnPartsSalPriceSave" class="btn_s dis_none btn_s_min5" ><spring:message code="par.btn.save" /><!-- btnPartsSalPriceSave --></button>
            <button id="btnPartsSalPriceAdd" name="btnPartsSalPriceAdd" class="btn_s dis_none btn_s_min5" ><spring:message code="par.btn.rowAdd" /><!-- btnPartsSalPriceAdd --></button>
            <button id="btnPartsSalPriceDel" name="btnPartsSalPriceDel" class="btn_s dis_none btn_s_min5" ><spring:message code="par.btn.rowDel" /><!-- btnPartsSalPriceDel --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="partsPriceGrid" ></div>
        <div id="partsSalPriceGrid"></div>
    </div>
</section>
<!-- // priceMaterMgr -->

<!-- script -->
<script type="text/javascript">
//spyrCdList
var spyrCdList = [];
<c:forEach var="obj" items="${spyrCdList}">
spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//itemDstinCdMap
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//itemGroupCdList
var itemGroupCdList = [];
<c:forEach var="obj" items="${itemGroupCdList}">
itemGroupCdList.push({
    "itemGrpCd":"${obj.itemGrpCd}"
    , "itemGrpNm":"${obj.itemGrpNm}"
});
</c:forEach>
//itemGroupCdMap
var itemGroupCdMap = {};
$.each(itemGroupCdList, function(idx, obj){
    itemGroupCdMap[obj.itemGrpCd] = obj.itemGrpNm;
});
//purcPrcTpList
var purcPrcTpList = [];
<c:forEach var="obj" items="${purcPrcTpList}">
purcPrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//purcPrcTpMap
var purcPrcTpMap = {};
$.each(purcPrcTpList, function(idx, obj){
    purcPrcTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//salePrcTpList
var salePrcTpList = [];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//salePrcTpMap
var salePrcTpMap = {};
$.each(salePrcTpList, function(idx, obj){
    salePrcTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//prcQtyUnitCdDs
var prcQtyUnitCdDs = [];
<c:forEach var="obj" items="${prcQtyUnitCdDs}">
prcQtyUnitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitCd}"
});
</c:forEach>
var prcQtyUnitCdMap = {};
$.each(prcQtyUnitCdDs, function(idx, obj){
    prcQtyUnitCdMap[obj.unitCd] = obj.unitNm;
});

var sBpCd = "";     // bpCd
var sItemCd = "";   // itemCd

// item search popup Func
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(){
    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   //itemInfo
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
// supply search popup Func
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code='par.title.supplyInfo' />"   // supplyInfo
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":""
                ,"bpNm":""
                ,"bpTp":""
                ,"callbackFunc":function(data){
                    // supply info add
                    insertVenderMasterItemAdd(data);
                }
            }
        }
    });
}
//supply master add Func
function insertVenderMasterItemAdd(data){
    var vBpCd = data[0].bpCd;
    var venderDs = $("#targetOnGrid").data("kendoExtGrid").dataSource;
    var iRowCnt = venderDs.total();
    var bCheck = false;
    for(var i = 0 ;i < iRowCnt ;i++){
        var vRowData = venderDs.at(i);
        var vRowBpCd = vRowData.bpCd;
        // bpCd check
        if(vBpCd == vRowBpCd){
            bCheck = true;
            break;
        }
    }
    // bpCd item check false
    if(bCheck == false){
        var bpVO = { rnum:iRowCnt + 1,  dlrCd:"", bpCd:data[0].bpCd, bpNm:data[0].bpNm, itemCd:$("#itemCd").val(), crnNo:data[0].crnNo, applyYn:"Y", regUsrId:null, regDt:null, updtUsrId:null, updtDt:null };
        // supply add
        sendPartsVenderMaster(bpVO);
    }
}
//supply master save Func
function sendPartsVenderMaster(bpVO){
    var targetOnGrid = $("#targetOnGrid").data("kendoExtGrid");
    $.ajax({
        url:"<c:url value='/par/pmm/partsPriceMaster/insertPartsVenderMaster.do' />"
        ,data:JSON.stringify(bpVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            targetOnGrid.dataSource.read();
            //success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}
// supply button enable disable Func
function buttonVenderEnableDisable(bFlag){
    $("#btnAdd").data("kendoButton").enable(bFlag);
    $("#btnTargetOff").data("kendoButton").enable(bFlag);
    $("#btnTargetOn").data("kendoButton").enable(bFlag);
}
// price button enable disable Func
function buttonVenderPriceEnableDisable(bFlag){
    $("#btnPartsPriceAdd").data("kendoButton").enable(bFlag);
    $("#btnPartsPriceDel").data("kendoButton").enable(bFlag);
    $("#btnPartsPriceSave").data("kendoButton").enable(bFlag);
    if(bFlag == true){
        $("#btnPartsPriceAdd").removeClass("dis_none");
        $("#btnPartsPriceDel").removeClass("dis_none");
        $("#btnPartsPriceSave").removeClass("dis_none");

        $("#btnPartsSalPriceAdd").addClass("dis_none");
        $("#btnPartsSalPriceDel").addClass("dis_none");
        $("#btnPartsSalPriceSave").addClass("dis_none");

        bFlag = false;
    }
    else{
        $("#btnPartsPriceAdd").addClass("dis_none");
        $("#btnPartsPriceDel").addClass("dis_none");
        $("#btnPartsPriceSave").addClass("dis_none");

        $("#btnPartsSalPriceAdd").removeClass("dis_none");
        $("#btnPartsSalPriceDel").removeClass("dis_none");
        $("#btnPartsSalPriceSave").removeClass("dis_none");

        bFlag = true;
    }

    $("#btnPartsSalPriceAdd").data("kendoButton").enable(bFlag);
    $("#btnPartsSalPriceDel").data("kendoButton").enable(bFlag);
    $("#btnPartsSalPriceSave").data("kendoButton").enable(bFlag);
}

//item master select Func
function selectPartsMasters(){
    $("#gridItem").data("kendoExtGrid").dataSource.page(1);
}

//supply target on/off select Func
function selectPartsVenderMasters(){
    $("#targetOnGrid").data("kendoExtGrid").dataSource.read();
    $("#targetOffGrid").data("kendoExtGrid").dataSource.read();
}

//supply info update
function updatePartsVenderMaster(sApplyYn){
    var selectedItem = null;
    if(sApplyYn == "N"){
        var targetOnGrid = $("#targetOnGrid").data("kendoExtGrid");
        selectedItem = targetOnGrid.dataItem(targetOnGrid.select());
    }
    else if(sApplyYn == "Y"){
        var targetOffGrid = $("#targetOffGrid").data("kendoExtGrid");
        selectedItem = targetOffGrid.dataItem(targetOffGrid.select());
    }

    if(selectedItem != null){
        selectedItem.applyYn = sApplyYn;
        $.ajax({
            url:"<c:url value='/par/pmm/partsPriceMaster/updatePartsVenderMaster.do' />"
            ,data:JSON.stringify(selectedItem)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                //selectPartsVenderMasters Func call
                selectPartsVenderMasters();
                //success message
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }
}
//price master select Func
function selectPartsVenderPriceMasters(){
    $("#partsPriceGrid").data("kendoExtGrid").dataSource.read();
}
//sale price master select Func
function selectPartsVenderSalPriceMasters(){
    $("#partsSalPriceGrid").data("kendoExtGrid").dataSource.read();
}
//item master key select Func
function selectPartsMasterByKey(selectedItem){
    $("#InsertUpdateFlag").val("UPDATE");
    $("#itemCd").val(selectedItem.itemCd);
    $("#itemNm").val(selectedItem.itemNm);
    $("#itemDstinCd").val(itemDstinCdMap[selectedItem.itemDstinCd]);
    $("#itemGrpCd").val(itemGroupCdMap[selectedItem.itemGrpCd]);
}
//supply info by key select Func
function selectPartsVenderMasterByKey(selectedItem){
    sBpCd = selectedItem.bpCd;
}
//price type changed Func
function changedPrcTp(bFlag){
    if($("#itemCd").val() != ""){
        // tabstrip enable/disable
        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
        $.each(tabStrip.contentElements, function(idx, obj){
            tabStrip.enable(tabStrip.tabGroup.children().eq(idx), bFlag);
        });
        //supply button enable/disable
        buttonVenderEnableDisable(bFlag);
        //price button enable/disable
        buttonVenderPriceEnableDisable(bFlag);
        // button show/hide
        if(bFlag){
            $("#partsPriceGrid").show();
            $("#partsSalPriceGrid").hide();
        }
        else{
            $("#partsPriceGrid").hide();
            $("#partsSalPriceGrid").show();
        }
    }
}
/**
* checkbox click event
*/
$(document).on("click", ".aprv-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#partsPriceGrid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
        dataItem.set(thisName, "Y");
    }else{
        dataItem.set(thisName, "N");
    }
 });

/**
* checkbox click event
*/
$(document).on("click", ".aprv-sal-chk", function(e){
    var thisName = $(this).data("name");
    var grid = $("#partsSalPriceGrid").data("kendoExtGrid"),
    dataItem = grid.dataItem($(e.target).closest("tr"));

    if($(this).is(":checked")){
        dataItem.set(thisName, "Y");
    }else{
        dataItem.set(thisName, "N");
    }
 });

$(document).ready(function() {

    $("#dlrCd").val("${dlrCd}");
    //sSpyrCd
    $("#sSpyrCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:spyrCdList
        ,index:0
    });
    //sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:itemDstinCdList
        ,index:0
    });
    //sItemDstinCd selct 2
    $("#sItemDstinCd").data("kendoExtDropDownList").select(2);
    //tab
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            selectPartsMasters();
        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
        enable:false
        ,click:function(e){
            //supply search popup call
            selectVenderMasterPopupWindow();
        }
    });
    //btnTargetOn
    $("#btnTargetOn").kendoButton({
        enable:false
        ,click:function(e){
            //supply info update
            updatePartsVenderMaster("Y");
        }
    });
    //btnTargetOff
    $("#btnTargetOff").kendoButton({
        enable:false
        ,click:function(e){
            //supply info update
            updatePartsVenderMaster("N");
        }
    });
    //btnPartsPriceAdd
    $("#btnPartsPriceAdd").kendoButton({
        enable:false
        ,click:function(e){
            var iRowCnt = $('#partsPriceGrid').data('kendoExtGrid').dataSource.total();

            $('#partsPriceGrid').data('kendoExtGrid').dataSource.insert(0, {
                "rnum":iRowCnt+1
                ,"dlrCd":""
                ,"bpCd":sBpCd
                ,"itemCd":$("#itemCd").val()
                ,"prcTp":""
                ,"lineNo":iRowCnt+1
                ,"applyYn":"Y"
                ,"purcPrc":0
                ,"prcQty":0
                ,"prcQtyUnitCd":""
                ,"startDt":new Date("${sysDate}")
                ,"endDt":new Date("${sysDate}")
                ,"delYn":"N"
                ,"regUsrId":null
                ,"regDt":null
                ,"updtUsrId":null
                ,"updtDt":null
            });
        }
    });
    //btnPartsPriceDel
    $("#btnPartsPriceDel").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#partsPriceGrid").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });
    //btnPartsPriceSave
    $("#btnPartsPriceSave").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#partsPriceGrid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiPartsPrices = grid.getCUDData("insertList", "updateList", "deleteList");

                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/partsPriceMaster/multiPartsVenderPriceMasters.do' />"
                    ,data:JSON.stringify(multiPartsPrices)
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
                //input value check
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    //btnPartsSalPriceAdd
    $("#btnPartsSalPriceAdd").kendoButton({
        enable:false
        ,click:function(e){
            var iRowCnt = $('#partsSalPriceGrid').data('kendoExtGrid').dataSource.total();

            $('#partsSalPriceGrid').data('kendoExtGrid').dataSource.insert(0, {
                "rnum":iRowCnt + 1
                ,"dlrCd":""
                ,"itemCd":$("#itemCd").val()
                ,"prcTp":""
                ,"lineNo":iRowCnt + 1
                ,"applyYn":"Y"
                ,"salePrcAmt":0
                ,"prcQty":0
                ,"prcQtyUnitCd":""
                ,"startDt":null
                ,"endDt":null
                ,"delYn":"N"
                ,"regUsrId":null
                ,"regDt":null
                ,"updtUsrId":null
                ,"updtDt":null
            });
        }
    });
    //btnPartsSalPriceDel
    $("#btnPartsSalPriceDel").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#partsSalPriceGrid").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });
    //btnPartsSalPriceSave
    $("#btnPartsSalPriceSave").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#partsSalPriceGrid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiPartsPrices = grid.getCUDData("insertList", "updateList", "deleteList");

                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/partsPriceMaster/multiPartsVenderSalPriceMasters.do' />"
                    ,data:JSON.stringify(multiPartsPrices)
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
                //input value check
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    //gridItem
    $("#gridItem").kendoExtGrid({
        height:290
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sSpyrCd"] = $("#sSpyrCd").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val() == "" ? "02":$("#sItemDstinCd").val(); // sItemDstinCd set value:02

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"itemCd"
                   ,fields:{
                        dlrCd :{ type:"string" , validation:{required:true} }
                       ,itemCd:{ type:"string" , validation:{required:true} }
                       ,itemNm:{ type:"string" , validation:{required:true} }
                    }
                }
            }
          }
        ,editable:false
        ,selectable:"row"
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());

            if( selectedItem != null && selectedItem != 'undefined'){
                $.ajax({
                    url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />"
                    ,data:JSON.stringify({ sDlrCd:selectedItem.dlrCd, sItemCd:selectedItem.itemCd})
                    ,type:"POST"
                    ,dataType:"json"
                    ,contentType:"application/json"
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                }).done(function(result) {
                    //item info by key Func call
                    selectPartsMasterByKey(result);
                    //price type
                    $("#prcTp1").prop("checked", true);
                    $("#prcTp1").prop("disabled", false);
                    $("#prcTp2").prop("disabled", false);
                    //price area changed
                    changedPrcTp(true);
                    //supply info select
                    selectPartsVenderMasters();
                    //price master data clear
                    $("#partsPriceGrid").data("kendoExtGrid").dataSource.data([]);
                    //sale price master select
                    selectPartsVenderSalPriceMasters();
                });
            }
        }
        ,pageable:{
            refresh:false
            ,pageSize:30
            ,pageSizes:[10, 20, 30, 50, 100]
            ,buttonCount:1
            ,input:true
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.no' />"
                ,width:30
                ,attributes:{"class":"ac"}
                ,sortable:false
            }//rnum
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}    //itemCd
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}    //itemNm
        ]
    });
    //targetOnGrid
    $("#targetOnGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var itemCd = $("#itemCd").val() == "" ? "X":$("#itemCd").val();
                        params["sItemCd"] = itemCd;
                        params["sBpCd"] = "";
                        params["sApplyYn"] = "Y";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"bpCd"
                    ,fields:{
                        rnum:{ type:"number" , validation:{required:true} }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,bpCd:{ type:"string" , validation:{required:true} }
                        ,bpNm:{ type:"string" , validation:{required:true} }
                        ,itemCd:{ type:"string" , validation:{required:true} }
                        ,crnNo:{ type:"string" }
                        ,applyYn:{ type:"string" , validation:{required:true} }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,editable:false
        ,pageable:false
        ,selectable:"row"
        ,change:function(e){
            if($("#prcTp1").is(":checked")){
                var selectedItem = this.dataItem(this.select());
                if( selectedItem != null && selectedItem != 'undefined'){
                    //supply by key select
                    selectPartsVenderMasterByKey(selectedItem);
                    //price master select
                    selectPartsVenderPriceMasters();
                    //price button enable/disable
                    buttonVenderPriceEnableDisable(true);
                }
            }
        }
        ,height:200
        ,columns :[
            {field:"rnum", title:"<spring:message code='par.lbl.line' />", width:50}      //rnum
            ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:150}    //bpCd
            ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:200}    //bpNm
            ,{field:"crnNo", title:"<spring:message code='par.lbl.crnNo' />", width:150}  //crnNo
            ,{field:"addr", title:"<spring:message code='par.lbl.addr' />", width:300}    //addr
        ]
    });
    //targetOnGrid data clear
    $("#targetOnGrid").data("kendoExtGrid").dataSource.data([]);
    //targetOffGrid
    $("#targetOffGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var itemCd = $("#itemCd").val() == "" ? "X":$("#itemCd").val();
                        params["sItemCd"] = itemCd;
                        params["sBpCd"] = "";
                        params["sApplyYn"] = "N";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"bpCd"
                    ,fields:{
                        rnum:{ type:"number" , validation:{required:true} }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,bpCd:{ type:"string" , validation:{required:true} }
                        ,bpNm:{ type:"string" , validation:{required:true} }
                        ,itemCd:{ type:"string" , validation:{required:true} }
                        ,crnNo:{ type:"string" }
                        ,applyYn:{ type:"string" , validation:{required:true} }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,editable:false
        ,pageable:false
        ,selectable:"row"
        ,height:200
        ,columns :[
            {field:"rnum", title:"<spring:message code='par.lbl.line' />", width:50}      //rnum
            ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:150}    //bpCd
            ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:200}    //bpNm
            ,{field:"crnNo", title:"<spring:message code='par.lbl.crnNo' />", width:150}  //crnNo
            ,{field:"addr", title:"<spring:message code='par.lbl.addr' />", width:300}    //addr
        ]
    });
    //partsPriceGrid
    $("#partsPriceGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderPriceMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var itemCd = $("#itemCd").val() == "" ? "X":$("#itemCd").val();
                        params["sItemCd"] = itemCd;
                        params["sBpCd"] = sBpCd;
                        params["sDelYn"] = "N";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        rnum:{ type:"string" , validation:{required:true} , editable:false}
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,bpCd:{ type:"string" , validation:{required:true} }
                        ,itemCd:{ type:"string" , validation:{required:true} }
                        ,prcTp:{ type:"string" , validation:{required:true} , editable:true}
                        ,lineNo:{ type:"string" }
                        ,applyYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,purcPrc:{ type:"number" , validation:{required:true} }
                        ,prcQty:{ type:"number" , validation:{required:true} }
                        ,prcQtyUnitCd:{ type:"string" , editable:true}
                        ,startDt:{ type:"date" , validation:{required:true} }
                        ,endDt:{ type:"date" , validation:{required:true} }
                        ,delYn:{ type:"string" , defaultValue:"N", editable:true }
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

            if(fieldName=="applyYn"){
                this.closeCell();
            }
        }
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem.prcTp == null || dataItem.prcTp == ""){
                    // grid cell focus
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(1)");
                    sender.editCell(cellToEdit);
                }
            }
        }
        ,pageable:false
        ,height:237
        ,selectable:"multiple,row"
        ,columns :[
            {field:"rnum", title:"<spring:message code='par.lbl.line' />", width:50 }  //rnum
            ,{field:"prcTp", title:"<spring:message code='par.lbl.priceTp' />"
                ,width:120
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:purcPrcTpList
                    });
                }
                ,template:'#if(prcTp !== ""){# #= purcPrcTpMap[prcTp]# #}#'
            }//prcTp
            ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:120 }   //startDt
            ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:120 }       //endDt
            ,{field:"applyYn", title:"<spring:message code='par.lbl.applyYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="aprv-chk" data-name="applyYn" #= applyYn=="Y"? checked="checked":"" # />'
            }//applyYn
            ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcPrc' />"
                ,width:150
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,format:"{0:n2}"
                        ,spinners:false
                    });
                }
            }//purcPrc
            ,{field:"prcQty", title:"<spring:message code='par.lbl.prcQty' />"
                ,width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,format:"{0:n2}"
                        ,spinners:false
                    });
                }
            }//prcQty
            ,{field:"prcQtyUnitCd", title:"<spring:message code='par.lbl.unitNm' />"
                ,width:100
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"unitNm"
                        ,dataValueField:"unitCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:prcQtyUnitCdDs
                    });
                }
            }//prcQtyUnitCd
        ]
    });
    //partsSalPriceGrid
    $("#partsSalPriceGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var itemCd = $("#itemCd").val() == "" ? "X":$("#itemCd").val();
                        params["sItemCd"] = itemCd;
                        params["sDelYn"] = "N";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"lineNo"
                    ,fields:{
                        rnum:{ type:"string" , validation:{required:true} , editable:false}
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,itemCd:{ type:"string" , validation:{required:true} }
                        ,prcTp:{ type:"string" , validation:{required:true} , editable:true}
                        ,lineNo:{ type:"string" }
                        ,applyYn:{ type:"string" , defaultValue:"Y", editable:true }
                        ,salePrcAmt:{ type:"number" , validation:{required:true} }
                        ,prcQty:{ type:"number" , validation:{required:true} }
                        ,prcQtyUnitCd:{ type:"string" , editable:true}
                        ,startDt:{ type:"date" , validation:{required:true} }
                        ,endDt:{ type:"date" , validation:{required:true} }
                        ,delYn:{ type:"string" , defaultValue:"N", editable:true }
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

            if(fieldName=="applyYn"){
                this.closeCell();
            }
        }
        ,pageable:false
        ,height:237
        ,selectable:"multiple,row"
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem.prcTp == null || dataItem.prcTp == ""){
                    //grid cell foucs
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(1)");
                    sender.editCell(cellToEdit);
                }
            }
        }
        ,columns :[
            {field:"rnum", title:"<spring:message code='par.lbl.line' />", width:50 }     //rnum
            ,{field:"prcTp", title:"<spring:message code='par.lbl.priceTp' />"
                ,width:120
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:salePrcTpList
                    });
                }
            }//prcTp
            ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:120 }   //startDt
            ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:120 }       //endDt
            ,{field:"applyYn", title:"<spring:message code='par.lbl.applyYn' />", attributes:{"class":"ac"}
                ,width:100
                ,template:'<input type="checkbox" class="aprv-sal-chk" data-name="applyYn" #= applyYn=="Y"? checked="checked":"" # />'
            }//applyYn
            ,{field:"salePrcAmt", title:"<spring:message code='par.lbl.salePrcAmt' />"
                ,width:150
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,format:"{0:n2}"
                        ,spinners:false
                    });
                }
            }//salePrcAmt
            ,{field:"prcQty", title:"<spring:message code='par.lbl.prcQty' />"
                ,width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,format:"{0:n2}"
                        ,spinners:false
                    });
                }
            }//prcQty
            ,{field:"prcQtyUnitCd", title:"<spring:message code='par.lbl.unitNm' />"
                ,width:100
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"unitNm"
                        ,dataValueField:"unitCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:prcQtyUnitCdDs
                    });
                 }
            }//prcQtyUnitCd
        ]
    });
    //sale price grid hide
    $("#partsSalPriceGrid").hide();
    //price type disable
    $("#prcTp1").prop("disabled", true);
    $("#prcTp2").prop("disabled", true);
});

</script>
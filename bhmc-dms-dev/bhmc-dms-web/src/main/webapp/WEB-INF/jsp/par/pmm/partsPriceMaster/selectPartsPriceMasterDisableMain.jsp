<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- itemPriceMaster -->
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
                            <input type="text" id="sItemCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input type="text" id="sItemNm" class="form_input" />
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
<!-- // itemPriceMaster -->

<!-- item Info -->
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
                        <label class="label_check"><input id="prcTp1" name="endYn" type="radio" value="Y" checked="checked" onclick="javascript:changedPrcTp(true);" class="form_check"> <spring:message code="par.lbl.purcPrc" /><!-- purcPrc--></label>
                        <label class="label_check"><input id="prcTp2" name="endYn" type="radio" value="N" onclick="javascript:changedPrcTp(false);" class="form_check"><spring:message code="par.lbl.salePrcAmt" /><!-- salePrcAmt --></label>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // item Info -->

<!-- supplyInfo -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.supplyInfo" /><!-- supplyInfo --></h2>
    </div>
        <!-- // tab Start -->
        <div id="tabstrip" class="tab_area mt0">
            <ul>
                <li id ="tabTargetOn" class="k-state-active"><spring:message code="par.title.targetOn" /><!-- targetOn --></li>
                <li id ="tabTargetOff"><spring:message code="par.title.targetOff" /><!-- targetOff --></li>
            </ul>
            <!--tabTargetOn Area -->
            <div>
                <div class="table_grid">
                    <!-- targetOnGrid -->
                    <div id="targetOnGrid" ></div>
                    <!-- targetOnGrid -->
                </div>

            </div>
            <!--tabTargetOff Area -->
            <div>
                <div class="table_grid">
                    <!-- targetOffGrid -->
                    <div id="targetOffGrid" ></div>
                    <!-- targetOffGrid -->
                </div>
            </div>

        </div>
        <!-- // tab End-->
</section>
<!-- supplyInfo -->

<!-- price List -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.priceList" /><!-- priceList --></h2>
    </div>
    <div class="table_grid">
        <!-- partsPriceGrid -->
        <div id="partsPriceGrid" ></div>
        <!-- partsPriceGrid -->
        <!-- partsSalPriceGrid -->
        <div id="partsSalPriceGrid"  ></div>
        <!-- partsSalPriceGrid -->
    </div>
</section>
<!-- // price List -->

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

// item search Popup
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

//selectPartsMasters Func
function selectPartsMasters(){
    $("#gridItem").data("kendoExtGrid").dataSource.page(1);
}

//selectPartsVenderMasters Func
function selectPartsVenderMasters(){
    $("#targetOnGrid").data("kendoExtGrid").dataSource.read();
    $("#targetOffGrid").data("kendoExtGrid").dataSource.read();
}

//selectPartsVenderPriceMasters Func
function selectPartsVenderPriceMasters(){
    $("#partsPriceGrid").data("kendoExtGrid").dataSource.read();
}
//selectPartsVenderSalPriceMasters Func
function selectPartsVenderSalPriceMasters(){
    $("#partsSalPriceGrid").data("kendoExtGrid").dataSource.read();
}

//selectPartsMasterByKey Func
function selectPartsMasterByKey(selectedItem){
    $("#InsertUpdateFlag").val("UPDATE");
    $("#itemCd").val(selectedItem.itemCd);
    $("#itemNm").val(selectedItem.itemNm);
    $("#itemDstinCd").val(itemDstinCdMap[selectedItem.itemDstinCd]);
    $("#itemGrpCd").val(itemGroupCdMap[selectedItem.itemGrpCd]);
}
//selectPartsVenderMasterByKey Func
function selectPartsVenderMasterByKey(selectedItem){
    // bpCd
    sBpCd = selectedItem.bpCd;
}

//changedPrcTp Func
function changedPrcTp(bFlag){
    if($("#itemCd").val() != ""){
        // tabstrip enable or disable
        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
        $.each(tabStrip.contentElements, function(idx, obj){
            tabStrip.enable(tabStrip.tabGroup.children().eq(idx), bFlag);
        });

        if(bFlag){
            $("#partsPriceGrid").show();
            $("#partsSalPriceGrid").hide();
        }else{
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
    //button
    $("#btnSearch").kendoButton({
        click:function(e){
            selectPartsMasters();
        }
    });
    //tab
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;
        }
    });
    //sSpyrCd
    $("#sSpyrCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:spyrCdList
        ,optionLabel:" "
        ,index:0
    });
    //sItemDstinCd dropdownlist
    $("#sItemDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,optionLabel:" "
        ,index:0
    });
    // sItemDstinCd select index 2
    $("#sItemDstinCd").data("kendoExtDropDownList").select(2);
    // gridItem grid
    $("#gridItem").kendoExtGrid({
        dataSource:{
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

                        // 품목구분코드.
                        params["sDlrCd"] = "${dlrCd}";
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sSpyrCd"] = $("#sSpyrCd").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val() == "" ? "02":$("#sItemDstinCd").val(); // 구분없을 때 부품만 보이기 처리.

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
        ,height:290
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
                    //selectPartsMasterByKey Func
                    selectPartsMasterByKey(result);
                    //prcTp
                    $("#prcTp1").prop("checked", true);
                    $("#prcTp1").prop("disabled", false);
                    $("#prcTp2").prop("disabled", false);
                    //changedPrcTp Func
                    changedPrcTp(true);
                    //selectPartsVenderMasters Func
                    selectPartsVenderMasters();
                    //partsPriceGrid data clear
                    $("#partsPriceGrid").data("kendoExtGrid").dataSource.data([]);
                    //selectPartsVenderSalPriceMasters Func
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
        ,columns :
            [{field:"rnum",   title:"<spring:message code='par.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}        //rnum
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}                                                    //itemCd
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}                                                    //itemNm
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

                        params["sDlrCd"] = "${dlrCd}";
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
            var selectedItem = this.dataItem(this.select());
            if( selectedItem != null && selectedItem != 'undefined'){
                //selectPartsVenderMasterByKey Func
                selectPartsVenderMasterByKey(selectedItem);
                //selectPartsVenderPriceMasters Func
                selectPartsVenderPriceMasters();
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
    //targetOnGrid data init
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

                        params["sDlrCd"] = "${dlrCd}";
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
            ,{field:"" }
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

                        params["sDlrCd"] = "${dlrCd}";
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
                    id:"lineNo"
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
        ,editable:false
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
            // applyYn close Cell
            if(fieldName=="applyYn"){
                this.closeCell();
            }
        }
        ,pageable:false
        ,height:237
        ,selectable:"multiple,row"
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
                        ,dataSource:purcPrcTpList
                    });
                }
                ,template:'#if(prcTp !== ""){# #= purcPrcTpMap[prcTp]# #}#'
            }//prcTp
            ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:120,format:"{0:<dms:configValue code='dateFormat' />}" }    //startDt
            ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", width:120, format:"{0:<dms:configValue code='dateFormat' />}" }       //endDt
            ,{field:"applyYn", title:"<spring:message code='par.lbl.applyYn' />"
                ,width:100
                ,attributes:{"class":"ac" }
                ,template:'<input type="checkbox" class="aprv-chk" data-name="applyYn" #= applyYn=="Y"? checked="checked":"" # disabled="true" />'
            }//applyYn
            ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcPrc' />", width:150 , attributes:{"class":"ar"}, format:"{0:n2}"}   //purcPrc
            ,{field:"prcQty", title:"<spring:message code='par.lbl.prcQty' />", width:80 , attributes:{"class":"ar"}, format:"{0:n2}"}      //prcQty
            ,{field:"prcQtyUnitCd", title:"<spring:message code='par.lbl.unitNm' />"
                ,width:100
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"unitCdNm"
                        ,dataValueField:"unitCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:prcQtyUnitCdDs
                    });
                 }
                ,template:'#if(prcQtyUnitCd !== " " && prcQtyUnitCd !== null){# #= prcQtyUnitCdMap[prcQtyUnitCd]# #}#'
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

                        params["sDlrCd"] = "${dlrCd}";
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
        ,editable:false
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
            // applyYn close cell
            if(fieldName=="applyYn"){
                this.closeCell();
            }
        }
        ,pageable:false
        ,height:237
        ,selectable:"multiple,row"
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
                ,template:'#if(prcTp !== ""){# #= salePrcTpMap[prcTp]# #}#'
            }//prcTp
            ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:120, format:"{0:<dms:configValue code='dateFormat' />}" }       //startDt
            ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", width:120 , format:"{0:<dms:configValue code='dateFormat' />}"}           //endDt
            ,{field:"applyYn", title:"<spring:message code='par.lbl.applyYn' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" class="aprv-sal-chk" data-name="applyYn" #= applyYn=="Y"? checked="checked":"" # disabled="true" />'
            }//applyYn
            ,{ field:"salePrcAmt", title:"<spring:message code='par.lbl.salePrcAmt' />"
                ,width:150
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,spinners:false
                    });
                }
            }//salePrcAmt
            ,{ field:"prcQty", title:"<spring:message code='par.lbl.prcQty' />"
                ,width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,spinners:false
                    });
                }
            }//prcQty
            ,{ field:"prcQtyUnitCd", title:"<spring:message code='par.lbl.unitNm' />"
                ,width:100
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"unitCdNm"
                        ,dataValueField:"unitCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:prcQtyUnitCdDs
                    });
                 }
                ,template:'#if(prcQtyUnitCd !== " " && prcQtyUnitCd !== null){# #= prcQtyUnitCdMap[prcQtyUnitCd]# #}#'
            }//prcQtyUnitCd
        ]
    });

    //partsSalPriceGrid hide
    $("#partsSalPriceGrid").hide();
    //radio button disabled
    $("#prcTp1").prop("disabled", true);
    $("#prcTp2").prop("disabled", true);

});

</script>
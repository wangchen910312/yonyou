<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.partsPackageMng" /> --%><!-- partsPackageMng --></h1>
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                <button class="btn_m " id="packageReg"><spring:message code="global.btn.packageReg" /></button>
            </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col style="width:21%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.pkgItemGrp" /></th>
                    <td>
                        <input id="sItemDstinCd" name="sItemDstinCd" style="width:100%" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgItemCd" /></th>
                    <td>
                        <input id="sItemCd" name="sItemCd" class="form_input" style="width:100%">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgItemNm" /></th>
                    <td>
                        <input id="sItemNm" name="sItemNm" class="form_input" style="width:100%" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="itemGrid" class="grid"></div>
    </div>

    <div class="table_form form_width_70per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.pkgItemCd" /></th>
                    <td>
                        <input id="txtPkgItemCd" name="txtPkgItemCd" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgItemNm" /></th>
                    <td>
                        <input id="txtPkgItemNm" name="txtPkgItemNm" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.pkgDeltTot" /></th>
                    <td>
                        <input id="pkgDetlDcTot" name="pkgDetlDcTot" class="form_readonly" style="width:100%" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgDetlDcAmt" /></th>
                    <td>
                        <input id="pkgDetlDcAmt" name="pkgDetlDcAmt" class="form_readonly" style="width:100%" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgDeltDcTot" /></th>
                    <td>
                        <input id="pkgDetlDcPrc" name="pkgDetlDcPrc" class="form_readonly" style="width:100%" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.lbl.itemInfo" /></h2><!-- itemInfo -->
            <div class="btn_right">
                <button class="btn_s btn_add" id="parBtnAdd"><spring:message code="global.btn.itemPop" /></button>
                <button class="btn_s btn_add" id="parBtnDel"><spring:message code="global.btn.rowDel" /></button>
                <button class="btn_s btn_cancel" id="parBtnCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>
        <div class="table_grid">
            <div id="parGrid"></div>
        </div>
    </section>
</section>

<form id="packageForm">
    <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
    <input type="hidden" id="pkgItemNm" name="pkgItemNm" />
</form>
<!-- content -->

<script type="text/javascript">
var gVatCd = Number("${vatCd}");

//itemDstinCd Array
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//itemDstinCd Map
var itemDstinCdMap = dms.data.arrayToMap(itemDstinCdList, function(obj){ return obj.cmmCd; });
//useYn Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//useYnCd Map
var useYnCdMap = [];
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//partItemSearchWindow
var itemSalePrcPopupWindow;

//itemDstinCd Func
itemDstinCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = itemDstinCdMap[val].cmmCdNm;
    }
    return returnVal;
}
//parts price calculate Func
calPartAmt = function(e){

    var grid = $("#parGrid").data("kendoExtGrid");
    var gridData = grid.dataSource._data;

    var selectedVal = grid.dataItem(grid.select());
    // ROUND ( ROUND ( partsPrice * M/U * Qty  , 2) * TAX , 2)
    var itemQty  = Number(selectedVal.itemQty); //Qty
    var itemTax = ( 1 + gVatCd );
    var itemMarkup = ( 1 + gVatCd );
    var itemPrc = Number(selectedVal.itemPrc); //itemPrc
    var itemAmt = Number( ( (itemPrc * itemMarkup * itemQty).toFixed(2) * itemTax).toFixed(2)  );

    selectedVal.set("itemAmt",itemAmt);
};

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    gVatCd = .16;
}
console.log('gVatCd:',gVatCd);

$(document).ready(function() {

    $("#parBtnAdd").kendoButton({
        click:function(e){

            if($("#pkgItemCd").val()==""){
                dms.notification.warning("<spring:message code='par.lbl.pkgItemCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
                return;
            }

            itemSalePrcPopupWindow = dms.window.popup({
                windowId:"parSearchPopup"
                ,title:"<spring:message code='par.title.partSearch' />"//partSearch
                ,height:420
                ,content:{
                    url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                    , data:{
                        "autoBind":true
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(parData){

                            for(var i=0; i<parData.length; i++){
                                 var data = parData[i];

                                 var itemCheckCnt = 0;
                                 var grid = $("#parGrid").data("kendoExtGrid");
                                 grid.tbody.find('>tr').each(function(){
                                     var dataItem = grid.dataItem(this);
                                     if(dataItem.itemCd === data.itemCd){
                                         itemCheckCnt++;
                                     }

                                 });

                                 if(itemCheckCnt === 0){
                                     var copyData ={
                                         dlrCd:data.dlrCd
                                         ,pkgItemCd:$("#pkgItemCd").val()
                                         ,itemCd:data.itemCd
                                         ,itemNm:data.itemNm
                                         ,itemQty:1
                                         ,lineNo:$('#parGrid').data('kendoExtGrid').dataSource.data().length+1
                                         ,itemUnitCd:data.stockUnitCd
                                         ,itemPrc:data.salePrcAmt
                                         ,itemAmt:Number(  ( ( (1 * data.salePrcAmt * ( 1 + gVatCd )).toFixed(2) ) * ( 1 + gVatCd )  ).toFixed(2) )
                                         ,pkgDetlDcRate:0
                                         ,pkgDetlDcPrc:0
                                         ,pkgDetlDcAmt:0
                                         ,pkgDetlDcTot:0
                                         ,useYn:"Y"
                                     };
                                     $('#parGrid').data('kendoExtGrid').dataSource.insert(copyData);
                                 }
                            }
                        }
                    }
                }
            });
        }
    });
    //sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:itemDstinCdList
        ,index:4
    });
    //packageReg
    $("#packageReg").kendoButton({
        click:function(e) {
            window.open("<c:url value='/par/pmm/itemMaster/selectItemMasterMain.do'/>", "_blank");
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e) {
            var parGrid = $("#parGrid").data("kendoExtGrid");

            var formSaveData = $("#packageForm").serializeObject();
            var parGridData = parGrid.getCUDData("insertList", "updateList", "deleteList");

            var params =  $.extend(
                   {"packageMasterVO":formSaveData}
                   ,{"packageParVO":parGridData}
            );

            if (parGrid.cudDataLength == 0 ) {
                dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                return;
            }

            if (parGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/package/multiItemPackages.do' />",
                    data:JSON.stringify(params),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        parGrid.dataSource._destroyed = [];
                        parGrid.dataSource.read();
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
    //parBtnCancel
    $("#parBtnCancel").kendoButton({
      click:function(e) {
          $('#parGrid').data('kendoExtGrid').cancelChanges();
      }
    });
    //parBtnDel
    $("#parBtnDel").kendoButton({
        click:function (e){
            var grid = $("#parGrid").data("kendoExtGrid");
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
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(){
            $("#itemGrid").data("kendoExtGrid").dataSource.read();
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });
    //pkgDetlDcTot
    $("#pkgDetlDcTot").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,min:0
        ,value:" "
        ,spinners:false
    });
    $("#pkgDetlDcTot").data("kendoExtNumericTextBox").readonly();
    //pkgDetlDcAmt
    $("#pkgDetlDcAmt").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,min:0
        ,value:" "
        ,spinners:false
    });
    $("#pkgDetlDcAmt").data("kendoExtNumericTextBox").readonly();
    //pkgDetlDcPrc
    $("#pkgDetlDcPrc").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,min:0
        ,spinners:false
    });
    $("#pkgDetlDcPrc").data("kendoExtNumericTextBox").readonly();

    //itemGrid
    $("#itemGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPackage"] = "Y";
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,serverPaging:true
            ,schema:{
                 model:{
                    id:"itemCd"
                   ,fields:{
                        dlrCd :{ type:"string" , validation:{required:true} }
                       ,itemDstinCd:{ type:"string" , validation:{required:true} }
                       ,itemCd:{ type:"string" , validation:{required:true} }
                       ,itemNm:{ type:"string" , validation:{required:true} }
                    }
                }
            }
        }
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            if( selectedItem != null && selectedItem != 'undefined'){

                $("#pkgItemCd").val(selectedItem.itemCd);
                $("#pkgItemNm").val(selectedItem.itemNm);
                $("#txtPkgItemCd").val(selectedItem.itemCd);
                $("#txtPkgItemNm").val(selectedItem.itemNm);

                $("#parGrid").data("kendoExtGrid").dataSource.read();
            }

        }
        ,editable:false
        ,selectable:"row"
        ,sortable:false
        ,height:173 // row 5
        ,columns:[
            {field:"rnum",   title:"<spring:message code='par.lbl.rnum' />", width:30, sortable:false, attributes:{"class":"ac"}}//rnum
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrp' />", width:75, attributes:{"class":"ac"}
                ,template :"#= itemDstinCdGrid(itemDstinCd) #"}//itemDstinCd
            ,{field:"itemCd", title:"<spring:message code='par.lbl.pkgItemCd' />", width:100, attributes:{"class":"ac"}}//itemCd
            ,{field:"itemNm", title:"<spring:message code='par.lbl.pkgItemNm' />", width:140, attributes:{"class":"ac"}}//itemNm
        ]
    });
    //parGrid
    $("#parGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        var pkgItemCd = $("#pkgItemCd").val() == "" ? "X":$("#pkgItemCd").val();
                        params["sPkgItemCd"] = pkgItemCd;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum :{ type:"number" }
                        ,dlrCd :{ type:"string" }
                        ,lineNo:{ type:"number" }
                        ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                        ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                        ,pkgItemCd:{ type:"string"}
                        ,lineNo:{ type:"string"}
                        ,itemQty:{ type:"number"}
                        ,itemUnitCd:{ type:"string",editable:false}
                        ,itemPrc:{ type:"number",editable:true}
                        ,itemAmt:{ type:"number",editable:true}
                        ,pkgDetlDcRate:{ type:"number",editable:true}
                        ,pkgDetlDcPrc:{ type:"number",editable:true}
                        ,pkgDetlDcAmt:{ type:"number",editable:true}
                        ,pkgDetlDcTot:{ type:"number",editable:true}
                        ,useYn:{ type:"string",editable:true}
                    }
                }
            }
        }
        ,height:288 // row 10
        ,pageable:false
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
            if(fieldName=="itemAmt"){
                this.closeCell();
            }
            if(fieldName=="pkgDetlDcPrc"){
                this.closeCell();
            }
            if(fieldName=="pkgDetlDcAmt"){
                this.closeCell();
            }
            if(fieldName=="pkgDetlDcTot"){
                this.closeCell();
            }
        }
        ,dataBound:function(e){
            var vPkgDetlDcTot = 0;
            var vPkgDetlDcAmt = 0;
            var vPkgDetlDcPrc = 0;

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    vPkgDetlDcTot += kendo.parseFloat(dataItem.pkgDetlDcTot);
                    vPkgDetlDcAmt += kendo.parseFloat(dataItem.pkgDetlDcAmt);
                    vPkgDetlDcPrc += kendo.parseFloat(dataItem.pkgDetlDcPrc);
                }
            });

            $("#pkgDetlDcTot").data("kendoExtNumericTextBox").value(vPkgDetlDcTot);
            $("#pkgDetlDcAmt").data("kendoExtNumericTextBox").value(vPkgDetlDcAmt);
            $("#pkgDetlDcPrc").data("kendoExtNumericTextBox").value(vPkgDetlDcPrc);
        }
        ,columns:[
            {field:"lineNo", title:"<spring:message code='par.lbl.rnum' />", width:30, attributes:{"class":"ac"}}//lineNo
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}//itemCd
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:120}//itemNm
            ,{field:"itemQty", title:"<spring:message code='par.lbl.qty' />", width:40, attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"
                        ,decimals:0
                        ,min:1
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#parGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vItemQty = this.value();
                            var vItemPrc = model.get("itemPrc");
                            var vPkgDetlDcRate = model.get("pkgDetlDcRate");
                            var vItemQtyPrc = vItemQty * vItemPrc;
                            var vPkgDetlDcAmt = vItemQtyPrc * (vPkgDetlDcRate / 100);
                            var vPkgDetlDcPrc = vItemQtyPrc - vPkgDetlDcAmt;
                            model.set("pkgDetlDcPrc", vPkgDetlDcPrc);
                            model.set("pkgDetlDcAmt",vPkgDetlDcAmt);
                            model.set("pkgDetlDcTot", vItemQtyPrc);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                 }
            }//itemQty
            ,{field:"itemUnitCd", title:"<spring:message code='par.lbl.unitCd' />", width:50}//itemUnitCd
            ,{field:"itemPrc", title:"<spring:message code='par.lbl.unitPrice' />"
                ,width:80
                ,attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input required name="itemPrc" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                        ,decimals:2
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#parGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vItemQty = model.get("itemQty");
                            var vItemPrc = this.value();
                            var vPkgDetlDcRate = model.get("pkgDetlDcRate");
                            var vItemQtyPrc = vItemQty * vItemPrc;
                            var vPkgDetlDcAmt = vItemQtyPrc * (vPkgDetlDcRate / 100);
                            var vPkgDetlDcPrc = vItemQtyPrc - vPkgDetlDcAmt;
                            model.set("pkgDetlDcPrc", vPkgDetlDcPrc);
                            model.set("pkgDetlDcAmt",vPkgDetlDcAmt);
                            model.set("pkgDetlDcTot", vItemQtyPrc);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="itemPrc"></span>').appendTo(container);
                 }
            }//itemPrc
            ,{field:"pkgDetlDcRate", title:"<spring:message code='par.lbl.pkgDetlDcRate' />", attributes:{"class":"ar"}, width:50
                ,editor:function(container, options){
                    $('<input required name="pkgDetlDcRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"##.## \\%"
                        ,decimals:2
                        ,min:0
                        ,max:100
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#parGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vItemQty = model.get("itemQty");
                            var vItemPrc = model.get("itemPrc");
                            var vPkgDetlDcRate = this.value();
                            var vItemQtyPrc = vItemQty * vItemPrc;
                            var vPkgDetlDcAmt = vItemQtyPrc * (vPkgDetlDcRate / 100);
                            var vPkgDetlDcPrc = vItemQtyPrc - vPkgDetlDcAmt;
                            model.set("pkgDetlDcPrc", vPkgDetlDcPrc);
                            model.set("pkgDetlDcAmt", vPkgDetlDcAmt);
                            model.set("pkgDetlDcTot", vItemQtyPrc);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="pkgDetlDcRate"></span>').appendTo(container);
                 }
            }//pkgDetlDcRate
            ,{field:"pkgDetlDcPrc", title:"<spring:message code='par.lbl.pkgDetlDcPrc' />", width:80, format:"{0:n2}", attributes:{"class":"ar"}}//pkgDetlDcPrc
            ,{field:"pkgDetlDcAmt", title:"<spring:message code='par.lbl.pkgDetlDcAmt' />", width:80, format:"{0:n2}", attributes:{"class":"ar"}}//pkgDetlDcAmt
            ,{field:"pkgDetlDcTot", title:"<spring:message code='par.lbl.pkgDetlDcTot' />", width:80, format:"{0:n2}", attributes:{"class":"ar"}}//pkgDetlDcTot
            ,{field:"useYn", title:"<spring:message code='par.lbl.useYn' />"
                ,width:50
                ,attributes:{"class":"ac"}
                ,editor:function(container, options){
                    $('<input id="useYn" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:useYnCdList
                    });
                }
                ,template:'#if(useYn !== "" && useYn !== null){# #= useYnCdMap[useYn]# #}#'
            }//useYn
        ]
    });
});

</script>

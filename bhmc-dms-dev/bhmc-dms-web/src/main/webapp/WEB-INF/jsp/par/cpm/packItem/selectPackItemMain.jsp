<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">
<!-- content -->
<section class="group">
    <div class="header_area">
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11494" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
		<dms:access viewId="VIEW-D-11493" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.packageCd" /></th>
                    <td>
                        <input id="sPkgItemCd" name="sItemCd" class="form_input" maxlength="18" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.packageTp" /></th>
                    <td>
                        <input id="sItemDstinCd" name="sItemDstinCd" style="width:100%" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /></th>
                    <td>
                        <input id="sItemCd" name="sItemCd" class="form_input" maxlength="18" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                    <td>
                        <input id="sBrandCd" name="sBrandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" />
                        <input type="hidden" id="selectItemCd" name="selectItemCd" />
                    </td>
                </tr>
                <tr>

                    <th scope="row"><spring:message code="ser.lbl.packageNm" /></th>
                    <td>
                        <input id="sPkgItemNm" name="sItemNm" class="form_input" maxlength="40"  />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgPartCost" /></th>
                    <td>
                        <input id="sPkgDcTotAmt" data-type="number" min="0" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /></th>
                    <td>
                        <input id="sItemNm" name="sItemNm" class="form_input" maxlength="40"  />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /></th>
                    <td>
                        <input id="sLtsModelCd" data-type="combo" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        <button type="button" id="packageNewReg" name="packageNewReg" class="btn_s btn_s_min5"><spring:message code="par.btn.packageNewReg" /></button>
        <dms:access viewId="VIEW-D-11492" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="packageReg" name="packageReg" class="btn_s btn_s_min5"><spring:message code="global.btn.packageModify" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11491" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnDelItem" name="btnDelItem" class="btn_s btn_s_min5"><spring:message code="par.btn.del" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11490" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave" name="btnSave" class="btn_s btn_s_min5"><spring:message code="global.btn.save" /></button>
        </dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <div class="table_grid">
        <div id="itemGrid" class="grid"></div>
    </div>

    <div class="table_form form_width_70per mt10 hidden">
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
                    <th scope="row"><spring:message code="ser.lbl.packageCd" /></th>
                    <td>
                        <input id="txtPkgItemCd" name="txtPkgItemCd" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.packageNm" /></th>
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
                        <input id="pkgDetlTotAmt" name="pkgDetlTotAmt" class="form_readonly" style="width:100%" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgDetlDcAmt" /></th>
                    <td>
                        <input id="pkgDetlDcAmt" name="pkgDetlDcAmt" class="form_readonly" style="width:100%" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.pkgDeltDcTot" /></th>
                    <td>
                        <input id="pkgDetlDcTotAmt" name="pkgDetlDcTotAmt" class="form_readonly" style="width:100%" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.lbl.itemInfo" /></h2><!-- itemInfo -->
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11489" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="parBtnAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11488" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="parBtnDel" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.del" /></button>
            </dms:access>
            </div>
        </div>
        <div class="table_grid">
            <div id="parGrid" class="resizable_grid"></div>
        </div>
    </section>
</section>

</div>

<form id="packageForm">
    <input type="hidden" id="spyrCd" name="spyrCd" />
    <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
    <input type="hidden" id="pkgItemNm" name="pkgItemNm" />
    <input type="hidden" id="pkgDocNo" name="pkgDocNo" />
    <input type="hidden" id="ltsModelCd" name="ltsModelCd" />
    <input type="hidden" id="pkgUpdtDtStr" name="pkgUpdtDtStr" />
    <input type="hidden" id="pkgTp" name="pkgTp" value="02" />
</form>
<!-- content -->

<script type="text/javascript">
//itemDstinCd Array
var selectedLtsModelCd,
    gVatCd = Number("${vatCd}"),
    itemDstinCdList     = [],
    itemDstinCdObj      = {},
    brandCdList         = [],
    brandCdObj          = {},
    modelCdList         = [],
    modelCdObj          = {};

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    gVatCd = .16;
}
console.log('gVatCd:',gVatCd);

<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//useYn Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//useYnCd Map
var useYnCdMap = {};
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//brandCdList
brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${brandCdList}" varStatus="status">
    if("${obj.useYn}" !== 'N'){
        brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//LTS MODEL 코드
var ltsModelCdList =[],
    ltsModelCdObj ={};
<c:forEach var="obj" items="${ltsModelDs}">
    ltsModelCdList.push({cmmCdNm:"${obj.ltsModelNm}", cmmCd:"${obj.ltsModelCd}"});
    ltsModelCdObj["${obj.ltsModelCd}"] = "${obj.ltsModelNm}";
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

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

//selected package item
var pkgSelectedItem = null;

function pageInit(){

    $("#sPkgItemCd").val("");
    $("#sItemDstinCd").data("kendoExtDropDownList").value("04");
    $("#sItemCd").val("");
    $("#sBrandCd").data("kendoExtDropDownList").value("");
    $("#selectItemCd").val("");
    $("#sPkgItemNm").val("");

    $("#sPkgDcTotAmt").data("kendoExtNumericTextBox").value("");
    $("#sItemNm").val("");
    $("#sLtsModelCd").data("kendoExtDropDownList").value("");

    $("#itemGrid").data("kendoExtGrid").dataSource.data([]);
    $('#parGrid').data('kendoExtGrid').dataSource.data([]);

    $("#packageReg").data("kendoButton").enable(false);

    pkgSelectedItem = null;
}

//부품 팝업 열기 함수.
function selectPartsPackageRegPopupWindow(pPkgItem){

    partsPackageRegPopupWindow = dms.window.popup({
        windowId:"PackageRegPopup"
        ,width:550
        ,height:350
        ,modal:true
        ,title:"<spring:message code='ser.lbl.pakageReg' />"//package insert
        ,content:{
            url:"<c:url value='/par/cmm/selectPartsPackageRegPopup.do'/>"
            ,data:{
                "type":""
                ,"autoBind":true
                ,"itemDstinCd":'04'//package type code
                ,"pkgSelectedItem":pPkgItem
                ,"selectable":"multiple"
                ,"pkgTp":"02"
                ,"callbackFunc":function(data){

                    $("#itemGrid").data("kendoExtGrid").dataSource.read();

                    partsPackageRegPopupWindow.close();
                }
            }
        }
    });
}

$(document).ready(function() {

    $("#parBtnAdd").kendoButton({
        click:function(e){

            if($("#pkgItemCd").val()==""){
                dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
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

                                     var sRnum = grid.dataSource.total();

                                     var copyData ={
                                         dlrCd:data.dlrCd
                                         ,rnum : sRnum + 1
                                         ,pkgItemCd:$("#pkgItemCd").val()
                                         ,itemCd:data.itemCd
                                         ,itemNm:data.itemNm
                                         ,strgeCd:data.giStrgeCd//출고창고
                                         ,itemQty:1
                                         ,lineNo:$('#parGrid').data('kendoExtGrid').dataSource.data().length+1
                                         ,itemUnitCd:data.stockUnitCd
                                         ,itemPrc:data.salePrcAmt
                                         ,itemAmt:Number(  ( ( (1 * data.salePrcAmt * ( 1 + gVatCd )).toFixed(2) ) * ( 1 + gVatCd )  ).toFixed(2) )
                                         ,pkgDetlDcRate:0
                                         ,pkgDetlDcTotAmt:0
                                         ,pkgDetlDcAmt:0
                                         ,pkgDetlTotAmt:data.salePrcAmt
                                         ,useYn:"Y"
                                         ,spyrCd:"02"
                                     };
                                     $('#parGrid').data('kendoExtGrid').dataSource.add(copyData);
                                 }
                            }
                        }
                    }
                }
            });
        }
    });
    //패키지품비용
    $("#sPkgDcTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
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
    //브랜드:검색
    $("#sBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandCdList
        ,index:0
    });

   //packageNewReg
    $("#packageNewReg").kendoButton({
        click:function(e) {
            selectPartsPackageRegPopupWindow('');
        }
    });

    //packageReg
    $("#packageReg").kendoButton({
        click:function(e) {
            if(dms.string.isEmpty(pkgSelectedItem)){
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }
            selectPartsPackageRegPopupWindow(pkgSelectedItem);
        }
    });
    //조회조건 - LTS MODEL CD
    $("#sLtsModelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ltsModelCdList
        ,template:"[#:cmmCd#]#:cmmCdNm#"
        ,valueTemplate:"[#:cmmCd#]#:cmmCdNm#"
        ,optionLabel:" "
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e) {
            var parGrid = $("#parGrid").data("kendoExtGrid");

            var formSaveData = $("#packageForm").serializeObject();
            var parGridData = parGrid.getCUDData("insertList", "updateList", "deleteList");

            if (parGrid.cudDataLength == 0 ) {
                dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                return;
            }

            formSaveData.pkgDocNo = $("#pkgDocNo").val();

            var params =  $.extend(
                {"packageMasterVO":formSaveData}
                ,{"packageParVO":parGridData}
            );

            if (parGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/package/multiItemPartsPackages.do' />",
                    data:JSON.stringify(params),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        parGrid.dataSource._destroyed = [];
                        selectedLtsModelCd = parGrid.dataSource._data[0].ltsModelCd;
                        $("#itemGrid").data("kendoExtGrid").dataSource.read();
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
    //btnDelItem
    $("#btnDelItem").kendoButton({
        click:function(e) {

            if($("#selectItemCd").val() !== ""){
                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();
                        //db Deleting.
                        $.ajax({
                            url:"<c:url value='/par/pmm/itemMaster/deleteItemMaster.do' />",
                            data:JSON.stringify({"itemCd": $("#selectItemCd").val(), "spyrCd":$("#spyrCd").val(), updtDtStr:$("#pkgUpdtDtStr").val()}),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {

                                dms.notification.success("<spring:message code='global.info.success'/>");
                                $("#itemGrid").data("kendoExtGrid").dataSource.read();
                                $("#parGrid").data('kendoExtGrid').dataSource.data([]);
                            }
                        });
                    }
                    conformKendoWindow.close();
                }).end();

            }else{
                //delete item check message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //parBtnDel
    $("#parBtnDel").kendoButton({
        click:function (e){
            var grid = $("#parGrid").data("kendoExtGrid");
            var rows = grid.select();
            var rowCnt = rows.length;

            if(rowCnt > 0){

                //delete Popup call.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();
                        //Deleting.
                        rows.each(function(index, row) {
                            grid.removeRow(row);
                        });
                    }
                    conformKendoWindow.close();
                }).end();
            }
            else{
              // delete item check message
              dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //btnInit
    $("#btnInit").kendoButton({
        click:function(){
            //func pageInit
            pageInit();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(){
            $("#itemGrid").data("kendoExtGrid").dataSource.read();
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });
    //pkgDetlTotAmt
    $("#pkgDetlTotAmt").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,min:0
        ,value:" "
        ,spinners:false
    });
    $("#pkgDetlTotAmt").data("kendoExtNumericTextBox").readonly();
    //pkgDetlDcAmt
    $("#pkgDetlDcAmt").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,min:0
        ,value:" "
        ,spinners:false
    });
    $("#pkgDetlDcAmt").data("kendoExtNumericTextBox").readonly();
    //pkgDetlDcTotAmt
    $("#pkgDetlDcTotAmt").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,min:0
        ,spinners:false
    });
    $("#pkgDetlDcTotAmt").data("kendoExtNumericTextBox").readonly();

    //itemGrid
    $("#itemGrid").kendoExtGrid({
        gridId:"G-PAR-0519-173101"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackageParSummary.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPkgItemCd"] = $("#sPkgItemCd").val();
                        params["sPkgItemNm"] = $("#sPkgItemNm").val();
                        params["sPkgDcTotAmt"] = $("#sPkgDcTotAmt").data("kendoExtNumericTextBox").value();
                        params["sBrandCd"] = $("#sBrandCd").data("kendoExtDropDownList").value();
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();
                        params["sLtsModelCd"] = $("#sLtsModelCd").data("kendoExtDropDownList").value();
                        params["sPkgTp"] = "02";

                        return kendo.stringify(params);
                    }
                }
            }
            ,serverPaging:true
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        dlrCd:{type:"string" ,validation:{required:true}}
                        ,itemCd:{type:"string" ,validation:{required:true}}
                        ,itemNm:{type:"string" ,validation:{required:true}}
                        ,strgeCd:{type:"string" ,validation:{required:true}}
                        ,itemDstinCd:{type:"string" ,validation:{required:true}}
                        ,brandCd:{type:"string" ,validation:{required:true}}
                        ,ltsModelCd:{type:"string" ,validation:{required:true}}
                        ,ltsModelNm:{type:"string" ,validation:{required:true}}
                        ,pkgTotAmt:{type:"number" ,validation:{required:true}}
                        ,pkgDcAmt:{type:"number" ,validation:{required:true}}
                        ,pkgDcTotAmt:{type:"number",validation:{required:true}}
                        ,pkgStartDt:{type:"date" ,validation:{required:true}}
                        ,pkgEndDt:{type:"date" ,validation:{required:true}}
                        ,regDt:{type:"date" ,validation:{required:true}}
                        ,pkgUpdtDtStr:{ type:"string" }
                        ,updtDtStr:{ type:"string" }
                    }
                }
            }
        }
        ,change:function(e){

            var selectedItem = this.dataItem(this.select());

            if( selectedItem != null && selectedItem != 'undefined'){

                pkgSelectedItem = selectedItem;

                var ltsModelCd = selectedItem.ltsModelCd;
                if(ltsModelCd == "" || ltsModelCd == null){
                    ltsModelCd = "-";
                }

                $("#pkgItemCd").val(selectedItem.itemCd);
                $("#pkgItemNm").val(selectedItem.itemNm);
                $("#ltsModelCd").val(ltsModelCd);
                $("#pkgDocNo").val(selectedItem.pkgDocNo);
                $("#txtPkgItemCd").val(selectedItem.itemCd);
                $("#txtPkgItemNm").val(selectedItem.itemNm);
                $("#selectItemCd").val(selectedItem.itemCd);
                $("#pkgUpdtDtStr").val(selectedItem.pkgUpdtDtStr);
                selectedLtsModelCd = selectedItem.ltsModelCd;
                $("#spyrCd").val(selectedItem.spyrCd);

                $("#parGrid").data("kendoExtGrid").dataSource.read();

                $("#packageReg").data("kendoButton").enable(true);
            }

        }
        ,editable:false
        ,sortable:true
        ,filterable:false
        ,autoBind:false
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,height:173//row 5
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                }
            });
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.rnum' />", width:30, sortable:false, attributes:{"class":"ac"}}//rnum
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:140, attributes:{"class":"al"}}//itemCd
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:200, attributes:{"class":"al"}}//itemNm
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.packageTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template  :'#= changeItemDstinCd(itemDstinCd)#'}//itemDstinCd
            ,{field:"brandCd", title:"<spring:message code='ser.lbl.brandNm' />" ,width:140, attributes:{"class":"al"}
                ,template  :'#= changeBrandCd(brandCd)#'
            }//brandCd
            ,{field:"ltsModelNm", title:"<spring:message code='par.lbl.carLine' />", width:140, attributes:{"class":"al"}}//ltsModelNm
            ,{field:"pkgDcTotAmt", title:"<spring:message code='par.lbl.pkgPartCost' />", width:100, attributes:{"class":"ar"},format:"{0:n2}"}//pkgDcTotAmt
            ,{field:"pkgStartDt", title:"<spring:message code='par.lbl.startDttm' />" ,width:150 ,format:"{0:<dms:configValue code='dateFormat' />}"}//pkgStartDt
            ,{field:"pkgEndDt", title:"<spring:message code='par.lbl.endDttm' />" ,width:150 ,format:"{0:<dms:configValue code='dateFormat' />}"}//pkgEndDt
        ]
    });

    //품목구분 콤보
    changeItemDstinCd = function(val){

        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemDstinCdObj[val];
        }
        return returnVal;
    };

    //모델구분 콤보
    changeLtsModelCd = function(val){

        var returnVal = "";
        if(val != null && val != ""){
            returnVal = ltsModelCdObj[val];
        }
        return returnVal;
    };

    //changeBrandCd Func
    changeBrandCd = function(val){

        var returnVal = "";
        if(val != null && val != ""){
            returnVal = brandCdObj[val];
        }
        return returnVal;
    };

    //parGrid
    $("#parGrid").kendoExtGrid({
        gridId:"G-PAR-0519-173202"
        ,dataSource:{
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
                        params["sPkgItemCd"]  = pkgItemCd;
                        params["sLtsModelCd"] = selectedLtsModelCd;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"pkgDocNo"
                    ,fields:{
                        rnum :{ type:"number" ,editable:false}
                        ,lineNo:{ type:"number" ,editable:false}
                        ,dlrCd :{ type:"string" }
                        ,pkgDocNo:{ type:"string"}
                        ,pkgItemCd:{ type:"string"}
                        ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                        ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                        ,itemUnitCd:{ type:"string" ,editable:false}
                        ,itemQty:{ type:"number"}
                        ,itemPrc:{ type:"number" ,editable:true}
                        ,itemAmt:{ type:"number" ,editable:true}
                        ,pkgDetlDcRate:{ type:"number" ,editable:true}
                        ,pkgDetlDcTotAmt:{ type:"number" ,editable:true}
                        ,pkgDetlDcAmt:{ type:"number" ,editable:true}
                        ,pkgDetlTotAmt:{ type:"number" ,editable:true}
                        ,useYn:{ type:"string" ,editable:true}
                        ,spyrCd:{ type:"string" ,editable:false}
                    }
                }
            }
        }
        ,height:265 // row 9
        ,pageable:false
        ,filterable:false
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
            if(fieldName=="itemAmt" || fieldName=="pkgDetlDcTotAmt" || fieldName=="pkgDetlTotAmt"){
                this.closeCell();
            }
        }
        ,dataBound:function(e){
            var vPkgDetlTotAmt = 0;
            var vPkgDetlDcAmt = 0;
            var vPkgDetlDcTotAmt = 0;

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                    vPkgDetlTotAmt += kendo.parseFloat(dataItem.pkgDetlTotAmt);
                    vPkgDetlDcAmt += kendo.parseFloat(dataItem.pkgDetlDcAmt);
                    vPkgDetlDcTotAmt += kendo.parseFloat(dataItem.pkgDetlDcTotAmt);
                }
            });

            $("#pkgDetlTotAmt").data("kendoExtNumericTextBox").value(vPkgDetlTotAmt);
            $("#pkgDetlDcAmt").data("kendoExtNumericTextBox").value(vPkgDetlDcAmt);
            $("#pkgDetlDcTotAmt").data("kendoExtNumericTextBox").value(vPkgDetlDcTotAmt);
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.rnum' />", width:30, attributes:{"class":"ac"}}//lineNo
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}//itemCd
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:150}//itemNm
            ,{field:"itemUnitCd", title:"<spring:message code='par.lbl.unitNm' />", width:70}//itemUnitCd
            ,{field:"itemQty", title:"<spring:message code='par.lbl.itemQty' />", width:70
                ,attributes:{"class":"ar bg_white"}
                ,editor:function(container, options){
                    $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                        ,decimals:2
                        ,min:0
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#parGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vItemQty = this.value();
                            var vItemPrc = model.get("itemPrc");
                            var vPkgDetlDcRate = model.get("pkgDetlDcRate");

                            var vPkgDetlTotAmt   =  vItemQty * vItemPrc;
                            var vPkgDetlDcAmt    = (vPkgDetlTotAmt * (vPkgDetlDcRate / 100));
                            var vPkgDetlDcTotAmt =  vPkgDetlTotAmt - vPkgDetlDcAmt;

                            model.set("pkgDetlTotAmt", vPkgDetlTotAmt);
                            model.set("pkgDetlDcAmt",vPkgDetlDcAmt);
                            model.set("pkgDetlDcTotAmt", vPkgDetlDcTotAmt);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                 }
            }//itemQty
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />"
                ,width:80
                ,attributes:{"class":"ar bg_white"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input required name="itemPrc" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         format:"{0:n2}"
                        ,decimals:2
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#parGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vItemQty = model.get("itemQty");
                            var vItemPrc = this.value();
                            var vPkgDetlDcRate = model.get("pkgDetlDcRate");

                            var vPkgDetlTotAmt   =  vItemQty * vItemPrc;
                            var vPkgDetlDcAmt    = (vPkgDetlTotAmt * (vPkgDetlDcRate / 100));
                            var vPkgDetlDcTotAmt =  vPkgDetlTotAmt - vPkgDetlDcAmt;


                            model.set("pkgDetlTotAmt", vPkgDetlTotAmt);
                            model.set("pkgDetlDcAmt",vPkgDetlDcAmt);
                            model.set("pkgDetlDcTotAmt", vPkgDetlDcTotAmt);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="itemPrc"></span>').appendTo(container);
                 }
            }//itemPrc
            ,{field:"pkgDetlTotAmt", title:"<spring:message code='par.lbl.partCost' />", width:80, format:"{0:n2}", attributes:{"class":"ar"}}//pkgDetlTotAmt
        ]
    });

    $("#packageReg").data("kendoButton").enable(false);
});

</script>

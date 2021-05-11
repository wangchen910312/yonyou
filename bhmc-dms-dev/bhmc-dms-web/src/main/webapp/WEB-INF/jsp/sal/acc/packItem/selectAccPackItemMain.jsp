<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- content -->
<section class="group">
    <div class="header_area">
        <div class="btn_left">
            <dms:access viewId="VIEW-D-12852" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
            </dms:access>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12851" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <th scope="row"><spring:message code="sal.lbl.accItemCd" /></th>
                    <td>
                        <input id="sItemCd" name="sItemCd" class="form_input" maxlength="18" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.accBrand" /><!-- 브랜드 --></th>
                    <td>
                        <input id="sBrandCd" name="sBrandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" />
                        <input type="hidden" id="selectItemCd" name="selectItemCd" />
                    </td>
                </tr>
                <tr>

                    <th scope="row"><spring:message code="ser.lbl.packageNm" /></th>
                    <td>
                        <input id="sPkgItemNm" name="sItemNm" class="form_input" maxlength="40"  />
                        <input id="sPkgDcTotAmt" data-type="number" min="0" class="form_numeric ar hidden" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsNm" /></th>
                    <td>
                        <input id="sItemNm" name="sItemNm" class="form_input" maxlength="40"  />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /></th>
                    <td>
                        <input id="sLtsModelCd" data-type="combo" class="form_comboBox" />
                    </td>
                    <th/>
                    <td/>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="packageNewReg" name="packageNewReg" class="btn_s btn_s_min5"><spring:message code="par.btn.packageNewReg" /></button>
            <dms:access viewId="VIEW-D-12850" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="packageReg" name="packageReg" class="btn_s btn_s_min5"><spring:message code="global.btn.packageModify" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12849" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnDelItem" name="btnDelItem" class="btn_s btn_s_min5"><spring:message code="par.btn.del" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12848" hasPermission="${dms:getPermissionMask('READ')}">
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
                <dms:access viewId="VIEW-D-12847" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="parBtnAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12846" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="parBtnDel" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.del" /></button>
                </dms:access>
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
    <input type="hidden" id="pkgDocNo" name="pkgDocNo" />
    <input type="hidden" id="ltsModelCd" name="ltsModelCd" />
    <input type="hidden" id="pkgUpdtDtStr" name="pkgUpdtDtStr" />
</form>
<!-- content -->

<script type="text/javascript">
//세율 (0.16)
var vatCode = "${vatCd}";
var vatCd = dms.string.isEmpty(vatCode)?0.16:Number(vatCode);
vatCd = vatCd + 1;

//itemDstinCd Array
var selectedLtsModelCd,
    itemDstinCdList     = [],
    itemDstinCdObj      = {},
    brandCdList         = [],
    brandCdObj          = {},
    modelCdList         = [],
    modelCdObj          = {};


var gridRow = 0;
var selPkgItemCd;

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
var useYnCdMap = [];
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
    var itemTax = vatCd;
    var itemMarkup = vatCd;
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

    pkgSelectedItem = null;
    $("#packageReg").data("kendoButton").enable(false);
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
                ,"pkgTp":"03"
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

            dms.window.popup({
                windowId:"accessoryItemInputSearchPopup"
                ,title:"<spring:message code='sal.title.goodsSearch' />"   //용품조회
                ,content:{
                    url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputSearchPopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"bpCd":''
                        ,"bpNm":''
                        ,"bpTp":''
                        ,"sBmpYn":'Y'
                        ,"itemDstinCd":"20" //품목구분(판매용품)
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(data){
                            var grid = $("#parGrid").data("kendoExtGrid");
                            var isExistItemCd = false;
                            //선택된 품목을 그리드에 추가한다.
                            $.each(data, function(idx, item){

                                //품목 중복 체크
                                /* isExistItemCd = grid.exists(function(dataItem){
                                    if(dataItem.itemCd == item.itemCd){
                                        return true;
                                    }
                                    return false;
                                });
                                 */

                                 $.each(grid.dataSource._data, function(idx, gridItem){

                                     if(gridItem.itemCd == item.itemCd && gridItem.grStrgeCd  == item.grStrgeCd){
                                         dms.notification.warning(item.itemCd + "["+ item.itemNm +"]<spring:message code='sal.info.alreadyRegistedParts' />");   //은 이미 등록되어 있는 부품입니다.
                                         return;
                                     }
                                 });

                                 var sRnum = grid.dataSource.total();

                                 var invcPrc = 0;
                                 if(item.lastGrAmt !== 0){
                                     invcPrc = item.lastGrAmt;
                                 }else{
                                     invcPrc = item.salePrcAmt;
                                 }

                                 var copyData ={
                                     dlrCd:data.dlrCd
                                     ,rnum : sRnum + 1
                                     ,pkgItemCd:$("#pkgItemCd").val()
                                     //,pkgDocNo:$("#pkgDocNo").val()
                                     ,itemCd:item.itemCd
                                     ,itemNm:item.itemNm
                                     ,itemQty:1
                                     ,lineNo:$('#parGrid').data('kendoExtGrid').dataSource.data().length+1
                                     ,itemUnitCd:item.stockUnitCd
                                     ,itemPrc:invcPrc
                                     ,itemAmt:Number((1 * invcPrc * vatCd).toFixed(2))
                                     ,pkgDetlDcRate:0
                                     ,pkgDetlDcTotAmt:0
                                     ,pkgDetlDcAmt:0
                                     //,pkgDetlTotAmt:0
                                     ,pkgDetlTotAmt:invcPrc
                                     ,useYn:"Y"
                                     ,strgeCd:item.grStrgeCd
                                     ,strgeNm:item.strgeNm
                                 };
                                 $('#parGrid').data('kendoExtGrid').dataSource.add(copyData);

/*
                                if(isExistItemCd){
                                    dms.notification.warning(item.itemCd + "["+ item.itemNm +"]<spring:message code='sal.info.alreadyRegistedParts' />");   //은 이미 등록되어 있는 부품입니다.
                                }else{
                                    var sRnum = grid.dataSource.total();

                                    var invcPrc = 0;
                                    if(item.lastGrAmt !== 0){
                                        invcPrc = item.lastGrAmt;
                                    }else{
                                        invcPrc = item.salePrcAmt;
                                    }

                                    var copyData ={
                                        dlrCd:data.dlrCd
                                        ,rnum : sRnum + 1
                                        ,pkgItemCd:$("#pkgItemCd").val()
                                        //,pkgDocNo:$("#pkgDocNo").val()
                                        ,itemCd:item.itemCd
                                        ,itemNm:item.itemNm
                                        ,itemQty:1
                                        ,lineNo:$('#parGrid').data('kendoExtGrid').dataSource.data().length+1
                                        ,itemUnitCd:item.stockUnitCd
                                        ,itemPrc:invcPrc
                                        ,itemAmt:Number((1 * invcPrc * vatCd).toFixed(2))
                                        ,pkgDetlDcRate:0
                                        ,pkgDetlDcTotAmt:0
                                        ,pkgDetlDcAmt:0
                                        //,pkgDetlTotAmt:0
                                        ,pkgDetlTotAmt:invcPrc
                                        ,useYn:"Y"
                                    };
                                    $('#parGrid').data('kendoExtGrid').dataSource.add(copyData);
                                } */
                            });

                            //팝업 닫기
                            $("#accessoryItemInputSearchPopup").data("kendoWindow").close();
                        }
                    }
                }
            });
        }
    });
    //패키지품비용
    $("#sPkgDcTotAmt").kendoExtNumericTextBox({
        format:"n0"
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
            var grid = $("#itemGrid").data("kendoExtGrid");

            var formSaveData = $("#packageForm").serializeObject();
            var parGridData = parGrid.getCUDData("insertList", "updateList", "deleteList", ["strgeNm"]);

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

                        selPkgItemCd = "";
                        gridRow = 0;
                        var selectedVal = grid.dataItem(grid.select());
                        if(selectedVal != null){
                            gridRow = grid.select().index();
                            selPkgItemCd = selectedVal.pkgItemCd;
                        }

                        grid.dataSource.page(1);
                        //$("#itemGrid").data("kendoExtGrid").dataSource.read();
                        //parGrid.dataSource.read();
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
                            data:JSON.stringify({"itemCd": $("#selectItemCd").val()}),
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
        gridId:"G-PAR-0519-185701"
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
                        params["sPkgTp"] = "03";

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
                $("#parGrid").data("kendoExtGrid").dataSource.read();

                $("#packageReg").data("kendoButton").enable(true);
            }

        }
        ,dataBound: function(e) {
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(selPkgItemCd  == selectedVal.pkgItemCd){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }
        }
        ,editable:false
        ,sortable:true
        ,filterable:false
        ,autoBind:false
        ,selectable:"single row"
        ,appendEmptyColumn:true//empty column. default:false
        ,height:173//row 5
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.rnum' />", width:30, sortable:false, attributes:{"class":"ac"}}//rnum
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:140, attributes:{"class":"al"}}//itemCd
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:200, attributes:{"class":"al"}}//itemNm
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.packageTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template  :'#= changeItemDstinCd(itemDstinCd)#'}//itemDstinCd
            ,{field:"brandCd", title:"<spring:message code='ser.lbl.brandNm' />"
                ,template  :'#= changeBrandCd(brandCd)#'
                ,width:140, attributes:{"class":"al"}}//brandCd
            ,{field:"ltsModelCd", title:"<spring:message code='par.lbl.carLine' />", width:140, attributes:{"class":"al"}, hidden:true}//ltsModelCd
            ,{field:"ltsModelNm", title:"<spring:message code='par.lbl.carLine' />", width:140, attributes:{"class":"al"}}//ltsModelNm
            ,{field:"pkgTotAmt", title:"<spring:message code='par.lbl.pkgDeltTot' />", width:100, attributes:{"class":"ar"},format:"{0:n2}", hidden:true}
            ,{field:"pkgDcAmt", title:"<spring:message code='par.lbl.pkgDetlDcAmt' />", width:100, attributes:{"class":"ar"},format:"{0:n2}", hidden:true}
            ,{field:"pkgDcTotAmt", title:"<spring:message code='par.lbl.pkgPartCost' />", width:100, attributes:{"class":"ar"},format:"{0:n2}"}//pkgDcTotAmt
            ,{field:"pkgStartDt", title:"<spring:message code='par.lbl.startDttm' />" ,width:150 ,format:"{0:<dms:configValue code='dateFormat' />}"}//pkgStartDt
            ,{field:"pkgEndDt", title:"<spring:message code='par.lbl.endDttm' />" ,width:150 ,format:"{0:<dms:configValue code='dateFormat' />}"}//pkgEndDt
            ,{field:"pkgUpdtDtStr"
                ,title:" "
                ,width:100
                ,attributes:{ "style":"text-align:right"}
                , hidden:true}                //수정일시
            ,{field:"updtDtStr"
                ,title:" "
                ,width:100
                ,attributes:{ "style":"text-align:right"}
                , hidden:true}                //수정일시
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
        gridId:"G-PAR-0519-185802"
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
                        params["sPkgTp"]      = '03';

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
                        ,strgeCd:{ type:"string" ,editable:false}
                        ,strgeNm:{ type:"string" ,editable:false}
                    }
                }
            }
        }
        ,height:265 // row 9
        ,pageable:false
        ,filterable:false
        ,selectable:"single row"
        ,appendEmptyColumn:true//empty column. default:false
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
            ,{field:"itemCd", title:"<spring:message code='sal.lbl.accItemCd' />", width:100}//itemCd
            ,{field:"itemNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:150}//itemNm
            ,{field:"itemUnitCd", title:"<spring:message code='par.lbl.unitNm' />", width:70}//itemUnitCd
            ,{field:"itemQty", title:"<spring:message code='sal.lbl.goodsCnt' />", width:70
                ,attributes:{"class":"ar bg_white"}
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
            ,{field:"itemPrc", title:"<spring:message code='sal.lbl.goodsPrc' />"
                ,width:80
                ,attributes:{"class":"ar bg_white"}
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
            ,{field:"pkgDetlTotAmt", title:"<spring:message code='sal.lbl.goodsAmt' />", width:80, format:"{0:n2}", attributes:{"class":"ar"}}//pkgDetlTotAmt
            ,{field:"strgeCd", title:"<spring:message code='sal.lbl.goodsHouse' />", width:100
                ,template: function(dataItem){
                    var resultStr="";
                    if( dms.string.isNotEmpty(dataItem.strgeNm) ){
                        resultStr = dataItem.strgeNm;
                    }
                    return resultStr;
                }
            }
            ,{field:"strgeNm", title:"<spring:message code='sal.lbl.goodsHouse' />", width:100,hidden:true }
            ,{field:"pkgDetlDcRate", title:"<spring:message code='par.lbl.pkgDetlDcRate' />"
                ,width:50
                ,attributes:{"class":"ar bg_white"}
                ,editor:function(container, options){
                    $('<input required name="pkgDetlDcRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"{0:n2} \\%"
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
                            var vPkgDetlTotAmt   = 0;
                            var vPkgDetlDcAmt    = 0;
                            var vPkgDetlDcTotAmt = 0;

                            vPkgDetlTotAmt   =  vItemQty * vItemPrc;

                            if(vPkgDetlDcRate > 0){
                                vPkgDetlDcAmt    = (vPkgDetlTotAmt * (vPkgDetlDcRate / 100));
                                vPkgDetlDcTotAmt =  vPkgDetlTotAmt - vPkgDetlDcAmt;
                            }else{
                                vPkgDetlDcAmt = 0;
                                vPkgDetlDcTotAmt = vPkgDetlTotAmt;
                            }

                            model.set("pkgDetlTotAmt",   vPkgDetlTotAmt);
                            model.set("pkgDetlDcTotAmt", vPkgDetlDcTotAmt);
                            model.set("pkgDetlDcAmt",    vPkgDetlDcAmt);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="pkgDetlDcRate"></span>').appendTo(container);
                 }
                ,hidden:true
            }//pkgDetlDcRate
            ,{field:"pkgDetlDcAmt", title:"<spring:message code='par.lbl.pkgDetlDcAmt' />"
                , width:80
                , format:"{0:n2}"
                , attributes:{"class":"ar bg_white"}
                ,editor:function(container, options){
                    $('<input required name="pkgDetlDcAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         format:"{0:n2}"
                        ,decimals:2
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#parGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vItemQty = model.get("itemQty");
                            var vItemPrc = model.get("itemPrc");
                            var vPkgDetlDcAmt    = this.value();
                            var vPkgDetlDcRate   = 0;
                            var vPkgDetlTotAmt   = 0;
                            var vPkgDetlDcTotAmt = 0;

                            vPkgDetlTotAmt   =  vItemQty * vItemPrc;

                            console.log('vPkgDetlDcAmt:',vPkgDetlDcAmt);
                            console.log('vPkgDetlTotAmt:',vPkgDetlTotAmt);
                            if(vPkgDetlDcAmt > 0){
                                if(vPkgDetlTotAmt > 0){
                                    vPkgDetlDcRate    = (vPkgDetlDcAmt / vPkgDetlTotAmt) * 100;
                                    vPkgDetlDcRate    = Number(vPkgDetlDcRate.toFixed(2));
                                }else{
                                    vPkgDetlDcRate    = 0;
                                }
                                vPkgDetlDcTotAmt =  vPkgDetlTotAmt - vPkgDetlDcAmt;
                            }else{
                                vPkgDetlDcRate = 0;
                                vPkgDetlDcTotAmt = vPkgDetlTotAmt;
                            }

                            model.set("pkgDetlTotAmt",   vPkgDetlTotAmt);
                            model.set("pkgDetlDcTotAmt", vPkgDetlDcTotAmt);
                            model.set("pkgDetlDcRate",   vPkgDetlDcRate);
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="pkgDetlDcAmt"></span>').appendTo(container);
                 }
                ,hidden:true
            }//pkgDetlDcAmt
            ,{field:"pkgDetlDcTotAmt", title:"<spring:message code='par.lbl.pkgDetlDcPrcAmt' />", width:80, format:"{0:n2}", attributes:{"class":"ar"},hidden:true}//pkgDetlDcTotAmt
            ,{field:"useYn", title:"<spring:message code='par.lbl.useYn' />"
                ,width:70
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
                ,hidden:true
            }//useYn
        ]
    });

    $("#packageReg").data("kendoButton").enable(false);
});

</script>

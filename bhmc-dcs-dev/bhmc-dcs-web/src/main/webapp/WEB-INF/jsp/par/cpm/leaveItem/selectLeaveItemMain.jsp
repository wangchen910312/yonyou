<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectLeaveItemMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.leavingParts" /> --%></h1>
        <div class="btn_right">
            <button id="btnSend" type="button" class="btn_m btn_send"><spring:message code="par.btn.send" /></button>
            <button id="btnInit" type="button" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
            <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code="par.btn.search" /></button>
            <button id="btnSave" type="button" class="btn_m btn_save"><spring:message code="par.btn.save" /></button>
        </div>
    </div>
    <div class="table_form">
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></th>
                    <td class="required_area">
                        <input id="sDlrCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemGrpCd" /></th>
                    <td>
                        <input id="sItemDistinCd" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.supplyCd" /></th>
                    <td>
                        <div class="form_search">
                            <input id="sBpNm" type="text" class="form_input" />
                            <input type="hidden" id="sBpCd" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.stockDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStockStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sStockEndDt"  class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /></th>
                    <td>
                        <input id="sCarLine" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.leavePartsYn" /></th>
                    <td>
                        <label class="label_check"><input id="chkLeavePartsYn" type="checkbox" class="form_check"/></label>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.price" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPriceStart" class="form_comboBox" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPriceEnd" class="form_comboBox" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add" id="btnPartsAdd" type="button"><spring:message code="par.btn.itemPop" /></button><!--rowAdd  -->
                <button class="btn_s btn_del" id="btnDel" type="button"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
            </div>
        </div>
        <div class="table_grid">
            <div id="leavePartsGrid" ></div>
        </div>
    </section>
</section>
<!-- // selectLeaveItemMain -->
<!-- script -->
<script type="text/javascript">
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//itemDstinCdMap
var itemDstinCdMap = [];
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//carLineList
var carLineList = [];
<c:forEach var="obj" items="${carLineList}">
carLineList.push({
    "carlineCd":"${obj.carlineCd}"
    , "carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//carLineListMap
var carLineListMap = [];
$.each(carLineList, function(idx, obj){
    carLineListMap[obj.carlineCd] = obj.carlineNm;
});
//page init Func
function pageInit(){
    $("#sDlrCd").val("");
    $("#sItemDistinCd").data("kendoExtDropDownList").select(2);
    $("#sCarLine").data("kendoExtDropDownList").select(0);

    $("#sBpCd").val("");
    $("#sBpNm").val("");

    $("#sStockStartDt").data("kendoExtMaskedDatePicker").value(null);
    $("#sStockEndDt").data("kendoExtMaskedDatePicker").value(null);

    $("#sPriceStart").data("kendoExtNumericTextBox").value(0);
    $("#sPriceEnd").data("kendoExtNumericTextBox").value(0);

    $("#chkLeavePartsYn").prop("checked", false);

}
//supply search popup Func
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code = 'par.title.supplyInfo'/>"   //supplyInfo
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"callbackFunc":function(data){
                    $("#sBpCd").val(data[0].bpCd);
                    $("#sBpNm").val(data[0].bpNm);
                }
            }
        }
    });
}
//select item search popup
function selectItemPopupWindow(){

    // TODO:[InBoShim] dlrCd validation check.
    var sDlrCd = $("#sDlrCd").val();
    if(sDlrCd === ""){
        //dlrCd empty message.
        dms.notification.warning("<spring:message code='par.lbl.dlrCd' var='dlrCd' /><spring:message code='global.info.emptyParamInfo' arguments='${dlrCd}'/>");
        return false;
    }

    /* var bpCd = $("#bpCd").val();
    if(bpCd === ""){
        //supply empty message.
        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
        return false;
    } */

    itemByBpCdPopupWindow = dms.window.popup({
          windowId:"ItemMasterPopup"
        , title:"<spring:message code='par.title.partSearch' />"   // item select
        , width:850
        , height:480
        , content:{
            url:"<c:url value='/par/cmm/selectItemPopup.do'/>"
            , data:{
                "type":""
                , "autoBind":false
                , "bpCd":$("#sBpCd").val()
                , "bpNm":$("#sBpNm").val()
                , "bpTp":""
                , "selectable":"multiple"
                , "callbackFunc":function(parData){

                    for(var i=0; i<parData.length; i++){
                        var data = parData[i];

                        var itemCheckCnt = 0;
                        var grid = $("#leavePartsGrid").data("kendoExtGrid");
                        grid.tbody.find('>tr').each(function(){
                            var dataItem = grid.dataItem(this);
                            if(dataItem.itemCd === data.itemCd){
                                itemCheckCnt++;
                            }

                        });

                        if(itemCheckCnt === 0){
                            //TODO:[InBoShim] stock info setting.
                            var leavePartVO = {
                                dlrCd:$("#sDlrCd").val()
                                ,itemCd:parData[i].itemCd
                                ,itemNm:parData[i].itemNm
                                ,itemGrp:$("#sItemDistinCd").val()
                                ,leavePart:parData[i].itemCd
                                ,bpCd:$("#sBpCd").val()
                                ,bpNm:$("#sBpNm").val()
                                ,carLine:$("#sCarLine").val()
                                ,stockCost:0
                                ,purcPrice:parData[i].purcPrc
                                ,lastStockInDt:null
                                ,lastStockOutDt:null
                                ,stayDt:null
                                ,stockQty:0
                                ,stockPrice:0
                            }

                            $("#leavePartsGrid").data("kendoExtGrid").dataSource.add(leavePartVO).set("dirty", true);
                        }
                    }
                    itemByBpCdPopupWindow.close();
                }
            }
        }
    });
}
$(document).ready(function() {
    //btnSend
    $("#btnSend").kendoButton({
        click:function(e){
            //send Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call
            pageInit();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            //save Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnPartsAdd
    $("#btnPartsAdd").kendoButton({
        click:function(e){
            var bpCd = $("#bpCd").val();
            if(bpCd === ""){
                //supply empty message.
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                return false;
            }
            selectItemPopupWindow();
        }
    });
    //btnDel
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#leavePartsGrid").data("kendoExtGrid");
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

    //sItemDistinCd
    $("#sItemDistinCd").kendoExtDropDownList({
        dataSource:itemDstinCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:2
    });

    //sCarLine
    $("#sCarLine").kendoExtDropDownList({
        dataSource:carLineList
        ,dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //sStockStartDt
    $("#sStockStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //sStockEndDt
    $("#sStockEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //sPriceStart
    $("#sPriceStart").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    //sPriceEnd
    $("#sPriceEnd").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });

    //leavePartsGrid
    $("#leavePartsGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        var sDlrCd = $("#sDlrCd").val() == "" ? "X":$("#sDlrCd").val();
                        params["sDlrCd"] = sDlrCd;
                        params["sPreAmtTp"] = $("#sPreAmtTp").val();
                        params["sImpStartDt"] = $("#impStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sImpEndDt"] = $("#impEndDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,itemCd:{ type:"string" , validation:{required:true} }
                        ,itemNm:{ type:"string" , validation:{required:true} }
                        ,itemGrp:{ type:"string" , validation:{required:true} }
                        ,leavePart:{ type:"string" , validation:{required:true} }
                        ,bpCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,bpNm:{ type:"string" , validation:{required:true}, editable:false }
                        ,carLine:{ type:"string" , validation:{required:true}, editable:true }
                        ,stockCost:{ type:"number" , editable:false}
                        ,purcPrice:{ type:"number" , editable:false}
                        ,lastStockInDt:{ type:"date" , validation:{required:true}, editable:true }
                        ,lastStockOutDt:{ type:"date" , validation:{required:true}, editable:true }
                        ,stayDt:{ type:"date" , validation:{required:true}, editable:true }
                        ,stockQty:{ type:"number" , editable:false}
                        ,stockPrice:{ type:"number" , editable:false}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,autoBind:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:100 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:100 }
            ,{field:"itemGrp", title:"<spring:message code='par.lbl.partItemGrp'/>", width:100
                ,editor:function(container, options){
                    $('<input id="carLine" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:itemDstinCdList
                    });
                }
                ,template:'#if(itemGrp !== ""){# #= itemDstinCdMap[itemGrp]# #}#'
            }
            ,{field:"leavePart", title:"<spring:message code='par.lbl.leaveParts'/>", width:100 }
            ,{field:"bpNm", title:"<spring:message code='par.lbl.supplyCd'/>", width:100 }
            ,{field:"carLine", title:"<spring:message code='par.lbl.carLine'/>"
                ,width:120
                ,editor:function(container, options){
                    $('<input id="carLine" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"carlineNm"
                        ,dataValueField:"carlineCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:carLineList
                    });
                }
                ,template:'#if(carLine !== ""){# #= carLineListMap[carLine]# #}#'
            }
            ,{field:"stockCost", title:"<spring:message code='par.lbl.stockCost'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"purcPrice", title:"<spring:message code='par.lbl.purcPrice'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"lastStockInDt", title:"<spring:message code='par.lbl.lastStockInDt'/>", width:80 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"lastStockOutDt", title:"<spring:message code='par.lbl.lastStockOutDt'/>", width:80 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"stayDt", title:"<spring:message code='par.lbl.stayDt'/>", width:80 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"stockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"stockPrice", title:"<spring:message code='par.lbl.stockPrice'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
        ]
    });

});
</script>
<!-- //script -->
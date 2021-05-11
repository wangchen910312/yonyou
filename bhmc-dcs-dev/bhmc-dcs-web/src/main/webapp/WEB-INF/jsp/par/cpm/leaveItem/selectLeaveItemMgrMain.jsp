<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectLeaveItemMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.leavingPartsMgr" /> --%></h1>
        <div class="btn_right">
            <button id="btnInit" type="button" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
            <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code="par.btn.search" /></button>
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
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" class="form_input" />
                                <a href="#" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.distributeDt" /></th>
                    <td>
                        <input id="sDistributeDt" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.newOldTp" /></th>
                    <td>
                        <input id="sNewOldTp" value="" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                    <td>
                        <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.leaveItemStatNm" /></th>
                    <td>
                        <input id="sLeaveItemStatCd" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.saleTranCostYn" /></th>
                    <td>
                        <input id="sSaleTranCostYn" value="" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemTpCd" /><!-- 품목분류 --></th>
                    <td>
                        <input id="sItemDistinCd" type="text" class="form_comboBox">
                    </td>
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
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <section class="group">
        <div class="header_area">
            <div class="btn_right">

                <button class="btn_s btn_add" id="btnLeaveitemNewAdd" type="button"><spring:message code="par.btn.leaveitemNewAdd" /></button><!--leaveitemNewAdd  -->
                <button class="btn_s btn_add" id="btnLeaveitemUpload" type="button"><spring:message code="par.lbl.leaveitemUpload" /></button><!--leaveitemUpload  -->
                <button class="btn_s btn_add" id="btnLeaveitemDistribute" type="button"><spring:message code="par.btn.leaveitemDistribute" /></button><!--leaveitemDistribute  -->
                <button class="btn_s btn_del" id="btnLeaveitemProhibition" type="button"><spring:message code="par.btn.leaveitemProhibition" /></button><!--leaveitemProhibition  -->
                <button class="btn_s btn_del" id="btnLeaveitemSelectDel" type="button"><spring:message code="par.btn.leaveitemSelectDel" /></button><!--leaveitemSelectDel  -->
                <button class="btn_s btn_del" id="btnLeaveitemAllDel" type="button"><spring:message code="par.btn.leaveitemAllDel" /></button><!--leaveitemAllDel  -->
                <button class="btn_s btn_del" id="btnLeaveitemSelectDel" type="button"><spring:message code="par.btn.leaveitemSelectDel" /></button><!--leaveitemSelectDel  -->

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
//item search popup Func
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

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
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
    //btnLeaveitemNewAdd
    $("#btnLeaveitemNewAdd").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnLeaveitemUpload
    $("#btnLeaveitemUpload").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnLeaveitemDistribute
    $("#btnLeaveitemDistribute").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnLeaveitemProhibition
    $("#btnLeaveitemProhibition").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnLeaveitemSelectDel
    $("#btnLeaveitemSelectDel").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnLeaveitemAllDel
    $("#btnLeaveitemAllDel").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //btnLeaveitemSelectDel
    $("#btnLeaveitemSelectDel").kendoButton({
        click:function(e){
            //search Func call
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });

    //sItemDistinCd
    $("#sItemDistinCd").kendoExtDropDownList({
        dataSource:itemDstinCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //sNewOldTp
    $("#sNewOldTp").kendoExtDropDownList({
        dataSource:[{cmmCd:"01", cmmCdNm:"新"},{cmmCd:"02", cmmCdNm:"旧"}]
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //sLeaveItemStatCd
    $("#sLeaveItemStatCd").kendoExtDropDownList({
        dataSource:null
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //sSaleTranCostYn
    $("#sSaleTranCostYn").kendoExtDropDownList({
        dataSource:[{cmmCd:"01", cmmCdNm:"是"},{cmmCd:"02", cmmCdNm:"否"}]
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //sDistributeDt
    $("#sDistributeDt").kendoExtMaskedDatePicker({
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
                        ,itemNmEng:{ type:"string" , validation:{required:true} }
                        ,itemNmChn:{ type:"string" , validation:{required:true} }
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
                        ,newOldTp:{ type:"string" }
                        ,leaveItemStatCd:{ type:"string" }
                        ,itemOper:{ type:"string" }
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,autoBind:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:100 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:100 }
            ,{field:"itemNmEnd", title:"<spring:message code='par.lbl.itemNmEng'/>", width:100 }
            ,{field:"itemNmChn", title:"<spring:message code='par.lbl.itemNmChn'/>", width:100 }
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
            ,{field:"purcPrice", title:"<spring:message code='par.lbl.price'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"stockQty", title:"<spring:message code='par.lbl.qty'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"newOldTp", title:"<spring:message code='par.lbl.newOldTp'/>", width:80 }
            ,{field:"leaveItemStatCd", title:"<spring:message code='par.lbl.leaveItemStatCd'/>", width:80 }
            ,{field:"itemOper", title:"<spring:message code='par.lbl.itemOper'/>", width:80 }

        ]
    });

});
</script>
<!-- //script -->
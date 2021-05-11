<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- sale price history -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.salePriceHistoryTarget" /> --%><!-- salePriceHistoryTarget --></h1>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                        <input type="hidden" id="sPriceBpCd" name="sPriceBpCd" />
                        <div class="form_search">
                            <input id="sBpNm" name="sBpNm" class="form_input" value="${bpNm}" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.partsPriceRegUsrId" /><!-- partsPriceRegUsrId --></th>
                    <td>
                        <input type="hidden" id="sRegUsrId" name="sRegUsrId" value="" />
                        <div class="form_search">
                            <input id="sRegUsrNm" name="sRegUsrNm" class="form_input" value="" />
                            <a href="javascript:;" onclick="javascript:selectPartsRegUsrIdPopupWindow();"><!-- search --></a>
                        </div>
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
                            <input type="hidden" id="sPriceItemCd" name="sPriceItemCd" />
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.applyDt" /><!-- applyDt--></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input data-type="date" id="sApplyStartDt" name="sApplyStartDt" required class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input data-type="date" id="sApplyEndDt" name="sApplyEndDt" required class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>

                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.itemCdList" /></h2>
    </div>
    <div class="table_grid">
        <!-- salePrice grid -->
        <div id="grid" ></div>
    </div>

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tabPrice01" class="k-state-active"><spring:message code="par.title.salePrice" /></li>
            <li id="tabPrice02" ><spring:message code="par.title.purcPrice" /></li>
            <li id="tabPrice03" ><spring:message code="par.title.grItemPrice" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 销售价格 -->
        <div>
            <div class="table_grid">
                <div id="gridPrice01" class="grid"></div>
            </div>
        </div>
        <!-- //销售价格 -->

        <!-- 采购价(BMP) -->
        <div>
            <div class="table_grid">
                <div id="gridPrice02" class="grid"></div>
            </div>
        </div>
        <!-- //采购价(BMP) -->

        <!-- 入库价 -->
        <div>
            <div class="table_grid">
                <div id="gridPrice03" class="grid"></div>
            </div>
        </div>
        <!-- //入库价 -->
    </div>

</section>
<!-- //sale price history  -->

<!-- script -->
<script>
//unitCdDs
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
//partsCarTpDs
var partsCarTpDs = [];
<c:forEach var="obj" items="${partsCarTpDs}">
partsCarTpDs.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//ABC CLASS
var abcIndList = [];
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({
    "abcCd":"${obj.cmmCd}"
    ,"abcCdNm":"${obj.cmmCd}"
});
</c:forEach>
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//salePrcTpList
var salePrcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//salePrcTpMap
var salePrcTpMap = {};
$.each(salePrcTpList, function(idx, obj){
    salePrcTpMap[obj.cmmCd] = obj.cmmCdNm;
});
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
                    if(data.length > 0){
                        $("#sBpCd").val(data[0].bpCd);
                        $("#sBpNm").val(data[0].bpNm);
                    }
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

function selectPartsRegUsrIdPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}
// search memeber itemCd,bpCd
var selectedItemCd = "";
var selectedBpCd = "";

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                var vBpCd = $("#sBpCd").val();
                var vBpNm = $("#sBpNm").val();
                if(vBpCd === ""){
                   // supplyCd check message
                    dms.notification.info("<spring:message code='par.lbl.supplyCd' var='supplyCd' /><spring:message code='global.info.required.field' arguments='${supplyCd}' />");
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
        // abc class dropdownlist
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndList
            ,autoBind:false
            ,index:0
        });
        //sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sApplyStartDt
        $("#sApplyStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sApplyEndDt
        $("#sApplyEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
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
            ,height:150
            ,editable:false
            ,autoBind:false
            ,sortable:false
            ,selectable:"row"
            ,multiSelectWithCheckbox:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#sPriceBpCd").val(selectedItem.bpCd);
                    $("#sPriceItemCd").val(selectedItem.itemCd);
                    $("#gridPrice01").data("kendoExtGrid").dataSource.read();
                    $("#gridPrice02").data("kendoExtGrid").dataSource.read();
                    $("#gridPrice03").data("kendoExtGrid").dataSource.data([]);
                }
             }
            ,columns :
                [{ title:"<spring:message code='par.lbl.bpNm' />", field:"bpNm", width:80 }//bpNm
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", width:60 , format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.partsPriceRegUsrId' />", field:"regUsrId", width:60 }//regUsrId
            ]
        });
        //gridPrice01
        $("#gridPrice01").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            // search area

                            params["sBpCd"] = $("#sPriceBpCd").val();
                            params["sItemCd"] = $("#sPriceItemCd").val();

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
            ,height:196
            ,editable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", width:80 ,format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.purcPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.purcPriceTax' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPriceTax
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
            ]
        });
        //gridPrice02
        $("#gridPrice02").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetHistorys.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            // search area

                            params["sBpCd"] = $("#sPriceBpCd").val();
                            params["sItemCd"] = $("#sPriceItemCd").val();

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
            ,height:196
            ,editable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", width:80 ,format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
                ,{ title:"<spring:message code='par.lbl.purcPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.grRecentPrice' />", field:"rectGiPrc", attributes:{"class":"ar"}, width:70 }//grRecentPrice
                ,{ title:"<spring:message code='par.lbl.bmpBasePrice' />", field:"bmpOpnPrc", attributes:{"class":"ar"}, width:90 }//bmpBasePrice
                ,{ title:"<spring:message code='par.lbl.basePrice' />", field:"stdPrc", attributes:{"class":"ar"}, width:70 }//basePrice
                ,{ title:"<spring:message code='par.lbl.salePriceCost01' />", headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"retlPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    },{
                        field:"retlAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                    }]
                }
                ,{ title:"<spring:message code='par.lbl.salePriceCost02' />", headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"whslPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    },{
                        field:"whslAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                    }]
                }
                ,{  title:"<spring:message code='par.lbl.salePriceCost03' />", headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"incPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    },{
                        field:"incAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                    }]
                }
                ,{  field:"grtePrc" ,title:"<spring:message code='par.lbl.salePriceCost04' />", width:70, format:"{0:n2}", attributes:{"class":"ar"} }//basePrice
            ]
        });
        //gridPrice03
        $("#gridPrice03").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            // search area

                            params["sBpCd"] = $("#sPriceBpCd").val();
                            params["sItemCd"] = $("#sPriceItemCd").val();

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
            ,height:196
            ,editable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.grDt' />", field:"applyDt", width:80 ,format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.grItemPriceTax' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.grItemPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.bpNm' />", field:"bpNm", width:70 }//bpNm
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
            ]
        });
    });
</script>
<!-- //script -->


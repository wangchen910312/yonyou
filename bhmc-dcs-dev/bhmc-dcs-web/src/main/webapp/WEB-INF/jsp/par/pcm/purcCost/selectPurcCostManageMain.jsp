<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- purcCostManageMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.purcCostMng" /> --%><!-- purcCostMng --></h1>
        <div class="btn_right">
            <button class="btn_m" id="btnPurcInsert" type="button"><spring:message code="par.btn.purcInsert" /></button><!--btnPurcInsert  -->
            <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
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
                    <th scope="row"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td>
                        <div class="form_search">
                            <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                            <input id="sBpNm" name="sBpNm" class="form_input" readonly="readonly" value="${bpNm}" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                    <td>
                        <input id="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.lastGrDt" /><!-- lastGrDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sLastGrStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sLastGrEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.lastGiDt" /><!-- lastGiDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sLastGiStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sLastGiEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <!-- // tab -->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabTargetOn" class="k-state-active"><spring:message code="par.title.targetOn" /><!-- targetOn --></li>
                <li id ="tabTargetOff"><spring:message code="par.title.targetOff" /><!-- targetOff --></li>
            </ul>
            <!--tabTargetOn -->
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s" id="btnTargetOff" type="button"><spring:message code="par.btn.targetOff" /></button><!--targetOff  -->
                    </div>
                </div>

                <div class="table_grid">
                    <div id="targetOnGrid" ></div>
                </div>

            </div>
            <!--tabTargetOff -->
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s" id="btnTargetOn" type="button"><spring:message code="par.btn.targetOn" /></button><!--targetOn  -->
                    </div>
                </div>

                <div class="table_grid">
                    <div id="targetOffGrid" ></div>
                </div>
            </div>

        </div>
        <!-- // tab -->
    </section>
</section>
<!-- //purcCostManageMain -->

<!-- script -->
<script>
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
//unitCdDs
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
//partsCarTpDs
var partsCarTpDs = [];
<c:forEach var="obj" items="${partsCarTpDs}">
partsCarTpDs.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//abcIndDs
var abcIndDs = [];
<c:forEach var="obj" items="${abcIndDs}">
abcIndDs.push({
    "abcCd":"${obj.abcCd}"
    ,"abcCdNm":"${obj.abcCd}"
});
</c:forEach>
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
                    }
                }
            }
        }
    });
}
//buttonVenderEnableDisable Func
function buttonVenderEnableDisable(bFlag){
    $("#btnTargetOff").data("kendoButton").enable(bFlag);

    if(bFlag == true){
        $("#btnTargetOn").data("kendoButton").enable(false);
    }else{
        $("#btnTargetOn").data("kendoButton").enable(true);
    }
}
//selectPurcCostSgstes Func
function selectPurcCostSgstes(){
    $("#targetOnGrid").data("kendoExtGrid").dataSource.read();
    $("#targetOffGrid").data("kendoExtGrid").dataSource.read();
}
//updatePurcCostSgst Func
function updatePurcCostSgst(bFlag){
    var grid = null;
    var rows = null;
    var dateItems = [ ];
    var rowCnt = 0;

    if(bFlag == "Y")
        grid = $("#targetOffGrid").data("kendoExtGrid");
    else
        grid = $("#targetOnGrid").data("kendoExtGrid");

    rows = grid.select();
    rowCnt = rows.length;

    //target on/off update
    rows.each(function(index, row) {
        var item = grid.dataItem(row);
        item.targYn = bFlag;
    });

    if(grid.gridValidation()){
        if(rowCnt == 0){
           //not changed message
            dms.notification.info("<spring:message code='global.info.required.change'/>");
            return;
        }
        //checked list
        $.each(rows, function(idx, row){
            dateItems.push(grid.dataItem(row));
        });

        var multiPurcCostSgstes = { insertList:[], updateList:dateItems, deleteList:[] };

        $.ajax({
            url:"<c:url value='/par/pcm/purcCost/multiPurcCostSgstes.do' />"
            ,data:JSON.stringify(multiPurcCostSgstes)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(jqXHR, textStatus){
                //selectPurcCostSgstes Func call
                selectPurcCostSgstes();
                //success message
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }else{
        //input value check message
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                //selectPurcCostSgstes Func call
                selectPurcCostSgstes();
            }
        });
        //btnPurcInsert
        $("#btnPurcInsert").kendoButton({
            enable:true
            ,click:function(e){
                //selectPurcOrdMain page move
                window.location.href = "<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do' />";
            }
        });
        //btnTargetOn
        $("#btnTargetOn").kendoButton({
            enable:false
            ,click:function(e){
                //updatePurcCostSgst Func call
                updatePurcCostSgst("Y");
            }
        });
        //btnTargetOff
        $("#btnTargetOff").kendoButton({
            enable:true
            ,click:function(e){
                //updatePurcCostSgst Func call
                updatePurcCostSgst("N");
            }
        });
        //sItemCd focus
        $("#sItemCd").focus();
        //sCarlineCd
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,optionLabel:" "
            ,dataSource:partsCarTpDs
            ,autoBind:false
            ,index:0
        });
        //sAbcInd
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndDs
            ,autoBind:false
            ,index:0
        });
        //sLastGrStartDt
        $("#sLastGrStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sLastGrEndDt
        $("#sLastGrEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sLastGiStartDt
        $("#sLastGiStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sLastGiEndDt
        $("#sLastGiEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;

                if(selectTabId == "tabTargetOn"){
                    buttonVenderEnableDisable(true);
                }else{
                    buttonVenderEnableDisable(false);
                }
            }
        });
        //targetOnGrid
        $("#targetOnGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcCost/selectPurcCostSgstes.do' />"
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
                            params["sBpCd"] = $("#sBpCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sLastGrStartDt"] = $("#sLastGrStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sLastGrEndDt"] = $("#sLastGrEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiStartDt"] = $("#sLastGiStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiEndDt"] = $("#sLastGiEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sTargYn"] = "Y";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,pltCd:{ type:"string" }
                            ,itemCd:{ type:"string" , validation:{required:true} }
                            ,itemNm:{ type:"string" , validation:{required:true} }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,stdDt:{ type:"date" }
                            ,purcSgstQty:{ type:"number" }
                            ,unitCd:{ type:"string" }
                            ,sftyStockQty:{ type:"number" }
                            ,psntStockQty:{ type:"number" }
                            ,grScheQty:{ type:"number" }
                            ,giScheQty:{ type:"number" }
                            ,minPurcQty:{ type:"number" }
                            ,trsfQty:{ type:"number" }
                            ,purcOrdRegYn:{ type:"string" }
                            ,targYn:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:false
            ,multiSelectWithCheckbox:true
            ,columns :
                [{ field:"bpNm", title:"<spring:message code = 'par.lbl.supplyNm'/>", width:120
                    , template:'#if(bpNm === ""){# <a href="<c:url value="/par/pmm/partsPriceMaster/selectPartsPriceMasterMain.do" />?itemCd=#= itemCd#&itemNm=#= itemNm#"><spring:message code = "par.title.supplyMove"/></a> #} else {# #= bpNm# #}#'
                }//bpNm
                ,{ field:"bpCd", title:"<spring:message code = 'par.lbl.supplyNo'/>", width:100, hidden:true }                                      //bpCd
                ,{ field:"rnum", title:"<spring:message code = 'par.lbl.line'/>", attributes:{"class":"ac"}, width:40 }                            //rnum
                ,{ field:"stdDt", title:"<spring:message code = 'par.lbl.stdDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }  //stdDt
                ,{ field:"itemCd", title:"<spring:message code = 'par.lbl.itemCd'/>", width:120 }                                                     //itemCd
                ,{ field:"itemNm", title:"<spring:message code = 'par.lbl.itemNm'/>", width:150 }                                                     //itemNm
                ,{ field:"unitCd", title:"<spring:message code = 'par.lbl.unitNm'/>", width:50 }                                                      //unitCd
                ,{ field:"purcSgstQty", title:"<spring:message code = 'par.lbl.purcSgstQty'/>", attributes:{"class":"ar"}, width:80 }              //purcSgstQty
                ,{ field:"sftyStockQty", title:"<spring:message code = 'par.lbl.sftyStockQty'/>", attributes:{"class":"ar"}, width:80 }            //sftyStockQty
                ,{ field:"psntStockQty", title:"<spring:message code = 'par.lbl.psntStockQty'/>", attributes:{"class":"ar"}, width:80 }            //psntStockQty
                ,{ field:"grScheQty", title:"<spring:message code = 'par.lbl.grScheQty'/>", attributes:{"class":"ar"}, width:90 }                  //grScheQty
                ,{ field:"giScheQty", title:"<spring:message code = 'par.lbl.giScheQty'/>", attributes:{"class":"ar"}, width:90 }                  //giScheQty
                ,{ field:"minPurcQty", title:"<spring:message code = 'par.lbl.minPurcQty'/>", attributes:{"class":"ar"}, width:90 }                //minPurcQty
                ,{ field:"trsfQty", title:"<spring:message code = 'par.lbl.trsfQty'/>", attributes:{"class":"ar"}, width:90 }                      //trsfQty
            ]
        });
        //targetOffGrid
        $("#targetOffGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcCost/selectPurcCostSgstes.do' />"
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
                            params["sBpCd"] = $("#sBpCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sLastGrStartDt"] = $("#sLastGrStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sLastGrEndDt"] = $("#sLastGrEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiStartDt"] = $("#sLastGiStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiEndDt"] = $("#sLastGiEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sTargYn"] = "N";

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
                            ,pltCd:{ type:"string" }
                            ,itemCd:{ type:"string" , validation:{required:true} }
                            ,itemNm:{ type:"string" , validation:{required:true} }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,stdDt:{ type:"date" }
                            ,purcSgstQty:{ type:"number" }
                            ,unitCd:{ type:"string" }
                            ,sftyStockQty:{ type:"number" }
                            ,psntStockQty:{ type:"number" }
                            ,grScheQty:{ type:"number" }
                            ,giScheQty:{ type:"number" }
                            ,minPurcQty:{ type:"number" }
                            ,trsfQty:{ type:"number" }
                            ,purcOrdRegYn:{ type:"string" }
                            ,targYn:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:false
            ,multiSelectWithCheckbox:true
            ,columns :
                [{ field:"bpNm", title:"<spring:message code = 'par.lbl.supplyNm'/>", width:120
                    , template:'#if(bpNm === ""){# <a href="<c:url value="/par/pmm/partsPriceMaster/selectPartsPriceMasterMain.do" />?itemCd=#= itemCd#&itemNm=#= itemNm#"><spring:message code = "par.title.supplyMove"/></a> #} else {# #= bpNm# #}#'
                }//bpNm
                ,{ field:"bpCd", title:"<spring:message code = 'par.lbl.supplyNo'/>", width:100, hidden:true }                                      //bpCd
                ,{ field:"rnum", title:"<spring:message code = 'par.lbl.line'/>", attributes:{"class":"ac"}, width:40 }                            //rnum
                ,{ field:"stdDt", title:"<spring:message code = 'par.lbl.stdDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }  //stdDt
                ,{ field:"itemCd", title:"<spring:message code = 'par.lbl.itemCd'/>", width:120 }                                                     //itemCd
                ,{ field:"itemNm", title:"<spring:message code = 'par.lbl.itemNm'/>", width:200 }                                                     //itemNm
                ,{ field:"unitCd", title:"<spring:message code = 'par.lbl.unitNm'/>", width:50 }                                                      //unitCd
                ,{ field:"purcSgstQty", title:"<spring:message code = 'par.lbl.purcSgstQty'/>", attributes:{"class":"ar"}, width:80 }              //purcSgstQty
                ,{ field:"sftyStockQty", title:"<spring:message code = 'par.lbl.sftyStockQty'/>", attributes:{"class":"ar"}, width:80 }            //sftyStockQty
                ,{ field:"psntStockQty", title:"<spring:message code = 'par.lbl.psntStockQty'/>", attributes:{"class":"ar"}, width:80 }            //psntStockQty
                ,{ field:"grScheQty", title:"<spring:message code = 'par.lbl.grScheQty'/>", attributes:{"class":"ar"}, width:90 }                  //grScheQty
                ,{ field:"giScheQty", title:"<spring:message code = 'par.lbl.giScheQty'/>", attributes:{"class":"ar"}, width:90 }                  //giScheQty
                ,{ field:"minPurcQty", title:"<spring:message code = 'par.lbl.minPurcQty'/>", attributes:{"class":"ar"}, width:90 }                //minPurcQty
                ,{ field:"trsfQty", title:"<spring:message code = 'par.lbl.trsfQty'/>", attributes:{"class":"ar"}, width:90 }                      //trsfQty
            ]
        });

    });
</script>
<!-- //script -->

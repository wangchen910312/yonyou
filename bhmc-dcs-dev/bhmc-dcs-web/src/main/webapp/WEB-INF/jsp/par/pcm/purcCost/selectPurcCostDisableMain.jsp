<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- purcCostDisableMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.purcCostSelect" /> --%><!-- purcCostSelect --></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
        </div>
    </div>

    <div class="table_form form_width_20per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
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
                    <td>&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <!-- //tab -->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabTargetOn" class="k-state-active"><spring:message code="par.title.targetOn" /><!-- targetOn --></li>
                <li id ="tabTargetOff"><spring:message code="par.title.targetOff" /><!-- targetOff --></li>
            </ul>
            <!--tabTargetOn -->
            <div>
                <div class="table_grid">
                    <div id="targetOnGrid" class="grid"></div>
                </div>
            </div>
            <!--tabTargetOff -->
            <div>
                <div class="table_grid">
                    <div id="targetOffGrid" class="grid"></div>
                </div>
            </div>
        </div>
        <!-- //tab end -->
    </section>
</section>
<!-- //구매소요량관리 -->

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
var unitCdMap = [];
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});
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
                    if(data.length > 0)
                    {
                        $("#sItemCd").val(data[0].itemCd);
                    }
                }
            }
        }
    });
}
//selectPurcCostSgstes Func
function selectPurcCostSgstes(){
    $("#targetOnGrid").data("kendoExtGrid").dataSource.read();
    $("#targetOffGrid").data("kendoExtGrid").dataSource.read();
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
        //sItemCd
        $("#sItemCd").focus();
        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
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

                            params["sort"] = options.sort;

                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = "";
                            params["sBpCd"] = "";
                            params["sCarLineCd"] = $("#sCarLineCd").val();
                            params["sAbcInd"] = "";
                            params["sLastGrStartDt"] = "";
                            params["sLastGrEndDt"] = "";
                            params["sLastGiStartDt"] = "";
                            params["sLastGiEndDt"] = "";
                            params["sTargYn"] = "Y";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
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
            ,pageable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    var cell = row.children().eq(0);
                    if(dataItem.bpCd == ""){//bpCd is value empty
                        cell.addClass("bg_red");
                    }
                });
            }
            ,columns :
                [{field:"bpNm", title:"<spring:message code = 'par.lbl.supplyNm'/>", width:120 }                                                      //bpNm
                ,{field:"bpCd", title:"<spring:message code = 'par.lbl.supplyNo'/>", width:100, hidden:true }                                       //bpCd
                ,{field:"rnum", title:"<spring:message code = 'par.lbl.line'/>", width:40 }                                                           //rnum
                ,{field:"stdDt", title:"<spring:message code = 'par.lbl.stdDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }   //stdDt
                ,{field:"itemCd", title:"<spring:message code = 'par.lbl.itemCd'/>", width:120 }                                                      //itemCd
                ,{field:"itemNm", title:"<spring:message code = 'par.lbl.itemNm'/>", width:200 }                                                      //itemNm
                ,{field:"unitCd", title:"<spring:message code = 'par.lbl.unitNm'/>", width:50}                                                        //unitCd
                ,{field:"purcSgstQty", title:"<spring:message code = 'par.lbl.purcSgstQty'/>", attributes:{"class":"ar"}, width:80 }               //purcSgstQty
                ,{field:"sftyStockQty", title:"<spring:message code = 'par.lbl.sftyStockQty'/>", attributes:{"class":"ar"}, width:80 }             //sftyStockQty
                ,{field:"psntStockQty", title:"<spring:message code = 'par.lbl.psntStockQty'/>", attributes:{"class":"ar"}, width:80 }             //psntStockQty
                ,{field:"grScheQty", title:"<spring:message code = 'par.lbl.grScheQty'/>", attributes:{"class":"ar"}, width:80 }                   //grScheQty
                ,{field:"giScheQty", title:"<spring:message code = 'par.lbl.giScheQty'/>", attributes:{"class":"ar"}, width:80 }                   //giScheQty
                ,{field:"minPurcQty", title:"<spring:message code = 'par.lbl.minPurcQty'/>", attributes:{"class":"ar"}, width:80 }                 //minPurcQty
                ,{field:"trsfQty", title:"<spring:message code = 'par.lbl.trsfQty'/>", attributes:{"class":"ar"}, width:80 }                       //trsfQty
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

                            params["sort"] = options.sort;

                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = "";
                            params["sBpCd"] = "";
                            params["sCarLineCd"] = $("#sCarLineCd").val();
                            params["sAbcInd"] = "";
                            params["sLastGrStartDt"] = "";
                            params["sLastGrEndDt"] = "";
                            params["sLastGiStartDt"] = "";
                            params["sLastGiEndDt"] = "";
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
            ,pageable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    var cell = row.children().eq(0);
                    if(dataItem.bpCd == ""){
                        cell.addClass("bg_red");
                    }
                });
            }
            ,columns :
                [{field:"bpNm", title:"<spring:message code = 'par.lbl.supplyNm'/>", width:120 }                                                      //bpNm
                ,{field:"bpCd", title:"<spring:message code = 'par.lbl.supplyNo'/>", width:100, hidden:true }                                       //bpCd
                ,{field:"rnum", title:"<spring:message code = 'par.lbl.line'/>", width:40 }                                                           //rnum
                ,{field:"stdDt", title:"<spring:message code = 'par.lbl.stdDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }   //stdDt
                ,{field:"itemCd", title:"<spring:message code = 'par.lbl.itemCd'/>", width:120 }                                                      //itemCd
                ,{field:"itemNm", title:"<spring:message code = 'par.lbl.itemNm'/>", width:200 }                                                      //itemNm
                ,{field:"unitCd", title:"<spring:message code = 'par.lbl.unitNm'/>", width:50 }                                                       //unitCd
                ,{field:"purcSgstQty", title:"<spring:message code = 'par.lbl.purcSgstQty'/>", attributes:{"class":"ar"}, width:80 }               //purcSgstQty
                ,{field:"sftyStockQty", title:"<spring:message code = 'par.lbl.sftyStockQty'/>", attributes:{"class":"ar"}, width:80 }             //sftyStockQty
                ,{field:"psntStockQty", title:"<spring:message code = 'par.lbl.psntStockQty'/>", attributes:{"class":"ar"}, width:80 }             //psntStockQty
                ,{field:"grScheQty", title:"<spring:message code = 'par.lbl.grScheQty'/>", attributes:{"class":"ar"}, width:80 }                   //grScheQty
                ,{field:"giScheQty", title:"<spring:message code = 'par.lbl.giScheQty'/>", attributes:{"class":"ar"}, width:80 }                   //giScheQty
                ,{field:"minPurcQty", title:"<spring:message code = 'par.lbl.minPurcQty'/>", attributes:{"class":"ar"}, width:80 }                 //minPurcQty
                ,{field:"trsfQty", title:"<spring:message code = 'par.lbl.trsfQty'/>", attributes:{"class":"ar"}, width:80 }                       //trsfQty
            ]
        });
    });
</script>
<!-- //script -->
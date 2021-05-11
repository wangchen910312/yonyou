<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueReqResvReady -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"></h1> --%>
            <div class="btn_left">
                <button id="btnInit" name="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_search btn_m_min" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carNo" /></th>
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvReqTime" /></th>
                    <td>
                        <input id="sInvResvReqTime" name="sInvResvReqTime" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvWorkTime" /></th>
                    <td>
                        <input id="sInvResvWorkTime" name="sInvResvWorkTime" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvWorkType" /></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.vin" /></th>
                    <td>
                        <input id="sVin" name="sVin" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvDocNo" /></th>
                    <td class="required_area">
                        <input id="sInvResvDocNo" name="sInvResvDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoDocNo" /></th>
                    <td >
                        <input id="sInvRoDocNo" name="sInvRoDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoDocStatus" /></th>
                    <td >
                        <input id="sParReqStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.visitNm" /></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvManNm" /></th>
                    <td>
                        <input id="sInvResvManNm" name="sInvResvManNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoManNm" /></th>
                    <td>
                        <input id="sInvRoManNm" name="sInvRoManNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invRoWorkTime" /></th>
                    <td>
                        <input id="sInvRoWorkTime" name="sInvRoWorkTime" class="form_datepicker" />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"></th>
                    <td>
                        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- // tab start-->
    <div id="tabstrip" class="tab_area">
    <ul>
        <li id ="tabInvResvInfo" class="k-state-active"><spring:message code="par.title.invResvInfo" /></li>
        <li id ="tabRoWorkInfo"><spring:message code="par.title.invRoInfo" /></li>
    </ul>
    <!--tabPartOutStock tab area -->
    <div class="mt0">
        <section class="group">
            <div class="header_area">
            </div>
            <div class="table_grid">
                <!-- targetReqDetailGrid -->
                <div id="targetReqHeaderResvGrid" ></div>
                <!-- targetReqDetailGrid -->
            </div>
        </section>
    </div>
    <!-- tabRoWorkInfo tab area -->

    <div class="mt0">
        <section class="group">
            <div class="header_area">
            </div>
            <div class="table_grid">
                <div id="targetReqHeaderRoGrid" ></div>
            </div>
        </section>
    </div>

</div>
<!-- // tab end -->

</section>
<!-- //issueReqResvReady -->

<!-- script -->
<script>
//parGiTpResv
var parGiTpResvList = [];
<c:forEach var="obj" items="${parGiTpResvList}">
parGiTpResvList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//readyStatCdList
var readyStatCdList = [];
<c:forEach var="obj" items="${readyStatCdList}">
readyStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var readyStatCdMap = {};
$.each(readyStatCdList, function(idx, obj){
    readyStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}

var selectedIssueReqVO = {};
function getSelectedItem(){
    return selectedIssueReqVO;
}

//page init Func
function pageInit(){

    $("#sCarNo").val("");
    $("#sInvResvReqTime").data("kendoExtMaskedDateTimePicker").value(new Date("${sysStartDate}"));
    $("#sInvResvWorkTime").data("kendoExtMaskedDateTimePicker").value(new Date("${sysEndDate}"));
    $("#sParGiTp").data("kendoExtDropDownList").select(0);

    $("#sVin").val("");
    $("#sInvResvDocNo").val("");
    $("#sInvRoDocNo").val("");
    $("#sParReqStatCd").data("kendoExtDropDownList").select(0);

    $("#sVisitNm").val("");
    $("#sInvResvManNm").val("");
    $("#sInvRoManNm").val("");
    $("#sInvRoWorkTime").data("kendoExtMaskedDateTimePicker").value(new Date("${sysEndDate}"));
}
    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                //pageInit Func call.
                pageInit();
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#targetReqHeaderResvGrid").data("kendoExtGrid").dataSource.read();
                $("#targetReqHeaderRoGrid").data("kendoExtGrid").dataSource.read();
            }
        });
        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        // sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpResvList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // parReqSattCd dropdownlist
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sInvResvReqTime datepicker
        $("#sInvResvReqTime").kendoExtMaskedDateTimePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sInvResvWorkTime datepicker
        $("#sInvResvWorkTime").kendoExtMaskedDateTimePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sInvRoWorkTime datepicker
        $("#sInvRoWorkTime").kendoExtMaskedDateTimePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //targetReqHeaderResvGrid.
        $("#targetReqHeaderResvGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135401"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReserve/selectIssueReqReserveStatus.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sParGiTp"] = "SR";
                            params["sResvDocNo"] = $("#sInvResvDocNo").val();//sResvDocNo
                            params["sReqStartDt"] = $("#sInvResvReqTime").data("kendoExtMaskedDateTimePicker").value();//sReqStartDt
                            params["sCustNm"] = $("#sCustNm").val();//sCustNm
                            params["sSerPrsnId"] = $("#sInvResvManNm").val();//sSerPrsnId.

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,parReqDocNo:{ type:"string"}
                            ,parGiTp:{ type:"string"}
                            ,parReqStatCd:{ type:"string"}
                            ,readyStatCd:{ type:"string", editable:true}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string"}
                            ,resvDocNo:{ type:"string"}
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string" }
                            ,custCd:{ type:"string" }
                            ,custNm:{ type:"string" }
                            ,vinNo:{ type:"string" }
                            ,carNo:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,unitCd:{ type:"string" }
                            ,resvQty:{ type:"number" }
                            ,itemPrc:{ type:"number"}
                            ,itemAmt:{ type:"number"}
                            ,movingAvgPrc:{ type:"number"}
                            ,movingAvgAmt:{ type:"number"}
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
                ,aggregate:
                    [
                        { field:"resvQty", aggregate:"sum" }
                        ,{ field:"movingAvgPrc", aggregate:"sum" }
                        ,{ field:"movingAvgAmt", aggregate:"sum" }
                    ]
            }
            ,editable:false
            ,height:334
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column set:default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                var parReqDocNo = $("#parReqDocNo").val();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        //update row reselect.
                        if(dataItem.parReqDocNo === parReqDocNo){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                    }
                });
            }
            ,change:function(e){
            }
            ,columns :
                [{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"serPrsnId", title:"<spring:message code='par.lbl.prsNm'/>", width:100 }
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.invResvDocNo'/>", width:120 }
                ,{field:"parGiTp", title:"<spring:message code='par.lbl.invResvWorkType'/>", width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                        return spanObj;
                    }
                }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvReqTime'/>", width:120, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.invResvManNm'/>", width:100 }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invRoWorkTime'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:'#if(readyStatCdMap[readyStatCd] !== undefined){# #= readyStatCdMap[readyStatCd]# #}#'
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:150}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unit' />", width:80}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty' />", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost' />", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:100}
                ,{field:"locId", title:"<spring:message code='par.lbl.locNm' />", width:100}
            ]
        });
        //targetReqHeaderRoGrid.
        $("#targetReqHeaderRoGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135496"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReserve/selectIssueReqReserveStatus.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sParGiTp"] = "RO";
                            params["sRoDocNo"] = $("#sInvRoDocNo").val();//sResvDocNo
                            params["sReqStartDt"] = $("#sInvResvWorkTime").data("kendoExtMaskedDateTimePicker").value();//sReqStartDt
                            params["sCustNm"] = $("#sCustNm").val();//sCustNm
                            params["sSerPrsnId"] = $("#sInvRoManNm").val();//sSerPrsnId.

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,parReqDocNo:{ type:"string"}
                            ,parGiTp:{ type:"string"}
                            ,parReqStatCd:{ type:"string"}
                            ,readyStatCd:{ type:"string", editable:true}
                            ,cancYn:{ type:"string"}
                            ,roDocNo:{ type:"string", editable:false}
                            ,resvDocNo:{ type:"string", editable:false}
                            ,pltCd:{ type:"string" }
                            ,serPrsnId:{ type:"string", editable:false}
                            ,custCd:{ type:"string" , editable:false}
                            ,custNm:{ type:"string" , editable:false}
                            ,vinNo:{ type:"string" , editable:false}
                            ,carNo:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,unitCd:{ type:"string" }
                            ,resvQty:{ type:"number" }
                            ,itemPrc:{ type:"number"}
                            ,itemAmt:{ type:"number"}
                            ,movingAvgPrc:{ type:"number"}
                            ,movingAvgAmt:{ type:"number"}
                            ,regUsrId:{ type:"string" , editable:false}
                            ,regDt:{ type:"date" , editable:false}
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
                ,aggregate:
                    [
                        { field:"resvQty", aggregate:"sum" }
                        ,{ field:"movingAvgPrc", aggregate:"sum" }
                        ,{ field:"movingAvgAmt", aggregate:"sum" }
                    ]
            }
            ,editable:false
            ,height:334
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                var parReqDocNo = $("#parReqDocNo").val();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        //update row reselect.
                        if(dataItem.parReqDocNo === parReqDocNo){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                    }
                });
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"serPrsnId", title:"<spring:message code='par.lbl.prsNm'/>", width:100 }
                ,{field:"roDocNo", title:"<spring:message code='par.lbl.invRoDocNo'/>", width:140 }
                ,{field:"parGiTp", title:"<spring:message code='par.lbl.invResvWorkType'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                        return spanObj;
                    }
                }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvWorkTime'/>", width:120, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.invRoManNm'/>", width:100 }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.invRoDocStatus'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:'#if(readyStatCdMap[readyStatCd] !== undefined){# #= readyStatCdMap[readyStatCd]# #}#'
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:150}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unit' />", width:80}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty' />", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost' />", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:100}
                ,{field:"locId", title:"<spring:message code='par.lbl.locNm' />", width:100}
            ]
        });

        gridHeight();

    });
    //gridHeight - if grid has footer
    function gridHeight(){
        var grid = $("#targetReqHeaderResvGrid").data("kendoExtGrid");
        var contentHeight = grid.content.height();
        var footerHeight = grid.wrapper.find(".k-grid-footer").height();
        grid.content.height(contentHeight - (footerHeight + 1));
    }
    // 품목구분 그리드 콤보
    function setSumData(val){
        var returnData  = Math.round(val * 1000)/1000,
            returnCalData = Math.round(returnData * 100)/100,
            returnVal = kendo.toString(returnData,'n2');

        return returnVal;
    };

</script>
<!-- //script -->

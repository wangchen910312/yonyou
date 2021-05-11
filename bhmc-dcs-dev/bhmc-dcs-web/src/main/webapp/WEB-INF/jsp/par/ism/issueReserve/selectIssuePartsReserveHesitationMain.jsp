<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issuePartsReserve -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.partReserveHesitation" /> --%><!-- partReserveHesitation --></h1>
            <div class="btn_right">
                <button class="btn_m btn_init" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.resvTp" /><!-- resvTp --></th>
                    <td>
                        <input id="sResvTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.partsResvDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sPartsResvDocNo" name="sPartsResvDocNo" class="form_input" />
                        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.saId" /><!-- par.lbl.saId --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sSaTp" class="form_comboBox" />
                                <span class="txt_from">-</span>
                            </div>
                            <div class="date_right">
                                <div class="form_search">
                                    <input id="sSaNm" name="sSaNm" class="form_input" />
                                        <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- search --></a>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.resvDt" /><!-- issueRegDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sResvStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sResvEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNo" /><!-- custNo --></th>
                    <td>
                        <div class="form_search">
                            <input type="hidden" id="sCustCd" name="sCustCd" />
                            <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- CustCd Search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- CarNo Search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" class="form_input" />
                                <a href="#" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                    <td>
                        <input type="text" id="sItemNm" class="form_input" />
                    </td>
                    <th></th>
                    <td></td>

                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.partsReserveSub" /><!-- partsReserveSub --></h2>
            <div class="btn_right">
                <button id="btnResvHesite" class="btn_s"><spring:message code="par.btn.partReserveHesitation" /><!-- btnResvHesite --></button>
            </div>
        </div>
        <div class="table_grid">
            <!-- targetResvHeaderGrid -->
            <div id="targetResvHeaderGrid" ></div>
            <!-- targetResvHeaderGrid -->
        </div>
    </section>
<!-- // tab end -->

</section>
<!-- //issueReqMng -->

<!-- script -->
<script>
//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});
//roTpCdGrid Func
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = [];
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//location Array
var locCdList = [];
<c:forEach var="obj" items="${locCdList}">
locCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var locCdMap = [];
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}
//page init Func
function pageInit(){
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
/**
* hyperlink in grid event
*/
$(document).on("click", ".linkRoNo", function(e){
     var thisName = $(this).data("name");
     var grid = $("#targetReqHeaderGrid").data("kendoExtGrid"),
     row = $(e.target).closest("tr");
     // k-state-selected remove all
     grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");
     var dataItem = grid.dataItem(row);
     selectTargetReqHeaderChanged(dataItem);
     // Ro detail tab window open
     window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd, "VIEW-I-10319"); // RO Main
 });

    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            enable:true
            ,click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnResvHesite
        $("#btnResvHesite").kendoButton({
            enable:true
            ,click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        // sResvTp dropdownlist
        $("#sResvTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[{cmmCd:"SR", cmmCdNm:"预约"},{cmmCd:"SR", cmmCdNm:"预留"},{cmmCd:"SR", cmmCdNm:"等待"},{cmmCd:"04", cmmCdNm:"领料"}]
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sSaTp dropdownlist
        $("#sSaTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[{cmmCd:"01", cmmCdNm:"服务顾问"}]
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // resvStartDt datepicker
        $("#sResvStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // resvEndDt datepicker
        $("#sResvEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysEndDate}")
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
        //targetResvHederGrid.
        $("#targetResvHeaderGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            //params["sort"] = options.sort;

                            params["sParGiTp"] = $("#sResvTp").val();                  //sResvTp
                            var sParResvDocNo = $("#sParResvDocNo").val() == "" ? "X" :$("#sParResvDocNo").val();
                            params["sParReqDocNo"] = sParResvDocNo;        //sParResvDocNo.
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();        //sParReqStatCd.
                            params["sReqStartDt"] = $("#sResvStartDt").data("kendoExtMaskedDatePicker").value();     //sReqStartDt
                            params["sReqEndDt"] = $("#sResvEndDt").data("kendoExtMaskedDatePicker").value();         //sReqEndDt
                            params["sCustCd"] = $("#sCustCd").val();                    //sCustCd.
                            params["sCustNm"] = $("#sCustNm").val();                    //sCustNm.
                            params["sSerPrsnId"] = $("#sSerPrsnId").val();              //sSerPrsnId.
                            params["sCarNo"] = $("#sCarNo").val();                      //sCarNo.

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
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,height:403
            ,editable:false
            ,autoBind:false
            ,sortable:false
            ,multiSelectWithCheckbox:true
            ,change:function(e){
            }
            ,dataBound:function(e) {
            }
            ,columns :
                [{field:"regDt", title:"<spring:message code='par.lbl.resvDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.statNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
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
                ,{field:"parGiTp", title:"<spring:message code='par.lbl.resvTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR"://SR
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO"://RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "SA"://SA(Parts Sale)
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.partsResvDocNo'/>", width:130
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoNo'>"+dataItem.resvDocNo+"</a>";
                        return spanObj;
                    }
                } //roDocNo
                ,{field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:100 }//custNm
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{field:"serPrsnId", title:"<spring:message code='par.lbl.saId'/>", width:100 }//serPrsnId
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>"}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", attributes:{"class":"ar"}, width:90}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.readyQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{ title:"" }
            ]
        });
        // targetReqDetailGrid.
        $("#targetReqDetailGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#parReqDocNo").val() == "" ? "X":$("#parReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                if (e.model.parReqStatCd == "02") {
                    if(fieldName=="itemCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }
            }
            ,height:150
            ,pageable:false
            ,sortable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>"
                    ,width:150
                    ,editor:function(container, options){
                        $('<div class="form_search" style="width:100%"><input required data-bind="value:' + options.field + '" class="form_input" readonly style="width:100%"  /><a href="#" onclick="javascript:selectCellPartsMasterPopupWindow(this);"></a></div>').appendTo(container);
                    }
                }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", attributes:{"class":"ar"}, width:90
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"
                            ,spinners:false
                        });
                    }
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.resvDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"receiveId", title:"<spring:message code='par.lbl.reserveCustNm' />", width:80 }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", attributes:{"class":"ar"}, width:120
                    ,editor:function(container, options){
                        var input = $('<input id="strgeCd" name="strgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCd !== "" && giStrgeCd !== null){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", attributes:{"class":"ar"}, width:120
                    ,editor:function(container, options){
                        //location Array
                        var locCdList = [{"locCd":"", "locNm":""}];
                        <c:forEach var="obj" items="${locCdList}">
                        if(options.model.giStrgeCd === "${obj.strgeCd}" && options.model.itemCd === "${obj.itemCd}"){
                            locCdList.push({
                                "locCd":"${obj.locCd}"
                                ,"locNm":"${obj.locNm}"
                            });
                        }
                        </c:forEach>

                        var input = $('<input id="locCd" name="locCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"locNm"
                            ,dataValueField:"locCd"
                            ,valuePrimitive:true
                            ,dataSource:locCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giLocCd !== "" && giLocCd !== null){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.statNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
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

            ]
        });
        //targetPartsReserveGrid
        $("#targetPartsReserveGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#parReqDocNo").val() == "" ? "X":$("#parReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,resvDt:{ type:"date" , validation:{required:true}, editable:false }
                            ,resvStatus:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,custNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,carNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,techNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,readyQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,borrowStatus:{ type:"string" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,height:150
            ,editable:false
            ,pageable:false
            ,sortable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:110 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:120 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"readyQty", title:"<spring:message code='par.lbl.readyQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", width:50 , attributes:{"class":"ar"}}

            ]
        });
    });
</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueReqResvStatus -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <!-- <h1 class="title_basic"></h1> -->
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11705" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnInit" name="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11704" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </dms:access>
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
                    <th scope="row"><spring:message code="par.lbl.vin" /></th>
                    <td>
                        <input id="sVin" name="sVin" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /></th>
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvDocNo" /></th>
                    <td>
                        <input id="sResvDocNo" name="sResvDocNo" class="form_input" />
                        <input type="hidden" id="resvDocNo" name="resvDocNo" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvReqDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvReqStartDt" name="sInvResvReqStartDt" class="form_datepicker" data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvReqEndDt" name="sInvResvReqEndDt" class="form_datepicker" data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- targetReqDetailGrid -->
        <div id="targetReqHeaderResvGrid" ></div>
        <!-- targetReqDetailGrid -->
    </div>

    <div class="table_grid mt10">
        <!-- targetReqDetailGrid -->
        <div id="targetReqDetailResvGrid" class="resizable_grid" ></div>
        <!-- targetReqDetailGrid -->
    </div>

<!-- // tab end -->

</section>
</div>
<!-- //issueReqResvStatus -->
<!-- script -->
<script>
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
//page init Func
function pageInit(){
    var minDate = new Date('1990-01-01'),
        maxDate = new Date('9999-12-31'),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#sCarNo").val("");
    $("#sVin").val("");

    $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value(null);
    $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value(null);



    $("#sResvDocNo").val("");
    $("#resvDocNo").val("");

    selectedIssueReqVO = {};

    $("#targetReqHeaderResvGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqDetailResvGrid").data("kendoExtGrid").dataSource.data([]);
}

$(document).on("click", ".linkPreDocNo", function(e){

    var grid = $("#targetReqHeaderResvGrid").data("kendoExtGrid");
    var row = $(e.target).closest("tr");
    grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");

    var selectedVal = grid.dataItem(row);
    parent._createOrReloadTabMenu("<spring:message code='ser.menu.partResvCreate' />", "<c:url value='/ser/rev/partReservation/selectPartReservationMain.do'/>?parResvDocNo="+selectedVal.resvDocNo, "VIEW-D-10498"); // 부품예약 Main
});

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
            }
        });
        //sInvResvReqStartDt datepicker
        $("#sInvResvReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });
        //sInvResvReqEndDt datepicker
        $("#sInvResvReqEndDt").kendoExtMaskedDatePicker({
           format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        //targetReqHeaderResvGrid.
        $("#targetReqHeaderResvGrid").kendoExtGrid({
            gridId:"G-PAR-0914-133001"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //부품출고헤더 구분 : 부품예약
                            params["sParGiTp"] = "SP";//service parts reserve
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sResvDocNoLike"] = $("#sResvDocNo").val();//sResvDocNo
                            params["sReqStartDt"] = $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value();//sReqStartDt
                            params["sReqEndDt"] = $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value();//sReqEndDt
                            //params["sReadyStatCd"] = "RE01";

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
                            ,preAmt:{ type:"number" }
                            ,parResvRemark:{ type:"string" }
                            ,carlineNm:{ type:"string" }
                            ,modelNm:{ type:"string" }
                            ,carRunDistVal:{ type:"number" }
                            ,giDocNo:{ type:"string" }
                            ,giDocTp:{ type:"string" }
                            ,giDocStatCd:{ type:"string" }
                            ,giStatCd:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,height:250
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column set:default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,dataBound:function(e){
                $("#targetReqDetailResvGrid").data("kendoExtGrid").dataSource.data([]);
            }
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedIssueReqVO = selectedItem;
                    $("#targetReqDetailResvGrid").data("kendoExtGrid").dataSource.read();
                }
            }
            ,columns :
                [{field:"resvDocNo", title:"<spring:message code='par.lbl.invResvDocNo'/>", width:120
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkPreDocNo'>"+dataItem.resvDocNo+"</a>";
                        return spanObj;
                    }
                }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvReqTime'/>", width:120, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.invResvManNm'/>", width:100 }
                ,{field:"preAmt", title:"<spring:message code='ser.lbl.preAmt' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"}//선수금
                ,{field:"parResvRemark", title:"<spring:message code='ser.lbl.partResvRemark' />", width:200}
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}// 방문자
                ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}// 차종명칭
                ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:120}// 모델명칭
                ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"}// 누적주행거리
            ]
        });
        //targetReqDetailResvGrid.
        $("#targetReqDetailResvGrid").kendoExtGrid({
            gridId:"G-PAR-0519-185205"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var resvDocNo = selectedIssueReqVO.resvDocNo == null ? "X" : selectedIssueReqVO.resvDocNo;
                            var parReqDocNo = selectedIssueReqVO.parReqDocNo == null ? "X" : selectedIssueReqVO.parReqDocNo;

                            params["sResvDocNo"] = resvDocNo;
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
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,totStockQty:{ type:"number", editable:false }
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
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:false }
                            ,movingAvgAmt:{ type:"number" , editable:false }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
                ,aggregate:[
                    { field:"reqQty", aggregate:"sum" }
                    ,{ field:"resvQty", aggregate:"sum" }
                    ,{ field:"totStockQty", aggregate:"sum" }
                    ,{ field:"avlbStockQty", aggregate:"sum" }
                    ,{ field:"resvStockQty", aggregate:"sum" }
                    ,{ field:"itemPrc", aggregate:"sum" }
                    ,{ field:"itemAmt", aggregate:"sum" }
                    ,{ field:"movingAvgPrc", aggregate:"sum" }
                    ,{ field:"movingAvgAmt", aggregate:"sum" }
                ]
            }
            ,editable:false
            ,height:250
            ,pageable:false
            ,autoBind:true
            ,filterable:false
            ,appendEmptyColumn:true           //empty column. default:false
            ,multiSelectWithCheckbox:false
            ,editable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:120 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unit' />", width:80}
                ,{field:"reqQty", title:"<spring:message code='par.lbl.resvReqQty' />", width:80
                    , attributes:{"class":"ar"}
                    , aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvReadyActQty' />", width:80
                    , attributes:{"class":"ar"}
                    , aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt' />", width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
            ]
        });

        //gridHeight - if grid has footer
        function gridHeight(){
            var grid = $("#targetReqDetailResvGrid").data("kendoExtGrid");
            var contentHeight = grid.content.height();
            var footerHeight = grid.wrapper.find(".k-grid-footer").height();
            grid.content.height(contentHeight - (footerHeight + 1));
        }
    });

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;
        if(this.value() == null){
            if(id === 'sInvResvReqStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sInvResvReqStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
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

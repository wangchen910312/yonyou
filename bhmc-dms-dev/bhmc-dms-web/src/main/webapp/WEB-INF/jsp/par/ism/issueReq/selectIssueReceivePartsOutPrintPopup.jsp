<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- receivePartsOut popup -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_m" id="btnPrint"><spring:message code="par.btn.receivePrint" /></button>
            </div>
        </div>

        <div class="table_grid">
            <!-- targetReqDetailGrid -->
            <div id="targetReqDetailGrid" ></div>
            <!-- targetReqDetailGrid -->
        </div>
    </section>

    <div class="hidden">
        <input type="hidden" id="sParReqDocNo" name="sParReqDocNo" />
    </div>

    <!-- receivePartsOut popup -->
<!-- script -->
<script>

//tecCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
</c:forEach>
var tecCdMap = {};
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});

$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReceivePartsOutPrintPopupButtonWindow.options.content.data;

    //확인 버튼.
    $("#btnPrint").kendoButton({
        click:function(e){

            var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
            items = grid.dataSource.data(),
            rowCnt = 0,
            itemCnt = 0,
            selectedItems = [];
            //checked list.
            for (i = 0; i < items.length; i++) {
                var item = items[i];
                var elementRow = grid.tbody.find(".checkbox01")[i];

                if(elementRow.checked){
                    rowCnt++;
                    selectedItems.push({"giDocNo":item.giDocNo});
                }

                itemCnt++;

            }

            if(itemCnt == 0){
                // borrow item selected message.
                dms.notification.info("<spring:message code='par.lbl.giEndParts' var='giEndParts' /><spring:message code='par.info.itemInsertNotMsg' arguments='${giEndParts}' />");
                return false;
            }else if(rowCnt == 0){
                // line selected message.
                dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                return false;
            }else{
                options.callbackFunc({ flag:"Y", giDocNoList:selectedItems});
            }
        }
    });

    $("#sParReqDocNo").val(options.parReqDocNo);

    //targetReqDetailGrid.
    $("#targetReqDetailGrid").kendoExtGrid({
        gridId:"G-PAR-0109-152101"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/ism/issueReq/selectPrintIssueReqDetailes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sort"] = options.sort;

                        var parReqDocNo = $("#sParReqDocNo").val() == "" ? "X":$("#sParReqDocNo").val();
                        params["sParReqDocNo"] = parReqDocNo;
                        params["sPartsOutUseYn"] = "Y";
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
                        ,giDt:{ type:"date" , editable:false }
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
        ,height:260
        ,pageable:false
        ,autoBind:true
        ,filterable:false
        ,appendEmptyColumn:true
        ,multiSelectWithCheckbox:false
        ,dataBound:function(e){

            var rows = e.sender.tbody.children(),
                grid = $('#targetReqDetailGrid').data('kendoExtGrid'),
                items = grid.dataSource.data(),
                itemsLen = items.length;

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem != null && dataItem != 'undefined'){
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                }
            });

            if(itemsLen > 0){

                for (i = 0; i < itemsLen; i++) {
                    if(itemsLen === (i + 1)){
                        var dataItem = items[i];
                        dataItem.dirty = true;
                        var elementRow = grid.tbody.find(".checkbox01")[i];
                        elementRow.checked = true;
                        grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                    }
                }
                //$('#targetReqDetailGrid input[type=checkbox][id!=checkAll]').prop("checked", true);
            }

            $(".checkbox01").bind("change", function (e) {
                var row = $(this).closest("tr"),
                checked = $(this).is(':checked');

                var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                dataItem = grid.dataItem(row);
                //check item selectedRowDetailItem
                selectedRowDetailItem = dataItem;

                if(checked){
                    row.addClass("k-state-selected");
                    dataItem.dirty = true;
                }else{
                    row.removeClass("k-state-selected");
                    dataItem.dirty = false;
                }
            });
        }
        ,change:function(e){
            //checkbox checked setting.
            $("tr").find("[type=checkbox]").prop("checked",false);
            $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
        }
        ,columns :
            [{title:"", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                ,template:"<input class='checkbox01' type='checkbox' />"
                ,headerTemplate:"<input id='chkAll' type='checkbox' />"
            }
            ,{field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:120 }
            ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
            ,{field:"receiveId", title:"<spring:message code='par.lbl.receiveId' />", width:80
                ,template:'#if(tecCdMap[receiveId] !== undefined){# #= tecCdMap[receiveId]# #}#'
            }
        ]
    });
    //grid checkbox all
    $("#chkAll").bind('click', function (e){
        var $chkAll = $(this);
        var checked = $chkAll.is(':checked');
        var grid = $('#targetReqDetailGrid').data('kendoExtGrid');
        var items = grid.dataSource.data();

        for (i = 0; i < items.length; i++) {
            var dataItem = items[i];
            dataItem.dirty = checked;

            var elementRow = grid.tbody.find(".checkbox01")[i];
            elementRow.checked = checked;
            if(checked){
                grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
            }else{
                grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
            }
        }
    });

});
</script>
<!-- //script -->
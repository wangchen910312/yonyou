<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectLeaveItemMain -->
<div id="resizableContainer">

<section class="group" id="leaveItemSection">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.leavingParts" /></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11981" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnInit" type="button" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
		<dms:access viewId="VIEW-D-11980" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnNonFlagSet" name="btnNonFlagSet" class="btn_m btn_m_min"><spring:message code="par.btn.nonFlagSet" /></button>
		</dms:access>
		<dms:access viewId="VIEW-D-11979" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnNonFlagCancel" name="btnNonFlagCancel" class="btn_m btn_m_min"><spring:message code="par.btn.nonFlagCancel" /></button>
		</dms:access>
		<dms:access viewId="VIEW-D-11978" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSend" name="btnSend" class="btn_m btn_m_min btn_send"><spring:message code="par.btn.send" /></button>
            <button type="button" id="btnSendAll" name="btnSendAll" class="btn_m btn_m_min btn_send"><spring:message code="par.btn.sendAll" /></button>
		</dms:access>
		<dms:access viewId="VIEW-D-11977" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnInterface" name="btnInterface" class="btn_m btn_m_min btn_link"><spring:message code="par.btn.bmpInterface" /><!-- BMP플랫폼 --></button>
		</dms:access>
		<dms:access viewId="VIEW-D-11976" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave" name="btnSave" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.save" /></button>
		</dms:access>
		<dms:access viewId="VIEW-D-11975" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button>
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
                    <th scope="row"><span class="bu_required"></span><spring:message code="par.lbl.dlrCd" /></th>
                    <td class="required_area">
                        <input id="sDlrCd" class="form_input form_readonly" readonly="readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /></th>
                    <td>
                        <input id="sItemDstinCd" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemBpNm" /></th>
                    <td>
                        <div class="form_search">
                            <input id="sBpNm" type="text" class="form_input" />
                            <input type="hidden" id="sBpCd" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.leaveItemStayTime" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStayDayStart" class="form_comboBox ar" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sStayDayEnd"  class="form_comboBox ar" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carLine" /></th>
                    <td>
                        <input id="sCarlineCd" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.leavePartsYn" /></th>
                    <td>
                        <label class="label_check"><input id="sChkLeavePartsYn" type="checkbox" checked value="Y" /></label>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.price" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPriceStart" class="form_comboBox ar" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPriceEnd" class="form_comboBox ar" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="sItemCd" class="form_input">
                            <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="leavePartsGrid" class="resizable_grid"></div>
        </div>
    </section>
</section>

</div>

<div class="hidden">
    <input type="hidden" id="nonMovingFlag" value="Y"></input>
</div>

<!-- // selectLeaveItemMain -->
<!-- script -->
<script type="text/javascript">

var toDt = "${toDt}",
    frDt = "${frDt}",
    carlineList = [],
    carlineObj = {},
    strgeTpObj = {},
    strgeTpList = [];
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//itemDstinCdMap
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//차종조회
<c:forEach var="obj" items="${carLineList}">
    carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//useYnCdList
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//useYnCdMap
var useYnCdMap = {};
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});

strgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
</c:forEach>

var itemDstinCdList = [];
itemDstinCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
    itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//itemDstinCdMap
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//page init Func
function pageInit(){

    $("#sDlrCd").val("${dlrCd}");
    $("#sItemDstinCd").data("kendoExtDropDownList").value('');
    $("#sCarlineCd").data("kendoExtDropDownList").value('');

    $("#sBpCd").val("");
    $("#sBpNm").val("");

    $("#sStayDayStart").data("kendoExtNumericTextBox").value('');
    $("#sStayDayEnd").data("kendoExtNumericTextBox").value('');
    $("#sPriceStart").data("kendoExtNumericTextBox").value('');
    $("#sPriceEnd").data("kendoExtNumericTextBox").value('');

    $("#sChkLeavePartsYn").prop("checked", true);
    $("#sItemCd").val("");

    $("#leavePartsGrid").data("kendoExtGrid").dataSource.data([]);

}
//supply search popup Func
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code = 'par.title.supplyInfo'/>"   //supplyInfo
        ,width:840
        ,height:400
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
//부품 팝업 열기 함수
function selectPartsMasterPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.partSearch' />"
        ,width:840
        ,height:400
        ,content:{
            url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
            ,data:{
                "type":""
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"itemNm":$("#sItemNm").val()
                ,"callbackFunc":function(data){
                    $("#sItemCd").val(data[0].itemCd);
                    $("#sItemNm").val(data[0].itemNm);
                    searchItemPopupWindow.close();
                }
            }
        }
    });
}

//multiNonMovingFlagSave Func
function multiNonMovingFlagSave(){

    var bChkAll = $("#chkAll").prop("checked");
    var grid = $("#leavePartsGrid").data("kendoExtGrid");

    /*if(bChkAll){//전체체크 처리
        $.ajax({
            url:"<c:url value='/par/cpm/leaveItem/updateLeaveItemsAll.do' />"
            ,data:JSON.stringify({nonMovingFlg : $("#nonMovingFlag").val()})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                grid.dataSource.read();
            }
            ,success:function(jqXHR, textStatus){
                grid.dataSource.read();
                //success
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });

    }else{*/

        if(grid.gridValidation()){
            var multiNonMovingItems = grid.getCUDData("insertList", "updateList", "deleteList");
            if(grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/par/cpm/leaveItem/multiLeaveItems.do' />"
                ,data:JSON.stringify(multiNonMovingItems)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    grid.dataSource.read();
                }
                ,success:function(jqXHR, textStatus){
                    grid.dataSource.read();
                    //success
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }else{
            // input value checked
            dms.notification.warning("<spring:message code='global.info.check.input'/>");
        }
    //}
}

function setNonMovingFlag(vFlag){
    var grid = $("#leavePartsGrid").data("kendoExtGrid"),
    items = grid.dataSource.data(),
    rowCheckCnt = 0;

    //checked list.
    for (i = 0; i < items.length; i++) {
        var dataItem = items[i];
        var elementRow = grid.tbody.find(".checkbox01")[i];

        if(elementRow.checked){
            dataItem.nonMovingFlg = vFlag;
            dataItem.dirty = true;

            rowCheckCnt++;
        }
    }

    if(rowCheckCnt === 0){
        //line check
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }else{

        $("#nonMovingFlag").val(vFlag);
        grid.refresh();
    }
}

$(document).ready(function() {

    $("#sDlrCd").val("${dlrCd}");
    $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

    //btnNonFlagSet
    $("#btnNonFlagSet").kendoButton({
        click:function(e){
            setNonMovingFlag("Y");
        }
    });
    //btnNonFlagCancel
    $("#btnNonFlagCancel").kendoButton({
        click:function(e){
            setNonMovingFlag("N");
        }
    });

    //btnSend
    $("#btnSend").kendoButton({
        click:function(e){
            //send Func call

            var grid = $("#leavePartsGrid").data("kendoExtGrid"),
            rows = grid.select(),
            dataItems = [ ],
            issueReqItemCheckCnt = 0;

            //checked list
            $.each(rows, function(idx, row){
                var item = grid.dataItem(row);
                dataItems.push(item);
            });

            if(rows.length == 0){
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            if(dataItems.length == 0){
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            var multiLeaveItemVOList = dataItems;

            var leaveItemSendVO = {
                "list":multiLeaveItemVOList
                ,"sendAllFlag":"N"
            }

            $.ajax({
                url:"<c:url value='/par/cpm/leaveItem/multiLeaveItemsSend.do' />"
                ,data:JSON.stringify(leaveItemSendVO)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.loading.hide($("#leaveItemSection"));
                    if(dms.string.isEmpty(jqXHR.responseJSON)){
                        dms.notification.error("<spring:message code='par.lbl.leaveParts' var='leaveParts' /><spring:message code='global.err.sendFailedParam' arguments='${leaveParts}'/>");
                    }else{
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }
                ,success:function(jqXHR, textStatus){
                    //success message
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
                ,beforeSend:function(){
                    dms.loading.show($("#leaveItemSection"));
                }
                ,complete:function(){
                    dms.loading.hide($("#leaveItemSection"));
                }
            });
        }
    });
    //btnSendAll
    $("#btnSendAll").kendoButton({
        click:function(e){
            //send All Func call
            var leaveItemSendVO = {
                "list":[]
                ,"sendAllFlag":"Y"
            }

            $.ajax({
                url:"<c:url value='/par/cpm/leaveItem/multiLeaveItemsSendAll.do' />"
                ,data:JSON.stringify(leaveItemSendVO)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.loading.hide($("#leaveItemSection"));
                    if(dms.string.isEmpty(jqXHR.responseJSON)){
                        dms.notification.error("<spring:message code='par.lbl.leaveParts' var='leaveParts' /><spring:message code='global.err.sendFailedParam' arguments='${leaveParts}'/>");
                    }else{
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                }
                ,success:function(jqXHR, textStatus){
                    //success message
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
                ,beforeSend:function(){
                    dms.loading.show($("#leaveItemSection"));
                }
                ,complete:function(){
                    dms.loading.hide($("#leaveItemSection"));
                }
            });
        }
    });
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call
            pageInit();
        }
    });
    //btnInterface
    $("#btnInterface").kendoButton({
        click:function(e) {
            //window.open("http://svrdev.bmpcn.com", "_blank");
            window.open("http://svr.bmpcn.com", "_blank");
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#leavePartsGrid").data("kendoExtGrid").dataSource.read();
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            multiNonMovingFlagSave();
        }
    });
    //sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
        dataSource:itemDstinCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,autoBind:true
    });
    //sCarlineCd
    $("#sCarlineCd").kendoExtDropDownList({
        dataSource:carlineList
        ,dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    //sStayDayStart
    $("#sStayDayStart").kendoExtNumericTextBox({
        format:"n0"
        ,spinners:false
    });
    //sStayDayEnd
    $("#sStayDayEnd").kendoExtNumericTextBox({
        format:"n0"
        ,spinners:false
    });
    //sPriceStart
    $("#sPriceStart").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,spinners:false
    });
    //sPriceEnd
    $("#sPriceEnd").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,spinners:false
    });
    //leavePartsGrid
    $("#leavePartsGrid").kendoExtGrid({
        gridId:"G-PAR-0808-150801"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/leaveItem/selectLeaveItems.do' />"
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
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sBpCd"] = $("#sBpCd").val();
                        params["sBpNm"] = $("#sBpNm").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();
                        params["sCarlineCd"] = $("#sCarlineCd").val();
                        params["sNonMovingFlg"] = $("#sChkLeavePartsYn").prop("checked") == true ? "Y":"N"
                        params["sStayDayStart"] = $("#sStayDayStart").data("kendoExtNumericTextBox").value();
                        params["sStayDayEnd"] = $("#sStayDayEnd").data("kendoExtNumericTextBox").value();
                        params["sPurcPrcStart"] = $("#sPriceStart").data("kendoExtNumericTextBox").value();
                        params["sPurcPrcEnd"] = $("#sPriceEnd").data("kendoExtNumericTextBox").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        dlrCd:{ type:"string" , editable:false }
                        ,rnum:{ type:"number" , editable:false }
                        ,itemCd:{ type:"string" , editable:false }
                        ,itemNm:{ type:"string" , editable:false }
                        ,itemDstinCd:{ type:"string" , editable:false }
                        ,leavePart:{ type:"string" , editable:false }
                        ,nonMovingItemCd:{ type:"string" }
                        ,nonMovingFlg:{ type:"string" , editable:true }
                        ,carlineCd:{ type:"string" , editable:false }
                        ,bpCd:{ type:"string" , editable:false }
                        ,bpNm:{ type:"string" , editable:false }
                        ,carLine:{ type:"string" , editable:false }
                        ,strgeCd:{ type:"string" , editable:false }
                        ,strgeCdList:{ type:"string" , editable:false }
                        ,stockGiPrc:{ type:"number" , editable:false }
                        ,purcPrc:{ type:"number" , editable:false }
                        ,stayDt:{ type:"date" , editable:false }
                        ,stayDay:{ type:"number" , editable:false }
                        ,lastGrDt:{ type:"date" , editable:false }
                        ,lastGiDt:{ type:"date" , editable:false }
                        ,avlbStockQty:{ type:"number" , editable:false }
                        ,stockAmt:{ type:"number" , editable:false }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
        }
        ,multiSelectWithCheckbox:false
        ,selectable:"row"
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true//empty column. default:false
        ,indvColumnRows:5
        ,change:function(e){
            //checkbox checked setting.
            this.table.find("tr").find("[type=checkbox]").prop("checked",false);
            this.table.find("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
        }
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem != null && dataItem != 'undefined'){
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    var elementRow = e.sender.tbody.find(".checkbox01")[idx];

                    //update row reselect.
                    if(dataItem.dirty){
                        var elementRow = e.sender.tbody.find(".checkbox01")[idx];
                        elementRow.checked = true;
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                    }
                }
            });

            $(".checkbox01").bind("change", function (e) {
                var row = $(this).closest("tr"),
                checked = $(this).is(':checked'),
                grid = $("#leavePartsGrid").data("kendoExtGrid"),
                dataItem = grid.dataSource.view()[row.index()];

                if(checked){
                    row.addClass("k-state-selected");
                    dataItem.dirty = true;
                }else{
                    row.removeClass("k-state-selected");
                    dataItem.dirty = false;
                }

            });
        }
        ,columns:[
            {title:"", width:40 ,_field:"_checkAll" ,attributes:{"class":"ac"}
                ,template:"<input class='checkbox01' type='checkbox' />"
                ,headerTemplate:"<input id='chkAll' type='checkbox' />"
            }
            ,{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:120 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", width:80
                ,template:'#if(itemDstinCdMap[itemDstinCd] != undefined){# #= itemDstinCdMap[itemDstinCd]# #}#'
            }
            /* ,{field:"nonMovingItemCd", title:"<spring:message code='par.lbl.leaveParts' />", width:120 } */
            ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:80 }
            ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLineNm' />", width:100
                ,template:'#= changeCarlineCd(carlineCd)#'
            }
            ,{field:"stockGiPrc", title:"<spring:message code='par.lbl.stockGiPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}
            ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcBasePrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}
            ,{field:"lastGrDt", title:"<spring:message code='par.lbl.lastGrDt' />", width:90, format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"lastGiDt", title:"<spring:message code='par.lbl.lastGiDt' />", width:90, format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"stayDay", title:"<spring:message code='par.lbl.leaveItemStayTime' />", width:80 , attributes:{"class":"ar"}
                ,template:'#= stayDay # <spring:message code="par.lbl.leaveItemStayDay" />'
            }
            ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.stockQty' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}
            ,{field:"stockAmt", title:"<spring:message code='par.lbl.salePrice' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}
            ,{field:"nonMovingFlg", title:"<spring:message code='par.lbl.nonMovingFlag' />", width:80, attributes:{"class":"ac bg_white"}
                ,editor:function(container, options){
                    var input = $('<input id="nonMovingFlg" name="nonMovingFlg" data-bind="value:' + options.field + '"  />')
                    .appendTo(container);

                    input.kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:useYnCdList
                        ,change:function(){
                        }
                    }).appendTo(container);
                }
                ,template:'#if(useYnCdMap[nonMovingFlg] !== undefined){# #= useYnCdMap[nonMovingFlg]# #}#'
            }
            ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.strgeNm' />" ,attributes:{"class":"ac"}, width:120
                ,template:'#= changeStrgeCd(strgeCd)#'
                ,hidden:true
            }//창고
            ,{field:"strgeCdList" ,title:"<spring:message code='par.lbl.strge' />" ,width:150
            }//입고창고
        ]
    });

    //grid checkbox all
    $("#chkAll").bind('click', function (e){
        var $chkAll = $(this);
        var checked = $chkAll.is(':checked');
        var grid = $('#leavePartsGrid').data('kendoExtGrid');
        var items = grid.dataSource.data();

        for (i = 0; i < items.length; i++) {
            var dataItem = items[i];

            var elementRow = grid.tbody.find(".checkbox01")[i];
            elementRow.checked = checked;
            dataItem.dirty = checked;
            if(checked){
                grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
            }else{
                grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
            }

        }
    });

    //창고
    changeStrgeCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = strgeTpObj[val];
        }
        return returnVal;
    };
    //changeCarlineCd Func
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(carlineObj[val] != undefined){
                returnVal = carlineObj[val];
            }
        }
        return returnVal;
    };

});


</script>
<!-- //script -->
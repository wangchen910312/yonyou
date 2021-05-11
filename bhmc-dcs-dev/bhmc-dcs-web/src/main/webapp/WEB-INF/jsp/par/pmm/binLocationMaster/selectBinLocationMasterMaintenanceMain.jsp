<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- location Maintenance -->
<section class="group">

    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.partLocItemMgr" /> --%><!-- partLocItemMgr --></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.strge" /><!-- strge --></span></th>
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.type" /><!-- 유형 --></span></th>
                    <td>
                        <input id="sLocCond" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                    <td>
                        <input id="sCarlineCd" data-type="combo" class="form_comboBox">
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
                    <th scope="row"><spring:message code="par.lbl.itemTpCd" /><!-- 품목분류 --></th>
                    <td>
                        <input id="sItemDstinCd" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.locId" /><!-- locId --></th>
                    <td>
                        <input id="sLocCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.statNm" /><!-- statNm --></th>
                    <td>
                        <input id="sLocStatus" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sortOrder" /><!-- ortOrder --></th>
                    <td>
                        <input class="i_radio" id="sortTp1" name="sortTp" type="radio" value="Y" checked="checked">
                            <label for="sortTp1"><spring:message code="par.lbl.locId" /><!-- locId --></label>
                        <input class="i_radio" id="sortTp2" name="sortTp" type="radio" value="N" >
                            <label for="sortTp2"><spring:message code="par.lbl.part" /><!-- part --></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.locList" /><!-- locList --></h2>
        </div>
        <div class="table_grid">
            <div id="grid" ></div>
        </div>
    </section>

</section>
<!-- location Maintenance -->

<!-- script -->
<script >
//giStrgeCdList
var giStrgeCdList = [],
    strgeTpObj    = {};
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>
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
var carlineCdList          = [],
    carlineCdObj           = {},
    itemDstinCdList        = [],
    itemDstinCdObj         = {};

carlineCdList.push({cmmCd:"", cmmCdNm:" "});
<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

itemDstinCdList.push({cmmCd:"", cmmCdNm:" "});
<c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
    itemDstinCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//locStatusDs
// TODO [InBoShim] common code changed
var locStatusDs = [];
<c:forEach var="obj" items="${locStatusDs}">
locStatusDs.push({
    "usrCd":"${obj.usrCd}"
    ,"usrNm":"${obj.usrNm}"
});
</c:forEach>

var sLocCondList = [];
    sLocCondList.push({"cmmCd":"01", "cmmCdNm":'货位  =  " "'});
    sLocCondList.push({"cmmCd":"02", "cmmCdNm":'货位  <> " "'});
//sLocCond

//member
var selectedLocId = null;
var selectedLvlId = 0;
var selectedLocCd = "";
selectedUpperLocId = "";
var selectedItemCd = "";
var selectedMainLocYn = "N";
//page init Func
function pageInit(){
    selectedLocId = null;
    selectedLvlId = 0;
    selectedLocCd = "";
    selectedUpperLocId = "";
    selectedItemCd = "";
    selectedMainLocYn = "N";
}
//item search popup
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(e){
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
                        var bCheck = false;
                        var grid = $('#grid').data('kendoExtGrid');
                        var dataItemList = grid.dataSource._data;

                        var rows = grid.tbody.find("tr");
                        rows.each(function(index, row) {
                            var dataItem = grid.dataSource._data;

                            for(var i = 0;i < dataItemList.length ;i++){
                                if(dataItemList[i].itemCd !== "" && dataItemList[i].itemCd == data[0].itemCd){
                                    bCheck = true;
                                    break;
                                }
                            }

                            if($(this).hasClass("k-state-selected")){
                                if(!bCheck){
                                    dataItem[index].itemCd = data[0].itemCd;
                                }
                            }
                        });
                        grid.refresh();
                    }
                }
            }
        }
    });
}

$(document).ready(function() {
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            //strgeCd value check
            if($("#sStrgeCd").val() != ""){
                pageInit();
                $('#grid').data('kendoExtGrid').dataSource.read();

            }else{
                //strge select messgae
                dms.notification.info("<spring:message code='par.lbl.strge' var='strge' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strge}' />");
            }
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

            if(grid.gridValidation()){
                var multiBinLocationMasters = grid.getCUDData("insertList", "updateList", "deleteList");
                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/binLocationMaster/multiBinLocationMasterPartsItems.do' />"
                    ,data:JSON.stringify(multiBinLocationMasters)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();
                        //success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //input value check message
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });
    //sStrgeCd
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:true
        ,index:6
        ,change:function(){

            var searchVO = {sStrgeCd:this.dataItem().strgeCd , sMainLocYn:"N", sLastLvlYn:"Y" }

            $.ajax({
                url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasters.do' />"
                ,data:JSON.stringify(searchVO)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                }
            });
        }
    });
    //sLocCd
    $("#sLocCd").kendoExtDropDownList({
        dataTextField:"locNm"
        ,dataValueField:"locCd"
        ,autoBind:false
        ,optionLabel:" "
        ,index:0
    });

    //유형(Loc 조건)
    $("#sLocCond").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:sLocCondList
        ,optionLabel:" "
        ,index:0
    });

    //차형
    $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,index:0
    });

    //sLocStatus
    $("#sLocStatus").kendoExtDropDownList({
        dataTextField:"usrNm"
        ,dataValueField:"usrCd"
        ,dataSource:locStatusDs
        ,optionLabel:" "
        ,autoBind:false
        ,index:0
    });

    //품목구분선택
    $("#sItemDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,index:0
    });
    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterItems.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStrgeCd"] = $("#sStrgeCd").val();
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sLocCond"] = $("#sLocCond").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"locId"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,locId:{ type:"string" , validation:{required:true}, editable:true }
                        ,pltCd:{ type:"string" , validation:{required:true} }
                        ,strgeCd:{ type:"string" , validation:{required:true}}
                        ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,lvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,locCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,dbLocCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,locNm:{ type:"string" , validation:{required:true}, editable:true }
                        ,upperLocId:{ type:"string", editable:true }
                        ,itemCd:{ type:"string", editable:false }
                        ,itemNm:{ type:"string", editable:false }
                        ,upperLvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,dbYn:{ type:"string" , defaultValue:"N" }
                        ,lgthCnt:{ type:"number" }
                        ,cdTp:{ type:"string" }
                        ,carlineCd:{ type:"string", editable:false }
                        ,itemDstinCd:{ type:"string", editable:false }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
        }
        ,autoBind:false
        ,selectable:"multiple, row"
        ,sortable:false
        ,multiSelectWithCheckbox:false
        ,columns:[
            { field:"grStrgeCd", title:"<spring:message code='par.lbl.strgeCd' />", width:100, template:'#= changeStrgeCd(grStrgeCd)#'} //입고창고
            ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:150}  //부품번호
            ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200}//부품명
            ,{ field:"locCd", title:"<spring:message code='par.lbl.locId'/>",  width:150, hidden:true}//locCd
            ,{ field:"upperLocId", title:"<spring:message code='par.lbl.locationCd'/>"
                ,width:150
                ,headerAttributes:{ "colspan":"2" }
                ,editor:function(container, options){

                    var locCdList = [];
                    <c:forEach var="obj" items="${locCdList}">
                    if(options.model.grStrgeCd === "${obj.strgeCd}"){
                        locCdList.push({
                            "locCd":"${obj.locCd}"
                            ,"locNm":"${obj.locNm}"
                        });
                    }
                    </c:forEach>

                    var input = $('<input id="upperLocId" name="upperLocId" data-bind="value:' + options.field + '"  />')
                    .appendTo(container);

                    input.kendoExtDropDownList({
                        dataTextField:"locCd"
                        ,dataValueField:"locCd"
                        ,valuePrimitive:true
                        ,dataSource:locCdList
                    }).appendTo(container);
                }
            }//upperLocId
            ,{ field:"locId", title:"", width:100, headerAttributes:{ "style":"display:none" }
                ,editor:function(container, options){
                    var strAlpaCdTp = "L";
                    var strAllCdTp = "C";
                    var strMask = "";
                    var iLgthCnt = options.model.lgthCnt;
                    var cdTp = options.model.cdTp;

                    if(cdTp == "N"){
                        strCdTp = "0";
                    }else if(cdTp == "U" || cdTp == "L"){
                        strCdTp = strAlpaCdTp;
                    }else{
                        strCdTp = strAllCdTp;
                    }

                    for(var i = 0; i < iLgthCnt;i++){
                        strMask += strCdTp;
                    }

                    $('<input required name="locId" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:strMask
                        ,promptChar:" "
                        ,change:function(){
                            var grid = $("#grid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vUpplerLocId = model.get("upperLocId");
                            model.set("locCd", vUpplerLocId+"-"+this.value());
                        }
                    })
                    .bind("keyup", function(){
                        var that = $(this).data("kendoMaskedTextBox");
                        if (cdTp == "U") {
                            this.value = that.raw().toUpperCase();
                        } else if (cdTp == "L") {
                            this.value = that.raw().toLowerCase();
                        } else {
                            this.value = that.raw();
                        }
                    });
                }
            }//locId
            ,{ field:"locNm", title:"<spring:message code='par.lbl.locNm'/>", width:80
                ,editor:function(container, options){
                    $('<input required data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength="10"  />').appendTo(container);
                }
            }//locNm
            ,{ field:"itemDstinCd",  title:"<spring:message code='par.lbl.itemTpCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:120 }                //품목구분
            ,{ field:"carlineCd",    title:"<spring:message code='par.lbl.carLine' />", template:'#= changeCarlineCd(carlineCd)#', width:120 }
            ,{ title:""}
        ]
    });

    // 차형
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = carlineCdObj[val];
        }
        return returnVal;
    };

    //  품목구분
    changeItemDstinCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemDstinCdObj[val];
        }
        return returnVal;
    };

    // 창고
    changeStrgeCd = function(val){
        console.log('changeStrgeCd:', strgeTpObj, val);
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = strgeTpObj[val];
        }
        console.log('returnVal:', returnVal);
        return returnVal;
    };

});
</script>
<!-- //script -->


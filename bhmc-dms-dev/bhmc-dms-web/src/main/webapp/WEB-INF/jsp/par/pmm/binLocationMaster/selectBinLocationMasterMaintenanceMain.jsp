<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<!-- location Maintenance -->
<section class="group">

    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.partLocItemMgr" /></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11538" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11537" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.fix" /></button><!--btnSave  -->
        </dms:access>
        <dms:access viewId="VIEW-D-11536" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.strge" /><!-- strge --></th>
                    <td>
                        <input type="text" id="sStrgeCd" type="text" data-type="multicombo" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sLocationCd" /><!-- locId --></th>
                    <td>
                        <input id="sLocCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                    <td>
                        <input id="sCarlineCd" data-type="combo" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.model" /><!-- 차형 --></th>
                    <td>
                        <input id="sModelCd" name="sModelCd" type="text" class="form_comboBox">
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
                        <input id="sItemNm" type="text" id="sItemNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemTpCd" /><!-- 품목분류 --></th>
                    <td>
                        <input id="sItemDstinCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.strgeTp' /><!-- 창고유형 --></th>
                    <td>
                        <input id="sStrgeTp" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>

</section>
<!-- location Maintenance -->
</div>
<!-- script -->
<script >
var giStrgeCdList = [],
    giStrgeCdObj = {},
    strgeTpList = [],
    strgeTpObj= {},
    searchStorageCdList = [],
    carlineCdList = [],
    carlineCdObj = {},
    itemDstinCdList = [],
    itemDstinCdObj = {},
    modelCdList = [],
    modelCdObj = {},
    giLocCdList = [],
    giTwoLocCdList = [], //창고하위 최종 로케이션 정보.
    giTwoLocCdMap = {},
    giLocCdObj = {},
    giStrgeLocCdObj = {};

//giStrgeCdList
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
giStrgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>
//strgeTpList
<c:forEach var="obj" items="${strgeTpList}">
strgeTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
strgeTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//창고 선택
searchStorageCdList.push({"cmmCd":" ", "cmmCdNm":"<spring:message code='par.lbl.checkClearAll' />", "useYn":""});
<c:forEach var="obj" items="${giStrgeCdList}" varStatus="status"> //key value
    searchStorageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
</c:forEach>

//carlineCdList
<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>
//modelCdList
<c:forEach var="obj" items="${modelCdList}">
if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}else{
    modelCdObj["${obj.carlineCd}"] = [];
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}
</c:forEach>
//itemDstinCdList
<c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
    if("${obj.useYn}" !== 'N'){
        itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

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
        ,width : 840
        ,height: 400
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
            //search area init
            $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").refresh();
            $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value([]);
            $("#sLocCd").val("");
            $("#sCarlineCd").data("kendoExtDropDownList").select(0);
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sItemCd").val("");
            $("#sItemNm").val("");
            $("#sItemDstinCd").data("kendoExtDropDownList").select(0);
            $("#sStrgeTp").data("kendoExtDropDownList").select(0);

            $("#grid").data("kendoExtGrid").cancelChanges();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){

            var params = {},
                sStrgeCdLst = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();


            if(dms.string.isEmpty(sStrgeCdLst[0])){

                sStrgeCdLst.splice(0,1);
            }

            if(sStrgeCdLst.length === 0){
                for(var i = 0; i < searchStorageCdList.length; i = i + 1){
                    sStrgeCdLst.push(searchStorageCdList[i].cmmCd);
                }
            }

            $.ajax({
                url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterComboLists.do' />"
                ,data:JSON.stringify({ sStrgeCdList:sStrgeCdLst })
                ,type:"POST"
                ,dataType:"json"
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //level check error message
                    dms.notification.info("<spring:message code='par.lbl.locLvl' var='locLvl' /><spring:message code='global.info.locLvlCheckMsg' arguments='${locLvl}' />");
                }
                ,success:function(jqXHR, textStatus){

                    //로케이션 정보 초기화.
                    giTwoLocCdList = [],
                    giTwoLocCdMap = [];
                    giStrgeLocCdObj = {};

                    giTwoLocCdList.push({"locCd":" ","locNm":" "});
                    $.each(jqXHR, function(idx, row){
                      //창고하위 로케이션 정보 넣기.
                      giTwoLocCdList.push({
                          "locCd":row.locCd
                          ,"locNm":row.locNm
                      });

                      if(giStrgeLocCdObj.hasOwnProperty(row.strgeCd)){
                          giStrgeLocCdObj[row.strgeCd].push({locCd:row.locCd, locNm:row.locNm});
                          giTwoLocCdMap[row.strgeCd][row.locCd] = row.locNm;
                      }else{
                          giStrgeLocCdObj[row.strgeCd] = [];
                          giStrgeLocCdObj[row.strgeCd].push({locCd:" ", locNm:" "});
                          giStrgeLocCdObj[row.strgeCd].push({locCd:row.locCd, locNm:row.locNm});

                          giTwoLocCdMap[row.strgeCd] = {};
                          giTwoLocCdMap[row.strgeCd][row.locCd] = row.locNm;
                      }
                    });

                    pageInit();
                    $("#grid").data("kendoExtGrid").dataSource.read();

                }
            });
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

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
                    grid.dataSource.read();
                    //success message
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").cancelChanges();
        }
    });

    //조회조건-창고선택
    $("#sStrgeCd").kendoExtMultiSelectDropDownList({
        dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:searchStorageCdList
        ,index:0
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectStrgeCd = e.dataItem.cmmCd;

            if(dms.string.isEmpty(selectStrgeCd)){
                $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value([]);
            }
        }
    });
    //sStrgeCd onchange event
    $("#sStrgeCd").on("change", function (){
    });
    //차형
    $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });
    //sCarlineCd onchange event
    $("#sCarlineCd").on("change", function (){
        $("#sModelCd").data("kendoExtDropDownList").setDataSource(modelCdObj[$(this).data("kendoExtDropDownList").value()]);
    });
    //(차형:검색)
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,optionLabelTemplate:'<span style="font-style:italic"><spring:message code="par.info.carlineSelectMsg"/></span>'
        ,dataSource:[]
        ,index:0
    });
    //부품유형
    $("#sItemDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,optionLabel:" "
        ,index:0
    });
    //창고유형
    $("#sStrgeTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:strgeTpList
        ,optionLabel:" "
        ,index:0
    });
    //grid
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0726-172710"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterItems.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        var sStrgeCdLst = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();

                        if(dms.string.isEmpty(sStrgeCdLst[0])){
                            sStrgeCdLst.splice(0,1);
                        }

                        params["sStrgeCdList"] = sStrgeCdLst;
                        params["sLocCd"] = $("#sLocCd").val();
                        params["sStrgeTp"] = $("#sStrgeTp").val();
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();
                        params["sCarlineCd"] = $("#sCarlineCd").val();
                        params["sCarlineCd2"] = $("#sModelCd").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,locId:{ type:"string" , validation:{required:true}, editable:true }
                        ,pltCd:{ type:"string" , validation:{required:true} }
                        ,strgeCd:{ type:"string" , validation:{required:true}}
                        ,strgeTp:{ type:"string" , validation:{required:true}, editable:false }
                        ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,lvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,locCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,dbLocCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,locNm:{ type:"string"}
                        ,upperLocId:{ type:"string", editable:true }
                        ,itemCd:{ type:"string", editable:false }
                        ,itemNm:{ type:"string", editable:false }
                        ,upperLvlId:{ type:"number" , validation:{required:true}, editable:false }
                        ,dbYn:{ type:"string" , defaultValue:"N" }
                        ,lgthCnt:{ type:"number" }
                        ,cdTp:{ type:"string" }
                        ,carlineCd:{ type:"string", editable:false }
                        ,carlineCd2:{ type:"string", editable:false }
                        ,itemDstinCd:{ type:"string", editable:false }
                        ,locCdMig:{ type:"string"}
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){
            var eles = e.container.find("input"),
                grid = this,
                fieldName = grid.columns[e.container.index()].field;

            if(fieldName === "locNm"){
                this.closeCell();
            }
        }
        ,autoBind:false
        ,selectable:"row"
        ,multiSelectWithCheckbox:false
        ,appendEmptyColumn:true   //empty column. default:false
        ,height:480
        ,filterable:false
        ,indvColumnRows:3
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);

                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){

                    var upperLocId = row.children().eq(7);
                    var locCdMig = row.children().eq(10);

                    //update row reselect.
                    if(dataItem.dirty){
                        var elementRow = e.sender.tbody.find(".checkbox")[idx];
                        elementRow.checked = true;
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                    }else{
                        upperLocId.addClass("bg_white");
                        locCdMig.addClass("bg_white");
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                }

            });
        }
        ,columns:[
            {field:"grStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:150
                ,template:'#if(changeGiStrgeCd(grStrgeCd) != undefined){# #= changeGiStrgeCd(grStrgeCd)# #}#'
            }//창고명칭
            ,{ field:"strgeTp", title:"<spring:message code='par.lbl.strgeTp' />", width:100
                ,template:'#if(changeStrgeTp(strgeTp) != undefined){# #= changeStrgeTp(strgeTp)# #}#'
            }//창고유형
            ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:150}  //부품번호
            ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200}//부품명
            ,{ field:"itemDstinCd",title:"<spring:message code='par.lbl.itemTpCd' />", width:120
                ,template:'#if(changeItemDstinCd(itemDstinCd) != undefined){# #= changeItemDstinCd(itemDstinCd)# #}#'
            }
            ,{ field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />", width:120
                ,template:'#if(changeCarlineCd(carlineCd) != undefined){# #= changeCarlineCd(carlineCd)# #}#'
            }
            ,{ field:"carlineCd2", title:"<spring:message code='par.lbl.model' />", width:120
                ,template:'#if(changeCarlineCd2(carlineCd2) != undefined){# #= changeCarlineCd2(carlineCd2)# #}#'
            }
            ,{ field:"locCd", title:"<spring:message code='par.lbl.locationCd'/>"
                ,width:140
                //,headerAttributes:{ "colspan":"2" }
                ,editor:function(container, options){

                    var input = $('<input name="upperLocId" data-bind="value:' + options.field + '"  />')
                    .appendTo(container);

                    var strgeCd    = options.model.grStrgeCd;

                    input.kendoExtDropDownList({
                        dataTextField:"locCd"
                        ,dataValueField:"locCd"
                        ,valuePrimitive:true
                        ,dataSource:giStrgeLocCdObj[strgeCd]
                        ,change : function(){

                            var grid = $("#grid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vLocId = this.value();
                            var vLocNm = giTwoLocCdMap[strgeCd][this.value()];
                            model.set("locId", vLocId);
                            model.set("locNm", vLocNm);

                        }
                    }).appendTo(container);
                }
            }//upperLocId
            ,{ field:"locId", title:"<spring:message code='par.lbl.locationLvl'/>", width:100
                ,hidden : true
            }//locId
            ,{ field:"locNm", title:"<spring:message code='par.lbl.locNm'/>", width:200
                ,editor:function(container, options){
                    $('<input name="locNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "20"   />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:"CCCCCCCCCCCCCCCCCCCC"
                        ,promptChar:" "
                        ,change:function(){
                            var grid = $("#grid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));
                            var vUpplerLocId = model.get("upperLocId");
                            model.set("locCd", vUpplerLocId+"-"+this.value());
                            model.set("locId", this.value());
                        }
                    })
                    .bind("keyup", function(){
                        var that = $(this).data("kendoMaskedTextBox");
                        this.value = that.raw().toUpperCase();
                    });
                }
            }//locNm
            ,{ field:"locCdMig", title:"<spring:message code='par.lbl.locationCd'/> 2", width:200
                ,editor:function(container, options){
                    $('<input name="locNm" data-bind="value:' + options.field + '" class="form_input" style="width:100%" maxlength = "50" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                    });
                }
            }//locCdMig
        ]
    });
    //changeCarlineCd Func
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = carlineCdObj[val];
        }
        return returnVal;
    };
    //changeCarlineCd2 Func(Model)
    changeCarlineCd2 = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = modelCdObj[val];
        }
        return returnVal;
    };
    //changeItemDstinCd Func
    changeItemDstinCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemDstinCdObj[val];
        }
        return returnVal;
    };
    //changeGiStrgeCd Func
    changeGiStrgeCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = giStrgeCdObj[val];
        }
        return returnVal;
    };
    //changeStrgeTp Func
    changeStrgeTp = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = strgeTpObj[val];
        }
        return returnVal;
    };

});
</script>
<!-- //script -->


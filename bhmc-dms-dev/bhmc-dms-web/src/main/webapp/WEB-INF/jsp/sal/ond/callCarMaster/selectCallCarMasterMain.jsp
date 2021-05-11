<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.callCarSpecMaster" /></h1>
        <div class="btn_right">

            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.new" /></button>
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>

<%--             <dms:access viewId="VIEW-D-12923" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12924" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.new" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12925" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            </dms:access> --%>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->


    <!-- 조회 조건 시작 -->
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
                    <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                    <td>
                        <input id="sDlrCd" type="text" value="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.carLine" /></th>
                    <td>
                        <input id="sCarlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.useYn" /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
</div>

<script type="text/javascript">

var carLineCdList = [];
var carLineCdObj = {};

<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//그리드 모델 콤보 DataSource
var modelCdList = [];
var modelCdObj = {};

// 그리드 OCN 콤보 DataSource
var ocnCdList = [];
var ocnCdObj = {};

// 그리드 외장색 콤보 DataSource
var extColorCdList = [];
var extColorCdObj = {};

// 그리드 내장색 콤보 DataSource
var intColorCdList = [];
var intColorCdObj = {};

var userYn = [];
userYn["Y"] = "Y";
userYn["N"] = "N";

$(document).ready(function() {

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
    });

    // 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "dlrCd":""
                ,"carlineCd":""
                ,"carlineNm":""
                ,"modelCd":""
                ,"modelNm":""
                ,"ocnCd":""
                ,"ocnNm":""
                ,"extColorCd":""
                ,"extColorNm":""
                ,"intColorCd":""
                ,"intColorNm":""
                ,"useYn":"Y"
             });

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr:eq(0)").closest('tr');
            rows.addClass("k-state-selected");
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/sal/ond/callCarMaster/multiCallCarMaster.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ond/callCarMaster/selectCallCarMaster.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();                                      // 딜러
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();  // 차종
                        params["sUseYn"] = $("#sUseYn").data("kendoExtDropDownList").value();          // 사용여부

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                        rnum:{type:"number"}
                        ,dlrCd:{type:"string", validation:{required:true}}
                        ,carlineCd:{type:"string", validation:{required:true}}
                        ,carlineNm:{type:"string"}
                        ,modelCd:{type:"string", validation:{required:true}}
                        ,modelNm:{type:"string"}
                        ,ocnCd:{type:"string", validation:{required:true}}
                        ,ocnNm:{type:"string"}
                        ,gradeCd:{type:"string"}
                        ,extColorCd:{type:"string", validation:{required:true}}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string", validation:{required:true}}
                        ,intColorNm:{type:"string"}
                        ,useYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,editable:true
        ,selectable:"row"
        ,indvColumnVisible:true
        ,indvColumnReorderable:true
        ,enableTooltip:true
        ,sortable:false
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

            if(fieldName == "carlineCd"){
                if(carlineCdList == null || carlineCdList.length == 0) {
                    this.closeCell();
                }
            }
            if(fieldName == "modelCd"){
                if(selectedItem.carlineCd == "" || modelCdList == null || modelCdList.length == 0){
                    this.closeCell();
                }
            }
            if(fieldName == "ocnCd"){
                if(selectedItem.modelCd == "" || ocnCdList == null || ocnCdList.length == 0){
                    this.closeCell();
                }
            }
            if(fieldName == "extColorCd"){
                if(selectedItem.ocnCd == "" || extColorCdList == null || extColorCdList.length == 0){
                    this.closeCell();
                }
            }
            if(fieldName == "intColorCd"){
                if(selectedItem.extColorCd == "" || intColorCdList == null || intColorCdList.length == 0){
                    this.closeCell();
                }
            }
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd"
                ,title:"*<spring:message code='global.lbl.dlrCd' />", width:80, sortable:false, attributes:{"class":"al"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="dlrCd" data-name="<spring:message code='global.lbl.dlrCd' />" class="form_input" readonly="true" /><a href="#" onclick="dealerSearchPopup()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="dlrCd"></span>')
                    .appendTo(container);
                }
            }
            ,{field:"carlineCd"
                ,title:"<spring:message code='global.lbl.carlineCd' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:"#=bf_selectCarLine(carlineCd)#"
                ,editor:function (container, options){
                    $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"carlineNm"
                        ,dataValueField:"carlineCd"
                        ,dataSource:carLineCdList
                        ,select:selectGridCarlineCd
                        ,change:function(e){
                            if(modelCdList == null){return false;}
                            var grid = $("#grid").data("kendoExtGrid");
                            // 해당 그리드의 tr객체중 선택한 열을 찾아 모델 컬럼의 객체를 가져온다. (hidden포함해서 0부터 시작)
                            var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(4)");
                            grid.editCell(modelCell);
                        }
                    });
                }
            }   //차종
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}                           //차종
            ,{field:"modelCd"
                ,title:"<spring:message code='global.lbl.model' />"
                ,width:150
                ,attributes:{"class":"ac"}
                ,template:"#= bf_selectModel(modelCd, modelNm) #"
                ,editor:function (container, options){
                    $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"modelNm"
                        ,dataValueField:"modelCd"
                        ,dataSource:modelCdList
                        ,select:selectGridModelCd
                        ,change:function(e){
                            if(ocnCdList == null){return false;}
                            var grid = $("#grid").data("kendoExtGrid");
                            var ocnCell = $("#grid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(6)");
                            grid.editCell(ocnCell);
                        }
                    });
                }

            }        //모델
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}                               //모델
            ,{field:"ocnCd"
                ,title:"<spring:message code='global.lbl.ocn' />"
                ,width:150
                ,attributes:{"class":"ac"}
                ,template:"#= bf_selectOcn(ocnCd, ocnNm) #"
                ,editor:function (container, options){
                    $('<input name="ocnCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"ocnNm"
                        ,dataValueField:"ocnCd"
                        ,dataSource:ocnCdList
                        ,select:selectGridOcnCd
                        ,change:function(e){
                            if(extColorCdList == null){return false;}
                            var grid = $("#grid").data("kendoExtGrid");
                            var extColorCell = $("#grid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(8)");
                            grid.editCell(extColorCell);
                        }
                    });
                }

            }            //OCN
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />", hidden:true}                                 //OCN
            ,{field:"gradeCd", title:"<spring:message code='sal.lbl.dispGradeCd' />", width:50, attributes:{"class":"ac"}, editable:false}
            ,{field:"extColorCd"
                ,title:"<spring:message code='global.lbl.extColor' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:"#= bf_selectExtColor(extColorCd, extColorNm) #"
                ,editor:function (container, options){
                    $('<input name="extColorCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"extColorNm"
                        ,dataValueField:"extColorCd"
                        ,dataSource:extColorCdList
                        ,select:selectGridExtColorCd
                        ,change:function(e){
                            if(intColorCdList == null){return false;}
                            var grid = $("#grid").data("kendoExtGrid");
                            var intColorCell = $("#grid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(11)");
                            grid.editCell(intColorCell);
                        }
                    });
                }
            }  //외장색
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", hidden:true}                         //외장색
            ,{field:"intColorCd"
                ,title:"<spring:message code='global.lbl.intColor' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,template:"#= bf_selectIntColor(intColorCd, intColorNm) #"
                ,editor:function (container, options){
                    $('<input name="intColorCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"intColorNm"
                        ,dataValueField:"intColorCd"
                        ,dataSource:intColorCdList
                        ,select:selectGridIntColorCd
                    });
                }
            }  //내장색
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />", hidden:true}                         //내장색
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:80
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false,
                        dataSource:['Y','N'],
                        index:0
                    });
                    $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                }
            }
        ]
    });

});

/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#grid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("carlineNm", dataItem.carlineNm);
    selectRow.set("modelCd", "");
    selectRow.set("modelNm", "");
    selectRow.set("ocnCd", "");
    selectRow.set("ocnNm", "");
    selectRow.set("gradeCd", "");
    selectRow.set("extColorCd", "");
    selectRow.set("extColorNm", "");
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });
    modelCdList = responseJson.data;
    modelCdObj = [];
    if(modelCdList != null ){
        $.each(modelCdList, function(idx, obj){
            modelCdObj[obj.modelCd] = obj.modelNm;
        });
    }
};

// 모델에 따른 OCN 조회
function selectGridModelCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#grid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("modelNm", dataItem.modelNm);
    selectRow.set("ocnCd", "");
    selectRow.set("ocnNm", "");
    selectRow.set("gradeCd", "");
    selectRow.set("extColorCd", "");
    selectRow.set("extColorNm", "");
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectOcn.do"
        ,data:JSON.stringify({"carlineCd":selectRow.carlineCd, "modelCd":dataItem.modelCd})
        ,async:false
    });
    ocnCdList = responseJson.data;

    ocnCdObj = [];
    if(ocnCdList != null ){
        $.each(ocnCdList, function(idx, obj){
            ocnCdObj[obj.ocnCd] = obj.ocnNm;
        });
    }

};

//OCN에 따른 외장색 조회:모델값으로 조회
function selectGridOcnCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#grid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("ocnNm", dataItem.ocnNm);
    selectRow.set("extColorCd", "");
    selectRow.set("extColorNm", "");
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectExtColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd, "ocnCd":dataItem.ocnCd})
        ,async:false
    });
    extColorCdList = responseJson.data;

    extColorCdObj = [];

    if( extColorCdList != null ){
        $.each(extColorCdList, function(idx, obj){
            extColorCdObj[obj.extColorCd] = obj.extColorNm;
        });
    }

    // grade 조회
    var gradeJson = dms.ajax.getJson({
        url:_contextPath + "/sal/ond/callCarMaster/selectGrade.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd, "ocnCd":dataItem.ocnCd})
        ,async:false
    });
    var gradeCdList = gradeJson.data;
    if( gradeCdList != null && gradeCdList.length > 0){
        selectRow.set("gradeCd", gradeCdList[0].gradeCd);
    }

};

//외장색에 따른 내장색 조회:모델값으로 조회
function selectGridExtColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#grid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("extColorNm", dataItem.extColorNm);
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectIntColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd, "ocnCd":selectRow.ocnCd, "extColorCd":dataItem.extColorCd})
        ,async:false
    });
    intColorCdList = responseJson.data;
    intColorCdObj = [];
    if( intColorCdList != null ){
        $.each(intColorCdList, function(idx, obj){
            intColorCdObj[obj.intColorCd] = obj.intColorNm;
        });
    }
};

//내장색 선택
function selectGridIntColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#grid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("intColorNm", dataItem.intColorNm);
};

//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return dms.string.strNvl(carLineCdObj[carlineCd]);
    }
}

//2 Grid- 모델의 template 정의
function bf_selectModel(modelCd, modelNm){
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return dms.string.strNvl(modelCdObj[modelCd]);
}

//3 Grid - OCN의 template 정의
function bf_selectOcn(ocnCd, ocnNm){
    if(ocnNm != ""){
        return ocnNm;
    }
    if(ocnCd == ""){
        return "";
    }
    return dms.string.strNvl(ocnCdObj[ocnCd]);
}

//4 Grid - 외장색의 template 정의
function bf_selectExtColor(extColorCd, extColorNm){
    if(extColorNm != ""){
        return extColorNm;
    }
    if(extColorCd == ""){
        return "";
    }
    return dms.string.strNvl(extColorCdObj[extColorCd]);
}

//5 Grid - 내장색의 template 정의
function bf_selectIntColor(intColorCd, intColorNm){
    if(intColorNm != ""){
        return intColorNm;
    }
    if(intColorCd == ""){
        return "";
    }
    return dms.string.strNvl(intColorCdObj[intColorCd]);
}


var dealerSearchPopupWin;
function dealerSearchPopup() {
    dealerSearchPopupWin = dms.window.popup({
        windowId:"dealerSearchPopupWin"
        ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        ,content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
            , data:{
                "autoBind":false
                ,"usrNm":""
                ,"closeAfterSelect":true
                ,"callbackFunc":function(jsonObj){
                    if(jsonObj.length > 0) {

                        var rows = $("#grid").data("kendoExtGrid").tbody.find("tr");
                        rows.each(function(index, row) {
                            var dataItem = $("#grid").data("kendoExtGrid").dataSource._data;
                            if($(this).hasClass("k-state-selected")){
                                dataItem[index].dlrCd = jsonObj[0].dlrCd;
                            }
                        });
                        $("#grid").data("kendoExtGrid").refresh();
                    }
                }
            }
        }

    });
}
</script>

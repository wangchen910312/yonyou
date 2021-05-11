<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- safetyStockParameterMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.sftyStockCalcParameter" /> --%><!-- sftyStockCalcParameter --></h1>
        <div class="btn_right">
            <button class="btn_m btn_init" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
            <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
        </div>
    </div>
</section>

<!-- // tab start-->
<div id="tabstrip" class="tab_area mt0">
    <ul>
        <li id ="tabSafetySetting" class="k-state-active"><spring:message code="par.title.safetySetting" /><!-- safetySetting --></li>
        <li id ="tabSafetyWeight"><spring:message code="par.title.safetyWeight" /><!-- safetyWeight --></li>
    </ul>
    <!--tabSafetySetting tab area -->
    <div>
        <div class="table_form form_width_100per">
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
                        <th scope="row"><spring:message code="par.lbl.dmndPrid" /></th>
                        <td>
                            <div class="form_float">
                            <div class="date_left">
                                <input id="dmndStartPrid" name="dmndStartPrid" class="form_numeric ar" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="dmndEndPrid" name="dmndEndPrid" class="form_numeric ar" />
                            </div>
                        </div>
                        </td>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stdDmndPrid" /></th>
                        <td>
                            <input id="stdDmndPrid" name="stdDmndPrid" class="form_numeric ar" />
                        </td>
                        <th scope="row">&nbsp;</th>
                        <td>
                            <input type="checkbox" id="avgDvsRflYn" name="avgDvsRflYn" />
                            <spring:message code="par.lbl.avgDvsRflYn" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.avgDvsRflRate" /></th>
                        <td>
                            <input id="avgDvsRflRate" name="avgDvsRflRate" class="form_numeric ar" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- tabSafetyWeight tab area -->
    <div>
        <div class="table_grid">
            <!-- safetyWeightGrid -->
            <div id="safetyWeightGrid" ></div>
            <!-- safetyWeightGrid -->
        </div>
    </div>

</div>
<!-- // tab end -->

<!-- safetyStockParameterMain -->
<!-- script -->
<script type="text/javascript">

/**
* checkbox click event
*/
$(document).on("click", ".useyn-chk", function(e){

     var thisName = $(this).data("name");
     var grid = $("#safetyWeightGrid").data("kendoExtGrid"),
     dataItem = grid.dataItem($(e.target).closest("tr"));

     if($(this).is(":checked")){
        dataItem.set(thisName, "Y");
     }else{
        dataItem.set(thisName, "N");
     }
 });
//initMultiSafetyStockSetting Func
function initMultiSafetyStockSetting(){
    $("#dmndStartPrid").val("");
    $("#dmndEndPrid").val("");
    $("#stdDmndPrid").val("");
    $("#avgDvsRflYn").prop("checked", false);
    $("#avgDvsRflRate").val("");
}
//saveMultiSafetyStockSetting Func
function saveMultiSafetyStockSetting(){
    var vDmndStartPrid, vDmndEndPrid, vStdDmndPrid, vAvgDvsRflRate;
    vDmndStartPrid = $("#dmndStartPrid").val();
    vDmndEndPrid = $("#dmndEndPrid").val();
    vStdDmndPrid = $("#stdDmndPrid").val();
    vAvgDvsRflRate = $("#avgDvsRflRate").val();

    if(vDmndStartPrid === ""){
        dms.notification.info("<spring:message code='par.lbl.dmndStartPrid' var='dmndStartPrid' /><spring:message code='global.info.required.field' arguments='${dmndStartPrid}' />");
        $("#dmndStartPrid").focus();
        return false;
    }
    if(vDmndEndPrid === ""){
        dms.notification.info("<spring:message code='par.lbl.dmndEndPrid' var='dmndEndPrid' /><spring:message code='global.info.required.field' arguments='${dmndEndPrid}' />");
        $("#dmndEndPrid").focus();
        return false;
    }

    if(vDmndStartPrid > vDmndEndPrid){

        dms.notification.info("<spring:message code='par.lbl.dmndStartPrid' var='dmndStartPrid' /><spring:message code='par.lbl.dmndEndPrid' var='dmndEndPrid' /><spring:message code='par.info.itemReqCntMsg' arguments='${dmndStartPrid},${dmndEndPrid}' />");
        $("#dmndStartPrid").focus();
        return false;
    }

    if(vStdDmndPrid === ""){
        dms.notification.info("<spring:message code='par.lbl.stdDmndPrid' var='stdDmndPrid' /><spring:message code='global.info.required.field' arguments='${stdDmndPrid}' />");
        $("#stdDmndPrid").focus();
        return false;
    }

    if(vAvgDvsRflRate === ""){
        dms.notification.info("<spring:message code='par.lbl.avgDvsRflRate' var='avgDvsRflRate' /><spring:message code='global.info.required.field' arguments='${avgDvsRflRate}' />");
        $("#avgDvsRflRate").focus();
        return false;
    }

    var SaftyStockSettingVO = {
        "dlrCd" :null
        ,"pltCd":null
        ,"dmndStartPrid":$("#dmndStartPrid").val()
        ,"dmndEndPrid":$("#dmndEndPrid").val()
        ,"stdDmndPrid":$("#stdDmndPrid").val()
        ,"avgDvsRflYn":$("#avgDvsRflYn").is(":checked") == true ? "Y":"N"
        ,"avgDvsRflRate":$("#avgDvsRflRate").val()
    }
    //console.log("SaftyStockSettingVO:"+kendo.stringify(SaftyStockSettingVO));
    $.ajax({
        url:"<c:url value='/par/pmm/safetyStock/multiSafetyStockParameters.do' />"
        ,data:JSON.stringify(SaftyStockSettingVO)
        ,type:"POST"
        ,dataType:"json"
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            //$('#safetyWeightGrid').data('kendoExtGrid').dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }

    });
}

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
            //initMultiSafetyStockSetting Func call
            //initMultiSafetyStockSetting();
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
            //saveMultiSafetyStockSetting Func call
            //saveMultiSafetyStockSetting()
        }
    });
    // dmndStartPrid
    $("#dmndStartPrid").kendoExtNumericTextBox({
        spinners:false
        ,value:"${dmndStartPrid}"
        ,format:"n0"
        ,min:1
        ,max:24
    });
    // dmndEndPrid
    $("#dmndEndPrid").kendoExtNumericTextBox({
        spinners:false
        ,value:"${dmndEndPrid}"
        ,format:"n0"
        ,min:1
        ,max:24
    });
    // stdDmndPrid
    $("#stdDmndPrid").kendoExtNumericTextBox({
        spinners:false
        ,value:"${stdDmndPrid}"
        ,format:"n0"
        ,min:1
        ,max:24
    });
    //avgDvsRflYn
    if("${avgDvsRflYn}" === "Y"){
        $("#avgDvsRflYn").prop("checked", true);
    }else{
        $("#avgDvsRflYn").prop("checked", false);
    }
    //avgDvsRflRate
    $("#avgDvsRflRate").kendoExtNumericTextBox({
        spinners:false
        ,value:"${avgDvsRflRate}"
        ,format:"## \\%"
        ,min:1
        ,max:100
    });

    //tab
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;
        }
    });
    //safetyWeightGrid
    $("#safetyWeightGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/safetyStock/selectSafetyStocks.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        //params["sUseYn"] = "Y";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mvtTp"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,useYn:{ type:"string" , defaultValue:"N" }
                        ,dmndPrid:{ type:"string" }
                        ,rate1:{ type:"string" }
                        ,rate2:{ type:"string" }
                        ,rate3:{ type:"string" }
                        ,rate4:{ type:"string" }
                        ,rate5:{ type:"string" }
                        ,rate6:{ type:"string" }
                        ,rate7:{ type:"string" }
                        ,rate8:{ type:"string" }
                        ,rate9:{ type:"string" }
                        ,rate10:{ type:"string" }
                        ,rate11:{ type:"string" }
                        ,rate12:{ type:"string" }
                        ,rate13:{ type:"string" }
                        ,rate14:{ type:"string" }
                        ,rate15:{ type:"string" }
                        ,rate16:{ type:"string" }
                        ,rate17:{ type:"string" }
                        ,rate18:{ type:"string" }
                        ,rate19:{ type:"string" }
                        ,rate20:{ type:"string" }
                        ,rate21:{ type:"string" }
                        ,rate22:{ type:"string" }
                        ,rate23:{ type:"string" }
                        ,rate24:{ type:"string" }
                    }
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if(fieldName=="useYn"){
                this.closeCell();
            }
        }
        ,editable:false
        ,pageable:false
        ,multiSelectWithCheckbox:false
        ,dataBound:function(e){
            /* var rows = e.sender.tbody.children();
            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem.dbYn === "N"){
                    // row cell focus
                    var sender = e.sender;
                    var cellToEdit = sender.content.find("td:eq(1)");
                    sender.editCell(cellToEdit);
                }
            } */
        }
        ,columns:[
            {field:"useYn", title:"<spring:message code='par.lbl.useYn' />"
                ,width:50
                ,attributes:{"class":"ac editable-cell"}
                ,template:'<input type="checkbox" class="useyn-chk" data-name="useYn" #= useYn=="Y"? checked="checked":"" # />'
            }//useYn
            ,{field:"dmndPrid", title:"<spring:message code='par.lbl.dmndPridWeight' />", width:80 , attributes:{"class":"ac"}}//dmndPrid
            ,{field:"rate1", title:"<spring:message code='par.lbl.rate1' />", width:50 }//M-1
            ,{field:"rate2", title:"<spring:message code='par.lbl.rate2' />", width:50 }//M-2
            ,{field:"rate3", title:"<spring:message code='par.lbl.rate3' />", width:50 }//M-3
            ,{field:"rate4", title:"<spring:message code='par.lbl.rate4' />", width:50 }//M-4
            ,{field:"rate5", title:"<spring:message code='par.lbl.rate5' />", width:50 }//M-5
            ,{field:"rate6", title:"<spring:message code='par.lbl.rate6' />", width:50 }//M-6
            ,{field:"rate7", title:"<spring:message code='par.lbl.rate7' />", width:50 }//M-7
            ,{field:"rate8", title:"<spring:message code='par.lbl.rate8' />", width:50 }//M-8
            ,{field:"rate9", title:"<spring:message code='par.lbl.rate9' />", width:50 }//M-9
            ,{field:"rate10", title:"<spring:message code='par.lbl.rate10' />", width:50 }//M-10
            ,{field:"rate11", title:"<spring:message code='par.lbl.rate11' />", width:50 }//M-11
            ,{field:"rate12", title:"<spring:message code='par.lbl.rate12' />", width:50 }//M-12
            ,{field:"rate13", title:"<spring:message code='par.lbl.rate13' />", width:50 }//M-13
            ,{field:"rate14", title:"<spring:message code='par.lbl.rate14' />", width:50 }//M-14
            ,{field:"rate15", title:"<spring:message code='par.lbl.rate15' />", width:50 }//M-15
            ,{field:"rate16", title:"<spring:message code='par.lbl.rate16' />", width:50 }//M-16
            ,{field:"rate17", title:"<spring:message code='par.lbl.rate17' />", width:50 }//M-17
            ,{field:"rate18", title:"<spring:message code='par.lbl.rate18' />", width:50 }//M-18
            ,{field:"rate19", title:"<spring:message code='par.lbl.rate19' />", width:50 }//M-19
            ,{field:"rate20", title:"<spring:message code='par.lbl.rate20' />", width:50 }//M-20
            ,{field:"rate21", title:"<spring:message code='par.lbl.rate21' />", width:50 }//M-21
            ,{field:"rate22", title:"<spring:message code='par.lbl.rate22' />", width:50 }//M-22
            ,{field:"rate23", title:"<spring:message code='par.lbl.rate23' />", width:50 }//M-23
            ,{field:"rate24", title:"<spring:message code='par.lbl.rate24' />", width:50 }//M-24
        ]
    });

});

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- safetyStockMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.sftyStockCalcSelect" /> --%><!-- sftyStockCalcSelect --></h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
        </div>
    </div>
</section>
<div class="mt10">
    <div class="table_grid">
        <!-- safetyWeightGrid -->
        <div id="safetyWeightGrid" ></div>
        <!-- safetyWeightGrid -->
    </div>
</div>
<!-- script -->
<script type="text/javascript">

$(document).ready(function() {
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
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
        ,multiSelectWithCheckbox:true
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
            {field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:100 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
            ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm'/>", width:50 }
            ,{field:"nowSftyStockQty", title:"<spring:message code='par.lbl.NowSftyStockQty' />", width:80 }//nowSftyStockQty
            ,{field:"rflSftyStockQty", title:"<spring:message code='par.lbl.RflSftyStockQty' />", width:80 }//rflSftyStockQty
            ,{field:"totDmndQty", title:"<spring:message code='par.lbl.totDmndQty' />", width:80 }//totDmndQty
            ,{field:"wgtAddTotDmndQty", title:"<spring:message code='par.lbl.wgtAddTotDmndQty' />", width:100 }//wgtAddTotDmndQty
            ,{field:"avgDmndQty", title:"<spring:message code='par.lbl.avgDmndQty' />", width:80 }//avgDmndQty
            ,{field:"avgDvsQty", title:"<spring:message code='par.lbl.avgDvsQty' />", width:80 }//avgDvsQty
            ,{field:"avgDvsRflRate", title:"<spring:message code='par.lbl.avgDvsRflRate' />", width:80 }//avgDvsRflRate
        ]
    });


});

</script>
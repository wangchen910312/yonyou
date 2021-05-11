<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- safetyStockCalculateMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.sftyStockSetParameter" /> --%><!-- sftyStockSetParameter --></h1>
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnCalculate" type="button"><spring:message code="par.btn.purcCostCal" /></button><!--btnCalculate  -->
        </div>
    </div>
</section>
<div class="mt10">
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.stdDmndPrid" /></th>
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
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></th>
                    <td class="required_area">
                        <input id="sItemDstinCd" class="form_comboBox" tabindex="999999" />
                    </td>
                    <td colspan="4">&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="par.title.sftyStockSetWeight" /><!-- sftyStockSetWeight --></h1>
        <div class="btn_right">
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

//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {
    //btnCalculate
    $("#btnCalculate").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });
    //stdDmndPrid TODO:[InBoShim] stdDmndPrid value list changed.
    $("#stdDmndPrid").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:[{cmmCd:1, cmmCdNm:1}, {cmmCd:2, cmmCdNm:2}, {cmmCd:3, cmmCdNm:3}, {cmmCd:4, cmmCdNm:4}, {cmmCd:5, cmmCdNm:5}, {cmmCd:6, cmmCdNm:6}]
        ,optionLabel:" "
        ,autoBind:false
        ,index:0
    });
    //sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,optionLabel:" "
        ,autoBind:false
        ,index:0
    });
    //avgDvsRflRate
    $("#avgDvsRflRate").kendoExtNumericTextBox({
        spinners:false
        ,value:"${avgDvsRflRate}"
        ,format:"## \\%"
        ,min:1
        ,max:100
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
            {field:"dmndPrid", title:"<spring:message code='par.lbl.dmndWeight' />", width:80 , attributes:{"class":"ac"}}//dmndPrid
            ,{field:"dmndPrid", title:"<spring:message code='par.lbl.weightTotal' />", width:80 , attributes:{"class":"ac"}}//dmndPrid
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
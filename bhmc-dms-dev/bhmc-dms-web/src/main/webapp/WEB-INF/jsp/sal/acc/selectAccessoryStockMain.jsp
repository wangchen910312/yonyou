<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.partsPackageMng" /> --%><!-- partsPackageMng --></h1>
            <div class="btn_right">
                <button class="btn_m" id="btnCreate"><spring:message code="global.btn.create" /></button>
                <button class="btn_m" id="btnDelete"><spring:message code="global.btn.del" /></button>
                <button class="btn_m btn_save"" id="btnSave"><spring:message code="global.btn.save" /></button>
            </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:30%;">
                <col style="width:20%;">
                <col style="width:30%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.pkgItemCd" /></th>
                    <td>
                        <input id="sPackageNo" name="sPackageNo" style="width:100%" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsCd" /></th>
                    <td>
                        <input id="sAccessoryNo" name="sAccessoryNo" class="form_input" style="width:100%">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.packageNm" /></th>
                    <td>
                        <input id="sPackageNm" name="sPackageNm" style="width:100%" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.goodsNm" /></th>
                    <td>
                        <input id="sAccessoryNm" name="sAccessoryNm" class="form_input" style="width:100%">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="itemGrid" class="grid"></div>
    </div>

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.lbl.itemInfo" /></h2><!-- itemInfo -->
            <div class="btn_right">
                <button class="btn_m" id="parBtnAdd"><spring:message code="global.lbl.add" /></button>
                <button class="btn_m" id="parBtnDel"><spring:message code="global.lbl.del" /></button>
            </div>
        </div>
        <div class="table_grid">
            <div id="parGrid"></div>
        </div>
    </section>
</section>

<!-- content -->

<script type="text/javascript">

$(document).ready(function() {

    $("#btnCreate").kendoButton({
        click:function(e){
            alert("button");
        }
    });

    //itemGrid
    $("#itemGrid").kendoExtGrid({
        gridId:"G-PAR-0519-185703"
        ,dataSource:{
            transport:{
                read:{
                    url:""
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        return kendo.stringify(params);
                    }
                }
            }
            ,serverPaging:true
            ,schema:{
                 model:{
                    id:"pkgItemCd"
                   ,fields:{
                        pkgItemCd :{ type:"string" , validation:{required:true} }
                       ,pkgItemNm:{ type:"string" , validation:{required:true} }
                       ,pkgAmt:{ type:"string" , validation:{required:true} }
                       ,pkgStartDt:{ type:"string" , validation:{required:true} }
                       ,pkgUseYn:{ type:"string" , validation:{required:true} }
                    }
                }
            }
        }
        ,change:function(e){

        }
        ,editable:false
        ,selectable:"row"
        ,sortable:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,height:173 // row 5
        ,filterable:false
        ,columns:[
            {field:"rnum",   title:"<spring:message code='par.lbl.rnum' />", width:30, sortable:false, attributes:{"class":"ac"}}//rnum
           ,{field:"pkgItemCd", title:"<spring:message code='par.lbl.pkgItemCd' />", width:100, attributes:{"class":"ac"}}//pkgItemCd
           ,{field:"pkgItemNm", title:"<spring:message code='par.lbl.pkgItemNm' />", width:140, attributes:{"class":"ac"}}//pkgItemNm
           ,{field:"pkgAmt", title:"<spring:message code='par.lbl.pkgPartCost' />", width:140, attributes:{"class":"ac"}}//pkgAmt
           ,{field:"pkgStartDt", title:"<spring:message code='sal.lbl.startDttm' />", width:140, attributes:{"class":"ac"}}//pkgStartDt
           ,{field:"pkgUseYn", title:"<spring:message code='global.lbl.useYn' />", width:140, attributes:{"class":"ac"}}//pkgUseYn
        ]
    });
    //parGrid
    $("#parGrid").kendoExtGrid({
        gridId:"G-PAR-0519-185804"
        ,dataSource:{
            transport:{
                read:{
                    url:""
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum :{ type:"number" }
                        ,pkgItemCd :{ type:"string" }
                        ,itemNm:{ type:"number" }
                        ,itemUnitCd:{ type:"string" , validation:{required:true} ,editable:false}
                        ,itemQty:{ type:"string" , validation:{required:true} ,editable:false}
                        ,itemPrc:{ type:"string"}
                        ,itemAmt:{ type:"string"}
                        ,pkgDetlDcRate:{ type:"number"}
                        ,pkgDetlDcPrc:{ type:"string",editable:false}
                        ,useYn:{ type:"number",editable:true}
                    }
                }
            }
        }
        ,height:288 // row 10
        ,pageable:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,edit:function(e){
        }
        ,dataBound:function(e){
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.rnum' />", width:30, attributes:{"class":"ac"}}
            ,{field:"pkgItemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:100}
            ,{field:"itemNm", title:"<spring:message code='sal.lbl.goodsName' />", width:120}
            ,{field:"itemUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:120}
            ,{field:"itemQty", title:"<spring:message code='sal.lbl.qty' />", width:120}
            ,{field:"itemPrc", title:"<spring:message code='sal.lbl.nonCostTax' />", width:120}
            ,{field:"itemAmt", title:"<spring:message code='sal.lbl.costTax' />", width:120}
            ,{field:"pkgDetlDcRate", title:"<spring:message code='sal.lbl.upgrdRate' />", width:120}
            ,{field:"pkgDetlDcPrc", title:"<spring:message code='sal.lbl.upgrdAmt' />", width:120}
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:120}
        ]
    });
});

</script>
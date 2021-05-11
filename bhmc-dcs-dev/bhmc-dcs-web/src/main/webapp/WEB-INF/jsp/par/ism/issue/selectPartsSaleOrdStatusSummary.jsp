<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 부품판매오더현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_m_min" id="btnExcelExport" name="btnExcelExport"><spring:message code="par.btn.excelDownload" /></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input id="sDlrCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <input id="sDlrNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.month" /><!-- 월분 --></th>
                        <td>
                            <input id="sYyMm" class="form_datepicker"/>
                        </td>
                        <th></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
    <!-- //부품판매오더 -->
</div>

<!-- script -->
<script>
$(document).ready(function() {

    $("#sYyMm").kendoExtMaskedDatePicker({
        start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){
            var yyMm  = $("#sYyMm").data("kendoExtMaskedDatePicker").value(),
            sYy,
            sMm,
            sYyMm;

            if(!dms.string.isEmpty(yyMm)){
                sYy    = yyMm.getFullYear();
                sMm    = dms.string.lpad((yyMm.getMonth() + 1) + '','0',2);
                sYyMm = sYy + sMm;
            }else{
                sYyMm = "";
            }
            //excel export all
            dms.ajax.excelExport({
                "beanName":"partsSaleOrdService"
                ,"templateFile":"PartsSaleOrder_Tpl.xls"
                ,"fileName":"PartsSaleOrder_Tpl.xls"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sDlrNm":$("#sDlrNm").val()
                ,"sYyMm":sYyMm
            });

        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 부품판매 헤더 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0212-175402"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/ism/issue/selectPartsSaleOrds.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {},
                            yyMm  = $("#sYyMm").data("kendoExtMaskedDatePicker").value(),
                            sYy,
                            sMm,
                            sYyMm;

                        if(!dms.string.isEmpty(yyMm)){
                            sYy    = yyMm.getFullYear();
                            sMm    = dms.string.lpad((yyMm.getMonth() + 1) + '','0',2);
                            sYyMm = sYy + sMm;
                        }else{
                            sYyMm = null;
                        }



                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        // 부품판매 검색조건 코드.
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sYyMm"] = sYyMm;

                        console.log('params:',params);
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                data:function (result){
                    if(result.total === 0){
                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }
                    return result.data;
                }
                ,total:"total"
                ,model:{
                    id:"dlrCd"
                    ,fields:{
                         issDlrCd:{ type:"string" }
                        ,dlrNm:{ type:"string" }
                        ,issYymm:{ type:"string" }
                        ,issSaleCnt:{ type:"number" }
                        ,issSaleQty:{ type:"number" }
                        ,issSaleAmt:{ type:"number" }
                    }
                }
            }
            ,aggregate:
                [
                     { field: "issSaleCnt", aggregate: "sum" }
                    ,{ field: "issSaleQty", aggregate: "sum" }
                    ,{ field: "issSaleAmt", aggregate: "sum" }
                ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,editable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.line' />", attributes:{"class":"ac"}, width:40}
            ,{field:"issDlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:80}//딜러코드
            ,{field:"dlrNm", title:"<spring:message code='par.lbl.dlrNm' />", width:250}//딜러명
            ,{field:"issSaleQty", title:"<spring:message code='par.lbl.partsSaleQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:120}//재고수량
            ,{field:"issSaleCnt", title:"<spring:message code='par.lbl.itemCnt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:120 }//판매품목
            ,{field:"issSaleAmt", title:"<spring:message code='par.lbl.partsSaleAmt' />", width:140, attributes:{"class":"ar"}, format:"{0:n2}"}//재고금액
            ,{field:"issYymm", title:"<spring:message code='par.lbl.month' />", width:90}//월분
        ]
    });


    initPage();
});

function initPage(){

    //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    $("#grid").data("kendoExtGrid").dataSource.data([]);
}

</script>
<!-- //script -->


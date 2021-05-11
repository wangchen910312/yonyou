<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_m_min" id="btnExcelExport" name="btnExcelExport"><spring:message code="par.btn.excelDownload" /></button>
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.stockInOutQty" /><!-- 재고수량 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStockQtyFr" class="form_numeric" data-type="number"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sStockQtyTo" class="form_numeric" data-type="number"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.month" /><!-- 월분 --></th>
                        <td>
                            <input id="sYyMm" class="form_datepicker"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 재고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
<script>
var popupWindow,
    sessionBpCd = "${bpCd}",
    sessionBpNm = "${bpNm}",
    toDt = "${toDt}",
    sevenDtBf = "${sevenDtBf}",
    rowNumber = 0, //그리드 목록 번호
    carlineCdList = [],
    carlineCdObj = {},
    bpTpList = [],
    bpTpObj = {},
    itemDstinCdList = [],
    itemDstinCdObj = {},
    modelCdList = [],
    modelCdObj = {},
    popItemObj = {};


$(document).ready(function() {

    $("#sYyMm").kendoExtMaskedDatePicker({
        start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //판매건수
    $("#sStockQtyFr, #sStockQtyTo").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
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
                "beanName":"stockInOutService"
                ,"templateFile":"StockAnalysis_Tpl.xls"
                ,"fileName":"StockAnalysis_Tpl.xls"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sDlrNm":$("#sDlrNm").val()
                ,"sStockQtyFr":$("#sStockQtyFr").data("kendoExtNumericTextBox").value()|| ""
                ,"sStockQtyTo":$("#sStockQtyTo").data("kendoExtNumericTextBox").value()|| ""
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


    //재고분석 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0913-093201"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/stm/stock/selectStockAnalysisByCondition.do' />"
                }
                ,parameterMap:function(options, operation){
                    if(operation ==="read"){

                    var params = {},
                        yyMm  = $("#sYyMm").data("kendoExtMaskedDatePicker").value(),
                        sYy,
                        sMm,
                        data     = {},
                        sYyMm;


                        if(!dms.string.isEmpty(yyMm)){
                            sYy    = yyMm.getFullYear();
                            sMm    = dms.string.lpad((yyMm.getMonth() + 1) + '','0',2);
                            sYyMm = sYy + sMm;
                        }else{
                            sYyMm = null;
                        }


                        //검색조건
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sStockQtyFr"] = $("#sStockQtyFr").data("kendoExtNumericTextBox").value();
                        params["sStockQtyTo"] = $("#sStockQtyTo").data("kendoExtNumericTextBox").value();
                        params["sYyMm"] = sYyMm;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                data:function(result){
                    if(result.total === 0){
                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }
                    return result.data;
                }
                ,model:{
                    id:"selectReceiveCnfmList"
                    ,fields:{
                         ianDlrCd:{ type:"string" }
                        ,dlrNm:{ type:"string" }
                        ,ianStockQty:{ type:"number" }
                        ,ianAvlbStockQty:{ type:"number" }
                        ,ianResvStockQty:{ type:"number" }
                        ,ianBorrowQty:{ type:"number" }
                        ,ianRentQty:{ type:"number" }
                        ,ianStockAmt:{ type:"number" }
                        ,ianInventoryTurnoverRatio:{ type:"number" }
                        ,ianGiQty:{ type:"number" }
                        ,ianGiAmt:{ type:"number" }
                        ,ianYymm:{ type:"string" }
                    }
                }
            }
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true
        ,editable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.line' />", attributes:{"class":"ac"}, width:40}
            ,{field:"ianDlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:80}//딜러코드
            ,{field:"dlrNm", title:"<spring:message code='par.lbl.dlrNm' />", width:250}//딜러명
            ,{field:"ianStockQty", title:"<spring:message code='par.lbl.docStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:120}//재고수량
            ,{field:"ianStockAmt", title:"<spring:message code='par.lbl.stockPrice' />", width:140, attributes:{"class":"ar"}, format:"{0:n2}"}//재고금액
            ,{field:"ianInventoryTurnoverRatio", title:"<spring:message code='par.lbl.inventoryTurnOverRatio' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}//재고회전율
            ,{field:"ianGiQty", title:"<spring:message code='par.lbl.giQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:120}//출고수량
            ,{field:"ianGiAmt", title:"<spring:message code='par.lbl.giIncTaxAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:140}//출고금액
            ,{field:"ianYymm", title:"<spring:message code='par.lbl.month' />", width:90}//월분
        ]
    });

    initPage();

});

function initPage(){
    var nowDt = new Date(),
        nowYy = nowDt.getFullYear(),
        nowMM = nowDt.getMonth();

    nowMM = dms.string.lpad(nowMM + 1,'0',2);

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
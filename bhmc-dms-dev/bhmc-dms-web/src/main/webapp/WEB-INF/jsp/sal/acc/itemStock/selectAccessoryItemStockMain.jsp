<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 용품재고 관리 -->
<div id="resizableContainer">
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.accessoryItemStock" /><!-- 용품재고현황 --></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10977" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.bpTp" /><!-- 업체유형 --></th>
                    <td>
                        <input id="sBpTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.strgeCd" /><!-- 창고 --></th>
                    <td>
                        <input type="text" id="sStrgeCd" type="text" data-type="multicombo" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsGubun" /><!-- 용품유형 --></th>
                    <td>
                        <input id="sEtcCd1" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.bpNm" /><!-- 공급업체명 --></th>
                    <td>
                        <input id="sBpNm" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.itemCd" /><!-- 용품번호 --></th>
                    <td>
                        <input id="sItemCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsName" /><!-- 용품명칭 --></th>
                    <td>
                        <input id="sItemNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.itemAollcDt" /><!-- 최근입고일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sLastGrDtFr" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sLastGrDtTo" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lastGiDt" /><!-- 최근출고일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sLastGiDtFr" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sLastGiDtTo" class="form_datepicker" />
                            </div>
                        </div>
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
//업체유형 목록
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//공급업체유형 Map
var bpTpMap = dms.data.arrayToMap(bpTpList, function(obj){ return obj.cmmCd; });

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>
//용품창고 Map
var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

//브랜드 목록
var brandCdList = [];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//용품유형 목록
var etcCd1List = [];
<c:forEach var="obj" items="${etcCd1List}">
etcCd1List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//용품유형 Map
var etcCd1Map = dms.data.arrayToMap(etcCd1List, function(obj){ return obj.cmmCd; });

//용품정보 상세 팝업 화면을 출력한다.
function openAccessoryItemStockDetailPopup(dataItem){
    dms.window.popup({
        windowId:"accessoryItemStockDetailPopup"
        ,title:"<spring:message code='sal.lbl.goodsStock' />"   //용품재고
        ,height:302
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/acc/itemStock/selectAccessoryItemStockDetailPopup.do?dlrCd="+dataItem.dlrCd+"&pltCd="+dataItem.pltCd+"&strgeCd="+dataItem.strgeCd+"&itemCd="+dataItem.itemCd+"'/>"
            ,data:{
                "callbackFunc":function(){
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                }
            }
        }
    });
}

$(document).ready(function() {
    //조회조건 - 공급업체유형
    $("#sBpTp").kendoExtDropDownList({
         dataSource:bpTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 창고
    $("#sStrgeCd").kendoExtMultiSelectDropDownList({
         dataSource:storageList
        ,dataTextField :"strgeNm"
        ,dataValueField:"strgeCd"
        ,index:0
    });

    //조회조건 - 브랜드
    /* $("#sBrandCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandCdList
        ,optionLabel:" "
        ,index:0
    });
    */
    //조회조건 - 용품유형
    $("#sEtcCd1").kendoExtDropDownList({
         dataSource:etcCd1List
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 최근입고일 조회시작일
    $("#sLastGrDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 최근입고일 조회종료일
    $("#sLastGrDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 최근출고일 조회시작일
    $("#sLastGiDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 최근출고일 조회종료일
    $("#sLastGiDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var grFromDt = $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value();
            var grToDt = $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(grFromDt, grToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sLastGrDtFr").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(grToDt, grFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sLastGrDtTo").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(grFromDt, grToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sLastGrDtTo").focus();
               return false;
            }

            var giFromDt = $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value();
            var giToDt = $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(giFromDt, giToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sLastGiDtFr").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(giToDt, giFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sLastGiDtTo").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(giFromDt, giToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sLastGiDtTo").focus();
               return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 더블클릭시 용품재고 팝업 화면을 오픈한다.
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");
        var row = grid.select();

        if(row.length > 0){
            openAccessoryItemStockDetailPopup(grid.dataItem(row));
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0131-184401"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemStock/selectAccessoryItemStocks.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();                            //업체유형
                        params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();        //창고
                        //params["sBrandCd"] = $("#sBrandCd").data("kendoExtDropDownList").value();                      //브랜드
                        params["sBpNm"] = $("#sBpNm").val();                                                        //공급업체
                        params["sItemCd"] = $("#sItemCd").val();                                                    //용품코드
                        params["sItemNm"] = $("#sItemNm").val();                                                    //용품명
                        params["sEtcCd1"] = $("#sEtcCd1").data("kendoExtDropDownList").value();                        //용품유형
                        params["sLastGrDtFr"] = $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value();         //최근입고일 조회시작일
                        params["sLastGrDtTo"] = $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value();         //최근입고일 조회종료일
                        params["sLastGiDtFr"] = $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value();         //최근출고일 조회시작일
                        params["sLastGiDtTo"] = $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value();         //최근출고일 조회종료일

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd:{type:"string"}              //딜러코드
                        ,strgeCd:{type:"string"}            //창고코드
                        ,itemCd:{type:"string"}             //용품코드
                        ,itemNm:{type:"string"}             //용품명
                        ,itemEnNm:{type:"string"}           //용품영문명
                        ,etcCd1:{type:"string"}             //용품유형
                        ,stockUnitCd:{type:"string"}        //단위
                        ,spyrCd:{type:"string"}             //공급상
                        ,bpCd:{type:"string"}               //공급업체코드
                        ,bpNm:{type:"string"}               //공급업체명
                        ,etc1:{type:"string"}               //생산공장
                        ,etc2:{type:"number"}               //설치비
                        ,avlbStockQty:{type:"number"}       //가용수량
                        ,movingAvgPrc:{type:"number"}       //재고원가
                        ,stockAmt:{type:"number"}           //재고금액
                        ,lastGrAmt:{type:"number"}          //최신입고가
                        ,retlPrc:{type:"number"}            //판매가(소매가)
                        ,taxDdctRetlPrc:{type:"number"}     //판매가(세금불포함)(세금공제소매가격)
                        ,lastGrDt:{type:"date"}             //최근입고일
                        ,lastGiDt:{type:"date"}             //최근출고일
                    }
                }
            }
        }
        ,editable:false
        ,sortable:true
        ,appendEmptyColumn:true
        ,autoBind:false
        ,columns:[
              {field:"strgeCd", title:"<spring:message code='sal.lbl.strgeCd' />", width:120   //창고
                  ,template:"# if(storageMap[strgeCd] != null) { # #= storageMap[strgeCd].strgeNm# # }#"
              }
             ,{field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:120} //용품코드
             ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:250}  //용품명
             ,{field:"etcCd1", title:"<spring:message code='sal.lbl.goodsGubun' />", width:150  //용품유형
                 ,template:"# if(etcCd1Map[etcCd1] != null) { # #= etcCd1Map[etcCd1].cmmCdNm# # }#"
             }
             ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:60, attributes:{"class":"ac"}}    //단위
             ,{field:"bpNm", title:"<spring:message code='global.lbl.bpNm' />", width:250}  //공급업체명
             ,{field:"bpTp", title:"<spring:message code='sal.lbl.bpTp' />", width:80 //업체유형
                 ,template:"# if(bpTpMap[bpTp] != null) { # #= bpTpMap[bpTp].cmmCdNm# # }#"
             }
             ,{field:"movingAvgPrc" ,title:"<spring:message code='sal.lbl.movingAvgPrc' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}}    //재고원가
             ,{field:"stockAmt" ,title:"<spring:message code='sal.lbl.stockAmt' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"},sortable:false}    //재고금액
             ,{field:"avlbStockQty" ,title:"<spring:message code='sal.lbl.avlbStockQty' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}}    //가용수량
             ,{field:"lastGrAmt" ,title:"<spring:message code='global.lbl.lastGrPrice' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"},sortable:false}    //최신입고가
             ,{field:"retlPrc", title:"<spring:message code='sal.lbl.salePrice' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}}  //판매가
             ,{field:"taxDdctRetlPrc", title:"<spring:message code='sal.lbl.taxDdctRetlPrc' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}}    //판매가(세금불포함)
             ,{field:"etc2", title:"<spring:message code='sal.lbl.fitCost' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}} //설치비
             ,{field:"lastGrDt", title:"<spring:message code='sal.lbl.lastGrDt' />", width:100, attributes:{"class":"ac"}    //최근입고일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"lastGiDt", title:"<spring:message code='sal.lbl.lastGiDt' />", width:100, attributes:{"class":"ac"}    //최근출고일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
        ]
    });
});
</script>
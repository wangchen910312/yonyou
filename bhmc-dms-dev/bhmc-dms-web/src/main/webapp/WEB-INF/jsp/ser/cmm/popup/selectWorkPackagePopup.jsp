<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="ser.title.packageMng" /><!-- 작업Package구성 --></h1> --%>
            <div class="btn_left">
                <button type="button" class="btn_m btn_reset" id="btnInit"><spring:message code="global.btn.init" /></button>
            </div>
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
                <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
            </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:31%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.packageCd" /><!-- Package번호 --></th>
                    <td>
                        <input id="sPkgItemCd" name="sPkgItemCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.packageNm" /><!-- Package명 --></th>
                    <td>
                        <input id="sPkgItemNm" name="sPkgItemNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드 --></th>
                    <td>
                        <input id="sLbrCd" name="sLbrCd" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></th>
                    <td>
                        <input id="sLbrNm" name="sLbrNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></th>
                    <td>
                        <input id="sItemCd" name="sItemCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></th>
                    <td >
                        <input id="sItemNm" name="sItemNm" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <!-- 그리드1 -->
        <div id="itemGrid" class="grid"></div>
        <!-- 그리드1 -->
    </div>
    <!-- // 부품 조회 -->
    <!-- 그리드 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.lbrInfo" /></h1><!-- 공임정보 -->
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="ltsGrid"></div>
    </div>

     <!-- 그리드 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.itemInfo" /></h1><!-- 부품정보 -->
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="parGrid"></div>
    </div>
    <form id="form">
        <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
        <input type="hidden" id="pkgItemNm" name="pkgItemNm" />
        <input type="hidden" id="pkgDocNo" name="pkgDocNo" />
        <input type="hidden" id="ltsModelCd" name="ltsModelCd" />
    </form>
</section>

<script type="text/javascript">

//품목구분 Array
var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//품목구분 Map
var itemDstinCdMap = dms.data.arrayToMap(itemDstinCdList, function(obj){ return obj.cmmCd; });

//LtsModel Array
var ltsModelList = [];
<c:forEach var="obj" items="${ltsModelDs}">
ltsModelList.push({
    "cmmCd":"${obj.ltsModelCd}"
    , "cmmCdNm":"${obj.ltsModelNm}"
});
</c:forEach>

//공통코드:정비유형(수리유형)
var lbrTpCdList  = []; //기본 수리유형
<c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
    ltsModelCdList.push({
         cmmCdNm:"${obj.ltsModelNm}"
        ,cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//브랜드
var brandDsList =[];
<c:forEach var="obj" items="${brandCdDs}">
brandDsList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var brandDsMap = dms.data.arrayToMap(brandDsList, function(obj){return obj.cmmCd;});

// 정비유형(수리유형)
lbrTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(lbrTpCdArr[val] != undefined)
        returnVal = lbrTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//LTSMODEL
setLtsMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(ltsMap[value] != undefined)
            resultVal =  ltsMap[value].cmmCdNm;
    }
    return resultVal;
};

//브랜드
setBrandMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(brandDsMap[value] != undefined)
            resultVal =  brandDsMap[value].cmmCdNm;
    }
    return resultVal;
};

// 부품 구분
itemDstinCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(itemDstinCdMap[val] != undefined)
            returnVal = itemDstinCdMap[val].cmmCdNm;
    }
    return returnVal;
};

/**
 * 팝업 옵션
 */
var options = parent.workPackagePopup.options.content.data;
var ltsModelCd = options.sLtsModelCd;

$(document).ready(function() {

    //조회조건 - 품목구분선택
    $("#sItemDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,index:0
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#sPkgItemCd").val("");
            $("#sPkgItemNm").val("");
            $("#sLbrCd").val("");
            $("#sLbrNm").val("");
            $("#sItemCd").val("");
            $("#sItemNm").val("");

            $("#itemGrid").data("kendoExtGrid").dataSource.data([]);
            $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    $("#btnSearch").kendoButton({
        click:function(){
            $("#itemGrid").data("kendoExtGrid").dataSource.page(1);
            $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);

        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var ltsGrid = $("#ltsGrid").data("kendoExtGrid");
            var parGrid = $("#parGrid").data("kendoExtGrid");

            var parData = parGrid.dataSource.data();
            var ltsData = ltsGrid.dataSource.data();

            console.log("partData : " + JSON.stringify(parData));
            options.callbackFunc(parData, ltsData);
            parent.workPackagePopup.close();
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
         click:function(e){
             parent.workPackagePopup.close();
         }
    });

    /** 공임 계산**/
    calLaborAmt = function(e){
        // 공임 금액:수량 * 시간당 금액 * 단가
        var grid = $("#ltsGrid").data("kendoExtGrid");
        var gridData = grid.dataSource._data;

        var selectedVal = grid.dataItem(grid.select());


        var lbrQty = Number(selectedVal.lbrQty);
        var lbrHm  = Number(selectedVal.lbrHm);
        var lbrPrc = Number(selectedVal.lbrPrc);

        var lbrAmt = Number((lbrQty * lbrHm * lbrPrc ).toFixed(2));

        selectedVal.set("lbrAmt",lbrAmt);
    };

    /** 부품 계산**/
    calPartAmt = function(e){

        var grid = $("#parGrid").data("kendoExtGrid");
        var gridData = grid.dataSource._data;

        var selectedVal = grid.dataItem(grid.select());

        // ROUND ( ROUND ( 부품단가 * MARK UP * 수량  , 2) * TAX , 2)

        var itemQty  = Number(selectedVal.itemQty); //수량
        var itemPrc = Number(selectedVal.itemPrc); //단가
        var itemAmt = Number( ( itemPrc * itemQty ).toFixed(2)  );

        selectedVal.set("itemAmt",itemAmt);
    };


    $("#itemGrid").kendoExtGrid({
        gridId:"G-SER-1011-000044"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackages.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 품목구분코드.
                        params["sPkgItemCd"]  = $("#sPkgItemCd").val();
                        params["sPkgItemNm"]  = $("#sPkgItemNm").val();
                        params["sLbrCd"]      = $("#sLbrCd").val();
                        params["sLbrNm"]      = $("#sLbrNm").val();
                        params["sItemCd"]     = $("#sItemCd").val();
                        params["sItemNm"]     = $("#sItemNm").val();
                        params["sLtsModelCd"] = ltsModelCd;

                        return kendo.stringify(params);
                    }
                }
            }
            ,serverPaging:true
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum :{ type:"number" , validation:{required:true} }
                       ,dlrCd :{ type:"string" , validation:{required:true} }
                       ,pkgDocNo:{ type:"int" , validation:{required:true} }
                       ,pkgItemCd:{ type:"string" , validation:{required:true} }
                       ,pkgItemNm:{ type:"string" , validation:{required:true} }
                    }
                }
            }
          }
        ,editable:false
        ,autoBind:false
        ,selectable:"row"
        ,scrollable:true
        ,sortable:false
        ,resizable:true
        ,height:170
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            if( selectedItem != null && selectedItem != 'undefined'){


                $("#pkgItemCd").val(selectedItem.pkgItemCd);
                $("#pkgItemNm").val(selectedItem.pkgItemNm);
                $("#pkgDocNo").val(selectedItem.pkgDocNo);
                $("#ltsModelCd").val(selectedItem.ltsModelCd);

                $("#ltsGrid").data("kendoExtGrid").dataSource.read();
                $("#parGrid").data("kendoExtGrid").dataSource.read();

            }
         }
        ,pageable:true
        ,columns:[
             {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:80, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", hidden:true}
            ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.carLine' />", hidden:true}
            ,{field:"pkgItemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:250, attributes:{"class":"al"}}
            ,{field:"pkgItemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:300, attributes:{"class":"al"}}
            ,{field:"brandCd",   title:"<spring:message code='ser.lbl.brand' />", width:100, sortable:false, attributes:{"class":"ac"}
                ,template :"#= setBrandMap(brandCd) #"
            }       //차량브랜드
            ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:250, attributes:{"class":"al"}
                ,template :"[#:ltsModelCd#]#= setLtsMap(ltsModelCd) #"
             } //차량모델
            ,{field:"pkgStartDt", title:"<spring:message code='par.lbl.startDttm' />", width:120
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             } //시작일시
            ,{field:"pkgEndDt", title:"<spring:message code='par.lbl.endDttm' />", width:120
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             } //종료일시
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.preLbrAmt' />", hidden:true}
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", hidden:true}
            ,{field:"totAmt", title:"<spring:message code='ser.lbl.totAmt' />", hidden:true}
        ]
    });


    //공임 설정
    $("#ltsGrid").kendoExtGrid({
        gridId:"G-SER-1011-000045"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackageLtss.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPkgItemCd"] = $("#pkgItemCd").val();
                        params["sPkgItemNm"] = $("#pkgItemNm").val();
                        params["sPkgDocNo"] = $("#pkgDocNo").val();
                        params["sLtsModelCd"] = $("#ltsModelCd").val();
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,pkgDocNo:{ type:"int"}
                       ,pkgItemCd:{ type:"string"}
                       ,lineNo:{ type:"string"}
                       ,lbrCd:{ type:"string",editable:false}
                       ,lbrNm:{ type:"string",editable:false}
                       ,lbrQty:{ type:"number",editable:false}
                       ,lbrHm:{ type:"number",editable:false}
                       ,lbrPrc:{ type:"number",editable:false}
                       ,lbrRate:{ type:"number",editable:false}
                       ,lbrAmt:{ type:"number",editable:true}
                    }
                }
            }
          }
        ,pageable:false
        ,height:91
        ,autoBind:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="lbrAmt"){
                 this.closeCell();
             }
         }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
            ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:150,attributes:{"class":"al"}}//공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250,attributes:{"class":"al"}}//공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:120, attributes:{"class":"ac"}
                 ,template:"#=lbrTpCdGrid(lbrTp)#"
             }//공임유형
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:80, attributes:{"class":"ar"}}// 공임시간
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", hidden:true}//단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", hidden:true}//금액
            ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", hidden:true}//수량
        ]

    });


    //부품 설정
    $("#parGrid").kendoExtGrid({
        gridId:"G-SER-1011-000046"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPkgItemCd"] = $("#pkgItemCd").val();
                        params["sPkgItemNm"] = $("#pkgItemNm").val();
                        params["sPkgDocNo"] = $("#pkgDocNo").val();
                        params["sLtsModelCd"] = $("#ltsModelCd").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,pkgDocNo:{ type:"int"}
                       ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                       ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                       ,pkgItemCd:{ type:"string"}
                       ,lineNo:{ type:"string"}
                       ,itemQty:{ type:"number",editable:false}
                       ,itemUnitCd:{ type:"string",editable:false}
                       ,itemPrc:{ type:"number",editable:false}
                       ,itemAmt:{ type:"number",editable:true}
                       ,avlbStockQty:{ type:"number",editable:false}
                       ,taxDdctGrtePrc:{ type:"number",editable:true}
                       ,markUp:{ type:"number",editable:true}
                    }
                }
            }
          }
        ,height:91
        ,pageable:false
        ,autoBind:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt"){
                 this.closeCell();
             }
         }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150,attributes:{"class":"al"}}//부품번호
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:250,attributes:{"class":"al"}}//부품명
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:120, attributes:{"class":"ac"},format:"{0:n2}"}//수량단위
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:80, attributes:{"class":"ar"}
                , format:"{0:n0}"
                , editor:function(container, options){
                        $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"                // n0:###,###, n2:###,###.##
                           ,decimals:0                // 소숫점
                           ,min:1
                           ,value:0
                           ,spinners:false
                           ,change:calPartAmt
                    });
                    $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                 }
            }//수량
            ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", hidden:true}//단가
            ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", hidden:true}//금액
            ,{field:"avlbStockQty", title:"<spring:message code='ser.lbl.qty' />", hidden:true}//가용재고
            ,{field:"itemPrc", hidden:true}//단가
            ,{field:"taxDdctGrtePrc", hidden:true}// 부품원가
            ,{field:"markUp", hidden:true}// 부품원가
        ]

    });

});

</script>

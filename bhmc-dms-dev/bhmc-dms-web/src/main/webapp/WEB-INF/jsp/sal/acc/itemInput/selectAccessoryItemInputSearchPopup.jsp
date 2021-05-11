<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 용품입고 부품조회 팝업 -->
<section class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='sal.lbl.grStrgeCd'/><!-- 입고창고 --></th>
                    <td>
                        <input type="text" id="sGrStrgeCd" name="sGrStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.goodsCd'/><!-- 용품코드 --></th>
                    <td>
                        <input type="text" id="sItemCd" name="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.goodsNm'/><!-- 용품명 --></th>
                    <td>
                        <input type="text" id="sItemNm" name="sItemNm" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsGubun"/><!-- 용품유형 --></th>
                    <td>
                        <input type="text" id="sEtcCd1" name="sEtcCd1" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.brand"/><!-- 브랜드 --></th>
                    <td>
                        <input type="text" id="sBrandCd" name="sBrandCd" class="form_comboBox" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 용품조회 그리드 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="sal.title.goodsList"/><!-- 용품목록 --></h2>
        <div class="btn_right">
            <button id="btnAdd" class="btn_s"><spring:message code="global.btn.add" /><!-- 추가 --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="grid" class="grid"></div>
    </div>

    <!-- 선택용품 그리드 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="sal.title.selectedGoods"/><!-- 선택용품 --></h2>
        <div class="btn_right">
            <button id="btnDelete" class="btn_s"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="selectedItemGrid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>
//용품창고 Map
var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

//용품유형 목록
var etcCd1List = [];
<c:forEach var="obj" items="${etcCd1List}">
etcCd1List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//용품유형 Map
var etcCd1Map = dms.data.arrayToMap(etcCd1List, function(obj){ return obj.cmmCd; });

//재고단위 목록
var stockUnitCdList = [];
<c:forEach var="obj" items="${stockUnitCdList}">
stockUnitCdList.push({"cmmCd":"${obj.unitExtCd}", "cmmCdNm":"${obj.unitExtCd}", "useYn":"${obj.useYn}"});
</c:forEach>
//재고단위 Map
var stockUnitCdMap = dms.data.arrayToMap(stockUnitCdList, function(obj){ return obj.cmmCd; });

//브랜드 목록
var brandCdList = [];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//브랜드 Map
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //팝업옵션
    var popupWindow = parent.$("#accessoryItemInputSearchPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //조회조건 - 용품창고
    $("#sGrStrgeCd").kendoExtDropDownList({
         dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:storageList
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 용품유형
    $("#sEtcCd1").kendoExtDropDownList({
         dataSource:etcCd1List
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 브랜드
    $("#sBrandCd").kendoExtDropDownList({
         dataSource:brandCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var selectedItemGrid = $("#selectedItemGrid").data("kendoExtGrid");
            var rows = selectedItemGrid.select();

            if(rows.length > 0){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(selectedItemGrid.dataItem(row));
                });

                popupOptions.callbackFunc(data);
            }
        }
    });

    //버튼 - 추가
    //용품조회 그리드 선택목록을 선택용품 그리드에 추가한다.
    $("#btnAdd").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItemGrid = $("#selectedItemGrid").data("kendoExtGrid");

            if(grid.select().length == 0){
                //용품을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='sal.info.selectGoods'/>");
                return;
            }

            $.each(grid.select(), function(idx, row){
                var dataItem = grid.dataItem(row);

                //품목 중복 체크
                isExistItemCd = selectedItemGrid.exists(function(selectedDataItem){
                    if(selectedDataItem.itemCd == dataItem.itemCd){
                        return true;
                    }
                    return false;
                });

                if(isExistItemCd){
                    dms.notification.warning(dataItem.itemCd + "["+ dataItem.itemNm +"]<spring:message code='sal.info.alreadyRegistedParts'/>");   //은 이미 등록되어 있는 부품입니다.
                }else{
                    //선택용품 그리드에 추가
                    selectedItemGrid.dataSource.add({
                         dlrCd:dataItem.dlrCd                   //딜러코드
                        ,itemCd:dataItem.itemCd                 //용품코드
                        ,itemNm:dataItem.itemNm                 //용품명
                        ,stockUnitCd:dataItem.stockUnitCd       //단위
                        ,grStrgeCd:dataItem.grStrgeCd           //입고창고
                        ,strgeNm:dataItem.strgeNm               //입고창고명
                        ,salePrcAmt:dataItem.salePrcAmt         //매입기준가
                        ,lastGrAmt:dataItem.lastGrAmt           //최근입고가
                        ,avlbStockQty:dataItem.avlbStockQty             //가용재고
                    });
                }

                //선택용품 그리드 전체 선택
                selectedItemGrid.select(selectedItemGrid.tbody.find(">tr"));

                //용품조회 그리드 선택목록 초기화
                grid.clearSelection();
            });
        }
    });

    //버튼 - 삭제
    $("#btnDelete").kendoButton({
        click:function(e){
            $("#selectedItemGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //용품조회 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0203-173001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasters.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json;"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]  = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"]  = options.skip + options.take;
                        params["sort"]       = options.sort;

                        params["sEndYn"]     = "N";
//                         params["sBpCd"] = popupOptions.bpCd;
                        params["sItemCd"]    = $("#sItemCd").val();
                        params["sItemNm"]    = $("#sItemNm").val();
                        params["sBrandCd"]   = $("#sBrandCd").data("kendoExtDropDownList").value();
                        params["sGrStrgeCd"] = $("#sGrStrgeCd").data("kendoExtDropDownList").value();
                        params["sBmpYn"]     = popupOptions.sBmpYn;

                        return kendo.stringify(params);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:true
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd:{type:"string"}          //딜러코드
                        ,itemCd:{type:"string"}         //용품코드
                        ,itemNm:{type:"string"}         //용품명
                        ,stockUnitCd:{type:"string"}    //단위
                        ,retlPrc:{type:"number"}        //판매가
                        ,salePrcAmt:{type:"number"}     //매입기준가
                        ,lastGrAmt:{type:"number"}      //최근입고가
                        ,avlbStockQty:{type:"number"}   //가용재고
                        ,grStrgeCd:{type:"string"}      //입고창고
                        ,etcCd1:{type:"string"}         //용품유형
                    }
                }
            }
        }
        ,selectable:popupOptions.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true
        ,multiSelectWithCheckbox:true
        ,height:190
        ,columns:[
             {field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd'/>", width:120}  //용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm'/>", width:250}   //용품명
            ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit'/>", width:60, attributes:{"class":"ac"}} //단위
            ,{field:"retlPrc", title:"<spring:message code='sal.lbl.salePrice'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80}    //판매가
            ,{field:"salePrcAmt", title:"<spring:message code='sal.lbl.salePrcAmt'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80, hidden:true}  //매입기준가
            ,{field:"lastGrAmt", title:"<spring:message code='sal.lbl.lastGrAmt'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80}   //최근입고가
            ,{field:"avlbStockQty" ,title:"<spring:message code='sal.lbl.stockQty'/>" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:70} //가용재고
            ,{field:"grStrgeCd", title:"<spring:message code='sal.lbl.goodsHouse' />", width:100
                //,template:"# if(storageMap[grStrgeCd] != null) { # #= dms.string.strNvl(storageMap[grStrgeCd].strgeNm)# # }#"
                ,template:"#= strgeNm#"
            }
            ,{field:"etcCd1", title:"<spring:message code='sal.lbl.goodsGubun' />", width:100
                ,template:"# if(etcCd1Map[etcCd1] != null) { # #= dms.string.strNvl(etcCd1Map[etcCd1].cmmCdNm)# # }#"
            }
        ]
    });
    // 더블클릭
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnAdd").click();
    });


    //용품조회 그리드
    $("#selectedItemGrid").kendoExtGrid({
        gridId:"G-SAL-0203-180101"
        ,dataSource:{
             navigatable:false
            ,serverPaging:false
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd:{type:"string"}          //딜러코드
                        ,itemCd:{type:"string"}         //용품코드
                        ,itemNm:{type:"string"}         //용품명
                        ,stockUnitCd:{type:"string"}    //단위
                        ,salePrcAmt:{type:"number"}     //매입기준가
                        ,lastGrAmt:{type:"number"}      //최근입고가
                        ,avlbStockQty:{type:"number"}       //가용재고
                        ,grStrgeCd:{type:"string"}      //입고창고
                    }
                }
            }
        }
        ,selectable:"multiple,row"
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,sortable:false
        ,appendEmptyColumn:true
        ,multiSelectWithCheckbox:true
        ,pageable:false
        ,height:137
        ,columns:[
             {field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd'/>", width:120}  //용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm'/>", width:250}   //용품명
            ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit'/>", width:60, attributes:{"class":"ac"}} //단위
            ,{field:"grStrgeCd", title:"<spring:message code='sal.lbl.goodsHouse' />", width:100,hidden:true}
            ,{field:"strgeNm", title:"<spring:message code='sal.lbl.goodsHouse' />", width:100}
            ,{field:"salePrcAmt", title:"<spring:message code='sal.lbl.salePrcAmt'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80}  //매입기준가
            ,{field:"lastGrAmt", title:"<spring:message code='sal.lbl.lastGrAmt'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80}   //최근입고가
            ,{field:"avlbStockQty" ,title:"<spring:message code='sal.lbl.stockQty'/>" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:70} //가용재고

        ]
    });

    if(popupOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 용품입고 부품조회 팝업 -->
<section class="pop_wrap">
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="itemTab" class="k-state-active"><spring:message code="sal.lbl.goods" /><!-- 용품 --></li>
            <li id="packageTab"><spring:message code="sal.lbl.package" /><!-- 패키지 --></li>
        </ul>

        <span class="btn_right_absolute2">
            <button id="btnSearch" class="btn_m"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m"><spring:message code="global.btn.select" /><!-- 선택 --></button>
        </span>

        <!-- 용품탭 -->
        <div id="itemTabDiv">
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
                            <th scope="row"><spring:message code="sal.lbl.strgeCd" /><!-- 창고 --></th>
                            <td>
                                <input type="text" id="sStrgeCd" type="text" class="form_comboBox">
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
                            <c:choose>
                                <c:when test="${sBrandYn ne 'N'}">
                                    <th class="brandY" scope="row"><spring:message code="global.lbl.brand"/><!-- 브랜드 --></th>
                                    <td class="brandY">
                                        <input type="text" id="sBrandCd" name="sBrandCd" class="form_comboBox" />
                                    </td>
                                </c:when>
                                <c:when test="${sBrandYn eq 'N'}">
                                    <th class="pointY" scope="row"><span id="etc4Txt" ><spring:message code="crm.lbl.pointChangeVal"/><!-- 교환포인트 --></span></th>
                                    <td>
                                        <div class="form_float " id="etc4Con">
                                            <div class="date_left">
                                                <input id="sPointChangeFrom" name="sPointChangeFrom" class="form_numeric ar" />
                                                <span class="txt_from">~</span>
                                            </div>
                                            <div class="date_right">
                                                <input id="sPointChangeTo" name="sPointChangeTo" class="form_numeric ar" />
                                            </div>
                                        </div>
                                    </td>
                                 </c:when>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 용품조회 그리드 -->
            <div class="table_grid mt10">
                <div id="grid" class="grid"></div>
            </div>
        </div>

        <!-- 용품패키지탭 -->
        <div id="packageTabDiv">
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
                            <th scope="row"><spring:message code="par.lbl.packageCd" /></th>
                            <td>
                                <input type="text" id="sPkgItemCd" name="sPkgItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.packageNm" /></th>
                            <td >
                                <input type="text" id="sPkgItemNm" name="sPkgItemNm" class="form_input" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="clfix">
                <div class="left_areaStyle" style="width:39%">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="par.title.packageSub" /></h2>
                        <div class="btn_right">
                            &nbsp;
                        </div>
                    </div>
                    <div class="table_grid">
                        <!-- 그리드1 -->
                        <div id="packageGrid" class="grid"></div>
                        <!-- 그리드1 -->
                    </div>
                </div>
                <div class="right_areaStyle" style="width:60%;">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="par.title.itemCdList" /></h2>
                        <div class="btn_right">
                            &nbsp;
                        </div>
                    </div>
                    <div class="table_grid">
                        <!-- 그리드 시작 -->
                        <div class="table_grid">
                            <div id="packageItemGrid" class="grid"></div>
                        </div>
                    </div>
                </div>
            </div>
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
    var popupWindow = parent.$("#accessoryItemSearchPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    selectTabId = "itemTab";       // 초기값:용품
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            selectTabId = e.item.id;
        }
    });

    if(dms.string.strNvl(popupOptions.type) == "01"){
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#packageTab").attr("disabled", true);
        $("#itemTab").show();
        $("#packageTab").hide();
        $("#packageTabDiv").hide();
    }else if(dms.string.strNvl(popupOptions.type) == "02"){
        $("#tabstrip").data("kendoExtTabStrip").select(1);
        $("#itemTab").attr("disabled", true);
        $("#itemTab").hide();
        $("#packageTab").show();
        $("#itemTabDiv").hide();
    }else{
        $("#tabstrip").data("kendoExtTabStrip").select(0);

        // 계약화면 옵션
        if(dms.string.isNotEmpty(popupOptions.sPkgItemCd)){
            $("#sPkgItemCd").val(dms.string.strNvl(popupOptions.sPkgItemCd));
            $("#tabstrip").data("kendoExtTabStrip").select(1);
        }else if(dms.string.isNotEmpty(popupOptions.sGoodsCd)){
            $("#sItemCd").val(dms.string.strNvl(popupOptions.sGoodsCd));
            $("#tabstrip").data("kendoExtTabStrip").select(0);
        }
    }

    //용품탭
    //조회조건 - 창고
    $("#sStrgeCd").kendoExtMultiSelectDropDownList({
         dataSource:storageList
        ,dataTextField :"strgeNm"
        ,dataValueField:"strgeCd"
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
            if(selectTabId == "itemTab"){
                $("#grid").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#packageGrid").data("kendoExtGrid").dataSource.read();
            }
        }
    });

    //버튼 - 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            if(selectTabId == "itemTab"){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();
                if(rows.length > 0){
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    popupOptions.callbackFunc(data, "item");
                }
            }else{
                var grid = $('#packageGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                var rows = grid.select();
                if (rows.length >= 1){
                    var packageItemGrid = $("#packageItemGrid").data("kendoExtGrid");
                    popupOptions.callbackFunc(packageItemGrid.dataSource.data(), "package");
                } else {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                }
            }
        }
    });

    //용품조회 그리드
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    //url:"<c:url value='/sal/acc/itemStock/selectAccessoryItemStocks.do' />"
                    url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasters.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json;"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sEndYn"]  = "N";
                        params["sBmpYn"]  = "Y";
                        <c:if test="${sBrandYn ne 'N'}">
                            params["sBrandCd"] = $("#sBrandCd").data("kendoExtDropDownList").value();
                        </c:if>
                        params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();

                        // 포인트 교환화면에서 팝업을 연경우 검색조건 교환포인트 검색조건 추가 - 20170513 이인문 수정
                        <c:if test="${sBrandYn eq 'N'}">
                            //if(popupOptions.pointUse === "Y"){
                                params["sPointChangeFrom"] = $("#sPointChangeFrom").data("kendoExtNumericTextBox").value();
                                params["sPointChangeTo"] = $("#sPointChangeTo").data("kendoExtNumericTextBox").value();
                                params["sEtcCd2"] = "Y";
                            //};
                        </c:if>
//console.log(kendo.stringify(params))
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
                         dlrCd:{type:"string"}              //딜러코드
                        ,strgeCd:{type:"string"}            //창고코드
                        ,itemCd:{type:"string"}             //용품코드
                        ,itemNm:{type:"string"}             //용품명
                        ,etcCd1:{type:"string"}             //용품유형
                        ,stockUnitCd:{type:"string"}        //단위
                        ,bpNm:{type:"string"}               //공급업체명
                        ,movingAvgPrc:{type:"number"}       //재고원가
                        ,retlPrc:{type:"number"}            //판매가(소매가)
                        ,etc2:{type:"number"}               //설치비
                        ,avlbStockQty:{type:"number"}       //가용수량
                        ,etc4:{type:"number"}               //1개포인트
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
        ,height:355
        ,columns:[
              {field:"strgeCd", title:"<spring:message code='sal.lbl.strgeCd' />", width:120                                                            //창고
                  //,template:"# if(storageMap[strgeCd] != null) { # #= storageMap[strgeCd].strgeNm# # }#"
                  ,template:function(dataItem){
                      var resultObj = "";
                      if( dms.string.isNotEmpty(dataItem.strgeCd)){
                          resultObj = dataItem.strgeNm;
                      }
                      return resultObj;
                  }
              }
             ,{field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:120}                                                            //용품코드
             ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:250, sortable:false}                                         //용품명
             ,{field:"etcCd1", title:"<spring:message code='sal.lbl.goodsGubun' />", width:150
                 ,template:"# if(etcCd1Map[etcCd1] != null) { # #= etcCd1Map[etcCd1].cmmCdNm# # }#", sortable:false }                                   //용품유형
             ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:60, attributes:{"class":"ac"}, sortable:false}                //단위
             ,{field:"bpNm", title:"<spring:message code='global.lbl.bpNm' />", width:150, sortable:false}                                              //공급업체명
             ,{field:"movingAvgPrc" ,title:"<spring:message code='sal.lbl.movingAvgPrc' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}, sortable:false}      //재고원가
             ,{field:"retlPrc", title:"<spring:message code='sal.lbl.salePrice' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}, sortable:false}              //판매가
             ,{field:"etc2", title:"<spring:message code='sal.lbl.fitCost' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}, sortable:false}                   //설치비
             ,{field:"avlbStockQty" ,title:"<spring:message code='sal.lbl.avlbStockQty' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}, sortable:false}      //가용수량
             ,{field:"etc4" ,title:"<spring:message code='crm.lbl.eachPoint' />", width:80 ,format:"{0:n0}" ,attributes:{"class":"ar"}, sortable:false}                 //1개포인트
        ]
    });

    //패키지그리드
    $("#packageGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackages.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPkgTp"] = "03";
                        params["sItemDstinCd"] = "04";
                        params["sPkgItemCd"] = $("#sPkgItemCd").val();
                        params["sPkgItemNm"] = $("#sPkgItemNm").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number"}
                        ,dlrCd:{type:"string"}
                        ,pkgItemCd:{type:"string"}
                        ,pkgItemNm:{type:"string"}
                    }
                }
            }
        }
        ,autoBind:false
        ,editable:false
        ,height:355
        ,pageable:false
        ,selectable:"row"
        ,sortable:false
        ,change:function(e){
            $("#packageItemGrid").data("kendoExtGrid").dataSource.read();
        }
        ,columns:[
            {field:"pkgItemCd", title:"<spring:message code='par.lbl.pkgItemCd' />", width:100}
            ,{field:"pkgItemNm", title:"<spring:message code='par.lbl.pkgItemNm' />"}
        ]
    });

    //패키지품목 그리드
    $("#packageItemGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if(operation === "read"){

                        var params = {};
                        params["sort"] = options.sort;

                        var packageGrid = $("#packageGrid").data("kendoExtGrid");
                        var dataItem = packageGrid.dataItem(packageGrid.select());

                        params["sPkgTp"] = "03";
                        params["sPkgItemCd"] = dataItem.pkgItemCd;
                        params["sPkgItemNm"] = dataItem.pkgItemNm;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd:{type:"string" }
                       ,itemCd:{type:"string"}
                       ,itemNm:{type:"string"}
                       ,pkgItemCd:{type:"string"}
                       ,lineNo:{type:"string"}
                       ,itemQty:{type:"number"}
                       ,itemUnitCd:{type:"string"}
                       ,itemPrc:{type:"number"}
                       ,itemAmt:{type:"number"}
                       ,avlbStockQty:{type:"number"}
                    }
                }
            }
          }
        ,autoBind:false
        ,editable:false
        ,height:355
        ,pageable:false
        ,selectable:false
        ,sortable:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                               //부품번호
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150}                                              //부품명
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"}     //수량
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.prc' />", width:60,attributes:{"class":"ar"}, format:"{0:n2}"}      //수량단위
            ,{field:"giStrgeCd", title:"<spring:message code='sal.lbl.goodsHouse' />", width:100
                ,template:"#= strgeNm #"
            }
        ]
    }).data("kendoExtGrid").dataSource.data([]);

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });


    // 포인트 교환화면에서 팝업을 연경우 검색조건 추가 및 그리드 컬럼 추가. - 20170513 이인문 수정
    <c:if test="${sBrandYn eq 'N'}">
       // if(popupOptions.pointUse === "Y"){
            //포인트교환
            $("#sPointChangeFrom").kendoExtNumericTextBox({
                format:"n0"
                ,min:0
                ,spinners:false
            });
            //포인트교환
            $("#sPointChangeTo").kendoExtNumericTextBox({
                format:"n0"
                ,min:0
                ,spinners:false
            });
            //$("#etc4Con").removeClass("hidden");
            //$("#etc4Txt").removeClass("hidden");
        //};
    </c:if>

    if(popupOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }

  /*   console.log(popupOptions.sBrandYn)
    if(popupOptions.hasOwnProperty("sBrandYn")){
        if(popupOptions.sBrandYn == "N"){
            $(".brandY").addClass("hidden");
            $(".brandY").addClass("hidden");
           // $("#brandY").attr("style","display:none");
           // $("#brandN").attr("style","display:inline");
        }
    }  */
});
</script>


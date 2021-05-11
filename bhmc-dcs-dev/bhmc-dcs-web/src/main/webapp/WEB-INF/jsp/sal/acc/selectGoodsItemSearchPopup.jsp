<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 그룹선택 팝업 -->
<section id="window" class="pop_wrap">
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="packageTab" class="k-state-active"><spring:message code="sal.lbl.package" /></li>     <!-- 패키지 -->
            <li id="itemTab"><spring:message code="sal.lbl.goods" /></li>    <!-- 용품 -->
        </ul>
        <div id="packageTabDiv"> <!--  패키지 TAB - 시작 -->
            <div class="header_area">
                <h1 class="title_basic"><%-- <spring:message code="par.title.packageSub" /> --%></h1>
                <div class="btn_right">
                    <!-- 조회 버튼 -->
                    <button id="btnPackSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    <button id="btnPackSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnPackSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.packageCd" /></th>
                            <td>
                                <input id="sPkgItemCd" name="sPkgItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.packageNm" /></th>
                            <td >
                                <input id="sPkgItemNm" name="sPkgItemNm" class="form_input" />
                            </td>
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
                        <div id="itemGrid" class="grid"></div>
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
                            <div id="parGrid" class="grid"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  <!--  패키지 TAB - 끝 -->
        <div id="itemTabDiv"> <!--  패키지 TAB - 시작 -->
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnGoodsSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    <button id="btnGoodsSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
                </div>
            </div>

            <!-- 조회 조건 시작 -->
            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.strge' /></th>          <!-- 창고 -->
                            <td>
                                <input id="sStrgeCd" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                            <td>
                                <input id="sCarlineCd" class="form_comboBox"  />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.goodsCd' /></th><!-- 용품코드 -->
                            <td>
                                <input id="sItemCd" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.goodsNm' /></th><!-- 용품명 -->
                            <td>
                                <input id="sItemNm" type="text" class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->
            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="goodsGrid"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
    </div>

    <span style="display:none">
        <!-- 패키지 -->
        <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
        <input type="hidden" id="pkgItemNm" name="pkgItemNm" />
    </span>

</section>
<!-- //계약 차량조회(차량마스터) 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var selectTabId;

//구매단가유형:PAR131
var prcTpList = [];
var prcTpObj = {};
<c:forEach var="obj" items="${prcTpDS}">
    prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    $("#sDlrCd").val(options.sDlrCd);
    $("#sCarlineCd").val(options.sCarlineCd);
    //$("#sCarlineNm").val(options.sCarlineNm);

    // 탭
    selectTabId = "packageTab";       // 초기값:패키지
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
            //selectTab(selectTabId); // 탭 조회
        }
    });


    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택
    });

    // 차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
    });

    // 패키지탭 조회 버튼
    $("#btnPackSearch").kendoButton({
        click:function(){
            $("#itemGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 패키지탭 선택 버튼.
    $("#btnPackSelect").kendoButton({
        click:function(e){
            var grid = $('#itemGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var parGrid = $("#parGrid").data("kendoExtGrid");
                var parData = parGrid.dataSource.data();
                options.callbackFunc(parData, "01");
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
   });

    //용품탭 버튼 - 조회
    $("#btnGoodsSearch").kendoButton({
        click:function(e){
            $("#goodsGrid").data('kendoExtGrid').dataSource.page(1);
        }
    });

    //용품탭 선택 버튼.
    $("#btnGoodsSelect").kendoButton({
        click:function(e){
            var grid = $('#goodsGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data, "02");
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    $("#itemGrid").kendoExtGrid({
        dataSource:{
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
                        params["sPkgItemCd"] = $("#sPkgItemCd").val();
                        params["sPkgItemNm"] = $("#sPkgItemNm").val();

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
                       ,pkgItemCd:{ type:"string" , validation:{required:true} }
                       ,pkgItemNm:{ type:"string" , validation:{required:true} }
                    }
                }
            }
          }
        ,editable:false
        ,autoBind:false
        ,selectable:"row"
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            if( selectedItem != null && selectedItem != 'undefined'){

                $("#pkgItemCd").val(selectedItem.pkgItemCd);
                $("#pkgItemNm").val(selectedItem.pkgItemNm);
                $("#parGrid").data("kendoExtGrid").dataSource.read();

            }
        }
        ,height:219
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,resizable:true
        ,columns:[
            {field:"pkgItemCd", title:"<spring:message code='par.lbl.pkgItemCd' />", width:100, attributes:{"class":"ac"}}
            ,{field:"pkgItemNm", title:"<spring:message code='par.lbl.pkgItemNm' />", width:140, attributes:{"class":"ac"}}
        ]
    });
    //부품 설정
    $("#parGrid").kendoExtGrid({
        dataSource:{
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
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                       ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                       ,pkgItemCd:{ type:"string"}
                       ,lineNo:{ type:"string"}
                       ,itemQty:{ type:"number"}
                       ,itemUnitCd:{ type:"string",editable:false}
                       ,itemPrc:{ type:"number",editable:false}
                       ,itemAmt:{ type:"number",editable:false}
                       ,avlbStockQty:{ type:"number",editable:false}
                    }
                }
            }
          }
        ,height:219
        ,pageable:false
        ,autoBind:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:50,attributes:{"class":"ac"}}//부품번호
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150,attributes:{"class":"ac"}}//부품명
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ac"}}//수량
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.prc' />", width:40,attributes:{"class":"ac"}}//수량단위
            ,{field:"avlbStockQty", title:"<spring:message code='ser.lbl.qty' />", attributes:{"class":"ac"}, width:40, hidden:true}//가용재고
        ]
    });

    //용품 그리드 설정
    $("#goodsGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/acc/accessoryMng/selectItemSalePrcPopupByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]  = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"]  = options.skip + options.take;
                        params["sort"]       = options.sort;

                        params["sCarlineCd"]  = $("#sCarlineCd").val();
                        params["sItemCd"]     = $("#sItemCd").val();
                        params["sItemNm"]     = $("#sItemNm").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                   // dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd           :{type:"string"}
                        ,itemCd          :{type:"string"}     //품목코드
                        ,itemNm          :{type:"string"}     //품목명
                        ,stockUnitCd     :{type:"string"}     //재고단위
                        ,prcTp           :{type:"string"}     //구매단가유형
                        ,salePrcAmt      :{type:"number"}     //판매단가
                        ,carlineCd       :{type:"string"}     //
                        ,carlineNm       :{type:"string"}     //
                        ,purcLeadHm      :{type:"string"}     //구매리드타임
                        ,grStrgeCd       :{type:"string"}     //입고창고
                        ,giStrgeCd       :{type:"string"}     //출고창고
                        ,avlbStockQty    :{type:"number"}     //가용재고
                    }
                }
            }
        }
        ,editable:false
        ,sortable:false
        ,autoBind:false
        ,selectable:"row"
        ,height  :236
        ,columns:[
             {field:"dlrCd", hidden:true}
            ,{field:"itemCd",      title:"<spring:message code='sal.lbl.goodsCd' />",   width:100, attributes:{"class":"ac"}} // 용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:150, attributes:{"class":"al"}}          // 용품명
            ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:70, attributes:{"class":"ac"}}        // 단위
            ,{
                field:"prcTp", title:"<spring:message code='par.lbl.purcPrcTp' />", width:100, attributes:{"class":"ar"}
                , template:"#=dms.string.strNvl(prcTpObj[prcTp])#"
            }          // 구매단가유형
            ,{field:"salePrcAmt",  title:"<spring:message code='par.lbl.salePrcAmt' />",   width:100,  attributes:{"class":"ar"}, format:"{0:n2}"}     // 판매단가
            ,{field:"carlineCd",    hidden:true}    // 차종
            ,{field:"carlineNm",    title:"<spring:message code='global.lbl.carlineNm' />",     width:150,  attributes:{"class":"al"}}    // 차종명
            ,{field:"purcLeadHm",      hidden:true}     // 구매리드타임
            ,{
                field:"grStrgeCd", title:"<spring:message code='par.lbl.grStrgeCd' />",   width:100,  attributes:{"class":"al"}
                , template:"#=dms.string.strNvl(strgeCdObj[grStrgeCd])#"
            }    // 입고창고
            ,{
                field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />",   width:100,  attributes:{"class":"al"}
                , template:"#=dms.string.strNvl(strgeCdObj[giStrgeCd])#"
            }    // 출고창고
            ,{field:"avlbStockQty",  title:"<spring:message code='global.lbl.avlbStockQty' />",   width:100,  attributes:{"class":"ar"}, format:"{0:n0}"}     // 가용재고
        ]
    });

    // 그리드 더블클릭.
    $("#goodsGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnGoodsSelect").click();
    });

});


/**
 *  탭별 데이터 조회
 */
/*
 function selectTab(tabId){
    switch (tabId){
        case 'packageTab':       // 패키지
            break;
        case 'itemTab':          // 용품
            break;
        default :
            break;
    }
}
*/

</script>
<!-- //script -->
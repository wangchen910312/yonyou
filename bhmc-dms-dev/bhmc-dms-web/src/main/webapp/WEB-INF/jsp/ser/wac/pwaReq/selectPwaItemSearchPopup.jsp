<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/par/cmm/selectOkPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 부품탐색 팝업 -->
<section id="windows" class="pop_wrap">
    <div id="tabstrip1" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active"><spring:message code="ser.lbl.item" /><!-- 부품 --></li>
            <li><spring:message code="ser.lbl.npnPart" /><!-- NPN 부품 --></li>
        </ul>
        <!-- //탭메뉴 -->
        <div>
            <div class="header_area">
                <div class="btn_right">
                    <!-- 조회 버튼 -->
                    <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                    <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
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
                        <col style="width:23%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.strge" /></th>
                            <td>
                                <input id="sDlrCd" type="hidden" />
                                <input id="sBpCd"  type="hidden"/>
                                <input id="sBpNm"  type="hidden" />
                                <input id="sStrgeCd" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                            <td>
                                <input id="sItemCd" class="form_input" />
                                <input type="hidden" id="sShareItemCd" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                            <td>
                                <input id="sItemNm" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                            <td>
                                <input id="sAbcInd" data-type="combo" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.salePrcTp" /><!-- 가격유형 --></th>
                            <td>
                                <input id="sBrandCd" data-type="combo" class="hidden" />
                                <input id="sPrcTp" type="text"  data-type="combo" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="clfix">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.searchPartsList" /><!-- 조회 부품리스트 --></h2>
                    <div class="btn_right">
                        <button id="btnAdd" class="btn_s btn_Select btn_s_min5"><spring:message code="par.btn.add" /><!-- 추가 --></button>
                    </div>
                </div>
                <div class="table_grid">
                <!-- 그리드1 -->
                    <div id="searchGrid" class="grid"></div>
                <!-- 그리드1 -->
                </div>
            </div>
            <div id="dataForm" class="mt10">
                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active"><spring:message code="par.title.selectItem" /><!-- 선택부품 --></li>
                        <li><spring:message code="par.title.shareItemInfo" /><!-- 공용부품 --></li>
                        <li><spring:message code="par.title.stockGrItemInfo" /><!-- 입고정보 --></li>
                    </ul>
                    <div>
                        <div class="btn_right_absolute">
                            <div class="btn_right">
                                <button id="btnDelete1" name="btnDelete" class="btn_s btn_s_min5"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
                            </div>
                        </div>
                        <div class="table_grid">
                            <!-- 그리드1 -->
                            <div id="selectGrid" class="grid"></div>
                            <!-- 그리드1 -->
                        </div>
                    </div>
                    <div>
                        <div class="btn_right_absolute">
                            <div class="btn_right">
                                <button id="btnAdd02" class="btn_s btn_Select btn_s_min5"><spring:message code="par.btn.add" /><!-- 추가 --></button>
                            </div>
                        </div>
                        <div class="table_grid">
                            <!-- 그리드1 -->
                            <div id="shareItemGrid" class="grid"></div>
                            <!-- 그리드1 -->
                        </div>
                    </div>
                    <div>
                        <div class="table_grid">
                            <!-- 그리드1 -->
                            <div id="stockGiGrid" class="grid"></div>
                            <!-- 그리드1 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="table_grid">
                <div id="npnGrid" class="grid"></div>
            </div>
        </div>
    </div>
</section>


<div class="pop_wrap msgDiv2" style="display:none">
    <div class="msg_box" id="messageId2"></div>
    <%-- <spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /> --%>
    <div class="btn_bottom">
        <button type="button" class="btn_m ok"><spring:message code='par.btn.confirm'/></button>
        <button type="button" class="btn_m cancel"><spring:message code='par.btn.cancel'/></button>
    </div>
</div>
<div id="confirm2"></div>
<script type="text/javascript">

<!-- //부품탐색 팝업 -->

 $("#confirm2").kendoWindow({
     modal: true
     ,title: false
     ,width: 400
     ,pinned: true
     ,visible: false
     ,resizable:false
 });
 var conformKendoWindow2 = $("#confirm2").data("kendoWindow");
 conformKendoWindow2.center();

$(document).ready(function() {


    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var currentWin = parent.selectShareStockGiItemPopupWindow;
     var options = parent.selectShareStockGiItemPopupWindow.options.content.data,
         abcIndList          = [],
         brandCdList         = [],
         abcIndObj           = {},
         carlineCdList       = [],
         carlineCdObj        = {},
         prcTpList           = [],
         prcTpObj            = {},
         popItemObj          = {},
         giStrgeCdList       = [],
         giStrgeCdMap        = [],
         sItemDstinCd,
         avlbStockQtyZeroYn,
         pageTp              = "";

     pageTp = options.pageTp;

     abcIndObj[""] = "";
     <c:forEach var="obj" items="${abcIndList}" varStatus="status">
         abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCd}"});
         abcIndObj["${obj.cmmCd}"] = "${obj.cmmCd}";
     </c:forEach>

     <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
         carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
         carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
     </c:forEach>

     //brandCdList
     brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
     <c:forEach var="obj" items="${brandCdList}" varStatus="status">
       if("${obj.useYn}" === "Y"){
           brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
       }
     </c:forEach>

     prcTpList.push({itemCd:"", itemNm:"ALL"});
     <c:forEach var="obj" items="${prcTpList}" varStatus="status">
         prcTpList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
         prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>
     //giStrgeCdList
     <c:forEach var="obj" items="${giStrgeCdList}">
         if(pageTp == "IN"){//내부수령
             if("${obj.strgeTp}" == "09" || "${obj.strgeTp}" == "10"){//페인트,보조부품 창고유형만
                 giStrgeCdList.push({"strgeCd":"${obj.strgeCd}" ,"strgeNm":"${obj.strgeNm}"});
             }
         }else{
             giStrgeCdList.push({"strgeCd":"${obj.strgeCd}" ,"strgeNm":"${obj.strgeNm}"});
         }
         giStrgeCdMap["${obj.strgeCd}"] = "${obj.strgeNm}";
     </c:forEach>

    // 그리드 더블 클릭 이벤트.
    $("#searchGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnAdd").click();
    });

    // 그리드 더블 클릭 이벤트.
    $("#selectGrid").on("dblclick", "tr.k-state-selected", function (e) {
        //$("button[name=btnDelete]").click();
    });


    /************************************************************
                기능버튼 설정
    *************************************************************/

    //tabstrip
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
    //tabstrip
    $("#tabstrip1").kendoExtTabStrip({
        animation:false
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#searchGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#selectGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");

            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
                currentWin.close();
            }
        }
    });

    // 부품추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e){

            var frGrid   = $("#searchGrid").data("kendoExtGrid"),
                toGrid   = $("#selectGrid").data("kendoExtGrid"),
                rows     = frGrid.select(),
                toRows,
                rowObj   = {};

            if(rows !== null){
                if(rows.length < 1){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                $.each(rows, function(idx, row){

                    rowObj.dlrCd          = frGrid.dataItem(row).dlrCd;
                    rowObj.itemCd         = frGrid.dataItem(row).itemCd;
                    rowObj.itemNm         = frGrid.dataItem(row).itemNm;
                    rowObj.stockUnitCd    = frGrid.dataItem(row).stockUnitCd;
                    rowObj.prcTp          = frGrid.dataItem(row).prcTp;
                    rowObj.purcPrc        = frGrid.dataItem(row).purcPrc;
                    rowObj.stockQty       = frGrid.dataItem(row).stockQty;
                    rowObj.avlbStockQty   = frGrid.dataItem(row).avlbStockQty;
                    rowObj.resvStockQty   = frGrid.dataItem(row).resvStockQty;
                    rowObj.borrowQty      = frGrid.dataItem(row).borrowQty;
                    rowObj.rentQty        = frGrid.dataItem(row).rentQty;
                    rowObj.giQty          = 1;
                    rowObj.markUp         = frGrid.dataItem(row).markUp === 0 ? null : frGrid.dataItem(row).markUp;
                    rowObj.salePrcAmt     = frGrid.dataItem(row).salePrcAmt;
                    rowObj.taxDdctGrtePrc = frGrid.dataItem(row).taxDdctGrtePrc;
                    rowObj.movingAvgPrc   = frGrid.dataItem(row).movingAvgPrc;
                    rowObj.abcInd         = frGrid.dataItem(row).abcInd;
                    rowObj.carlineCd      = frGrid.dataItem(row).carlineCd;
                    rowObj.purcLeadHm     = frGrid.dataItem(row).purcLeadHm;
                    rowObj.grStrgeCd      = frGrid.dataItem(row).grStrgeCd;
                    rowObj.giStrgeCd      = frGrid.dataItem(row).giStrgeCd;


                    if(popItemObj.hasOwnProperty(frGrid.dataItem(row).itemCd)){
                        if(popItemObj[frGrid.dataItem(row).itemCd].hasOwnProperty(frGrid.dataItem(row).giStrgeCd)){
                            //이미 등록되어있는 부품입니다.
                            var itemInfo = frGrid.dataItem(row).itemCd + '[' + frGrid.dataItem(row).itemNm + ']'+ '[' + frGrid.dataItem(row).giStrgeCd + ']';
                            dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                        }else{
                            if(frGrid.dataItem(row).avlbStockQty == 0){
                                $("#messageId2").html("<spring:message code='par.info.nonIssueReq'/>");
                                  conformKendoWindow2.content( $(".msgDiv2").html());
                                  conformKendoWindow2.open();
                                  $(".ok").click(function(){
                                      if($(this).hasClass("ok")){

                                          popItemObj[frGrid.dataItem(row).itemCd][frGrid.dataItem(row).giStrgeCd] = frGrid.dataItem(row).itemNm;
                                          toGrid.dataSource.add(rowObj);

                                          toGrid.select($(this));
                                          $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);

                                          conformKendoWindow2.close();
                                      }
                                  }).end();

                                  $(".cancel").click(function(){
                                      if($(this).hasClass("cancel")){
                                          conformKendoWindow2.close();
                                      }
                                  }).end();
                            } else {
                                popItemObj[frGrid.dataItem(row).itemCd][frGrid.dataItem(row).giStrgeCd] = frGrid.dataItem(row).itemNm;
                                toGrid.dataSource.add(rowObj);

                                toGrid.select($(this));
                                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);

                                conformKendoWindow2.close();
                            }
                        }
                    }else{

                        if(frGrid.dataItem(row).avlbStockQty == 0){
                            $("#messageId2").html("<spring:message code='par.info.nonIssueReq'/>");
                              conformKendoWindow2.content( $(".msgDiv2").html());
                              conformKendoWindow2.open();
                              $(".ok").click(function(){
                                  if($(this).hasClass("ok")){


                                      popItemObj[frGrid.dataItem(row).itemCd] = {};
                                      popItemObj[frGrid.dataItem(row).itemCd][frGrid.dataItem(row).giStrgeCd] = frGrid.dataItem(row).itemNm;
                                      toGrid.dataSource.add(rowObj);

                                      toGrid.select($(this));
                                      $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);

                                      conformKendoWindow2.close();
                                  }
                              }).end();

                              $(".cancel").click(function(){
                                  if($(this).hasClass("cancel")){
                                      conformKendoWindow2.close();
                                  }
                              }).end();
                        } else {
                            popItemObj[frGrid.dataItem(row).itemCd] = {};
                            popItemObj[frGrid.dataItem(row).itemCd][frGrid.dataItem(row).giStrgeCd] = frGrid.dataItem(row).itemNm;
                            toGrid.dataSource.add(rowObj);

                            toGrid.select($(this));
                            $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);

                            conformKendoWindow2.close();
                        }
                    }
                });

                toRows = toGrid.tbody.find("tr");

                toRows.each(function(index, row) {
                    toGrid.select($(this));
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                });

                frGrid.clearSelection();

            }
        }
    });

    // 부품삭제 버튼
    $("button[name=btnDelete]").kendoButton({
        click:function(e){
            var fromGrid   = $("#selectGrid").data("kendoExtGrid"),
                toGrid     = $("#searchGrid").data("kendoExtGrid"),
                rows       = fromGrid.select();

            rows.each(function(index, row) {
                delete popItemObj[fromGrid.dataItem(row).itemCd];
            });
            rows.each(function(index, row) {
                fromGrid.removeRow(row);
            });
        }
    });

    $("#btnAdd02").kendoButton({
        click:function(e){
            var frGrid   = $("#shareItemGrid").data("kendoExtGrid"),
                toGrid   = $("#selectGrid").data("kendoExtGrid"),
                rows     = frGrid.select(),
                toRows,
                rowObj   = {};

            if(rows !== null){
                if(rows.length < 1){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
                $.each(rows, function(idx, row){

                    rowObj.dlrCd          = frGrid.dataItem(row).dlrCd;
                    rowObj.itemCd         = frGrid.dataItem(row).comItemCd;
                    rowObj.itemNm         = frGrid.dataItem(row).comItemNm;
                    rowObj.avlbStockQty   = frGrid.dataItem(row).avlbStockQty;
                    rowObj.giQty          = 1;
                    rowObj.markUp         = frGrid.dataItem(row).markUp === 0 ? null : frGrid.dataItem(row).markUp;
                    rowObj.salePrcAmt     = frGrid.dataItem(row).salePrcAmt;
                    rowObj.movingAvgPrc   = frGrid.dataItem(row).movingAvgPrc;
                    rowObj.carlineCd      = frGrid.dataItem(row).carlineCd;

                    if(popItemObj.hasOwnProperty(frGrid.dataItem(row).comItemCd)){
                        //이미 등록되어있는 부품입니다.
                        var itemInfo = frGrid.dataItem(row).comItemCd + '[' + frGrid.dataItem(row).comItemNm + ']';
                        dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                    }else{
                        popItemObj[frGrid.dataItem(row).comItemCd] = frGrid.dataItem(row).comItemNm;
                        toGrid.dataSource.add(rowObj);

                        toGrid.select($(this));
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    }
                });

                toRows = toGrid.tbody.find("tr");

                toRows.each(function(index, row) {
                    toGrid.select($(this));
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                });

                frGrid.clearSelection();

            }
        }
    });

    $("#sAbcInd").kendoExtDropDownList({
        dataTextField:"itemNm"
       ,dataValueField:"itemCd"
       ,dataSource:abcIndList
       ,optionLabel:" "
       ,index:0
    });
    //sStrgeCd
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    //sCarlineCd
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"itemNm"
       ,dataValueField:"itemCd"
       ,dataSource:carlineCdList
       ,optionLabel:" "
       ,index:0
    });
    //sBrandCd
    $("#sBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandCdList
        ,index:0
    });
    //가격구분
    $("#sPrcTp").kendoExtDropDownList({
        dataTextField:"itemNm"
       ,dataValueField:"itemCd"
       ,dataSource:prcTpList
       ,index:0
    });

    /************************************************************
                조회조건 설정
    *************************************************************/

    if(options.hasOwnProperty("prcTp")){
        $("#sPrcTp").data("kendoExtDropDownList").value(options.prcTp);
    }else{
        $("#sPrcTp").data("kendoExtDropDownList").value('01'); //값이 없으면 소매가[01]
    }
    if(options.hasOwnProperty("carlineCd")){
        $("#sCarlineCd").data("kendoExtDropDownList").value(options.carlineCd);
    }

    if(options.hasOwnProperty("itemDstinCd")){
        sItemDstinCd = options.itemDstinCd;
    }else{
        sItemDstinCd = null;
    }

    if(options.hasOwnProperty("avlbStockQtyZeroYn")){
        if(options.avlbStockQtyZeroYn === "N"){
            avlbStockQtyZeroYn = options.avlbStockQtyZeroYn;
        }else{
            avlbStockQtyZeroYn = null;
        }
        avlbStockQtyZeroYn = options.avlbStockQtyZeroYn;
    }else{
        avlbStockQtyZeroYn = null;
    }

    if(options.sPrcTpYn != undefined ){
        $("#sPrcTp").data("kendoExtDropDownList").enable( (options.sPrcTpYn == "Y") ? true : false);
    }else{
        $("#sPrcTp").data("kendoExtDropDownList").enable(false);
    }


    /************************************************************
                조회 그리드 설정
    *************************************************************/
    var pUrl = "";
    var isHidden = false;
    if(options.sFlag == "IP"){      // 원인부품
        pUrl = "<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />"
        isHidden = true;
    }else{
        pUrl = "<c:url value='/par/cmm/selectItemGrtePrcPopupByCondition.do' />"
        isHidden = false;
    }
    $("#searchGrid").kendoExtGrid({
        gridId:"G-PAR-0803-163201"
       ,height:190
       ,dataSource:{
            transport:{
                read:{
                    url:pUrl
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
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
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sBpCd"] = $("#sBpCd").val();
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sAbcInd"] = $("#sAbcInd").data("kendoExtDropDownList").value();
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sPrcTp"] = $("#sPrcTp").data("kendoExtDropDownList").value();
                        params["sBrandCd"] = $("#sBrandCd").data("kendoExtDropDownList").value();
                        params["sItemDstinCd"]= sItemDstinCd;
                        params["sAvlbStockQtyZeroYn"]= avlbStockQtyZeroYn;
                        params["sGrStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();
                        params["sPageTp"] = pageTp;//페이지구분

                        return kendo.stringify(params);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:true
            ,schema:{
                data:"data"
                , total:"total"
                , model:{
                    id:"itemCd"
                    , fields:{
                          dlrCd        :{ type:"string" }
                        , itemCd       :{ type:"string" }
                        , itemNm       :{ type:"string" }
                        , stockUnitCd  :{ type:"string" }
                        , giStrgeCd    :{ type:"string" }
                        , prcTp        :{ type:"string" }
                        , markUp       :{ type:"number" }
                        , salePrcAmt   :{ type:"number" }
                        , taxDdctGrtePrc :{ type:"number" }
                        , stockQty     :{ type:"number" }
                        , avlbStockQty :{ type:"number" }
                        , resvStockQty :{ type:"number" }
                        , rentQty      :{ type:"number" }
                        , borrowQty    :{ type:"number" }
                        , movingAvgPrc :{ type:"number" }
                        , abcInd       :{ type:"string" }
                        , carlineCd    :{ type:"string" }
                        , purcLeadHm   :{ type:"number" }
                        , grStrgeCd    :{ type:"string" }
                    }
                }
            }
        }
        ,selectable:options.selectable === "multiple"? "multiple,row":"row"
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());

            if( selectedItem != null && selectedItem != 'undefined'){
                $("#sShareItemCd").val(selectedItem.itemCd);
                $("#shareItemGrid").data("kendoExtGrid").dataSource.read();
                $("#stockGiGrid").data("kendoExtGrid").dataSource.read();
            }
        }
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,multiSelectWithCheckbox:true
        ,columns:[
            {field:"dlrCd",title:"<spring:message code='par.lbl.dlrCd' />",width:105,hidden:true}//딜러 코드
            ,{field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:110 }//부품번호
            ,{field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:140 }//부품명
            ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80}
            ,{field:"avlbStockQty",title:"<spring:message code='par.lbl.avlbStockQty' />",attributes:{ "class":"ar"},format:"{0:n0}",width:70 }                //가용재고
            ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80}//예류수량
            ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80}//차출수량
            ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80}//차입수량
            ,{field:"stockUnitCd",title:"<spring:message code='par.lbl.unitNm' />",attributes:{ "class":"ac"},width:70, hidden:true }//단위
            ,{field:"salePrcAmt"
                ,title:"<spring:message code='par.lbl.salePrcAmt' />"
                ,attributes:{ "class":"ar"}
                ,format:"{0:n2}"
                ,width:100
            }//판매단가
            ,{field:"abcInd",title:"<spring:message code='par.lbl.abcInd' />",width:60
                ,template:'#= changeAbcInd(abcInd)#'
            }//ABC CLASS
            ,{field:"carlineCd",title:"<spring:message code='par.lbl.carLine' />" ,width:100
                ,template:'#= changeCarlineCd(carlineCd)#'
            }
        ]
    });

    /**
     * grid 단가&수량
     */
     changeGiEditor = function(container, options) {
         var input = $("<input/>"),
             pValue;

         input.attr("name", options.field);

         input.keyup(function(){

         });

         input.appendTo(container);
         input.kendoExtNumericTextBox({
             min:0,
             spinners:false

         });
     };

    /************************************************************
                선택그리드 설정
    *************************************************************/
    $("#selectGrid").kendoExtGrid({
        gridId:"G-PAR-0803-163202"
       ,dataSource:[]
        ,selectable:options.selectable === "multiple"? "multiple,row":"row"
        ,autoBind:false
        ,filterable:false
        , edit:function(e){
            var eles         = e.container.find("input"),
                grid         = this,
                selectRows   = e.sender.select(),
                selectedItem = e.sender.dataItem(selectRows[0]),
                input        = e.container.find(".k-input"),
                pVal,
                tDate,
                fieldName = grid.columns[e.container.index()].field;

            if(fieldName === "itemCd"||fieldName === "itemNm"||fieldName === "stockQty"||fieldName === "avlbStockQty"
               ||fieldName === "resvStockQty"||fieldName === "borrowQty"||fieldName === "rentQty"
               ||fieldName === "stockUnitCd"||fieldName === "giStrgeCd"||fieldName === "grStrgeCd"||fieldName === "movingAvgPrc"){
                 this.closeCell();
            }
        }
        ,indvColumnRows:3
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,height:147
        ,pageable:false
        ,columns:[
            {field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:120 }//부품번호
            ,{field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:150 }//부품명
            ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:0.00 ,width:80}
            ,{field:"avlbStockQty",title:"<spring:message code='par.lbl.avlbStockQty' />",attributes:{ "class":"ar"},format:"{0:n2}",width:70 }                //가용재고
            ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:0.00 ,width:80}//예류수량
            ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:0.00 ,width:80}//차출수량
            ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />"  ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}//차입수량
            ,{field:"giQty", title:"<spring:message code='par.lbl.partsSaleQty'/>", attributes:{"class":"ar"}, width:70
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                        ,min:0.00
                        ,max:100
                        ,spinners:false
                        ,change:function(){
                            var grid = $("#selectGrid").data("kendoExtGrid"),
                            model = grid.dataItem(this.element.closest("tr"));

                            var avlbStockQty = model.get("avlbStockQty");
                            var giQty = this.value() == null ? 1 : this.value();

                            if(giQty > avlbStockQty){
                                //가용재고보다 출고수량 보다 클때 알람 메시지 출력.
                                $("#messageId").html("<spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${giQty},${avlbStockQty}' />");
                                  conformKendoWindow.content( $(".msgDiv").html());
                                  conformKendoWindow.open();
                                  $(".ok").click(function(){
                                      if($(this).hasClass("ok")){
                                          model.set("giQty", avlbStockQty);
                                      }
                                      conformKendoWindow.close();
                                  }).end();
                            }
                        }
                    });
                }
            }
            ,{field:"salePrcAmt" ,title:"<spring:message code='par.lbl.salePrcAmt' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100
                ,editor:changeGiEditor
            }//판매단가
        ]
    });

    //  ABC CLASS
    changeAbcInd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = abcIndObj[val];
        }
        return returnVal;
    };
    // 차형
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = carlineCdObj[val];
        }
        return returnVal;
    };
    //창고
    changeGiStrgeCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = giStrgeCdMap[val];
        }
        return returnVal;
    };

//#####################################################################################
// NPN 부품 그리드
//#####################################################################################
    $("#npnGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#npnGrid").data("kendoExtGrid");
        selectedGridData(grid );
    });

    //Grid Data Save
    selectedGridData = function(grid){

        var rows = grid.select();

        if(rows != null){

             /* if(dms.string.strNvl(options.claimTp) == ""){
                 dms.notification.warning("<spring:message code='ser.lbl.claimTp' var='claimTp' />"+
                         "<spring:message code='global.info.check.field' arguments='${claimTp}' />");
               return;
             }else if(options.claimTp != "W" && options.claimTp != "S"){
                 dms.notification.warning("<spring:message code='ser.info.notSelNpnPart'  />");
               return;
             }
              */
           var data = [];

           $.each( rows  , function(idx , obj){
                   data.push({
                        itemCd     : grid.dataItem(obj).npnpPartNo
                       ,itemNm     : grid.dataItem(obj).npnpPartNm
                       ,giQty      : grid.dataItem(obj).npnpMaxPerQty
                       ,stockUnitCd: "EA"
                       ,taxDdctGrtePrc    : grid.dataItem(obj).npnpMaxUnitAmt
                       ,salePrcAmt : grid.dataItem(obj).npnpMaxUnitAmt
                       ,cauItemYn  : ""
                       ,npnpYn     : grid.dataItem(obj).npnpYn
                       ,npnpMaxAmt : grid.dataItem(obj).npnpMaxPerAmt
                   });

           });

           options.callbackFunc(data,"NPN");
        }

    };



    //shareItemGrid
    $("#shareItemGrid").kendoExtGrid({
        gridId:"G-PAR-0223-000001"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/comItemMasterByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sort"] = options.sort;

                        params["sItemCd"]      = $("#sShareItemCd").val();
                        params["sPrcTp"]       = $("#sPrcTp").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"comItemCd"
                    ,fields:{
                         dlrCd        :{ type:"string", validation:{required:true}, editable:false }
                        ,itemCd       :{ type:"string" , validation:{required:true}, editable:true }
                        ,comItemCd    :{ type:"string" , validation:{required:true}, editable:true }
                        ,comItemNm    :{ type:"string" , validation:{required:true}, editable:false }
                        ,remark       :{ type:"string" , validation:{required:true}, editable:false }
                        ,itemDstinCd  :{ type:"string" , validation:{required:true}, editable:false }
                        ,carlineCd    :{ type:"string" , validation:{required:true}, editable:false }
                        ,salePrcAmt   :{ type:"number" }
                        ,avlbStockQty :{ type:"number" }
                        ,movingAvgPrc :{ type:"number" }
                    }
                }
            }
        }
        ,editable:false
        ,height:145
        ,pageable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,multiSelectWithCheckbox:false
        ,columns :
            [{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:140 }
            ,{field:"comItemCd", title:"<spring:message code='par.lbl.comItemCd'/>", width:120 }
            ,{field:"comItemNm", title:"<spring:message code='par.lbl.comItemNm'/>", width:200 }
            ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine'/>", width:80 }//carlineCd
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd'/>", width:80 }//carlineCd
            ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:70 }
            ,{field:"salePrcAmt" ,title:"<spring:message code='par.lbl.salePrcAmt' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100 }
            ,{field:"movingAvgPrc"
                ,title:"<spring:message code='par.lbl.movingAvgAmt' />"
                ,attributes:{ "class":"ar"}
                ,format:"{0:n2}"
                ,width:100 }                //이동평균단가
            ,{field:"remark", title:"<spring:message code='par.lbl.remark'/>", width:140 }//bigo
        ]
    });
    //stockGiGrid
    $("#stockGiGrid").kendoExtGrid({
        gridId:"G-PAR-0918-101401"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/receive/selectReceiveHistoryByItemCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sort"] = options.sort;

                        params["sItemCd"] = $("#sShareItemCd").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"movisInvcNo"
                    ,fields:{
                         dlrCd       :{ type:"string",  validation:{required:true}, editable:false }
                        ,movisInvcNo :{ type:"string" , validation:{required:true}, editable:false }
                        ,grStrgeCd   :{ type:"string" , validation:{required:true}, editable:false }
                        ,grLocCd     :{ type:"string" , validation:{required:true}, editable:true }
                        ,itemCd      :{ type:"string" , validation:{required:true}, editable:true }
                        ,itemNm      :{ type:"string" , validation:{required:true}, editable:false }
                        ,invcUnitCd  :{ type:"string" , validation:{required:true}, editable:false }
                        ,purcQty     :{ type:"number" , validation:{required:true}, editable:true }
                        ,invcQty     :{ type:"number" , validation:{required:true}, editable:false }
                        ,grQty       :{ type:"number" , validation:{required:true}, editable:false }
                        ,invcPrc     :{ type:"number" , editable:false }
                        ,taxDdctPrc  :{ type:"number" , editable:true }
                        ,invcAmt     :{ type:"number" , editable:true }
                        ,invcTotAmt  :{ type:"number" , editable:true }
                        ,taxAmt      :{ type:"number" , editable:true }
                        ,invcGrDt    :{ type:"date"   , editable:false }
                    }
                }
            }
        }
        ,editable:false
        ,height:145
        ,pageable:false
        ,autoBind:false
        ,filterable:false
        ,scrollable:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,multiSelectWithCheckbox:false
        ,columns :
            [{field:"invcGrDt", title:"<spring:message code='par.lbl.grDt'/>",width:100 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}
            ,{field:"bpNm",     title:"<spring:message code='par.lbl.bpNm'/>", width:100 }
            ,{field:"itemCd",   title:"<spring:message code='par.lbl.itemCd'/>",width:140 }
            ,{field:"itemNm",   title:"<spring:message code='par.lbl.itemNm'/>", width:180 }
            ,{field:"grQty",    title:"<spring:message code='par.lbl.qty' />", attributes:{"class":"ar"}, format:"{0:n0}", width:80 }
            ,{field:"invcPrc",  title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }
        ]
    });

 // NPN 부품 그리드
    $("#npnGrid").kendoExtGrid({
        gridId:"G-SER-0223-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectNpnParts.do' />"
                    //url:null
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sClaimDt"]   = kendo.parseDate( $("#sClaimDt").val());

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                         npnpPartNo:{type:"string", editable:false}
                        ,npnpPartNm:{type:"string", editable:false, validation:{required:true}}
                        ,npnpMaxPerQty:{type:"number"}
                        ,npnpMaxUnitAmt:{type:"number", editable:false}
                        ,npnpMaxPerAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:550
        ,pageable:false
        ,autoBind:true
        ,editable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,columns:[
             {field:"npnpPartNo", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                 // 부품번호
            ,{field:"npnpPartNm", title:"<spring:message code='ser.lbl.itemNm' />", width:250}                                // 부품명
            ,{field:"npnpMaxPerQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}    // 부품수량
            ,{field:"npnpMaxUnitAmt", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}  // 부품단가
            ,{field:"npnpMaxPerAmt" , hidden:true}                     // NPN MAX AMT
            ,{field:"npnpYn" , hidden:true}                     // NPN YN
        ]
    });


    $("#searchGrid").data("kendoExtGrid").dataSource.read();

});

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/par/cmm/selectOkPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 부품탐색 팝업 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                    <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- ABC CLASS --></th>
                    <td>
                        <input id="sBpTp" data-type="combo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                    <td>
                        <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        <input id="sBrandCd" data-type="combo" class="hidden" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                    <td>
                        <input id="sItemDstinCd" data-type="combo"  class="form_comboBox"/>
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

     var abcIndList = [],
     brandCdList = [],
     abcIndObj = {},
     carlineCdList = [],
     carlineCdObj = {},
     popItemObj = {},
     giStrgeCdList = [],
     giStrgeCdMap = {},
     bpTpList = [],
     bpTpObj = {},
     itemDstinCdList = [],
     itemDstinCdObj = {},
     changeGiEditor = {},
     avlbStockQtyZeroYn;

     /************************************************************
         팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var currentWin = parent.selectStockGiItemForServicePopupWindow;
    var options = parent.selectStockGiItemForServicePopupWindow.options.content.data,
    pageTp = "";

    pageTp = options.pageTp;

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

     <c:forEach var="obj" items="${bpTpList}" varStatus="status">
     if("01" === "${obj.remark2}"){
         bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     }
     </c:forEach>

     <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
         itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     //부품적용.
     function setItemList(frGrid, toGrid, rows, avlbStockQtyUseYn){

         var toRows,
         dupItemCnt = 0,
         dupItemList = [],
         rowObj = {};

         $.each(rows, function(idx, row){
             rowObj.dlrCd          = frGrid.dataItem(row).dlrCd;
             rowObj.itemCd         = frGrid.dataItem(row).itemCd;
             rowObj.itemNm         = frGrid.dataItem(row).itemNm;
             rowObj.stockUnitCd    = frGrid.dataItem(row).stockUnitCd;
             rowObj.purcPrc        = frGrid.dataItem(row).purcPrc;
             rowObj.stockQty       = frGrid.dataItem(row).stockQty;
             rowObj.avlbStockQty   = frGrid.dataItem(row).avlbStockQty;
             rowObj.resvStockQty   = frGrid.dataItem(row).resvStockQty;
             rowObj.borrowQty      = frGrid.dataItem(row).borrowQty;
             rowObj.rentQty        = frGrid.dataItem(row).rentQty;
             rowObj.giQty          = 1;
             rowObj.markUp         = frGrid.dataItem(row).markUp === 0 ? null : frGrid.dataItem(row).markUp;
             rowObj.retlPrc        = frGrid.dataItem(row).retlPrc;
             rowObj.whslPrc        = frGrid.dataItem(row).whslPrc;
             rowObj.incPrc         = frGrid.dataItem(row).incPrc;
             rowObj.grtePrc        = frGrid.dataItem(row).grtePrc;
             rowObj.taxDdctGrtePrc = frGrid.dataItem(row).taxDdctGrtePrc;
             rowObj.salePrcAmt     = frGrid.dataItem(row).salePrcAmt;
             rowObj.movingAvgPrc   = frGrid.dataItem(row).movingAvgPrc;
             rowObj.abcInd         = frGrid.dataItem(row).abcInd;
             rowObj.carlineCd      = frGrid.dataItem(row).carlineCd;
             rowObj.purcLeadHm     = frGrid.dataItem(row).purcLeadHm;
             rowObj.grStrgeCd      = frGrid.dataItem(row).grStrgeCd;
             rowObj.giStrgeCd      = frGrid.dataItem(row).giStrgeCd;
             rowObj.giLocCd        = frGrid.dataItem(row).locCd;
             rowObj.giLocNm        = frGrid.dataItem(row).locNm;

             //부품유무체크.
             if(popItemObj[frGrid.dataItem(row).itemCd] == undefined){
                 popItemObj[frGrid.dataItem(row).itemCd] = {};
             }

             //종료된 부품인 경우
             if(frGrid.dataItem(row).endChk === 'N'){
                 var itemInfo = frGrid.dataItem(row).itemCd + '[' + frGrid.dataItem(row).itemNm + ']'+ '[' + frGrid.dataItem(row).giStrgeCd + '] ' + "<spring:message code='par.lbl.useYn'/>";
                 dms.notification.warning("<spring:message code='global.info.confirmMsgParam' arguments='" + itemInfo + "'/>");
             }else{
                 if(popItemObj[frGrid.dataItem(row).itemCd].hasOwnProperty(frGrid.dataItem(row).giStrgeCd)){
                     //중복부품체크.
                     dupItemCnt++;
                     dupItemList.push(frGrid.dataItem(row).itemCd);
                 }else{
                     if(avlbStockQtyUseYn){//가용재고 체크없이 모두
                         popItemObj[frGrid.dataItem(row).itemCd][frGrid.dataItem(row).giStrgeCd] = frGrid.dataItem(row).itemNm;
                         toGrid.dataSource.add(rowObj);
                     }else{
                         var avlbStockQty = kendo.parseFloat(frGrid.dataItem(row).avlbStockQty);
                         if(avlbStockQty > 0){
                             popItemObj[frGrid.dataItem(row).itemCd][frGrid.dataItem(row).giStrgeCd] = frGrid.dataItem(row).itemNm;
                             toGrid.dataSource.add(rowObj);
                         }
                     }
                 }
             }
             toGrid.select($(this));
             $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
         });

         //중복부품 메시지 처리.
         if(dupItemCnt > 0){
             dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + dupItemList + "'/>");
         }

         toRows = toGrid.tbody.find("tr");

         toRows.each(function(index, row) {
             toGrid.select($(this));
             $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
         });

         frGrid.clearSelection();
     }

    $(document).ready(function() {

        //changeItemDstinCd Func
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(itemDstinCdObj[val] != undefined){
                    returnVal = itemDstinCdObj[val];
                }
            }
            return returnVal;
        };

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
                }
            }
        });

        // 부품추가 버튼
        $("#btnAdd").kendoButton({
            click:function(e){

                var frGrid = $("#searchGrid").data("kendoExtGrid"),
                    toGrid = $("#selectGrid").data("kendoExtGrid"),
                    rows = frGrid.select(),
                    avlbStockQtyCnt = 0,
                    avlbStockQtyUseYn = false;

                if(rows !== null){
                    if(rows.length < 1){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    $.each(rows, function(idx, row){
                        var avlbStockQty = kendo.parseFloat(frGrid.dataItem(row).avlbStockQty);
                        if(avlbStockQty == 0){
                            avlbStockQtyCnt++;
                        }
                    });

                    if(avlbStockQtyCnt > 0){
                        $("#messageId2").html("<spring:message code='par.info.nonIssueReq'/>");
                        conformKendoWindow2.content( $(".msgDiv2").html());
                        conformKendoWindow2.open();
                        $(".ok").click(function(){
                            if($(this).hasClass("ok")){
                                avlbStockQtyUseYn = true;
                                conformKendoWindow2.close();
                                setItemList(frGrid, toGrid, rows, avlbStockQtyUseYn);
                            }
                        }).end();

                        $(".cancel").click(function(){
                            if($(this).hasClass("cancel")){
                                conformKendoWindow2.close();
                                setItemList(frGrid, toGrid, rows, avlbStockQtyUseYn);
                            }
                        }).end();
                    }else{
                        setItemList(frGrid, toGrid, rows, avlbStockQtyUseYn);
                    }
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
                        rowObj.stockUnitCd    = frGrid.dataItem(row).stockUnitCd;
                        rowObj.purcPrc        = frGrid.dataItem(row).purcPrc;
                        rowObj.stockQty       = frGrid.dataItem(row).stockQty;
                        rowObj.avlbStockQty   = frGrid.dataItem(row).avlbStockQty;
                        rowObj.resvStockQty   = frGrid.dataItem(row).resvStockQty;
                        rowObj.borrowQty      = frGrid.dataItem(row).borrowQty;
                        rowObj.rentQty        = frGrid.dataItem(row).rentQty;
                        rowObj.giQty          = 1;
                        rowObj.markUp         = frGrid.dataItem(row).markUp === 0 ? null : frGrid.dataItem(row).markUp;
                        rowObj.retlPrc        = frGrid.dataItem(row).retlPrc;
                        rowObj.whslPrc        = frGrid.dataItem(row).whslPrc;
                        rowObj.incPrc         = frGrid.dataItem(row).incPrc;
                        rowObj.grtePrc        = frGrid.dataItem(row).grtePrc;
                        rowObj.taxDdctGrtePrc = frGrid.dataItem(row).taxDdctGrtePrc;
                        rowObj.movingAvgPrc   = frGrid.dataItem(row).movingAvgPrc;
                        rowObj.abcInd         = frGrid.dataItem(row).abcInd;
                        rowObj.carlineCd      = frGrid.dataItem(row).carlineCd;
                        rowObj.purcLeadHm     = frGrid.dataItem(row).purcLeadHm;
                        rowObj.grStrgeCd      = frGrid.dataItem(row).grStrgeCd;
                        rowObj.giStrgeCd      = frGrid.dataItem(row).giStrgeCd;
                        rowObj.giLocCd        = frGrid.dataItem(row).locCd;
                        rowObj.giLocNm        = frGrid.dataItem(row).locNm;

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

        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:bpTpList
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

        //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dms.data.cmmCdFilter(itemDstinCdList)
            ,optionLabel:"<spring:message code='global.lbl.check' />"
            ,index:0
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/

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
                 format: "n2"
                 ,decimals:2
                 ,restrictDecimals: true
                 ,min:0
                 ,spinners:false
             });
         };
        /************************************************************
                    조회 그리드 설정
        *************************************************************/
        $("#searchGrid").kendoExtGrid({
            gridId:"G-PAR-0320-143201"
           ,height:190
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectItemSalePrcForServicePopupByCondition.do' />"
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
                            params["sDlrCd"]       = $("#sDlrCd").val();
                            params["sBpCd"]        = $("#sBpCd").val();
                            params["sItemCd"]      = $("#sItemCd").val();
                            params["sItemNm"]      = $("#sItemNm").val();
                            params["sBpTp"]        = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]   = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sBrandCd"]     = $("#sBrandCd").data("kendoExtDropDownList").value();
                            params["sAvlbStockQtyZeroYn"]= avlbStockQtyZeroYn;
                            params["sGrStrgeCd"]   = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sPageTp"]      = pageTp;//페이지구분

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
                            , markUp       :{ type:"number" }
                            , retlPrc      :{ type:"number" }
                            , whslPrc      :{ type:"number" }
                            , incPrc       :{ type:"number" }
                            , grtePrc      :{ type:"number" }
                            , taxDdctGrtePrc :{ type:"number" }
                            , salePrcAmt   :{ type:"number" }
                            , stockQty     :{ type:"number" }
                            , avlbStockQty :{ type:"number" }
                            , resvStockQty :{ type:"number" }
                            , rentQty      :{ type:"number" }
                            , borrowQty    :{ type:"number" }
                            , movingAvgPrc :{ type:"number" }
                            , movingAvgTaxDdctPrc :{ type:"number" }
                            , abcInd       :{ type:"string" }
                            , carlineCd    :{ type:"string" }
                            , purcLeadHm   :{ type:"number" }
                            , grStrgeCd    :{ type:"string" }
                            , locCd        :{ type:"string" }
                            , locNm        :{ type:"string" }
                            , bpTp         :{ type:"string" }
                            , bpCd         :{ type:"string" }
                            , bpNm         :{ type:"string" }
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
                ,{field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:110,sortable:false }//부품번호
                ,{field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:140,sortable:false }//부품명
                ,{field:"giStrgeCd" ,title:"<spring:message code='par.lbl.strge' />" ,width:120
                    ,template:'#= changeGiStrgeCd(giStrgeCd)#'
                    ,sortable:false
                }//부품창고
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                ,{field:"avlbStockQty",title:"<spring:message code='par.lbl.avlbStockQty' />",attributes:{ "class":"ar"},format:"{0:n2}",width:70 }                //가용재고
                ,{field:"bpTp",title:"<spring:message code='par.lbl.bpTpNm' />",width:60
                    ,template:'#= changeBpTp(bpTp)#'
                    ,sortable:false
                 }//공급처유형
                ,{field:"bpCd", title:"<spring:message code='par.lbl.bpTp' />" ,width:120, hidden:true}//공급업체
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpTp' />" ,width:120}//공급업체
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80,sortable:false}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80,sortable:false}//차출수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80,sortable:false}//차입수량
                ,{field:"stockUnitCd",title:"<spring:message code='par.lbl.unitNm' />",attributes:{ "class":"ac"},width:70, hidden:true }//단위
                ,{field:"retlPrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost01' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //소매가
                ,{field:"whslPrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost02' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //도매가
                ,{field:"incPrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost03' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //보험가
                ,{field:"grtePrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost04' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //보증가
                ,{field:"taxDdctGrtePrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost04' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false
                    ,hidden:true}                //보증가(세금제외)
                ,{field:"salePrcAmt"
                    ,title:"<spring:message code='par.lbl.salePrcAmt' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false
                    ,hidden:true}                //판매단가
                ,{field:"movingAvgPrc"
                    ,title:"<spring:message code='par.lbl.movingAvgAmt' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false
                }                //이동평균단가
                ,{field:"movingAvgTaxDdctPrc"
                    ,title:"<spring:message code='par.lbl.movingAvgPrc' />(<spring:message code='par.lbl.taxSprt' />)"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,width:100
                    ,hidden:true}                //이동평균단가
                ,{field:"abcInd",title:"<spring:message code='par.lbl.abcInd' />",width:60 ,sortable:false}//ABC CLASS
                ,{field:"carlineCd",title:"<spring:message code='par.lbl.carLine' />" ,width:100
                    ,template:'#= changeCarlineCd(carlineCd)#'
                    ,sortable:false
                }
                ,{field:"locCd", title:"<spring:message code='par.lbl.giLocCd' />", width:100, hidden:true}//giLocCd
                ,{field:"locNm", title:"<spring:message code='par.lbl.giLocCd' />", width:100, hidden:true}//locNm
            ]
        });

        /************************************************************
                    선택그리드 설정
        *************************************************************/
        $("#selectGrid").kendoExtGrid({
            gridId:"G-PAR-0320-153202"
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
                   ||fieldName === "resvStockQty"||fieldName === "borrowQty"||fieldName === "rentQty"||fieldName === "locCd"||fieldName === "locNm"
                   ||fieldName === "stockUnitCd"||fieldName === "giStrgeCd"||fieldName === "grStrgeCd"||fieldName === "movingAvgPrc"
                   ||fieldName === "retlPrc"||fieldName === "whslPrc"||fieldName === "incPrc"||fieldName === "grtePrc"){
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
                ,{field:"giStrgeCd" ,title:"<spring:message code='par.lbl.strge' />" ,width:120
                    ,template:'#= changeGiStrgeCd(giStrgeCd)#'
                }//부품창고
                ,{field:"giQty", title:"<spring:message code='par.lbl.partsSaleQty'/>", attributes:{"class":"ar"}, width:70
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n2"
                            ,min:1
                            ,decimals:2
                            ,restrictDecimals: true
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
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:0 ,width:80}
                ,{field:"avlbStockQty",title:"<spring:message code='par.lbl.avlbStockQty' />",attributes:{ "class":"ar"},format:"{0:n2}",width:70 }                //가용재고
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:0 ,width:80}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:0 ,width:80}//차출수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />"  ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}//차입수량
                ,{field:"retlPrc" ,title:"<spring:message code='par.lbl.salePriceCost01' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100
                    ,editor:changeGiEditor}                //도매가
                ,{field:"whslPrc" ,title:"<spring:message code='par.lbl.salePriceCost02' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100
                    ,editor:changeGiEditor}                //소매가
                ,{field:"incPrc" ,title:"<spring:message code='par.lbl.salePriceCost03' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100
                    ,editor:changeGiEditor}                //보험가
                ,{field:"grtePrc" ,title:"<spring:message code='par.lbl.salePriceCost04' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100
                    ,editor:changeGiEditor}                //보증가
                ,{field:"movingAvgPrc"
                    ,title:"<spring:message code='par.lbl.movingAvgAmt' />"
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,width:100
                    ,template:function(data){return ""}}                //이동평균단가
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.giLocCd' />", width:100, hidden:true}//giLocCd
                ,{field:"giLocNm", title:"<spring:message code='par.lbl.giLocCd' />", width:100, hidden:true}//locNm
            ]
        });

        //  공급처유형
        changeBpTp = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(bpTpObj[val])){
                    returnVal = bpTpObj[val];
                }
            }
            return returnVal;
        };
        //  ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(abcIndObj[val])){
                    returnVal = abcIndObj[val];
                }
            }
            return returnVal;
        };
        // 차형
        changeCarlineCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(carlineCdObj[val])){
                    returnVal = carlineCdObj[val];
                }
            }
            return returnVal;
        };
        //창고
        changeGiStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(giStrgeCdMap[val])){
                    returnVal = giStrgeCdMap[val];
                }
            }

            return returnVal;
        };

        //shareItemGrid
        $("#shareItemGrid").kendoExtGrid({
            gridId:"G-PAR-0320-152503"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/comItemMasterStockByCondition.do' />"
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
                        id:"comItemCd"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,stockUnitCd:{ type:"string" }
                            ,giStrgeCd:{ type:"string" }
                            ,retlPrc:{ type:"number" }
                            ,whslPrc:{ type:"number" }
                            ,incPrc:{ type:"number" }
                            ,grtePrc:{ type:"number" }
                            ,taxDdctGrtePrc:{ type:"number" }
                            ,stockQty:{ type:"number" }
                            ,avlbStockQty:{ type:"number" }
                            ,resvStockQty:{ type:"number" }
                            ,rentQty:{ type:"number" }
                            ,borrowQty:{ type:"number" }
                            ,movingAvgPrc:{ type:"number" }
                            ,abcInd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,purcLeadHm:{ type:"number" }
                            ,grStrgeCd:{ type:"string" }
                            ,locCd:{ type:"string" }
                            ,locNm:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:false
            ,height:145
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:false
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,columns :
                [{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:140 }
                ,{field:"comItemCd", title:"<spring:message code='par.lbl.comItemCd'/>", width:120 }
                ,{field:"comItemNm", title:"<spring:message code='par.lbl.comItemNm'/>", width:200 }
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine'/>", width:80 }//carlineCd
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd'/>", width:80
                    ,template:'#= changeItemDstinCd(itemDstinCd)#'
                }//carlineCd
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.strge'/>", width:80 , hidden:true}//창고
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:70 }
                ,{field:"retlPrc" ,title:"<spring:message code='par.lbl.salePrcAmt' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100 }
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
            gridId:"G-PAR-0320-101433"
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
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,columns :
                [{field:"invcGrDt", title:"<spring:message code='par.lbl.grDt'/>",width:100 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}
                ,{field:"bpNm",     title:"<spring:message code='par.lbl.bpNm'/>", width:100 }
                ,{field:"itemCd",   title:"<spring:message code='par.lbl.itemCd'/>",width:140 }
                ,{field:"itemNm",   title:"<spring:message code='par.lbl.itemNm'/>", width:180 }
                ,{field:"grQty",    title:"<spring:message code='par.lbl.qty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }
                ,{field:"invcPrc",  title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }
            ]
        });

        $("#searchGrid").data("kendoExtGrid").dataSource.read();

    });

 </script>

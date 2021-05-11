<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 부품선택 팝업 -->
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.strge" /></th>
                        <td>
                            <input id="sDlrCd" class="hidden" />
                            <input id="sBpCd" class="hidden"/>
                            <input id="sBpNm" class="hidden"/>
                            <input id="sBpTp" class="hidden"/>
                            <input id="sPurcTp" class="hidden"/>
                            <input id="sStrgeCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
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
                        <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                        <td>
                            <input id="sBrandCd" data-type="combo" class="form_comboBox" />
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
                    <li><spring:message code="par.title.priceAvgInfo" /><!-- 가격평균정보 --></li>
                </ul>
                <div>
                    <div class="btn_right_absolute">
                        <div class="btn_right">
                            <button id="btnDelete1" name="btnDelete" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
                        </div>
                    </div>
                    <div class="table_grid">
                    <!-- 그리드1 -->
                        <div id="selectGrid" class="grid"></div>
                    <!-- 그리드1 -->
                    </div>
                </div>
                <div id="summaryForm">
                    <div class="btn_right_absolute">
                        <div class="btn_right">
                            <button id="btnDelete2" name="btnDelete" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
                        </div>
                    </div>
                    <div class="table_form form_width_100per">
                        <h1 class="title_basic"><spring:message code="par.title.3MonthAdv" /><!-- 3개월평균 --></h1>
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
                                    <th scope="row"><spring:message code="par.lbl.giCnt" /><!-- 출고빈도 --></th>
                                    <td>
                                        <input id="mm3GiItemCnt" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.grCnt" /><!-- 입고빈도 --></th>
                                    <td>
                                        <input id="mm3GrItemCnt" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.giQty" /><!-- 출고수량 --></th>
                                    <td>
                                        <input id="mm3GiItemSum" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                                    <td>
                                        <input id="mm3GrItemSum" readonly class="form_numeric"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form form_width_100per mt5">
                        <h1 class="title_basic"><spring:message code="par.title.6MonthAdv" /><!-- 6개월평균 --></h1>
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
                                    <th scope="row"><spring:message code="par.lbl.giCnt" /><!-- 출고빈도 --></th>
                                    <td>
                                        <input id="mm6GiItemCnt" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.grCnt" /><!-- 입고빈도 --></th>
                                    <td>
                                        <input id="mm6GrItemCnt" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.giQty" /><!-- 출고수량 --></th>
                                    <td>
                                        <input id="mm6GiItemSum" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                                    <td>
                                        <input id="mm6GrItemSum" readonly class="form_numeric"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form form_width_100per mt5">
                        <h1 class="title_basic"><spring:message code="par.title.thisMonthAdv" /><!-- 당월평균 --></h1>
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
                                    <th scope="row"><spring:message code="par.lbl.giCnt" /><!-- 출고빈도 --></th>
                                    <td>
                                        <input id="mmGiItemCnt" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.grCnt" /><!-- 입고빈도 --></th>
                                    <td>
                                        <input id="mmGrItemCnt" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.giQty" /><!-- 출고수량 --></th>
                                    <td>
                                        <input id="mmGiItemSum" readonly class="form_numeric"/>
                                    </td>
                                    <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                                    <td>
                                        <input id="mmGrItemSum" readonly class="form_numeric"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.itemByBpCdPopupWindow.options.content.data,
             abcIndList          = [],
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             brandCdList         = [],
             popItemObj          = {},
             grStrgeCdObj        = {},
             grStrgeCdList       = [],
             useYnObj            = {},
             pItemDstinCd        = options.itemDstinCd;

         //useYnList
         <c:forEach var="obj" items="${useYnList}">
             useYnObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>


         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
         </c:forEach>

         //brandCdList
         <c:forEach var="obj" items="${brandCdList}" varStatus="status">
           if("${obj.useYn}" === "Y"){
               brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
           }
         </c:forEach>

        //grStrgeCdList
        grStrgeCdObj[' '] = "";
         <c:forEach var="obj" items="${giStrgeCdList}">
             grStrgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
             grStrgeCdList.push({"strgeCd":"${obj.strgeCd}" ,"strgeNm":"${obj.strgeNm}"});
         </c:forEach>

        // 그리드 더블 클릭 이벤트.
        $("#searchGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnAdd").click();
        });

        // 그리드 더블 클릭 이벤트.
        $("#selectGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("button[name=btnDelete]").click();
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
                var rows = grid.select();

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
                        rowObj.purcPrc        = frGrid.dataItem(row).bmpPurcPrc;
                        rowObj.avlbStockQty   = frGrid.dataItem(row).avlbStockQty;
                        rowObj.resvStockQty   = frGrid.dataItem(row).resvStockQty;
                        rowObj.stockQty       = frGrid.dataItem(row).stockQty;
                        rowObj.borrowQty      = frGrid.dataItem(row).borrowQty;
                        rowObj.rentQty        = frGrid.dataItem(row).rentQty;
                        rowObj.abcInd         = frGrid.dataItem(row).abcInd;
                        rowObj.carlineCd      = frGrid.dataItem(row).carlineCd;
                        rowObj.carlineCd2     = frGrid.dataItem(row).carlineCd2;
                        rowObj.purcLeadHm     = frGrid.dataItem(row).purcLeadHm;
                        rowObj.strgeCdList    = frGrid.dataItem(row).strgeCdList;
                        rowObj.grStrgeCd      = frGrid.dataItem(row).grStrgeCd;
                        rowObj.minPurcQty     = frGrid.dataItem(row).minPurcQty;
                        rowObj.minPackQty     = frGrid.dataItem(row).minPackQty;
                        rowObj.movingAvgPrc   = frGrid.dataItem(row).movingAvgPrc;
                        rowObj.bpTp           = frGrid.dataItem(row).bpTp;
                        rowObj.itemDstinCd    = frGrid.dataItem(row).itemDstinCd;
                        rowObj.locCd          = frGrid.dataItem(row).locCd;
                        rowObj.abcInd         = frGrid.dataItem(row).abcInd;
                        rowObj.parSpecCd      = frGrid.dataItem(row).parSpecCd;

                        //종료된 부품인 경우
                        /*if(frGrid.dataItem(row).endChk === 'N'){
                            var itemInfo = frGrid.dataItem(row).itemCd + '[' + frGrid.dataItem(row).itemNm + '] ' + "<spring:message code='par.lbl.useYn'/>";
                            dms.notification.warning("<spring:message code='global.info.confirmMsgParam' arguments='" + itemInfo + "'/>");
                        }else{*/
                            if(popItemObj.hasOwnProperty(frGrid.dataItem(row).itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = frGrid.dataItem(row).itemCd + '[' + frGrid.dataItem(row).itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                popItemObj[frGrid.dataItem(row).itemCd] = frGrid.dataItem(row).itemNm;
                                toGrid.dataSource.add(rowObj);

                                toGrid.select($(this));
                                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                            }
                        //}
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

        //sStrgeCd
        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"strgeNm"
            ,dataValueField:"strgeCd"
            ,dataSource:grStrgeCdList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:abcIndList
           ,optionLabel:" "
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           ,index:0
       });

        //브랜드:검색
        $("#sBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,optionLabel:" "
            ,index:0
        });

        //6개월출고건수
        $("#mm6GiItemCnt").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //6개월입고건수
        $("#mm6GrItemCnt").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //6개월출고합
        $("#mm6GiItemSum").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //6개월입고합
        $("#mm6GrItemSum").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //3개월출고건수
        $("#mm3GiItemCnt").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //3개월입고건수
        $("#mm3GrItemCnt").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //3개월출고합
        $("#mm3GiItemSum").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //3개월입고합
        $("#mm3GrItemSum").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //당월출고건수
        $("#mmGiItemCnt").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //당월입고건수
        $("#mmGrItemCnt").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //당월출고합
        $("#mmGiItemSum").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //당월입고합
        $("#mmGrItemSum").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        $("#mm3GiItemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#mm3GrItemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#mm3GiItemSum").data("kendoExtNumericTextBox").enable(false);
        $("#mm3GrItemSum").data("kendoExtNumericTextBox").enable(false);
        $("#mm6GiItemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#mm6GrItemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#mm6GiItemSum").data("kendoExtNumericTextBox").enable(false);
        $("#mm6GrItemSum").data("kendoExtNumericTextBox").enable(false);
        $("#mmGiItemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#mmGrItemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#mmGiItemSum").data("kendoExtNumericTextBox").enable(false);
        $("#mmGrItemSum").data("kendoExtNumericTextBox").enable(false);


        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sBpTp").val(options.bpTp);
        $("#sPurcTp").val(options.purcTp);

        /************************************************************
                    조회 그리드 설정
        *************************************************************/
        $("#searchGrid").kendoExtGrid({
            gridId:"G-PAR-0803-164401"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectReceiveEtcBorrowByCondition.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sPurcTpLst = [];

                            if(!dms.string.isEmpty($("#sPurcTp").val())){
                                sPurcTpLst = $("#sPurcTp").val().split(',');
                            }


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 품목구분코드.
                            params["sDlrCd"]        = $("#sDlrCd").val();
                            params["sBpTp"]         = $("#sBpTp").val();
                            params["sItemCd"]       = $("#sItemCd").val();
                            params["sItemNm"]       = $("#sItemNm").val();
                            params["sAbcInd"]       = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]    = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]  = pItemDstinCd;
                            params["sBrandCd"]      = $("#sBrandCd").data("kendoExtDropDownList").value();
                            params["sGrStrgeCd"]    = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sPurcTpList"]   = sPurcTpLst;

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
                            , prcTp        :{ type:"string" }
                            , purcPrc      :{ type:"number" }
                            , lastGrPrc    :{ type:"number" }
                            , bmpPurcPrc   :{ type:"number" }
                            , movingAvgPrc :{ type:"number" }
                            , avlbStockQty :{ type:"number" }
                            , resvStockQty :{ type:"number" }
                            , stockQty     :{ type:"number" }
                            , rentQty      :{ type:"number" }
                            , borrowQty    :{ type:"number" }
                            , abcInd       :{ type:"string" }
                            , carlineCd    :{ type:"string" }
                            , purcLeadHm   :{ type:"number" }
                            , grStrgeCd    :{ type:"string" }
                            , strgeCdList  :{ type:"string" }
                            , minPurcQty   :{ type:"number" }
                            , endChk       :{ type:"string" }
                            , parSpecCd    :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,height:190
            ,change:function(e){
                var selectedItem = this.dataItem(this.select()),
                    grid          = $("#searchGrid").data("kendoExtGrid"),
                    rows          = grid.select();

                if(rows.length === 1){
                    if( selectedItem != null && selectedItem != 'undefined'){


                        $.ajax({
                            url:"<c:url value='/par/pmm/mvtDoc/selectGrGiSummaryByItemCd.do' />",
                            data:JSON.stringify({ sItemCd:selectedItem.itemCd}),
                            type:"POST",
                            dataType:"json",
                            contentType:"application/json",
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        }).done(function(result) {

                            if(!dms.string.isEmpty(result.data[0])){
                                $("#mm3GiItemCnt").data("kendoExtNumericTextBox").value(result.data[0].mm3GiItemCnt);
                                $("#mm3GrItemCnt").data("kendoExtNumericTextBox").value(result.data[0].mm3GrItemCnt);
                                $("#mm3GiItemSum").data("kendoExtNumericTextBox").value(result.data[0].mm3GiItemSum);
                                $("#mm3GrItemSum").data("kendoExtNumericTextBox").value(result.data[0].mm3GrItemSum);
                                $("#mm6GiItemCnt").data("kendoExtNumericTextBox").value(result.data[0].mm6GiItemCnt);
                                $("#mm6GrItemCnt").data("kendoExtNumericTextBox").value(result.data[0].mm6GrItemCnt);
                                $("#mm6GiItemSum").data("kendoExtNumericTextBox").value(result.data[0].mm6GiItemSum);
                                $("#mm6GrItemSum").data("kendoExtNumericTextBox").value(result.data[0].mm6GrItemSum);
                                $("#mmGiItemCnt").data("kendoExtNumericTextBox").value(result.data[0].mmGiItemCnt);
                                $("#mmGrItemCnt").data("kendoExtNumericTextBox").value(result.data[0].mmGrItemCnt);
                                $("#mmGiItemSum").data("kendoExtNumericTextBox").value(result.data[0].mmGiItemSum);
                                $("#mmGrItemSum").data("kendoExtNumericTextBox").value(result.data[0].mmGrItemSum);
                            }else{
                                $("#mm3GiItemCnt").data("kendoExtNumericTextBox").value(0);
                                $("#mm3GrItemCnt").data("kendoExtNumericTextBox").value(0);
                                $("#mm3GiItemSum").data("kendoExtNumericTextBox").value(0);
                                $("#mm3GrItemSum").data("kendoExtNumericTextBox").value(0);
                                $("#mm6GiItemCnt").data("kendoExtNumericTextBox").value(0);
                                $("#mm6GrItemCnt").data("kendoExtNumericTextBox").value(0);
                                $("#mm6GiItemSum").data("kendoExtNumericTextBox").value(0);
                                $("#mm6GrItemSum").data("kendoExtNumericTextBox").value(0);
                                $("#mmGiItemCnt").data("kendoExtNumericTextBox").value(0);
                                $("#mmGrItemCnt").data("kendoExtNumericTextBox").value(0);
                                $("#mmGiItemSum").data("kendoExtNumericTextBox").value(0);
                                $("#mmGrItemSum").data("kendoExtNumericTextBox").value(0);
                            }
                        });

                    }
                }else{
                    $("#mm3GiItemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#mm3GrItemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#mm3GiItemSum").data("kendoExtNumericTextBox").value(0);
                    $("#mm3GrItemSum").data("kendoExtNumericTextBox").value(0);
                    $("#mm6GiItemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#mm6GrItemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#mm6GiItemSum").data("kendoExtNumericTextBox").value(0);
                    $("#mm6GrItemSum").data("kendoExtNumericTextBox").value(0);
                    $("#mmGiItemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#mmGrItemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#mmGiItemSum").data("kendoExtNumericTextBox").value(0);
                    $("#mmGrItemSum").data("kendoExtNumericTextBox").value(0);
                }

             }
            ,columns:[
                {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105 ,hidden:true}//딜러 코드
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:110 }//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:140 }//부품명
                ,{field:"stockUnitCd" ,title:"<spring:message code='par.lbl.unitNm' />" ,attributes:{ "class":"ac"} ,width:60}//단위
                ,{field:"grStrgeCd" ,title:"<spring:message code='par.lbl.strge' />" ,width:100
                    ,template:'#= changeStrgeCd(grStrgeCd)#'
                    ,hidden:true
                }//입고창고
                ,{field:"strgeCdList" ,title:"<spring:message code='par.lbl.strge' />" ,width:150
                }//입고창고
                ,{field:"lastGrPrc" ,title:"<spring:message code='par.lbl.lastGrPrice' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100}//최신입고가
                ,{field:"bmpPurcPrc" ,title:"BMP <spring:message code='par.lbl.purcPrc' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100}//BMP구매단가
                ,{field:"purcPrc" ,title:"<spring:message code='par.lbl.purcPrc' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100,hidden:true}//구매단가
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.movingAvgPrc' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100}//이동평균단가
                ,{field:"minPurcQty" ,title:"<spring:message code='par.lbl.minPurcQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100 ,hidden:true}//최소구매수량
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.stockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:70 }//가용재고
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:70 }//실재고
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:70 }//예류재고
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowItemQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd' />" ,width:60}//ABC CLASS
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />" ,width:100
                    ,template:'#= changeCarlineCd(carlineCd)#'
                }
                ,{field:"purcLeadHm" ,title:"<spring:message code='par.lbl.purcLeadHm' />" ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,width:100 ,hidden:true}//구매리드타임
                ,{field:"endChk" ,title:"<spring:message code='par.lbl.useYn' />" ,width:80
                    ,template:'#= changeEndChk(endChk)#'
                    ,attributes:{ "class":"ac"}
                    , hidden:true
                }//종료여부
                ,{title:"<spring:message code='par.lbl.parSpecCd' />" ,field:"parSpecCd" ,width:60 ,hidden:true}
            ]
        });

        //  종료여부
        changeEndChk = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(useYnObj[val])){
                    returnVal = useYnObj[val];
                }
            }
            return returnVal;
        };

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = grStrgeCdObj[val];
            }
            return returnVal;
        };
        /************************************************************
                    선택그리드 설정
        *************************************************************/
        $("#selectGrid").kendoExtGrid({
             gridId:"G-PAR-0803-145802"
            ,dataSource:[]
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,height:148
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105 ,hidden:true}//딜러 코드
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:110 }//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:180 }//부품명
                ,{field:"stockUnitCd" ,title:"<spring:message code='par.lbl.unitNm' />" ,attributes:{ "style":"ac"} ,width:60}//단위
                ,{field:"purcPrc" ,title:"<spring:message code='par.lbl.purcPrc' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100}//구매단가
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.movingAvgPrc' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100 ,hidden:true}//이동평균단가
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.stockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:70}//가용재고
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:70}//실재고
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:70}//예류재고
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowItemQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
                ,{field:"minPurcQty" ,title:"<spring:message code='par.lbl.minPurcQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100 ,hidden:true}//최소구매수량
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd' />" ,width:80 ,hidden:true}//ABC CLASS
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />" ,width:80
                    ,template:'#= changeCarlineCd(carlineCd)#'
                    ,hidden:true
                }
                ,{field:"purcLeadHm" ,title:"<spring:message code='par.lbl.purcLeadHm' />" ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,width:100 ,hidden:true}//구매리드타임
                ,{field:"grStrgeCd" ,title:"<spring:message code='par.lbl.strge' />" ,width:100
                    ,template:'#= changeStrgeCd(grStrgeCd)#'
                    ,hidden:true
                }//입고창고
                ,{field:"strgeCdList" ,title:"<spring:message code='par.lbl.strge' />" ,width:150
                }//입고창고
                ,{title:"<spring:message code='par.lbl.parSpecCd' />" ,field:"parSpecCd" ,width:60 ,hidden:true}
            ]
        });

        if(options.autoBind){
            $("#searchGrid").data("kendoExtGrid").dataSource.read();
        }

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
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(carlineCdObj[val])){
                    returnVal = carlineCdObj[val];
                }else{
                    returnVal = "";
                }
            }
            return returnVal;
        };

        $("#searchGrid").data("kendoExtGrid").dataSource.read();
    });

 </script>


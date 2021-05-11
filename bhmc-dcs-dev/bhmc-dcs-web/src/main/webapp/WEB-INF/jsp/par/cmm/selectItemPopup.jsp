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
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sDlrCd" class="hidden" disabled="disabled"/>
                            <input id="sBpCd" class="hidden"/>
                            <input id="sBpNm" readonly class="form_input form_readonly"/>
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
                            <input id="sAbcInd" data-type="combo" class="form_comboBox"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="clfix">
            <div class="left_areaStyle" style="width:62%">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.searchPartsList" /><!-- 조회 부품리스트 --></h2>
                    <div class="btn_right">
                        <button id="btnAdd" class="btn_s btn_Select"><spring:message code="par.btn.add" /><!-- 추가 --></button>
                    </div>
                </div>
                <div class="table_grid">
                <!-- 그리드1 -->
                    <div id="searchGrid" class="grid"></div>
                <!-- 그리드1 -->
                </div>
            </div>
            <div class="right_areaStyle" style="width:37%;">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.selectPartsList" /><!-- 선택부품리스트 --></h2>
                    <div class="btn_right">
                        <button id="btnDelete" class="btn_s btn_del"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
                    </div>
                </div>
                <div class="table_grid">
                <!-- 그리드1 -->
                    <div id="selectGrid" class="grid"></div>
                <!-- 그리드1 -->
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
             popItemObj          = {};

         abcIndList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         carlineCdList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
         </c:forEach>
        console.log('options:',options);

        // 그리드 더블 클릭 이벤트.
        $("#searchGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnAdd").click();
        });

        // 그리드 더블 클릭 이벤트.
        $("#selectGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnDelete").click();
        });


        /************************************************************
                    기능버튼 설정
        *************************************************************/


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
                        rowObj.purcPrc        = frGrid.dataItem(row).purcPrc;
                        rowObj.avlbStockQty   = frGrid.dataItem(row).avlbStockQty;
                        rowObj.abcInd         = frGrid.dataItem(row).abcInd;
                        rowObj.carlineCd      = frGrid.dataItem(row).carlineCd;
                        rowObj.purcLeadHm     = frGrid.dataItem(row).purcLeadHm;
                        rowObj.grStrgeCd      = frGrid.dataItem(row).grStrgeCd;

                        if(popItemObj.hasOwnProperty(frGrid.dataItem(row).itemCd)){
                            //이미 등록되어있는 부품입니다.
                            var itemInfo = frGrid.dataItem(row).itemCd + '[' + frGrid.dataItem(row).itemNm + ']';
                            dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                        }else{
                            popItemObj[frGrid.dataItem(row).itemCd] = frGrid.dataItem(row).itemNm;;
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


        // 부품삭제 버튼
        $("#btnDelete").kendoButton({
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

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:abcIndList
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
           ,index:0
       });



        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);

        /************************************************************
                    조회 그리드 설정
        *************************************************************/
        $("#searchGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectItemPopupByCondition.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 품목구분코드.
                            params["sDlrCd"]      = $("#sDlrCd").val();
                            params["sBpCd"]       = $("#sBpCd").val();
                            params["sItemCd"]     = $("#sItemCd").val();
                            params["sItemNm"]     = $("#sItemNm").val();
                            params["sAbcInd"]     = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]  = $("#sCarlineCd").data("kendoExtDropDownList").value();

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
                            , avlbStockQty :{ type:"number" }
                            , abcInd       :{ type:"string" }
                            , carlineCd    :{ type:"string" }
                            , purcLeadHm   :{ type:"number" }
                            , grStrgeCd    :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,height:280
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:110 }                //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:140 }                //부품명
                ,{field:"stockUnitCd"
                     ,title:"<spring:message code='par.lbl.unitNm' />"
                     ,width:180
                     ,hidden:true}                //단위
                ,{field:"purcPrc"
                     ,title:"<spring:message code='par.lbl.purcPrc' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:100
                     ,hidden:true}                //구매단가
                ,{field:"avlbStockQty"
                     ,title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:70 }                //가용재고
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,template:'#= changeAbcInd(abcInd)#'
                     ,width:60 }                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:100 }
                ,{field:"purcLeadHm"
                     ,title:"<spring:message code='par.lbl.purcLeadHm' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:100
                     ,hidden:true}                //구매리드타임
                ,{field:"grStrgeCd"
                     ,title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:100
                     ,hidden:true}                //입고창고
                ,{title:""}
            ]
        });

        /************************************************************
                    선택그리드 설정
        *************************************************************/
        $("#selectGrid").kendoExtGrid({
             dataSource:[]
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,height:280
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:110 }                //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:180 }                //부품명
                ,{field:"stockUnitCd"
                     ,title:"<spring:message code='par.lbl.unitNm' />"
                     ,width:180
                     ,hidden:true}                //단위
                ,{field:"purcPrc"
                     ,title:"<spring:message code='par.lbl.purcPrc' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:100
                     ,hidden:true}                //구매단가
                ,{field:"avlbStockQty"
                     ,title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:70
                     ,hidden:true}                //가용재고
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,template:'#= changeAbcInd(abcInd)#'
                     ,width:80
                     ,hidden:true}                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:80
                     ,hidden:true}
                ,{field:"purcLeadHm"
                     ,title:"<spring:message code='par.lbl.purcLeadHm' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:100
                     ,hidden:true}                //구매리드타임
                ,{field:"grStrgeCd"
                     ,title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:100
                     ,hidden:true}                //입고창고
                ,{title:""}
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
            if(val != null && val != ""){
                returnVal = carlineCdObj[val];
            }
            return returnVal;
        };

        $("#searchGrid").data("kendoExtGrid").dataSource.read();
    });

 </script>


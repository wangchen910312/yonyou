<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 부품탐색 팝업 -->
<section id="windows" class="pop_wrap">

    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.shareStockGiItem" /> --%></h1>
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
                <button id="btnClose" class="btn_m btn_Close"><spring:message code="global.btn.close" /><!-- 닫기 --></button>
            </div>
        </div>
    </section>
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
                        <input id="sBpCd" class="hidden" value="${bpCd}"  />
                        <input id="sBpNm" readonly class="form_input form_readonly" value="${bpNm}"  />
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

    <section class="group">

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

    </section>

    <section class="group">
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

    </section>

    <div class="clfix">
    <div class="left_areaStyle" style="width:49%">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.shareItemInfo" /></h2>
            <div class="btn_right">
                <button id="btnAdd02" class="btn_s btn_Select"><spring:message code="par.btn.add" /><!-- 추가 --></button>
            </div>
        </div>
        <div class="table_grid">
        <!-- 그리드1 -->
            <div id="shareItemGrid" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </div>

    <div class="right_areaStyle" style="width:50%">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.stockGrItemInfo" /></h2>
            <div class="btn_right">
                &nbsp;
            </div>
        </div>
        <div class="table_grid">
        <!-- 그리드1 -->
            <div id="stockGiGrid" class="grid"></div>
        <!-- 그리드1 -->
        </div>

    </div>
    </div>

</section>



<!-- //부품탐색 팝업 -->

 <script type="text/javascript">

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
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             popItemObj          = {};

         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.abcCd}", itemNm:"${obj.abcCd}"});
             abcIndObj["${obj.abcCd}"] = "${obj.abcCd}";
         </c:forEach>

         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
         </c:forEach>

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
        // 닫기 버튼.
        $("#btnClose").kendoButton({
            click:function(e){
                currentWin.close();
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

        $("#btnAdd02").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
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

        /************************************************************
                    조회조건 설정
        *************************************************************/

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
            ,height:127
            ,multiSelectWithCheckbox:true
            ,columns:[
                {field:"dlrCd",title:"<spring:message code='par.lbl.dlrCd' />",width:105,hidden:true}//딜러 코드
                ,{field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:110 }//부품번호
                ,{field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:140 }//부품명
                ,{field:"avlbStockQty",title:"<spring:message code='par.lbl.avlbStockQty' />",attributes:{ "class":"ar"},format:"{0:n0}",width:70 }                //가용재고
                ,{field:"abcInd",title:"<spring:message code='par.lbl.abcInd' />",width:60
                    ,template:'#= changeAbcInd(abcInd)#'
                }//ABC CLASS
                ,{field:"carlineCd",title:"<spring:message code='par.lbl.carLine' />" ,width:100
                    ,template:'#= changeCarlineCd(carlineCd)#'
                }
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
            ,height:107
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                {field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:150 }//부품번호
                ,{field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:200 }//부품명
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
        //shareItemGrid
        $("#shareItemGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#sParReqDocNo").val() == "" ? "X":$("#sParReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:true }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:true }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                        }
                    }
                }
            }
            ,editable:false
            ,height:105
            ,pageable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:false
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"itemCd", title:"<spring:message code='par.lbl.comItemCd'/>",width:80 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.comItemNm'/>", width:100 }
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine'/>", width:70 }//carlineCd
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:70 }
                ,{field:"bigo", title:"<spring:message code='par.lbl.remark'/>", width:50 }//bigo
                ,{title:""}
            ]
        });
        //stockGiGrid
        $("#stockGiGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#sParReqDocNo").val() == "" ? "X":$("#sParReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:true }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:true }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                        }
                    }
                }
            }
            ,editable:false
            ,height:105
            ,pageable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:false
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"regDt", title:"<spring:message code='par.lbl.grDt'/>",width:60 }
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm'/>", width:60 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:80 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:100 }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:50 }
                ,{field:"endQty", title:"<spring:message code='par.lbl.qty' />", attributes:{"class":"ar"}, format:"{0:n0}", width:50 }
                ,{title:""}
            ]
        });

    });

 </script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

    <!-- 통용부번설정 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.itemList" /><!-- 품목리스트 --></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11503" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11502" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m btn_save btn_m_min"><spring:message code="par.btn.fix" /><!-- 확정--></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11501" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input type="text" id="sDlrCd"  readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></th>
                        <td>
                            <input id="sSpyrCd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                        <td>
                            <input id="sBrandCd" name="sBrandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemBpNm" /><!-- 업체명칭 --></th>
                        <td>
                            <input id="sBpNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" name="sCarlineCd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Ind --></th>
                        <td>
                            <input id="sAbcInd" name="sAbcInd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                        <td>
                            <input id="sItemDstinCd" name="sItemDstinCd" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
            <!-- 그리드1 -->
        </div>
    </section>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.comItemList" /><!-- 공용부품리스트 --></h2>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11500" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnPartsAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.rowAdd" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11499" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnDel" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.rowDel" /></button>
        </dms:access>
        </div>
    </div>
    <div class="table_grid">
    <!-- 그리드2 -->
    <div id="gridItem" class="grid"></div>
    <!-- 그리드2 -->
    </div>
    <!-- //일반부품설정 -->
    <!-- script -->
    <script>

        var spyrCdList = [],
           spyrCdMap = {},
           itemDstinCdList = [],
           itemDstinCdObj = {},
           carlineCdList = [],
           carlineCdObj = {},
           comCarlineCdList = [],
           modelCdList = [],
           modelCdObj = {},
           modelCdMap = {},
           useYnList = [],
           useYnObj = {},
           storageList = [],
           abcIndList = [],
           abcIndObj = {},
           brandCdList = [],
           brandCdObj = {},
           popItemObj = {},
           searchItemPopupWindow,
           itemKey;

        spyrCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
            spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //spyrCdMap
        $.each(spyrCdList, function(idx, obj){
            spyrCdMap[obj.cmmCd] = obj.cmmCdNm;
        });

        <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
            if("${obj.useYn}" !== 'N'){
                itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            comCarlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        <c:forEach var="obj" items="${modelCdList}">
        if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }else{
            modelCdObj["${obj.carlineCd}"] = [];
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }
        //carline2 List
        modelCdList.push({"cmmCd":"${obj.modelCd}" ,"cmmCdNm":"${obj.modelNm}"});
        </c:forEach>
        //carline2 Map
        $.each(modelCdList, function(idx, obj){
            modelCdMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //useYnList
        <c:forEach var="obj" items="${useYnList}">
        useYnList.push({"cmmCd":"${obj.cmmCd}" ,"cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //useYnObj
        $.each(useYnList, function(idx, obj){
            useYnObj[obj.cmmCd] = obj.cmmCdNm;
        });

        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${brandCdList}" varStatus="status">
            brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        //bpTpList
        var bpTpList = [];
        <c:forEach var="obj" items="${bpTpList}">
        bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //bpTpMap
        var bpTpMap = [];
        $.each(bpTpList, function(idx, obj){
            bpTpMap[obj.cmmCd] = obj.cmmCdNm;
        });

        //item search popup Func
        var searchItemMasterPopupWindow;
        function selectPartsMasterPopupWindow(){

            searchItemMasterPopupWindow = dms.window.popup({
                windowId:"searchItemMasterPopupWindow"
                ,width:840
                ,height:400
                ,title:"<spring:message code='par.title.partSearch' />"
                ,content:{
                    //url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                    url:"<c:url value='/par/cmm/selectSearchItemMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"itemCd":$("#sItemCd").val()
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(data){

                            var grid = $("#gridItem").data("kendoExtGrid");
                            var dataItems = grid.dataSource.view();

                            if(data.length > 0){
                                //parts Item add
                                 for(var i= 0; i < data.length; i++){
                                    var partItem = data[i];
                                    var itemCheckCnt = 0;

                                    var itemCheckCnt = 0;
                                    for(var j=0; j < dataItems.length; j++){

                                        if(dataItems[j].comItemCd === partItem.itemCd){
                                            itemCheckCnt++;
                                        }
                                        if(itemCheckCnt > 0){
                                            break;
                                        }
                                    }

                                    //공용부품 리스트에 없거나 상위 부품이 없을 때 추가.
                                    if(itemCheckCnt == 0){
                                        if(partItem.itemCd !== itemKey){

                                            var sRnum = grid.dataSource.total();

                                            var ComItemVO = {
                                                "rnum":sRnum + 1
                                                ,"dlrCd":null
                                                ,"itemCd":itemKey
                                                ,"comItemCd":partItem.itemCd
                                                ,"comItemNm":partItem.itemNm
                                                ,"avlbStockQty":partItem.avlbStockQty
                                                ,"carlineCd":partItem.carlineCd
                                                ,"itemDstinCd":partItem.itemDstinCd
                                                ,"remark":""
                                            }
                                            $("#gridItem").data("kendoExtGrid").dataSource.add(ComItemVO).set("dirty", true);
                                            grid.refresh();
                                        }
                                    }
                                }
                            }
                            //popup close
                            searchItemMasterPopupWindow.close();

                        }
                    }
                }
            });
        }
    //initPage Func
    function initPage(){
        $("#sItemCd").val("");
        $("#sItemNm").val("");
        $("#sBpNm").val("");
        $("#sSpyrCd").data("kendoExtDropDownList").select(0);
        $("#sBrandCd").data("kendoExtDropDownList").select(0);
        $("#sCarlineCd").data("kendoExtDropDownList").select(0);
        $("#sAbcInd").data("kendoExtDropDownList").select(0);
        $("#sItemDstinCd").data("kendoExtDropDownList").select(0);
        popItemObj = {};
        buttonEnableDisable(false);
    }
    //buttonEnableDisable Func
    function buttonEnableDisable(bFlag){
        $("#btnPartsAdd").data("kendoButton").enable(bFlag);
        $("#btnDel").data("kendoButton").enable(bFlag);
    }

    $(document).ready(function() {
        //search sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:itemDstinCdList
            ,index:0
        });
        //search sSpyrCd
        $("#sSpyrCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:bpTpList
            ,index:0
        });
        //차종(검색))
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            ,index:0
        });
        //sAbcInd
        $("#sAbcInd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:abcIndList
            ,optionLabel:" "
            ,index:0
        });
        //브랜드:검색
        $("#sBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,index:0
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridItem").data("kendoExtGrid").dataSource.data([]);
            }
        });
         //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                //selectPartsMasterPopupWindow Func call.
                selectPartsMasterPopupWindow();
            }
        });

        //btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){

                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            var grid = $("#gridItem").data("kendoExtGrid")
                                ,rows = grid.select();
                            if(rows.length == 0){
                                dms.notification.warning("<spring:message code='global.info.unselected' />");
                                return false;
                            }

                            rows.each(function(index, row) {
                                grid.removeRow(row);
                            });

                    }
                    conformKendoWindow.close();
                }).end();
            }
        });
        //btnSave
        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#gridItem").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if(grid.cudDataLength == 0){
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return false;
                }

                $.ajax({
                    url:"<c:url value='/par/pmm/multiUpdateComItemCd.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,success:function() {

                        grid.dataSource.read();

                        //success message.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });

            }
        });
        //grid
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0806-121901"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemMaster/selectComItemMasters.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //search input parameter
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sBpTp"] = $("#sSpyrCd").val();

                            params["sBrandCd"] = $("#sBrandCd").val();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sAbcInd"] = $("#sAbcInd").val();

                            params["sItemDstinCd"] = $("#sItemDstinCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,itemNmEng:{ type:"string" }
                            ,itemDstinCd:{ type:"string" }
                            ,brandCd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,carlineCd2:{ type:"string" }
                            ,abcInd:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,stockQty:{ type:"number" }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,totStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,newRplcItemCd:{ type:"string" }
                            ,oldRplcItemCd:{ type:"string" }
                            ,lastCmptItemCd:{ type:"string" }
                            ,stockUnitCd:{ type:"string" }
                            ,nonMovingFlg:{ type:"string" }
                            ,endYn:{ type:"string" }
                            ,dgrItemYn:{ type:"string" }
                            ,renewDt:{ type:"date" }
                            ,updtDt:{ type:"date" }
                            ,startDt:{ type:"date" }
                            ,endDt:{ type:"date" }
                        }
                    }
                }
            }
            ,change:function(e){

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    itemKey = selectedItem.itemCd;
                    buttonEnableDisable(true);
                    $("#gridItem").data("kendoExtGrid").dataSource.read();
                }

            }
            ,editable:false
            ,selectable:"row"
            ,autoBind:false
            ,height:193//5ROW(173) + scroll height(20)
            ,filterable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        //update row reselect.
                        if(dataItem.itemCd === itemKey){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>", attributes:{"class":"ar"}, width:50 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}
                ,{field:"itemNmEng", title:"<spring:message code='par.lbl.itemNmEng' />", width:140}
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />"
                    , template:'#= changeCarlineCd(carlineCd)#', width:100
                }
                ,{field:"newRplcItemCd", title:"<spring:message code='par.lbl.newRplcItemCd' />", width:120 }
                ,{field:"lastCmptItemCd", title:"<spring:message code='par.lbl.lastCmptItemCd' />", width:120 }
                ,{field:"stockUnitCd", title:"<spring:message code='par.lbl.unitNm' />", attributes:{"class":"ac"}, width:80}
                ,{field:"bpTp", title:"<spring:message code='par.lbl.itemMasterBpTp' />", width:100
                    ,template:'#if(bpTpMap[bpTp] !== undefined ){# #= bpTpMap[bpTp]# #}#'
                }//bpTp
                ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:100}//bpCd
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:140 }//bpNm
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", width:80 , attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.realAvlbStockQty'/>", width:80 , attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />",width:80 ,attributes:{"class":"ar"}, format:"{0:n2}" }//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />",width:80 ,attributes:{"class":"ar"}, format:"{0:n2}" }//대출(차출)수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.loanQty' />",width:80 ,attributes:{"class":"ar"}, format:"{0:n2}" }//차입수량
                ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", template:'#= changeBrandCd(brandCd)#', width:80 }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:80 }
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60 }
                ,{field:"endYn", title:"<spring:message code='par.lbl.endYn' />", attributes:{"class":"ac"}, template:'#= changeYnCd(endYn)#', width:80}
                ,{field:"renewDt", title:"<spring:message code='par.lbl.updtDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ]
        });
        //gridItem
        $("#gridItem").kendoExtGrid({
            gridId:"G-PAR-0806-121902"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/comItemMaster.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            params["sItemCd"] = itemKey;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"string", editable:false}
                            ,itemCd:{ type:"string", editable:false}
                            ,comItemCd:{ type:"string", editable:false}
                            ,comItemNm:{ type:"string", editable:false}
                            ,avlbStockQty:{ type:"number", editable:false}
                            ,carlineCd:{ type:"string", editable:false}
                            ,itemDstinCd:{ type:"string", editable:false}
                            ,remark:{ type:"string", editable:true}
                        }
                    }
                }
            }
            ,multiSelectWithCheckbox:false
            ,scrollable:true
            ,autoBind:false
            ,pageable:false
            ,filterable:false
            ,height:255
            ,appendEmptyColumn:true//empty column. default:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"comItemCd" ,title:"<spring:message code='par.lbl.comItemCd' />" ,width:100 }
                ,{field:"comItemNm" ,title:"<spring:message code='par.lbl.comItemNm' />" ,width:200 }
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}",width:100 }
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />" ,width:150
                    ,template:'#= changeCarlineCd(carlineCd)#'
                }
                ,{field:"itemDstinCd" ,title:"<spring:message code='par.lbl.itemDstinCd' />",width:80
                    ,template:'#= changeItemDstinCd(itemDstinCd)#'
                }
                ,{field:"remark" ,title:"<spring:message code='par.lbl.comItemRemark' />",width:300,attributes:{"class":"bg_white"} }
            ]
        });
        //changeItemDstinCd Func
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(itemDstinCdObj[val])){
                    returnVal = itemDstinCdObj[val];
                }
            }
            return returnVal;
        };
        //changeAbcInd Func
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };
        //changeCarlineCd Func
        changeCarlineCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(carlineCdObj[val])){
                    returnVal = carlineCdObj[val];
                }
            }
            return returnVal;
        };
        //changeBrandCd Func
        changeBrandCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = brandCdObj[val];
            }
            return returnVal;
        };
        //changeYnCd
        changeYnCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = useYnObj[val];
            }
            return returnVal;
        };
        //changeUnitCd Func
        changeUnitCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = stockUnitObj[val];
            }
            return returnVal;
        };

        //initPage Func call.
        initPage();

    });


</script>
<!-- //script -->


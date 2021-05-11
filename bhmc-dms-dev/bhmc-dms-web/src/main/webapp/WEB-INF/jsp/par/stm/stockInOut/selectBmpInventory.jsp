<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 종합재고조회 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.inventoryList" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11571" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11570" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                        <td>
                            <input id="sItemDstinCd" name="sItemDstinCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" />
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명칭 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- 거래처코드 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid">
            <div class="header_area">
                <%-- <h2 class="title_basic"><spring:message code="par.title.inventoryStatus" /></h2> --%>
            </div>
            <!-- 그리드1 -->
            <div id="inventoryGrid" class="grid"></div>
            <!-- 그리드1 -->
        </div>
    </section>
    <!-- //품목리스트 -->

    <div id="itemForm" class="hidden">
       <!-- 품목정보 -->
       <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.itemInfo" /><!-- 품목정보 --></h2>
            </div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:22%;">
                        <col style="width:12%;">
                        <col style="width:21%;">
                        <col style="width:12%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.startDt" /><!-- 유효시작일 --></th>
                            <td>
                                <input id="startDt" type="text" readonly class="form_datepicker form_readonly" data-type="maskDate" >
                                <input id="itemCd" type="text" readonly class="form_readonly hidden" >
                            </td>
                            <th scope="row"><spring:message code="par.lbl.endDt" /><!-- 유효종료일 --></th>
                            <td>
                                <input id="endDt" type="text" readonly class="form_datepicker form_readonly" data-type="maskDate" >
                            </td>
                            <th scope="row"><spring:message code="par.lbl.sucCd" /><!-- SUC --></th>
                            <td>
                                <input id="sucCd" data-type="combo" readonly class="form_comboBox form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.oldRplcItemCd" /><!-- 구형대체부품번호 --></th>
                            <td>
                                <input id="oldRplcItemCd" type="text" value="" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.oldRplcParCmptYn" /><!-- 구형부품호환여부 --></th>
                            <td>
                                <input id="oldRplcParCmptYn" type="checkbox" readonly class="form_check form_readonly" data-type="checkbox">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.parSpecCd" /><!-- Character code --></th>
                            <td>
                                <input id="parSpecCd" data-type="combo" readonly class="form_comboBox form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.newRplcItemCd" /><!-- 신규대체부품번호 --></th>
                            <td>
                                <input id="newRplcItemCd" type="text" value="" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.newRplcParCmptYn" /><!-- 신규부품호환여부 --></th>
                            <td>
                                <input id="newRplcParCmptYn" type="checkbox" readonly class="form_check form_readonly" data-type="checkbox">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.pncCd" /><!-- PNC --></th>
                            <td>
                                <input id="pncCd" type="text" value="" readonly class="form_input form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 공급업체 --></th>
                            <td>
                                <input id="bpNm" type="text" value="" readonly class="form_input form_readonly">
                                <input id="bpCd" type="text" value="" readonly class="form_input form_readonly hidden">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <input id="carlineCd" data-type="combo" readonly class="form_comboBox form_readonly">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.mobisImpLocalYnTp" /><!-- Source --></th>
                            <td>
                                <input id="mobisImpLocalYnTp" data-type="combo" readonly class="form_comboBox form_readonly">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //품목정보 -->
    </div>
    <div id="bmpForm">
       <!-- 품목정보 -->
       <section class="group">
            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.bmpInventory" /><!-- BMP INVENTORY--></h2>
                <div class="btn_right">
				<dms:access viewId="VIEW-D-11569" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_search btn_s_min5" id="btnBmpSearch"><spring:message code="par.btn.search" /></button>
				</dms:access>
                </div>
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <div class="table_grid">
                <!-- 그리드2 -->
                <div id="bmpInventoryGrid" class="grid"></div>
                <!-- 그리드2 -->
            </div>
        </section>
        <!-- //품목정보 -->

       <!-- 품목정보 -->
       <section class="group mt10 hidden">
            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.dlrInventory" /><!-- DLR INVENTORY--></h2>
                <div class="btn_right">
                    <button class="btn_s btn_search btn_s_min5" id="btnDlrSearch"><spring:message code="par.btn.search" /></button>
                </div>
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <div class="table_form form_width_100per">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.division" /><!-- 사업부 --></th>
                        <td>
                            <input type="text" id="sSdptCd" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.officeNm" /><!-- 동사무소 --></th>
                        <td>
                            <input type="text" id="sDistOfficeCd" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.city" /><!-- 성시 --></th>
                        <td>
                            <input type="text" id="sSaleDlrSungCd" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.pltCd" /><!-- 딜러 --></th>
                        <td>
                            <input type="text" id="sDpsDlrCd" class="form_input"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt5">
            <!-- 그리드2 -->
            <div id="dlrInventoryGrid" class="grid"></div>
            <!-- 그리드2 -->
        </div>
        </section>
        <!-- //품목정보 -->
    </div>

    <div class="table_grid mt10">
        <div id="stockGrid" class="grid"></div>
    </div>
<!-- script -->
<script>
        var spyrCdObj = {},
            itemGroupObj = {},
            carlineCdList = [],
            abcIndList = [],
            abcIndObj = {},
            sucList = [],
            parSpecCdList = [],
            mobisImpLocalYnTpList = [],
            itemDstinCdList = [],
            itemDstinCdObj = [],
            storageObj = {},
            selectCarlinePopupWindow,
            toDate,
            gCrud;

        toDate = new Date();

        itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
            if("${obj.useYn}" !== 'N'){
                itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
            spyrCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        abcIndList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        carlineCdList.push({itemCd:"", itemNm:"ALL"});
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
        </c:forEach>

        sucList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${sucList}" varStatus="status">
            sucList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        parSpecCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${parSpecCdList}" varStatus="status">
            parSpecCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        mobisImpLocalYnTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${mobisImpLocalYnTpList}" varStatus="status">
            mobisImpLocalYnTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${storageAllList}" varStatus="status"> //key value
            storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>
     // 품목 마스터 조회.
    function selectItemMasters(){
        $("#inventoryGrid").data("kendoExtGrid").dataSource.page(1);
    }

    function initPage(){

        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#oldRplcItemCd").attr("disabled", true);
        $("#oldRplcParCmptYn").attr("disabled", true);
        $("#newRplcItemCd").attr("disabled", true);
        $("#newRplcParCmptYn").attr("disabled", true);
        $("#sucCd").data("kendoExtDropDownList").enable(false);
        $("#lastCmptItemCd").attr("disabled", true);
        $("#mobisImpLocalYnTp").data("kendoExtDropDownList").enable(false);
        $("#parSpecCd").data("kendoExtDropDownList").enable(false);
        $("#carlineCd").data("kendoExtDropDownList").enable(false);
        $("#pncCd").attr("disabled", true);

    }

    function fnChkDateValue(e){
        var  elmt  = e.sender.element[0],
             id    = elmt.id;

        id = '"#' + id +'"';

        if(this.value() == null){
            $(id).data("kendoExtMaskedDatePicker").value('');
        }
    }

    // 부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"itemCd":$("#sItemCd").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            $("#sItemCd").val(data[0].itemCd);
                            $("#sItemNm").val(data[0].itemNm);

                        }
                        searchItemPopupWindow.close();
                    }
                }
            }
        });
    }


    function initPage(){

        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#inventoryGrid").data("kendoExtGrid").dataSource.data([]);
        $("#bmpInventoryGrid").data("kendoExtGrid").dataSource.data([]);
        $("#dlrInventoryGrid").data("kendoExtGrid").dataSource.data([]);

    }

    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":''
                    ,"bpNm":''
                    ,"callbackFunc":function(data){
                        $("#sBpNm").val(data[0].bpNm);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }


    $(document).ready(function() {

        var validator = $("#itemForm").kendoExtValidator().data("kendoExtValidator");

        //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:itemDstinCdList
           ,index:0
        });

       //가용재고
       $("#sAvlbStockQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
       });

        //SUC
        $("#sucCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:sucList
            ,index:0
        });

        //Character Code
        $("#parSpecCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parSpecCdList
            ,index:0
        });

        //차종
        $("#carlineCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,index:0
        });

        //Source
        $("#mobisImpLocalYnTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mobisImpLocalYnTpList
            ,index:0
        });

        $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        //조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                // 품목 마스터 조회.
                selectItemMasters();
            }
        });

        //초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 실시간 조회 버튼.
        $("#btnBmpSearch").kendoButton({
            click:function(e){

                $.ajax({
                    url:"<c:url value='/par/stm/stockInOut/selectStockInterfaceRealTimeInfoByItemCd.do' />",
                    data:JSON.stringify({ ivrCmpKnd:'H', ivrPno:$("#itemCd").val()}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error("<spring:message code='par.lbl.ifErrRaiMsg'/>");
                    },
                    beforeSend:function(jqXHR, settings ){
                        dms.loading.show();
                    },
                    complete:function(jqXHR, textStatus ){
                        dms.loading.hide();
                    }

                }).done(function(result) {
                    if(result.data.length === 1){
                        $("#bmpInventoryGrid").data("kendoExtGrid").dataSource.data([]);
                        $("#bmpInventoryGrid").data("kendoExtGrid").dataSource.add(result.data[0]);
                    }
                });
            }
        });

        // 실시간 조회 버튼.
        $("#btnDlrSearch").kendoButton({
            click:function(e){
                var data = {};
                    data = {
                      sdptCd:       $("#sSdptCd").val()
                     ,distOfficeCd: $("#sDistOfficeCd").val()
                     ,saleDlrSungCd:$("#sSaleDlrSungCd").val()
                     ,dlrCd:        $("#sDpsDlrCd").val()
                     ,dpsPno:       $("#itemCd").val()
                     ,dpsCmpKnd:    'H'
                    };

                $.ajax({
                    url:"<c:url value='/par/stm/stockInOut/selectDlrStockInterfaceRealTimeInfoByItemCd.do' />",
                    data:JSON.stringify(data),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error("<spring:message code='par.lbl.ifErrRaiMsg'/>");
                    }

                }).done(function(result) {

                    $("#dlrInventoryGrid").data("kendoExtGrid").dataSource.data([]);
                    for(var i = 0; i < result.data.length; i = i + 1){
                        result.data[i].dpsPno = $("#itemCd").val();
                      $("#dlrInventoryGrid").data("kendoExtGrid").dataSource.add(result.data[i]);
                    }

                });
            }
        });

        $("#inventoryGrid").kendoExtGrid({
            gridId:"G-PAR-0519-182402"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockInOut/selectBmpInventoryList.do' />"
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
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"itemCd"
                       ,fields:{
                            dlrCd           :{ type:"string" , validation:{required:true} }
                           ,itemCd          :{ type:"string" , validation:{required:true} }
                           ,itemNm          :{ type:"string" , validation:{required:true} }
                           ,spyrCd          :{ type:"string" , validation:{required:true} }
                           ,avlbStockQty    :{ type:"number" }
                           ,stockQty        :{ type:"number" }
                           ,resvStockQty    :{ type:"number" }
                           ,borrowQty       :{ type:"number" }
                           ,rentQty         :{ type:"number" }
                           ,grScheQty       :{ type:"number" }
                           ,abcInd          :{ type:"string" }
                           ,carlineCd       :{ type:"string" }
                           ,mm3AvgDmndQty   :{ type:"number" }
                           ,mm6AvgDmndQty   :{ type:"number" }
                           ,mm12AvgDmndQty  :{ type:"number" }
                           ,nonMovingFlg    :{ type:"string" }
                           ,purcReqCnt      :{ type:"number" }
                           ,bmpPurcPrc      :{ type:"number" }

                        }
                    }
                }
            }
            ,editable:false
            ,selectable:"row"
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){

                    $.ajax({
                        url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",
                        data:JSON.stringify({ sDlrCd:selectedItem.dlrCd, sItemCd:selectedItem.itemCd}),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    }).done(function(result) {
                        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                            return false;
                        }

                        partsJs.validate.groupObjAllDataSet(result);

                        $("#bmpInventoryGrid").data("kendoExtGrid").dataSource.data([]);
                        $("#dlrInventoryGrid").data("kendoExtGrid").dataSource.data([]);

                        $.ajax({
                            url:"<c:url value='/par/stm/stockInOut/selectStockInterfaceInfoByItemCd.do' />",
                            data:JSON.stringify({ ivrCmpKnd:'H', ivrPno:$("#itemCd").val()}),
                            type:"POST",
                            dataType:"json",
                            contentType:"application/json",
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        }).done(function(result) {

                            if(result.data.length === 1){
                                $("#bmpInventoryGrid").data("kendoExtGrid").dataSource.add(result.data[0]);
                            }

                        });

                        $.ajax({
                            url:"<c:url value='/par/stm/stockInOut/selectStockInterfaceDlrInfoByItemCd.do' />",
                            data:JSON.stringify({ dpsCmpKnd:'H', dpsPno:$("#itemCd").val()}),
                            type:"POST",
                            dataType:"json",
                            contentType:"application/json",
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        }).done(function(result) {
                            if(result.data.length === 1){
                                $("#dlrInventoryGrid").data("kendoExtGrid").dataSource.add(result.data[0]);
                            }

                        });
                    });

                    $("#stockGrid").data("kendoExtGrid").dataSource.read();
                }
            }
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,height:290
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        //update row reselect.
                        if(dataItem.itemCd === $("#itemCd").val()){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                 {field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:100}//부품코드
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:140}//부품명칭
                ,{field:"spyrCd" ,title:"<spring:message code='par.lbl.spyrCd' />" ,attributes:{ "class":"ac"} ,width:100
                    ,template:'#= changeSpyrCd(spyrCd)#'
                 }//공급상유형
                ,{field:"bmpPurcPrc" ,title:"<spring:message code='par.lbl.purcIncTaxPrc' />",attributes :{"class":"ar"},format:"{0:n2}",width:80}//bmp구매단가
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.strgeStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}",width:80}//재고수량
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:80}//가용재고
                ,{field:"resvQty" ,title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}//예류수량
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80 }//대출(차출)수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80 }
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.loanQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80 }//차입수량
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd' />" ,attributes:{ "class":"ac"} ,width:60}//ABC CLASS
                ,{field:"mm3AvgDmndQty" ,title:"<spring:message code='par.lbl.mm3AvgDmndQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:90}//AMD3
                ,{field:"mm6AvgDmndQty" ,title:"<spring:message code='par.lbl.mm6AvgDmndQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:90}//AMD6
                ,{field:"mm12AvgDmndQty" ,title:"<spring:message code='par.lbl.mm12AvgDmndQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:100}//AMD12
                ,{field:"purcReqCnt" ,title:"<spring:message code='par.lbl.purcReqCnt' />" ,attributes:{ "class":"ar"},width:100}//빈도
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

        // 공급상유형
        changeSpyrCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = spyrCdObj[val];
            }
            return returnVal;
        };

        $("#bmpInventoryGrid").kendoExtGrid({
             gridId:"G-PAR-0519-182302"
            ,dataSource:[]
            ,editable  :false
            ,selectable:"row"
            ,pageable  :false
            ,scrollable:true
            ,sortable  :false
            ,resizable :true
            ,autoBind  :false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:60
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"ivrPdAExist" ,title:"<spring:message code='par.lbl.pdcAll' />" ,attributes:{ "class":"ac"} ,width:80}//PDAll
                ,{field:"ivrPdBExist" ,title:"<spring:message code='par.lbl.pdc1' />" ,attributes:{ "class":"ac"} ,width:80}//PD1
                ,{field:"ivrPdCExist" ,title:"<spring:message code='par.lbl.pdc2' />" ,attributes:{ "class":"ac"} ,width:80}//PD2
                ,{field:"ivrPdDExist" ,title:"<spring:message code='par.lbl.pdc3' />" ,attributes:{ "class":"ac"} ,width:80}//PD3
                ,{field:"ivrPdEExist" ,title:"<spring:message code='par.lbl.pdc4' />" ,attributes:{ "class":"ac"} ,width:80}//PD4
                ,{field:"ivrPdFExist" ,title:"<spring:message code='par.lbl.pdc5' />" ,attributes:{ "class":"ac"} ,width:80}//PD5
                ,{field:"ivrPdGExist" ,title:"<spring:message code='par.lbl.pdc6' />" ,attributes:{ "class":"ac"} ,width:80}//PD6
                ,{field:"ivrPdHExist" ,title:"<spring:message code='par.lbl.pdc7' />" ,attributes:{ "class":"ac"} ,width:80}//PD7
                ,{field:"ivrPdIExist" ,title:"<spring:message code='par.lbl.pdc8' />" ,attributes:{ "class":"ac"} ,width:80}//PD8
                ,{field:"ivrPdJExist" ,title:"<spring:message code='par.lbl.pdc9' />" ,attributes:{ "class":"ac"} ,width:80}//PD9
            ]
        });

        $("#dlrInventoryGrid").kendoExtGrid({
             gridId:"G-PAR-0519-182102"
            ,dataSource:[]
            ,editable  :false
            ,selectable:"row"
            ,pageable  :false
            ,scrollable:true
            ,sortable  :false
            ,resizable :true
            ,autoBind  :false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:200
            ,columns:[
                {field:"dpsAllQt" ,title:"<spring:message code='par.lbl.pdcAll' />" ,attributes:{ "class":"ac"} ,width:100}//PDAll
                ,{field:"sdptCd" ,title:"<spring:message code='par.lbl.division' />" ,attributes:{ "class":"ac"} ,width:120}//사업부
                ,{field:"distOfficeCd" ,title:"<spring:message code='par.lbl.officeNm' />" ,attributes:{ "class":"ac"} ,width:120}//동사무소
                ,{field:"saleDlrSungCd" ,title:"<spring:message code='par.lbl.city' />" ,attributes:{ "class":"ac"} ,width:120}//성시
                ,{field:"dlrCd" ,title:"<spring:message code='par.lbl.pltCd' />" ,attributes:{ "class":"ac"} ,width:120}//딜러
                ,{field:"dlrNm" ,title:"<spring:message code='par.lbl.pltNm' />" ,attributes:{ "class":"ac"} ,width:120}//딜러
            ]
        });

     // 현재고리스트 그리드
        $("#stockGrid").kendoExtGrid({
            gridId:"G-PAR-0719-160591"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockInOut/selectStockInOutList.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                grid = $("#inventoryGrid").data("kendoExtGrid"),
                                rowData = grid.dataItem(grid.select());


                            // 현재고조회 검색조건 코드.
                            params["sEquiItemCd"] = rowData.itemCd;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                            ,fields:{
                                 rnum:{ type:"number" }
                                ,strgeCd:{ type:"string" }
                                ,itemCd:{ type:"string" }
                                ,itemNm:{ type:"string" }
                                ,retlPrc:{ type:"number" }
                                ,whslPrc:{ type:"number" }
                                ,taxDdctRetlPrc:{ type:"number" }
                                ,taxDdctWhslPrc:{ type:"number" }
                                ,locCd:{ type:"string" }
                                ,locNm:{ type:"string" }
                                ,locCdMig:{ type:"string" }
                                ,movingAvgPrc:{ type:"number" }
                                ,movingAvgtaxDdctPrc:{ type:"number" }
                        }
                    }
                }
            }
            ,selectable :"row"
            ,appendEmptyColumn:true//empty column. default:false
            ,editable:false
            ,filterable:false
            ,sorterable:false
            ,autoBind:false
            ,sortable:false
            ,pageable  :false
            ,height:200
            ,dataBound :function(e){
                rowNumber = 0;
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
                {field:"rnum" ,title:"<spring:message code='par.lbl.line' />" ,attributes:{"class":"ac"},width:40}//No
                ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.stockStrgeCd' />" ,attributes:{"class":"al"} ,width:140
                    ,template  :'#= changeStrgeCd(strgeCd)#'
                }//창고
                ,{field:"locCd" ,title:"<spring:message code='par.lbl.locationCd' />",width:160 }//위치코드
                ,{field:"locCdMig" ,title:"<spring:message code='par.lbl.locationCd' />2",width:160 }//위치Mig
                ,{field :"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,attributes:{"class":"al"} ,width:140 }//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,attributes:{"class":"al"} ,width:200}//부품명
                ,{_field:"salPrcHd",title:"<spring:message code='par.lbl.salePriceCost01' />" ,attributes:{"class":"ac"} ,width:80
                    ,headerAttributes:{"class":"hasBob"}
                    ,columns:[
                        {field:"retlPrc" ,title:"<spring:message code='par.lbl.taxInclude'  />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:70}
                        ,{field:"taxDdctRetlPrc" ,title:"<spring:message code='par.lbl.taxSprt'  />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:70}
                    ]
                }//판매가
                ,{_field:"whslPrcHd",title:"<spring:message code='par.lbl.salePriceCost02' />" ,headerAttributes:{"class":"hasBob"}
                    ,columns:[
                        {field:"whslPrc" ,title:"<spring:message code='par.lbl.taxInclude' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:70}
                        ,{field:"taxDdctWhslPrc" ,title:"<spring:message code='par.lbl.taxSprt' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:70}
                    ]
                }//도매가
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                }//입고이동평균단가
                ,{field:"movingAvgTaxDdctPrc" ,title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                }//입고이동평균단가(세금제외)
            ]
        });

         // 창고 그리드 콤보
        changeStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(storageObj[val])){
                    returnVal = storageObj[val];
                }
            }
            return returnVal;
        };

        initPage();

    });
</script>
<!-- //script -->


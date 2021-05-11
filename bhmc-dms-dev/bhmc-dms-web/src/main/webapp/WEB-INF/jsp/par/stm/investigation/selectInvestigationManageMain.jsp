<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 재고실사신청 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11891" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11890" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11889" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnApplyReq" class="btn_m btn_save"><spring:message code="global.btn.req" /><!-- 승인요청 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11888" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCnclDocNo" class="btn_m btn_cancel"><spring:message code="global.lbl.cancel" /><!-- 실사취소 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11887" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" class="btn_m btn_m_min5"><spring:message code="par.btn.print" /><!-- 출력 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" id="investigationForm">
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
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sStockDdDocNo" class="form_input" />
                                <input type="hidden" id="sStrgeCd" />
                                <input type="hidden" id="sStockLockYn" value="N" />
                                <a id="searchStockDdDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="sRegDt" class="form_datepicker" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 실사담당자 --></th>
                        <td class="readonly_area">
                            <input type="hidden" id="sPrsnId"  class="form_input" readonly />
                            <input type="text" id="sPrsnNm"  class="form_input" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
                        <td>
                            <input id="sDocStatCd" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.realStockQty" /><!-- 재고수량 --></th>
                        <td class="readonly_area">
                            <input id="sStockQty" class="form_numeric ar" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ddQty" /><!-- 실사수량 --></th>
                        <td class="readonly_area">
                            <input id="sDdQty" class="form_numeric ar" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockItemPlusQty" /><!-- 손익수량 --></th>
                        <td class="readonly_area">
                            <input id="sStockItemPlusQty" class="form_numeric ar" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockItemMinusQty" /><!-- 손실수량 --></th>
                        <td class="readonly_area">
                            <input id="sStockItemMinusQty" class="form_numeric ar" readonly />
                        </td>
                     </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockPrice" /><!-- 재고금액 --></th>
                        <td class="readonly_area">
                            <input id="sStockPrice" class="form_numeric ar" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ddPrice" /><!-- 실사금액 --></th>
                        <td class="readonly_area">
                            <input id="sDdPrice" class="form_numeric ar" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockItemPlusPrice" /><!-- 손익금액 --></th>
                        <td class="readonly_area">
                            <input id="sStockItemPlusPrice" class="form_numeric ar" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockItemMinusPrice" /><!-- 손실금액 --></th>
                        <td class="readonly_area">
                            <input id="sStockItemMinusPrice" class="form_numeric ar" readonly />
                        </td>
                    </tr>
                    <th scope="row"><spring:message code="par.lbl.remark" /><!-- 비고 --></th>
                        <td colspan="7">
                            <input type="text" id="remark" class="form_input" maxlength="1000" />
                            <input type="text" id="updtDtStr" class="form_input hidden" readonly />
                        </td>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13323" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s btn_add btn_s_min5" id="importBtn"><spring:message code="ser.lbl.excelUpload" /></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11886" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_add btn_s_min5" id="btnAddItem"><spring:message code="par.btn.add" /></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11885" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_del btn_s_min5" id="btnDelItem"><spring:message code="par.btn.del" /></button>
			</dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 재고실사승인요청대상 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
    <!-- //재고실사 대상 조회 정보 -->
</div>

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            binLocLvlCnt        = "${binLocLvlCnt}",
            pStockDdDocNo       = "${pStockDdDocNo}",
            docStatCd           = "${docStatCd}",
            purcOrdTpObj        = {},
            locationListObj     = {},
            locationObj         = {},
            unitCdObj           = {},
            stockYnList         = [],
            binLocObj           = {},
            binLocLvl1Obj       = {},
            binLocLvl2Obj       = {},
            binLocLvl3Obj       = {},
            binLocLvl4Obj       = {},
            binLocLvl5Obj       = {},
            docStatList         = [],
            docStatObj          = {},
            itemStatObj          = {},
            itemDstinCdObj      = {},
            abcIndObj           = {},
            carlineCdObj        = [],
            storageObj          = {},
            stockLockYnList     = [],
            rejectYnList        = [],
            existItemChkObj     = {},
            searchRemark,
            rowNumber           = 0, //그리드 목록 번호
            bpTpList = [],
            bpTpMap = {},
            investigationListPopupWindow;

        var confirmPopupYn = "Y";

        storageObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        stockLockYnList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        stockLockYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
        stockLockYnList.push({cmmCd:"N", cmmCdNm:"No"});

        rejectYnList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        rejectYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
        rejectYnList.push({cmmCd:"N", cmmCdNm:"No"});

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>


        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        abcIndObj[' '] = "";
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        carlineCdObj[' '] = "";
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        docStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        docStatObj[' '] = "";
        <c:forEach var="obj" items="${docStatList}" varStatus="status">
            docStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemStatObj[' '] = "";
        <c:forEach var="obj" items="${itemStatList}" varStatus="status">
            itemStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        //bpTpList
        <c:forEach var="obj" items="${bpTpList}">
        bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //bpTpMap
        $.each(bpTpList, function(idx, obj){
            bpTpMap[obj.cmmCd] = obj.cmmCdNm;
        });

    $(document).on("click", ".grid-checkAll", function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });
        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    // 재고실사리스트 팝업 열기 함수.
    function selectInvestigationListPopupWindow(){

        investigationListPopupWindow = dms.window.popup({
            windowId:"investigationListPopup"
            ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
            ,width:860
            ,height:380
            ,content:{
                url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"stockDdDocNo":$("#sStockDdDocNo").val()
                    ,"docStatCd":"RGST"//등록
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                            $("#sDocStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                            $("#sStrgeCd").val(data[0].strgeCd);
                            $("#sPrsnId").val(data[0].prsnId);
                            $("#sPrsnNm").val(data[0].prsnNm);
                            $("#sRegDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].regDt));
                            $("#sStockLockYn").val(data[0].stockLockYn);//재고실사통제여부
                            $("#updtDtStr").val(data[0].updtDtStr);//재고실사통제여부


                            searchRemark = data[0].remark;
                            $("#remark").val(searchRemark);

                            //재고실사상태 버튼상태 처리.
                            setButtonEnableDisable();

                            $("#grid").data("kendoExtGrid").dataSource.read();
                        }
                        investigationListPopupWindow.close();
                    }
                }
            }
        });
    }

    //재고실사상태 버튼 Enable/Disable 처리.
    function setButtonEnableDisable(){

        $("#btnPrint").data("kendoButton").enable(true);

        if($("#sDocStatCd").data("kendoExtDropDownList").value() === 'CANC' || $("#sDocStatCd").data("kendoExtDropDownList").value() === 'END' || $("#sDocStatCd").data("kendoExtDropDownList").value() === 'ENDA'){
            $("#btnApplyReq").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnclDocNo").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#importBtn").data("kendoButton").enable(false);
        
        }else{
            $("#btnApplyReq").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnclDocNo").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#importBtn").data("kendoButton").enable(true);
            
        }
    }

    //페이지 초기화.
    function initPage(){

        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#investigationForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);

        $("#sDocStatCd").data("kendoExtDropDownList").enable(false);
        $("#btnApplyReq").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(false);
        $("#btnCnclDocNo").data("kendoButton").enable(false);
        $("#btnDelItem").data("kendoButton").enable(false);
        $("#btnAddItem").data("kendoButton").enable(false);
        $("#importBtn").data("kendoButton").enable(false);

    }

    function selectInvestigationListByKey(pStockDdDocNo){
        var header = {
                sStockDdDocNo:pStockDdDocNo
        };
        $.ajax({
            url:"<c:url value='/par/stm/investigation/selectInvestigationListByKey.do' />"
           ,data:kendo.stringify(header)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {

               if (!dms.string.isEmpty(result)) {

                   $("#sStockDdDocNo").val(result.stockDdDocNo);
                   $("#sStockLockYn").val(result.stockLockYn);
                   $("#sDocStatCd").data("kendoExtDropDownList").value(result.docStatCd);
                   $("#sStrgeCd").val(result.strgeCd);
                   $("#sPrsnId").val(result.prsnId);
                   $("#sPrsnNm").val(result.prsnNm);
                   $("#sRegDt").data("kendoExtMaskedDatePicker").value(result.approveReqDt);
                   $("#remark").val(result.remark);
                   $("#updtDtStr").val(result.updtDtStr);

                   //재고실사상태 버튼상태 처리.
                   setButtonEnableDisable();
                   // 재 조회.
                   $("#grid").data("kendoExtGrid").dataSource.read();
                   $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

               } else {
                   if(result === 0){
                       dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                   }
               }
           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }

       });
    }

    $(document).ready(function() {

        //재고실사상태
        $("#sDocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:docStatList
            ,index:0
        });
        //등록일
        $("#sRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);

        //재고실사문서본호 keypress event
        $("#sStockDdDocNo").keypress(function(event){

            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == "13"){
                var sStockDdDocNo = $("#sStockDdDocNo").val();
                //재고실사 조회.
                confirmPopupYn = "N";
                selectInvestigationListByKey(sStockDdDocNo);
                confirmPopupYn = "Y";
            }
            event.stopPropagation();
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e) {
                parent._createOrReloadTabMenu("<spring:message code='par.lbl.stockDdDoc'/>", "<c:url value='/ReportServer?reportlet=par/selectInvestigationTargetPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sStockDdDocNo="+$("#sStockDdDocNo").val());
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){
              //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지 적용.
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();

                        var grid = $("#grid").data("kendoExtGrid"),
                            rows = grid.select();

                        rows.each(function(index, row) {
                            grid.removeRow(row);
                        });

                    }
                    conformKendoWindow.close();
                }).end();
            }
        });

        // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                //부품 팝업 열기 함수.
                selectShareStockGiItemPopupWindow = dms.window.popup({
                      windowId:"selectShareStockGiItemPopupWindow"
                    , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                    , width:860
                    , height:570
                    , content:{
                        url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                        , data:{
                            "type":"custom1"
                            ,"autoBind":false
                            ,"itemCd":$("#sItemCd").val()
                            ,"prcTp": "01"//소매가
                            ,"avlbStockQtyZeroYn": "N"
                            ,"selectable":"multiple"
                            , "callbackFunc":function(items){

                                var gridData = $("#grid").data("kendoExtGrid"),
                                    toGridItems = gridData.dataSource.view(),
                                    investObj = {},
                                    itemCheckCnt = 0;
                                $.each(items,function(i,row){
                                    investObj = {
                                        "stockDdDocNo":null
                                        ,"stockDdDocLineNo":null
                                        ,"strgeCd":row.giStrgeCd
                                        ,"refDocNo":null
                                        ,"refDocLineNo":null
                                        ,"itemStatCd":$("#sDocStatCd").data("kendoExtDropDownList").value()
                                        ,"bpTp":row.bpTp
                                        ,"locCd":row.locCd
                                        ,"itemCd":row.itemCd
                                        ,"itemNm":row.itemNm
                                        ,"itemDstinCd":row.itemDstinCd
                                        ,"carlineCd":row.carlineCd
                                        ,"carlineCd2":row.carlineCd2
                                        ,"abcInd":row.abcInd
                                        ,"lastGrDt":null
                                        ,"lastGiDt":null
                                        ,"stockIvstPlanDt":null
                                        ,"bookQty":row.stockQty//장부수량 : 장면수량
                                        ,"ddQty":row.stockQty//실사수량 : 장면수량
                                        ,"diffQty":0
                                        ,"qty":0
                                        ,"prc":0
                                        ,"amt":0
                                        ,"movingAvgPrc":row.movingAvgPrc
                                        ,"avlbStockQty":row.avlbStockQty
                                        ,"resvQty":0
                                        ,"borrowQty":0
                                        ,"rentQty":0
                                        ,"resvStockQty":0
                                        ,"stockQty":row.stockQty
                                        ,"unitCd":row.stockUnitCd
                                        ,"reasonCont":" "
                                        ,"stockAdjMvtDocYyMm":null
                                        ,"stockAdjMvtDocNo":null
                                        ,"stockAdjMvtDocLineNo":null
                                        ,"stockItemPlusQty":0
                                        ,"stockItemPlusPrc":0
                                        ,"stockItemMinusQty":0
                                        ,"stockItemMinusPrc":0
                                     };

                                    if(existItemChkObj.hasOwnProperty(row.itemCd)){
                                        if(existItemChkObj[row.itemCd].hasOwnProperty(row.giStrgeCd)){
                                            //이미 등록되어있는 부품입니다.
                                            var itemInfo = row.itemCd + '[' + row.itemNm + ']' + '[' + storageObj[row.giStrgeCd] + ']';
                                            dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                        }else{
                                            existItemChkObj[row.itemCd][row.giStrgeCd] = row.itemNm;
                                            gridData.dataSource.add(investObj);
                                        }
                                    }else{
                                        existItemChkObj[row.itemCd] = {};
                                        existItemChkObj[row.itemCd][row.giStrgeCd] = row.itemNm;
                                        gridData.dataSource.add(investObj);
                                    }


                                    //}

                                })

                                selectShareStockGiItemPopupWindow.close();
                            }
                        }
                    }
                });
            }
        });

        // 실사취소 버튼
        $("#btnCnclDocNo").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    paramUrl      = '',
                    header;

                if(dms.string.isEmpty($("#sStockDdDocNo").val())){
                    //재고실사정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                    return false;
                }

                header = {
                    stockDdDocNo:$("#sStockDdDocNo").val()
                   ,stockLockYn:$("#sStockLockYn").val()
                   ,updtDtStr :$("#updtDtStr").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(gridData.itemStatCd === 'REQ'||gridData.itemStatCd === 'REL'){
                        // 취소할 수 없습니다.
                        dms.notification.warning("<spring:message code='global.err.cnclFailed'/>");
                        saveList = [];
                        return false;
                    }

                    saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data = {
                        "investigationVO":header
                        ,"investigationItemList":saveList
                    };

                    $.ajax({
                        url:"<c:url value='/par/stm/investigation/cancelInvestigationByKey.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === 1) {

                               //취소 완료 되었습니다.
                               dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.cancelSuccessParam' arguments='${stockDdDoc}'/>");
                              // 재 조회.
                              selectInvestigationListByKey($("#sStockDdDocNo").val());

                           } else {
                               if(result === 0){
                                   //취소 실패하였습니다.
                                   dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.cancelFailedParam' arguments='${stockDdDoc}'/>");
                               }
                           }
                       }
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }

                   });

                }

              }
        });

        // 승인요청 버튼
        $("#btnApplyReq").kendoButton({
            click:function(e){
                // 수정된 데이터 저장여부 확인후 저장
                var grid = $("#grid").data("kendoExtGrid");
                var saveGridData = grid.getCUDData("insertList", "updateList", "deleteList");
                if(gridChangeYn(saveGridData)){
                    dms.window.confirm({
                        message:"<spring:message code='par.info.changeSaveYn'/>"
                       ,callback:function(result){
                           if(result){
                               saveChangeGridData(saveGridData);
                               applyRequest();
                           }else{

                           }
                        }
                    })
                }else{
                    applyRequest();
                }

            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){
                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    reqStrMesg    = "<spring:message code='global.info.required.field' />",
                    selectStrMesg = "<spring:message code='global.info.chkSelectItemMsg' />",
                    saveData      = grid.getCUDData("insertList", "updateList", "deleteList"),
                    paramUrl      = '',
                    header;

                header = {
                       strgeCd          :$("#sStrgeCd").val()
                       ,stockDdDocNo    :$("#sStockDdDocNo").val()
                       ,docStatCd       :$("#sDocStatCd").data("kendoExtDropDownList").value()
                       ,stockLockYn     :$("#sStockLockYn").val()
                       ,prsnId          :$("#sPrsnId").val()
                       ,prsnNm          :$("#sPrsnNm").val()
                       ,remark          :$("#remark").val()
                       ,updtDtStr       :$("#updtDtStr").val()
                };

                if(dms.string.isEmpty($("#sStockDdDocNo").val())){
                    //재고실사정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                    return false;
                }

                /* var data = {
                    "investigationVO":header
                    ,"investigationItemList":grid.dataSource.data()
                }; */

                var data =  $.extend(
                        {"investigationVO":header}
                       ,{"investigationList":saveData}
                 );

                $.ajax({
                    //url:"<c:url value='/par/stm/investigation/updateInvestigationReg.do' />"
                    url:"<c:url value='/par/stm/investigation/updateInvestigationRegNew.do' />"
                   ,data:kendo.stringify(data)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {
                       confirmPopupYn = "N";
                       $("#grid").data("kendoExtGrid").dataSource.read();
                       confirmPopupYn = "Y";
                       $("#updtDtStr").val(result.updtDtStr);
                        // success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
               });
            }
        });

        //sStockQty
        $("#sStockQty").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sDdQty
        $("#sDdQty").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sStockItemPlusQty
        $("#sStockItemPlusQty").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sStockItemMinusQty
        $("#sStockItemMinusQty").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sStockPrice
        $("#sStockPrice").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sDdPrice
        $("#sDdPrice").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sStockItemPlusPrice
        $("#sStockItemPlusPrice").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sStockItemMinusPrice
        $("#sStockItemMinusPrice").kendoExtNumericTextBox({
            enable : false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });

        //재고실사관리 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-161702"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectApproveReqInvestigations.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation == "read") {

                            // 수정된 데이터 저장여부 확인후 저장
                            var grid = $("#grid").data("kendoExtGrid");
                            var saveGridData = grid.getCUDData("insertList", "updateList", "deleteList");
                            if(gridChangeYn(saveGridData)){
                                dms.window.confirm({
                                    message:"<spring:message code='par.info.changeSaveYn'/>"
                                   ,callback:function(result){
                                       if(result){
                                           saveChangeGridData(saveGridData);
                                       }else{

                                       }
                                    }
                                })
                            }

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 재고실사대상 검색조건 코드.
                            params["sStockDdDocNo"] = $("#sStockDdDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){

                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }else{
                            for(var i = 0,dLen = result.data.length; i < dLen; i = i + 1){
                                if(existItemChkObj.hasOwnProperty(result.data[i].itemCd)){
                                    existItemChkObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                                }else{
                                    //itemList.push(result.data[i].itemCd);
                                    existItemChkObj[result.data[i].itemCd] = {};
                                    existItemChkObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                                }
                            }
                        }

                        return result.data;
                    }
                    ,model:{
                        id:"rnum"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                             , rnum           :{ type:"string", editable:false }
                             , stockDdDocNo   :{ type:"string", editable:false }
                             , stockDdDocLineNo:{ type:"number", editable:false }
                             , strgeCd        :{ type:"string", editable:false }
                             , refDocNo       :{ type:"string", editable:false }
                             , refDocLineNo   :{ type:"number", editable:false }
                             , bpTp           :{ type:"string", editable:false }
                             , locCd          :{ type:"string", editable:false }
                             , locCdMig       :{ type:"string", editable:false }
                             , itemCd         :{ type:"string", editable:false }
                             , itemNm         :{ type:"string", editable:false }
                             , itemDstinCd    :{ type:"string", editable:false }
                             , itemStatCd     :{ type:"string", editable:false }
                             , carlineCd      :{ type:"string", editable:false }
                             , carlineCd2     :{ type:"string", editable:false }
                             , abcInd         :{ type:"string", editable:false }
                             , lastGrDt       :{ type:"date"  , editable:false }
                             , lastGiDt       :{ type:"date"  , editable:false }
                             , stockIvstPlanDt:{ type:"date"  , editable:false }
                             , bookQty        :{ type:"number", editable:true }
                             , ddQty          :{ type:"number", editable:true }
                             , diffQty        :{ type:"number", editable:true }
                             , qty            :{ type:"number", editable:false }
                             , prc            :{ type:"number", editable:false }
                             , amt            :{ type:"number", editable:true }
                             , movingAvgPrc   :{ type:"number", editable:false }
                             , resvQty        :{ type:"number", editable:false }
                             , rentQty        :{ type:"number", editable:false }
                             , borrowQty      :{ type:"number", editable:false }
                             , stockQty       :{ type:"number", editable:false }
                             , avlbStockQty   :{ type:"number", editable:false }
                             , resvStockQty   :{ type:"number", editable:false }
                             , unitCd         :{ type:"string", editable:false }
                             , reasonCont     :{ type:"string", editable:true }
                             , stockAdjMvtDocYyMm   :{ type:"string", editable:false }
                             , stockAdjMvtDocNo     :{ type:"string", editable:false }
                             , stockAdjMvtDocLineNo :{ type:"number", editable:false }
                             , stockItemPlusQty:{ type:"number", editable:true }
                             , stockItemPlusPrc:{ type:"number", editable:true }
                             , stockItemMinusQty:{ type:"number", editable:true }
                             , stockItemMinusPrc:{ type:"number", editable:true }
                         }
                     }
                 }
             }
             ,selectable :"multiple"
             ,scrollable :true
             ,sortable   :false
             ,autoBind   :false
             ,filterable:false
             ,appendEmptyColumn:true//empty column. default:false
             ,multiSelectWithCheckbox:true
             ,height:449
             ,pageable :{
                 refresh :true
                 ,pageSize :50
                 ,pageSizes :[ "50", "100", "200", "500" ]
             }
             ,edit :function(e){
                 var grid = this,
                 model = e.model,
                 input = e.container.find(".k-input"),
                 fieldName = grid.columns[e.container.index()].field;

                 //재고실사품목상태 등록(RGST), 반려(RJCT) 외 실사 셀 닫기.
                 if (e.model.itemStatCd === "REQ" || e.model.itemStatCd === "REL" || e.model.itemStatCd === "DEL") {
                     if(fieldName === "ddQty"){
                         this.closeCell();
                     }
                 }

                 if(fieldName === "diffQty" || fieldName === "amt" || fieldName === "qty" || fieldName === "prc" || fieldName === "movingAvgPrc"
                     || fieldName === "stockItemPlusQty"|| fieldName === "stockItemPlusPrc"|| fieldName === "stockItemMinusQty"|| fieldName === "stockItemMinusPrc"){
                     this.closeCell();
                 }

                 if($("#sDocStatCd").data("kendoExtDropDownList").value() === "CANC" || $("#sDocStatCd").data("kendoExtDropDownList").value() === "ENDA" ||
                         $("#sDocStatCd").data("kendoExtDropDownList").value() === "END"){
                     if(fieldName === "ddQty"){
                         this.closeCell();
                     }
                 }
             }
             ,dataBound:function(e){

                 var sStockQty = 0,
                 sStockCalQty = 0,
                 sDdQty = 0,
                 sDdCalQty = 0,
                 sStockItemPlusQty = 0,
                 sStockItemMinusQty = 0,
                 sStockPrice = 0,
                 sDdPrice = 0,
                 sStockItemPlusPrice = 0,
                 sStockItemMinusPrice = 0;

                 var rows = e.sender.tbody.children();

                 $.each(rows, function(idx, row){
                     var row = $(rows[idx]);
                     var dataItem = e.sender.dataItem(row);

                     if( dataItem != null && dataItem != 'undefined'){
                         //재고계산수량
                         sStockCalQty = 0;

                         if(dataItem.stockQty > 0){
                             sStockCalQty = dataItem.stockQty;
                         }else{
                             sStockCalQty = dataItem.stockQty * -1;
                         }

                         sStockQty += sStockCalQty;
                         sStockPrice += ( dataItem.stockQty * dataItem.movingAvgPrc);//재고금액은 원금액 그대로 처리.

                         sDdCalQty = dataItem.ddQty > 0 ? dataItem.ddQty : dataItem.ddQty * -1;

                         if(dataItem.ddQty > 0){
                             sDdCalQty = dataItem.ddQty;
                         }else{
                             sDdCalQty = dataItem.ddQty * -1;
                         }

                         sDdQty += sDdCalQty;
                         sDdPrice += (dataItem.ddQty * dataItem.movingAvgPrc);//실사금액은 원금액 그대로 처리.

                         sStockItemPlusQty += dataItem.stockItemPlusQty;
                         sStockItemPlusPrice += dataItem.stockItemPlusPrc;
                         sStockItemMinusQty += dataItem.stockItemMinusQty;
                         sStockItemMinusPrice += dataItem.stockItemMinusPrc;

                         var ddQty = row.children().eq(8);

                         if((dataItem.itemStatCd == "REDY" || dataItem.itemStatCd == "RGST" || dataItem.itemStatCd == "RJCT")
                                 && !($("#sDocStatCd").data("kendoExtDropDownList").value() === "CANC" ||
                                         $("#sDocStatCd").data("kendoExtDropDownList").value() === "ENDA" ||
                                         $("#sDocStatCd").data("kendoExtDropDownList").value() === "END")){
                             ddQty.addClass("bg_white");
                         }

                         e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                     }

                 });

                 $("#sStockQty").data("kendoExtNumericTextBox").value(sStockQty);
                 $("#sDdQty").data("kendoExtNumericTextBox").value(sDdQty);
                 $("#sStockItemPlusQty").data("kendoExtNumericTextBox").value(sStockItemPlusQty);
                 $("#sStockItemMinusQty").data("kendoExtNumericTextBox").value(sStockItemMinusQty);

                 $("#sStockPrice").data("kendoExtNumericTextBox").value(sStockPrice);
                 $("#sDdPrice").data("kendoExtNumericTextBox").value(sDdPrice);
                 $("#sStockItemPlusPrice").data("kendoExtNumericTextBox").value(sStockItemPlusPrice);
                 $("#sStockItemMinusPrice").data("kendoExtNumericTextBox").value(sStockItemMinusPrice);
             }
             , columns:[
                 {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />",width:100, hidden:true}//딜러코드
                 ,{field:"rnum" ,title:"<spring:message code='par.lbl.line'  />",attributes:{"class":"ac"} ,width:50}//Line
                 ,{field:"itemStatCd" ,title:"<spring:message code='par.lbl.itemStatCd'  />" ,attributes:{"class":"ac"} ,width:90 ,hidden:true
                     ,template  :'#= changeItemStatCd(itemStatCd)#'
                 }//품목상태코드
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd'  />" ,width:120}//품목코드
                ,{field:"itemNm",title :"<spring:message code='par.lbl.itemNm'  />" ,width:150}//품목명
                ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.strgeCd'  />",attributes:{"class":"ac"} ,width:120
                    ,template  :'#= changeStrgeCd(strgeCd)#'
                }//창고
                ,{field:"locCd" ,title:"<spring:message code='par.lbl.locationCd'  />" ,attributes:{"class":"ac"} ,width:180}//위치
                ,{field:"locCdMig" ,title:"<spring:message code='par.lbl.locationCd'  /> 2" ,attributes:{"class":"ac"} ,width:180}//위치 2
                ,{field:"ddQty" ,title:"<spring:message code='par.lbl.ddQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '" name="ddQty" />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            decimals:2
                            ,spinners:false
                            ,change:function(){

                                var grid = $("#grid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                var ddQty = this.value();   //실사수량
                                var stockQty = 0;           //장면수량
                                var diffQty = 0;            //차이수량
                                var movingAvgPrc = 0;       //이동평균단가
                                var amt = 0;                //금액
                                var stockItemPlusQty = 0;   //손익수량
                                var stockItemPlusPrc = 0;   //손익금액
                                var stockItemMinusQty = 0;  //손실수량
                                var stockItemMinusPrc = 0;  //손실금액

                                stockQty = model.get("stockQty");
                                movingAvgPrc = model.get("movingAvgPrc");

                                /*
                                * 실사수량 기준 장면재고 마이너스 처리한다.(무조건)
                                */
                                diffQty = ddQty - stockQty;

                                amt = diffQty * movingAvgPrc;

                                if(diffQty > 0){
                                    stockItemPlusQty = diffQty;
                                    stockItemPlusPrc = diffQty * movingAvgPrc;
                                }else if(diffQty < 0){
                                    stockItemMinusQty = diffQty * -1;
                                    stockItemMinusPrc = (diffQty * movingAvgPrc) * -1;
                                }else{
                                }

                                model.set("diffQty", kendo.parseFloat(kendo.toString(diffQty, "n2")));
                                model.set("bookQty", kendo.parseFloat(kendo.toString(stockQty, "n2")));
                                model.set("amt", kendo.parseFloat(kendo.toString(amt, "n2")));
                                model.set("stockItemPlusQty", kendo.parseFloat(kendo.toString(stockItemPlusQty, "n2")));
                                model.set("stockItemPlusPrc", kendo.parseFloat(kendo.toString(stockItemPlusPrc, "n2")));
                                model.set("stockItemMinusQty", kendo.parseFloat(kendo.toString(stockItemMinusQty, "n2")));
                                model.set("stockItemMinusPrc", kendo.parseFloat(kendo.toString(stockItemMinusPrc, "n2")));
                            }
                        });
                     }
                }//실사수량
                ,{field:"bookQty",title:"<spring:message code='par.lbl.realStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80 , hidden:true}//재고수량(장부수량)
                ,{field:"stockQty" ,title :"<spring:message code='par.lbl.docStockNum' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width :80}//장면재고
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"},format:"{0:n2}",width:80}//차입수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
                ,{field:"stockItemPlusQty", title:"<spring:message code='par.lbl.stockItemPlusQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2
                }//손익수량
                ,{field:"stockItemPlusPrc", title:"<spring:message code='par.lbl.stockItemPlusPrice' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2
                }//손익금액
                ,{field:"stockItemMinusQty" ,title:"<spring:message code='par.lbl.stockItemMinusQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//손실수량
                ,{field:"stockItemMinusPrc" ,title:"<spring:message code='par.lbl.stockItemMinusPrice' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//손실금액
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.itemMasterBpTp'  />" ,attributes:{"class":"ac"} ,width:80
                    ,template:'#if(bpTpMap[bpTp] !== undefined ){# #= bpTpMap[bpTp]# #}#'
                }//공급처유형
                ,{field :"itemDstinCd" ,title:"<spring:message code='par.lbl.itemDstinCd'  />", width:80 ,attributes:{"class":"ac"}
                    ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                }//부품분류(품목구분)
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd'  />" ,attributes:{"class":"ac"} ,width:90}//ABC Class
                ,{field:"unitCd" ,title:"<spring:message code='par.lbl.stockUnitCd'  />" ,attributes:{"class":"ac"} ,width:90}//단위
                ,{field:"carlineCd" ,title :"<spring:message code='par.lbl.carLine'  />" ,attributes:{"class":"ac"} ,width:120}//차종
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//단가
                ,{field:"carlineCd2" ,title:"<spring:message code='par.lbl.model' />" ,attributes:{"class":"ac"} ,width:120}//차형
             ]
         });

         // 입고 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = storageObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeLocCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = locationObj[val];
             }
             return returnVal;
         };

         //단위
         changeUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         //품목구분
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemDstinCdObj[val];
             }
             return returnVal;
         };

         //품목상태
         changeItemStatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemStatObj[val];
             }
             return returnVal;
         };

         //ABC 클래스
         changeAbcInd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = abcIndObj[val];
             }
             return returnVal;
         };

         //차종
         changeCarlineCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = carlineCdObj[val];
             }
             return returnVal;
         };

         applyRequest = function(){
             var saveList      = [],
             grid          = $("#grid").data("kendoExtGrid"),
             rows          = grid.tbody.find("tr"),
             saveData      = grid.getCUDData("insertList", "updateList", "deleteList"),
             paramUrl      = '',
             header;

             if(dms.string.isEmpty($("#sStockDdDocNo").val())){
                 //재고실사정보는 필수 입력 사항입니다.
                 dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                 return false;
             }

             if($("#sDocStatCd").data("kendoExtDropDownList").value() !== 'RGST'){
                 //등록 상태에서만 전송가능합니다.
                 dms.notification.warning("<spring:message code='par.info.applyReqStatMsg' />");
                 return false;
             }

             if(saveData.deleteList.length > 0){
                 //삭제라인 승인요청 실패하였습니다.
                 dms.notification.error("<spring:message code='par.lbl.delItem' var='delItem' /><spring:message code='global.err.applyReqFailedParam' arguments='${delItem}'/>");
                 return false;
             }

             header = {
                 stockDdDocNo:$("#sStockDdDocNo").val(),
                 remark : $("#remark").val(),
                 updtDtStr :$("#updtDtStr").val()
             };

             if(rows.length  == 0 ){
                 // 선택값이 없습니다.
                 dms.notification.warning("<spring:message code='global.info.unselected' />");
                 return false;
             }

             rows.each(function(index, row) {
                 var gridData = grid.dataSource.at(index);
                 if(dms.string.isEmpty(gridData.ddQty)){
                     // 실사 수량을 입력하십시오
                     dms.notification.warning("<spring:message code='par.lbl.ddQty' var='ddQty' /><spring:message code='global.info.confirmMsgParam' arguments='${ddQty}'/>");
                     saveList = [];
                     return false;
                 }
                 saveList.push(gridData);
             });

             if(saveList.length > 0){
                 var data ={
                     "investigationVO":header
                     ,"investigationItemList":saveList
                 };

                 $.ajax({
                     url:"<c:url value='/par/stm/investigation/updateInvestigationApplyReq.do' />"
                    ,data:kendo.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        if (result === 1) {
                            //승인요청 완료 되었습니다.
                            dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.applyReqSuccessParam' arguments='${stockDdDoc}'/>");
                            confirmPopupYn = "N";
                            selectInvestigationListByKey($("#sStockDdDocNo").val());
                            confirmPopupYn = "Y";
                        } else {
                            if(result === 0){
                                //승인요청 실패하였습니다.
                                dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.applyReqFailedParam' arguments='${stockDdDoc}'/>");
                            }
                        }
                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });
             }
         };

         // 그리드 내용 변경여부 확인
         gridChangeYn = function(saveGridData){
             if(( saveGridData.insertList.length > 0
                     || saveGridData.updateList.length > 0
                     || saveGridData.deleteList.length > 0 ) && confirmPopupYn == "Y" ){
                     //|| saveGridData.deleteList.length > 0 ) && btnSaveClickYn == "N" && btnApplyClickYn == "N" ){
                 return true;
             }else{
                 return false;
             }
         };

         // 그리드 변경내역 저장 로직
         saveChangeGridData = function(saveGridData){
             var header = {
                      strgeCd         :$("#sStrgeCd").val()
                     ,stockDdDocNo    :$("#sStockDdDocNo").val()
                     ,docStatCd       :$("#sDocStatCd").data("kendoExtDropDownList").value()
                     ,stockLockYn     :"N"
                     ,prsnId          :$("#sPrsnId").val()
                     ,prsnNm          :$("#sPrsnNm").val()
                     ,remark          :$("#remark").val()
                     ,updtDtStr       :$("#updtDtStr").val()
              };

              if(dms.string.isEmpty($("#sStockDdDocNo").val())){
                  //재고실사정보는 필수 입력 사항입니다.
                  dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                  return false;
              }

              var data =  $.extend(
                      {"investigationVO":header}
                     ,{"investigationList":saveGridData}
               );

              $.ajax({
                  url:"<c:url value='/par/stm/investigation/updateInvestigationRegNew.do' />"
                 ,data:kendo.stringify(data)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,async:false
                 ,success:function(result) {
                      //$("#grid").data("kendoExtGrid").dataSource.read();
                      dms.notification.success("<spring:message code='global.info.success'/>");
                      $("#updtDtStr").val(result.updtDtStr);
                 }
                 ,error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             });
         };

        initPage();

        //재고실사현황에서 전달된 재고실사문서정보 및 재고실사상태코드
        var pStockDdDocNo = "${pStockDdDocNo}";
        var pDocStatCd = "${pDocStatCd}";

        if(pStockDdDocNo !== ""){
            $("#sStockDdDocNo").val(pStockDdDocNo);
            //재고실사 조회.
            selectInvestigationListByKey(pStockDdDocNo);
        }

    });

    
    $("#importBtn").kendoButton({
        click:function(e) {
        	investigationExcelUploadPopupWin = dms.window.popup({
                title:"<spring:message code='par.title.uploadFile' />"
                ,windowId:"investigationExcelUploadPopupWin"
                ,width : 680
                ,height: 340
                ,content:{
                     url:"<c:url value='/par/cmm/selectInvestigationExcelUploadPopup.do'/>"
                    ,data:{
                    	   "sStockDdDocNo":$("#sStockDdDocNo").val()
                    	  ,"callbackFunc":function(data){
                            dms.loading.hide();
                            //刷新列表
                            $("#grid").data("kendoExtGrid").dataSource.read();
                        }
                    }
                }
            });
            
        }
    });
</script>
<!-- //script -->


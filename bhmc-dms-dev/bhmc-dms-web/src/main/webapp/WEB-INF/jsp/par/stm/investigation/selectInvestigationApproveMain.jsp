<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!--실사결과승인 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11897" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11896" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnApply" class="btn_m" ><spring:message code="par.btn.approval" /><!-- 승인 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11895" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnRejectDocNo" class="btn_m"><spring:message code="par.btn.appRollback" /><!-- 반려 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11894" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="" class="btn_m hidden"><spring:message  code="par.btn.excelDownload" /><!-- 다운로드 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11893" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" class="btn_m hidden"><spring:message code="par.btn.print" /><!-- 프린트 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11892" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>
        <form id="invform" method="POST" action="/">
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sStockDdDocNo" class="form_input">
                                <a id="searchStockDdDocNo"><!-- 검색 --></a>
                                <input type="text" id="strgeCd" class="form_input hidden">
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sRegDtFr" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sRegDtTo" class="form_datepicker" />
                                    <input type="text" id="sRegDt" class="form_datepicker hidden">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 실사확인자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="hidden" id="sPrsnId"  class="form_input" />
                                <input type="text" id="sPrsnNm"  class="form_input" />
                                <a id="searchPrsnId"></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
                        <td>
                            <input id="sDocStatCd" class="form_comboBox"  data-type="combo"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="hgrid" class="grid"></div>
        </div>

        <div class="table_form form_width_70per mt5" id="investigationForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td class="readonly_area">
                            <input type="text" id="stockDdDocNo"  class="form_input" readonly />
                            <input type="text" id="stockLockYn"   class="form_input hidden" readonly />
                            <input type="text" id="updtDtStr"     class="form_input hidden" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                        <td class="readonly_area">
                            <input id="regDt"  class="form_datepicker" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 실사확인자 --></th>
                        <td class="readonly_area">
                            <input type="hidden" id="prsnId" class="form_input" readonly />
                            <input type="text" id="prsnNm" class="form_input" readonly />
                        </td class="readonly_area">
                        <th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
                        <td class="readonly_area">
                            <input id="docStatCd" class="form_comboBox"  data-type="combo" readonly />
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
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 재고실사승인요청대상 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </form>
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
            itemStatObj         = {},
            itemDstinCdObj      = {},
            abcIndObj           = {},
            carlineCdObj        = [],
            storageObj          = {},
            stockLockYnList     = [],
            searchRemark,
            rowNumber           = 0, //그리드 목록 번호
            bpTpList            = [],
            bpTpMap             = {},
            investigationListPopupWindow;

        storageObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        stockLockYnList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        stockLockYnList.push({cmmCd:"Y", cmmCdNm:"是"});
        stockLockYnList.push({cmmCd:"N", cmmCdNm:"否"});

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

    function salePrsnSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   //user select
            ,width:840
            ,height:500
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sPrsnId").val(data[0].usrId);
                            $("#sPrsnNm").val(data[0].usrNm);
                        }
                        userSearchPopupWin.close();
                    }
                }
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

        //재고실사상태
        $("#docStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:docStatList
            ,index:0
        });

       //prsnId search popup
       $("#searchPrsnId").on('click', salePrsnSearchPopup);

        //등록일
        $("#sRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,value:"${sysDate}"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

      //조회조건-등록일 From
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
         });

       //조회조건-등록일 To
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
         });

        //등록일
        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //실사결과등록일자
        $("#sInvRsltRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //심사일자
        $("#sEvalDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //유형
        $("#sType").kendoExtDropDownList({
           dataSource:[
                         {"cmmCd":"01", "cmmCdNm":"盘盈"} //Overage
                        ,{"cmmCd":"02", "cmmCdNm":"盘亏"} //Shortage
                        ,{"cmmCd":"03", "cmmCdNm":"确认"} //확정
                   ]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);

        //재고실사문서본호 keypress event
        $("#sStockDdDocNo").keypress(function(event){

            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == "13"){
                var sStockDdDocNo = $("#sStockDdDocNo").val();
                //재고실사 조회.
                selectInvestigationListByKey(sStockDdDocNo);
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
            click:function(e) {
                parent._createOrReloadTabMenu("<spring:message code='par.title.ddPrintDoc' />", "<c:url value='/ReportServer?reportlet=par/selectInvestigationApprovePrintMain.cpt'/>&sDlrCd=${dlrCd}&sStockDdDocNo="+$("#stockDdDocNo").val());
            }
        });

        //조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                if($("#sPrsnNm").val() === '' && $("#sPrsnId").val() !== '') {
                    $("#sPrsnId").val('');
                }
                $("#hgrid").data("kendoExtGrid").dataSource.read();

            }
        });

        // 반려 버튼
        $("#btnRejectDocNo").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    paramUrl      = '',
                    header;

                header = {
                    stockDdDocNo   :$("#stockDdDocNo").val()
                   ,updtDtStr      :$("#updtDtStr").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(gridData.itemStatCd !== 'REQ'){
                        // 반려할 수 없습니다.
                        dms.notification.warning("<spring:message code='par.btn.appRollback' var='appRollback' /><spring:message code='global.err.failedParam' arguments='${appRollback}'/>");
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
                        url:"<c:url value='/par/stm/investigation/updateInvestigationByReject.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === 1) {

                               //반려 완료 되었습니다.
                               dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.rejectSuccessParam' arguments='${stockDdDoc}'/>");
                               initPage();
                               $("#hgrid").data("kendoExtGrid").dataSource.read();

                           } else {
                               if(result === 0){
                                   //반려 실패하였습니다.
                                   dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.rejectFailedParam' arguments='${stockDdDoc}'/>");
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
        // 승인 버튼
        $("#btnApply").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    paramUrl      = '',
                    header;

                header = {
                    stockDdDocNo   :$("#stockDdDocNo").val()
                   ,strgeCd        :$("#strgeCd").val()
                   ,stockLockYn    :$("#stockLockYn").val()
                   ,prsnId         :$("#prsnId").val()
                   ,prsnNm         :$("#prsnNm").val()
                   ,updtDtStr      :$("#updtDtStr").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(dms.string.isEmpty(gridData.itemStatCd) || gridData.itemStatCd !== 'REQ'){
                        // 승인요청시에만 승인가능합니다.
                        dms.notification.warning("<spring:message code='par.info.applyStatMsgParam' arguments='" + gridData.itemCd + "'/>");
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
                        url:"<c:url value='/par/stm/investigation/updateInvestigationApplyCnfm.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === 1) {

                               //승인요청 완료 되었습니다.
                               dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.applyReqSuccessParam' arguments='${stockDdDoc}'/>");
                               initPage();
                               $("#hgrid").data("kendoExtGrid").dataSource.read();

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

        //실사문서 그리드 세팅
        $("#hgrid").kendoExtGrid({
            gridId:"G-PAR-0519-172301"
           ,dataSource:{
                transport:{
                     read :{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sPrsnNm"]              = $("#sPrsnNm").val();
                            params["sPrsnId"]              = $("#sPrsnId").val();
                            params["sStockDdDocNo"]        = $("#sStockDdDocNo").val();
                            params["sRegDtFr"]             = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]             = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sDocStatCd"]           = $("#sDocStatCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);

                         }
                     }
                 }
                ,schema:{
                    data:function(result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }
                        return result.data;
                    }
                   ,model:{
                        id:"stockDdDocNo"
                        ,fields:{
                             rnum                   :{ type:"string" } //No
                            ,move                   :{ type:"string" } //바로가기
                            ,dlrcd                  :{ type:"string" } //딜러코드
                            ,docStatCd              :{ type:"string" } //문서상태코드
                            ,stockDdDocNo           :{ type:"string" } //재고실사문서번호
                            ,regDt                  :{ type:"date"   } //등록일
                            ,approveReqDt           :{ type:"date"   } //승인요청일자
                            ,endDt                  :{ type:"date"   } //완료일자
                            ,prsnId                 :{ type:"string" } //담당자
                            ,prsnNm                 :{ type:"string" } //담당자
                            ,stockLockYn            :{ type:"string" } //재고통제여부
                            ,remark                 :{ type:"string" } //비고
                            ,signOpnCont            :{ type:"string" } //결재의견
                            ,stockQty               :{ type:"number" } //재고수량
                            ,stockPrice             :{ type:"number" } //재고금액
                            ,updtDtStr              :{ type:"string" }
                        }
                    }
                 }
            }
           ,height:173
           ,selectable:"row"
           ,scrollable :true
           ,autoBind   :false
           ,filterable:false
           ,sortable:false
           ,appendEmptyColumn:true//empty column. default:false
           ,editable   :false
           ,dataBinding:function(e){
               rowNumber = 0;
            }
           ,change:function(e) {

                   var selectedVal = this.dataItem(this.select());
                   //재고실사문서 정보 SEARCHING DATA SETTING
                   $("#prsnId").val(selectedVal.prsnId);
                   $("#prsnNm").val(selectedVal.prsnNm);
                   $("#stockDdDocNo").val(selectedVal.stockDdDocNo);                        //재고실사문서
                   $("#regDt").data("kendoExtMaskedDatePicker").value(new Date(selectedVal.regDt));
                   $("#strgeCd").val(selectedVal.strgeCd);
                   $("#docStatCd").data("kendoExtDropDownList").value(selectedVal.docStatCd);
                   $("#stockLockYn").val(selectedVal.stockLockYn);
                   $("#updtDtStr").val(selectedVal.updtDtStr);

                   searchRemark = selectedVal.remark;

                   if(selectedVal.docStatCd ==="REQ"){
                       $("#btnApply").data("kendoButton").enable(true);
                       $("#btnRejectDocNo").data("kendoButton").enable(true);
                   }else{
                       $("#btnApply").data("kendoButton").enable(false);
                       $("#btnRejectDocNo").data("kendoButton").enable(false);
                   }

                   //재고실사문서 정보 조회
                   $("#grid").data("kendoExtGrid").dataSource.read();
           }
           ,columns:[
               {field:"rnum" ,title:"<spring:message code='par.lbl.line'  />" ,sortable:false ,width:50
                   ,template  :"#= ++rowNumber #"
               }//No
               ,{field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />",attributes:{"class":"ac"},width:100,hidden:true}//딜러코드
               ,{field:"stockDdDocNo",title:"<spring:message code='par.lbl.stockDdDoc' />",attributes:{"class":"ac"},width:120 }//재고실사문서
               ,{field:"regDt",title:"<spring:message code='par.lbl.investigationConfDt' />",attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}",width:100 }//등록일
               ,{field:"prsnId",title:"<spring:message code='par.lbl.investigationPrsId' />",attributes:{"class":"ac"},width:100,hidden:true }//담당자
               ,{field:"prsnNm",title:"<spring:message code='par.lbl.investigationPrsId' />",attributes:{"class":"ac"},width:100 }//담당자
               ,{field:"stockLockYn",title:"<spring:message code='par.lbl.stockLockYn' />",attributes:{"class":"ac"},width:100 }//재고통제여부
               ,{field:"stockQty" ,title:"<spring:message code='par.lbl.ddTotQty' />",attributes:{"class":"ar"},format:"{0:n2}",decimal:2,width:80}//재고수량(장부수량)
               ,{field:"stockPrice",title:"<spring:message code='par.lbl.ddTotPrice' />",width:100,attributes:{ "class":"ar"},format:"{0:n2}",decimals:2}//금액
               ,{field:"docStatCd",title:"<spring:message code='par.lbl.statNm' />",attributes:{"class":"ac"},width:120
                   ,template  :'#= changeDocStatCd(docStatCd)#'
               }//상태
               ,{field:"remark",title:"<spring:message code='par.lbl.remark' />",width:200}//비고
               ,{field:"updtDtStr", hidden:true}//수정일시
            ]
        });
        //재고실사관리 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-0808-161501"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/stm/investigation/selectApproveReqInvestigations.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             // 재고실사대상 검색조건 코드.
                             params["sStockDdDocNo"]      = $("#stockDdDocNo").val();

                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){

                          if(result.total === 0){
                              //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }

                          return result.data;
                      }
                     ,model:{
                        id:"stockDdDocNo"
                       ,fields:{
                           dlrCd          :{ type:"string" , validation:{required:true} }
                           , rnum           :{ type:"string", editable:false }
                           , stockDdDocNo   :{ type:"string", editable:false }
                           , stockDdDocLineNo:{ type:"number", editable:false }
                           , strgeCd        :{ type:"string", editable:false }
                           , refDocNo       :{ type:"string", editable:false }
                           , refDocLineNo   :{ type:"number", editable:false }
                           , bpTp           :{ type:"string", editable:false }
                           , locCd          :{type :"string", editable:false }
                           , locCdMig       :{type :"string", editable:false }
                           , itemCd         :{ type:"string", editable:false }
                           , itemNm         :{ type:"string", editable:false }
                           , itemDstinCd    :{type :"string", editable:false }
                           , itemStatCd     :{type :"string", editable:false }
                           , carlineCd      :{type :"string", editable:false }
                           , carlineCd2     :{type :"string", editable:false }
                           , abcInd         :{type :"string", editable:false }
                           , lastGrDt       :{ type:"date"  , editable:false }
                           , lastGiDt       :{ type:"date"  , editable:false }
                           , stockIvstPlanDt:{ type:"date"  , editable:false }
                           , bookQty        :{ type:"number", editable:false }
                           , ddQty          :{ type:"number", editable:false }
                           , diffQty        :{ type:"number", editable:false }
                           , qty            :{ type:"number", editable:false }
                           , prc            :{ type:"number", editable:false }
                           , amt            :{ type:"number", editable:false }
                           , movingAvgPrc   :{ type:"number", editable:false }
                           , resvQty        :{ type:"number", editable:false }
                           , rentQty        :{ type:"number", editable:false }
                           , borrowQty      :{ type:"number", editable:false }
                           , stockQty       :{ type:"number", editable:false }
                           , unitCd         :{ type:"string", editable:false }
                           , reasonCont     :{ type:"string", editable:false }
                           , stockAdjMvtDocYyMm   :{ type:"string", editable:false }
                           , stockAdjMvtDocNo     :{ type:"string", editable:false }
                           , stockAdjMvtDocLineNo :{ type:"number", editable:false }
                         }
                     }
                 }
             }
             ,selectable :"multiple"
             ,scrollable :true
             ,sortable   :false
             ,height     :265
             ,autoBind   :false
             ,filterable:false
             ,appendEmptyColumn:true//empty column. default:false
             ,multiSelectWithCheckbox:false
             ,editable   :false
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

                         //수정이 불가능한 컬럼이라 흰색이 아니라고 생각함.
                         /* if(dataItem.itemStatCd == "REDY" || dataItem.itemStatCd == "RGST" || dataItem.itemStatCd == "RJCT"){
                             ddQty.addClass("bg_white");
                         } */

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
               ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.strgeCd'  />" ,width:100
                   ,template  :'#= changeStrgeCd(strgeCd)#'
               }//창고
               ,{field:"locCd" ,title:"<spring:message code='par.lbl.locationCd'  />" ,width:120}//위치
               ,{field:"locCdMig" ,title:"<spring:message code='par.lbl.locationCd'  /> 2" ,width:120}//위치 2
               ,{field:"ddQty" ,title:"<spring:message code='par.lbl.ddQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//실사수량
               ,{field:"stockQty" ,title :"<spring:message code='par.lbl.stockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width :80}//가용수량
               ,{field:"bookQty",title:"<spring:message code='par.lbl.realStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//재고수량(장부수량)
               ,{field:"resvQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
               ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
               ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"},format:"{0:n2}" ,decimal:2,width:90}//차입수량
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

      //문서 상태 그리드 콤보
        changeDocStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = docStatObj[val];
            }
            return returnVal;
        };

        //ABC CLASS 그리드 콤보
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        //품목 상태 그리드 콤보
        changeItemStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemStatObj[val];
            }
            return returnVal;
        };

        // 재고통제여부 그리드 콤보
        changeStockLockYn = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = stockLockYnObj[val];
            }
            return returnVal;
        };

        // 창고 그리드 콤보
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = storageObj[val];
            }
            return returnVal;
        };

        initPage();
    });

    function initPage(){
        var minDate = new Date('1990-01-01'),
            maxDate = new Date('9999-12-31'),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();


        $("#hgrid").data("kendoExtGrid").dataSource.data([]);
        $("#grid").data("kendoExtGrid").dataSource.data([]);
       // $("#grid2").data("kendoExtGrid").dataSource.data([]);

        //$("#btnApply").hide();
        $("#btnApply").data("kendoButton").enable(false);
        //$("#btnRejectDocNo").hide();
        $("#btnRejectDocNo").data("kendoButton").enable(false);
       // $("#invform").get(0).reset();
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#invform")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#sDocStatCd").data("kendoExtDropDownList").value('REQ');

        //재고실사 현황에서 넘어온경우
        if(!dms.string.isEmpty(pStockDdDocNo)){
            //$("#sStockDdDocNo").val(pStockDdDocNo);

            selectInvestigationListByKey(pStockDdDocNo);

        }

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

    }
    //재고실사리스트 팝업 열기 함수.
    function selectInvestigationListPopupWindow(){

        investigationListPopupWindow = dms.window.popup({
            windowId:"investigationListPopup"
            ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
            ,width:860
            ,height:400
            ,content:{
                url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"stockDdDocNo":$("#sStockDdDocNo").val()
                    ,"docStatCd"   :"REQ"
                    ,"callbackFunc":function(data){
                        if(data.length > 0){

                            //set data item
                            $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                            $("#strgeCd").val(data[0].strgeCd);
                            $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                            $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                            $("#sDocStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                            $("#docStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                            $("#stockDdDocNo").val(data[0].stockDdDocNo);
                            $("#prsnId").val(data[0].prsnId);
                            $("#prsnNm").val(data[0].prsnNm);
                            $("#regDt").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                            $("#stockLockYn").val(data[0].stockLockYn);
                            $("#updtDtStr").val(data[0].updtDtStr);
                            searchRemark = data[0].remark;

                            //button enable
                            $("#btnApply").data("kendoButton").enable(true);
                            $("#btnRejectDocNo").data("kendoButton").enable(true);
                            //grid select
                            $("#hgrid").data("kendoExtGrid").dataSource.read();
                            $("#grid").data("kendoExtGrid").dataSource.read();
                        }
                        investigationListPopupWindow.close();
                    }
                }
            }
        });
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
                   $("#strgeCd").val(result.strgeCd);
                   $("#sDocStatCd").data("kendoExtDropDownList").value(result.docStatCd);
                   $("#sPrsnId").val(result.prsnId);
                   $("#sPrsnNm").val(result.prsnNm);
                   $("#sRegDt").data("kendoExtMaskedDatePicker").value(result.regDt);

                   $("#stockDdDocNo").val(result.stockDdDocNo);
                    $("#prsnId").val(result.prsnId);
                    $("#prsnNm").val(result.prsnNm);
                   $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
                   $("#updtDtStr").val(result.updtDtStr);

                   searchRemark = result.remark;

                   $("#btnApply").data("kendoButton").enable(true);
                   $("#btnRejectDocNo").data("kendoButton").enable(true);

                   $("#hgrid").data("kendoExtGrid").dataSource.read();
                   $("#grid").data("kendoExtGrid").dataSource.read();

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

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(!dms.string.isEmpty(this.value())){
            if(id === 'sRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
    }

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

</script>
<!-- //script -->


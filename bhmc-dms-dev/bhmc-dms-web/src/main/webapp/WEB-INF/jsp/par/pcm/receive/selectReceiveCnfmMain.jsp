<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 입고확정 -->
<div id="resizableContainer">
    <section class="group" id="receiveCnfmSection">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.receiveCnfmInfo" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11633" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11632" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_m_min hidden" id="btnSaveAll"><spring:message code="par.btn.save" />ALL<!-- 저장 --></button>
                <button class="btn_m btn_m_min" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11631" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_m_min hidden" id="btnCnfmAll"><spring:message code="par.btn.receiveCnfm" />ALL<!-- 입고확정 --></button>
                <button class="btn_m btn_m_min" id="btnCnfm"><spring:message code="par.btn.receiveCnfm" /><!-- 입고확정 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11630" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11629" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_m_min" id="btnPrint"><spring:message code="par.btn.receiveCnfmPrint" /><!-- 입고?출력 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11623" hasPermission="${dms:getPermissionMask('READ')}">
                <!-- 조회기능 존재하지만 필요없어진 관계로 hidden처리함.(송장번호가 필요하기에 송장팝업으로 대체) -->
                <button class="btn_m btn_search hidden" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.sBpNm" /><!-- 공급업체 --></span></th>
                        <td>
                            <div class="form_search">
                                <input type="hidden" id="bpCd" name="bpCd" class="form_input" required/>
                                <input type="text" id="bpNm" class="form_input" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpTpNm" /><!-- 공급업체유형 --></span></th>
                        <td class="readonly_area">
                            <input id="bpTp" data-type="combo" class="form_comboBox form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="mobisInvcNo" class="form_input form_readonly" readonly />
                            <input id="invcDocNo" type="hidden"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcCnfmDt" /><!-- 송장확정일시 --></th>
                        <td class="readonly_area">
                            <input id="confirmDt" class="form_datepicker" data-type="maskDate" readonly />
                            <input id="arrvDt" class="form_datepicker hidden" data-type="maskDate" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcGrDocNo" /><!-- 입고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="grDocNo" class="form_input form_readonly" readonly />
                                <a id="searchGrDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcGrConfirmer" /><!-- 입고확인자 --></th>
                        <td>
                            <input id="regUsrId" class="form_input form_readonly hidden" readonly />
                            <input id="regUsrNm" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grTime" /><!-- 입고일자 --></th>
                        <td class="readonly_area">
                            <input id="invcGrDt" class="form_datepicker" data-type="maskDate" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grGubun" /><!-- 입고구분 --></th>
                        <td class="readonly_area">
                            <input id="grTp" class="form_comboBox" data-type="combo" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                        <td class="readonly_area">
                            <input id="grTotQty" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.qualityClaimQty" /><!-- 클레임수량 --></th>
                        <td class="readonly_area">
                            <input id="claimTotQty" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.taxRate" /><!-- 할인율 --></th>
                        <td id="dcRateArea" class="readonly_area">
                            <input id="dcRate" data-type="number" class="form_numeric" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grAmtTax" /><!-- 입고금액 --></th>
                        <td class="readonly_area">
                            <input id="grTotAmt" data-type="number" class="form_numeric"/>
                            <input id="invcTp" class="form_comboBox hidden" data-type="combo" readonly />
                            <input id="invcStatCd" class="form_comboBox hidden" type="text" data-type="combo" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="7">
                            <input id="remark" type="text" value="" class="form_input" />
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13241" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_s_min" id="btnSetStrgeCdPop"><spring:message code="par.lbl.grStrgeCd" /><!-- 창고설정팝업 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11628" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_s_min" id="btnInvcListPop"><spring:message code="par.btn.invcRef" /><!-- 송장리스트팝업 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11627" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_add btn_s_min5" id="btnAddPurcOrd"><spring:message code="par.btn.purcOrdRef" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11626" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_file btn_s_min5" id="btnExcelUpload"><spring:message code="par.btn.excelUpload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11625" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_add btn_s_min5"  id="btnAddItem"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11624" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_del btn_s_min5"  id="btnDelItem"><spring:message code="par.btn.del" /></button>
            </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 입고확정대상 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //구매오더 -->

<!-- script -->
<script>
        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            sessionBpTp         = "${bpTp}",
            toDt                = "${toDt}",
            toDate              = new Date(toDt),
            sevenDtBf           = "${sevenDtBf}",
            pMobisInvcNo        = "${pMobisInvcNo}",
            pBpCd               = "${pBpCd}",
            pBpNm               = "${pBpNm}",
            pArrvYy             = "${pArrvYy}",
            pArrvMm             = "${pArrvMm}",
            pArrvDd             = "${pArrvDd}",
            pItemDistinCd       = "${pItemDistinCd}",
            pInvcDocNo          = "${pInvcDocNo}",
            gVatCd              = Number("${vatCd}"),
            gCrud               = "C",
            purcOrdTpObj        = {},
            locationListObj     = {},
            locationObj         = {},
            invcUnitObj         = {},
            invcTpList          = [],
            invcTpObj           = {},
            grTpList            = [],
            invcStatList        = [],
            invcStatObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            abcIndList          = [],
            carlineCdList       = [],
            grStrgeTpList       = [],
            grStrgeTpObj        = {},
            claimTpList         = [],
            claimTpObj          = {},
            claimTargetTpList   = [],
            claimTargetTpObj    = {},
            purcItemTpList      = [],
            purcItemTpObj       = {},
            dlPdcCdList         = [],
            existItemChkObj     = {},
            checkdIds           = {},
            bpTpList            = [],
            searchItemPopupWindow,
            itemByBpCdPopupWindow,
            prevPurcOrdPopupWindow,
            invcListPopupWindow,
            receiveCnfmListPopupWindow,
            searchTrsfTp,
            transObj,
            changeAggregates,
            grStrgeCdDropDownEditor,
            grLocCdDropDownEditor,
            changeInvcNumEditor,
            grClaimTpDropDownEditor,
            claimTargCdDropDownEditor,
            changeClaimTargCd,
            changeCompareQty,
            changePurcOrdTp,
            changeInvcUnit,
            changePrcTp,
            changeClaimTp,
            changeGrLocCd,
            changeGrStrgeCd,
            changeStatCd,
            changeInvcStat,
            changeInvcTp,
            invcTpList          = [],
            invcStatList        = [],
            invcStatObj         = [];

        <c:forEach var="obj" items="${bpTpList}" varStatus="status">
            if("01" === "${obj.remark2}"){
                bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
        </c:forEach>
        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        grTpList.push({cmmCd:"", cmmCdNm:" "});
        <c:forEach var="obj" items="${grTpList}" varStatus="status">
            grTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>

        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${invcUnitList}" varStatus="status">
            invcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        grStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        claimTpObj[' '] = "";
        <c:forEach var="obj" items="${clTpList}" varStatus="status">
            claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        claimTargetTpObj[' '] = "";
        <c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
            claimTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>


        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
        </c:forEach>

        <c:forEach var="obj" items="${invcTpList}" varStatus="status">
            invcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            invcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${invcStatList}" varStatus="status">
            invcStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            invcStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        invcStatObj["04"] = "取消";

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
       // gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);

    //gridHeight - if grid has footer
    function gridHeight(){
        var grid = $("#grid").data("kendoExtGrid");
        var contentHeight = grid.content.height();
        var footerHeight = grid.wrapper.find(".k-grid-footer").height();
        grid.content.height(contentHeight - (footerHeight + 1));
    }


    // 품목구분 그리드 콤보
    function setSumData(val){
        var returnData  = Math.round(val * 1000)/1000,
            returnCalData = Math.round(returnData * 100)/100,
            returnVal = kendo.toString(returnData,'n2');

        return returnVal;
    }

    $(document).ready(function() {

        //입고구분(로컬여부)
        $("#grTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:grTpList
            ,index:0
        });

        //거래처구분
        $("#bpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
            ,optionLabel:" "
            ,index:0
        });

        //배송PDC선택
        $("#sDlPdcCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dlPdcCdList
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
        //sCarlineCd
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           ,index:0
        });
        //invcTp
        $("#invcTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcTpList
            ,optionLabel:" "
            ,index:0
        });
        //invcStatCd
        $("#invcStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcStatList
            ,optionLabel:" "
            ,index:0
        });

        $("#invcGrDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#confirmDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        // 도착일자
        $("#arrvDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //grTotQty
        $("#grTotQty").kendoExtNumericTextBox({
            enable:false
            ,format:"n0"
            ,decimals:0
            ,spinners:false
            ,value:0
        });
        $("#grTotQty").data("kendoExtNumericTextBox").readonly();

        //claimTotQty
        $("#claimTotQty").kendoExtNumericTextBox({
            enable:false
            ,format:"n0"
            ,decimals:0
            ,spinners:false
            ,value:0
        });
        $("#claimTotQty").data("kendoExtNumericTextBox").readonly();
        //grTotAmt
        $("#grTotAmt").kendoExtNumericTextBox({
            enable:false
            ,format:"n2"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        $("#grTotAmt").data("kendoExtNumericTextBox").readonly();
        //세율
        $("#dcRate").kendoExtNumericTextBox({
            format:"## \\%"
           ,decimals:0
           ,spinners:false
           ,change: function() {
               var value = this.value();
               fnChangeDcRate(value);
           }
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchGrDocNo").on('click', selectReceiveCnfmListPopupWindow);

        $(document).on("click", ".grid-checkAll", function(e){
            var grid = $("#grid").data("kendoExtGrid"),
                checked = $(this).is(":checked"),
                rows = grid.tbody.find("tr"),
                lineDisabled;

            if(checked){
                rows.each(function(index, row) {
                    lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                    if(!lineDisabled){
                        grid.select($(this));
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                    }
                });



            }else{
                grid.clearSelection();

                rows.each(function(index, row) {
                    lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                    if(!lineDisabled){
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    }
                });
            }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pMobisInvcNo = '';
                pInvcDocNo = '';
                pBpCd = '';
                pBpNm = '';
                pArrvDt = '';
                gCrud       = "C";
                initPage();
            }
        });

         // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectItemPopupWindow();
            }
        });
        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){
              //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            var grid = $("#grid").data("kendoExtGrid"),
                            rows = grid.select();

                            if(rows.length  == 0 ){
                                // 선택값이 없습니다.
                                dms.notification.warning("<spring:message code='global.info.unselected' />");
                                return false;
                            }

                            rows.each(function(index, row) {
                                var l_rowData = grid.dataItem(row);
                                delete existItemChkObj[l_rowData.itemCd];
                            });

                            rows.each(function(index, row) {
                                grid.removeRow(row);
                            });

                            calTotalAmt();
                        }
                        conformKendoWindow.close();
                    }).end();
            }
        });
        //송장관리
        /*
        $("#btnInvcMng").kendoButton({
            click:function(e) {
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partInvcSave" />'
                        ,"<c:url value='/par/pcm/invc/selectInvcList.do'/>", "VIEW-D-10184");
            }
        });
        */
        //송장리스트팝업
        $("#btnInvcListPop").kendoButton({
            click:function(e) {

                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectInvcListPopupWindow();
            }
        });
        //구매오더 참조
        $("#btnAddPurcOrd").kendoButton({
            click:function(e) {

                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPrevPurcOrdPopupWindow();
            }
        });
        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                existItemChkObj = {};
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e) {
                parent._createOrReloadTabMenu("<spring:message code='par.lbl.grPrintDoc'/>", "<c:url value='/ReportServer?reportlet=par/selectInvcPrintMain.cpt'/>&sDlrCd=${dlrCd}&sInvcDocNo="+$("#grDocNo").val(),"VIEW-D-13134",true);
            }
        });

        //엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {
                receiveEtcExcelUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='par.title.uploadFile' />"
                    ,windowId:"receiveEtcExcelUploadPopupWin"
                    ,width : 680
                    ,height: 340
                    ,content:{
                         url:"<c:url value='/par/cmm/selectReceiveEtcExcelUploadPopup.do'/>"
                        ,data:{
                            "bpTp":$("#bpTp").data("kendoExtDropDownList").value()
                           ,"callbackFunc":function(data){

                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    dcRate       = Number($("#dcRate").data("kendoExtNumericTextBox").value()),
                                    lDcRate      = 0,
                                    popItemData  = {},
                                    itemList     = [],
                                    tDate,
                                    rows;

                                if(dms.string.isEmpty(dcRate) || Number(dcRate) < 0){
                                    dcRate = (gVatCd * 100);
                                }

                                lDcRate = Number(dcRate/100) + 1;

                                for(var i = 0; i < dataLen; i = i + 1){
                                    //내용
                                    popItemData = {};
                                    popItemData.dlrCd              = data[i].dlrCd;
                                    popItemData.dlPdcCd            = "";
                                    popItemData.purcOrdTp          = "01";
                                    popItemData.prcTp              = "01";
                                    popItemData.invcTp             = "";
                                    popItemData.invcStatCd         = "00";
                                    popItemData.invcDocNo          = "";
                                    popItemData.invcDt             = null;
                                    popItemData.bmpOrdNo           = "";
                                    popItemData.bmpOrdLineNo       = null;
                                    popItemData.purcOrdNo          = "";
                                    popItemData.purcOrdLineNo      = null;
                                    popItemData.purcOrdLineDetlNo = "";
                                    popItemData.mobisInvcNo        = "";
                                    popItemData.mobisInvcLineNo    = null;
                                    popItemData.itemCd             = data[i].itemCd;
                                    popItemData.itemNm             = data[i].itemNm;
                                    popItemData.invcUnitCd         = data[i].invcUnitCd;
                                    popItemData.invcQty            = data[i].invcQty;
                                    popItemData.invcTargetQty      = 0;
                                    popItemData.compareQty         = 0;
                                    popItemData.invcPrc            = data[i].invcPrc;
                                    popItemData.invcTotAmt         = data[i].invcTotAmt;

                                    if(dcRate > 0){
                                        popItemData.invcAmt        = (data[i].invcPrc / lDcRate) * data[i].invcQty;
                                        popItemData.taxAmt         = data[i].invcTotAmt - ((data[i].invcPrc / lDcRate) * data[i].invcQty);
                                        popItemData.taxDdctPrc     = data[i].invcPrc / lDcRate;
                                    }else{
                                        popItemData.invcAmt        = data[i].invcTotAmt;
                                        popItemData.taxAmt         = 0;
                                        popItemData.taxDdctPrc     = data[i].invcPrc;
                                    }

                                    popItemData.grStrgeCd          = data[i].grStrgeCd;
                                    //popItemData.grLocCd            = "";
                                    popItemData.claimQty           = 0;
                                    popItemData.claimTp            = "";
                                    popItemData.claimTargCd        = "";
                                    popItemData.dlBpCd             = "";
                                    popItemData.dlBpNm             = "";
                                    popItemData.reqCont            = "";
                                    popItemData.dcRate             = dcRate;
                                    popItemData.grLocCd            = '';

                                    /*
                                    if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                        if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].grStrgeCd])){
                                            popItemData.grLocCd = locationListObj[data[i].itemCd][data[i].grStrgeCd][0].cmmCd;
                                        }else{
                                            popItemData.grLocCd = '';
                                        }
                                    }else{
                                        popItemData.grLocCd = '';
                                    }
                                    */

                                    if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                        //이미 등록되어있는 부품입니다.
                                        var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                        dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                    }else{
                                        existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }

                                gridData.select(gridData.tbody.find(">tr"));
                                dms.loading.hide();
                                receiveEtcExcelUploadPopupWin.close();
                                calTotalAmt();
                            }
                        }
                    }
                });
            }
        });

     // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    lCrud         = '',
                    paramUrl      = '',
                    chkRow,
                    header;

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 거래처를 입력해주세요
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        bpCd            :$("#bpCd").val()
                       ,mobisInvcNo     :$("#mobisInvcNo").val()
                       ,invcDocNo       :$("#invcDocNo").val()
                       ,arrvDt          :$("#arrvDt").data("kendoExtMaskedDatePicker").value()
                       ,grDocNo         :$("#grDocNo").val()
                       ,remark          :$("#remark").val()
                       ,updtDtStr       :$("#updtDtStr").val()
                };

                if(gCrud === "C"){

                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    //송장입고인 경우
                    if(!dms.string.isEmpty($("#mobisInvcNo").val())){
                        rows.each(function(index, row) {
                            var gridData = grid.dataSource.at(index);
                            chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                            if(chkRow === true){
                                if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                                    // 수량을 입력하십시오
                                    dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                                    // 단가를 입력하십시오.
                                    dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                    saveList = [];
                                    return false;
                                }


                                if(dms.string.isEmpty(gridData.grStrgeCd)||dms.string.isEmpty(grStrgeTpObj[gridData.grStrgeCd])){
                                    // 입고창고를 선택하십시오
                                    dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(!dms.string.isEmpty(gridData.compareQty)){
                                    if(Number(gridData.compareQty) > Number(gridData.invcQty)){
                                        dms.notification.info("<spring:message code='par.lbl.gapQty' var='gapQty' /><spring:message code='par.lbl.invcQty' var='invcQty' /><spring:message code='sal.info.maxInfoChk' arguments='${gapQty},${invcQty}' />");
                                        saveList = [];
                                        return false;
                                    }
                                }


                                saveList.push(gridData);
                            }else{
                                saveList = [];
                                return false;
                            }
                        });

                        if(saveList.length > 0){
                            var data ={
                                   "invcVO":header
                                  ,"invcItemList":saveList
                                };

                            $.ajax({
                                url:"<c:url value='/par/pcm/invc/updateReceiveRgst.do' />"
                                ,data:kendo.stringify(data)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:true
                                ,success:function(result) {

                                    if (result.resultYn) {
                                        dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                                        existItemChkObj = {};
                                        $("#grDocNo").val(result.grDocNo);

                                        $("#grTp").data("kendoExtDropDownList").value('01');
                                        fnSetButton('00');

                                        $("#grid").data("kendoExtGrid").dataSource.data([]);
                                        selectReceiveCnfm();

                                    } else {
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                        }
                                    }
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.loading.hide($("#receiveCnfmSection"));
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,beforeSend:function(){
                                    dms.loading.show($("#receiveCnfmSection"));
                                }
                                ,complete:function(){
                                    dms.loading.hide($("#receiveCnfmSection"));
                                }

                            });
                        }else{
                            dms.notification.warning("<spring:message code='par.info.allCheckConfirm' />");
                        }
                    //기타입고인 경우
                    }else{
                        rows.each(function(index, row) {
                            var gridData = grid.dataSource.at(index);

                            if(!dms.string.isEmpty(gridData.itemCd)){

                                if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                                    // 단가를 입력하십시오.
                                    dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.itemCd)){
                                    // 부품을 선택하십시오
                                    dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                                    // 수량을 입력하십시오.
                                    dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.grStrgeCd)||dms.string.isEmpty(grStrgeTpObj[gridData.grStrgeCd])){
                                    // 입고창고를 선택하십시오
                                    dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                    saveList = [];
                                    return false;
                                }

                                saveList.push(gridData);
                            }
                        });

                        if(saveList.length > 0){
                            var data ={
                                    "invcVO":header
                                   ,"invcItemList":saveList
                                };

                            $.ajax({
                                 url:"<c:url value='/par/pcm/invc/createReceiveRgst.do' />"
                                ,data:kendo.stringify(data)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:true
                                ,success:function(result) {

                                    if (result.resultYn == true) {
                                        dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                                        existItemChkObj = {};

                                        $("#grDocNo").val(result.grDocNo);

                                        $("#grTp").data("kendoExtDropDownList").value('02');
                                        fnSetButton('00');

                                        $("#grid").data("kendoExtGrid").dataSource.data([]);
                                        selectReceiveCnfm();

                                    } else {
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                        }
                                    }
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.loading.hide($("#receiveCnfmSection"));
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,beforeSend:function(){
                                    dms.loading.show($("#receiveCnfmSection"));
                                }
                                ,complete:function(){
                                    dms.loading.hide($("#receiveCnfmSection"));
                                }

                            });
                        }
                    }


                }else if(gCrud === "U"){
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
                        insertListLeng = saveData.insertList.length;


                    for(var i = insertListLeng-1; i >= 0; i = i - 1){
                        if(dms.string.isEmpty(saveData.insertList[i].itemCd)){
                            saveData.insertList.splice(i,1);
                        }
                    }

                  //송장입고인 경우
                    if(!dms.string.isEmpty($("#mobisInvcNo").val())){
                        saveData.invcVO = header;
                        if (grid.gridValidation()) {

                            $.ajax({
                                url:"<c:url value='/par/pcm/invc/multiReceiveRgst.do' />"
                               ,data:kendo.stringify(saveData)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:true
                               ,success:function(result) {

                                   if (result === true) {
                                       dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");

                                       existItemChkObj = {};

                                       $("#grTp").data("kendoExtDropDownList").value('01');
                                       fnSetButton('00');

                                       $("#grid").data("kendoExtGrid").dataSource.data([]);
                                       selectReceiveCnfm();

                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                       }
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.loading.hide($("#receiveCnfmSection"));
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }
                               ,beforeSend:function(){
                                   dms.loading.show($("#receiveCnfmSection"));
                               }
                               ,complete:function(){
                                   dms.loading.hide($("#receiveCnfmSection"));
                               }

                           });
                        }
                    }else{

                        saveData.invcVO = header;

                        rows.each(function(index, row) {
                            var gridData = grid.dataSource.at(index);
                            if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.grStrgeCd)||dms.string.isEmpty(grStrgeTpObj[gridData.grStrgeCd])){
                                // 입고창고를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        });

                        if (grid.gridValidation() &&  saveList.length > 0) {

                            $.ajax({
                                url:"<c:url value='/par/pcm/invc/multiReceiveEtcRgst.do' />"
                               ,data:kendo.stringify(saveData)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:true
                               ,success:function(result) {

                                   if (result === true) {
                                       dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");

                                       existItemChkObj = {};

                                       $("#grTp").data("kendoExtDropDownList").value('02');
                                       fnSetButton('00');

                                       $("#grid").data("kendoExtGrid").dataSource.data([]);
                                       $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                                       selectReceiveCnfm();

                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                       }
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.loading.hide($("#receiveCnfmSection"));
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }
                               ,beforeSend:function(){
                                   dms.loading.show($("#receiveCnfmSection"));
                               }
                               ,complete:function(){
                                   dms.loading.hide($("#receiveCnfmSection"));
                               }

                           });
                        }
                    }

                }else{
                    alert('CRUD정보가 없습니다.');
                }
             }
        });

     // 일괄 저장 버튼
        $("#btnSaveAll").kendoButton({
            click:function(e){

                setStrgeCdPopupWindow = dms.window.popup({
                    windowId:"setStrgeCdPopupWindow"
                    , title:"<spring:message code = 'par.lbl.grStrgeCd'/>"   // 입고창고 선택
                    , width:330
                    , height:300
                    , content:{
                        url:"<c:url value='/par/cmm/setStrgeCdPopup.do'/>"
                        ,data:{
                              "grReasonYn": 'N'
                             ,"callbackFunc":function(data){

                                    //data.strgeCd
                                setStrgeCdPopupWindow.close();

                                $.ajax({
                                    url:"<c:url value='/par/pcm/invc/updateAllReceiveRgst.do' />?pInvcNo="+$("#invcDocNo").val()+"&pStrgeCd="+data.strgeCd+"&pInvcStatCd="+$("#invcStatCd").val()+"&pUpdtDtStr="+$("#updtDtStr").val()
                                    ,data:kendo.stringify(data)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,async:true
                                    ,success:function(result) {

                                        if (result.resultYn) {
                                            dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                                            existItemChkObj = {};
                                            $("#grDocNo").val(result.grDocNo);

                                            $("#grTp").data("kendoExtDropDownList").value('01');
                                            fnSetButton('00');

                                            $("#grid").data("kendoExtGrid").dataSource.data([]);
                                            selectReceiveCnfm();

                                        } else {
                                            if(result === 0){
                                                dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                            }
                                        }
                                    }
                                    ,error:function(jqXHR,status,error) {
                                        dms.loading.hide($("#receiveCnfmSection"));
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,beforeSend:function(){
                                        dms.loading.show($("#receiveCnfmSection"));
                                    }
                                    ,complete:function(){
                                        dms.loading.hide($("#receiveCnfmSection"));
                                    }

                                });

                            }
                        }
                    }
                });
            }
        });

     // 확정 버튼
     /*
        $("#btnCnfm").kendoButton({
            click:function(e){

                var grid           = $("#grid").data("kendoExtGrid"),
                    rows           = grid.tbody.find("tr"),
                    mvtType        = $("#mvtTp").data("kendoExtDropDownList").value(),
                    saveList       = [],
                    saveData       = grid.getCUDData("insertList", "updateList", "deleteList"),
                    insertListLeng = saveData.insertList.length,
                    updateListLeng = saveData.updateList.length,
                    deleteListLeng = saveData.deleteList.length,
                    modifyLeng     = insertListLeng + updateListLeng + deleteListLeng,
                    header;


                if(modifyLeng > 0){
                    dms.notification.warning("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                    saveList = [];
                    return false;
                }


                if(dms.string.isEmpty($("#bpCd").val())){
                    // 딜러를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        mvtTp           :mvtType
                      , etcGrDocNo       :$('#etcGrDocNo').val()
                      , bpCd            :$("#bpCd").val()
                      , remark          :$("#remark").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(!dms.string.isEmpty(gridData.itemCd)){
                        if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.itemCd)){
                            // 부품을 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "receiveEtcVO":header
                          ,"receiveEtcItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/pcm/receive/createReceiveEtcCnfm.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result.resultYn == true) {
                               dms.notification.success("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${receiveEtcBorrowNo}'/>");

                               pEtcGrDocNo = $('#etcGrDocNo').val();


                               fnSetButton('02');

                               // 부품기타입고 조회.
                               selectEtcReceive(pEtcGrDocNo);

                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${receiveEtcBorrowNo}'/>");
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
     */

        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    header;


                header = {
                        invcDocNo       :$("#grDocNo").val()
                       ,bpCd            :$('#bpCd').val()
                       ,grDocNo         :$("#grDocNo").val()
                       ,updtDtStr       :$("#updtDtStr").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                        saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data ={
                             "invcVO"  :header
                            ,"invcItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/pcm/invc/cancelReceiveEtcs.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result === true) {
                               dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.delSuccessParam' arguments='${receive}'/>");

                               fnSetButton('03');

                               $("#grid").data("kendoExtGrid").dataSource.data([]);
                               selectReceiveCnfm();

                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.delFailedParam' arguments='${receive}'/>");
                               }
                           }
                       }
                       ,error:function(jqXHR,status,error) {
                           dms.loading.hide($("#receiveCnfmSection"));
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,beforeSend:function(){
                           dms.loading.show($("#receiveCnfmSection"));
                       }
                       ,complete:function(){
                           dms.loading.hide($("#receiveCnfmSection"));
                       }
                   });
                }
            }
        });

        // 기존저장 버튼
        $("#btnCnfm").kendoButton({
           click:function(e){

                var saveList       = [],
                    grid           = $("#grid").data("kendoExtGrid"),
                    rows           = grid.tbody.find("tr"),
                    saveData       = grid.getCUDData("insertList", "updateList", "deleteList"),
                    insertListLeng = saveData.insertList.length,
                    updateListLeng = saveData.updateList.length,
                    deleteListLeng = saveData.deleteList.length,
                    modifyLeng     = insertListLeng + deleteListLeng,
                    lCrud          = '',
                    paramUrl       = '',
                    chkRow,
                    header,
                    chkCalcAmt;

                header = {
                      bpCd            :$("#bpCd").val()
                     ,mobisInvcNo     :$("#mobisInvcNo").val()
                     ,invcDocNo       :$("#invcDocNo").val()
                     ,grDocNo         :$("#grDocNo").val()
                     ,arrvDt          :$("#arrvDt").data("kendoExtMaskedDatePicker").value()
                     ,remark          :$("#remark").val()
                     ,updtDtStr       :$("#updtDtStr").val()
                };

                if(modifyLeng > 0){

                    dms.notification.warning("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                    saveList = [];
                    return false;
                }

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){

                        if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.grStrgeCd)||dms.string.isEmpty(grStrgeTpObj[gridData.grStrgeCd])){
                            // 입고창고를 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty($("#mobisInvcNo").val())){
                            chkCalcAmt = Math.round(Number(gridData.invcPrc) * Number(gridData.invcQty) * 100)/100;

                            if(Math.abs(Number(chkCalcAmt) - Number(gridData.invcTotAmt)) > 0.1 ){
                                // 금액을 확인해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                                saveList = [];
                                return false;
                            }
                        }

                        saveList.push(gridData);
                    }else{
                        //기타입고인 경우 전체 선택 필
                        if(dms.string.isEmpty($("#mobisInvcNo").val())){
                            saveList = [];
                            return false;
                        }
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "invcVO"  :header
                          ,"invcItemList":saveList
                        };

                    $.ajax({
                         url:"<c:url value='/par/pcm/invc/insertReceiveCnfm.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result.resultYn) {
                                dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                                existItemChkObj = {};

                                //$("#grDocNo").val(result.grDocNo);

                                if(!dms.string.isEmpty($("#mobisInvcNo").val())){
                                    $("#grTp").data("kendoExtDropDownList").value('01');
                                    //$("#grid").data("kendoExtGrid").dataSource.read();
                                }else{
                                    $("#grTp").data("kendoExtDropDownList").value('02');
                                }
                                $("#grid").data("kendoExtGrid").dataSource.data([]);
                                selectReceiveCnfm();

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                }
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.loading.hide($("#receiveCnfmSection"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#receiveCnfmSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#receiveCnfmSection"));
                        }

                    });
                }else{
                    if(dms.string.isEmpty($("#mobisInvcNo").val())){
                        dms.notification.warning("<spring:message code='par.info.allCheckConfirm' />");
                        return false;
                    }
                }

              }
        });

        // 기존저장 버튼
        $("#btnCnfmAll").kendoButton({
           click:function(e){
               alert('Function is not yet ready!');
           }
        });

        /**
         * grid 입고창고 DropDownList
         */
         grStrgeCdDropDownEditor = function(container, options) {
             var mobisInvcNo  = options.model.mobisInvcNo,
                 invcStatCd   = options.model.invcStatCd,
                 lineDisabled;


             if(invcStatCd != '03'){
                 $('<input data-bind="value:' + options.field + '"  />')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     dataTextField: "cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:  grStrgeTpList
                    ,change:function(e){
                        options.model.set('grLocCd','');
                        lineDisabled = options.model.invcStatCd;
                        if(lineDisabled !== '03'){

                            if(!dms.string.isEmpty(locationListObj[options.model.itemCd])){
                                if(!dms.string.isEmpty(locationListObj[options.model.itemCd][options.model.grStrgeCd])){
                                    options.model.set('grLocCd',locationListObj[options.model.itemCd][options.model.grStrgeCd][0].cmmCd);
                                }else{
                                    options.model.set('grLocCd','');
                                }
                            }else{
                                options.model.set('grLocCd','');
                            }

                            $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                        }
                     }
                 });
             }
         };

        /**
         * grid 입고Location DropDownList
         */
         grLocCdDropDownEditor = function(container, options) {

            var itemCd = options.model.itemCd,
                strgeCd = options.model.grStrgeCd,
                invcStatCd   = options.model.invcStatCd,
                lineDisabled;

            if(invcStatCd != '03'){
                if(!dms.string.isEmpty(locationListObj[itemCd])){
                     $('<input data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         dataTextField: "cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:  locationListObj[itemCd][strgeCd]
                        ,change:function(e){
                            $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                         }
                     });
                }
            }
         };

         /**
          * grid 구매단가&구매수량
          */
          changeInvcNumEditor = function(container, options) {
              var input   = $("<input/>"),
                  dcRate  = $("#dcRate").data("kendoExtNumericTextBox").value(),
                  lDcRate = Number(dcRate/100) + 1,
                  lInvcPrc,
                  pValue;

              input.attr("name", options.field);

              input.keyup(function(){

                  pValue = Number($(this).val());

                  if(options.field === 'invcQty'){
                      if(!dms.string.isEmpty(options.model.invcDocNo)){
                          options.model.set("compareQty", options.model.invcTargetQty -  pValue);
                      }

                      if(dcRate > 0){
                          options.model.set("invcTotAmt", Math.round(Number(pValue) * Number(options.model.invcPrc) * 100)/100);
                          options.model.set("invcAmt",    Math.round((Math.round(Number(pValue) * Number(options.model.invcPrc) * 100)/100) / Number(lDcRate) * 100)/100);
                          options.model.set("taxAmt",     (Math.round(Number(pValue) * Number(options.model.invcPrc) * 100)/100) - (Math.round((Math.round(Number(pValue) * Number(options.model.invcPrc) * 100)/100) / Number(lDcRate) * 100)/100));
                          options.model.set("taxDdctPrc", Math.round(Number(options.model.invcPrc) / Number(lDcRate) * 100)/100);
                      }else{
                          options.model.set("invcTotAmt", Math.round(Number(pValue) * Number(options.model.invcPrc) * 100)/100);
                          options.model.set("invcAmt",    Math.round(Number(pValue) * Number(options.model.invcPrc) * 100)/100);
                          options.model.set("taxAmt",     0);
                          options.model.set("taxDdctPrc", options.model.invcPrc);
                      }
                  }else if(options.field === 'invcPrc'){
                      if(dcRate > 0){
                          options.model.set("invcTotAmt", Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("invcAmt",    Math.round((Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100) / Number(lDcRate) * 100)/100);
                          options.model.set("taxAmt",     (Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100) - (Math.round((Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100) / Number(lDcRate) * 100)/100));
                          options.model.set("taxDdctPrc", Math.round(Number(pValue) / Number(lDcRate) * 100)/100);
                      }else{
                          options.model.set("invcTotAmt", Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("invcAmt",    Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("taxAmt",     0);
                          options.model.set("taxDdctPrc", pValue);
                      }
                  }else if(options.field === 'taxDdctPrc'){
                      if(dcRate > 0){
                          lInvcPrc = Math.round(Number(pValue) * Number(lDcRate) * 100)/100;
                          options.model.set("invcPrc",    lInvcPrc);
                          options.model.set("invcTotAmt", Math.round(Number(lInvcPrc) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("invcAmt",    Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("taxAmt",     (Math.round(Number(lInvcPrc) * Number(options.model.invcQty) * 100)/100) - (Math.round(Number(pValue) * Number(options.model.invcQty) * 100)/100));
                      }else{
                          lInvcPrc = pValue;
                          options.model.set("invcTotAmt", Math.round(Number(lInvcPrc) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("invcAmt",    Math.round(Number(lInvcPrc) * Number(options.model.invcQty) * 100)/100);
                          options.model.set("taxAmt",     0);
                          options.model.set("invcPrc",    pValue);
                      }
                  }
              });

              input.blur(function(){

                 var resultGrid = $("#grid").data("kendoExtGrid"),
                     rows       = resultGrid.tbody.find("tr"),
                     totalAmt   = 0,
                     gridData;

                  pValue = Number($(this).val());

                 if(!dms.string.isEmpty(pValue)){

                     if(options.field === 'invcQty'){
                         options.model.set("invcQty", pValue);
                     }else if(options.field === 'invcPrc'){
                         options.model.set("invcPrc", pValue);
                     }else if(options.field === 'compareQty'){
                         if(pValue > Number(options.model.invcQty) ){
                             dms.notification.info("<spring:message code='par.lbl.gapQty' var='gapQty' /><spring:message code='par.lbl.invcQty' var='invcQty' /><spring:message code='sal.info.maxInfoChk' arguments='${gapQty},${invcQty}' />");
                         }
                     }
                 }

                 changeAggregates();
                 calTotalAmt();

              });

              input.appendTo(container);
              if(options.field === 'invcQty'||options.field === 'compareQty'){
                  input.kendoExtNumericTextBox({
                      format: "n2"
                      ,decimals:2
                      ,restrictDecimals: true
                      ,min:0
                      ,spinners:false
                  });
              }else{
                  input.kendoExtNumericTextBox({
                      format: "n2"
                      ,decimals:2
                      ,restrictDecimals: true
                      ,min:0
                      ,spinners:false
                  });
              }

          };

        /**1
         * grid 클레임사유 DropDownList
         */
         grClaimTpDropDownEditor = function(container, options) {
             var lineDisabled;

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTpList
                ,change:function(e){
                    lineDisabled = options.model.invcStatCd;
                    if(lineDisabled !== '03'){
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                    }
                 }
             });
         };

        /**
         * grid 클레임대상 DropDownList
         */
         claimTargCdDropDownEditor = function(container, options) {
             var lineDisabled;
             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTargetTpList
                ,change:function(e){
                    lineDisabled = options.model.invcStatCd;
                    if(lineDisabled !== '03'){
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                    }
                 }
             });


         };
         // 입고확정 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-0805-153797"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/invc/selectReceiveItemByCondition.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"] = options.sort;

                             // 입고확정대상 검색조건 코드.
                             params["sBpCd"] = $("#bpCd").val();
                             params["sMobisInvcNo"] = $("#mobisInvcNo").val();

                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){
                          var itemList = [];

                          if(result.total === 0){
                              //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }

                          //for(var i = 0, dataLen = result.total; i < dataLen; i = i + 1 ){
                          //    itemList.push(result.data[i].itemCd);
                          //}

                          locationListObj = {};

                          //if(dataLen > 0){
                              //fnSetLocCdObj(itemList);
                          //}

                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"invcDocNo"
                       ,fields:{
                               dlrCd               :{ type:"string" , validation:{required:true} }
                             , boxNo               :{ type:"string", editable:false }
                             , invcDocNo           :{ type:"string", editable:false }
                             , invcDocLineNo       :{ type:"number", editable:false }
                             , invcDt              :{ type:"date"  , editable:false }
                             , purcOrdTp           :{ type:"string", editable:false }
                             , purcOrdNo           :{ type:"string", editable:false }
                             , purcOrdLineNo       :{ type:"string", editable:false }
                             , bmpOrdNo            :{ type:"string", editable:false }
                             , bmpOrdLineNo        :{ type:"string", editable:false }
                             , purcOrdLineDetlNo   :{ type:"string", editable:false }
                             , mobisInvcNo         :{ type:"string", editable:false }
                             , mobisInvcLineNo     :{ type:"number", editable:false }
                             , ordRegUsrId         :{ type:"string", editable:false }
                             , ordRegUsrNm         :{ type:"string", editable:false }
                             , reqUsrId            :{ type:"string", editable:false }
                             , reqUsrNm            :{ type:"string", editable:false }
                             , itemCd              :{ type:"string", editable:false }
                             , itemNm              :{ type:"string", editable:false }
                             , invcTargetQty       :{ type:"number", editable:false }
                             , invcQty             :{ type:"number" }
                             , purcQty             :{ type:"number", editable:false}
                             , compareQty          :{ type:"number" }
                             , invcUnitCd          :{ type:"string" }
                             , invcTp              :{ type:"string", editable:false }
                             , invcStatCd          :{ type:"string", editable:false }
                             , prcTp               :{ type:"string", editable:false }
                             , invcPrc             :{ type:"number" }
                             , taxDdctPrc          :{ type:"number" }
                             //, invcIncTaxPrc       :{ type:"number" }
                             , invcAmt             :{ type:"number" }
                             , invcTotAmt          :{ type:"number" }
                             , taxAmt              :{ type:"number" }
                             , grStrgeCd           :{ type:"string" }
                             , grLocCd             :{ type:"string" }
                             //, claimUnitCd         :{ type:"string", editable:false}
                             , claimQty            :{ type:"number" }
                             , claimTp             :{ type:"string" }
                             , claimTargCd         :{ type:"string" }
                             , dlBpCd              :{ type:"string" }
                             , dlBpNm              :{ type:"string" }
                             , reqCont             :{ type:"string" }
                             , dcRate              :{ type:"number" }
                             , purcRegDt           :{ type:"date",   editable:false }
                             , arrvDt              :{ type:"date",   editable:false }
                             , dlPdcCd             :{ type:"string", editable:false }
                             , mvtDocYyMm          :{ type:"string", editable:false }
                             , mvtDocNo            :{ type:"string", editable:false }
                             , mvtDocLineNo        :{ type:"number", editable:false }
                         }
                     }
                 }
                 ,serverSorting:false
                 ,serverPaging:false
                 ,pageSize: 2000
                 ,aggregate:[
                      { field:"invcPrc", aggregate:"sum" }
                     ,{ field:"taxDdctPrc", aggregate:"sum" }
                     ,{ field:"invcTotAmt", aggregate:"sum" }
                     ,{ field:"invcAmt", aggregate:"sum" }
                 ]
             }
             , selectable :"multiple"
             , scrollable :true
             , sortable   :true
             , autoBind   :true
             , filterable:false
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,pageable:{
                 refresh:false
                ,pageSizes:[2000,2500,3000]
                ,buttonCount:1
                ,input:false
                ,numeric:false
                ,info:true
              }
            // , multiSelectWithCheckbox:true
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length,
                     lineDisabled;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                         if(!lineDisabled){
                             $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                         }
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                         lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                         if(!lineDisabled){
                              if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                                  $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                              }else {
                                  $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                              }
                         }
                      });
                 }
             }
             , edit:function(e){
                 var eles = e.container.find("input"),
                     rows = e.sender.select(),
                     selectedItem = e.sender.dataItem(rows[0]),
                     grid = this,
                     input = e.container.find(".k-input"),
                     pVal,
                     orgVal,
                     lineDisabled,
                     fieldName = grid.columns[e.container.index()].field;

                 if(fieldName === "dlBpNm"||fieldName === "taxAmt" || fieldName === "invcTargetQty"|| fieldName === "invcUnitCd"|| fieldName === "invcAmt"|| fieldName === "invcTotAmt"|| fieldName === "grLocCd"){
                      this.closeCell();
                 }else if(fieldName === "claimQty" || fieldName === "claimTp" || fieldName === "claimTargCd" || fieldName === "grStrgeCd" || fieldName === "reqCont"){
                     lineDisabled = selectedItem.invcStatCd;
                     if(lineDisabled === '03' || lineDisabled === '04'){
                         this.closeCell();
                     }else {
                         $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                     }
                 }else if(fieldName === "chk"){
                     this.closeCell();
                 }else if(fieldName === "compareQty"){
                     lineDisabled = selectedItem.invcStatCd;
                     if(dms.string.isEmpty($("#mobisInvcNo").val())){
                         this.closeCell();
                     }else{
                         if(lineDisabled != '03'){
                             $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                         }else{
                             this.closeCell();
                         }
                     }
                 }else if(fieldName === "invcQty"){
                     lineDisabled = selectedItem.invcStatCd;
                     if(!dms.string.isEmpty($("#mobisInvcNo").val())){
                         this.closeCell();
                     }else{
                         if(lineDisabled != '03'){
                             $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                         }else{
                             this.closeCell();
                         }
                     }
                 }else if(fieldName === "invcPrc"||fieldName === "dcRate"|| fieldName === "taxDdctPrc"  ){
                     if(!dms.string.isEmpty(selectedItem.mobisInvcNo)){
                         this.closeCell();
                     }else{

                         lineDisabled = selectedItem.invcStatCd;
                         if(lineDisabled === '03' || lineDisabled === '04'){
                             this.closeCell();
                         }else{
                             $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                         }
                     }
                 }else if(fieldName === "itemCd"){
                     if(!dms.string.isEmpty(selectedItem.invcDocNo)){
                         this.closeCell();
                     }else{
                         pVal = input.val();
                         orgVal = input.val();

                         input.keyup(function(){
                             pVal = input.val();
                         });

                         input.blur(function(){

                             try{
                                 var lDcRate = 0,//(Number($("#dcRate").data("kendoExtNumericTextBox").value())/100) + 1;
                                     pDcRate = Number($("#dcRate").data("kendoExtNumericTextBox").value());

                                     lDcRate = (pDcRate/100) + 1;

                                 if(orgVal !== pVal){

                                     if(existItemChkObj.hasOwnProperty(pVal)){
                                         //이미 등록되어있는 부품입니다.
                                         var itemInfo = pVal;
                                         dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                         e.model.set('itemCd', orgVal);

                                         return false;
                                     }

                                     $.ajax({
                                         url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemByKey.do' />"
                                        ,data:kendo.stringify({sItemCd:pVal, sBpCd:$("#bpCd").val()})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,async:false
                                        ,success:function(result) {

                                            if (result.total === 1) {
                                                e.model.set('dlrCd', result.data[0].dlrCd);
                                                e.model.set('boxNo', '');
                                                e.model.set('dlPdcCd', '');
                                                e.model.set('purcOrdTp', '01');
                                                e.model.set('invcDocNo', '');
                                                e.model.set('invcDt', toDate);
                                                e.model.set('bmpOrdNo', "");
                                                e.model.set('bmpOrdLineNo', null);
                                                e.model.set('purcOrdNo', "");
                                                e.model.set('purcOrdLineNo', null);
                                                e.model.set('purcOrdLineDetlNo', "");
                                                e.model.set('mobisInvcNo', "");
                                                e.model.set('mobisInvcLineNo', null);
                                                e.model.set('itemCd', result.data[0].itemCd);
                                                e.model.set('itemNm', result.data[0].itemNm);
                                                e.model.set('invcUnitCd', result.data[0].stockUnitCd);
                                                e.model.set('invcQty', 0);
                                                e.model.set('invcTargetQty', 0);
                                                e.model.set('compareQty', 0);
                                                e.model.set('invcPrc', result.data[0].purcPrc);
                                                if(pDcRate > 0){
                                                    e.model.set('invcTotAmt',  result.data[0].purcPrc);
                                                    e.model.set('invcAmt',     result.data[0].purcPrc / lDcRate);
                                                    e.model.set('taxAmt',      result.data[0].purcPrc - (result.data[0].purcPrc / lDcRate));
                                                    e.model.set('taxDdctPrc',  result.data[0].purcPrc / lDcRate);
                                                }else{
                                                    e.model.set('invcTotAmt',  result.data[0].purcPrc);
                                                    e.model.set('invcAmt',     result.data[0].purcPrc);
                                                    e.model.set('taxAmt',      0);
                                                    e.model.set('taxDdctPrc',  result.data[0].purcPrc);
                                                }
                                                //e.model.set('invcIncTaxPrc', result.data[0].purcPrc * $("#dcRate").data("kendoExtNumericTextBox").value());
                                                e.model.set('prcTp', result.data[0].prcTp);
                                                e.model.set('grStrgeCd', result.data[0].grStrgeCd);
                                                e.model.set('grLocCd', "");
                                                e.model.set('claimQty', 0);
                                                e.model.set('dcRate', $("#dcRate").data("kendoExtNumericTextBox").value());

                                                //fnSetLocCdObj([result.data[0].itemCd]);

                                                delete existItemChkObj[orgVal];

                                                existItemChkObj[pVal] = pVal;

                                            } else {
                                                dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                                e.model.set('itemCd', orgVal);
                                            }
                                        }
                                        ,error:function(jqXHR,status,error) {
                                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                            e.model.set('itemCd', orgVal);
                                        }

                                    });
                                 }
                             }catch(e){
                                 console.log('blur:',e);
                             }

                         });
                         lineDisabled = selectedItem.invcStatCd;
                         if(lineDisabled != '03'){
                             $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                         }
                     }
                 }
             }
             ,dataBound:function(e) {

                 var invcTotAmt = 0;
                 var dcRate = (gVatCd * 100);

                 var rows = e.sender.tbody.children();

                 $.each(rows, function(idx, row){
                     var row = $(rows[idx]);
                     var dataItem = e.sender.dataItem(row);

                     if( dataItem != null && dataItem != 'undefined'){
                         dcRate = dataItem.dcRate;
                         invcTotAmt += dataItem.invcTotAmt;
                     }
                 });

                 //$("#dcRate").data("kendoExtNumericTextBox").value(dcRate);
                 $("#grTotAmt").data("kendoExtNumericTextBox").value(invcTotAmt);

             }
             ,columns:[
                 {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                     ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                     ,sortable:false
                     ,template:"<input type='checkbox' data-uid='#= uid #' #= changeStatCd(invcStatCd)# class='grid-checkbox-item' data-chk=false/>"
                 }
                 ,{field:"invcDocNo", title:"" ,width:100 ,hidden:true,sortable:false}
                 ,{field:"invcDocLineNo", title:"" ,width:100 ,hidden:true,sortable:false}//BMP구매오더번호
                 ,{field:"boxNo" ,title:"<spring:message code='par.lbl.boxNo' />" ,width:80,sortable:false}//BOX NO
                 ,{field:"bmpOrdNo", title:"BMP <spring:message code='par.lbl.purcOrdNo' />" ,width:100,sortable:false}//BMP구매오더번호
                 ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:90,sortable:false}//구매신청일
                 ,{field:"ordRegUsrId", title:"<spring:message code='par.lbl.ordRegId' />" ,width:120,hidden:true,sortable:false}//오더신청자
                 ,{field:"ordRegUsrNm", title:"<spring:message code='par.lbl.ordRegId' />" ,width:120 ,sortable:false}//오더신청자
                 ,{field:"reqUsrId", title:"<spring:message code='par.lbl.ordRegId' />" ,width:120,hidden:true,sortable:false}//결품신청자
                 ,{field:"reqUsrNm", title:"<spring:message code='par.lbl.ordRegId' />" ,width:120,hidden:true,sortable:false}//결품신청자
                 ,{field:"purcOrdLineDetlNo" ,title:"<spring:message code='par.lbl.mvtLineNo' />" ,attributes:{ "class":"ar"} ,width:50 ,sortable:false}//라인구분자
                 ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                 ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                 ,{field:"invcUnitCd", title:"<spring:message code='par.lbl.stockUnitCd' />" ,width:80,sortable:false}//단위
                 ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:140,sortable:false}//모비스송장번호
                 ,{field:"invcTp" ,title:"<spring:message code='par.lbl.invcTp' />" ,attributes:{ "class":"ac"} ,width:120
                     ,template:'#= changeInvcTp(invcTp)#'
                     ,sortable:false
                 }//송장유형
                 ,{field:"invcDt" ,title:"<spring:message code='par.lbl.invcDt' />" ,width:100 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"},sortable:false}//INVOICE일자
                 ,{field:"invcStatCd", title:"<spring:message code='par.lbl.invcStatCd' />" ,width:80 ,attributes:{ "class":"ac"}
                      ,template:'#= changeInvcStat(invcStatCd)#',sortable:false
                 }//송장상태
                 ,{field:"invcTargetQty" ,title:"<spring:message code='par.lbl.invcQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0}//송장수량
                 ,{field:"purcQty" ,title:"<spring:message code='par.lbl.purcQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0}//오더수량
                 ,{field:"invcQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2
                      ,editor:changeInvcNumEditor
                 }//입고수량
                 ,{field:"compareQty" ,title:"<spring:message code='par.lbl.gapQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2 ,sortable:false
                     ,template:'#= changeCompareQty(compareQty)#'
                     ,editor:changeInvcNumEditor
                 }//차이수량
                 ,{field:"reqCont" ,title:"<spring:message code='par.lbl.reasonCont' />" ,width:140 ,sortable:false}//차이사유
                 ,{field:"grStrgeCd" ,title:"<spring:message code='par.lbl.grStrgeCd' />" ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     ,template:'#= changeGrStrgeCd(grStrgeCd)#'
                 }//입고창고
                 ,{field:"grLocCd" ,title:"<spring:message code='par.lbl.locationCd' />" ,width:140 ,sortable:false
                     ,editor:grLocCdDropDownEditor
                     ,template:'#= changeGrLocCd(grStrgeCd, grLocCd)#'
                     ,hidden:true
                 }//로케이션
                 ,{field:"invcPrc" ,title:"<spring:message code='par.lbl.grItemPrice' />" ,width:120
                     ,editor:changeInvcNumEditor
                     ,attributes:{"class":"ar"}
                     ,format:"{0:n2}"
                 }//입고단가(포함)
                 ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.grItemPriceTax' />" ,width:80
                     ,editor:changeInvcNumEditor
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                 }//입고단가(세금미포함)
                 ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//입고금액
                 ,{field:"invcAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//입고금액(세금제외)
                 ,{field:"dcRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}",hidden:true,sortable:false}//할인율
                 ,{field:"mvtDocYyMm" ,title:"" ,width:120 ,attributes:{ "class":"ar"} ,hidden:true,sortable:false}//수불년월
                 ,{field:"mvtDocNo" ,title:"" ,width:120 ,attributes:{ "class":"ar"} ,hidden:true,sortable:false}//수불번호
                 ,{field:"mvtDocLineNo" ,title:"" ,width:120 ,attributes:{ "class":"ar"} ,hidden:true,sortable:false}//수불라인번호
             ]
         });
         //grid height reset.
         gridHeight();

         //  송장유형
         changeInvcTp = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(invcTpObj[val])){
                     returnVal = invcTpObj[val];
                 }
             }
             return returnVal;
         };

         // 송장상태
         changeInvcStat = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(invcStatObj[val])){
                     returnVal = invcStatObj[val];
                 }
             }
             return returnVal;
         };

         // 송장상태에 따른 체크
         changeStatCd = function(val){
             var returnVal = "";
             if(val === '03'){
                 returnVal = 'disabled';
             }
             return returnVal;
         };


         // 입고 창고
         changeGrStrgeCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(grStrgeTpObj[val])){
                     returnVal = grStrgeTpObj[val];
                 }else{
                     returnVal = "";
                 }
             }
             return returnVal;
         };

         // 로케이션
         changeGrLocCd = function(strgeCd, locCd){
             var returnVal = "";
             if(!dms.string.isEmpty(locCd)){
                 if(dms.string.isEmpty(locationObj[strgeCd])){
                     returnVal = '';
                 }else{
                     if(dms.string.isEmpty(locationObj[strgeCd][locCd])){
                         returnVal = '';
                     }else{
                         returnVal = locationObj[strgeCd][locCd];
                     }
                 }
             }else{
                 returnVal = '';
             }
             return returnVal;
         };


         // 클레임사유
         changeClaimTp = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(claimTpObj[val])){
                     returnVal = claimTpObj[val];
                 }
             }
             return returnVal;
         };



         // 가격유형
         changePrcTp = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(prcTpObj[val])){
                     returnVal = prcTpObj[val];
                 }
             }
             return returnVal;
         };

         //단위
         changeInvcUnit = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(invcUnitObj[val])){
                     //returnVal = invcUnitObj[val];
                 }
             }
             return returnVal;
         };

         //  오더유형
         changePurcOrdTp = function(val){
             var returnVal = "";

             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(purcOrdTpObj[val])){
                     returnVal = purcOrdTpObj[val];
                 }
             }
             return returnVal;
         };

         //  차이수량
         changeCompareQty = function(val){
             var returnVal = "";
             if(val < 0){
                 returnVal = val * -1;
             }else{
                 returnVal = val;
             }
             return returnVal;
         };

         // 클레임대상
         changeClaimTargCd = function(val){
             var returnVal = "",
                 grid     = $("#grid").data("kendoExtGrid"),
                 rowIndex = grid.items().index(grid.select()),
                 dataItem = grid.dataSource.at(rowIndex);


             if(val != null && val != ""){
                 returnVal = claimTargetTpObj[val];

                 if(!dms.string.isEmpty(dataItem)){
                     if(dataItem.claimTargCd !== '02'){
                        dataItem.set("dlBpCd", '');
                        dataItem.set("dlBpNm", '');
                     }
                 }
             }
             return returnVal;
         };

         changeAggregates = function(){
             var totalInvcTotAmt  = 0,
                 totalInvcAmt     = 0,
                 grid             = $("#grid").data("kendoExtGrid"),
                 data             = grid.dataSource.data(),
                 dLen             = data.length;
             if(dLen === 0){
                 $('#sumInvcTotAmt').html(0);
                 $('#sumInvcAmt').html(0);
             }else{
                 for(var i = 0; i < dLen; i = i + 1){
                     totalInvcTotAmt = totalInvcTotAmt + data[i].invcTotAmt;
                     totalInvcAmt =  totalInvcAmt + data[i].invcAmt;
                 }
                 $('#sumInvcTotAmt').html(Number(totalInvcTotAmt).toFixed(2));
                 $('#sumInvcAmt').html(Number(totalInvcAmt).toFixed(2));
             }

             //return total;
         };

        initPage();
    });

    //부품 팝업 열기 함수.
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
                    ,"itemDstinCd":pItemDistinCd
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
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        existItemChkObj = {};

        //송장관리에서 넘어온 경우
        if(!dms.string.isEmpty(pMobisInvcNo)){
            $("#mobisInvcNo").val(pMobisInvcNo);
            $("#invcDocNo").val(pInvcDocNo);
            $("#bpCd").val(pBpCd);
            $("#bpNm").val(pBpNm);
            $("#bpTp").data("kendoExtDropDownList").value('01');
            $("#arrvDt").data("kendoExtMaskedDatePicker").value(new Date(pArrvYy, pArrvMm, pArrvDd));
            $("#mobisInvcNo").attr("disabled", true);
            $("#grid").data("kendoExtGrid").dataSource.read();
            $("#grTp").data("kendoExtDropDownList").value('01');

            $.ajax({
                url:"<c:url value='/par/pcm/receive/selectInvcByKey.do' />"
               ,data:kendo.stringify({mobisInvcNo: pMobisInvcNo})
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,async:false
               ,success:function(result) {
                   $("#updtDtStr").val(result.updtDtStr);
                   $("#grDocNo").val(result.invcDocNo);
                   $("#dcRate").data("kendoExtNumericTextBox").value((gVatCd * 100));

               }
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }

           });

        }else{
            $("#mobisInvcNo").attr("disabled", false);
            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#dcRate").data("kendoExtNumericTextBox").value(null);
        }

        gCrud = "C";
        if(!dms.string.isEmpty($("#bpCd").val())){
            fnSetButton('02');
        }else{
            fnSetButton('');
        }


        $("#grTotAmt").data("kendoExtNumericTextBox").value(null);
        $("#dcRateArea").addClass("readonly_area");
        $("#dcRate").data("kendoExtNumericTextBox").readonly();

        if(pItemDistinCd === '07'){
            $("#grid thead [data-field=itemCd]").text("<spring:message code='par.lbl.toolCd' />");
            $("#grid thead [data-field=itemNm]").text("<spring:message code='par.lbl.toolNm' />");
        }
    }

    function calTotalAmt(){
        var rows         = $("#grid").data("kendoExtGrid").tbody.find("tr"),
            grTotQty     = 0,
            claimTotQty  = 0,
            grTotAmt     = 0;


        //  금액 계산
        rows.each(function(index, row) {

           data = $("#grid").data("kendoExtGrid").dataItem(rows[index]);

            if(data.invcQty != null && data.invcQty != null){
                grTotAmt += Number(data.invcTotAmt);
                grTotQty += Number(data.invcQty);
            }

            $("#grTotAmt").data("kendoExtNumericTextBox").value(grTotAmt);
            $("#grTotQty").data("kendoExtNumericTextBox").value(grTotQty);
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

       if(this.value() == null){
           if(id === 'arrvDt'){
                   $("#arrvDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
           }else if(id === 'confirmDt'){
                   $("#confirmDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
           }/*else if(id === 'sInvcDt'){
                   $("#sInvcDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
           }*/
       }else{
           if(id === 'arrvDt'){
               frYY = this.value().getFullYear();
               frMM = this.value().getMonth();
               frDD = this.value().getDate();
               $("#arrvDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
           }else if(id === 'confirmDt'){
               toYY = this.value().getFullYear();
               toMM = this.value().getMonth();
               toDD = confirmDt().getDate();
               $("#confirmDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
           }/*else if(id === 'sInvcDt'){
               toYY = this.value().getFullYear();
               toMM = this.value().getMonth();
               toDD = confirmDt().getDate();
               $("#sInvcDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
           }*/
       }

    }

    function fnDlBpCdPop(e){
        var grid     = $("#grid").data("kendoExtGrid"),
            //rowIndex = grid.items().index(grid.select()),
            tr       = grid.select().closest("tr"),
            dataItem = grid.dataItem(tr);


        if(dataItem.claimTargCd === '02'){
            selectVenderMasterGridPopupWindow();

        }else{
            dms.notification.warning("<spring:message code='par.err.claimTargetChk' />");
        }

        //var selected = grid.select();
    }

    var venderSearchPopupWin;
    function selectVenderMasterGridPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,deactivate :false
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":true
                    ,"bpTp":'04'
                    ,"callbackFunc":function(data){
                        var grid = $("#grid").data("kendoExtGrid"),
                        tr = grid.select().closest("tr"),
                        dataItem = grid.dataItem(tr);

                        dataItem.set("dlBpCd", data[0].bpCd);
                        dataItem.set("dlBpNm", data[0].bpNm);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

  //부품 팝업 열기 함수.
    function selectItemPopupWindow(){

        itemByBpCdPopupWindow = dms.window.popup({
              windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , width:860
            , height:550
            , content:{
                url:"<c:url value='/par/cmm/selectItemPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").data("kendoExtDropDownList").value()
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"multiple"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            popItemData  = {},
                            itemList     = [],
                            dcRate       = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            lDcRate      = (Number(dcRate)/100) + 1,
                            tDate,
                            rows;

                        for(var i = 0; i < dataLen; i = i + 1){
                            //내용
                            popItemData = {};
                            popItemData.dlrCd              = data[i].dlrCd;
                            popItemData.dlPdcCd            = "";
                            popItemData.purcOrdTp          = "01";
                            popItemData.prcTp              = "01";
                            popItemData.invcTp             = "";
                            popItemData.invcStatCd         = "00";
                            popItemData.invcDocNo          = "";
                            popItemData.invcDt             = null;
                            popItemData.bmpOrdNo           = "";
                            popItemData.bmpOrdLineNo       = null;
                            popItemData.purcOrdNo          = "";
                            popItemData.purcOrdLineNo      = null;
                            popItemData.purcOrdLineDetlNo = "";
                            popItemData.mobisInvcNo        = "";
                            popItemData.mobisInvcLineNo    = null;
                            popItemData.itemCd             = data[i].itemCd;
                            popItemData.itemNm             = data[i].itemNm;
                            popItemData.invcUnitCd         = data[i].stockUnitCd;
                            popItemData.invcQty            = 1; //TODO : [InBoShim] 부품추가 시 입고수량 기본 1개 설정.
                            popItemData.purcQty            = 0;
                            popItemData.invcTargetQty      = 0;
                            popItemData.compareQty         = 0;
                            popItemData.invcPrc            = data[i].purcPrc;
                            //popItemData.invcIncTaxPrc      = (data[i].purcPrc + (data[i].purcPrc * gVatCd));
                            if( dcRate> 0){
                                popItemData.invcTotAmt         = data[i].purcPrc;
                                popItemData.invcAmt            = data[i].purcPrc / lDcRate;
                                popItemData.taxAmt             = data[i].purcPrc - (data[i].purcPrc / lDcRate);
                                popItemData.taxDdctPrc         = data[i].purcPrc / lDcRate;
                            }else{
                                popItemData.invcTotAmt         = data[i].purcPrc;
                                popItemData.invcAmt            = data[i].purcPrc;
                                popItemData.taxAmt             = 0;
                                popItemData.taxDdctPrc         = data[i].purcPrc;
                            }

                            popItemData.grStrgeCd          = data[i].grStrgeCd;
                            //popItemData.grLocCd            = "";
                            popItemData.claimQty           = 0;
                            popItemData.claimTp            = "";
                            popItemData.claimTargCd        = "";
                            popItemData.dlBpCd             = "";
                            popItemData.dlBpNm             = "";
                            popItemData.reqCont            = "";
                            popItemData.dcRate             = $("#dcRate").data("kendoExtNumericTextBox").value();


                            if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].grStrgeCd])){
                                  popItemData.grLocCd = locationListObj[data[i].itemCd][data[i].grStrgeCd][0].cmmCd;
                                }else{
                                    popItemData.grLocCd = '';
                                }
                            }else{
                                popItemData.grLocCd = '';
                            }

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                gridData.dataSource.add(popItemData);
                            }
                        }

                        gridData.select(gridData.tbody.find(">tr"));
                        itemByBpCdPopupWindow.close();
                        calTotalAmt();
                    }
                }
            }
        });
    }

    function selectVenderMasterPopupWindow(){
        var bpTp;

        //공구구매등록인 경우(BMP도 로컬임.)
        if(pItemDistinCd === '07'){
            bpTp = '03';
        }else{
            bpTp = '';
        }

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"//공급업체조회
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterForInvcPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":$("#bpCd").val()
                    ,"bpNm":$("#bpNm").val()
                    ,"bpTp":bpTp
                    ,"callbackFunc":function(data){

                        existItemChkObj = {};

                        initPage();

                        $("#bpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                        $("#bpNm").val(data[0].bpNm);
                        $("#bpTp").data("kendoExtDropDownList").value(data[0].bpTp);
                        $("#grid").data("kendoExtGrid").dataSource.data([]);

                        if($("#bpTp").data("kendoExtDropDownList").value() === '01'){
                            //공구 인 경우 구매참조 안 막음
                            if(pItemDistinCd === '07'){
                                $("#dcRateArea").removeClass("readonly_area");
                                $("#dcRate").data("kendoExtNumericTextBox").readonly(false);
                                //$("#dcRate").data("kendoExtNumericTextBox").readonly(true);
                            //부품&악세사리인 경우 BMP 구매일 때 구매참조 버튼 막음.
                            }else{
                                $("#dcRateArea").addClass("readonly_area");
                                $("#dcRate").data("kendoExtNumericTextBox").value((gVatCd * 100));
                                $("#dcRate").data("kendoExtNumericTextBox").readonly();
                            }

                        }else{
                            if(Number(data[0].taxRate) > 0){
                                $("#dcRate").data("kendoExtNumericTextBox").value(data[0].taxRate);
                            }else{
                                $("#dcRate").data("kendoExtNumericTextBox").value((gVatCd * 100));
                            }
                            $("#dcRateArea").removeClass("readonly_area");
                            $("#dcRate").data("kendoExtNumericTextBox").readonly(false);
                            //$("#dcRate").data("kendoExtNumericTextBox").readonly(true);
                        }

                        fnSetButton('');

                        venderSearchPopupWin.close();

                    }
                }
            }
        });
    }

  //구매오더 복사 팝업 열기 함수.
    function selectPrevPurcOrdPopupWindow(){

        prevPurcOrdPopupWindow = dms.window.popup({
            windowId:"PrevPurcOrdPopup"
            , title:"<spring:message code='par.title.purcOrdCopy' />"   // 구매오더 복사
            , width:860
            , height:570
            , content:{
                url:"<c:url value='/par/cmm/selectPrevPurcOrdPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").data("kendoExtDropDownList").value()
                    , "itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            itemList     = [],
                            dcRate       = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            lDcRate      = (Number(dcRate)/100) + 1,
                            popPrevData  = {};

                        for(var i = 0; i < dataLen; i = i + 1){
                            popPrevData.dlrCd              = data[i].dlrCd;
                            popPrevData.dlPdcCd            = "";
                            popPrevData.purcOrdTp          = "01";
                            popPrevData.invcTp             = "";
                            popPrevData.invcStatCd         = "00";
                            popPrevData.prcTp              = data[i].prcTp;
                            popPrevData.invcDocNo          = "";
                            popPrevData.invcDt             = null;
                            popPrevData.bmpOrdNo          = "";
                            popPrevData.bmpOrdLineNo      = null;
                            popPrevData.purcOrdNo          = "";
                            popPrevData.purcOrdLineNo      = null;
                            popPrevData.purcOrdLineDetlNo = "";
                            popPrevData.mobisInvcNo        = "";
                            popPrevData.mobisInvcLineNo    = null;
                            popPrevData.itemCd             = data[i].itemCd;
                            popPrevData.itemNm             = data[i].itemNm;
                            popPrevData.invcUnitCd         = data[i].purcUnitCd;
                            popPrevData.invcQty            = data[i].purcQty;
                            popPrevData.purcQty            = 0;
                            popPrevData.invcTargetQty      = 0;
                            popPrevData.compareQty         = 0;
                            popPrevData.invcPrc            = data[i].purcPrc;
                            popPrevData.dcRate             = dcRate;
                            //popPrevData.invcIncTaxPrc      = 0;//(data[i].purcPrc + (data[i].purcPrc * gVatCd));
                            popPrevData.invcTotAmt         = data[i].purcAmt;
                            if( dcRate> 0){
                                popPrevData.invcAmt            = data[i].purcAmt / lDcRate;
                                popPrevData.taxAmt             = data[i].purcAmt - (data[i].purcAmt / lDcRate);
                                popPrevData.taxDdctPrc         = data[i].purcPrc / lDcRate;
                            }else{
                                popPrevData.invcAmt            = data[i].purcAmt;
                                popPrevData.taxAmt             = 0;
                                popPrevData.taxDdctPrc         = data[i].purcPrc;
                            }
                            popPrevData.grStrgeCd          = data[i].grStrgeCd;
                            //popPrevData.grLocCd            = "";
                            popPrevData.claimQty           = 0;
                            popPrevData.claimTp            = "";
                            popPrevData.claimTargCd        = "";
                            popPrevData.dlBpCd             = "";
                            popPrevData.dlBpNm             = "";
                            popPrevData.reqCont            = "";

                            if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].grStrgeCd])){
                                  popPrevData.grLocCd = locationListObj[data[i].itemCd][data[i].grStrgeCd][0].cmmCd;
                                }else{
                                    popPrevData.grLocCd = '';
                                }
                            }else{
                                popPrevData.grLocCd = '';
                            }

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                gridData.dataSource.add(popPrevData);
                            }
                        }
                        prevPurcOrdPopupWindow.close();

                        calTotalAmt();
                    }
                }
            }
        });
    }
  //송장리스트 팝업 열기 함수.
    function selectInvcListPopupWindow(){

        invcListPopupWindow = dms.window.popup({
            windowId:"invcListPopup"
            , title:"<spring:message code='par.title.invcList' />"   // 송장목록
            , width:860
            , height:400
            , content:{
                url:"<c:url value='/par/cmm/selectInvcListPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").data("kendoExtDropDownList").value()
                    , "invcStatCd":'02'
                    , "itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        $("#mobisInvcNo").val(data[0].mobisInvcNo);
                        $("#invcDocNo").val(data[0].invcDocNo);
                        $("#grDocNo").val(data[0].invcDocNo);
                        $("#arrvDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].arrvDt));
                        $("#confirmDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].confirmDt));
                        $("#updtDtStr").val(data[0].updtDtStr);

                        gCrud  = "C";
                        fnSetButton("02");

                        invcListPopupWindow.close();

                        existItemChkObj = {};
                        $("#grid").data("kendoExtGrid").dataSource.read();

                    }
                }
            }
        });
    }

 // 구매 복사 적용.
    function selectCopyPurcOrd(pPurcOrdNo){

        $.ajax({
            url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItemByKey.do' />",
            data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {

            var dataLen      = result.data.length,
                gridData     = $("#grid").data("kendoExtGrid"),
                itemList     = [],
                pDcRate      = Number($("#dcRate").data("kendoExtNumericTextBox").value()),
                lDcRate      = (pDcRate/100) + 1,
                popPrevData  = {};

            for(var i = 0; i < dataLen; i = i + 1){
                popPrevData  = {};
                popPrevData.dlrCd              = result.data[i].dlrCd;
                popPrevData.dlPdcCd            = "";
                popPrevData.purcOrdTp          = "01";
                popPrevData.invcTp             = "";
                popPrevData.invcStatCd         = "00";
                popPrevData.prcTp              = result.data[i].prcTp;
                popPrevData.invcDocNo          = "";
                popPrevData.invcDt             = null;
                popPrevData.purcOrdNo          = "";
                popPrevData.purcOrdLineNo      = null;
                popPrevData.bmpOrdNo           = "";
                popPrevData.bmpOrdLineNo       = null;
                popPrevData.purcOrdLineDetlNo  = "";
                popPrevData.mobisInvcNo        = "";
                popPrevData.mobisInvcLineNo    = null;
                popPrevData.itemCd             = result.data[i].itemCd;
                popPrevData.itemNm             = result.data[i].itemNm;
                popPrevData.invcUnitCd         = result.data[i].purcUnitCd;
                popPrevData.invcQty            = result.data[i].purcQty;
                popPrevData.purcQty            = 0;
                popPrevData.invcTargetQty      = 0;
                popPrevData.compareQty         = 0;
                popPrevData.invcPrc            = result.data[i].purcPrc;
                popPrevData.dcRate             = $("#dcRate").data("kendoExtNumericTextBox").value();
                popPrevData.invcTotAmt         = result.data[i].purcAmt;
                if( dcRate> 0){
                    popPrevData.invcAmt            = result.data[i].purcAmt / lDcRate;
                    popPrevData.taxAmt             = result.data[i].purcAmt - (result.data[i].purcAmt / lDcRate);
                    popPrevData.taxDdctPrc         = result.data[i].purcPrc / lDcRate;
                }else{
                    popPrevData.invcAmt            = result.data[i].purcAmt;
                    popPrevData.taxAmt             = 0;
                    popPrevData.taxDdctPrc         = result.data[i].purcPrc;
                }
                popPrevData.grStrgeCd          = result.data[i].grStrgeCd;
                //popPrevData.grLocCd            = "";
                popPrevData.claimQty           = 0;
                popPrevData.claimTp            = "";
                popPrevData.claimTargCd        = "";
                popPrevData.dlBpCd             = "";
                popPrevData.dlBpNm             = "";
                popPrevData.reqCont            = "";

                if(!dms.string.isEmpty(locationListObj[result.data[i].itemCd])){
                    if(!dms.string.isEmpty(locationListObj[result.data[i].itemCd][result.data[i].grStrgeCd])){
                      popPrevData.grLocCd = locationListObj[result.data[i].itemCd][result.data[i].grStrgeCd][0].cmmCd;
                    }else{
                        popPrevData.grLocCd = '';
                    }
                }else{
                    popPrevData.grLocCd = '';
                }

                if(existItemChkObj.hasOwnProperty(result.data[i].itemCd)){
                    //이미 등록되어있는 부품입니다.
                    var itemInfo = result.data[i].itemCd + '[' + result.data[i].itemNm + ']';
                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                }else{
                    existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;
                    gridData.dataSource.add(popPrevData);
                }
            }

            calTotalAmt();

        });
    }

   // 입고확정리스트 팝업 열기 함수.
    function selectReceiveCnfmListPopupWindow(){

        receiveCnfmListPopupWindow = dms.window.popup({
            windowId:"receiveCnfmListPopup"
            ,title:"<spring:message code='par.title.stockGrItemInfo' />"   //입고정보
            ,width : 840
            ,height: 400
            ,content:{
                url:"<c:url value='/par/cmm/selectReceiveCnfmListPopup.do'/>"
                ,data:{
                      "type":"custom1"
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").data("kendoExtDropDownList").value()
                    , "selectable":"single"
                    , "callbackFunc":function(data){
                        if(data.length === 1)
                        {
                            $("#grDocNo").val(data[0].invcDocNo);

                            if(!dms.string.isEmpty(data[0].mobisInvcNo)){
                                $("#grTp").data("kendoExtDropDownList").value('01');
                                $("#dcRateArea").addClass("readonly_area");
                                //$("#grid").data("kendoExtGrid").dataSource.read();
                            }else{
                                $("#grTp").data("kendoExtDropDownList").value('02');
                                $("#dcRateArea").removeClass("readonly_area");
                            }

                            $("#grid").data("kendoExtGrid").dataSource.data([]);

                            selectReceiveCnfm();
                        }
                        receiveCnfmListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 부품입고 정보 조회.
    function selectReceiveCnfm(){
        var grDocNo = $("#grDocNo").val();

        if($("#grTp").data("kendoExtDropDownList").value() === '01'){
            $.ajax({
                url:"<c:url value='/par/pcm/invc/selectReceiveCnfmItemSummaryByInvcKey.do' />",
                data:JSON.stringify({ sInvcDocNo:grDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                //$("#regUsrId").val(result.regUsrId);
                //$("#invcGrDt").daCta("kendoExtMaskedDatePicker").value(result.invcGrDt);
                //$("#invcDocNo").val(result.invcDocNo);
                //$("#dcRate").data("kendoExtNumericTextBox").value(result.dcRate);
                //$("#grTotQty").data("kendoExtNumericTextBox").value(result.grTotQty);
                //$("#claimTotQty").data("kendoExtNumericTextBox").value(result.claimTotQty);
                //$("#grTotAmt").data("kendoExtNumericTextBox").value(result.grTotAmt);
                if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);

                fnSetButton(result.invcStatCd);

                $("#dcRate").data("kendoExtNumericTextBox").value(gVatCd * 100);

                $.ajax({
                    url:"<c:url value='/par/pcm/invc/selectReceiveCnfmItemByInvcKey.do' />",
                    data:JSON.stringify({ sInvcDocNo:grDocNo, sInvcStatCd:result.invcStatCd}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {
                    var datalen = result.data.length;

                    for(var i = 0;i < datalen; i = i + 1  ){
                        result.data[i].arrvDt = kendo.parseDate(result.data[i].arrvDt);
                        result.data[i].purcRegDt = kendo.parseDate(result.data[i].purcRegDt);
                        result.data[i].invcDt = kendo.parseDate(result.data[i].invcDt);
                    }

                    $("#grid").data("kendoExtGrid").dataSource.data([]);
                    $("#grid").data("kendoExtGrid").dataSource.data(result.data);

                    $("#dcRate").data("kendoExtNumericTextBox").readonly();

                });

            });
        }else if($("#grTp").data("kendoExtDropDownList").value() === '02'){
            $.ajax({
                url:"<c:url value='/par/pcm/invc/selectReceiveCnfmItemSummaryByEtcGrKey.do' />",
                data:JSON.stringify({ sEtcGrDocNo:grDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);
                fnSetButton(result.invcStatCd);

                if(result.invcStatCd === "03" || result.invcStatCd === "04"){
                    $("#dcRate").data("kendoExtNumericTextBox").readonly(true);
                    $("#dcRateArea").addClass("readonly_area");
                }else {
                    $("#dcRate").data("kendoExtNumericTextBox").readonly(false);
                    $("#dcRateArea").removeClass("readonly_area");
                }
                $.ajax({
                    url:"<c:url value='/par/pcm/invc/selectReceiveCnfmItemByEtcGrKey.do' />",
                    data:JSON.stringify({ sEtcGrDocNo:grDocNo}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {
                    var datalen = result.data.length;
                    $("#grid").data("kendoExtGrid").dataSource.data([]);
                    $("#grid").data("kendoExtGrid").dataSource.data(result.data);
                    //$("#dcRate").data("kendoExtNumericTextBox").readonly();
                });
            });
        }
        gCrud = "U";

    }

    function fnSetLocCdObj(pItemList){

        var header = {
                sItemCdLst       :pItemList
        };

        $.ajax({
            url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
           ,data:kendo.stringify(header)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {

               if(result.total > 0){
                   for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                       if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                           if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){

                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }else{
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }

                       }else{
                           locationListObj[result.data[i].itemCd] = {};
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }


                       if(!locationObj.hasOwnProperty(result.data[i].strgeCd)){
                           locationObj[result.data[i].strgeCd] = {};
                           locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                       }else{

                           if(!locationObj[result.data[i].strgeCd].hasOwnProperty(result.data[i].locCd)){
                               locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                           }
                       }

                   }
               }
           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }

    function fnChangeDcRate(pDcRate){
        var grid          = $("#grid").data("kendoExtGrid"),
            rows          = grid.tbody.find("tr"),
            lDcRate       = 0;//Number(pDcRate) + 1;

        try{
            /*if(rows.length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='par.btn.apply' var='apply' /><spring:message code='global.info.notExistData' arguments='${apply}'/>");
                $("#dcRate").data("kendoExtNumericTextBox").value(gVatCd * 100);
            }else{*/
                if(pDcRate >= 50 ){
                    dms.notification.warning("<spring:message code='par.lbl.taxRate' var='taxRate' /><spring:message code='global.err.chkGreateParam' arguments='${taxRate},50'/>");
                    pDcRate = (gVatCd * 100);

                    $("#dcRate").data("kendoExtNumericTextBox").value((gVatCd * 100));
                }else if(pDcRate < 0){
                    dms.notification.warning("<spring:message code='par.lbl.taxRate' var='taxRate' /><spring:message code='global.err.chkMinusParam' arguments='${taxRate}'/>");
                    pDcRate = (gVatCd * 100);

                    $("#dcRate").data("kendoExtNumericTextBox").value((gVatCd * 100));
                }

                if(pDcRate !== 0){
                    lDcRate = (Number(pDcRate)/100) + 1;
                }else{
                    lDcRate = 1;
                }


                rows.each(function(index, row) {
                    var dataItem = $("#grid").data("kendoExtGrid").dataSource.data()[index],
                        gridData = grid.dataSource.at(index);

                    dataItem.set('dcRate',pDcRate);
                    dataItem.set('invcAmt',(gridData.invcPrc * gridData.invcQty) / lDcRate);
                    dataItem.set('taxAmt',(gridData.invcPrc * gridData.invcQty) - ((gridData.invcPrc * gridData.invcQty) / lDcRate));
                    dataItem.set('taxDdctPrc',gridData.invcPrc  / lDcRate);

                });

                calTotalAmt();
            //}


        }catch(e){
            console.log('fnChangeDcRate_catch:',e);
        }
    }

    //창고설정팝업
    $("#btnSetStrgeCdPop").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                lCrud = '',
                paramUrl = '',
                chkRow,
                chkCnt = 0,
                chkLow = [],
                header;

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chkRow === true){

                    chkCnt = chkCnt + 1;
                    chkLow.push(index);
                }
            });


            if(chkCnt < 1){
                 // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }


            setStrgeCdPopup(chkLow);
        }
    });

    function setStrgeCdPopup(pChkLow){

        setStrgeCdPopupWindow = dms.window.popup({
            windowId:"setStrgeCdPopupWindow"
            , title:"<spring:message code = 'par.lbl.grStrgeCd'/>"   // 입고창고 선택
            , width:330
            , height:300
            , content:{
                url:"<c:url value='/par/cmm/setStrgeCdPopup.do'/>"
                ,data:{
                     "callbackFunc":function(data){
                        var grid = $("#grid").data("kendoExtGrid"),
                            rows = grid.tbody.find("tr"),
                            lCrud = '',
                            paramUrl = '',
                            chkRow,
                            chkCnt = 0,
                            chkLen = pChkLow.length,
                            header;

                        for(var i = 0; i < chkLen; i = i + 1){
                            var dataItem = $("#grid").data("kendoExtGrid").dataSource.data()[pChkLow[i]];

                            dataItem.set('grStrgeCd',data.strgeCd);
                        }


                        setStrgeCdPopupWindow.close();
                    }
                }
            }
        });


    }

    function fnSetButton(pType){
        var lGrTp = $("#grTp").data("kendoExtDropDownList").value();

        //송장확정
        if(pType === '02'){

            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            if(lGrTp === '01'){  //전체등록 및 전체 확정은 송장인 경우만 가능.
                $("#btnSaveAll").data("kendoButton").enable(true);
            }else{
                $("#btnSaveAll").data("kendoButton").enable(false);
            }
            $("#btnCnfmAll").data("kendoButton").enable(false);
            $("#btnAddPurcOrd").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnSetStrgeCdPop").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);
        //입고확정
        }else if(pType === '03'){
            if(lGrTp === '01'){
                $("#btnCancel").data("kendoButton").enable(false);
            }else{
                //$("#btnCancel").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
            }
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnSaveAll").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCnfmAll").data("kendoButton").enable(false);
            $("#btnAddPurcOrd").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnSetStrgeCdPop").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
        }else if(pType === '00'){
            if(lGrTp === '01'){
                $("#btnAddPurcOrd").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);

                $("#btnSaveAll").data("kendoButton").enable(true);
                $("#btnCnfmAll").data("kendoButton").enable(true);
            }else{
                if(pItemDistinCd === '07'){
                    $("#btnAddPurcOrd").data("kendoButton").enable(true);
                //부품&악세사리인 경우 BMP 구매일 때 구매참조 버튼 막음.
                }else{
                    if($("#bpTp").data("kendoExtDropDownList").value() === '01'){
                        $("#btnAddPurcOrd").data("kendoButton").enable(false);
                    }else{
                        $("#btnAddPurcOrd").data("kendoButton").enable(true);
                    }
                }
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);

                $("#btnSaveAll").data("kendoButton").enable(false);
                $("#btnCnfmAll").data("kendoButton").enable(false);
            }
            //$("#btnCancel").data("kendoButton").enable(false);
            $("#btnInvcListPop").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(true);
            $("#btnSetStrgeCdPop").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);
        //기타입고 취소 상태
        }else if(pType === '04'){
            $("#btnAddPurcOrd").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnSetStrgeCdPop").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnInvcListPop").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnSaveAll").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCnfmAll").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
        }else{


            if(!dms.string.isEmpty($("#bpCd").val())){
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
                if($("#bpTp").data("kendoExtDropDownList").value() === '01'){
                    $("#btnInvcListPop").data("kendoButton").enable(true);
                    $("#btnSaveAll").data("kendoButton").enable(true);
                }else{
                    $("#btnInvcListPop").data("kendoButton").enable(false);
                    $("#btnSaveAll").data("kendoButton").enable(false);
                }
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnCnfmAll").data("kendoButton").enable(false);
                $("#btnSetStrgeCdPop").data("kendoButton").enable(true);
                $("#btnPrint").data("kendoButton").enable(false);

                if(pItemDistinCd === '07'){
                    $("#btnAddPurcOrd").data("kendoButton").enable(true);
                //부품&악세사리인 경우 BMP 구매일 때 구매참조 버튼 막음.
                }else{
                    if($("#bpTp").data("kendoExtDropDownList").value() === '01'){
                        $("#btnAddPurcOrd").data("kendoButton").enable(false);
                    }else{
                        $("#btnAddPurcOrd").data("kendoButton").enable(true);
                    }
                }
            }else{
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnInvcListPop").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnSaveAll").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnCnfmAll").data("kendoButton").enable(false);
                $("#btnSetStrgeCdPop").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#btnAddPurcOrd").data("kendoButton").enable(false);
            }
        }


    }

</script>
<!-- //script -->
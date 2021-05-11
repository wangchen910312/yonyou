<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 입고확정 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.receiveCnfmInfo" /></h1> --%>
            <div class="btn_left">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_m_min" id="btnSave"><spring:message code="par.btn.receiveCnfm" /><!-- 입고확정 --></button>
                <button class="btn_m btn_m_min" id="btnPrint"><spring:message code="par.btn.receiveCnfmPrint" /><!-- 입고单출력 --></button>
                <!-- 조회기능 존재하지만 필요없어진 관계로 hidden처리함.(송장번호가 필요하기에 송장팝업으로 대체) -->
                <button class="btn_m btn_search hidden" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.sBpNm" /><!-- 공급업체 --></th>
                        <td>
                            <div class="form_search">
                                <input type="hidden" id="bpCd" name="bpCd" class="form_input" required/>
                                <input type="text" id="bpNm" class="form_input" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpTpNm" /><!-- 공급업체유형 --></th>
                        <td class="readonly_area">
                            <input id="bpTp" data-type="combo" class="form_comboBox form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcGrDocNo" /><!-- 입고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="grDocNo" class="form_input form_readonly" readonly />
                                <a id="searchGrDocNo"><!-- 검색 --></a>
                                <input id="invcDocNo" type="hidden"/>
                                <input id="mobisInvcNo" type="hidden"/>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcGrConfirmer" /><!-- 입고확인자 --></th>
                        <td>
                            <input id="regUsrId" class="form_input form_readonly" readonly />
                            <input type="hidden" id="cofirmDt" name="cofirmDt" class="form_input hidden" required/>
                            <input type="hidden" id="arrvDt" name="arrvDt" class="form_input hidden" required/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grTime" /><!-- 입고일자 --></th>
                        <td class="readonly_area">
                            <input id="invcGrDt" class="form_datepicker" data-type="maskDate" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grGubun" /><!-- 입고구분 --></th>
                        <td class="readonly_area">
                            <input id="grTp" class="form_comboBox" data-type="combo" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                        <td class="readonly_area">
                            <input id="grTotQty" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.qualityClaimQty" /><!-- 클레임수량 --></th>
                        <td class="readonly_area">
                            <input id="claimTotQty" data-type="number" class="form_numeric"/>
                        </td>
                    </tr>
                    <tr>

                        <th scope="row"><spring:message code="par.lbl.taxRate" /><!-- 할인율 --></th>
                        <td>
                            <input id="dcRate" data-type="number" class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grAmtTax" /><!-- 입고금액 --></th>
                        <td class="readonly_area">
                            <input id="grTotAmt" data-type="number" class="form_numeric"/>
                            <input id="invcTp" class="form_comboBox hidden" data-type="combo" readonly />
                            <input id="invcStatCd" class="form_comboBox hidden" type="text" data-type="combo" readonly />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_s hidden" id="btnInvcListPop"><spring:message code="par.btn.invcRef" /><!-- 송장리스트팝업 --></button>
                <button class="btn_s btn_add hidden" id="btnAddPurcOrd"><spring:message code="par.btn.purcOrdRef" /></button>
                <button class="btn_s btn_file btn_s_min5" id="btnExcelUpload"><spring:message code="par.btn.excelUpload" /></button>
                <button class="btn_s btn_add btn_s_min5"  id="btnAddItem"><spring:message code="par.btn.add" /></button>
                <button class="btn_s btn_del btn_s_min5"  id="btnDelItem"><spring:message code="par.btn.del" /></button>
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
//세율 (0.16)
var vatCode = "${vatCd}";
var vatCd = dms.string.isEmpty(vatCode)?0.16:Number(vatCode);

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

    //gridHeight - if grid has footer
    function gridHeight(){
        var grid = $("#grid").data("kendoExtGrid");
        var contentHeight = grid.content.height();
        var footerHeight = grid.wrapper.find(".k-grid-footer").height();
        grid.content.height(contentHeight - (footerHeight + 1));
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
            format:"n2"
           ,spinners:false
           ,change: function() {
               var value = this.value();
               console.log(value); //value is the selected date in the numerictextbox
               fnChangeDcRate(value);
           }
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchGrDocNo").on('click', selectReceiveCnfmListPopupWindow);

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

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pMobisInvcNo = '';
                pInvcDocNo = '';
                pBpCd = '';
                pBpNm = '';
                pArrvDt = '';
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

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();


                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete existItemChkObj[l_rowData.itemCd];
                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

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
                parent._createOrReloadTabMenu("<spring:message code='par.lbl.grPrintDoc'/>", "<c:url value='/ReportServer?reportlet=par/selectInvcPrintMain.cpt'/>&sDlrCd=${dlrCd}&sInvcDocNo="+$("#grDocNo").val());
            }
        });

     // 엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {
                receiveEtcExcelUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='par.title.receiveEtcExcelUpload' />"
                    ,windowId:"receiveEtcExcelUploadPopupWin"
                    ,width : 680
                    ,height: 340
                    ,content:{
                         url:"<c:url value='/par/cmm/selectReceiveEtcExcelUploadPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(data){

                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    popItemData  = {},
                                    itemList     = [],
                                    tDate,
                                    rows;



                                for(var i = 0; i < dataLen; i = i + 1){
                                    itemList.push(data[i].itemCd);
                                }
                                console.log('itemList:',itemList,data);
                                fnSetLocCdObj(itemList);

                                for(var i = 0; i < dataLen; i = i + 1){
                                    //내용

                                    popItemData.dlrCd              = data[i].dlrCd;
                                    popItemData.dlPdcCd            = "";
                                    popItemData.purcOrdTp          = "01";
                                    popItemData.prcTp              = "01";
                                    popItemData.invcTp             = "01";
                                    popItemData.invcStatCd         = "02";
                                    popItemData.invcDocNo          = "";
                                    popItemData.invcDt             = toDate;
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
                                    popItemData.invcAmt            = data[i].invcAmt;
                                    popItemData.taxAmt             = data[i].taxAmt;
                                    popItemData.taxDdctPrc         = data[i].taxDdctPrc;

                                    popItemData.grStrgeCd          = data[i].grStrgeCd;
                                    popItemData.grLocCd            = "";
                                    popItemData.claimQty           = 0;
                                    popItemData.claimTp            = "";
                                    popItemData.claimTargCd        = "";
                                    popItemData.dlBpCd             = "";
                                    popItemData.dlBpNm             = "";
                                    popItemData.reqCont            = "";
                                    popItemData.dcRate             = data[i].dcRate;


                                    if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                        //이미 등록되어있는 부품입니다.
                                        var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                        dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                    }else{
                                        existItemChkObj[data[i].itemCd] = data[i].itemNm;;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }

                                gridData.select(gridData.tbody.find(">tr"));
                                receiveEtcExcelUploadPopupWin.close();

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

                header = {
                      bpCd            :$("#bpCd").val()
                     ,mobisInvcNo     :$("#mobisInvcNo").val()
                     ,invcDocNo       :$("#invcDocNo").val()
                     ,arrvDt          :$("#arrvDt").data("kendoExtMaskedDatePicker").value()
                };

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

                        if(dms.string.isEmpty(gridData.grStrgeCd)){
                            // 입고창고를 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                            saveList = [];
                            return false;
                        }

                        /*
                        if(dms.string.isEmpty(gridData.grLocCd)){
                            // 입고로케이션를 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.locationCd' var='grLocCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grLocCd}'/>");
                            saveList = [];
                            return false;
                        }*/

                        /*
                        if(gridData.claimQty > 0){

                            if(Number(gridData.claimQty) > Number(gridData.invcQty)){
                                // 클레임 수량이 입고확정수량보다 클 수 없습니다.
                                dms.notification.warning("<spring:message code='par.err.compareClaimInvcQty' />");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.claimTp)){
                                // 클레임 사유를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.claimTp' var='claimTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTp}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.claimTargCd)){
                                // 클레임 대상을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.claimTargetCd' var='claimTargetCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTargetCd}'/>");
                                saveList = [];
                                return false;
                            }else{
                                //클레임 대상이 배송처인 경우
                                if(gridData.claimTargCd === '02'){
                                    if(dms.string.isEmpty(gridData.dlBpCd)){
                                        // 배송업체를 선택하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                                        saveList = [];
                                        return false;
                                    }

                                    if(dms.string.isEmpty(gridData.dlBpNm)){
                                        // 배송업체를 선택하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                                        saveList = [];
                                        return false;
                                    }
                                }
                            }


                        }
                        */
                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "invcVO"  :header
                          ,"invcItemList":saveList
                        };

                    console.log('kendo.stringify(data):',kendo.stringify(data));
                    $.ajax({
                         url:"<c:url value='/par/pcm/receive/insertReceiveCnfm.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {

                            if (result.resultYn) {
                                dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                                existItemChkObj = {};

                                $("#grDocNo").val(result.grDocNo);

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
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });
                }else{
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

              }
        });

        /**
         * grid 입고창고 DropDownList
         */
         grStrgeCdDropDownEditor = function(container, options) {
             var mobisInvcNo  = options.model.mobisInvcNo;


             if(dms.string.isEmpty(mobisInvcNo)){
                 $('<input data-bind="value:' + options.field + '"  />')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     dataTextField: "cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:  grStrgeTpList
                    ,change:function(e){
                        options.model.set('grLocCd','');
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                     }
                 });
             }
         };

        /**
         * grid 입고Location DropDownList
         */
         grLocCdDropDownEditor = function(container, options) {

            var itemCd = options.model.itemCd,
                strgeCd = options.model.grStrgeCd;

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
         };

         /**
          * grid 구매단가&구매수량
          */
          changeInvcQtyEditor = function(container, options) {
              var input   = $("<input/>"),
                  dcRate  = $("#dcRate").data("kendoExtNumericTextBox").value(),
                  lDcRate = Number(dcRate) + 1,
                  pValue;

              input.attr("name", options.field);

              input.keyup(function(){

                  pValue = Number($(this).val());

                  if(options.field === 'invcQty'){


                      /*if(pValue > options.model.invcTargetQty){
                          if(!dms.string.isEmpty(options.model.invcDocNo)){
                              options.model.set("invcQty", options.model.invcTargetQty);
                              if(dcRate > 0){
                                  options.model.set("invcAmt", (options.model.invcTargetQty * options.model.invcPrc));
                                  options.model.set("taxAmt",  options.model.invcTargetQty * options.model.invcPrc * dcRate);
                              }else{
                                  options.model.set("invcAmt", options.model.invcTargetQty * options.model.invcPrc);
                                  options.model.set("taxAmt",  0);
                              }
                          }else{
                              if(dcRate > 0){
                                  options.model.set("invcAmt", pValue * options.model.invcPrc);
                                  options.model.set("taxAmt",  pValue * options.model.invcPrc * dcRate);
                              }else{
                                  options.model.set("invcAmt", pValue * options.model.invcPrc);
                                  options.model.set("taxAmt",  0);
                              }
                          }


                      }else{*/
                          if(!dms.string.isEmpty(options.model.invcDocNo)){
                              options.model.set("compareQty", options.model.invcTargetQty -  pValue);
                          }

                          if(dcRate > 0){
                              options.model.set("invcTotAmt", pValue * options.model.invcPrc);
                              options.model.set("invcAmt",    (pValue * options.model.invcPrc) / lDcRate);
                              options.model.set("taxAmt",     pValue * options.model.invcPrc - ((pValue * options.model.invcPrc) / lDcRate));
                              options.model.set("taxDdctPrc", options.model.invcPrc / lDcRate);
                              //options.model.set("invcAmt",    pValue * options.model.invcPrc - (pValue * options.model.invcPrc * dcRate));
                              //options.model.set("taxAmt",     pValue * options.model.invcPrc * dcRate);
                              //options.model.set("taxDdctPrc", options.model.invcPrc - (options.model.invcPrc * dcRate));
                          }else{
                              options.model.set("invcTotAmt", pValue * options.model.invcPrc);
                              options.model.set("invcAmt",    pValue * options.model.invcPrc);
                              options.model.set("taxAmt",     0);
                              options.model.set("taxDdctPrc", options.model.invcPrc);
                          }
                      //}
                  }else if(options.field === 'invcPrc'){
                      if(dcRate > 0){
                          options.model.set("invcTotAmt", pValue * options.model.invcQty);
                          options.model.set("invcAmt",    (pValue * options.model.invcQty) / lDcRate);
                          options.model.set("taxAmt",     (pValue * options.model.invcQty) - ((pValue * options.model.invcQty) / lDcRate));
                          options.model.set("taxDdctPrc", pValue / lDcRate);
                      }else{
                          options.model.set("invcTotAmt", pValue * options.model.invcQty);
                          options.model.set("invcAmt",    pValue * options.model.invcQty);
                          options.model.set("taxAmt",     0);
                          options.model.set("taxDdctPrc", pValue);
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
                     }

                 }

              });

              input.appendTo(container);
              input.kendoExtNumericTextBox({
                  min:0,
                  spinners:false
              });
          };

        /**
         * grid 클레임사유 DropDownList
         */
         grClaimTpDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });
         };

        /**
         * grid 클레임대상 DropDownList
         */
         claimTargCdDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTargetTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });


         };
         // 입고확정 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-0805-153702"
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

                          for(var i = 0, dataLen = result.total; i < dataLen; i = i + 1 ){
                              itemList.push(result.data[i].itemCd);
                          }

                          locationListObj = {};

                          if(dataLen > 0){
                              fnSetLocCdObj(itemList);
                          }

                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"receiveNo"
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
                             , purcRegDt           :{ type:"date", editable:false }
                             , arrvDt              :{ type:"date", editable:false }
                             , dlPdcCd             :{ type:"string", editable:false }
                         }
                     }
                 }
                 ,aggregate:[
                     { field:"invcPrc", aggregate:"sum" }
                     ,{ field:"taxDdctPrc", aggregate:"sum" }
                     ,{ field:"invcTotAmt", aggregate:"sum" }
                     ,{ field:"invcAmt", aggregate:"sum" }
                 ]
             }
             , selectable :"multiple"
             , scrollable :true
             , sortable   :false
             , autoBind   :true
             , pageable:false
             , filterable:false
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
            // , multiSelectWithCheckbox:true
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                          if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                          }else {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
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
                     fieldName = grid.columns[e.container.index()].field;

                 console.log('selectedItem:',selectedItem);
                 console.log('selectedItem.invcDocNo:',selectedItem.invcDocNo);
                 console.log('selectedItem.prcTp:',selectedItem.prcTp);
                 if(fieldName === "dlBpNm"||fieldName === "taxAmt" || fieldName === "compareQty" || fieldName === "invcTargetQty"|| fieldName === "invcUnitCd"|| fieldName === "invcAmt"|| fieldName === "invcTotAmt"|| fieldName === "taxDdctPrc" ){
                      this.closeCell();
                 }else if(fieldName === "claimQty" || fieldName === "claimTp" || fieldName === "claimTargCd" || fieldName === "grStrgeCd" || fieldName === "grLocCd" || fieldName === "reqCont"|| fieldName === "invcQty"){
                     $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                 }else if(fieldName === "chk"){
                     this.closeCell();
                 }else if(fieldName === "invcPrc"||fieldName === "dcRate"  ){
                     if(!dms.string.isEmpty(selectedItem.invcDocNo)){
                         this.closeCell();
                     }else{
                         $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                     }
                 }else if(fieldName === "itemCd"){
                     if(!dms.string.isEmpty(selectedItem.invcDocNo)){
                         this.closeCell();
                     }else{
                         console.log('eles:', eles);
                         console.log('input:', input);
                         pVal = input.val();
                         orgVal = input.val();

                         console.log('pVal:', pVal);
                         console.log('selectedItem:', selectedItem);


                         input.keyup(function(){
                             pVal = input.val();
                         });

                         input.blur(function(){

                             var lDcRate = Number($("#dcRate").data("kendoExtNumericTextBox").value()) + 1;
                             console.log('a:',pVal, orgVal);
                             console.log('a:',existItemChkObj);

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

                                        console.log('result111:',result);
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
                                            if($("#dcRate").data("kendoExtNumericTextBox").value() > 0){
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

                                            fnSetLocCdObj([result.data[0].itemCd]);

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
                         });
                         $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                     }
                 }
             }
             ,dataBound:function(e) {

                 var invcTotAmt = 0;
                 var dcRate = vatCd;

                 var rows = e.sender.tbody.children();

                 $.each(rows, function(idx, row){
                     var row = $(rows[idx]);
                     var dataItem = e.sender.dataItem(row);

                     if( dataItem != null && dataItem != 'undefined'){
                         dcRate = dataItem.dcRate;
                         invcTotAmt += dataItem.invcTotAmt;
                     }
                 });

                 $("#dcRate").data("kendoExtNumericTextBox").value(dcRate);
                 $("#grTotAmt").data("kendoExtNumericTextBox").value(invcTotAmt);

             }
             ,columns:[
                       {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                       ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                       ,sortable:false
                       ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                   }
                       ,{field:"boxNo" ,title:"<spring:message code='par.lbl.boxNo' />" ,width:80, hidden:true}//BOX NO
                       ,{field:"bmpOrdNo", title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:100, hidden:true}//BMP구매오더번호
                       ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:90, hidden:true}//구매신청일
                       ,{field:"ordRegUsrId", title:"<spring:message code='par.lbl.ordRegId' />" ,width:120, hidden:true }//오더신청자
                       ,{field:"purcOrdLineDetlNo" ,title:"<spring:message code='par.lbl.mvtLineNo' />" ,attributes:{ "class":"ar"} ,width:200 ,sortable:false}//라인구분자
                       ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:180}//부품번호
                       ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />" ,width:200 ,sortable:false }//부품명
                       ,{field:"invcUnitCd", title:"<spring:message code='par.lbl.stockUnitCd' />" ,width:120}//단위
                       ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:140, hidden:true}//모비스송장번호
                       ,{field:"invcTp" ,title:"<spring:message code='par.lbl.invcTp' />" ,attributes:{ "class":"ac"} ,width:120
                           ,template:'#= changeInvcTp(invcTp)#', hidden:true
                       }//송장유형
                       ,{field:"invcDt" ,title:"<spring:message code='par.lbl.invcDt' />" ,width:100 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}, hidden:true}//INVOICE일자
                       ,{field:"invcStatCd", title:"<spring:message code='par.lbl.invcStatCd' />" ,width:80 ,attributes:{ "class":"ac"}
                            ,template:'#= changeInvcStat(invcStatCd)#', hidden:true
                       }//송장상태
                       ,{field:"invcTargetQty" ,title:"<spring:message code='par.lbl.invcQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false, hidden:true}//송장수량
                       ,{field:"purcQty" ,title:"<spring:message code='par.lbl.purcQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false, hidden:true}//오더수량
                       ,{field:"invcQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false
                            ,editor:changeInvcQtyEditor
                       }//입고수량
                       ,{field:"compareQty" ,title:"<spring:message code='par.lbl.gapQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false
                           ,template:'#= changeCompareQty(compareQty)#'
                       }//차이수량
                       ,{field:"reqCont" ,title:"<spring:message code='par.lbl.reasonCont' />" ,width:140, hidden:true}//차이사유
                       ,{field:"grStrgeCd" ,title:"<spring:message code='par.lbl.grStrgeCd' />" ,width:160 ,sortable:false
                           ,editor:grStrgeCdDropDownEditor
                           ,template:'#= changeGrStrgeCd(grStrgeCd)#'
                       }//입고창고
                       ,{field:"grLocCd" ,title:"<spring:message code='par.lbl.locationCd' />" ,width:160 ,sortable:false
                           ,editor:grLocCdDropDownEditor
                           ,template:'#= changeGrLocCd(grStrgeCd, grLocCd)#'
                       }//로케이션
                       ,{field:"invcPrc" ,title:"<spring:message code='par.lbl.grItemPrice' />" ,width:130 ,attributes:{ "class":"ar"} ,format:"{0:n2}"
                           ,editor:changeInvcQtyEditor
                           ,attributes:{"class":"ar"}
                           ,format:"{0:n2}"
                           ,aggregates:["sum"]
                           ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
                       }//입고단가(포함)
                       ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.grItemPriceTax' />" ,width:130
                           ,attributes:{ "class":"ar"}
                           ,format:"{0:n2}"
                           ,aggregates:["sum"]
                           ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
                       }//입고단가(세금미포함)
                       ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:130
                           ,attributes:{ "class":"ar"}
                           ,format:"{0:n2}"
                           ,aggregates:["sum"]
                           ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
                       }//입고금액
                       ,{field:"invcAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:130
                           ,attributes:{ "class":"ar"}
                           ,format:"{0:n2}"
                           ,aggregates:["sum"]
                           ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
                       }//입고금액(세금제외)
                       ,{field:"dcRate" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:130 ,attributes:{ "class":"ar"} ,format:"{0:n2}", hidden:true}//할인율
                   ]
               });
         //grid height reset.
         gridHeight();

         //  송장유형
         changeInvcTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcTpObj[val];
             }
             return returnVal;
         };

         // 송장상태
         changeInvcStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcStatObj[val];
             }
             return returnVal;
         };


         // 입고 창고
         changeGrStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = grStrgeTpObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeGrLocCd = function(strgeCd, locCd){
             var returnVal = "";
             if(locCd != null && locCd != ""){
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
             if(val != null && val != ""){
                 returnVal = claimTpObj[val];
             }
             return returnVal;
         };



         // 가격유형
         changePrcTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = prcTpObj[val];
             }
             return returnVal;
         };

         //단위
         changeInvcUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 //returnVal = invcUnitObj[val];
             }
             return returnVal;
         };

         //  오더유형
         changePurcOrdTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdTpObj[val];
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

        $("#btnPrint").data("kendoButton").enable(false);

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

        }else{
            $("#mobisInvcNo").attr("disabled", false);
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }

        if(!dms.string.isEmpty($("#bpCd").val())){
            $("#btnAddPurcOrd").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
        }else{
            $("#btnAddPurcOrd").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
        }

        $("#btnSave").data("kendoButton").enable(true);

        $("#dcRate").data("kendoExtNumericTextBox").value(null);
        $("#grTotAmt").data("kendoExtNumericTextBox").value(null);

        if(pItemDistinCd === '07'){
            $("#grid thead [data-field=itemCd]").text("<spring:message code='par.lbl.toolCd' />");
            $("#grid thead [data-field=itemNm]").text("<spring:message code='par.lbl.toolNm' />");
        }


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
                    , "bpTp":$("#bpTp").val()
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"multiple"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            popItemData  = {},
                            itemList     = [],
                            dcRate       = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            lDcRate      = Number(dcRate) + 1,
                            tDate,
                            rows;



                        for(var i = 0; i < dataLen; i = i + 1){
                            itemList.push(data[i].itemCd);
                        }
                        console.log('itemList:',itemList,data);
                        fnSetLocCdObj(itemList);

                        for(var i = 0; i < dataLen; i = i + 1){
                            //내용

                            popItemData.dlrCd              = data[i].dlrCd;
                            popItemData.dlPdcCd            = "";
                            popItemData.purcOrdTp          = "01";
                            popItemData.prcTp              = "01";
                            popItemData.invcTp             = "01";
                            popItemData.invcStatCd         = "02";
                            popItemData.invcDocNo          = "";
                            popItemData.invcDt             = toDate;
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
                            popItemData.invcTargetQty      = 0;
                            popItemData.compareQty         = 0;
                            popItemData.invcPrc            = data[i].purcPrc;
                            //popItemData.invcIncTaxPrc      = (data[i].purcPrc + (data[i].purcPrc * vatCd));
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
                            popItemData.grLocCd            = "";
                            popItemData.claimQty           = 0;
                            popItemData.claimTp            = "";
                            popItemData.claimTargCd        = "";
                            popItemData.dlBpCd             = "";
                            popItemData.dlBpNm             = "";
                            popItemData.reqCont            = "";
                            popItemData.dcRate             = $("#dcRate").data("kendoExtNumericTextBox").value();


                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;;
                                gridData.dataSource.add(popItemData);
                            }
                        }

                        gridData.select(gridData.tbody.find(">tr"));
                        itemByBpCdPopupWindow.close();
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
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":$("#bpCd").val()
                    ,"bpNm":$("#bpNm").val()
                    ,"bpTp":$("#bpTp").val()
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
                                $("#dcRate").data("kendoExtNumericTextBox").readonly(false);
                                $("#btnAddPurcOrd").data("kendoButton").enable(true);
                            //부품&악세사리인 경우 BMP 구매일 때 구매참조 버튼 막음.
                            }else{
                                $("#dcRate").data("kendoExtNumericTextBox").value(vatCd);
                                $("#dcRate").data("kendoExtNumericTextBox").readonly();
                                $("#btnAddPurcOrd").data("kendoButton").enable(false);
                            }

                            $("#btnInvcListPop").data("kendoButton").enable(true);
                        }else{
                            $("#dcRate").data("kendoExtNumericTextBox").readonly(false);
                            $("#btnInvcListPop").data("kendoButton").enable(false);
                            $("#btnAddPurcOrd").data("kendoButton").enable(true);
                        }

                        $("#btnExcelUpload").data("kendoButton").enable(true);
                        $("#btnAddItem").data("kendoButton").enable(true);
                        $("#btnDelItem").data("kendoButton").enable(true);

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
                    , "bpTp":$("#bpTp").val()
                    , "itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            itemList     = [],
                            dcRate       = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            lDcRate      = Number(dcRate) + 1,
                            popPrevData  = {};


                        for(var i = 0; i < dataLen; i = i + 1){
                            itemList.push(data[i].itemCd);
                        }
                        console.log('itemList:',itemList,data);
                        fnSetLocCdObj(itemList);

                        for(var i = 0; i < dataLen; i = i + 1){

                            // 구매오더 조회.
                            //selectCopyPurcOrd(data[i].purcOrdNo);


                        //}
                            popPrevData.dlrCd              = data[i].dlrCd;
                            popPrevData.dlPdcCd            = "";
                            popPrevData.purcOrdTp          = "01";
                            popPrevData.invcTp             = "01";
                            popPrevData.invcStatCd         = "02";
                            popPrevData.prcTp              = data[i].prcTp;
                            popPrevData.invcDocNo          = "";
                            popPrevData.invcDt             = toDate;
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
                            popPrevData.invcTargetQty      = 0;
                            popPrevData.compareQty         = 0;
                            popPrevData.invcPrc            = data[i].purcPrc;
                            popPrevData.dcRate             = dcRate;
                            //popPrevData.invcIncTaxPrc      = 0;//(data[i].purcPrc + (data[i].purcPrc * vatCd));
                            popPrevData.invcTotAmt         = data[i].purcAmt;
                            popPrevData.invcAmt            = data[i].purcAmt / lDcRate;
                            popPrevData.taxAmt             = data[i].purcAmt - (data[i].purcAmt / lDcRate);
                            popPrevData.taxDdctPrc         = data[i].purcPrc  / lDcRate;
                            popPrevData.grStrgeCd          = data[i].grStrgeCd;
                            popPrevData.grLocCd            = "";
                            popPrevData.claimQty           = 0;
                            popPrevData.claimTp            = "";
                            popPrevData.claimTargCd        = "";
                            popPrevData.dlBpCd             = "";
                            popPrevData.dlBpNm             = "";
                            popPrevData.reqCont            = "";

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;;
                                gridData.dataSource.add(popPrevData);
                            }
                        }
                        prevPurcOrdPopupWindow.close();

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
                    , "bpTp":$("#bpTp").val()
                    , "invcStatCd":'02'
                    , "itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        $("#mobisInvcNo").val(data[0].mobisInvcNo);
                        $("#invcDocNo").val(data[0].invcDocNo);
                        $("#arrvDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].arrvDt));
                        $("#confirmDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].confirmDt));

                        $("#btnExcelUpload").data("kendoButton").enable(false);
                        $("#btnAddItem").data("kendoButton").enable(false);
                        $("#btnDelItem").data("kendoButton").enable(false);

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
                lDcRate      = Number($("#dcRate").data("kendoExtNumericTextBox").value()) + 1,
                popPrevData  = {};

            for(var i = 0; i < dataLen; i = i + 1){
                itemList.push(data[i].itemCd);
            }
            console.log('itemList:',itemList,data);
            fnSetLocCdObj(itemList);

            for(var i = 0; i < dataLen; i = i + 1){

                popPrevData.dlrCd              = result.data[i].dlrCd;
                popPrevData.dlPdcCd            = "";
                popPrevData.purcOrdTp          = "01";
                popPrevData.invcTp             = "01";
                popPrevData.invcStatCd         = "02";
                popPrevData.prcTp              = result.data[i].prcTp;
                popPrevData.invcDocNo          = "";
                popPrevData.invcDt             = toDate;
                popPrevData.purcOrdNo          = "";
                popPrevData.purcOrdLineNo      = null;
                popPrevData.bmpOrdNo          = "";
                popPrevData.bmpOrdLineNo      = null;
                popPrevData.purcOrdLineDetlNo = "";
                popPrevData.mobisInvcNo        = "";
                popPrevData.mobisInvcLineNo    = null;
                popPrevData.itemCd             = result.data[i].itemCd;
                popPrevData.itemNm             = result.data[i].itemNm;
                popPrevData.invcUnitCd         = result.data[i].purcUnitCd;
                popPrevData.invcQty            = result.data[i].purcQty;
                popPrevData.invcTargetQty      = 0;
                popPrevData.compareQty         = 0;
                popPrevData.invcPrc            = result.data[i].purcPrc;
                popPrevData.dcRate             = $("#dcRate").data("kendoExtNumericTextBox").value();
                popPrevData.invcTotAmt         = result.data[i].purcAmt;
                popPrevData.invcAmt            = result.data[i].purcAmt / lDcRate;
                popPrevData.taxAmt             = result.data[i].purcAmt - (result.data[i].purcAmt / lDcRate);
                popPrevData.taxDdctPrc         = result.data[i].purcPrc / lDcRate;
                popPrevData.grStrgeCd          = result.data[i].grStrgeCd;
                popPrevData.grLocCd            = "";
                popPrevData.claimQty           = 0;
                popPrevData.claimTp            = "";
                popPrevData.claimTargCd        = "";
                popPrevData.dlBpCd             = "";
                popPrevData.dlBpNm             = "";
                popPrevData.reqCont            = "";

                if(existItemChkObj.hasOwnProperty(result.data[i].itemCd)){
                    //이미 등록되어있는 부품입니다.
                    var itemInfo = result.data[i].itemCd + '[' + result.data[i].itemNm + ']';
                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                }else{
                    existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;;
                    gridData.dataSource.add(popPrevData);
                }
            }

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
                    , "bpTp":$("#bpTp").val()
                    , "selectable":"single"
                    , "callbackFunc":function(data){
                        if(data.length === 1)
                        {
                            $("#grDocNo").val(data[0].invcDocNo);

                            if(!dms.string.isEmpty(data[0].mobisInvcNo)){
                                $("#grTp").data("kendoExtDropDownList").value('01');
                                //$("#grid").data("kendoExtGrid").dataSource.read();
                            }else{
                                $("#grTp").data("kendoExtDropDownList").value('02');
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

        console.log('selectReceiveCnfm:',grDocNo);
        console.log('selectReceiveCnfm:',grDocNo);
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
                console.log('selectReceiveCnfm result:', result);

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

                $.ajax({
                    url:"<c:url value='/par/pcm/invc/selectReceiveCnfmItemByInvcKey.do' />",
                    data:JSON.stringify({ sInvcDocNo:grDocNo}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {
                    var datalen = result.data.length;

                    console.log('result.data:',result.data);

                    $("#grid").data("kendoExtGrid").dataSource.data([]);
                    $("#grid").data("kendoExtGrid").dataSource.data(result.data);

                    $("#btnAddPurcOrd").data("kendoButton").enable(false);
                    $("#btnExcelUpload").data("kendoButton").enable(false);
                    $("#btnAddItem").data("kendoButton").enable(false);
                    $("#btnDelItem").data("kendoButton").enable(false);
                    $("#btnInvcListPop").data("kendoButton").enable(false);
                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnPrint").data("kendoButton").enable(true);

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
                console.log('selectReceiveCnfm result:', result);

                //$("#regUsrId").val(result.regUsrId);
                //$("#invcGrDt").data("kendoExtMaskedDatePicker").value(result.invcGrDt);
                //$("#invcDocNo").val(result.invcDocNo);
                //$("#dcRate").data("kendoExtNumericTextBox").value(result.dcRate);
                //$("#grTotQty").data("kendoExtNumericTextBox").value(result.grTotQty);
                //$("#claimTotQty").data("kendoExtNumericTextBox").value(result.claimTotQty);
                //$("#grTotAmt").data("kendoExtNumericTextBox").value(result.grTotAmt);

                if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);


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

                        console.log('result.data:',result.data);

                        $("#grid").data("kendoExtGrid").dataSource.data([]);
                        $("#grid").data("kendoExtGrid").dataSource.data(result.data);


                        $("#btnAddPurcOrd").data("kendoButton").enable(false);
                        $("#btnExcelUpload").data("kendoButton").enable(false);
                        $("#btnAddItem").data("kendoButton").enable(false);
                        $("#btnDelItem").data("kendoButton").enable(false);
                        $("#btnInvcListPop").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnPrint").data("kendoButton").enable(true);

                        $("#dcRate").data("kendoExtNumericTextBox").readonly();

                    });

            });
        }


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

               console.log('result:',result);
               if(result.total > 0){
                   for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                       if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                           if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){

                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }else{
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }

                           //locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
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
               console.log('locationObj:',locationObj);
               console.log('locationListObj:',locationListObj);

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
            lDcRate       = Number(pDcRate) + 1;

        console.log('fnChangeDcRate:',pDcRate);
        console.log('arguments:',arguments);

        if(rows.length  == 0 ){
            // 선택값이 없습니다.
            dms.notification.warning("<spring:message code='global.info.unselected' />");
            return false;
        }

        rows.each(function(index, row) {
            var dataItem = $("#grid").data("kendoExtGrid").dataSource.data()[index],
                gridData = grid.dataSource.at(index);

            console.log('gridData:',gridData.model);
            dataItem.set('dcRate',pDcRate);
            dataItem.set('invcAmt',(gridData.invcPrc * gridData.invcQty) / lDcRate);
            dataItem.set('taxAmt',(gridData.invcPrc * gridData.invcQty) - ((gridData.invcPrc * gridData.invcQty) / lDcRate));
            dataItem.set('taxDdctPrc',gridData.invcPrc  / lDcRate);

        });
    }
</script>
<!-- //script -->
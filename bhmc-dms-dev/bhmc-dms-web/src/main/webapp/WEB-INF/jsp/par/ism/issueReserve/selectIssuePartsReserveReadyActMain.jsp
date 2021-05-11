<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">
<!-- issueReqResvReadyAct -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.issueReqResvReadyAct" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11702" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnInit" name="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
                <button type="button" id="btnInvResvReadyActCancelBatch" name="btnSearch" class="btn_m btn_m_min hidden"><span><spring:message code="par.btn.invResvReadyActCancelBatch" /></span></button><!--부품예류취소배치실행  -->
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11701" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvResvReadyActSave" name="btnInvResvReadyActSave" class="btn_m btn_m_min" ><spring:message code="par.btn.save" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11700" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvResvReadyAct" name="btnInvResvReadyAct" class="btn_m btn_m_min" ><spring:message code="par.btn.invResvReadyAct" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11699" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInvResvReadyActCancel" name="btnInvResvReadyActCancel" class="btn_m btn_m_min" ><spring:message code="par.btn.invResvReadyActCancel" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11698" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" name="btnPrint" class="btn_m btn_print btn_m_min" ><spring:message code="par.btn.print" /></button><!--btnSearch  -->
            </dms:access>
            <dms:access viewId="VIEW-D-11697" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </dms:access>
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carNo" /></th>
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvReqDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvReqStartDt" name="sInvResvReqStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvReqEndDt" name="sInvResvReqEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvPartWorkDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvReqWorkStartDt" name="sInvResvReqWorkStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvReqWorkEndDt" name="sInvResvReqWorkEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvActDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvActStartDt" name="sInvResvActStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvActEndDt" name="sInvResvActEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.vin" /></th>
                    <td>
                        <input id="sVin" name="sVin" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvDocNo" /></th>
                    <td>
                        <input id="sResvDocNo" name="sResvDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvPartDocNo" /></th>
                    <td>
                        <input id="sResvPeDocNo" name="sResvPeDocNo" class="form_input" />

                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvActCancelDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sInvResvActCancelStartDt" name="sInvResvActCancelStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvResvActCancelEndDt" name="sInvResvActCancelEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.visitNm" /></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvManNm" /></th>
                    <td>
                        <input id="sResvUsrNm" name="sResvUsrNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvPartManNm" /></th>
                    <td>
                        <input id="sPartsResvUsrNm" name="sPartsResvUsrNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.invResvActManNm" /></th>
                    <td>
                        <input id="sReadyUsrNm" name="sReadyUsrNm" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                    <td>
                        <input type="text" id="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                    <td>
                        <input id="sItemNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.strgeCd" /><!-- 창고 --></th>
                    <td>
                        <input type="text" id="sStrgeCd" type="text" data-type="multicombo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.readyActStatCd" /><!-- 예류상태 --></th>
                    <td>
                        <input type="text" id="sReadyStatCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="hidden">
        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
        <input type="hidden" id="parGiTp" name="parGiTp" />
        <input type="hidden" id="resvDocNo" name="resvDocNo" />
        <input type="hidden" id="resvPeDocNo" name="resvPeDocNo" />
        <input type="hidden" id="readyDocNo" name="readyDocNo" />
        <input type="hidden" id="custCd" name="custCd" />
        <input type="hidden" id="custNm" name="custNm" />
        <input type="hidden" id="vinNo" name="vinNo" />
        <input type="hidden" id="carNo" name="carNo" />
    </div>

    <!-- // tab start-->
    <div id="tabstrip" class="tab_area">
    <ul>
        <li id ="tabInvResvInfo" class="k-state-active"><spring:message code="par.title.invResvInfo" /></li>
        <li id ="tabInvResvActInfo"><spring:message code="par.title.invResvActInfo" /></li>
        <li id ="tabInvResvOtherInfo"><spring:message code="par.title.invResvOtherInfo" /></li>
    </ul>

    <span class="btn_right_absolute">
    <dms:access viewId="VIEW-D-11696" hasPermission="${dms:getPermissionMask('READ')}">
        <button type="button" id="btnPakage" name="btnPakage" class="btn_s btn_s_min5"><spring:message code="par.btn.pakage" /><!-- btnPakage --></button>
    </dms:access>
    <dms:access viewId="VIEW-D-11695" hasPermission="${dms:getPermissionMask('READ')}">
        <button type="button" id="btnPartsAdd" name="btnPartsAdd" class="btn_s btn_s_min5"><spring:message code="par.btn.rowAdd" /></button><!--rowAdd  -->
    </dms:access>
    <dms:access viewId="VIEW-D-11694" hasPermission="${dms:getPermissionMask('READ')}">
        <button type="button" id="btnDel" name="btnDel" class="btn_s btn_s_min5"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
    </dms:access>
    </span>

    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                </div>
            </div>
            <div class="table_grid">
                <!-- targetReqDetailGrid -->
                <div id="targetReqDetailResvGrid" class="resizable_grid"></div>
                <!-- targetReqDetailGrid -->
            </div>
        </section>
    </div>

    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                </div>
            </div>
            <div class="table_grid">
                <div id="targetReqDetailResvActGrid" class="resizable_grid"></div>
            </div>
        </section>
    </div>

    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                </div>
            </div>
            <div class="table_grid">
                <div id="targetReqDetailResvOtherGrid" class="resizable_grid"></div>
            </div>
        </section>
    </div>

    <div class="hidden mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right btn_right_v1">
                    &nbsp;
                </div>
            </div>
            <div class="table_grid">
                <div id="targetLbrGrid" ></div>
            </div>
        </section>
    </div>

</div>
<!-- // tab end -->

</section>
<!-- //issueReqResvReadyAct -->

</div>

<!-- script -->
<script>
    //readyStatCdList
    var readyStatCdList = [],
        readyStatCdAllList = [],
        gVatCd = Number("${vatCd}");
    <c:forEach var="obj" items="${readyStatCdList}">
    //준비상태코드 : 준비[02], 준비취소 외 [04] 상태코드
    if("${obj.cmmCd}" != "02" && "${obj.cmmCd}" != "04"){
        readyStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    readyStatCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var readyStatCdMap = {};
    $.each(readyStatCdAllList, function(idx, obj){
        readyStatCdMap[obj.cmmCd] = obj.cmmCdNm;
    });

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
       // gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);
    //giStrgeCdList
    var giStrgeCdList = [];
    <c:forEach var="obj" items="${giStrgeCdList}">
    giStrgeCdList.push({
        "strgeCd":"${obj.strgeCd}"
        ,"strgeNm":"${obj.strgeNm}"
    });
    </c:forEach>
    var giStrgeCdMap = {};
    $.each(giStrgeCdList, function(idx, obj){
        giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
    });
    //location Array
    var locCdList = [];
    <c:forEach var="obj" items="${locCdList}">
    locCdList.push({
        "locCd":"${obj.locCd}"
        ,"locNm":"${obj.locCd}"
    });
    </c:forEach>
    var locCdMap = {};
    $.each(locCdList, function(idx, obj){
        locCdMap[obj.locCd] = obj.locNm;
    });

    var searchStorageCdList = [],
    storageCdList = [],
    storageObj = {};
    //창고 선택
    searchStorageCdList.push({"cmmCd":" ", "cmmCdNm":"<spring:message code='par.lbl.checkClearAll' />", "useYn":""});
    storageCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${giStrgeCdList}" varStatus="status"> //key value
        searchStorageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        storageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    var checkedIds01 = {},
    checkedIds02 = {};

    //page init Func
    function pageInit(){
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


        $("#sCarNo").val("");
        $("#sVin").val("");
        $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvReqWorkStartDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvReqWorkEndDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").value("");
        $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").value("");

        $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sInvResvReqWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sInvResvReqWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        $("#sResvDocNo").val("");
        $("#resvDocNo").val("");

        $("#sResvPeDocNo").val("");
        $("#resvPeDocNo").val("");

        $("#parReqDocNo").val("");

        $("#sCustNm").val("");
        $("#sResvUsrNm").val("");
        $("#sPartsResvUsrNm").val("");
        $("#sReadyUsrNm").val("");

        $("#sItemCd").val("");
        $("#sItemNm").val("");
        $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value("");
        $("#sReadyStatCd").data("kendoExtDropDownList").select(0);

        $("#targetReqDetailResvGrid").data("kendoExtGrid").dataSource.data([]);
        $("#targetReqDetailResvActGrid").data("kendoExtGrid").dataSource.data([]);
        $("#targetReqDetailResvOtherGrid").data("kendoExtGrid").dataSource.data([]);

        var gridObj = getSelectedGridObj(),
        parGiTp = gridObj.parGiTp;

        //button disable
        if(parGiTp === "OT"){
            buttonEnableDisable(false, true, null);
        }else{
            buttonEnableDisable(false, false, null);
        }

        //checked items
        checkedIds01 = {},
        checkedIds02 = {};
    }
    //buttonEnableDisable Func
    function buttonEnableDisable(bFlag,otherFlag,readyStatCd){
        $("#btnInvResvReadyAct").data("kendoButton").enable(bFlag);
        $("#btnInvResvReadyActCancel").data("kendoButton").enable(bFlag);
        $("#btnInvResvReadyActSave").data("kendoButton").enable(bFlag);

        //준비상태 취소/정비대기/확정일때 버튼 비활성화.
        if(readyStatCd == "05" || readyStatCd == "06" || readyStatCd == "07"){
            $("#btnInvResvReadyAct").data("kendoButton").enable(false);
            $("#btnInvResvReadyActCancel").data("kendoButton").enable(false);
            $("#btnInvResvReadyActSave").data("kendoButton").enable(false);
        }

        $("#btnPakage").data("kendoButton").enable(bFlag);
        $("#btnPartsAdd").data("kendoButton").enable(bFlag);
        $("#btnDel").data("kendoButton").enable(bFlag);

        $("#btnPakage").data("kendoButton").enable(otherFlag);
        $("#btnPartsAdd").data("kendoButton").enable(otherFlag);
        $("#btnDel").data("kendoButton").enable(otherFlag);

    }
    //package popup Func
    var selectIssueWorkPackagePopup;
    function selectWorkPackagePopupWindow(){
        selectIssueWorkPackagePopup = dms.window.popup({
            windowId:"selectIssueWorkPackagePopup"
            ,width:700
            ,height:350
            ,modal:true
            ,title:"<spring:message code='par.lbl.pakage' />"   //pakage
            ,content:{
                url:"<c:url value='/par/cmm/selectIssuePackageWorkPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"selectable":"multiple"
                    ,"pkgTp":"02"//패키지유형코드 : 02(부품)
                    ,"callbackFunc":function(parData, lbrData){
                        //partItems, lbrItems Add Func call
                        setPartsItemsAndLbrItems(parData, lbrData, "P");
                        selectIssueWorkPackagePopup.close();
                    }
                }
            }
        });
    }
    //PartItemLbrItem Add Func
    function setPartsItemsAndLbrItems(parData, lbrData, itemSendTp){
        //parts Item add
        var itemPartsCheckCnt = 0;
        for(var i=0; i<parData.length; i++){
            var data = parData[i];
            var sRnum = 1;
            var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
            var tabIndex = tabStrip.select().index()

            var grid = null;
            if(tabIndex === 0){//service reserve
                grid = $("#targetReqDetailResvGrid").data("kendoExtGrid");
            }else if(tabIndex === 1){//service parts
                grid = $("#targetReqDetailResvActGrid").data("kendoExtGrid");
            }else if(tabIndex === 2){//other reserve
                grid = $("#targetReqDetailResvOtherGrid").data("kendoExtGrid");
            }else{
                return false;
            }

            var itemQty = 1;
            var salePrcAmt = 0;
            var unitCd = "EA";

            if(itemSendTp == "P"){//type package
                unitCd = data.itemUnitCd;
                itemQty = data.itemQty;
                salePrcAmt = data.itemPrc;
            }else if(itemSendTp == "I"){//type general
                unitCd = data.stockUnitCd;
                itemQty = data.giQty;
                salePrcAmt = data.salePrcAmt;
            }

            var vItemQty = itemQty;// 기본 출고수량 -1
            var vItemPrc = salePrcAmt;
            var vItemAmt = vItemPrc * vItemQty;
            var vTaxDdctAmt = kendo.parseFloat(vItemPrc / ( 1 + gVatCd )) * vItemQty;
            var vTaxAmt = vItemAmt - vTaxDdctAmt;

            var IssueReqDetailVO = {
                "rnum":sRnum
                ,"dlrCd":null
                ,"pltCd":null
                ,"parReqDocNo":""
                ,"parReqDocLineNo":sRnum
                ,"parReqStatCd":"01"
                ,"purcReqNo":"01"
                ,"reqStrgeCd":data.giStrgeCd//TODO:[InBoShim] 입고창고 출고창고 대체.
                ,"cancYn":"N"
                ,"parGiTp":"OT"
                ,"roDocNo":""
                ,"roLineNo":sRnum
                ,"resvDocNo":""
                ,"resvDocLineNo":sRnum
                ,"grStrgeCd":data.giStrgeCd
                ,"giStrgeCd":data.giStrgeCd//TODO:[InBoShim] 입고창고 출고창고 대체.
                ,"giLocCd":""
                ,"dbItemCd":data.itemCd
                ,"pkgDocNo":data.pkgDocNo
                ,"pkgItemCd":data.pkgItemCd
                ,"itemCd":data.itemCd
                ,"itemNm":data.itemNm
                ,"unitCd":unitCd
                ,"reqQty":itemQty
                ,"endQty":itemQty
                ,"totStockQty":data.stockQty
                ,"avlbStockQty":data.avlbStockQty
                ,"resvStockQty":data.resvStockQty
                ,"clamStockQty":null
                ,"rentQty":data.rentQty
                ,"borrowStockQty":data.borrowQty
                ,"grScheQty":data.grScheQty
                ,"giScheQty":data.giScheQty
                ,"resvQty":itemQty
                ,"purcReqDt":null
                ,"giDocNo":""
                ,"giDocTp":""
                ,"giDocStatCd":"01"
                ,"dbYn":"N"
                ,"itemPrc":vItemPrc
                ,"movingAvgPrc":data.movingAvgPrc
                ,"movingAvgAmt":data.movingAvgPrc * vItemQty
                ,"itemAmt":kendo.parseFloat(kendo.toString(vItemAmt,'n2'))
                ,"taxDdctAmt":kendo.parseFloat(kendo.toString(vTaxDdctAmt,'n2'))
                ,"taxAmt":kendo.parseFloat(kendo.toString(vTaxAmt,'n2'))
                ,"receiveDt":null
                ,"receiveId":""
                ,"returnPartsQty":0
                ,"returnDt":null
                ,"returnId":""
                ,"etcGiTp":""
                ,"readyStatCd":"01"
                ,"readyDocNo":""
                ,"readyRegDt":null
                ,"readyRegEndDt":null
                ,"readyRegDtString":null
                ,"readyUsrId":""
                ,"readyUsrNm":""
                ,"readyRemark":""
                ,"readyCancRegDt":null
                ,"readyCancRegDtString":null
                ,"readyCancUsrId":""
                ,"readyCancUsrNm":""
                ,"readyCancRemark":""
                ,"regUsrId":""
                ,"regDt":null
                ,"updtUsrId":""
                ,"updtDt":null
            }
            grid.dataSource.insert(IssueReqDetailVO).set("dirty", true);
            itemPartsCheckCnt++;
        }
        //부품추가 시 메시지 알람 처리.
        if(itemPartsCheckCnt > 0){
            dms.notification.success("<spring:message code='par.info.partsInsertMsg'/>");
        }

        //lbr Item add
        for(var j=0; j<lbrData.length; j++){
            var data = lbrData[j];
            if(data.lbrCd !== ""){
                var itemCheckCnt = 0;
                var lbrGrid = $("#targetLbrGrid").data("kendoExtGrid");
                var sRnum = lbrGrid.dataSource.total();
                lbrGrid.tbody.find('>tr').each(function(){
                    var dataItem = lbrGrid.dataItem(this);
                    if(dataItem.lbrCd === data.lbrCd){
                        itemCheckCnt++;
                    }
                });

                if(itemCheckCnt === 0){
                    var lbrVO = {
                        rnum:sRnum + 1
                        ,dlrCd:null
                        ,roTp:"01"
                        ,docNo:$("#resvDocNo").val()
                        ,lbrCd:data.lbrCd
                        ,lbrNm:data.lbrNm
                        ,lbrTp:data.lbrTp
                        ,lbrPrc:data.lbrPrc
                        ,lbrHm:data.lbrHm
                        ,dstbHm:null
                        ,dcAmt:null
                        ,lbrTotAmt:null
                        ,lineNo:null
                    }
                    $("#targetLbrGrid").data("kendoExtGrid").dataSource.add(lbrVO);
                }
            }
        }
    }

    function selectPartsMasterPopupWindow(){

        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"selectShareStockGiItemPopupWindow"
            ,width:900
            ,height:550
            ,modal:true
            ,title:""
            ,content:{
                url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"itemCd":null
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){
                        if(data.length > 0){

                            setPartsItemsAndLbrItems(data,[{}],"I");

                            selectShareStockGiItemPopupWindow.close();
                        }
                    }
                }
            }
        });
    }

    //그리드 재조회.
    function selectDataSourceGridReload(){
        $("#targetReqDetailResvGrid").data("kendoExtGrid").dataSource.read();
        $("#targetReqDetailResvActGrid").data("kendoExtGrid").dataSource.read();
        $("#targetReqDetailResvOtherGrid").data("kendoExtGrid").dataSource.read();
    }

    //updateIssueResvReadySaves Func.
    function updateIssueResvReadySaves(gridObj, selectedItems, readyStatCd){

        var grid = gridObj.grid,
        vParGiTp = gridObj.parGiTp;

        var multiIssueResvReadyDetails = { insertList:[], updateList:selectedItems, deleteList:[] };

        var issueReqDetailSaveVO = {
            "issueReqVO":{
                "dlrCd":null
                ,"parReqDocNo":$("#parReqDocNo").val()
                ,"parGiTp":vParGiTp
                ,"parReqStatCd":"01"
                ,"cancYn":"N"
                ,"roDocNo":$("#roDocNo").val()
                ,"resvDocNo":$("#resvDocNo").val()
                ,"pltCd":null
                ,"serPrsnId":$("#serPrsnId").val()
                ,"custCd":$("#custCd").val()
                ,"custNm":$("#custNm").val()
                ,"vinNo":$("#vinNo").val()
                ,"carNo":$("#carNo").val()
                ,"carlineCd":null
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":null
                ,"readyStatCd":readyStatCd
            }
            ,"issueReqDetailVO":multiIssueResvReadyDetails
            ,"repairOrderLaborVO":null
            ,"reservationLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
        }

        $.ajax({
            url:"<c:url value='/par/ism/issueReserve/multiIssueResvReadyDetails.do' />"
            ,data:JSON.stringify(issueReqDetailSaveVO)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                //error raise after grid refresh
                if(readyStatCd === "03"){//예류시 에러발생 시 그리드 재조회.
                    selectDataSourceGridReload();
                }

            }
            ,success:function(jqXHR, textStatus){
                // destroy data clear and data reload
                grid.dataSource._destroyed = [];
                selectDataSourceGridReload();
                // success message
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    }

    //updateIssueResvReadyOtherSaves Func.
    function updateIssueResvReadyOtherSaves(gridObj, selectedItems, readyStatCd){

        var grid = gridObj.grid,
        vParGiTp = gridObj.parGiTp;

        var multiIssueResvReadyDetails = { insertList:[], updateList:selectedItems, deleteList: grid.getCUDData("insertList", "updateList", "deleteList").deleteList };

        var issueReqDetailSaveVO = {
            "issueReqVO":{
                "dlrCd":null
                ,"parReqDocNo":$("#parReqDocNo").val()
                ,"parGiTp":vParGiTp
                ,"parReqStatCd":"01"
                ,"cancYn":"N"
                ,"roDocNo":$("#roDocNo").val()
                ,"resvDocNo":$("#resvDocNo").val()
                ,"pltCd":null
                ,"serPrsnId":$("#serPrsnId").val()
                ,"custCd":$("#custCd").val()
                ,"custNm":$("#custNm").val()
                ,"vinNo":$("#vinNo").val()
                ,"carNo":$("#carNo").val()
                ,"carlineCd":null
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":null
                ,"readyStatCd":readyStatCd
            }
            ,"issueReqDetailVO":multiIssueResvReadyDetails
            ,"repairOrderLaborVO":null
            ,"reservationLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
        }

        $.ajax({
            url:"<c:url value='/par/ism/issueReserve/multiIssueResvOtherReadyDetails.do' />"
            ,data:JSON.stringify(issueReqDetailSaveVO)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                // destroy data clear and data reload
                grid.dataSource._destroyed = [];
                grid.dataSource.read();
                // success message
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    }

    //reserveready popup Func
    var issueReserveReadyPopupButtonWindow;
    var userSearchPopupWin;
    function selectIssueReserveReadyPopupButtonWindow(gridObj, selectedItems, readyStatCd){

        var parGiTp = gridObj.parGiTp,
        sReadyUsrId ="",
        sReadyUsrNm ="",
        carNo = "";
        /*
         * 부품출고유형 : 예약처리(SR),부품예약(SP)
                  부품준비상태 : 예류(03)
                  일때만 차량번호 가져오기.
         */
        if(parGiTp != "OT" || readyStatCd != "03"){
            carNo = $("#carNo").val();
        }

        issueReserveReadyPopupButtonWindow = dms.window.popup({
            windowId:"issueReserveReadyPopupButtonWindow"
            ,title:""
            ,width:400
            ,height:350
            ,modal:true
            ,close:function(e){
                if(userSearchPopupWin != null){
                    userSearchPopupWin.close();
                }
            }
            ,content:{
                url:"<c:url value='/par/ism/issueReq/selectIssueReserveReadyCheckPopup.do'/>?sReadyStatCd="+readyStatCd
                ,data:{
                    "parGiTp":parGiTp
                    ,"readyUsrId":""
                    ,"carNo":carNo
                    ,"readyStatCd":readyStatCd
                    ,"callbackCustSearchPopupWindowOpenFunc":function(data){

                        /*
                        * 내부직원 사용자조회 팝업 호출.
                        */
                        userSearchPopupWin = dms.window.popup({
                            windowId:"userSearchPopupWin"
                            ,title:"<spring:message code='cmm.title.user.search' />"//사용자조회
                            ,width:800
                            ,height:500
                            ,content:{
                                url:"<c:url value='/par/cmm/selectIssueInnerUserPopup.do'/>"
                                , data:{
                                    "autoBind":true
                                    ,"usrId":""
                                    ,"usrNm":""
                                    ,"selectable":"single"
                                    ,"closeAfterSelect":true
                                    ,"pageable":true
                                    ,"callbackFunc":function(data){
                                        if(data.length > 0) {

                                            sReadyUsrId = data[0].usrId;
                                            sReadyUsrNm = data[0].usrNm;

                                            $("#issueReserveReadyPopupButtonWindow").children("iframe")[0].contentWindow.receiveCustermerData(data[0]);

                                        }
                                    }
                                }
                            }
                        });

                    }
                    ,"callbackFunc":function(data){

                        if(userSearchPopupWin != null){
                            userSearchPopupWin.close();
                        }

                        //receive y or n
                        if(data.flag == "Y"){

                            var dataItems = [ ],
                            grid = gridObj.grid,
                            tabIndex = gridObj.tabIndex,
                            parGiTp = gridObj.parGiTp;

                            //set selected Item
                            dataItems = selectedItems;
                            //checked list.
                            for (i = 0; i < dataItems.length; i++) {
                                var item  = dataItems[i];

                                if(readyStatCd === "03"){//예류(예약/부품/기타)
                                    item.readyUsrId = data.readyUsrId;
                                    item.readyUsrNm = data.readyUsrNm;
                                    item.readyRemark = data.readyRemark;
                                    item.readyRegDt = data.readyRegDt;
                                    item.readyRegDtString  = data.readyRegDtString;
                                    item.readyCancRegDt = null;

                                }else if(readyStatCd === "05"){//예류취소(예약/부품/기타)
                                    item.readyRegDt = null;
                                    item.readyCancUsrId = data.readyUsrId;
                                    item.readyCancUsrNm = data.readyUsrNm;
                                    item.readyCancRemark = data.readyRemark;
                                    item.readyCancRegDt = data.readyRegDt;
                                    item.readyCancRegDtString  = data.readyRegDtString;
                                }
                            }

                            if(parGiTp == "SR"){
                                updateIssueResvReadySaves(gridObj, dataItems, readyStatCd);
                            }else if(parGiTp == "SP"){
                                updateIssueResvReadySaves(gridObj, dataItems, readyStatCd);
                            }else if(parGiTp == "OT"){
                                $("#carNo").val(data.carNo);
                                updateIssueResvReadyOtherSaves(gridObj, dataItems, readyStatCd);
                            }
                        }
                    }
                }
            }
        });
    }

    function getSelectedGridObj(){
        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
        var tabIndex = tabStrip.select().index();

        var grid = null;
        var vParGiTp = "";
        if(tabIndex === 0){//service reserve
            grid = $("#targetReqDetailResvGrid").data("kendoExtGrid");
            vParGiTp = "SR";
        }else if(tabIndex === 1){//service parts
            grid = $("#targetReqDetailResvActGrid").data("kendoExtGrid");
            vParGiTp = "SP";
        }else if(tabIndex === 2){//other reserve
            grid = $("#targetReqDetailResvOtherGrid").data("kendoExtGrid");
            vParGiTp = "OT";
        }

        var gridObj = {
            "grid":grid
            ,"tabIndex":tabIndex
            ,"parGiTp":vParGiTp
        }

        return gridObj;
    }

    function selectTargetIssueReqByKey(selectedItem){

        $("#parReqDocNo").val(selectedItem.parReqDocNo);
        $("#parGiTp").val(selectedItem.parGiTp);
        $("#resvDocNo").val(selectedItem.resvDocNo);
        $("#readyDocNo").val(selectedItem.readyDocNo);
        $("#custCd").val(selectedItem.custCd);
        $("#custNm").val(selectedItem.custNm);
        $("#vinNo").val(selectedItem.vinNo);
        $("#carNo").val(selectedItem.carNo);

    }

    //get strgeCd List
    function getStrgeCdList(){
        var sStrgeCdLst = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();

        if(dms.string.isEmpty(sStrgeCdLst[0])){
            sStrgeCdLst.splice(0,1);
        }

        return sStrgeCdLst;
    }

    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                //pageInit Func call.
                pageInit();
            }
        });
        //btnInvResvReadyAct
        $("#btnInvResvReadyAct").kendoButton({
            enable:false
            ,click:function(e){

                var gridObj = getSelectedGridObj(),
                parGiTp = gridObj.parGiTp,
                grid = gridObj.grid,
                items = grid.dataSource.data(),
                rowCnt = 0,
                readyActCnt = 0,
                issueReqItemCheckCnt = 0,
                issueReqResvCheckCnt = 0,
                dataItems = [ ];

                for (i = 0; i < items.length; i++) {
                    var item = items[i];
                    var elementRow = null;

                    if(parGiTp === "SR"){
                        elementRow = grid.tbody.find(".checkbox01")[i];
                    }else if(parGiTp === "SP"){
                        elementRow = grid.tbody.find(".checkbox02")[i];
                    }else if(parGiTp === "OT"){
                        elementRow = grid.tbody.find(".checkbox03")[i];
                    }else{
                        return false;
                    }
                    //checked Item check.
                    if(elementRow.checked){
                        if(item.readyStatCd == "01" || item.readyStatCd == "02"){//준비상태 요청 or 준비
                            //empty Item check.
                            if(item.itemCd == ""){
                                issueReqItemCheckCnt++;
                            }
                            //resvQty check.
                            if(kendo.parseInt(item.resvQty) > kendo.parseInt(item.avlbStockQty)){
                                issueReqResvCheckCnt++;
                            }
                            dataItems.push(item);
                            readyActCnt++;
                        }
                        rowCnt++;
                    }
                }

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                if(readyActCnt === 0){
                    // readyActItem check
                    dms.notification.info("<spring:message code='par.lbl.invResvReadyAct' var='invResvReadyAct' /><spring:message code='par.info.itemInsertNotMsg' arguments='${invResvReadyAct}' />");
                    return false;
                }

                if(issueReqItemCheckCnt > 0){
                    // itemCd check message.
                    dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
                    return false;
                }

                if(issueReqResvCheckCnt > 0){
                    // resvQty check message.
                    dms.notification.info("<spring:message code='par.lbl.resvQty' var='resvQty' /><spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${resvQty},${avlbStockQty}' />");
                    return false;
                }

                //selectIssueReserveReadyPopupButtonWindow Func call
                selectIssueReserveReadyPopupButtonWindow(gridObj, dataItems, "03");
            }
        });
        //btnInvResvResvActCancel
        $("#btnInvResvReadyActCancel").kendoButton({
            enable:false
            ,click:function(e){

                var gridObj = getSelectedGridObj(),
                parGiTp = gridObj.parGiTp,
                grid = gridObj.grid,
                items = grid.dataSource.data(),
                rowCnt = 0,
                readyActCancelCnt = 0,
                dataItems = [ ];

                for (i = 0; i < items.length; i++) {
                    var item = items[i];
                    var elementRow = null;

                    if(parGiTp === "SR"){
                        elementRow = grid.tbody.find(".checkbox01")[i];
                    }else if(parGiTp === "SP"){
                        elementRow = grid.tbody.find(".checkbox02")[i];
                    }else if(parGiTp === "OT"){
                        elementRow = grid.tbody.find(".checkbox03")[i];
                    }else{
                        return false;
                    }
                    //checked Item check.
                    if(elementRow.checked){
                        if(item.readyStatCd == "03"){//예류부품만.
                            dataItems.push(item);
                            readyActCancelCnt++;
                        }
                        rowCnt++;
                    }
                }

                if(rowCnt === 0){
                    // line check
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return false;
                }

                if(readyActCancelCnt === 0){
                    // readyActItem check
                    dms.notification.info("<spring:message code='par.lbl.invResvReadyActCancel' var='invResvReadyActCancel' /><spring:message code='par.info.itemInsertNotMsg' arguments='${invResvReadyActCancel}' />");
                    return false;
                }
                //selectIssueReserveReadyPopupButtonWindow Func call
                selectIssueReserveReadyPopupButtonWindow(gridObj, dataItems, "05");
            }
        });
        //btnInvResvResvActCancel
        $("#btnInvResvReadyActCancelBatch").kendoButton({
            click:function(e){
                $.ajax({
                    url:"<c:url value='/bat/par/issueReserve/multiBatchPartsIssueReadyActionCancel.do' />"
                    ,data:JSON.stringify({})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){
                        selectDataSourceGridReload();
                        // success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        //btnInvResvResvActSave
        $("#btnInvResvReadyActSave").kendoButton({
            enable:false
            ,click:function(e){

                var gridObj = getSelectedGridObj(),
                parGiTp = gridObj.parGiTp,
                grid = gridObj.grid,
                items = grid.dataSource.data(),
                rowCnt = 0,
                readyActCnt = 0,
                issueReqItemCheckCnt = 0,
                issueReqResvCheckCnt = 0,
                dataItems = [ ];

                for (i = 0; i < items.length; i++) {
                    var item = items[i];
                    var elementRow = null;

                    if(parGiTp === "SR"){
                        elementRow = grid.tbody.find(".checkbox01")[i];
                    }else if(parGiTp === "SP"){
                        elementRow = grid.tbody.find(".checkbox02")[i];
                    }else if(parGiTp === "OT"){
                        elementRow = grid.tbody.find(".checkbox03")[i];
                    }else{
                        return false;
                    }
                    //checked Item check.
                    if(elementRow.checked){
                        if(item.readyStatCd == "01" || item.readyStatCd == "02" ){//준비상태 요청 or 준비
                            //empty Item check.
                            if(item.itemCd == ""){
                                issueReqItemCheckCnt++;
                            }
                            //resvQty check.
                            if(kendo.parseInt(item.resvQty) > kendo.parseInt(item.avlbStockQty)){
                                issueReqResvCheckCnt++;
                            }

                            item.readyRegDt = new Date("${sysEndDate}");
                            item.readyRegDtString = "${sysEndDate}";
                            item.readyCancRegDt = new Date("${sysEndDate}");
                            item.readyCancRegDtString = "${sysEndDate}";

                            dataItems.push(item);
                            readyActCnt++;
                        }
                        rowCnt++;
                    }
                }

                var multiIssueReadyDetails = grid.getCUDData("insertList", "updateList", "deleteList");
                var delCnt = multiIssueReadyDetails.deleteList.length;

                if(delCnt == 0){
                    if(rowCnt === 0){
                        // line check
                        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                        return false;
                    }

                    if(readyActCnt === 0){
                        // readyActItem check
                        dms.notification.info("<spring:message code='par.lbl.invResvReadyAct' var='invResvReadyAct' /><spring:message code='par.info.itemInsertNotMsg' arguments='${invResvReadyAct}' />");
                        return false;
                    }

                    if(issueReqItemCheckCnt > 0){
                        // itemCd check message.
                        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
                        return false;
                    }

                    if(issueReqResvCheckCnt > 0){
                        // resvQty check message.
                        dms.notification.info("<spring:message code='par.lbl.resvQty' var='resvQty' /><spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${resvQty},${avlbStockQty}' />");
                        return false;
                    }
                }

                if(parGiTp == "SR" || parGiTp == "SP"){
                    updateIssueResvReadySaves(gridObj, dataItems, "01");
                }else if(parGiTp == "OT" ){
                    updateIssueResvReadyOtherSaves(gridObj, dataItems, "01");
                }

            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            click:function(e){
                var grid = null;
                var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                var tabIndex = tabStrip.select().index();

                if(tabIndex === 0){//service reserve
                    grid = $("#targetReqDetailResvGrid").data("kendoExtGrid");
                }else if(tabIndex === 1){//service parts
                    grid = $("#targetReqDetailResvActGrid").data("kendoExtGrid");
                }else if(tabIndex === 2){//other reserve
                    grid = $("#targetReqDetailResvOtherGrid").data("kendoExtGrid");
                }else{
                    return false;
                }
                rows = grid.select();
                rowCnt = rows.length;

                if(rowCnt == 0){
                    //line select message
                    dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
                    return;
                }

                var sParReqDocNo = $("#parReqDocNo").val();
                var sParGiTp = $("#parGiTp").val();
                var sResvDocNo = $("#resvDocNo").val();
                var sReadyDocNo = $("#readyDocNo").val();
                var sCustCd = $("#custCd").val();
                var sCustNm = $("#custNm").val();
                var sVinNo = $("#vinNo").val();
                var sCarNo = $("#carNo").val();

                //param title, url, viewId, isReload
                parent._createOrReloadTabMenu("<spring:message code='par.title.reservePrintDoc' />", "<c:url value='/ReportServer?reportlet=par/selectPartsReserveReadyActPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sPltCd=${pltCd}&sParReqDocNo="+sParReqDocNo+"&sParGiTp="+sParGiTp,"VIEW-D-10647", true);
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            click:function(e){

                var sResvDocNo = $("#sResvDocNo").val();
                var sResvPeDocNo = $("#sResvPeDocNo").val();
                var sCarNo = $("#sCarNo").val();
                var sVin = $("#sVin").val();

                $("#resvDocNo").val(sResvDocNo);
                $("#resvPeDocNo").val(sResvPeDocNo);
                $("#carNo").val(sCarNo);
                $("#vinNo").val(sVin);

                $("#targetReqDetailResvGrid").data("kendoExtGrid").dataSource.page(1);
                $("#targetReqDetailResvActGrid").data("kendoExtGrid").dataSource.page(1);
                $("#targetReqDetailResvOtherGrid").data("kendoExtGrid").dataSource.page(1);

                var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                var tabIndex = tabStrip.select().index();
                if(tabIndex === 0 || tabIndex === 1){
                	buttonEnableDisable(true, false, null);
                }else{
                    buttonEnableDisable(true, true, null);
                }
            }
        });
        //sInvResvReqStartDt datepicker
        $("#sInvResvReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvReqEndDt datepicker
        $("#sInvResvReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvReqWorkStartDt datepicker
        $("#sInvResvReqWorkStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvReqWorkEndDt datepicker
        $("#sInvResvReqWorkEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvActStartDt datepicker
        $("#sInvResvActStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvActEndDt datepicker
        $("#sInvResvActEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvActCancelDt datepicker
        $("#sInvResvActCancelStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sInvResvActCancelEndDt datepicker
        $("#sInvResvActCancelEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sStrgeCd
        $("#sStrgeCd").kendoExtMultiSelectDropDownList({
            dataTextField :"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:searchStorageCdList
            ,index:0
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectStrgeCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectStrgeCd)){
                    $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value([]);
                }
            }
        });
        //sReadyStatCd dropdownlist
        $("#sReadyStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:readyStatCdList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        //btnPakage
        $("#btnPakage").kendoButton({
            enable:false
            ,click:function(e){
                //selectWorkPackagePopupWindow Func call
                selectWorkPackagePopupWindow();
                buttonEnableDisable(true, true, "01");
            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                //selectPartsMasterPopupWindow Func call.
                selectPartsMasterPopupWindow();
                buttonEnableDisable(true, true, "01");
            }
        });
        //btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){

                var gridObj = getSelectedGridObj(),
                grid = gridObj.grid,
                items = grid.dataSource.view(),
                rows = grid.tbody.find('>tr'),
                length = items.length,
                rowCnt = 0,
                retrunPartsCnt = 0,
                outPartsCnt = 0,
                item,
                i,
                elementRow,
                removePkgDelCnt = 0,
                removePkgList = [],
                removeList = [];

                //delete item checked
                $.each(rows, function(index, row){
                    item = grid.dataItem(row);
                    elementRow = grid.tbody.find(".checkbox03")[index];

                    if(elementRow.checked){
                        if(item.readyStatCd === "01"){//부품예류요청건만
                            //delete item adding.
                            removeList[item.uid] = true;

                        }
                        rowCnt++;
                    }
                });

                if(rowCnt == 0){
                    // delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                    return false;
                }
                else{
                    //삭제 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지 적용.
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            //grid dataSource Deleting.
                            for (i = length-1; i>=0; i--) {
                                item = items[i];
                                if(removeList[item.uid]){
                                    grid.dataSource.remove(item);
                                }
                            }

                        }
                        conformKendoWindow.close();
                    }).end();
                }
            }
        });
        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
                var selectTabIndex = $(e.item).index();

                if(selectTabIndex ===2){
                    buttonEnableDisable(true, true, null);
                }else{
                    buttonEnableDisable(true, false, null);
                }
            }
        });
        //targetReqDetailResvGrid.
        $("#targetReqDetailResvGrid").kendoExtGrid({
            gridId:"G-PAR-0519-185206"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailResves.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var sStrgeCdList = getStrgeCdList();

                            var sResvDocNo = $("#sResvDocNo").val();
                            params["sParGiTp"] = "SR";
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sReqStartDt"] = $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value();//sReqStartDt
                            params["sReqEndDt"] = $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value();//sReqEndDt
                            params["sResvDocNo"] = sResvDocNo;

                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sStrgeCdList"] = sStrgeCdList;//sStrgeCdList
                            params["sReadyStatCdOnly"] = $("#sReadyStatCd").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sResvUsrNm"] = $("#sResvUsrNm").val();
                            params["sReadyReqStartDt"] = $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").value();//sInvResvActStartDt
                            params["sReadyReqEndDt"] = $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").value();//sInvResvActEndDt
                            params["sReadyCancReqStartDt"] = $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").value();//sInvResvActStartDt
                            params["sReadyCancReqEndDt"] = $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").value();//sInvResvActEndDt
                            params["sReadyUsrNm"] = $("#sReadyUsrNm").val();
                            params["sReadyStatCd"] = "RE04";//Parts Ready

                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,custCd:{ type:"string" , editable:false }
                            ,custNm:{ type:"string" , editable:false }
                            ,carNo:{ type:"string", editable:false }
                            ,vinNo:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,totStockQty:{ type:"number", editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,borrowStockQty:{ type:"number", editable:false }
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
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,itemSalePrc:{ type:"number" , editable:false }
                            ,itemSaleAmt:{ type:"number" , editable:false }
                            ,dcRate:{ type:"number" , editable:false }
                            ,dcAmt:{ type:"number" , editable:false }
                            ,itemTotAmt:{ type:"number" , editable:false }
                            ,movingAvgPrc:{ type:"number" , editable:true }
                            ,movingAvgAmt:{ type:"number" , editable:true }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyRegEndDt:{ type:"date" , editable:false }
                            ,readyRegDtString:{ type:"string" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyUsrNm:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,readyCancRegDt:{ type:"date" , editable:false }
                            ,readyCancRegDtString:{ type:"string" , editable:false }
                            ,readyCancUsrId:{ type:"string" , editable:false }
                            ,readyCancUsrNm:{ type:"string" , editable:false }
                            ,readyCancRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:false }
                            ,borrowLineNo:{ type:"number", editable:false }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,resvUsrNm:{ type:"string" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                            ,resvUsrId:{ type:"string" , editable:false }
                            ,partsResvUsrId:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                //complete close cell
                //준비상태코드 : 예류(03), 예류취소(05), 정비예약(06), 정비출고(07) 시 셀 닫기.
                if (e.model.readyStatCd == "03" || e.model.readyStatCd == "05" || e.model.readyStatCd == "06" || e.model.readyStatCd == "07") {
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="readyStatCd"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="readyStatCd" || fieldName=="giStrgeCd" || fieldName=="giLocCd" ){
                        this.closeCell();
                    }
                }
                if(fieldName=="movingAvgPrc" || fieldName=="movingAvgAmt" || fieldName=="itemAmt"){
                    this.closeCell();
                }
            }
            ,height:357
            ,autoBind:false
            ,filterable:false
            ,sortable:false
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,indvColumnRows:3
            ,dataBound:function(e){

                var view = this.dataSource.view();
                for(var i = 0; i < view.length;i++){
                    if(checkedIds01[view[i].id]){
                        this.tbody.find("tr[data-uid='" + view[i].uid + "']")
                        .addClass("k-state-selected")
                        .find(".checkbox01")
                        .attr("checked","checked");
                    }
                }

                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var resvQty = row.children().eq(10);

                        if(dataItem.readyStatCd == "01" || dataItem.readyStatCd == "02"){
                            resvQty.addClass("bg_white");
                        }
                    }
                });

                $(".checkbox01").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqDetailResvGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    checkedIds01[dataItem.id] = checked;

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }

                    buttonEnableDisable(true,false,dataItem.readyStatCd);

                });

            }
            ,change:function(e) {

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    //부품요청 조회.
                    selectTargetIssueReqByKey(selectedItem);
                    //버튼 활성,비활성화
                    buttonEnableDisable(true,false,selectedItem.readyStatCd);
                }
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);

            }
            ,columns :
                [{title:"", width:40 ,_field:"_checkAll01" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox01' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' type='checkbox' />"
                }
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyActStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.readyStatCd){
                            case "02"://준비
                                spanObj = "<span class='txt_label bg_yellow'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "03"://예류
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "04"://준비취소
                            case "05"://예류취소
                                spanObj = "<span class='txt_label bg_red'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "06"://정비예약
                                //color : green ==> orange
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "07"://정비출고
                                spanObj = "<span class='txt_label bg_blue'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            default: //요청
                                spanObj = "<span class='txt_label bg_gray'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:80 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"custNm", title:"<spring:message code='par.lbl.vsitr'/>", width:100 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:120 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"reqStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    ,editor:function(container, options){
                        var input = $('<input id="strgeCd" name="strgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCdMap[reqStrgeCd] !== undefined){# #= giStrgeCdMap[reqStrgeCd]# #}#'
                }
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80}
                ,{field:"reqQty", title:"<spring:message code='par.lbl.resvReqQty' />", width:80, attributes:{"class":"ar"}}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.invResvReadyActComQty' />", width:80
                    ,format:"{0:n0}"
                    ,attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n0"
                            ,decimals:0
                            ,max:100
                            ,min:0
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailResvGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                model.set("resvQty", this.value());
                                model.set("endQty", this.value());

                                var endQty = this.value();
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vMovingAvgAmt = Math.round(Number(vMovingAvgPrc) * Number(endQty) * 100)/100;
                                var vItemPrc = model.get("itemPrc");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(endQty) * 100)/100;

                                model.set("itemAmt", vItemAmt);
                                model.set("movingAvgAmt", vMovingAvgAmt);
                            }
                        });
                    }
                }
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.invResvDocNo'/>", width:100 }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvReqTime'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"resvUsrNm", title:"<spring:message code='par.lbl.invResvManNm'/>", width:100 }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", width:80 , attributes:{"class":"ar"}}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.realAvlbStockQty'/>", width:80 , attributes:{"class":"ar"}}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />",width:80 ,attributes:{"class":"ar"} }//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />",width:80 ,attributes:{"class":"ar"} }//대출(차출)수량
                ,{field:"borrowStockQty" ,title:"<spring:message code='par.lbl.loanQty' />",width:80 ,attributes:{"class":"ar"} }//차입수량
                ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}}
                ,{field:"itemSaleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}
                ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"} ,format:"{0:n0}"}
                ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:90, attributes:{"class":"ar"}}
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"readyRegDt", title:"<spring:message code='par.lbl.etcRvRegDt'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyUsrNm", title:"<spring:message code='par.lbl.invResvActManNm'/>", width:100 }
                ,{field:"readyRemark", title:"<spring:message code='par.lbl.invResvActBigo'/>", width:100 }
                ,{field:"readyCancRegDt", title:"<spring:message code='par.lbl.invResvActCancRegDt'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyCancUsrNm", title:"<spring:message code='par.lbl.invResvActCancManNm'/>", width:100 }
                ,{field:"readyCancRemark", title:"<spring:message code='par.lbl.invResvActCancRemark'/>", width:100 }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:120
                    ,template:'#if(locCdMap[giLocCd] !== undefined){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.movingAvgPrc'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}", hidden:true}
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}", hidden:true}
            ]
        });

        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqDetailResvGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox01")[i];
                elementRow.checked = checked;

                checkedIds01[dataItem.id] = checked;

                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });
        //targetReqDetailResvActGrid.
        $("#targetReqDetailResvActGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135405"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailResves.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var sStrgeCdList = getStrgeCdList();

                            var resvPeDocNo = $("#sResvPeDocNo").val();
                            params["sParGiTp"] = "SP"; //parts reserve
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sReqStartDt"] = $("#sInvResvReqWorkStartDt").data("kendoExtMaskedDatePicker").value();//sReqStartDt
                            params["sReqEndDt"] = $("#sInvResvReqWorkEndDt").data("kendoExtMaskedDatePicker").value();//sReqEndDt
                            params["sResvDocNo"] = resvPeDocNo;

                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sStrgeCdList"] = sStrgeCdList;//sStrgeCdList
                            params["sReadyStatCdOnly"] = $("#sReadyStatCd").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sPartsResvUsrNm"] = $("#sPartsResvUsrNm").val();
                            params["sReadyUsrNm"] = $("#sReadyUsrNm").val();
                            params["sReadyReqStartDt"] = $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").value();//sInvResvActStartDt
                            params["sReadyReqEndDt"] = $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").value();//sInvResvActEndDt
                            params["sReadyCancReqStartDt"] = $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").value();//sInvResvActStartDt
                            params["sReadyCancReqEndDt"] = $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").value();//sInvResvActEndDt
                            params["sReadyStatCd"] = "RE01";//Parts Ready
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,carNo:{ type:"string", editable:false }
                            ,vinNo:{ type:"string", editable:false }
                            ,custCd:{ type:"string", editable:false }
                            ,custNm:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,totStockQty:{ type:"number", editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,borrowStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:false }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:true }
                            ,movingAvgAmt:{ type:"number" , editable:true }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyRegEndDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyUsrNm:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,readyCancRegDt:{ type:"date" , editable:false }
                            ,readyCancRegDtString:{ type:"string" , editable:false }
                            ,readyCancUsrId:{ type:"string" , editable:false }
                            ,readyCancUsrNm:{ type:"string" , editable:false }
                            ,readyCancRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:false }
                            ,borrowLineNo:{ type:"number", editable:false }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,partsResvUsrNm:{ type:"string" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                            ,resvUsrId:{ type:"string" , editable:false }
                            ,resvUsrId:{ type:"string" , editable:false }
                            ,partsResvUsrId:{ type:"string" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                //준비상태코드 : 예류(03), 예류취소(05), 정비예약(06), 정비출고(07) 시 셀 닫기.
                if (e.model.readyStatCd == "03" || e.model.readyStatCd == "05" || e.model.readyStatCd == "06" || e.model.readyStatCd == "07") {
                    if(fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="readyStatCd"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName=="readyStatCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }
                if(fieldName=="movingAvgPrc" || fieldName=="movingAvgAmt" || fieldName=="itemAmt" || fieldName=="resvQty"){
                    this.closeCell();
                }
            }
            ,height:357
            ,autoBind:false
            ,filterable:false
            ,sortable:false
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,indvColumnRows:3
            ,dataBound:function(e){

                var view = this.dataSource.view();
                for(var i = 0; i < view.length;i++){
                    if(checkedIds02[view[i].id]){
                        this.tbody.find("tr[data-uid='" + view[i].uid + "']")
                        .addClass("k-state-selected")
                        .find(".checkbox02")
                        .attr("checked","checked");
                    }
                }

                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var resvQty = row.children().eq(9);

                        if(dataItem.readyStatCd == "01"){
                            //resvQty.addClass("bg_white");
                        }
                    }
                });

                $(".checkbox02").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqDetailResvActGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    checkedIds02[dataItem.id] = checked;

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }

                    buttonEnableDisable(true,false,dataItem.readyStatCd);
                });
            }
            ,change:function(e) {

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    //부품요청 조회.
                    selectTargetIssueReqByKey(selectedItem);
                    buttonEnableDisable(true,false,selectedItem.readyStatCd);
                }

                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [{title:"", width:40 ,_field:"_checkAll02" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox02' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll02' type='checkbox' />"
                }
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyActStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.readyStatCd){
                            case "02"://준비
                                spanObj = "<span class='txt_label bg_yellow'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "03"://예류
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "04"://준비취소
                            case "05"://예류취소
                                spanObj = "<span class='txt_label bg_red'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "06"://정비예약
                                //color : green ==> orange
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "07"://정비출고
                                spanObj = "<span class='txt_label bg_blue'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            default: //요청
                                spanObj = "<span class='txt_label bg_gray'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:80 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"custNm", title:"<spring:message code='par.lbl.vsitr'/>", width:100 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:120 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80}
                ,{field:"reqQty", title:"<spring:message code='par.lbl.resvReqQty' />", width:80, attributes:{"class":"ar"}}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.invResvReadyActComQty' />", width:80
                    ,format:"{0:n0}"
                    ,attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n0"
                            ,decimals:0
                            ,max:100
                            ,min:0
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailResvActGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                model.set("resvQty", this.value());
                                model.set("endQty", this.value());

                                var endQty = this.value();
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vMovingAvgAmt = Math.round(Number(vMovingAvgPrc) * Number(endQty) * 100)/100;
                                var vItemPrc = model.get("itemPrc");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(endQty) * 100)/100;

                                model.set("itemAmt", vItemAmt);
                                model.set("movingAvgAmt", vMovingAvgAmt);
                            }
                        });
                    }
                }
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.invPartsResvDocNo'/>", width:100 }
                ,{field:"regDt", title:"<spring:message code='par.lbl.invPartsResvReqTime'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"partsResvUsrNm", title:"<spring:message code='par.lbl.invPartsResvManNm'/>", width:100 }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", width:80 , attributes:{"class":"ar"}}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.realAvlbStockQty'/>", width:80 , attributes:{"class":"ar"}}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />",width:80 ,attributes:{"class":"ar"} }//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />",width:80 ,attributes:{"class":"ar"} }//대출(차출)수량
                ,{field:"borrowStockQty" ,title:"<spring:message code='par.lbl.loanQty' />",width:80 ,attributes:{"class":"ar"} }//차입수량
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"readyRegDt", title:"<spring:message code='par.lbl.etcRvRegDt'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyUsrNm", title:"<spring:message code='par.lbl.invResvActManNm'/>", width:100 }
                ,{field:"readyCancRegDt", title:"<spring:message code='par.lbl.invResvActCancRegDt'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyCancUsrNm", title:"<spring:message code='par.lbl.invResvActCancManNm'/>", width:100 }
                ,{field:"readyCancRemark", title:"<spring:message code='par.lbl.invResvActCancRemark'/>", width:100 }
                ,{field:"reqStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    ,editor:function(container, options){
                        var input = $('<input id="strgeCd" name="strgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCdMap[reqStrgeCd] !== undefined){# #= giStrgeCdMap[reqStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:120
                    ,template:'#if(locCdMap[giLocCd] !== undefined){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.movingAvgPrc'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}", hidden:true}
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}", hidden:true}
            ]
        });

        //grid checkbox all
        $("#chkAll02").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqDetailResvActGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox02")[i];
                elementRow.checked = checked;

                checkedIds02[dataItem.id] = checked;

                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });
        //targetReqDetailResvOtherGrid.
        $("#targetReqDetailResvOtherGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135406"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailResves.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            var sStrgeCdList = getStrgeCdList();

                            params["sParGiTp"] = "OT";
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin

                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sStrgeCdList"] = sStrgeCdList;//sStrgeCdList
                            params["sReadyStatCdOnly"] = $("#sReadyStatCd").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sReadyUsrNm"] = $("#sReadyUsrNm").val();
                            params["sReadyReqStartDt"] = $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").value();//sInvResvActStartDt
                            params["sReadyReqEndDt"] = $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").value();//sInvResvActEndDt
                            params["sReadyCancReqStartDt"] = $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").value();//sInvResvActStartDt
                            params["sReadyCancReqEndDt"] = $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").value();//sInvResvActEndDt
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,carNo:{ type:"string", editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgDocNo:{ type:"string", editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,totStockQty:{ type:"number", editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,borrowStockQty:{ type:"number", editable:false }
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
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:true }
                            ,movingAvgAmt:{ type:"number" , editable:true }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyRegEndDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyUsrNm:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,readyCancRegDt:{ type:"date" , editable:false }
                            ,readyCancRegDtString:{ type:"string" , editable:false }
                            ,readyCancUsrId:{ type:"string" , editable:false }
                            ,readyCancUsrNm:{ type:"string" , editable:false }
                            ,readyCancRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:false }
                            ,borrowLineNo:{ type:"number", editable:false }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                //준비상태코드 : 예류(03), 예류취소(05), 정비예약(06), 정비출고(07) 시 셀 닫기.
                if (e.model.readyStatCd == "03" || e.model.readyStatCd == "05" || e.model.readyStatCd == "06" || e.model.readyStatCd == "07") {
                    if(fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd" || fieldName=="readyStatCd"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName=="readyStatCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }
                if(fieldName=="movingAvgPrc" || fieldName=="movingAvgAmt" || fieldName=="itemAmt"){
                    this.closeCell();
                }
            }
            ,height:357
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,sortable:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,indvColumnRows:3
            ,dataBound:function(e){
                var view = this.dataSource.view();
                for(var i = 0; i < view.length;i++){
                    if(view[i].dbYn === "N"){//저장 안되있는 부품 체크.
                        this.tbody.find("tr[data-uid='" + view[i].uid + "']")
                        .addClass("k-state-selected")
                        .find(".checkbox03")
                        .attr("checked","checked");
                    }
                }

                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var resvQty = row.children().eq(5);

                        if(dataItem.readyStatCd == "01"){
                            resvQty.addClass("bg_white");
                        }
                    }
                });

                $(".checkbox03").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#targetReqDetailResvOtherGrid").data("kendoExtGrid");
                    dataItem = grid.dataItem(row);

                    if(checked){
                        row.addClass("k-state-selected");
                        dataItem.dirty = true;
                    }else{
                        row.removeClass("k-state-selected");
                        dataItem.dirty = false;
                    }
                    buttonEnableDisable(true, true, dataItem.readyStatCd);
                });
            }
            ,change:function(e) {

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    //부품요청 조회.
                    selectTargetIssueReqByKey(selectedItem);
                    buttonEnableDisable(true,true,selectedItem.readyStatCd);
                }

                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns :
                [{title:"", width:40 ,_field:"_checkAll03" ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox03' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll03' type='checkbox' />"
                }
                ,{field:"readyStatCd", title:"<spring:message code='par.lbl.readyActStatCd'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.readyStatCd){
                            case "02"://준비
                                spanObj = "<span class='txt_label bg_yellow'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "03"://예류
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "04"://준비취소
                            case "05"://예류취소
                                spanObj = "<span class='txt_label bg_red'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "06"://정비예약
                                //color : green ==> orange
                                spanObj = "<span class='txt_label bg_orange'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            case "07"://정비출고
                                spanObj = "<span class='txt_label bg_blue'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                            default: //요청
                                spanObj = "<span class='txt_label bg_gray'>"+readyStatCdMap[dataItem.readyStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:120 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.invResvReadyActComQty' />", width:80
                    ,format:"{0:n0}"
                    ,attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n0"
                            ,decimals:0
                            ,maxa:100
                            ,min:0
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailResvOtherGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                model.set("resvQty", this.value());
                                model.set("reqQty", this.value());
                                model.set("endQty", this.value());

                                var endQty = this.value();
                                var vMovingAvgPrc = model.get("movingAvgPrc");
                                var vMovingAvgAmt = Math.round(Number(vMovingAvgPrc) * Number(endQty) * 100)/100;
                                var vItemPrc = model.get("itemPrc");
                                var vItemAmt = Math.round(Number(vItemPrc) * Number(endQty) * 100)/100;

                                model.set("itemAmt", vItemAmt);
                                model.set("movingAvgAmt", vMovingAvgAmt);
                            }
                        });
                    }
                }
                ,{field:"readyRegDt", title:"<spring:message code='par.lbl.etcRvRegDt'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyUsrNm", title:"<spring:message code='par.lbl.invResvOtherActManNm'/>", width:100 }
                ,{field:"readyCancRegDt", title:"<spring:message code='par.lbl.invResvActCancRegDt'/>", width:120 , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}
                ,{field:"readyCancUsrNm", title:"<spring:message code='par.lbl.invResvActCancManNm'/>", width:100 }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:80 }
                ,{field:"readyCancRemark", title:"<spring:message code='par.lbl.invResvActCancRemark'/>", width:100 }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", width:80 , attributes:{"class":"ar"}}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.realAvlbStockQty'/>", width:80 , attributes:{"class":"ar"}}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />",width:80 ,attributes:{"class":"ar"} }//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />",width:80 ,attributes:{"class":"ar"} }//대출(차출)수량
                ,{field:"borrowStockQty" ,title:"<spring:message code='par.lbl.loanQty' />",width:80 ,attributes:{"class":"ar"} }//차입수량
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}"}
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:120
                    ,editor:function(container, options){
                        var input = $('<input id="giStrgeCd" name="giStrgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCdMap[giStrgeCd] !== undefined){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:120
                    ,template:'#if(locCdMap[giLocCd] !== undefined){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.movingAvgPrc'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}", hidden:true}
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt'/>", width:100 , attributes:{"class":"ar"} ,format:"{0:n2}", hidden:true}
            ]
        });
        //grid checkbox all
        $("#chkAll03").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(':checked');
            var grid = $('#targetReqDetailResvOtherGrid').data('kendoExtGrid');
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox03")[i];
                elementRow.checked = checked;

                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });

        //targetLbrGrid.
        $("#targetLbrGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135407"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sPreFixId"] = "RE";
                            params["sDocNo"] = $("#resvDocNo").val() == "" ? "X":$("#resvDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,roTp:{type:"string", editable:false}
                            ,docNo:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,lbrCd:{type:"string", editable:false}
                            ,lbrNm:{type:"string", editable:false}
                            ,lbrTp:{type:"string", editable:false}
                            ,lbrPrc:{type:"number"}
                            ,lbrHm:{type:"number", editable:false}
                        }
                    }
                }
            }
            ,height:219
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,sortable:false
            ,appendEmptyColumn:true
            ,editable:false
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='par.lbl.lbrCd' />", width:100}
                ,{field:"lbrNm", title:"<spring:message code='par.lbl.lbrNm' />", width:200}
                ,{field:"lbrTp", title:"<spring:message code='par.lbl.lbrTp' />", width:100}
                ,{field:"lbrPrc", title:"<spring:message code='par.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}
                ,{field:"lbrHm", title:"<spring:message code='par.lbl.lbrHm' />", width:70, attributes:{"class":"ar"} }
            ]
        });


        //정비수령 예약번호 전달 후 데이타 조회 처리.
        if("${resvDocNo}" != ""){
            if("${parGiTp}" == "SR"){//예약처리
                $("#sResvDocNo").val("${resvDocNo}");
            }else if("${parGiTp}" == "SP"){//부품예약
                $("#sResvPeDocNo").val("${resvDocNo}");
            }

            $("#btnSearch").click();
        }

    });

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
            if(id === 'sInvResvReqStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvReqWorkStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvReqWorkStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvReqWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqWorkEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvReqWorkEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvReqWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvActStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvActEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvActCancelStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvActCancelEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sInvResvReqStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvReqWorkStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvReqWorkEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvReqWorkEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvReqWorkStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvActStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvActEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvActEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvActStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sInvResvActCancelStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvResvActCancelEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvResvActCancelEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvResvActCancelStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }
</script>
<!-- //script -->

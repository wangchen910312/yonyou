<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기술품질클레임 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.menu.partSkillClaimMgr" /></h1> --%>
            <div class="btn_left">
    			<dms:access viewId="VIEW-D-11782" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
    			</dms:access>
                </div>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11790" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m"  id="btnRequestClaim"><spring:message  code="par.btn.requestClaim" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11789" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m"  id="btnDownloadClaim"><spring:message  code="par.btn.downloadClaim" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11788" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m"  id="btnDownloadClaimList"><spring:message  code="par.btn.downloadClaimList" /></button>
                </dms:access>
    			<dms:access viewId="VIEW-D-11781" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
    			</dms:access>
                <dms:access viewId="VIEW-D-11791" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m"  id="btnPrint"><spring:message code="ser.btn.claimPrint" /><!--출력  --></button>
                </dms:access>
            </div>
        </div>
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.claimNo" /><!-- 클레임번호 --></th>
                        <td>
                            <input id="sClaimCode" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sOrderNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.compensationWay" /><!-- 배상방식 --></th>
                        <td>
                            <input id="sCompensationWay" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.procStatus" /><!-- 처리상태 --></th>
                        <td>
                            <input id="sStatus" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dealMark" /><!-- 배상표기 --></th>
                        <td>
                            <input id="sDealMark" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.requestDt" /><!-- 신청일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCreateTimeFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sCreateTimeTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.claimStatus" /><!-- 클레임상태 --></th>
                        <td>
                            <input id="sWornStatus" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.hasSubmit" /><!-- 변상수령증 --></th>
                        <td>
                            <input id="sHasSubmit" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dealYm" /><!-- 배상년월 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sDealDateFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sDealDateTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.isArrived" /><!-- 도착여부 --></th>
                        <td>
                            <input id="sHasArrived" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.billNo" /><!-- 영수증번호 --></th>
                        <td>
                            <input type="text" id="sBillNo" class="form_input" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.isCheck" /><!-- 탁송여부 --></th>
                        <td>
                            <input id="sIsCheck" data-type="combo" class="form_comboBox" />
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabClaimReadyInfo" class="k-state-active"><spring:message code="par.title.claimReadyList" /></li><!-- 클레임대기 -->
                <li id ="tabClaimRequestInfo"><spring:message code="par.title.claimEnd" /></li><!-- 클레임완료 -->
            </ul>
            <span class="btn_right_absolute">

            </span>

            <!-- 클레임 대기  -->
            <div>
                <div class="btn_right_absolute">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11795" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_min5"  name="btnDeliveryEnd"><spring:message  code="par.btn.deliveryEnd" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11794" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_min5"  name="btnClaimStatus"><spring:message  code="par.btn.claimStatus" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11793" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_min5"  name="btnReclaimOrder"><spring:message  code="par.btn.reclaimOrder" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11792" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_min5"  name="btnBillNo"><spring:message  code="par.btn.billNo" /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_grid mt5">
                    <div id="gridReady" class="resizable_grid"></div>
                </div>
            </div>

            <!-- 클레임신청 -->
            <div>
                <div class="btn_right_absolute">
                    <dms:access viewId="VIEW-D-11787" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_s_min5"  name="btnDeliveryEnd"><spring:message  code="par.btn.deliveryEnd" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11786" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_s_min5"  name="btnClaimStatus"><spring:message  code="par.btn.claimStatus" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11785" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_s_min5"  name="btnReclaimOrder"><spring:message  code="par.btn.reclaimOrder" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11784" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_s_min5"  name="btnBillNo"><spring:message  code="par.btn.billNo" /></button>
                    </dms:access>
                </div>
                <div class="table_grid mt5">
                    <div id="gridRequest" class="resizable_grid"></div>
                </div>
            </div>
        </div>
    </section>
</div>
    <!-- // 其他出库信息 -->

<!-- script -->
<script>
    var ynObj                 = {},
        clWayObj              = {},
        clStatusList          = [],
        clStatusObj           = {},
        isCheckList           = [],
        isCheckObj            = {},
        statusList            = [],
        statusObj             = {},
        responsibilityList    = [],
        responsibilityObj     = {},
        claiCategoryList      = [],
        claiCategoryObj       = {},
        compensationWayList   = [],
        dealMarkList          = [],
        dealMarkObj           = {},
        hasSubmitList         = [],
        hasSubmitObj          = {},
        hasArrivedList        = [],
        hasArrivedObj         = {},
        toDt                  = "${toDt}",
        sevenDtBf             = "${sevenDtBf}",
        tabStrip,
        tabIndex,
        selectTabId,
        qualityClaimPopupWindow,
        setReClaimOrderPopupWindow,
        setQualityClaimStatusPopupWindow;

        ynObj["1"] = "Yes";
        ynObj["0"] = "No";

        clStatusList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${clStatusList}" varStatus="status">
            clStatusList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            clStatusObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        responsibilityList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${responsibilityList}" varStatus="status">
            responsibilityList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            responsibilityObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        claiCategoryList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${claiCategoryList}" varStatus="status">
            claiCategoryList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claiCategoryObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        statusList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${statusList}" varStatus="status">
            statusList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            statusObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        dealMarkList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${dealMarkList}" varStatus="status">
            dealMarkList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            dealMarkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        hasSubmitList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${hasSubmitList}" varStatus="status">
            hasSubmitList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            hasSubmitObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        compensationWayList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${compensationWayList}" varStatus="status">
            compensationWayList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${clWayList}" varStatus="status">
            clWayObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        isCheckList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${isCheckList}" varStatus="status">
            isCheckList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            isCheckObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        hasArrivedList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${hasArrivedList}" varStatus="status">
            hasArrivedList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            hasArrivedObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>



        $(document).ready(function() {

            //도착여부선택
            $("#sHasArrived").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:hasArrivedList
                ,index:0
            });

            //탁송여부선택
            $("#sIsCheck").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:isCheckList
                ,index:0
            });

            //배상방식선택
            $("#sCompensationWay").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:compensationWayList
                ,index:0
            });

            //처리상태선택
            $("#sStatus").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:statusList
                ,index:0
            });

            //배상표기선택
            $("#sDealMark").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:dealMarkList
                ,index:0
            });

            //클레임건상태선택
            $("#sWornStatus").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:clStatusList
                ,index:0
            });

            //변상수령증선택
            $("#sHasSubmit").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:hasSubmitList
                ,index:0
            });

            $("#sCreateTimeFr").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });

            $("#sCreateTimeTo").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });

            $("#sDealDateFr").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });

            $("#sDealDateTo").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });

          //tab
            $("#tabstrip").kendoExtTabStrip({
                animation:false
                ,select:function(e) {
                    if(!dms.string.isEmpty(e.item.id)){
                        selectTabId = e.item.id;
                    }
                    tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                    tabIndex = tabStrip.select().index();

                    if(selectTabId === 'tabClaimReadyInfo'){
                        $("button[name=btnDeliveryEnd]").data("kendoButton").enable(false);
                        $("button[name=btnClaimStatus]").data("kendoButton").enable(false);
                        $("button[name=btnReclaimOrder]").data("kendoButton").enable(false);
                        $("button[name=btnBillNo]").data("kendoButton").enable(false);
                    }else{
                        $("button[name=btnDeliveryEnd]").data("kendoButton").enable(true);
                        $("button[name=btnClaimStatus]").data("kendoButton").enable(true);
                        $("button[name=btnReclaimOrder]").data("kendoButton").enable(true);
                        $("button[name=btnBillNo]").data("kendoButton").enable(true);
                    }
                }
            });

            $(document).on("click", ".grid-checkAll", function(e){
                var grid;
                if(selectTabId === 'tabClaimReadyInfo'){
                    grid = $("#gridReady").data("kendoExtGrid");
                }else{
                    grid = $("#gridRequest").data("kendoExtGrid");
                }
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
                    initPage();
                }
            });

            // 조회 버튼
            $("#btnSearch").kendoButton({
                click:function(e){

                    $("#gridReady").data("kendoExtGrid").dataSource.read();
                    $("#gridRequest").data("kendoExtGrid").dataSource.read();
                }
            });

            // 클레임신청 버튼
            $("#btnRequestClaim").kendoButton({
                click:function(e){
                    var grid,
                        requestClaimList = [],
                        rows,
                        gridData,
                        chkRow;

                    if(selectTabId === 'tabClaimReadyInfo'){
                        grid = $("#gridReady").data("kendoExtGrid");
                    }else{
                        grid = $("#gridRequest").data("kendoExtGrid");
                    }
                    rows             = grid.tbody.find("tr");

                    rows.each(function(index, row) {
                        gridData = grid.dataSource.at(index);
                        chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        if(chkRow === true){
                            requestClaimList.push(gridData);
                        }
                    });

                    if(requestClaimList.length > 1){
                        // 1개의 라인만 선택가능합니다.
                        dms.notification.warning("<spring:message code='global.info.selectOneRowMsg' />");
                        return false;
                    }

                    // ready message
                    selectQualityClaimPopupWindow();

                }
            });

            // 클레임다운로드 버튼
            $("#btnDownloadClaim").kendoButton({
                click:function(e){

                    var grid,
                    excelFileName = "",
                    requestYn = 'N',
                    rows;

                    if(selectTabId === 'tabClaimReadyInfo'){
                        grid = $("#gridReady").data("kendoExtGrid");
                        excelFileName = "PartsQualityClaimDownloadStandBy.xlsx";

                    }else{
                        grid = $("#gridRequest").data("kendoExtGrid");
                        excelFileName = "PartsQualityClaimDownloadComplete.xlsx";
                        requestYn = 'Y';
                    }

                    rows = grid.tbody.find("tr");

                    if(rows.length === 0 || dms.string.isEmpty(rows)){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    dms.ajax.excelExport({
                        "beanName":"claimService"
                        ,"templateFile":"PartsQualityClaimDownload_Tpl.xlsx"
                        ,"fileName":excelFileName
                        ,"jobType":"claimDownload"
                        ,"sClaimCode":$("#sClaimCode").val()
                        ,"sOrderNo":$("#sOrderNo").val()
                        ,"sPartNo":$("#sItemCd").val()
                        ,"sCompensationWay":$("#sCompensationWay").data("kendoExtDropDownList").value()
                        ,"sStatus":$("#sStatus").data("kendoExtDropDownList").value()
                        ,"sDealMark":$("#sDealMark").data("kendoExtDropDownList").value()
                        ,"sCreateTimeFr":$("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value()
                        ,"sCreateTimeTo":$("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value()
                        ,"sWornStatus":$("#sWornStatus").data("kendoExtDropDownList").value()
                        ,"sHasSubmit":$("#sHasSubmit").data("kendoExtDropDownList").value()
                        ,"sDealDateFr":$("#sDealDateFr").data("kendoExtMaskedDatePicker").value()
                        ,"sDealDateTo":$("#sDealDateTo").data("kendoExtMaskedDatePicker").value()
                        ,"sHasArrived":$("#sHasArrived").data("kendoExtDropDownList").value()
                        ,"sIsCheck":$("#sIsCheck").data("kendoExtDropDownList").value()
                        ,"sBillNo":$("#sBillNo").val()
                        ,"recordCountPerPage" : 10000
                        ,"pageIndex"          : 1
                        ,"sRequestClaimYn"  : requestYn
                    });
                }
            });

            // 클레임리스트 다운로드 버튼
            $("#btnDownloadClaimList").kendoButton({
                enable:false
               ,click:function(e){

                    var grid,
                        requestYn,
                        excelFileName = "",
                        rows;

                    if(selectTabId === 'tabClaimReadyInfo'){
                        grid = $("#gridReady").data("kendoExtGrid");
                        requestYn = 'N';
                        excelFileName = "PartsQualityClaimListDownloadStandBy.xlsx";
                    }else{
                        grid = $("#gridRequest").data("kendoExtGrid");
                        requestYn = 'Y';
                        excelFileName = "PartsQualityClaimListDownloadComplete.xlsx";
                    }

                    rows     = grid.tbody.find("tr");

                    if(rows.length === 0 || dms.string.isEmpty(rows)){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    dms.ajax.excelExport({
                         "beanName":"claimService"
                        ,"templateFile":"PartsQualityClaimListDownload_Tpl.xlsx"
                        ,"fileName":excelFileName
                        ,"jobType":"claimListDownload"
                        ,"sClaimCode":$("#sClaimCode").val()
                        ,"sOrderNo":$("#sOrderNo").val()
                        ,"sPartNo":$("#sItemCd").val()
                        ,"sCompensationWay":$("#sCompensationWay").data("kendoExtDropDownList").value()
                        ,"sStatus":$("#sStatus").data("kendoExtDropDownList").value()
                        ,"sDealMark":$("#sDealMark").data("kendoExtDropDownList").value()
                        ,"sCreateTimeFr":$("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value()
                        ,"sCreateTimeTo":$("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value()
                        ,"sWornStatus":$("#sWornStatus").data("kendoExtDropDownList").value()
                        ,"sHasSubmit":$("#sHasSubmit").data("kendoExtDropDownList").value()
                        ,"sDealDateFr":$("#sDealDateFr").data("kendoExtMaskedDatePicker").value()
                        ,"sDealDateTo":$("#sDealDateTo").data("kendoExtMaskedDatePicker").value()
                        ,"sHasArrived":$("#sHasArrived").data("kendoExtDropDownList").value()
                        ,"sIsCheck":$("#sIsCheck").data("kendoExtDropDownList").value()
                        ,"sBillNo":$("#sBillNo").val()
                        ,"sRequestClaimYn"  : requestYn
                    });

                }
            });


            // 클레임건상태
            $("button[name=btnClaimStatus]").kendoButton({
                click:function(e){
                    fnSetQualityClaimStatusPopupWindow();
                }
            });

            // 회수운송장번호
            $("button[name=btnReclaimOrder]").kendoButton({
                click:function(e){
                    fnSetReClaimOrderPopupWindow();
                }
            });

            // 탁송표기
            $("button[name=btnDeliveryEnd]").kendoButton({
                click:function(e){

                    var grid     = $("#gridRequest").data("kendoExtGrid"),
                        rows     = grid.tbody.find("tr"),
                        gridData,
                        rowData,
                        saveData = {},
                        saveList = [],
                        chkRow;

                    if(rows.length === 0 || dms.string.isEmpty(rows)){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }else{

                        rows.each(function(index, row) {
                            gridData   = grid.dataSource.at(index);
                            chkRow     = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
                            rowData    = {};

                            if(chkRow === true){
                                if(dms.string.isEmpty(gridData.claimNo)){
                                    //클레임번호가 없습니다.
                                    dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.claimCode)){
                                    //클레임번호가 없습니다.
                                    dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                                    saveList = [];
                                    return false;
                                }

                                rowData.claimNo    = gridData.claimNo;
                                rowData.claimCode  = gridData.claimCode;
                                rowData.wornStatus = gridData.wornStatus;

                                saveList.push(rowData);
                            }

                        });
                    }

                    if(saveList.length > 0){
                        if (confirm("<spring:message code='par.info.claimIsCheck'/>") == true){    //확인

                            saveData = {"qualityClaimList":saveList};

                            $.ajax({
                                url:"<c:url value='/par/pcm/claim/sendQuelityClaimIsCheck.do' />"
                              , type:"POST"
                              , data:JSON.stringify(saveData)
                              , dataType:"json"
                              , contentType:'application/json'
                              , async:true
                              , success:function(result) {

                                  if (result == true) {
                                      dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.modifySuccessParam' arguments='${claim}'/>");
                                      grid.dataSource.read();
                                  } else {
                                      if(result === 0){
                                          dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                                      }
                                      // 에러 메시지 확인.
                                  }
                              }
                              ,beforeSend:function(){
                                  dms.loading.show($("#screenSection"));
                              }
                              ,complete:function(){
                                  dms.loading.hide($("#screenSection"));
                              }
                              , error:function(jqXHR,status,error) {
                                  dms.loading.hide($("#screenSection"));
                                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                              }
                          });

                        }else{   //취소
                            return false;
                        }
                    }
                }
            });


            // 영수증번호

            $("button[name=btnBillNo]").kendoButton({
                click:function(e){

                    var grid     = $("#gridRequest").data("kendoExtGrid"),
                        rows     = grid.tbody.find("tr"),
                        gridData,
                        rowData,
                        saveData = {},
                        saveList = [],
                        chkRow;

                    if(rows.length === 0 || dms.string.isEmpty(rows)){
                     // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }else{

                        rows.each(function(index, row) {
                            gridData   = grid.dataSource.at(index);
                            chkRow     = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
                            rowData    = {};

                            if(chkRow === true){
                                if(dms.string.isEmpty(gridData.claimNo)){
                                    //클레임번호가 없습니다.
                                    dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.claimCode)){
                                    //클레임번호가 없습니다.
                                    dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(dms.string.isEmpty(gridData.claimCode)){
                                    //클레임번호가 없습니다.
                                    dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                                    saveList = [];
                                    return false;
                                }

                                rowData.claimNo    = gridData.claimNo;
                                rowData.claimCode  = gridData.claimCode;
                                rowData.billNo     = gridData.billNo;

                                saveList.push(rowData);
                            }

                        });
                    }

                    if(saveList.length > 0){

                        saveData = {"qualityClaimList":saveList};

                        $.ajax({
                            url:"<c:url value='/par/pcm/claim/sendQualityClaimBillNo.do' />"
                          , type:"POST"
                          , data:JSON.stringify(saveData)
                          , dataType:"json"
                          , contentType:'application/json'
                          , async:true
                          , success:function(result) {

                              if (result == true) {
                                  dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.modifySuccessParam' arguments='${claim}'/>");
                                  grid.dataSource.read();
                              } else {
                                  if(result === 0){
                                      dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                                  }
                                  // 에러 메시지 확인.
                              }
                          }
                        ,beforeSend:function(){
                            dms.loading.show($("#screenSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#screenSection"));
                        }
                        , error:function(jqXHR,status,error) {
                            dms.loading.hide($("#screenSection"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                      });

                    }

                }
            });

         // 출력 버튼
            $("#btnPrint").kendoButton({
                click:function(e){
                    var grid,
                        requestClaimList = [],
                        rows,
                        gridData,
                        lClaimNo,
                        chkRow;

                    if(selectTabId === 'tabClaimReadyInfo'){
                        grid = $("#gridReady").data("kendoExtGrid");
                    }else{
                        grid = $("#gridRequest").data("kendoExtGrid");
                    }

                    rows = grid.tbody.find("tr");

                    rows.each(function(index, row) {
                        gridData = grid.dataSource.at(index);
                        chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        if(chkRow === true){
                            requestClaimList.push(gridData);
                        }
                    });

                    if(requestClaimList.length !== 1){
                        // 1개의 라인만 선택가능합니다.
                        dms.notification.warning("<spring:message code='global.info.selectOneRowMsg' />");
                        return false;
                    }
                    lClaimNo = requestClaimList[0].claimNo;

                    if(dms.string.isEmpty(lClaimNo)){
                        dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                    }
                    parent._createOrReloadTabMenu("<spring:message code='par.title.qualityClaim'/>", "<c:url value='/ReportServer?reportlet=par/selectQualityCliam.cpt'/>&sDlrCd=${dlrCd}&sClaimNo="+lClaimNo);
                }
            });

            // 품질클레임  그리드
            $("#gridReady").kendoExtGrid({
                gridId:"G-PAR-1223-103301"
               ,height:470
               ,dataSource:{
                    transport:{
                        read:{
                             url:"<c:url value='/par/pcm/claim/selectQualityClaimByCondition.do' />"
                        }
                        , parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"] = options.pageSize;
                                params["pageIndex"]          = options.page;
                                params["firstIndex"]         = options.skip;
                                params["lastIndex"]          = options.skip + options.take;
                                params["sort"]               = options.sort;

                                // 품질클레임 검색조건 코드.
                                params["sClaimCode"]       = $("#sClaimCode").val();
                                params["sOrderNo"]         = $("#sOrderNo").val();
                                params["sPartNo"]          = $("#sItemCd").val();
                                params["sCompensationWay"] = $("#sCompensationWay").data("kendoExtDropDownList").value();
                                params["sStatus"]          = $("#sStatus").data("kendoExtDropDownList").value();
                                params["sDealMark"]        = $("#sDealMark").data("kendoExtDropDownList").value();
                                params["sCreateTimeFr"]    = $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value();
                                params["sCreateTimeTo"]    = $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value();
                                params["sWornStatus"]      = $("#sWornStatus").data("kendoExtDropDownList").value();
                                params["sHasSubmit"]       = $("#sHasSubmit").data("kendoExtDropDownList").value();
                                params["sDealDateFr"]      = $("#sDealDateFr").data("kendoExtMaskedDatePicker").value();
                                params["sDealDateTo"]      = $("#sDealDateTo").data("kendoExtMaskedDatePicker").value();
                                params["sHasArrived"]      = $("#sHasArrived").data("kendoExtDropDownList").value();
                                params["sIsCheck"]         = $("#sIsCheck").data("kendoExtDropDownList").value();
                                params["sBillNo"]          = $("#sBillNo").val();
                                params["sRequestClaimYn"]  = 'N';

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
                        ,total:"total"
                        ,model:{
                           id:"claimNo"
                          ,fields:{
                                  dlrCd               :{ type:"string" , validation:{required:true} }
                                , chk                 :{ type:"boolean" ,editable  :false}
                                , claimNo             :{ type:"string" ,editable  :false}
                                , claimCode           :{ type:"string" ,editable  :false}
                                , partNo              :{ type:"string" ,editable  :false}
                                , partNm              :{ type:"string" ,editable  :false}
                                , claimNum            :{ type:"number" ,editable  :false}
                                , dealerClaimWay      :{ type:"number" ,editable  :false}
                                , totalMoneyTax       :{ type:"number" ,editable  :false}
                                , claimCategory       :{ type:"number" ,editable  :false}
                                , responsibility      :{ type:"number" ,editable  :false}
                                , status              :{ type:"string" ,editable  :false}
                                //, added              :{ type:"string" ,editable  :false}
                                , dealDate            :{ type:"date"   ,editable  :false}
                                , dealMark            :{ type:"string" ,editable  :false}
                                , wornDeal            :{ type:"number" ,editable  :false}
                                , wornStatus          :{ type:"string" ,editable  :false}
                                , isCheck             :{ type:"string" ,editable  :false}
                                , hasArrived          :{ type:"string" ,editable  :false}
                                , wornArrivalNum      :{ type:"number" ,editable  :false}
                                , hasSubmit           :{ type:"string" ,editable  :false}
                                , transportNo         :{ type:"string" ,editable  :false}
                                , billNo              :{ type:"string" ,editable  :true}
                                , orderNo             :{ type:"string" ,editable  :false}
                            }
                        }
                    }
                }
                , selectable :"multiple"
                , scrollable :true
                , sortable   :false
                , autoBind   :false
                , filterable:false
                , edit:function(e){
                    var eles = e.container.find("input"),
                        rows = e.sender.select(),
                        selectedItem = e.sender.dataItem(rows[0]),
                        grid = this,
                        input = e.container.find(".k-input"),
                        pVal,
                        orgVal,
                        fieldName = grid.columns[e.container.index()].field;

                    if(fieldName === "billNo"){
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                    }
                }
                , appendEmptyColumn:true
                , editable  :true
                , columns:[
                      {
                         field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                        ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                        ,sortable:false
                        ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                      }
                     ,{   //딜러코드
                          title:"<spring:message code='par.lbl.dlrCd' />"
                         ,field:"dlrCd"
                         ,width:80
                         ,hidden:true
                      }
                    , {   //클레임번호
                          title:"<spring:message code='par.lbl.claimDocNo' />"
                         ,field:"claimNo"
                         ,width:100
                         ,hidden:true
                      }
                    , {   //클레임번호
                          title:"<spring:message code='par.lbl.claimNo' />"
                         ,field:"claimCode"
                         ,width:140
                      }
                    , {   //부품번호
                          title:"<spring:message code='par.lbl.itemCd' />"
                         ,field:"partNo"
                         ,width:100
                      }
                    , {   //부품명
                          title:"<spring:message code='par.lbl.itemNm' />"
                         ,field:"partNm"
                         ,width:200
                      }
                    , {   //클레임수량
                          title:"<spring:message code='par.lbl.qualityClaimQty' />"
                         ,field:"claimNum"
                         ,width:80
                         ,attributes:{"class":"ar"}
                         ,format:"{0:n0}"
                         ,decimal:0
                      }
                    , {   //클레임방식
                          title:"<spring:message code='par.lbl.dealerClaimWay' />"
                         ,field:"dealerClaimWay"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeDealerClaimWay(dealerClaimWay)#'
                      }
                    , {   //배상 총금액(세금포함)
                          title:"<spring:message code='par.lbl.totalMoneyTax' />"
                         ,field:"totalMoneyTax"
                         ,width:120
                         ,attributes:{"class":"ar"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //유형표기
                          title:"<spring:message code='par.lbl.claiCategory' />"
                         ,field:"claimCategory"
                         ,width:100
                         ,attributes:{"class":"al"}
                         ,template:'#= changeClaiCategory(claimCategory)#'
                      }
                    , {   //책임표기
                          title:"<spring:message code='par.lbl.responsibility' />"
                         ,field:"responsibility"
                         ,width:120
                         ,attributes:{"class":"al"}
                         ,template:'#= changeResponsibility(responsibility)#'
                      }
//                     , {   //클레임번호
//                         title:"<spring:message code='sal.lbl.addDocument' />"
//                        ,field:"claimCode"
//                        ,width:140
//                     }
                    , {   //처리상태
                          title:"<spring:message code='par.lbl.procStatus' />"
                         ,field:"status"
                         ,width:90
                         ,attributes:{"class":"ac"}
                         ,template:'#= changeStatus(status)#'
                      }
                    , {   //배상년월
                          title:"<spring:message code='par.lbl.dealYm' />"
                         ,field:"dealDate"
                         ,width:100
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                             ,attributes:{"class":"ac"}
                      }
                    , {   //배상표기
                          title:"<spring:message code='par.lbl.dealMark' />"
                         ,field:"dealMark"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeDealMark(dealMark)#'
                      }
                    , {   //클레임처리
                          title:"<spring:message code='par.lbl.wornDeal' />"
                         ,field:"wornDeal"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeWornDeal(wornDeal)#'
                      }
                    , {   //클레임상태
                          title:"<spring:message code='par.lbl.claimStatus' />"
                         ,field:"wornStatus"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeWornStatus(wornStatus)#'
                      }
                    , {   //탁송여부
                          title:"<spring:message code='par.lbl.isCheck' />"
                         ,field:"isCheck"
                         ,width:80
                         ,attributes:{"class":"ac"}
                         ,template:'#= changeIsCheck(isCheck)#'
                      }
                    , {   //도착여부
                          title:"<spring:message code='par.lbl.isArrived' />"
                         ,field:"hasArrived"
                         ,width:80
                         ,attributes:{"class":"ac"}
                         ,template:'#= changeHasArrived(hasArrived)#'
                      }
                    , {   //도착수량
                          title:"<spring:message code='par.lbl.arrivedQty' />"
                         ,field:"wornArrivalNum"
                         ,width:100
                         ,attributes:{"class":"ar"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //변상수령증
                          title:"<spring:message code='par.lbl.hasSubmit' />"
                         ,field:"hasSubmit"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeHasSubmit(hasSubmit)#'
                      }
                    , {   //화물운송장번호
                          title:"<spring:message code='par.lbl.transportNo' />"
                         ,field:"transportNo"
                         ,width:100
                      }
                    , { //영수증번호
                          title:"<spring:message code='par.lbl.billNo' />"
                         ,field:"billNo"
                         ,width:100
                      }
                    , {   //오더번호
                        title:"<spring:message code='par.lbl.purcOrdNo' />"
                       ,field:"orderNo"
                       ,width:120
                    }
                ]
            });

            // 품질클레임  그리드
            $("#gridRequest").kendoExtGrid({
                gridId:"G-PAR-1223-103302"
               ,height:470
               ,dataSource:{
                    transport:{
                        read:{
                             url:"<c:url value='/par/pcm/claim/selectQualityClaimByCondition.do' />"
                        }
                        , parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"] = options.pageSize;
                                params["pageIndex"]          = options.page;
                                params["firstIndex"]         = options.skip;
                                params["lastIndex"]          = options.skip + options.take;
                                params["sort"]               = options.sort;

                                // 품질클레임 검색조건 코드.
                                params["sClaimCode"]       = $("#sClaimCode").val();
                                params["sOrderNo"]         = $("#sOrderNo").val();
                                params["sPartNo"]          = $("#sItemCd").val();
                                params["sCompensationWay"] = $("#sCompensationWay").data("kendoExtDropDownList").value();
                                params["sStatus"]          = $("#sStatus").data("kendoExtDropDownList").value();
                                params["sDealMark"]        = $("#sDealMark").data("kendoExtDropDownList").value();
                                params["sCreateTimeFr"]    = $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value();
                                params["sCreateTimeTo"]    = $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value();
                                params["sWornStatus"]      = $("#sWornStatus").data("kendoExtDropDownList").value();
                                params["sHasSubmit"]       = $("#sHasSubmit").data("kendoExtDropDownList").value();
                                params["sDealDateFr"]      = $("#sDealDateFr").data("kendoExtMaskedDatePicker").value();
                                params["sDealDateTo"]      = $("#sDealDateTo").data("kendoExtMaskedDatePicker").value();
                                params["sHasArrived"]      = $("#sHasArrived").data("kendoExtDropDownList").value();
                                params["sIsCheck"]         = $("#sIsCheck").data("kendoExtDropDownList").value();
                                params["sBillNo"]          = $("#sBillNo").val();
                                params["sRequestClaimYn"]  = 'Y';

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
                        ,total:"total"
                        ,model:{
                           id:"claimNo"
                          ,fields:{
                                  dlrCd               :{ type:"string" , validation:{required:true} }
                                , chk                 :{ type:"boolean" ,editable  :false}
                                , claimNo             :{ type:"string" ,editable  :false}
                                , claimCode           :{ type:"string" ,editable  :false}
                                , partNo              :{ type:"string" ,editable  :false}
                                , vin                 :{ type:"string" ,editable  :false}
                                , engineCylinder      :{ type:"string" ,editable  :false}
                                , partNm              :{ type:"string" ,editable  :false}
                                , claimNum            :{ type:"number" ,editable  :false}
                                , dealerClaimWay      :{ type:"number" ,editable  :false}
                                , totalMoneyTax       :{ type:"number" ,editable  :false}
                                , claimCategory       :{ type:"number" ,editable  :false}
                                , responsibility      :{ type:"number" ,editable  :false}
                                , added              :{ type:"string" ,editable  :false}
                                , status              :{ type:"string" ,editable  :false}
                                , dealDate            :{ type:"date"   ,editable  :false}
                                , dealMark            :{ type:"string" ,editable  :false}
                                , wornDeal            :{ type:"number" ,editable  :false}
                                , wornStatus          :{ type:"string" ,editable  :false}
                                , isCheck             :{ type:"string" ,editable  :false}
                                , hasArrived          :{ type:"string" ,editable  :false}
                                , wornArrivalNum      :{ type:"number" ,editable  :false}
                                , hasSubmit           :{ type:"string" ,editable  :false}
                                , transportNo         :{ type:"string" ,editable  :false}
                                , billNo              :{ type:"string" ,editable  :true}
                                , orderNo             :{ type:"string" ,editable  :false}
                            }
                        }
                    }
                }
                , selectable :"multiple"
                , scrollable :true
                , sortable   :false
                , autoBind   :false
                , filterable:false
                , edit:function(e){
                    var eles = e.container.find("input"),
                        rows = e.sender.select(),
                        selectedItem = e.sender.dataItem(rows[0]),
                        grid = this,
                        input = e.container.find(".k-input"),
                        pVal,
                        orgVal,
                        fieldName = grid.columns[e.container.index()].field;

                    if(fieldName === "billNo"){
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                    }
                }
                , appendEmptyColumn:true
                , editable  :true
                , columns:[
                      {
                         field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                        ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                        ,sortable:false
                        ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                      }
                     ,{   //딜러코드
                          title:"<spring:message code='par.lbl.dlrCd' />"
                         ,field:"dlrCd"
                         ,width:80
                         ,hidden:true
                      }
                    , {   //클레임번호
                          title:"<spring:message code='par.lbl.claimDocNo' />"
                         ,field:"claimNo"
                         ,width:100
                         ,hidden:true
                      }
                    , {   //클레임번호
                          title:"<spring:message code='par.lbl.claimNo' />"
                         ,field:"claimCode"
                         ,width:140
                      }
                    , {   //부품번호
                          title:"<spring:message code='par.lbl.itemCd' />"
                         ,field:"partNo"
                         ,width:100
                      }
                    , {field:"vin" ,title:"<spring:message code='par.lbl.vin' />" ,width:100 }//VIN
                    , {field:"engineCylinder" ,title:"<spring:message code='par.lbl.enginNo' />" ,width:100 }//engineNo
                    , {   //부품명
                          title:"<spring:message code='par.lbl.itemNm' />"
                         ,field:"partNm"
                         ,width:200
                      }
                    , {   //클레임수량
                          title:"<spring:message code='par.lbl.qualityClaimQty' />"
                         ,field:"claimNum"
                         ,width:80
                         ,attributes:{"class":"ar"}
                         ,format:"{0:n0}"
                         ,decimal:0
                      }
                    , {   //클레임방식
                          title:"<spring:message code='par.lbl.dealerClaimWay' />"
                         ,field:"dealerClaimWay"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeDealerClaimWay(dealerClaimWay)#'
                      }
                    , {   //배상 총금액(세금포함)
                          title:"<spring:message code='par.lbl.totalMoneyTax' />"
                         ,field:"totalMoneyTax"
                         ,width:120
                         ,attributes:{"class":"ar"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //유형표기
                          title:"<spring:message code='par.lbl.claiCategory' />"
                         ,field:"claimCategory"
                         ,width:100
                         ,attributes:{"class":"al"}
                         ,template:'#= changeClaiCategory(claimCategory)#'
                      }
                    , {   //책임표기
                          title:"<spring:message code='par.lbl.responsibility' />"
                         ,field:"responsibility"
                         ,width:120
                         ,attributes:{"class":"al"}
                         ,template:'#= changeResponsibility(responsibility)#'
                      }
                    , {   //클레임번호
                        title:"<spring:message code='sal.lbl.addDocument' />"
                       ,field:"added"
                       ,width:140
                    }
                    , {   //처리상태
                          title:"<spring:message code='par.lbl.procStatus' />"
                         ,field:"status"
                         ,width:90
                         ,attributes:{"class":"ac"}
                         ,template:'#= changeStatus(status)#'
                      }
                    , {   //배상년월
                          title:"<spring:message code='par.lbl.dealYm' />"
                         ,field:"dealDate"
                         ,width:100
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                             ,attributes:{"class":"ac"}
                      }
                    , {   //배상표기
                          title:"<spring:message code='par.lbl.dealMark' />"
                         ,field:"dealMark"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeDealMark(dealMark)#'
                      }
                    , {   //클레임처리
                          title:"<spring:message code='par.lbl.wornDeal' />"
                         ,field:"wornDeal"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeWornDeal(wornDeal)#'
                      }
                    , {   //클레임상태
                          title:"<spring:message code='par.lbl.claimStatus' />"
                         ,field:"wornStatus"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeWornStatus(wornStatus)#'
                      }
                    , {   //탁송여부
                          title:"<spring:message code='par.lbl.isCheck' />"
                         ,field:"isCheck"
                         ,width:80
                         ,attributes:{"class":"ac"}
                         ,template:'#= changeIsCheck(isCheck)#'
                      }
                    , {   //도착여부
                          title:"<spring:message code='par.lbl.isArrived' />"
                         ,field:"hasArrived"
                         ,width:80
                         ,attributes:{"class":"ac"}
                         ,template:'#= changeHasArrived(hasArrived)#'
                      }
                    , {   //도착수량
                          title:"<spring:message code='par.lbl.arrivedQty' />"
                         ,field:"wornArrivalNum"
                         ,width:100
                         ,attributes:{"class":"ar"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //변상수령증
                          title:"<spring:message code='par.lbl.hasSubmit' />"
                         ,field:"hasSubmit"
                         ,width:80
                         ,attributes:{"class":"al"}
                         ,template:'#= changeHasSubmit(hasSubmit)#'
                      }
                    , {   //화물운송장번호
                          title:"<spring:message code='par.lbl.transportNo' />"
                         ,field:"transportNo"
                         ,width:100
                      }
                    , { //영수증번호
                          title:"<spring:message code='par.lbl.billNo' />"
                         ,field:"billNo"
                         ,width:100
                      }
                    , {   //오더번호
                        title:"<spring:message code='par.lbl.purcOrdNo' />"
                       ,field:"orderNo"
                       ,width:120
                    }
                ]
            });

            // 그리드 더블 클릭 이벤트.
            $("#gridReady").on("dblclick", "tr.k-state-selected", function (e) {
                selectQualityClaimPopupWindow("N");
            });

            $("#gridRequest").on("dblclick", "tr.k-state-selected", function (e) {
                selectQualityClaimPopupWindow("Y");
            });

            // Yes or No
            changeYesNo = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = ynObj[val];
                }
                return returnVal;
            };

            // 클레임방식
            changeDealerClaimWay = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = clWayObj[val];
                }
                return returnVal;
            };

            // 처리상태
            changeStatus = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = statusObj[val];
                }
                return returnVal;
            };

            // 배상표기
            changeDealMark = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = dealMarkObj[val];
                }
                return returnVal;
            };

            // 클레임처리
            changeWornDeal = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = ynObj[val];
                }
                return returnVal;
            };

            //클레임상태
            changeWornStatus = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = clStatusObj[val];
                }
                return returnVal;
            };

            // 탁송여부
            changeIsCheck = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = isCheckObj[val];
                }
                return returnVal;
            };

            // 도착여부
            changeHasArrived = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = hasArrivedObj[val];
                }
                return returnVal;
            };

            // 변상수령증
            changeHasSubmit = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = hasSubmitObj[val];
                }
                return returnVal;
            };

            // 책임표기
            changeResponsibility = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = responsibilityObj[val];
                }
                return returnVal;
            };

            // 유형표기
            changeClaiCategory = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = claiCategoryObj[val];
                }
                return returnVal;
            };

            initPage();
        });

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

            $("#gridReady").data("kendoExtGrid").dataSource.data([]);
            $("#gridRequest").data("kendoExtGrid").dataSource.data([]);

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();


            /*
            $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value(toDt);
            $("#sDealDateFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sDealDateTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            $("#sDealDateFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sDealDateTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            */

            selectTabId = "tabClaimReadyInfo";      // 실운전자
            $("button[name=btnDeliveryEnd]").data("kendoButton").enable(false);
            $("button[name=btnClaimStatus]").data("kendoButton").enable(false);
            $("button[name=btnReclaimOrder]").data("kendoButton").enable(false);
            $("button[name=btnBillNo]").data("kendoButton").enable(false);

            $("#btnDownloadClaimList").hide();
        }

        //품질클레임 팝업 열기 함수.
        function selectQualityClaimPopupWindow(claimEndYn){

            var grid,
                rows,
                gridData,
                claimNo;

            if(selectTabId === 'tabClaimReadyInfo'){
                grid = $("#gridReady").data("kendoExtGrid");
            }else{
                grid = $("#gridRequest").data("kendoExtGrid");
            }
            rows     = grid.select();
            gridData = grid.dataItem(rows[0]);
            if(rows.length === 0 || dms.string.isEmpty(rows)){
                claimNo = '';
            }else{
                if(dms.string.isEmpty(gridData.claimNo)){
                    claimNo = '';
                }else{
                    claimNo = gridData.claimNo;
                }
            }

            qualityClaimPopupWindow = dms.window.popup({
                windowId:"qualityClaimPopup"
                , title:"<spring:message code='par.title.qualityClaim' />"   // 기술품질클레임
                , width:860
                , height:450
                , content:{
                    url:"<c:url value='/par/cmm/selectQualityClaimPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind":false
                        , "claimNo":claimNo
                        , "claimEndYn": claimEndYn
                        , "selectable":"single"
                        , "callbackFunc":function(data){
                            grid.dataSource.read();
                            qualityClaimPopupWindow.close();
                        }
                    }
                }
            });
        }

        //품질클레임 클레임건상태.
        function fnSetQualityClaimStatusPopupWindow(){

            var grid       = $("#gridRequest").data("kendoExtGrid"),
                rows       = grid.tbody.find("tr"),
                saveList   = [],
                gridData,
                claimCode,
                chkRow,
                claimNo;

            if(rows.length === 0 || dms.string.isEmpty(rows)){

                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }else{


                rows.each(function(index, row) {
                    gridData   = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    /*
                    if(dms.string.isEmpty(gridData.isCheck)){
                        //탁송여부 정보는 필수 입력 사항입니다.
                        dms.notification.warning("<spring:message code='par.lbl.isCheck' var='isCheck' /><spring:message code='global.info.required.field' arguments='${isCheck}'/>");
                        return false;
                    }
                    */

                    if(chkRow === true){
                        if(dms.string.isEmpty(gridData.claimNo)){
                            //클레임번호가 없습니다.
                            dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.claimCode)){
                            //클레임번호가 없습니다.
                            dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                            saveList = [];
                            return false;
                        }
                        var rowData = {'claimNo':gridData.claimNo, 'claimCode':gridData.claimCode};

                        saveList.push(rowData);
                    }
                });

            }

            if(saveList.length > 0){
                setQualityClaimStatusPopupWindow = dms.window.popup({
                    windowId:"setQualityClaimStatusPopup"
                    , title:"<spring:message code='par.title.claimStatus' />"   // 기술품질클레임
                    , width:250
                    , height:200
                    , content:{
                        url:"<c:url value='/par/cmm/setQualityClaimStatusPopup.do'/>"
                        , data:{
                            "type":""
                            , "autoBind"    :false
                            , "data"        :saveList
                            , "selectable"  :"single"
                            , "callbackFunc":function(data){
                                grid.dataSource.read();
                                setQualityClaimStatusPopupWindow.close();
                            }
                        }
                    }
                });
            }
        }

        //품질클레임 회수운송장번호.
        function fnSetReClaimOrderPopupWindow(){

            var grid       = $("#gridRequest").data("kendoExtGrid"),
                rows       = grid.tbody.find("tr"),
                saveList   = [],
                gridData,
                claimCode,
                chkRow,
                claimNo;

            if(rows.length === 0 || dms.string.isEmpty(rows)){

                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }else{


                rows.each(function(index, row) {
                    gridData   = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    /*
                    if(dms.string.isEmpty(gridData.isCheck)){
                        //탁송여부 정보는 필수 입력 사항입니다.
                        dms.notification.warning("<spring:message code='par.lbl.isCheck' var='isCheck' /><spring:message code='global.info.required.field' arguments='${isCheck}'/>");
                        return false;
                    }
                    */

                    if(chkRow === true){

                        if(dms.string.isEmpty(gridData.claimNo)){
                            //클레임번호가 없습니다.
                            dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.claimCode)){
                            //클레임번호가 없습니다.
                            dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                            saveList = [];
                            return false;
                        }

                        var rowData = {'claimNo':gridData.claimNo, 'claimCode':gridData.claimCode};

                        saveList.push(rowData);
                    }
                });
            }

            if(saveList.length > 0){
                setReClaimOrderPopupWindow = dms.window.popup({
                    windowId:"setReClaimOrderPopup"
                    , title:"<spring:message code='par.title.qualityClaim' />"   // 기술품질클레임
                    , width:250
                    , height:200
                    , content:{
                        url:"<c:url value='/par/cmm/setReClaimOrderPopup.do'/>"
                        , data:{
                            "type":""
                            , "autoBind"    :false
                            , "data"        :saveList
                            , "selectable"  :"single"
                            , "callbackFunc":function(data){
                                grid.dataSource.read();
                                setReClaimOrderPopupWindow.close();
                            }
                        }
                    }
                });
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
                if(id === 'sCreateTimeFr'){
                    var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sCreateTimeTo'){
                    var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();

                    $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }else if(id === 'sDealDateFr'){
                    var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sDealDateFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sDealDateTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sDealDateTo'){
                    var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();

                    $("#sDealDateTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sDealDateFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sCreateTimeFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sCreateTimeTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }else if(id === 'sDealDateFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sDealDateTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sDealDateTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sDealDateFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
         }
</script>
<!-- //script -->


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

    <!--재고실사대상선정 -->
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
    			<dms:access viewId="VIEW-D-11882" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
    			</dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11881" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave" class="btn_m btn_m_min5"><spring:message code="par.btn.save" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11880" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCnfm" class="btn_m btn_m_min5"><spring:message code="par.btn.fix" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11879" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCncl" class="btn_m btn_m_min5"><spring:message code="par.btn.cancel" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11878" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnPrint" class="btn_m btn_m_min5"><spring:message code="par.btn.print" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11877" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSearch" class="btn_m btn_search btn_m_min5"><spring:message code="par.btn.search" /></button>
                </dms:access>
            </div>
        </div>
        <div id="searchForm">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:21%;">
                        <col style="width:9%;">
                        <col style="width:21%;">
                        <col style="width:9%;">
                        <col style="width:21%;">
                        <col style="width:9%;">
                        <col style="width:21%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.bpTpNm" /></th>
                            <td>
                                <input id="bpTp" class="form_comboBox" data-type="combo" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemBpNm" /></th>
                            <td>
                                <input id="sBpCdList" type="text" data-type="multicombo" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.strge" /></th>
                            <td>
                                <input type="text" id="sStrgeCd" type="text" data-type="multicombo" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.locationCd" /></th>
                            <td>
                                <input id="sLocCd" class="form_input" />
                            </td>
                            <th scope="row" class="hidden"><spring:message code="par.lbl.stockStat" /></th>
                            <td>
                                <input id="sStockStatCd" class="form_comboBox hidden" data-type="combo" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.lastGrDt" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sLastGrDtFr" class="form_datepicker" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sLastGrDtTo" class="form_datepicker" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.lastGiDt" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sLastGiDtFr" class="form_datepicker" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sLastGiDtTo" class="form_datepicker" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemDstinCd" /></th>
                            <td>
                                <input id="sItemDstinCd" class="form_comboBox" data-type="combo" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.locationCd" /> 2</th>
                            <td>
                                <input id="sLocCdMig" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /></th>
                            <td>
                                <input type="text" id="sItemCd" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemNm" /></th>
                            <td>
                                <input id="sItemNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.abcInd" /></th>
                            <td>
                                <input id="sAbcInd" class="form_comboBox" data-type="combo" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.stockCost" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sStockCostFrom" class="form_numeric ar" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sStockCostTo" class="form_numeric ar" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
         </div>
    </section>

    <section class="group" id="investForm">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.searchPartsList" /></h2>
            </div>
            <div class="table_grid">
                <div id="searchGrid" class="grid"></div>
            </div>

            <div class="table_form form_width_70per mt5" role="search">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="stockDdDocNo" readonly class="form_input form_readonly" />
                                <a id="searchStockDdDocNo"></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.invDocRegDt" /></th>
                        <td>
                            <input type="text" id="regDt" class="form_datepicker" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.investigationPrsId" /></th>
                        <td>
                            <div class="form_search">
                                <input type="hidden" id="prsnId" readonly class="form_input" />
                                <input type="text" id="prsnNm" readonly class="form_input" />
                                <a id="searchPrsnId"></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockLockYn" /></th>
                        <td>
                            <input type="text" id="stockLockYn" class="form_comboBox"  data-type="combo" />
                            <input type="hidden" id="orgStockLockYn" />
                            <input type="text" id="updtDtStr" class="form_input hidden" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.investigationConfPsn" /></th>
                        <td class="readonly_area">
                            <input type="text" id="regUsrNm"  class="form_input" readonly />
                            <input type="hidden" id="docStatCd" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationConfDt" /></th>
                        <td class="readonly_area">
                            <input type="text" id="stockIvstPlanDt" class="form_datepicker" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationReqDt" /></th>
                        <td class="readonly_area">
                            <input type="text" id="approveReqDt" class="form_datepicker" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationApprDt" /></th>
                        <td class="readonly_area">
                            <input type="text" id="endDt" class="form_datepicker" readonly / >
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.selectPartsList" /></h2>
            	<div class="btn_right" >
                 <dms:access viewId="VIEW-D-13322" hasPermission="${dms:getPermissionMask('READ')}">
            	     <span style="color:red;" id="infoSpan" ><spring:message code="par.info.stockDdCreate" /></span>
                     <button id="btnAddForStrge" class="btn_s btn_Select btn_s_min5"><spring:message code="par.btn.stockDdCreate" /></button>
                 </dms:access> 
                <dms:access viewId="VIEW-D-11884" hasPermission="${dms:getPermissionMask('READ')}">
                    <%-- <button id="btnAdd" class="btn_s btn_Select btn_s_min5"><spring:message code="par.btn.add" /></button> --%>
                    <button id="btnAddNew" class="btn_s btn_Select btn_s_min5"><spring:message code="par.btn.add" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11883" hasPermission="${dms:getPermissionMask('READ')}">
                    <%-- <button id="btnDelItem" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /></button> --%>
                    <button id="btnDelItemNew" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /></button>
                </dms:access>
                </div>
            </div>
            <!-- <div class="table_grid">
                <div id="selectGrid" class="grid"></div>
            </div> -->
            <div class="table_grid mt10">
                <div id="partGrid" class="grid"></div>
            </div>
    </section>

<!-- script -->
<script>
        //------liuxueying add start------
        var infoSpanflag = $("#btnAddForStrge").hasClass('hidden');
        if(infoSpanflag){
        	$("#infoSpan").hide();
        }else{
        	$("#infoSpan").show();
        }
      //------liuxueying add end------
        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            binLocLvlCnt        = "${binLocLvlCnt}",
            stockDdDocNo        = "${stockDdDocNo}",
            docStatCd           = "${docStatCd}",
            purcOrdTpObj        = {},
            popItemObj          = {},
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
            binLocLevelList     = [],
            stockStatList       = [],
            stockStatObj        = {},
            itemDstinCdList     = [],
            itemDstinCdObj      = {},
            abcIndList          = [],
            abcIndObj           = {},
            carlineCdList       = [],
            carlineCdObj        = [],
            searchStorageCdList = [], //array로 받는 것은 list로 뿌려주기 위함
            storageCdList       = [], //array로 받는 것은 list로 뿌려주기 위함
            storageList         = [],
            storageObj          = {},
            stockLockYnList     = [],
            bpTpList            = [],
            bpTpMap             = {},
            bpCdList            = [],
            bpCdObj             = {},
            userSearchPopupWin;

        //창고 선택
        searchStorageCdList.push({"cmmCd":" ", "cmmCdNm":"选择取消", "useYn":""});
        storageCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${storageList}" varStatus="status"> //key value
            searchStorageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            storageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        stockLockYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
        stockLockYnList.push({cmmCd:"N", cmmCdNm:"No"});

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${binLocLevelList}" varStatus="status">
            binLocLevelList["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            if("${obj.useYn}" !== 'N'){
                itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        abcIndList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        abcIndObj[' '] = "";
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        carlineCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        carlineCdObj[' '] = "";
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        stockStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        stockStatObj[' '] = "";
        <c:forEach var="obj" items="${stockStatList}" varStatus="status">
            stockStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            stockStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${bpTpList}" varStatus="status">
            bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //bpTpMap
        $.each(bpTpList, function(idx, obj){
            bpTpMap[obj.cmmCd] = obj.cmmCdNm;
        });
        bpCdObj[0] = [];
        bpCdObj[0].push({"cmmCd":" ", "cmmCdNm":"选择取消"});
        bpCdObj[1] = [];
        bpCdObj[1].push({"cmmCd":" ", "cmmCdNm":"选择取消"});
        bpCdObj[2] = [];
        bpCdObj[2].push({"cmmCd":" ", "cmmCdNm":"选择取消"});
        <c:forEach var="obj" items="${bpCdList}" varStatus="status">
            bpCdObj[0].push({"cmmCd":"${obj.bpCd}", "cmmCdNm":"${obj.bpNm}"});
            if("${obj.bpTp}" === '01'){
                bpCdObj[1].push({"cmmCd":"${obj.bpCd}", "cmmCdNm":"${obj.bpNm}"});
            }else{
                bpCdObj[2].push({"cmmCd":"${obj.bpCd}", "cmmCdNm":"${obj.bpNm}"});
            }
        </c:forEach>

    //insert or update Investigation
    function saveInvestigation(docStatCd){

        var saveList = [],
        grid = $("#selectGrid").data("kendoExtGrid"),
        rows = grid.tbody.find("tr"),
        lCrud = '',
        paramUrl = '',
        chkRow,
        header;

        //strgeCd
        var strgeCd = $("#sStrgeCd").val();
        //invDocRegDt
        var regDt = $("#regDt").data("kendoExtMaskedDateTimePicker").value();
        //investigationPrsId
        var prsnId = $("#prsnId").val();
        var prsnNm = $("#prsnNm").val();

        if(dms.string.isEmpty(regDt)){
            //invDocRegDt required message.
            dms.notification.warning("<spring:message code='par.lbl.invDocRegDt' var='invDocRegDt' /><spring:message code='global.info.required.field' arguments='${invDocRegDt}'/>");
            return false;
        }

        if(dms.string.isEmpty(prsnId)){
            //investigationPrsId required message.
            dms.notification.warning("<spring:message code='par.lbl.investigationPrsId' var='investigationPrsId' /><spring:message code='global.info.required.field' arguments='${investigationPrsId}'/>");
            return false;
        }
        //insert or update row select.
        if(docStatCd == "RGST"){//재고실사 요청일때 부품행 수 체크.
            if(rows.length  == 0 ){
                //unselected message.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }
        }

        //row validation check
        rows.each(function(index, row) {
            var gridData = grid.dataSource.at(index);
            chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

            if(chkRow === true){

                if(dms.string.isEmpty(gridData.itemCd)){
                    //itemCd not exist.
                    dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.itemInsertNotMsg' arguments='${itemCd}'/>");
                    saveList = [];
                    return false;
                }

                if(dms.string.isEmpty(gridData.unitCd)){
                    //unitCd not exist.
                    dms.notification.warning("<spring:message code='par.lbl.unitNm' var='unitNm' /><spring:message code='par.info.itemInsertNotMsg' arguments='${unitNm}'/>");
                    saveList = [];
                    return false;
                }

                if(gridData.stockLockYn === 'Y'){
                    //stockLockMsg
                    dms.notification.warning("<spring:message code='par.err.stockLockMsgParam' arguments='"+ gridData.itemCd + "'/>");
                    saveList = [];
                    return false;
                }

                saveList.push({
                    locCd     :gridData.locCd
                   ,itemCd    :gridData.itemCd
                   ,unitCd    :gridData.unitCd
                   ,strgeCd   :gridData.strgeCd
                   ,bookQty   :gridData.bookQty
                   ,ddQty     :gridData.ddQty
                });
            }
        });

        //stock action header
        header = {
               strgeCd:strgeCd
               ,stockDdDocNo:$("#stockDdDocNo").val()
               ,docStatCd: docStatCd
              // ,stockLockYn:"N"
               ,stockLockYn:$("#stockLockYn").data("kendoExtDropDownList").value()
               ,regDt:regDt
               ,prsnId:prsnId
               ,prsnNm:prsnNm
               ,remark:""
               ,updtDtStr :$("#updtDtStr").val()

        };

        //if(saveList.length > 0){
            var data = {
                   "investigationVO"      :header
                  ,"investigationItemList":saveList
                };


            //stock action insert or update url.
            var paramUrl = "<c:url value='/par/stm/investigation/createInvestigationReg.do' />";
            if(!dms.string.isEmpty(header.stockDdDocNo)){
                if(docStatCd === 'REDY'){
                    paramUrl = "<c:url value='/par/stm/investigation/updateInvestigationReg.do' />";
                }else if(docStatCd === 'RGST'){
                    paramUrl = "<c:url value='/par/stm/investigation/createInvestigationCnfm.do' />";
                }
            }
            //stock action ajax.
            $.ajax({
                 url:paramUrl
                ,data:kendo.stringify(data)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {

                    if (result.resultYn == true) {
                        if(docStatCd === 'REDY'){
                            dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.regSuccessParam' arguments='${stockDdDoc}'/>");
                        }else if(docStatCd === 'RGST'){
                            dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.cnfmSuccessParam' arguments='${stockDdDoc}'/>");
                        }
                        //get stock selectInvestigationListByKey
                        selectInvestigationListByKey(result.stockDdDocNo,docStatCd);

                    } else {
                        if(result === 0){
                            dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.regFailedParam' arguments='${stockDdDoc}'/>");
                        }
                    }
                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            });
        /* }else{
            //unselected message.
            dms.notification.warning("<spring:message code='global.info.unselected' />");
            return false;
        } */
    }

    //insert or update Investigation
    function saveInvestigationNew(docStatCd){
        var saveList = [],
        grid = $("#partGrid").data("kendoExtGrid"),
        rows = grid.tbody.find("tr"),
        lCrud = '',
        paramUrl = '',
        chkRow,
        header;

        //strgeCd
        var strgeCd = $("#sStrgeCd").val();
        //invDocRegDt
        var regDt = $("#regDt").data("kendoExtMaskedDateTimePicker").value();
        //investigationPrsId
        var prsnId = $("#prsnId").val();
        var prsnNm = $("#prsnNm").val();

        if(dms.string.isEmpty(regDt)){
            //invDocRegDt required message.
            dms.notification.warning("<spring:message code='par.lbl.invDocRegDt' var='invDocRegDt' /><spring:message code='global.info.required.field' arguments='${invDocRegDt}'/>");
            return false;
        }

        if(dms.string.isEmpty(prsnId)){
            //investigationPrsId required message.
            dms.notification.warning("<spring:message code='par.lbl.investigationPrsId' var='investigationPrsId' /><spring:message code='global.info.required.field' arguments='${investigationPrsId}'/>");
            return false;
        }
        //insert or update row select.
        if(docStatCd == "RGST"){//재고실사 요청일때 부품행 수 체크.
            if(rows.length  == 0 ){
                //unselected message.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }
        }

        //stock action header
        header = {
                strgeCd:strgeCd
               ,stockDdDocNo:$("#stockDdDocNo").val()
               ,docStatCd: docStatCd
               ,stockLockYn:$("#stockLockYn").data("kendoExtDropDownList").value()
               ,regDt:regDt
               ,prsnId:prsnId
               ,prsnNm:prsnNm
               ,remark:""
               ,updtDtStr:$("#updtDtStr").val()
        };

        var data = {
               "investigationVO"      :header
              ,"investigationItemList":saveList
            };

        //stock action ajax.
        var paramUrl = "<c:url value='/par/stm/investigation/updateInvestigationSaveCnfm.do' />";
        $.ajax({
             url:paramUrl
            ,data:kendo.stringify(data)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,success:function(result) {
                if (result.resultYn == true) {
                    if(docStatCd === 'REDY'){
                        dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.regSuccessParam' arguments='${stockDdDoc}'/>");
                    }else if(docStatCd === 'RGST'){
                        dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.cnfmSuccessParam' arguments='${stockDdDoc}'/>");
                    }
                    //get stock selectInvestigationListByKey
                    selectInvestigationListByKey(result.stockDdDocNo,docStatCd);
                } else {
                    if(result === 0){
                        dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.regFailedParam' arguments='${stockDdDoc}'/>");
                    }
                }
            }
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        });
    }

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
                            $("#prsnId").val(data[0].usrId);
                            $("#prsnNm").val(data[0].usrNm);
                        }
                        userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    $(document).ready(function() {

        var validator = $("#searchForm").kendoExtValidator().data("kendoExtValidator");
        //sStrgeCd
        $("#sStrgeCd").kendoExtMultiSelectDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource    :searchStorageCdList
            ,index         :0
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
        //bpTp
        $("#bpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
            ,index:0
            ,select:onSelectBpTp
        });
        //ABC CLASS
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:abcIndList
            ,index:0
        });
        //sStockStatCd
        $("#sStockStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:stockStatList
            ,index:0
        });
        //sCarlineCd
        $("#sCarlineCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:carlineCdList
           ,index:0
        });
        //sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:itemDstinCdList
           ,index:0
        });
        //sBpCdList
        $("#sBpCdList").kendoExtMultiSelectDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,selectedAllText:"ALL"
            ,dataSource:bpCdObj[0]
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,change:function(e){
            }
            ,select:function(e){
                var selectBpCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectBpCd)){
                    $("#sBpCdList").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sBpCdList").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
            ,index:0
        });
        //prsnId search popup
        $("#searchPrsnId").on('click', salePrsnSearchPopup);
        //sLastGrDtFr
        $("#sLastGrDtFr").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sLastGrDtTo
        $("#sLastGrDtTo").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sLastGiDtFr
        $("#sLastGiDtFr").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sLastGiDtTo
        $("#sLastGiDtTo").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //stockLockYn
        $("#stockLockYn").kendoExtDropDownList({
            dataSource:stockLockYnList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
        });
        //regDt
        $("#regDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
            ,value: "${sysDate}"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //stockIvstPlanDt
        $("#stockIvstPlanDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //approveReqDt
        $("#approveReqDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //endDt
        $("#endDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sStockCostFrom
        $("#sStockCostFrom").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:2
            ,spinners:false
        });
        //sStockCostTo
        $("#sStockCostTo").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:2
            ,spinners:false
        });

        //stockDdDocNo search popup
        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);
        //user search popup
        $("#searchPiMngUsrId").on('click', userSearchPopup);
        //prsnId empty check set default usrNm value
        if($("#prsnId").val() == ""){
            $("#prsnId").val("${usrId}");
        }
        if($("#prsnNm").val() == ""){
            $("#prsnNm").val("${usrNm}");
        }
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e) {
                parent._createOrReloadTabMenu("<spring:message code='par.lbl.stockDdDoc'/>", "<c:url value='/ReportServer?reportlet=par/selectInvestigationTargetPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sStockDdDocNo="+$("#stockDdDocNo").val());
            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                //search grid dataSource read.
                $("#searchGrid").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnAdd
        $("#btnAdd").kendoButton({
            click:function(e){
                var frGrid = $("#searchGrid").data("kendoExtGrid"),
                    toGrid = $("#selectGrid").data("kendoExtGrid"),
                    toGridItems = toGrid.dataSource.data(),
                    itemCheckCnt = 0,
                    rows = frGrid.select(),
                    rowsLen = 0,
                    selecRow = [],
                    toRows,
                    rowObj = {};

                if(rows !== null){
                    if(rows.length < 1){
                        //unselected message.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    var rowAlles = toGrid.dataSource.data().toJSON();
                    var toGridItemsLength = toGrid.dataSource.data().length;
                    $.each(rows, function(idx, row){
                            //재고실사부품 부품수.
                            //var dataItemLength = toGrid.dataSource.view().length;
                            var rowObj = frGrid.dataItem(row);
                            rowObj.stockDdDocNo = null;
                            rowObj.bookQty = frGrid.dataItem(row).avlbStockQty;
                            rowObj.ddQty = frGrid.dataItem(row).avlbStockQty;

                            var itemCheckCnt = 0;
                            for(var j=0; j < toGridItems.length; j++){
                                if(toGridItems[j].itemCd === rowObj.itemCd && toGridItems[j].strgeCd === rowObj.strgeCd){
                                    itemCheckCnt++;
                                }
                                if(itemCheckCnt > 0){
                                    break;
                                }
                            }

                            if(itemCheckCnt == 0){
                                rowAlles.push(rowObj.toJSON());
                                toGridItemsLength++;
                            }
                    });

                    //재고실사 최대 100개 처리.
                    if(toGridItemsLength > 100){
                        dms.notification.warning("<spring:message code='par.info.maxStockCheckMsg' />");
                    }else{
                        toGrid.dataSource.data(rowAlles);
                    }

                    toRows = toGrid.tbody.find("tr");

                    toRows.each(function(index, row) {
                        toGrid.select($(this));

                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                    });
                    frGrid.clearSelection();
                }
            }
        });
        //btnAddNew -> DB Merge
        $("#btnAddNew").kendoButton({
            click:function(e){

                var frGrid = $("#searchGrid").data("kendoExtGrid");
                var rows = frGrid.select();
                if(rows !== null){
                    if(rows.length < 1){
                        //unselected message.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
                    var gridData = null;
                    var saveList = [];
                    $.each(rows, function(idx, row){
                        gridData = frGrid.dataItem(row);

                        if(dms.string.isEmpty(gridData.itemCd)){
                            //itemCd not exist.
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.itemInsertNotMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.unitCd)){
                            //unitCd not exist.
                            dms.notification.warning("<spring:message code='par.lbl.unitNm' var='unitNm' /><spring:message code='par.info.itemInsertNotMsg' arguments='${unitNm}'/>");
                            saveList = [];
                            return false;
                        }

                        if(gridData.stockLockYn === 'Y'){
                            //stockLockMsg
                            dms.notification.warning("<spring:message code='par.err.stockLockMsgParam' arguments='"+ gridData.itemCd + "'/>");
                            saveList = [];
                            return false;
                        }

                        saveList.push({
                            locCd     :gridData.locCd
                           ,itemCd    :gridData.itemCd
                           ,unitCd    :gridData.unitCd
                           ,strgeCd   :gridData.strgeCd
                           ,bookQty   :gridData.stockQty
                           ,ddQty     :gridData.stockQty
                        });
                    })
                    //stock action header
                    header = {
                            strgeCd:$("#sStrgeCd").val()
                           ,stockDdDocNo:$("#stockDdDocNo").val()
                           ,docStatCd: "REDY"
                           ,stockLockYn:$("#stockLockYn").data("kendoExtDropDownList").value()
                           ,regDt:$("#regDt").data("kendoExtMaskedDateTimePicker").value()
                           ,prsnId:$("#prsnId").val()
                           ,prsnNm:$("#prsnNm").val()
                           ,remark:""
                    };

                    var data = {
                            "investigationVO"      :header
                           ,"investigationItemList":saveList
                         };

                    //stock action ajax.
                    $.ajax({
                         url:"<c:url value='/par/stm/investigation/updateInvestigationRegAdd.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {
                            if (result.resultYn == true) {
                                //get stock selectInvestigationListByKey
                                selectInvestigationListByKey(result.stockDdDocNo,docStatCd);
                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.regFailedParam' arguments='${stockDdDoc}'/>");
                                }
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        /* ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        } */
                    });
                }
            }
        });
        //btnDelItem
        $("#btnDelItem").kendoButton({
            click:function(e){
                var toGrid = $("#selectGrid").data("kendoExtGrid");

                toGrid.select().each(function(index, row) {
                    toGrid.removeRow($(this));
                });
            }
        });
        //btnDelItemNew -> DB Merge
        $("#btnDelItemNew").kendoButton({
            click:function(e){
                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지 적용.
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();

                        dms.loading.show();

                        var frGrid = $("#partGrid").data("kendoExtGrid");
                        var rows = frGrid.select();
                        if(rows !== null){
                            if(rows.length < 1){
                                //unselected message.
                                dms.notification.warning("<spring:message code='global.info.unselected' />");
                                return false;
                            }
                            var gridData = null;
                            var deleteList = [];
                            $.each(rows, function(idx, row){
                                gridData = frGrid.dataItem(row);

                                deleteList.push({
                                    dlrcd            :gridData.dlrcd
                                   ,stockDdDocNo     :gridData.stockDdDocNo
                                   ,stockDdDocLineNo :gridData.stockDdDocLineNo
                                });
                            })

                            var data = {
                                    "investigationItemList":deleteList
                                 };

                            //stock action ajax.
                            $.ajax({
                                 url:"<c:url value='/par/stm/investigation/deleteInvestigationReg.do' />"
                                ,data:kendo.stringify(data)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,success:function(result) {
                                    //get stock selectInvestigationListByKey
                                    selectInvestigationListByKey(result.stockDdDocNo,result.docStatCd);
                                    dms.loading.hide();
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    dms.loading.hide();
                                }
                            });
                        }
                    }
                    conformKendoWindow.close();
                }).end();
            }
        });
        //btnSave
        $("#btnSave").kendoButton({
            click:function(e){
                //stock target ready
                //saveInvestigation("REDY");
                saveInvestigationNew("REDY");
            }
        });
        //btnCnfm
        $("#btnCnfm").kendoButton({
            enable : false
            ,click:function(e){
                //stock target confirm
                //saveInvestigation("RGST");
                saveInvestigationNew("RGST");
            }
        });
        //btnCncl
        $("#btnCncl").kendoButton({
            enable : false
            ,click:function(e){

                var saveList      = [],
                    //grid          = $("#selectGrid").data("kendoExtGrid"),
                    grid          = $("#partGrid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    paramUrl      = '',
                    header;

                if(dms.string.isEmpty($("#stockDdDocNo").val())){
                    //stockDdDocNo required message.
                    dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                    return false;
                }

                header = {
                    stockDdDocNo   :$("#stockDdDocNo").val()
                   //,stockLockYn    :'N'
                   ,stockLockYn    :$("#orgStockLockYn").val()
                   ,updtDtStr      :$("#updtDtStr").val()
                };

                // 페이징처리그리드로 변경하여 체크 안함
                if(rows.length  == 0 ){
                    //unselected message.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(gridData.itemStatCd === 'REQ'||gridData.itemStatCd === 'REL'){
                        //cancel not message.
                        dms.notification.warning("<spring:message code='global.err.cnclFailed'/>");
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
                        url:"<c:url value='/par/stm/investigation/cancelInvestigationByKey.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {
                           if (result === 1) {
                               //cancel ok.
                               dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.cancelSuccessParam' arguments='${stockDdDoc}'/>");
                               //re select.
                               selectInvestigationListByKey($("#stockDdDocNo").val(),'CANC');

                           }else {
                               if(result === 0){
                                   //cacel failed.
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

        //재고실사문서번호가 있으면 값을 셋팅 및 조회. (재고현황에서 재고실사문서 번호 링크처리 일 시)
        if(!dms.string.isEmpty(stockDdDocNo) && !dms.string.isEmpty(docStatCd)){
            $("#stockDdDocNo").val(stockDdDocNo);
            $("#docStatCd").val(docStatCd);
            selectInvestigationListByKey(stockDdDocNo,docStatCd);
        }

        var rowNumber = 0;

        //searchGrid
        $("#searchGrid").kendoExtGrid({
            gridId:"G-PAR-0808-161697"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockInOut/selectInvestigationTargetList.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if(operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            sStrgeCdLst = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();
                            if(dms.string.isEmpty(sStrgeCdLst[0])){
                                sStrgeCdLst.splice(0,1);
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //search param
                            params["sSpyrCd"] = $("#bpTp").data("kendoExtDropDownList").value();
                            params["sStrgeCdList"] = sStrgeCdLst;
                            params["sAbcInd"] = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sStockStatCd"] = $("#sStockStatCd").data("kendoExtDropDownList").value();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sLocCd"]  = $("#sLocCd").val();
                            params["sLocCdMig"]  = $("#sLocCdMig").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sLastGrDtFr"] = $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sLastGrDtTo"] = $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiDtFr"] = $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiDtTo"] = $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sBpCdList"] = $("#sBpCdList").data("kendoExtMultiSelectDropDownList").value();
                            params["sStockCostFrom"] = $("#sStockCostFrom").data("kendoExtNumericTextBox").value();
                            params["sStockCostTo"] = $("#sStockCostTo").data("kendoExtNumericTextBox").value();
                            params["sStockLockYn"] = 'Y';

                            return kendo.stringify(params);
                        }
                    }
                }
                ,batch: true
                ,schema:{
                    data:function (result){
                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                        id:"receiveNo"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,strgeCd:{ type:"string", editable:false }
                            ,locCd:{type :"string", editable:false }
                            ,locCdMig:{type :"string", editable:false }
                            ,itemCd:{ type:"string", editable:false }
                            ,itemNm:{ type:"string", editable:false }
                            ,itemDstinCd:{type :"string", editable:false }
                            ,carlineCd:{type :"string", editable:false }
                            ,abcInd:{type :"string", editable:false }
                            ,lastGrDt:{ type:"date" , editable:false }
                            ,lastGiDt:{ type:"date" , editable:false }
                            ,unitCd:{ type:"string", editable:false }
                            ,stockQty:{ type:"number", editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                            ,movingAvgPrc:{ type:"number", editable:false }
                            ,stockPrc:{ type:"number", editable:false }
                            ,stockAmt:{ type:"number", editable:false }
                            ,stockLockYn:{ type:"string", editable:false }
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,sortable:true
            ,autoBind: false
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:true
            ,editable:false
            ,height:173
            ,pageable :{
                refresh :true
                ,pageSize :300
                ,pageSizes :[ "300", "500", "1000" ]
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>",attributes:{"class":"ar"} ,width:50}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />" ,width:140}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />" ,width:200}
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.strgeCd' />" ,width:120
                    ,template  :'#= changeStrgeCd(strgeCd)#'
                }
                ,{field:"locCd", title:"<spring:message code='par.lbl.locationCd' />" ,width:180}
                ,{field:"locCdMig", title:"<spring:message code='par.lbl.locationCd' /> 2" ,width:180}
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차입수량
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.itemMasterBpTp' />" ,width:100
                    ,template  :'#= changeBpTp(bpTp)#'
                }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />" ,width:80
                    ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                }
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />" ,width:90}
                ,{field:"unitCd" ,title:"<spring:message code='par.lbl.stockUnitCd'  />" ,attributes:{"class":"ac"} ,width:90}
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine'  />" ,attributes:{"class":"ac"} ,width:120}
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//단가
                ,{field:"carlineCd2" ,title:"<spring:message code='par.lbl.model' />" ,attributes:{"class":"ac"} ,width:120}
                ,{field:"lastGrDt", title:"<spring:message code='par.lbl.lastGrDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//최종입고일
                ,{field:"lastGiDt" ,title:"<spring:message code='par.lbl.lastGiDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//최종출고일
            ]
        });
        //selectGrid
        $("#selectGrid").kendoExtGrid({
            gridId:"G-PAR-0808-161796"
            ,dataSource:{
                transport:{
                    read :{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationListDetailGrid.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["sort"] = options.sort;
                            params["sStockDdDocNo"] = $("#stockDdDocNo").val();
                            params["sStockLockYn"] = $("#stockLockYn").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    id:"stockDdDocNo"
                        ,fields:{
                            dlrcd:{ type:"string" }
                            ,itemStatCd:{ type:"string" }
                            ,stockDdDocNo:{ type:"string" }
                            ,stockDdDocLineNo:{ type:"number" }
                            ,strgeCd:{ type:"string" }
                            ,locCd:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemDstinCd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,abcInd:{ type:"string" }
                            ,lastGrDt:{ type:"date"   }
                            ,lastGiDt:{ type:"date"   }
                            ,bookQty:{ type:"number" }
                            ,ddQty:{ type:"number" }
                            ,movingAvgPrc:{ type:"number" }
                            ,remark:{ type:"string" }
                        }
                   }
            }
            ,height:173
            ,selectable:"multiple"
            ,scrollable:true
            ,sortable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:true
            ,editable:false
            ,pageable:false
            ,dataBound:function(e){

                rowNumber = 0;

                var rows = e.sender.tbody.children(),
                toGrid = $("#selectGrid").data("kendoExtGrid");

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                        //자동 체크 및 행 선택 처리.
                        toGrid.select($(this));
                    }
                });

                if(rows.length > 0){
                    $('#selectGrid input[type=checkbox][id!=checkAll]').prop("checked", true);
                }

                var page = e.sender.dataSource.page();
                var pageSize = e.sender.dataSource.pageSize();
                // reset row number based on the selected page in the pager
                rowNumber = (page - 1) * pageSize;

            }
            ,columns:[
                {field:"stockDdDocLineNo", title:"<spring:message code='par.lbl.line'/>",attributes:{"class":"ar"} ,width:50
                    ,template  :'#= rnum #'
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />" ,width:140}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />" ,width:200}
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.strgeCd' />" ,width:120
                    ,template  :'#= changeStrgeCd(strgeCd)#'
                }
                ,{field:"locCd", title:"<spring:message code='par.lbl.locationCd' />" ,width:180}
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.itemMasterBpTp'  />" ,attributes:{"class":"ac"}, width:100
                    ,template:'#= changeBpTp(bpTp)#'
                }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd'  />" ,width:80
                    ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                }
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd'  />" ,width:90}
                ,{field:"unitCd" ,title:"<spring:message code='par.lbl.stockUnitCd'  />" ,attributes:{"class":"ac"} ,width:90}
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine'  />" ,attributes:{"class":"ac"} ,width:120}
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}
                ,{_field:"blank" ,title:"<spring:message code='par.lbl.model' />" ,attributes:{"class":"ac"} ,width:120}
                ,{field:"lastGrDt", title:"<spring:message code='par.lbl.lastGrDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"lastGiDt", title:"<spring:message code='par.lbl.lastGiDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}"}
            ]
        });
        //partGrid
        $("#partGrid").kendoExtGrid({
            gridId:"G-PAR-0412-134700"
            ,dataSource:{
                transport:{
                    read :{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationListDetailGrid.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sStockDdDocNo"] = $("#stockDdDocNo").val();
                            params["sStockLockYn"] = $("#stockLockYn").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        };
                    }
                }
                ,schema:{
                    model:{
                    id:"rnum"
                        ,fields:{
                             rnum:{ type:"number" }
                            ,dlrcd:{ type:"string" }
                            ,itemStatCd:{ type:"string" }
                            ,stockDdDocNo:{ type:"string" }
                            ,stockDdDocLineNo:{ type:"number" }
                            ,strgeCd:{ type:"string" }
                            ,locCd:{ type:"string" }
                            ,locCdMig:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemDstinCd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,abcInd:{ type:"string" }
                            ,lastGrDt:{ type:"date"   }
                            ,lastGiDt:{ type:"date"   }
                            ,bookQty:{ type:"number" }
                            ,ddQty:{ type:"number" }
                            ,movingAvgPrc:{ type:"number" }
                            ,remark:{ type:"string" }
                       }
                   }
                }
            }
            ,height:173
            ,selectable:"multiple"
            ,scrollable:true
            ,sortable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:true
            ,editable:false
            ,pageable :{
                refresh :true
                ,pageSize :300
                ,pageSizes :[ "300", "500", "1000" ]
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>",attributes:{"class":"ar"} ,width:50}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />" ,width:140}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />" ,width:200}
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.strgeCd' />" ,width:120
                    ,template  :'#= changeStrgeCd(strgeCd)#'
                }
                ,{field:"locCd", title:"<spring:message code='par.lbl.locationCd' />" ,width:180}
                ,{field:"locCdMig", title:"<spring:message code='par.lbl.locationCd' /> 2" ,width:180}
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.itemMasterBpTp'  />" ,attributes:{"class":"ac"}, width:100
                    ,template:'#= changeBpTp(bpTp)#'
                }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd'  />" ,width:80
                    ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                }
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd'  />" ,width:90}
                ,{field:"unitCd" ,title:"<spring:message code='par.lbl.stockUnitCd'  />" ,attributes:{"class":"ac"} ,width:90}
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine'  />" ,attributes:{"class":"ac"} ,width:120}
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}
                ,{_field:"blank" ,title:"<spring:message code='par.lbl.model' />" ,attributes:{"class":"ac"} ,width:120}
                ,{field:"lastGrDt", title:"<spring:message code='par.lbl.lastGrDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"lastGiDt", title:"<spring:message code='par.lbl.lastGiDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}"}
            ]
        });
        //changeStrgeCd Func
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = storageObj[val];
            }
            return returnVal;
        };
        //changeBpTp Func
        changeBpTp = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                 returnVal = bpTpMap[val];
            }
            return returnVal;
        };
        //changeLocCd Func
        changeLocCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = locationObj[val];
            }
            return returnVal;
        };
        //changeUnit Func
        changeUnit = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = unitCdObj[val];
            }
            return returnVal;
        };
        //changeItemDstinCd Func
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
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
            if(val != null && val != ""){
                returnVal = carlineCdObj[val];
            }
            return returnVal;
        };

        initPage();

    });
    //init Page Func
    function initPage(){
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }
        //[partsJs]:dms.parts-1.0.js inner Object
        partsJs.validate.groupObjAllDataInit();
        if (!partsJs.validate.getAllPluginObjInfo($("#investForm")[0])) {
            return false;
        }
        //form element reset
        partsJs.validate.groupObjAllDataInit();

        //$("#selectGrid").data("kendoExtGrid").dataSource.data([]);
        $("#searchGrid").data("kendoExtGrid").dataSource.data([]);
        $("#partGrid").data("kendoExtGrid").dataSource.data([]);

        popItemObj = {};

        $("#stockLockYn").data("kendoExtDropDownList").value("N");

        $("#sStockStatCd").data("kendoExtDropDownList").value("");
        $("#sStockStatCd").data("kendoExtDropDownList").enable(false);
        $("#stockLockYn").data("kendoExtDropDownList").enable(true);

        //prsnId set default value.
        $("#prsnId").val("${usrId}");
        $("#prsnNm").val("${usrNm}");
        //regDt set default value.
        $("#regDt").data("kendoExtMaskedDateTimePicker").value(kendo.parseDate("${sysDate}"));

        $("#sStockCostFrom").data("kendoExtNumericTextBox").value("");
        $("#sStockCostTo").data("kendoExtNumericTextBox").value("");

        //button list Func
        fnSetButton();
    }

    //fnSetButton Func : Button Control
    function fnSetButton(pType){

        $("#btnPrint").data("kendoButton").enable(false);

        if(pType === 'REDY'){
            $("#btnCncl").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(true);
            //$("#btnAdd").data("kendoButton").enable(true);
            //$("#btnDelItem").data("kendoButton").enable(true);
            $("#btnAddNew").data("kendoButton").enable(true);
            $("#btnDelItemNew").data("kendoButton").enable(true);
        }else if(pType === 'RGST'){
            $("#btnCncl").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            //$("#btnAdd").data("kendoButton").enable(false);
            //$("#btnDelItem").data("kendoButton").enable(false);
            $("#btnAddNew").data("kendoButton").enable(false);
            $("#btnDelItemNew").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
        }else if(pType === 'CANC'){
            $("#btnCncl").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            //$("#btnAdd").data("kendoButton").enable(false);
            //$("#btnDelItem").data("kendoButton").enable(false);
            $("#btnAddNew").data("kendoButton").enable(false);
            $("#btnDelItemNew").data("kendoButton").enable(false);
        }else{
            $("#btnCncl").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(false);
            //$("#btnAdd").data("kendoButton").enable(true);
            //$("#btnDelItem").data("kendoButton").enable(true);
            $("#btnAddNew").data("kendoButton").enable(true);
            $("#btnDelItemNew").data("kendoButton").enable(true);
        }
    }

    $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#selectGrid").data("kendoExtGrid"),
            checked = $(this).is(":checked"),
            rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                if(grid.dataItem(row).stockLockYn !== 'Y'){
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                }
            });
        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });
    //userSearchPopup Func
    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#piMngUsrId").val(data[0].usrId);
                            $("#piMngUsrNm").val(data[0].usrNm);

                        }
                    }
                }
            }
        });
    }
    //selectInvestigationListPopupWindow Func
    function selectInvestigationListPopupWindow(){
        investigationListPopupWindow = dms.window.popup({
            windowId:"investigationListPopup"
            ,title:"<spring:message code='par.title.stockDDDocInfo' />"
            ,width:860
            ,height:380
            ,content:{
                url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"stockDdDocNo":$("#stockDdDocNo").val()
                    ,"docStatCd":$("#docStatCd").val() == "" ? "READY" : $("#docStatCd").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            //stockDdDocNo key.
                            $("#stockDdDocNo").val(data[0].stockDdDocNo);

                            if(data[0].docStatCd !== 'RGST' && data[0].docStatCd !== 'REDY'){
                                selectInvestigationListByKey($("#stockDdDocNo").val(),'CANC');
                            }else{
                                selectInvestigationListByKey($("#stockDdDocNo").val(),data[0].docStatCd);
                            }
                        }
                        investigationListPopupWindow.close();
                    }
                }
            }
        });
    }
    //selectInvestigationListByKey Func
    function selectInvestigationListByKey(pStockDdDocNo, pDocStatCd){
        var header = {
                sStockDdDocNo:pStockDdDocNo
        };
        $.ajax({
            url:"<c:url value='/par/stm/investigation/selectInvestigationListByKey.do' />"
           ,data:kendo.stringify(header)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }

       }).done(function(result) {
           if (!partsJs.validate.getAllPluginObjInfo($("#investForm")[0])) {
               return false;
           }
           partsJs.validate.groupObjAllDataSet(result);

           //실사확인자
           $("#regUsrNm").val("");
           $("#regUsrNm").val(result.regUsrNm);
           $("#orgStockLockYn").val(result.stockLockYn);

           fnSetButton(result.docStatCd);

           // 실사 등록 확정인 경우 통제여부 수정 불가.
           if(result.docStatCd === 'REDY'){
               $("#stockLockYn").data("kendoExtDropDownList").enable(true);
           }else{
               $("#stockLockYn").data("kendoExtDropDownList").enable(false);
           }
           $("#partGrid").data("kendoExtGrid").dataSource.read();

       });
    }

    function onSelectBpTp(e){
        if(dms.string.isEmpty($("#bpTp").data("kendoExtDropDownList").value())){
            $("#sBpCdList").data("kendoExtMultiSelectDropDownList").setDataSource(bpCdObj[0]);
        }else{
            if($("#bpTp").data("kendoExtDropDownList").value() === '01'){
                $("#sBpCdList").data("kendoExtMultiSelectDropDownList").setDataSource(bpCdObj[1]);
            }else{
                $("#sBpCdList").data("kendoExtMultiSelectDropDownList").setDataSource(bpCdObj[2]);
            }
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
            if(id === 'sLastGrDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sLastGrDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sLastGiDtFr'){
                var minDate = new Date(this.value());
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sLastGiDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sLastGrDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sLastGrDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sLastGiDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sLastGiDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }
    //-------------liuxueying add start
    $("#btnAddForStrge").kendoButton({
        click:function(e){
        	var strgeCd = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();
        	var strgeCdStr = strgeCd.toString();
        	if(strgeCdStr == '' ||strgeCdStr.indexOf(",")!=-1){
        		 dms.notification.warning("<spring:message code='par.info.selectonestrage' />");
        		 return;
        	}
        	

             dms.loading.show();
             //invDocRegDt
             var regDt = $("#regDt").data("kendoExtMaskedDateTimePicker").value();
             //investigationPrsId
             var prsnId = $("#prsnId").val();
             var prsnNm = $("#prsnNm").val();
            var saveList = [];
            var header = {
                     strgeCd:strgeCdStr
                    ,stockDdDocNo:$("#stockDdDocNo").val()
                    ,docStatCd: "REDY"
                    ,stockLockYn:$("#stockLockYn").data("kendoExtDropDownList").value()
                    ,regDt:$("#regDt").data("kendoExtMaskedDateTimePicker").value()
                    ,prsnId:$("#prsnId").val()
                    ,prsnNm:$("#prsnNm").val()
                    ,remark:""
             };
			
             var data = {
                     "investigationVO"      :header
                    ,"investigationItemList":saveList
                  };

              //stock action ajax.
              $.ajax({
                   url:"<c:url value='/par/stm/investigation/createInvestigationForStrage.do' />"
                  ,data:kendo.stringify(data)
                  ,type:'POST'
                  ,dataType:'json'
                  ,contentType:'application/json'
                  ,async:false
                  ,beforeSend:function(jqXHR, settings){
                  }
                  ,complete:function(jqXHR, textStatus){
                      //dms.loading.hide();
                  }
                  ,success:function(data) {
                      dms.loading.hide();
                      if(data != '' && data != null){
                           dms.notification.success("<spring:message code='par.lbl.stockDdCreateOk' arguments='"+data+"'/>");
                      }
                  }
                  ,error:function(jqXHR,status,error) {
                	  dms.loading.hide();
                	  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                  	  
                  }
              });
        }
    });
  //-------------liuxueying add end
</script>
<!-- //script -->


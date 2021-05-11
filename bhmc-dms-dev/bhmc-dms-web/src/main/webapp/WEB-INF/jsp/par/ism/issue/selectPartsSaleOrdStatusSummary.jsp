<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 부품판매오더현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11829" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11828" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDownloadList" name="btnDownloadList" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11827" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.partsSaleNo" /><!-- 판매오더번호 --></th>
                        <td>
                            <input id="sParSaleOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSalePrcTp" /><!-- 판매유형 --></th>
                        <td>
                            <input id="sSaleTp" type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSalePrsn" /><!-- 담당자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sSalePrsnId" class="form_input hidden" />
                                <input type="text" id="sSalePrsnNm" class="form_input"/>
                                <a id="searchSaId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSaleStat" /><!-- 상태 --></th>
                        <td>
                            <input id="sOrdStatCd" type="text" data-type="multicombo" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parSaleCnt" /><!-- 품목수 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sItemCntFr" class="form_numeric" data-type="number">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sItemCntTo" class="form_numeric" data-type="number">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.parSaleQty' /></th><!-- 판매수량 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sItemQtyFr" class="form_numeric" data-type="number">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sItemQtyTo" class="form_numeric" data-type="number">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSaleDt" /><!-- 부품판매일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sOrdDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sOrdDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parSaleAmt" /><!--판매금액 --></th>
                        <td>
                            <div class="form_float" >
                                <div class="date_left">
                                    <input id="sItemAmtFr" type="number" class="form_numeric ar" data-bind="value:sItemAmtFr" data-json-obj="true">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sItemAmtTo" type="number" class="form_numeric ar" data-bind="value:sItemAmtTo" data-json-obj="true">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCustTp" data-type="combo" class="form_comboBox">
                                </div>
                                <div class="date_right">
                                    <label class="label_check ml5"><input type="checkbox" id="sInstantCust" class="form_check" data-type="checkbox"/><spring:message code="par.lbl.instantCust" /></label>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpCstCd" /><!-- 고객 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sCustCd" class="form_input hidden" />
                                <input type="text" id="sCustNm" class="form_input" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.calcDt" /><!-- 정산일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCalcDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sCalcDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnHpNo" /><!-- 핸드폰 --></th>
                        <td>
                            <input id="sCustTelNo"  type="text" class="form_input" />
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>


        <!-- // tab start-->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabPartsSaleListInfo" class="k-state-active"><spring:message code="par.title.partSaleSum" /></li><!-- 부품판매현황 -->
                <li id ="tabPartsSaleDetailInfo"><spring:message code="par.title.partSaleSumListDetail" /></li><!-- 부품판매명세 -->
                <li id ="tabPartsSaleCalcInfo"><spring:message code="par.title.calcualateStatus" /></li><!-- 정산현황 -->
            </ul>

            <!-- 부품판매현황  -->
            <div class="mt0">
                <section class="group">
                    <div class="header_area">
                        <div class="btn_right">
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="grid" class="resizable_grid"></div>
                    </div>
                </section>
            </div>

            <!-- 부품판매명세 -->
            <div class="mt0">
                <section class="group">
                    <div class="header_area">
                        <div class="btn_right">
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="gridDetail" class="resizable_grid"></div>
                    </div>
                </section>
            </div>

            <!-- 정산현황 -->
            <div class="mt0">
                <section class="group">
                    <div class="header_area">
                        <div class="btn_right">
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="gridCalc" class="resizable_grid"></div>
                    </div>
                </section>
            </div>
        </div>
    </section>
    <!-- //부품판매오더 -->
</div>

    <input type="hidden" id="parSaleOrdNo" name="parSaleOrdNo" />

<!-- script -->
<script>

        var toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            custTpList          = [],
            custTpObj           = {},
            ordStatCdList       = [],
            ordStatCdObj        = {},
            saleTpList          = [],
            saleTpObj           = {},
            itemDstinCdObj      = {},
            unitCdObj           = {},
            giStrgeTpObj        = {},
            locationObj         = {},
            locationListObj     = {},
            prcTpObj            = {},
            giStatCdObj         = {},
            roStatCdArr         = {},
            roStatCdList        = [],
            selectAllGridRowYN  = 'N',
            popupWindow,
            changeSaleTp,
            changeCustTp,
            changePrcTp,
            changeUnitCd,
            changeItemDstinCd,
            userSearchPopupWin,
            selectTabId;

        custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        custTpObj[' '] = "";
        <c:forEach var="obj" items="${custTpList}" varStatus="status">
            custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        ordStatCdList.push({"cmmCd":" ", "cmmCdNm":'<spring:message code="par.lbl.checkClearAll" />', "useYn":""});
        <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">

            if("${obj.useYn}" === 'Y'){
                ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            //부품판매오더상태 코드 전체 반품 포함.
            ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            giStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        saleTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        saleTpObj[' '] = "";
        <c:forEach var="obj" items="${saleTpList}" varStatus="status">
            saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        locationObj[' '] = "";

        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        giStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        <c:forEach var="obj" items="${roStatCdList}">
            <c:if test="${obj.remark1 eq 'calcStatCd'}">
            roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            </c:if>
        </c:forEach>

        roStatCdArr = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

        function fn_linkPartsSale(pPartsSale, pOrdStatCd){

            if(pOrdStatCd === "01" || pOrdStatCd === "07" ){//부품판매오더상태 : 등록(01), 반품:(07)
                //부품판매출고 이동.
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partMarPrcSale" />'
                    ,"<c:url value='/par/ism/issue/selectPartsSaleOrdMain.do?pParSalesOrdNo="+pPartsSale+"'/>", "VIEW-D-10236");
            }else{
                //부품판매정산 이동.
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partCalculate" />'
                    ,"<c:url value='/par/ism/issue/selectCalculateMain.do?pParSalesOrdNo="+pPartsSale+"'/>", "VIEW-D-10125");
            }
        }

// 품목구분 그리드 콤보
function setSumData(val){
    var returnData  = Math.round(val * 1000)/1000,
        returnCalData = Math.round(returnData * 100)/100,
        returnVal = kendo.toString(returnData,'n2');

    return returnVal;
};

    $(document).ready(function() {

        //고객유형선택
        $("#sCustTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        //오더상태선택
        $("#sOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectOrdStatCd)){
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

        //판매유형
        $("#sSaleTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        $("#sOrdDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sOrdDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sCalcDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sCalcDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //판매건수
        $("#sItemCntFr, #sItemCntTo").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //판매수량
        $("#sItemQtyFr, #sItemQtyTo").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        /***** 판매금액시작 *****/
        $("#sItemAmtFr, #sItemAmtTo").kendoExtNumericTextBox({
            format:"n2"                // n0:###,###, n2:###,###.##
           ,decimals:2                // 소숫점
           ,spinners:false             // 증,감 화살표
        });

        //sCustTelNo
        $("#sCustTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });

        $("#searchSaId").on('click', userSearchPopup);

        $("#searchCustCd").on('click', custSearchPopup);

        $("#sCustTp").on('change', fnChangeCustTp);

        $("#sInstantCust").on('change', fnChangeIntantCust);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                selectAllGridRowYN = 'N';

                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
                $("#gridCalc").data("kendoExtGrid").dataSource.read();

            }
        });

       // 판매리스트 다운로드 버튼
        $("#btnDownloadList").kendoButton({
            click:function(e){

                var grid,
                    tmplFileNm,
                    fileNm,
                    jobType,
                    rows,
                    excelObj = {},
                    sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                if(dms.string.isEmpty(sOrdStatCdLst[0])){
                    sOrdStatCdLst.splice(0,1);
                }

                if(selectTabId === 'tabPartsSaleListInfo'){
                    grid       = $("#grid").data("kendoExtGrid");
                    tmplFileNm = "PartsSaleOrdListDownload_Tpl.xlsx";
                    fileNm     = "PartsSaleOrdListDownload.xlsx";
                    jobType    = "partsSaleOrdListDownload";
                }else if(selectTabId === 'tabPartsSaleDetailInfo'){
                    grid       = $("#gridDetail").data("kendoExtGrid");
                    tmplFileNm = "PartsSaleOrdDetailListDownload_Tpl.xlsx";
                    fileNm     = "PartsSaleOrdDetailListDownload.xlsx";
                    jobType    = "partsSaleOrdDetailListDownload";
                }else{
                    grid       = $("#gridCalc").data("kendoExtGrid");
                    tmplFileNm = "PartsSaleOrdCalcListDownload_Tpl.xlsx";
                    fileNm     = "PartsSaleOrdCalcListDownload.xlsx";
                    jobType    = "partsSaleOrdCalcListDownload";
                }

                rows     = grid.tbody.find("tr");

                if(rows.length === 0 || dms.string.isEmpty(rows)){
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
                excelObj = {
                             "beanName"     :"partsSaleOrdService"
                            ,"templateFile" :tmplFileNm
                            ,"fileName"     :fileNm
                            ,"jobType"      :jobType
                            ,"sCustTp"      :$("#sCustTp").data("kendoExtDropDownList").value()
                            ,"sParSaleOrdNo":$("#sParSaleOrdNo").val()
                            ,"sOrdStatLst"  :sOrdStatCdLst
                            ,"sSaleTp"      :$("#sSaleTp").data("kendoExtDropDownList").value()
                            ,"sCustCd"      :$("#sCustCd").val()
                            ,"sCustNm"      :$("#sCustNm").val()
                            ,"sSalePrsnId"  :$("#sSalePrsnId").val()
                            ,"sSalePrsnNm"  :$("#sSalePrsnNm").val()
                            ,"sOrdDtFr"     :$("#sOrdDtFr").val()
                            ,"sOrdDtTo"     :$("#sOrdDtTo").val()
                            ,"sCalcDtFr"    :$("#sCalcDtFr").val()
                            ,"sCalcDtTo"    :$("#sCalcDtTo").val()
                            ,"sCustTelNo"   :$("#sCustTelNo").data("kendoMaskedTextBox").value()
                            ,"sItemCntFr"   :$("#sItemCntFr").data("kendoExtNumericTextBox").value()
                            ,"sItemCntTo"   :$("#sItemCntTo").data("kendoExtNumericTextBox").value()
                            ,"sItemQtyFr"   :$("#sItemQtyFr").data("kendoExtNumericTextBox").value()
                            ,"sItemQtyTo"   :$("#sItemQtyTo").data("kendoExtNumericTextBox").value()
                            ,"sItemAmtFr"   :$("#sItemAmtFr").data("kendoExtNumericTextBox").value()
                            ,"sItemAmtTo"   :$("#sItemAmtTo").data("kendoExtNumericTextBox").value()
                        };

                dms.ajax.excelExport(excelObj);
            }
        });



        // 부품판매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0927-202801"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrds.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value(),
                                cnfmStatYn = 'N';

                            if(sOrdStatCdLst.length > 0){
                                var statCdLen = sOrdStatCdLst.length;
                                for(var i = 0; i < statCdLen; i = i + 1){
                                    //if(sOrdStatCdLst[i] === '07'){
                                    if(sOrdStatCdLst[i] === '02'){
                                        cnfmStatYn = 'Y';
                                    }
                                }
                            }

                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }

                            if(cnfmStatYn === 'Y'){
                                sOrdStatCdLst.push('08');
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustCd"]            = $("#sCustCd").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSalePrsnId"]        = $("#sSalePrsnId").val();
                            params["sSalePrsnNm"]        = $("#sSalePrsnNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sCalcDtFr"]          = $("#sCalcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sCalcDtTo"]          = $("#sCalcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sCustTelNo"]         = $("#sCustTelNo").data("kendoMaskedTextBox").value();
                            params["sItemCntFr"]         = $("#sItemCntFr").data("kendoExtNumericTextBox").value();
                            params["sItemCntTo"]         = $("#sItemCntTo").data("kendoExtNumericTextBox").value();
                            params["sItemQtyFr"]         = $("#sItemQtyFr").data("kendoExtNumericTextBox").value();
                            params["sItemQtyTo"]         = $("#sItemQtyTo").data("kendoExtNumericTextBox").value();
                            params["sItemAmtFr"]         = $("#sItemAmtFr").data("kendoExtNumericTextBox").value();
                            params["sItemAmtTo"]         = $("#sItemAmtTo").data("kendoExtNumericTextBox").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total > 0){
                            selectAllGridRowYN = 'Y';
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                            dlrCd         :{ type:"string"}
                          , ordStatCd     :{ type:"string"}
                          , ordDt         :{ type:"date"  }
                          , calcDt        :{ type:"date"  }
                          , returnDt      :{ type:"date"  }
                          , saleTp        :{ type:"string"}
                          , custTp        :{ type:"string"}
                          , custCd        :{ type:"string"}
                          , custNm        :{ type:"string"}
                          , parSaleOrdNo  :{ type:"string"}
                          , returnDocNo   :{ type:"string"}
                          , saId          :{ type:"string"}
                          , saNm          :{ type:"string"}
                          , returnId      :{ type:"string"}
                          , remark        :{ type:"string"}
                          , itemCnt       :{ type:"number"}
                          , itemQty       :{ type:"number"}
                          , itemAmt       :{ type:"number"}
                          , returnItemCnt :{ type:"number"}
                          , returnItemQty :{ type:"number"}
                          , returnItemAmt :{ type:"number"}
                          , movingAvgAmt  :{ type:"number"}          //이평가금액
                          , movingAvgTaxDdctAmt:{ type:"number"}          //이평가금액(세금제외)
                          , carRegNo:{ type:"string"} 
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.ordDt = kendo.parseDate(elem.ordDt, "<dms:configValue code='dateFormat' />");
                                elem.calcDt = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                                elem.returnDt = kendo.parseDate(elem.returnDt, "<dms:configValue code='dateFormat' />");
                                elem.saleTp = changeSaleTp(elem.saleTp);
                                elem.custTp = changeCustTp(elem.custTp);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                         { field: "itemCnt", aggregate: "sum" }
                        ,{ field: "itemQty", aggregate: "sum" }
                        ,{ field: "itemAmt", aggregate: "sum" }
                        ,{ field: "returnItemCnt", aggregate: "sum" }
                        ,{ field: "returnItemQty", aggregate: "sum" }
                        ,{ field: "returnItemAmt", aggregate: "sum" }
                        ,{ field: "movingAvgAmt", aggregate:"sum" }
                        ,{ field: "movingAvgTaxDdctAmt", aggregate:"sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , editable   :false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,change:function(e){
            }
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"parSaleOrdNo"
                      ,title:"<spring:message code='par.lbl.partsSaleNo' />"
                      ,template:function(dataItem){
                          var spanObj = "";
                              spanObj = "<a class='k-link' onclick=\"fn_linkPartsSale('" + dataItem.parSaleOrdNo + "','" + dataItem.ordStatCd + "' ); \">"+dataItem.parSaleOrdNo+"</a>";

                          return spanObj;
                     }
                      ,width:130 }                //부품판매오더번호
                 ,{field:"saleTp"
                      ,title:"<spring:message code='par.lbl.partsSalePrcTp' />"
                      ,attributes:{ "class":"ac"}
                      ,width:140 }                //판매유형
                 ,{field:"salePrsnId"
                      ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                      ,width:105
                      ,hidden:true}  //담당자 코드
                 ,{field:"salePrsnNm"
                      ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                      ,width:140 }  //담당자명
                 ,{field:"ordStatCd"
                      ,title:"<spring:message code='par.lbl.partsSaleStat' />"
                      ,attributes:{ "class":"ac"}
                      ,width:100
                      ,template:function(dataItem){

                          var spanObj = "";

                          switch(dataItem.ordStatCd)
                          {
                              case "02":// 완료

                                  spanObj = "<span class='txt_label bg_blue'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "03":// 취소

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "04":// 정산

                                  spanObj = "<span class='txt_label bg_yellow'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "05":// 수납

                                  spanObj = "<span class='txt_label bg_orange'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "07":// 반품

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                              case "08":// 전체반품

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              default: // 등록

                                  spanObj = "<span class='txt_label bg_gray'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                          }

                          return spanObj;
                      }
                 }                //상태
                 ,{field:"itemCnt"
                     ,title:"<spring:message code='par.lbl.parSaleCnt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                  }      //건수
                  ,{field:"itemQty"
                      ,title:"<spring:message code='par.lbl.parSaleQty' />"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,aggregates:["sum"]
                      ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                   }      //건수
                 ,{field:"ordDt"
                      ,title:"<spring:message code='par.lbl.partsSaleDt' />"
                      ,attributes:{"class":"ac tooltip-disabled"}
                      ,template:"#if (ordDt !== null ){# #= kendo.toString(data.ordDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,width:90 }                //오더일
                 ,{field:"calcDt"
                      ,title:"<spring:message code='par.lbl.calcDt' />"
                      ,attributes:{ "style":"text-align:right"}
                      ,attributes:{"class":"ac tooltip-disabled"}
                      ,template:"#if (calcDt !== null ){# #= kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "class":"ac"}
                      ,width:90 }                //정산일
                   ,{field:"itemAmt"
                       ,title:"<spring:message code='par.lbl.parSaleTotAmt' />"
                       ,width:90
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,aggregates:["sum"]
                       ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}      //건수
                 ,{field:"movingAvgAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                        ,aggregates:["sum"]
                        ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}     //출고이동평균금액
                 ,{field:"movingAvgTaxDdctAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                        ,aggregates:["sum"]
                        ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}     //출고이동평균금액(세금제외)
                 ,{field:"custCd"
                      ,title:"<spring:message code='par.lbl.bpCstCd' />"
                      ,width:105
                      ,hidden:true}  //고객 코드
                 ,{field:"custNm"
                      ,title:"<spring:message code='par.lbl.bpCstNm' />"
                      ,width:140 }  //고객명
                 ,{title:"<spring:message code='par.lbl.carNo' />"
                      ,field:"carRegNo"
                      ,width:140 }  //차번호
                 ,{title:"<spring:message code='par.lbl.vinNo' />"
                      ,_field:"_vinNo"
                      ,width:140 }  //VIN번호
                 ,{title:"<spring:message code='ser.lbl.carOwner' />"
                      ,_field:"_carOwner"
                      ,width:140 }  //차량소유주
                 ,{field:"custTp"
                      ,title:"<spring:message code='par.lbl.custTp' />"
                      ,attributes:{ "class":"ac"}
                      ,width:100 }                //고객유형
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.partsSaleRemark' />"
                     ,width:120
                  }      //비고
                 ,{title:"<spring:message code='par.lbl.partReturnNo' />"
                      ,field:"returnDocNo"
                      ,width:140 ,hidden:true}  //부품반품번호
                 ,{field:"returnDt"
                         ,title:"<spring:message code='par.lbl.partsReturnDt' />"
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                         ,width:100
                         ,attributes:{"class":"ac tooltip-disabled"}
                         ,template:"#if (returnDt !== null ){# #= kendo.toString(data.returnDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                      }  //부품반품일시
                 ,{field:"returnNm"
                      ,title:"<spring:message code='par.lbl.partsReturner' />"
                      ,width:140 }  //부품반품자
                 ,{field:"returnItemCnt"
                      ,title:"<spring:message code='par.lbl.returnItemCnt' />"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,aggregates:["sum"]
                      ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"}  //부품반품건수
                 ,{field:"returnItemQty"
                      ,title:"<spring:message code='par.lbl.returnItemQty' />"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,aggregates:["sum"]
                      ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"}  //부품반품수량
                 ,{field:"returnItemAmt"
                      ,title:"<spring:message code='par.lbl.returnItemAmt' />"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,aggregates:["sum"]
                      ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}  //부품반품금액
            ]
        });

        // 부품판매명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0323-151299"
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/ism/issue/selectPartsSaleOrdItemByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            //var params = {};

                            // 판매현황 검색조건 코드.
                            //params["sParSaleOrdNo"] = $("#parSaleOrdNo").val();

                            //return kendo.stringify(params);
                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value(),
                                cnfmStatYn = 'N';

                            if(sOrdStatCdLst.length > 0){

                                var statCdLen = sOrdStatCdLst.length;
                                for(var i = 0; i < statCdLen; i = i + 1){
                                    //if(sOrdStatCdLst[i] === '07'){
                                    if(sOrdStatCdLst[i] === '02'){
                                        cnfmStatYn = 'Y';
                                    }
                                }
                            }

                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }

                            if(cnfmStatYn === 'Y'){
                                sOrdStatCdLst.push('08');
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustCd"]            = $("#sCustCd").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSalePrsnId"]        = $("#sSalePrsnId").val();
                            params["sSalePrsnNm"]        = $("#sSalePrsnNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sCalcDtFr"]          = $("#sCalcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sCalcDtTo"]          = $("#sCalcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sItemCntFr"]         = $("#sItemCntFr").data("kendoExtNumericTextBox").value();
                            params["sItemCntTo"]         = $("#sItemCntTo").data("kendoExtNumericTextBox").value();
                            params["sItemQtyFr"]         = $("#sItemQtyFr").data("kendoExtNumericTextBox").value();
                            params["sItemQtyTo"]         = $("#sItemQtyTo").data("kendoExtNumericTextBox").value();
                            params["sItemAmtFr"]         = $("#sItemAmtFr").data("kendoExtNumericTextBox").value();
                            params["sItemAmtTo"]         = $("#sItemAmtTo").data("kendoExtNumericTextBox").value();
                            params["sCustTelNo"]         = $("#sCustTelNo").data("kendoMaskedTextBox").value();


                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                      data:function (result){
                         var dataLen,
                             itemList = [],
                             header;

                         if(!dms.string.isEmpty(result.data)){
                             dataLen = result.data.length;
                         }

                         if(result.total > 0){
                             selectAllGridRowYN = 'Y';
                         }

                         if(selectAllGridRowYN === 'N'){
                             dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                              parSaleOrdNo      :{ type:"string", editable:false }
                            , parSaleOrdLineNo  :{ type:"number", editable:false }
                            , saleTp            :{ type:"string" }
                            , itemDstinCd       :{ type:"string", editable:false } //품목구분
                            , itemCd            :{ type:"string" }
                            , itemNm            :{ type:"string" }
                            , unitCd            :{ type:"string" }
                            , ordQty            :{ type:"number" }
                            , cancQty           :{ type:"number", editable:false }
                            , returnQty         :{ type:"number" }
                            , returnTotAmt      :{ type:"number" }
                            , preReturnQty      :{ type:"number", editable:false }
                            , prcTp             :{ type:"string", editable:false }
                            , prc               :{ type:"number" }
                            , amt               :{ type:"number" }
                            , dcAmt             :{ type:"number" }
                            , partCost          :{ type:"number" }
                            , totAmt            :{ type:"number" }
                            , dcRate            :{ type:"number" }
                            , stockQty          :{ type:"number", editable:false }
                            , avlbStockQty      :{ type:"number", editable:false }
                            , resvStockQty      :{ type:"number", editable:false }
                            , borrowQty         :{ type:"number", editable:false }
                            , rentQty           :{ type:"number", editable:false }
                            , salePrsnId        :{ type:"string", editable:false }
                            , salePrsnNm        :{ type:"string", editable:false }
                            , giDt              :{ type:"date"  , editable:false }
                            , giTime            :{ type:"string", editable:false }
                            , cancId            :{ type:"string", editable:false }
                            , cancNm            :{ type:"string", editable:false }
                            , cancDt            :{ type:"date"  , editable:false }
                            , cancTime          :{ type:"string", editable:false }
                            , returnId          :{ type:"string", editable:false }
                            , returnNm          :{ type:"string", editable:false }
                            , returnDt          :{ type:"date"  , editable:false }
                            , returnTime        :{ type:"string", editable:false }
                            , eqipExpcDt        :{ type:"date"  , editable:false }
                            , receiveDt         :{ type:"string", editable:false }
                            , returnDocNo       :{ type:"string", editable:false }
                            , movingAvgPrc      :{ type:"number", editable:false }          //이평가금액
                            , movingAvgTaxDdctPrc:{ type:"number", editable:false }          //이평가금액
                            , movingAvgAmt       :{ type:"number", editable:false }          //이평가금액
                            , movingAvgTaxDdctAmt:{ type:"number", editable:false }          //이평가금액(세금제외)
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.returnDt = kendo.parseDate(elem.returnDt, "<dms:configValue code='dateFormat' />");
                                elem.giStatCd = changeGiStatCd(elem.giStatCd);
                                elem.giStrgeCd = changeStrgeCd(elem.giStrgeCd);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                         { field: "ordQty", aggregate: "sum" }
                        ,{ field: "returnQty", aggregate: "sum" }
                        ,{ field: "returnTotAmt", aggregate: "sum" }
                        ,{ field: "amt", aggregate: "sum" }
                        ,{ field: "partCost", aggregate: "sum" }
                        ,{ field: "totAmt", aggregate: "sum" }
                        ,{ field: "dcAmt", aggregate: "sum" }
                        ,{ field: "stockQty", aggregate: "sum" }
                        ,{ field: "avlbStockQty", aggregate: "sum" }
                        ,{ field: "resvStockQty", aggregate: "sum" }
                        ,{ field: "borrowQty", aggregate: "sum" }
                        ,{ field: "rentQty", aggregate: "sum" }
                        ,{ field: "movingAvgAmt", aggregate:"sum" }
                        ,{ field: "movingAvgTaxDdctAmt", aggregate:"sum" }
                    ]
            }
            , height:353
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , editable   :false
            , appendEmptyColumn:true
            , columns:[
                  {field:"parSaleOrdNo" ,title:"<spring:message code='par.lbl.partsSaleNo' />", width:130 }                //부품판매오더번호
                , {field:"itemDstinCd",title:"<spring:message code='par.lbl.itemDstinCd'  />",width:80
                     ,template  :'#= changeItemDstinCd(itemDstinCd)#',attributes:{ "style":"text-align:left"}}//품목구분
                , {field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:140}//부품번호
                , {field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:200}//부품명
                , {field:"unitCd",title:"<spring:message code='par.lbl.unitNm' />",width:80,attributes:{ "class":"ac"}
                     ,template:'#= changeUnitCd(unitCd)#'}//단위
                , {field:"ordQty",title:"<spring:message code='par.lbl.partsSaleQty' />",width:60,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                  }//수량
                , {field:"prc",title:"<spring:message code='par.lbl.partsSalePrc' />",width:120,attributes:{ "style":"text-align:right"},format:"{0:n2}"}//단가
                , {field:"partCost",title:"<spring:message code='par.lbl.partsSaleAmt' />",width:120
                     ,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }//금액
                , {field:"dcRate",title:"<spring:message code='par.lbl.cstDcRate' />",width:60,attributes:{ "style":"text-align:right"},format:"{0:n0}"
                     ,template:function(dataItem){
                         var spanObj = "";
                             spanObj = dataItem.dcRate + "%";
                         return spanObj;
                    }
                  }//D/C Rate
                , {field:"dcAmt",title:"<spring:message code='par.lbl.cstDcAmt' />",width:90,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }//할인금액
                , {field:"amt",title:"<spring:message code='par.lbl.partCost' />",width:90,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}//부품비용
                , {field:"totAmt",title:"<spring:message code='par.lbl.parSaleTotAmt' />",width:120
                     ,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}//판매총금액
                 ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}
                 ,{field:"movingAvgTaxDdctPrc" ,title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//출고이동평균단가(세금제외)
                 ,{field:"movingAvgAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}//출고이동평균금액
                 ,{field:"movingAvgTaxDdctAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"}//출고이동평균금액(세금제외)
                , {field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                   }
                , {field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                  }
                , {field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                  }//예류수량
                , {field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                  }//차출수량
                , {field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"}  ,format:"{0:n2}" ,decimal:2 ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                  }//차입수량
                , {field:"receiveDt",title:"<spring:message code='par.lbl.receiveCnfmDt'/>",format:"{0:<dms:configValue code='dateFormat' />}",width:80}
                , {field:"salePrsnNm",title:"<spring:message code='par.lbl.partsSalePrsn' />",width:100}//부품판매담당자
                , {field:"giStrgeCd",title:"<spring:message code='par.lbl.giStrgeCd' />",width:100
                     ,sortable:false}  //출고창고
                , {field:"giLocCd",title:"<spring:message code='par.lbl.locationCd' />",width:140
                     ,sortable:false} //로케이션
                , {field:"giStatCd",title:"<spring:message code='par.lbl.partsSaleStat' />"
                     ,attributes:{ "class":"ac"}
                     ,width:90,sortable:false
                  }//부품판매상태
                , {field:"returnQty",title:"<spring:message code='par.lbl.returnPartsQty' />",width:60,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                  }//반품수량
                , {field:"returnTotAmt",title:"<spring:message code='par.lbl.returnItemAmt' />",width:90,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }//반품금액
                , {field:"preReturnQty",title:"<spring:message code='par.lbl.preReturnPartsQty' />",width:80
                     ,attributes:{ "style":"text-align:right"},format:"{0:n2}"
                  }//기반품수량
                , {field:"returnDt",title:"<spring:message code='par.lbl.returnTime' />",width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{"class":"ac tooltip-disabled"}
                     ,template:"#if (returnDt !== null ){# #= kendo.toString(data.returnDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"

                  }//반품일
                , {field:"returnDocNo",title:"<spring:message code='par.lbl.partsSaleReturnNo' />",width:120,hidden:true}//반품번호
            ]
        });

     // 부품판매 정산현황 그리드
        $("#gridCalc").kendoExtGrid({
            gridId:"G-PAR-0527-161001"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrdForCalcs.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value(),
                                cnfmStatYn = 'N';

                            if(sOrdStatCdLst.length > 0){
                                var statCdLen = sOrdStatCdLst.length;
                                for(var i = 0; i < statCdLen; i = i + 1){
                                    //if(sOrdStatCdLst[i] === '07'){
                                    if(sOrdStatCdLst[i] === '02'){
                                        cnfmStatYn = 'Y';
                                    }
                                }
                            }
                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }

                            if(cnfmStatYn === 'Y'){
                                sOrdStatCdLst.push('08');
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sCalcDocNo"]         = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustCd"]            = $("#sCustCd").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSalePrsnId"]        = $("#sSalePrsnId").val();
                            params["sSalePrsnNm"]        = $("#sSalePrsnNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sCalcDtFr"]          = $("#sCalcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sCalcDtTo"]          = $("#sCalcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sCustTelNo"]         = $("#sCustTelNo").data("kendoMaskedTextBox").value();
                            params["sItemCntFr"]         = $("#sItemCntFr").data("kendoExtNumericTextBox").value();
                            params["sItemCntTo"]         = $("#sItemCntTo").data("kendoExtNumericTextBox").value();
                            params["sItemQtyFr"]         = $("#sItemQtyFr").data("kendoExtNumericTextBox").value();
                            params["sItemQtyTo"]         = $("#sItemQtyTo").data("kendoExtNumericTextBox").value();
                            params["sItemAmtFr"]         = $("#sItemAmtFr").data("kendoExtNumericTextBox").value();
                            params["sItemAmtTo"]         = $("#sItemAmtTo").data("kendoExtNumericTextBox").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total > 0){
                            selectAllGridRowYN = 'Y';
                        }
                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                            dlrCd         :{ type:"string"}
                          , ordStatCd     :{ type:"string"}
                          , ordDt         :{ type:"date"  }
                          , saleTp        :{ type:"string"}
                          , custTp        :{ type:"string"}
                          , custCd        :{ type:"string"}
                          , custNm        :{ type:"string"}
                          , parSaleOrdNo  :{ type:"string"}
                          , calcDocNo     :{ type:"string"}
                          , calcStatCd    :{ type:"string"}
                          , calcCancYn    :{ type:"string"}
                          , calcCompUsrId :{ type:"string"}
                          , calcCompUsrNm :{ type:"string"}
                          , calcCancId    :{ type:"string"}
                          , calcCancNm    :{ type:"string"}
                          , calcDt        :{ type:"date"  }
                          , calcCancDt    :{ type:"date"  }
                          , saId          :{ type:"string"}
                          , saNm          :{ type:"string"}
                          , remark        :{ type:"string"}
                          , itemCnt       :{ type:"number"}
                          , itemQty       :{ type:"number"}
                          , itemAmt       :{ type:"number"}
                          , parCalcSumAmt :{ type:"number"}
                          , paymAmt       :{ type:"number"}
                          , calcDtFormat  :{ type:"date"  }
                          , calcCancDtFormat:{ type:"date"  }
                          , calcEndDtFormat:{ type:"date"  }
                          , movingAvgAmt  :{ type:"number" }          //이평가금액
                          , movingAvgTaxDdctAmt:{ type:"number" }          //이평가금액(세금제외)
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.ordDt = kendo.parseDate(elem.ordDt, "<dms:configValue code='dateFormat' />");
                                elem.calcDtFormat = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                                elem.calcCancDtFormat = kendo.parseDate(elem.calcCancDt, "<dms:configValue code='dateFormat' />");
                                elem.calcEndDtFormat = kendo.parseDate(elem.calcEndDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
                ,aggregate:
                    [
                         { field: "itemCnt", aggregate: "sum" }
                        ,{ field: "itemQty", aggregate: "sum" }
                        ,{ field: "itemAmt", aggregate: "sum" }
                        ,{ field: "parCalcSumAmt", aggregate: "sum" }
                        ,{ field: "paymAmt", aggregate: "sum" }
                        ,{ field: "movingAvgAmt", aggregate:"sum" }
                        ,{ field: "movingAvgTaxDdctAmt", aggregate:"sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , editable   :false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , change:function(e){
            }
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"calcDocNo"
                      ,title:"<spring:message code='par.lbl.calcNo' />"
                      ,width:130}//정산번호
                 ,{field:"parSaleOrdNo"
                      ,title:"<spring:message code='par.lbl.partsSaleNo' />"
                      ,width:130 }                //부품판매오더번호
                 ,{field:"saleTp"
                      ,title:"<spring:message code='par.lbl.partsSalePrcTp' />"
                      ,template:'#= changeSaleTp(saleTp)#'
                      ,attributes:{ "class":"ac"}
                      ,width:140 }                //판매유형
                 ,{field:"salePrsnId"
                      ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                      ,width:105
                      ,hidden:true}  //담당자 코드
                 ,{field:"salePrsnNm"
                      ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                      ,width:140 }  //담당자명
                 ,{field:"ordStatCd"
                      ,title:"<spring:message code='par.lbl.partsSaleStat' />"
                      ,attributes:{ "class":"ac"}
                      ,width:100
                      ,template:function(dataItem){

                          var spanObj = "";

                          switch(dataItem.ordStatCd)
                          {
                              case "02":// 완료

                                  spanObj = "<span class='txt_label bg_blue'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "03":// 취소

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "04":// 정산

                                  spanObj = "<span class='txt_label bg_yellow'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "05":// 수납

                                  spanObj = "<span class='txt_label bg_orange'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "07":// 반품

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                              case "08":// 전체반품

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              default: // 등록

                                  spanObj = "<span class='txt_label bg_gray'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                          }

                          return spanObj;
                      }
                 }                //상태
                 ,{field:"itemCnt"
                     ,title:"<spring:message code='par.lbl.parSaleCnt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                  }      //건수
                  ,{field:"itemQty"
                      ,title:"<spring:message code='par.lbl.parSaleQty' />"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,aggregates:["sum"]
                      ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                   }      //건수
                 ,{field:"ordDt"
                      ,title:"<spring:message code='par.lbl.partsSaleDt' />"
                      ,width:90
                      ,attributes:{"class":"ac tooltip-disabled"}
                      ,template:"#if (ordDt !== null ){# #= kendo.toString(data.ordDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                   }                //오더일
                 ,{field:"calcDt"
                      ,title:"<spring:message code='par.lbl.calcDt' />"
                      ,width:90
                      ,attributes:{"class":"ac tooltip-enabled"}
                      ,template:"#if (ordDt !== null ){# #= kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                   }                //정산일
                   ,{field:"itemAmt"
                       ,title:"<spring:message code='par.lbl.parSaleTotAmt' />"
                       ,width:90
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,aggregates:["sum"]
                       ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                    }      //건수
                   ,{field:"movingAvgAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                        ,aggregates:["sum"]
                        ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                    }//출고이동평균금액
                   ,{field:"movingAvgTaxDdctAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                        ,aggregates:["sum"]
                        ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                     }//출고이동평균금액(세금제외)
                   ,{field:"parCalcSumAmt"
                       ,title:"<spring:message code='ser.lbl.finalCalcAmt' />"
                       ,width:90
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,aggregates:["sum"]
                       ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                    }      //건수
                   ,{field:"paymAmt"
                       ,title:"<spring:message code='ser.lbl.arCd' />"
                       ,width:90
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,aggregates:["sum"]
                       ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                    }      //건수
                 ,{field:"custCd"
                      ,title:"<spring:message code='par.lbl.bpCstCd' />"
                      ,width:105
                      ,hidden:true}  //고객 코드
                 ,{field:"custNm"
                      ,title:"<spring:message code='par.lbl.bpCstNm' />"
                      ,width:140 }  //고객명
                 ,{field:"custTp"
                      ,title:"<spring:message code='par.lbl.custTp' />"
                      ,template:'#= changeCustTp(custTp)#'
                      ,attributes:{ "class":"ac"}
                      ,width:100 }                //고객유형
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.partsSaleRemark' />"
                     ,width:120
                  }      //비고
                 ,{field:"calcStatCd", title:"<spring:message code='ser.lbl.calcStat' />", width:100, sortable:false, attributes:{"class":"ac"}
                      //,template: "#=roStatCdGrid(calcStatCd)#"
                      ,template:function(dataItem){

                             var spanObj = "";

                             switch(dataItem.calcStatCd)
                             {
                                 case "00":// 완료

                                     spanObj = "<span class='txt_label bg_blue'>"+roStatCdArr[dataItem.calcStatCd].cmmCdNm+"</span>";

                                     break;

                                 case "07":// 취소

                                     spanObj = "<span class='txt_label bg_red'>"+roStatCdArr[dataItem.calcStatCd].cmmCdNm+"</span>";

                                     break;

                                 case "03":// 정산대기

                                     spanObj = "<span class='txt_label bg_yellow'>"+roStatCdArr[dataItem.calcStatCd].cmmCdNm+"</span>";

                                     break;

                                 case "04":// 정산확인

                                     spanObj = "<span class='txt_label bg_orange'>"+roStatCdArr[dataItem.calcStatCd].cmmCdNm+"</span>";

                                     break;

                                 default: // 그외

                                     spanObj = "<span class='txt_label bg_gray'>"+roStatCdArr[dataItem.calcStatCd].cmmCdNm+"</span>";
                                     break;
                             }
                             return spanObj;
                         }
                  }   // RO상태
                 ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcDt' />", width:120, sortable:false
                     , attributes:{"class":"ac tooltip-enabled"}
                     , template:"#= dms.string.strNvl(kendo.toString(data.calcDtFormat, '<dms:configValue code='dateFormat' /> HH:mm')) #"
//                      ,attributes:{"class":"ac tooltip-disabled"}
//                      ,template:"#if (calcDt !== null ){# #= kendo.toString(data.calcDt, '<dms:configValue code='dateTimeFormat' />HH:mm') # #} else {# #= '' # #}#"
                  }   // 정산일자
                 ,{field:"calcUsrNm", title:"<spring:message code='ser.lbl.settlement' />", width:100}   // 서비스정산자
                 ,{field:"calcCancDtFormat", title:"<spring:message code='ser.lbl.calcCancelDt' />", width:120, sortable:false
                    ,attributes:{"class":"ac tooltip-disabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.calcCancDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                  }   // 정산취소시간
                 ,{field:"calcCancNm", title:"<spring:message code='ser.lbl.calcCancNm' />", width:100}           // 취소서비스정산자
                 ,{field:"calcEndDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:140, sortable:false
                    ,attributes:{"class":"ac tooltip-disabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.calcEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                  }   // 정산완료시간
                 ,{field:"calcCompUsrNm", title:"<spring:message code='ser.lbl.calcCompNm' />", width:100}           // 정산완료자
            ]
        });


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

         //  판매유형
         changeSaleTp = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(saleTpObj[val])){
                     returnVal = saleTpObj[val];
                 }
             }
             return returnVal;
         };

         // 고객유형
         changeCustTp = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(custTpObj[val])){
                     returnVal = custTpObj[val];
                 }
             }
             return returnVal;
         };

          // 부품유형
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(itemDstinCdObj[val])){
                     returnVal = itemDstinCdObj[val];
                 }
             }
             return returnVal;
         };

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(unitCdObj[val])){
                     returnVal = unitCdObj[val];
                 }
             }
             return returnVal;
         };

         // 판매상태
         changeGiStatCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(giStatCdObj[val])){
                     returnVal = giStatCdObj[val];
                 }
             }
             return returnVal;
         };

        // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(giStrgeTpObj[val])){
                     returnVal = giStrgeTpObj[val];
                 }
             }
             return returnVal;
         };

         // 로케이션
         changeGiLocCd = function(strgeCd, locCd){
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

         //RO상태
         roStatCdGrid = function(val){

             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(roStatCdArr[val])){
                     returnVal = roStatCdArr[val].cmmCdNm;
                 }
             }
             return returnVal;
         };

        initPage();

        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                selectTabId = e.item.id;

            }
        });
    });

    function fnChangeCustTp(e){
        $('#sCustCd').val('');
        $('#sCustNm').val('');
        fnInstantCustChk(false);
    }

    function fnChangeIntantCust(e){
        fnInstantCustChk($('#sInstantCust').prop("checked"));
    }

    function fnInstantCustChk(pCheck){

        if(pCheck === true){
            $('#sCustCd').val('guest');
            $('#sCustNm').val('');
            $("#sCustTp").data("kendoExtDropDownList").value('01');
        }else{
            $('#sInstantCust').prop("checked",false);
            $('#sCustCd').val('');
            $('#sCustNm').val('');
        }
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

       $("#grid").data("kendoExtGrid").dataSource.data([]);
       $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
       $("#gridCalc").data("kendoExtGrid").dataSource.data([]);

       frYY = minDate.getFullYear();
       frMM = minDate.getMonth();
       frDD = minDate.getDate();

       toYY = maxDate.getFullYear();
       toMM = maxDate.getMonth();
       toDD = maxDate.getDate();
       $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
       $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);

       $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
       $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
       selectTabId = 'tabPartsSaleListInfo';
       selectAllGridRowYN = 'N';
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
          if(id === 'sOrdDtFr'){
              var minDate = new Date(sevenDtBf);
              frYY = minDate.getFullYear();
              frMM = minDate.getMonth();
              frDD = minDate.getDate();
              $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value('');
              $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sOrdDtTo'){
              var maxDate = new Date(toDt);
              toYY = maxDate.getFullYear();
              toMM = maxDate.getMonth();
              toDD = maxDate.getDate();

              $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value('');
              $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }else if(id === 'sCalcDtFr'){
              var minDate = new Date(sevenDtBf);
              frYY = minDate.getFullYear();
              frMM = minDate.getMonth();
              frDD = minDate.getDate();
              $("#sCalcDtFr").data("kendoExtMaskedDatePicker").value('');
              $("#sCalcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sCalcDtTo'){
              var maxDate = new Date(toDt);
              toYY = maxDate.getFullYear();
              toMM = maxDate.getMonth();
              toDD = maxDate.getDate();

              $("#sCalcDtTo").data("kendoExtMaskedDatePicker").value('');
              $("#sCalcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
      }else{
          if(id === 'sOrdDtFr'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sOrdDtTo'){
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }else if(id === 'sCalcDtFr'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sCalcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sCalcDtTo'){
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sCalcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
      }


   }

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sSalePrsnId").val(data[0].usrId);
                            $("#sSalePrsnNm").val(data[0].usrNm);

                        }
                       // userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function custSearchPopup() {
        if(dms.string.isEmpty($("#sCustTp").data("kendoExtDropDownList").value())){
            //고객유형은 필수 입력 사항입니다.
            dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
            return false;
        }

        if($("#sCustTp").data("kendoExtDropDownList").value() === '01'){
            selectCustSearchPopupWindow();
        }else if($("#sCustTp").data("kendoExtDropDownList").value() === '02'){
            selectVenderMasterPopupWindow();
        }
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
                    ,"callbackFunc":function(data){
                        $("#sCustCd").val(data[0].bpCd);
                        $("#sCustNm").val(data[0].bpNm);
                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            $("#sCustCd").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);

                        }
                    }
                }
            }
        });
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

           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }
</script>
<!-- //script -->


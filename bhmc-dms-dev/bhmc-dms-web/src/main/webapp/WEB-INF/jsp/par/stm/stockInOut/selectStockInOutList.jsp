<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

   <!-- 재고리스트 조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.stockList" /><!-- 재고리스트 조회 --></h1>--%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11846" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11845" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min"><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11840" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m btn_save" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11839" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:17%;">
                    <col style="width:10%;">
                    <col style="width:17%;">
                    <col style="width:10%;">
                    <col style="width:13%;">
                    <col style="width:10%;">
                    <col style="width:13%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></th>
                        <td>
                            <input id="sBpTp" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.strgeCd" /><!-- 창고 --></th>
                        <td>
                            <input type="text" id="sStrgeCd" type="text" data-type="multicombo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                        <td>
                            <input id="sBrandCd" name="sBrandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemType" /><!-- 부품유형 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemGrpCd" class="form_input form_readonly" data-type="combo"  readonly="readonly" />
                            <a id="searchItemGrpCd"><!-- 검색 --></a>
                            </div>
                            <input type="text" id="sEndYn" class="form_comboBox hidden" data-type="combo" />
                            <input type="text" id="sAbcInd" class="form_comboBox hidden" data-type="combo" />

                            <input type="hidden" id="sItemGrpCd1" />
                            <input type="hidden" id="sItemGrpCd2" />
                            <input type="hidden" id="sItemGrpCd3" />
                            <input type="hidden" id="sItemGrpCd4" />

                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" />
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input type="text" id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 부품속성 --></th>
                        <td>
                             <input type="text" id="sItemDstinCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.lastStockInDt" /><!-- 최근입고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sLastGrDtFr" class="form_datepicker"  data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sLastGrDtTo" class="form_datepicker"  data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastStockOutDt" /><!-- 최근출고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sLastGiDtFr" class="form_datepicker"  data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sLastGiDtTo" class="form_datepicker"  data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.nonMovingFlg" /><!-- 방치품(Non-Moving여부) --></th>
                        <td>
                            <input type="text" id="sNonMovingFlg" class="form_comboBox"  data-type="combo"/>
                        </td>
                        <th scope="row"></th>
                        <td>
                            <label class="label_check"><input type="checkbox" id="sAvailQtyFlg" class="form_check" data-type="checkbox">&nbsp;<spring:message code="par.lbl.excludeAvlbStockQtyZero" /><!-- 가용재고수량 0인 부품 제외 --></label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- 업체명칭 --></th>
                        <td>
                            <input id="sBpNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockStayDay" /><!-- 재고시간길이 --></th>
                        <td>
                            <div class="form_float">
                            <div class="date_left">
                                <input id="sStockStayDayStart" class="form_numeric ar"  data-type="number"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sStockStayDayEnd" class="form_numeric ar"  data-type="number"/>
                            </div>
                        </div>
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>

        <div class="table_form mt10" id="itemForm">
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
                        <th scope="row"><spring:message code="par.lbl.purcLeadHm" /><!-- 화물도착주기(구매리드타임) --></th>
                        <td>
                            <input id="purcLeadHm" data-type="number" class="form_numeric form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.minPurcQty" /><!-- 최소주문수량 --></th>
                        <td>
                            <input id="minPackQty" readonly data-type="number" class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mm3AvgDmndQty" /><!--3개월평균수요량 --></th>
                        <td>
                            <input id="mm3AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcCqtyCalcYn" /><!--구매수요량계산 --></th>
                        <td class="readonly_area">
                            <input id="purcCqtyCalcYn"  type="text" data-type="combo" readonly class="form_comboBox form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.strgeCd" /><!-- 창고 --></th>
                        <td>
                            <input id="expcGrStrgeCd" type="text" data-type="combo" class="form_comboBox hidden" />
                            <input id="strgeNmList" name="strgeNmList" type="text" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sftyStockQty" /><!--최소안전재고 --></th>
                        <td>
                            <input id="sftyStockQty" data-type="number" class="form_numeric" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mm6AvgDmndQty" /><!--6개월평균수요량 --></th>
                        <td>
                            <input id="mm6AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastStockInDt" /><!--최근입고일 --></th>
                        <td class="readonly_area">
                            <input id="lastGrDt" type="text" value="" readonly class="form_datepicker" data-type="maskDate" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.locationCd" /><!-- Location --></th>
                        <td>
                            <input id="locCd" type="text" class="form_input form_readonly hidden" readonly />
                            <input id="locNmList" name="locNmList" type="text" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sftyStockMaxQty" /><!--최대안전재고 --></th>
                        <td>
                            <input id="sftyStockMaxQty" data-type="number" class="form_numeric" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mm12AvgDmndQty" /><!--12개월평균수요량 --></th>
                        <td>
                            <input id="mm12AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastStockOutDt" /><!--최근출고일 --></th>
                        <td class="readonly_area">
                            <input id="lastGiDt" type="text" value="" readonly class="form_datepicker" data-type="maskDate"  />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.nonMovingFlg" /><!--방치품(Non-Moving여부) --></th>
                        <td class="readonly_area">
                            <input id="nonMovingFlg"  type="text" data-type="combo" readonly class="form_comboBox form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.realStockQty" /><!--실재고 --></th>
                        <td>
                            <input id="stockQty" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carlineStockQty" /><!--대당수량 --></th>
                        <td>
                            <input name="carlineStockQty" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stdrdStockCalcYn" /><!--적정재고계산 --></th>
                        <td class="readonly_area">
                            <input id="stdrdStockCalcYn"  type="text" data-type="combo" readonly class="form_comboBox form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.dangYn" /><!-- 위험품 --></th>
                        <td class="readonly_area">
                            <input id="dgrItemYn" type="text" readonly data-type="combo" class="form_comboBox form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.realResvStockQty" /><!--예류재고 --></th>
                        <td>
                            <input id="resvStockQty" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.minPackQty" /><!--최소포장수량 --></th>
                        <td>
                            <input id="minPurcQty" data-type="number" class="form_numeric" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stdrdStockParameter" /><!--적정재고계수 --></th>
                        <td>
                            <input id="stdrdStockParameter" readonly data-type="number" class="form_numeric form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.paintYn" /><!-- 도색여부 --></th>
                        <td class="readonly_area">
                            <input id="paintYn"  type="text" data-type="combo" readonly class="form_comboBox form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.realAvlbStockQty" /><!--가용재고 --></th>
                        <td>
                            <input id="avlbStockQty" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.endYn" /><!--중지부품 --></th>
                        <td>
                            <input  id="endYn" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mjrUseYn" /><!-- 주사용여부 --></th>
                        <td class="readonly_area">
                            <input id="mjrUseYn" type="text" data-type="combo" readonly class="form_comboBox form_readonly" value="N"/>
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row" class="hidden"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td class="hidden">
                            <input id="itemCd" type="text" class="form_input hidden">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stdrdStockQty" /><!--적정재고 --></th>
                        <td>
                            <input id="stdrdStockQty" readonly class="form_numeric form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemClass" /><!--부품등급(ABC Class) --></th>
                        <td>
                            <input id="itemClass" type="text" value="" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockStrgeCd" /><!-- 재고창고 --></th>
                        <!--  <th scope="row"><spring:message code="par.lbl.expcGrStrgeCd" /></th>--><!-- 예정입고창고 -->
                        <td>
                            <input type="text" id="strgeCd" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
</div>

    <!-- //재고리스트 조회 -->

    <!-- script -->
    <script type="text/javascript">
    var itemDstinCdList = [],
    itemDstinCdObj = {},
    abcIndList = [],
    abcIndObj = {},
    itemGroupList = [],
    itemGroupObj = {},
    itemGroupGridObj = {},
    searchStorageCdList = [],
    storageCdList = [],
    storageObj = {},
    useYnList = [],
    useYnObj = {},
    spyrCdObj = {},
    bpTpList = [],
    bpTpObj = {},
    brandCdList = [],
    brandCdObj = {},
    carlineCdList = [],
    rowNumber = 0,
    chkDateValue,
    toDt = "${toDt}",
    selectItempopupWindow,
    investigationListPopupWindow,
    searchItemMasterGroupPopupWindow,
    searchItemPopupWindow;

    //창고 선택
    searchStorageCdList.push({"cmmCd":" ", "cmmCdNm":"<spring:message code='par.lbl.checkClearAll' />", "useYn":""});
    storageCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${storageList}" varStatus="status"> //key value
        searchStorageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        storageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${storageAllList}" varStatus="status"> //key value
        storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //품목구분선택
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
        if("${obj.useYn}" !== 'N'){
          itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${bpTpList}" varStatus="status">
        if("01" === "${obj.remark2}"){
            bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        }
    </c:forEach>
    //brandCdList
    <c:forEach var="obj" items="${brandCdList}" varStatus="status">
        brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    //품목그룹 선택
    <c:forEach var="obj" items="${itemGroupList}">
    if(itemGroupObj.hasOwnProperty("${obj.itemDstinCd}")){
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
        itemGroupGridObj["${obj.itemDstinCd}"]["${obj.itemGrpCd}"] = "${obj.itemGrpNm}";
    }else{
        itemGroupObj["${obj.itemDstinCd}"] = [];
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"", cmmCdNm:"All"});
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});

        itemGroupGridObj["${obj.itemDstinCd}"] = {};
        itemGroupGridObj["${obj.itemDstinCd}"]["${obj.itemGrpCd}"] = "${obj.itemGrpNm}";
    }
    </c:forEach>
    //ABC Class선택
    <c:forEach var="obj" items="${abcIndList}" varStatus="status"> //key value
        abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    //차종선택
    <c:forEach var="obj" items="${carlineCdList}" varStatus="status"> //key value
        carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    </c:forEach>
    //공급상코드
    <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
        spyrCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    //사용유무
    useYnList.push({cmmCd:"Y", cmmCdNm:"<spring:message code='par.lbl.yes' />"});
    useYnObj["Y"] = "<spring:message code='par.lbl.yes' />";
    useYnList.push({cmmCd:"N", cmmCdNm:"<spring:message code='par.lbl.n' />"});
    useYnObj["N"] = "<spring:message code='par.lbl.n' />";

    $(document).ready(function() {

        //조회조건 - 거래처유형선택
        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:bpTpList
            ,index:0
        });

        //조회조건-창고선택
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

        //브랜드:검색
        $("#sBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,optionLabel:" "
            ,index:0
        });

        //조회조건-창고선택
        $("#strgeCd").kendoExtDropDownList({
            dataSource:storageCdList
            ,dataTextField :"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
        });

        //조회조건-품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataSource:itemDstinCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,index:0
        });

        //조회조건-차종선택
        $("#sCarlineCd").kendoExtDropDownList({
            dataSource:carlineCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
        });

        //조회조건-단종여부선택
        $("#sEndYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:useYnList
            ,index:0
       });

        //조회조건-ABC Class선택
        $("#sAbcInd").kendoExtDropDownList({
            dataSource:abcIndList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
        });

        //조회조건-Non-Moving Stock 여부선택
        $("#sNonMovingFlg").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:useYnList
            ,index:0
       });

         //조회조건-최근입고일 선택
        $("#sLastGrDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
            ,value:""
        });

        $("#sLastGrDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
            ,value:""
        });

        //조회조건-최근출고일 선택
        $("#sLastGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
            ,value:""
        });

        $("#sLastGiDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
            ,value:""
        });
        //sStockStayDayStart
        $("#sStockStayDayStart").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,spinners:false
        });
        //sStockStayDayEnd
        $("#sStockStayDayEnd").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,spinners:false
        });

        $("#lastGrDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });
        $("#lastGiDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });


        //화물도착주기(구매리드타임)
        $("#purcLeadHm").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        //예정입고창고선택
        $("#expcGrStrgeCd").kendoExtDropDownList({
            enable:false
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:storageCdList
            ,index:0
        });

        //최소오더수량
        $("#minPurcQty").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,min:0
            ,max:10000
            ,restrictDecimals: true
            ,spinners:false
        });

        //최소안전재고
        $("#sftyStockQty").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,min:0
            ,max:10000
            ,restrictDecimals: true
            ,spinners:false
        });

        //대당수량
        $("input[name=carlineStockQty]").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,min:0
            ,max:10000
            ,spinners:false
        });

        //최소주문수량
        $("#minPackQty").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        //적정재고
        $("#stdrdStockQty").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,min:0
            ,max:10000
            ,spinners:false
        });

        //적정재고계수
        $("#stdrdStockParameter").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        //최대안전재고
        $("#sftyStockMaxQty").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:0
            ,min:0
            ,max:10000
            ,restrictDecimals: true
            ,spinners:false
        });

        //3개월평균소요량
        $("#mm3AvgDmndQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //6개월평균소요량
        $("#mm6AvgDmndQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //12개월평균소요량
        $("#mm12AvgDmndQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //적정재고계산
        $("#stdrdStockQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //실재고
        $("#stockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //예류재고
        $("#resvStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //가용재고
        $("#avlbStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //적정재고산출
        $("#stdrdStockCalcYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //위험품
        $("#dgrItemYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //방치품
        $("#nonMovingFlg").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //구매수요량계산
        $("#purcCqtyCalcYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //중지부품
        $("#endYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //주사용부품
        $("#mjrUseYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //페인트여부
        $("#paintYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //주사용부품
        $("#mjrUseYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        $("#searchItemGrpCd").on('click', selectPartsMasterGroupPopupWindow);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

       //btnExcelExport
       $("#btnExcelExport").kendoButton({
           click:function(e){

               var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList").value();
               var sItemCd = $("#sItemCd").val();
               var sItemCdLength = 0;
               sItemCdLength = sItemCd.trim().length;

               var grid = $("#grid").data("kendoExtGrid"),
                   checkvalue = $("#sAvailQtyFlg").prop("checked"),
                   sAvailQtyFlg,
                   sStrgeCdLst = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();

                   if(dms.string.isEmpty(sStrgeCdLst[0])){
                       sStrgeCdLst.splice(0,1);
                   }

                   if( checkvalue === true){
                       sAvailQtyFlg = 'Y';
                   }else{
                       sAvailQtyFlg = 'N';
                   }
               if(grid.dataSource.data().length > 0){

                   dms.ajax.excelExport({
                        "beanName"     :"stockInOutService"
                       ,"templateFile" :"PartItemStockMasterTarget_Tpl.xlsx"
                       ,"fileName"     :"PartItemStockMasterDownload_Tpl.xlsx"
                       ,"sBpTp"        : $("#sBpTp").data("kendoExtDropDownList").value()
                       ,"sBpNm"        : $("#sBpNm").val()
                       ,"sItemCd"      :$("#sItemCd").val()
                       ,"sItemNm"      :$("#sItemNm").val()
                       ,"sItemGrpCd"   :""
                       ,"sItemGrpCd1"  :$("#sItemGrpCd1").val()
                       ,"sItemGrpCd2"  :$("#sItemGrpCd2").val()
                       ,"sItemGrpCd3"  :$("#sItemGrpCd3").val()
                       ,"sItemGrpCd4"  :$("#sItemGrpCd4").val()
                       ,"sEndYn"       :$("#sEndYn").data("kendoExtDropDownList").value()
                       ,"sCarlineCd"   :$("#sCarlineCd").data("kendoExtDropDownList").value()
                       ,"sAbcInd"      :$("#sAbcInd").data("kendoExtDropDownList").value()
                       ,"sBrandCd"     :$("#sBrandCd").data("kendoExtDropDownList").value()
                       ,"sNonMovingFlg":$("#sNonMovingFlg").data("kendoExtDropDownList").value()
                       ,"sLastGrDtFr"  :$("#sLastGrDtFr").val()
                       ,"sLastGrDtTo"  :$("#sLastGrDtTo").val()
                       ,"sLastGiDtFr"  :$("#sLastGiDtFr").val()
                       ,"sLastGiDtTo"  :$("#sLastGiDtTo").val()
                       ,"sStockStayDayStart" : $("#sStockStayDayStart").val()
                       ,"sStockStayDayEnd" : $("#sStockStayDayEnd").val()
                       ,"sAvailQtyFlg" :sAvailQtyFlg
                       ,"sItemDstinCd" :sItemDstinCd
                       ,"sStrgeCdList" :sStrgeCdLst
                       ,"recordCountPerPage":grid.dataSource.pageSize()
                       ,"pageIndex":grid.dataSource.page()
                       ,"firstIndex":grid.dataSource.skip()
                       ,"lastIndex":grid.dataSource.skip() + grid.dataSource.take()
                   });
               }else{
                   dms.notification.info("<spring:message code='par.lbl.itemInfo' var='itemInfo' /><spring:message code='global.info.emptyParamInfo' arguments='${itemInfo}' />");
               }
           }
       });

       //저장 btn
       $("#btnSave").kendoButton({
           click:function(e){

               if(dms.string.isEmpty($("#itemCd").val())){
                   // 저장할 목록이 없습니다.
                   dms.notification.warning("<spring:message code='global.info.unselected' />");
                   return false;
               }

               var params = {};

               params["itemCd"] = $("#itemCd").val();
               params["locCd"] = $("#locCd").val();
               params["minPurcQty"] = $("#minPurcQty").data("kendoExtNumericTextBox").value();
               params["sftyStockQty"] = $("#sftyStockQty").data("kendoExtNumericTextBox").value();
               params["stdrdStockApplyRate"] = $("#stdrdStockParameter").data("kendoExtNumericTextBox").value();
               params["maxSftyStockQty"] = $("#sftyStockMaxQty").data("kendoExtNumericTextBox").value();
               params["grStrgeCd"] = $("#expcGrStrgeCd").data("kendoExtDropDownList").value();
               params["endYn"] = $("#endYn").data("kendoExtDropDownList").value();

               $.ajax({
                   url:"<c:url value='/par/stm/stockInOut/updateItemMasterByKey.do' />"
                 , type:"POST"
                 , data:JSON.stringify(params)
                 , dataType:"json"
                 , contentType:'application/json'
                 , async:false
                 , success:function(result) {
                     if (result == 1) {
                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#grid").data("kendoExtGrid").dataSource.read();

                     } else {
                         // 에러 메시지 확인.
                         if(result === 0){
                             dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                         }
                     }
                 }
                 , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
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
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // 현재고리스트 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-162197"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockInOut/selectStockInOutList.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sAvailQtyFlg,
                                checkvalue = $("#sAvailQtyFlg").prop("checked"),
                                sStrgeCdLst = $("#sStrgeCd").data("kendoExtMultiSelectDropDownList").value();

                            if(dms.string.isEmpty(sStrgeCdLst[0])){
                                sStrgeCdLst.splice(0,1);
                            }

                            if( checkvalue === true){
                                sAvailQtyFlg = 'Y';
                            }else{
                                sAvailQtyFlg = 'N';
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 현재고조회 검색조건 코드.
                            params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sStrgeCdList"] = sStrgeCdLst;
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sItemGrpCd"] = "";
                            params["sItemGrpCd1"] = $("#sItemGrpCd1").val();
                            params["sItemGrpCd2"] = $("#sItemGrpCd2").val();
                            params["sItemGrpCd3"] = $("#sItemGrpCd3").val();
                            params["sItemGrpCd4"] = $("#sItemGrpCd4").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sEndYn"] = $("#sEndYn").data("kendoExtDropDownList").value();
                            params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sAbcInd"] = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sBrandCd"] = $("#sBrandCd").data("kendoExtDropDownList").value();
                            params["sNonMovingFlg"] = $("#sNonMovingFlg").data("kendoExtDropDownList").value();

                            params["sLastGrDtFr"] = $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sLastGrDtTo"] = $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiDtFr"] = $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiDtTo"] = $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sAvailQtyFlg"] = sAvailQtyFlg;
                            params["sStockStayDayStart"] = $("#sStockStayDayStart").val();
                            params["sStockStayDayEnd"] = $("#sStockStayDayEnd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                            ,fields:{
                                dlrCd:{ type:"string" }
                                ,pltCd:{ type:"string" }
                                ,rnum:{ type:"number" }
                                ,strgeCd:{ type:"string" }
                                ,itemCd:{ type:"string" }
                                ,itemNm:{ type:"string" }
                                ,stockLockYn:{ type:"string" }
                                ,stockUnitCd:{ type:"string" }
                                ,itemDstinCd:{ type:"string" }
                                ,itemGrpCd:{ type:"string" }
                                ,abcInd:{ type:"string" }
                                ,stockStayDay:{ type:"number" }
                                ,carlineCd:{ type:"string" }
                                ,nonMovingFlg:{ type:"string" }
                                ,endYn:{ type:"string" }
                                ,lastGrDt:{ type:"date" }
                                ,lastGiDt:{ type:"date" }
                                ,stayDt:{ type:"date"}
                                ,stayDay:{ type:"number"}
                                ,stockQty:{ type:"number" }
                                ,avlbStockQty:{ type:"number" }
                                ,resvStockQty:{ type:"number" }
                                ,clamStockQty:{ type:"number" }
                                ,borrowQty:{ type:"number" }
                                ,rentQty:{ type:"number" }
                                ,grScheQty:{ type:"number" }
                                ,stockAmt:{ type:"number" }
                                ,stockTaxDdctAmt:{ type:"number" }
                                ,spyrCd:{ type:"string" }
                                ,regUsrId:{ type:"string" }
                                ,regDt:{ type:"date" }
                                ,updtUsrId:{ type:"string" }
                                ,updtDt:{ type:"date" }
                                ,resvStockQty:{ type:"number" }
                                ,mvtDocYyMm:{ type:"date" }
                                ,mm3AvgDmndQty:{ type:"number" }
                                ,mm6AvgDmndQty:{ type:"number" }
                                ,mm12AvgDmndQty:{ type:"number" }
                                ,grStrgeCd:{ type:"string" }
                                ,purcLeadHm:{ type:"string" }
                                ,purcCqtyCalcYn:{ type:"string" }
                                ,maxSftyStockQty:{ type:"number" }
                                ,sftyStockQty:{ type:"number" }
                                ,minPurcQty:{ type:"number" }
                                ,stdrdStockApplyRate:{ type:"number" }
                                ,stdrdStockCalcYn:{ type:"string" }
                                ,stdrdStockQty:{ type:"number" }
                                ,movingAvgPrc:{ type:"number" }
                                ,movingAvgTaxDdctPrc:{ type:"number" }
                                ,purcPrc:{ type:"number" }
                                ,retlPrc:{ type:"number" }
                                ,whslPrc:{ type:"number" }
                                ,incPrc:{ type:"number" }
                                ,grtePrc:{ type:"number" }
                                ,taxDdctRetlPrc:{ type:"number" }
                                ,taxDdctWhslPrc:{ type:"number" }
                                ,taxDdctIncPrc:{ type:"number" }
                                ,taxDdctGrtePrc:{ type:"number" }
                                ,locCd:{ type:"string" }
                                ,locNm:{ type:"string" }
                                ,locCdMig:{ type:"string" }
                                ,bpCd:{ type:"string" }
                                ,bpNm:{ type:"string" }
                                ,paintYn:{ type:"string" }
                                ,mjrUseYn:{ type:"string" }
                        }
                    }
                }
                ,aggregate:
                    [
                        { field: "stockQty", aggregate: "sum" }
                        ,{ field: "avlbStockQty", aggregate: "sum" }
                        ,{ field: "stockAmt", aggregate: "sum" }
                        ,{ field: "realStockAmt", aggregate: "sum" }
                        ,{ field: "stockTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "realStockTaxDdctAmt", aggregate: "sum" }
                    ]
            }
            ,selectable :"row"
            ,appendEmptyColumn:true//empty column. default:false
            ,editable:false
            ,filterable:false
            ,sorterable:false
            ,autoBind:false
            ,sortable:false
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
            ,change:function(e) {

                var selectedVal = this.dataItem(this.select());

                $("#itemCd").val(selectedVal.itemCd);                                                //부품번호
                $("#locCd").val(selectedVal.locCd);                                                  //LocCd
                $("#purcLeadHm").val(selectedVal.purcLeadHm);                                        //화물도착주기
                $("#itemClass").val(selectedVal.abcInd);                                             //부품등급
                $("#strgeCd").data("kendoExtDropDownList").value(selectedVal.strgeCd);                  //창고
                $("#endYn").data("kendoExtDropDownList").value(selectedVal.endYn);                      //중지부품
                $("#expcGrStrgeCd").data("kendoExtDropDownList").value(selectedVal.grStrgeCd);          //예상입고창고
                $("#stdrdStockCalcYn").data("kendoExtDropDownList").value(selectedVal.stdrdStockCalcYn);//적정재고계산
                $("#nonMovingFlg").data("kendoExtDropDownList").value(selectedVal.nonMovingFlg);        //방치품
                $("#purcCqtyCalcYn").data("kendoExtDropDownList").value(selectedVal.purcCqtyCalcYn);    //구매수요량계산
                $("#mm3AvgDmndQty").data("kendoExtNumericTextBox").value(selectedVal.mm3AvgDmndQty);    //3개월평균수요량
                $("#mm6AvgDmndQty").data("kendoExtNumericTextBox").value(selectedVal.mm6AvgDmndQty);    //6개월평균수요량
                $("#mm12AvgDmndQty").data("kendoExtNumericTextBox").value(selectedVal.mm12AvgDmndQty);  //12개월평균수요량
                $("#minPackQty").data("kendoExtNumericTextBox").value(0);           //최소구매수량
                $("#minPurcQty").data("kendoExtNumericTextBox").value(selectedVal.minPurcQty);           //최소포장수량
                $("#sftyStockQty").data("kendoExtNumericTextBox").value(selectedVal.sftyStockQty);      //최소안전재고수량
                $("#sftyStockMaxQty").data("kendoExtNumericTextBox").value(selectedVal.maxSftyStockQty);//최대안전재고수량
                $("#stdrdStockParameter").data("kendoExtNumericTextBox").value(selectedVal.stdrdStockApplyRate);    //적정재고계수
                $("#lastGiDt").data("kendoExtMaskedDatePicker").value(selectedVal.lastGiDt);         //최근출고일
                $("#lastGrDt").data("kendoExtMaskedDatePicker").value(selectedVal.lastGrDt);         //최근입고일
                $("#stdrdStockQty").data("kendoExtNumericTextBox").value(selectedVal.stdrdStockQty);    //적정재고
                $("#stockQty").data("kendoExtNumericTextBox").value(selectedVal.stockQty);         //실재고
                $("#dgrItemYn").data("kendoExtDropDownList").value(selectedVal.stdrdStockCalcYn);       //위험품여부
                $("#resvStockQty").data("kendoExtNumericTextBox").value(selectedVal.resvStockQty);     //예류재고
                $("#paintYn").data("kendoExtDropDownList").value(selectedVal.stdrdStockCalcYn);         //페인트여부
                $("#avlbStockQty").data("kendoExtNumericTextBox").value(selectedVal.avlbStockQty);     //가용재고
                $("#mjrUseYn").data("kendoExtDropDownList").value(selectedVal.stdrdStockCalcYn);        //적정재고계산

                $.ajax({
                    url:"<c:url value='/par/stm/stockInOut/selectStockInStrgeNmListAndLocNmListOutByItemCd.do' />"
                    ,data:JSON.stringify({sItemCd : selectedVal.itemCd})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                    }
                    ,success:function(jqXHR, textStatus){
                        $("#locNmList").val(jqXHR.locNmList);
                        $("#strgeNmList").val(jqXHR.strgeNmList);
                    }
                });

            }
            ,columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.line' />" ,attributes:{"class":"ac"},width:40}//No
                ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.stockStrgeCd' />" ,attributes:{"class":"al"} ,width:100
                    ,template  :'#= changeStrgeCd(strgeCd)#'
                }//창고
                ,{field:"locCd" ,title:"<spring:message code='par.lbl.locationCd' />",width:140}//위치코드
                ,{field:"locCdMig" ,title:"<spring:message code='par.lbl.locationCd' />2",width:140}//위치Mig
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.sBpNm' />" ,width:140 }//bpNm
                ,{field :"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,attributes:{"class":"al"} ,width:120}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,attributes:{"class":"al"} ,width:160}//부품명
                ,{field:"stockUnitCd" ,title:"<spring:message code='par.lbl.unit' />" ,attributes:{"class":"ac"} ,width:50}//단위
                ,{field:"stockLockYn" ,title:"<spring:message code='par.lbl.stockLockYn' />" ,attributes:{"class":"ac"} ,width:100
                    ,template  :'#= changeComboYn(stockLockYn)#'}//제어여부
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
                }//장면재고
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
                }//현재고
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}//예류수량
                ,{field:"grScheQty" ,title:"<spring:message code='par.lbl.grSche' />" ,attributes:{"class":"ar"} ,format:"{0:n2}",width:80, hidden:true}//예정입고
                ,{field:"giScheQty" ,title:"<spring:message code='par.lbl.giSche' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80, hidden:true}//예정출고
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.transferQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}//대출(차출)수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.loanQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}//차입수량
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.bpTpNm' />" ,attributes:{"class":"ac"},width:100
                    ,template :'#= changeSpyrCd(bpTp)#'
                }//공급상
                ,{field:"itemDstinCd" ,title:"<spring:message code='par.lbl.itemDstinCd' />" ,width:80
                    ,template :'#= changeItemDstinCd(itemDstinCd)#'
                }//품목구분
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd' />" ,attributes:{"class":"ac"} ,width:80}//ABC Class
                ,{field:"nonMovingFlg" ,title:"<spring:message code='par.lbl.nonMovingFlg' />" ,template:'#= changeComboYn(nonMovingFlg)#' ,attributes:{"class":"ac"} ,width:80}//방치부품
                ,{field:"stayDay", title:"<spring:message code='par.lbl.stockStayDay' />", width:80 , attributes:{"class":"ar"}
                    ,template:'#= stayDay # <spring:message code="par.lbl.leaveItemStayDay" />'
                }//재고시간길이
                ,{field:"carlineCd" ,title:"<spring:message code='global.lbl.carLine' />" ,attributes:{"class":"ac"} ,width:80}//차종
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,format:"{0:n2}" ,attributes:{"class":"ar"} ,width:80}//재고단가
                ,{field:"movingAvgTaxDdctPrc" ,title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)" ,format:"{0:n2}" ,attributes:{"class":"ar"} ,width:80}//재고단가
                ,{field:"stockAmt" ,title:"<spring:message code='par.lbl.stockMovingPrice' />" ,format:"{0:n2}" ,width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//재고금액
                ,{field:"realStockAmt" ,title:"<spring:message code='par.lbl.stockPrice' />" ,format:"{0:n2}" ,width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                    //2018-10-23 weiyongjie 库存查询界面显示 “库存金额字段" start
                    ,hidden:false
                   //2018-10-23 weiyongjie 库存查询界面显示 “库存金额字段" end
                }//실재고금액
                ,{field:"stockTaxDdctAmt" ,title:"<spring:message code='par.lbl.stockMovingPrice' />(<spring:message code='par.lbl.taxSprt' />)" ,format:"{0:n2}" ,width:100
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//재고금액
                ,{field:"realStockTaxDdctAmt" ,title:"<spring:message code='par.lbl.stockPrice' />(<spring:message code='par.lbl.taxSprt' />)" ,format:"{0:n2}" ,width:100
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                    ,hidden:true
                }//실재고금액
                ,{field:"purcPrc", title:"<spring:message code='par.lbl.grRecentPrice' />", attributes:{"class":"ar"}, format:"{0:n2}", width:70}//최신입고가
                ,{field:"retlPrc" ,title:"<spring:message code='par.lbl.salePriceCost01' />(<spring:message code='par.lbl.taxInclude' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}//판매가
                ,{field:"taxDdctRetlPrc" ,title:"<spring:message code='par.lbl.salePriceCost01' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}
                ,{field:"whslPrc" ,title:"<spring:message code='par.lbl.salePriceCost02' />(<spring:message code='par.lbl.taxInclude' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}//도매가
                ,{field:"taxDdctWhslPrc" ,title:"<spring:message code='par.lbl.salePriceCost02' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}
                ,{field:"incPrc" ,title:"<spring:message code='par.lbl.salePriceCost03' />(<spring:message code='par.lbl.taxInclude' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}//보험가
                ,{field:"taxDdctIncPrc" ,title:"<spring:message code='par.lbl.salePriceCost03' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}
                ,{field:"grtePrc" ,title:"<spring:message code='par.lbl.salePriceCost04' />(<spring:message code='par.lbl.taxInclude' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}//보증가
                ,{field:"taxDdctGrtePrc" ,title:"<spring:message code='par.lbl.salePriceCost04' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:100}
                ,{field:"paintYn" ,title:"<spring:message code='par.lbl.paintYn' />" ,attributes:{"class":"ac"} ,width:100
                    ,template  :'#= changeComboYn(paintYn)#'
                }//도색여부
            ]
        });


        // 공급상유형
        changeSpyrCd = function(val){
            var returnVal = "";
            if(val != null && val != "undefined"){
                returnVal = bpTpObj[val];
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

        // 품목구분 그리드 콤보
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(itemDstinCdObj[val])){
                  returnVal = itemDstinCdObj[val];
                }
            }
            return returnVal;
        };

        // 품목그룹 그리드 콤보
        changeItemGrp = function(dstinVal, grpVal){
            var returnVal = "";
            if(!dms.string.isEmpty(dstinVal) && !dms.string.isEmpty(grpVal)){
                returnVal = itemGroupGridObj[dstinVal][grpVal];
            }
            return returnVal;
        };

        //  ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        //  YN정보
        changeComboYn = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = useYnObj[val];
            }
            return returnVal;
        };

        // 재고 통제 여부 체크박스
        chkStockLockYn = function(val){

            var returnVal = "";
            if(val === 'Y'){
                returnVal = "<input type='checkbox' name='stockLockYn' disabled=true checked />";
            }else{
                returnVal = "<input type='checkbox' name='stockLockYn' disabled=true/>";
            }

            return returnVal;
        };
        // 날짜 검증
        function fnChkDateValue(e){

            var elmt = e.sender.element[0],
            id = elmt.id,
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

            //최근입고일
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
            //최근출고일
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

        initPage();

        });

        //초기화 버튼
        function initPage(){
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            //그리드 reset
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }

        //부품그룹 팝업 열기 함수.
        function selectPartsMasterGroupPopupWindow(){

            searchItemMasterGroupPopupWindow = dms.window.popup({
                windowId:"searchItemMasterGroupPopupWindow"
                ,title:"<spring:message code='par.title.partItemGrp' />"//부품그룹조회
                ,width:900
                ,height:605
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemMasterGroupPopup.do'/>"
                    ,data:{
                        "type":""
                        ,"autoBind":true
                        ,"callbackFunc":function(data){
                            //부품유형코드(검색)
                            var itemGrpList = "";
                            $.each(data, function(idx, item){
                                switch(item.lvlVal){
                                    case 1:
                                        $("#sItemGrpCd1").val(item.itemGrpCd);//부품유형코드1
                                    break;
                                    case 2:
                                        $("#sItemGrpCd2").val(item.itemGrpCd);//부품유형코드2
                                    break;
                                    case 3:
                                        $("#sItemGrpCd3").val(item.itemGrpCd);//부품유형코드3
                                    break;
                                    case 4:
                                        $("#sItemGrpCd4").val(item.itemGrpCd);//부품유형코드4
                                    break;
                                }
                                itemGrpList += item.itemGrpNm+" / ";
                            });

                            $("#sItemGrpCd").val("");

                            if(data.length > 0){
                                $("#sItemGrpCd").val(itemGrpList);
                            }

                            searchItemMasterGroupPopupWindow.close();
                        }
                    }
                }
            });
        }

        //부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                ,title:"<spring:message code='par.title.partSearch' />"//부품 조회
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    ,data:{
                        "type":""
                        ,"itemCd":$("#sItemCd").val()
                        ,"autoBind":false
                        ,"callbackFunc":function(data){
                            $("#sItemCd").val(data[0].itemCd);
                            $("#sItemNm").val(data[0].itemNm);

                            searchItemPopupWindow.close();
                        }
                    }
                }
            });
        }

        // 품목구분 그리드 콤보
        function setSumData(val){
            var returnData  = Math.round(val * 1000)/1000,
                returnCalData = Math.round(returnData * 100)/100,
                returnVal = kendo.toString(returnData,'n2');

            return returnVal;
        };

        </script>
    <!-- /script -->

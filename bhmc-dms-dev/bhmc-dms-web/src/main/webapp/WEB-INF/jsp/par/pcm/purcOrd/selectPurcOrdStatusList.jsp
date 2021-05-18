<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 구매현황조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
             <%-- <h1 class="title_basic"><spring:message code="par.title.purcStsList" /></h1> --%>
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11564" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_m_min" id="btnSwitchInfo">转库信息<!-- lixinfei: 转库信息 按钮 --></button>
<%--    <spring:message code="par.btn.switchInfo" />--%>
            <dms:access viewId="VIEW-D-11563" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
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
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="sPurcOrdNo" class="form_input form_readonly" readonly />
                                <a id="searchPurcOrdNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sendDt" /><!-- 전송일자 --></th>
                        <td>
                            <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                            <!-- <a id="searchCustCd"> --><!-- 검색 --></a>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sConfirmFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sConfirmTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- BMP오더번호 --></th>
                        <td>
                            <input id="sBmpOrdNo" class="form_input" />
                            <input id="sPurcRegDtFr" class="form_datepicker hidden" data-type="maskDate"/>
                            <input id="sPurcRegDtTo" class="form_datepicker hidden" data-type="maskDate"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더등록인 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sRegUsrId" class="form_input hidden">
                                <a id="searchRegUserId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.pdcCd" />(<spring:message code='par.lbl.strgeNm' />)<!-- lixinfei: 仓库 筛选字段 --></th>
                        <td>
                            <input id="sDlDistCd" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_form form_width_100per mt10" id="summaryForm">
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
                        <th scope="row"><spring:message code="par.lbl.confirmCnt" /><!-- 확정건수 --></th>
                        <td>
                            <input id="confirmParCnt" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.confirmQty" /><!-- 확정수량 --></th>
                        <td>
                            <input id="confirmParQty" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordAmt" /><!-- 오더금액 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="totTaxDdctAmt" data-type="number" class="form_numeric"/>
                                    <input id="purcParAmt" data-type="number" class="form_numeric hidden"/>
                                    <span class="txt_from">/</span>
                                </div>
                                <div class="date_right">
                                    <input id="totPurcAmt" data-type="number" class="form_numeric"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                        <td class="readonly_area">
                            <input id="purcRegDt" type="text" value="" class="form_datepicker" data-type="maskDate"  readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.backOrderCnt" /><!-- B/O건수 --></th>
                        <td>
                            <input id="boParCnt" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.backOrderQty" /><!-- B/O수량 --></th>
                        <td>
                            <input id="boParQty" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 오더상태 --></th>
                        <td>
                            <input id="purcOrdStatCd" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더신청자 --></th>
                        <td>
                            <input id="regUsrId" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="grid"  class="resizable_grid"></div>
        </div>

        <div style="height:120px;">
            <div class="table_list table_list_v1 mt5"  id="dataForm">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:8%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col"><spring:message code="par.lbl.subRate" /></th><!--合计  -->
                            <th scope="col"><spring:message code="global.lbl.order" /></th><!--订单  -->
                            <th scope="col"><spring:message code="par.lbl.orderCnfm" /></th><!--订单确认 par.lbl.orderCnfm -->
                            <th scope="col"><spring:message code="global.lbl.assign" /></th><!--分配  -->
                            <th scope="col"><spring:message code="par.lbl.backOrderQty" /></th><!--缺件数量 -->
                            <th scope="col"><spring:message code="par.lbl.bePicking" /></th><!--取货中 par.lbl.bePicking  -->
                            <th scope="col"><spring:message code="par.lbl.bePacking" /></th><!--包装中  par.lbl.bePacking -->
                            <th scope="col"><spring:message code="par.lbl.packed" /></th><!--已包装 par.lbl.packed  -->
                            <th scope="col"><spring:message code="par.lbl.invcEnd" /></th><!--송장완료  par.lbl.invcEnd -->
                            <th scope="col">B/O<spring:message code="par.lbl.sendQty" /></th><!--송장완료  par.lbl.invcEnd -->
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemCount" /></th><!--品种  -->
                            <td class="ar"><input id="bmpChkCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="calcConfirmCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrAlcCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="boCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrOpicCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrOpacCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrPakdCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrInvCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrDlrBoCnt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.qty" /></th><!--数量  -->
                            <td class="ar"><input id="bmpChkQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="calcConfirmQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrAlcQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="boQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrOpicQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrOpacQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrPakdQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrInvQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrDlrBoQty" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.amt" /></th><!--金额  -->
                            <td class="ar"><input id="bmpChkAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="calcConfirmAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrAlcAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="boAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrOpicAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrOpacAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrPakdAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrInvAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            <td class="ar"><input id="odrDlrBoAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>
<!-- script -->
<script>
var purcOrdTpList   = []
   ,purcOrdTpObj    = {}
   ,purcOrdStatList = []
   ,sessionBpCd     = "${bpCd}"
   ,sessionBpNm     = "${bpNm}"
   ,toDt            = "${toDt}"
   ,sevenDtBf       = "${sevenDtBf}"
   ,pPurcOrdNo      = "${pPurcOrdNo}"
   ,pBpCd           = "${pBpCd}"
   ,pBpNm           = "${pBpNm}"
   ,purcUnitList    = []
   ,purcUnitObj     = {}
   ,ammendCodeList  = []
   ,ammendCodeObj   = {}
   ,purcPgssCdObj   = {}
   ,grStrgeTpList   = []
   ,grStrgeTpObj    = {}
   ,trsfTpList      = []
   ,trsfTpObj       = {}
   ,delYnList       = []
   ,delYnObj        = {}
   ,dlPdcCdList     = []
   ,dlPdcCdObj      = {}
   ,searchItemPopupWindow
   ,userSearchPopupWin
   ,purcOrdListPopupWindow;

//사용여부 Array
<c:forEach var="obj" items="${delYnList}">
    delYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    delYnObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//PDC 창고
dlPdcCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
    dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//오더유형 선택
purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//편수코드 선택
ammendCodeList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
ammendCodeObj[""] = "";
<c:forEach var="obj" items="${ammendCodeList}" varStatus="status">
    ammendCodeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ammendCodeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//구매오더상태 선택
purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
<c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    if(Number("${obj.cmmCd}") > 1 && Number("${obj.cmmCd}") <= 3){
        if("${obj.useYn}" !=='N' ){
            purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    }
</c:forEach>

//구매오더진행상태 선택
purcPgssCdObj[' '] = "";
<c:forEach var="obj" items="${purcPgssCdList}" varStatus="status">
    purcPgssCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//구매단위
<c:forEach var="obj" items="${purcUnit}" varStatus="status">
    purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
    purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
</c:forEach>

//입고창고
grStrgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${trsfTpList}" varStatus="status">
    trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {

    //오더유형선택
    $("#sPurcOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdTpList
        ,index:0
    });

    //구매오더상태선택
    $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdStatList
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectPurcOrdStatCd = e.dataItem.cmmCd;

            if(dms.string.isEmpty(selectPurcOrdStatCd)){
                $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
            }

        }
    });

    //구매오더상태
    $("#purcOrdStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdStatList
        ,optionLabel:" "
    });

    //lixinfei：仓库 筛选字段下拉选
    $("#sDlDistCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dlPdcCdList
    });

    //오더일자(구매등록일)
    $("#purcRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //오더일자(구매등록일)
    $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //전송일자
    $("#sConfirmFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sConfirmTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#confirmParCnt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#confirmParQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#purcParAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#totTaxDdctAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#totPurcAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#boParCnt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#boParQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#bmpChkCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#bmpChkQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#bmpChkAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });


    $("#calcConfirmCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#calcConfirmQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#calcConfirmAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrAlcCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#odrAlcQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrAlcAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#boCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#boQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#boAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrOpicCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#odrOpicQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrOpicAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrOpacCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#odrOpacQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrOpacAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrPakdCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#odrPakdQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrPakdAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrInvCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#odrInvQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrInvAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrDlrBoCnt").kendoExtNumericTextBox({
        format:"n0"
       ,spinners:false
    });

    $("#odrDlrBoQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#odrDlrBoAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
    $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
    $("#searchRegUserId").on('click', userSearchPopup);
    $("#searchPurcOrdNo").on('click', selectPurcOrdListPopupWindow);

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            pPurcOrdNo = ''; //구매등록 관리 화면에서 넘어온 구매번호 삭제.
            pBpCd = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
            pBpNm = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
            initPage();
        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
            fnSearchSummary();
        }
    });

  //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){

            var beanName;
            var templateFile;
            var fileName;

            beanName = "purcOrdService";
            templateFile = "PurcOrdStatusList_Tpl.xlsx";
            fileName = "PurcOrdStatusList.xlsx";

            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                sPurcOrdStatCdLst.splice(0,1);
            }

            if(sPurcOrdStatCdLst.length === 0){
                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                }
            }



            dms.ajax.excelExport({
                "beanName":beanName
                ,"templateFile":templateFile
                ,"fileName":fileName
                ,"sBpCd":$("#sBpCd").val()
                ,"sPurcOrdNo":$("#sPurcOrdNo").val()
                ,"sPurcOrdTp":$("#sPurcOrdTp").data("kendoExtDropDownList").value()
                ,"sItemCd":$("#sItemCd").val()
                ,"sItemNm":$("#sItemNm").val()
                ,"sDlDistCd":$("#sDlDistCd").data("kendoExtDropDownList").value()
                ,"sRegUsrNm":$("#sRegUsrNm").val()
                ,"sPurcRegDtFr":$("#sPurcRegDtFr").val()
                ,"sPurcRegDtTo":$("#sPurcRegDtTo").val()
                ,"sConfirmFr":$("#sConfirmFr").val()
                ,"sConfirmTo":$("#sConfirmTo").val()
                ,"sArrvDtFr":''
                ,"sArrvDtTo":''
                ,"sPurcOrdStatLst":sPurcOrdStatCdLst
                ,"sListType":"D"
            });
        }
    });


    // 구매 헤더 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0728-111198"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                        if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                            sPurcOrdStatCdLst.splice(0,1);
                        }

                        if(sPurcOrdStatCdLst.length === 0){
                            for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                            }
                        }

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        // 구매오더 검색조건 코드.
                        params["sBpCd"]           = $("#sBpCd").val();
                        params["sPurcOrdNo"]      = $("#sPurcOrdNo").val();
                        params["sBmpOrdNo"]       = $("#sBmpOrdNo").val();
                        params["sItemCd"]         = $("#sItemCd").val();
                        params["sItemNm"]         = $("#sItemNm").val();
                        params["sRegUsrId"]       = $("#sRegUsrId").val();
                        params["sDlDistCd"]         = $("#sDlDistCd").data("kendoExtDropDownList").value();
                        params["sPurcOrdTp"]      = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                        params["sPurcRegDtFr"]    = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sPurcRegDtTo"]    = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmFr"]      = $("#sConfirmFr").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmTo"]      = $("#sConfirmTo").data("kendoExtMaskedDatePicker").value();
                        params["sPurcOrdStatLst"] = sPurcOrdStatCdLst;
                        params["sDelYn"]          = 'Y'; //삭제된 구매오더 제외.

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                data:function (result){
                    if(result.total === 0){
                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }

                    return result.data;
                }
                ,total:"total"
                ,model:{
                   id:"purcOrdNo"
                  ,fields:{
                        dlrCd          :{ type:"string", editable:false }
                      , bmpOrdNo       :{ type:"string", editable:false } //BMP오더번호
                      , purcOrdNo      :{ type:"string", editable:false } //오더번호
                      , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                      , itemCd         :{ type:"string", editable:false } //부번
                      , confirmParNo   :{ type:"string", editable:false } //부번
                      , itemNm         :{ type:"string", editable:false } //품명
                      , confirmParNm   :{ type:"string", editable:false } //품명
                      , purcRegDt      :{ type:"date",   editable:false } //오더일자(구매일자)
                      , invcDt         :{ type:"date",   editable:false } //발송일
                      , arrvDt         :{ type:"date",   editable:false } //도착예정일자
                      , purcOrdTp      :{ type:"string", editable:false } //오더유형
                      , bpCd           :{ type:"string", editable:false } //업체
                      , bpNm           :{ type:"string", editable:false } //업체
                      , purcItemStatCd :{ type:"string", editable:false } //상태
                      , purcPgssCd     :{ type:"string", editable:false } //진행상태
                      , purcUnitCd     :{ type:"string", editable:false } //단위
                      , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                      , confirmQty     :{ type:"number", editable:false } //오더수량(확정수량)
                      , bmpChkQty      :{ type:"number", editable:false } //확정수량
                      , boQty          :{ type:"number", editable:false } //B/O수량
                      , odrAlcQt       :{ type:"number", editable:false } //할당수량
                      , odrOpicQt      :{ type:"number", editable:false } //픽킹중수량
                      , odrOpacQt      :{ type:"number", editable:false } //팩킹중수량
                      , odrPakdQt      :{ type:"number", editable:false } //팩킹완료수량
                      , odrInvQt       :{ type:"number", editable:false } //인보이스수량
                      , grQty          :{ type:"number", editable:false } //기입고수량(입고수량)
                      , cancQty        :{ type:"number", editable:false } //취소수량
                      , grStrgeCd      :{ type:"string", editable:false } //창고
                      , purcPrc        :{ type:"number", editable:false } //단가
                      , purcAmt        :{ type:"number", editable:false } //금액
                      , regUsrId       :{ type:"string", editable:false } //등록인
                      , purcReqRegUsrId:{ type:"string", editable:false } //신청인(구매요청자)
                      , mobisInvcNo    :{ type:"string", editable:false } //모비스송장번호
                      , boxNo          :{ type:"string", editable:false } //BOX번호
                      , editCd         :{ type:"string", editable:false } //편수코드
                      , trsfTp         :{ type:"string", editable:false } //운송유형
                      , coPack         :{ type:"string", editable:false } //lixinfei: 新增字段CO-PACK
                      , trsfUsrId      :{ type:"string", editable:false } //운송인
                      , delYn          :{ type:"string", editable:false } //삭제여부(아모스)
                      , dlDistCd       :{ type:"string", editable:false } //삭제여부(아모스)
                      , cancReqQty     :{ type:"number", editable:false } //삭제여부(아모스)
                      , calcConfirmQty :{ type:"number", editable:false } //삭제여부(아모스)
                      , confirmDt      :{ type:"string", editable:false } //전송일자
                    }
                }
            }
        }
        , selectable:"row"
        , scrollable :true
        , autoBind   :false
        , pageable:{
            refresh:false
           ,pageSize:100
           ,buttonCount:3
           ,input:false
         }
        , filterable:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        , columns:[
            {//오더유형
                field      :"purcOrdTp"
                ,title     :"<spring:message code='par.lbl.purcOrdTp' />"
                ,template  :'#= changePurcOrdTp(purcOrdTp)#'
                ,attributes:{"class":"al"}
                ,width     :140
            }
            ,{//구매신청일자
                field      :"purcRegDt"
                ,title     :"<spring:message code='par.lbl.ordReqDt' />"
                ,attributes:{"class":"ac"}
                ,format    :"{0:<dms:configValue code='dateFormat' />}"
                ,width     :90
            }
            ,{//전송일자 (B/O와 동일) chgDate
                field      :"confirmDt"
                ,title     :"<spring:message code='par.lbl.sendDt' />"
                ,attributes:{"class":"ac"}
                ,width     :90
                ,template  :'#= chgDate(confirmDt)#'
            }
            ,{//구매오더번호
                field      :"purcOrdNo"
                ,title     :"<spring:message code='par.lbl.purcOrdNo' />"
                ,width     :100
            }
            ,{//bmp오더번호
                field      :"bmpOrdNo"
                ,title     :"<spring:message code='par.lbl.bmpOrdNo' />"
                ,width     :120
            }
            ,{//거래처 코드
                field      :"bpCd"
                ,title     :"<spring:message code='par.lbl.spyrCd' />"
                ,width     :105
                ,hidden    :true
            }
            ,{//공급업체
                field       :"bpNm"
                ,title      :"<spring:message code='par.lbl.spyrCd' />"
                ,width      :140
            }
            ,{
                 field:"itemNm"
                ,title:"<spring:message code='par.lbl.itemNm'/>"//부품명
                ,width:140
            }
            ,{
                _field:"itemCdHd"
                ,title:"<spring:message code='par.lbl.itemCd'/>"//부품번호
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:[
                    {field:"itemCd", title:"<spring:message code='par.lbl.request'/>", width:100 }//요청
                    ,{field:"confirmParNo", title:"<spring:message code='par.lbl.confirm'/>", width:100 }//확정
                ]
            }
            ,{
                _field:"purcQtyHd"
                ,title:"<spring:message code='par.lbl.purcQty'/>"//구매수량
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:[
                    {field:"purcQty"
                        ,title      :"<spring:message code='par.lbl.request' />"
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                    }
                    ,{field:"confirmQty"
                        ,title      :"<spring:message code='par.lbl.confirm' />"
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                    }
                ]
            }
            ,{title:"<spring:message code='par.lbl.purcPriceAddTax' />",field:"purcPrc" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}",decimals:2}
            ,{//PDC 창고
                field      :"dlDistCd"
                ,title     :"<spring:message code='par.lbl.pdcCd' />(<spring:message code='par.lbl.strgeNm' />)"
                ,width     :140
                ,template  :'#= changeDlPdcCd(dlDistCd)#'
            }
            ,{//CONFIRM 수량
                field      :"calcConfirmQty"
                ,title     :"<spring:message code='par.lbl.currentQty' />"
                ,format     :"{0:n0}"
                ,decimal    :0
                ,width      :80
            }
            ,{//취소수량
                field      :"cancReqQty"
                ,title     :"<spring:message code='par.lbl.cancQty' />"
                ,format     :"{0:n0}"
                ,decimal    :0
                ,width      :80
            }
            ,{//편수코드
                field      :"editCd"
                ,title     :"<spring:message code='par.lbl.amendCode' />"
                ,width     :140
                ,template  :'#= changeEditCd(editCd)#'
            }
            ,{//BO수량
                field       :"boQty"
                ,title      :"<spring:message code='par.lbl.boQty' />"
                ,attributes :{"class":"ar"}
                ,format     :"{0:n0}"
                ,decimal    :0
                ,width      :80
            }
            ,{
                _field:"ordPrcsStatHd"
                ,title:"<spring:message code='par.lbl.purcProcStat'/>"//오더처리상태
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:[
                    {
                        field:"odrAlcQt"
                        ,title      :"<spring:message code='par.lbl.alloc' />"  //할당수량
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                    }
                    ,{
                        field:"odrOpicQt"
                        ,title      :"<spring:message code='par.lbl.picking' />"  //피킹중수량
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                     }
                    ,{
                        field:"odrOpacQt"
                        ,title      :"<spring:message code='par.lbl.packing' />"  //포장중수량
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                     }
                    ,{
                        field:"odrPakdQt"
                        ,title      :"<spring:message code='par.lbl.packEnd' />"  //포장완료수량
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                     }
                    ,{
                        field:"odrInvQt"
                        ,title      :"<spring:message code='par.lbl.invcQty' />"  //인보이스수량
                        ,attributes :{"class":"ar"}
                        ,format     :"{0:n0}"
                        ,decimal    :0
                        ,width      :80
                     }
                ]
            }
            ,{//송장번호
                field      :"mobisInvcNo"
                ,title     :"<spring:message code='par.lbl.invcDocNo' />"
                ,width     :140
            }
            ,{//BOX번호
                field      :"boxNo"
                ,title     :"<spring:message code='par.lbl.boxNo' />"
                ,width     :100
            }
            ,{//운송유형
                title      :"<spring:message code='par.lbl.trsfType' />"
                ,field     :"trsfTp"
                ,width     :140
                ,template  :'#= changeTrsfTp(trsfTp)#'
            }
            ,{//lixinfei: CO-PACK字段
                title      :"<spring:message code='par.lbl.coPack' />"
                ,attributes:{"class":"ac"}
                ,field     :"coPack"
                ,width     :88
            }
            ,{//운송인
                title      :"<spring:message code='par.lbl.trsfPrsn' />"
                ,field     :"trsfUsrId"
                ,width     :100
            }
            ,{//발송일자
                field      :"invcDt"
                ,title     :"<spring:message code='par.lbl.sendOrdDt' />"
                ,attributes:{"class":"ar"}
                ,format    :"{0:<dms:configValue code='dateFormat' />}"
                ,width     :90
            }
            ,{//도착예정일자
                field      :"arrvDt"
                ,title     :"<spring:message code='par.lbl.arrvExpcDt' />"
                ,attributes:{"class":"ar"}
                ,format    :"{0:<dms:configValue code='dateFormat' />}"
                ,width     :90
            }
            ,{//구매오더라인번호
                field      :"purcOrdLineNo"
                ,title     :"<spring:message code='par.lbl.lineNm' />"
                ,width     :60
            }
            ,{//상태
                field       :"purcItemStatCd"
                ,title      :"<spring:message code='par.lbl.purcItemStatCd' />"
                ,attributes :{"class":"ar"}
                ,width      :70
                ,hidden     :true
            }
            ,{//상태
                field       :"purcPgssCd"
                ,title      :"<spring:message code='par.lbl.purcItemStatCd' />"
                ,attributes :{"class":"ar"}
                ,template   :'#if(changePurcPgssCd(purcPgssCd) !== undefined){# #= changePurcPgssCd(purcPgssCd)# #}#'
                ,width      :70
            }
            ,{//BMP 삭제여부
                title      :"<spring:message code='par.lbl.bmpDelYn' />"
                ,field     :"delYn"
                ,width     :140
                ,template  :'#= changeDelYn(delYn)#'
                ,hidden     :true
            }
        ]
    });

    initPage();
});

//오더유형
changePurcOrdTp = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(purcOrdTpObj[val])){
            returnVal = purcOrdTpObj[val];
        }
    }
    return returnVal;
};

//PDC 창고
changeDlPdcCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(dlPdcCdObj[val])){
            returnVal = dlPdcCdObj[val];
        }
    }
    return returnVal;
};

//편수코드
changeEditCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(ammendCodeObj[val])){
            returnVal = ammendCodeObj[val];
        }
    }
    return returnVal;
};
// 구매상태
changePurcPgssCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(purcPgssCdObj[val])){
            returnVal = purcPgssCdObj[val];
        }
    }
    return returnVal;
};

// 운송유형
changeTrsfTp = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(trsfTpObj[val])){
            returnVal = trsfTpObj[val];
        }
    }
    return returnVal;
};

// 사용여부
changeDelYn = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(delYnObj[val])){
            returnVal = delYnObj[val];
        }
    }
    return returnVal;
};


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
        if(id === 'sPurcRegDtFr'){
            var minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sPurcRegDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
            //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
        if(id === 'sConfirmFr'){
            var minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            //$("#sConfirmFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            //$("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sConfirmTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            //$("#sConfirmTo").data("kendoExtMaskedDatePicker").value(toDt);
            //$("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }else{
        if(id === 'sPurcRegDtFr'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sPurcRegDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
        if(id === 'sConfirmFr'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sConfirmTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }
}

// 구매 정보 조회.
function selectPurcOrd(pPurcOrdNo){

    $.ajax({
        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />",
        data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }

    }).done(function(result) {
      //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#summaryForm")[0])) {
            return false;
        }

        partsJs.validate.groupObjAllDataSet(result);

        $("#grid").data("kendoExtGrid").dataSource.read();

        fnSearchSummary();

    });
}

//부품 팝업 열기 함수.
function selectPartsMasterPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"ItemMasterPopup"
        , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
        ,width : 840
        ,height: 400
        , content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            , data:{
                "type":""
                , "autoBind":false
                 , "callbackFunc":function(data){
                    $("#sItemCd").val(data[0].itemCd);
                    $("#sItemNm").val(data[0].itemNm);

                    searchItemPopupWindow.close();
                }
           }
        }
    });
}

var venderSearchPopupWin;
function selectVenderMasterPopupWindow(){

    venderSearchPopupWin = dms.window.popup({
        windowId:"venderSearchPopupWin"
        ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
        ,width : 840
        ,height: 400
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":''
                ,"bpNm":''
                ,"callbackFunc":function(data){
                    $("#sBpCd").val(data[0].bpCd);
                    //$("#sBpNm").val(data[0].bpNm);

                    venderSearchPopupWin.close();
                }
            }
        }
    });
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
                        $("#sRegUsrId").val(data[0].usrId);
                        $("#sRegUsrNm").val(data[0].usrNm);
                    }
                }
            }
        }

    });
}

// 구매리스트 팝업 열기 함수.
function selectPurcOrdListPopupWindow(){

    if(dms.string.isEmpty($("#sBpCd").val())){
        // 딜러를 선택하십시오
        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
        saveList = [];
        return false;
    }

    purcOrdListPopupWindow = dms.window.popup({
        windowId:"purcOrdListPopup"
        ,title:"<spring:message code='par.title.purcOrdInfo' />"   // 구매오더정보
        ,width : 840
        ,height: 400
        ,content:{
            url:"<c:url value='/par/cmm/selectPurcOrdListPopup.do'/>"
            ,data:{
                  "type":"custom1"
                , "autoBind":false
                , "bpCd":$("#sBpCd").val()
                //, "bpNm":$("#sBpNm").val()
                , "excStatCd":'01'
                , "selectable":"single"
                , "callbackFunc":function(data){
                    if(data.length === 1)
                    {
                        $("#sPurcOrdNo").val(data[0].purcOrdNo);
                        selectPurcOrd(data[0].purcOrdNo);
                    }
                    purcOrdListPopupWindow.close();
                }
            }
        }
    });
}

//날짜 변환 함수 (String -> Date) : confirmDt가 DB에서 varchar로 되어있음.
function chgDate(obj){
    if(!dms.string.isEmpty(obj)){
        if(obj != null && obj != ""){
            var year = obj.substring(0,4);
            var month = obj.substring(4,6);
            var day = obj.substring(6,8);
            var date = year+"-"+month+"-"+day;
            return date;
        }else{
            return null;
        }
    } else {
        return " ";
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

    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#summaryForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#dataForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    $("#grid").data("kendoExtGrid").dataSource.data([]);

    $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
    //$("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
    //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
    //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#purcOrdStatCd").data("kendoExtDropDownList").enable(false);
    $("#confirmParCnt").data("kendoExtNumericTextBox").enable(false);
    $("#confirmParQty").data("kendoExtNumericTextBox").enable(false);
    $("#purcParAmt").data("kendoExtNumericTextBox").enable(false);
    $("#totTaxDdctAmt").data("kendoExtNumericTextBox").enable(false);
    $("#totPurcAmt").data("kendoExtNumericTextBox").enable(false);
    $("#boParCnt").data("kendoExtNumericTextBox").enable(false);
    $("#boParQty").data("kendoExtNumericTextBox").enable(false);
    $("#confirmParCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#confirmParQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#purcParAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#totTaxDdctAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#totPurcAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boParCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boParQty").closest(".k-numerictextbox").addClass("form_readonly");

    $("#bmpChkCnt").data("kendoExtNumericTextBox").enable(false);
    $("#bmpChkCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#bmpChkQty").data("kendoExtNumericTextBox").enable(false);
    $("#bmpChkQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#bmpChkAmt").data("kendoExtNumericTextBox").enable(false);
    $("#bmpChkAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#calcConfirmCnt").data("kendoExtNumericTextBox").enable(false);
    $("#calcConfirmCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#calcConfirmQty").data("kendoExtNumericTextBox").enable(false);
    $("#calcConfirmQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#calcConfirmAmt").data("kendoExtNumericTextBox").enable(false);
    $("#calcConfirmAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrAlcCnt").data("kendoExtNumericTextBox").enable(false);
    $("#odrAlcCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrAlcQty").data("kendoExtNumericTextBox").enable(false);
    $("#odrAlcQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrAlcAmt").data("kendoExtNumericTextBox").enable(false);
    $("#odrAlcAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boCnt").data("kendoExtNumericTextBox").enable(false);
    $("#boCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boQty").data("kendoExtNumericTextBox").enable(false);
    $("#boQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boAmt").data("kendoExtNumericTextBox").enable(false);
    $("#boAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrOpicCnt").data("kendoExtNumericTextBox").enable(false);
    $("#odrOpicCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrOpicQty").data("kendoExtNumericTextBox").enable(false);
    $("#odrOpicQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrOpicAmt").data("kendoExtNumericTextBox").enable(false);
    $("#odrOpicAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrOpacCnt").data("kendoExtNumericTextBox").enable(false);
    $("#odrOpacCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrOpacQty").data("kendoExtNumericTextBox").enable(false);
    $("#odrOpacQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrOpacAmt").data("kendoExtNumericTextBox").enable(false);
    $("#odrOpacAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrPakdCnt").data("kendoExtNumericTextBox").enable(false);
    $("#odrPakdCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrPakdQty").data("kendoExtNumericTextBox").enable(false);
    $("#odrPakdQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrPakdAmt").data("kendoExtNumericTextBox").enable(false);
    $("#odrPakdAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrInvCnt").data("kendoExtNumericTextBox").enable(false);
    $("#odrInvCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrInvQty").data("kendoExtNumericTextBox").enable(false);
    $("#odrInvQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrInvAmt").data("kendoExtNumericTextBox").enable(false);
    $("#odrInvAmt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrDlrBoCnt").data("kendoExtNumericTextBox").enable(false);
    $("#odrDlrBoCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrDlrBoQty").data("kendoExtNumericTextBox").enable(false);
    $("#odrDlrBoQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#odrDlrBoAmt").data("kendoExtNumericTextBox").enable(false);
    $("#odrDlrBoAmt").closest(".k-numerictextbox").addClass("form_readonly");

    //구매오더 관리에서 넘어온 경우
    if(!dms.string.isEmpty(pPurcOrdNo)){
        $("#sPurcOrdNo").val(pPurcOrdNo);
        $("#sBpCd").val(pBpCd);
        //$("#sBpNm").val(pBpNm);
        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
        selectPurcOrd(pPurcOrdNo);
    }
}

function fnSearchSummary(){
    var params = {},
        sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

    if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

        sPurcOrdStatCdLst.splice(0,1);
    }

    if(sPurcOrdStatCdLst.length === 0){
        for(var i = 0; i < purcOrdStatList.length; i = i + 1){
            sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
        }
    }

    // 구매오더 검색조건 코드.
    params["sBpCd"]           = $("#sBpCd").val();
    params["sPurcOrdNo"]      = $("#sPurcOrdNo").val();
    params["sBmpOrdNo"]       = $("#sBmpOrdNo").val();
    params["sItemCd"]         = $("#sItemCd").val();
    params["sItemNm"]         = $("#sItemNm").val();
    params["sRegUsrId"]       = $("#sRegUsrId").val();
    params["sDlDistCd"]       = $("#sDlDistCd").data("kendoExtDropDownList").value();
    params["sPurcOrdTp"]      = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
    params["sPurcRegDtFr"]    = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
    params["sPurcRegDtTo"]    = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
    params["sConfirmFr"]      = $("#sConfirmFr").data("kendoExtMaskedDatePicker").value();
    params["sConfirmTo"]      = $("#sConfirmTo").data("kendoExtMaskedDatePicker").value();
    params["sPurcOrdStatLst"] = sPurcOrdStatCdLst;
    params["sDelYn"]          = 'Y'; //삭제된 구매오더 제외.

    $.ajax({
        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusSummary.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            if (result.data.length === 1) {
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#dataForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result.data[0]);
            }
        }
    });

}


</script>
<!-- //script -->


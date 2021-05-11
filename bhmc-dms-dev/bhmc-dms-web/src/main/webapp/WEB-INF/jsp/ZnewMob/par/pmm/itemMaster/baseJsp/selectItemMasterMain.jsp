<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">
    <!-- content_list -->
    <c:import url="/WEB-INF/jsp/ZnewMob/par/pmm/itemMaster/listJsp/selectItemMasterList.jsp" />
    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.itemInfoMgmtSearchCondition" /><!-- 부품정보관리 조회조건  --></h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sBpTp" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                        <td>
                            <div class="f_text"><input id="sBrandCd" type="text" class="form_combo"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sItemCd" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sItemNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemBpNm" /><!-- 업체명칭 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sBpNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <div class="f_text"><input id="sCarlineCd" type="text" class="form_combo"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Ind --></th>
                        <td>
                            <div class="f_text"><input id="sAbcInd" type="text" class="form_combo"/></div>
                            <input id="sCarlineCd2" type="text" class="form_combo hidden"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                        <td>
                            <div class="f_text"><input id="sItemDstinCd" type="text" class="form_combo"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <dms:access viewId="VIEW-D-12678" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /><!-- 초기화 --></span></div>
            </dms:access>
            <dms:access viewId="VIEW-D-12677" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="par.title.genInfo" /><!-- 부품 정보 --></h2>
                </div>
                <div class="co_view" style="">
                    <div class="formarea">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="itemCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="itemNm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.itemNmEng" /><!-- 영문명 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="itemEnNm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="carlineCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.newRplcItemCd" /><!-- 신규대체부품번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="newRplcItemCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.lastCmptItemCd" /><!-- 최종호환부품(대체부번) --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="lastCmptItemCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.stockUnitCd" /><!-- 재고단위 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="stockUnitCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!--  업체유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="spyrCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.bpCd" /><!--  업체코드 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="bpCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- 업체명 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="bpNm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="brandCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="itemDstinCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="abcInd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.endYn" /><!-- 사용중지 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="endYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.renewDt" /><!-- 갱신일자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="renewDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.startDt" /><!-- 유효시작일 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="startDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.endDt" /><!-- 유효종료일 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="endDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.title.stockInfo" /><!-- 재고 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.purcLeadHm" /><!-- 도착주기 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="purcLeadHm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.strge" /><!-- 부품창고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="grStrgeCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.locCd" /><!-- 위치코드 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="locCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.nonMovingFlg" /><!-- 방치품(Non-Moving 여부) --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="nonMovingFlg" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.dangYn" /><!-- 위험품 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="dgrItemYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.paintYn" /><!-- 도색여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="paintYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.minPurcQty" /><!-- 최소주문수량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="minPurcQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.sftyStockQty" /><!-- 최소안전재고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="sftyStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.sftyStockMaxQty" /><!-- 최대안전재고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="maxSftyStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.strgeStockQty" /><!-- 재고수량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="strgeStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.resvQty" /><!-- 예류수량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="resvQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.avlbStockQty" /><!-- 가용수량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="avlbStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.mm3AvgDmndQty" /><!-- 3개월평균수요량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="mm3AvgDmndQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.mm6AvgDmndQty" /><!-- 6개월평균수요량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="mm6AvgDmndQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.mm12AvgDmndQty" /><!-- 12개월평균수요량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="mm12AvgDmndQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.carlineStockQty" /><!-- 대당수량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="carlineStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.minPackQty" /><!-- 최소포장수량 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="minPackQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.mjrUseYn" /><!-- 주사용여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="mjrUseYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <!-- <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.avlbOutQty" />차출수량</th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="avlbOutQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr> -->
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.purcSgstQty" /><!-- 구매소요량산출 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="purcCqtyCalcYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.lastGrDt" /><!-- 최종입고일 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="lastGrDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.lastGiDt" /><!-- 최종출고일 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="lastGiDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.stdrdStockQty" /><!-- 적정재고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="stdrdStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.stdrdStockApplyRate" /><!-- 적정재고적용률 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="stdrdStockApplyRate" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <!-- <tr>
                                    <th scope="row" class="bu_required"><spring:message code="par.lbl.avlbInQty" />차입수량</th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="avlbInQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr> -->
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.mjrErrYn" /><!-- 주고장여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="mjrErrYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 부품유형  -->
            <c:import url="/WEB-INF/jsp/ZnewMob/par/pmm/itemMaster/listJsp/selectItemMasterSubItemDstinInfoList.jsp" />
            <!-- 부품가격  -->
            <c:import url="/WEB-INF/jsp/ZnewMob/par/pmm/itemMaster/listJsp/selectItemMasterSubItemPriceList.jsp" />
            <!-- 통용부번  -->
            <c:import url="/WEB-INF/jsp/ZnewMob/par/pmm/itemMaster/listJsp/selectItemMasterSubComItemList.jsp" />
            <!-- 사진 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.title.pictureInfo" /><!-- 사진 --></h2>
                    <!-- <input type="hidden" id="fileDocNo" name="fileDocNo" class="form_file" /> -->
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <!-- Upload 된 사진영역 -->
                    <input type="hidden" id="fileDocNo" name="fileDocNo" class="form_file" />
                    <div class="carImgView"><span><img src="" id="fileDocUrl"/></span></div>
                    <!-- //Upload 된 사진영역 -->
                </div>
            </div>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>
</section>


<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>


<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var spyrCdList             = [],
    spyrCdMap              = [],
    itemDstinCdList        = [],
    itemDstinCdObj         = {},
    itemGroupObj           = {},
    stockUnitList          = [],
    stockUnitObj           = {},
    storageList            = [],
    giLocCdObj             = [],
    carlineCdList          = [],
    carlineCdObj           = {},
    modelCdList            = [],
    modelCdObj             = {},
    modelCdMap             = [],
    abcIndList             = [],
    abcIndMap              = {},
    abcIndObj              = {},
    comCarlineCdList       = [],
    brandCdList            = [],
    brandCdObj             = {},
    sucList                = [],
    parSpecCdList          = [],
    mobisImpLocalYnTpList  = [],
    useYnList              = [],
    useYnObj               = {},
    popItemObj             = {},
    itemDstin1stCdList = [],
    itemDstin2ndCdList = [],
    itemDstin3rdCdList = [],
    bpTpList = [],
    bpTpObj             = {},
    selectCarlinePopupWindow,
    venderSearchPopupWin,
    searchItemPopupWindow,
    toDate,
    gCrud;
var giLocCdObj = [];

toDate = new Date();

<c:forEach var="obj" items="${storageList}" varStatus="status">
    storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
</c:forEach>

//location
<c:forEach var="obj" items="${giLocCdList}">
if(giLocCdObj.hasOwnProperty("${obj.strgeCd}")){
    giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
}else{
    giLocCdObj["${obj.strgeCd}"] = [];
    giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
}
</c:forEach>

<c:forEach var="obj" items="${spyrCdList}" varStatus="status">
    spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//carline2 Map
$.each(spyrCdList, function(idx, obj){
    spyrCdMap[obj.cmmCd] = obj.cmmCdNm;
});

<c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
    itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${itemGroupList}">
    if(itemGroupObj.hasOwnProperty("${obj.itemDstinCd}")){
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
    }else{
        itemGroupObj["${obj.itemDstinCd}"] = [];
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
    }
</c:forEach>

<c:forEach var="obj" items="${stockUnitList}" varStatus="status">
    stockUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
    stockUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
</c:forEach>

<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    comCarlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

console.log("carlineCdObj : ", carlineCdObj);

<c:forEach var="obj" items="${modelCdList}">
if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}else{
    modelCdObj["${obj.carlineCd}"] = [];
    modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
}
//carline2 List
modelCdList.push({
    "cmmCd":"${obj.modelCd}"
    ,"cmmCdNm":"${obj.modelNm}"
});
</c:forEach>
//carline2 Map
$.each(modelCdList, function(idx, obj){
    modelCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//abcIndList
<c:forEach var="obj" items="${abcIndList}" varStatus="status">
    abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm": "${obj.cmmCdNm}", "useYn": "${obj.useYn}"});
    abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//abcIndMap
$.each(function(inx, obj){
    abcIndMap[obj.cmmCd] = obj.cmmCdNm;
});

//brandCdList
<c:forEach var="obj" items="${brandCdList}" varStatus="status">
    brandCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${sucList}" varStatus="status">
    sucList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${parSpecCdList}" varStatus="status">
    parSpecCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${mobisImpLocalYnTpList}" varStatus="status">
    mobisImpLocalYnTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//itemDstin1stCdList code list
<c:forEach var="obj" items="${itemDstin1stCdList}" varStatus="status">
    itemDstin1stCdList.push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}", pentItemDstinCd:"${obj.pentItemDstinCd}"});
</c:forEach>
var itemDstin1stCdMap = [];
$.each(itemDstin1stCdList, function(idx, obj){
    itemDstin1stCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//itemDstin2ndCdList code list
<c:forEach var="obj" items="${itemDstin2ndCdList}" varStatus="status">
    itemDstin2ndCdList.push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}", pentItemDstinCd:"${obj.pentItemDstinCd}"});
</c:forEach>
var itemDstin2ndCdMap = [];
$.each(itemDstin2ndCdList, function(idx, obj){
    itemDstin2ndCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//itemDstin3rdCdList code list
<c:forEach var="obj" items="${itemDstin3rdCdList}" varStatus="status">
    itemDstin3rdCdList.push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}", pentItemDstinCd:"${obj.pentItemDstinCd}"});
</c:forEach>
var itemDstin3rdCdMap = [];
$.each(itemDstin3rdCdList, function(idx, obj){
    itemDstin3rdCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//useYnList
<c:forEach var="obj" items="${useYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>



<c:forEach var="obj" items="${bpTpList}" varStatus="status">
if("01" === "${obj.remark2}"){
    bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
}
</c:forEach>

//useYnObj
$.each(useYnList, function(idx, obj){
    useYnObj[obj.cmmCd] = obj.cmmCdNm;
});

//basePriceCalTpList
var basePriceCalTpList = [];
<c:forEach var="obj" items="${basePriceCalTpList}">
basePriceCalTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var basePriceCalTpMap = {};
$.each(basePriceCalTpList, function(idx, obj){
    basePriceCalTpMap[obj.cmmCd] = obj.cmmCdNm;
});

//접기항목 조회여부 fl
var btnItemDstinCdDisp = true;
var btnItemPrcDisp = true;
var btnComItemCdDisp = true;

$(document).ready(function() {

    //조회조건 - 품목구분선택
    $("#sItemDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(itemDstinCdList)
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,index:1
    });

  //조회조건 - 거래처유형선택
    $("#sBpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel: "<spring:message code='global.lbl.check' />"
        ,dataSource:bpTpList
        ,index:0
    });

    //품목구분선택
    $("#itemDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(itemDstinCdList)
        ,index:0
    });

    //조회조건 - 로컬여부선택
    $("#sSpyrCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(spyrCdList)
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,index:0
    });

    //품목그룹선택
    $("#itemGrpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:[]
        ,index:0
    });

    //재고단위선택
    $("#stockUnitCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:stockUnitList
        ,index:0
    });

    //출고창고선택
    $("#giStrgeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:storageList
        ,index:0
    });
    //차종(검색))
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        ,index:0
    });
    //Class
    $("#sAbcInd").kendoExtDropDownList({
        dataTextField:"cmmCd"
        ,dataValueField:"cmmCdNm"
        ,dataSource:abcIndList
        ,optionLabel:"<spring:message code='global.lbl.check' />"  //선택
        ,index:0
    });

    //(차형:검색)
    $("#sCarlineCd2").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
            ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        ,dataSource:[]
        ,index:0
    });
    //차형
    $("#carlineCd2").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:[]
        ,index:0
    });
    //국산/수입
    $("#impTestTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //브랜드:검색
    $("#sBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(brandCdList)
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        ,index:0
    });
    //브랜드
    $("#brandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(brandCdList)
        ,optionLabel:" "
        ,index:0
    });
    //SUC
    $("#sucCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(sucList)
        ,index:0
    });
    //Character Code
    $("#parSpecCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(parSpecCdList)
        ,index:0
    });
    //Source
    $("#mobisImpLocalYnTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(mobisImpLocalYnTpList)
        ,index:0
    });
    //생산중지
    $("#prndYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //사용중지
    $("#endYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //위험품
    $("#dgrItemYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });


    //도색여부
    $("#paintYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });

    //구부번호환성
    $("#oldRplcParCmptYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //신부번호환성
    $("#newRplcParCmptYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //방치품
    $("#nonMovingFlg").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //적정재고산출
    $("#stdrdStockCalcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //구매소요량산출
    $("#purcCqtyCalcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //주사용여부
    $("#mjrUseYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });
    //주고장여부
    $("#mjrErrYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(useYnList)
        ,index:0
    });

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").value('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").value(new Date(chkDateValue.resultMsg));
        }

    }


    // 타이틀
    $("#header_title").html("<spring:message code='par.title.itemList' />");<!-- 부품정보관리 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");


  //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sBpTp").data("kendoExtDropDownList").value("");
            $("#sBrandCd").data("kendoExtDropDownList").value("");
            $("#sItemCd").val("");
            $("#sItemNm").val("");
            $("#sBpNm").val("");
            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            $("#sAbcInd").data("kendoExtDropDownList").value("");
            $("#sCarlineCd2").data("kendoExtDropDownList").value("");
            $("#sItemDstinCd").data("kendoExtDropDownList").value("02");
        }
    });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initList();
            contentList();
        }
    });

    // 부품분류 표시
    $("#btnItemDstinCd").click(function(){
        if(btnItemDstinCdDisp){
            $("#subListItemDstinInfo").attr("src", "<c:url value='/mob/par/pmm/itemMaster/selectItemMasterSubItemDstinInfoList.do' />");
        }
        btnItemDstinCdDisp = false;
    });

    // 부품가격 표시
    $("#btnItemPrc").click(function(){
        if(btnItemPrcDisp){
            $("#subListItemPrice").attr("src", "<c:url value='/mob/par/pmm/itemMaster/selectItemMasterSubItemPriceList.do' />");
        }
        btnItemPrcDisp = false;
    });

    // 공용부번 표시
    $("#btnComItemCd").click(function(){
        if(btnComItemCdDisp){
            $("#subListComItem").attr("src", "<c:url value='/mob/par/pmm/itemMaster/selectItemMasterSubComItemList.do' />");
        }
        btnComItemCdDisp = false;
    });


});


//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  $("#header_title span").attr("class","search_open");
  listData.read();
}

</script>
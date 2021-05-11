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
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title"><spring:message code="par.title.itemInfoMgmtList" /><!-- 부품정보관리 목록--></h2>
        </div>
        <div class="skeyarea" style="display:none;">
            <div>
                <table class="slist01">
                    <colgroup>
                        <col style="width:35%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr id="search1Area">
                            <th scope="row"><span><spring:message code="par.lbl.bpTp" /><!-- 업체유형 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12686" hasPermission="${dms:getPermissionMask('READ')}">
                                <span name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search2Area">
                            <th scope="row"><span><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12685" hasPermission="${dms:getPermissionMask('READ')}">
                                <span name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search3Area">
                            <th scope="row"><span><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12684" hasPermission="${dms:getPermissionMask('READ')}">
                                <span name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search4Area">
                            <th scope="row"><span><spring:message code="par.lbl.brand" /><!-- 브랜드 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12683" hasPermission="${dms:getPermissionMask('READ')}">
                                <span  name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search5Area">
                            <th scope="row"><span><spring:message code="par.lbl.regDt" /><!-- 생성일자 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12682" hasPermission="${dms:getPermissionMask('READ')}">
                                <span  name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search6Area">
                            <th scope="row"><span><spring:message code="par.lbl.carLine" /><!-- 차종 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12681" hasPermission="${dms:getPermissionMask('READ')}">
                                <span name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search7Area">
                            <th scope="row"><span><spring:message code="par.lbl.model" /><!-- 차형 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12680" hasPermission="${dms:getPermissionMask('READ')}">
                                <span  name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                        <tr id="search8Area">
                            <th scope="row"><span><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></span></th>
                            <td>
                                <dms:access viewId="VIEW-D-12679" hasPermission="${dms:getPermissionMask('READ')}">
                                <span name="searchStr"></span> <span class="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제 --></span>
                                </dms:access>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:30%"><spring:message code="par.lbl.itemCd" /><!-- 품목코드 --></span>
                <span style="width:40%"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></span>
                <span style="width:30%"><spring:message code="par.lbl.abcInd" /><!-- CLASS --></span>
                <span style="width:30%"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></span>
                <span style="width:40%"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></span>
                <span style="width:30%"><spring:message code="par.lbl.carLine" /><!-- 차종 --></span>
                <span class="clboth" style="width:100%"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></span>
                <span class="clboth" style="width:100%"><spring:message code="par.lbl.itemBpNm" /><!-- 업체명칭 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>


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
                    <%-- <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='par.lbl.regDt' /></span></th><!-- 생성일자 -->
                         <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sRegDt" value="" readOnly />
                                <span class="date" onclick="calpicker('sRegDt')"><spring:message code='global.lbl.date' /></span>
                            </div>
                        </td>
                    </tr> --%>
                    <%--
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.model" /><!-- 차형 --></th>
                        <td>
                            <div class="f_text"><input id="sCarlineCd2" type="text" class="form_combo hidden"/></div>
                        </td>
                    </tr>
                     --%>
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

                                <%-- <tr>
                                    <th scope="row"><spring:message code="par.lbl.model" /><!-- 차형 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="carlineCd2" type="text" disabled="disabled" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.oldRplcItemCd" /><!-- 구형대체부품번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="oldRplcItemCd" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.oldRplcParCmptYn" /><!-- 구형부품호환여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="oldRplcParCmptYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.newRplcParCmptYn" /><!-- 신규부품호환여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="newRplcParCmptYn" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>


                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.impTextTp" /><!-- 국산/수입 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="impTestTp" type="text" disabled="disabled" data-type="combo"/></div>
                                    </td>
                                </tr>




                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.giStrgeStock" /><!-- 발송창고재고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="giStrgeStock" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>



                                <tr>
                                    <th scope="row"><spring:message code="par.lbl.totStockQty" /><!-- 총재고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="totStockQty" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr> --%>
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
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.title.itemDstinCd" /><!-- 부품유형--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close" id="btnItemDstinCd"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listhead dlistitem">
                        <span style="width:50%"><spring:message code='par.lbl.partItemGrpNm' /><!-- 유형명칭  --></span>
                        <span style="width:50%"><spring:message code='par.lbl.itemDstin1st' /><!-- 1단계부품분류 --></span>
                        <span style="width:50%" class="clboth"><spring:message code='par.lbl.itemDstin2nd' /><!-- 2단계부품분류--></span>
                        <span style="width:50%"><spring:message code='par.lbl.itemDstin3rd' /><!-- 3단계부품분류 --></span>
                    </div>
                    <iframe id="subListItemDstinInfo" name="subListItemDstinInfo" border="1" frameborder="0" width="100%" height=""></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_dt_1"><span></span></div>
                </div>
            </div>
            <!-- 부품가격  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.title.itemPrc" /><!-- 부품가격--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close" id="btnItemPrc"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <%--<div class="deleteitem listhead">--%>
                    <div class="listhead dlistitem">
                        <span style="width:30%"><spring:message code='par.lbl.movingAvgPrc' /></span>
                        <span style="width:30%"><spring:message code='par.lbl.lastGrPrice' /></span>
                        <span style="width:40%"><spring:message code='par.lbl.bestSalePriceCost' /></span>

                        <span style="width:30%" class="clboth"><spring:message code='par.lbl.basePrice' /></span>
                        <span style="width:30%"><spring:message code='par.lbl.salePriceCost01' /></span>
                        <span style="width:40%"><spring:message code='par.lbl.salePriceCost02' /></span>

                        <span style="width:30%" class="clboth"><spring:message code='par.lbl.salePriceCost03' /></span>
                        <span style="width:40%"><spring:message code='par.lbl.salePriceCost04' /></span>
                    </div>
                    <iframe id="subListItemPrice" name="subListItemPrice" border="1" frameborder="0" width="100%" height=""></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_dt_2"><span></span></div>
                </div>
            </div>
            <!-- 통용부번  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.title.comItemCd" /><!--통용부번--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close" id="btnComItemCd"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listhead dlistitem">
                        <span style="width:50%"><spring:message code='par.lbl.comItemCd' /></span>
                        <span style="width:50%"><spring:message code='par.lbl.comItemNm' /></span>
                        <span style="width:50%" class="clboth"><spring:message code='par.lbl.avlbStockQty' /></span>
                        <span style="width:50%"><spring:message code='par.lbl.carLine' /></span>
                        <span style="width:50%" class="clboth"><spring:message code='par.lbl.itemDstinCd' /></span>
                    </div>
                    <iframe id="subListComItem" name="subListComItem" border="1" frameborder="0" width="100%" height="200"></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_dt_3"><span></span></div>
                </div>
            </div>
            <!-- 사진 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.title.pictureInfo" /><!-- 사진 --></h2>
                    <input type="hidden" id="fileDocNo" name="fileDocNo" class="form_file" />
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
<div id="docu_top" style="display:none">TOP</div>


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

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sSpyrCd").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sItemCd").val("");
            break;
        case "search3Area" :
            $("#sItemNm").val("");
            break;
        case "search4Area" :
            $("#sBrandCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sRegDt").val("");
            break;
        case "search6Area" :
            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            break;
        case "search7Area" :
            $("#sCarlineCd2").val("");
            break;
        case "search8Area" :
            $("#sItemDstinCd").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sSpyrCd = $("#sSpyrCd").data("kendoExtDropDownList").value();
    var sItemCd = $("#sItemCd").val();
    var sItemNm = $("#sItemNm").val();
    var sBrandCd = $("#sBrandCd").data("kendoExtDropDownList").value();
    var sRegDt = $("#sRegDt").val();
    var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList").value();
    var sCarlineCd2 = $("#sCarlineCd2").data("kendoExtDropDownList").value();
    var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList").value();
    if(sItemCd == "" && sItemCd == "" && sItemNm == "" && sBrandCd == "" &&
            sRegDt == "" && sCarlineCd == "" && sCarlineCd2 == "" && sItemDstinCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();

        if(sSpyrCd == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sItemCd == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sItemNm == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sBrandCd == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sRegDt == "") $("#search5Area").hide();
        else $("#search5Area").show();
        if(sCarlineCd == "") $("#search6Area").hide();
        else $("#search6Area").show();
        if(sCarlineCd2 == "") $("#search7Area").hide();
        else $("#search7Area").show();
        if(sItemDstinCd == "") $("#search8Area").hide();
        else $("#search8Area").show();
    }
    setMainListHeight();
}

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
        ,index:0
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

    /*
    //로컬여부선택
    $("#spyrCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(spyrCdList)
        ,index:0
    });
    */

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


    /*
    //입고창고선택
    $("#grStrgeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:storageList
        ,index:0
    });

    //grStrgeCd onchange event
    $("#grStrgeCd").on("change", function (){
        $.ajax({
            url:"<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterItems.do' />"
              , type:"POST"
              , data:JSON.stringify({ sItemCd:$("#itemCd").val(), sStrgeCd:$(this).data("kendoExtDropDownList").value() })
              , dataType:"json"
              , contentType:'application/json'
              , async:false
              , success:function(result) {
                  if(result.data !== null){
                    $("#locCd").val(result.data[0].locCd);
                  }else{
                    $("#locCd").val("");
                  }
              }
              , error:function(jqXHR,status,error) {
                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
              }
          });
    });
    */

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
    /*
    //차종
    $("#carlineCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,index:0
    });
    */

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


    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        $("#sItemDstinCd").data("kendoExtDropDownList").value('02');
        gCrud = 'C';
        $(".skeyarea").hide();
    }

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

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='par.title.itemList' />");<!-- 부품정보관리 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/pmm/itemMaster/selectItemMasterList.do' />");

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
            /*
            var sSpyrCd = $("#sSpyrCd").data("kendoExtDropDownList");
            var sItemCd = $("#sItemCd");
            var sItemNm = $("#sItemNm");
            var sBrandCd = $("#sBrandCd").data("kendoExtDropDownList");
            var sRegDt = $("#sRegDt");
            var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList");
            var sCarlineCd2 = $("#sCarlineCd2").data("kendoExtDropDownList");
            var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList");
            if(sSpyrCd.value() != "") $("#search1Area span[name='searchStr']").text(sSpyrCd.text());
            if(sItemCd.val() != "") $("#search2Area span[name='searchStr']").text(sItemCd.val());
            if(sItemNm.val() != "") $("#search3Area span[name='searchStr']").text(sItemNm.val());
            if(sBrandCd.value() != "") $("#search4Area span[name='searchStr']").text(sBrandCd.text());
            if(sRegDt.val() != "") $("#search5Area span[name='searchStr']").html(sRegDt.val());
            if(sCarlineCd.value() != "") $("#search6Area span[name='searchStr']").text(sCarlineCd.text());
            if(sCarlineCd2.value() != "") $("#search7Area span[name='searchStr']").text(sCarlineCd2.text());
            if(sItemDstinCd.value() != "") $("#search8Area span[name='searchStr']").text(sItemDstinCd.text());
            setSearchBox();
            */
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

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

});




//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  $("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
}

//상세페이지 보기
function contentDetail(key) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    $("#header_title span").removeAttr("class");

    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",
            data:JSON.stringify({ sItemCd:key}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
             }
        }).done(function(result) {
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            console.log("result:::",result);
            partsJs.validate.groupObjAllDataSet(result);

            $("#grStrgeCd").val(result.strgeCdList);
            $("#mm3AvgDmndQty").val(kendo.toString(result.mm3AvgDmndQty, 'n2'));
            $("#mm6AvgDmndQty").val(kendo.toString(result.mm6AvgDmndQty, 'n2'));
            $("#mm12AvgDmndQty").val(kendo.toString(result.mm12AvgDmndQty, 'n2'));
            $("#spyrCd").val(bpTpObj[result.bpTp]);
            $("#carlineCd").val(carlineCdObj[result.carlineCd]);


            $("#startDt").val(chgDate2Str(result.startDt));
            $("#endDt").val(chgDate2Str(result.endDt));
            $("#lastGrDt").val(chgDate2Str(result.lastGrDt));
            $("#lastGiDt").val(chgDate2Str(result.lastGiDt));
            $("#renewDt").val(chgDate2Str(result.renewDt));


            (result.endYn == "Y") ? $("#endYn").attr("checked",true):$("#endYn").attr("checked",false);
            (result.oldRplcParCmptYn == "Y") ? $("#oldRplcParCmptYn").attr("checked",true):$("#oldRplcParCmptYn").attr("checked",false);
            (result.newRplcParCmptYn == "Y") ? $("#newRplcParCmptYn").attr("checked",true):$("#newRplcParCmptYn").attr("checked",false);
            (result.stdrdStockCalcYn == "Y") ? $("#stdrdStockCalcYn").attr("checked",true):$("#stdrdStockCalcYn").attr("checked",false);
            (result.purcCqtyCalcYn == "Y") ? $("#purcCqtyCalcYn").attr("checked",true):$("#purcCqtyCalcYn").attr("checked",false);
            (result.nonMovingFlg == "Y") ? $("#nonMovingFlg").attr("checked",true):$("#nonMovingFlg").attr("checked",false);

            $(".content_title > .title_btn > span.co_open").each(function(){
                $(this).parent().parent().next(".co_view").hide();
                $(this).addClass('co_close');
            });

            // 표시여부 초기화
            btnItemDstinCdDisp = true;
            btnItemPrcDisp = true;
            btnComItemCdDisp = true;

            $("#fileDocNo").val(result.fileDocNo);

            if( (result.fileDocNo != null) && (result.fileDocNo != "") ){
                $("#fileDocUrl").attr("src", "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + $("#fileDocNo").val() + "&fileNo=" + 1);
            }else{
                $("#fileDocUrl").parent().hide();
                $("#fileDocUrl").parent().parent().html("<div class='list_nodata2' style='padding-right:0;'><p>"+"<spring:message code="mob.info.noSearchDataMsg" />"+"</p></div>");
            }

            var comboE=$("#content_detail").find("[data-type='combo']");
            for(var i=0; i<comboE.length; i++){
                $(comboE[i]).siblings("span").children().css("background-color","#f0f0f0");
            }
        });
    }
}

</script>
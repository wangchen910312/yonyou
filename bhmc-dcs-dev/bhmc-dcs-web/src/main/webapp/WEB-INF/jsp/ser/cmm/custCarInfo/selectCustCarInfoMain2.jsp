<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--
차량소유자
VehicleMasterService.saveVehicleMasterOwner (VehicleMasterSaveVO.updateOwnerList)
vin마스터의 차량운전자 저장.
VehicleMasterService.insertVehicleMasterDriverService(VehicleMasterVO insertVO)

 -->

<div class="header_area tablet_hide">
    <div class="btn_left">
        <button type="button" id="init" class="btn_m"><spring:message code="global.btn.init" /><!-- 초기화 --></button>
    </div>
    <div class="btn_right">
        <button type="button" id="custInfoReg" class="btn_m"><spring:message code="ser.btn.custInfoUpdt" /><!-- 고객정보변경 --></button>
        <button type="button" id="custInfoInsert" class="btn_m" style="display:none;"><spring:message code="global.btn.save" /><!-- 저장 --></button>
        <button type="button" id="custInfoRegCancel" class="btn_m" style="display:none;"><spring:message code="ser.btn.cancel" /><!-- 취소 --></button>
        <button type="button" id="custInfo" class="btn_m"><spring:message code="ser.btn.custView" /><!-- 고객view --></button>
    </div>
</div>
<div id="carTotalInfo" class="clfix tablet_hide">
    <!-- 차량정보 -->
    <section class="left_areaStyle">
        <%-- <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="ser.title.carInfo" /></h2>
            <div class="btn_right">
                <button type="button" id="moreInfo" class="btn_s btn_add"><spring:message code="ser.btn.moreInfoClose" /></button>
            </div>
        </div> --%>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:22%;">
                    <col style="width:28%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><a href="javascript:carInfo();"><spring:message code="ser.lbl.vinNo" /></a></span><!-- 차량VIN --></th>
                        <td class="required_area readonly_area" colspan="3">
                            <div class="form_search">
                                <input type="text" id="vinNo" name="vinNo" class="form_input" data-json-obj="true" data-name="<spring:message code="ser.lbl.vinNo" />" required readonly/>
                                <a href="javascript:custPopupWindow('${preFixId}');"></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td class="readonly_area">
                            <div class="form_search">
                                <input type="text" id="carRegNo" name="carRegNo" class="form_input" data-json-obj="true" readonly/>
                                <a href="javascript:custPopupWindow('${preFixId}');"></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.nowRunDist" /><!-- 현주행거리 --></th>
                        <td>
                            <input type="text" id="runDistVal" name="runDistVal" class="form_numeric ar" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.engnNo" /><!-- 엔진번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="enginNo" name="enginNo" class="form_input" data-json-obj="true" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /><!-- 누적주행거리 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carRunDistVal" name="carRunDistVal" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.brandNm" /><!-- 브랜드명 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carBrandNm" name="carBrandNm" class="form_input" readonly/>
                            <input type="hidden" id="carBrandCd" name="carBrandCd" class="form_input"/>
                        </td>
                         <th scope="row"><spring:message code="ser.lbl.wcEndDt" /><!-- 보증완료일 --></th>
                        <td class="readonly_area">
                            <input id="grteEndDt" name="grteEndDt" class="form_datepicker" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.model" /><!-- 모델 --></th>
                        <td class="readonly_area">
                            <input type="text" id="modelNm" name="modelNm" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.incCmpNm" /><!-- 보험회사명 --></th>
                        <td class="readonly_area">
                            <input type="text" id="incCorpCd" name="incCorpCd" class="form_input" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="carInfo" class="table_form form_width_100per mt10" style="display:none;">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:22%;">
                    <col style="width:28%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.color" /><!-- 색상 --></th>
                        <td class="readonly_area">
                            <input type="text" id="extColorNm" name="extColorNm" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.incNo" /><!-- 보험번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="incNo" name="incNo" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carChar" /><!-- 차량성질 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carChar" name="carChar" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.incEndDt" /><!-- 보험완료일 --></th>
                        <td class="readonly_area">
                            <input id="incEndDt" name="incEndDt" class="form_datepicker" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.saleOutDt" /><!-- 판매출고일자 --></th>
                        <td class="readonly_area">
                            <input id="pltGiDt" name="pltGiDt" class="form_datepicker" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.scheChkDt" /><!-- 정비예정일자 --></th>
                        <td class="readonly_area">
                            <input id="scheChkDt" name="scheChkDt" class="form_datepicker" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.salDlrComp" /><!-- 판매딜러사 --></th>
                        <td class="readonly_area">
                            <input type="text" id="ordDlrCd" name="ordDlrCd" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.scheChkDist" /><!-- 정비예정 주행거리 --></th>
                        <td class="readonly_area">
                            <input type="text" id="scheChkDist" name="scheChkDist" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.salPrsnNm" /><!-- 판매담당자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="salPrsnNm" name="salPrsnNm" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.chaDrivDis" /><!-- 교환시 주행거리 --></th>
                        <td class="readonly_area">
                            <input type="text" id="chaDrivDis" name="chaDrivDis" class="form_input" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>


    </section>
    <!-- //차량정보 -->

    <!-- 운전자정보 -->
    <section class="right_areaStyle">
        <%-- <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="ser.lbl.carOwnInfo" /><!-- 차량소유자정보 --></h2>
            <div class="btn_right readonly_area">
                <button type="button" id="moreInfo1" class="btn_s btn_add"><spring:message code="ser.btn.moreInfoClose" /></button>
            </div>
        </div> --%>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:22%;">
                    <col style="width:28%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><a href="javascript:custInfo();"><spring:message code="ser.lbl.carOwner" /></a></span><!-- 차량소유자 --></th>
                        <td class="required_area readonly_area" colspan="3">
                            <div class="form_search">
                                <input type="text" id="carOwnerNm" name="carOwnerNm" class="form_input" data-json-obj="true" data-name="<spring:message code="ser.lbl.carOwner" />" required readonly/>
                                <a href="#" onclick="javascript:custPopupWindow('${preFixId}');"></a>
                            </div>
                            <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" class="form_input numberic" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.email" /><!-- 이메일 --></th>
                        <td class="readonly_area">
                            <input type="mail" id="carOwnerMailNm" name="carOwnerMailNm" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.hpNo" /><!-- 휴대전화 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carOwnerHpNo" name="carOwnerHpNo" class="form_input numberic" readonly />
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.custTag" /><!-- 고객태그 --></th>
                        <td class="readonly_area">
                            <input type="text" id="custTag" name="custTag" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.bmMembNo" /><!-- BM회원번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="bmMembNo" name="bmMembNo" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.lbrDcRate" /><!-- 공임할인률 --></th>
                        <td class="readonly_area">
                            <input type="text" id="txtLbrDcRate" name="txtLbrDcRate" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.membNo" /><!-- 회원번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="membNo" name="membNo" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.parDcRate" /><!-- 부품할인률 --></th>
                        <td class="readonly_area">
                            <input type="text" id="txtParDcRate" name="txtParDcRate" class="form_input" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="ownerInfo" class="table_form form_width_100per mt10" style="display:none;">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:22%;">
                    <col style="width:28%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.addr" /><!-- 주소 --></th>
                        <td class="readonly_area" colspan="3">
                            <input type="text" id="carOwnerAddr" name="carOwnerAddr" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carIfNm" /><!-- 차량연계인 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carIfNm" name="carIfNm" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.zipCd" /><!-- 우편번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="carOwnerZipCd" name="carOwnerZipCd" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.orgCd" /><!-- 조직기구코드 --></th>
                        <td class="readonly_area">
                            <input type="text" id="orgCd" name="orgCd" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.custTp" /><!-- 고객유형 --></th>
                        <td class="readonly_area">
                            <input type="text" id="custTp" name="custTp" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.cotcStartDt" /><!-- 정비계약시작일자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="orgCd" name="orgCd" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.custLvl" /><!-- 고객레벨 --></th>
                        <td class="readonly_area">
                            <input type="text" id="custLvl" name="custLvl" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.cotcEndDt" /><!-- 계약완료일 --></th>
                        <td class="readonly_area">
                            <input id="cotcEndDt" name="cotcEndDt" class="form_datepicker" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.preBalAmt" /><!-- 예치금 --></th>
                        <td class="readonly_area">
                            <input type="text" id="preBalAmt" name="preBalAmt" class="form_input" readonly/>
                        </td>
                    </tr>
                    <tr style="display:none">
                        <th scope="row"><spring:message code="ser.lbl.preBalBalc" /><!-- 예치금 잔액 --></th>
                        <td class="readonly_area">
                            <input type="text" id="preBalBalc" name="preBalBalc" class="form_input" readonly/>
                        </td>
                          <th scope="row"><spring:message code="ser.lbl.email" /><!-- 이메일 --></th>
                        <td class="readonly_area">
                            <input type="email" id="driverMailNm" name="driverMailNm" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.samPoEndDt" /><!-- 삼포완료일 --></th>
                        <td class="readonly_area">
                            <input id="samPoEndDt" name="samPoEndDt" class="form_datepicker" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>


        <div id="visitInfo" class="table_form form_width_100per mt10" style="display:none;">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:22%;">
                    <col style="width:28%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="driverNm" name="driverNm" class="form_input" data-json-obj="true" readonly/>
                            <input type="hidden" id="driverId" name="driverId" data-json-obj="true" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.sex" /><!-- 성별 --></th>
                        <td class="readonly_area">
                            <input type="text" class="form_input" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화 --></th>
                        <td class="readonly_area">
                            <input type="text" id="driverTelNo" name="driverTelNo" class="form_input numberic" readonly />
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.certTp" /><!-- 증서유형 --></th>
                        <td class="readonly_area">
                            <input type="text" id="mathDocTp" name="mathDocTp" class="form_input" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.hpNo" /><!-- 휴대전화 --></th>
                        <td class="readonly_area">
                            <input type="text" id="driverHpNo" name="driverHpNo" class="form_input numberic" readonly />
                        </td>
                          <th scope="row"><spring:message code="ser.lbl.certNo" /><!-- 증서번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="ssnCrnNo" name="ssnCrnNo" class="form_input" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.mainContactMth" /><!-- 메인연락방식 --></th>
                        <td class="readonly_area">
                            <input type="text" id="prefContactMthCd" name="prefContactMthCd" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.mainContactTime" /><!-- 메인연락시간 --></th>
                        <td class="readonly_area">
                            <input type="text" id="prefContactTimeCd" name="prefContactTimeCd" class="form_input" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <input type="hidden" id="preFixId" name="preFixId" value="${preFixId}"/>
    <input type="hidden" id="pdiYn" name="pdiYn"  /> <!-- PDI 여부 -->
    <input type="hidden" id="carDstinCd" name="carDstinCd"  /> <!-- 차종구분 -->
    <input type="hidden" id="signOffDt" name="signOffDt" /> <!-- 생산일자 -->
    <input type="hidden" id="custSaleDt" name="custSaleDt" /> <!-- 판매일자 -->
    <input type="hidden" id="carId" name="carId">
    <input type="hidden" id="carOwnerSeq" name="carOwnerSeq">
    <input type="hidden" id="driverSeq" name="driverSeq">
    <input type="hidden" id="ltsModelCd" name="ltsModelCd">
    <!-- //운전자정보 -->
</div>

<!-- tablet show -->
<div class="tablet_show">
    <div class="table_form table_form_v2">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:14%;">
                <col style="width:11%;">
                <col style="width:14%;">
                <col style="width:11%;">
                <col style="width:14%;">
                <col style="width:11%;">
                <col style="width:14%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required">VIN번호</span></th>
                    <td class="readonly_area">
                        <div class="form_search">
                            <input type="text" class="form_input" required readonly>
                            <a href="javascript:;"></a>
                        </div>
                    </td>
                    <th scope="row">차량번호</th>
                    <td class="readonly_area">
                        <div class="form_search">
                            <input type="text" class="form_input" required readonly>
                            <a href="javascript:;"></a>
                        </div>
                    </td>
                    <th scope="row"><span class="bu_required">차량소유자</span></th>
                    <td class="readonly_area">
                        <input type="text" class="form_input" readonly>
                    </td>
                    <th scope="row">모바일전화</th>
                    <td class="readonly_area">
                        <input type="text" class="form_input" readonly>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- //tablet show -->

<!-- script -->
<script>
/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({
        cmmCdNm:"${obj.cmmCdNm}"
       ,cmmCd:"${obj.cmmCd}"
    });
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

/** 브랜드 코드 **/
var brandCdList = [];
<c:forEach var="obj" items="${brandCdDs}">
    brandCdList.push({
         cmmCdNm:"${obj.cmmCdNm}"
         , cmmCd:"${obj.cmmCd}"
    });
</c:forEach>

var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});

/** 증서유형 코드 **/
var mathDocTpList = [];
<c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({
        cmmCdNm:"${obj.cmmCdNm}"
        , cmmCd:"${obj.cmmCd}"
    });
</c:forEach>
var mathDocTpMap = dms.data.arrayToMap(mathDocTpList, function(obj){return obj.cmmCd});

/** 메인연락방식 코드 **/
var prefContactMthCdList = [];
<c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({
        cmmCdNm:"${obj.cmmCdNm}"
        , cmmCd:"${obj.cmmCd}"
    });
</c:forEach>
var prefContactMthCdMap = dms.data.arrayToMap(prefContactMthCdList, function(obj){return obj.cmmCd});

/** 메인연락시간 코드 **/
var prefContactTimeCdList = [];
<c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({
        cmmCdNm:"${obj.cmmCdNm}"
        , cmmCd:"${obj.cmmCd}"
    });
</c:forEach>
var prefContactTimeCdMap = dms.data.arrayToMap(prefContactTimeCdList, function(obj){return obj.cmmCd});

//RO검색 팝업
$("#roSearch").kendoButton({
    click:function(e) {
        repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:920
            , height:550
            , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "listType":"01"
                    /* , "callbackFunc":function(data){

                        $("#sSaNm").val(data.sSaNm);
                        $("#sRoDocNo").val(data.sRoDocNo);
                        $("#sRunDistVal").val(data.sRunDistVal);

                        $("#grid").data("kendoExtGrid").dataSource.read();

                    } */
                }
            }
        });
    }
});

var vehOfCustInfoSearchPopup;
var campaignInfoSearchPopup;
var vehOfReserveInfoSearchPopup;
var vehOfPartReserveInfoSearchPopup;


$(document).ready(function() {

    // 보증만료일자
    $("#grteEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 삼포만료일자
    $("#samPoEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 보험만료일자
    $("#incEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 정비예정일자
    $("#scheChkDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매출고일자
    $("#pltGiDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 계약완료일
    $("#cotcEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    $("#init").kendoButton({
        click:function(e) {
            initAll();
        }
    });


    carInfo = function(){
        if($("#carInfo").is(":hidden")){
            //$("#campaign").hide();
            $("#carInfo").show();
        }else{
            $("#carInfo").hide();
            //$("#campaign").show();
        }
    };

    custInfo = function(){
        if($("#ownerInfo").is(":hidden")){
            //$("#visitInfo").hide();
            $("#ownerInfo").show();
        }else{
            $("#ownerInfo").hide();
            //$("#visitInfo").show();
        }
    };

    // 휴대전화
    $("#carOwnerHpNo").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });
    $("#carOwnerHpNo").focusout(function(){
        $(this).val($.trim($(this).val()));
    });

    // 고객정보등록, 고객정보변경
    $("#custInfoReg").kendoButton({
        click:function(e) {
            $("#carTotalInfo td").removeClass("readonly_area");
            $("#carTotalInfo input").prop("readonly", false);
            $("#carTotalInfo input").attr("data-json-obj", "true");
            $("#custInfoReg").hide();
            $("#custInfoInsert").show();
            $("#custInfoRegCancel").show();
        }
    });

    // 고객정보등록
    $("#custInfoInsert").kendoButton({
        click:function(e) {
            saveCustInfo();
        }
    });

    saveCustInfo = function() {

        var custParam = $("#carTotalInfo").serializeObject($("#carTotalInfo").serializeArrayInSelector("[data-json-obj='true']"));

        custParam.grteEndDt = $("#grteEndDt").data("kendoExtMaskedDatePicker").value();
        custParam.samPoEndDt = $("#samPoEndDt").data("kendoExtMaskedDatePicker").value();
        custParam.incEndDt = $("#incEndDt").data("kendoExtMaskedDatePicker").value();
        custParam.scheChkDt = $("#scheChkDt").data("kendoExtMaskedDatePicker").value();
        custParam.pltGiDt = $("#pltGiDt").data("kendoExtMaskedDatePicker").value();
        custParam.cotcEndDt = $("#cotcEndDt").data("kendoExtMaskedDatePicker").value();
        custParam.signOffDt = kendo.parseDate($("#signOffDt").val());
        custParam.custSaleDt = kendo.parseDate($("#custSaleDt").val());

        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/multiVehOfCustInfo.do' />"
            ,data:JSON.stringify(custParam)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }

    // 고객정보등록 취소
    $("#custInfoRegCancel").kendoButton({
        click:function(e) {
            $("#carTotalInfo td").addClass("readonly_area");
            $("#carTotalInfo input").prop("readonly", true);
            $("#carTotalInfo input").attr("data-json-obj", "false");
            $("#vinNo").attr("data-json-obj", "true");
            $("#carRegNo").attr("data-json-obj", "true");
            $("#enginNo").attr("data-json-obj", "true");
            $("#carOwnerId").attr("data-json-obj", "true");
            $("#carOwnerNm").attr("data-json-obj", "true");
            $("#driverId").attr("data-json-obj", "true");
            $("#driverNm").attr("data-json-obj", "true");
            $("#custInfoReg").show();
            $("#custInfoInsert").hide();
            $("#custInfoRegCancel").hide();
            //initAll();
        }
    });

    // 고객view
    $("#custInfo").kendoButton({
        click:function(e) {
           dms.notification.info('<spring:message code="global.msg.eveloping" />');
        }
    });

    //브랜드 코드
    getBrandCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = brandCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //증서유형
    getMathDocTpMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = mathDocTpMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //메인연락방식 코드
    getPrefContactMthCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = prefContactMthCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //메인연락시간 코드
    getPrefContactTimeCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = prefContactTimeCdMap[val].cmmCdNm;
        }
        return returnVal;
    };


    //고객 팝업
    /* custPopupWindow = function(preFixId){

        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
            , title:"<spring:message code='ser.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){

                        if(data.length >= 1) {

                            if(preFixId == "PRE"){

                                vehOfReservePopupWindow(data[0], preFixId);

                            } else {
                                $.ajax({
                                    url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfReseveInfos.do' />"
                                   ,data:JSON.stringify({sVinNo:data[0].vinNo, sPreFixId:preFixId , sSerResvStartDt:new Date("${sysDate}")})
                                   ,type:'POST'
                                   ,dataType:'json'
                                   ,contentType:'application/json'
                                   ,error:function(jqXHR, status, error) {
                                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                   }
                                   ,success:function(result, textStatus){

                                       if(result.total <= 0){
                                           initAll();
                                           custInfoSet(data[0]);
                                           if(preFixId != undefined && preFixId == "RE"){
                                               reBtnControll("create", true);
                                           } else if(preFixId != undefined && preFixId == "RO"){
                                               roBtnControll("RE", true);
                                               detailSet(null, false);
                                           } else if(preFixId != undefined && (preFixId == "PC" || preFixId == "ET")){
                                               detailSet(null, false);
                                           }

                                       } else {
                                           vehOfReservePopupWindow(result, preFixId);
                                       }
                                   }
                               });
                            }
                        }
                    }
                }
            }
        });
    }; */

  //고객 팝업
    custPopupWindow = function(preFixId){

        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
            , title:"<spring:message code='ser.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "vinNo":$("#vinNo").val()
                    , "carRegNo":$("#carRegNo").val()
                    , "carOwnerNm":$("#carOwnerNm").val()
                    , "callbackFunc":function(data){

                        if(data.length >= 1) {
                            if(preFixId == "PRE"){ //부품예약
                                $.ajax({
                                    url:"<c:url value='/ser/rev/partReservation/selectPartReservations.do' />"
                                   ,data:JSON.stringify({sVinNo:data[0].vinNo})
                                   ,type:'POST'
                                   ,dataType:'json'
                                   ,contentType:'application/json'
                                   ,error:function(jqXHR, status, error) {
                                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                   }
                                   ,success:function(result, textStatus){
                                       if(result.total <= 0){
                                           setVehcleCustInfoSearch(data , preFixId);
                                       } else {
                                           vehOfReservePopupWindow(result.data[0], preFixId);
                                       }
                                   }
                               });
                            }else{
                                setVehcleCustInfoSearch(data , preFixId);
                            }
                        }
                    }//callback
                }
            }
        });
    };

    /** 상세 차량 정보/고객정보를 가져온다.**/
    setVehcleCustInfoSearch = function(data , preFixId){

        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
           ,data:JSON.stringify({sVinNo:data[0].vinNo})
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR, status, error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result, textStatus){


               // 견적 , 차량점검:조회만
               // RO:사전점검 당일건 존재시
               if(data.length == 1) {
                   if(preFixId != undefined && (preFixId == "RO" || preFixId == "RE")){ //RO:사전점검 당일건 존재시 , 예약:당일건 예약 정보 조회
                       setBizDataSearch(result.data[0] , preFixId);
                   }else{
                       if(preFixId != undefined && preFixId == "PRE") {
                           reBtnControll("R", true);
                       }
                       detailSet(result.data[0], false);
                   }
               }

           }
       });
    };

    // RO , 예약은 업무별 상세 데이터 조회
    // RO:vin별 당일 차량점검 존재여부 , 예약:vin별 당일  예약정보 확인
    setBizDataSearch = function(data , preFixId){

        $.ajax({
            //url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfReseveInfos.do' />"
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfPreCheckInfos.do' />"
           ,data:JSON.stringify({sVinNo:data.vinNo, sPreFixId:preFixId , sSerResvStartDt:new Date("${sysDate}")})
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR, status, error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result, textStatus){

               if(result.total <= 0){
                   initAll();
                   custInfoSet(data);
                   if(preFixId != undefined && preFixId == "RE"){
                       reBtnControll("create", true);
                   } else if(preFixId != undefined && preFixId == "RO"){
                       roBtnControll("RE", true);
                       detailSet(null, false);
                   }
               } else {
                   if(preFixId != undefined && preFixId == "RE"){ // 예약만 예약팝업 조회
                       vehOfReservePopupWindow(result.data[0], preFixId);
                   }else if(preFixId != undefined && preFixId == "RO"){
                       roBtnControll("RE", true);
                       detailSet(result.data[0], false);
                   }

               }
           }
       });
    };

    // 차량정보, 고객정보 셋팅
    custInfoSet = function(data){

        $("#carId").val(dms.string.strNvl(data.carId));
        $("#vinNo").val(dms.string.strNvl(data.vinNo));
        $("#carNo").val(dms.string.strNvl(data.carNo));
        $("#carRegNo").val(dms.string.strNvl(data.carRegNo));
        $("#enginNo").val(dms.string.strNvl(data.enginNo));
        $("#modelNm").val(dms.string.strNvl(data.modelNm));
        $("#ordDlrCd").val(dms.string.strNvl("${dlrCd}"));
        $("#extColorNm").val(dms.string.strNvl(data.extColorNm));
        $("#salPrsnNm").val(dms.string.strNvl(data.salPrsnNm));
        $("#carOwnerId").val(dms.string.strNvl(data.carOwnerId));
        $("#carBrandCd").val(dms.string.strNvl(data.carBrandCd));
        $("#carBrandNm").val(dms.string.strNvl(getBrandCdMap(data.carBrandCd)) );
        $("#carOwnerNm").val(dms.string.strNvl(data.carOwnerNm));
        $("#carOwnerHpNo").data("kendoMaskedTextBox").value(data.carOwnerHpNo);
        $("#carOwnerTelNo").val(dms.string.strNvl(data.carOwnerTelNo));
        $("#carOwnerZipCd").val(dms.string.strNvl(data.carOwnerZipCd));
        $("#carOwnerMailNm").val(dms.string.strNvl(data.carOwnerMailNm));
        $("#carOwnerAddr").val(dms.string.strNvl(data.carOwnerAddr));
        $("#grteEndDt").val(kendo.toString(kendo.parseDate(data.grteEndDt), "yyyy-MM-dd"));
        $("#driverId").val(dms.string.strNvl(data.driverId));
        $("#driverNm").val(dms.string.strNvl(data.driverNm));
        $("#driverHpNo").val(dms.string.strNvl(data.driverHpNo));
        $("#driverTelNo").val(dms.string.strNvl(data.driverTelNo));
        $("#driverMailNm").val(dms.string.strNvl(data.driverMailNm));
        $("#ssnCrnNo").val(dms.string.strNvl(data.ssnCrnNo));
        $("#mathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.mathDocTp)));
        $("#custTp").val(dms.string.strNvl(data.custTp));
        $("#prefContactMthCd").val(dms.string.strNvl(getPrefContactMthCdMap(data.prefContactMthCd) ));
        $("#prefContactTimeCd").val(dms.string.strNvl(getPrefContactTimeCdMap(data.prefContactTimeCd)));
        $("#carDstinCd").val(dms.string.strNvl(data.carDstinCd));
        $("#signOffDt").val(kendo.toString( kendo.parseDate(data.signOffDt), "yyyy-MM-dd" ));
        $("#custSaleDt").val(kendo.toString( kendo.parseDate(data.custSaleDt), "yyyy-MM-dd" ));
        $("#carOwnerSeq").val(dms.string.strNvl(data.carOwnerSeq));
        $("#driverSeq").val(dms.string.strNvl(data.driverSeq));
        $("#ltsModelCd").val(dms.string.strNvl(data.ltsModelCd));


    };

    getCustInfo = function(data){

        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
            ,data:JSON.stringify({sVinNo:data.vinNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                    custInfoSet(result.data[0]);
                }
            }
        });
    };

    /** 캠페인 정보 팝업 **/
    campaignPopupWindow = function(params){

        campaignInfoSearchPopup = dms.window.popup({
            windowId:"campaignInfoSearchPopup"
            , title:"<spring:message code='ser.title.campaignSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectCampaignPopup.do'/>"
                , data:{
                    "autoBind":true
                    ,"type"  :null
                    ,"params":params
                    ,"callbackFunc":function(lbrData, partData){

                        if(partData.length > 0) {
                            partsAdd(parData, "Y");
                        }

                        if(lbrData.length > 0){
                            lbrAdd(lbrData, "Y");
                        }

                    }
                }
            }
        });
    };

    /** 다건 예약 정보 팝업 **/
    vehOfReservePopupWindow = function(params, preFixId){

        if(preFixId == "PRE"){
            vehOfPartReserveInfoSearchPopup = dms.window.popup({
                windowId:"vehOfReservePopupWindow"
                , title:"<spring:message code='ser.title.resvInfoSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectVehOfPartReserveInfoPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"params":params
                        ,"preFixId":preFixId
                        ,"callbackFunc":function(data){
                            detailSet(data[0], false);
                        }
                    }
                }
            });
        } else {
            vehOfReserveInfoSearchPopup = dms.window.popup({
                windowId:"vehOfReservePopupWindow"
                , title:"<spring:message code='ser.title.resvInfoSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectVehOfReseveInfoPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"params":params
                        ,"preFixId":preFixId
                        ,"callbackFunc":function(data){
                            if(data.length >= 1) {
                                detailSet(data[0], false);
                            }
                        }
                    }
                }
            });
        }
    };

    $("#sampo").click(function(e){
        dms.notification.info("<spring:message code='global.msg.eveloping' />");
    });
});
</script>
<!-- script -->
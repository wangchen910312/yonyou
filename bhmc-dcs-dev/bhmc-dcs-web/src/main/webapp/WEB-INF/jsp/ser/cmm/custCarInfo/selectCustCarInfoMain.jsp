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
        <button type="button" id="roSearch" class="btn_m"><spring:message code="ser.btn.btnRoHist" /><!-- 정비이력조회 --></button>
        <button type="button" id="custInfoReg" class="btn_m"><spring:message code="ser.btn.custInfoUpdt" /><!-- 고객정보변경 --></button>
        <button type="button" id="custInfoInsert" class="btn_m" style="display:none;"><spring:message code="global.btn.save" /><!-- 저장 --></button>
        <button type="button" id="custInfoRegCancel" class="btn_m" style="display:none;"><spring:message code="ser.btn.cancel" /><!-- 취소 --></button>
        <button type="button" id="custInfo" class="btn_m"><spring:message code="ser.btn.custView" /><!-- 고객view --></button>
    </div>
</div>

<div class="clfix tablet_hide">
    <!-- 차량정보 -->
    <section class="left_areaStyle">
        <!-- 탭메뉴 전체 영역 -->
        <div id="campaignTab" class="tab_area mt0">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.title.carInfo" /><!-- 차량정보 --></li>
                <li><spring:message code="ser.lbl.serCampn" /><!-- 서비스 캠페인 --></li>
                <li><spring:message code="ser.lbl.collectCampn" /><!-- 일괄 캠페인 --></li>
                <li><spring:message code="ser.lbl.sampoAlarm" /><!-- 삼보알람 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 车辆信息 -->
            <div style="min-height:142px;">
                <div class="table_form">
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
                                <td class="required_area" colspan="3">
                                    <div class="form_search">
                                        <input type="text" id="vinNo" name="vinNo" class="form_input" data-json-obj="true" data-name="<spring:message code="ser.lbl.vinNo" />" required />
                                        <a href="javascript:custPopupWindow('${preFixId}');"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="carRegNo" name="carRegNo" class="form_input" data-json-obj="true" />
                                        <a href="javascript:custPopupWindow('${preFixId}');"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.nowRunDist" /><!-- 현주행거리 --></th>
                                <td>
                                    <input type="text" id="runDistVal" name="runDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.brandNm" /><!-- 브랜드명 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carBrandNm" name="carBrandNm" class="form_input" readonly/>
                                    <input type="hidden" id="carBrandCd" name="carBrandCd" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /><!-- 누적주행거리 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carRunDistVal" name="carRunDistVal" class="form_input" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carlineNm" name="carlineNm" class="form_input" readonly/>
                                    <input type="hidden" id="carlineCd" name="carlineCd" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.wcEndDt" /><!-- 보증완료일 --></th>
                                <td id="grteEndDtTd" class="readonly_area">
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
                                <th scope="row"><spring:message code="ser.lbl.engnNo" /><!-- 엔진번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="enginNo" name="enginNo" class="form_input" data-json-obj="true" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.incNo" /><!-- 보험번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="incNo" name="incNo" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.color" /><!-- 외장 색상 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="extColorNm" name="extColorNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.incEndDt" /><!-- 보험완료일 --></th>
                                <td class="readonly_area">
                                    <input id="incEndDt" name="incEndDt" class="form_datepicker" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vehicleUse" /><!-- 차량용도 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.scheChkDt" /><!-- 정비예정일자 --></th>
                                <td class="readonly_area">
                                    <input id="scheChkDt" name="scheChkDt" class="form_datepicker" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.saleOutDt" /><!-- 판매출고일자 --></th>
                                <td class="readonly_area">
                                    <input id="pltGiDt" name="pltGiDt" class="form_datepicker" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.scheChkDist" /><!-- 정비예정 주행거리 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="scheChkDist" name="scheChkDist" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.salDlrComp" /><!-- 판매딜러사 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="ordDlrCd" name="ordDlrCd" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.chaDrivDis" /><!-- 교환시 주행거리 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="chaDrivDis" name="chaDrivDis" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //车辆信息 -->

            <!-- 服务活动 -->
            <div style="min-height:142px;">
                <div id="serCampaignGrid" class="grid"></div>
            </div>
            <!-- //服务活动 -->

            <!-- 批量活动 -->
            <div style="min-height:142px;">
                <div id="allCampaignGrid" class="grid"></div>
            </div>
            <!-- //批量活动 -->

            <!-- 三包提示 -->
            <div style="min-height:142px;">
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="width:18%;">
                            <col style="width:34%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.sampoCndt1" /><!-- 판매60일내 혹 300km내 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.sampoCndt4" /><!-- 엄중한 고장/엔진/변속기/기타집성류 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.sampoCndt2" /><!-- 삼포정비 누적일자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.sampoCndt5" /><!-- 동일 품질문제로 정비하는 것을 누적 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.sampoCndt3" /><!-- 삼포만료일 까지 남은 일자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <td></td><td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //三包提示 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //차량정보 -->

    <!-- 고객정보 -->
    <section class="right_areaStyle">
        <!-- 탭메뉴 전체 영역 -->
        <div id="campaignTab1" class="tab_area mt0">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자 --></li>
                <li><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></li>
                <li><spring:message code="ser.lbl.dealerMember" /><!-- 딜러회원 --></li>
                <li><spring:message code="ser.lbl.bmMemb" /><!-- BM회원 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 车辆所有者 -->
            <div style="min-height:142px;">
                <div class="table_form">
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
                                <td class="required_area" colspan="3">
                                    <div class="form_search">
                                        <input type="text" id="carOwnerNm" name="carOwnerNm" class="form_input" data-json-obj="true" data-name="<spring:message code="ser.lbl.carOwner" />" required/>
                                        <a href="#" onclick="javascript:custPopupWindow('${preFixId}');"></a>
                                    </div>
                                    <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" class="form_input numberic" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certTp" /><!-- 증서유형 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerMathDocTp" name="carOwnerMathDocTp" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerHpNo" name="carOwnerHpNo" class="form_input numberic" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certNo" /><!-- 증서번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerSsnCrnNo" name="carOwnerSsnCrnNo" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.email" /><!-- 이메일 --></th>
                                <td class="readonly_area">
                                    <input type="mail" id="carOwnerMailNm" name="carOwnerMailNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactMth" /><!-- 메인연락방식 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerPrefContactMthCd" name="carOwnerPrefContactMthCd" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.custTag" /><!-- 고객태그 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="custTag" name="custTag" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactTime" /><!-- 메인연락시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerPrefContactTimeCd" name="carOwnerPrefContactTimeCd" class="form_input" readonly/>
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
                                <th scope="row"><spring:message code="ser.lbl.custTp" /><!-- 고객유형 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="custTp" name="custTp" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.lbrDcRate" /><!-- 공임할인률 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="txtLbrDcRate" name="txtLbrDcRate" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.custLvl" /><!-- 고객레벨 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="custLvl" name="custLvl" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.parDcRate" /><!-- 부품할인률 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="txtParDcRate" name="txtParDcRate" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carIfNm" /><!-- 차량연계인 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="carIfNm" name="carIfNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preBalDt" /><!-- 예치금시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="preBalDt" name="preBalDt" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.cotcStartDt" /><!-- 정비계약시작일자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="orgCd" name="orgCd" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preBalAmt" /><!-- 예치금 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="preBalAmt" name="preBalAmt" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.cotcEndDt" /><!-- 계약완료일 --></th>
                                <td class="readonly_area">
                                    <input id="cotcEndDt" name="cotcEndDt" class="form_datepicker" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preBalBalc" /><!-- 예치금 잔액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="preBalBalc" name="preBalBalc" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr style="display:none">
                                <th scope="row"><spring:message code="ser.lbl.samPoEndDt" /><!-- 삼포완료일 --></th>
                                <td class="readonly_area">
                                    <input id="samPoEndDt" name="samPoEndDt" class="form_datepicker" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //车辆所有者 -->

            <!-- 送修者 -->
            <div style="min-height:142px;">
                <div class="table_form">
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
                                    <input type="text" id="sexCd" name="sexCd" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverTelNo" name="driverTelNo" class="form_input form_numeric" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certTp" /><!-- 증서유형 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverMathDocTp" name="driverMathDocTp" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverHpNo" name="driverHpNo" class="form_input form_numeric" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.certNo" /><!-- 증서번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverSsnCrnNo" name="driverSsnCrnNo" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.email" /><!-- 이메일 --></th>
                                <td class="readonly_area">
                                    <input type="mail" id="driverMailNm" name="driverMailNm" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactMth" /><!-- 메인연락방식 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverPrefContactMthCd" name="driverPrefContactMthCd" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.etcContactNo" /><!-- 기타연락번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainContactTime" /><!-- 메인연락시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="driverPrefContactTimeCd" name="driverPrefContactTimeCd" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //送修者 -->

            <!-- 特约店会员 -->
            <div style="min-height:142px;">
                <div class="table_form">
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
                                <th scope="row"><spring:message code="ser.lbl.membNo" /><!-- 회원번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="membNo" name="membNo" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.membGrade" /><!-- 회원등급 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membStat" /><!-- 회원상태 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.membEtcDc" /><!-- 회원기타할인 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membJoinDt" /><!-- 회원가입시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.membPreBalAmtDt" /><!-- 회원예치금시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membSaveMileage" /><!-- 회원누적마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.membPreBalAmt" /><!-- 회원예치금금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.membUseMileage" /><!-- 회원가용마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.remainPreBalAmt" /><!-- 잔여예치금금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //特约店会员 -->

            <!-- BM会员 -->
            <div style="min-height:142px;">
                <div class="table_form">
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
                                <th scope="row"><spring:message code="ser.lbl.bmMembNo" /><!-- BM회원번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="bmMembNo" name="bmMembNo" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.bmMembGrade" /><!-- BM회원등급 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="bmMembNo" name="bmMembNo" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembStat" /><!-- BM회원상태 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.bmMembEtcDc" /><!-- BM회원기타할인 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembJoinDt" /><!-- BM회원가입시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.bmMembPreBalAmtDt" /><!-- BM회원예치금시간 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembSaveMileage" /><!-- BM회원누적마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.bmMembPreBalAmt" /><!-- BM회원예치금금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.bmMembUseMileage" /><!-- BM회원가용마일리지 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.remainPreBalAmt" /><!-- 잔여예치금금액 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="" name="" class="form_input" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //BM会员 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //고객정보 -->
</div>

<input type="hidden" id="preFixId" name="preFixId" value="${preFixId}"/>
<input type="hidden" id="pdiYn" name="pdiYn"  /> <!-- PDI 여부 -->
<input type="hidden" id="signOffDt" name="signOffDt" /> <!-- 생산일자 -->
<input type="hidden" id="custSaleDt" name="custSaleDt" /> <!-- 판매일자 -->
<input type="hidden" id="carId" name="carId">
<input type="hidden" id="carOwnerSeq" name="carOwnerSeq">
<input type="hidden" id="driverSeq" name="driverSeq">
<input type="hidden" id="ltsModelCd" name="ltsModelCd">
<input type="hidden" id="carDstinCd" name="carDstinCd"  /> <!-- 차종구분 -->

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

    /* if(jQuery.browser.mobile){
        $("#carTotalInfo").removeClass("tablet_hide");
        $("#carTotalInfo").addClass("tablet_show");
        $("#tabletView").removeClass("tablet_show");
        $("#tabletView").addClass("tablet_hide");
    } else {
        $("#carTotalInfo").removeClass("tablet_hide");
        $("#carTotalInfo").addClass("tablet_show");
        $("#tabletView").removeClass("tablet_show");
        $("#tabletView").addClass("tablet_hide");
    } */

    $("#vinNo, #carRegNo, #carOwnerNm").keypress(function(e){
       if(e.keyCode === 13){
           e.preventDefault();
           custPopupWindow('${preFixId}');
       }
    });

    /**주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

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
            $("#allCampaignGrid").data("kendoExtGrid").dataSource.data([]);
            $("#serCampaignGrid").data("kendoExtGrid").dataSource.data([]);
            initAll();
        }
    });

    // 캠페인 그리드
    $("#serCampaignGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/campaign/selectCampaignForVinInfos.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sVinNo"] = $("#vinNo").val();
                         params["sPdiYn"] = dms.string.defaultString($("#pdiYn").val(),"N");
                         params["sCarDstinCd"] = $("#carDstinCd").val();
                         params["sLtsModelCd"] = $("#ltsModelCd").val();


                         params["sSignOffDt"] = kendo.parseDate( $("#signOffDt").val());
                         params["sCustSaleDt"] = kendo.parseDate( $("#custSaleDt").val());

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,crNo:{type:"string" }
                       ,crTp:{type:"string" }
                       ,crNm:{type:"string" }
                       ,crEndDt:{type:"date" }
                       ,ltsModelCd:{type:"string" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,height:120
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,dataBinding:function(e){
            $("#serCampnCnt").text(this.dataSource._total);
        }
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            var data = {
                    crNo:selectedVal.crNo
                   ,crNm:selectedVal.crNm
                   ,ltsModelCd:selectedVal.ltsModelCd
                   ,carBrandCd:$("#carBrandCd").val()
                   ,vinNo:$("#vinNo").val()
            };

            campaignPopupWindow(data);

        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, hidden:true}          // NUMBER
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}           // 캠페인 코드
//            ,{field:"", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}           // 정비코드
             ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100,attributes:{"class":"ac"}
                 ,template:"#=crTpMap[crTp].cmmCdNm#"
                 ,editor:function(container, options) {
                      $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:crTpList
                      });
                      $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                  }
              }         // 정비유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}          // 캠페인 내용
            ,{field:"crEndDt", title:"<spring:message code='ser.lbl.crEndDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required name="crEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="crEndDt"></span>').appendTo(container);
                }
            }
           ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:100 ,hidden:true}          // 캠페인 LTS MODEL 내용
        ]
    });

    // 일괄캠페인 그리드
    $("#allCampaignGrid").kendoExtGrid({
        /* dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/campaign/selectCampaignForVinInfos.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sVinNo"] = $("#vinNo").val();
                         params["sPdiYn"] = dms.string.defaultString($("#pdiYn").val(),"N");
                         params["sCarDstinCd"] = $("#carDstinCd").val();


                         params["sSignOffDt"] = kendo.parseDate( $("#signOffDt").val());
                         params["sCustSaleDt"] = kendo.parseDate( $("#custSaleDt").val());

                       //  params["sSignOffDt"]  = new Date($("#signOffDt").val().substr (0,10));
                       //  params["sCustSaleDt"] = new Date($("#custSaleDt").val().substr(0,10));

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,crNo:{type:"string" }
                       ,crTp:{type:"string" }
                       ,crNm:{type:"string" }
                       ,crEndDt:{type:"date" }
                       ,ltsModelCd:{type:"string" }
                    }

                 }//model
           }//schema
        }//dataSource*/
        editable:false
        ,height:120
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,dataBinding:function(e){
            $("#collectCampnCnt").text(this.dataSource._total);
        }
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            var data = {
                    crNo:selectedVal.crNo
                   ,crNm:selectedVal.crNm
                   ,ltsModelCd:selectedVal.ltsModelCd
                   ,carBrandCd:$("#carBrandCd").val()
                   ,vinNo:$("#vinNo").val()
            };

            campaignPopupWindow(data);

        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, hidden:true}          // NUMBER
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}           // 캠페인 코드
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100,attributes:{"class":"ac"}
                ,template:"#=crTpMap[crTp].cmmCdNm#"
                ,editor:function(container, options) {
                     $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:crTpList
                     });
                     $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                 }
             }         // 정비유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}          // 캠페인 내용
            ,{field:"crEndDt", title:"<spring:message code='ser.lbl.crEndDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required name="crEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="crEndDt"></span>').appendTo(container);
                }
            }
           ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:100 ,hidden:true}          // 캠페인 LTS MODEL 내용
        ]
    });

    carInfo = function(){
        if($("#carInfo").is(":hidden")){
            $("#campaign").hide();
            $("#carInfo").show();
        }else{
            $("#carInfo").hide();
            $("#campaign").show();
        }
    };

    custInfo = function(){
        if($("#ownerInfo").is(":hidden")){
            $("#ownerInfo").show();
        }else{
            $("#ownerInfo").hide();
        }
    };

    $("#campaignTab, #campaignTab1").kendoExtTabStrip({
        animation:false
    });

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
            $("#enginNo").parent("td").addClass("readonly_area");
            $("#enginNo").attr("readonly", true);
            $("#carRunDistVal").parent("td").addClass("readonly_area");
            $("#carRunDistVal").attr("readonly", true);
            $("#carBrandNm").parent("td").addClass("readonly_area");
            $("#carBrandNm").attr("readonly", true);
            $("#grteEndDtTd").addClass("readonly_area");
            $("#grteEndDt").attr("readonly", true);
            $("#modelNm").parent("td").addClass("readonly_area");
            $("#modelNm").attr("readonly", true);
            $("#bmMembNo").parent("td").addClass("readonly_area");
            $("#bmMembNo").attr("readonly", true);
            $("#txtLbrDcRate").parent("td").addClass("readonly_area");
            $("#txtLbrDcRate").attr("readonly", true);
            $("#membNo").parent("td").addClass("readonly_area");
            $("#membNo").attr("readonly", true);
            $("#txtParDcRate").parent("td").addClass("readonly_area");
            $("#txtParDcRate").attr("readonly", true);
            $("#carOwnerMathDocTp").parent("td").addClass("readonly_area");
            $("#carOwnerMathDocTp").attr("readonly", true);
            $("#carOwnerSsnCrnNo").parent("td").addClass("readonly_area");
            $("#carOwnerSsnCrnNo").attr("readonly", true);

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
        custParam.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();

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
            $("#vinNo").attr("readonly", false);
            $("#vinNo").parent("div").parent("td").removeClass("readonly_area");
            $("#carRegNo").attr("data-json-obj", "true");
            $("#carRegNo").attr("readonly", false);
            $("#carRegNo").parent("div").parent("td").removeClass("readonly_area");
            $("#enginNo").attr("data-json-obj", "true");
            $("#carOwnerId").attr("data-json-obj", "true");
            $("#carOwnerNm").attr("data-json-obj", "true");
            $("#carOwnerNm").attr("readonly", false);
            $("#carOwnerNm").parent("div").parent("td").removeClass("readonly_area");
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
            if(brandCdMap[val] != undefined)
            returnVal = brandCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //증서유형
    getMathDocTpMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(mathDocTpMap[val] != undefined)
            returnVal = mathDocTpMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //메인연락방식 코드
    getPrefContactMthCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(prefContactMthCdMap[val] != undefined)
            returnVal = prefContactMthCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //메인연락시간 코드
    getPrefContactTimeCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(prefContactTimeCdMap[val] != undefined)
            returnVal = prefContactTimeCdMap[val].cmmCdNm;
        }
        return returnVal;
    };


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
                   custInfoSet(result.data[0]);

                   if(preFixId != undefined && (preFixId == "RO" || preFixId == "RE")){ //RO:사전점검 당일건 존재시 , 예약:당일건 예약 정보 조회
                       setBizDataSearch(result.data[0] , preFixId);
                   }else{
                       if(preFixId != undefined && (preFixId == "PRE" || preFixId == "RES" )) {
                           reBtnControll("I", true);
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
        $("#carlineCd").val(dms.string.strNvl(data.carlineCd));
        $("#carlineNm").val(dms.string.strNvl(data.carlineNm));
        $("#grteEndDt").val(kendo.toString(kendo.parseDate(data.grteEndDt), "yyyy-MM-dd"));
        $("#carBrandCd").val(dms.string.strNvl(data.carBrandCd));
        $("#carBrandNm").val(dms.string.strNvl(getBrandCdMap(data.carBrandCd)));

        $("#carOwnerId").val(dms.string.strNvl(data.carOwnerId));
        $("#carOwnerNm").val(dms.string.strNvl(data.carOwnerNm));
        $("#carOwnerHpNo").data("kendoMaskedTextBox").value(data.carOwnerHpNo);
        $("#carOwnerTelNo").val(dms.string.strNvl(data.carOwnerTelNo));
        $("#carOwnerZipCd").val(dms.string.strNvl(data.carOwnerZipCd));
        $("#carOwnerMailNm").val(dms.string.strNvl(data.carOwnerMailNm));
        $("#carOwnerAddr").val(dms.string.strNvl(data.carOwnerAddr));
        $("#carOwnerSsnCrnNo").val(dms.string.strNvl(data.carOwnerSsnCrnNo));
        $("#carOwnerMathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.carOwnerMathDocTp)));
        $("#carOwnerPrefContactMthCd").val(dms.string.strNvl(getPrefContactMthCdMap(data.carOwnerPrefContactMthCd)));
        $("#carOwnerPrefContactTimeCd").val(dms.string.strNvl(getPrefContactTimeCdMap(data.carOwnerPrefContactTimeCd)));

        $("#driverId").val(dms.string.strNvl(data.driverId));
        $("#driverNm").val(dms.string.strNvl(data.driverNm));
        $("#driverHpNo").val(dms.string.strNvl(data.driverHpNo));
        $("#driverTelNo").val(dms.string.strNvl(data.driverTelNo));
        $("#driverMailNm").val(dms.string.strNvl(data.driverMailNm));
        $("#driverSsnCrnNo").val(dms.string.strNvl(data.driverSsnCrnNo));
        $("#driverMathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.driverMathDocTp)));
        $("#driverPrefContactMthCd").val(dms.string.strNvl(getPrefContactMthCdMap(data.driverPrefContactMthCd)));
        $("#driverPrefContactTimeCd").val(dms.string.strNvl(getPrefContactTimeCdMap(data.driverPrefContactTimeCd)));
        $("#sexCd").val(dms.string.strNvl(data.sexCd));
        $("#custTp").val(dms.string.strNvl(data.custTp));
        $("#carDstinCd").val(dms.string.strNvl(data.carDstinCd));
        $("#signOffDt").val(kendo.toString( kendo.parseDate(data.signOffDt), "yyyy-MM-dd" ));
        $("#custSaleDt").val(kendo.toString( kendo.parseDate(data.custSaleDt), "yyyy-MM-dd" ));
        if(dms.string.strNvl(data.custSaleDt) != "" && dms.string.strNvl(data.signOffDt) != ""){
            $("#serCampaignGrid").data("kendoExtGrid").dataSource.data([]);
            $("#serCampaignGrid").data("kendoExtGrid").dataSource.read();
        }
        $("#carOwnerSeq").val(dms.string.strNvl(data.carOwnerSeq));
        $("#driverSeq").val(dms.string.strNvl(data.driverSeq));
        $("#ltsModelCd").val(dms.string.strNvl(data.ltsModelCd));
        $("#carRunDistVal").val(dms.string.strNvl(data.carRunDistVal));
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
                            partsAdd(partData, "Y");
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
        vehOfReserveInfoSearchPopup = dms.window.popup({
            windowId:"vehOfReserveInfoSearchPopup"
            , title:"<spring:message code='ser.title.resvInfoSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectVehOfReseveInfoPopup.do'/>"
                , data:{
                    "autoBind":true
                    ,"vinNo":params.vinNo
                    ,"preFixId":preFixId
                    ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            if(data[0].type == "new"){
                                initAll();
                                getCustInfo(data[0]);
                                reBtnControll("create", true);
                            } else {
                                detailSet(data[0], false);
                            }

                        }
                    }
                }
            }
        });
    };

    checkCustInfoSaveMode = function(){
        if($("#custInfoReg").css("display") == "none"){
            dms.notification.info("<spring:message code='ser.msg.custInfoChgMode'/>");
        }
    }

    $("#sampo").click(function(e){
        dms.notification.info("<spring:message code='global.msg.eveloping' />");
    });
});
</script>
<!-- script -->
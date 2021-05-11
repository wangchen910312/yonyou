<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 서비스예약 -->
<div class="content_v1">

    <form id="roForm" name="roForm" method="POST">
    <input type="hidden" id="roStatCd" name="roStatCd" data-json-obj="true">
    <input type="hidden" id="roGrpNo" name="roGrpNo" data-json-obj="true">
    <input type="hidden" id="sResvStatCd" name="sResvStatCd" value="I"  />

    <!-- 차량정보, 운전자정보 공통 페이지 -->
    <jsp:include page="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp"></jsp:include>
    <!-- 차량정보, 운전자정보 공통 페이지 -->

    <!-- RO번호 -->
    <section class="group">
        <div class="header_area">
            <%-- <div style="width:92px;float:left">
                <h2 class="title_basic"><spring:message code='global.lbl.roDocNo' /><!-- RO번호 --></h2>
            </div>
            <div class="left_area">
                <input type="text" id="roDocNo" name="roDocNo" class="form_input" style="width:130px;" data-json-obj="true" readonly>
            </div>
            <div style="float:left;width:35%;box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box;">
                <div style="width:60px;float:left">
                    <h2 class="title_basic"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></h2>
                </div>
                <div class="left_area">
                    <input id="roTp" name="roTp" style="width:110px;" class="form_comboBox" data-json-obj="true">
                </div>
            </div> --%>
            <div class="btn_right">
                <%-- <button type="button" id="roCreate" class="btn_s"><spring:message code='ser.btn.roInsert' /><!-- RO등록 --></button> --%>
                <button type="button" id="roUpdate" class="btn_s"><spring:message code="ser.btn.confirm" /><!-- RO변경 --></button>
                <button type="button" id="roCancel" class="btn_s"><spring:message code="ser.btn.cancel" /><!-- RO취소 --></button>
                <button type="button" id="print" class="btn_s"><spring:message code="global.btn.print" /><!-- RO인쇄 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.roDocNo' /><!-- RO번호 --></th>
                        <td class="readonly_area">
                            <div class="form_search">
                                <input type="text" id="roDocNo" name="roDocNo" class="form_input form_readonly" readonly data-json-obj="true" >
                                <a href="javascript:roSearchPopupWindow();"></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                        <td class="readonly_area">
                            <input id="roTp" name="roTp" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roCreateDt' /><!-- 위탁생성시간 --></th>
                        <td class="readonly_area">
                            <input type="text" id="regDt" name="regDt" class="form_datetimepicker" readonly>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roUpdateDt' /><!-- 위탁변경시간 --></th>
                        <td class="readonly_area">
                            <input type="text" id="updtDt" name="updtDt" class="form_datetimepicker" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.title.resvDocNo' /><!-- 예약번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="resvDocNo" name="resvDocNo" class="form_input form_readonly" data-json-obj="true" readonly>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="diagDocNo" name="diagDocNo" class="form_input form_readonly" data-json-obj="true" readonly>
                        </td>
                        <th scope="row"><span id="incNoSpan"><spring:message code='global.lbl.incReqNo' /></span><!-- 보험신청번호 --></th>
                        <td>
                            <input type="text" id="incReqNo" name="incReqNo" class="form_input form_readonly" data-json-obj="true" data-name="<spring:message code='global.lbl.incReqNo'/>" readonly>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.origRorcptNo' /><!-- 원 RO번호 --></th>
                        <td class="readonly_area">
                            <input type="text" id="baseRoNo" name="baseRoNo" class="form_input" data-json-obj="true" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 일반 -->
        <div id="tabstrip2" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                <li class="k-state-active"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></li>
                <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 고객요청사항 -->
            <div style="height:205px;">
                <div class="table_grid">
                    <div id="custRemarkGrid" class="grid"></div>
                </div>
                <div class="table_list mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.cauCd" /></th>
                                <td >
                                    <div class="">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="cauCd" name="cauCd" readOnly class="form_input" /> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <div class="form_search">
                                                <input type="text" id="cauNm" name="cauNm" readOnly class="form_input" /> <!-- 원인코드명 -->
                                                <a href="javascript:selectPhenCauCodeSearchPopupWindow()"></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.cauCd" /></th>
                                <td >
                                    <div class="">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="cau2Cd" name="cau2Cd" readOnly class="form_input" /> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <div class="form_search">
                                                <input type="text" id="cau2Nm" name="cau2Nm" readOnly class="form_input" /> <!-- 원인코드명 -->
                                                <a href="javascript:selectPhenCauCodeSearchPopupWindow()"></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.phenCd" /></th>
                                <td >
                                    <div class="">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="phenCd" name="phenCd" readOnly class="form_input" />
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="phenNm" name="phenNm" readOnly class="form_input" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.phenCd" /></th>
                                <td >
                                    <div class="">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="phen2Cd" name="phen2Cd" readOnly class="form_input"  />
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="phen2Nm" name="phen2Nm" readOnly class="form_input" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //고객요청사항 -->

            <!-- 고장설명 -->
            <div style="height:205px;">
                <div class="btn_right_absolute">
                    <button type="button" class="btn_s btn_confirm" id="btnAllConfirm"><spring:message code="ser.btn.allConfirm" /><!-- 전체확인 --></button>
                </div>
                <div class="table_form table_form_btn">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10.5%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span id="A00" name="A00" ><spring:message code="ser.lbl.roadCondition" /></span></th>   <!-- 도로조건 -->
                                <td><button type="button" id="A01" name="A01" class="btn_s btn_s_v4"><spring:message code="ser.lbl.highway" /></button></td> <!-- 고속도로 -->
                                <td><button type="button" id="A02" name="A02" class="btn_s btn_s_v4"><spring:message code="ser.lbl.asphalt" /></button></td> <!-- asphalt -->
                                <td><button type="button" id="A03" name="A03" class="btn_s btn_s_v4"><spring:message code="ser.lbl.cementRoad" /></button></td> <!-- 시멘트 도로 -->
                                <td><button type="button" id="A04" name="A04" class="btn_s btn_s_v4"><spring:message code="ser.lbl.stonyRoad" /></button></td> <!-- 모래돌 도로 -->
                                <td><button type="button" id="A05" name="A05" class="btn_s btn_s_v4"><spring:message code="ser.lbl.soilRoad" /></button></td> <!-- 흙 도로 -->
                                <td><input type="text" id="Aetc" name="Aetc" class="form_input" /></td> <!-- 기타 -->
                            </tr>
                            <tr>
                                <th scope="row"><span id="B00" name="B00" ><spring:message code="ser.lbl.roadState" /></span></th> <!-- 도로현황 -->
                                <td><button type="button" id="B01" name="B01" class="btn_s btn_s_v4"><spring:message code="ser.lbl.ground" /></button></td> <!-- 수평 -->
                                <td><button type="button" id="B02" name="B02" class="btn_s btn_s_v4"><spring:message code="ser.lbl.uphill" /></button></td> <!-- 오름막 -->
                                <td><button type="button" id="B03" name="B03" class="btn_s btn_s_v4"><spring:message code="ser.lbl.downhill" /></button></td> <!-- 내리막 -->
                                <td><button type="button" id="B04" name="B04" class="btn_s btn_s_v4"><spring:message code="ser.lbl.sharpCurve" /></button></td> <!-- 코너(급) -->
                                <td><button type="button" id="B05" name="B05" class="btn_s btn_s_v4"><spring:message code="ser.lbl.curve" /></button></td> <!-- 코너(일반) -->
                                <td><input type="text" id="Betc" name="Betc" class="form_input al" /></td> <!-- 기타 -->
                            </tr>
                            <tr>
                                <th scope="row"><span id="C00" name="C00"><spring:message code="ser.lbl.weatherCondition" /></span></th> <!-- 날씨조건 -->
                                <td><button type="button" id="C01" class="btn_s btn_s_v4"><spring:message code="ser.lbl.fineWeather" /></button></td> <!-- 개임 -->
                                <td><button type="button" id="C02" class="btn_s btn_s_v4"><spring:message code="ser.lbl.windyWeather" /></button></td> <!-- 바람 -->
                                <td><button type="button" id="C03" class="btn_s btn_s_v4"><spring:message code="ser.lbl.rainWeather" /></button></td> <!-- 비 -->
                                <td><button type="button" id="C04" class="btn_s btn_s_v4"><spring:message code="ser.lbl.snowWeather" /></button></td> <!-- 눈 -->
                                <td><input type="text" id="CVal" name="CVal" class="form_input ar" maxlength="3" style="width:30%;" data-type="number" data-name="<spring:message code="ser.lbl.temperature" />"> <span class="span_txt"><spring:message code="ser.lbl.temperature" /></span></td> <!-- ℃ -->
                                <td><input type="text" id="Cetc" name="Cetc" class="form_input al" /></td> <!-- 기타 -->
                            </tr>
                            <tr>
                                <th scope="row"><span id="D00" name="D00"><spring:message code="ser.lbl.frequency" /></span></th> <!-- 발생빈도 -->
                                <td><button type="button" id="D01" name="D01" class="btn_s btn_s_v4"><spring:message code="ser.lbl.once" /></button></td> <!-- 한번만 -->
                                <td><button type="button" id="D02" name="D02" class="btn_s btn_s_v4"><spring:message code="ser.lbl.often" /></button></td> <!-- 자주 -->
                                <td><button type="button" id="D03" name="D03" class="btn_s btn_s_v4"><spring:message code="ser.lbl.reqular" /></button></td> <!-- 정기적 -->
                                <td><button type="button" id="D04" name="D04" class="btn_s btn_s_v4"><spring:message code="ser.lbl.occasionality" /></button></td> <!-- 비정기적 -->
                                <td><input type="text" id="DVal" name="DVal" class="form_input ar" data-type="number" min="1" data-name="<spring:message code="ser.lbl.repeat"/>" style="width:30%;"/> <span class="span_txt"><spring:message code="ser.lbl.repeat" /></span></td> <!-- 차수 -->
                                <td><input type="text" id="Detc" name="Detc" class="form_input al" /></td> <!-- 기타 -->

                            </tr>
                            <tr>
                                <th scope="row"><span id="E00" name="E00"><spring:message code="ser.lbl.driveState" /></span></th> <!-- 운전상태 -->
                                <td><button type="button" id="E01" name="E01" class="btn_s btn_s_v4"><spring:message code="ser.lbl.accelerateFast" /></button></td> <!-- 가속(급) -->
                                <td><button type="button" id="E02" name="E02" class="btn_s btn_s_v4"><spring:message code="ser.lbl.accelerate" /></button></td> <!-- 가속(일반) -->
                                <td><button type="button" id="E03" name="E03" class="btn_s btn_s_v4"><spring:message code="ser.lbl.suddenStop" /></button></td> <!-- 감속(급) -->
                                <td><button type="button" id="E04" name="E04" class="btn_s btn_s_v4"><spring:message code="ser.lbl.slowDown" /></button></td> <!-- 감속(일반) -->
                                <td><input type="text" id="EVal" name="EVal" class="form_input ar" data-type="number" min="1" maxlength="3" data-name="<spring:message code="ser.lbl.kmH" />" style="width:30%;" /> <span class="span_txt"><spring:message code="ser.lbl.kmH" /></span></td> <!-- KM/H -->
                                <td><input type="text" id="Eetc" name="Eetc" class="form_input al" /></td> <!-- 기타 -->
                            </tr>
                            <tr>
                                <th scope="row"><span id="F00" name="F00"><spring:message code="ser.lbl.workState" /></span></th> <!-- 작업상태 -->
                                <td><button type="button" id="F01" name="F01" class="btn_s btn_s_v4"><spring:message code="ser.lbl.cooling" /></button></td> <!-- 냉강 -->
                                <td><button type="button" id="F02" name="F02" class="btn_s btn_s_v4"><spring:message code="ser.lbl.heatUp" /></button></td> <!-- 열강 -->
                                <td><button type="button" id="F03" name="F03" class="btn_s btn_s_v4"><spring:message code="ser.lbl.startUp" /></button></td> <!-- 시동 -->
                                <td><button type="button" id="F04" name="F04" class="btn_s btn_s_v4"><spring:message code="ser.lbl.airConOn" /></button></td> <!-- 에어컨가동 -->
                                <td><input type="text" id="FVal" name="FVal" class="form_input ar" min="1" maxlength="3" data-type="number" data-name="<spring:message code="ser.lbl.step" />"  style="width:30%;"/> <span class="span_txt"><spring:message code="ser.lbl.step" /></span></td> <!-- 단계 -->
                                <td><input type="text" id="Fetc" name="Fetc" class="form_input al" /></td> <!-- 기타 -->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //고장설명 -->

            <!-- 정비항목 -->
            <div style="height:205px;">
                <div class="btn_right_absolute">
                    <button type="button" id="lbrPkgAdd" class="btn_s btn_pkgAdd"><spring:message code="global.btn.pakage" /></button>
                    <button type="button" id="lbrAdd" class="btn_s btn_add"><spring:message code="global.btn.add" /></button>
                    <button type="button" id="lbrDel" class="btn_s btn_delete"><spring:message code="global.btn.del" /></button>
                </div>
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- //정비항목 -->

            <!-- 부품 -->
            <div style="height:205px;">
                <div class="btn_right_absolute">
                    <button type="button" id="parPkgAdd" class="btn_s btn_pkgAdd"><spring:message code="global.btn.pakage" /></button>
                    <button type="button" id="parAdd" class="btn_s btn_add"><spring:message code="global.btn.add" /></button>
                    <button type="button" id="parDel" class="btn_s btn_delete"><spring:message code="global.btn.del" /></button>
                </div>
                <div class="table_grid">
                   <div id="partsGrid" class="grid"></div>
                </div>
            </div>
            <!-- //부품 -->

            <!-- 기타사항 -->
            <div style="height:205px;">
                <div class="table_grid">
                    <div id="etcGrid" class="grid"></div>
                </div>
            </div>
            <!-- //기타사항 -->
        </div>
        <!-- //일반 -->

        <div class="table_form form_width_100per mt10">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.preLbrSubAmt" /><!-- 예정공임비 소계 --></th>
                        <td class="readonly_area">
                            <input type="text" id="lbrAmt" name="lbrAmt" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.preParSubAmt" /><!-- 예정부품대 소계 --></th>
                        <td class="readonly_area">
                            <input type="text" id="parAmt" name="parAmt" class="form_input">
                        </td>
                        <%-- <th scope="row"><spring:message code="ser.lbl.preEtcSubAmt" /><!-- 예정기타비용 소계 --></th>
                        <td></td> --%>
                        <th scope="row"><spring:message code="ser.lbl.preDcAmt" /><!-- 예정 할인금액 --></th>
                        <td class="readonly_area">
                            <input type="text" id="dcAmt" name="dcAmt" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.preTotAmt" /><!-- 예정서비스 비용합계 --></th>
                        <td class="readonly_area">
                            <input type="text" id="totAmt" name="totAmt" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.oldParProcMth" /><!-- 고부품처리방식 --></th>
                        <td>
                            <input id="atqProcTp" name="atqProcTp" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.carWash" /><!-- 세차요청 --></th>
                        <td>
                            <input id="carWashTp" name="carWashTp" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.custStbyMth" /><!-- 고객대기방식 --></th>
                        <td>
                            <input id="custWaitMthCd" name="custWaitMthCd" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.tdrvReq" /><!-- 시승요청 --></th>
                        <td>
                            <input id="carDriveReqTp" name="carDriveReqTp" class="form_comboBox" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.wrkAlloc" /><!-- 작업배정 --></th>
                        <td>
                            <input id="wrkAllocYn" name="wrkAllocYn" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.qtTest" /><!-- 품질검사 --></th>
                        <td>
                            <input id="qtTestMthCd" name="qtTestMthCd" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                        <td>
                            <input id="expcDlDt" name="expcDlDt" class="form_datetimepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.chgExpcDlDt" /><!-- 변경된예정인도시간 --></th>
                        <td>
                            <input id="chgExpcDlDt" name="chgExpcDlDt" class="form_datetimepicker" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roRemark" /><!-- RO비고 --></th>
                        <td colspan="7">
                            <input type="text" id="roRemark" name="roRemark" class="form_input" data-json-obj="true">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <%-- <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.lbl.pdi" /><!-- 인도PDI(PC) --></h2>
            <div class="btn_right">
                <button type="button" id="dlvConf" class="btn_s"><spring:message code="ser.lbl.dlvConf" /><!-- 인도확인 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <td>
                            <label class="label_check"><input type="checkbox" id="roEndYn" name="roEndYn" class="form_check" data-json-obj="true"> <spring:message code="ser.lbl.roEnd" /><!-- RO완료 --></label>
                        </td>
                        <td>
                            <label class="label_check"><input type="checkbox" id="atqProcYn" name="atqProcYn" class="form_check" data-json-obj="true"> <spring:message code="ser.lbl.oldParProc" /><!-- 고부품처리 --></label>
                        </td>
                        <td>
                            <label class="label_check"><input type="checkbox" id="carWashYn" name="carWashYn" class="form_check" data-json-obj="true"> <spring:message code="ser.lbl.carWashCond" /><!-- 세차상황 --></label>
                        </td>
                        <td>
                            <label class="label_check"><input type="checkbox" id="serTagYn" name="serTagYn" class="form_check" data-json-obj="true"> <spring:message code="global.lbl.servTag" /><!-- 서비스태그 --></label>
                        </td>
                        <td>
                            <label class="label_check"><input type="checkbox" id="allCheck" name="allCheck" class="form_check"> <spring:message code="global.lbl.selectAll" /><!-- 전체선택 --></label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div> --%>

        <div class="header_area">
            <div class="btn_left">
                <button type="button" id="visitSer" class="btn_m"><spring:message code="global.lbl.vsitSer" /><!-- 방문서비스 --></button>
                <button type="button" id="delivery" class="btn_m"><spring:message code="global.lbl.delivery" /><!-- Delivery --></button>
            </div>
            <div class="btn_right">
                <button type="button" id="deliveryChk" class="btn_m"><spring:message code="ser.btn.deliveryChk" /></button><!-- 인도검사 -->
                <button type="button" id="pwa" class="btn_m"><spring:message code="ser.btn.pwa" /></button><!-- PWA -->
                <button type="button" id="roChgAlarm" class="btn_m"><spring:message code="ser.btn.roChgAlarm" /></button><!-- RO변경알람 -->
                <button type="button" id="calculate" class="btn_m"><spring:message code="ser.btn.calculate" /></button><!-- 서비스정산관리 -->
            </div>
        </div>

        <%-- <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.lbl.vsitSer" /><!-- 방문서비스 --></h2>
        </div>

        <div class="table_form form_width_100per">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.vsitCarReceiveDt" /><!-- 방문차량수령시간 --></th>
                        <td>
                            <input id="vsitCarReceiveDt" name="vsitCarReceiveDt" class="form_datetimepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitCarReceiveIfNm" /><!-- 차량수령연계인 --></th>
                        <td>
                            <input type="text" id="vsitCarReceiveIfNm" name="vsitCarReceiveIfNm" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitCarReceiveCinoNo" /><!-- 차량수령연락처 --></th>
                        <td>
                            <input type="text" id="vsitCarReceiveCinoNo" name="vsitCarReceiveCinoNo" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitCarReceiveAddrNm" /><!-- 차량수령주소 --></th>
                        <td>
                            <input type="text" id="vsitCarReceiveAddrNm" name="vsitCarReceiveAddrNm" class="form_input" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carReceiveDt" /><!-- 차량수령시간 --></th>
                        <td>
                            <input id="carReceiveDt" name="carReceiveDt" class="form_datetimepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitDlIfNm" /><!-- 방문인도연계인 --></th>
                        <td>
                            <input type="text" id="vsitDlIfNm" name="vsitDlIfNm" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitDlCinoNo" /><!-- 방문인도연락처 --></th>
                        <td>
                            <input type="text" id="vsitDlCinoNo" name="vsitDlCinoNo" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitDlAddrNm" /><!-- 방문인도주소 --></th>
                        <td>
                            <input type="text" id="vsitDlAddrNm" name="vsitDlAddrNm" class="form_input" data-json-obj="true">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.lbl.delivery" /><!-- Delivery --></h2>
        </div>

        <div class="table_form form_width_100per">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.vsitDt" /><!-- 방문시간 --></th>
                        <td>
                            <input id="vsitDt" name="vsitDt" class="form_datetimepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitIfNm" /><!-- 방문연계인 --></th>
                        <td>
                            <input type="text" id="vsitIfNm" name="vsitIfNm" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitCinoNo" /><!-- 방문연락처 --></th>
                        <td>
                            <input type="text" id="vsitCinoNo" name="vsitCinoNo" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vsitAddrNm" /><!-- 방문주소 --></th>
                        <td>
                            <input type="text" id="vsitAddrNm" name="vsitAddrNm" class="form_input" data-json-obj="true">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div> --%>
    </section>
    <!-- //RO번호 -->
    </form>
</div>

    <!-- 우측 메뉴 간반보드 공통 페이지 -->
    <jsp:include page="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp"></jsp:include>
    <!-- 우측 메뉴 간반보드 공통 페이지 -->

<!-- //서비스예약 -->


<!-- script -->
<script>

    var laborSearchPopup;
    var tecSearchPopup;
    var bayManagePopup;
    var roCancelPopup;
    var repairOrderSearchPopup;
    var visitServicePopup;
    var deliveryPopup;
    var pwaApprovePopupWindow;
    var insurancePopup;

    var url;
    var listType = "RO";

    //공통코드:RO유형
    var roTpCdList = [];
    <c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>
    var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

    //공통코드:고객대기방식유형
    var custWaitMthCdList = [];
    <c:forEach var="obj" items="${custWaitMthCdList}">
    custWaitMthCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:고품처리유형
    var atqProcTpCdList = [];
    <c:forEach var="obj" items="${atqProcTpCdList}">
    atqProcTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:차량세차유형
    var carWashTpCdList = [];
    <c:forEach var="obj" items="${carWashTpCdList}">
    carWashTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:차량시승요청유형
    var carDriveReqTpCdList = [];
    <c:forEach var="obj" items="${carDriveReqTpCdList}">
    carDriveReqTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:사용여부
    var useYnCdList = [];
    <c:forEach var="obj" items="${useYnCdList}">
    useYnCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:품질검사
    var qtTestMthCdList = [];
    <c:forEach var="obj" items="${qtTestMthCdList}">
    qtTestMthCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:정비유형(수리유형)
    var lbrTpCdList = [];
    <c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});

    $(document).ready(function() {

        // 고객대기방식
        $("#custWaitMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custWaitMthCdList
            ,optionLabel:"<spring:message code='global.lbl.check' />"
        });

        // 고부품처리방식
        $("#atqProcTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:atqProcTpCdList
            ,optionLabel:"<spring:message code='global.lbl.check' />"
        });

        // 세차요청
        $("#carWashTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carWashTpCdList
            ,optionLabel:"<spring:message code='global.lbl.check' />"
        });

        // 시승요청
        $("#carDriveReqTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carDriveReqTpCdList
            ,optionLabel:"<spring:message code='global.lbl.check' />"
        });

        // 배정여부
        $("#wrkAllocYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnCdList
            ,index:0
        });

        // 품질검사
        $("#qtTestMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:qtTestMthCdList
            ,optionLabel:"<spring:message code='global.lbl.check' />"
        });

        // 예약구분
        $("#roTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roTpCdList
            ,change:function(e){
                var selectVal = this.value();
                if(selectVal == '02'){
                    pwaApprovePopupWindow = dms.window.popup({
                        windowId:"pwaApprovePopupWindow"
                        ,title:"<spring:message code='ser.btn.pwa' />"
                        ,content:{
                            url:"<c:url value='/ser/cmm/popup/selectPwaApproveSearchPopup.do'/>"
                            ,data:{
                                "autoBind":false
                                ,"selectable":"single"
                                ,"vinNo":$("vinNo").val()
                                ,"dlrCd":"${dlrCd}"
                                ,"roDocNo":$("roDocNo").val()
                                /* ,"callbackFunc":function(jsonObj){
                                    if(jsonObj.length > 0) {
                                        lbrAdd(jsonObj, "N");
                                    }
                                } */
                            }
                        }
                    });
                } else if(selectVal == '03'){
                    insurancePopup = dms.window.popup({
                        windowId:"insurancePopup"
                        ,title:"<spring:message code='ser.lbl.insurance' />"
                        ,content:{
                            url:"<c:url value='/ser/cmm/popup/selectInsurancePopup.do'/>"
                            ,data:{
                                "autoBind":false
                                ,"selectable":"single"
                                /* ,"callbackFunc":function(jsonObj){
                                    if(jsonObj.length > 0) {
                                        lbrAdd(jsonObj, "N");
                                    }
                                } */
                            }
                        }
                    });

                    $("#incNoSpan").addClass("bu_required");
                    $("#incDtSpan").addClass("bu_required");
                    $("#incReqNo").prop("required", true);
                    $("#incReqNo").removeClass("form_readonly");
                    //$("#incReqDt").prop("required", true);
                } else {
                    $("#incNoSpan").removeClass("bu_required");
                    $("#incDtSpan").removeClass("bu_required");
                    $("#incReqNo").val("");
                    //$("#incReqDt").data("kendoExtMaskedDatePicker").value("");
                    $("#incReqNo").prop("required", false);
                    $("#incReqNo").addClass("form_readonly");
                    //$("#incReqDt").prop("required", false);
                }
            }
            ,index:0
        });

        // 예약시간
        /* $("#serResvStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */

        // 보험신청일자
        /* $("#incReqDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */

        /* // 방문차량수령시간
        $("#vsitCarReceiveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 차량수령시간
        $("#carReceiveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 방문시간
        $("#vsitDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */

        // 예정인도일자
        $("#expcDlDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // RO생성일ㅈㅏ
        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,enable:false
        });

        // RO변경일자
        $("#updtDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,enable:false
        });

        // 변경된예정인도일자
        $("#chgExpcDlDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 부품 삭제
        $("#parDel").kendoButton({
            click:function(e) {

                var grid = $("#partsGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

                changeExpcAmt();
            }
            ,enable:false
        });

        // 공임 삭제
        $("#lbrDel").kendoButton({
            click:function(e) {

                var grid = $("#lbrGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

                changeExpcAmt();
            }
            ,enable:false
        });

        // 방문서비스
        $("#visitSer").kendoButton({
            click:function(e) {
                visitServicePopup = dms.window.popup({
                    windowId:"visitServicePopup"
                    ,title:"<spring:message code='ser.lbl.vsitSer' />"
                    ,content:{
                        url:"<c:url value='/ser/cmm/popup/selectVisitServicePopup.do'/>"
                        ,data:{
                            "resvDocNo":$("#resvDocNo").val()
                            //"autoBind":false
                            //,"selectable":"multiple"
                            /* ,"callbackFunc":function(jsonObj){
                                if(jsonObj.length > 0) {
                                    lbrAdd(jsonObj, "N");
                                }
                            } */
                        }
                    }
                });

            }
            ,enable:false
        });

        // 딜리버리
        $("#delivery").kendoButton({
            click:function(e) {
                deliveryPopup = dms.window.popup({
                    windowId:"deliveryPopup"
                    ,title:"<spring:message code='ser.lbl.delivery' />"
                    ,content:{
                        url:"<c:url value='/ser/cmm/popup/selectDeliveryServicePopup.do'/>"
                        ,data:{
                            "resvDocNo":$("#resvDocNo").val()
                            //"autoBind":false
                            //,"selectable":"multiple"
                            /* ,"callbackFunc":function(jsonObj){
                                if(jsonObj.length > 0) {
                                    lbrAdd(jsonObj, "N");
                                }
                            } */
                        }
                    }
                });
            }
            ,enable:false
        });

        // 인도검사
        $("#deliveryChk").kendoButton({
            click:function(e) {

            }
            ,enable:false
        });

        // pwa
        $("#pwa").kendoButton({
            click:function(e) {

            }
            ,enable:false
        });

        // RO변경알람
        $("#roChgAlarm").kendoButton({
            click:function(e) {

            }
            ,enable:false
        });

        // 서비스정산관리
        $("#calculate").kendoButton({
            click:function(e) {

            }
            ,enable:false
        });

        $(".btn_s_v4").click(function(){
            $(this).toggleClass("btn_active");
        });

        $(".preCheck_ico").click(function(){
            $(this).toggleClass("ico_active");
        });

        $("#allCheck").click(function(){
            if($("#allCheck").is(":checked")){
                $("#roEndYn").prop("checked", true);
                $("#atqProcYn").prop("checked", true);
                $("#carWashYn").prop("checked", true);
                $("#serTagYn").prop("checked", true);
            } else {
                $("#roEndYn").prop("checked", false);
                $("#atqProcYn").prop("checked", false);
                $("#carWashYn").prop("checked", false);
                $("#serTagYn").prop("checked", false);
            }
        });

        $(".tab_area").kendoExtTabStrip({
            animation:false
        });

        // 확인
        $("#roUpdate").kendoButton({
            click:function(e) {
                saveRo("01");
            }
            ,enable:false
        });

        // 취소
        $("#roCancel").kendoButton({
            click:function(e) {

                roCancelPopup = dms.window.popup({
                    windowId:"roCancelWin"
                        , title:"<spring:message code='ser.lbl.roCancel'/>"   // 예약취소
                        , width:400
                        , height:200
                        , content:{
                            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderCancelPopup.do'/>"
                            ,data:{
                                "roDocNo":$("#roDocNo").val()
                                ,"callbackFunc":function(){
                                    dms.notification.success("<spring:message code='ser.lbl.roCancel' var='ro' /><spring:message code='global.info.cancelSuccessParam' arguments='${ro}' />");
                                    initAll();
                                }
                            }
                        }
                });
            }
            ,enable:false
        });

        $("#print").kendoButton({
            click:function(e) {
                alert("print");
            }
            ,enable:false
        });

        // 인도확인
        /* $("#dlvConf").kendoButton({
            click:function(e) {
                saveRo("01");
            }
            ,enable:false
        }); */

        saveRo = function(roStat){

            checkCustInfoSaveMode();

            var validator = $("#roForm").kendoExtValidator().data("kendoExtValidator");

            // readOnly는 validator가 적용 안됨
            /* if ( dms.string.isEmpty($("#bayNo").val())) {
                dms.notification.info("<spring:message code='ser.lbl.bayAppoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            } */

            if (validator.validate()) {

                var partsGrid = $("#partsGrid").data("kendoExtGrid");
                var partSaveData = partsGrid.dataSource.data();

                var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
                var lbrSaveData = lbrGrid.dataSource.data();

                var formParam = $("roForm").serializeObject($("#roForm").serializeArrayInSelector("[data-json-obj='true']"));

                if($("#roEndYn").is(":checked")){
                    formParam.roEndYn = "Y";
                } else {
                    formParam.roEndYn = "N";
                }
                if($("#atqProcYn").is(":checked")) {
                    formParam.atqProcYn = "Y";
                } else {
                    formParam.atqProcYn = "N";
                }
                if($("#carWashYn").is(":checked")){
                    formParam.carWashYn = "Y";
                } else {
                    formParam.carWashYn = "N";
                }
                if($("#serTagYn").is(":checked")){
                    formParam.serTagYn = "Y";
                } else {
                    formParam.serTagYn = "N";
                }
                if($("#roEndYn").is(":checked")){
                    formParam.roEndYn = "Y";
                } else {
                    formParam.roEndYn = "N";
                }

                formParam.roStatCd = roStat;
                //formParam.serResvStartDt = $("#serResvStartDt").data("kendoExtMaskedDatePicker").value();
                formParam.expcDlDt = $("#expcDlDt").data("kendoExtMaskedDatePicker").value();
                formParam.chgExpcDlDt = $("#chgExpcDlDt").data("kendoExtMaskedDatePicker").value();

                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $.extend(
                   {"repairOrderVO":formParam}
                   ,{"repairOrderPartSaveVO":partSaveData}
                   ,{"repairOrderLaborSaveVO":lbrSaveData}
                )

                $.ajax({
                    url:"<c:url value='/ser/ro/repairOrder/multiRepairOrder.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        $("#roDocNo").val(result);
                        roBtnControll("RO", true);
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#partsGrid").data("kendoExtGrid").dataSource.read();
                        $("#lbrGrid").data("kendoExtGrid").dataSource.read();

                    }
                });
            }
        }

        // 고객요청사항 그리드
        $("#custRemarkGrid").kendoExtGrid({
            dataSource:null
            ,height:108
            ,pageable:false
            ,autoBind:false
            ,sortable:false
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='ser.lbl.reqCode' />", width:100}                              // 요청코드
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.reqCont' />", width:360}                             // 요청내용
            ]
        });

        // 정비 그리드
        $("#lbrGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:null
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            if(listType == "RE") {
                                params["sResvDocNo"] = $("#resvDocNo").val();
                            } else if(listType == "RO") {
                                params["sRoDocNo"] = $("#roDocNo").val();
                            }

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,roTp:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,lbrCd:{type:"string", editable:false}
                            ,lbrNm:{type:"string", editable:false}
                            ,lbrTp:{type:"string"}
                            ,lbrPrc:{type:"number"}
                        }
                    }
                }
            }
            ,height:180
            ,pageable:false
            ,autoBind:false
            ,sortable:false
            ,edit:function(e){
                var fieldName = e.container.find("input").attr("name");
                if(!e.model.isNew()){
                    if(fieldName=="expcLbrAmt"){
                        this.closeCell();
                    }
                }
            }
            ,columns:[
                //{field:"rnum", title:"<spring:message code='global.lbl.noName' />", width:50, attributes:{"class":"ac"}}  // 순번
                {field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:70
                    ,template:"#=roTpCdGrid(roTp)#"
                    ,editor:function(container, options){
                        $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:roTpCdList
                        });
                    }
                }   // RO유형
                ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}                              // 정비코드
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:360}                              // 정비항목
                ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:140}                          // 패키지코드
                ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80
                    ,template:"#=lbrTpCdGrid(lbrTp)#"
                    ,editor:function(container, options){
                        $('<input required name="lbrTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:lbrTpCdList
                        });
                    }
                }                              // 정비유형
                ,{field:"lbrPrc", title:"<spring:message code='global.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            min:0
                            ,max:100000
                            ,decimals:0
                            ,spinners:false
                            ,change:changeExpcAmt
                        });
                    }
                }      // 공임단가
                ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:70, attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            min:0
                            ,max:10
                            ,spinners:false
                            ,change:changeExpcAmt
                        });
                    }
                }            // 정비공임
                ,{field:"dstbHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:70, attributes:{"class":"ar"}}          // 배분시간
                ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:70, attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            min:0
                            ,max:100000
                            ,spinners:false
                            ,change:changeExpcAmt
                        });
                    }
                }        // 할인금액
                ,{field:"expcLbrAmt", title:"<spring:message code='ser.lbl.preLbrAmt' />", width:90, attributes:{"class":"ar"}
                    ,template:function(data){
                        changeExpcAmt();
                        var expcLbrAmt = 0;
                        if(data.expcLbrAmt != null){
                            expcLbrAmt = data.expcLbrAmt;
                        }
                        return dms.string.addThousandSeparatorCommas(expcLbrAmt);
                    }
                }  // 예정공임비
                ,{field:"payCmpNm", title:"<spring:message code='ser.lbl.payCmpNm' />", width:70}                                   // 지불사
                ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", width:100}                                 // 비고
                //,{field:"lineNo", hidden:true}
            ]
        });

        // 부품 그리드
        $("#partsGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:null
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            if(listType == "RE") {
                                params["sResvDocNo"] = $("#resvDocNo").val();
                            } else if(listType == "RO") {
                                params["sRoDocNo"] = $("#roDocNo").val();
                            }

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            roTp:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,itemCd:{type:"string", editable:false}
                            ,itemNm:{type:"string", editable:false, validation:{required:true}}
                            ,itemPrc:{type:"number", editable:false}
                            ,calcUnitCd:{type:"string", editable:false}
                            ,itemQty:{type:"number"}
                        }
                    }
                }
            }
            ,height:180
            ,pageable:false
            ,autoBind:false
            ,sortable:false
            ,edit:function(e){
                var fieldName = e.container.find("input").attr("name");
                if(!e.model.isNew()){
                    if(fieldName=="expcParAmt"){
                        this.closeCell();
                    }
                }
            }
            ,columns:[
                //{field:"rnum", title:"<spring:message code='global.lbl.noName' />", width:50, attributes:{"class":"ac"}}  // 순번
                {field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:70
                    ,template:"#=roTpCdGrid(roTp)#"
                    ,editor:function(container, options){
                        $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:roTpCdList
                            ,optionLabel:"<spring:message code='global.btn.select' />"
                            ,index:0
                        });
                    }
                }   // RO유형
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}                            // 부품번호
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:360}                            // 부품명
                ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:140}                   // 패키지코드
                ,{field:"giTp", title:"<spring:message code='global.lbl.giTp' />", width:70}                             // 출고유형
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            min:0
                            ,max:100000000
                            ,decimals:0
                            ,spinners:false
                            ,change:changeExpcAmt
                        });
                    }
                }                       // 부품단가
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            min:0
                            ,max:100000000
                            ,decimals:0
                            ,spinners:false
                            ,change:changeExpcAmt
                        });
                    }
                }                          // 부품수량
                ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:70}                        // 계산단위
                ,{field:"stockStatCd", title:"<spring:message code='ser.lbl.stockStat' />", width:70}                    // 재고상태
                ,{field:"expcParAmt", title:"<spring:message code='ser.lbl.preParAmt' />", width:90, attributes:{"class":"ar"}
                    ,template:function(data){
                        changeExpcAmt();
                        var expcParAmt = 0;
                        if(data.expcParAmt != null){
                            expcParAmt = data.expcParAmt;
                        }
                        return dms.string.addThousandSeparatorCommas(expcParAmt);
                    }
                }                     // 예정부품대
                ,{field:"payCmpNm", title:"<spring:message code='ser.lbl.payCmpNm' />", width:70}                           // 지불사
                ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", width:100}                        // 예약비고
                ,{field:"calcUnitNm", hidden:true}                        // 계산단위명
                //,{field:"lineNo", hidden:true}
                ,{field:"grStrgeCd", hidden:true}       // 입고창고코드
                ,{field:"giStrgeCd", hidden:true}       // 출고창고코드
            ]
        });

        // 기타사항
        $("#etcGrid").kendoExtGrid({
            dataSource:null
            ,height:180
            ,pageable:false
            ,autoBind:false
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.othDetail' />", width:50, attributes:{"class":"ac"}}  // 순번
            ]
        });

        // 부품추가 팝업
        // 김경목 - 서비스 공통으로 변경
        $("#parAdd").kendoButton({
            click:function(e)
            {
                itemSalePrcPopupWindow = dms.window.popup({
                    windowId:"partsMasterPopup"
                    ,height:430
                    ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                    ,content:{
                        url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                        ,data:{
                            "autoBind":true
                            ,"selectable":"multiple"
                            ,"callbackFunc":function(parData){
                                if(parData.length > 0)
                                {
                                    partsAdd(parData, "N");
                                }
                            }
                        }
                    }
                });
            }
            ,enable:false
        });

        // 정비 팝업
        $("#lbrAdd").kendoButton({
            click:function(e)
            {
                // 부품 팝업 열기 함수.
                laborSearchPopup = dms.window.popup({
                    windowId:"partsMasterPopup"
                    ,title:"<spring:message code='ser.lbl.lbrNm' />"
                    ,content:{
                        url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                        ,data:{
                            "autoBind":false
                            ,"selectable":"multiple"
                           // ,"sDlrCd":"${dlrCd}"
                            ,"sLtsModelCd":"HP**A"
                            ,"callbackFunc":function(lbrData){
                                if(lbrData.length > 0) {
                                    lbrAdd(lbrData, "N");
                                }
                            }
                        }
                    }
                });
            }
            ,enable:false
        });

        // 패키지 팝업
        $("#parPkgAdd, #lbrPkgAdd").kendoButton({
            click:function(e)
            {
                workPackagePopup = dms.window.popup({
                    windowId:"workPackagePopup"
                    ,height:550
                    ,title:"<spring:message code='global.lbl.pakage' />"   // 패키지
                    ,content:{
                        url:"<c:url value='/ser/cmm/popup/selectWorkPackagePopup.do'/>"
                        ,data:{
                            "autoBind":true
                            ,"selectable":"multiple"
                            ,"callbackFunc":function(parData, lbrData){

                                if(parData.length > 0) {
                                    partsAdd(parData, "N");
                                }

                                if(lbrData.length > 0){
                                    lbrAdd(lbrData, "N");
                                }
                            }
                        }
                    }
                });
            }
            ,enable:false
        });

        // 가격 변경
        changeExpcAmt = function(){

            var parAmt = 0;
            var lbrAmt = 0;
            var grid = $("#partsGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());
            var gridData = grid.dataSource.data();

            var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
            var lbrRowData = lbrGrid.dataItem(lbrGrid.select());
            var lbrGridData = lbrGrid.dataSource.data();

            if(rowData != null){
                var itemPrc = Number(rowData.itemPrc);
                var itemQty = Number(rowData.itemQty);
                rowData.set("expcParAmt", itemPrc*itemQty);
            }

            if(lbrRowData != null){
                var lbrHm = Number(lbrRowData.lbrHm);
                var lbrPrc = Number(lbrRowData.lbrPrc);
                var dcAmt = Number(lbrRowData.dcAmt);
                lbrRowData.set("expcLbrAmt", (1 * lbrHm  * lbrPrc - dcAmt).toFixed(2));
            }

            $.each(gridData, function(index, item){
                parAmt += Number(this.expcParAmt);
            });

            $.each(lbrGridData, function(index, item){
                lbrAmt += Number(this.expcLbrAmt);
            });

            // 예정부품대 소계
            $("#parAmt").val(dms.string.addThousandSeparatorCommas(parAmt.toFixed(2)));
            $("#lbrAmt").val(dms.string.addThousandSeparatorCommas(lbrAmt.toFixed(2)));
            $("#totAmt").val(dms.string.addThousandSeparatorCommas((parAmt + lbrAmt).toFixed(2)));
        }

        // RO정보 셋팅
        roInfoSet = function(result, listType, parReqStatCd){

            $("#parAmt").val(0);
            $("#lbrAmt").val(0);
            $("#totAmt").val(0);

            if(parReqStatCd != "02"){
                roBtnControll(listType, true);
            }

            if(listType == "RO"){
                $("#roDocNo").val(result.roDocNo);
                $("#custWaitMthCd").data("kendoExtDropDownList").value(result.custWaitMthCd);
                $("#atqProcTp").data("kendoExtDropDownList").value(result.atqProcTp);
                $("#carWashTp").data("kendoExtDropDownList").value(result.carWashTp);
                $("#carDriveReqTp").data("kendoExtDropDownList").value(result.carDriveReqTp);
                $("#wrkAllocYn").data("kendoExtDropDownList").value(result.wrkAllocYn);
                $("#qtTestMthCd").data("kendoExtDropDownList").value(result.qtTestMthCd);
                $("#expcDlDt").data("kendoExtMaskedDatePicker").value(result.expcDlDt);
                $("#chgExpcDlDt").data("kendoExtMaskedDatePicker").value(result.chgExpcDlDt);
                $("#roRemark").val(result.roRemark);

                if($("#roEndYn").val() == "Y"){
                    $("#roEndYn").prop("checked", true);
                } else {
                    $("#roEndYn").prop("checked", false);
                }
                if($("#atqProcYn").val() == "Y") {
                    $("#atqProcYn").prop("checked", true);
                } else {
                    $("#atqProcYn").prop("checked", false);
                }
                if($("#carWashYn").val() == "Y"){
                    $("#carWashYn").prop("checked", true);
                } else {
                    $("#carWashYn").prop("checked", false);
                }
                if($("#serTagYn").val() == "Y"){
                    $("#serTagYn").prop("checked", true);
                } else {
                    $("#serTagYn").prop("checked", false);
                }
                if($("#roEndYn").val() == "Y"){
                    $("#roEndYn").prop("checked", true);
                } else {
                    $("#roEndYn").prop("checked", false);
                }

            } else {
                $("#roDocNo").val("");
                $("#custWaitMthCd").data("kendoExtDropDownList").value("");
                $("#atqProcTp").data("kendoExtDropDownList").value("");
                $("#carWashTp").data("kendoExtDropDownList").value("");
                $("#carDriveReqTp").data("kendoExtDropDownList").value("");
            }

            $("#roGrpNo").val(result.roGrpNo);
            $("#resvDocNo").val(result.resvDocNo);
            //$("#saId").val(result.saId);
            //$("#saNm").val(result.saNm);
            $("#tecId").val(result.tecId);
            $("#tecNm").val(result.tecNm);
            //$("#bayNo").val(result.bayNo);
            //$("#custRemark").val(result.custRemark);
            //$("#serResvStartDt").data("kendoExtMaskedDatePicker").value(result.serResvStartDt);
            //$("#resvNm").val(result.driverNm);
            $("#diagDocNo").val(result.diagDocNo);
            $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
            $("#updtDt").data("kendoExtMaskedDatePicker").value(result.updtDt);

            var partsGrid = $("#partsGrid").data("kendoExtGrid");
            var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
            var roParUrl = "<c:url value='/ser/ro/repairOrder/selectRepairOrderParts.do' />";
            var roLbrUrl = "<c:url value='/ser/ro/repairOrder/selectRepairOrderLabors.do' />";

            partsGrid.dataSource.transport.options.read.url = roParUrl;
            lbrGrid.dataSource.transport.options.read.url = roLbrUrl;

            partsGrid.dataSource.read();
            lbrGrid.dataSource.read();

        }

        //초기화
        initAll = function(){
            $("#roForm").get(0).reset();
            $("#lbrGrid").data('kendoExtGrid').dataSource.data([]);
            $("#partsGrid").data('kendoExtGrid').dataSource.data([]);
            roBtnControll("RE", false);
        }

        // RO유형
        roTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = roTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        // 정비유형(수리유형)
        lbrTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = lbrTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        // 부품추가 공통
        partsAdd = function(jsonObj, campaignYn){

            var partsGrid = $('#partsGrid').data('kendoExtGrid');
            var partsDataItem = partsGrid.dataSource._data;

            $.each(jsonObj, function(idx, data){

                var copyData;
                var checkVal = true;

                // 중복값 체크
                $.each(partsDataItem, function(idx, obj){
                    if(data.itemCd == obj.itemCd){
                        checkVal = false;
                    }
                });
                var pkgYN =  ( dms.string.strNvl(data.pkgItemCd) == "" ) ? "N":"Y";
                if(checkVal) {
                    copyData ={
                        roTp:"01"
                        ,dlrCd:data.dlrCd
                        ,itemCd:data.itemCd
                        ,itemNm:data.itemNm
                        ,itemPrc:(pkgYN == "Y") ? data.itemPrc:data.salePrcAmt
                        ,itemQty:(pkgYN == "Y") ?  data.itemQty:1
                        ,calcUnitCd:(pkgYN == "Y") ?  data.itemUnitCd:data.stockUnitCd
                        ,expcParAmt:(pkgYN == "Y") ? data.itemAmt :Number(data.salePrcAmt*1)
                        ,pkgItemCd:data.pkgItemCd
                        ,grStrgeCd:data.grStrgeCd
                        ,giStrgeCd:data.giStrgeCd

                    };

                    partsGrid.dataSource.insert(copyData);
                }
                changeExpcAmt();

            });
        }

        // 공임추가 공통
        lbrAdd = function(jsonObj, campaignYn){

            var lbrGrid = $('#lbrGrid').data('kendoExtGrid');
            var lbrDataItem = lbrGrid.dataSource._data;

            $.each(jsonObj, function(idx, data){

                var copyData;
                var checkVal = true;

                // 중복값 체크
                $.each(lbrDataItem, function(idx, obj){
                    if(data.lbrCd == obj.lbrCd){
                        checkVal = false;
                    }
                });

                var lbrRate = (campaignYn == "Y") ? data.lbrRate:data.lbrRate01;

                if(checkVal) {
                    copyData = {
                        roTp:"01"
                        ,lbrTp:"01"
                        ,lbrCd:data.lbrCd             // 정비코드
                        ,lbrNm:data.lbrNm             // 정비항목
                        ,lbrHm:data.lbrHm             // 공임시간
                        ,lbrPrc:lbrRate               // 공임단가
                        ,dcAmt:0
                        ,expcLbrAmt:(data.lbrHm == 0) ? data.lbrAmt:Number((1 * data.lbrHm  * lbrRate).toFixed(2))
                        ,pkgItemCd:data.pkgItemCd
                    }
                    lbrGrid.dataSource.add(copyData);
                }

                if(data.lbrHm > 0){
                    changeExpcAmt();
                }
            });
        }

        // SA지정 팝업
        bayManageWindow = function(){

            bayManagePopup = dms.window.popup({
                windowId:"teckManFnSearchWin"
                    , title:"<spring:message code='ser.title.baySearch' />"   // BAY 조회
                    , content:{
                        url:"<c:url value='/ser/cmm/popup/selectBayManagePopup.do'/>"
                        , data:{
                            "autoBind":true
                            , "callbackFunc":function(jsonObj) {

                                if(jsonObj.length > 0) {
                                    $("#saId").val(jsonObj[0].admSaId);
                                    $("#saNm").val(jsonObj[0].admSaNm);
                                    $("#bayNo").val(jsonObj[0].bayNo);
                                }
                            }
                        }
                    }

            });
        }

        roBtnControll = function(status, isSubBtn){
            if(status == "RE"){
                $("#roUpdate").data("kendoButton").enable(true);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(true);
                //$("#dlvConf").data("kendoButton").enable(false);
                $("#visitSer").data("kendoButton").enable(true);
                $("#delivery").data("kendoButton").enable(true);
            } else if(status == "RO"){
                $("#roUpdate").data("kendoButton").enable(true);
                $("#roCancel").data("kendoButton").enable(true);
                $("#print").data("kendoButton").enable(true);
                //$("#dlvConf").data("kendoButton").enable(true);
                $("#visitSer").data("kendoButton").enable(true);
                $("#delivery").data("kendoButton").enable(true);
            } else {
                $("#roUpdate").data("kendoButton").enable(true);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);
                //$("#dlvConf").data("kendoButton").enable(false);
                $("#visitSer").data("kendoButton").enable(false);
                $("#delivery").data("kendoButton").enable(false);
            }

            if(isSubBtn){
                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
            } else {
                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
            }
        }

        detailSet = function(data, slide){

            if(data == null ){

                if(confirm("<spring:message code='ser.lbl.preChkInfo' var='preChkInfo' />"+
                        "<spring:message code='ser.menu.preCheckCreate' var='preCheckCreate' />"+
                        "<spring:message code='ser.info.preInfoData' arguments='${preChkInfo},${preCheckCreate}' />")){
                     return parent._createOrReloadTabMenu('<spring:message code="ser.menu.preCheckCreate" />'
                                          ,"<c:url value='/ser/ro/preCheck/selectPreCheckMain.do?vinNo="+$("#vinNo").val()+"'/>", "VIEW-I-10315");
                }
                return;
            }

            if(dms.string.isEmpty(data.resvDocNo)){
                $("#roGrpNo").val(data.roGrpNo);
                $("#diagDocNo").val(data.diagDocNo);
            } else if(dms.string.isNotEmpty(data.resvDocNo)){

                $("#resvDocNo").val(data.resvDocNo);

                var partsGrid = $("#partsGrid").data("kendoExtGrid");
                var lbrGrid = $("#lbrGrid").data("kendoExtGrid");

                partsGrid.dataSource.transport.options.read.url = "<c:url value='/ser/rev/reservationReceipt/selectReservationParts.do' />";
                lbrGrid.dataSource.transport.options.read.url = "<c:url value='/ser/rev/reservationReceipt/selectReservationLabors.do' />";

                partsGrid.dataSource.read();
                lbrGrid.dataSource.read();
            }

            if(dms.string.isNotEmpty(data.vinNo)){
                getCustInfo(data);    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                $("#resvGrid").data("kendoExtGrid").dataSource.data([]);
                $("#partResvGrid").data("kendoExtGrid").dataSource.data([]);
                $("#estGrid").data("kendoExtGrid").dataSource.data([]);
                $("#helpSvcGrid").data("kendoExtGrid").dataSource.data([]);
            }

            if(dms.string.isNotEmpty(data.roDocNo)){
                $.ajax({
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderByKey.do' />"
                    ,data:JSON.stringify({sRoDocNo:data.roDocNo})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                        if(result != null){
                            // 예약현황보드 슬라이드 닫기
                            if(slide){
                                slidePlay();
                            }
                            getCustInfo(result);    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                            $("#resvGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#partResvGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#estGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#helpSvcGrid").data("kendoExtGrid").dataSource.data([]);
                            roInfoSet(result, listType, "");
                        }
                    }
                });
            }


        }

        //RO검색 팝업
        roSearchPopupWindow = function(){
            repairOrderSearchPopup = dms.window.popup({
                windowId:"repairOrderSearchPopup"
                , width:800
                , height:550
                , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "close" :"Y"
                        , "callbackFunc":function(data){

                            detailSet(data[0], false);

                        }
                    }
                }
            });
        }

        <c:choose>
        <c:when test="${roDocNo ne ''}">
        roDetailSet("${roDocNo}", "${parReqStatCd}");
        </c:when>
        <c:when test="${vinNo ne ''}">
        var data = {"vinNo":"${vinNo}", "diagDocNo":"${diagDocNo}", "roGrpNo":"${roGrpNo}"};
        roBtnControll("RE", true);
        detailSet(data, false);
        </c:when>
    </c:choose>
    });

    roDetailSet = function(roDocNo, parReqStatCd){
        $.ajax({
            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderByKey.do' />"
            ,data:JSON.stringify({sRoDocNo:roDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                    getCustInfo(result);    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                    roInfoSet(result, listType, parReqStatCd);
                }
            }
        });
    }

</script>
<!-- //script -->

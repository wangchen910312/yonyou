<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div id="kendoPreCheckForm" class="content_v1">
        <form id="preChkForm">
            <!-- 차량정보, 운전자정보 공통 페이지 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp" />
            <!-- 차량정보, 운전자정보 공통 페이지 -->
            <!-- 사전점검번호 -->
            <section class="group">
                <div class="table_form form_width_100per mt5">
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
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preInsNo" /></th><!-- 사전점검번호 -->
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="diagDocNo" name="diagDocNo" class="form_input" style="width:110px;" data-json-obj="true">
                                        <a href="javascript:goPreChkStatus();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preCheckTp" /></th><!-- 입고점검유형 -->
                                <td>
                                    <input id="carAcptTp" name="carAcptTp" value="02" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preChkStatus" /></th><!-- 사전점검상태 -->
                                <td class="readonly_area">
                                    <input id="diagStatCd" name="diagStatCd" class="form_comboBox" readonly>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preChkNm" /></th><!-- 발행자 -->
                                <td class="readonly_area">
                                    <input id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area mt10">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="CQ"><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                        <li id="RD" class="k-state-active"><span id="L01" name="L01"><spring:message code="ser.lbl.trblExpl" /></span><!-- 고장설명 --></li>
                        <li id="RP"><span class="TabId"><spring:message code="ser.lbl.rpipProject" /></span></li>
                        <li id="P"><span class="TabId"><spring:message code="ser.lbl.part" /></span></li>
<%--                         <li id="OD"><span class="TabId"><spring:message code='ser.lbl.othDetail' /></span></li> --%>
                        <li id="C1"><span class="TabId"><spring:message code="ser.lbl.dashInChk" /></span></li> <!-- Dashboard 검사/내부검사 -->
                        <li id="C2"><span class="TabId"><spring:message code="ser.lbl.outChk" /></span></li><!-- 외부검사 -->
                        <li id="C3"><span class="TabId"><spring:message code="ser.lbl.engnNaclChk" /></span></li><!-- 엔진룸 검사 -->
                        <li id="C4"><span class="TabId"><spring:message code="ser.lbl.lightCheck" /></span></li><!-- 조명검사 -->
                        <li id="C5"><span class="TabId"><spring:message code="ser.lbl.underCheck" /></span></li><!-- 하부검사 -->
                        <li id="LS"><spring:message code='ser.lbl.serviceCont' /></li><!-- 수리건의 -->

                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 신호등 버튼 -->
                    <span class="btn_right_absolute2" id="btn_status_check" style="display:none">
                        <button type="button" id="allNormal" class="btn_m btn_m_normal"><spring:message code="ser.btn.allNormal" /></button><!-- 전부정상 -->
                        <button type="button" id="normal" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.normal" /></button><!-- 정상 -->
                        <button type="button" class="btn_m btn_m_warning"><spring:message code="ser.btn.warning" /></button><!-- 주의 -->
                        <button type="button" class="btn_m btn_m_error"><spring:message code="ser.btn.problem" /></button><!-- 이상 -->
                    </span>
                    <!-- 고객요청사항 & 고장설명 -->

                <jsp:include page="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp"></jsp:include>
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrList.jsp" />
             	<!-- //정비항목 -->
             	<!-- 부품 -->
            	<c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
                <!-- //부품 -->
                <!-- 기타 -->
<%--                 <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" /> --%>
                    <!-- //고객요청사항 & 고장설명 -->
                    <!-- //Dashboard 검사/내부검사 -->
                    <div class="mt0" style="height:205px;">
                        <div style="overflow:hidden;">
                            <div class="left_areaStyle" style="width:33%;">
                                <div class="table_form table_form_btn table_form_img">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col>
                                            <col style="width:19%;">
                                            <col style="width:19%;">
                                            <col style="width:19%;">
                                            <col style="width:19%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td rowspan="3">
                                                    <div class="oiling_ico">
                                                        <div id="I01" name="I01" class="oil_active1">
                                                            <a href="javascript:;" class="oil_empty"></a>
                                                            <a href="javascript:;" class="oil_25p"></a>
                                                            <a href="javascript:;" class="oil_50p"></a>
                                                            <a href="javascript:;" class="oil_75p"></a>
                                                            <a href="javascript:;" class="oil_full"></a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><a href="javascript:;" id="I02" name="I02" class="preCheck_ico btn_iList ico_active_normal I02"></a></td>
                                                <td><a href="javascript:;" id="I03" name="I03" class="preCheck_ico btn_iList ico_active_normal I03"></a></td>
                                                <td><a href="javascript:;" id="I04" name="I04" class="preCheck_ico btn_iList ico_active_normal I04"></a></td>
                                                <td><a href="javascript:;" id="I05" name="I05" class="preCheck_ico btn_iList ico_active_normal I05"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;" id="I06" name="I06" class="preCheck_ico btn_iList ico_active_normal I06"></a></td>
                                                <td><a href="javascript:;" id="I07" name="I07" class="preCheck_ico btn_iList ico_active_normal I07"></a></td>
                                                <td><a href="javascript:;" id="I08" name="I08" class="preCheck_ico btn_iList ico_active_normal I08"></a></td>
                                                <td><a href="javascript:;" id="I09" name="I09" class="preCheck_ico btn_iList ico_active_normal I09"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;" id="I10" name="I10" class="preCheck_ico btn_iList ico_active_normal I10"></a></td>
                                                <td><a href="javascript:;" id="I11" name="I11" class="preCheck_ico btn_iList ico_active_normal I11"></a></td>
                                                <td><a href="javascript:;" id="I12" name="I12" class="preCheck_ico btn_iList ico_active_normal I12"></a></td>
                                                <td><a href="javascript:;" id="I13" name="I13" class="preCheck_ico btn_iList ico_active_normal I13"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;" id="I14" name="I14" class="preCheck_ico btn_iList ico_active_normal I14"></a></td>
                                                <td><a href="javascript:;" id="I15" name="I15" class="preCheck_ico btn_iList ico_active_normal I15"></a></td>
                                                <td><a href="javascript:;" id="I16" name="I16" class="preCheck_ico btn_iList ico_active_normal I16"></a></td>
                                                <td><a href="javascript:;" id="I17" name="I17" class="preCheck_ico btn_iList ico_active_normal I17"></a></td>
                                                <td><a href="javascript:;" id="I18" name="I18" class="preCheck_ico btn_iList ico_active_normal I18"></a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="right_areaStyle" style="width:66%;">
                                <div class="table_form table_form_btn">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:20%;">
                                            <col style="width:20%;">
                                            <col style="width:20%;">
                                            <col style="width:20%;">
                                            <col style="width:20%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td><button type="button" id="J01" name="J01" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="global.lbl.clockLine" /></button></td><!--혼  -->
                                                <td><button type="button" id="J02" name="J02" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.lever" /></button></td><!--방향레버  -->
                                                <td><button type="button" id="J03" name="J03" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.dashBoard" /></button></td><!--대시보드  -->
                                                <td><button type="button" id="J04" name="J04" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.monitor" /></button></td><!--모니터  -->
                                                <td><button type="button" id="J05" name="J05" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.audio" /></button></td><!--오디오  -->
                                            </tr>
                                            <tr>
                                                <td><button type="button" id="J07" name="J07" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.trunk" /></button></td><!--트렁크  -->
                                                <td><button type="button" id="J08" name="J08" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.cigarJack" /></button></td><!--시가잭  -->
                                                <td><button type="button" id="J09" name="J09" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.gearHander" /></button></td><!--기어핸들  -->
                                                <td><button type="button" id="J10" name="J10" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.parkingBrake" /></button></td><!--주차브레이크  -->
                                                <td><button type="button" id="J11" name="J11" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.insideBackMirror" /></button></td><!--내부백미러  -->
                                            </tr>
                                            <tr>
                                                <td><button type="button" id="J14" name="J14" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.sunroof" /></button></td><!--선루프  -->
                                                <td><button type="button" id="J15" name="J15" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.leftFrontSash" /></button></td><!--창문(좌앞)  -->
                                                <td><button type="button" id="J16" name="J16" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="global.lbl.rightFrontSash" /></button></td><!--창문(우앞)  -->
                                                <td><button type="button" id="J17" name="J17" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.leftAfterSash" /></button></td><!--창문(좌뒤)  -->
                                                <td><button type="button" id="J18" name="J18" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.rightAfterSash" /></button></td><!--창문(우뒤)  -->
                                            </tr>
                                            <tr>
                                                <td><button type="button" id="J23" name="J23" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.belt" /></button></td><!--밸트  -->
                                                <td><button type="button" id="J19" name="J19" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.leftFrontSeat" /></button></td><!--좌석(좌앞)  -->
                                                <td><button type="button" id="J20" name="J20" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="global.lbl.rightFrontSeat" /></button></td><!--좌석(우앞)  -->
                                                <td><button type="button" id="J21" name="J21" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.leftAfterSeat" /></button></td><!-- 좌석(좌뒤) -->
                                                <td><button type="button" id="J22" name="J22" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.rightAfterSeat" /></button></td><!-- 좌석(우뒤) -->
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><button type="button" id="J13" name="J13" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.tire" /></button></td><!--바퀴및타이어  -->
                                                <td><button type="button" id="J12" name="J12" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.ovmTool" /></button></td><!-- OVM공구 -->
                                                <td><button type="button" id="J06" name="J06" class="btn_s btn_s_v4 preChk btn_jList btn_active_normal"><spring:message code="ser.lbl.airCon" /></button></td><!--에어컨  -->
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //Dashboard 검사/내부검사 -->

                    <!-- 외부검사 -->
                    <div class="mt0" style="height:205px;">
                        <div style="overflow:hidden;">
                            <div class="left_areaStyle" style="width:65%;">
                                <div class="table_form table_form_btn table_form_img">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="ac bol_none carChkImg">
                                                    <div>
                                                        <img src="<c:url value='/resources/img/wa/img_carbody_r.png'/>" alt="" style="width: 306px; height: 250px;">
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="right_areaStyle" style="width:35%;">
                                <div class="table_form table_form_btn">
                                      <div class="carBody_btn" style="margin-top: 25px;">
                                        <%-- <p class="carBody_txt"><spring:message code="ser.info.terrorType" /></p><!--파손유형을 선택하세요.--> --%>
                                        <button type="button" id="checkErrType01" name="check_errType" class="btn_cb btn_scratch"><em></em><spring:message code="wa.lbl.scratch" /></button><!--긁힘-->
                                        <button type="button" id="checkErrType02" name="check_errType" class="btn_cb btn_damage"><em></em><spring:message code="wa.lbl.destroy" /></button><!--파손-->
                                        <button type="button" id="checkErrType03" name="check_errType" class="btn_cb btn_hollow"><em></em><spring:message code="wa.lbl.dug" /></button><!--움폭 파임-->
                                        <br>
                                        <button type="button" id="checkErrType04" name="check_errType" class="btn_cb btn_paint"><em></em><spring:message code="wa.lbl.paintbad" /></button><!--페인트벗겨짐-->
                                        <button type="button" id="checkErrType05" name="check_errType" class="btn_cb btn_crack"><em></em><spring:message code="ser.lbl.crack" /></button>
                                        <button type="button" id="checkErrType06" name="check_errType" class="btn_cb btn_other"><em></em><spring:message code="global.lbl.other" /></button><!--기타-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 엔진룸  검사 -->
                    <div class="mt0" style="height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:16%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:16%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td><button type="button" id="K01" name="K01" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.enginOilPosition" /></button></td> <!-- 엔진오일위치 -->
                                        <td><button type="button" id="K02" name="K02" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.enginOilQuality" /></button></td> <!-- 엔진오일품질 -->
                                        <td><button type="button" id="K03" name="K03" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.enginCoolant" /></button></td> <!-- 엔진coolant -->
                                        <td><button type="button" id="K04" name="K04" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.breakOil" /></button></td> <!-- 제동기오일 -->
                                        <td><button type="button" id="K05" name="K05" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.powerSteeringOil" /></button></td> <!-- Power steering 오일 -->
                                        <td><button type="button" id="K06" name="K06" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.screenWash" /></button></td> <!--워셔액 -->
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="K07" name="K07" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.airConditioner" /></button></td> <!-- 에어컨 -->
                                        <td><button type="button" id="K08" name="K08" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.radiator" /></button></td> <!-- 라디에이터 -->
                                        <td><button type="button" id="K09" name="K09" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.battery" /></button></td> <!-- 배터리 -->
                                        <td><button type="button" id="K10" name="K10" class="btn_s btn_s_v4 preChk btn_kList btn_active_normal"><spring:message code="ser.lbl.driveBelt" /></button></td> <!-- drive belt -->
                                        <!-- <td><input id="enginRoomEtcCont" name="enginRoomEtcCont" type="text" class="form_input form_input2" data-json-obj="true" /></td> 기타 -->
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //엔진룸 검사 -->

                    <!-- 조명검사 -->
                    <div class="mt0" style="height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:16%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:16%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td><button type="button" id="M01" name="M01" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.frontLightS" /></button></td> <!-- 전조등(하향) -->
                                        <td><button type="button" id="M02" name="M02" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.frontLightL" /></button></td> <!-- 전조등(상향) -->
                                        <td><button type="button" id="M03" name="M03" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.frontLightF" /></button></td> <!-- 전조등(점멸) -->
                                        <td><button type="button" id="M04" name="M04" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.frontFogLight" /></button></td> <!-- 앞안개등 -->
                                        <td><button type="button" id="M05" name="M05" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.frontTurnLeft" /></button></td> <!-- 앞방향등(좌,우) -->
                                        <td><button type="button" id="M19" name="M19" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.frontTurnLight" /></button></td> <!-- 앞방향등(좌,우) -->

                                    </tr>
                                    <tr>
                                        <td><button type="button" id="M07" name="M07" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.rearFogLight" /></button></td> <!-- 후방안개등 -->
                                        <td><button type="button" id="M08" name="M08" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.reverseLight" /></button></td> <!-- 후진등 -->
                                        <td><button type="button" id="M09" name="M09" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.plateLight" /></button></td> <!-- 번호판등 -->
                                        <td><button type="button" id="M10" name="M10" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.brakeLight" /></button></td> <!-- 제동등 -->
                                        <td><button type="button" id="M11" name="M11" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.rearTurnLeft" /></button></td> <!-- 뒤방향등(좌) -->
                                        <td><button type="button" id="M20" name="M20" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.rearTurnLight" /></button></td> <!-- 뒤방향등(우) -->
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="M13" name="M13" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.readLight" /></button></td> <!-- 독서등 -->
                                        <td><button type="button" id="M14" name="M14" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.makeupLight" /></button></td> <!-- 화장거울등(옵션) -->
                                        <td><button type="button" id="M15" name="M15" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.gloveboxLight" /></button></td> <!-- 글러브박스등 -->
                                        <td><button type="button" id="M16" name="M16" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.insideLight" /></button></td> <!-- 실내천장등 -->
                                        <td><button type="button" id="M17" name="M17" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.dashBTurnLight" /></button></td> <!-- 계기판 지시등 -->
                                        <td><button type="button" id="M18" name="M18" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.trunkLight" /></button></td> <!-- 트렁크등 -->
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="M06" name="M06" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.sideLight" /></button></td> <!--차폭등 -->
                                        <td><button type="button" id="M12" name="M12" class="btn_s btn_s_v4 preChk btn_mList btn_active_normal"><spring:message code="ser.lbl.alertLight" /></button></td> <!-- 위험경고등 -->
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //조명검사 -->


                    <!-- 하부검사 -->
                    <div class="mt0" style="height:262px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:16%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:17%;">
                                    <col style="width:16%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td><button type="button" id="N01" name="N01" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal "><spring:message code="ser.lbl.underWOleak" /></button></td> <!-- 하부누수및누유현상 -->
                                        <td><button type="button" id="N02" name="N02" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.tierodConD" /></button></td> <!-- 조향장치상태 -->
                                        <td><button type="button" id="N03" name="N03" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.tierodCoverConD" /></button></td> <!-- 타이로드 먼지커버상태 -->
                                        <td><button type="button" id="N04" name="N04" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.tierodChainLConD" /></button></td> <!-- 타이로드 체인링크상태 -->
                                        <td><button type="button" id="N05" name="N05" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.tierodLowerAConD" /></button></td> <!-- 타이로드 로어암 -->
                                        <td><button type="button" id="N06" name="N06" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.driveCovConD" /></button></td> <!-- 구동축과 먼지커버상태 -->
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="N07" name="N07" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.missionBerConD" /></button></td> <!-- 변속기및 베어링상태 -->
                                        <td><button type="button" id="N08" name="N08" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.frontSusConD" /></button></td> <!-- 앞현가장치(링크, 볼조인트) -->
                                        <td><button type="button" id="N09" name="N09" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.rearSusConD" /></button></td> <!-- 앞현가장치(링크, 볼조인트) -->
                                        <td><button type="button" id="N10" name="N10" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.damperConD" /></button></td> <!-- 댐퍼상태  -->
                                        <td><button type="button" id="N11" name="N11" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.susBoltConD" /></button></td> <!-- 현가장비볼트상태 -->
                                        <td><button type="button" id="N12" name="N12" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.mufflerConD" /></button></td> <!-- 배기관설치 -->
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="N13" name="N13" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.carbonCaniConD" /></button></td> <!-- 활성캐니스터상태 -->
                                        <td><button type="button" id="N14" name="N14" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.brkLineConD" /></button></td> <!-- 브레이크라인,호스 연결부 -->
                                        <td><button type="button" id="N15" name="N15" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.brkpistonConD" /></button></td> <!-- 브레이크 피스톤및 볼트 -->
                                        <td><button type="button" id="N16" name="N16" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.diskBrkConD" /></button></td> <!-- 디스크 브레이크상태 -->
                                        <td><button type="button" id="N17" name="N17" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.brkPadConD" /></button></td> <!-- 브레이크패드 마모 및 손상 -->
                                        <td><button type="button" id="N18" name="N18" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.wheelConD" /></button></td> <!-- 휠상태 -->
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="N19" name="N19" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.tireConD" /></button></td> <!-- 타이어마모 및 손상 (트레드) -->
                                        <td><button type="button" id="N20" name="N20" class="btn_s btn_s_v4 preChk btn_nList btn_active_normal"><spring:message code="ser.lbl.tireairConD" /></button></td> <!-- 타이어 공기압 검사 -->
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //하부검사 -->

                    <!-- 수리건의-->
                    <div class="mt0" style="height:261px;">
                        <div class="mt10">
                        <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrSuggest.jsp" />
                        </div>
                    </div>
                    <!-- //수리건의 -->

                </div>
                <!-- //탭메뉴 전체 영역 -->
                <div class="table_form mt10" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:88%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preChkRemark" /><!-- 고객의견 --></th>
                                <td>
                                    <input type="text" id="remark" name="remark" maxlength="330" class="form_input" data-json-obj="true" />
                                </td>
                                <td class="ar"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <input type="hidden" id="tecId" name="tecId" data-json-obj="true" />
            <input type="hidden" id="tecNm" name="tecNm" data-json-obj="true" />
            <input type="hidden" id="saId" name="saId" data-json-obj="true" />
            <input type="hidden" id="saNm" name="saNm" data-json-obj="true" />
            <input type="hidden" id="roGrpNo" name="roGrpNo" data-json-obj="true" />
            <input type="hidden" id="roDocNo" name="roDocNo" /><!-- RO번호 (신규)-->
            <input type="hidden" id="resvDocNo" name="resvDocNo" data-json-obj="true" /><!-- 예약번호 -->
            <input type="hidden" id="custRemark" name="custRemark" data-json-obj="true" /><!-- 고객의견 -->

        </form>
        <!-- //사전점검번호 -->
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11592" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnPwaHistPopup" class="btn_m btn_link" disabled>PWA</button><!-- PWA -->
                </dms:access>
                <dms:access viewId="VIEW-D-11593" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_roCreate btn_s_min5" id="btnRoReq" disabled><spring:message code="ser.btn.roInsert"/></button><!--RO-->
                </dms:access>
            </div>
        </div>
    </div>
</div>
<!-- 우측 메뉴 간반보드 공통 페이지 -->
<c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp" />
<!-- 우측 메뉴 간반보드 공통 페이지 -->

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">

var pdiChkList = [];
<c:forEach var="obj" items="${pdiChkList}">
pdiChkList.push({"chkCd":"${obj.carChkAtcCd}", "chkTpCd":"${obj.carTpCd}"});
</c:forEach>

var diagStatCdList = [];
<c:forEach var="obj" items="${diagStatCdList}">
diagStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

//고객전화표시여부
var custTelYnValue;
<c:forEach var="obj" items="${custTelYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    custTelYnValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

var selectTabId = "CQ";
var isTablet="${isTablet}";

var sysDate = new Date("<c:out value='${sysDate}' />");

var defaultImgUrl = '<img src="<c:url value='/resources/img/wa/img_carbody_r.png'/>" style="width:306px;" alt="">';

var imageSearchPopupWin;


//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});


$(document).ready(function() {


    // RO유형
    roTpCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(roTpCdArr[val] != undefined)
         returnVal = roTpCdArr[val].cmmCdNm;
     }
     return returnVal;
    };

    $(".oil_25p").addClass("oil_active1");


   /********************** 초기 데이터  설정 ***************************/


    //공통코드:정비유형(수리유형)
    var lbrTpCdList  = []; //기본 수리유형
    var lbrTpCdList2 = []; //보증수리용 수리유형
    var lbrTpCdList3 = []; //딜러 공임 전용 수리유형
    var lbrTpCdList4 = []; //BHMC 공임 전용 수리유형
    <c:forEach var="obj" items="${lbrTpCdList}">
        <c:if test="${obj.remark1 eq '02'}">
            lbrTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        <c:if test="${obj.remark2 eq 'E'}">
            lbrTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        lbrTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

    //공통코드:예약상태
    var resvStatList = [];
    <c:forEach var="obj" items="${resvStatDs}">
    resvStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var resvStatMap = dms.data.arrayToMap(resvStatList, function(obj){return obj.cmmCd;});


    // 정비유형(수리유형)
    lbrTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(lbrTpCdArr[val] != undefined)
            returnVal = lbrTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

    // 예약상태
    setResvStatMap= function(value){
        var resultVal = "";
        if( dms.string.isNotEmpty(value)){
            if(resvStatMap[value] != undefined)
            resultVal = resvStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //공통코드:입고점검유형
    var carAcptTpList = [];
    <c:forEach var="obj" items="${carAcptTp}">
    <c:if test="${obj.useYn eq 'Y'}">
    carAcptTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    </c:forEach>
    var carAcptTpMap = dms.data.arrayToMap(carAcptTpList, function(obj){return obj.cmmCd;});


    // 입고점검유형
    setCarAcptTpMap = function(value){
        var resultVal = "";
        if( dms.string.isNotEmpty(value)){
            if(carAcptTpMap[value] != undefined)
            resultVal = carAcptTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //입고유형 dropDownList
    $("#carAcptTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carAcptTpList
        ,change:function(e){
            var selectVal = this.value();
            if(selectVal == '02'){
                var diagStatCd = $("#diagStatCd").data("kendoExtDropDownList").value();
                if(dms.string.strNvl(diagStatCd) === "O"){
                    $(".btn_roCreate").data("kendoButton").enable(true);
                }
            } else {
                $(".btn_roCreate").data("kendoButton").enable(false);
            }
        }
    });

    //사전점검상태 dropDownList
    $("#diagStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:diagStatCdList
        ,optionLabel : " "
    });

    /********************** 초기 데이터  설정 ***************************/

    /****************** 버튼 이벤트 ***********************/

    goPreChkStatus = function(){
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.preCheckList'/>", "<c:url value='/ser/ro/preCheck/selectPreCheckListMain.do'/>", "VIEW-D-10334"); // 사전점검현황
    };

    /** 저장 데이터  **/
    function requestSaveData(status){

        var validator = $("#kendoPreCheckForm").kendoExtValidator().data("kendoExtValidator");

        if( $("#vinNo").val() == "" ) {
             dms.notification.success("<spring:message code='ser.lbl.vinNo' var='carInfo' /><spring:message code='global.info.emptyParamInfo' arguments='${carInfo}' />");
             return false;
        }

        var tabParams = [];
        var params = [];
        var tDstinCd= "",tDstinNm= "",tChkCd= "",tChkCdNatNm= "" ,tRsltGradeCd= "" , tRsltGradeNm="",tRsltVal="";

        // PDI 점검리스트
        // TAB 별로 각각의 ROW 로 저장 하기 위하여 사용 한다.
        $.each(pdiChkList , function (i , pdiChk){

         var tabId = pdiChk.chkCd.substr(0,1) ; // 탭의 아이디 앞지리
         var rowCnt = 0;
            // 선택 버튼만 루프
            $.each($(".btn_active_normal ,.btn_active_warning ,.btn_active_error , .ico_active_normal, .ico_active_warning"
                    +", .ico_active_error, .oil_active0, .oil_active2, .oil_active3, .oil_active4")
                    , function ( j  , obj){

                var distinCd = pdiChk.chkTpCd;               //구분코드
                var distinNm = dms.string.trim($("#"+pdiChk.chkTpCd).text()); //구분명
                var chkCd = (obj.id.substr(0,2)+"0"); //점검코드:I00 , J00 , K00 , M00 , N00 , Z00
                var chkCdNatNm = dms.string.trim($("#"+ (obj.id.substr(0,2)+"0")).text() );//점검코드현지명
                var rsltGradeCd = obj.id;               //결과등급코드
                var rsltGradeNm = dms.string.trim($("#"+obj.id).text()); //결과등급명
                var rsltVal = "";                       //버튼 상태 값(정상:N , 주의:W , 이상:E )
                var subTabId =  chkCd.substr(0,1);

                var objName = obj.className;
                //신호등 버튼 결과값 세팅
                // 정상:N , 주의:W , 이상:E
                if(objName.indexOf("btn_active_normal") > 0 || objName.indexOf("ico_active_normal") > 0 ){
                   rsltVal = "N";
                }else if(objName.indexOf("btn_active_warning") > 0 || objName.indexOf("ico_active_warning") > 0 ){
                   rsltVal = "W";
                }else if(objName.indexOf("btn_active_error") > 0 || objName.indexOf("ico_active_error") > 0 ){
                   rsltVal = "E";
                }else if(objName.indexOf("oil_active") >= 0){
                    var objLength = objName.length;
                    rsltVal =  objName.substr(objLength-1,objLength);
                }

                //버튼을 Tab 별로 담는다.
                if( tabId == subTabId){
                    if(rowCnt == 0 ){
                        tDstinCd = pdiChk.chkTpCd;
                        tDstinNm =  $("#"+pdiChk.chkTpCd).text();
                        tChkCd = chkCd;
                        tChkCdNatNm = chkCdNatNm;
                        tRsltGradeCd = rsltGradeCd;
                        tRsltGradeNm = rsltGradeNm;
                        tRsltVal = rsltVal;
                    } else{
                        tRsltGradeCd += ("|" + rsltGradeCd) ;
                        tRsltGradeNm += ("|" + rsltGradeNm) ;
                        tRsltVal += ("|" + rsltVal );
                    }
                    rowCnt++;

                }
            });//선택 버튼 루프

            if(rowCnt > 0){
                tabParams.push({
                    dstinCd:tDstinCd
                   ,dstinNm:tDstinNm
                   ,chkCd:tChkCd
                   ,chkCdNatNm:tChkCdNatNm
                   ,rsltGradeCd:tRsltGradeCd
                   ,rsltGradeNm:tRsltGradeNm
                   ,rsltVal:tRsltVal
                 });
            }
        }); //PDI 점검리스트


        var formSaveData = $("#preChkForm").serializeObject($("#preChkForm").serializeArrayInSelector("[data-json-obj='true']"));
        formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
        formSaveData.carAcptTp = $("#carAcptTp").data("kendoExtDropDownList").value();
        formSaveData.diagStatCd = status;

        if(formSaveData.carAcptTp == "02"){
            if($("#carOwnerId").val() == "" || $("#driverId").val() == ""){
                var message = "<spring:message code='ser.lbl.carOwner' />, "+"<spring:message code='ser.lbl.vsitr'/>";
                dms.notification.info("<spring:message code='global.info.required.field' arguments='"+message+"' />");
                return false;
            }
        }

        var params =  $.extend(
                 {"preCheckVO":formSaveData}
                ,{"preCheckDetailVO":tabParams}
                ,{"trobleDescVO":trobleDescParam()}
                ,{"custDemandListVO":custDemandParam()}
                ,{"etcIssueListVO":null}
                ,{"servicePartListVO":null}
                ,{"serviceLaborListVO":null}
                ,{"lbrSuggestListVO":getLbrSuggestData()}
        );

        $.ajax({
            url:"<c:url value='/ser/ro/preCheck/multiPreChecks.do' />"
            ,data:JSON.stringify(params)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result , textStatus){
                $("#diagDocNo").val(result);
                var data = {vinNo:$("#vinNo").val(), diagDocNo:$("#diagDocNo").val()};
                detailSet(data, false, 'N');
                btnControll("U"); //버튼 세팅
                dms.notification.success("<spring:message code='global.info.success' />");
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        }); //ajax
    };

    /** 버튼 세팅 **/
    btnControll = function(status){

        var statCd = $("#diagStatCd").data("kendoExtDropDownList").value();
        if(dms.string.strNvl(statCd) == ""){
            if(status == "U") {
                $("#btnModify").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                //$("#moveRepair").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
                $("#btnRoReq").data("kendoButton").enable(false);
            } else {
                $("#btnModify").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#btnPwaHistPopup").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                //$("#moveRepair").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
                $("#btnRoReq").data("kendoButton").enable(false);
            }
        } else {
            if(statCd == "O"){
                $("#btnModify").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnPrint").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                //$("#moveRepair").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
                $("#btnRoReq").data("kendoButton").enable(true);
            } else if(statCd == "F"){
                $("#btnModify").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                //$("#moveRepair").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
                $("#btnRoReq").data("kendoButton").enable(true);
            } else if(statCd == "C"){
                $("#btnModify").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                //$("#moveRepair").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
                $("#btnRoReq").data("kendoButton").enable(false);
            }
        }

    };

    /**************** 입고 점검 정보 ********************/

    $("#diagDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#diagDocNo").val()) != ""){
            e.preventDefault();
            var data = {"diagDocNo":$("#diagDocNo").val()};
            detailSet(data, false);
        }
    });

    /* 사전 점검 정보 */
    detailSet = function(data, slide, clearYn){
        if(clearYn == undefined){
            initAll();
        }

        $.ajax({
            url:"<c:url value='/ser/ro/preCheck/selectPreCheckByKey.do' />"
            ,data:JSON.stringify({sVinNo:data.vinNo, sDiagDocNo:data.diagDocNo })
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(dms.string.strNvl(result.diagDocNo) == ""){
                    dms.notification.info("<spring:message code='ser.lbl.preChkInfo' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                } else {
                    if(slide){
                        slidePlay1();
                    }
                    getCustInfo(result, "N");
                    getPreCheckInfoSet(result);
                    getReservePreCheckDetailInfo(result);
                    /*liuxueying update 接车检查回显预约单的 项目 start*/
                    if(result.resvDocNo != '' && result.resvDocNo!=null){
	                    partInfo(result.resvDocNo, "RE");          // 부품(selectPartList.jsp)
	                    lbrInfo(result.resvDocNo, "RE");
	                    lbrSuggestSet(result.resvDocNo, "RE");
                    }
                    /*liuxueying update 接车检查回显预约单的 项目 end*/
                    tabInfoSet(result.diagDocNo, "${preFixId}")
                    btnControll(result.diagStatCd);
                }
            }
        });
    };

    /* 삭제후  예약 사전 점검 정보 */
    getDeletePreCheckInfo = function(){
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectReservePreCheckInfos.do' />"
            ,data:JSON.stringify({sVinNo:$("#vinNo").val()})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result.total > 0){
                    getPreCheckInfoSet(result.data[0]);
                    getReservePreCheckDetailInfo(result.data[0]);
                }
            }
        });
    };

    /* 사전 점검 상세 정보 */
    getReservePreCheckDetailInfo = function(data){

        $.ajax({
            url:"<c:url value='/ser/ro/preCheck/selectReserveDetailInfoByKey.do' />"
            ,data:JSON.stringify({sVinNo:data.vinNo ,sDiagDocNo:data.diagDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                     if(result.total > 0){
                       getPreCheckToggleSet(result);
                       //btnControll("U"); //버튼 세팅
                    }
                }
            }
        });
    };

    /* 입고점검 정보 세팅*/
    getPreCheckInfoSet = function(result){

        $("#diagStatCd").data("kendoExtDropDownList").value(result.diagStatCd);
        $("#diagDocNo").val(dms.string.strNvl(result.diagDocNo));
        $("#remark").val(dms.string.strNvl(result.remark));
        $("#custRemark").val(dms.string.strNvl(result.custRemark));
        $("#resvDocNo").val(dms.string.strNvl(result.resvDocNo));
        $("#serResvStartDt").val(result.serResvStartDt);
        $("#tecId").val(dms.string.strNvl(result.tecId));
        $("#tecNm").val(dms.string.strNvl(result.tecNm));
        $("#saId").val(dms.string.strNvl(result.saId));
        $("#saNm").val(dms.string.strNvl(result.saNm));
        $("#roGrpNo").val(dms.string.strNvl(result.roGrpNo));
        $("#regUsrNm").val(dms.string.strNvl(result.regUsrNm));

        $("#hpNo").val(dms.string.strNvl(result.hpNo));
        $("#cauCd1").val(dms.string.strNvl(result.cauCd1));
        $("#cauNm1").val(dms.string.strNvl(result.cauNm1));
        $("#phenCd1").val(dms.string.strNvl(result.phenCd1));
        $("#phenNm1").val(dms.string.strNvl(result.phenNm1));
        $("#cauCd2").val(dms.string.strNvl(result.cauCd2));
        $("#cauNm2").val(dms.string.strNvl(result.cauNm2));
        $("#phenCd2").val(dms.string.strNvl(result.phenCd2));
        $("#phenNm2").val(dms.string.strNvl(result.phenNm2));
        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
        $("#carAcptTp").data("kendoExtDropDownList").value(dms.string.strNvl(result.carAcptTp));
        getCarExtBodyImages(result.fileKeyNm2);

    };

    //화면로딩시 사진이미지 슬라이딩 데이터 취득
    function getCarExtBodyImages(fileKeyNm){
        var fileParam = {};
        fileParam["sFileDocNo"] = fileKeyNm;
        $.ajax({
            url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                ,data:JSON.stringify(fileParam)      //파라미터
                ,type:'POST'                        //조회요청
                ,dataType:'json'                  //json 응답
                ,contentType:'application/json'   //문자열 파라미터
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
        }).done(function(body) {
            var rows = body.data;
            var fileDocNo = "";
            var fileNo = "";
            var curLi = "";
            var imgUrl = "";
            var popupImgUrl = "";
             if ( rows.length > 0 ) {
                $.each(rows, function(index, row) {
                    //링크 URL
                    curUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo=" + row.fileDocNo + "&fileNo=" + row.fileNo + "&inline=true";
                    //이미지  로직
                    imgUrl = '<img src="'+curUrl+'" style="width:306px;" alt="">';
                    //popupImgUrl = '<img src="'+curUrl+'" alt="">'; khskhs 이미지가 커져서 팝업은 필요 없어짐
                });
                //$("#extImageUrl").val(popupImgUrl); khskhs 이미지가 커져서 팝업은 필요 없어짐
                $(".carChkImg").html(imgUrl);
            }else{

                $(".carChkImg").html(defaultImgUrl);
            }
        });
    }

    /**   data setting **/
    getPreCheckToggleSet = function(result){

        var resultList = [];
        $.each(result.data , function ( i , obj){

            if( dms.string.strNvl( obj.rsltGradeCd ) != ""){
                var rsltGradeCdList = obj.rsltGradeCd.split("|") ;
                var rsltValList = obj.rsltVal.split("|") ;

                $.each(rsltGradeCdList , function (j , rsltGradeCd){
                    var rsltVal = rsltValList[j];
                    var cssId = "";
                    $("#"+rsltGradeCd).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    $("#"+rsltGradeCd).removeClass("btn_active_normal btn_active_warning btn_active_error");

                    if( obj.chkCd == "I00"){ //이미지 버튼

                        if(rsltVal == "N"){

                            cssId = "ico_active_normal";
                            $("#"+rsltGradeCd).addClass(cssId);

                        }else if(rsltVal == "W"){

                            cssId = "ico_active_warning";
                            $("#"+rsltGradeCd).addClass(cssId);

                        }else if(rsltVal == "E"){

                            cssId = "ico_active_error";

                            $("#"+rsltGradeCd).addClass(cssId);

                        }else if(dms.string.isNotEmpty(rsltVal)){

                            $("#"+rsltGradeCd).addClass("oil_active"+rsltVal);
                        }
                    }else{

                        if(rsltVal == "N"){

                            cssId = "btn_active_normal";
                            $("#"+rsltGradeCd).addClass(cssId);

                        } else if(rsltVal == "W") {

                            cssId = "btn_active_warning";
                            $("#"+rsltGradeCd).addClass(cssId);
                            $("#"+rsltGradeCd).removeClass("btn_active_normal");

                        } else if(rsltVal == "E") {

                            cssId = "btn_active_error";
                            $("#"+rsltGradeCd).addClass(cssId);
                            $("#"+rsltGradeCd).removeClass("btn_active_normal");

                        }
                    }
                });
            }
        });
    };

    /**************** 예약 사전 점검 정보 ********************/


    /****************** 버튼 이벤트 ***********************/

    $(".btn_roCreate").kendoButton({

        click:function(e){

            $("#messageId").html("<spring:message code='ser.info.moveRoMenu'/>" );

            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){

                if($(this).hasClass("yes")){
                        // 특수문자 encode
                        var remark = $("#remark").val();
                        remark = replaceAll(remark, "#", "%23");
                        remark = replaceAll(remark, "%", "%25");
                        remark = replaceAll(remark, "&", "%26");

                        var param="?vinNo="+$("#vinNo").val();
                        param +="&carId="+$("#carId").val();
                        param +="&diagDocNo="+$("#diagDocNo").val();
                        param +="&resvDocNo="+$("#resvDocNo").val();
                        param +="&runDistVal="+$("#runDistVal").val();
                        param +="&roGrpNo="+$("#roGrpNo").val();
                        param +="&carAcptTp="+$("#carAcptTp").data("kendoExtDropDownList").value();
                        param +="&infoType=PC"
                        param +="&remark="+remark;

                        conformKendoWindow.close();
                        return parent._createOrReloadTabMenu('<spring:message code="ser.menu.roCreate" />'
                                ,"<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do"+param+"'/>", "VIEW-D-10337");

                }
                conformKendoWindow.close();
            }).end();
        }
    });


    /** 수정 **/
    $("#btnModify").kendoButton({

        click:function(e){

            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
            var carRunDistVal = $("#carRunDistVal").data("kendoExtNumericTextBox").value();

            if(runDistVal <= 0) {
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#runDistVal").focus();
                return false;
            }

            if(runDistVal < carRunDistVal) {
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#runDistVal").focus();
                return false;
            }

            if(runDistVal - carRunDistVal >= 10000) {

                $("#messageId").html("<spring:message code='ser.info.distValConfirm'/>" );
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            requestSaveData("O");
                        }
                        conformKendoWindow.close();
                    }).end();

            }else{
                requestSaveData("O");
            }


        }
    });

    /** 삭제 **/
    $("#btnCancel").kendoButton({

        click:function(e){

            preChkCancelPopup = dms.window.popup({
                windowId:"preChkCancelPopup"
                , title:"<spring:message code='ser.lbl.preInsCanc'/>"   // 사전점검취소
                , width:400
                , height:200
                , content:{
                    url:"<c:url value='/ser/ro/preCheck/selectPreCheckCancelPopup.do'/>"
                    ,data:{
                        "diagDocNo":$("#diagDocNo").val()
                        ,"callbackFunc":function(){
                            dms.notification.success("<spring:message code='ser.lbl.preCheck' var='resv' /><spring:message code='global.info.cancelSuccessParam' arguments='${resv}' />");
                            var data = {vinNo:$("#vinNo").val(), diagDocNo:$("#diagDocNo").val()};
                            detailSet(data, false);
                            btnControll("C"); //버튼 세팅
                        }
                    }
                }
            });
        }
    });

    /** 프린터 **/
    $("#btnPrint").kendoButton({
        click:function(e){
            $.ajax({
                url:"<c:url value='/ser/ro/preCheck/updatePreCheck.do' />"
                ,data:JSON.stringify({"diagDocNo":$("#diagDocNo").val(), "printYn":"Y"})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){

                }
            });
            parent._createOrReloadTabMenu("<spring:message code='ser.lbl.preChkDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectPreCheckPrintMain.cpt'/>&locale=zh&sDiagDocNo="+$("#diagDocNo").val()+"&sDlrCd=${dlrCd}&sTelShowYn="+custTelYnValue); // RO Main
        }
    });

    /** PWA 이력**/
    $("#btnPwaHistPopup").kendoButton({
        click:function(e){

            parent._createOrReloadTabMenu("<spring:message code='ser.menu.pwaReqMng'/>", "<c:url value='/ser/wac/pwaReq/selectPwaRequestMain.do'/>?vinNo="+$("#vinNo").val()+
                    "&diagDocNo="+$("#diagDocNo").val()+
                    "&infoType=PC", "VIEW-D-10352"); // PWA신청
        }

    });

    /** 전부정상 **/
    $("#allNormal").kendoButton({
        click:function(e){

            if(selectedTabId == "C1") {

                $.each($(".btn_iList"), function (j, obj){ // 선택한 toggle 리스트 loop
                    $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    //$("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    $("#"+obj.id).addClass("ico_active_normal");
                });
                $.each($(".btn_jList"), function (j, obj){ // 선택한 toggle 리스트 loop
                    $("#"+obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                    $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    $("#"+obj.id).addClass("btn_active_normal");
                });

            } else if(selectedTabId == "C3") {

                $.each($(".btn_kList"), function (j, obj){ // 선택한 toggle 리스트 loop
                    $("#"+obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                    $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    $("#"+obj.id).addClass("btn_active_normal");
                });

            } else if(selectedTabId == "C4") {

                $.each($(".btn_mList"), function (j, obj){ // 선택한 toggle 리스트 loop
                    $("#"+obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                    $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    $("#"+obj.id).addClass("btn_active_normal");
                });

            } else if(selectedTabId == "C5") {

                $.each($(".btn_nList"), function (j, obj){ // 선택한 toggle 리스트 loop
                    $("#"+obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
                    $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
                    $("#"+obj.id).addClass("btn_active_normal");
                });
            }
        }
    });

    $("#tabstrip, #tabstrip2").kendoExtTabStrip({
         animation:false
        ,select:function(e){

            selectedTabId = e.item.id;
            var kendoTab = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
            /*liuxueying update 接车检查回显预约单的项目 初始化时清空start*/
            if(selectedTabId == "CQ" || selectedTabId == "RD" || selectedTabId == "LS" ||  selectedTabId == "RP" ||  selectedTabId == "P"){
            /*liuxueying update 接车检查回显预约单的项目 初始化时清空end*/
                $("#btn_status_check").css("display","none");
            }else{
                $("#btn_status_check").css("display","block");
            }

            if(selectedTabId == "C2"){
                $("#allNormal").data("kendoButton").enable(false);
            } else {
                $("#allNormal").data("kendoButton").enable(true);
            }
        }
    });

    //button active
    $("#btn_status_check > .btn_m").click(function(){
        $("#btn_status_check > .btn_m").removeClass("btn_active");
        $(this).addClass("btn_active");
    });

    $(".btn_s.btn_s_v4.preChk").click(function(){
        if($(".btn_m_warning").hasClass("btn_active")){
            $(this).addClass("btn_active_warning");
            $(this).removeClass("btn_active_normal btn_active_error");
        }else if($(".btn_m_error").hasClass("btn_active")){
            $(this).addClass("btn_active_error");
            $(this).removeClass("btn_active_normal btn_active_warning");
        }else{
            $(this).addClass("btn_active_normal");
            $(this).removeClass("btn_active_warning btn_active_error");
        }
    });

    $(".preCheck_ico").click(function(){
        if($(".btn_m_warning").hasClass("btn_active")){
            $(this).removeClass("ico_active_normal ico_active_error");
            $(this).toggleClass("ico_active_warning");
        }else if($(".btn_m_error").hasClass("btn_active")){
            $(this).removeClass("ico_active_normal ico_active_warning");
            $(this).toggleClass("ico_active_error");
        }else{
            $(this).removeClass("ico_active_warning ico_active_error");
            $(this).toggleClass("ico_active_normal");
        }
    });
    /*
    $(".btn_s.btn_s_v4.preChk").click(function(){

        if($(".btn_m_warning").hasClass("btn_active")){

            $(this).removeClass("btn_active_normal btn_active_error");
            $(this).toggleClass("btn_active_warning");

        }else if($(".btn_m_error").hasClass("btn_active")){

            $(this).removeClass("btn_active_normal btn_active_warning ");
            $(this).toggleClass("btn_active_error");

        }else{
            //$(this).removeClass("btn_active_warning btn_active_error");
            //$(this).toggleClass("btn_active_normal");

            $(this).removeClass("btn_active_warning btn_active_error btn_active_normal");
            $(this).toggleClass("btn_active_normal");
        }
    });

    $(".preCheck_ico").click(function(){

        if($(".btn_m_warning").hasClass("btn_active")){

            $(this).removeClass("ico_active_normal ico_active_error ");
            $(this).toggleClass("ico_active_warning");

        }else if($(".btn_m_error").hasClass("btn_active")){

            $(this).removeClass("ico_active_normal ico_active_warning ");
            $(this).toggleClass("ico_active_error");

        }else if($(".btn_m_normal").hasClass("btn_active")){

            $(this).removeClass("ico_active_warning ico_active_error ico_active_normal");
            $(this).toggleClass("ico_active_normal");
        }

    });
 */
    $(".oiling_ico>div>a").click(function(){
        $(this).parent().removeClass().addClass("oil_active" + $(this).index());
    });

    /** 전체 필드 초기화 **/
    initAll = function(){
        $("#preChkForm").get(0).reset();
        $("#roDocNo").val("");
        $("#resvDocNo").val(""); //2021.2.18 update by tjx 初始化删除预约单号数据
        $("#allCampaignGrid").data("kendoExtGrid").dataSource.data([]);
        $("#serCampaignGrid").data("kendoExtGrid").dataSource.data([]);
        $("#custRemarkGrid").data("kendoExtGrid").dataSource.data([]);
        $("#resvKanbanGrid").data("kendoExtGrid").dataSource.data([]);
        $("#partResvKanbanGrid").data("kendoExtGrid").dataSource.data([]);
        $("#estKanbanGrid").data("kendoExtGrid").dataSource.data([]);
        $("#helpSvcKanbanGrid").data("kendoExtGrid").dataSource.data([]);
        $("#lbrSuggestGrid").data("kendoExtGrid").dataSource.data([]);
       // $("#bmPointGrid").data("kendoExtGrid").dataSource.data([{blueMembershipNo:"", bmMemberTp:"", consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]);
        $("#dlrPointGrid").data("kendoExtGrid").dataSource.data([{memberTp:"", membershipNo:"", gradeCd:"", lastPointVal:"", occrPointVal:"", cardNo:"", dlrUseAmt:"", dlrUsePurpose:""}]);
      //  $("#bmCupnGrid").data("kendoExtGrid").dataSource.data([{cardType:"", cardNo:"", couponBeginDate:"", couponEndDate:""}]);
        $("#dcGrid").data("kendoExtGrid").dataSource.data([]);

        $(".btn_s.btn_s_v4.troble").removeClass("btn_active");
        $(".sanbaoTabMsg").attr("style","color:#505050");

        $.each($(".btn_active_normal ,.btn_active_warning ,.btn_active_error , .ico_active_normal, .ico_active_warning , .ico_active_error")
                , function ( j  , obj){ // 선택한 toggle 리스트 loop
            $("#"+obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
            $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
        });

        $.each($(".preChk") , function ( j  , obj){ // 선택한 toggle 리스트 loop
            $("#"+obj.id).addClass("btn_active_normal");

        });

        $.each($(".btn_iList"), function (j, obj){ // 선택한 toggle 리스트 loop
            $("#"+obj.id).addClass("ico_active_normal");
        });

        $("#I01").removeClass().addClass("oil_active1");
        $(".btn_m_normal,.btn_m_warning,.btn_m_error").removeClass("btn_active");//ser.btn.normal
        $("#normal").addClass("btn_active");//ser.btn.normal
        $(".carChkImg").html(defaultImgUrl);
        $("#diagStatCd").data("kendoExtDropDownList").value("");
        /*liuxueying update 接车检查回显预约单的项目 初始化时清空start*/
        $("#lbrGrid").data('kendoExtGrid').dataSource.data([]);
        $("#partGrid").data('kendoExtGrid').dataSource.data([]);
        $("#custRemarkGrid").data('kendoExtGrid').dataSource.data([]);
        //$("#etcIssueGrid").data('kendoExtGrid').dataSource.data([]);
        /*liuxueying update 接车检查回显预约单的项目 初始化时清空end*/
        btnControll("");

    };

    $("#tabstrip-1,#tabstrip-2,#tabstrip-3,#tabstrip-4,#tabstrip-5,#tabstrip-6").height(260);
    $("#tabstrip-1,#tabstrip-2,#tabstrip-3,#tabstrip-4,#tabstrip-5,#tabstrip-6").css("max-height","260px");


    //TAB 정보
    tabInfoSet = function(docNo , preFixId ){

        trobleDescInfo(docNo, preFixId);        //고객요구사항및 고장설명(selectTabInfo.jsp)
        lbrSuggestSet(docNo, preFixId);         //수리건의(selectLbrSuggest.jsp)
    };

    /** 사전점검 번호가 있을경우 자동 조회**/
    <c:choose>
        <c:when test="${infoType eq 'CH'}">
            <c:if test="${diagDocNo ne ''}">
                var data = {"diagDocNo":"${diagDocNo}", "vinNo":"${vinNo}"};
                detailSet(data, false, 'N');
            </c:if>
            <c:if test="${vinNo ne '' and diagDocNo eq ''}">
                var data = {"vinNo":"${vinNo}"};
                getCustInfo(data, "N");
                $("#carAcptTp").data("kendoExtDropDownList").value("03");
            </c:if>
        </c:when>
        <c:otherwise>
        <c:if test="${diagDocNo ne ''}">
            var data = {"diagDocNo":"${diagDocNo}", "vinNo":"${vinNo}"};
            detailSet(data, false, 'N');
            </c:if>
            <c:if test="${vinNo ne '' and diagDocNo eq ''}">
                var data = {"vinNo":"${vinNo}"};
                getCustInfo(data);
            </c:if>
        </c:otherwise>
    </c:choose>

});

function replaceAll(s, findstr, newstr) {
    return s.split(findstr).join(newstr);
}

</script>

<!-- //script -->

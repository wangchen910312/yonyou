<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
    <!-- 보증현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-13039" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13040" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11594" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>

            <form id="searchForm">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <input type="text" id="sCarRegNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                            <td>
                                <input type="text" id="sDiagDocNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preCheckTp' /><!-- 사전점검유형 --></th>
                            <td>
                                <input id="sCarAcptTp" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preChkConfirmDt' /><!-- 사전점검확인일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sFromDt" value="${sFromDt}" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sToDt" value="${sToDt}" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                         </tr>
                         <tr>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preChkNm' /><!-- 사전점검자 --></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="sRegUsrNm" class="form_input">
                                    <a href="javascript:userSearch();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preChkStatus' /><!-- 사전점검상태 --></th>
                            <td>
                                <input type="text" id="sDiagStatCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carlineNm' /><!-- 차종명 --></th>
                            <td>
                                <input type="text" id="sCarlineCd" class="form_comboBox">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>

            <div class="table_grid mt10">
                <div id="grid" class="resizable_grid"></div>
            </div>

             <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area" style="display:none;">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="CQ"><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                        <li id="RD" class="k-state-active"><span id="L01" name="L01"><spring:message code="ser.lbl.trblExpl" /></span><!-- 고장설명 --></li>
                        <li id="C1"><span class="TabId"><spring:message code="ser.lbl.dashInChk" /></span></li> <!-- Dashboard 검사/내부검사 -->
                        <li id="C2"><span class="TabId"><spring:message code="ser.lbl.outChk" /></span></li><!-- 외부검사 -->
                        <li id="C3"><span class="TabId"><spring:message code="ser.lbl.engnNaclChk" /></span></li><!-- 엔진룸 검사 -->
                        <li id="C4"><span class="TabId"><spring:message code="ser.lbl.lightCheck" /></span></li><!-- 조명검사 -->
                        <li id="C5"><span class="TabId"><spring:message code="ser.lbl.underCheck" /></span></li><!-- 하부검사 -->

                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 고객요청사항 & 고장설명 -->
                        <jsp:include page="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp"></jsp:include>
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
                                                <td><a href="javascript:;" id="I02" name="I02" class="preCheck_ico I02"></a></td>
                                                <td><a href="javascript:;" id="I03" name="I03" class="preCheck_ico I03"></a></td>
                                                <td><a href="javascript:;" id="I04" name="I04" class="preCheck_ico I04"></a></td>
                                                <td><a href="javascript:;" id="I05" name="I05" class="preCheck_ico I05"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;" id="I06" name="I06" class="preCheck_ico I06"></a></td>
                                                <td><a href="javascript:;" id="I07" name="I07" class="preCheck_ico I07"></a></td>
                                                <td><a href="javascript:;" id="I08" name="I08" class="preCheck_ico I08"></a></td>
                                                <td><a href="javascript:;" id="I09" name="I09" class="preCheck_ico I09"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;" id="I10" name="I10" class="preCheck_ico I10"></a></td>
                                                <td><a href="javascript:;" id="I11" name="I11" class="preCheck_ico I11"></a></td>
                                                <td><a href="javascript:;" id="I12" name="I12" class="preCheck_ico I12"></a></td>
                                                <td><a href="javascript:;" id="I13" name="I13" class="preCheck_ico I13"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;" id="I14" name="I14" class="preCheck_ico I14"></a></td>
                                                <td><a href="javascript:;" id="I15" name="I15" class="preCheck_ico I15"></a></td>
                                                <td><a href="javascript:;" id="I16" name="I16" class="preCheck_ico I16"></a></td>
                                                <td><a href="javascript:;" id="I17" name="I17" class="preCheck_ico I17"></a></td>
                                                <td><a href="javascript:;" id="I18" name="I18" class="preCheck_ico I18"></a></td>
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
                    <div style="height:205px;">

                        <div class="table_form table_form_btn table_form_car" style="margin-top:20px;">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:12%;">
                                    <col style="width:25.3%;">
                                    <col style="width:25.4%;">
                                    <col style="width:25.3%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td class="ac bol_none"><img src="<c:url value='/resources/img/img_precheck01.png'/>" height="130px" alt=""></td>
                                        <td class="ac"><img src="<c:url value='/resources/img/img_precheck02.png'/>" height="130px" alt=""></td>
                                        <td class="ac"><img src="<c:url value='/resources/img/img_precheck03.png'/>" height="130px" alt=""></td>
                                        <td class="ac"><img src="<c:url value='/resources/img/img_precheck04.png'/>" height="130px" alt=""></td>
                                        <td class="ac"><img src="<c:url value='/resources/img/img_precheck05.png'/>" height="130px" alt=""></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 외부검사 -->

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

                </div>
                <!-- //탭메뉴 전체 영역 -->

        </section>
        <input type="hidden" id="diagDocNo" name="diagDocNo" />
        <input type="hidden" id="resvDocNo" name="diagDocNo" />
        <input type="hidden" id="vinNo" name="vinNo" />

        </div>
</div>
<!-- script -->
<script>
var userSearchPopupWin;

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//공통코드:입고점검유형
var carAcptTpList = [];
<c:forEach var="obj" items="${carAcptTp}">
carAcptTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carAcptTpMap = dms.data.arrayToMap(carAcptTpList, function(obj){return obj.cmmCd;});

var diagStatCdList = [];
<c:forEach var="obj" items="${diagStatCdList}">
diagStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var diagStatCdMap = dms.data.arrayToMap(diagStatCdList, function(obj){return obj.cmmCd;});

var carlineCdList = [],
carlineCdObj = {};
<c:forEach var="obj" items="${carLineList}" varStatus="status">
carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//공통코드:사전점검취소사유
var preChkCancReasonCdList = [];
<c:forEach var="obj" items="${preChkCancReasonCdList}">
preChkCancReasonCdList.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var preChkCancReasonCdMap = dms.data.arrayToMap(preChkCancReasonCdList, function(obj){return obj.cmmCd;});



// 입고점검유형
setCarAcptTpMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(carAcptTpMap[val] != undefined)
        resultVal = carAcptTpMap[val].cmmCdNm;
    }
    return resultVal;
};

getLtsModelNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(ltsMap[val] != undefined)
        returnVal = ltsMap[val].cmmCdNm;
    }
    return returnVal;
};

//사전점검상태
setDiagStatCdMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(diagStatCdMap[val] != undefined)
        resultVal = diagStatCdMap[val].cmmCdNm;
    }
    return resultVal;
};

//사전점검취소사유
setPreChkCancReasonCdMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(preChkCancReasonCdMap[val] != undefined)
        resultVal = preChkCancReasonCdMap[val].cmmCdNm;
    }
    return resultVal;
};

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    //초기화
    $("#btnReset").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#btnSearch").click();

        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            if( dms.string.isEmpty($("#sToDt").val()) || dms.string.isEmpty($("#sFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.preChkConfirmDt' var='preChkConfirmDt'/><spring:message code='global.info.validation.required' arguments='${preChkConfirmDt}' />");
                return;
            }

            var param = $.extend(
                 {"sCarRegNo"            :$("#sCarRegNo").val()}
                ,{"sRegUsrNm"            :$("#sRegUsrNm").val()}
                ,{"sCarAcptTp"           :$("#sCarAcptTp").val()}
                ,{"sVinNo"               :$("#sVinNo").val()}
                ,{"sDiagDocNo"           :$("#sDiagDocNo").val()}
                ,{"sCarlineCd"           :$("#sCarlineCd").val()}
                ,{"sDiagStatCd"          :$("#sDiagStatCd").val()}
                ,{"sFromDt"              :$("#sFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sToDt"                :$("#sToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/ro/preCheck/selectPreCheckListCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"              :"preCheckService"
                            ,"templateFile"         :"PreCheckStatusList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='ser.menu.preCheckList' />.xlsx"
                            ,"sCarRegNo"            :$("#sCarRegNo").val()
                            ,"sRegUsrNm"            :$("#sRegUsrNm").val()
                            ,"sCarAcptTp"           :$("#sCarAcptTp").data("kendoExtDropDownList").value()
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sDiagDocNo"           :$("#sDiagDocNo").val()
                            ,"sCarlineCd"           :$("#sCarlineCd").data("kendoExtDropDownList").value()
                            ,"sDiagStatCd"          :$("#sDiagStatCd").data("kendoExtDropDownList").value()
                            ,"sFromDt"              :$("#sFromDt").val()
                            ,"sToDt"                :$("#sToDt").val()
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });


        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sToDt").val()) || dms.string.isEmpty($("#sFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.preChkConfirmDt' var='preChkConfirmDt'/><spring:message code='global.info.validation.required' arguments='${preChkConfirmDt}' />");
                return;
            }

            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 사전점검확인일자
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    // 사전점검확인일자
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    //입고유형 dropDownList
    $("#sCarAcptTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carAcptTpList
        ,optionLabel : " "
    });

    //사전점검상태 dropDownList
    $("#sDiagStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:diagStatCdList
        ,optionLabel : " "
    });

    //차종(검색)
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });

    $(document).on("click", ".linkPreDocNo", function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.preCheckCreate' />", "<c:url value='/ser/ro/preCheck/selectPreCheckMain.do'/>?diagDocNo="+selectedVal.diagDocNo, "VIEW-D-10333");
    });

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000090"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/preCheck/selectPreCheckListMains.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sFromDt"]       = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sToDt"]         = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarRegNo"]     = $("#sCarRegNo").val();
                        params["sRegUsrNm"]     = $("#sRegUsrNm").val();
                        params["sCarAcptTp"]    = $("#sCarAcptTp").val();
                        params["sVinNo"]        = $("#sVinNo").val();
                        params["sDiagDocNo"]    = $("#sDiagDocNo").val();
                        params["sCarlineCd"]    = $("#sCarlineCd").val();
                        params["sDiagStatCd"]   = $("#sDiagStatCd").val();

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
                        ,dlrCd:{type:"string", editable:false}
                        ,preChkDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,preChkPrintDt:{type:"date"}
                        ,preChkCancDt:{type:"date"}
                        ,preChkDtFormat:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                        ,preChkPrintDtFormat:{type:"date"}
                        ,preChkCancDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.preChkDtFormat = kendo.parseDate(elem.preChkDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            elem.preChkPrintDtFormat = kendo.parseDate(elem.preChkPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.preChkCancDtFormat = kendo.parseDate(elem.preChkCancDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:400
        ,editable:false
        ,selectable:"row"
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}         // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}           // VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}   // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}        // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}  // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}      // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100
                , attributes :{"class":"ar"}
                , format:"{0:n0}"}   // 현주행거리
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />"
                , attributes :{"class":"ar"}, width:100
                , format:"{0:n0}"}    // 누적주행거리
            ,{field:"diagStatCdNm", title:"<spring:message code='ser.lbl.preChkStatus' />", width:100, attributes:{"class":"ac"}} // 사전점검상태
            ,{field:"diagDocNo", title:"<spring:message code='ser.lbl.preInsNo' />", width:110
                , template:function(dataItem){
                    var spanObj = "<a href='#' class='linkPreDocNo'>"+dataItem.diagDocNo+"</a>";
                    return spanObj;
                }
            }                    // 사전점검번호
            ,{field:"carAcptTpNm", title:"<spring:message code='ser.lbl.preCheckTp' />", width:100, attributes:{"class":"ac"}} // 입고점검유형
            ,{field:"preChkDtFormat" ,title:"<spring:message code='ser.lbl.preInsDt' />"
                ,width:120
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.preChkDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.preChkNm' />",  width:100}   // 사전점검인
            ,{field:"preChkPrintDtFormat" ,title:"<%--<spring:message code='ser.lbl.preChkCancDt' />--%><spring:message code='ser.lbl.preChkPrintDt' />" //update by  Zhang QH
                ,width:120
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.preChkPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }// 사전점검프린트시간
            ,{field:"updtDtFormat" ,title:"<spring:message code='ser.lbl.preChkUpdtDt' />"
                ,width:120
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }// 사전점검변경시간
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.preChkUpdtUsrNm' />", width:100}          // 사전점검변경자
            ,{field:"preChkCancDtFormat" ,title:"<spring:message code='ser.lbl.preChkCancDt' />"
                ,width:120
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.preChkCancDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }// 사전점검취소시간
            ,{field:"preChkCancPrsnNm", title:"<spring:message code='ser.lbl.preChkCancPrsnNm' />", width:100} // 사전점검취소자
            ,{field:"preChkCancReasonCdNm", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100} // 사전점검취소원인
            ,{field:"remark", title:"<spring:message code='ser.lbl.preChkRemark' />", width:100}  // 사전점검비고
            ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.carlineNm' />", width:100
                , template:"#=getLtsModelNm(ltsModelCd)#", hidden:true}
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.realDrivDis' />", width:100
                , attributes :{"class":"ar"}
                , format:"{0:n0}"}   // 현주행거리
                ,{field:"useEqui", title:"<spring:message code='ser.lbl.useEqui' />", width:100}         // 차량번호
         ]
    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#searchForm  col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[1]).css("width","14%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[3]).css("width","14%");
            $(colEmt[4]).css("width","8%");
            $(colEmt[5]).css("width","14%");
            $(colEmt[6]).css("width","11%");
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

});

/* 예약 사전 점검 정보 */
detailSet = function(data, slide){
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
                return false;
            } else {
                getReservePreCheckDetailInfo(result);
                trobleDescInfo(result.diagDocNo, "${preFixId}"); // 고객요구사항 및 고장설명
            }
        }
    });
};

/* 예약 사전 점검 상세 정보 */
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
                }
            }
        }
    });
};

/**   data setting **/
getPreCheckToggleSet = function(result){

    $.each($(".btn_active_normal ,.btn_active_warning ,.btn_active_error , .ico_active_normal, .ico_active_warning , .ico_active_error")
            , function ( j  , obj){ // 선택한 toggle 리스트 loop
        $("#"+obj.id).removeClass("btn_active_normal btn_active_warning btn_active_error");
        $("#"+obj.id).removeClass("ico_active_normal ico_active_warning ico_active_error");
        $("#"+obj.id).addClass("btn_active_normal");

    });

    var resultList = [];
    $.each(result.data , function ( i , obj){

        if( dms.string.strNvl( obj.rsltGradeCd ) != ""){
            var rsltGradeCdList = obj.rsltGradeCd.split("|") ;
            var rsltValList = obj.rsltVal.split("|") ;

            $.each(rsltGradeCdList , function (j , rsltGradeCd){
                var rsltVal = rsltValList[j];
                var cssId = "";

                if( obj.chkCd == "I00"){ //이미지 버튼
                    if(rsltVal == "N"){
                        cssId = "ico_active_normal";
                        $("#"+rsltGradeCd).addClass(cssId);
                    }else if(rsltVal == "W"){
                        cssId = "ico_active_warning";
                        $("#"+rsltGradeCd).addClass(cssId);
                        $("#"+rsltGradeCd).removeClass("btn_active_normal");
                    }else if(rsltVal == "E"){
                        cssId = "ico_active_error";
                        $("#"+rsltGradeCd).addClass(cssId);
                        $("#"+rsltGradeCd).removeClass("btn_active_normal");
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

userSearch = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0) {
                        $("#sRegUsrNm").val(data[0].usrNm)
                    }
                }
            }
        }
    });
}
</script>
<!-- //script -->


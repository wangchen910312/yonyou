<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device"%>
<%@ page import="org.springframework.mobile.device.DeviceUtils"%>
<!-- 20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start -->
<!--<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()%>" /> -->
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- 20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end -->
<!-- //khskhs  문제시 삭제 -->

<div id="resizableContainer">
    <div class="content_v1">
        <!-- 품질검사 -->
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11680"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset">
                        <spring:message code="global.btn.init" />
                    </button>
                    <!--초기화  -->
                </dms:access>
                <button class="btn_m" id="backward"
                    style="visibility: hidden">
                    <spring:message code="ser.btn.return" />
                </button>
                <!-- 이전 -->
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13090"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m "
                        id="btnExcelExport">
                        <spring:message code="ser.btn.excelDownload" />
                    </button>
                </dms:access>
                <dms:access viewId="VIEW-D-11679"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch">
                        <spring:message code="global.btn.search" />
                    </button>
                    <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <form id="workProcessForm" method="POST" action="/">
            <div class="table_form" role="search" data-btnid="btnSearch"">
                <table>
                    <caption></caption>
                    <colgroup id="qtColGroup">
                        <col style="width: 9%;">
                        <col style="width: 15%;">
                        <col style="width: 9%;">
                        <col style="width: 15%;">
                        <col style="width: 9%;">
                        <col style="width: 15%;">
                        <col style="width: 9%;">
                        <col style="width: 19%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message
                                    code="ser.lbl.carNo" />
                            </th>
                            <!--차량번호  -->
                            <td><input id="sCarRegNo" type="text"
                                class="form_input"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.roDocNo" />
                            </th>
                            <!--RO번호  -->
                            <td><input type="text" id="sRoDocNo"
                                name="sRoDocNo" class="form_input" /></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.roTp" />
                            </th>
                            <!-- RO유형 -->
                            <td><input id="sRoTp" type="text"
                                class="form_comboBox"
                                style="width: 100%"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.roDt" />
                            </th>
                            <!--RO일자  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRoFromDt"
                                            class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRoToDt"
                                            class="form_datepicker ac">
                                    </div>
                                </div></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message
                                    code="ser.lbl.vinNo" />
                            </th>
                            <!--VIN  -->
                            <td><input id="sVinNo" type="text"
                                class="form_input"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.qtTester" />
                            </th>
                            <!--품질검사자  -->
                            <td><input id="sQtTestPrsnNm"
                                type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.qtTestStat" />
                            </th>
                            <!--품질상태  -->
                            <td><input id="sQtTestStatCd"
                                type="text" class="form_comboBox"
                                style="width: 100%"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.expcDlvDt" />
                            </th>
                            <!--예정인도시간  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sExpcDlFromDt"
                                            class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sExpcDlToDt"
                                            class="form_datepicker">
                                    </div>
                                </div></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- RO작업 배정 상세 타이틀 시작 -->
            <div class="header_area"></div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="roListGrid" class="resizable_grid"></div>
            </div>
            <div style="display: none" id="tDataTable"
                class="table_form form_width_100per">
                <!-- 태블릿 jhg -->
                <div class="header_area"></div>
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message
                                    code='ser.lbl.carRegNo' />
                            </th>
                            <!-- 차량등록번호 -->
                            <td><input type="text" id="tCarRegNo"
                                class="form_input form_readonly">
                            </td>
                            <th scope="row"><spring:message
                                    code='ser.lbl.vinNo' />
                            </th>
                            <!-- VIN -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tVinNo"></td>
                            <th scope="row"><spring:message
                                    code='ser.lbl.carOwner' />
                            </th>
                            <!-- 차량 소유자 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tCarOwnerNm"></td>
                            <th scope="row"><spring:message
                                    code='ser.lbl.driver' />
                            </th>
                            <!-- 수리의뢰자 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tDriverNm"></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message
                                    code='ser.lbl.carlineNm' />
                            </th>
                            <!-- 차종명 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tCarlineNm"></td>
                            <th scope="row"><spring:message
                                    code='par.lbl.modelNm' />
                            </th>
                            <!-- 모델명칭 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tModelNm"></td>
                            <th scope="row"><spring:message
                                    code='ser.lbl.roDocNo' />
                            </th>
                            <!-- RO번호 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tRoDocNo"></td>
                            <th scope="row"><spring:message
                                    code='ser.lbl.roWrtrNm' />
                            </th>
                            <!-- RO발행자 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="tRegUsrNm"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area"></div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message
                                    code="ser.lbl.OldItemHandTp" />
                            </th>
                            <!-- 고품처리방식 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="atqProcTp"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.carWash" />
                            </th>
                            <!-- 세차처리 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="carWashTp"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.custStbyMth" />
                            </th>
                            <!-- 고객대기방식 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="custWaitMthCd"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.qultTest" />
                            </th>
                            <!-- 품질검사 -->
                            <td><input type="text"
                                class="form_input form_readonly"
                                id="qtTestMthCd"></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message
                                    code="ser.lbl.goodWillYn" />
                                <!-- GoodWill -->
                            </th>
                            <td><input id="goodwillYn"
                                name="goodwillYn"
                                class="form_input form_readonly"
                                readonly></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.tdrvReq" />
                            </th>
                            <!--시승 -->
                            <td><input
                                class="form_input form_readonly"
                                id="carDriveReqTp"> <input
                                type="hidden" id="dlrCd"> <input
                                type="hidden" id="roGrpNo"> <input
                                type="hidden" id="roDocNo"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.chgExpcDlDt" />
                            </th>
                            <!-- 변경된예정인도시간 -->
                            <td><input id="chgExpcDlDt" type="text"
                                class="form_input form_readonly"
                                readonly></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.expcDlvDt" />
                            </th>
                            <!-- 예정인도시간 -->
                            <td><input id="expcDlDt" type="text"
                                class="form_input form_readonly"
                                readonly></td>
                        </tr>
                        <tr style="display: none">
                            <th scope="row"><spring:message
                                    code="ser.lbl.bayNm" />
                            </th>
                            <!-- BAY -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="bayNo"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.wkgrpNo" />
                            </th>
                            <!-- 소조 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="vWkgrpNo"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.tecNm" />
                            </th>
                            <!--테크니션  -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="vTecNm"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.lbrHm" />
                            </th>
                            <!--정비공임  -->
                            <td><input type="text" value=""
                                class="form_input form_readonly" id="">
                            </td>
                        </tr>
                        <tr style="display: none">
                            <th scope="row"><spring:message
                                    code="ser.lbl.dstbHm" />
                            </th>
                            <!-- 배정시간 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="sAllocHm"></td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.sheetMetalQty" />
                            </th>
                            <!-- 판금건수 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly" id="">
                            </td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.paintQlt" />
                            </th>
                            <!--페인트건수  -->
                            <td><input type="text" value=""
                                class="form_input form_readonly" id="">
                            </td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.preStartDt" />
                            </th>
                            <!--예정시작시간  -->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="vwrkStartDt"></td>
                        </tr>
                        <tr style="display: none">
                            <th scope="row"><spring:message
                                    code="ser.lbl.rpipHmDegree" />
                            </th>
                            <!-- 공임계수 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly" id="">
                            </td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.difcDegree" />
                            </th>
                            <!-- 난의도 계수 -->
                            <td><input type="text" value=""
                                class="form_input form_readonly" id="">
                            </td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.paintColor" />
                            </th>
                            <!--색상조정  -->
                            <td><input type="text" value=""
                                class="form_input form_readonly" id="">
                            </td>
                            <th scope="row"><spring:message
                                    code="ser.lbl.preCompDt" />
                            </th>
                            <!-- 예정완성시간-->
                            <td><input type="text" value=""
                                class="form_input form_readonly"
                                id="vwrkEndDt"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- RO작업 배정 상세 타이틀 시작 -->
            <div class="header_area"></div>
            <!-- 그리드 시작 -->
            <div id="tWorkProcessGrid">
                <div class="table_grid">
                    <div id="workProcessGrid"></div>
                </div>
            </div>
            <!-- 품질검사 시작 -->
            <div class="mt5">
                <div class="workProgress_manage">
                    <div class="top_area">
                        <ul class="txt_input">
                            <li><span class="bu_required"><spring:message
                                        code="ser.lbl.qtTester" />
                            </span>
                            <!-- 품질검사자 -->
                                <div class="required_area">
                                    <div class="form_search">
                                        <input id="saNm2" name="saNm2"
                                            type="text"
                                            data-json-obj="true"
                                            class="form_input">
                                        <a
                                            href="javascript:techmanPopup('2');"></a>
                                    </div>
                                    <input id="saId2" name="saId2"
                                        type="hidden"
                                        data-json-obj="true" />
                                </div></li>
                        </ul>
                        <div class="btn_right">
                            <dms:access viewId="VIEW-D-11678"
                                hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button"
                                    class="btn_s btn_s_v2" id="Q4"
                                    data-for="wrk02" id="rework"
                                    style="display: none;">
                                    <spring:message
                                        code="ser.lbl.reWork" />
                                    <!-- 리워크 -->
                                </button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11677"
                                hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button"
                                    class="btn_s btn_s_v2" id="Q1"
                                    data-for="wrk02"
                                    onclick="saveWorkProcee('Q1','saNm2','saId2','02')">
                                    <spring:message
                                        code="ser.btn.qtTestStart" />
                                    <!-- 품질검사시작-->
                                </button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11676"
                                hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button"
                                    class="btn_s btn_s_v2" id="Q2"
                                    data-for="wrk02"
                                    onclick="saveWorkProcee('Q2','saNm2','saId2','02')">
                                    <spring:message
                                        code="ser.btn.qtTestEnd" />
                                    <!-- 품질검사완료 -->
                                </button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11675"
                                hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button"
                                    class="btn_s btn_s_v2" id="Q5"
                                    data-for="wrk02"
                                    onclick="saveWorkProcee('Q5','saNm2','saId2','02')">
                                    <spring:message
                                        code="ser.btn.qtTestCancel" />
                                    <!-- 품질검사취소 -->
                                </button>
                            </dms:access>
                        </div>
                    </div>
                </div>

            </div>
            <!-- 품질검사 종료-->
        </form>
    </div>
</div>
<!-- //작업진도관리 -->

<!-- 우측 메뉴 -->
<c:import
    url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectWorkProcessKanban.jsp" />
<!-- //우측 메뉴 -->

<!-- script -->
<script>
//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO상태 Array
var roStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//RO상태 map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd});

//수리유형 Array
var rpirStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});

//진행상태 Array
var progressStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});

//사용여부 Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnCdMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd});

//세차상태 Array
var carWashStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${carWashStatList}">
carWashStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//세차상태 map
var carWashStatMap = dms.data.arrayToMap(carWashStatList, function(obj){return obj.cmmCd});

//품질검사상태 Array
var qtTestStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${qtTestStatList}">
qtTestStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//품질검사상태 map
var qtTestStatMap = dms.data.arrayToMap(qtTestStatList, function(obj){return obj.cmmCd});

//페인트상태 Array
var paintStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//페인트상태 map
var paintStatMap = dms.data.arrayToMap(paintStatList, function(obj){return obj.cmmCd});

//중지원인 Array
var pauseStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pauseStatList}">
pauseStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});

//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고객대기방식유형 map
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd});

//공통코드:시승시운전
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시승시운전 map
var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd});

//공통코드:품질검사
var qtTestList = [];
<c:forEach var="obj" items="${qtTestList}">
qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//품질검사 map
var qtTestMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품처리유형 map
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량세차유형 map
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd});

//공통코드:리워크원인
var rwrkCdList = [];
<c:forEach var="obj" items="${rwrkCdList}">
rwrkCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var rwrkCdArr = dms.data.arrayToMap(rwrkCdList, function(obj){return obj.cmmCd});

//품질검사
progressStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(progressStatMap[val] != undefined)
        returnVal = progressStatMap[val].cmmCdNm;
    }
    return returnVal;
};
//RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdMap[val] != undefined)
        returnVal = roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};
rpirStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rpirStatMap[val] != undefined)
        returnVal = rpirStatMap[val].cmmCdNm;
    }
    return returnVal;
};
qtTestStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(qtTestStatMap[val] != undefined)
        returnVal = qtTestStatMap[val].cmmCdNm;
    }
    return returnVal;
};
rwrkCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rwrkCdArr[val] != undefined)
        returnVal = rwrkCdArr[val].cmmCdNm;
    }
    return returnVal;
};
useYnCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(useYnCdMap[val] != undefined)
        returnVal = useYnCdMap[val].cmmCdNm;
    }
    return returnVal;
};

var popupWindow;
var row = 0;
var row1 = 0;
var rowRoDocNo;

//버튼 - 조회
$("#btnSearch").kendoButton({
    click:function(e) {
        row1 = 0;
        $('#workProcessGrid').data('kendoExtGrid').dataSource.data([]);
        $('#roListGrid').data('kendoExtGrid').dataSource.read();
        if(isTablet=="true") {
            showFirstPage();
        }
    }
});

//엑셀버튼
$("#btnExcelExport").kendoButton({
    click:function(e){
         dms.ajax.excelExport({
            "beanName"       :"repairOrderService"
            ,"templateFile"  :"QtTestList_Tpl.xlsx"
            ,"fileName"      :"<spring:message code='ser.menu.qtTestMng' />.xlsx"
            ,"sRoDocNo"      :$("#sRoDocNo").val()
            ,"sQtTestPrsnNm" :$("#sQtTestPrsnNm").val()
            ,"sQtTestStatCd" :$("#sQtTestStatCd").data("kendoExtDropDownList").value()
            ,"sRoTp"         :$("#sRoTp").data("kendoExtDropDownList").value()
            ,"sVinNo"        :$("#sVinNo").val()
            ,"sCarRegNo"     :$("#sCarRegNo").val()
            ,"sRoFromDt"     :$("#sRoFromDt").val()
            ,"sRoToDt"       :$("#sRoToDt").val()
            ,"sExpcDlFromDt" :$("#sExpcDlFromDt").val()
            ,"sExpcDlToDt"   :$("#sExpcDlToDt").val()
            ,"sQtTestYn"     :"Y"
            ,"sListType"     :"QT"
        });
    }
});

//tablet버튼- 이전
$("#backward").kendoButton({
    click:function(e) {
        showFirstPage();
    }
});

//버튼 - 리워크
$("#Q4").kendoButton({
    click:function(e) {
        alert("<spring:message code='global.msg.eveloping' />");
    }
});

$("#btnReset").kendoButton({
    click:function(e){
        $("#workProcessForm").get(0).reset();
        row = 0;
        row1 = 0;
        $("#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sRoFromDt}");
        $("#sRoToDt").data("kendoExtMaskedDatePicker").value("${sRoToDt}");
        $("#roListGrid").data("kendoExtGrid").dataSource.read();
        $("#workProcessGrid").data("kendoExtGrid").dataSource.data([]);
    }
});

//버튼 - 저장
function saveWorkProcee(stat, saNm, saId, type) {
    var grid = $("#workProcessGrid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());
    var roGrid = $("#roListGrid").data("kendoExtGrid");
    row = grid.select().index();

    var workProcessData = [];

    if(dataItem==null){
        dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
        return;
    }
    if($("#"+saId).val()==""&&saId=="saId1"){
        dms.notification.info("<spring:message code='ser.lbl.tecNm' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
        return;
    }
    if($("#"+saId).val()==""&&saId=="saId2"){
        dms.notification.info("<spring:message code='ser.lbl.qtTester' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
        return;
    }
    if($("#"+saId).val()==""&&saId=="saId3"){
        dms.notification.info("<spring:message code='ser.lbl.carWasher' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
        return;
    }
    if(stat == 'Q1' || stat == 'Q2'){
        if(dataItem.rwrkStatCd == 'Y'){
            if(dataItem.rwrkCd == null){
                dms.notification.info("<spring:message code='ser.lbl.reWorkCau' var='reWorkCau' /><spring:message code='global.info.required.field' arguments='${reWorkCau},' />");
                return;
            }else if(dataItem.rwrkDt == null){
                dms.notification.info("<spring:message code='ser.lbl.rwrkDt' var='rwrkDt' /><spring:message code='global.info.required.field' arguments='${rwrkDt},' />");
                return;
            }else if(dataItem.rwrkerNm == null){
                dms.notification.info("<spring:message code='ser.lbl.rwrkerNm' var='rwrkerNm' /><spring:message code='global.info.required.field' arguments='${rwrkerNm},' />");
                return;
            }
        }
    }

    grid.select().each(function(i, row){
        grid.dataItem(row).dlrCd     = $("#dlrCd").val();
        grid.dataItem(row).roDocNo   = $("#roDocNo").val();
        grid.dataItem(row).roGrpNo   = $("#roGrpNo").val();
        grid.dataItem(row).qtTestPrsnCd = $("#"+saId).val();
        grid.dataItem(row).qtTestPrsnNm = $("#"+saNm).val();
        grid.dataItem(row).wrkStatCd = stat;
        grid.dataItem(row).type = type;
        workProcessData.push(grid.dataItem(row));
    });

    $.ajax({
        url:"<c:url value='/ser/ro/workProcess/insertWorkProcesss.do' />"
        ,data:JSON.stringify(workProcessData)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(jqXHR, textStatus) {
            setGridRows();
            roGrid.dataSource.page(1);
            grid.dataSource._destroyed = [];
            grid.dataSource.data([]);
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
        ,beforeSend:function(xhr){
            dms.loading.show($("#resizableContainer"));
        }
        ,complete:function(xhr,status){
            dms.loading.hide($("#resizableContainer"));
        }
    });
};

var isTablet = "${isTablet}";

$(document).ready(function() {

    $(".btn_s").each(function(){
        $(this).kendoButton({
            enable:false
        });
    });

    // 예정인도시간
    $("#sExpcDlFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예정인도시간
    $("#sExpcDlToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoFromDt}"
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoToDt}"
    });

    $("#sQtTestStatCd").kendoExtDropDownList({
        dataSource:qtTestStatList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    $("#roListGrid").on("doubletap", "tr.k-state-selected", function (e) {

        var grid = $("#roListGrid").data("kendoExtGrid");
        var rows = grid.select();

        var dataItem = grid.dataItem(rows);
        if(isTablet=="true") {
            showSecondPage();
            $("#tCarRegNo").val(dataItem.carRegNo);
            $("#tVinNo").val(dataItem.vinNo);
            $("#tCarOwnerNm").val(dataItem.carOwnerNm);
            $("#tDriverNm").val(dataItem.driverNm);
            $("#tCarlineNm").val(dataItem.carlineNm);
            $("#tModelNm").val(dataItem.modelNm);
            $("#tRoDocNo").val(dataItem.roDocNo);
            $("#tRegUsrNm").val(dataItem.regUsrNm);
        }
    });

    //그리드 설정
    $("#roListGrid").kendoExtGrid({
        gridId:"G-SER-1011-000091"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sQtTestPrsnNm"] = $("#sQtTestPrsnNm").val();
                        params["sQtTestStatCd"] = $("#sQtTestStatCd").data("kendoExtDropDownList").value();
                        params["sRoTp"] = $("#sRoTp").data("kendoExtDropDownList").value();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlFromDt"] = $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlToDt"] = $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value();
                        params["sQtTestYn"] = "Y";
                        params["sListType"] = "QT";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,vinNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,saNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,roDt:{type:"date"}
                        ,expcDlDt:{type:"date"}
                        ,qtTestStartDt:{type:"date"}
                        ,qtTestEndDt:{type:"date"}
                        ,roStatCd:{type:"string"}
                        ,paintStatCd:{type:"string"}
                        ,qtTestStatCd:{type:"string"}
                        ,carWashStatCd:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            $("#roDocNo").val(dataItem.roDocNo);
            $("#roGrpNo").val(dataItem.roGrpNo);
            $("#dlrCd").val(dataItem.dlrCd);
            $("#saId2").val(dataItem.qtTestPrsnCd);
            $("#saNm2").val(dataItem.qtTestPrsnNm);
            $("#workProcessGrid").data("kendoExtGrid").dataSource.read();
            $("#expcDlDt").val(kendo.toString(dataItem.expcDlDt,"<dms:configValue code='dateFormat' /> HH:mm"));
            $("#chgExpcDlDt").val(kendo.toString(dataItem.chgExpcDlDt,"<dms:configValue code='dateFormat' /> HH:mm"));
            if(dataItem.custWaitMthCd!=null){
                $("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
            }else{
                $("#custWaitMthCd").val("");
            }
            if(dataItem.carDriveReqTp!=null){
                $("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
            }else{
                $("#carDriveReqTp").val("");
            }
            if(dataItem.qtTestMthCd!=null){
                $("#qtTestMthCd").val(qtTestMap[dataItem.qtTestMthCd].cmmCdNm);
            }else{
                $("#qtTestMthCd").val("");
            }
            if(dataItem.atqProcTp!=null){
                $("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
            }else{
                $("#atqProcTp").val("");
            }
            if(dataItem.carWashTp!=null){
                $("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
            }else{
                $("#carWashTp").val("");
            }
            if(dataItem.goodwillYn!=null){
                $("#goodwillYn").val(useYnCdMap[dataItem.goodwillYn].cmmCdNm);
            }else{
                $("#goodwillYn").val("");
            }
        }
        ,height:330
        ,selectable:"row"
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            var selectedVal = e.sender.dataItem(e.sender.tbody.find("tr")[row1]);
            if(selectedVal != null){
                if(rowRoDocNo  == selectedVal.roDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[row1]);
                }
            }
        }
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100//차량등록번호
                ,attributes:{"class":"ac"}
            }
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150//vin번호
                ,attributes:{"class":"ac"}
            }
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:90//소유자
                ,attributes:{"class":"ac"}
            }
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:90//운전자
                ,attributes:{"class":"ac"}
            }
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", sortable:false, width:80//차종명
                ,attributes:{"class":"al"}
            }
            ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", sortable:false, width:130//모델명
                ,attributes:{"class":"al"}
            }
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", sortable:false, width:80 // 주행거리
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", sortable:false, width:80    //현재주행거리
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"roStatCd", title:"<spring:message code='ser.lbl.roStatus' />", sortable:false, width:100
                ,attributes:{"class":"ac"}
                ,template:"#=roStatCdGrid(roStatCd)#"
            }//RO상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:100//RO번호
                ,attributes:{"class":"ac"}
            }
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:80//위탁유형
                ,attributes:{"class":"ac"}
                ,template:"#=roTpCdGrid(roTp)#"
            }
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", sortable:false, width:80    //정비위탁자
                ,attributes:{"class":"al"}
            }
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120   //위탁시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"expcDlDt", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:120//예정인도시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"qtTestStatCd", title:"<spring:message code='ser.lbl.qtTestStat' />", sortable:false, width:120
                ,attributes:{"class":"ac"}
                ,template:"#=qtTestStatGrid(qtTestStatCd)#"
            }//품질상태
            ,{field:"qtTestPrsnNm", title:"<spring:message code='ser.lbl.qtTester' />", sortable:false, width:100//품질검사자
                ,attributes:{"class":"ac"}
                ,hidden:true
            }
            ,{field:"qtTestStartDt", title:"<spring:message code='ser.lbl.qtTestStartDt' />", width:120, attributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }//품질시작시간
            ,{field:"qtTestEndDt", title:"<spring:message code='ser.lbl.qtTestEndDt' />", width:120, attributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }//품질완료시간
            ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:150//bayNo
                ,attributes:{"class":"ac"}, hidden:true
            }
            ,{field:"", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:150//소조
                ,attributes:{"class":"ac"}, hidden:true
            }
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:150//테크니션
                ,attributes:{"class":"ac"}, hidden:true
            }
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:150//위탁시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,hidden:true
            }
        ]
    });

    //그리드 설정
    if(isTablet=="true"){
        $("#workProcessGrid").kendoExtGrid({
            gridId:"G-SER-1011-080904"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = $("#dlrCd").val();
                            params["sRoDocNo"] = $("#roDocNo").val();
                            params["assignYn"] = "Y";

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"lineNo"
                        ,fields:{
                            dlrCd:{type:"string", editable:false}
                            ,roDocNo:{type:"string", editable:false}
                            ,lineNo:{type:"string"}
                            ,bayNo:{type:"string"}
                            ,bayNm:{type:"string"}
                            ,realTecId:{type:"string"}
                            ,realTecNm:{type:"string", editable:false}
                            ,rpirTp:{type:"string", editable:false}
                            ,rpirCd:{type:"string", editable:false}
                            ,rpirNm:{type:"string", editable:false}
                            ,rpirDstinCd:{type:"string", editable:false}
                            ,wrkStatCd:{type:"string",defaultValue:""}
                            ,qtTestCd:{type:"string"}
                            ,carWashStatCd:{type:"string"}
                            ,qtTestStatCd:{type:"string", editable:false}
                            ,paintStatCd:{type:"string"}
                            ,wrkStartDt:{type:"date"}
                            ,wrkEndDt:{type:"date"}
                            ,qtTestStartDt:{type:"date", editable:false}
                            ,qtTestEndDt:{type:"date", editable:false}
                            ,wkgrpNm:{type:"string", editable:false}
                            ,bayNm:{type:"string", editable:false}
                            ,planHm:{type:"number", editable:false}
                            ,allocHm:{type:"number", editable:false}
                            ,qtTestPrsnNm:{type:"string", editable:false}
                            ,rwrkStatCd:{type:"string", editable:true}
                            ,rwrkCd:{type:"string", editable:true}
                            ,rwrkDt:{type:"date", editable:false}
                            ,rwrkerNm:{type:"string", editable:false}
                            ,rwrkRemark:{type:"string", editable:true}
                        }
                    }
                }
            }
            ,height:169
            ,autoBind:false
            ,pageable:false
            ,editable :false
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,filterable:false                 // 필터링 기능 사용안함
            ,sortable:false
            ,selectable:"row"
            ,change:function(e){
                var dataItem = this.dataItem(this.select());
                //품질검사시작
                if(dataItem.qtTestStatCd === "Q1"){
                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(true);
                    })
                    $("#Q1").data("kendoButton").enable(false);
                    $("#Q4").data("kendoButton").enable(false);

                    $("#saId2").val("${loginUsrId}");
                    $("#saNm2").val("${loginUsrNm}");
                //품질검사완료
                } else if(dataItem.qtTestStatCd === "Q2"){
                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(true)
                    })
                    $("#Q1").data("kendoButton").enable(false);
                    $("#Q2").data("kendoButton").enable(false);
                    $("#Q4").data("kendoButton").enable(false);

                    $("#saId2").val("${loginUsrId}");
                    $("#saNm2").val("${loginUsrNm}");
                // 품질검사대기
                } else if(dataItem.qtTestStatCd === "Q5"){
                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(true);
                    })
                    $("#Q2").data("kendoButton").enable(false);
                    $("#Q5").data("kendoButton").enable(false);
                    $("#Q4").data("kendoButton").enable(false);

                    $("#saId2").val("${loginUsrId}");
                    $("#saNm2").val("${loginUsrNm}");
                }
            }
            ,columns:[
                {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                ,sortable:false
                ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"}
                ,{field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                    ,attributes:{"class":"ac"}
                }
                ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250//정비항목
                    ,attributes:{"class":"ac"}
                }
                ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=rpirStatGrid(rpirTp)#"
                }//정비유형
                ,{field:"qtTestStatCd", title:"<spring:message code='ser.lbl.qtTestStat' />", width:100, attributes:{"class":"ac"}
                    ,template:"#=qtTestStatGrid(qtTestStatCd)#"
                }//품질상태
                ,{field:"qtTestStartDt", title:"<spring:message code='ser.lbl.qtTestStartDt' />", width:120, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//품질시작시간
                ,{field:"qtTestEndDt", title:"<spring:message code='ser.lbl.qtTestEndDt' />", width:120, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//품질완료시간
                ,{field:"rwrkStatCd", title:"<spring:message code='ser.lbl.rwrkYn' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=useYnCdGrid(rwrkStatCd)#"
                    ,editor:function(container, options){
                        $('<input required name="rwrkStatCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:useYnCdList
                            ,change:initRwrk
                            ,index:1
                        });
                    }
                }//리워크여부
                ,{field:"rwrkCd", title:"<spring:message code='ser.lbl.reWorkCau' />", width:120, attributes:{"class":"ac"}
                    ,template:"#=rwrkCdGrid(rwrkCd)#"
                    ,editor:function(container, options){
                        $('<input required name="rwrkCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:rwrkCdList
                            ,index:1
                        });
                    }
                }//리워크원인
                ,{field:"rwrkDt", title:"<spring:message code='ser.lbl.rwrkDt' />", width:120, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//리워크시간
                ,{field:"rwrkerId", hidden:true}
                ,{field:"rwrkerNm", title:"<spring:message code='ser.lbl.rwrkerNm' />", width:100, attributes:{"class":"ac"}
                }//리워크자
                ,{field:"rwrkRemark", title:"<spring:message code='ser.lbl.rwrkRemark' />", width:200
                }//리워크비고
                ,{field:"realTecId", hidden:true}//테크니션
                ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//테크니션
                ,{field:"wkgrpNo", hidden:true}//테크니션
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"ac"}
                     ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//소조
                ,{field:"bayNo", hidden:true}//bayNo
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"ac"}}//bayNm
                ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ac"}}
                ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ac"}}
                ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"shtCnt", title:"<spring:message code='ser.lbl.serCnt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"qtTestPrsnCd", hidden:true}
                ,{field:"qtTestPrsnNm", title:"<spring:message code='ser.lbl.qtTester' />", sortable:false, width:100   //품질검사자
                    ,attributes:{"class":"ac"}
                }
            ]
        });
    }else{
        $("#workProcessGrid").kendoExtGrid({
            gridId:"G-SER-1011-000092"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = $("#dlrCd").val();
                            params["sRoDocNo"] = $("#roDocNo").val();
                            params["assignYn"] = "Y";

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"lineNo"
                        ,fields:{
                            dlrCd:{type:"string", editable:false}
                            ,roDocNo:{type:"string", editable:false}
                            ,lineNo:{type:"string"}
                            ,bayNo:{type:"string"}
                            ,bayNm:{type:"string"}
                            ,realTecId:{type:"string"}
                            ,realTecNm:{type:"string", editable:false}
                            ,rpirTp:{type:"string", editable:false}
                            ,rpirCd:{type:"string", editable:false}
                            ,rpirNm:{type:"string", editable:false}
                            ,rpirDstinCd:{type:"string", editable:false}
                            ,wrkStatCd:{type:"string",defaultValue:""}
                            ,qtTestCd:{type:"string"}
                            ,carWashStatCd:{type:"string"}
                            ,qtTestStatCd:{type:"string", editable:false}
                            ,paintStatCd:{type:"string"}
                            ,wrkStartDt:{type:"date"}
                            ,wrkEndDt:{type:"date"}
                            ,qtTestStartDt:{type:"date", editable:false}
                            ,qtTestEndDt:{type:"date", editable:false}
                            ,wkgrpNm:{type:"string", editable:false}
                            ,bayNm:{type:"string", editable:false}
                            ,planHm:{type:"number", editable:false}
                            ,allocHm:{type:"number", editable:false}
                            ,qtTestPrsnNm:{type:"string", editable:false}
                            ,rwrkStatCd:{type:"string", editable:true}
                            ,rwrkCd:{type:"string", editable:true}
                            ,rwrkDt:{type:"date", editable:true}
                            ,rwrkerNm:{type:"string", editable:true}
                            ,rwrkRemark:{type:"string", editable:true}
                        }
                    }
                }
            }
            ,height:140
            ,autoBind:false
            ,pageable:false
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,sortable:false
            ,selectable:"multiple"
            ,edit:function(e){
                var fieldName = $(e.container.find("input")[0]).attr("name");
                var dataItem = this.dataItem(this.select());
                var grid = $("#workProcessGrid").data("kendoExtGrid");
                var editYn = false;
                if(dataItem.rwrkStatCd === "N"){
                    editYn = true;
                } else {
                    editYn = false;
                }
                if(editYn){
                    if(fieldName == "rwrkCd" || fieldName == "rwrkDt" || fieldName == "rwrkerNm" || fieldName == "rwrkRemark"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());

                if(dataItem != null) {
                    //품질검사시작
                    if(dataItem.qtTestStatCd === "Q1"){
                        $('[data-for="wrk02"]').each(function(){
                            $(this).data("kendoButton").enable(true);
                        })
                        $("#Q1").data("kendoButton").enable(false);
                        $("#Q4").data("kendoButton").enable(false);

                        $("#saId2").val("${loginUsrId}");
                        $("#saNm2").val("${loginUsrNm}");
                    //품질검사완료
                    } else if(dataItem.qtTestStatCd === "Q2"){
                        $('[data-for="wrk02"]').each(function(){
                            $(this).data("kendoButton").enable(true)
                        })
                        $("#Q1").data("kendoButton").enable(false);
                        $("#Q2").data("kendoButton").enable(false);
                        $("#Q4").data("kendoButton").enable(false);

                        $("#saId2").val("${loginUsrId}");
                        $("#saNm2").val("${loginUsrNm}");
                    // 품질검사대기
                    } else if(dataItem.qtTestStatCd === "Q5"){
                        $('[data-for="wrk02"]').each(function(){
                            $(this).data("kendoButton").enable(true);
                        })
                        $("#Q2").data("kendoButton").enable(false);
                        $("#Q5").data("kendoButton").enable(false);
                        $("#Q4").data("kendoButton").enable(false);

                        $("#saId2").val("${loginUsrId}");
                        $("#saNm2").val("${loginUsrNm}");
                    }
                }
            }
            ,columns:[
                {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                    ,attributes:{"class":"ac"}
                }
                ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250//정비항목
                    ,attributes:{"class":"ac"}
                }
                ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=rpirStatGrid(rpirTp)#"
                }//정비유형
                ,{field:"qtTestStatCd", title:"<spring:message code='ser.lbl.qtTestStat' />", width:100, attributes:{"class":"ac"}
                    ,template:"#=qtTestStatGrid(qtTestStatCd)#"
                }//품질상태
                ,{field:"qtTestStartDt", title:"<spring:message code='ser.lbl.qtTestStartDt' />", width:120, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//품질시작시간
                ,{field:"qtTestEndDt", title:"<spring:message code='ser.lbl.qtTestEndDt' />", width:120, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//품질완료시간
                ,{field:"rwrkStatCd", title:"<spring:message code='ser.lbl.rwrkYn' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=useYnCdGrid(rwrkStatCd)#"
                    ,editor:function(container, options){
                        $('<input required name="rwrkStatCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:useYnCdList
                            ,change:initRwrk
                            ,index:1
                        });
                    }
                }//리워크여부
                ,{field:"rwrkCd", title:"<spring:message code='ser.lbl.reWorkCau' />", width:120, attributes:{"class":"ac"}
                    ,template:"#=rwrkCdGrid(rwrkCd)#"
                    ,editor:function(container, options){
                        $('<input name="rwrkCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:rwrkCdList
                            ,index:1
                        });
                    }
                }//리워크원인
                ,{field:"rwrkDt", title:"<spring:message code='ser.lbl.rwrkDt' />", width:170, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                    ,editor:function (container, options){
                     $('<input name="rwrkDt" id="rwrkDt" data-name="<spring:message code='ser.lbl.rwrkDt' />" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoDateTimePicker({
                         format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                        //,minTime:"08:00"
                        //,maxTime:"20:00"
                     });
                     $('<span class="k-invalid-msg" data-for="rwrkDt"></span>').appendTo(container);
                    }
                }//리워크시간
                ,{field:"rwrkerId", hidden:true}
                ,{field:"rwrkerNm", title:"<spring:message code='ser.lbl.rwrkerNm' />", width:100
                    ,attributes:{"class":"al"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="rwrkerNm" data-name="<spring:message code='ser.lbl.rwrkerNm'/>" class="form_input" readonly="true" /><a href="#" onclick="techmanPopup(\'rwrker\')" >&nbsp;</a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="rwrkerNm"></span>')
                        .appendTo(container);
                     }
                }//리워크자
                ,{field:"rwrkRemark", title:"<spring:message code='ser.lbl.rwrkRemark' />", width:200
                }//리워크비고
                ,{field:"realTecId", hidden:true}//테크니션
                ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//테크니션
                ,{field:"wkgrpNo", hidden:true}//테크니션
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"ac"}
                     ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//소조
                ,{field:"bayNo", hidden:true}//bayNo
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"ac"}}//bayNm
                ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ac"}}
                ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ac"}}
                ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"shtCnt", title:"<spring:message code='ser.lbl.serCnt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"qtTestPrsnCd", hidden:true}
                ,{field:"qtTestPrsnNm", title:"<spring:message code='ser.lbl.qtTester' />", sortable:false, width:100   //품질검사자
                    ,attributes:{"class":"ac"}
                }
            ]
        });
    }

    initRwrk = function(e){
        var grid = $("#workProcessGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        if(selectedVal.rwrkStatCd === "N"){
            selectedVal.set("rwrkCd","");
            selectedVal.set("rwrkDt","");
            selectedVal.set("rwrkerNm","");
            selectedVal.set("rwrkRemark","");
        }
    };


    //선택된 그리드 Rows
    setGridRows = function(){

        var roListGrid = $("#roListGrid").data("kendoExtGrid");
        rowRoDocNo = "";
        row1 = 0;
        var selectedVal = roListGrid.dataItem(roListGrid.select());
        if(selectedVal != null){
            row1 = roListGrid.select().index();
            rowRoDocNo = selectedVal.roDocNo;
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#qtColGroup col");
            $(colEmt[0]).css("width","6%");
            $(colEmt[1]).css("width","13%");
            $(colEmt[2]).css("width","7%");
            $(colEmt[3]).css("width","13%");
            $(colEmt[4]).css("width","8%");
            $(colEmt[5]).css("width","13%");
            $(colEmt[6]).css("width","8%");
            $(colEmt[7]).css("width","21%");
            $(".table_grid").attr("style","width:938px !important; max-width:938px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

    if(isTablet=="true"){
        $("#tWorkProcessGrid").css("display","none");
        $(".table_form").eq(2).css("display","none");
        $(".mt5").css("display","none");
    }


});

//workProcessGrid의 multi-select
$(document).on("click", ".grid-checkbox-item, #workProcessGrid tr", function(e){
    if(isTablet == "true"){
        var target = $(e.currentTarget);
        if($(target).is("tr")){
            //체크박스에 체크가 되어있으면 선택을 해제하고, 그렇지 않다면 선택한다.
            var chkItem = $(target).find(".grid-checkbox-item");
            if($(chkItem).prop("checked")){
                $(target).removeClass("k-state-selected");
                $(target).find(".grid-checkbox-item").prop("checked",false);
            }else{
                $(target).addClass("k-state-selected");
                $(target).find(".grid-checkbox-item").prop("checked",true);
            }
          //체크된 모든 row를 선택한다.
            $(".grid-checkbox-item").each(function(index, row){
                if($(row).prop("checked")){
                    $(row).closest("tr").addClass("k-state-selected");
                }
            });

            var grid = $('#workProcessGrid').data('kendoExtGrid');
            var dataItem = grid.dataItem(grid.select());
            if(dataItem != null){
              //품질검사시작
                if(dataItem.qtTestStatCd === "Q1"){
                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(true);
                    })
                    $("#Q1").data("kendoButton").enable(false);
                    $("#Q4").data("kendoButton").enable(false);

                    $("#saId2").val("${loginUsrId}");
                    $("#saNm2").val("${loginUsrNm}");
                //품질검사완료
                } else if(dataItem.qtTestStatCd === "Q2"){
                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(true)
                    })
                    $("#Q1").data("kendoButton").enable(false);
                    $("#Q2").data("kendoButton").enable(false);
                    $("#Q4").data("kendoButton").enable(false);

                    $("#saId2").val("${loginUsrId}");
                    $("#saNm2").val("${loginUsrNm}");
                // 품질검사대기
                } else if(dataItem.qtTestStatCd === "Q5"){
                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(true);
                    })
                    $("#Q2").data("kendoButton").enable(false);
                    $("#Q5").data("kendoButton").enable(false);
                    $("#Q4").data("kendoButton").enable(false);

                    $("#saId2").val("${loginUsrId}");
                    $("#saNm2").val("${loginUsrNm}");
                }
            }
        }else{
            //기본체크버튼 이벤트를 막는다. 이후 tr클릭 이벤트를 탄다.
            $(e.currentTarget).prop("checked")? $(e.currentTarget).prop("checked",false) : $(e.currentTarget).prop("checked",true);
        }

    }
});

// 리워크 팝업
$("#rework").kendoButton({
    click:function(e)
    {
        var grid = $("#workProcessGrid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());
        reworkPopupWindow = dms.window.popup({
            windowId:"reworkPopup"
            ,title:"<spring:message code='ser.title.reWork' />"   // 리워크
            ,content:{
                url:"<c:url value='/ser/ro/workProcess/selectReworkPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":true
                    ,"roDocNo":dataItem.roDocNo
                    ,"roGrpNo":$("#roGrpNo").val()
                    ,"lineNo":dataItem.lineNo
                    ,"rpirCd":dataItem.rpirCd
                    ,"callbackFunc":function(data){
                        $("#workProcessGrid").data("kendoExtGrid").dataSource.read();
                    }
                }
            }
            ,height:210
            ,width:400
        });
    }
});

var tecSearchPopup;
techmanPopup = function(number) {
    tecSearchPopup = dms.window.popup({
        windowId:"teckManFnSearchWin"
        , title:"<spring:message code='ser.lbl.serviceUserSearch' />"   // 정비사용자 조회
        , content:{
            url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
            , data:{
                "autoBind":true
                , "callbackFunc":function(jsonObj) {

                    if(jsonObj.length > 0) {
                        if(number=='rwrker'){
                            grid = $("#workProcessGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());
                            selectedVal.set(eval("number")+"Id",jsonObj[0].tecId);
                            selectedVal.set(eval("number")+"Nm",jsonObj[0].tecNm);
                        }else if(number=='1'){
                            $("#saId1").val(jsonObj[0].tecId);
                            $("#saNm1").val(jsonObj[0].tecNm);
                        }else if(number=='2'){
                            $("#saId2").val(jsonObj[0].tecId);
                            $("#saNm2").val(jsonObj[0].tecNm);
                        }else {
                            $("#saId3").val(jsonObj[0].tecId);
                            $("#saNm3").val(jsonObj[0].tecNm);
                        }
                }
            }
        }
        }
    });
};

//jhg tablet
showFirstPage = function() {
    $(".table_grid").eq(0).css("display","block");
    $("#tWorkProcessGrid").css("display","none");
    $(".table_form").eq(0).css("display","block");
    $(".table_form").eq(2).css("display","none");
    $(".mt5").css("display","none");
    $("#backward").css("visibility","hidden");
    $("#tDataTable").css("display","none");
};
//jhg tablet
showSecondPage = function() {
    $(".table_grid").eq(0).css("display","none");
    $("#tWorkProcessGrid").css("display","block");
    $(".table_form").eq(0).css("display","none");
    $(".table_form").eq(2).css("display","block");
    $(".mt5").css("display","block");
    $("#backward").css("visibility","visible");
    $("#tDataTable").css("display","block");
};

//khskhs doubletab
(function($){

    $.event.special.doubletap = {
      bindType: 'touchend',
      delegateType: 'touchend',

      handle: function(event) {
        var handleObj   = event.handleObj,
            targetData  = jQuery.data(event.target),
            now         = new Date().getTime(),
            delta       = targetData.lastTouch ? now - targetData.lastTouch : 0,
            delay       = delay == null ? 300 : delay;

        if (delta < delay && delta > 30) {
          targetData.lastTouch = null;
          event.type = handleObj.origType;
          ['clientX', 'clientY', 'pageX', 'pageY'].forEach(function(property) {
            event[property] = event.originalEvent.changedTouches[0][property];
          })

          // let jQuery handle the triggering of "doubletap" event handlers
          handleObj.handler.apply(this, arguments);
        } else {
          targetData.lastTouch = now;
        }
      }
    };

  })(jQuery);
//khskhs doubletab

<c:choose>
    <c:when test="${vinNo ne ''}">
        $("#sVinNo").val( "${vinNo}");
    </c:when>
</c:choose>

</script>

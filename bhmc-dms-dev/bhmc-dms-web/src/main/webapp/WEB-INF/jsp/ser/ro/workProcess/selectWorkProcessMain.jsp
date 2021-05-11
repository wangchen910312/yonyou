<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div class="content_v1">
<!-- 작업진도관리 -->
<div id="resizableContainer">
     <div class="header_area">
        <div class="btn_left">
            <dms:access viewId="VIEW-D-11662" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
            </dms:access>
            <button class="btn_m" id="backward" style="visibility:hidden"><spring:message code="global.btn.pre" /></button><!-- 이전 -->
        </div>
         <div class="btn_right">
            <dms:access viewId="VIEW-D-13092" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11661" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <form id="workProcessForm" method="POST" action="/">
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup id="workProcColGroup">
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
                    <th scope="row"><spring:message code="ser.lbl.carNo" /></th><!--차량번호  -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!--RO번호  -->
                    <td>
                        <input type="text" id="sRoDocNo" name="sRoDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!--RO유형  -->
                    <td>
                        <input id="sRoTp" type="text" class="form_comboBox" style="width:100%">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.roDt" /></th><!--정비위탁확인시간  -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRoFromDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRoToDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!--VIN  -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!--RO발행자  -->
                    <td>
                        <input id="sRegUsrNm" type="text" value="" class="form_input" maxlength="30">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.processWorkStat" /></th><!--정비진도상태  -->
                    <td>
                        <input id="sWrkStatCd" type="text" class="form_comboBox" style="width:100%">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!--예정인도시간  -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sExpcDlFromDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sExpcDlToDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- RO작업 배정 상세 타이틀 시작 -->
    <div class="header_area">
     </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="roListGrid" class="resizable_grid"></div>
    </div>

    <div style="display:none" id="tDataTable" class="table_form form_width_100per">   <!-- 태블릿 jhg -->
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
                        <th scope="row"><spring:message code='ser.lbl.carRegNo' /></th><!-- 차량등록번호 -->
                        <td>
                            <input type="text" id="tCarRegNo" class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tVinNo">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 차량 소유자 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tCarOwnerNm">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.driver' /></th><!-- 수리의뢰자 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tDriverNm">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th><!-- 차종명 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tCarlineNm">
                        </td>
                        <th scope="row"><spring:message code='par.lbl.modelNm' /></th><!-- 모델명칭 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tModelNm">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tRoDocNo">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roWrtrNm' /></th><!-- RO발행자 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tRegUsrNm">
                        </td>
                    </tr>
                </tbody>
        </table>
    </div>

    <div class="header_area">
    </div>

    <div class="table_form form_width_100per">
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
                    <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /></th><!-- 고품처리방식 -->
                    <td>
                        <input type="text" id="atqProcTp" class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.carWash" /></th><!-- 세차처리 -->
                    <td>
                        <input type="text" class="form_input form_readonly" id="carWashTp">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.custStbyMth" /></th><!-- 고객대기방식 -->
                    <td>
                        <input type="text" class="form_input form_readonly" id="custWaitMthCd">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.qultTest" /></th><!-- 품질검사 -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="qtTestMthCd">
                    </td>
                </tr>
                 <tr>
                    <th scope="row"><spring:message code="ser.lbl.goodWillYn" /></th><!-- GoodWill -->
                    <td>
                        <input id="goodwillYn" name="goodwillYn" class="form_input form_readonly" readonly>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.tdrvReq" /></th><!--시승 -->
                    <td>
                        <input class="form_input form_readonly" id="carDriveReqTp">
                        <input type="hidden" id="dlrCd">
                        <input type="hidden" id="roGrpNo">
                        <input type="hidden" id="roDocNo">
                        <input type="hidden" id="ltsModelCd">
                        <input type="hidden" id="roTp">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.chgExpcDlDt" /></th><!-- 변경된예정인도시간 -->
                    <td class="readonly_area">
                        <input class="form_datePicker" id="chgExpcDlDt" style="width:100%" readonly>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                    <td class="readonly_area">
                        <input class="form_datePicker" id="expcDlDt" style="width:100%" readonly>
                    </td>
                </tr>
                <tr style="display:none">
                    <th scope="row"><spring:message code="ser.lbl.bayNm" /></th><!-- BAY -->
                    <td>
                        <!-- <input type="hidden" id="wrkEndDt"> -->
                        <input type="text" value="" class="form_input form_readonly" id="bayNo">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.wkgrpNo" /></th><!-- 소조 -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="vWkgrpNo">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.tecNm" /></th><!--테크니션  -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="vTecNm">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.lbrHm" /></th><!--정비공임  -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="">
                    </td>
                </tr>
                <tr style="display:none">
                    <th scope="row"><spring:message code="ser.lbl.dstbHm" /></th><!-- 배정시간 -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="sAllocHm">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.sheetMetalQty" /></th><!-- 판금건수 -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.paintQlt" /></th><!--페인트건수  -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.preStartDt" /></th><!--예정시작시간  -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="vwrkStartDt">
                    </td>
                </tr>
                <tr style="display:none">
                    <th scope="row"><spring:message code="ser.lbl.rpipHmDegree" /></th><!-- 공임계수 -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.difcDegree" /></th><!-- 난의도 계수 -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.paintColor" /></th><!--색상조정  -->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.preCompDt" /></th><!-- 예정완성시간-->
                    <td>
                        <input type="text" value="" class="form_input form_readonly" id="vwrkEndDt">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- RO작업 배정 상세 타이틀 시작 -->
    <div class="header_area">
     </div>
     <!-- 그리드 시작 -->
     <div id=tSecondGrid>
    <div class="table_grid">
        <div id="workProcessGrid"></div>
    </div>
    </div>

        <!-- 정비시작 -->
        <div class="mt5">
            <div class="workProgress_manage">
                <div class="top_area">
                    <ul class="txt_input">
                        <li>
                            <span class="bu_required"><spring:message code="ser.lbl.tecNm" /></span><!-- 테크니션 -->
                            <div class="required_area">
                                <div class="form_search">
                                    <input id="saNm1" name="saNm1" type="text" data-json-obj="true" class="form_input">
                                    <a href="javascript:techmanPopup('1');"></a>
                                </div>
                                <input id="saId1" name="saId1" type="hidden" data-json-obj="true" />
                            </div>
                        </li>
                    </ul>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11660" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_v2" id="rpipStart" data-for="wrk01" onclick="saveWorkProcee('02','saNm1','saId1','04')"><spring:message code="ser.btn.lbrStart" /><!-- 정비시작 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11659" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_v2" id="rpipPause" data-for="wrk01"><spring:message code="ser.btn.lbrStop" /><!-- 정비중지 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11658" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_v2" id="rpipContinue" data-for="wrk01"><spring:message code="ser.btn.lbrRestart" /><!-- 정비재개 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11657" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_v2" id="rpipComplete" data-for="wrk01" onclick="saveWorkProcee('05','saNm1','saId1','04')"><spring:message code="ser.btn.lbrEnd" /><!-- 정비완료 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11656" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_v2" id="rpipCancel" data-for="wrk01" onclick="saveWorkProcee('01','saNm1','saId1','04')"><spring:message code="ser.btn.lbrCanc" /><!-- 정비취소 --></button>
                        </dms:access>
                    </div>
                </div>
                <div class="con_area">
                    <ul>
                        <li>
                            <dms:access viewId="VIEW-D-11655" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="A1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('A1','saNm1','saId1','01')"><spring:message code="ser.btn.dismantleStart" /><!-- 분해시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11654" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="B1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('B1','saNm1','saId1','01')"><spring:message code="ser.btn.reviseStart" /><!-- 보정시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11653" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="C1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('C1','saNm1','saId1','01')"><spring:message code="ser.btn.sheetMetalStart" /><!-- 판금시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11652" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="D1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('D1','saNm1','saId1','01')"><spring:message code="ser.btn.bottomTreatStart" /><!-- 및처리시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11651" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="E1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('E1','saNm1','saId1','01')"><spring:message code="ser.btn.primerStart" /><!-- 프라이머시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11650" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="F1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('F1','saNm1','saId1','01')"><spring:message code="ser.btn.lappingStart" /><!-- 랩핑시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11649" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="J1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('J1','saNm1','saId1','01')"><spring:message code="ser.btn.paintingStart" /><!-- 페인팅시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11648" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="G1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('G1','saNm1','saId1','01')"><spring:message code="ser.btn.dryStart" /><!-- 건조시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11647" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="H1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('H1','saNm1','saId1','01')"><spring:message code="ser.btn.installStart" /><!-- 설치시작 --></button>
                            </dms:access>
                        </li>
                        <li>
                            <dms:access viewId="VIEW-D-11646" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v3" id="I1" data-for="wrk02" data-type="paint" onclick="saveWorkProcee('I1','saNm1','saId1','01')"><spring:message code="ser.btn.buffingStart" /><!-- 광택시작 --></button>
                            </dms:access>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 정비종료-->
        </form>
    </div>
</div>
<!-- //작업진도관리 -->

<!-- 우측 메뉴 -->
<c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectWorkProcessKanban.jsp" />
<!-- //우측 메뉴 -->

<!-- script -->
<script>

    //20170508 hg
    var isTablet="${isTablet}";
    var _selectable;
    var _height;
    if(isTablet == true || isTablet == "true"){
        _selectable="row";
        _height=500;
    }else{
        _selectable="multiple";
        _height=430;
    }

    var popupWindow;
    var laborSearchPopup;
    var pauseCausePopup;
    var row = 0;
    var row1 = 0;
    var rowRoDocNo;

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
    var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

    //수리유형 Array
    var rpirStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${rpirStatList}">
    rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //수리유형 map
    var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd;});

    //진행상태 Array
    var progressStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var progressStatList2 = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${progressStatList}">
        progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        <c:if test="${obj.remark2 ne '03'}">
        progressStatList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    </c:forEach>
    //진행상태 map
    var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd;});

    //사용여부 Array
    var useYnCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${useYnCdList}">
    useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var useYnCdMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd;});

    //페인트상태 Array
    var paintStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${paintStatList}">
    paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //페인트상태 map
    var paintStatMap = dms.data.arrayToMap(paintStatList, function(obj){return obj.cmmCd;});

    //중지원인 Array
    var pauseStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${pauseStatList}">
    pauseStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    // 중지원인 map
    var pauseStatMap = dms.data.arrayToMap(pauseStatList, function(obj){return obj.cmmCd;});

    //공통코드:고객대기방식유형
    var custWaitMthCdList = [];
    <c:forEach var="obj" items="${custWaitMthCdList}">
    custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //고객대기방식유형 map
    var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd;});

    //공통코드:고품처리유형
    var atqProcTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${atqProcTpCdList}">
    atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //고품처리유형 map
    var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd;});

    //공통코드:시승시운전
    var carDriveReqTpCdList = [];
    <c:forEach var="obj" items="${carDriveReqTpCdList}">
    carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //시승시운전 map
    var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd;});

    //공통코드:품질검사
    var qtTestList = [];
    <c:forEach var="obj" items="${qtTestList}">
    qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //품질검사 map
    var qtTestMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd;});

    //공통코드:차량세차유형
    var carWashTpCdList = [];
    <c:forEach var="obj" items="${carWashTpCdList}">
    carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //차량세차유형 map
    var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd;});


    //진행상태
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

    atqProcTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(atqProcTpCdMap[val] != undefined)
            returnVal = atqProcTpCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    paintStatGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(paintStatMap[val] != undefined)
            returnVal = paintStatMap[val].cmmCdNm;
        }
        return returnVal;
    };

    pauseStatGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(pauseStatMap[val] != undefined)
            returnVal = pauseStatMap[val].cmmCdNm;
        }
        return returnVal;
    };

    $(document).ready(function() {

        if(isTablet=="true") {
            $("#tSecondGrid").css("display","none");
            $(".table_form").eq(2).css("display","none");
            $(".mt5").css("display","none");
        }

        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                row1 = 0;
                rowRoDocNo = "";
                $('#workProcessGrid').data('kendoExtGrid').dataSource.data([]);
                $('#roListGrid').data('kendoExtGrid').dataSource.page(1);
                if(isTablet=="true") {
                    showFirstPage();
                }
            }
        });

      //tablet버튼- 이전
        $("#backward").kendoButton({
            click:function(e) {
                showFirstPage();
            }
        });

        // 엑셀 버튼
        $("#btnExcelExport").kendoButton({
            click:function(e){
                dms.ajax.excelExport({
                    "beanName"       :"repairOrderService"
                    ,"templateFile"  :"WorkProcessList_Tpl.xlsx"
                    ,"fileName"      :"<spring:message code='ser.menu.wkProcMng' />.xlsx"
                    ,"sWrkStatCd"    :$("#sWrkStatCd").data("kendoExtDropDownList").value()
                    ,"sRoTp"         :$("#sRoTp").data("kendoExtDropDownList").value()
                    ,"sVinNo"        :$("#sVinNo").val()
                    ,"sRegUsrNm"     :$("#sRegUsrNm").val()
                    ,"sCarRegNo"     :$("#sCarRegNo").val()
                    ,"sRoDocNo"      :$("#sRoDocNo").val()
                    ,"sRoFromDt"     :$("#sRoFromDt").val()
                    ,"sRoToDt"       :$("#sRoToDt").val()
                    ,"sExpcDlFromDt" :$("#sExpcDlFromDt").val()
                    ,"sExpcDlToDt"   :$("#sExpcDlToDt").val()
                    ,"sListType"     :"WRK"
                });
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
                rowRoDocNo = "";

                $("#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sRoFromDt}");
                $("#sRoToDt").data("kendoExtMaskedDatePicker").value("${sRoToDt}");
                $("#roListGrid").data("kendoExtGrid").dataSource.page(1);
                $("#workProcessGrid").data("kendoExtGrid").dataSource.data([]);

                $('[data-for="wrk01"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });

                $('[data-for="wrk02"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });
            }
        });


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

        // 예정인도시간
        $("#expcDlDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
        });

        // 변경된 예정인도시간
        $("#chgExpcDlDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
        });

        //수리상태
        $("#sWrkStatCd").kendoExtDropDownList({
            dataSource:progressStatList2
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            ,index:0
        });

        //RO유형
        $("#sRoTp").kendoExtDropDownList({
            dataSource:roTpCdList
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            ,index:0
        });

        //그리드 설정
        $("#roListGrid").kendoExtGrid({
            gridId:"G-SER-1011-000101"
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

                            params["sWrkStatCd"] = $("#sWrkStatCd").data("kendoExtDropDownList").value();
                            params["sRoTp"] = $("#sRoTp").data("kendoExtDropDownList").value();
                            params["sVinNo"] = $("#sVinNo").val();
                            params["sRegUsrNm"] = $("#sRegUsrNm").val();
                            params["sCarRegNo"] = $("#sCarRegNo").val();
                            params["sRoDocNo"] = $("#sRoDocNo").val();
                            params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                            params["sExpcDlFromDt"] = $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sExpcDlToDt"] = $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value();
                            params["sListType"] = "WRK";

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
                $('[data-for="wrk01"]').each(function(){
                     $(this).data("kendoButton").enable(false);
                });
                var dataItem = this.dataItem(this.select());
                $("#ltsModelCd").val(dataItem.ltsModelCd);
                $("#roTp").val(dataItem.roTp);
                $("#roDocNo").val(dataItem.roDocNo);
                $("#resvDocNo").val(dataItem.resvDocNo);
                $("#roGrpNo").val(dataItem.roGrpNo);
                $("#dlrCd").val(dataItem.dlrCd);
                $("#workProcessGrid").data("kendoExtGrid").dataSource.read();
                $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(dataItem.expcDlDt);
                $("#chgExpcDlDt").data("kendoExtMaskedDateTimePicker").value(dataItem.chgExpcDlDt);
                $("#diagDocNo").val(dataItem.diagDocNo);
                $("#bayNm").val(dataItem.bayNo);
                $("#driverNm").val(dataItem.driverNm);
                $("#roDt").val(dataItem.roDt);
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
                if(dataItem.roTp!=null){
                    $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);
                }
                if(dms.string.strNvl(dataItem.wrkStatCd) == "01"){
                    $("#saId1").val("${loginUsrId}");
                    $("#saNm1").val("${loginUsrNm}");
                }
                if(dataItem.goodwillYn!=null){
                    $("#goodwillYn").val(useYnCdMap[dataItem.goodwillYn].cmmCdNm);
                }else{
                    $("#goodwillYn").val("");
                }
                /* if(isTablet=="true") {
                    showSecondPage();
                    $("#tCarRegNo").val(dataItem.carRegNo);
                    $("#tVinNo").val(dataItem.vinNo);
                    $("#tCarOwnerNm").val(dataItem.carOwnerNm);
                    $("#tDriverNm").val(dataItem.driverNm);
                    $("#tCarlineNm").val(dataItem.carlineNm);
                    $("#tModelNm").val(dataItem.modelNm);
                    $("#tRoDocNo").val(dataItem.roDocNo);
                    $("#tRegUsrNm").val(dataItem.regUsrNm);

                } */
            }
            ,height:180
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
                 {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100}      //차량등록번호
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}            //vin번호
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:90}     //소유자
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:90}         //운전자
                ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", sortable:false, width:100}    // 차종명칭
                ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", sortable:false, width:200}        // 모델명칭
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", sortable:false, width:100   // 사전점검주행거리
                    , attributes :{"class":"ar"}, format:"{0:n0}"}
                ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.totRunDistVal' />", sortable:false, width:100 // 누계주행거리
                    , attributes :{"class":"ar"}, format:"{0:n0}"}
                ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", sortable:false, width:100 // RO상태
                    , attributes:{"class":"ac"}}
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120         //RO번호
                    , attributes:{"class":"ac"}}
                ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100               //위탁유형
                    ,attributes:{"class":"ac"}
                    ,template:"#=roTpCdGrid(roTp)#"
                }
                ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120               //위탁시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", sortable:false, width:100}      // 위탁인
                ,{field:"expcDlDt", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:120      //예정인도시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                ,{field:"wrkStatCd", title:"<spring:message code='ser.lbl.processWorkStat' />", sortable:false, width:120   //정비진도상태
                    ,attributes:{"class":"ac"}
                    ,template:"#=progressStatGrid(wrkStatCd)#"
                }
                ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:150//bayNo
                    ,attributes:{"class":"al"}, hidden:true
                }
                ,{field:"", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:150//소조
                    ,attributes:{"class":"al"}, hidden:true
                }
                ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:120//테크니션
                    ,attributes:{"class":"al"}, hidden:true
                }
                ,{field:"atqProcTp", title:"<spring:message code='ser.lbl.OldItemHandTp' />", width:120//고품처리
                    ,attributes:{"class":"ac"}, hidden:true
                    ,template:"#=atqProcTpCdGrid(atqProcTp)#"
                }
                ,{field:"pauseCauCd", title:"<spring:message code='ser.lbl.pauseCau' />", width:120, attributes:{"class":"ac"}
                    ,template:"#=pauseStatGrid(pauseCauCd)#", hidden:true
                }//중지원인
                ,{field:"paintStatCd", title:"<spring:message code='ser.lbl.paintStat' />", width:120, attributes:{"class":"ac"}
                     ,template:"#=paintStatGrid(paintStatCd)#", hidden:true
                }//페인트상태
                ,{field:"ltsModelCd" , width:120 ,hidden:true}//LTSMODELCD
            ]
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

        if(isTablet == "true"){
            //그리드 설정
              $("#workProcessGrid").kendoExtGrid({
                  gridId:"G-SER-0626-162214"
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
                                  //params["lastIndex"] = 100; //options.skip + options.take;
                                  //20200528 update by tjx 调整显示维修项目条数最大值
                                  params["lastIndex"] = 500; //options.skip + options.take;
                                  params["sort"] = options.sort;

                                  params["sDlrCd"] = $("#dlrCd").val();
                                  params["assignYn"] = "Y";
                                  params["sRoDocNo"] = $("#roDocNo").val();
                                  params["sAllcConfStatCd"] = "03";

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
                                  ,realTecNm:{type:"string"}
                                  ,rpirTp:{type:"string", editable:false}
                                  ,rpirCd:{type:"string", editable:false}
                                  ,rpirNm:{type:"string", editable:false}
                                  ,rpirDstinCd:{type:"string", editable:false}
                                  ,wrkStatCd:{type:"string",defaultValue:""}
                                  ,qtTestCd:{type:"string"}
                                  ,carWashStatCd:{type:"string"}
                                  ,qtTestStatCd:{type:"string"}
                                  ,paintStatCd:{type:"string"}
                                  ,wrkStartDt:{type:"date", editable:false}
                                  ,wrkEndDt:{type:"date", editable:false}
                                  ,allocStartDt:{type:"date", editable:false}
                                  ,allocEndDt:{type:"date", editable:false}
                                  ,planHm:{type:"number", editable:false}
                                  ,chgExpcDlDt:{type:"date"}
                                  ,regDt:{type:"date"}
                              }
                          }
                      }
                  }
                  ,change:function(e){
                      var dataItem = this.dataItem(this.select());
                      if(dataItem != null){
                          $("#roDocNo").val(dataItem.roDocNo);

                          $('[data-for="wrk02"]').each(function(){
                              $(this).data("kendoButton").enable(false);
                          });

                          if(dataItem.wrkStatCd === "01"){ //정비대기
                              $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(false);
                              });

                              $("#rpipStart").data("kendoButton").enable(true);

                              if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(false);
                                   });
                               }
                          }

                          if(dataItem.wrkStatCd === "02"){//정비시작
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(true);
                               });

                               $("#rpipStart").data("kendoButton").enable(false);
                               $("#rpipContinue").data("kendoButton").enable(false);

                               if(dataItem.rpirTp === "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(true);
                                   });
                               }
                          }
                          if(dataItem.wrkStatCd === "03"){//정비중지
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(false);
                               });
                               $("#rpipContinue").data("kendoButton").enable(true);
                               $("#rpipCancel").data("kendoButton").enable(true);
                               if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(false);
                                   });
                               }
                          }
                          if(dataItem.wrkStatCd === "04"){//정비재개
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(true);
                               });
                               $("#rpipStart").data("kendoButton").enable(false);
                               $("#rpipContinue").data("kendoButton").enable(false);
                               if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(true);
                                   });
                               }
                          }
                          if(dataItem.wrkStatCd === "05"){//정비완료
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(false);
                               });
                               $("#rpipCancel").data("kendoButton").enable(true);
                               if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(false);
                                   });
                               }
                          }
                          $("#saId1").val(dataItem.realTecId);
                          $("#saNm1").val(dataItem.realTecNm);
                      }
                  }
                  ,height:169
                  ,pageable:false
                  ,sortable:false
                  ,editable:false
                  ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
                  ,selectable:"row"
                  ,appendEmptyColumn:false           //빈컬럼 적용. default:false
                  ,filterable:false                 // 필터링 기능 사용안함
                  ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
                  ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
                  ,autoBind:false
                  ,columns:[
                      {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                      ,sortable:false
                      ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"}
                      ,{field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes:{"class":"al"}}//정비코드
                      ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250, attributes:{"class":"al"}}//정비항목
                      ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                          ,template:"#=rpirStatGrid(rpirTp)#"
                      }//정비유형
                      ,{field:"wrkStatCd", title:"<spring:message code='ser.lbl.processWorkStat' />", width:80, attributes:{"class":"ac"}
                         ,template:"#=progressStatGrid(wrkStatCd)#"
                      }//정비진도상태
                      ,{field:"wrkStartDt", title:"<spring:message code='ser.lbl.wrkStartDt' />", width:120//수리시작시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"wrkEndDt", title:"<spring:message code='ser.lbl.wrkEndDt' />", width:120//수리완료시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"allocStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:120//예정시작시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"allocEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120//예정완료시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"realTecId", hidden:true}//테크니션
                      ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"al"}
                          ,editor:function(container, options) {
                              $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                              .appendTo(container)
                          }
                      }//테크니션
                      ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:80, attributes:{"class":"al"}}//직원번호
                      ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"al"}
                           ,editor:function(container, options) {
                              $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                              .appendTo(container)
                          }
                      }//정비반조
                      ,{field:"wkgrpNo", title:"<spring:message code='ser.lbl.wrkTeamNo' />", width:80, attributes:{"class":"al"}}//반조번호
                      ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:80, attributes:{"class":"al"}}//bayNm
                      ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"al"}}//bayNo
                      ,{field:"shtCnt", title:"<spring:message code='ser.lbl.serCnt'/>", width:60, attributes:{"class":"ar"}}//정비건수
                      ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ar"}}//난이도계수
                      ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ar"}}
                      ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:80, attributes:{"class":"al"}}//정비배정자
                      ,{field:"paintStatCd", title:"<spring:message code='ser.lbl.paintStatus' />", width:80, attributes:{"class":"ac"}
                          ,template:"#=paintStatGrid(paintStatCd)#"
                       }//페인트상태
                      ,{field:"pauseCauCd", title:"<spring:message code='ser.lbl.pauseCau' />", width:80, attributes:{"class":"ac"}
                          ,template:"#=pauseStatGrid(pauseCauCd)#"
                      }//중지원인
                      ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                      ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ar"}, hidden:true}
                      ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}, hidden:true}
                      ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                      ,{field:"chgExpcDlDt", hidden:true}
                  ]

              });
          }else{
            //그리드 설정
              $("#workProcessGrid").kendoExtGrid({
                  gridId:"G-SER-1011-000102"
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
                                  params["lastIndex"] = 500; //options.skip + options.take;
                                  params["sort"] = options.sort;

                                  params["sDlrCd"] = $("#dlrCd").val();
                                  params["assignYn"] = "Y";
                                  params["sRoDocNo"] = $("#roDocNo").val();
                                  params["sAllcConfStatCd"] = "03";

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
                                  ,realTecNm:{type:"string"}
                                  ,rpirTp:{type:"string", editable:false}
                                  ,rpirCd:{type:"string", editable:false}
                                  ,rpirNm:{type:"string", editable:false}
                                  ,rpirDstinCd:{type:"string", editable:false}
                                  ,wrkStatCd:{type:"string",defaultValue:""}
                                  ,qtTestCd:{type:"string"}
                                  ,carWashStatCd:{type:"string"}
                                  ,qtTestStatCd:{type:"string"}
                                  ,paintStatCd:{type:"string"}
                                  ,wrkStartDt:{type:"date", editable:false}
                                  ,wrkEndDt:{type:"date", editable:false}
                                  ,allocStartDt:{type:"date", editable:false}
                                  ,allocEndDt:{type:"date", editable:false}
                                  ,planHm:{type:"number", editable:false}
                                  ,chgExpcDlDt:{type:"date"}
                                  ,regDt:{type:"date"}
                              }
                          }
                      }
                  }
                  ,change:function(e){
                      var dataItem = this.dataItem(this.select());

                      if(dataItem != null){
                          $("#roDocNo").val(dataItem.roDocNo);

                          $('[data-for="wrk02"]').each(function(){
                              $(this).data("kendoButton").enable(false);
                          });

                          if(dataItem.wrkStatCd === "01"){ //정비대기
                              $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(false);
                              });

                              $("#rpipStart").data("kendoButton").enable(true);

                              if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(false);
                                   });
                               }
                          }

                          if(dataItem.wrkStatCd === "02"){//정비시작
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(true);
                               });

                               $("#rpipStart").data("kendoButton").enable(false);
                               $("#rpipContinue").data("kendoButton").enable(false);

                               if(dataItem.rpirTp === "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(true);
                                   });
                               }
                          }
                          if(dataItem.wrkStatCd === "03"){//정비중지
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(false);
                               });
                               $("#rpipContinue").data("kendoButton").enable(true);
                               $("#rpipCancel").data("kendoButton").enable(true);
                               if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(false);
                                   });
                               }
                          }
                          if(dataItem.wrkStatCd === "04"){//정비재개
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(true);
                               });
                               $("#rpipStart").data("kendoButton").enable(false);
                               $("#rpipContinue").data("kendoButton").enable(false);
                               if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(true);
                                   });
                               }
                          }
                          if(dataItem.wrkStatCd === "05"){//정비완료
                               $('[data-for="wrk01"]').each(function(){
                                   $(this).data("kendoButton").enable(false);
                               });
                               $("#rpipCancel").data("kendoButton").enable(true);
                               if(dataItem.rpirTp == "04"){
                                   $('[data-for="wrk02"]').each(function(){
                                       $(this).data("kendoButton").enable(false);
                                   });
                               }
                          }
                          $("#saId1").val(dataItem.realTecId);
                          $("#saNm1").val(dataItem.realTecNm);
                      }
                  }
                  ,dataBound:function(e) {
                      $(".k-grid-content").css('overflow-y','scroll');
                  }
                  ,height:140
                  ,autoBind:false
                  ,pageable:false
                  ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
                  ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
                  ,filterable:false                 // 필터링 기능 사용안함
                  ,editable :false
                  ,sortable:false
                  ,selectable:_selectable
                  ,columns:[
                       {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes:{"class":"al"}}//정비코드
                      ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250, attributes:{"class":"al"}}//정비항목
                      ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                          ,template:"#=rpirStatGrid(rpirTp)#"
                      }//정비유형
                      ,{field:"wrkStatCd", title:"<spring:message code='ser.lbl.processWorkStat' />", width:80, attributes:{"class":"ac"}
                         ,template:"#=progressStatGrid(wrkStatCd)#"
                      }//정비진도상태
                      ,{field:"wrkStartDt", title:"<spring:message code='ser.lbl.wrkStartDt' />", width:120//수리시작시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"wrkEndDt", title:"<spring:message code='ser.lbl.wrkEndDt' />", width:120//수리완료시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"allocStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:120//예정시작시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"allocEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120//예정완료시간
                          ,attributes:{"class":"ac"}
                          ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                      }
                      ,{field:"realTecId", hidden:true}//테크니션
                      ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"al"}
                          ,editor:function(container, options) {
                              $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                              .appendTo(container)
                          }
                      }//테크니션
                      ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:80, attributes:{"class":"al"}}//직원번호
                      ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"al"}
                           ,editor:function(container, options) {
                              $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                              .appendTo(container)
                          }
                      }//정비반조
                      ,{field:"wkgrpNo", title:"<spring:message code='ser.lbl.wrkTeamNo' />", width:80, attributes:{"class":"al"}}//반조번호
                      ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:80, attributes:{"class":"al"}}//bayNm
                      ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"al"}}//bayNo
                      ,{field:"shtCnt", title:"<spring:message code='ser.lbl.serCnt'/>", width:60, attributes:{"class":"ar"}}//정비건수
                      ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ar"}}//난이도계수
                      ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ar"}}
                      ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:80, attributes:{"class":"al"}}//정비배정자
                      ,{field:"paintStatCd", title:"<spring:message code='ser.lbl.paintStatus' />", width:80, attributes:{"class":"ac"}
                          ,template:"#=paintStatGrid(paintStatCd)#"
                       }//페인트상태
                      ,{field:"pauseCauCd", title:"<spring:message code='ser.lbl.pauseCau' />", width:80, attributes:{"class":"ac"}
                          ,template:"#=pauseStatGrid(pauseCauCd)#"
                      }//중지원인
                      ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                      ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ar"}, hidden:true}
                      ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}, hidden:true}
                      ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                      ,{field:"chgExpcDlDt", hidden:true}
                  ]

              });
          }


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

        if(isTablet=="true") {
            if(window.matchMedia('(max-width:1024px)').matches){
                var colEmt=$("#workProcColGroup col");
                $(colEmt[0]).css("width","7%");
                $(colEmt[2]).css("width","7%");

                $("#roListGrid").parents(".table_grid").attr("style","width:938px !important; max-width:938px !important");
            }
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
                    $("#roDocNo").val(dataItem.roDocNo);

                    $('[data-for="wrk02"]').each(function(){
                        $(this).data("kendoButton").enable(false);
                    });

                    if(dataItem.wrkStatCd === "01"){ //정비대기
                        $('[data-for="wrk01"]').each(function(){
                             $(this).data("kendoButton").enable(false);
                        });

                        $("#rpipStart").data("kendoButton").enable(true);

                        if(dataItem.rpirTp == "04"){
                             $('[data-for="wrk02"]').each(function(){
                                 $(this).data("kendoButton").enable(false);
                             });
                         }
                    }

                    if(dataItem.wrkStatCd === "02"){//정비시작
                         $('[data-for="wrk01"]').each(function(){
                             $(this).data("kendoButton").enable(true);
                         });

                         $("#rpipStart").data("kendoButton").enable(false);
                         $("#rpipContinue").data("kendoButton").enable(false);

                         if(dataItem.rpirTp === "04"){
                             $('[data-for="wrk02"]').each(function(){
                                 $(this).data("kendoButton").enable(true);
                             });
                         }
                    }
                    if(dataItem.wrkStatCd === "03"){//정비중지
                         $('[data-for="wrk01"]').each(function(){
                             $(this).data("kendoButton").enable(false);
                         });
                         $("#rpipContinue").data("kendoButton").enable(true);
                         $("#rpipCancel").data("kendoButton").enable(true);
                         if(dataItem.rpirTp == "04"){
                             $('[data-for="wrk02"]').each(function(){
                                 $(this).data("kendoButton").enable(false);
                             });
                         }
                    }
                    if(dataItem.wrkStatCd === "04"){//정비재개
                         $('[data-for="wrk01"]').each(function(){
                             $(this).data("kendoButton").enable(true);
                         });
                         $("#rpipStart").data("kendoButton").enable(false);
                         $("#rpipContinue").data("kendoButton").enable(false);
                         if(dataItem.rpirTp == "04"){
                             $('[data-for="wrk02"]').each(function(){
                                 $(this).data("kendoButton").enable(true);
                             });
                         }
                    }
                    if(dataItem.wrkStatCd === "05"){//정비완료
                         $('[data-for="wrk01"]').each(function(){
                             $(this).data("kendoButton").enable(false);
                         });
                         $("#rpipCancel").data("kendoButton").enable(true);
                         if(dataItem.rpirTp == "04"){
                             $('[data-for="wrk02"]').each(function(){
                                 $(this).data("kendoButton").enable(false);
                             });
                         }
                    }
                    $("#saId1").val(dataItem.realTecId);
                    $("#saNm1").val(dataItem.realTecNm);
                }
            }else{
                //기본체크버튼 이벤트를 막는다. 이후 tr클릭 이벤트를 탄다.
                $(e.currentTarget).prop("checked")? $(e.currentTarget).prop("checked",false) : $(e.currentTarget).prop("checked",true);
            }

        }
    });

    // 작업중지 팝업
    $("#rpipPause").kendoButton({
        click:function(e)
        {
            var grid = $("#workProcessGrid").data("kendoExtGrid");
            var dataItem = grid.dataItem(grid.select());
            var roGrid = $("#roListGrid").data("kendoExtGrid");
            var expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
            var chgExpcDlDt = $("#chgExpcDlDt").data("kendoExtMaskedDateTimePicker").value();
            var workPauseData = [];

            grid.select().each(function(i, row){
                workPauseData.push(grid.dataItem(row));
            });

            pauseCausePopup = dms.window.popup({
                windowId:"pauseCausePopup"
                ,title:"<spring:message code='ser.btn.lbrStop' />"   // 작업중지
                ,modal : true
                ,content:{
                    url:"<c:url value='/ser/ro/workProcess/selectPauseCausePopup.do'/>"
                    ,data:{
                        "workPauseData":workPauseData
                        ,"expcDlDt":expcDlDt
                        ,"chgExpcDlDt":chgExpcDlDt
                        ,"selectable":_selectable
                        ,"callbackFunc":function(wrkData, wrkPauseData, chgExpcDlDt){

                            var grid = $("#workProcessGrid").data("kendoExtGrid");
                            var dataItem = grid.dataItem(grid.select());
                            var roGrid = $("#roListGrid").data("kendoExtGrid");
                            row1 = roGrid.select().index();
                            var workProcessData = [];

                            grid.select().each(function(i, row){
                                grid.dataItem(row).dlrCd     = $("#dlrCd").val();
                                grid.dataItem(row).roDocNo   = $("#roDocNo").val();
                                grid.dataItem(row).roGrpNo   = $("#roGrpNo").val();
                                grid.dataItem(row).wrkStatCd = "03";
                                grid.dataItem(row).type = "04";
                                grid.dataItem(row).pauseCauCd  = wrkData[i].pauseCauCd;
                                grid.dataItem(row).pauseCauRmk = wrkData[i].pauseCauRmk;
                                grid.dataItem(row).chgExpcDlDt = chgExpcDlDt;
                                workProcessData.push(grid.dataItem(row));
                            });

                            var workPauseDataList = [];

                            $.each(wrkPauseData, function(i,data){
                                var param = {
                                     roDocNo      :  $("#roDocNo").val()
                                    ,rpirTp       :  this.lbrTp
                                    ,rpirCd       :  this.lbrCd
                                    ,rpirNm       :  this.lbrNm
                                    ,rpirDstinCd  :  this.dstinCd
                                    ,planHm       :  this.lbrHm
                                    ,allocHm      :  this.allocHm
                                    ,pauseRemark  :  this.pauseRemark
                                    ,lineNo       :  this.lineNo
                                }
                                workPauseDataList.push(param);
                            });

                            var params = $.extend(
                                {"workPauseListVO":workPauseDataList}
                                ,{"workProcessListVO":workProcessData}
                            );

                            $.ajax({
                                url:"<c:url value='/ser/ro/workProcess/updatePauseWorkProcesss.do' />",
                                data:JSON.stringify(params),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(jqXHR, textStatus) {

                                    setGridRows();

                                    roGrid.dataSource.page(1);
                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.data([]);

                                    $(".btn_s").each(function(){
                                        $(this).data("kendoButton").enable(false)
                                    });
                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");
                                    $(".checkAll").attr("checked", false);
                                }
                                ,beforeSend:function(xhr){
                                    dms.loading.show($("#resizableContainer"));
                                }
                                ,complete:function(xhr,status){
                                    dms.loading.hide($("#resizableContainer"));
                                }
                            });
                        }
                    }
                }
                ,height:_height
                ,width:900
            });
        }
    });


    // 정비 팝업
    lbrCodePopup = function(iframe){

        laborSearchPopup = dms.window.popup({
            windowId:"laborSearchPopup"
            ,height:400
            //,width:600
            ,title:"<spring:message code='ser.lbl.lbrNm' />"
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"selectable":"multiple"
                    ,"sLtsModelCd": $("#ltsModelCd").val()
                    ,"callbackFunc":function(jsonObj){

                        var windowElement = $("#"+iframe);
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;

                        iframeWindowObject.lbrAdd( jsonObj );
                        //laborSearchPopup.close();

                        /* if(jsonObj.length > 0) {
                            lbrAdd(jsonObj, "N");
                        } */
                    }
                }
            }
        });
    }

    // 작업재개 팝업
    $("#rpipContinue").kendoButton({
        click:function(e)
        {
            var grid = $("#workProcessGrid").data("kendoExtGrid");
            var dataItem = grid.dataItem(grid.select());

            pauseRestartPopup = dms.window.popup({
                windowId:"rpipContinuePopup"
                ,title:"<spring:message code='ser.btn.lbrRestart' />"   // 작업재개
                ,content:{
                    url:"<c:url value='/ser/ro/workProcess/selectWorkRestartPopup.do'/>"
                    ,data:{
                        "autoBind":true
                        ,"expcDlDt":$("#expcDlDt").data("kendoExtMaskedDateTimePicker").value()
                        ,"wrkEndDt":dataItem.wrkEndDt
                        ,"callbackFunc":function(){

                            saveWorkProcee('04','saNm1','saId1','04');
                        }
                    }
                }
                ,height:150
                ,width:400
            });
        }
    });

    //버튼 - 저장
    function saveWorkProcee(stat, saNm, saId, type) {//'03','saNm1','saId1','04'

        var grid = $("#workProcessGrid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());
        var roGrid = $("#roListGrid").data("kendoExtGrid");

        /*
        row1 = roGrid.select().index();
         */
        setGridRows();
        var workProcessData = [];

        if(dataItem==null){
            dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
            return;
        }
        if($("#"+saId).val() == "" && saId == "saId1"){
            dms.notification.info("<spring:message code='ser.lbl.tecNm' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
            return;
        }

        grid.select().each(function(i, row){
            grid.dataItem(row).dlrCd     = $("#dlrCd").val();
            grid.dataItem(row).roDocNo   = $("#roDocNo").val();
            grid.dataItem(row).roGrpNo   = $("#roGrpNo").val();
            grid.dataItem(row).realTecId = $("#"+saId).val();
            grid.dataItem(row).realTecNm = $("#"+saNm).val();
            grid.dataItem(row).wrkStatCd = stat;
            grid.dataItem(row).type = type;
            if(stat == "03"){
                grid.dataItem(row).chgExpcDlDt = $("#chgExpcDlDt").data("kendoExtMaskedDateTimePicker").value();
            }
            workProcessData.push(grid.dataItem(row));
        });

        $.ajax({
            url:"<c:url value='/ser/ro/workProcess/insertWorkProcesss.do' />",
            data:JSON.stringify(workProcessData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                roGrid.dataSource.page(1);
                grid.dataSource._destroyed = [];
                grid.dataSource.data([]);

                $(".btn_s").each(function(){
                    $(this).data("kendoButton").enable(false)
                });
                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                $(".checkAll").attr("checked", false);
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    };

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
                            if(number=='1'){
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
        $("#tSecondGrid").css("display","none");
        $(".table_form").eq(0).css("display","block");
        $(".table_form").eq(2).css("display","none");
        $(".mt5").css("display","none");
        $("#backward").css("visibility","hidden");
        $("#tDataTable").css("display","none");
    };
    //jhg tablet
    showSecondPage = function() {
        $(".table_grid").eq(0).css("display","none");
        $("#tSecondGrid").css("display","block");
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

</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript" src="<c:url value='/resources/js/dms/comerstone.js' />"></script>

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// var toDay = "2016-07-20";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

// 공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>


// DEPLOY유형:COM023
var deployTpList = [];
<c:forEach var="obj" items="${deployTpDS}">
    deployTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployTpArray = [];
$.each(deployTpList, function(idx, obj){
    deployTpArray[obj.cmmCd] = obj.cmmCdNm;
});

// DEPLOY상태:COM024
var deployStatList = [];
<c:forEach var="obj" items="${deployStatDS}">
    deployStatList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployStatArray = [];
$.each(deployStatList, function(idx, obj){
    deployStatArray[obj.cmmCd] = obj.cmmCdNm;
});

// 스케줄유형코드:COM034
var scheduleTpList = [];
<c:forEach var="obj" items="${scheduleTpDS}">
    scheduleTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var scheduleTpArray = [];
$.each(scheduleTpList, function(idx, obj){
    scheduleTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY서비스작업명령어코드:COM035
var operCmdTpList = [];
<c:forEach var="obj" items="${operCmdTpDS}">
operCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var operCmdTpArray = [];
$.each(operCmdTpList, function(idx, obj){
    operCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//PROPERTY파일타입코드:COM038
var prtyFileTpList = [];
<c:forEach var="obj" items="${prtyFileTpDS}">
prtyFileTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var prtyFileTpArray = [];
$.each(prtyFileTpList, function(idx, obj){
    prtyFileTpArray[obj.cmmCd] = obj.cmmCdNm;
});
prtyFileTpArray[null] = "";


//Command Deploy 실행유형코드:COM048
var commandSpecTpList = [];
<c:forEach var="obj" items="${commandSpecTpDS}">
commandSpecTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var commandSpecTpArray = [];
$.each(commandSpecTpList, function(idx, obj){
    commandSpecTpArray[obj.cmmCd] = obj.cmmCdNm;
});
commandSpecTpArray[null] = "";


</script>



<!-- Spec List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic"><spring:message code='cmm.title.specList'/></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12278" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12278" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnRemove" class="btn_m btn_delete"><spring:message code='global.btn.del' /></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>

                    <th scope="row"><spring:message code='global.lbl.specCd' /></th>
                    <td>
                        <input id="sSpecCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.specNm' /></th>
                    <td>
                        <input id="sSpecNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th>		<!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartRegDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndRegDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->

    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active"><spring:message code='global.title.basicInfo' /></li>
            <li><spring:message code='global.lbl.appDeploy' /></li>
<%--            <li><spring:message code='global.lbl.repositoryDeploy' /></li> --%>
            <li><spring:message code='global.lbl.commandDeploy' /></li>
            <li><spring:message code='global.lbl.sqlDeploy' /></li>
            <li><spring:message code='global.lbl.propertyDeploy' /></li>
            <li><spring:message code='global.lbl.fileDeploy' /></li>
            <li><spring:message code='global.lbl.deployPolicy' /></li>
        </ul>



        <!-- 기본정보 -->
        <div>
            <form id="basicForm" name="basicForm" method="POST" onsubmit="return false;">
                <!-- SPEC 기본정보 -->
                <section class="group">
                    <div class="table_form" id="specInfoForm01" style="height:200px">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:14%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:12%;">
                                <col style="width:13%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.specCd' /></th>                       <!-- SPEC코드 -->
                                    <td>
                                        <input id="specCd" name="specCd" readonly class="form_input form_readonly" data-json-obj="true">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.specNm' /></th>                         <!-- SPEC명 -->
                                    <td>
                                        <input id="specNm" name="specNm" class="form_input" data-json-obj="true">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.regDt' /></th>                         <!-- 등록일 -->
                                    <td>
                                        <input id="regDt" name="regDt" readonly class="form_datepicker" data-json-obj="true">
                                    </td>
                                    <th scope="row"></th>
                                    <td></td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.specCont' /></th>       <!-- Note -->
                                    <td colspan="7">
                                        <textarea id="specCont" name="specCont" rows="3" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </section>
                <!-- //SPEC 기본정보 -->
            </form>
        </div>
        <!-- //기본정보 -->

        <!-- Service 배포정보 -->
        <div>
            <form id="serviceForm" name="serviceForm" method="POST" onsubmit="return false;">
                <!-- Service LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="serviceGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm02">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:13%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.bundleNm'/></th>
                                    <td>
                                        <input id="service_symbolicNm" name="service_symbolicNm" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row">Version</th>
                                    <td>
                                        <input id="service_bundleVerNo" name="service_bundleVerNo" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.operCmdNm'/></th>
                                    <td>
                                        <input id="service_operCmdNm" name="service_operCmdNm" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.rollbackOperCmdNm'/></th>
                                    <td>
                                        <input id="service_rollbackOperCmdNm" name="service_rollbackOperCmdNm" data-json-obj="true" class="form_comboBox">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>                       <!-- 작업시도횟수 -->
                                    <td>
                                        <input id="service_operTryCnt" name="service_operTryCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>                         <!-- 실패이후계속진행여부 -->
                                    <td>
                                        <input id="service_failAftCtnuPgssYn" name="service_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>                         <!-- 실패이후롤백여부 -->
                                    <td>
                                        <input id="service_failAftRollbackYn" name="service_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployProrVal'/></th>
                                    <td>
                                        <input id="service_deployProrVal" name="service_deployProrVal" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!--  Service LIST -->
            </form>
        </div>
        <!-- Service 배포정보 -->

        <!-- Repository -->
        <%-- <div>
            <form id="repositoryForm" name="repositoryForm" method="POST" onsubmit="return false;">
                <!-- repository LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="repositoryGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm03">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:13%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <tbody>

                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.repoUrlNm'/></th>
                                    <td colspan="5">
                                        <input id="repository_repoUrlNm" name="repository_repoUrlNm" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.operCmdNm'/></th>
                                    <td>
                                        <input id="repository_operCmdNm" name="repository_operCmdNm" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>
                                    <td>
                                        <input id="repository_operTryCnt" name="repository_operTryCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>
                                    <td>
                                        <input id="repository_failAftCtnuPgssYn" name="repository_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>
                                    <td>
                                        <input id="repository_failAftRollbackYn" name="repository_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.rollbackOperCmdNm'/></th>
                                    <td>
                                        <input id="repository_rollbackOperCmdNm" name="repository_rollbackOperCmdNm" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!--  repository LIST -->
            </form>
        </div> --%>
        <!-- Repository -->


        <!-- Command -->
        <div>
            <form id="commandForm" name="commandForm" method="POST" onsubmit="return false;">
                <!-- command LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="commandGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm04">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:13%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.workType'/></th>
                                    <td>
                                        <input id="command_specTpNm" name="command_specTpNm" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>
                                    <td>
                                        <input id="command_failAftCtnuPgssYn" name="command_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>
                                    <td>
                                        <input id="command_failAftRollbackYn" name="command_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployProrVal'/></th>
                                    <td>
                                        <input id="command_deployProrVal" name="command_deployProrVal" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operCmdNm'/></th>
                                    <td colspan="3">
                                        <input id="command_operCmdNm" name="command_operCmdNm" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.operDirNm'/></th>
                                    <td colspan="3">
                                        <input id="command_operDirNm" name="command_operDirNm" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operCmdEnvCont'/></th>
                                    <td colspan="7">
                                        <textarea id="command_operCmdEnvCont" name="command_operCmdEnvCont" rows="4" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.rollbackOperCmdNm'/></th>
                                    <td colspan="3">
                                        <input id="command_rollbackOperCmdNm" name="command_rollbackOperCmdNm" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.rollbackOperDirNm'/></th>
                                    <td colspan="3">
                                        <input id="command_rollbackOperDirNm" name="command_rollbackOperDirNm" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.rollbackOperCmdEnvCont'/></th>
                                    <td colspan="7">
                                        <textarea id="command_rollbackOperCmdEnvCont" name="command_rollbackOperCmdEnvCont" rows="4" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.successDecisionStr'/></th>
                                    <td colspan="3">
                                        <input id="command_successDecisionStr" name="command_successDecisionStr" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failDecisionStr'/></th>
                                    <td colspan="3">
                                        <input id="command_failDecisionStr" name="command_failDecisionStr" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!--  command LIST -->
            </form>
        </div>
        <!-- Command -->


        <!-- SQL -->
        <div>
            <form id="sqlForm" name="sqlForm" method="POST" onsubmit="return false;">
                <!-- SQL Scripts LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="sqlGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm05">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:13%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>                       <!-- 작업시도횟수 -->
                                    <td>
                                        <input id="operTryCnt" name="operTryCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>                         <!-- 실패이후계속진행여부 -->
                                    <td>
                                        <input id="failAftCtnuPgssYn" name="failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                                        <!-- input data-role="autocomplete" data-text-field="name" data-bind="source:colors, value:autoCompleteValue" -->
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>                         <!-- 실패이후롤백여부 -->
                                    <td>
                                        <input id="failAftRollbackYn" name="failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployProrVal'/></th>
                                    <td>
                                        <input id="deployProrVal" name="deployProrVal" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.rollbackProrVal'/></th>                         <!-- 롤백우선순위값 -->
                                    <td>
                                        <input id="rollbackProrVal" name="rollbackProrVal" class="form_input" data-json-obj="true" >
                                    </td>
                                    <td colspan="6"></td>
                                </tr>
                                <tr>
                                    <th scope="row">SQL Scripts</th>        <!-- SQL텍스트내용 -->
                                    <td colspan="7">
                                        <textarea id="sqlTextCont" name="sqlTextCont" rows="4" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                                        <!-- textarea id="sqlTextCont" name="sqlTextCont" rows="4" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" data-bind="source:mvvm_dataSource, value:sqlTextCont"></textarea -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Rollback SQL</th>       <!-- 롤백SQL텍스트내용 -->
                                    <td colspan="7">
                                        <textarea id="rollbackSqlTextCont" name="rollbackSqlTextCont" rows="4" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!--  SQL Scripts LIST -->
            </form>
        </div>
        <!-- SQL -->


        <!-- Property -->
        <div>
            <form id="prtyForm" name="prtyForm" method="POST" onsubmit="return false;">
                <!-- PROPERTY LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="prtyGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm06">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:13%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.prtyFileNm'/></th>                         <!-- PROPERTY파일명 -->
                                    <td colspan="3">
                                        <input id="prty_prtyFileNm" name="prty_prtyFileNm" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.prtyKeyNm'/></th>                         <!-- PROPERTY키명 -->
                                    <td>
                                        <input id="prty_prtyKeyNm" name="prty_prtyKeyNm" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.prtyKeyVal'/></th>                         <!-- PROPERTY키값 -->
                                    <td>
                                        <input id="prty_prtyKeyVal" name="prty_prtyKeyVal" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>                       <!-- 작업시도횟수 -->
                                    <td>
                                        <input id="prty_operTryCnt" name="prty_operTryCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>                       <!-- 실패이후계속진행여부 -->
                                    <td>
                                        <input id="prty_failAftCtnuPgssYn" name="prty_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>                         <!-- 실패이후롤백여부 -->
                                    <td>
                                        <input id="prty_failAftRollbackYn" name="prty_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.prtyFileTpNm'/></th>
                                    <td>
                                        <input id="prty_prtyFileTpNm" name="prty_prtyFileTpNm" data-json-obj="true" class="form_comboBox">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!--  PROPERTY LIST -->
            </form>

        </div>
        <!-- Property -->


        <!-- File -->
        <div>
            <form id="fileForm" name="fileForm" method="POST" onsubmit="return false;">
                <!-- FILE LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="fileGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm07">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:13%;">
                                <col style="width:14%;">
                                <col style="width:11%;">
                                <col style="width:12%;">
                                <col style="width:11%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>                       <!-- 작업시도횟수 -->
                                    <td>
                                        <input id="file_operTryCnt" name="file_operTryCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.dlrCdAutoAddYn'/></th>                         <!-- 딜러코드자동추가여부 -->
                                    <td>
                                        <input id="file_dlrCdAutoAddYn" name="file_dlrCdAutoAddYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>                         <!-- 실패이후계속진행여부 -->
                                    <td>
                                        <input id="file_failAftCtnuPgssYn" name="file_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>                         <!-- 실패이후롤백여부 -->
                                    <td>
                                        <input id="file_failAftRollbackYn" name="file_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.srcFilePathNm'/></th>                       <!-- 소스파일경로명 -->
                                    <td colspan="7">
                                        <input id="file_srcFilePathNm" name="file_srcFilePathNm" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.targFilePathNm'/></th>                         <!-- 대상파일경로명 -->
                                    <td colspan="7">
                                        <input id="file_targFilePathNm" name="file_targFilePathNm" class="form_input" data-json-obj="true" >
                                        <input id="file_bakTargFilePathNm" name="file_bakTargFilePathNm" type="hidden" data-json-obj="true" >
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </section>
                <!--  PROPERTY LIST -->
            </form>

        </div>
        <!-- File -->


        <!-- Policy -->
        <div>
            <form id="dplyMastForm" name="dplyMastForm" method="POST" onsubmit="return false;">
                <!-- DEPLOY MASTER LIST -->
                <section class="group">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="dplyMastGrid"></div>
                    </div>
                    <!-- 그리드 종료 -->

                    <div class="table_form" id="specInfoForm08">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:17%;">
                                <col style="width:17%;">
                                <col style="width:17%;">
                                <col style="width:17%;">
                                <col style="width:15%;">
                                <col style="width:17%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.deployVerNo' /></th>                       <!-- DEPLOY버전번호 -->
                                    <td>
                                        <input id="deployVerNo" name="deployVerNo" readonly class="form_input form_readonly" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployTpCd' /></th>                         <!-- DEPLOY유형코드 -->
                                    <td>
                                        <input id="deployTpCd" name="deployTpCd" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.scheduleTpCd' /></th>                       <!--  -->
                                    <td>
                                        <input id="scheduleTpCd" name="scheduleTpCd" data-json-obj="true" class="form_comboBox">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.deployStatCd' /></th>                       <!-- DEPLOY상태코드 -->
                                    <td class="readonly_area">
                                        <input id="deployStatCd" name="deployStatCd" readonly data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployStartDt' /></th>                         <!-- DEPLOY시작일자 -->
                                    <td>
                                        <input id="deployStartDt" name="deployStartDt" data-json-obj="true" class="form_datetimepicker">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployEndDt' /></th>                         <!-- DEPLOY종료일자 -->
                                    <td>
                                        <input id="deployEndDt" name="deployEndDt" data-json-obj="true" class="form_datetimepicker">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.deployRetryCnt' /></th>                         <!-- DEPLOY재시도횟수 -->
                                    <td>
                                        <input id="deployRetryCnt" name="deployRetryCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.deployRetryIvalVal' /></th>                         <!-- DEPLOY재시도간격값 -->
                                    <td>
                                        <input id="deployRetryIvalVal" name="deployRetryIvalVal" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.rsltReceiveTmoutHm' /></th>                         <!-- 결과수신타임아웃시간 -->
                                    <td>
                                        <input id="rsltReceiveTmoutHm" name="rsltReceiveTmoutHm" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.achkFailAlwYn' /></th>                       <!--  -->
                                    <td>
                                        <input id="achkFailAlwYn" name="achkFailAlwYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.achkFailAlwCnt' /></th>                         <!-- ALIVECHECK실패허용건수 -->
                                    <td>
                                        <input id="achkFailAlwCnt" name="achkFailAlwCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.alwFailDmsCnt' /></th>                         <!-- 허용실패DMS건수 -->
                                    <td>
                                        <input id="alwFailDmsCnt" name="alwFailDmsCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.dmsGrpCnt' /></th>                         <!-- DMS그룹건수 -->
                                    <td>
                                        <input id="dmsGrpCnt" name="dmsGrpCnt" class="form_input" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.procRsltNotiYn' /></th>                       <!-- 실패이후계속진행여부 -->
                                    <td>
                                        <input id="procRsltNotiYn" name="procRsltNotiYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.procRsltNotiEndYn' /></th>                       <!-- 처리결과공지완료여부 -->
                                    <td>
                                        <input id="procRsltNotiEndYn" name="procRsltNotiEndYn" data-json-obj="true" class="form_comboBox">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.procRsltNotiEndDt' /></th>                       <!-- 처리결과공지완료일자 -->
                                    <td class="readonly_area">
                                        <input id="procRsltNotiEndDt" name="procRsltNotiEndDt" readonly class="form_datetimepicker" data-json-obj="true" >
                                    </td>
                                    <td colspan="4"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="clfix">
                        <section class="content_left" style="width:200px;">
                            <div class="header_area">
                                <h3 class="title_basic"><spring:message code='global.title.deployGroup' /></h3>
                                <div class="btn_right">
                                </div>
                            </div>
                            <div class="table_grid">
                                <div id="dplyGrpGrid"></div>
                            </div>
                        </section>
                        <section class="content_right" style="margin-left:210px;">
                            <div class="header_area">
                                <h3 class="title_basic"><spring:message code='global.title.deployGroupDetail' /></h3>
                            </div>
                            <div class="table_grid">
                                <div id="dplyDlrGrid"></div>
                            </div>
                        </section>
                    </div>
                </section>
                <!--  DEPLOY MASTER LIST -->
            </form>

        </div>
        <!-- Policy -->

    </div>

</section>

<script type="text/javascript">

var gv_serviceGridModel_currUid = null;
var gv_repositoryGridModel_currUid = null;
var gv_commandGridModel_currUid = null;
var gv_sqlGridModel_currUid = null;
var gv_prtyGridModel_currUid = null;
var gv_fileGridModel_currUid = null;
var gv_dplyMastGridModel_currUid = null;

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var idx = $(e.item).index();

            if(idx == 0) {  // 기본정보

            } else if(idx == 1) {  // Service 배보정보
                $('#serviceGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#serviceGrid').data('kendoExtGrid').dataSource.read();

            } /* else if(idx == 2) {  // Repository 배보정보
                $('#repositoryGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#repositoryGrid').data('kendoExtGrid').dataSource.read();

            } */ else if(idx == 2) {  // Command 배보정보
                $('#commandGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#commandGrid').data('kendoExtGrid').dataSource.read();

            } else if(idx == 3) {  // SQL 배보정보
                $('#sqlGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#sqlGrid').data('kendoExtGrid').dataSource.read();

            } else if(idx == 4) {  // Property 배보정보
                $('#prtyGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#prtyGrid').data('kendoExtGrid').dataSource.read();

            } else if(idx == 5) {  // File 배보정보
                $('#fileGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#fileGrid').data('kendoExtGrid').dataSource.read();

            } else if(idx == 6) {  // 배포정책
                $('#dplyMastGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyMastGrid').data('kendoExtGrid').dataSource.read();

            }
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initPage();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 삭제
    $("#btnRemove").kendoButton({
        click:function(e) {
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();

            // 삭제할 수 있는 SPEC 확인하는 코드 (Deploy 진행 전 SPEC 확인)
            var checkVal = checkPossibleDeletingSpec(grid.dataItem(rows[0]).specCd);

            if( !checkVal ) {
                dms.notification.error("<spring:message code='cmm.info.noDeletedSpec' />");       // 삭제할 수 없는 배포정의서입니다
                return false;
            }

//             return;

            // 삭제하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.del' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }
            if(rows !== null) {
                var deleteList = [];

                $.each(rows, function(idx, row){
                    var objRow = grid.dataItem(row);
                    var obj = {specCd:objRow.specCd};
                    deleteList.push(obj);
                });

                if(deleteList.length == 0) {
                    return false;
                }

                var param = {
                    "deleteList":deleteList
                }

//                 alert(JSON.stringify(param));

                $.ajax({
                    url:"<c:url value='/dply/spec/specMng/deleteSpec.do' />",
                    data:JSON.stringify(param),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR, status, error) {
                        //dms.notification.error(jqXHR.responseJSON.errors);
                        alert("error");

                    },
                    success:function(jqXHR, textStatus) {
//                         alert("Success !!!");
//                         alert(jqXHR.specCd);
//                         alert(jqXHR.deployVerNo);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

//                         $('#grid').data('kendoExtGrid').dataSource.read();
                        var currPage = grid.dataSource.page();
                        grid.dataSource.page(currPage);
                    }
                });

            } else {
//                 dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
            }

        }
    });


    //버튼 - 취소


    // 등록 시작일
    $("#sStartRegDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:processDate(toDay, cmmPrtyListObj['defaultDate.specList.startRegDt'], vDtyyyyMMdd)
   });

    // 등록 종료일
    $("#sEndRegDt").kendoExtMaskedDatePicker({
         format:"{0:"+vDtyyyyMMdd+"}"
        ,patternToMask:vDtyyyyMMdd
        ,value:processDate(toDay, cmmPrtyListObj['defaultDate.specList.endRegDt'], vDtyyyyMMdd)
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specList/selectSpecList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSpecCd"] = $("#sSpecCd").val();
                        params["sSpecNm"] = $("#sSpecNm").val();

                        // 등록일자
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"]   = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        mesgSeq:{type:"number", editable:false}
                        ,rnum:{type:"number", editable:false}
                        ,bundleNm:{type:"string", validation:{required:true}}
                        ,langCd:{type:"string", validation:{required:true}}
                        ,cntryCd:{type:"string"}
                        ,mesgKey:{type:"string", validation:{required:true}}
                        ,mesgTxt:{type:"string", validation:{required:true}}
                        ,lstUpdtDt:{type:"date", editable:false}
                        ,specCd:{type:"string"}
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:true
        ,height:285
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"specCd", title:"<spring:message code='global.lbl.specCd' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"specNm", title:"<spring:message code='global.lbl.specNm' />", width:250
            }

/*
            ,{field:"", title:"담당자", width:100
                ,attributes:{"class":"ac"}
            }
*/
            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:"+vDtyyyyMMdd+"}"
            }
            ,{field:"schdlDt", title:"<spring:message code='global.lbl.deployStartDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"dmsCnt", title:"<spring:message code='global.lbl.dmsCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"bdlCnt", title:"<spring:message code='global.lbl.appCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"commandCnt", title:"<spring:message code='global.lbl.commandCount' />", width:85
                ,attributes:{"class":"ac"}
            }
            ,{field:"sqlCnt", title:"<spring:message code='global.lbl.sqlCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"propCnt", title:"<spring:message code='global.lbl.propertyCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"fileCnt", title:"<spring:message code='global.lbl.fileCount' />", width:80
                ,attributes:{"class":"ac"}
            }

            ,{field:"workCnt", title:"Working", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"readyCnt", title:"Ready", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"runCnt", title:"Running", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"endCnt", title:"Completed", width:80
                ,attributes:{"class":"ac"}
            }


            ,{title:""}
        ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var data = this.dataItem(this.select());
                var param = {
                        "sSpecCd":data.specCd
                    }
                    //alert(JSON.stringify(param));

                    $.ajax({
                        url:"<c:url value='/dply/spec/specMng/selectSpecMng.do' />",
                        data:JSON.stringify(param),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR, status, error) {

                        },
                        success:function(jqXHR, textStatus) {
                            //alert(JSON.stringify(jqXHR));

                            initPage();

                            $("#specCd").val(jqXHR.specBasicVO.specCd);
                            $("#specNm").val(jqXHR.specBasicVO.specNm);
                            $("#regDt").data("kendoExtMaskedDatePicker").value(jqXHR.specBasicVO.regDt);
                            $("#specCont").val(jqXHR.specBasicVO.specCont);

/*
                            $('#serviceGrid').data('kendoExtGrid').dataSource._destroyed = [];
                            $('#repositoryGrid').data('kendoExtGrid').dataSource._destroyed = [];
                            $('#sqlGrid').data('kendoExtGrid').dataSource._destroyed = [];
                            $('#prtyGrid').data('kendoExtGrid').dataSource._destroyed = [];
                            $('#fileGrid').data('kendoExtGrid').dataSource._destroyed = [];
                            $('#commandGrid').data('kendoExtGrid').dataSource._destroyed = [];
                            $('#dplyMastGrid').data('kendoExtGrid').dataSource._destroyed = [];

                            $('#serviceGrid').data('kendoExtGrid').dataSource.read();
                            $('#repositoryGrid').data('kendoExtGrid').dataSource.read();
                            $('#sqlGrid').data('kendoExtGrid').dataSource.read();
                            $('#prtyGrid').data('kendoExtGrid').dataSource.read();
                            $('#fileGrid').data('kendoExtGrid').dataSource.read();
                            $('#commandGrid').data('kendoExtGrid').dataSource.read();
                            $('#dplyMastGrid').data('kendoExtGrid').dataSource.read();
*/

                            var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
//                             alert(tabStrip.select().index());
                            var idx = tabStrip.select().index();

                            if(idx == 0) {  // 기본정보

                            } else if(idx == 1) {  // Service 배보정보
                                $('#serviceGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#serviceGrid').data('kendoExtGrid').dataSource.read();

                            } /* else if(idx == 2) {  // Repository 배보정보
                                $('#repositoryGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#repositoryGrid').data('kendoExtGrid').dataSource.read();

                            } */ else if(idx == 2) {  // Command 배보정보
                                $('#commandGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#commandGrid').data('kendoExtGrid').dataSource.read();

                            } else if(idx == 3) {  // SQL 배보정보
                                $('#sqlGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#sqlGrid').data('kendoExtGrid').dataSource.read();

                            } else if(idx == 4) {  // Property 배보정보
                                $('#prtyGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#prtyGrid').data('kendoExtGrid').dataSource.read();

                            } else if(idx == 5) {  // File 배보정보
                                $('#fileGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#fileGrid').data('kendoExtGrid').dataSource.read();

                            } else if(idx == 6) {  // 배포정책
                                $('#dplyMastGrid').data('kendoExtGrid').dataSource._destroyed = [];
                                $('#dplyMastGrid').data('kendoExtGrid').dataSource.read();

                            }


                        }
                    });

            } else {

            }

        },dataBound:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });

    // 등록일
    $("#regDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:toDay
   });

    // SERVICE 그리드 설정
    $("#serviceGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecBundleBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
*/

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'SERVICE';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                          specCd           :{type:'string'}    // SPEC코드
                        , specTpNm         :{type:'string'}    // SPEC유형명
                        , seq              :{type:'number'}    // 일련번호
                        , operCmdNm        :{type:'string'}    // 작업명령어명
                        , operTryCnt       :{type:'number'}    // 작업시도횟수
                        , bundleGrpId      :{type:'string'}    // 번들그룹ID
                        , bundleAtftId     :{type:'string'}    // 번들아티팩트ID
                        , bundleVerNo      :{type:'string'}    // 번들버전번호
                        , failAftCtnuPgssYn:{type:'string'}    // 실패이후계속진행여부
                        , failAftRollbackYn:{type:'string'}    // 실패이후롤백여부
                        , rollbackOperCmdNm:{type:'string'}    // 롤백작업명령어명
                        , rollbackProrVal  :{type:'number'}    // 롤백우선순위값
                        , regUsrId         :{type:'string'}    // 등록자ID
                        , regDt            :{type:'date'}      // 등록일자
                        , updtUsrId        :{type:'string'}    // 수정자ID
                        , updtDt           :{type:'date'}      // 수정일자
                        , symbolicNm       :{type:'string'}    // SYMBOLIC NAME
                        , bundleNm         :{type:'string'}    // BUNDLE NAME
                        , deployProrVal    :{type:"number"}

                    }
                }
            }
            ,requestEnd:function(e) {


            }
        }

    //    ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
    //         initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"bundleNm", title:"<spring:message code='global.lbl.bundleNm' />", width:250
            }
            ,{field:"symbolicNm", title:"<spring:message code='global.lbl.symbolicNm' />", width:250
            }
            ,{field:"bundleVerNo", title:"Version", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackOperCmdNm", title:"<spring:message code='global.lbl.rollbackOperCmdNm'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"operTryCnt", title:"<spring:message code='global.lbl.operTryCnt'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"<spring:message code='global.lbl.failAftCtnuPgssYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"<spring:message code='global.lbl.failAftRollbackYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProrVal", title:"<spring:message code='global.lbl.deployProrVal'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackProrVal", title:"<spring:message code='global.lbl.rollbackProrVal'/>", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
    //    ,customized_curr_data:null
        ,change:function(e) {

            //if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_serviceGridModel_currUid = selectedVal.uid;

                $('#service_operCmdNm').data("kendoExtDropDownList").value(selectedVal.operCmdNm);
                $('#service_operTryCnt').val(selectedVal.operTryCnt);
                $('#service_bundleVerNo').val(selectedVal.bundleVerNo);
                $('#service_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#service_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#service_rollbackOperCmdNm').data("kendoExtDropDownList").value(selectedVal.rollbackOperCmdNm);
//                 $('#service_rollbackProrVal').val(selectedVal.rollbackProrVal);
                $('#service_symbolicNm').val(selectedVal.symbolicNm);
                $('#service_deployProrVal').val(selectedVal.deployProrVal);
            } else {
                $('#service_operCmdNm').data("kendoExtDropDownList").value(null);
                $('#service_operTryCnt').val(null);
                $('#service_bundleVerNo').val(null);
                $('#service_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#service_failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#service_rollbackOperCmdNm').data("kendoExtDropDownList").value(null);
//                 $('#service_rollbackProrVal').val(null);
                $('#service_symbolicNm').val(null);
                $('#service_deployProrVal').val(null);
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }


    });



    // SERVICE 실패이후계속진행여부
    $("#service_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // SERVICE 실패이후롤백여부
    $("#service_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // 작업명령어명
    $("#service_operCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:operCmdTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // 롤백작업명령어명
    $("#service_rollbackOperCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:operCmdTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });



    // REPOSITORY 그리드 설정
//     $("#repositoryGrid").kendoExtGrid({
//         dataSource:{
//              transport:{
//                 read:{
//                     url:"<c:url value='/dply/spec/specMng/selectSpecRepositoryBySpecCd.do' />"
//                 }
//                 ,parameterMap:function(options, operation) {
//                     if (operation === "read") {

//                         var params = {};
//     /*
//                         params["recordCountPerPage"] = options.pageSize;
//                         params["pageIndex"] = options.page;
//                         params["firstIndex"] = options.skip;
//                         params["lastIndex"] = options.skip + options.take;
//                         params["sort"] = options.sort;
//     */

//                         params["sSpecCd"] = $("#specCd").val();
//                         params["sSpecTpNm"] = 'REPOSITORY';

//                         return kendo.stringify(params);

//                     } else if (operation !== "read" && options.models) {
//                         return kendo.stringify(options.models);
//                     }
//                 }
//             }
//             ,schema:{
//                 model:{
//                     id:"specCd"
//                     ,fields:{
//                           specCd            :{type:'string'}       //  SPEC코드
//                         , specTpNm          :{type:'string'}       //  SPEC유형명
//                         , seq               :{type:'number'}       //  일련번호
//                         , operCmdNm         :{type:'string'}       //  작업명령어명
//                         , operTryCnt        :{type:'number'}       //  작업시도횟수
//                         , repoUrlNm         :{type:'string'}       //  레파지토리URL명
//                         , failAftCtnuPgssYn :{type:'string'}       //  실패이후계속진행여부
//                         , failAftRollbackYn :{type:'string'}       //  실패이후롤백여부
//                         , rollbackOperCmdNm :{type:'string'}       //  롤백작업명령어명
//                         , regUsrId          :{type:'string'}       //  등록자ID
//                         , regDt             :{type:'date'  }       //  등록일자
//                         , updtUsrId         :{type:'string'}       //  수정자ID
//                         , updtDt            :{type:'date'  }       //  수정일자

//                     }
//                 }
//             }
//             ,requestEnd:function(e) {


//             }
//         }

//        ,multiSelectWithCheckbox:true
//         ,dataBinding:function(e) {
//             initSqlForm();
//         }
//         ,height:100
//         ,autoBind:false
//         ,pageable:false
//         ,navigatable:true
//         ,selectable:"row"
//         ,editable:false
//         ,sortable:false
//         ,filterable:false
//         ,columns:[
//             {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm'/>", width:100
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"operTryCnt", title:"<spring:message code='global.lbl.operTryCnt'/>", width:100
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"repoUrlNm", title:"<spring:message code='global.lbl.repoUrlNm'/>", width:250
//             }
//             ,{field:"failAftCtnuPgssYn", title:"<spring:message code='global.lbl.failAftCtnuPgssYn'/>", width:140
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"failAftRollbackYn", title:"<spring:message code='global.lbl.failAftRollbackYn'/>", width:120
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"rollbackOperCmdNm", title:"<spring:message code='global.lbl.rollbackOperCmdNm'/>", width:120
//                 ,attributes:{"class":"ac"}
//             }


//             ,{title:""}
//         ]
//        ,customized_curr_data:null
//         ,change:function(e) {

//             if(!e.sender.dataItem(e.sender.select()).isNew()) {
//             if(e.sender.dataItem(e.sender.select()) != null) {

//                 var selectedVal = this.dataItem(this.select());

//                 gv_repositoryGridModel_currUid = selectedVal.uid;

//                 $('#repository_operCmdNm'        ).val(selectedVal.operCmdNm        );
//                 $('#repository_operTryCnt'       ).val(selectedVal.operTryCnt       );
//                 $('#repository_repoUrlNm'        ).val(selectedVal.repoUrlNm        );
//                 $('#repository_rollbackOperCmdNm').val(selectedVal.rollbackOperCmdNm);

//                 $('#repository_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
//                 $('#repository_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);

//             } else {
//                 $('#repository_operCmdNm'        ).val(null);
//                 $('#repository_operTryCnt'       ).val(null);
//                 $('#repository_repoUrlNm'        ).val(null);
//                 $('#repository_rollbackOperCmdNm').val(null);

//                 $('#repository_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
//                 $('#repository_failAftRollbackYn').data("kendoExtDropDownList").value(null);

//             }

//         },dataBound:function(e) {
//             var grid = e.sender;
//             var row = grid.tbody.find("tr:eq(0)");
//             if(row.length > 0) {
//                 grid.select(row);
//             } else {

//             }

//         }

//     });

    // repository 실패이후계속진행여부
//     $("#repository_failAftCtnuPgssYn").kendoExtDropDownList({
//         dataSource:["", "Y", "N"]
//     });

    // repository 실패이후롤백여부
//     $("#repository_failAftRollbackYn").kendoExtDropDownList({
//         dataSource:["", "Y", "N"]
//     });


    // COMMAND 그리드 설정
    $("#commandGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecCommandBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
    /*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
    */

                        params["sSpecCd"] = $("#specCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                          specCd                  :{type:'string'}       // SPEC코드
                        , specTpNm                :{type:'string'}       // SPEC유형
                        , seq                     :{type:'string'}       // 일련번호
                        , operCmdNm               :{type:'string'}       // 작업명령어명
                        , operCmdEnvCont          :{type:'string'}       // 작업명령어환경변수내용
                        , operDirNm               :{type:'string'}       // 작업디렉토리명
                        , successDecisionStr      :{type:'string'}       // 성공판단문자열
                        , failDecisionStr         :{type:'string'}       // 실패한단문자열
                        , failAftCtnuPgssYn       :{type:'string'}       // 실패이후계속진행여부
                        , failAftRollbackYn       :{type:'string'}       // 실패이후롤백여부
                        , rollbackOperCmdNm       :{type:'string'}       // 롤백작업명령어명
                        , rollbackOperCmdEnvCont  :{type:'string'}       // 롤백작업명령어환경변수내용
                        , rollbackOperDirNm       :{type:'string'}       // 롤백작업디렉토리명
                        , regUsrId                :{type:'string'}       // 등록자ID
                        , regDt                   :{type:'string'}       // 등록일자
                        , updtUsrId               :{type:'string'}       // 수정자ID
                        , updtDt                  :{type:'string'}       // 수정일자
                        , deployProrVal           :{type:'string'}       // 배포우선순위

                    }
                }
            }
            ,requestEnd:function(e) {


            }
        }

    //    ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
    //         initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"specTpNm", title:"<spring:message code='global.lbl.workType'/>", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=commandSpecTpArray[specTpNm]#"
            }
            ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"operCmdEnvCont", title:"<spring:message code='global.lbl.operCmdEnvCont'/>", width:150
            }
            ,{field:"operDirNm", title:"<spring:message code='global.lbl.operDirNm'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"successDecisionStr", title:"<spring:message code='global.lbl.successDecisionStr'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failDecisionStr", title:"<spring:message code='global.lbl.failDecisionStr'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"<spring:message code='global.lbl.failAftCtnuPgssYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"<spring:message code='global.lbl.failAftRollbackYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackOperCmdNm", title:"<spring:message code='global.lbl.rollbackOperCmdNm'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackOperCmdEnvCont", title:"<spring:message code='global.lbl.rollbackOperCmdEnvCont'/>", width:170
            }
            ,{field:"rollbackOperDirNm", title:"<spring:message code='global.lbl.rollbackOperDirNm'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProrVal", title:"<spring:message code='global.lbl.deployProrVal'/>", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
    //    ,customized_curr_data:null
        ,change:function(e) {

            //if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_commandGridModel_currUid = selectedVal.uid;

                $('#command_specTpNm').data("kendoExtDropDownList").value(selectedVal.specTpNm);
                $('#command_operCmdNm'               ).val(selectedVal.operCmdNm              );
                $('#command_operDirNm'               ).val(selectedVal.operDirNm              );
                $('#command_successDecisionStr'      ).val(selectedVal.successDecisionStr     );
                $('#command_failDecisionStr'         ).val(selectedVal.failDecisionStr        );
                $('#command_rollbackOperCmdNm'       ).val(selectedVal.rollbackOperCmdNm      );
                $('#command_rollbackOperDirNm'       ).val(selectedVal.rollbackOperDirNm      );
                $('#command_deployProrVal'           ).val(selectedVal.deployProrVal          );
                $('#command_operCmdEnvCont'          ).val(selectedVal.operCmdEnvCont         );
                $('#command_rollbackOperCmdEnvCont'  ).val(selectedVal.rollbackOperCmdEnvCont );
                $('#command_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#command_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);

            } else {
                $('#command_specTpNm').data("kendoExtDropDownList").value(null);
                $('#command_operCmdNm'               ).val(null);
                $('#command_operDirNm'               ).val(null);
                $('#command_successDecisionStr'      ).val(null);
                $('#command_failDecisionStr'         ).val(null);
                $('#command_rollbackOperCmdNm'       ).val(null);
                $('#command_rollbackOperDirNm'       ).val(null);
                $('#command_deployProrVal'           ).val(null);
                $('#command_operCmdEnvCont'          ).val(null);
                $('#command_rollbackOperCmdEnvCont'  ).val(null);
                $('#command_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#command_failAftRollbackYn').data("kendoExtDropDownList").value(null);
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });

    $("#command_specTpNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:commandSpecTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });


    // command 실패이후계속진행여부
    $("#command_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // command 실패이후롤백여부
    $("#command_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });




    // SQL Scripts 그리드 설정
    $("#sqlGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecSqlBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
*/

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'SQL';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,specTpNm:{type:"string"}
                        ,seq:{type:"number", editable:false}
                        ,sqlTextCont:{type:"string"}
                        ,operTryCnt:{type:"number"}
                        ,failAftCtnuPgssYn:{type:"string"}
                        ,failAftRollbackYn:{type:"string"}
                        ,rollbackSqlTextCont:{type:"string"}
                        ,rollbackProrVal:{type:"number"}
                        ,deployProrVal:{type:"number"}
                    }
                }
            }
            ,requestEnd:function(e) {

                // 아래 코드는 테스트용
                var jioongrid = $("#sqlGrid").data("kendoExtGrid");
                var grid_data = jioongrid.dataSource.data();
                var i = 0;

            }
        }

//        ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
//             initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"sqlTextCont", title:"SQL Scripts", width:600
            }
            ,{field:"operTryCnt", title:"<spring:message code='global.lbl.operTryCnt'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"<spring:message code='global.lbl.failAftCtnuPgssYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"<spring:message code='global.lbl.failAftRollbackYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProrVal", title:"<spring:message code='global.lbl.deployProrVal'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackProrVal", title:"<spring:message code='global.lbl.rollbackProrVal'/>", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
//        ,customized_curr_data:null
        ,change:function(e) {

            //if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

//                this.customized_curr_pos = this.dataSource.indexOf(selectedVal);
//                this.customized_curr_data = selectedVal;

//                gv_sqlGrid_currPos = this.dataSource.indexOf(selectedVal);

                gv_sqlGridModel_currUid = selectedVal.uid;

                $('#operTryCnt').val(selectedVal.operTryCnt);
                $('#failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#rollbackProrVal').val(selectedVal.rollbackProrVal);
                $('#sqlTextCont').val(selectedVal.sqlTextCont);
                $('#rollbackSqlTextCont').val(selectedVal.rollbackSqlTextCont);
                $('#deployProrVal').val(selectedVal.deployProrVal);


            } else {
                $('#operTryCnt').val(null);
                $('#failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#rollbackProrVal').val(null);
                $('#sqlTextCont').val(null);
                $('#rollbackSqlTextCont').val(null);
                $('#deployProrVal').val(null);
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });

    // SQL 실패이후계속진행여부
    $("#failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // SQL 실패이후롤백여부
    $("#failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // SPEC PROPERTY 그리드 설정
    $("#prtyGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecPrtyBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
*/

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'PROPERTY';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,specTpNm:{type:"string"}
                        ,seq:{type:"number", editable:false}
                        ,operTryCnt:{type:"number"}
                        ,prtyFileNm:{type:"string"}
                        ,prtyKeyNm:{type:"string"}
                        ,prtyKeyVal:{type:"string"}
                        ,failAftCtnuPgssYn:{type:"string"}
                        ,failAftRollbackYn:{type:"string"}
                        ,prtyFileTpNm:{type:"string"}
                    }
                }
            }
        }

//        ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
//             initPrtyForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"prtyFileNm", title:"<spring:message code='global.lbl.prtyFileNm'/>", width:400
            }
            ,{field:"prtyKeyNm", title:"<spring:message code='global.lbl.prtyKeyNm'/>", width:120
            }
            ,{field:"prtyKeyVal", title:"<spring:message code='global.lbl.prtyKeyVal'/>", width:120
            }
            ,{field:"prtyFileTpNm", title:"<spring:message code='global.lbl.prtyFileTpNm'/>", width:120
                ,template:"#=prtyFileTpArray[prtyFileTpNm]#"
            }
            ,{field:"operTryCnt", title:"<spring:message code='global.lbl.operTryCnt'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"<spring:message code='global.lbl.failAftCtnuPgssYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"<spring:message code='global.lbl.failAftRollbackYn'/>", width:120
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
//         ,customized_curr_data:null
        ,change:function(e) {

//             if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

//                this.customized_curr_data = selectedVal;

                gv_prtyGridModel_currUid = selectedVal.uid;

                $('#prty_operTryCnt').val(selectedVal.operTryCnt);
                $('#prty_prtyFileNm').val(selectedVal.prtyFileNm);
                $('#prty_prtyKeyNm').val(selectedVal.prtyKeyNm);
                $('#prty_prtyKeyVal').val(selectedVal.prtyKeyVal);
                $('#prty_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#prty_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#prty_prtyFileTpNm').data("kendoExtDropDownList").value(selectedVal.prtyFileTpNm);

            } else {
                $('#prty_operTryCnt').val(null);
                $('#prty_prtyFileNm').val(null);
                $('#prty_prtyKeyNm').val(null);
                $('#prty_prtyKeyVal').val(null);
                $('#prty_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#prty_failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#prty_prtyFileTpNm').data("kendoExtDropDownList").value(null);
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });


    // PROPERTY 실패이후계속진행여부
    $("#prty_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // PROPERTY 실패이후롤백여부
    $("#prty_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // PROPERTY 파일타입명
    $("#prty_prtyFileTpNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:prtyFileTpList
        ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });


    // SPEC FILE 그리드 설정
    $("#fileGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecFileBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
*/

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'FILE';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,specTpNm:{type:"string"}
                        ,seq:{type:"number", editable:false}
                        ,operTryCnt:{type:"number"}
                        ,srcFilePathNm:{type:"string"}
                        ,targFilePathNm:{type:"string"}
                        ,dlrCdAutoAddYn:{type:"string"}
                        ,failAftCtnuPgssYn:{type:"string"}
                        ,failAftRollbackYn:{type:"string"}
                        ,bakTargFilePathNm:{type:"string"}
                    }
                }
            }
        }

//        ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
//             initFileForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"srcFilePathNm", title:"<spring:message code='global.lbl.srcFilePathNm'/>", width:400
            }
            ,{field:"operTryCnt", title:"<spring:message code='global.lbl.operTryCnt'/>", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCdAutoAddYn", title:"<spring:message code='global.lbl.dlrCdAutoAddYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"<spring:message code='global.lbl.failAftCtnuPgssYn'/>", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"<spring:message code='global.lbl.failAftRollbackYn'/>", width:120
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
//         ,customized_curr_data:null
        ,change:function(e) {

//             if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

//                this.customized_curr_data = selectedVal;

                gv_fileGridModel_currUid = selectedVal.uid;

                $('#file_operTryCnt').val(selectedVal.operTryCnt);
                $('#file_srcFilePathNm').val(selectedVal.srcFilePathNm);
                $('#file_targFilePathNm').val(selectedVal.targFilePathNm);
                $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(selectedVal.dlrCdAutoAddYn);
                $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
//                 $('#file_bakTargFilePathNm').val(selectedVal.bakTargFilePathNm);

            } else {
                $('#file_operTryCnt').val(null);
                $('#file_srcFilePathNm').val(null);
                $('#file_targFilePathNm').val(null);
                $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(null);
                $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(null);
//                 $('#file_bakTargFilePathNm').val(null);
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });

    // File 딜러코드자동추가여부
    $("#file_dlrCdAutoAddYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // File 실패이후계속진행여부
    $("#file_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // File 실패이후롤백여부
    $("#file_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // Deploy Master 그리드 설정
    $("#dplyMastGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyMastByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sSpecCd"] = $("#specCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,deployStartDt:{type:"date"}
                        ,deployEndDt:{type:"date"}
                        ,procRsltNotiEndDt:{type:"date"}
                    }
                }
            }
        }

//        ,multiSelectWithCheckbox:true
        ,dataBinding:function(e) {
//             initDplyMastForm();

            $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:120
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"deployVerNo", title:"<spring:message code='global.lbl.deployVerNo' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployTpCd", title:"<spring:message code='global.lbl.deployTpCd' />", width:140
                ,attributes:{"class":"ac"}
                ,template:"#=deployTpArray[deployTpCd]#"
            }
            ,{field:"scheduleTpCd", title:"<spring:message code='global.lbl.scheduleTpCd' />", width:140
                ,attributes:{"class":"ac"}
                ,template:"#=scheduleTpArray[scheduleTpCd]#"
            }
            ,{field:"deployStatCd", title:"<spring:message code='global.lbl.deployStatCd' />", width:140
                ,attributes:{"class":"ac"}
                ,template:"#=deployStatArray[deployStatCd]#"
            }
            ,{field:"dmsGrpCnt", title:"<spring:message code='global.lbl.dmsGrpCnt' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployStartDt", title:"<spring:message code='global.lbl.deployStartDt' />", width:200
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployEndDt", title:"<spring:message code='global.lbl.deployEndDt' />", width:200
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());
                gv_dplyMastGridModel_currUid = selectedVal.uid;

//                 $('#failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);

                $('#deployVerNo').val(selectedVal.deployVerNo);
                $('#deployTpCd').data("kendoExtDropDownList").value(selectedVal.deployTpCd);
                $('#deployStartDt').data("kendoDateTimePicker").value(selectedVal.deployStartDt);
                $('#deployEndDt').data("kendoDateTimePicker").value(selectedVal.deployEndDt);
                $('#scheduleTpCd').data("kendoExtDropDownList").value(selectedVal.scheduleTpCd);
                $('#deployStatCd').data("kendoExtDropDownList").value(selectedVal.deployStatCd);
                $('#deployRetryCnt').val(selectedVal.deployRetryCnt);
                $('#deployRetryIvalVal').val(selectedVal.deployRetryIvalVal);
                $('#rsltReceiveTmoutHm').val(selectedVal.rsltReceiveTmoutHm);
                $('#achkFailAlwYn').data("kendoExtDropDownList").value(selectedVal.achkFailAlwYn);
                $('#achkFailAlwCnt').val(selectedVal.achkFailAlwCnt);
                $('#alwFailDmsCnt').val(selectedVal.alwFailDmsCnt);
                $('#dmsGrpCnt').val(selectedVal.dmsGrpCnt);
                $('#procRsltNotiYn').data("kendoExtDropDownList").value(selectedVal.procRsltNotiYn);
                $('#procRsltNotiEndYn').data("kendoExtDropDownList").value(selectedVal.procRsltNotiEndYn);
                $('#procRsltNotiEndDt').data("kendoDateTimePicker").value(selectedVal.procRsltNotiEndDt);


                var grid = $("#dplyMastGrid").data("kendoExtGrid");
                dataItem = grid.dataItem(grid.select());

                /////// !!!!!!!!!!!!!!!!!!!!!!!!!! 아래 코드 살펴 볼 것
                if($("#specCd").val() != null && $("#specCd").val() != 'undefined' && dataItem.deployVerNo != null && dataItem.deployVerNo != 'undefined') {
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();
                } else {
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource.data([]);
                }

                // Activate 버튼 활성화 컨트롤
                if($("#specCd").val() != null && $("#specCd").val() != 'undefined' && dataItem.deployVerNo != null && dataItem.deployVerNo != 'undefined' && dataItem.deployStatCd == 'W') {
                    $("#btnActivate").show();
                } else {
                    $("#btnActivate").hide();
                }


            } else {
                $('#deployVerNo').val(null);
                $('#deployTpCd').data("kendoExtDropDownList").value(null);
                $('#deployStartDt').data("kendoDateTimePicker").value(null);
                $('#deployEndDt').data("kendoDateTimePicker").value(null);
                $('#scheduleTpCd').data("kendoExtDropDownList").value(null);
                $('#deployStatCd').data("kendoExtDropDownList").value(null);
                $('#deployRetryCnt').val(null);
                $('#deployRetryIvalVal').val(null);
                $('#rsltReceiveTmoutHm').val(null);
                $('#achkFailAlwYn').data("kendoExtDropDownList").value(null);
                $('#achkFailAlwCnt').val(null);
                $('#alwFailDmsCnt').val(null);
                $('#dmsGrpCnt').val(null);
                $('#procRsltNotiYn').data("kendoExtDropDownList").value(null);
                $('#procRsltNotiEndYn').data("kendoExtDropDownList").value(null);
                $('#procRsltNotiEndDt').data("kendoDateTimePicker").value(null);
            }
        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });

    // Spect Policy ALIVECHECK실패허용여부
    $("#achkFailAlwYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // Spect Policy 처리결과공지여부
    $("#procRsltNotiYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // Spect Policy 처리결과공지완료여부
    $("#procRsltNotiEndYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // DEPLOY유형코드
    $("#deployTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:deployTpList
    });

    // 스케줄유형코드
    $("#scheduleTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:scheduleTpList
    });

    // DEPLOY상태코드
    $("#deployStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:deployStatList
    });

    // DEPLOY시작일자
    $("#deployStartDt").kendoDateTimePicker({

    });

    // DEPLOY종료일자
    $("#deployEndDt").kendoDateTimePicker({

    });

    // 처리결과공지완료일자
    $("#procRsltNotiEndDt").kendoDateTimePicker({

    });

    // Deploy Group 그리드 설정
    $("#dplyGrpGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyGrpByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyMastGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"] = $("#specCd").val();
                        params["sDeployVerNo"] = dataItem.deployVerNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,deployStartDt:{type:"date"}
                        ,deployEndDt:{type:"date"}
                        ,procRsltNotiEndDt:{type:"date"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            $("#dplyDlrGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"deployGrpId", title:"<spring:message code='global.lbl.deployGrpId' />", width:140
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource.read();

            } else {

            }
        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });


    // Deploy Dealer 그리드 설정
    $("#dplyDlrGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyDlrByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyGrpGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"] = $("#specCd").val();
                        params["sDeployVerNo"] = dataItem.deployVerNo;
                        params["sDeployGrpId"] = dataItem.deployGrpId;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                         specCd               :{type:"string"}
                        ,deployVerNo          :{type:"string"}
                        ,deployGrpId          :{type:"string"}
                        ,dlrCd                :{type:"string"}
                        ,deployExcpYn         :{type:"string"}
                        ,deployExcpReasonCont :{type:"string"}
                        ,regUsrId             :{type:"string"}
                        ,regDt                :{type:"date"}
                        ,updtUsrId            :{type:"string"}
                        ,updtDt               :{type:"date"}
                        ,deployProcCnt        :{type:"number"}
                        ,lastDeployProcDt     :{type:"date"}
                        ,deployReqEndYn       :{type:"string"}
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:true
//         ,selectable:"row"
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:140
            }
            ,{field:"deployProcCnt", title:"<spring:message code='global.lbl.deployProcCnt' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastDeployProcDt", title:"<spring:message code='global.lbl.lastDeployProcDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployReqEndYn", title:"<spring:message code='global.lbl.deployReqEndYn' />", width:140
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

            } else {

            }
        }

    });

//     alert(processDate("2016-07-20", "+3D", "yyyy-MM-dd"));

});



function initPage() {
    initBasicInfo();

    $("#serviceGrid").data("kendoExtGrid").dataSource.data([]);
//    $("#repositoryGrid").data("kendoExtGrid").dataSource.data([]);
    $("#sqlGrid").data("kendoExtGrid").dataSource.data([]);
    $("#prtyGrid").data("kendoExtGrid").dataSource.data([]);
    $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
    $("#commandGrid").data("kendoExtGrid").dataSource.data([]);
    $("#dplyMastGrid").data("kendoExtGrid").dataSource.data([]);
    $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);
    $("#dplyDlrGrid").data("kendoExtGrid").dataSource.data([]);

    initServiceForm();
//    initRepositoryForm();
    initCommandForm();
    initSqlForm();
    initPrtyForm();
    initFileForm();
    initDplyMastForm();
}

/***************************
 * SPEC 기본정보 초기화
 /**************************/
function initBasicInfo() {

    $("#specCd").val(null);
    $("#specNm").val(null);
    $("#regDt").val(null);
    $("#specCont").val(null);

}

function initServiceForm() {
    $('#serviceForm *[data-json-obj="true"]').val(null);

    $('#service_operCmdNm').data("kendoExtDropDownList").value(null);
    $('#service_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
    $('#service_failAftRollbackYn').data("kendoExtDropDownList").value(null);
    $('#service_rollbackOperCmdNm').data("kendoExtDropDownList").value(null);

}

//function initRepositoryForm() {
//    $('#repositoryForm *[data-json-obj="true"]').val(null);

//    $('#repository_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
//    $('#repository_failAftRollbackYn').data("kendoExtDropDownList").value(null);
// }

function initCommandForm() {
    $('#commandForm *[data-json-obj="true"]').val(null);

    $('#command_specTpNm').data("kendoExtDropDownList").value(null);
    $('#command_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
    $('#command_failAftRollbackYn').data("kendoExtDropDownList").value(null);
}

function initSqlForm() {
    $('#sqlForm *[data-json-obj="true"]').val(null);

    $('#failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
    $('#failAftRollbackYn').data("kendoExtDropDownList").value(null);
}

function initPrtyForm() {
    $('#prtyForm *[data-json-obj="true"]').val(null);

    $('#prty_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
    $('#prty_failAftRollbackYn').data("kendoExtDropDownList").value(null);
    $('#prty_prtyFileTpNm').data("kendoExtDropDownList").value(null);
}

function initFileForm() {
    $('#fileForm *[data-json-obj="true"]').val(null);

    $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(null);
    $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
    $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(null);
}

function initDplyMastForm() {
    $('#dplyMastForm *[data-json-obj="true"]').val(null);

    $('#deployTpCd').data("kendoExtDropDownList").value(null);
    $('#deployStartDt').data("kendoDateTimePicker").value(null);
    $('#deployEndDt').data("kendoDateTimePicker").value(null);
    $('#scheduleTpCd').data("kendoExtDropDownList").value(null);
    $('#deployStatCd').data("kendoExtDropDownList").value(null);
    $('#achkFailAlwYn').data("kendoExtDropDownList").value(null);
    $('#procRsltNotiYn').data("kendoExtDropDownList").value(null);
    $('#procRsltNotiEndYn').data("kendoExtDropDownList").value(null);
    $('#procRsltNotiEndDt').data("kendoDateTimePicker").value(null);
}



// 그리드 더블클릭.
$("#grid").on("dblclick", "tr.k-state-selected", function (e) {
/*
    var grid = $("#grid").data("kendoExtGrid");
    var selectedItem = grid.dataItem(grid.select());
    searchSpecInfoPopup(selectedItem);
*/
});

var searchSpecInfoPopupWin;

// SPEC 상세 정보 조회 팝업
function searchSpecInfoPopup(selectedItem) {

    searchSpecInfoPopupWin = dms.window.popup({
        windowId:"selectSpecInfoPopupWin"
        ,title:"배포정의서 Information"   // SPEC 상세 정보
        ,width:800
        ,height:400
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectSpecInfoPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"specCd":selectedItem.specCd
            }
        }

    });
}

// 진행된 Deploy Master가 있는지 확인하는 function
function checkPossibleDeletingSpec(specCd) {
    var param = {
            "specCd":specCd
        };

    var returnVal = null;

    $.ajax({
        url:"<c:url value='/dply/spec/specMng/selectNotNewDplyMastCnt.do' />",
        data:param,
        async:false,
        type:'POST',
        dataType:'json',
        contentType:'application/x-www-form-urlencoded',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);
            returnVal = false;
        },
        success:function(jqXHR, textStatus) {
            if(jqXHR == 0) {
                returnVal = true;
            } else {
                returnVal = false;
            }
        }
    });

    return returnVal;

}
</script>








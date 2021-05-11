<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

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
prtyFileTpArray[""] = "";

//DEPLOY결과코드:COM041
var deployRsltCdList = [];
<c:forEach var="obj" items="${deployRsltCdDS}">
deployRsltCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployRsltCdArray = [];
$.each(deployRsltCdList, function(idx, obj){
    deployRsltCdArray[obj.cmmCd] = obj.cmmCdNm;
});
deployRsltCdArray[null] = "";


//REPOSITORY 작업명령어코드:COM042
var repositoryOperCmdTpList = [];
<c:forEach var="obj" items="${repositoryOperCmdTpDS}">
repositoryOperCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var repositoryOperCmdTpArray = [];
$.each(repositoryOperCmdTpList, function(idx, obj){
    repositoryOperCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

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

<!-- SPEC등록 화면 -->

<form id="basicForm" name="basicForm" method="POST" onsubmit="return false;">

    <!-- SPEC 기본정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='cmm.title.specMng'/></h1>
            <div class="btn_right">
                <!-- button id="btnTest"     class="btn_m btn_new" >TEST</button -->
                <dms:access viewId="VIEW-I-12304" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnRefresh"  class="btn_m btn_reset" style="display:none"><spring:message code='global.btn.init' /></button>     <!-- 초기화 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12303" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSearch"   class="btn_m btn_search"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12302" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnNew"      class="btn_m btn_new" ><spring:message code="global.btn.new" /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12301" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSave"     class="btn_m btn_save"><spring:message code='global.btn.save' /></button>      <!-- 저장 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12300" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDuplicate" class="btn_m btn_save"><spring:message code='cmm.btn.copy' /></button>      <!-- 복제 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12299" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnRemove"   class="btn_m btn_delete" style="display:none"><spring:message code='global.btn.del' /></button>     <!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2>
        </div>
        <div class="table_form" id="specInfoForm01">
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
                            <!-- input id="specCd" name="specCd" class="form_input form_readonly" data-json-obj="true" value="TEST040002" -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.specNm' /></th>                         <!-- SPEC명 -->
                        <td>
                            <input id="specNm" name="specNm" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regDt' /></th>                         <!-- 등록일 -->
                        <td>
                            <input id="regDt" name="regDt" readonly class="form_datepicker form_readonly" data-json-obj="true">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>

                    <tr>
                        <th scope="row"><spring:message code='global.lbl.specCont' /></th>      <!-- Note -->
                        <td colspan="7">
                            <textarea id="specCont" name="specCont" rows="3" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    </section>
    <!-- SPEC 기본정보 -->

</form>

    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12298" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDivUnfold" ><spring:message code='dply.btn.rollingDown' /></button><!-- Rolling Dow(+) -->
                </dms:access>
            </div>
        </div>
    </section>

<form id="serviceForm" name="serviceForm" method="POST" onsubmit="return false;">
    <!-- Service LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="serviceFormHeader" style="cursor:pointer"><spring:message code='global.title.appDeploy' /></h2>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12297" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddService" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12296" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDelService" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="serviceGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form" id="serviceInfoDiv">
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
                            <input id="service_symbolicNm" name="service_symbolicNm" class="form_input form_readonly" data-json-obj="true" >
                        </td>
                        <th scope="row">Version</th>
                        <td>
                            <input id="service_bundleVerNo" name="service_bundleVerNo" class="form_input form_readonly" data-json-obj="true" >
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
<!--
                    <tr>
                        <th scope="row">롤백우선순위값</th>
                        <td>
                            <input id="service_rollbackProrVal" name="service_rollbackProrVal" class="form_input" style="width:90%"  data-json-obj="true" >
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
 -->
                </tbody>
            </table>
        </div>
    </section>
    <!--  Service LIST -->
</form>

<%-- <form id="repositoryForm" name="repositoryForm" method="POST" onsubmit="return false;">
    <!-- repository LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="repositoryFormHeader" style="cursor:pointer"><spring:message code='global.title.repositoryDeploy' /></h2>
            <div class="btn_right">
                <button class="btn_s" id="btnAddRepository" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                <button class="btn_s" id="btnDelRepository" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="repositoryGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form" id="repositoryInfoDiv">
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
                            <input id="repository_operCmdNm" name="repository_operCmdNm" data-json-obj="true" class="form_comboBox">
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
                            <input id="repository_rollbackOperCmdNm" name="repository_rollbackOperCmdNm" data-json-obj="true" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!--  repository LIST -->
</form> --%>


<form id="commandForm" name="commandForm" method="POST" onsubmit="return false;">
    <!-- command LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="commandFormHeader" style="cursor:pointer"><spring:message code='global.title.commandDeploy' /></h2>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12295" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddCommand" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12294" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDelCommand" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="commandGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form" id="commandInfoDiv">
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

<form id="sqlForm" name="sqlForm" method="POST" onsubmit="return false;">
    <!-- SQL Scripts LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="sqlFormHeader" style="cursor:pointer"><spring:message code='global.title.sqlDeploy' /></h2>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12293" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddSql" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12292" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDelSql" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="sqlGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form" id="sqlInfoDiv">
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



<form id="prtyForm" name="prtyForm" method="POST" onsubmit="return false;">
    <!-- PROPERTY LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="prtyFormHeader" style="cursor:pointer"><spring:message code='global.title.propertyDeploy' /></h2>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12291" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddPrty" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12290" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDelPrty" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="prtyGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form mt10" id="prtyInfoDiv">
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



<form id="fileForm" name="fileForm" method="POST" onsubmit="return false;">
    <!-- FILE LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="fileFormHeader" style="cursor:pointer"><spring:message code='global.title.fileDeploy' /></h2>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12289" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddFileFolder" ><spring:message code='global.btn.selectFolder' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12288" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddFile" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12287" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDelFile" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="fileGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form mt10" id="fileInfoDiv">
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
                            <div class="form_float">
                                <div class="form_search">
                                    <input id="file_srcFilePathNm" name="file_srcFilePathNm" class="form_input" data-json-obj="true" >
                                    <a href="javascript:searchSrcFilePopup();"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.targFilePathNm'/></th>                         <!-- 대상파일경로명 -->
                        <td colspan="7">
                            <input id="file_targFilePathNm" name="file_targFilePathNm" class="form_input" data-json-obj="true" >
                            <input id="file_bakTargFilePathNm" name="file_bakTargFilePathNm" type="hidden" class="form_input" data-json-obj="true" >
                            <input id="targpath" name="targpath" type="hidden" class="form_input" data-json-obj="true" >
                        </td>
                    </tr>

<!--
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.bakTargFilePathNm'/></th>
                        <td colspan="7">
                            <input id="file_bakTargFilePathNm" name="file_bakTargFilePathNm" class="form_input" data-json-obj="true" >
                        </td>
                    </tr>
-->
                </tbody>
            </table>
        </div>
    </section>
    <!--  PROPERTY LIST -->
</form>



<form id="dplyMastForm" name="dplyMastForm" method="POST" onsubmit="return false;">
    <!-- DEPLOY MASTER LIST -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" id="dplyMastFormHeader" style="cursor:pointer"><spring:message code='global.title.deployPolicy' /></h2>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12286" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnActivate" ><spring:message code='global.btn.activatePolicy' /></button>
                </dms:access>
                <!-- <button class="btn_s" id="btnRunDeploy" >Deploy</button> -->
                <dms:access viewId="VIEW-I-12285" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAddDplyMast" ><spring:message code='global.btn.add' /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12284" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDelDplyMast" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="dplyMastGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form mt10" id="dplyMastInfoDiv">
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
                        <th scope="row"><spring:message code='global.lbl.scheduleTpCd' /></th>                       <!-- 스케줄유형 -->
                        <td>
                            <input id="scheduleTpCd" name="scheduleTpCd" data-json-obj="true" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.deployStatCd' /></th>                       <!-- DEPLOY상태코드 -->
                        <td class="readonly_area">
                            <input id="deployStatCd" name="deployStatCd" readonly data-json-obj="true" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.deployPlanStartDt' /></th>                         <!-- DEPLOY시작일자 -->
                        <td>
                            <input id="deployStartDt" name="deployStartDt" data-json-obj="true" class="form_datetimepicker">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.deployPlanEndDt' /></th>                         <!-- DEPLOY종료일자 -->
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
                        <th scope="row"><spring:message code='global.lbl.procRsltNotiYn' /></th>                       <!--  -->
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

        <div class="clfix" id="dplyDetailInfoDiv">
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
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12283" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnAddDms" ><spring:message code='global.btn.add' /></button>
                        </dms:access>
                        <!-- <button class="btn_s" id="btnDelDms" ><spring:message code='global.btn.del' /></button> -->
                        <dms:access viewId="VIEW-I-12282" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnExcludeDms" ><spring:message code='global.btn.exclude' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12281" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnIncludeDms" ><spring:message code='global.btn.cancelExclude' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12280" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnSearchReport" ><spring:message code='global.btn.deployResultDetail' /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_grid">
                    <div id="dplyDlrGrid"></div>
                </div>
            </section>
        </div>
    </section>
    <!--  DEPLOY MASTER LIST -->
</form>


    <!-- TEST -->
<!--
    <section class="group">
        <div class="header_area">
             <h1 class="title_basic">테스트용</h1>
        </div>
        <div class="table_form">
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
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">TEST AREA</th>
                        <td colspan="7">
                            <textarea id="testArea" name="testArea" rows="4" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" ></textarea>
                        </td>
                    </tr>


                </tbody>
            </table>
        </div>

    </section>
 -->

    <!-- TEST -->




<!-- //SPEC등록 화면 -->


<!-- #스크립트 영역# -->
<script type="text/javascript">

var btnActivateClicked = 'N';
var indexOfDplyMastGrid = 0;

var rollingFlag = null;
/******************************************
 * 함수영역 - start
 ******************************************/

var gv_sqlGrid_currPos = null;
var gv_prtyGrid_currPos = null;

var gv_serviceGridModel_currUid = null;
var gv_repositoryGridModel_currUid = null;
var gv_commandGridModel_currUid = null;
var gv_sqlGridModel_currUid = null;
var gv_prtyGridModel_currUid = null;
var gv_fileGridModel_currUid = null;
var gv_dplyMastGridModel_currUid = null;

var gv_serviceGridMode = null;
var gv_repositoryGridMode = null;
var gv_commandGridMode = null;
var gv_sqlGridMode = null;
var gv_prtyGridMode = null;
var gv_fileGridMode = null;

var searchSpecPopupWin;

function searchSpecPopup() {
    searchSpecPopupWin = dms.window.popup({
        windowId:"searchSpecPopupWin"
        ,title:"<spring:message code='global.title.selectSpec' />"   // SPEC 조회
        ,width:800
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectSpecPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"specCd":""
                ,"callbackFunc":function(data) {
                    //alert(JSON.stringify(data));
                    if(data.length >= 1) {

                        initPage();

                        //alert(data[0].specCd);
                        $("#specCd").val(data[0].specCd);

                        searchSpecInfo();
                    }
//                    dms.notification.info(JSON.stringify(data));

                }

            }
        }

    });
}

var searchDmsPopupWin;

function searchDmsPopup() {
    var grid = $("#dplyMastGrid").data("kendoExtGrid");
    dataItem = grid.dataItem(grid.select());

    if(dataItem == null || dataItem == 'undefined') {
        dms.notification.info("<spring:message code='cmm.info.notSelectSpec' />");     //  배포정책이 선택되지 않았습니다
        return;
    }

    if(dataItem.isNew()) {
        dms.notification.info("<spring:message code='cmm.info.firstSelectSpec' />");     //  배포정책을 먼저 저장하세요
        return;
    }

    searchDmsPopupWin = dms.window.popup({
        windowId:"searchDmsPopupWin"
        ,title:"<spring:message code='global.title.dmsSearch' />"   // DMS 조회
        ,width:800
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectDmsPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"specCd":$("#specCd").val()
                ,"deployVerNo":dataItem.deployVerNo
                ,"deployTpCd" :dataItem.deployTpCd
                ,"callbackFunc":function(param) {
                    if(param != null) {
//                         alert(JSON.stringify(param));
                        $.ajax({
                            url:"<c:url value='/dply/spec/specMng/insertDplyDlr.do' />",
                            data:JSON.stringify(param),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR, status, error) {
                                //dms.notification.error(jqXHR.responseJSON.errors);
                                alert("error");

                            },
                            success:function(jqXHR, textStatus) {

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");

                                $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();
                            }
                        });
                    }
                }
            }
        }

    });
}



function updateDmsDeployExcpYn(flag) {

    var grid = $("#dplyDlrGrid").data("kendoExtGrid");
    var rows = grid.select();
    var updateList = [];

    if(rows == null || typeof rows == undefined || rows.length == 0) {
        dms.notification.info("<spring:message code='cmm.info.noDealerToApply' />");  // 적용할 딜러가 없습니다
        return;

    } else {
        $.each(rows, function(idx, row){
            grid.dataItem(row).deployExcpYn = flag;
            updateList.push(grid.dataItem(row));
        });

    }

    var param = {
        "updateList":updateList
//         ,"specCd":$("#specCd").val()
//         ,"deployVerNo":null
    }


    $.ajax({
        url:"<c:url value='/dply/spec/specMng/updateDplyDlrExcp.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);

        },success:function(jqXHR, textStatus) {
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
            $('#dplyDlrGrid').data('kendoExtGrid')._destroyed = [];
            $('#dplyDlrGrid').data('kendoExtGrid').dataSource.read();
        }
    });

}

function delDms() {

    var grid = $("#dplyDlrGrid").data("kendoExtGrid");
    var rows = grid.select();
    var deleteList = [];

    if(rows == null || rows == 'undefined' || rows.length == 0) {
        dms.notification.info("<spring:message code='cmm.info.noDealerToDel' />");     // 삭제할 딜러가 없습니다
        return;

    } else {
        $.each(rows, function(idx, row){
            deleteList.push(grid.dataItem(row));
        });

    }

    var param = {
        "deleteList":deleteList
//         ,"specCd":$("#specCd").val()
//         ,"deployVerNo":null
    }


    $.ajax({
        url:"<c:url value='/dply/spec/specMng/deleteDplyDlr.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);

        },success:function(jqXHR, textStatus) {
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
            $('#dplyDlrGrid').data('kendoExtGrid')._destroyed = [];
            $('#dplyDlrGrid').data('kendoExtGrid').dataSource.read();
        }
    });

}
var searchSrcFileFolderPopupWin;
function searchSrcFileFolderPopup() {

    searchSrcFileFolderPopupWin = dms.window.popup({
        windowId:"searchSrcFileFolderPopupWin"
        ,title:"원본파일폴더 Search"   // Repository 조회
        ,width:800
        ,height:750
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectSrcFileFolderPopup.do'/>"
            ,data:{
                 "autoBind":true
                ,"callbackFunc":function(param) {
                    var grid = $('#fileGrid').data('kendoExtGrid');
                    var insertList = param.insertList;

                    $.each(insertList, function(index, model){

                        if(true) {
                            grid.dataSource.insert(0, model);
                            }
                    });


                }
            }
        }

    });
}

var searchBundlePopupWin;
function searchBundlePopup() {

    var virtualDlrCd = 'DSIML';  // Virtual Server Dealer Code

    searchBundlePopupWin = dms.window.popup({
        windowId:"searchBundlePopupWin"
        ,title:"<spring:message code='global.title.addApp' />"   // Bundle 조회
        ,width:850
        ,height:750
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectBundlePopup.do'/>"
            ,data:{
                 "displayGrid":true
                ,"dlrCd":virtualDlrCd
                ,"callbackFunc":function(param) {

                    var grid = $('#serviceGrid').data('kendoExtGrid');

                    var insertList = param.insertList;

                    $.each(insertList, function(index, model){


                        if(true) {  // Filtering Code Not Needed
/*
                            model.operCmdNm           = 'INSTALL';
                            model.operTryCnt          = '1';
                            model.failAftCtnuPgssYn   = 'Y';
                            model.failAftRollbackYn   = 'N';
                            model.rollbackOperCmdNm   = 'UNINSTALL';
*/
                            grid.dataSource.insert(0, model);

                        }
                    });

                    if(param.insertList != null && typeof param.insertList != undefined && param.insertList.length > 0) {
                        var row = grid.tbody.find("tr:eq(0)");
                        grid.select(row);
                    }

                }
            }
        }

    });
}

var searchDplyReportDetailPopupWin;
function searchDplyReportDetailPopup() {

    var grid = $("#dplyDlrGrid").data("kendoExtGrid");
    dataItem = grid.dataItem(grid.select());

    if(dataItem == null || dataItem == 'undefined') {
        dms.notification.info("<spring:message code='cmm.info.notSelectDplyGrp' />");     // 배포그룹이 선택되지 않았습니다
        return;
    }

    searchDplyReportDetailPopupWin = dms.window.popup({
        windowId:"searchDplyReportDetailPopupWin"
        ,title:"<spring:message code='global.lbl.deployRsltCd' />"
        ,width:800
        ,height:550
        ,content:{
            url:"<c:url value='/dply/spec/dplyHist/selectDplyReportDetailPopup.do'/>"
            ,data:{
                 "autoBind"     :true
                ,"specCd"       :dataItem.specCd
                ,"deployVerNo"  :dataItem.deployVerNo
                ,"deployGrpId"  :dataItem.deployGrpId
                ,"dlrCd"        :dataItem.dlrCd
                ,"callbackFunc" :function(param) {
//                     alert(JSON.stringify(param));

                }
            }
        }

    });
}

var searchSrcFilePopupPopupWin;
function searchSrcFilePopup() {

    searchSrcFilePopupWin = dms.window.popup({
        windowId:"searchSrcFilePopupWin"
        ,title:"원본파일 Search"   // Repository 조회
        ,width:800
        ,height:500
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectSrcFilePopup.do'/>"
            ,data:{
                 "autoBind":true
                ,"callbackFunc":function(param) {

                    if(!dms.string.isEmpty(param.fileurl)) {
                        $("#file_srcFilePathNm").val(param.fileurl);
                        $("#file_srcFilePathNm").trigger("change");
                    }
                    if(!dms.string.isEmpty(param.targpath)) {
                        $("#file_targFilePathNm").val(param.targpath);
                        $("#file_targFilePathNm").trigger("change");
                    }

                }
            }
        }

    });
}



/*********
 * 저장
*********/


//진행된 Deploy Master가 있는지 확인하는 function
function checkPossibleModifySpec(specCd) {
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


var searchDupSpecPopupWin;
function duplicateSpec() {

    if( $("#specCd").val() == "") {
        dms.notification.info("<spring:message code='cmm.info.selectSpecToCopy' />");      // 복제할 배포정의서를 선택하세요
        return;

    } else {
        searchDupSpecPopupWin = dms.window.popup({
            windowId:"searchDupSpecPopupWin"
            ,title:"<spring:message code='global.title.specCopy' />"   // 배포정의서 복제
            ,width:800
            ,content:{
                url:"<c:url value='/dply/spec/specMng/selectDupSpecPopup.do'/>"
                ,data:{
                     "autoBind":true
                    ,"srcSpecCd":$("#specCd").val()
                    ,"callbackFunc":function(specCd) {
                        if(!dms.string.isEmpty(specCd)) {
                            initPage();

                            $("#specCd").val(specCd);
                            searchSpecInfo();

                        }

                    }
                }
            }

        });
    }

}


function save() {

    var grid = null;
    var data = null;

    var checkFlag = null;

    // APP 배포정보 필수 입력값 체크
    grid = $('#serviceGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    checkFlag = true;
    $.each(data, function(idx, row) {
        if(dms.string.isEmpty(row.operCmdNm)) {
            dms.notification.info("<spring:message code='global.title.appDeploy' /> " + "<spring:message code='global.lbl.operCmdNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.rollbackOperCmdNm) && row.failAftRollbackYn == "Y") {
            dms.notification.info("<spring:message code='global.title.appDeploy' /> " + "<spring:message code='global.lbl.rollbackOperCmdNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.deployProrVal)) {
            dms.notification.info("<spring:message code='global.title.appDeploy' /> " + "<spring:message code='global.lbl.deployProrVal' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftCtnuPgssYn)) {
            dms.notification.info("<spring:message code='global.title.appDeploy' /> " + "<spring:message code='global.lbl.failAftCtnuPgssYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftRollbackYn)) {
            dms.notification.info("<spring:message code='global.title.appDeploy' /> " + "<spring:message code='global.lbl.failAftRollbackYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
    });

    if(!checkFlag) {
        return;
    }

    // Command 배포정보 필수 입력값 체크
    grid = $('#commandGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    checkFlag = true;
    $.each(data, function(idx, row) {
        if(dms.string.isEmpty(row.operCmdNm)) {
            dms.notification.info("<spring:message code='global.title.commandDeploy' /> " + "<spring:message code='global.lbl.operCmdNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.deployProrVal)) {
            dms.notification.info("<spring:message code='global.title.commandDeploy' /> " + "<spring:message code='global.lbl.deployProrVal' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftCtnuPgssYn)) {
            dms.notification.info("<spring:message code='global.title.commandDeploy' /> " + "<spring:message code='global.lbl.failAftCtnuPgssYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftRollbackYn)) {
            dms.notification.info("<spring:message code='global.title.commandDeploy' /> " + "<spring:message code='global.lbl.failAftRollbackYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

    });

    if(!checkFlag) {
        return;
    }


    // sql 배포정보 필수 입력값 체크
    grid = $('#sqlGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    checkFlag = true;
    $.each(data, function(idx, row) {
        if(dms.string.isEmpty(row.sqlTextCont)) {
            dms.notification.info("<spring:message code='global.title.sqlDeploy' /> " + "<spring:message code='global.lbl.sqlTextCont' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.deployProrVal)) {
            dms.notification.info("<spring:message code='global.title.sqlDeploy' /> " + "<spring:message code='global.lbl.deployProrVal' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftCtnuPgssYn)) {
            dms.notification.info("<spring:message code='global.title.sqlDeploy' /> " + "<spring:message code='global.lbl.failAftCtnuPgssYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftRollbackYn)) {
            dms.notification.info("<spring:message code='global.title.sqlDeploy' /> " + "<spring:message code='global.lbl.failAftRollbackYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

    });

    if(!checkFlag) {
        return;
    }

    // property 배포정보 필수 입력값 체크
    grid = $('#prtyGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    checkFlag = true;
    $.each(data, function(idx, row) {
        if(dms.string.isEmpty(row.prtyFileTpNm)) {
            dms.notification.info("<spring:message code='global.title.propertyDeploy' /> " + "<spring:message code='global.lbl.prtyFileTpNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.prtyFileNm)) {
            dms.notification.info("<spring:message code='global.title.propertyDeploy' /> " + "<spring:message code='global.lbl.prtyFileNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.prtyKeyVal)) {
            dms.notification.info("<spring:message code='global.title.propertyDeploy' /> " + "<spring:message code='global.lbl.prtyKeyVal' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

        if(dms.string.isEmpty(row.failAftCtnuPgssYn)) {
            dms.notification.info("<spring:message code='global.title.propertyDeploy' /> " + "<spring:message code='global.lbl.failAftCtnuPgssYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftRollbackYn)) {
            dms.notification.info("<spring:message code='global.title.propertyDeploy' /> " + "<spring:message code='global.lbl.failAftRollbackYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

    });

    if(!checkFlag) {
        return;
    }

    // file 배포정보 필수 입력값 체크
    grid = $('#fileGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    checkFlag = true;
    $.each(data, function(idx, row) {
        if(dms.string.isEmpty(row.operTryCnt)) {
            dms.notification.info("<spring:message code='global.title.fileDeploy' /> " + "<spring:message code='global.lbl.operTryCnt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.srcFilePathNm)) {
            dms.notification.info("<spring:message code='global.title.fileDeploy' /> " + "<spring:message code='global.lbl.srcFilePathNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.targFilePathNm)) {
            dms.notification.info("<spring:message code='global.title.fileDeploy' /> " + "<spring:message code='global.lbl.targFilePathNm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.dlrCdAutoAddYn)) {
            dms.notification.info("<spring:message code='global.title.fileDeploy' /> " + "<spring:message code='global.lbl.dlrCdAutoAddYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

        if(dms.string.isEmpty(row.failAftCtnuPgssYn)) {
            dms.notification.info("<spring:message code='global.title.fileDeploy' /> " + "<spring:message code='global.lbl.failAftCtnuPgssYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.failAftRollbackYn)) {
            dms.notification.info("<spring:message code='global.title.fileDeploy' /> " + "<spring:message code='global.lbl.failAftRollbackYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

    });

    if(!checkFlag) {
        return;
    }


    // 배포정책 필수 입력값 체크
    grid = $('#dplyMastGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    checkFlag = true;
    $.each(data, function(idx, row) {
        if(dms.string.isEmpty(row.deployStartDt)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.deployStartDt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.deployEndDt)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.deployEndDt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.deployRetryCnt)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.deployRetryCnt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.deployRetryIvalVal)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.deployRetryIvalVal' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.rsltReceiveTmoutHm)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.rsltReceiveTmoutHm' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.achkFailAlwYn)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.achkFailAlwYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.achkFailAlwCnt)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.achkFailAlwCnt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.alwFailDmsCnt)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.alwFailDmsCnt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.dmsGrpCnt)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.dmsGrpCnt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.procRsltNotiYn)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.procRsltNotiYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }
        if(dms.string.isEmpty(row.procRsltNotiEndYn)) {
            dms.notification.info("<spring:message code='global.title.deployPolicy' /> " + "<spring:message code='global.lbl.procRsltNotiEndYn' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
            checkFlag = false;
            return false;
        }

    });

    if(!checkFlag) {
        return;
    }

    var param = {
        "specBasicVO":$("#basicForm").serializeObject($("#basicForm").serializeArrayInSelector("[data-json-obj='true']"))
        ,"specBundleSaveVO":$("#serviceGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
        ,"specCommandSaveVO":$("#commandGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
        ,"specSqlSaveVO":$("#sqlGrid").data("kendoExtGrid").getCUDData("insertSpecSqlList", "updateSpecSqlList", "deleteSpecSqlList")
        ,"specPrtySaveVO":$("#prtyGrid").data("kendoExtGrid").getCUDData("insertSpecPrtyList", "updateSpecPrtyList", "deleteSpecPrtyList")
        ,"specFileSaveVO":$("#fileGrid").data("kendoExtGrid").getCUDData("insertSpecFileList", "updateSpecFileList", "deleteSpecFileList")

        ,"dplyMastSaveVO":$("#dplyMastGrid").data("kendoExtGrid").getCUDData("insertDplyMastList", "updateDplyMastList", "deleteDplyMastList")
        ,"multiFlag":""
    }

    var saveCnt =
        param.specBundleSaveVO.insertList.length
      + param.specBundleSaveVO.updateList.length
      + param.specBundleSaveVO.deleteList.length
      + param.specCommandSaveVO.insertList.length
      + param.specCommandSaveVO.updateList.length
      + param.specCommandSaveVO.deleteList.length
      + param.specSqlSaveVO.insertSpecSqlList.length
      + param.specSqlSaveVO.updateSpecSqlList.length
      + param.specSqlSaveVO.deleteSpecSqlList.length
      + param.specPrtySaveVO.insertSpecPrtyList.length
      + param.specPrtySaveVO.updateSpecPrtyList.length
      + param.specPrtySaveVO.deleteSpecPrtyList.length
      + param.specFileSaveVO.insertSpecFileList.length
      + param.specFileSaveVO.updateSpecFileList.length
      + param.specFileSaveVO.deleteSpecFileList.length
      ;

    // DEPLOY MASTER DMS그룹건수 Min 체크
    for(var i=0; i<param.dplyMastSaveVO.insertDplyMastList.length; i++) {
        if( param.dplyMastSaveVO.insertDplyMastList[i].dmsGrpCnt < parseInt(cmmPrtyListObj['specReg.dplyMast.dmsGrpMinCnt']) ) {
            dms.notification.info("<spring:message code='cmm.info.minDmsCnt' />" + " " + cmmPrtyListObj['specReg.dplyMast.dmsGrpMinCnt']);
            return false;
        }
    }

    for(var i=0; i<param.dplyMastSaveVO.updateDplyMastList.length; i++) {
        if( param.dplyMastSaveVO.updateDplyMastList[i].dmsGrpCnt < parseInt(cmmPrtyListObj['specReg.dplyMast.dmsGrpMinCnt']) ) {
            dms.notification.info("<spring:message code='cmm.info.minDmsCnt' />" + " " + cmmPrtyListObj['specReg.dplyMast.dmsGrpMinCnt']);
            return false;
        }
    }

    // APP 배포정보 rollback 우선 순위 자동 setting
    grid = $('#serviceGrid').data('kendoExtGrid');
    data = grid.dataSource.data();
    var length = data.length;

    $.each(data, function(idx, row) {
        var v = grid.dataSource.getByUid(row.uid).get('deployProrVal');
        if(v == 'undefined' || v == null || v == '') {
            grid.dataSource.getByUid(row.uid).set('rollbackProrVal', null);
        } else {
            grid.dataSource.getByUid(row.uid).set('rollbackProrVal', length + 1 - v);
        }

    });

    param = {
        "specBasicVO":$("#basicForm").serializeObject($("#basicForm").serializeArrayInSelector("[data-json-obj='true']"))
        ,"specBundleSaveVO":$("#serviceGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
        ,"specCommandSaveVO":$("#commandGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
        ,"specSqlSaveVO":$("#sqlGrid").data("kendoExtGrid").getCUDData("insertSpecSqlList", "updateSpecSqlList", "deleteSpecSqlList")
        ,"specPrtySaveVO":$("#prtyGrid").data("kendoExtGrid").getCUDData("insertSpecPrtyList", "updateSpecPrtyList", "deleteSpecPrtyList")
        ,"specFileSaveVO":$("#fileGrid").data("kendoExtGrid").getCUDData("insertSpecFileList", "updateSpecFileList", "deleteSpecFileList")

        ,"dplyMastSaveVO":$("#dplyMastGrid").data("kendoExtGrid").getCUDData("insertDplyMastList", "updateDplyMastList", "deleteDplyMastList")
        ,"multiFlag":""
    }

    param.specBasicVO.regDt = $("#regDt").data("kendoExtMaskedDatePicker").value();           // 등록일

    if( $("#specCd").val() != "") {
        // 수정하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.update' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }
        param.multiFlag = "update";
    } else {
        // 생성하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />")){
            return;
        }
        param.multiFlag = "create";
    }

    $.each(param.specBundleSaveVO.insertList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specBundleSaveVO.updateList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.specBundleSaveVO.deleteList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.specCommandSaveVO.insertList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specCommandSaveVO.updateList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.specCommandSaveVO.deleteList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });



    $.each(param.specSqlSaveVO.insertSpecSqlList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specSqlSaveVO.updateSpecSqlList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.specSqlSaveVO.deleteSpecSqlList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specPrtySaveVO.insertSpecPrtyList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specPrtySaveVO.updateSpecPrtyList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.specPrtySaveVO.deleteSpecPrtyList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specFileSaveVO.insertSpecFileList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.specFileSaveVO.updateSpecFileList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.specFileSaveVO.deleteSpecFileList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });



    $.each(param.dplyMastSaveVO.insertDplyMastList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });


    $.each(param.dplyMastSaveVO.updateDplyMastList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.each(param.dplyMastSaveVO.deleteDplyMastList, function(idx, row) {
        row.set("regDt", null);
        row.set("updtDt", null);

        for(var key in row) {
            if(key == "aria-selected") {
                delete(row[key]);
            }
        }
    });

    $.ajax({
        url:"<c:url value='/dply/spec/specMng/multiSpecMng.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);

        },
        success:function(jqXHR, textStatus) {

            initPage();

            //alert(jqXHR);
            $("#specCd").val(jqXHR);   //

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");

            searchSpecInfo();
        }
    });

}

/*********
 * Spec정보 조회
 *********/
function searchSpecInfo() {

    var param = {
        "sSpecCd":$("#specCd").val()
    }

    //alert(JSON.stringify(param));

    $.ajax({
        url:"<c:url value='/dply/spec/specMng/selectSpecMng.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.statusText);
//             alert("error");

        },
        success:function(jqXHR, textStatus) {

            //alert(JSON.stringify(jqXHR));

            $("#specCd").val(jqXHR.specBasicVO.specCd);
            $("#specNm").val(jqXHR.specBasicVO.specNm);
            //$("#regDt").val(jqXHR.specBasicVO.regDt);
            $("#regDt").data("kendoExtMaskedDatePicker").value(jqXHR.specBasicVO.regDt);
            $("#specCont").val(jqXHR.specBasicVO.specCont);

            $('#serviceGrid').data('kendoExtGrid').dataSource._destroyed = [];
            $('#sqlGrid').data('kendoExtGrid').dataSource._destroyed = [];
            $('#prtyGrid').data('kendoExtGrid').dataSource._destroyed = [];
            $('#fileGrid').data('kendoExtGrid').dataSource._destroyed = [];
            $('#commandGrid').data('kendoExtGrid').dataSource._destroyed = [];
            $('#dplyMastGrid').data('kendoExtGrid').dataSource._destroyed = [];

            $('#serviceGrid').data('kendoExtGrid').dataSource.read();
            $('#sqlGrid').data('kendoExtGrid').dataSource.read();
            $('#prtyGrid').data('kendoExtGrid').dataSource.read();
            $('#fileGrid').data('kendoExtGrid').dataSource.read();
            $('#commandGrid').data('kendoExtGrid').dataSource.read();
            $('#dplyMastGrid').data('kendoExtGrid').dataSource.read();

        }
    });

}

/**
 * 초기화 함수
 */
function initChildValue() {
//   $('#basicForm *[data-json-obj="true"]').css('color', 'red');
  $('#dplyMastForm *[data-json-obj="true"]').val(null);
  $('#dplyMastForm *[kendo-ui="true"]').value(null);

}

function initPage() {
    initBasicInfo();

    $("#serviceGrid").data("kendoExtGrid").dataSource.data([]);
    $("#sqlGrid").data("kendoExtGrid").dataSource.data([]);
    $("#prtyGrid").data("kendoExtGrid").dataSource.data([]);
    $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
    $("#commandGrid").data("kendoExtGrid").dataSource.data([]);
    $("#dplyMastGrid").data("kendoExtGrid").dataSource.data([]);
    $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);
    $("#dplyDlrGrid").data("kendoExtGrid").dataSource.data([]);

    initServiceForm();
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

    $("#btnActivate").hide();
}

function toggleDivShow(obj) {
    if(obj.css("display") == "none"){
        obj.show();
    } else {
        obj.hide();
    }
}

function updateDplyMastStateToReg() {
    var grid = $("#dplyMastGrid").data("kendoExtGrid");
    var rows = grid.select();

    dataItem = grid.dataItem(rows);

    var params = {};
    params["specCd"]      = dataItem.specCd;
    params["deployVerNo"] = dataItem.deployVerNo;

    // 진행하시겠습니까?
    if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
        return;
    }

    $.ajax({
        url:"<c:url value='/dply/spec/specMng/updateDplyMastStateToReg.do' />",
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {

            if(jqXHR > 0) {
                dms.notification.success("<spring:message code='global.info.success'/>");

                btnActivateClicked = 'Y';
                $("#dplyMastGrid").data("kendoExtGrid").dataSource.read();
                $("#btnActivate").hide();
            } else {

            }

        }
    });

}

/******************************************
 * 함수영역 - end
 ******************************************/

$(document).ready(function() {

    //버튼 - 신규
    $("#btnNew").kendoButton({
        click:function(e){
            initPage();
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            searchSpecPopup();
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){
            save();
        }
    });

    //버튼 - 복제
    $("#btnDuplicate").kendoButton({
        enable:true,
        click:function(e){
            duplicateSpec();
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
                        , targFilePathNm    : {type : 'string'}    //DMS_WAS_APP_HOME_DIR
                        , srcFilePathNm     : {type : 'string'}    //DCS_APP_DEPLOY_HOME_URL

                    }
                }
            }
            ,requestEnd:function(e) {
                gv_serviceGridMode = null;

            }
        }
        ,dataBinding:function(e) {
    //         initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:true
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"bundleNm", title:"<spring:message code='global.lbl.bundleNm'/>", width:250
            }
            ,{field:"symbolicNm", title:"<spring:message code='global.lbl.symbolicNm' />", width:250
            }
            ,{field:"bundleVerNo", title:"<spring:message code='global.lbl.bundleVerNo' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm'/>", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=operCmdTpArray[operCmdNm]#"
            }
            ,{field:"rollbackOperCmdNm", title:"<spring:message code='global.lbl.rollbackOperCmdNm'/>", width:120
                ,attributes:{"class":"ac"}
                ,template:"#=operCmdTpArray[rollbackOperCmdNm]#"
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
            ,{field : "targFilePathNm", width : 100, hidden: true
            }
            ,{field : "srcFilePathNm", width : 100, hidden: true
            }
            ,{title:""}
        ]
        ,change:function(e) {

            //if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_serviceGridModel_currUid = selectedVal.uid;
                gv_serviceGridMode = "M";

                $('#service_operCmdNm').data("kendoExtDropDownList").value(selectedVal.operCmdNm);
                $('#service_operTryCnt').val(selectedVal.operTryCnt);
                $('#service_bundleVerNo').val(selectedVal.bundleVerNo);
                $('#service_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#service_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#service_rollbackOperCmdNm').data("kendoExtDropDownList").value(selectedVal.rollbackOperCmdNm);
                $('#service_symbolicNm').val(selectedVal.symbolicNm);
                $('#service_deployProrVal').val(selectedVal.deployProrVal);
            } else {
                $('#service_operCmdNm').data("kendoExtDropDownList").value(null);
                $('#service_operTryCnt').val(null);
                $('#service_bundleVerNo').val(null);
                $('#service_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#service_failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#service_rollbackOperCmdNm').data("kendoExtDropDownList").value(null);
                $('#service_symbolicNm').val(null);
                $('#service_deployProrVal').val(null);
            }

        },edit:function(e) {
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            if(fieldName != 'deployProrVal') {
                this.closeCell();
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = null;
            if(gv_serviceGridMode == null) {
                row = grid.tbody.find("tr:eq(0)");
            } else if(gv_serviceGridMode == "M") {
                row = grid.table.find("[data-uid=" + gv_serviceGridModel_currUid + "]");
            }
            if(row.length > 0) {
                grid.select(row);
            }
        }

    });


    //버튼 - SERVICE 추가
    $("#btnAddService").kendoButton({
        click:function(e) {
            searchBundlePopup();
        }
    });

    // 버튼 - SERVICE 삭제
    $("#btnDelService").kendoButton({
        click:function(e){

            var grid = $("#serviceGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

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

    // service_operCmdNm
    $("#service_operCmdNm").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("operCmdNm", this.value);

    });

    // service_operTryCnt
    $("#service_operTryCnt").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("operTryCnt", this.value);

    });

    // service_bundleVerNo
    $("#service_bundleVerNo").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("bundleVerNo", this.value);

    });

    // service_failAftCtnuPgssYn
    $("#service_failAftCtnuPgssYn").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("failAftCtnuPgssYn", this.value);

    });

    // #service_failAftRollbackYn
    $("#service_failAftRollbackYn").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("failAftRollbackYn", this.value);

    });

    // service_rollbackOperCmdNm
    $("#service_rollbackOperCmdNm").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("rollbackOperCmdNm", this.value);

    });

    // service_symbolicNm
    $("#service_symbolicNm").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("symbolicNm", this.value);

    });

    // service_deployProrVal
    $("#service_deployProrVal").on("change", function() {
        var grid = $("#serviceGrid").data("kendoExtGrid");

        if(gv_serviceGridModel_currUid == 'undefined' || gv_serviceGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_serviceGridModel_currUid).set("deployProrVal", this.value);

    });

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
                gv_commandGridMode = null;

            }
        }

        ,dataBinding:function(e) {
    //         initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:true
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
                gv_commandGridMode = "M";

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

        },edit:function(e) {
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            if(fieldName != 'deployProrVal') {
                this.closeCell();
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = null;
            if(gv_commandGridMode == null) {
                row = grid.tbody.find("tr:eq(0)");
            } else if(gv_commandGridMode == "M") {
                row = grid.table.find("[data-uid=" + gv_commandGridModel_currUid + "]");
            }
            if(row.length > 0) {
                grid.select(row);
            }

        }

    });

    //버튼 - command Scripts 추가
    $("#btnAddCommand").kendoButton({
        click:function(e) {
            var grid = $("#commandGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                                                    specTpNm:'ANTEJOB'  // SPEC유형
                                                     ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.command.failAftCtnuPgssYn']
                                                     ,failAftRollbackYn:cmmPrtyListObj['specReg.command.failAftRollbackYn']
                                                 });

            gv_commandGridModel_currUid = dataItem.uid;

            var row = grid.tbody.find("tr:eq(0)");
            grid.select(row);
        }
    });

    // 버튼 - COMMAND Scripts 삭제
    $("#btnDelCommand").kendoButton({
        click:function(e){

            var grid = $("#commandGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

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

    // #command_specTpNm
    $("#command_specTpNm").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("specTpNm", this.value);

    });

    // #command_operCmdNm
    $("#command_operCmdNm").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("operCmdNm", this.value);

    });

    // #command_operDirNm
    $("#command_operDirNm").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("operDirNm", this.value);

    });

    // #command_successDecisionStr
    $("#command_successDecisionStr").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("successDecisionStr", this.value);

    });

    // #command_failDecisionStr
    $("#command_failDecisionStr").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("failDecisionStr", this.value);

    });

    // #command_rollbackOperCmdNm
    $("#command_rollbackOperCmdNm").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("rollbackOperCmdNm", this.value);

    });

    // #command_rollbackOperDirNm
    $("#command_rollbackOperDirNm").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("rollbackOperDirNm", this.value);

    });

    // #command_deployProrVal
    $("#command_deployProrVal").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("deployProrVal", this.value);

    });

    // #command_operCmdEnvCont
    $("#command_operCmdEnvCont").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("operCmdEnvCont", this.value);

    });

    // #command_rollbackOperCmdEnvCont
    $("#command_rollbackOperCmdEnvCont").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("rollbackOperCmdEnvCont", this.value);

    });


    // #command_failAftCtnuPgssYn
    $("#command_failAftCtnuPgssYn").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("failAftCtnuPgssYn", this.value);

    });

    // command_failAftRollbackYn
    $("#command_failAftRollbackYn").on("change", function() {
        var grid = $("#commandGrid").data("kendoExtGrid");

        if(gv_commandGridModel_currUid == 'undefined' || gv_commandGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_commandGridModel_currUid).set("failAftRollbackYn", this.value);

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
                gv_sqlGridMode = null;

            }
        }

        ,dataBinding:function(e) {
//             initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:true
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
        ,change:function(e) {

            //if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_sqlGridModel_currUid = selectedVal.uid;
                gv_sqlGridMode = "M";

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

        },edit:function(e) {
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            if(fieldName != 'deployProrVal' && fieldName != 'rollbackProrVal') {
                this.closeCell();
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = null;
            if(gv_sqlGridMode == null) {
                row = grid.tbody.find("tr:eq(0)");
            } else if(gv_sqlGridMode == "M") {
                row = grid.table.find("[data-uid=" + gv_sqlGridModel_currUid + "]");
            }
            if(row.length > 0) {
                grid.select(row);
            }

        }


    });

    //버튼 - SQL Scripts 추가
    $("#btnAddSql").kendoButton({
        click:function(e) {
            var grid = $("#sqlGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                                                     specTpNm:'SQL'  // SPEC유형
                                                     ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.sql.failAftCtnuPgssYn']
                                                     ,failAftRollbackYn:cmmPrtyListObj['specReg.sql.failAftRollbackYn']
                                                     ,operTryCnt:cmmPrtyListObj['specReg.sql.operTryCnt']
                                                 });

            gv_sqlGridModel_currUid = dataItem.uid;

            var row = grid.tbody.find("tr:eq(0)");
            grid.select(row);
        }
    });

    // 버튼 - SQL Scripts 삭제
    $("#btnDelSql").kendoButton({
        click:function(e){

            var grid = $("#sqlGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

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



    // Editor - 작업시도횟수
    $("#operTryCnt").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");

        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("operTryCnt", this.value);


    });

    // Editor - 실패이후계속진행여부
    $("#failAftCtnuPgssYn").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");

        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("failAftCtnuPgssYn", this.value);

    });

    // Editor - 실패이후롤백여부
    $("#failAftRollbackYn").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");
        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("failAftRollbackYn", this.value);

    });

    // Editor - 롤백우선순위값
    $("#rollbackProrVal").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");
        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("rollbackProrVal", this.value);

    });

    // textarea - SQL텍스트내용
    $("#sqlTextCont").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");
        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("sqlTextCont", this.value);

    });

    // textarea - 롤백SQL텍스트내용
    $("#rollbackSqlTextCont").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");
        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("rollbackSqlTextCont", this.value);

    });

    // deployProrVal
    $("#deployProrVal").on("change", function() {
        var grid = $("#sqlGrid").data("kendoExtGrid");

        if(gv_sqlGridModel_currUid == 'undefined' || gv_sqlGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_sqlGridModel_currUid).set("deployProrVal", this.value);

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
            ,requestEnd:function(e) {
                gv_prtyGridMode = null;

            }

        }

        ,dataBinding:function(e) {
//             initPrtyForm();
        }
        ,height:140
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
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_prtyGridModel_currUid = selectedVal.uid;
                gv_prtyGridMode = "M";

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
            var row = null;
            if(gv_prtyGridMode == null) {
                row = grid.tbody.find("tr:eq(0)");
            } else if(gv_prtyGridMode == "M") {
                row = grid.table.find("[data-uid=" + gv_prtyGridModel_currUid + "]");
            }
            if(row.length > 0) {
                grid.select(row);
            }

        }

    });

    //버튼 - PROPERTY 추가
    $("#btnAddPrty").kendoButton({
        click:function(e) {
            var grid = $("#prtyGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                                                     specTpNm:'PROPERTY'  // SPEC유형
                                                     ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.prty.failAftCtnuPgssYn']
                                                     ,failAftRollbackYn:cmmPrtyListObj['specReg.prty.failAftRollbackYn']
                                                     ,operTryCnt:cmmPrtyListObj['specReg.prty.operTryCnt']
                                                     ,prtyFileTpNm:cmmPrtyListObj['specReg.prty.fileTpNm']
                                                 });
            gv_prtyGridModel_currUid = dataItem.uid;

            var row = grid.tbody.find("tr:eq(0)");
            grid.select(row);

        }
    });

    // 버튼 - PROPERTY 삭제
    $("#btnDelPrty").kendoButton({
        click:function(e){

            var grid = $("#prtyGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

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

    // Editor - 작업시도횟수
    $("#prty_operTryCnt").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");

        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("operTryCnt", this.value);

    });

    // Editor - PROPERTY파일명
    $("#prty_prtyFileNm").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");

        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("prtyFileNm", this.value);

    });

    // Editor - PROPERTY키명
    $("#prty_prtyKeyNm").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");

        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("prtyKeyNm", this.value);

    });


    // Editor - PROPERTY키값
    $("#prty_prtyKeyVal").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");


        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("prtyKeyVal", this.value);

    });

    // Editor - 실패이후계속진행여부
    $("#prty_failAftCtnuPgssYn").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");

        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("failAftCtnuPgssYn", this.value);

    });

    // Editor - 실패이후롤백여부
    $("#prty_failAftRollbackYn").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");

        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("failAftRollbackYn", this.value);

    });


    // Editor -
    $("#prty_prtyFileTpNm").on("change", function() {
        var grid = $("#prtyGrid").data("kendoExtGrid");

        if(gv_prtyGridModel_currUid == 'undefined' || gv_prtyGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_prtyGridModel_currUid).set("prtyFileTpNm", this.value);

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
                        ,targpath:{type:"string"}
                    }
                }
            }
            ,requestEnd:function(e) {
                gv_fileGridMode = null;

            }

        }

        ,dataBinding:function(e) {
//             initFileForm();
        }
        ,height:300
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
            ,{field:"targFilePathNm", hidden:true
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_fileGridModel_currUid = selectedVal.uid;
                gv_fileGridMode = "M";

                $('#file_operTryCnt').val(selectedVal.operTryCnt);
                $('#file_srcFilePathNm').val(selectedVal.srcFilePathNm);
                $('#file_targFilePathNm').val(selectedVal.targFilePathNm);
                $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(selectedVal.dlrCdAutoAddYn);
                $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#file_bakTargFilePathNm').val(selectedVal.bakTargFilePathNm);

            } else {
                $('#file_operTryCnt').val(null);
                $('#file_srcFilePathNm').val(null);
                $('#file_targFilePathNm').val(null);
                $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(null);
                $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#file_bakTargFilePathNm').val(null);
            }

        },dataBound:function(e) {
            var grid = e.sender;
            var row = null;
            if(gv_fileGridMode == null) {
                row = grid.tbody.find("tr:eq(0)");
            } else if(gv_fileGridMode == "M") {
                row = grid.table.find("[data-uid=" + gv_fileGridModel_currUid + "]");
            }
            if(row.length > 0) {
                grid.select(row);
            }

        }

    });

    $("#btnAddFileFolder").kendoButton({
        click:function(e) {
            searchSrcFileFolderPopup();

        }
    });
    //버튼 - FILE 추가
    $("#btnAddFile").kendoButton({
        click:function(e) {
            var grid = $("#fileGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                                                     specTpNm:'FILE'  // SPEC유형
                                                    ,dlrCdAutoAddYn:cmmPrtyListObj['specReg.file.dlrCdAutoAddYn']
                                                    ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.file.failAftCtnuPgssYn']
                                                    ,failAftRollbackYn:cmmPrtyListObj['specReg.file.failAftRollbackYn']
                                                    ,operTryCnt:cmmPrtyListObj['specReg.file.operTryCnt']
                                                 });

            gv_fileGridModel_currUid = dataItem.uid;

            var row = grid.tbody.find("tr:eq(0)");
            grid.select(row);

        }
    });


    // 버튼 - FILE 삭제
    $("#btnDelFile").kendoButton({
        click:function(e){

            var grid = $("#fileGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

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


    // Editor - 작업시도횟수
    $("#file_operTryCnt").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("operTryCnt", this.value);

    });

    // Editor - PROPERTY파일명
    $("#file_srcFilePathNm").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("srcFilePathNm", this.value);

    });

    // Editor - PROPERTY키명
    $("#file_targFilePathNm").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("targFilePathNm", this.value);

    });


    // Editor - PROPERTY키값
    $("#file_dlrCdAutoAddYn").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("dlrCdAutoAddYn", this.value);

    });

    // Editor - 실패이후계속진행여부
    $("#file_failAftCtnuPgssYn").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("failAftCtnuPgssYn", this.value);

    });

    // Editor - 실패이후롤백여부
    $("#file_failAftRollbackYn").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("failAftRollbackYn", this.value);

    });

    // Editor - 실패이후롤백여부
    $("#file_bakTargFilePathNm").on("change", function() {
        var grid = $("#fileGrid").data("kendoExtGrid");

        if(gv_fileGridModel_currUid == 'undefined' || gv_fileGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_fileGridModel_currUid).set("bakTargFilePathNm", this.value);

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
            ,{field:"deployStartDt", title:"<spring:message code='global.lbl.deployPlanStartDt' />", width:200
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployEndDt", title:"<spring:message code='global.lbl.deployPlanEndDt' />", width:200
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());
                gv_dplyMastGridModel_currUid = selectedVal.uid;

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

                $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource.data([]);

                if($("#specCd").val() != null && dataItem.deployVerNo != null) {
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();
                } else {
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource.data([]);
                }

                // Activate 버튼 활성화 CONTROL
                if($("#specCd").val() != null && dataItem.deployVerNo != null && dataItem.deployStatCd == 'W') {
                    var obj = $("#dplyMastGrid");
                    if(obj.css("display") == "none"){
                        $("#btnActivate").hide();
                    } else {
                        $("#btnActivate").show();
                    }
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

            if(btnActivateClicked == "N") {
                var row = grid.tbody.find("tr:eq(0)");
                if(row.length > 0) {
                    grid.select(row);
                } else {

                }

            } else if(btnActivateClicked == "Y") {
                var row = grid.tbody.find("tr:eq(" + indexOfDplyMastGrid +")");
                if(row.length > 0) {
                    grid.select(row);
                } else {

                }

                btnActivateClicked = 'N';
            }
        }

    });

    var dplyMastGrid = $('#dplyMastGrid').data('kendoExtGrid');

    $(dplyMastGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        console.log(dplyMastGrid.dataItem(row));
        var rowIdx = $("tr", dplyMastGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);
        console.log(rowIdx + '-' + colIdx);

        indexOfDplyMastGrid = rowIdx;
    });

    //버튼 - Deploy Master 추가
    $("#btnAddDplyMast").kendoButton({
        click:function(e) {
            var grid = $("#dplyMastGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                scheduleTpCd        :cmmPrtyListObj['specReg.dplyMast.scheduleTpCd']           // 스케줄유형코드
              , deployTpCd          :cmmPrtyListObj['specReg.dplyMast.deployTpCd']             // DEPLOY유형코드
              , deployStatCd        :cmmPrtyListObj['specReg.dplyMast.deployStatCd']           // DEPLOY상태코드
              , deployRetryCnt      :cmmPrtyListObj['specReg.dplyMast.deployRetryCnt']         // DEPLOY재시도횟수
              , deployRetryIvalVal  :cmmPrtyListObj['specReg.dplyMast.deployRetryIvalVal']     // DEPLOY재시도간격값
              , rsltReceiveTmoutHm  :cmmPrtyListObj['specReg.dplyMast.rsltReceiveTmoutHm']     // 결과수신타임아웃시간
              , achkFailAlwYn       :cmmPrtyListObj['specReg.dplyMast.achkFailAlwYn']          // ALIVECHECK실패허용여부
              , achkFailAlwCnt      :cmmPrtyListObj['specReg.dplyMast.achkFailAlwCnt']         // ALIVECHECK실패허용건수
              , alwFailDmsCnt       :cmmPrtyListObj['specReg.dplyMast.alwFailDmsCnt']          // 허용실패DMS건수
              , dmsGrpCnt           :cmmPrtyListObj['specReg.dplyMast.dmsGrpCnt']              // DMS그룹건수
              , procRsltNotiYn      :cmmPrtyListObj['specReg.dplyMast.procRsltNotiYn']         // 처리결과공지여부
              , procRsltNotiEndYn   :cmmPrtyListObj['specReg.dplyMast.procRsltNotiEndYn']      // 처리결과공지완료여부
              , deployStartDt       :null                                                      // DEPLOY시작일자
              , deployEndDt         :null                                                      // DEPLOY종료일자
              , procRsltNotiEndDt   :null                                                      // 처리결과공지완료일자
            });

            var row = grid.tbody.find("tr:eq(0)");
            grid.select(row);

            $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);

        }
    });

    // 버튼 - Deploy Master 삭제
    $("#btnDelDplyMast").kendoButton({
        click:function(e){

            var grid = $("#dplyMastGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

        }
    });


    // 버튼 - Activate
    $("#btnActivate").kendoButton({
        click:function(e){

            var grid = $("#dplyMastGrid").data("kendoExtGrid");
            var rows = grid.select();

            dataItem = grid.dataItem(rows);

            var params = {};
            params["sSpecCd"]      = dataItem.specCd;
            params["sDeployVerNo"] = dataItem.deployVerNo;

            $.ajax({
                url:"<c:url value='/dply/spec/specMng/selectDeployDealerCount.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {

                    if(jqXHR > 0) {
                        //dms.notification.info("<spring:message code='global.info.success'/>");
                        updateDplyMastStateToReg();

                    } else {
                        dms.notification.info("<spring:message code='cmm.info.actAfterRegDealer' />");     // 대상 딜러를 등록 후 활성화 해주세요
                    }

                }
            });


        }
    });

    // 버튼
    $("#btnSearchReport").kendoButton({
        click:function(e) {
            searchDplyReportDetailPopup();
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

    //
    $("#deployVerNo").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployVerNo", this.value);

    });

    //
    $("#deployTpCd").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployTpCd", this.value);

    });

    //
    $("#deployStartDt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployStartDt", $("#deployStartDt").data("kendoDateTimePicker").value());

        var i = 0;

    });

    //
    $("#deployEndDt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployEndDt", $("#deployEndDt").data("kendoDateTimePicker").value());

    });

    //
    $("#scheduleTpCd").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");
        if($("#scheduleTpCd").val()=="I"){

        }
        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("scheduleTpCd", this.value);

    });

    //
    $("#deployStatCd").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployStatCd", this.value);

    });

    //
    $("#rsltReceiveTmoutHm").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("rsltReceiveTmoutHm", this.value);

    });

    //
    $("#achkFailAlwCnt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("achkFailAlwCnt", this.value);

    });

    //
    $("#alwFailDmsCnt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("alwFailDmsCnt", this.value);

    });

    //
    $("#dmsGrpCnt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("dmsGrpCnt", this.value);

    });

    //
    $("#procRsltNotiYn").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("procRsltNotiYn", this.value);

    });

    //
    $("#procRsltNotiEndYn").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("procRsltNotiEndYn", this.value);

    });

    //
    $("#procRsltNotiEndDt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("procRsltNotiEndDt", $("procRsltNotiEndDt").data("kendoDateTimePicker").value());

    });

    //
    $("#deployRetryCnt").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployRetryCnt", this.value);

    });

    //
    $("#deployRetryIvalVal").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("deployRetryIvalVal", this.value);

    });

    //
    $("#achkFailAlwYn").on("change", function() {
        var grid = $("#dplyMastGrid").data("kendoExtGrid");

        if(gv_dplyMastGridModel_currUid == 'undefined' || gv_dplyMastGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_dplyMastGridModel_currUid).set("achkFailAlwYn", this.value);

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
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:140
            }
            ,{field:"deployProcCnt", title:"<spring:message code='global.lbl.deployProcCnt' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastDeployProcDt", title:"<spring:message code='global.lbl.lastDeployProcDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployReqEndYn", title:"<spring:message code='global.lbl.deployReqEndYn' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployExcpYn", title:"<spring:message code='global.lbl.deployExcpYn' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:120
                ,attributes:{"class":"ac"}
                ,template:"#=deployRsltCdArray[deployRsltCd]#"
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

    // 버튼 - DMS추가
    $("#btnAddDms").kendoButton({
        click:function(e) {
            searchDmsPopup();
        }
    });

    // 버튼 - 제외 여부 'Y' 처리
    $("#btnExcludeDms").kendoButton({
        click:function(e) {
            updateDmsDeployExcpYn('Y');
        }
    });

    // 버튼 - 제외 여부 'N' 처리
    $("#btnIncludeDms").kendoButton({
        click:function(e) {
            updateDmsDeployExcpYn('N');
        }
    });


    //
    $("#btnActivate").hide();


    $('#serviceFormHeader').click(function() {
        var obj = $("#serviceGrid");
        if(obj.css("display") == "none"){
            $("#serviceFormHeader").html("<spring:message code='global.title.appDeploy' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
        } else {
            $("#serviceFormHeader").html("<spring:message code='global.title.appDeploy' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
        }

        var obj = $("#serviceGrid");
        toggleDivShow(obj);

        var obj = $("#serviceInfoDiv");
        toggleDivShow(obj);

        var obj = $("#btnAddService");
        toggleDivShow(obj);

        var obj = $("#btnDelService");
        toggleDivShow(obj);
    });

    $('#commandFormHeader').click(function() {
        var obj = $("#commandGrid");
        if(obj.css("display") == "none"){
            $("#commandFormHeader").html("<spring:message code='global.title.commandDeploy' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
        } else {
            $("#commandFormHeader").html("<spring:message code='global.title.commandDeploy' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
        }

        var obj = $("#commandGrid");
        toggleDivShow(obj);

        var obj = $("#commandInfoDiv");
        toggleDivShow(obj);

        var obj = $("#btnAddCommand");
        toggleDivShow(obj);

        var obj = $("#btnDelCommand");
        toggleDivShow(obj);
    });

    $('#sqlFormHeader').click(function() {
        var obj = $("#sqlGrid");
        if(obj.css("display") == "none"){
            $("#sqlFormHeader").html("<spring:message code='global.title.sqlDeploy' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
        } else {
            $("#sqlFormHeader").html("<spring:message code='global.title.sqlDeploy' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
        }

        var obj = $("#sqlGrid");
        toggleDivShow(obj);

        var obj = $("#sqlInfoDiv");
        toggleDivShow(obj);

        var obj = $("#btnAddSql");
        toggleDivShow(obj);

        var obj = $("#btnDelSql");
        toggleDivShow(obj);
    });

    $('#prtyFormHeader').click(function() {
        var obj = $("#prtyGrid");
        if(obj.css("display") == "none"){
            $("#prtyFormHeader").html("<spring:message code='global.title.propertyDeploy' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
        } else {
            $("#prtyFormHeader").html("<spring:message code='global.title.propertyDeploy' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
        }

        var obj = $("#prtyGrid");
        toggleDivShow(obj);

        var obj = $("#prtyInfoDiv");
        toggleDivShow(obj);

        var obj = $("#btnAddPrty");
        toggleDivShow(obj);

        var obj = $("#btnDelPrty");
        toggleDivShow(obj);
    });

    $('#fileFormHeader').click(function() {
        var obj = $("#fileGrid");
        if(obj.css("display") == "none"){
            $("#fileFormHeader").html("<spring:message code='global.title.fileDeploy' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
        } else {
            $("#fileFormHeader").html("<spring:message code='global.title.fileDeploy' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
        }

        var obj = $("#fileGrid");
        toggleDivShow(obj);

        var obj = $("#fileInfoDiv");
        toggleDivShow(obj);

        var obj = $("#btnAddFileFolder");
        toggleDivShow(obj);

        var obj = $("#btnAddFile");
        toggleDivShow(obj);

        var obj = $("#btnDelFile");
        toggleDivShow(obj);
    });

    $('#dplyMastFormHeader').click(function() {
        var obj = $("#dplyMastGrid");
        if(obj.css("display") == "none"){
            $("#dplyMastFormHeader").html("<spring:message code='global.title.deployPolicy' />&nbsp;" + "<font color='#0100FF'>(-)</font>");
        } else {
            $("#dplyMastFormHeader").html("<spring:message code='global.title.deployPolicy' />&nbsp;" + "<font color='#0100FF'>(+)</font>");
        }

        var obj = $("#dplyMastGrid");
        toggleDivShow(obj);

        var obj = $("#dplyMastInfoDiv");
        toggleDivShow(obj);

        var obj = $("#btnAddDplyMast");
        toggleDivShow(obj);

        var obj = $("#btnDelDplyMast");
        toggleDivShow(obj);

        var obj = $("#dplyDetailInfoDiv");
        toggleDivShow(obj);


        var grid = $("#dplyMastGrid").data("kendoExtGrid");
        dataItem = grid.dataItem(grid.select());

        if(dataItem != null && $("#specCd").val() != null && dataItem.deployVerNo != null && dataItem.deployStatCd == 'W') {
            var obj = $("#dplyMastGrid");
            if(obj.css("display") == "none"){
                $("#btnActivate").hide();
            } else {
                $("#btnActivate").show();
            }

        } else {
            $("#btnActivate").hide();
        }


    });

    $('#serviceFormHeader').click();
    $('#commandFormHeader').click();
    $('#sqlFormHeader').click();
    $('#prtyFormHeader').click();
    $('#fileFormHeader').click();
    $('#dplyMastFormHeader').click();

    rollingFlag = "folded";

    $("#btnDivUnfold").kendoButton({
        click:function(e) {
            if(rollingFlag == "folded") {

                var obj = $("#serviceGrid");
                if(obj.css("display") == "none"){
                    $('#serviceFormHeader').click();
                }

                var obj = $("#commandGrid");
                if(obj.css("display") == "none"){
                    $('#commandFormHeader').click();
                }

                var obj = $("#sqlGrid");
                if(obj.css("display") == "none"){
                    $('#sqlFormHeader').click();
                }

                var obj = $("#prtyGrid");
                if(obj.css("display") == "none"){
                    $('#prtyFormHeader').click();
                }

                var obj = $("#fileGrid");
                if(obj.css("display") == "none"){
                    $('#fileFormHeader').click();
                }

                var obj = $("#dplyMastGrid");
                if(obj.css("display") == "none"){
                    $('#dplyMastFormHeader').click();
                }

                rollingFlag = "unfolded";
                $("#btnDivUnfold").text("Rolling Up (-)");

            } else {

                var obj = $("#serviceGrid");
                if(obj.css("display") != "none"){
                    $('#serviceFormHeader').click();
                }

                var obj = $("#commandGrid");
                if(obj.css("display") != "none"){
                    $('#commandFormHeader').click();
                }

                var obj = $("#sqlGrid");
                if(obj.css("display") != "none"){
                    $('#sqlFormHeader').click();
                }

                var obj = $("#prtyGrid");
                if(obj.css("display") != "none"){
                    $('#prtyFormHeader').click();
                }

                var obj = $("#fileGrid");
                if(obj.css("display") != "none"){
                    $('#fileFormHeader').click();
                }

                var obj = $("#dplyMastGrid");
                if(obj.css("display") != "none"){
                    $('#dplyMastFormHeader').click();
                }

                rollingFlag = "folded";
                $("#btnDivUnfold").text("Rolling Down (+)");

            }
        }
    });
});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 결함관리대장 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.faultLdgrMgr" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-10920" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-10921" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_modify" id="btnEdit"><spring:message code="global.btn.update" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-10922" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_delete" id="btnDel"><spring:message code="global.btn.del" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-10923" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
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
                    <th scope="row"><spring:message code="global.lbl.sysSub" /></th>
                    <td>
                        <input id="sSysTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.targetArea" /></th>
                    <td>
                        <input id="sTargetArea" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.targetTp" /></th>
                    <td>
                        <input id="sTargetTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.caseId" /></th>
                    <td>
                        <input id="sCaseId" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.faultTp" /></th>
                    <td>
                        <input id="sFaultTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.faultSubTp" /></th>
                    <td>
                        <input id="sFaultSubTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.faultRegUsrNm" /></th>
                    <td>
                        <input id="sFaultRegUsrNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.faultRegDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartFaultRegDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndFaultRegDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.faultDecisionTp" /></th>
                    <td>
                        <input id="sFaultDecisionTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.severity" /></th>
                    <td>
                        <input id="sSeverity" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.priority" /></th>
                    <td>
                        <input id="sPriority" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.resolveUsrNm" /></th>
                    <td>
                        <input id="sResolveUsrNm" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.resolveDueDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartResolveDueDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndResolveDueDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.resolveDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartResolveDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndResolveDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.checkDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartCheckDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndCheckDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.checkUsrNm" /></th>
                    <td>
                        <input id="sCheckUsrNm" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.checkRsltCd" /></th>
                    <td>
                        <input id="sCheckRsltCd" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <!-- 상세정보 시작 -->
    <section id="faultLdgrPopup" class="pop_wrap">
        <div id="faultLdgrForm" >
        <input type="hidden" id="faultNo" name="faultNo" data-json-obj="true"/>
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="cmm.title.faultLdgrInfo" /></h2>
                <div class="btn_right">
                    <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    <button type="button" class="btn_m btn_delete" id="btnDelOnPopup" ><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                </div>
            </div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.sysSub" /></span></th>
                            <td class="required_area">
                                <input type="text" id="sysTp" name="sysTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.sysSub" />" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.targetArea" /></span></th>
                            <td class="required_area">
                                <input type="text" id="targetArea" name="targetArea" class="form_comboBox" required data-name="<spring:message code="global.lbl.targetArea" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.targetTp" /></span></th>
                            <td class="required_area">
                                <input type="text" id="targetTp" name="targetTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.targetTp" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.caseId" /></th>
                            <td>
                                <input type="text" id="caseId" name="caseId" class="form_input" data-name="<spring:message code="global.lbl.caseId" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.faultTp" /></span></th>
                            <td class="required_area">
                                <input type="text" id="faultTp" name="faultTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.faultTp" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.faultSubTp" /></span></th>
                            <td class="required_area">
                                <input type="text" id="faultSubTp" name="faultSubTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.faultSubTp" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.faultRegUsrNm" /></span></th>
                            <td>
                                <input type="text" id="faultRegUsrNm" name="faultRegUsrNm" class="form_input" required data-name="<spring:message code="global.lbl.faultRegUsrNm" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.faultRegDt" /></span></th>
                            <td class="required_area">
                                <input type="date" id="faultRegDt" name="faultRegDt" class="form_datepicker" required data-name="<spring:message code="global.lbl.faultRegDt" />">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.faultDecisionTp" /></span></th>
                            <td class="required_area">
                                <input type="text" id="faultDecisionTp" name="faultDecisionTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.faultDecisionTp" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.severity" /></span></th>
                            <td class="required_area">
                                <input type="text" id="severity" name="severity" class="form_comboBox" required data-name="<spring:message code="global.lbl.severity" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.priority" /></span></th>
                            <td class="required_area">
                                <input type="text" id="priority" name="priority" class="form_comboBox" required data-name="<spring:message code="global.lbl.priority" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.resolveUsrNm" /></th>
                            <td>
                                <input type="text" id="resolveUsrNm" name="resolveUsrNm" class="form_input" data-name="<spring:message code="global.lbl.resolveUsrNm" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.resolveDueDt" /></th>
                            <td>
                                <input type="date" id="resolveDueDt" name="resolveDueDt" class="form_datepicker" data-name="<spring:message code="global.lbl.resolveDueDt" />">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.resolveDt" /></th>
                            <td>
                                <input type="text" id="resolveDt" name="resolveDt" class="form_comboBox" data-name="<spring:message code="global.lbl.resolveDt" />" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.checkDt" /></th>
                            <td>
                                <input type="text" id="checkDt" name="checkDt" class="form_comboBox" data-name="<spring:message code="global.lbl.checkDt" />" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.checkUsrNm" /></th>
                            <td>
                                <input type="text" id="checkUsrNm" name="checkUsrNm" class="form_input" data-name="<spring:message code="global.lbl.checkUsrNm" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.checkRsltCd" /></th>
                            <td>
                                <input type="text" id="checkRsltCd" name="checkRsltCd" class="form_comboBox" data-name="<spring:message code="global.lbl.checkRsltCd" />" data-json-obj="true"/>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section class="group mt10">
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.faultCont" /></span></th>
                            <td class="required_area" colspan="4">
                                <textarea id="faultCont" name="faultCont" rows="6" cols="" class="form_textarea" style="height:100px;" required data-name="<spring:message code="global.lbl.faultCont" />" data-json-obj="true"></textarea>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.faultAnlyCont" /></th>
                            <td class="required_area" colspan="4">
                                <textarea id="faultAnlyCont" name="faultAnlyCont" rows="6" cols="" class="form_textarea" style="height:100px;" data-name="<spring:message code="global.lbl.faultAnlyCont" />" data-json-obj="true"></textarea>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.resolvePlan" /></th>
                            <td class="required_area" colspan="4">
                                <textarea id="resolvePlan" name="resolvePlan" rows="5" style="height:80px;" cols="" class="form_textarea" data-name="<spring:message code="global.lbl.resolvePlan" />" data-json-obj="true"></textarea>
                            </td>
                            <td></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>
        </div>
    </section>
    <!-- 상세정보 종료 -->
</section>
</div>

<script type="text/javascript">
//서브시스템
var sysTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${sysTpList}">
sysTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//서브시스템맵
var sysTpMap = dms.data.arrayToMap(sysTpList, function(obj){ return obj.cmmCd; });

//대상영역
var targetAreaList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${targetAreaList}">
targetAreaList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//대상영역맵
var targetAreaMap = dms.data.arrayToMap(targetAreaList, function(obj){ return obj.cmmCd; });

//대상유형
var targetTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${targetTpList}">
targetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//대상유형맵
var targetTpMap = dms.data.arrayToMap(targetTpList, function(obj){ return obj.cmmCd; });

//결함유형
var faultTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${faultTpList}">
faultTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//결함유형맵
var faultTpMap = dms.data.arrayToMap(faultTpList, function(obj){ return obj.cmmCd; });

//결함상세유형
var faultSubTpMap = [];
<c:forEach items="${faultSubTpMap}" var="entry" varStatus="status">
    var faultSubTpList${status.index} = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach items="${entry.value}" var="obj">
    faultSubTpList${status.index}.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    faultSubTpMap["${entry.key}"] = faultSubTpList${status.index};
</c:forEach>

//판단
var faultDecisionTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${faultDecisionTpList}">
faultDecisionTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판단 맵
var faultDecisionTpMap = dms.data.arrayToMap(faultDecisionTpList, function(obj){ return obj.cmmCd; });

//심각도
var severityList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${severityList}">
severityList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//심각도 맵
var severityMap = dms.data.arrayToMap(severityList, function(obj){ return obj.cmmCd; });

//우선순위
var priorityList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${priorityList}">
priorityList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//우선순위 맵
var priorityMap = dms.data.arrayToMap(priorityList, function(obj){ return obj.cmmCd; });

//확인결과
var checkRsltCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${checkRsltCdList}">
checkRsltCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//확인결과 맵
var checkRsltCdMap = dms.data.arrayToMap(checkRsltCdList, function(obj){ return obj.cmmCd; });

//결함대장 입력값을 설정한다.
function initForm(obj) {
    var data = obj;

    //신규 화면인 경우
    if(!data){
        $("#btnDelOnPopup").hide();
        $("#faultAnlyCont").attr("disabled", true);
        $("#faultDecisionTp").data("kendoExtDropDownList").enable(false);
        $("#resolvePlan").attr("disabled", true);
        $("#resolveUsrNm").attr("disabled", true);
        $("#resolveDueDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#resolveDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#checkDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#checkUsrNm").attr("disabled", true);
        $("#checkRsltCd").data("kendoExtDropDownList").enable(false);

        //초기값을 설정한다.
        data = {
            "faultNo":""
            ,"sysTp":"01"
            ,"targetArea":""
            ,"targetTp":"01"
            ,"caseId":""
            ,"faultTp":""
            ,"faultSubTp":""
            ,"faultCont":""
            ,"faultRegUsrNm":""
            ,"faultRegDt":"${faultRegDt}"
            ,"faultAnlyCont":""
            ,"faultDecisionTp":""
            ,"severity":"03"
            ,"priority":"3"
            ,"resolvePlan":""
            ,"resolveUsrNm":""
            ,"resolveDueDt":""
            ,"resolveDt":""
            ,"checkDt":""
            ,"checkUsrNm":""
            ,"checkRsltCd":""
        }

    //수정 화면인 경우
    }else{
        $("#btnDelOnPopup").show();
        $("#faultAnlyCont").attr("disabled", false);
        $("#faultDecisionTp").data("kendoExtDropDownList").enable(true);
        $("#resolvePlan").attr("disabled", false);
        $("#resolveUsrNm").attr("disabled", false);
        $("#resolveDueDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#resolveDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#checkDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#checkUsrNm").attr("disabled", false);
        $("#checkRsltCd").data("kendoExtDropDownList").enable(true);
    }

    $("#faultNo").val(data.faultNo);
    $("#sysTp").data("kendoExtDropDownList").value(data.sysTp);
    $("#targetArea").data("kendoExtDropDownList").value(data.targetArea);
    $("#targetTp").data("kendoExtDropDownList").value(data.targetTp);
    $("#caseId").val(data.caseId);
    $("#faultTp").data("kendoExtDropDownList").value(data.faultTp);
    $("#faultSubTp").data("kendoExtDropDownList").setDataSource(faultSubTpMap[data.faultTp]);
    $("#faultSubTp").data("kendoExtDropDownList").value(data.faultSubTp);
    $("#faultCont").val(data.faultCont);
    $("#faultRegUsrNm").val(data.faultRegUsrNm);
    $("#faultRegDt").data("kendoExtMaskedDatePicker").value(data.faultRegDt);
    $("#faultAnlyCont").val(data.faultAnlyCont);
    $("#faultDecisionTp").data("kendoExtDropDownList").value(data.faultDecisionTp);
    $("#severity").data("kendoExtDropDownList").value(data.severity);
    $("#priority").data("kendoExtDropDownList").value(data.priority);
    $("#resolvePlan").val(data.resolvePlan);
    $("#resolveUsrNm").val(data.resolveUsrNm);
    $("#resolveDueDt").data("kendoExtMaskedDatePicker").value(data.resolveDueDt);
    $("#resolveDt").data("kendoExtMaskedDatePicker").value(data.resolveDt);
    $("#checkDt").data("kendoExtMaskedDatePicker").value(data.checkDt);
    $("#checkUsrNm").val(data.checkUsrNm);
    $("#checkRsltCd").data("kendoExtDropDownList").value(data.checkRsltCd);
}

//결함대장 수정화면 팝업 화면을 오픈한다.
function openEditPopup(faultNo){
    $.ajax({
        url :"<c:url value='/cmm/bbs/faultLdgr/selectFaultLdgr.do' />"
        ,data:"faultNo="+faultNo
        ,type:'GET'
        ,dataType :'json'
        ,async :false
        ,error :function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success :function(data) {
            initForm(data);
            $("#faultLdgrPopup").data("kendoWindow").center().open();
        }
    });
}

//상세결함유형명
function faultSubTpNm(dataItem){
    var faultSubTpNm = "";

    if(!dataItem.faultTp){
        return faultSubTpNm;
    }

    var faultSubTpList = faultSubTpMap[dataItem.faultTp];

    $.each(faultSubTpList, function(idx, obj){
        if(obj.cmmCd == dataItem.faultSubTp){
            faultSubTpNm = obj.cmmCdNm;
            return false;
        }
    })

    return faultSubTpNm;
}

$(document).ready(function() {

    var validator = $("#faultLdgrForm").kendoExtValidator().data("kendoExtValidator");

    //조회조건 - 서브시스템
    $("#sSysTp").kendoExtDropDownList({
        dataSource :sysTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 대상영역
    $("#sTargetArea").kendoExtDropDownList({
        dataSource :targetAreaList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 대상유형
    $("#sTargetTp").kendoExtDropDownList({
        dataSource :targetTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 결함유형
    $("#sFaultTp").kendoExtDropDownList({
        dataSource :faultTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
        ,change:function(e) {
            var dataSource;

            if(dms.string.isEmpty(value)){
                dataSource = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
            }else{
                dataSource = faultSubTpMap[this.value()];
            }

            $("#sFaultSubTp").data("kendoExtDropDownList").setDataSource(dataSource);
        }
    });

    //조회조건 - 결함상세유형
    $("#sFaultSubTp").kendoExtDropDownList({
        dataSource :[{"cmmCd":"", "cmmCdNm":"", "useYn":""}]
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 식별일자 조회시작일
    $("#sStartFaultRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 식별일자 조회종료일
    $("#sEndFaultRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 판단
    $("#sFaultDecisionTp").kendoExtDropDownList({
        dataSource :faultDecisionTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 심각도
    $("#sSeverity").kendoExtDropDownList({
        dataSource :severityList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 우선순위
    $("#sPriority").kendoExtDropDownList({
        dataSource :priorityList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //조회조건 - 조치예정일 조회시작일
    $("#sStartResolveDueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 조치예정일 조회종료일
    $("#sEndResolveDueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 조치일 조회시작일
    $("#sStartResolveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 조치일 조회종료일
    $("#sEndResolveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 확인일 조회시작일
    $("#sStartCheckDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 확인일 조회종료일
    $("#sEndCheckDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 확인결과
    $("#sCheckRsltCd").kendoExtDropDownList({
        dataSource :checkRsltCdList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 서브시스템
    $("#sysTp").kendoExtDropDownList({
        dataSource :sysTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 대상영역
    $("#targetArea").kendoExtDropDownList({
        dataSource :targetAreaList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 대상유형
    $("#targetTp").kendoExtDropDownList({
        dataSource :targetTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 결함유형
    $("#faultTp").kendoExtDropDownList({
        dataSource :faultTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
        ,change:function(e) {
            var value = this.value();
            var dataSource;

            if(dms.string.isEmpty(value)){
                dataSource = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
            }else{
                dataSource = faultSubTpMap[value];
            }

            $("#faultSubTp").data("kendoExtDropDownList").setDataSource(dataSource);
        }
    });

    //상세정보 - 결함상세유형
    $("#faultSubTp").kendoExtDropDownList({
        dataSource :[{"cmmCd":"", "cmmCdNm":"", "useYn":""}]
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 식별일자
    $("#faultRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - 판단
    $("#faultDecisionTp").kendoExtDropDownList({
        dataSource :faultDecisionTpList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 심각도
    $("#severity").kendoExtDropDownList({
        dataSource :severityList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 우선순위
    $("#priority").kendoExtDropDownList({
        dataSource :priorityList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //상세정보 - 조치예정일
    $("#resolveDueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - 조치일
    $("#resolveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - 확인일
    $("#checkDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - 확인결과
    $("#checkRsltCd").kendoExtDropDownList({
        dataSource :checkRsltCdList
        ,dataTextField :"cmmCdNm"
        ,dataValueField :"cmmCd"
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click :function(e) {
            initForm();
            $("#faultLdgrPopup").data("kendoWindow").center().open();
        }
    });

    //버튼 - 수정
    $("#btnEdit").kendoButton({
        click :function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.select();

            if (row.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }
            openEditPopup(grid.dataItem(row).faultNo);
        }
    });

    //버튼 - 삭제[그리드 선택목록]
    $("#btnDel").kendoButton({
        click :function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.select();

            if (row.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            $.ajax({
                url :"<c:url value='/cmm/bbs/faultLdgr/deleteFaultLdgr.do' />"
                ,data:"faultNo="+grid.dataItem(row).faultNo
                ,type:'POST'
                ,dataType :'json'
                ,async :false
                ,error :function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success :function(data) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //그리드 릴로드
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                }
            });
        }
    });

    //버튼 - 삭제[상세정보팝업]
    $("#btnDelOnPopup").kendoButton({
        click :function(e) {

            var faultNo = $("#faultNo").val();
            if(dms.string.isEmpty(faultNo)){
                return;
            }

            $.ajax({
                url :"<c:url value='/cmm/bbs/faultLdgr/deleteFaultLdgr.do' />"
                ,data:"faultNo="+faultNo
                ,type:'POST'
                ,dataType :'json'
                ,async :false
                ,error :function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success :function(data) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //그리드 릴로드
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                    // 팝업 닫기
                    $("#faultLdgrPopup").data("kendoWindow").close();
                }
            });
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click :function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click :function(e) {
            if (validator.validate()) {
                var saveData = $("#faultLdgrForm").serializeObject($("#faultLdgrForm").serializeArrayInSelector("[data-json-obj='true']"));
                saveData["faultRegDt"] = $("#faultRegDt").data("kendoExtMaskedDatePicker").value();
                saveData["resolveDueDt"] = $("#resolveDueDt").data("kendoExtMaskedDatePicker").value();
                saveData["resolveDt"] = $("#resolveDt").data("kendoExtMaskedDatePicker").value();
                saveData["checkDt"] = $("#checkDt").data("kendoExtMaskedDatePicker").value();

                var strUrl;
                if(dms.string.isNotEmpty(saveData.faultNo)){
                    strUrl = "<c:url value='/cmm/bbs/faultLdgr/updateFaultLdgr.do' />";
                }else{
                    strUrl = "<c:url value='/cmm/bbs/faultLdgr/insertFaultLdgr.do' />";
                }

                $.ajax({
                    url :strUrl
                    ,data :JSON.stringify(saveData)
                    ,type :'POST'
                    ,dataType :'json'
                    ,contentType :'application/json'
                    ,error :function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success :function(result) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        //그리드 릴로드
                        $("#grid").data("kendoExtGrid").dataSource.page(1);
                        // 팝업 닫기
                        $("#faultLdgrPopup").data("kendoWindow").close();
                    }
                });
            }
        }
    });

    //그리드 더블클릭시 결함대장 수정화면 팝업을 오픈한다.
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");

        if(grid.select().length > 0){
            openEditPopup(grid.dataItem(grid.select()).faultNo);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId :"G-CMM-0817-112001"
        ,dataSource :{
             transport :{
                read :{
                    url :"<c:url value='/cmm/bbs/faultLdgr/selectFaultLdgrs.do' />"
                }
                ,parameterMap :function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSysTp"] = $("#sSysTp").data("kendoExtDropDownList").value();
                        params["sTargetArea"] = $("#sTargetArea").data("kendoExtDropDownList").value();
                        params["sTargetTp"] = $("#sTargetTp").data("kendoExtDropDownList").value();
                        params["sCaseId"] = $("#sCaseId").val();

                        params["sFaultTp"] = $("#sFaultTp").data("kendoExtDropDownList").value();
                        params["sFaultSubTp"] = $("#sFaultSubTp").data("kendoExtDropDownList").value();
                        params["sFaultRegUsrNm"] = $("#sFaultRegUsrNm").val();
                        params["sStartFaultRegDt"] = $("#sStartFaultRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndFaultRegDt"] = $("#sEndFaultRegDt").data("kendoExtMaskedDatePicker").value();

                        params["sFaultDecisionTp"] = $("#sFaultDecisionTp").data("kendoExtDropDownList").value();
                        params["sSeverity"] = $("#sSeverity").data("kendoExtDropDownList").value();
                        params["sPriority"] = $("#sPriority").data("kendoExtDropDownList").value();
                        params["sResolveUsrNm"] = $("#sResolveUsrNm").val();

                        params["sStartResolveDueDt"] = $("#sStartResolveDueDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndResolveDueDt"] = $("#sEndResolveDueDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartResolveDt"] = $("#sStartResolveDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndResolveDt"] = $("#sEndResolveDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartCheckDt"] = $("#sStartCheckDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndCheckDt"] = $("#sEndCheckDt").data("kendoExtMaskedDatePicker").value();
                        params["sCheckUsrNm"] = $("#sCheckUsrNm").val();

                        params["sCheckRsltCd"] = $("#sCheckRsltCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema :{
                model :{
                    id :"faultNo"
                    ,fields :{
                        faultNo :{type:"number"}
                        ,sysTp :{type:"string"}
                        ,targetArea :{type:"string"}
                        ,targetTp :{type:"string"}
                        ,caseId :{type:"string"}
                        ,faultTp :{type:"string"}
                        ,faultSubTp :{type:"string"}
                        ,faultCont :{type:"string"}
                        ,faultRegUsrNm :{type:"string"}
                        ,faultRegDt :{type:"date"}
                        ,faultRegDtFmt :{type:"date"}
                        ,faultAnlyCont :{type:"string"}
                        ,faultDecisionTp :{type:"string"}
                        ,severity :{type:"string"}
                        ,priority :{type:"number"}
                        ,resolvePlan :{type:"string"}
                        ,resolveUsrNm :{type:"string"}
                        ,resolveDueDt :{type:"date"}
                        ,resolveDueDtFmt :{type:"date"}
                        ,resolveDt :{type:"date"}
                        ,resolveDtFmt :{type:"date"}
                        ,checkDt :{type:"date"}
                        ,checkDtFmt :{type:"date"}
                        ,checkUsrNm :{type:"string"}
                        ,checkRsltCd :{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, obj) {
                            obj.rnum = d.total - obj.rnum + 1;
                            obj.sysTpNm = obj.sysTp? sysTpMap[obj.sysTp].cmmCdNm:"";
                            obj.targetAreaNm = obj.targetArea? targetAreaMap[obj.targetArea].cmmCdNm:"";
                            obj.targetTpNm = obj.targetTp? targetTpMap[obj.targetTp].cmmCdNm:"";
                            obj.faultTpNm = obj.faultTp? faultTpMap[obj.faultTp].cmmCdNm:"";
                            obj.faultSubTpNm = faultSubTpNm(obj);
                            obj.faultRegDtFmt = obj.faultRegDt? kendo.parseDate(obj.faultRegDt, "<dms:configValue code='dateFormat' />"):"";
                            obj.faultDecisionTpNm = obj.faultDecisionTp? faultDecisionTpMap[obj.faultDecisionTp].cmmCdNm:"";
                            obj.severityNm = obj.severity? severityMap[obj.severity].cmmCdNm:"";
                            obj.priorityNm = obj.priority? priorityMap[obj.priority].cmmCdNm:"";
                            obj.resolveDueDtFmt = obj.resolveDueDt? kendo.parseDate(obj.resolveDueDt, "<dms:configValue code='dateFormat' />"):"";
                            obj.resolveDtFmt = obj.resolveDt? kendo.parseDate(obj.resolveDt, "<dms:configValue code='dateFormat' />"):"";
                            obj.checkDtFmt = obj.checkDt? kendo.parseDate(obj.checkDt, "<dms:configValue code='dateFormat' />"):"";
                            obj.checkRsltCdNm = obj.checkRsltCd? checkRsltCdMap[obj.checkRsltCd].cmmCdNm:"";
                        });
                    }
                    return d;
                }
            }
        }
        ,selectable:"row"
        ,enableTooltip :true
        ,editable :false
        ,columns :[
            {field :"sysTpNm", title :"<spring:message code='global.lbl.sysSub' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"targetAreaNm", title :"<spring:message code='global.lbl.targetArea' />", width :120}
            ,{field :"targetTpNm", title :"<spring:message code='global.lbl.targetTp' />", width :120}
            ,{field :"caseId", title :"<spring:message code='global.lbl.caseId' />", width :150}
            ,{field :"faultTpNm", title :"<spring:message code='global.lbl.faultTp' />", width :120}
            ,{field :"faultSubTpNm", title :"<spring:message code='global.lbl.faultSubTp' />", width :120}
            ,{field :"faultRegUsrNm", title :"<spring:message code='global.lbl.faultRegUsrNm' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"faultRegDtFmt", title :"<spring:message code='global.lbl.faultRegDt' />", width :80, attributes :{"class" :"ac"}
                ,template:"#if(data.faultRegDt){# #=kendo.toString(data.faultRegDt, '<dms:configValue code='dateFormat' />')# #}#"
            }
            ,{field :"faultDecisionTpNm", title :"<spring:message code='global.lbl.faultDecisionTp' />", width :120}
            ,{field :"severityNm", title :"<spring:message code='global.lbl.severity' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"priorityNm", title :"<spring:message code='global.lbl.priority' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"resolveUsrNm", title :"<spring:message code='global.lbl.resolveUsrNm' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"resolveDueDtFmt", title :"<spring:message code='global.lbl.resolveDueDt' />", width :80, attributes :{"class" :"ac"}
                ,template:"#if(data.resolveDueDt){# #=kendo.toString(data.resolveDueDt, '<dms:configValue code='dateFormat' />')# #}#"
            }
            ,{field :"resolveDtFmt", title :"<spring:message code='global.lbl.resolveDt' />", width :80, attributes :{"class" :"ac"}
                ,template:"#if(data.resolveDt){# #=kendo.toString(data.resolveDt, '<dms:configValue code='dateFormat' />')# #}#"
            }
            ,{field :"checkDtFmt", title :"<spring:message code='global.lbl.checkDt' />", width :80, attributes :{"class" :"ac"}
                ,template:"#if(data.checkDt){# #=kendo.toString(data.checkDt, '<dms:configValue code='dateFormat' />')# #}#"
            }
            ,{field :"checkUsrNm", title :"<spring:message code='global.lbl.checkUsrNm' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"checkRsltCdNm", title :"<spring:message code='global.lbl.checkRsltCd' />", width :120, attributes :{"class" :"ac"}}
        ]
    });

    //결함대장 등록/수정 팝업
    $("#faultLdgrPopup").kendoWindow({
        animation :false
        ,draggable:true
        ,modal:false
        ,pinned:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='cmm.title.faultLdgrMgr' />"
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");

});

</script>








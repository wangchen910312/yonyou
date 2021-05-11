<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>

<!-- 변경요청사항 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">
            <spring:message code="cmm.title.changeRequestBoardMng" /><!-- 변경요청사항 관리 -->
        </h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-10916" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-10917" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_modify" id="btnEdit"><spring:message code="global.btn.update" /></button>
        </dms:access>
<%--             <button type="button" class="btn_m btn_delete" id="btnDel"><spring:message code="global.btn.del" /></button> --%>
        <dms:access viewId="VIEW-D-10919" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.issueTp" /></th>
                    <td>
                        <input id="sIssueTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueArea" /></th>
                    <td>
                        <input id="sIssueArea" type="text" class="form_comboBox" >
                    </td>
                     <th scope="row"><spring:message code="global.lbl.issueStatCd" /></th>
                    <td>
                        <input id="sIssueStatCd" type="text" class="form_comboBox" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.issueAcceptYn" /></th>
                    <td>
                        <input id="sAcceptYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueReqUsrNm" /></th>
                    <td>
                        <input id="sIssueReqUsrNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueStatUpdtDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartIssueStatUpdtDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndIssueStatUpdtDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.issueRevUsrNm" /></th>
                    <td>
                        <input id="sIssueRevUsrNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartIssueDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndIssueDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueDueDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartIssueDueDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndIssueDueDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.issueConfirmDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartIssueConfirmDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndIssueConfirmDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueCloseDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartIssueCloseDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndIssueCloseDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.issueHdlUsrNm" /></th>
                    <td>
                        <input id="sIssueHdlUsrNm" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.issueConfirmHdlUsrNm" /></th>
                    <td>
                        <input id="sIssueConfirmHdlUsrNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.severity" /></th>
                    <td>
                        <input id="sSeverity" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.priority" /></th>
                    <td>
                        <input id="sPriority" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.issueNo" /></th>
                    <td>
                        <input id="sIssueNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.title" /></th>
                    <td>
                        <input id="sIssueTitle" type="text" class="form_input">
                    </td>
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
    <section id="issueBoardMgmtPopup" class="pop_wrap">
        <div id="issueBoardForm" >
        <input type="hidden" id="issueBoardTp" name="issueBoardTp" value="${issueBoardTp}" data-json-obj="true"/>
        <input type="hidden" id="issueNo" name="issueNo" data-json-obj="true" />
        <input type="hidden" id="fileDocNo" name="fileDocNo" data-json-obj="true" />
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="cmm.title.chageRequestInfo" /><!-- 변경요청사항 정보 --></h2>
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueTp" /><!-- Issue 유형 --></span></th>
                            <td class="required_area">
                                <input type="text" id="issueTp" name="issueTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.issueTp" />" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueArea" /><!-- Issue 영역 --></span></th>
                            <td class="required_area">
                                <input type="text" id="issueArea" name="issueArea" class="form_comboBox" required data-name="<spring:message code="global.lbl.issueArea" />" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueReqUsrNm" /><!-- 요청자명 --></span></th>
                            <td class="required_area">
                                <input type="text" id="issueReqUsrNm" name="issueReqUsrNm" class="form_input" required data-name="<spring:message code="global.lbl.issueReqUsrNm" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueDt" /><!-- Issue 발생일자 --></span></th>
                            <td class="required_area">
                                <input type="date" id="issueDt" name="issueDt" class="form_datepicker" required data-name="<spring:message code="global.lbl.issueDt" />">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.issueDueDt" /><!-- Issue 처리기한 --></th>
                            <td class="required_area">
                                <input type="date" id="issueDueDt" name="issueDueDt" class="form_datepicker" data-name="<spring:message code="global.lbl.issueDueDt" />">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.issueRevUsrNm" /><!-- 수신자명 --></th>
                            <td>
                                <input type="text" id="issueRevUsrNm" name="issueRevUsrNm" class="form_input" data-name="<spring:message code="global.lbl.issueRevUsrNm" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.issueCloseDt" /><!-- Issue 종료일자 --></th>
                            <td>
                                <input type="date" id="issueCloseDt" name="issueCloseDt" class="form_datepicker" data-name="<spring:message code="global.lbl.issueCloseDt" />">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueStatCd" /><!-- Issue 처리상태 --></span></th>
                            <td class="required_area">
                                <input type="text" id="issueStatCd" name="issueStatCd" class="form_comboBox" required data-name="<spring:message code="global.lbl.issueStatCd" />" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.issueHdlUsrNm" /><!-- 처리자명 --></th>
                            <td>
                                <input type="text" id="issueHdlUsrNm" name="issueHdlUsrNm" class="form_input" data-name="<spring:message code="global.lbl.issueHdlUsrNm" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.issueAcceptYn" /><!-- 변경수용여부 --></th>
                            <td>
                                <input type="text" id="acceptYn" name="acceptYn" class="form_comboBox" required data-name="<spring:message code="global.lbl.issueAcceptYn" />" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.issueConfirmDt" /><!-- 현업확인일자 --></th>
                            <td>
                                <input type="date" id="issueConfirmDt" name="issueConfirmDt" class="form_datepicker" data-name="<spring:message code="global.lbl.issueConfirmDt" />">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.issueConfirmHdlUsrNm" /><!-- 현업확인자명 --></th>
                            <td>
                                <input type="text" id="issueConfirmHdlUsrNm" name="issueConfirmHdlUsrNm" class="form_input" data-name="<spring:message code="global.lbl.issueConfirmHdlUsrNm" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.severity" /><!-- 심각도 --></th>
                            <td class="required_area">
                                <input type="text" id="severity" name="severity" class="form_comboBox" data-name="<spring:message code="global.lbl.severity" />" data-json-obj="true"/>
                            </td>
                             <th scope="row"><spring:message code="global.lbl.priority" /><!-- 우선순위 --></th>
                            <td class="required_area">
                                <input type="text" id="priority" name="priority" class="form_comboBox" data-name="<spring:message code="global.lbl.priority" />" data-json-obj="true"/>
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.title" /><!-- Issue 제목 --></span></th>
                            <td class="required_area" colspan="4">
                                <input type="text" id="issueTitle" name="issueTitle" class="form_input" required data-name="<spring:message code="global.lbl.title" />" data-json-obj="true" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.cont" /><!-- Issue 내용 --></span></th>
                            <td class="required_area" colspan="4">
                                <textarea id="issueCont" name="issueCont" rows="4" cols="" class="form_textarea" style="height:70px;" required data-name="<spring:message code="global.lbl.cont" />" data-json-obj="true"></textarea>
                            </td>
                            <td></td>
                        </tr>

                        <!-- 변경요청사항게시판 인 경우에 한해서 출력한다. -->
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.issueReview" /><!-- 검토결과 --></th>
                            <td class="required_area" colspan="4">
                                <textarea id="issueReview" name="issueReview" rows="3" cols="" class="form_textarea" style="height:40px; data-name="<spring:message code="global.lbl.issueReview" />" data-json-obj="true"></textarea>
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="global.lbl.remark" /><!-- Issue 비고 --></th>
                            <td colspan="4">
                                <textarea id="notes" name="notes" rows="3" cols="" class="form_textarea" style="height:49px; data-name="<spring:message code="global.lbl.remark" />" data-json-obj="true"></textarea>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
            <div class="btn_right">
                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
            </div>
        </div>
        <div class="table_grid">
            <div id="fileGrid"></div>
        </div>
    </section>
    <!-- 상세정보 종료 -->
</section>
</div>

<script type="text/javascript">
//Issue 유형
var issueTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${issueTpList}">
issueTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//Issue 유형맵
var issueTpMap = dms.data.arrayToMap(issueTpList, function(obj){ return obj.cmmCd; });

//Issue 영역
var issueAreaList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${issueAreaList}">
issueAreaList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//Issue 영역맵
var issueAreaMap = dms.data.arrayToMap(issueAreaList, function(obj){ return obj.cmmCd; });

//Issue 처리상태
var issueStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${issueStatCdList}">
issueStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//Issue 처리상태맵
var issueStatCdMap = dms.data.arrayToMap(issueStatCdList, function(obj){ return obj.cmmCd; });

//변경수용여부
var acceptYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
acceptYnList.push({"cmmCd":"Y", "cmmCdNm":"Y", "useYn":"Y"});
acceptYnList.push({"cmmCd":"N", "cmmCdNm":"N", "useYn":"Y"});
//변경수용여부 맵
var acceptYnMap = dms.data.arrayToMap(issueStatCdList, function(obj){ return obj.cmmCd; });

//Issue 심각도
var severityList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${severityList}">
severityList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//Issue 심각도맵
var severityMap = dms.data.arrayToMap(severityList, function(obj){ return obj.cmmCd; });

//Issue 정보 입력값을 설정한다.
function initForm(obj) {
    var data = obj;

    //신규 화면인 경우
    if(!data){
        $("#btnDelOnPopup").hide();
        $("#issueCloseDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#issueStatCd").data("kendoExtDropDownList").enable(false);
        $("#issueHdlUsrNm").attr("disabled", true);
        $("#issueReview").attr("disabled", true);
        $("#acceptYn").attr("disabled", true);
        $("#issueConfirmDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#issueConfirmHdlUsrNm").attr("disabled", true);
        $("#issueCont").attr("readonly", false);

        //초기값을 설정한다.
        data = {
            "issueNo":""
            ,"issueTp":""
            ,"issueArea":""
            ,"issueTitle":""
            ,"issueCont":""
            ,"issueReqUsrNm":""
            ,"issueRevUsrNm":""
            ,"issueHdlUsrNm":""
            ,"issueDt":"${issueDt}"
            ,"issueDueDt":""
            ,"issueStatCd":"01"
            ,"issueCloseDt":""
            ,"issueReview":""
            ,"notes":""
            ,"fileDocNo":""
            ,"acceptYn":"N"
            ,"issueConfirmDt":""
            ,"issueConfirmHdlUsrNm":""
            ,"severity":"03"
            ,"priority":3
        }

    //수정 화면인 경우
    }else{
        $("#btnDelOnPopup").show();
        $("#issueCloseDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#issueStatCd").data("kendoExtDropDownList").enable(true);
        $("#issueHdlUsrNm").attr("disabled", false);
        $("#issueReview").attr("disabled", false);
        $("#acceptYn").attr("disabled", false);
        $("#issueConfirmDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#issueConfirmHdlUsrNm").attr("disabled", false);
        $("#issueCont").attr("readonly", true);
    }

    $("#issueNo").val(data.issueNo);
    $("#issueTp").data("kendoExtDropDownList").value(data.issueTp);
    $("#issueArea").data("kendoExtDropDownList").value(data.issueArea);
    $("#issueTitle").val(data.issueTitle);
    $("#issueCont").val(data.issueCont);
    $("#issueReqUsrNm").val(data.issueReqUsrNm);
    $("#issueRevUsrNm").val(data.issueRevUsrNm);
    $("#issueHdlUsrNm").val(data.issueHdlUsrNm);
    $("#issueDt").data("kendoExtMaskedDatePicker").value(data.issueDt);
    $("#issueDueDt").data("kendoExtMaskedDatePicker").value(data.issueDueDt);
    $("#issueStatCd").data("kendoExtDropDownList").value(data.issueStatCd);
    $("#issueCloseDt").data("kendoExtMaskedDatePicker").value(data.issueCloseDt);
    $("#notes").val(data.notes);
    $("#fileDocNo").val(data.fileDocNo);
    $("#issueReview").val(data.issueReview);
    $("#acceptYn").val(data.acceptYn);
    $("#issueConfirmDt").data("kendoExtMaskedDatePicker").value(data.issueConfirmDt);
    $("#issueConfirmHdlUsrNm").val(data.issueConfirmHdlUsrNm);
    $("#severity").data("kendoExtDropDownList").value(data.severity);
    $("#priority").data("kendoExtDropDownList").value(data.priority);

    $("#fileGrid").data("kendoExtGrid").dataSource.read();
}

//Issue 정보 수정화면 팝업 화면을 오픈한다.
function openEditPopup(issueNo){
    $.ajax({
        url:"<c:url value='/cmm/bbs/issueBoard/selectIssueBoard.do' />"
        ,data:"issueNo="+issueNo
        ,type:'GET'
        ,dataType:'json'
        ,async:false
        ,error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(data) {
            initForm(data);
            $("#issueBoardMgmtPopup").data("kendoWindow").center().open();
        }
    });
}

$(document).ready(function() {

    var validator = $("#issueBoardForm").kendoExtValidator().data("kendoExtValidator");

    //조회조건 - Issue 유형
    $("#sIssueTp").kendoExtDropDownList({
        dataSource:issueTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //조회조건 - Issue 영역
    $("#sIssueArea").kendoExtDropDownList({
        dataSource:issueAreaList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //조회조건 - Issue 처리상태
    $("#sIssueStatCd").kendoExtDropDownList({
        dataSource:issueStatCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //조회조건 - 처리상태 조회시작일
    $("#sStartIssueStatUpdtDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 처리상태 조회종료일
    $("#sEndIssueStatUpdtDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 발생일자 조회시작일
    $("#sStartIssueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 발생일자 조회종료일
    $("#sEndIssueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 처리기간 조회시작일
    $("#sStartIssueDueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 처리기간 조회종료일
    $("#sEndIssueDueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 처리일자 조회시작일
    $("#sStartIssueCloseDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 처리일자 조회종료일
    $("#sEndIssueCloseDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 변경수용여부
    $("#sAcceptYn").kendoExtDropDownList({
        dataSource:acceptYnList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //조회조건 - 현업확인일자 조회시작일
    $("#sStartIssueConfirmDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 현업확인일자 조회종료일
    $("#sEndIssueConfirmDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - Issue 심각도
    $("#sSeverity").kendoExtDropDownList({
        dataSource:severityList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //조회조건 - Issue 우선순위
    $("#sPriority").kendoExtDropDownList({
        dataSource:['','1','2','3','4','5']
    });

    //상세정보 - Issue 유형
    $("#issueTp").kendoExtDropDownList({
        dataSource:issueTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //상세정보 - Issue 영역
    $("#issueArea").kendoExtDropDownList({
        dataSource:issueAreaList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //상세정보 - Issue 처리상태
    $("#issueStatCd").kendoExtDropDownList({
        dataSource:issueStatCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,change:function(e){
            //BHMC확인으로 변경하는 경우 현업확인일자가 등록되어 있지 않다면 오늘 일자로 설정한다.
            if(this.value() == "09"){
                //BHMC확인
                if($("#issueConfirmDt").data("kendoExtMaskedDatePicker").value() == null){
                    $("#issueConfirmDt").data("kendoExtMaskedDatePicker").value("${today}");
                }
            }
        }
    });

    //상세정보 - Issue 발생일시
    $("#issueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:"${issueDt}"
    });

    //상세정보 - Issue 처리기한
    $("#issueDueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - Issue 처리일자
    $("#issueCloseDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - 변경수용여부
    $("#acceptYn").kendoExtDropDownList({
        dataSource:acceptYnList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //상세정보 - 현업확인일자
    $("#issueConfirmDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //상세정보 - 심각도
    $("#severity").kendoExtDropDownList({
        dataSource:severityList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
    });

    //상세정보 - 우선순위
    $("#priority").kendoExtDropDownList({
        dataSource:['','1','2','3','4','5']
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            initForm();
            $("#issueBoardMgmtPopup").data("kendoWindow").center().open();
        }
    });

    //버튼 - 수정
    $("#btnEdit").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.select();

            if (row.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }
            openEditPopup(grid.dataItem(row).issueNo);
        }
    });

    //버튼 - 삭제[그리드 선택목록]
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.select();

            if (row.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/cmm/bbs/issueBoard/deleteIssueBoard.do' />"
                ,data:"issueNo="+grid.dataItem(row).issueNo
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //그리드 릴로드
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                }
            });
        }
    });

    //버튼 - 팝업화면의 삭제버튼
    $("#btnDelOnPopup").kendoButton({
        click:function(e) {

            var issueNo = $("#issueNo").val();
            if(dms.string.isEmpty(issueNo)){
                return;
            }

            $.ajax({
                url:"<c:url value='/cmm/bbs/issueBoard/deleteIssueBoard.do' />"
                ,data:"issueNo="+issueNo
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //그리드 릴로드
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                    // 팝업 닫기
                    $("#issueBoardMgmtPopup").data("kendoWindow").close();
                }
            });
        }
    });

    //버튼 - 파일삭제
    $("#fileDelete").kendoButton({
        click:function(e) {

            var deleteFiles = [];
            var fileGrid = $('#fileGrid').data('kendoExtGrid');
            var rows = fileGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                deleteFiles.push(fileGrid.dataItem(row));
            });

            $.ajax({
                url:strUrl
                ,data:JSON.stringify(deleteFiles)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(result) {
                    fileGrid.dataSource.read();
                }
            });
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            if (validator.validate()) {

                var saveData = $("#issueBoardForm").serializeObject($("#issueBoardForm").serializeArrayInSelector("[data-json-obj='true']"));
                saveData["issueDt"] = $("#issueDt").data("kendoExtMaskedDatePicker").value();
                saveData["issueDueDt"] = $("#issueDueDt").data("kendoExtMaskedDatePicker").value();
                saveData["issueCloseDt"] = $("#issueCloseDt").data("kendoExtMaskedDatePicker").value();
                saveData["issueConfirmDt"] = $("#issueConfirmDt").data("kendoExtMaskedDatePicker").value();

                var strUrl;
                if(dms.string.isNotEmpty(saveData.issueNo)){
                    strUrl = "<c:url value='/cmm/bbs/issueBoard/updateIssueBoard.do' />";
                }else{
                    strUrl = "<c:url value='/cmm/bbs/issueBoard/insertIssueBoard.do' />";
                }

                $.ajax({
                    url:strUrl
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(result) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        //그리드 릴로드
                        $("#grid").data("kendoExtGrid").dataSource.page(1);
                        // 팝업 닫기
                        $("#issueBoardMgmtPopup").data("kendoWindow").close();
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show($("#issueBoardMgmtPopup"));
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide($("#issueBoardMgmtPopup"));
                    }
                });
            }
        }
    });

    //그리드 더블클릭시 Issue 정보 수정화면 팝업을 오픈한다.
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");

        if(grid.select().length > 0){
            openEditPopup(grid.dataItem(grid.select()).issueNo);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-CMM-0810-133101"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/bbs/issueBoard/selectIssueBoards.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sIssueNo"] = $("#sIssueNo").val();
                        params["sIssueBoardTp"] = "${issueBoardTp}";
                        params["sIssueTp"] = $("#sIssueTp").data("kendoExtDropDownList").value();
                        params["sIssueArea"] = $("#sIssueArea").data("kendoExtDropDownList").value();
                        params["sIssueStatCd"] = $("#sIssueStatCd").data("kendoExtDropDownList").value();
                        params["sStartIssueStatUpdtDt"] = $("#sStartIssueStatUpdtDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueStatUpdtDt"] = $("#sEndIssueStatUpdtDt").data("kendoExtMaskedDatePicker").value();
                        params["sIssueReqUsrNm"] = $("#sIssueReqUsrNm").val();
                        params["sIssueRevUsrNm"] = $("#sIssueRevUsrNm").val();
                        params["sIssueHdlUsrNm"] = $("#sIssueHdlUsrNm").val();
                        params["sStartIssueDt"] = $("#sStartIssueDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueDt"] = $("#sEndIssueDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartIssueDueDt"] = $("#sStartIssueDueDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueDueDt"] = $("#sEndIssueDueDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartIssueCloseDt"] = $("#sStartIssueCloseDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueCloseDt"] = $("#sEndIssueCloseDt").data("kendoExtMaskedDatePicker").value();
                        params["sIssueTitle"] = $("#sIssueTitle").val();
                        params["sAcceptYn"] = $("#sAcceptYn").val();
                        params["sStartIssueConfirmDt"] = $("#sStartIssueConfirmDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueConfirmDt"] = $("#sEndIssueConfirmDt").data("kendoExtMaskedDatePicker").value();
                        params["sIssueConfirmHdlUsrNm"] = $("#sIssueConfirmHdlUsrNm").val();
                        params["sSeverity"] = $("#sSeverity").data("kendoExtDropDownList").value();
                        params["sPriority"] = $("#sPriority").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"issueNo"
                    ,fields:{
                        rnum:{type:"number"}
                        ,issueNo:{type:"number"}
                        ,issueTp:{type:"string"}
                        ,issueArea:{type:"string"}
                        ,issueTitle:{type:"string"}
                        ,issueReqUsrNm:{type:"string"}
                        ,issueRevUsrNm:{type:"string"}
                        ,issueHdlUsrNm:{type:"string"}
                        ,issueDt:{type:"date"}
                        ,issueDueDt:{type:"date"}
                        ,issueStatCd:{type:"string"}
                        ,issueCloseDt:{type:"date"}
                        ,acceptYn:{type:"string"}
                        ,issueConfirmDt:{type:"date"}
                        ,issueConfirmHdlUsrNm:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, obj) {
                            obj.rnum = d.total - obj.rnum + 1;
                            obj.issueTpNm = obj.issueTp? issueTpMap[obj.issueTp].cmmCdNm:"";
                            obj.issueAreaNm = obj.issueArea? issueAreaMap[obj.issueArea].cmmCdNm:"";

    //                         obj.issueDtFmt = obj.issueDt? kendo.parseDate(obj.issueDt, "<dms:configValue code='dateFormat' />"):"";
    //                         obj.issueDueDtFmt = obj.issueDueDt? kendo.parseDate(obj.issueDueDt, "<dms:configValue code='dateFormat' />"):"";
    //                         obj.issueStatCdFmt = obj.issueStatCd? kendo.parseDate(obj.issueStatCd, "<dms:configValue code='dateFormat' />"):"";
    //                         obj.issueCloseDtFmt = obj.checkDt? kendo.parseDate(obj.issueCloseDt, "<dms:configValue code='dateFormat' />"):"";
                        });
                    }
                    return d;
                }
            }
        }
        ,selectable:"row"
        ,enableTooltip:true
        ,editable:false
        ,columns:[
            //{field:"rnum", title:"<spring:message code='global.lbl.no'/>", width:60 ,attributes:{"class":"ac"}}
            {field:"issueNo", title:"<spring:message code='global.lbl.issueNo' />", width:60}
            ,{field:"issueTpNm", title:"<spring:message code='global.lbl.issueTp' />", width:100}
            ,{field:"issueAreaNm", title:"<spring:message code='global.lbl.issueArea' />", width:60}
            ,{field:"issueTitle", title:"<spring:message code='global.lbl.title' />", width:250
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"issueCont", title:"<spring:message code='global.lbl.cont' />", width:300
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"issueReqUsrNm", title:"<spring:message code='global.lbl.issueReqUsrNm' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"issueRevUsrNm", title:"<spring:message code='global.lbl.issueRevUsrNm' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"issueHdlUsrNm", title:"<spring:message code='global.lbl.issueHdlUsrNm' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"issueDt", title:"<spring:message code='global.lbl.issueDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"issueDueDt", title:"<spring:message code='global.lbl.issueDueDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"issueStatCd", title:"<spring:message code='global.lbl.issueStatCd' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#if(issueStatCdMap[issueStatCd] != null) {# #=issueStatCdMap[issueStatCd].cmmCdNm# #}#"
            }
            ,{field:"issueStatUpdtDt", title:"<spring:message code='global.lbl.issueStatUpdtDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"issueCloseDt", title:"<spring:message code='global.lbl.issueCloseDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"acceptYn", title:"<spring:message code='global.lbl.issueAcceptYn' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"issueConfirmDt", title:"<spring:message code='global.lbl.issueConfirmDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"issueConfirmHdlUsrNm", title:"<spring:message code='global.lbl.issueConfirmHdlUsrNm' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"severity", title:"<spring:message code='global.lbl.severity' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#if(severityMap[severity] != null) {# #=severityMap[severity].cmmCdNm# #}#"
            }
            ,{field:"priority", title:"<spring:message code='global.lbl.priority' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.priority == 0) return "";
                    return dataItem.priority;
                }
            }
            ,{field:"issueReview", title:"<spring:message code='global.lbl.issueReview' />", width:300
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"notes", title:"<spring:message code='global.lbl.remark' />", width:300
                ,attributes:{"class":"tooltip-enabled"}
            }
        ]
    });

    //Issue 등록/수정 팝업
    $("#issueBoardMgmtPopup").kendoWindow({
        animation:false
        ,draggable:true
        ,pinned:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='cmm.title.changeRequestBoardMng' />"
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");

    // 파일 그리드 시작 //
    $("#fileGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if(operation === "read") {
                        var params = {};

                        params["sFileDocNo"] = $("#fileDocNo").val();
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        fileDocNo:{type:"string"}
                        ,fileNo:{type:"number"}
                        ,fileNm:{type:"string"}
                        ,fileSize:{type:"number"}
                    }
                }
            }
        }
        ,autoBind:false
        ,editable:false
        ,height:87
        ,navigatable:false
        ,filterable:false
        ,pageable:false
        ,resizable:false
        ,sortable:false
        ,columns:[
            {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"}                   // 파일명
            ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:100    // 파일크기
                ,attributes:{"class":"ar"}
                ,template:"#=dms.string.formatFileSize(fileSize)#"}
            ,{_field:"fileDownload", title:"", width:100                                            // 다운로드
                ,attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_yellow' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")'><spring:message code='global.btn.download' /></span>"
            }
        ]
    });
    // 파일 그리드 종료 //

    //================================ 파일 업무로 관련 스크립트
    var r = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:4
        ,testChunks:true
        ,throttleProgressCallbacks:1
        ,method:"octet"
    });
    r.assignBrowse($('#fileSelect')[0]);

    //파일추가 이벤트
    r.on('fileAdded', function(file) {
        $("#progressWindow").kendoWindow({
            width:"600px"
            ,height:"300px"
            ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
            ,animation:false
            ,draggable:false
            ,visible:false
            ,resizable:false
            ,modal:true
        }).data("kendoWindow").center().open();

        $('.resumable-progress, .resumable-list').show();
        $('.resumable-progress .progress-resume-link').hide();
        $('.resumable-progress .progress-pause-link').show();

        //파일목록 출력
        $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

        //업로드 시작
        r.upload();
    });
    r.on('pause', function() {
        $('.resumable-progress .progress-resume-link').show();
        $('.resumable-progress .progress-pause-link').hide();
    });
    r.on('uploadStart', function() {
        var _that = this;

        if (_that.opt["query"] == null) {
             _that.opt["query"] = {};
        }

        if (dms.string.isEmpty($("#fileDocNo").val())) {
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                dataType:"json",
                type:"get",
                async:false,
                cache:false,
                success:function(id) {
                    _that.opt["query"]["resumableSessionId"] = id;
                    $("#fileDocNo").val(id);
                }
            });
        } else {
            _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();
        }

        $('.resumable-progress .progress-resume-link').hide();
        $('.resumable-progress .progress-pause-link').show();
    });
    r.on('complete', function() {
        var _that = this;

        $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

        $("#progressWindow").data("kendoWindow").close();
        r.files = [];
        $(".resumable-list").html("");
    });
    r.on('fileSuccess', function(file, message) {
        var result = JSON.parse(message);
        if(result.status === "finished") {
            $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                fileDocNo:result.fileDocNo
                ,fileNo:result.fileNo
                ,fileNm:result.fileNm
                ,fileSize:dms.string.formatFileSize(result.fileSize)
            });
            //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
        }
    });
    r.on('fileError', function(file, message) {
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
    });
    r.on('fileProgress', function(file) {
        var fileProgress = 0;

        if (file instanceof ResumableChunk) {
            fileProgress = file.fileObj.progress();
        } else {
            fileProgress = file.progress();
        }

        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
        $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
    });
});

</script>








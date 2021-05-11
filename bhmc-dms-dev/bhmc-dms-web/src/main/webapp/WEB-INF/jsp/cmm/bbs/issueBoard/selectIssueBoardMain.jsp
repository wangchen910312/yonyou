<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- Issue관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.issueBoardMng" /><!-- Issue관리 --></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-12581" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-12580" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_modify" id="btnEdit"><spring:message code="global.btn.update" /></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-12579" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_delete" id="btnDel"><spring:message code="global.btn.del" /></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-12578" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
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
                    <th scope="row"><spring:message code="global.lbl.wrtrNm" /></th>
                    <td>
                        <input id="sIssueReqUsrNm" type="text" class="form_input" >
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
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.title" /></th>
                    <td>
                        <input id="sIssueTitle" type="text" class="form_input">
                    </td>
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
    <section id="issueBoardMgmtPopup" class="pop_wrap">
        <div id="issueBoardForm" >
        <input type="hidden" id="issueBoardTp" name="issueBoardTp" value="${issueBoardTp}" data-json-obj="true"/>
        <input type="hidden" id="issueNo" name="issueNo" data-json-obj="true"/>
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="cmm.title.issueInfo" /><!-- Issue 정보 --></h2>
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.wrtrNm" /><!-- 작성자 --></span></th>
                            <td class="required_area">
                                <input type="text" id="issueReqUsrNm" name="issueReqUsrNm" class="form_input" required data-name="<spring:message code="global.lbl.wrtrNm" />" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueDt" /><!-- Issue 발생일자 --></span></th>
                            <td class="required_area">
                                <input type="date" id="issueDt" name="issueDt" class="form_datepicker" required data-name="<spring:message code="global.lbl.issueDt" />">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.issueCloseDt" /><!-- Issue 종료일자 --></th>
                            <td>
                                <input type="date" id="issueCloseDt" name="issueCloseDt" class="form_datepicker" data-name="<spring:message code="global.lbl.issueCloseDt" />">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.issueStatCd" /><!-- Issue 처리상태 --></span></th>
                            <td class="required_area">
                                <input type="text" id="issueStatCd" name="issueStatCd" class="form_comboBox" required data-name="<spring:message code="global.lbl.issueStatCd" />" data-json-obj="true">
                            </td>
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
                                <textarea id="issueCont" name="issueCont" rows="8" cols="" class="form_textarea" style="height:130px;" required data-name="<spring:message code="global.lbl.cont" />" data-json-obj="true"></textarea>
                            </td>
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
                            <th scope="row"><spring:message code="global.lbl.remark" /><!-- Issue 비고 --></th>
                            <td colspan="4">
                                <textarea id="notes" name="notes" rows="3" cols="" class="form_textarea" style="height:55px;" data-name="<spring:message code="global.lbl.remark" />" data-json-obj="true"></textarea>
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

//Issue 정보 입력값을 설정한다.
function initForm(obj) {
    var data = obj;

    //신규 화면인 경우
    if(!data){
        $("#btnDelOnPopup").hide();
        $("#issueCloseDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#issueStatCd").data("kendoExtDropDownList").enable(false);

        //초기값을 설정한다.
        data = {
            "issueNo":""
            ,"issueTp":""
            ,"issueArea":""
            ,"issueTitle":""
            ,"issueCont":""
            ,"issueReqUsrNm":""
            ,"issueDt":"${issueDt}"
            ,"issueStatCd":"01"
            ,"issueCloseDt":""
            ,"issueReview":""
            ,"notes":""
        }

    //수정 화면인 경우
    }else{
        $("#btnDelOnPopup").show();
        $("#issueCloseDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#issueStatCd").data("kendoExtDropDownList").enable(true);
    }

    $("#issueNo").val(data.issueNo);
    $("#issueTp").data("kendoExtDropDownList").value(data.issueTp);
    $("#issueArea").data("kendoExtDropDownList").value(data.issueArea);
    $("#issueTitle").val(data.issueTitle);
    $("#issueCont").val(data.issueCont);
    $("#issueReqUsrNm").val(data.issueReqUsrNm);
    $("#issueDt").data("kendoExtMaskedDatePicker").value(data.issueDt);
    $("#issueStatCd").data("kendoExtDropDownList").value(data.issueStatCd);
    $("#issueCloseDt").data("kendoExtMaskedDatePicker").value(data.issueCloseDt);
    $("#notes").val(data.notes);
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

    //조회조건 - 발생일자 조회시작일
    $("#sStartIssueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 발생일자 조회종료일
    $("#sEndIssueDt").kendoExtMaskedDatePicker({
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
    });

    //상세정보 - Issue 발생일시
    $("#issueDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:"${issueDt}"
    });

    //상세정보 - Issue 처리일자
    $("#issueCloseDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
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

    //버튼 - 삭제
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
                saveData["issueCloseDt"] = $("#issueCloseDt").data("kendoExtMaskedDatePicker").value();

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

                        params["sIssueBoardTp"] = "${issueBoardTp}";
                        params["sIssueTp"] = $("#sIssueTp").data("kendoExtDropDownList").value();
                        params["sIssueArea"] = $("#sIssueArea").data("kendoExtDropDownList").value();
                        params["sIssueStatCd"] = $("#sIssueStatCd").data("kendoExtDropDownList").value();
                        params["sIssueReqUsrNm"] = $("#sIssueReqUsrNm").val();
                        params["sStartIssueDt"] = $("#sStartIssueDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueDt"] = $("#sEndIssueDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartIssueCloseDt"] = $("#sStartIssueCloseDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndIssueCloseDt"] = $("#sEndIssueCloseDt").data("kendoExtMaskedDatePicker").value();
                        params["sIssueTitle"] = $("#sIssueTitle").val();

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
                        ,issueDt:{type:"date"}
                        ,issueStatCd:{type:"string"}
                        ,issueCloseDt:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, obj) {
                            obj.rnum = d.total - obj.rnum + 1;
                            obj.issueTpNm = obj.issueTp? issueTpMap[obj.issueTp].cmmCdNm:"";
                            obj.issueAreaNm = obj.issueArea? issueAreaMap[obj.issueArea].cmmCdNm:"";
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
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"issueTpNm", title:"<spring:message code='global.lbl.issueTp' />", width:150}
            ,{field:"issueAreaNm", title:"<spring:message code='global.lbl.issueArea' />", width:80}
            ,{field:"issueTitle", title:"<spring:message code='global.lbl.title' />"
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"issueCont", title:"<spring:message code='global.lbl.cont' />"
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"issueReqUsrNm", title:"<spring:message code='global.lbl.wrtrNm' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"issueDt", title:"<spring:message code='global.lbl.issueDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"issueStatCd", title:"<spring:message code='global.lbl.issueStatCd' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#if(issueStatCdMap[issueStatCd] != null) {# #=issueStatCdMap[issueStatCd].cmmCdNm# #}#"
            }
            ,{field:"issueCloseDt", title:"<spring:message code='global.lbl.issueCloseDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
        ]
    });

    //Issue 등록/수정 팝업
    $("#issueBoardMgmtPopup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,pinned:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='cmm.title.issueBoardMng' />"
        ,width:"950px"
        ,height:"360px"
    }).data("kendoWindow");
});

</script>








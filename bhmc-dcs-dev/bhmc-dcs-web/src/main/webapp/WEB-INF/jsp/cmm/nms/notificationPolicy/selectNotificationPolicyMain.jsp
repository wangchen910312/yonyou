<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 알림정책 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 알림정책그룹 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.notificationPolicyMng" /></h1>
        <div class="btn_right">
          	<dms:access viewId="VIEW-I-12201" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_search" id="btnGroupSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
          	</dms:access>
        </div>
    </div>
    <!-- //알림정책그룹 조회 조건 타이틀 종료 -->

    <!-- 알림정책그룹 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnGroupSearch">
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
                    <th scope="row"><spring:message code="global.lbl.alrtPolicyGrpId" /></th>
                    <td>
                        <input id="sAlrtPolicyGrpId" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.alrtPolicyGrpNm" /></th>
                    <td>
                        <input id="sAlrtPolicyGrpNm" type="text" class="form_input" >
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //알림정책그룹 조회 조건 종료 -->

    <!-- 알림정책그룹 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.alrtPolicyGroup" /></h2>
        <div class="btn_right">
        	<dms:access viewId="VIEW-I-12200" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnGroupSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-I-12198" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnGroupAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-I-12197" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnGroupDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-I-12199" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnGroupCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
          	</dms:access>
        </div>
    </div>
    <!-- //알림정책그룹 그리드 기능 버튼 종료 -->

    <!-- 알림정책그룹 그리드 시작 -->
    <div class="table_grid">
        <div id="policyGroupGrid" class="resizable_grid"></div>
    </div>
    <!-- //알림정책그룹 그리드 종료 -->

     <!-- 알림정책 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <h3 class="title_basic"><spring:message code="cmm.title.alrtPolicy" /></h3>
        <div class="btn_right">
          	<dms:access viewId="VIEW-I-12196" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_xs" id="btnPolicySave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-I-12195" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_xs" id="btnPolicyAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-I-12194" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_xs" id="btnPolicyDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-I-12193" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_xs" id="btnPolicyCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
          	</dms:access>
        </div>
    </div>
    <!-- //알림정책 그리드 기능 버튼 종료 -->

    <!-- 알림정책 그리드 시작 -->
    <div class="table_grid">
        <div id="policyGrid"></div>
    </div>
    <!-- //알림정책 그리드 종료 -->

    <!-- 알림정책 탭 시작 -->
    <div id="tabstrip" class="tab_area">
        <ul>
            <li id="templateTab" class="k-state-active"><spring:message code="global.lbl.mesgTmpl" /><!-- 메세지템플릿 탭 --></li>
            <li id="targetDeptTab"><spring:message code="global.lbl.targetDept" /><!-- 수신대상[부서] 탭 --></li>
            <li id="targetUserTab"><spring:message code="global.lbl.targetUser" /><!-- 수신대상[사용자] 탭 --></li>
            <li id="excludeTargetUserTab"><spring:message code="global.lbl.excludeTarget" /><!-- 수신제외대상 탭 --></li>
        </ul>

        <!-- 메세지템플릿 탭 영역 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                  	<dms:access viewId="VIEW-I-12190" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTemplateSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12192" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTemplateAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12191" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTemplateDel"><spring:message code="global.btn.del" /><!-- 삭제--></button>
                  	</dms:access>
                </div>
            </div>
            <div class="table_grid">
                <!-- 메세지템플릿 그리드 -->
                <div id="templateGrid" ></div>
                <!-- //메세지템플릿 그리드 -->
            </div>
        </div>
        <!-- //메세지템플릿 탭 영역 종료 -->

        <!-- 수신대상[부서] 탭 영역 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                  	<dms:access viewId="VIEW-I-12187" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetDeptSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12189" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetDeptAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12188" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetDeptDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                  	</dms:access>
                </div>
            </div>
            <div class="table_grid">
                <!-- 수신대상[부서] 그리드 -->
                <div id="targetDeptGrid" ></div>
                <!-- //수신대상[부서] 그리드 -->
            </div>
        </div>
        <!-- //수신대상[부서] 탭 영역 -->

        <!-- 수신대상[사용자] 탭 영역 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                  	<dms:access viewId="VIEW-I-12184" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetUserSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12186" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetUserAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12185" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetUserDel"><spring:message code="global.btn.del" /><!-- 삭제--></button>
                  	</dms:access>
                </div>
            </div>
            <div class="table_grid">
                <!-- 수신대상[사용자] 그리드 -->
                <div id="targetUserGrid" ></div>
                <!-- //수신대상[사용자] 그리드 -->
            </div>
        </div>
        <!-- //수신대상[사용자] 탭 영역 종료 -->

        <!-- 수신제외대상 탭 영역 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                  	<dms:access viewId="VIEW-I-12181" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnExcludeTargetUserSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12183" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnExcludeTargetUserAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-I-12182" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnExcludeTargetUserDel"><spring:message code="global.btn.del" /><!-- 삭제--></button>
                  	</dms:access>
                </div>
            </div>
            <div class="table_grid">
                <!-- 수신제외대상 사용자 그리드 -->
                <div id="excludeTargetUserGrid" ></div>
                <!-- //수신제외대상 사용자 그리드 -->
            </div>
        </div>
        <!-- //수신제외대상 탭 영역 -->
    </div>
    <!-- //알림정책 탭 시작 -->
</section>
</div>

<script type="text/javascript">
//선택된 알림정책그룹ID
var selectedAlrtPolicyGrpId = "";

//선택된 알림정책 ID
var selectedAlrtPolicyId = "";

//메세지템플릿 유형 Array
var mesgTmplTpList = [];
<c:forEach var="obj" items="${mesgTmplTpList}">
mesgTmplTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//메세지템플릿 유형 Map
var mesgTmplTpMap = dms.data.arrayToMap(mesgTmplTpList, function(obj){ return obj.cmmCd; });

//사용자 조회 팝업
function userSearchPopup(callback) {
    dms.window.popup({
        windowId:"userSearchPopupWin"
        ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
        ,content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"selectable":"multiple"
                ,"closeAfterSelect":true
                ,"callbackFunc":callback
            }
        }
    });
}

//수신대상[부서]/수신대상[사용자] 메세지템플릿 체크박스 이벤트 처리
$(document).on("click", "div.mesgTmplTpListTemplate .k-input", function(e){
    var parentElement = $(e.target.parentElement);
    var uid = parentElement.data("uid");
    var grid = $("#" + parentElement.data("grid")).data("kendoExtGrid");

    var mesgTmplTpListStr = $.map($(".k-input:checked", e.target.parentElement), function( obj, idx ) {
        return obj.value;
    }).join(",");

    var dataItem = grid.dataSource.getByUid(uid);
    dataItem.mesgTmplTpList = mesgTmplTpListStr;
    dataItem.dirty = true;
});

$(document).ready(function() {
    //버튼 - 알림정책그룹 조회
    $("#btnGroupSearch").kendoButton({
        click:function(e) {
            $('#policyGroupGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 알림정책그룹 저장
    $("#btnGroupSave").kendoButton({
        click:function(e) {
            var policyGroupGrid = $("#policyGroupGrid").data("kendoExtGrid");

            var saveData = policyGroupGrid.getCUDData("insertList", "updateList", "deleteList");
            if (policyGroupGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (policyGroupGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/notificationPolicy/multiNotificationPolicyGroups.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        policyGroupGrid.dataSource._destroyed = [];
                        policyGroupGrid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 알림정책그룹 행추가
    $("#btnGroupAdd").kendoButton({
        click:function(e) {
            $('#policyGroupGrid').data('kendoExtGrid').dataSource.insert(0, {
                "alrtPolicyGrpId":""
                ,"alrtPolicyGrpNm":""
             });
        }
    });

    //버튼 - 알림정책그룹 행삭제
    $("#btnGroupDel").kendoButton({
        click:function(e) {
            var policyGroupGrid = $("#policyGroupGrid").data("kendoExtGrid");
            var rows = policyGroupGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                policyGroupGrid.removeRow(row);
            });
        }
    });

    //버튼 - 알림정책그룹 취소
    $("#btnGroupCancel").kendoButton({
        click:function(e) {
            $('#policyGroupGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 알림정책 저장
    $("#btnPolicySave").kendoButton({
        click:function(e) {
            var policyGrid = $("#policyGrid").data("kendoExtGrid");

            var saveData = policyGrid.getCUDData("insertList", "updateList", "deleteList", ["validStartDtFormat","validEndDtFormat"]);
            if (policyGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (policyGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/notificationPolicy/multiNotificationPolicies.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        policyGrid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 알림정책 행추가
    $("#btnPolicyAdd").kendoButton({
        click:function(e) {
            var policyGroupGrid = $("#policyGroupGrid").data("kendoExtGrid");

            if (policyGroupGrid.select().length == 0) {
                //알림정책그룹을 먼저 선택하여 주십시오.
                dms.notification.warning("<spring:message code='cmm.title.alrtPolicyGroup' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
                return;
            }

            var dataItem = policyGroupGrid.dataItem(policyGroupGrid.select());

            $('#policyGrid').data('kendoExtGrid').dataSource.insert(0, {
                "alrtPolicyGrpId":dataItem.alrtPolicyGrpId
                ,"alrtPolicyGrpNm":dataItem.alrtPolicyGrpNm
                ,"alrtPolicyId":""
                ,"alrtPolicyNm":""
                ,"validStartDt":kendo.parseDate("${validStartDt}", "<dms:configValue code='dateFormat' />")
                ,"validEndDt":kendo.parseDate("${validEndDt}", "<dms:configValue code='dateFormat' />")
             });
        }
    });

    //버튼 - 알림정책 행삭제
    $("#btnPolicyDel").kendoButton({
        click:function(e) {
            var policyGrid = $("#policyGrid").data("kendoExtGrid");
            var rows = policyGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                policyGrid.removeRow(row);
            });
        }
    });

    //버튼 - 알림정책 취소
    $("#btnPolicyCancel").kendoButton({
        click:function(e) {
            $('#policyGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 메세지템플릿 저장
    $("#btnTemplateSave").kendoButton({
        click:function(e) {
            var grid = $("#templateGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList","updateList","deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/notificationPolicy/multiNotificationTemplates.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource.read();

                        //메세지템플릿 변경에따라 수신대상[부서]/수신대상[사용자] 데이터소스를 갱신한다.
                        $("#targetDeptGrid").data("kendoExtGrid").dataSource.read();
                        $("#targetUserGrid").data("kendoExtGrid").dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 메세지템플릿 추가
    $("#btnTemplateAdd").kendoButton({
        click:function(e) {
            var grid = $('#policyGrid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //알림정책을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='cmm.title.alrtPolicy' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
                return;
            }

            var dataItem = grid.select(rows);

            dms.window.popup({
                windowId:"messageTemplateSearchPopupWin"
                ,title:"<spring:message code='cmm.title.messageTemplate.search'/>"   // 메세지 템플릿 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectMessageTemplatePopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"closeAfterSelect":true
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(data){
                            var grid = $('#policyGrid').data('kendoExtGrid');
                            var dataItem = grid.dataItem(grid.select());
                            var templateGrid = $('#templateGrid').data('kendoExtGrid');

                            for(var i=0; i<data.length; i++) {
                                //알림정책 메세지템플릿에 이미 등록된 목록은 제외 한다.
                                if(selectedAlrtPolicyId != "" && !templateGrid.exists(function(obj){
                                    if(obj.mesgTmplGrpId == data[i].mesgTmplGrpId && obj.mesgTmplTp == data[i].mesgTmplTp) return true;
                                    return false;
                                })) {
                                    $('#templateGrid').data('kendoExtGrid').dataSource.insert(0, {
                                        "alrtPolicyGrpId":dataItem.alrtPolicyGrpId
                                        ,"alrtPolicyGrpNm":dataItem.alrtPolicyGrpNm
                                        ,"alrtPolicyId":dataItem.alrtPolicyId
                                        ,"alrtPolicyNm":dataItem.alrtPolicyNm
                                        ,"mesgTmplGrpId":data[i].mesgTmplGrpId
                                        ,"mesgTmplGrpNm":data[i].mesgTmplGrpNm
                                        ,"mesgTmplTp":data[i].mesgTmplTp
                                        ,"mesgTmplNm":data[i].mesgTmplNm
                                    });
                                }
                            }
                        }
                    }
                }
            });
        }
    });

    //버튼 -  메세지템플릿 삭제
    $("#btnTemplateDel").kendoButton({
        click:function(e) {
            var grid = $("#templateGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 -  수신대상[부서] 저장
    $("#btnTargetDeptSave").kendoButton({
        click:function(e) {
            var isValid = true;
            var grid = $("#targetDeptGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            //메세지템플릿 선택 체크
            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dms.string.isEmpty(dataItem.mesgTmplTpList)){
                    isValid = false;
                    return false;
                }
            });

            if(!isValid){
                dms.notification.info("<spring:message code='global.lbl.mesgTmpl' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/notificationPolicy/multiNotificationTargets.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 수신대상[부서] 추가
    $("#btnTargetDeptAdd").kendoButton({
        click:function(e) {
            var grid = $('#policyGrid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //알림정책을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='cmm.title.alrtPolicy' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
                return;
            }

            if($("#templateGrid").data("kendoExtGrid").dataSource.data().length == 0){
                //메세지 템플릿을 먼저 진행하여 주십시오.
                dms.notification.info("<spring:message code='global.lbl.mesgTmpl' var='args' /><spring:message code='global.info.required.preprocess' arguments='${args}' />");
                return;
            }

            var dataItem = grid.select(rows);

            dms.window.popup({
                windowId:"departmentSearchPopupWin"
                ,title:"<spring:message code='cmm.title.dept.search'/>"   // 부서 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectDepartmentPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"cmpTp":"${cmpTp}"
                        ,"deptNm":""
                        ,"selectable":"multiple"
                        ,"closeAfterSelect":true
                        ,"callbackFunc":function(data){
                            var grid = $('#policyGrid').data('kendoExtGrid');
                            var dataItem = grid.dataItem(grid.select());
                            var targetDeptGrid = $('#targetDeptGrid').data('kendoExtGrid');

                            for(var i=0; i<data.length; i++) {
                                //알림정책 수신대상[부서]에 이미 등록된 목록은 제외 한다.
                                if(selectedAlrtPolicyId != "" && !targetDeptGrid.exists(function(obj){
                                    if(obj.refId == data[i].deptCd) return true;
                                    return false;
                                })) {
                                    $('#targetDeptGrid').data('kendoExtGrid').dataSource.insert(0, {
                                        "alrtPolicyGrpId":dataItem.alrtPolicyGrpId
                                        ,"alrtPolicyGrpNm":dataItem.alrtPolicyGrpNm
                                        ,"alrtPolicyId":dataItem.alrtPolicyId
                                        ,"alrtPolicyNm":dataItem.alrtPolicyNm
                                        ,"refTp":"D"
                                        ,"refId":data[i].deptCd
                                        ,"refNm":data[i].deptNm
                                        ,"mesgTmplTpList":""
                                    });
                                }
                            }

                            $("#departmentSearchPopupWin").data("kendoWindow").close();
                        }
                    }
                }
            });
        }
    });

    //버튼 - 수신대상[부서] 삭제
    $("#btnTargetDeptDel").kendoButton({
        click:function(e) {
            var grid = $("#targetDeptGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 수신대상[사용자] 저장
    $("#btnTargetUserSave").kendoButton({
        click:function(e) {
            var isValid = true;
            var grid = $("#targetUserGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList","updateList","deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            //메세지템플릿 선택 체크
            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dms.string.isEmpty(dataItem.mesgTmplTpList)){
                    isValid = false;
                    return false;
                }
            });

            if(!isValid){
                dms.notification.info("<spring:message code='global.lbl.mesgTmpl' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/notificationPolicy/multiNotificationTargets.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 수신대상[사용자 ]추가
    $("#btnTargetUserAdd").kendoButton({
        click:function(e) {
            var grid = $('#policyGrid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //알림정책을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='cmm.title.alrtPolicy' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
                return;
            }

            if($("#templateGrid").data("kendoExtGrid").dataSource.data().length == 0){
                //메세지 템플릿을 먼저 진행하여 주십시오.
                dms.notification.info("<spring:message code='global.lbl.mesgTmpl' var='args' /><spring:message code='global.info.required.preprocess' arguments='${args}' />");
                return;
            }

            var dataItem = grid.select(rows);

            userSearchPopup(function(data){
                var grid = $('#policyGrid').data('kendoExtGrid');
                var dataItem = grid.dataItem(grid.select());
                var targetUserGrid = $('#targetUserGrid').data('kendoExtGrid');

                for(var i=0; i<data.length; i++) {
                    //알림정책 수신대상[사용자]에 이미 등록된 목록은 제외 한다.
                    if(selectedAlrtPolicyId != "" && !targetUserGrid.exists(function(obj){
                        if(obj.refId == data[i].usrId) return true;
                        return false;
                    })) {
                        $('#targetUserGrid').data('kendoExtGrid').dataSource.insert(0, {
                            "alrtPolicyGrpId":dataItem.alrtPolicyGrpId
                            ,"alrtPolicyGrpNm":dataItem.alrtPolicyGrpNm
                            ,"alrtPolicyId":dataItem.alrtPolicyId
                            ,"alrtPolicyNm":dataItem.alrtPolicyNm
                            ,"refTp":"U"
                            ,"refId":data[i].usrId
                            ,"refNm":data[i].usrNm
                            ,"mesgTmplTpList":""
                        });
                    }
                }

            });
        }
    });

    //버튼 - 수신대상[사용자] 삭제
    $("#btnTargetUserDel").kendoButton({
        click:function(e) {
            var grid = $("#targetUserGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 수신제외대상 사용자 저장
    $("#btnExcludeTargetUserSave").kendoButton({
        click:function(e) {
            var grid = $("#excludeTargetUserGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList","updateList","deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/notificationPolicy/multiNotificationExcludeTargets.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 수신제외대상 사용자 추가
    $("#btnExcludeTargetUserAdd").kendoButton({
        click:function(e) {
            var grid = $('#policyGrid').data('kendoExtGrid');
            var dataItem = grid.dataItem(grid.select());

            if(dataItem!=null) {
                userSearchPopup(function(data){
                    var grid = $('#policyGrid').data('kendoExtGrid');
                    var dataItem = grid.dataItem(grid.select());
                    var excludeTargetUserGrid = $('#excludeTargetUserGrid').data('kendoExtGrid');

                    for(var i=0; i<data.length; i++) {
                        //알림정책 수신제외대상에 이미 등록된 목록은 제외 한다.
                        if(selectedAlrtPolicyId != "" && !excludeTargetUserGrid.exists(function(obj){
                            if(obj.refId == data[i].usrId) return true;
                            return false;
                        })) {
                            $('#excludeTargetUserGrid').data('kendoExtGrid').dataSource.insert(0, {
                                "alrtPolicyGrpId":dataItem.alrtPolicyGrpId
                                ,"alrtPolicyGrpNm":dataItem.alrtPolicyGrpNm
                                ,"alrtPolicyId":dataItem.alrtPolicyId
                                ,"alrtPolicyNm":dataItem.alrtPolicyNm
                                ,"usrId":data[i].usrId
                                ,"usrNm":data[i].usrNm
                            });
                        }
                    }

                });
            } else {
                //알림정책을 먼저 선택해 주십시오.
                dms.notification.success("<spring:message code='cmm.title.alrtPolicy' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
            }
        }
    });

    //버튼 - 수신제외대상 사용자 삭제
    $("#btnExcludeTargetUserDel").kendoButton({
        click:function(e) {
            var grid = $("#excludeTargetUserGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //수신대상 설정 탭
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    //알림정책그룹 그리드 설정
    $("#policyGroupGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationPolicy/selectNotificationPolicyGroups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sAlrtPolicyGrpId"] = $("#sAlrtPolicyGrpId").val();
                        params["sAlrtPolicyGrpNm"] = $("#sAlrtPolicyGrpNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"alrtPolicyGrpId"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,alrtPolicyGrpId:{type:"string", validation:{required:true}}
                        ,alrtPolicyGrpNm:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,height:250
        ,selectable:"row"
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["alrtPolicyGrpNm"]
        ,appendEmptyColumn:true
        ,dataBinding:function(e) {
            $("#policyGrid").data("kendoExtGrid").dataSource.data([]);
            selectedAlrtPolicyGrpId = "";
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.isNew()) {
                $("#policyGrid").data("kendoExtGrid").dataSource.data([]);
            } else if (selectedAlrtPolicyGrpId != dataItem.alrtPolicyGrpId) {
                selectedAlrtPolicyGrpId = dataItem.alrtPolicyGrpId;
                $("#policyGrid").data("kendoExtGrid").dataSource.read();
            }
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,filterable:false
            }
            ,{field:"alrtPolicyGrpId", title:"<spring:message code='global.lbl.alrtPolicyGrpId' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"alrtPolicyGrpNm", title:"<spring:message code='global.lbl.alrtPolicyGrpNm' />", width:300}
        ]
    });

    //알림정책 그리드 설정
    $("#policyGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationPolicy/selectNotificationPolicies.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sAlrtPolicyGrpId"] = selectedAlrtPolicyGrpId;

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
    		,change:function(e){
    			console.log("change : " + e.field);
    			if(e.action == "itemchange" && (e.field == "validStartDtFormat" || e.field == "validEndDtFormat")){
    				$.each(e.items, function(idx, dataItem){
    					dataItem.validStartDt = dataItem.validStartDtFormat;
						dataItem.validEndDt = dataItem.validEndDtFormat;
    				});
    			}
    		}
		    ,schema:{
		        model:{
		            id:"alrtPolicyId"
		            ,fields:{
		                rnum:{type:"number", editable:false}
		                ,alrtPolicyGrpId:{type:"string", editable:false}
		                ,alrtPolicyGrpNm:{type:"string", editable:false}
		                ,alrtPolicyId:{type:"string", validation:{required:true}}
		                ,alrtPolicyNm:{type:"string", validation:{required:true}}
		                ,validStartDt:{type:"date", validation:{required:true}}
		                ,validStartDtFormat:{type:"date", validation:{required:true}}
		                ,validEndDt:{type:"date", validation:{required:true}}
		                ,validEndDtFormat:{type:"date", validation:{required:true}}
		            }
		        }
		        ,parse:function(d) {
		            if(d.data){
		                $.each(d.data, function(idx, elem) {
		                    elem.validStartDtFormat = kendo.parseDate(elem.validStartDt, "<dms:configValue code='dateFormat' />");
		                    elem.validEndDtFormat = kendo.parseDate(elem.validEndDt, "<dms:configValue code='dateFormat' />");
		                });
		            }
		            return d;
		        }
		    }
        }
        ,height:150
        ,autoBind:false
        ,pageable:false
        ,selectable:"row"
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["alrtPolicyNm", "validStartDt", "validEndDt"]
        ,appendEmptyColumn:true
        ,dataBinding:function(e) {
            $("#templateGrid").data("kendoExtGrid").dataSource.data([]);
            $("#targetDeptGrid").data("kendoExtGrid").dataSource.data([]);
            $("#targetUserGrid").data("kendoExtGrid").dataSource.data([]);
            $("#excludeTargetUserGrid").data("kendoExtGrid").dataSource.data([]);
            selectedAlrtPolicyId = "";
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.isNew()) {
                $("#templateGrid").data("kendoExtGrid").dataSource.data([]);
                $("#targetDeptGrid").data("kendoExtGrid").dataSource.data([]);
                $("#targetUserGrid").data("kendoExtGrid").dataSource.data([]);
                $("#excludeTargetUserGrid").data("kendoExtGrid").dataSource.data([]);
            } else if (selectedAlrtPolicyId != dataItem.alrtPolicyId) {
                $("#templateGrid").data("kendoExtGrid").dataSource.read();      //템플릿그리드의 데이터소스의 transport.read.async:false 여야 한다.
                $("#targetDeptGrid").data("kendoExtGrid").dataSource.read();
                $("#targetUserGrid").data("kendoExtGrid").dataSource.read();
                $("#excludeTargetUserGrid").data("kendoExtGrid").dataSource.read();
            }

            selectedAlrtPolicyId = dataItem.alrtPolicyId;
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"alrtPolicyGrpId", title:"<spring:message code='global.lbl.alrtPolicyGrpId' />", width:150, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"alrtPolicyGrpNm", title:"<spring:message code='global.lbl.alrtPolicyGrpNm' />", width:400, sortable:false}
            ,{field:"alrtPolicyNm", title:"<spring:message code='global.lbl.alrtPolicyNm' />", width:200}
            ,{field:"validStartDtFormat", title:"<spring:message code='global.lbl.validStartDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function(container, options) {
                    $('<input required name="validStartDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,max:new Date(9999, 11, 31)
                    });
                    $('<span class="k-invalid-msg" data-for="validStartDt"></span>').appendTo(container);
                }
            }
            ,{field:"validEndDtFormat", title:"<spring:message code='global.lbl.validEndDt' />", width:120
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function(container, options) {
                    $('<input required name="validEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,max:new Date(9999, 11, 31)
                    });
                    $('<span class="k-invalid-msg" data-for="validEndDt"></span>').appendTo(container);
                }
            }
        ]
    });

    //알림정책 메세지템플릿 그리드 설정
    $("#templateGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    async:false
                    ,url:"<c:url value='/cmm/nms/notificationPolicy/selectNotificationTemplates.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $('#policyGrid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        params["sort"] = options.sort;
                        params["sAlrtPolicyGrpId"] = dataItem.alrtPolicyGrpId;
                        params["sAlrtPolicyId"] = dataItem.alrtPolicyId;

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
                        rnum:{type:"number"}
                        ,alrtPolicyGrpId:{type:"string"}
                        ,alrtPolicyGrpNm:{type:"string"}
                        ,alrtPolicyId:{type:"string"}
                        ,alrtPolicyNm:{type:"string"}
                        ,mesgTmplGrpId:{type:"string"}
                        ,mesgTmplGrpNm:{type:"string"}
                        ,mesgTmplTp:{type:"string"}
                        ,mesgTmplNm:{type:"string"}
                    }
                }
            }
        }
        ,height:150
        ,autoBind:false
        ,pageable:false
        ,editable:false
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"mesgTmplGrpId", title:"<spring:message code='global.lbl.mesgTmplGrpId' />", width:150}
            ,{field:"mesgTmplGrpNm", title:"<spring:message code='global.lbl.mesgTmplGrpNm' />", width:300}
            ,{field:"mesgTmplTp", title:"<spring:message code='global.lbl.mesgTmplTp' />", width:150, attributes:{"class":"ac"}
                ,template:"# if(mesgTmplTpMap[mesgTmplTp] != null) { # #= mesgTmplTpMap[mesgTmplTp].cmmCdNm# # }#"
               	,filterable:{
   	                cell:{
   	                    showOperators:false
   	                    ,template: function (e) {
   	                        e.element.kendoExtDropDownList({
   	                            dataSource:mesgTmplTpList
   	                            ,dataTextField:"cmmCdNm"
   	                            ,dataValueField:"cmmCd"
   	                            ,valuePrimitive:true
   	                         	,optionLabel:" "
   	                        });
   	                    }
   	                }
   	        	}
            }
            ,{field:"mesgTmplNm", title:"<spring:message code='global.lbl.mesgTmplNm' />", width:300}
        ]
    });

    //알림정책 수신대상[부서] 그리드 설정
    $("#targetDeptGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationPolicy/selectNotificationTargets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $('#policyGrid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        params["sort"] = options.sort;
                        params["sAlrtPolicyGrpId"] = dataItem.alrtPolicyGrpId;
                        params["sAlrtPolicyId"] = dataItem.alrtPolicyId;
                        params["sRefTp"] = "D";

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
                        rnum:{type:"string"}
                        ,alrtPolicyGrpId:{type:"string"}
                        ,alrtPolicyGrpNm:{type:"string"}
                        ,alrtPolicyId:{type:"string"}
                        ,alrtPolicyNm:{type:"string"}
                        ,refTp:{type:"string"}
                        ,refId:{type:"string"}
                        ,refNm:{type:"string"}

                    }
                }
            }
        }
        ,height:150
        ,autoBind:false
        ,pageable:false
        ,editable:false
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"refId", title:"<spring:message code='global.lbl.dept' />", width:150}
            ,{field:"refNm", title:"<spring:message code='global.lbl.deptNm' />", width:200}
            ,{field:"mesgTmplTpList", title:"<spring:message code='global.lbl.mesgTmpl' />", width:300, filterable:false
                ,template:function (dataItem){
                    var templateGrid = $("#templateGrid").data("kendoExtGrid");
                    var items = templateGrid.dataSource.data();

                    if(items.length == 0){
                        return "";
                    }

                    var html = "<div class='mesgTmplTpListTemplate' data-uid='" + dataItem.uid + "' data-grid='targetDeptGrid'>"
                               $.each(items, function(idx, obj){
                                   html = html + "<input type=\"checkbox\" value=\""+obj.mesgTmplTp+"\" class=\"k-input\" {"+obj.mesgTmplTp+"} />&nbsp;"+mesgTmplTpMap[obj.mesgTmplTp].cmmCdNm+"&nbsp;&nbsp;"
                               });
                               + "</div>";

                    if(dataItem.mesgTmplTpList){
                        $.each(dataItem.mesgTmplTpList.split(','), function(idx, val) {
                            html = html.replace("\{"+val+"\}", "checked");
                        });
                    }

                    $.each(items, function(idx, obj){
                       html = html.replace("{"+obj.mesgTmplTp+"}", "");
                    });

                    return html;
                }
            }
        ]
    });

    //알림정책 수신대상[사용자] 그리드 설정
    $("#targetUserGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationPolicy/selectNotificationTargets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $('#policyGrid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        params["sort"] = options.sort;
                        params["sAlrtPolicyGrpId"] = dataItem.alrtPolicyGrpId;
                        params["sAlrtPolicyId"] = dataItem.alrtPolicyId;
                        params["sRefTp"] = "U";

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
                        rnum:{type:"string", editable:false}
                        ,alrtPolicyGrpId:{type:"string", validation:{required:true}, editable:false}
                        ,alrtPolicyGrpNm:{type:"string", validation:{required:true}, editable:false}
                        ,alrtPolicyId:{type:"string", validation:{required:true}, editable:false}
                        ,alrtPolicyNm:{type:"string", validation:{required:true}, editable:false}
                        ,refTp:{type:"string", validation:{required:true}, editable:false}
                        ,refId:{type:"string", validation:{required:true}, editable:false}
                        ,refNm:{type:"string", validation:{required:true}, editable:false}
                    }
                }
            }
        }
        ,height:150
        ,autoBind:false
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"refId", title:"<spring:message code='global.lbl.usrId' />", width:150}
            ,{field:"refNm", title:"<spring:message code='global.lbl.usrNm' />", width:300}
            ,{field:"mesgTmplTpList", title:"<spring:message code='global.lbl.mesgTmpl' />", width:300, filterable:false
                ,template:function (dataItem){
                    var templateGrid = $("#templateGrid").data("kendoExtGrid");
                    var items = templateGrid.dataSource.data();

                    if(items.length == 0){
                        return "";
                    }

                    var html = "<div class='mesgTmplTpListTemplate' data-uid='" + dataItem.uid + "' data-grid='targetUserGrid'>"
                               $.each(items, function(idx, obj){
                                   html = html + "<input type=\"checkbox\" value=\""+obj.mesgTmplTp+"\" class=\"k-input\" {"+obj.mesgTmplTp+"} />&nbsp;"+mesgTmplTpMap[obj.mesgTmplTp].cmmCdNm+"&nbsp;&nbsp;"
                               });
                               + "</div>";

                    if(dataItem.mesgTmplTpList){
                        $.each(dataItem.mesgTmplTpList.split(','), function(idx, val) {
                            html = html.replace("\{"+val+"\}", "checked");
                        });
                    }

                    $.each(items, function(idx, obj){
                       html = html.replace("{"+obj.mesgTmplTp+"}", "");
                    });

                    return html;
                }
            }
        ]
    });

    //알림정책 수신제외대상 그리드 설정
    $("#excludeTargetUserGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationPolicy/selectNotificationExcludeTargets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $('#policyGrid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        params["sort"] = options.sort;
                        params["sAlrtPolicyGrpId"] = dataItem.alrtPolicyGrpId;
                        params["sAlrtPolicyId"] = dataItem.alrtPolicyId;

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
                        rnum:{type:"string"}
                        ,alrtPolicyGrpId:{type:"string"}
                        ,alrtPolicyGrpNm:{type:"string"}
                        ,alrtPolicyId:{type:"string"}
                        ,alrtPolicyNm:{type:"string"}
                        ,usrId:{type:"string"}
                        ,usrNm:{type:"string"}
                    }
                }
            }
        }
        ,height:150
        ,autoBind:false
        ,editable:false
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:150}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:300}
        ]
    });
});
</script>
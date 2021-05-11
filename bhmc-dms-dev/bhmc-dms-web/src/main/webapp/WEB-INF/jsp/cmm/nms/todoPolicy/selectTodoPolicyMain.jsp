<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- To-do 정책 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- To-do 정책 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.todoPolicyMng" /></h1>
        <div class="btn_right">
          	<dms:access viewId="VIEW-D-10893" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_search" id="btnPolicySearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
          	</dms:access>
        </div>
    </div>
    <!-- //To-do 정책 조회 조건 타이틀 종료 -->

    <!-- To-do 정책 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnPolicySearch">
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
                    <th scope="row"><spring:message code="global.lbl.todoPolicyId" /></th>
                    <td>
                        <input id="sTodoPolicyId" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.todoPolicyNm" /></th>
                    <td>
                        <input id="sTodoPolicyNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.actionTargetTp" /></th>
                    <td>
                        <input id="sActionTargetTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.useYn" /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //To-do 정책조회 조건 종료 -->

    <!-- To-do 정책그리드 기능 버튼 시작 -->
    <div class="header_area">
        <h2 class="title_basic"></h2>
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-10894" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnPolicySave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-D-10896" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnPolicyAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-D-10897" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnPolicyDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
          	</dms:access>
          	<dms:access viewId="VIEW-D-10895" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnPolicyCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
          	</dms:access>
        </div>
    </div>
    <!-- //To-do 정책그리드 기능 버튼 종료 -->

    <!-- To-do 정책그리드 시작 -->
    <div class="table_grid">
        <div id="policyGrid" class="resizable_grid"></div>
    </div>
    <!-- //To-do 정책그리드 종료 -->


    <!-- To-do 정책 탭 시작 -->
    <div id="tabstrip" class="tab_area">
        <ul>
            <li id="targetTaskTab" class="k-state-active"><spring:message code="global.lbl.targetTask" /><!-- 수신대상[직무] 탭 --></li>
            <li id="targetUserTab"><spring:message code="global.lbl.targetUser" /><!-- 수신대상[사용자] 탭 --></li>
        </ul>

        <!-- 수신대상[직무] 탭 영역 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                  	<dms:access viewId="VIEW-D-10900" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetTaskSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-D-10898" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetTaskAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                 	</dms:access>
                  	<dms:access viewId="VIEW-D-10899" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetTaskDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                  	</dms:access>
           	    </div>
            </div>
            <div class="table_grid">
                <!-- 수신대상[직무] 그리드 -->
                <div id="targetTaskGrid" ></div>
                <!-- //수신대상[직무] 그리드 -->
            </div>
        </div>
        <!-- //수신대상[직무] 탭 영역 -->

        <!-- 수신대상[사용자] 탭 영역 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                  	<dms:access viewId="VIEW-D-10903" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetUserSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-D-10901" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_xs" id="btnTargetUserAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                  	</dms:access>
                  	<dms:access viewId="VIEW-D-10902" hasPermission="${dms:getPermissionMask('READ')}">
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
    </div>
    <!-- //To-do 정책 탭 종료 -->
</section>
</div>

<script type="text/javascript">
//선택된 To-do 정책 ID
var selectedTodoPolicyId = "";

//메세지템플릿 유형 Array
var actionTargetTpList = [];
<c:forEach var="obj" items="${actionTargetTpList}">
actionTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//메세지템플릿 유형 Map
var actionTargetTpMap = dms.data.arrayToMap(actionTargetTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //버튼 - 정책 조회
    $("#btnPolicySearch").kendoButton({
        click:function(e) {
            $('#policyGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 정책 저장
    $("#btnPolicySave").kendoButton({
        click:function(e) {
            var policyGrid = $("#policyGrid").data("kendoExtGrid");

            var saveData = policyGrid.getCUDData("insertList", "updateList", "deleteList");
            if (policyGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (policyGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/todoPolicy/multiTodoPolicies.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        policyGrid.dataSource._destroyed = [];
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

    //버튼 - 정책 행추가
    $("#btnPolicyAdd").kendoButton({
        click:function(e) {
            $('#policyGrid').data('kendoExtGrid').dataSource.insert(0, {
                "todoPolicyId":""
                ,"todoPolicyNm":""
                ,"autoChkYn":"N"
                ,"actionTargetTp":"01"
                ,"actionUrlWeb":""
                ,"actionUrlMob":""
             });
        }
    });

    //버튼 - 정책 행삭제
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

    //버튼 - 정책 취소
    $("#btnPolicyCancel").kendoButton({
        click:function(e) {
            $('#policyGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 수신대상[직무] 저장
    $("#btnTargetTaskSave").kendoButton({
        click:function(e) {
            var grid = $("#targetTaskGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/todoPolicy/multiTodoTargets.do' />",
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

    //버튼 - 수신대상[직무] 추가
    $("#btnTargetTaskAdd").kendoButton({
        click:function(e) {
            var grid = $('#policyGrid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //To-do 정책을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.lbl.todoPolicy' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
                return;
            }

            var dataItem = grid.select(rows);

            dms.window.popup({
                windowId:"taskSearchPopupWin"
                ,title:"<spring:message code='cmm.title.task.search'/>"   // 직무 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectTaskPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"cmpTp":"${cmpTp}"
                        ,"tskNm":""
                        ,"selectable":"multiple"
                        ,"closeAfterSelect":true
                        ,"callbackFunc":function(data){
                            var grid = $('#policyGrid').data('kendoExtGrid');
                            var dataItem = grid.dataItem(grid.select());
                            var targetTaskGrid = $('#targetTaskGrid').data('kendoExtGrid');

                            for(var i=0; i<data.length; i++) {
                                //To-do 정책 수신대상[직무]에 이미 등록된 목록은 제외 한다.
                                if(selectedTodoPolicyId != "" && !targetTaskGrid.exists(function(obj){
                                    if(obj.refId == data[i].tskCd) return true;
                                    return false;
                                })) {
                                    $('#targetTaskGrid').data('kendoExtGrid').dataSource.insert(0, {
                                    	"todoPolicyId":dataItem.todoPolicyId
                                        ,"todoPolicyNm":dataItem.todoPolicyNm
                                        ,"refTp":"T"
                                        ,"refId":data[i].tskCd
                                        ,"refNm":data[i].tskNm
                                    });
                                }
                            }

                            $("#taskSearchPopupWin").data("kendoWindow").close();
                        }
                    }
                }
            });
        }
    });

    //버튼 - 수신대상[직무] 삭제
    $("#btnTargetTaskDel").kendoButton({
        click:function(e) {
            var grid = $("#targetTaskGrid").data("kendoExtGrid");
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
            var grid = $("#targetUserGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList","updateList","deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/nms/todoPolicy/multiTodoTargets.do' />",
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

    //버튼 - 수신대상[사용자 ]추가
    $("#btnTargetUserAdd").kendoButton({
        click:function(e) {
            var grid = $('#policyGrid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //To-do 정책을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.lbl.todoPolicy' var='args' /><spring:message code='global.info.chkSelectItemMsg' arguments='${args}' />");
                return;
            }

            var dataItem = grid.select(rows);

            dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"selectable":"multiple"
                        ,"closeAfterSelect":true
                        ,"callbackFunc":function(data){
                            var grid = $('#policyGrid').data('kendoExtGrid');
                            var dataItem = grid.dataItem(grid.select());
                            var targetUserGrid = $('#targetUserGrid').data('kendoExtGrid');

                            for(var i=0; i<data.length; i++) {
                                //To-do 정책 수신대상[사용자]에 이미 등록된 목록은 제외 한다.
                                if(selectedTodoPolicyId != "" && !targetUserGrid.exists(function(obj){
                                    if(obj.refId == data[i].usrId) return true;
                                    return false;
                                })) {
                                    $('#targetUserGrid').data('kendoExtGrid').dataSource.insert(0, {
                                        "todoPolicyId":dataItem.todoPolicyId
                                        ,"todoPolicyNm":dataItem.todoPolicyNm
                                        ,"refTp":"U"
                                        ,"refId":data[i].usrId
                                        ,"refNm":data[i].usrNm
                                    });
                                }
                            }
                        }
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

    //조회조건 - 액션대상구분
    $("#sActionTargetTp").kendoExtDropDownList({
        dataSource:actionTargetTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:" "
    });
    
  	//조회조건 - 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //수신대상 설정 탭
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    //정책 그리드 설정
    $("#policyGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/todoPolicy/selectTodoPolicies.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sTodoPolicyId"] = $("#sTodoPolicyId").val();
                        params["sTodoPolicyNm"] = $("#sTodoPolicyNm").val();
                        params["sActionTargetTp"] = $("#sActionTargetTp").data("kendoExtDropDownList").value();
                        params["sUseYn"] = $("#sUseYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"todoPolicyId"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,todoPolicyId:{type:"string", editable:false}
                        ,todoPolicyNm:{type:"string", validation:{required:true}}
                        ,autoChkTp:{type:"string", validation:{required:true}}
                        ,actionTargetTp:{type:"string", validation:{required:true}}
                        ,actionUrlWeb:{type:"string"}
                        ,actionUrlMob:{type:"string"}
                        ,todoPolicyDetl:{type:"string"}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,height:350
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,dataBinding:function(e) {
            $("#targetTaskGrid").data("kendoExtGrid").dataSource.data([]);
            $("#targetUserGrid").data("kendoExtGrid").dataSource.data([]);
            selectedTodoPolicyId = "";
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.isNew()) {
                $("#targetTaskGrid").data("kendoExtGrid").dataSource.data([]);
                $("#targetUserGrid").data("kendoExtGrid").dataSource.data([]);
            } else if (selectedTodoPolicyId != dataItem.todoPolicyId) {
                $("#targetTaskGrid").data("kendoExtGrid").dataSource.read();
                $("#targetUserGrid").data("kendoExtGrid").dataSource.read();
            }

            selectedTodoPolicyId = dataItem.todoPolicyId;
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"todoPolicyId", title:"<spring:message code='global.lbl.todoPolicyId' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"todoPolicyNm", title:"<spring:message code='global.lbl.todoPolicyNm' />", width:300}
            ,{field:"actionTargetTp", title:"<spring:message code='global.lbl.actionTargetTp' />", width:120
                ,attributes:{"class":"ac"}
                ,template:"# if(actionTargetTpMap[actionTargetTp] != null) { # #= actionTargetTpMap[actionTargetTp].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input name="actionTargetTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:actionTargetTpList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="actionTargetTp"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:actionTargetTpList
	                            ,dataTextField:"cmmCdNm"
	                            ,dataValueField:"cmmCd"
	                            ,valuePrimitive:true
	                            ,optionLabel:" "
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"actionUrlWeb", title:"<spring:message code='global.lbl.actionUrlWeb' />", width:120, attributes:{"class":"ac"}}
            ,{field:"actionUrlMob", title:"<spring:message code='global.lbl.actionUrlMob' />", width:120, attributes:{"class":"ac"}}
//             ,{field:"todoPolicyDetl", title:"<spring:message code='global.lbl.todoPolicyDetl' />"}
			,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:80
            	,attributes:{"class":"ac"} 
	            ,editor:function(container, options) {
	                $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
	                .appendTo(container)
	                .kendoExtDropDownList({
	                    autoBind:false
	                    ,dataSource:['Y','N']
	                });
	                $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
	            }
            }
        ]
    });

    //수신대상[직무] 그리드 설정
    $("#targetTaskGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/todoPolicy/selectTodoTargets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $('#policyGrid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        params["sort"] = options.sort;
                        params["sTodoPolicyId"] = dataItem.todoPolicyId;
                        params["sRefTp"] = "T";

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
                        ,todoPolicyId:{type:"string"}
                        ,todoPolicyNm:{type:"string"}
                        ,refTp:{type:"string"}
                        ,refId:{type:"string"}
                        ,refNm:{type:"string"}
                    }
                }
            }
        }
        ,height:250
        ,autoBind:false
        ,pageable:false
        ,editable:false
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"refId", title:"<spring:message code='global.lbl.task' />", width:150}
            ,{field:"refNm", title:"<spring:message code='global.lbl.tskNm' />", width:200}
        ]
    });

    //수신대상[사용자] 그리드 설정
    $("#targetUserGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/todoPolicy/selectTodoTargets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $('#policyGrid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        params["sort"] = options.sort;
                        params["sTodoPolicyId"] = dataItem.todoPolicyId;
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
                        ,todoPolicyId:{type:"string", validation:{required:true}, editable:false}
                        ,todoPolicyNm:{type:"string", validation:{required:true}, editable:false}
                        ,refTp:{type:"string", validation:{required:true}, editable:false}
                        ,refId:{type:"string", validation:{required:true}, editable:false}
                        ,refNm:{type:"string", validation:{required:true}, editable:false}
                    }
                }
            }
        }
        ,height:250
        ,autoBind:false
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"refId", title:"<spring:message code='global.lbl.usrId' />", width:150}
            ,{field:"refNm", title:"<spring:message code='global.lbl.usrNm' />", width:300}
        ]
    });
});
</script>
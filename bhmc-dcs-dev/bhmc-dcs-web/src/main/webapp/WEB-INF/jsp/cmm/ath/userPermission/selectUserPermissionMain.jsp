<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group">
    <div class="clfix">
        <section class="left_areaStyle" style="width:550px;">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code='cmm.title.userViewAuthorities' /></h1>
                <div class="btn_right">
                	<dms:access viewId="VIEW-I-12814" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_m btn_search" id="btnUserSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                </div>
            </div>

            <!-- 사용자계정 조회조건 -->
            <div class="table_form" role="search" data-btnid="btnUserSearch" style="height:47px;">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:32%;">
                        <col style="width:18%;">
                        <col style="width:32%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.dept' /><!-- 부서 --></th>
                            <td>
                                <input id="sDeptCd" type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.task' /><!-- 직무 --></th>
                            <td>
                                <input id="sTskCd" type="text" value="" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.usrId' /><!-- 아이디 --></th>
                            <td>
                                <input id="sUsrId" type="text" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.usrNm' /><!-- 이름 --></th>
                            <td>
                                <input id="sUsrNm" type="text" value="" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 사용자목록 그리드 -->
            <div class="table_grid mt10">
                <div id="userGrid"></div>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code='cmm.title.userRoleSetting' /><!-- 사용자역할설정 --></h2>
            </div>

            <!-- 사용자역할 그리드 -->
            <div class="table_grid">
                <div id="roleGrid" class="resizable-container-custom"></div>
            </div>
        </section>

        <section style="margin-left:560px;">
            <div class="header_area">
                <div class="btn_right">
                	<dms:access viewId="VIEW-I-12811" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_m btn_save" id="btnSave"><spring:message code='global.btn.save' /><!-- 저장 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12810" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_m btn_copy" id="btnCopyPerm"><spring:message code='global.btn.btnCopyPerm' /><!-- 권한복사 --></button>
                    </dms:access>
                </div>
            </div>

            <div class="table_form" role="search" data-btnid="btnSearch" style="height:47px;">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:20%;">
                        <col style="width:13%;">
                        <col style="width:21%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="cmm.lbl.webMobTp" /><!-- 웹/모바일구분 --></th>
                            <td>
                                <input id="sWebMobileDstinCd" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.copyPermission' /><!-- 권한복사 --></th>
                            <td>
                                <input id="sDestUsrId" type="text" value="" class="form_comboBox">
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="clfix mt10">
                <section id="userPermContainer" style="float:right;overflow:auto;width:350px;min-height:500px;">
                    <div class="header_area" style="margin-top:-17px;">
                        <h2 class="title_basic"><spring:message code="cmm.title.searchPerm" /><!-- 조회권한 --></h2>
                    </div>
                    <!-- 조회권한 그리드 -->
                    <div class="table_grid">
                        <div id="searchPermGrid"></div>
                    </div>

                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="cmm.title.buttonPerm" /><!-- 버튼권한 --></h2>
                    </div>
                    <!-- 버튼권한 그리드 -->
                    <div class="table_grid">
                        <div id="btnPermGrid" class="resizable-container-custom"></div>
                    </div>
                </section>

                <section id="viewHierarchyTreeContainer" class="resizable-container-custom" style="border:1px solid #bfcad6;overflow:auto;margin-right:360px;min-height:500px;">
                    <div id="viewHierarchyTree" class="treeview" style="margin:10px;"></div>
                </section>
            </div>
        </section>
    </div>
</section>

<script type="text/javascript">
//선택된 사용자 ID
var selectedUsrId = "";
//선택된 화면ID
var selectedViewId = "";
//버튼권한 변경캐시
var btnPermCache = {};

//부서목록
var deptCdList = [];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"deptCd":"${obj.deptCd}", "deptNm":"${obj.deptNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//부서 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.deptCd; });

//직무목록
var tskCdList = [];
<c:forEach var="obj" items="${taskList}">
tskCdList.push({"tskCd":"${obj.tskCd}", "tskNm":"${obj.tskNm}", "deptCd":"${obj.deptCd}"});
</c:forEach>
//직무 Map
var tskCdMap = dms.data.arrayToMap(tskCdList, function(obj){ return obj.tskCd; });

//웹/모바일구분  목록
var webMobileDstinCdList = [];
<c:forEach var="obj" items="${webMobileDstinCdList}">
webMobileDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

function applyViewTreeDirty(dataItem, searchPermissions){
	$("#V_"+dataItem.data.childViewId).data("permissions", searchPermissions);
	$("#V_"+dataItem.data.childViewId).data("dirty", true);

	if(dataItem.data.childViewId === selectedViewId){
		$('#searchPermGrid').data('kendoExtGrid').refresh();
		$('#btnPermGrid').data('kendoExtGrid').refresh();
	}

	if(dataItem.hasChildren){
		$.each(dataItem.children.data(), function(idx, obj){
			applyViewTreeDirty(obj, searchPermissions);
		});
	}
}

$(document).ready(function() {
    //버튼 - 조회(사용자조회)
    $("#btnUserSearch").kendoButton({
        click:function(e) {
            selectedUsrId = "";

            $('#userGrid').data('kendoExtGrid').dataSource.page(1);
            $('#roleGrid').data('kendoExtGrid').dataSource.read();

            //조회권한 초기화
            $('#searchPermGrid').data('kendoExtGrid').refresh();

            //버튼권한 초기화
            $('#btnPermGrid').data('kendoExtGrid').dataSource.read();

            //메뉴트리 체크박스 초기화
            var viewHierarchyTree = $("#viewHierarchyTree").data("kendoTreeView");
            viewHierarchyTree.element.find(".tree-checkbox").prop("checked", false);
            viewHierarchyTree.element.find(".tree-checkbox").data("dirty", false);
            viewHierarchyTree.updateIndeterminate();

            //버튼권한 변경캐시 초기화
            btnPermCache = {};
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            //사용자 선택 체크
            if(dms.string.isEmpty(selectedUsrId)){
                dms.notification.info("<spring:message code='global.lbl.user' var='userMsg' /><spring:message code='global.info.validation.select' arguments='${userMsg}' />");
                return;
            }

            //사용자역할저장
            var roleGrid = $("#roleGrid").data("kendoExtGrid");

            var roles = [];
            $.each($("input.grid-checkbox-item:checked", roleGrid.tbody), function(idx, obj){
                roles.push($(obj).data("roleId"));
            });

            $.ajax({
                url:"<c:url value='/cmm/ath/userPermission/deleteAndInsertRoleMapping.do' />"
                ,data:JSON.stringify({
                     "sysCd":"${sysCd}"
                    ,"refTp":"U"
                    ,"refId":selectedUsrId
                    ,"roles":roles
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,beforeSend:function(jqXHR, settings){
                    dms.loading.show($("#roleGrid"));
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide($("#roleGrid"));
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    roleGrid.dataSource.read();
                }
            });

          	//버튼 권한 변경 내역 체크
            viewMappings = {insertList:[], deleteList:[]};
            $.each(btnPermCache, function(viewId, property){
                if(property.permissions != property.newPermissions){
                    //삭제목록
                    if(dms.string.isEmpty(property.newPermissions)){
                        viewMappings.deleteList.push({
                            sysCd:"${sysCd}"
                            ,viewId:viewId
                            ,refTp:"U"
                            ,refId:selectedUsrId
                        });
                    //추가목록
                    }else{
                        viewMappings.insertList.push({
                            sysCd:"${sysCd}"
                            ,viewId:viewId
                            ,refTp:"U"
                            ,refId:selectedUsrId
                            ,permissions:property.newPermissions
                        });
                    }
                }
            });

            if(viewMappings.insertList.langth + viewMappings.deleteList.langth != 0){
                //버튼 권한을 저정한다.
                $.ajax({
                    url:"<c:url value='/cmm/ath/userPermission/multiViewMappings.do' />"
                    ,data:JSON.stringify(viewMappings)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data, textStatus, jqXHR) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }

            //버튼권한 변경캐시 초기화
            btnPermCache = {};

            //메뉴저장
            var viewMappings = [];
            var viewHierarchyTree = $("#viewHierarchyTree").data("kendoTreeView");
            var checkedViews = $("input.tree-checkbox:checked", viewHierarchyTree.element);

            $.each(checkedViews, function(idx, obj){
                if($(this).data("leaf")){
                    viewMappings.push({
                        "viewId":$(this).data("viewId")
                        ,"permissions":dms.string.defaultString($(this).data("permissions"), "SEARCHIND")
                        ,"dirty":$(this).data("dirty")
                    });
               }
            });

            $.ajax({
                url:"<c:url value='/cmm/ath/userPermission/deleteAndInsertViewMappings.do' />"
                ,data:JSON.stringify({
                    "sysCd":"${sysCd}"
                    ,"webMobileDstinCd":$("#sWebMobileDstinCd").data("kendoExtDropDownList").value()
                    ,"refTp":"U"
                    ,"refId":selectedUsrId
                    ,"viewTp":"01"
                    ,"viewMappings":viewMappings
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,beforeSend:function(jqXHR, settings){
                    dms.loading.show();
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide();
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //버튼 - 권한복사
    $("#btnCopyPerm").kendoButton({
        click:function(e) {
            if(selectedUsrId == ""){
                //사용자를 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.lbl.user' var='userMsg' /><spring:message code='global.info.validation.select' arguments='${userMsg}' />");
                return;
            }

            var destUsrId = $("#sDestUsrId").data("kendoAutoComplete").value();

            if(dms.string.isEmpty(destUsrId)){
                //권한복사 대상을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.lbl.copyAuthTarget' var='copyAuthTargetMsg' /><spring:message code='global.info.validation.select' arguments='${copyAuthTargetMsg}' />");
                return;
            }

            if(selectedUsrId == destUsrId){
                //권한복사 대상을 올바르게 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.lbl.copyAuthTarget' var='copyAuthTargetMsg2' /><spring:message code='global.info.invalid.select' arguments='${copyAuthTargetMsg2}' />");
                return;
            }

            $.ajax({
                url:"<c:url value='/cmm/ath/userPermission/selectAndInsertViewMapping.do' />"
                ,data:JSON.stringify({
                    "sysCd":"${sysCd}"
                    ,"refTp":"U"
                    ,"srcRefId":selectedUsrId
                    ,"destRefId":destUsrId
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,beforeSend:function(jqXHR, settings){
                    dms.loading.show();
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide();
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    $("#sDestUsrId").data("kendoAutoComplete").value("");

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });

    //조회조건 - 부서
    $("#sDeptCd").kendoExtDropDownList({
        dataSource:deptCdList
        ,dataValueField:"deptCd"
        ,dataTextField:"deptNm"
        ,optionLabel:" "
        ,change:function(e){
            var deptCd = this.value();
            var tskCdListDatasource = [];

            if(dms.string.isNotEmpty(deptCd)){
                $.each(tskCdList, function(idx, obj){

                    //회사구분이 법인인 경우 부서별 직무 매핑정보가 없고 모든 직무 목록을 출력한다.
                    if("${cmpTp}" == "${cmpTpCorp}"){
                        tskCdListDatasource.push(obj);
                    }else{
                        if(deptCd == obj.deptCd){
                            tskCdListDatasource.push(obj);
                        }
                    }
                });
            }

            $("#sTskCd").data("kendoExtDropDownList").setDataSource(tskCdListDatasource);
        }
    });

    //조회조건 - 직무
    $("#sTskCd").kendoExtDropDownList({
        dataSource:[]
        ,dataValueField:"tskCd"
        ,dataTextField:"tskNm"
        ,optionLabel:" "
    });

    //조회조건 - 웹/모바일구분
    $("#sWebMobileDstinCd").kendoExtDropDownList({
        dataSource:webMobileDstinCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,value:"${webMobileDstinCd}"
        ,change:function(e){
            selectedUsrId = "";

            $('#userGrid').data('kendoExtGrid').dataSource.data([]);
            $('#roleGrid').data('kendoExtGrid').dataSource.read();

            //조회권한 초기화
            $('#searchPermGrid').data('kendoExtGrid').refresh();

            //버튼권한 초기화
            $('#btnPermGrid').data('kendoExtGrid').dataSource.read();

            //메뉴트리 초기화
            $("#viewHierarchyTree").data("kendoTreeView").dataSource.read();

            //버튼권한 변경캐시 초기화
            btnPermCache = {};

        }
    });

    //조회조건 - 권한복사
    $("#sDestUsrId").kendoAutoComplete({
        minLength:2
        ,template:"[#:usrId#]#:usrNm#"
        ,dataTextField:"usrId"
        ,dataSource:{
            serverFiltering:true
            ,transport:{
                read:{
                     url:"<c:url value='/cmm/ath/userPermission/selectUsersForSuggest.do' />"
                     ,dataType:"json"
                     ,type:"POST"
                     ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation)
                {
                    if (operation === "read") {
                        return kendo.stringify({
                            "sText":$("#sDestUsrId").data("kendoAutoComplete").value()
                            ,"recordCountPerPage":10
                        });
                    }
                }
            }
        }
    });

    //사용자역할, 버튼권한 전체선택 체크박스 클릭 이벤트
    $(document).on("click", "input.checkAll", function(e){
    	var that = this;
        var grid = $(that).data("gridId");
        var checked = $(that).prop("checked");

        //사용자를 선택하지 않은 경우
        if(dms.string.isEmpty(selectedUsrId)){
        	$(that).prop("checked", false);
        	return;

       	//버튼권한 전체선택 클릭이고 화면ID를 선택하지 않은 경우
        }else if(grid == "btnPermGrid" && $("#V_"+selectedViewId).prop("checked") !== true){
        	$(that).prop("checked", false);
        	return;
        }

        if(grid == "btnPermGrid"){
        	var newPermissions = checked? "READ":"";
        	$("#V_"+selectedViewId).data("dirty", false);

        	$("input.grid-checkbox-item", $("#"+grid)).each(function(idx, obj){
        		var data = $(this).data();

        		btnPermCache[data.viewId] = {
                	"permissions":data.permissions
                    ,"newPermissions":newPermissions
            	}

        		$(this).prop("checked", checked);
        	});

        }else if(grid == "roleGrid"){
	        $("input.grid-checkbox-item", $("#"+grid)).prop("checked", checked);
        }

    });

    //메뉴트리 체크 박스 클릭 이벤트
    $(document).on("click", "input.tree-checkbox", function(e){
    	var data = $(this).data();
    	var searchPermissions = "";

    	//메뉴트리 체크박스가 체크 상태 인 경우 조회권한[개인]을 체크한다.
    	if($(this).prop("checked") === true){
    		searchPermissions = "SEARCHIND";
    	}

		applyViewTreeDirty($("#viewHierarchyTree").data("kendoTreeView").dataSource.getByUid(data.uid), searchPermissions);
    });

    //사용자 목록 그리드
    $("#userGrid").kendoExtGrid({
        gridId:"G-CMM-0214-154601"
        ,dataSource:{
            requestStart:function(e){
                dms.loading.show($("#viewHierarchyTreeContainer"));
            }
            ,requestEnd:function(e){
                dms.loading.hide($("#viewHierarchyTreeContainer"));
            }
            ,transport:{
                read:{
                    url:"<c:url value='/cmm/ath/userPermission/selectUsers.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDeptCd"] = $("#sDeptCd").data("kendoExtDropDownList").value();
                        params["sTskCd"] = $("#sTskCd").data("kendoExtDropDownList").value();
                        params["sUsrId"] = $("#sUsrId").val();
                        params["sUsrNm"] = $("#sUsrNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"usrId"
                    ,fields:{
                        deptCd:{type:"string"}
                        ,tskCd:{type:"string"}
                        ,usrId:{type:"string"}
                        ,usrNm:{type:"string"}
                        ,empNo:{type:"string"}
                    }
                }
            }
        }
        ,autoBind:false
        ,editable:false
        ,selectable:"row"
        ,height:300
        ,pageable:{
            buttonCount:3
        }
        ,dataBinding:function(e){
            selectedUsrId = "";
        }
        ,change:function(e){
            selectedUsrId = this.dataItem(this.select()).usrId;

            //사용자 역할설정 그리드를 재적용한다.
            $("#roleGrid").data("kendoExtGrid").dataSource.read();

            //메뉴트리 사용자 메뉴 적용
            //1.메뉴트리 기존선택 목록 취소
            //2.사용자메뉴를 메뉴트리에 체크한다.
            //3.버튼권한 변경캐시 초기화
            //4.조회권한 그리드를 갱신 한다.
            //5.버튼권한 그리드를 갱신 한다.

            var viewHierarchyTree = $("#viewHierarchyTree").data("kendoTreeView");

            //1.메뉴트리 기존선택 목록 취소
            viewHierarchyTree.element.find(".tree-checkbox").prop("checked", false);
            viewHierarchyTree.updateIndeterminate();

            //2.사용자메뉴를 메뉴트리에 체크한다.
            $.ajax({
                url:"<c:url value='/cmm/ath/userPermission/selectUserViewMappings.do' />"
                ,data:JSON.stringify({
                    "sSysCd":"${sysCd}"
                    ,"sWebMobileDstinCd":$("#sWebMobileDstinCd").data("kendoExtDropDownList").value()
                    ,"sRefTp":"U"
                    ,"sRefId":selectedUsrId
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,beforeSend:function(){
                    //메뉴트리 로더 Show
                    dms.loading.show($("#viewHierarchyTreeContainer"));
                }
                ,complete:function(jqXHR, textStatus){
                    //메뉴트리 로더 Hide
                    dms.loading.hide($("#viewHierarchyTreeContainer"));
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    //체크박스 체크
                    for(i=0; i<data.length; i++){
                        var checkbox = viewHierarchyTree.element.find("input[id='V_"+data[i].viewId+"']");
                        if(checkbox && checkbox.length == 1){
                            checkbox.prop("checked", true);
                            checkbox.data("permissions", data[i].permissions);
                        }
                    }
                    viewHierarchyTree.updateIndeterminate();

                  	//3.버튼권한 변경캐시 초기화
                    btnPermCache = {};

                    //4.조회권한 그리드를 갱신 한다.
                    $('#searchPermGrid').data('kendoExtGrid').refresh();

                    //5.버튼권한 그리드를 갱신 한다.
                    $('#btnPermGrid').data('kendoExtGrid').dataSource.read();
                }
            });
        }
        ,columns:[
            {field:"deptCd", title:"<spring:message code='global.lbl.dept' />", width:100
                ,template:"# if(deptCdMap[deptCd] != null) { # #= deptCdMap[deptCd].deptNm# # }#"
            }
            ,{field:"tskCd", title:"<spring:message code='global.lbl.task' />", width:100
                ,template:"# if(tskCdMap[tskCd] != null) { # #= tskCdMap[tskCd].tskNm# # }#"
            }
            ,{field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:120}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />"}
        ]
    }).data("kendoExtGrid").dataSource.data([]);

    //사용자역할 그리드
    $("#roleGrid").kendoExtGrid({
        gridId:"G-CMM-0214-104801"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ath/userPermission/selectUserRoleMappings.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sSysCd"] = "${sysCd}";

                        if(dms.string.isEmpty(selectedUsrId)){
                            params["sRefId"] = "dummy-user";
                        }else{
                            params["sRefId"] = selectedUsrId;
                        }

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"roleId"
                    ,fields:{
                         roleId:{type:"string"}         //역할ID
                        ,roleNm:{type:"string"}         //역할명
                        ,roleDetlCont:{type:"string"}   //역할상세정보
                        ,refId:{type:"string"}          //참조ID
                    }
                }
            }
        }
        ,editable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,pageable:false
        ,reorderable:false
        ,selectable:false
        ,sortable:false
        ,dataBound:function(e){
            var roleGrid = this;

            $("input.grid-checkbox-item", roleGrid.tbody).on("click", function(){
  				//사용자를 선택하지 않은 경우
            	if(dms.string.isEmpty(selectedUsrId)){
  					$(this).prop("checked", false);
  					return;
  				}
            });
        }
        ,columns:[
             {field:"refId", title:"", width:30, attributes:{"class":"ac"}, filterable:false, _hidden:true
                 ,template:function(dataItem){
                     var checked = "";

                     //참조ID가 null이 아니라면 역할이 부여된 것임.
                     if(!dms.string.isEmpty(dataItem.refId)){
                         checked = "checked";
                     }

                     return "<input type='checkbox' data-uid='"+dataItem.uid+"' data-role-id='"+dataItem.roleId+"' "+checked+" class='grid-checkbox-item' />";
                 }
                 ,headerTemplate:"<input type='checkbox' class='checkAll' data-grid-id='roleGrid' />"
             }
            ,{field:"roleNm", title:"<spring:message code='global.lbl.roleNm' />", width:150}
            ,{field:"roleDetlCont", title:"<spring:message code='global.lbl.roleDetlCont' />"}
        ]
    });

    //조회권한 그리드
    $("#searchPermGrid").kendoExtGrid({
        dataSource:{
            transport:null
            ,data:{
                total:2
                ,data:[
                	{permissionName:"SEARCHIND", permissionDisplayName:"<spring:message code='global.lbl.permissionSearchIndivisual' />"}
                    ,{permissionName:"SEARCHALL", permissionDisplayName:"<spring:message code='global.lbl.permissionSearchAll' />"}
                ]
            }
            ,schema:{
                model:{
                    id:"permissionName"
                    ,fields:{
                        permissionName:{type:"string"}          //퍼미션명
                        ,permissionDisplayName:{type:"string"}  //퍼미션 출력명
                        ,permYn:{type:"string"}                 //권한부여여부
                    }
                }
            }
        }
        ,editable:false
        ,filterable:false
        ,height:200
        ,pageable:false
        ,selectable:false
        ,sortable:false
        ,dataBinding:function(e){
            var permissions = "";

            //메뉴트리의 체크박스의 퍼미션 데이터를 반영한다.
            if(dms.string.isNotEmpty(selectedUsrId) && dms.string.isNotEmpty(selectedViewId) && $("#V_"+selectedViewId).prop("checked") == true){
                permissions = $("#V_"+selectedViewId).data("permissions");
            }

            $.each(e.sender.dataSource.data(), function(idx, obj){
                if(permissions == obj.permissionName){
                    obj.permYn = "Y";
                }else{
                    obj.permYn = "N";
                }
            });
        }
        ,dataBound:function(e){
            var searchPermGrid = this;

            //조회권한 체크박스 클릭시 선택한 권한을 메뉴 트리의 체크박스 데이터에 반영한다.
            $("input.grid-checkbox-item", searchPermGrid.tbody).on("click", function(){

            	//메뉴트리의 체크박스가 체크상태가 아닌 경우 버튼 권한을 체크 할 수 없다.
            	if(dms.string.isEmpty(selectedViewId) || $("#V_"+selectedViewId).prop("checked") !== true){
  					$(this).prop("checked", false);
  					return;
  				}

                var that = $(this);
                var permissionName = that.data("permissionName");

                if(dms.string.isEmpty(selectedUsrId)){
                    //사용자를 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.user' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                    that.prop("checked", false);
                    return;
                }

                if(dms.string.isEmpty(selectedViewId)){
                    //화면을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.view' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                    that.prop("checked", false);
                    return;
                }

                var searchPermissions = [];
                $.each($("input.grid-checkbox-item:checked", searchPermGrid.tbody), function(idx, element){
                    if(permissionName == $(this).data("permissionName")){
                        searchPermissions.push($(this).data("permissionName"));
                    }else{
                        $(this).prop("checked", false);
                    }
                });

                //메뉴트리의 체크박스 데이터에 퍼미션을 반영한다.
                $("#V_"+selectedViewId).data("permissions", searchPermissions.join(","));
            });
        }
        ,columns:[
            {field:"permYn", title:"", width:30
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var checked = "";

                    //권한부여 인 경우
                    if(dataItem.permYn == "Y"){
                        checked = "checked";
                    }

                    return "<input type='checkbox' "+checked+" data-uid='"+dataItem.uid+"' data-ref-id='"+dataItem.refId+"' data-view-id='"+dataItem.viewId+"' data-permission-name='"+dataItem.permissionName+"' class='grid-checkbox-item' />";
                }
                ,headerTemplate:"&nbsp;"
            }
            ,{field:"permissionDisplayName", title:"<spring:message code='global.lbl.permissionDisplayName' />"}   //조회권한
        ]
    });

    //버튼권한 그리드
    $("#btnPermGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ath/userPermission/selectButtonPermissions.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sSysCd"] = "${sysCd}";              //시스템구분
                        params["sParentViewId"] = selectedViewId;   //상위화면ID
                        params["sViewTp"] = "02";                   //화면유형(버튼)
                        params["sRefTp"] = "U";                     //참조유형(사용자)
                        params["sDisplayYn"] = "Y";                 //출력여부
                        params["sWebMobileDstinCd"] = $("#sWebMobileDstinCd").data("kendoExtDropDownList").value();   //웹/모바일구분

                        if(dms.string.isEmpty(selectedUsrId)){
                            params["sRefId"] = "dummy-ref-id";
                        }else{
                            params["sRefId"] = selectedUsrId;
                        }

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"viewId"
                    ,fields:{
                         viewId:{type:"string"}         //화면(버튼)ID
                        ,viewNm:{type:"string"}         //화면(버튼)명
                        ,permissions:{type:"string"}    //퍼미션
                    }
                }
            }
        }
        ,autoBind:false
        ,editable:false
        ,filterable:false
        ,height:300
        ,pageable:false
        ,selectable:"multiple, row"
        ,sortable:false
        ,dataBinding:function(e){
            if(selectedViewId != "" || selectedUsrId != ""){
                var selectedView = $("#V_"+selectedViewId);
                var newPermissions = null;

                if(selectedView.prop("checked")){
                    if(selectedView.data("dirty")){
                        newPermissions = "READ";
                    }
                }else{
                    newPermissions = "";
                }

                //버튼권한 변경캐시 데이터 정보가 있다면 변경캐시 데이터 정보로 권한을 설정한다.
                $.each(e.sender.dataSource.data(), function(idx, data){
                    var btnPermCacheData = btnPermCache[data.viewId];
                    if(!btnPermCacheData){
                        btnPermCacheData = {
                            permissions:data.permissions
                            ,newPermissions:data.permissions
                        }
                    }

                    btnPermCacheData.newPermissions = newPermissions == null? btnPermCacheData.newPermissions:newPermissions;
                    btnPermCache[data.viewId] = btnPermCacheData;
                    data.permissions = btnPermCacheData.newPermissions;
                });
            }
        }
        ,dataBound:function(e){
            var btnPermGrid = this;

            //버튼권한 전체선택 체크 박스 설정
            if(e.sender.dataSource.data().length == $("input.grid-checkbox-item:checked", btnPermGrid.tbody).length){
                $("#btnPermGridCheckBox").prop("checked", true);
            }else{
                $("#btnPermGridCheckBox").prop("checked", false);
            }

            //버튼권한 변경캐시 데이터에 반영한다.
            $("input.grid-checkbox-item", btnPermGrid.tbody).on("click", function(){
                //메뉴트리의 체크박스가 체크상태가 아닌 경우 버튼 권한을 체크 할 수 없다.
                if(dms.string.isEmpty(selectedViewId) || $("#V_"+selectedViewId).prop("checked") !== true){
                    $(this).prop("checked", false);
                    return;
                }

                var data = $(this).data();

                if(selectedUsrId != ""){
                    btnPermCache[data.viewId] = {
                        permissions:data.permissions
                        ,newPermissions:$(this).prop("checked")? "READ":""
                    }
                }

                //버튼권한 전체선택 체크 박스 설정
                if(e.sender.dataSource.data().length == $("input.grid-checkbox-item:checked", btnPermGrid.tbody).length){
                    $("#btnPermGridCheckBox").prop("checked", true);
                }else{
                    $("#btnPermGridCheckBox").prop("checked", false);
                }

                //메뉴트리 체크박스 변경을 취소한다.
                $("#V_"+selectedViewId).data("dirty", false);
            });


        }
        ,columns:[
            {field:"permissions", title:"", width:30
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var checked = "";
                    if(dms.string.isNotEmpty(dataItem.permissions)){
                        checked = "checked";
                    }

                    return "<input type='checkbox' "+checked+" data-uid='"+dataItem.uid+"' data-view-id='"+dataItem.viewId+"' data-permissions='"+dataItem.permissions+"' class='grid-checkbox-item' />";
                }
              	,headerTemplate:"<input type='checkbox' class='checkAll' data-grid-id='btnPermGrid' />"
       		}
            ,{field:"viewNm", title:"<spring:message code='global.lbl.buttonDesc' />"}       //버튼설명
        ]
    });

    //메뉴트리
    $("#viewHierarchyTree").kendoTreeView({
        dataSource:{
            requestStart:function(e){
                dms.loading.show($("#viewHierarchyTreeContainer"));
            }
            ,requestEnd:function(e){
                dms.loading.hide($("#viewHierarchyTreeContainer"));
            }
            ,transport:{
                 read:{
                    url:"<c:url value='/cmm/ath/userPermission/selectViewInfoTree.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                 }
                ,parameterMap:function(options, operation) {
                    var params = {};
                    params["sSysCd"] = "${sysCd}";
                    params["sWebMobileDstinCd"] = $("#sWebMobileDstinCd").data("kendoExtDropDownList").value();
                    params["sDisplayYn"] = "Y";
                    params["sViewTp"] = "01";

                    if(dms.string.isEmpty(selectedUsrId)){
                        params["sRefId"] = "dummy-user";
                    }else{
                        params["sRefId"] = selectedUsrId;
                    }

                    return kendo.stringify(params);
                }
             }
             ,schema:{
                 model:{
                     id:"id"
                     ,children:"subNodes"
                     ,data:"data"
                 }
             }
        }
        ,checkboxes: {
            checkChildren:true
            ,template: "<input type='checkbox' class='tree-checkbox' #if(item.data.userMenuYn == 'Y'){# checked #}# id='V_#=item.data.childViewId#' data-uid='#=item.uid#' data-view-id='#=item.data.childViewId#' data-permissions='#=dms.string.defaultString(item.data.childViewPermissions, '')#' data-path='#=item.path#' data-leaf='#=item.leaf#' data-dirty='false' />"
        }
        ,dataTextField:"data.childViewNm"
        ,dataValueField:"data.childViewId"
        ,loadOnDemand:false
        ,dataBound:function(e){
            $("#viewHierarchyTree").data("kendoTreeView").updateIndeterminate();
            selectedViewId = "";
        }
        ,select: function(e){
            var dataItem = e.sender.dataItem(e.node);

            selectedViewId = dataItem.id;

            if(dataItem.leaf){
                $('#searchPermGrid').data('kendoExtGrid').refresh();
                $("#btnPermGrid").data("kendoExtGrid").dataSource.read();
            }else{
                $('#searchPermGrid').data('kendoExtGrid').refresh();
                $("#btnPermGrid").data("kendoExtGrid").dataSource.data([]);
            }
        }
    });

    //높이 자동맞춤 적용
    var resizableElements = $(".resizable-container-custom");
    var windowHeight = $(window).innerHeight();

    $.each(resizableElements, function(idx, element){
        var resizableElement = $(element);
        var resizableElementOffset = resizableElement.offset();
        var offsetHeight = (resizableElement.data("offsetheight")||0) - 12;

        //그리드인 경우
        if($("div.k-grid-header", element).length != 0){
            var gridOffsetHeight = 0;
            gridOffsetHeight = gridOffsetHeight + $("div.k-grid-header", element).height();
            gridOffsetHeight = gridOffsetHeight + ($("div.k-grid-pager", element).length == 0? 0:$("div.k-grid-pager", element).height());

            resizableElement.height(windowHeight - resizableElementOffset.top + offsetHeight);
            $("div.k-grid-content", resizableElement).height(windowHeight - resizableElementOffset.top - gridOffsetHeight - 12 + offsetHeight);
        }else{
            resizableElement.height(windowHeight - resizableElementOffset.top + offsetHeight);
        }
    });
});
</script>
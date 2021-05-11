<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.taskViewMapping" /></h1>
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-13036" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13037" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
        </div>
    </div>

    <div style="position:relative;float:left;width:550px;">
        <!-- 직무 조회조건 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:16%;">
                    <col style="width:16%;">
                    <col style="width:26%;">
                    <col style="width:16%;">
                    <col style="width:26%;">
                </colgroup>
                <tbody>
                    <tr>
                        <td><input id="sWebMobileDstinCd" type="text" class="form_comboBox" style="width:80px;"></td>
                        <th scope="row"><spring:message code='global.lbl.tskCd' /><!-- 직무코드 --></th>
                        <td>
                            <input type="text" id="sTskCd" name="sTskCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.tskNm' /><!-- 직무명 --></th>
                        <td>
                            <input type="text" id="sTskNm" name="sTskNm" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 직무 그리드 -->
        <div class="table_grid mt10">
            <div id="taskGrid" class="resizable-container-custom"></div>
        </div>
    </div>

    <div id="userPermContainer" style="float:right;overflow:auto;width:350px;min-height:500px;">
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
    </div>

    <!-- 트리영역 -->
    <div id="viewHierarchyTreeContainer" class="resizable-container-custom" style="border:1px solid #bfcad6;overflow:auto;min-height:500px;margin-left:560px;margin-right:360px;">
        <div id="viewHierarchyTree" class="treeview" style="margin-top:10px;margin-left:10px;"></div>
    </div>

</section>

<script type="text/javascript">
//시스템코드-DCS(I), DMS(D)
var sysCd = "D";
//웹-모바일 구분-웹(W), 모바일(M)
var webMobileDstinCd = "${webMobileDstinCd}"
//선택된 화면ID
var selectedViewId = "";
//참조유형-부서(D), 직무(T)
var refTp = "T";
//참조ID-부서코드, 직무코드
var refId = "";
//버튼권한 변경캐시
var btnPermCache = {};

//웹-모바일구분
var webMobileDstinCdList = [];
<c:forEach var="obj" items="${webMobileDstinCdList}">
webMobileDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

function applyViewTreeDirty(dataItem, searchPermissions){
	$("#"+dataItem.data.childViewId).data("permissions", searchPermissions);
	$("#"+dataItem.data.childViewId).data("dirty", true);

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
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            refId = "";

            //직무그리드 초기화
            $('#taskGrid').data('kendoExtGrid').dataSource.read();

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
            //직무/부서 선택여부를 체크한다.
            if(dms.string.isEmpty(refId)){
                dms.notification.info("<spring:message code='global.lbl.task' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                return;
            }

          	//버튼 권한 변경 내역 체크
            viewMappings = {insertList:[], deleteList:[]};
            $.each(btnPermCache, function(viewId, property){
                if(property.permissions != property.newPermissions){
                    //삭제목록
                    if(dms.string.isEmpty(property.newPermissions)){
                        viewMappings.deleteList.push({
                            sysCd:sysCd
                            ,viewId:viewId
                            ,refTp:refTp
                            ,refId:refId
                        });
                    //추가목록
                    }else{
                        viewMappings.insertList.push({
                            sysCd:sysCd
                            ,viewId:viewId
                            ,refTp:refTp
                            ,refId:refId
                            ,permissions:property.newPermissions
                        });
                    }
                }
            });

            if(viewMappings.insertList.length + viewMappings.deleteList.length != 0){
                //버튼 권한을 저장한다.
                $.ajax({
                    url:"<c:url value='/cmm/ath/viewMapping/multiViewMappings.do' />"
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

            //화면-직무/부서 매핑 정보를 저장한다.
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
                url:"<c:url value='/cmm/ath/viewMapping/deleteAndInsertViewMappings.do' />"
                ,data:JSON.stringify({
                    "sysCd":sysCd
                    ,"webMobileDstinCd":webMobileDstinCd
                    ,"refTp":refTp
                    ,"refId":refId
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

    //조회조건 - 웹/모바일구분
    $("#sWebMobileDstinCd").kendoExtDropDownList({
        dataSource:webMobileDstinCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,value:webMobileDstinCd
        ,change:function(e){
        	refId = "";

        	webMobileDstinCd = this.value();

        	//직무그리드 선택 초기화
            $("#taskGrid").data('kendoExtGrid').clearSelection();

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

  	//버튼권한 전체선택 체크박스 클릭 이벤트
    $(document).on("click", "input.checkAll", function(e){
    	var that = this;
        var checked = $(that).prop("checked");

        //직무/부서를 선택하지 않은 경우
        if(dms.string.isEmpty(refId)){
        	$(that).prop("checked", false);
        	return;

       	//화면ID를 선택하지 않은 경우
        }else if($("#"+selectedViewId).prop("checked") !== true){
        	$(that).prop("checked", false);
        	return;
        }

       	var newPermissions = checked? "READ":"";
       	$("#"+selectedViewId).data("dirty", false);

       	$("input.grid-checkbox-item", $("#btnPermGrid")).each(function(idx, obj){
       		var data = $(this).data();

       		btnPermCache[data.viewId] = {
               	"permissions":data.permissions
            	,"newPermissions":newPermissions
           	}

       		$(this).prop("checked", checked);
       	});

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

    //직무그리드
    $("#taskGrid").kendoExtGrid({
        gridId:"G-CMM-0303-115202"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ath/viewMapping/selectTaskList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sCmpTp"] = "${cmpTpDlr}";
                        params["sTskCd"] = $("#sTskCd").val();
                        params["sTskNm"] = $("#sTskNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"tskCd"
                    ,fields:{
                         tskCd:{type:"string"}         //직무코드
                        ,tskNm:{type:"string"}         //직무명
                    }
                }
            }
        }
        ,editable:false
        ,pageable:false
        ,selectable:"row"
        //,sortable:false
        ,change:function(e){
            //직무 선택 체크
            if(this.select().length == 0){
                refId = "";
                return;
            }

            //참조ID-직무코드
            refId = this.dataItem(this.select()).tskCd ;

            //화면-부서/직무 매핑 적용
            //1.메뉴트리 기존선택 목록 취소
            //2.화면-부서/직무 매핑을 메뉴트리에 적용한다.
            //3.버튼권한 변경캐시 초기화
            //4.조회권한 그리드를 갱신 한다.
            //5.버튼권한 그리드를 갱신 한다.

            var viewHierarchyTree = $("#viewHierarchyTree").data("kendoTreeView");

            //1.메뉴트리 기존선택 목록 취소
            viewHierarchyTree.element.find(".tree-checkbox").prop("checked", false);
            viewHierarchyTree.updateIndeterminate();

            //2.직무-화면 매핑을 메뉴트리에 적용한다.
            $.ajax({
                url:"<c:url value='/cmm/ath/viewMapping/selectViewMappingsByCondition.do' />"
                ,data:JSON.stringify({
                    "sSysCd":sysCd                          //시스템구분
                    ,"sWebMobileDstinCd":webMobileDstinCd   //웹-모바일구분
                    ,"sRefTp":refTp                         //참조유형
                    ,"sRefId":refId                         //참조ID
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,beforeSend:function(){
                    dms.loading.show();
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide();
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    //체크박스 체크
                    for(i=0; i<data.length; i++){
                        var checkbox = viewHierarchyTree.element.find("input[id='"+data[i].viewId+"']");
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
             {field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:100}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />"}
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
            if(dms.string.isNotEmpty(refId) && dms.string.isNotEmpty(selectedViewId) && $("#"+selectedViewId).prop("checked") == true){
                permissions = $("#"+selectedViewId).data("permissions");
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
            	if(dms.string.isEmpty(selectedViewId) || $("#"+selectedViewId).prop("checked") !== true){
  					$(this).prop("checked", false);
  					return;
  				}

                var that = $(this);
                var permissionName = that.data("permissionName");

                if(dms.string.isEmpty(refId)){
                    //직무를 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.task' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
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
                $("#"+selectedViewId).data("permissions", searchPermissions.join(","));
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
                    url:"<c:url value='/cmm/ath/viewMapping/selectButtonPermissions.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sSysCd"] = sysCd;                           //시스템구분
                        params["sParentViewId"] = selectedViewId;           //상위화면ID
                        params["sViewTp"] = "02";                           //화면유형(버튼)
                        params["sRefTp"] = refTp;                           //참조유형(직무)
                        params["sDisplayYn"] = "Y";                         //출력여부
                        params["sWebMobileDstinCd"] = webMobileDstinCd;     //웹/모바일구분

                        if(dms.string.isEmpty(refId)){
                            params["sRefId"] = "dummy-ref-id";
                        }else{
                            params["sRefId"] = refId;
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
                        ,permissions:{type:"string"}     //퍼미션
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
            if(selectedViewId != "" || refId != ""){
                var selectedView = $("#"+selectedViewId);
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
            	if(dms.string.isEmpty(selectedViewId) || $("#"+selectedViewId).prop("checked") !== true){
  					$(this).prop("checked", false);
  					return;
  				}

                var data = $(this).data();

                if(refId != ""){
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
                $("#"+selectedViewId).data("dirty", false);
            });
        }
        ,columns:[
            {field:"permissions", title:"", width:30
            	,attributes:{"class":"ac"}
              	,template:function(dataItem){
                	var checked = "";

                	//메뉴트리 체크박스가 변경이 발생 한 경우
                	if($("#"+selectedViewId).data("dirty") == true){
                		checked = $("#"+selectedViewId).prop("checked")? "checked":"";
                	}else{
                		//버튼권한 변경캐시에 데이터가 있다면 변경캐시 데이터로 체크한다.
                        if(btnPermCache[dataItem.viewId]){
                            checked = dms.string.isEmpty(btnPermCache[dataItem.viewId].newPermissions)? "":"checked";
                        }else{
                     		//권한부여 인 경우
                            if(dms.string.isNotEmpty(dataItem.permissions)){
                                checked = "checked";
                            }
                        }
                	}

                   return "<input type='checkbox' "+checked+" data-uid='"+dataItem.uid+"' data-view-id='"+dataItem.viewId+"' data-permissions='"+dms.string.defaultString(dataItem.permissions, "")+"' class='grid-checkbox-item' />";
            	}
             	,headerTemplate:"<input type='checkbox' class='checkAll' data-grid-id='btnPermGrid' id='btnPermGridCheckBox' />"
      		}
           ,{field:"viewNm", title:"<spring:message code='global.lbl.buttonDesc' />"}       //버튼설명
    	]
    });

    //메뉴트리
    $("#viewHierarchyTree").kendoTreeView({
        dataSource:{
            requestStart:function(e){
                dms.loading.show();
            }
            ,requestEnd:function(e){
                dms.loading.hide();
            }
            ,transport:{
                 read:{
                    url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoTree.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                 }
                ,parameterMap:function(options, operation) {
                    var params = {};
                    params["sSysCd"] = sysCd;                           //시스템구분
                    params["sWebMobileDstinCd"] = webMobileDstinCd;     //웹-모바일구분
                    params["sDisplayYn"] = "Y";                         //출력여부
                    params["sViewTp"] = "01";                           //화면구분-화면(01)

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
            ,template: "<input type='checkbox' class='tree-checkbox' id='#=item.data.childViewId#' data-uid='#=item.uid#' data-view-id='#=item.data.childViewId#' data-sprite-css-class='#=item.spriteCssClass#' data-leaf='#=item.leaf#' data-dirty='false' />"
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
        var offsetHeight = (resizableElement.data("offsetHeight")||0) - 12;

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

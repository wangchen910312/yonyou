<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 포틀릿-직무/사용자 매핑 -->
<section class="group">
	<section style="float: left; width: 550px;">
		<!-- 직무 조회 조건 타이틀 시작 -->
		<div class="header_area">
			<h1 class="title_basic">
				<spring:message code="cmm.title.portletMapping" />
			</h1>
		</div>
		<!-- 직무 조회 조건 타이틀 종료 -->

		<!-- 직무 조회 조건 시작 -->
		<div class="table_form mt10" role="search" data-btnid="btnTaskSearch">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width: 18%;">
					<col style="width: 32%;">
					<col style="width: 18%;">
					<col style="width: 32%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><spring:message code="global.lbl.tskCd" /></th>
						<td>
							<input id="sTskCd" type="text" class="form_input">
						</td>
						<th scope="row"><spring:message code="global.lbl.tskNm" /></th>
						<td>
							<input id="sTskNm" type="text" class="form_input">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 직무 조회 조건 종료 -->

		<!-- 직무 조회 버튼 시작 -->
		<div class="header_area">
        	<h2 class="title_basic"><spring:message code="global.lbl.task" /></h2>
        	<div class="btn_right">
                <dms:access viewId="VIEW-D-12912" hasPermission="${dms:getPermissionMask('READ')}">
					<button class="btn_s" id="btnTaskSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
				</dms:access>
            </div>
        </div>
        <!-- 직무 조회 버튼 종료 -->

		<!-- 직무 그리드 시작 -->
		<div class="table_grid">
			<div id="taskGrid"></div>
		</div>
		<!-- 직무 그리드 종료 -->

        <!-- 사용자 조회 조건 시작 -->
        <div class="table_form mt10" role="search" data-btnid="btnUserSearch" style="height:47px;">
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
                            <input id="sUsrTskCd" type="text" value="" class="form_comboBox">
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
        <!-- 사용자 조회 조건 종료 -->

        <!-- 사용자 조회 버튼 시작 -->
        <div class="header_area">
        	<h2 class="title_basic"><spring:message code="global.lbl.user" /></h2>
        	<div class="btn_right">
        		<dms:access viewId="VIEW-D-13038" hasPermission="${dms:getPermissionMask('READ')}">
					<button class="btn_s" id="btnUserSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
				</dms:access>
            </div>
        </div>
        <!-- 사용자 조회 버튼 종료 -->

        <!-- 사용자 그리드 시작 -->
        <div class="table_grid">
            <div id="userGrid" class="resizable-container-custom"></div>
        </div>
        <!-- 사용자 그리드 종료 -->
	</section>

	<section style="margin-left: 560px;">
		<!-- 포틀릿-직무/사용자 매핑 버튼 종료 -->
		<div class="header_area">
			<div class="btn_right">
				<dms:access viewId="VIEW-D-12913" hasPermission="${dms:getPermissionMask('READ')}">
					<button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
				</dms:access>
			</div>
		</div>
		<!-- 포틀릿-직무/사용자 매핑 버튼 종료 -->

		<!-- 포틀릿-직무/사용자 매핑 그리드 시작 -->
		<div class="table_grid">
			<div id="portletMappingGrid" class="resizable-container-custom"></div>
		</div>
		<!-- 포틀릿-직무/사용자 매핑 그리드 종료 -->
	</section>
</section>

<script type="text/javascript">
var refTp = "";
var refId = "";

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

//포틀릿-직무/사용자 매핑 정보를 그리드에 반영한다.
function applyPortletMapping(vRefTp, vRefId){
	//포틀릿-매핑 적용 절차
    //1.포틀릿-직무/사용자 매핑 목록을 조회한다.
    //2.포틀릿-직무/사용자 매핑 정보를 초기화 한다.
    //3.포틀릿-직무/사용자 매핑 그리드에 적용한다.

    //1.포틀릿-직무/사용자 매핑 목록을 조회한다.
    var url;
	if(vRefTp == "T"){
		url = "<c:url value='/cmm/ptl/portletMapping/selectPortletMappingsByTask.do' />";
	}else{
		url = "<c:url value='/cmm/ptl/portletMapping/selectPortletMappingsByUser.do' />";
	}

    $.ajax({
        url:url
        ,data:JSON.stringify({
        	"sRefTp":vRefTp
        	,"sRefId":vRefId
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
        ,success:function(res, textStatus, jqXHR) {
        	var portletMappingGrid = $("#portletMappingGrid").data("kendoExtGrid");
        	var portletMappingMap = dms.data.arrayToMap(res.data, function(obj){
            	return obj.portletId;
           	});
        	var checkedCount = 0;

        	//2.포틀릿-직무/사용자 매핑 정보를 초기화 한다.
        	$("input.grid-checkbox-item:checked", portletMappingGrid.tbody).prop("checked", false).data("refTp", refTp);
        	$("input.grid-checkbox-item", portletMappingGrid.tbody).closest("td").css({"background-color":""});

            //3.포틀릿-직무/사용자 매핑 그리드에 적용한다.
            $.each($("input.grid-checkbox-item", portletMappingGrid.tbody), function(idx, elem){
            	if(portletMappingMap.hasOwnProperty($(this).data("portletId"))){
            		var portletMapping = portletMappingMap[$(this).data("portletId")];
            		$(this).prop("checked", true);
            		$(this).data("refTp", portletMapping.refTp);

            		if(portletMapping.refTp != vRefTp){
            			$(this).closest("td").css({"background-color":"#ff7a56"});
            		}else{
            			$(this).closest("td").css({"background-color":"#45b4e8"});
            		}

            		checkedCount++;
            	}
            });

            if(portletMappingGrid.dataSource.data().length == checkedCount){
            	$(".checkAll", portletMappingGrid.element).prop("checked", true);
            }else{
            	$(".checkAll", portletMappingGrid.element).prop("checked", false);
            }
        }
    });

}

$(document).ready(function() {
    //버튼 - 조회(직무)
    $("#btnTaskSearch").kendoButton({
        click:function(e) {
            $('#taskGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

  	//버튼 - 조회(사용자조회)
    $("#btnUserSearch").kendoButton({
        click:function(e) {
            $('#userGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            if(dms.string.isEmpty(refId)){
                dms.notification.info("<spring:message code='global.info.validation.selectTaskOrUser'/>");
                return;
            }

            var portletMappingGrid = $("#portletMappingGrid").data("kendoExtGrid");
            var portlets = [];
            $.each($("input.grid-checkbox-item:checked", portletMappingGrid.tbody), function(idx, obj){
            	var data = $(obj).data();

            	if(data.refTp == refTp){
                	portlets.push(data.portletId);
            	}
            });

            $.ajax({
                url:"<c:url value='/cmm/ptl/portletMapping/deleteAndInsertPortletMapping.do' />"
                ,data:JSON.stringify({
                    "refTp":refTp
                    ,"refId":refId
                    ,"portlets":portlets
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

            $("#sUsrTskCd").data("kendoExtDropDownList").setDataSource(tskCdListDatasource);
        }
    });

    //조회조건 - 직무
    $("#sUsrTskCd").kendoExtDropDownList({
        dataSource:[]
        ,dataValueField:"tskCd"
        ,dataTextField:"tskNm"
        ,optionLabel:" "
    });

    //직무 그리드
    $("#taskGrid").kendoExtGrid({
        gridId:"G-CMM-0308-180801"
       ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portletMapping/selectTasks.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCmpTp"] = "10";
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
                        rnum:{type:"number"}
                        ,tskCd:{type:"string"}
                        ,tskNm:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,height:250
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,selectable:"row"
        ,dataBound:function(e){
            refTp = "T";
            refId = "";

            $("input.grid-checkbox-item:checked", portletMappingGrid.tbody).prop("checked", false);
            $('#userGrid').data('kendoExtGrid').clearSelection();
        }
        ,change:function(e){
        	if(refTp == "U"){
	       		 $('#userGrid').data('kendoExtGrid').clearSelection();
	       	}

        	if(this.select().length != 0){
        		refTp = "T";
                refId = this.dataItem(this.select()).tskCd;

                applyPortletMapping(refTp, refId);
        	}
        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}, _hidden:true}
            ,{field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />"}
        ]
    });

  	//사용자 목록 그리드
    $("#userGrid").kendoExtGrid({
        gridId:"G-CMM-0319-154901"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portletMapping/selectUsers.do' />"
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
                        params["sTskCd"] = $("#sUsrTskCd").data("kendoExtDropDownList").value();
                        params["sUsrId"] = $("#sUsrId").val();
                        params["sUsrNm"] = $("#sUsrNm").val();
                        params["sDelYn"] = "N";

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
        ,editable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,selectable:"row"
        ,dataBinding:function(e){
            refTp = "U";
        	refId = "";

        	$("input.grid-checkbox-item:checked", portletMappingGrid.tbody).prop("checked", false);
        	$('#taskGrid').data('kendoExtGrid').clearSelection();
        }
        ,change:function(e){
        	if(refTp == "T"){
        		 $('#taskGrid').data('kendoExtGrid').clearSelection();
        	}

        	if(this.select().length != 0){
	        	refTp = "U";
	            refId = this.dataItem(this.select()).usrId;

	            applyPortletMapping(refTp, refId);
        	}
        }
        ,columns:[
        	{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}, _hidden:true}
            ,{field:"deptNm", title:"<spring:message code='global.lbl.dept' />", width:100}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.task' />", width:100}
            ,{field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:120}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />"}
        ]
    }).data("kendoExtGrid").dataSource.data([]);

    //포틀릿-직무/사용자 매핑 그리드
    $("#portletMappingGrid").kendoExtGrid({
        gridId:"G-CMM-0308-180802"
       ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portletMapping/selectPortlets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sDisplayYn"] = "Y";

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"portletId"
                    ,fields:{
                        rnum:{type:"number"}
                        ,portletId:{type:"string"}
                        ,portletNm:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,pageable:false
        ,selectable:false
        ,dataBound:function(){
        	var that = this;
        	$(".checkAll", that.element).click(function() {
                var checked = $(this).is(":checked");
                var backgroundColor = checked? "#45b4e8":"";
                var checkboxItems = $("input.grid-checkbox-item", that.tbody);

                checkboxItems.prop("checked", checked);

                $.each(checkboxItems, function(idx, elem){
                	$(this).data("refTp", refTp);
                	$(this).closest("td").css({"background-color":backgroundColor});
                });
            });

        	that.element.on("click", ".grid-checkbox-item", function(e) {

        		var backgroundColor = $(this).is(":checked")? "#45b4e8":"";
        		var checkedCount = $("input.grid-checkbox-item:checked", that.tbody).length;

        		$(this).closest("td").css({"background-color":backgroundColor});
        		$(this).data("refTp", refTp);

                if(checkedCount == that.dataSource.data().length){
                    $(".checkAll", that.element).prop("checked", true);
                }else{
                    $(".checkAll", that.element).prop("checked", false);
                }

            });

        }
        ,columns:[
             {field:"_checkbox", title:"", width:30, sortable:false, filterable:false, _hidden:true
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                  return "<input type='checkbox' data-portlet-id='"+dataItem.portletId+"' class='grid-checkbox-item' />";
                }
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
             }
            ,{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}, _hidden:true}
            ,{field:"portletId", title:"<spring:message code='global.lbl.portletId' />", width:150 ,attributes:{"class":"ac"}}
            ,{field:"portletNm", title:"<spring:message code='global.lbl.portletNm' />"}
        ]
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
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 사용자 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.userMng" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12205" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
                <button type="button" class="btn_m btn_new" id="btnNew"><spring:message code='global.btn.new' /><!-- 신규 --></button>
                <button type="button" class="btn_m btn_modify" id="btnUpdate"><spring:message code='global.btn.update' /><!-- 수정 --></button>
            <dms:access viewId="VIEW-I-12204" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12203" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
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
                    <th scope="row"><spring:message code="global.lbl.searchText" /></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left"><input id="sFields" type="text" class="form_comboBox"></div>
                            <div class="form_right"><input id="sText" type="text" class="form_input"></div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.enabledYn" /></th>
                    <td>
                        <input id="sEnabledYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="com.lbl.claimReqPermYn" /></th>
                    <td>
                        <input id="sClaimReqPermYn" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                    <td>
                        <input id="sDlrCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dept' /><!-- 부서 --></th>
                    <td>
                        <input id="sDeptCd" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.task' /><!-- 직무 --></th>
                    <td>
                        <input id="sTskCd" type="text" value="" class="form_comboBox">
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

</section>
</div>

<script type="text/javascript">
//부서목록
var deptCdList = [{"deptCd":"", "deptNm":"", "useYn":"Y", "cmpTp":""}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"deptCd":"${obj.deptCd}", "deptNm":"${obj.deptNm}", "useYn":"${obj.useYn}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>
//부서 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.deptCd; });

//직무목록
var tskCdList = [{"tskCd":"", "tskNm":"", "deptCd":"", "cmpTp":""}];
<c:forEach var="obj" items="${taskList}">
tskCdList.push({"tskCd":"${obj.tskCd}", "tskNm":"${obj.tskNm}", "deptCd":"${obj.deptCd}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>
//직무 Map
var tskCdMap = dms.data.arrayToMap(tskCdList, function(obj){ return obj.tskCd; });

//지원언어 목록
var supportedLangs = [""];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push("${obj}");
</c:forEach>

//테마 목록
var themeNames = [""];
<c:forEach var="obj" items="${themeNames}">
themeNames.push("${obj}");
</c:forEach>

//그리드 목록 더블클릭 사용자 정보 팝업
$("#grid").on("dblclick", "tr.k-state-selected", function(e){
    var grid = $(e.delegateTarget).data("kendoExtGrid");

    if(grid.select().length > 0){
        var dataItem = grid.dataItem(grid.select());

        dms.window.popup({
            windowId:"selectUserPopupWin"
            ,title:"<spring:message code='cmm.title.userInfo' />"
            ,height:251
            ,content:{
                url:"<c:url value='/cmm/sci/user/selectUserPopup.do'/>?usrId="+dataItem.usrId
            }
        });
    }
});

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 신규
    $("#btnNew").kendoButton({
        click:function(e) {
            dms.window.popup({
                windowId:"insertUserPopupWin"
                ,title:"<spring:message code='cmm.title.user.insert'/>"
                ,height:450
                ,content:{
                    url:"<c:url value='/cmm/sci/user/insertUserPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(data){
                            $("#insertUserPopupWin").data("kendoWindow").close();
                            $('#grid').data('kendoExtGrid').dataSource.page(1);
                        }
                    }
                }
            });
        }
    });

    //버튼 - 수정
    $("#btnUpdate").kendoButton({
        click:function(e) {
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = grid.dataItem(rows);

            if(dataItem.dssUsrYn !== "N"){
                dms.notification.info("<spring:message code='cmm.info.unableToModifyUser'/>");
                return;
            }

            dms.window.popup({
                windowId:"updateUserPopupWin"
                ,title:"<spring:message code='cmm.title.user.update'/>"
                ,height:450
                ,content:{
                    url:"<c:url value='/cmm/sci/user/updateUserPopup.do'/>?usrId="+dataItem.usrId
                    ,data:{
                        "callbackFunc":function(data){
                            $("#updateUserPopupWin").data("kendoWindow").close();
                            $('#grid').data('kendoExtGrid').dataSource.page(1);
                        }
                    }
                }
            });
        }
    });

    //버튼 - 상세
    $("#btnDetail").kendoButton({
        click:function(e) {
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = grid.dataItem(rows);

            dms.window.popup({
                windowId:"selectUserPopupWin"
                ,title:"<spring:message code='cmm.title.userInfo' />"
                ,height:251
                ,content:{
                    url:"<c:url value='/cmm/sci/user/selectUserPopup.do'/>?usrId="+dataItem.usrId
                }
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/sci/user/multiUsers.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

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

  	//조회조건 - 검색구분
    $("#sFields").kendoExtMultiSelectDropDownList({
        dataSource:[
            {"field":"USRID", "fieldNm":"<spring:message code='global.lbl.usrId'/>"}
            ,{"field":"USRNM", "fieldNm":"<spring:message code='global.lbl.usrNm'/>"}
            ,{"field":"EMPNO", "fieldNm":"<spring:message code='global.lbl.empNo'/>"}
        ]
        ,dataValueField:"field"
        ,dataTextField:"fieldNm"
        ,selectedAllText:"<spring:message code='global.lbl.all'/>"
    })
    //조회조건 - 검색구분 초기값 설정
    $("#sFields").data("kendoExtMultiSelectDropDownList").value(["USRID"]);

    //조회조건 - 활성여부
    $("#sEnabledYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,value:"Y"
        ,index:0
    });

    //조회조건 - 클레인신청 권한 여부
    $("#sClaimReqPermYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });

    //조회조건 - 부서
    $("#sDeptCd").kendoExtDropDownList({
        dataSource:deptCdList
        ,dataValueField:"deptCd"
        ,dataTextField:"deptNm"
        ,change:function(e){
            var deptCd = this.value();
            var cmpTp = deptCdMap[deptCd].cmpTp;
            var tskCdListDatasource = [{"tskCd":"", "tskNm":"", "deptCd":"", "cmpTp":""}];

            if(dms.string.isNotEmpty(deptCd)){
                $.each(tskCdList, function(idx, obj){
                    if(cmpTp == "${cmpTpCorp}"){
                        if(obj.cmpTp == "${cmpTpCorp}"){
                            tskCdListDatasource.push(obj);
                        }
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
    });

    var validator = $("#userForm").kendoExtValidator().data("kendoExtValidator");

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/user/selectUsers.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sFields"] = $("#sFields").data("kendoExtMultiSelectDropDownList").value();
                        params["sText"] = $("#sText").val();
                        params["sDeptCd"] = $("#sDeptCd").data("kendoExtDropDownList").value();
                        params["sTskCd"] = $("#sTskCd").data("kendoExtDropDownList").value();
                        params["sEnabledYn"] = $("#sEnabledYn").data("kendoExtDropDownList").value();
                        params["sClaimReqPermYn"] = $("#sClaimReqPermYn").data("kendoExtDropDownList").value();
						params["sDlrCd"] = $("#sDlrCd").val();

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
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,usrId:{type:"string", editable:false}
                        ,usrNm:{type:"string", editable:false}
                        ,empNo:{type:"string", editable:false}
                        ,deptCd:{type:"string", editable:false}
                        ,deptNm:{type:"string", editable:false}
                        ,tskCd:{type:"string", editable:false}
                        ,tskNm:{type:"string", editable:false}
                        ,langCd:{type:"string", editable:false}
                        ,enabledYn:{type:"string", editable:false}
                        ,claimReqPermYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,appendEmptyColumn:true
        ,selectable:"row"
        ,edit:function(e){
            var fieldName = e.container.find("input[name][data-bind]").attr("name");
            if(fieldName != "claimReqPermYn"){
                this.closeCell();
                return;
            }
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:120, attributes:{"class":"ac"}}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:150}
            ,{field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:120, attributes:{"class":"ac"}}
            ,{field:"deptCd", title:"<spring:message code='global.lbl.deptCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm' />", width:180}
            ,{field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />", width:180}
            ,{field:"langCd", title:"<spring:message code='global.lbl.langCd' />", width:80, attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:supportedLangs
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"enabledYn", title:"<spring:message code='global.lbl.enabledYn' />", width:80, attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"claimReqPermYn", title:"<spring:message code='global.lbl.claimReqPermYn' />", width:120, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="claimReqPermYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y","N"]
                    });
                    $('<span class="k-invalid-msg" data-for="delYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
        ]
    });
});
</script>
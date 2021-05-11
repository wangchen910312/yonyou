<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 포틀릿 레이아웃 관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.portletLayoutMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-11428" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11429" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11430" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11431" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11432" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11433" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_add" id="btnDefaultPortletSetting"><spring:message code="global.btn.defaultPortletSetting" /><!-- 디폴트포틀릿설정 --></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.portletLayoutId" /></th>
                    <td>
                        <input id="sPortletLayoutId" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.portletLayoutNm" /></th>
                    <td>
                        <input id="sPortletLayoutNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.defaultYn" /></th>
                    <td>
                        <input id="sDefaultYn" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div id="portletLayoutContainer" style="display:none;">
        <div class="header_area">
            <h2 class="title_basic">디폴트포틀릿설정</h2>
        </div>
        <div id="portletContainer"></div>
    </div>
</section>

<script type="text/javascript">
$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "portletLayoutId":""
                ,"portletLayoutNm":""
                ,"portletLayoutUrl":""
                ,"defaultYn":"N"
                ,"columnCnt":1
                ,"rowCnt":1
                ,"portletLayoutIconNm":""
             });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
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
                    url:"<c:url value='/cmm/ptl/portletLayout/multiPortletLayouts.do' />",
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

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //디폴트포틀릿 설정
    $("#btnDefaultPortletSetting").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = grid.dataItem(rows);

            $.get("<c:url value='/cmm/ptl/portletLayout/selectDefaultPortletDeployMain.do'/>?portletLayoutId=" + dataItem.portletLayoutId, function(data) {
                $("#portletContainer").html(data);
                $("#portletLayoutContainer").show();
            });

//             var portletSettingWindow = $("<div/>");
//             portletSettingWindow.appendTo("body");

//             portletSettingWindow.kendoWindow({
//                width:"480px"
//                ,height:"300px"
//                ,modal:true
//                ,content:"<c:url value='/cmm/ptl/portletLayout/selectDefaultPortletSettingsPopup.do'/>?portletLayoutId=" + dataItem.portletLayoutId
//                ,deactivate:function() {
//                    this.destroy();
//                }
//             }).data("kendoWindow").center();

        }
    });
	
  	//조회조건 - 기본여부
    $("#sDefaultYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portletLayout/selectPortletLayouts.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPortletLayoutId"] = $("#sPortletLayoutId").val();
                        params["sPortletLayoutNm"] = $("#sPortletLayoutNm").val();
                        params["sDefaultYn"] = $("#sDefaultYn").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"portletLayoutId"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,portletLayoutId:{type:"string", validation:{required:true}}
                        ,portletLayoutNm:{type:"string", validation:{required:true}}
                        ,portletLayoutUrl:{type:"string", validation:{required:true}}
                        ,defaultYn:{type:"string", validation:{required:true}}
                        ,columnCnt:{type:"number", validation:{required:true, min:1}}
                        ,rowCnt:{type:"number", validation:{required:true, min:1}}
                    }
                }
            }
        }
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["portletLayoutNm","portletLayoutUrl","defaultYn","columnCnt","rowCnt","portletLayoutIconNm"]
        ,multiSelectWithCheckbox:true
        ,selectable:"row"
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"portletLayoutId", title:"<spring:message code='global.lbl.portletLayoutId' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"portletLayoutNm", title:"<spring:message code='global.lbl.portletLayoutNm' />", width:250}
            ,{field:"portletLayoutUrl", title:"<spring:message code='global.lbl.portletLayoutUrl' />", width:350}
            ,{field:"defaultYn", title:"<spring:message code='global.lbl.defaultYn' />", width:80
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="defaultYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["N", "Y"]
                    });
                    $('<span class="k-invalid-msg" data-for="defaultYn"></span>').appendTo(container);
                }
            }
            ,{field:"columnCnt", title:"<spring:message code='global.lbl.columnCnt' />" ,width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"rowCnt", title:"<spring:message code='global.lbl.rowCnt' />", width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"portletLayoutIconNm", title:"<spring:message code='global.lbl.portletLayoutIconNm' />", width:150}
            ,{title:""}
        ]

    });
});
</script>
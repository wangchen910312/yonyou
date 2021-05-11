<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 포틀릿 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.portletMng" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11434" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.portletId" /></th>
                    <td>
                        <input id="sPortletId" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.portletNm" /></th>
                    <td>
                        <input id="sPortletNm" type="text" class="form_input" >
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-11436" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11435" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11437" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11438" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
            </dms:access>
        </div>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
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
                    url:"<c:url value='/cmm/ptl/portlet/multiPortlets.do' />",
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

    //버튼 - 행추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "portletId":""
                ,"portletNm":""
                ,"portletUrl":""
                ,"viewId":""
                ,"reloadYn":"Y"
                ,"mesgKey":""
             });
        }
    });

    //버튼 - 행삭제
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

    //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portlet/selectPortlets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPortletId"] = $("#sPortletId").val();
                        params["sPortletNm"] = $("#sPortletNm").val();

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
                        rnum:{type:"number", editable:false}
                        ,portletId:{type:"string", validation:{required:true}}
                        ,portletNm:{type:"string", validation:{required:true}}
                        ,mesgKey:{type:"string"}
                        ,portletUrl:{type:"string", validation:{required:true}}
                        ,viewId:{type:"string"}
                        ,reloadYn:{type:"string", validation:{required:true}}
                        ,displayYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,appendEmptyColumn:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["portletNm","portletUrl","viewId","mesgKey","reloadYn","displayYn"]
        ,multiSelectWithCheckbox:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}}
            ,{field:"portletId", title:"<spring:message code='global.lbl.portletId' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"portletNm", title:"<spring:message code='global.lbl.portletNm' />", width:250}
            ,{field:"mesgKey", title:"<spring:message code='global.lbl.portletNm' />(<spring:message code='global.lbl.mesgKey' />)", width:200}
            ,{field:"portletUrl", title:"<spring:message code='global.lbl.portletUrl' />", width:400}
            ,{field:"viewId", title:"<spring:message code='global.lbl.tCd' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"reloadYn", title:"<spring:message code='global.lbl.reloadYn' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="reloadYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:[
                            {"text":"Y", "value":"Y"}
                            ,{"text":"N", "value":"N"}
                        ]
                        ,dataTextField:"text"
                        ,dataValueField:"value"
                    });
                    $('<span class="k-invalid-msg" data-for="reloadYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["","Y","N"]
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"displayYn", title:"<spring:message code='global.lbl.displayYn' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="displayYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:[
                            {"text":"Y", "value":"Y"}
                            ,{"text":"N", "value":"N"}
                        ]
                        ,dataTextField:"text"
                        ,dataValueField:"value"
                    });
                    $('<span class="k-invalid-msg" data-for="displayYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["","Y","N"]
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
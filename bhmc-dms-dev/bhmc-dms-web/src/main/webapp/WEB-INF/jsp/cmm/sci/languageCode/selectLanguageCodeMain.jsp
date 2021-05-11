<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 언어코드 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.languageCodeMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10828" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
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
                    <th scope="row"><spring:message code="global.lbl.langCd" /></th>
                    <td>
                        <input id="sLangCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.langNm" /></th>
                    <td>
                        <input id="sLangNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.enabledYn" /></th>
                    <td>
                        <input id="sEnabledYn" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-10829" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
			</dms:access>
	        <dms:access viewId="VIEW-D-10831" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10832" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
			</dms:access>
	        <dms:access viewId="VIEW-D-10830" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
			</dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
$(document).ready(function() {
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
                    url:"<c:url value='/cmm/sci/languageCode/multiLanguageCodes.do' />",
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
    
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 행추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "langCd":""
                ,"langNm":""
                ,"enabledYn":dms.string.defaultString($("#sEnabledYn").val(), "")
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

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });
	
  	//조회조건 - 언어선택
    $("#sEnabledYn").kendoExtDropDownList({
        dataSource:[
            {"text":"", "value":""}
            ,{"text":"<spring:message code='global.lbl.enabled' />", "value":"Y"}
            ,{"text":"<spring:message code='global.lbl.disabled' />", "value":"N"}
        ]
        ,dataTextField:"text"
        ,dataValueField:"value"
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/languageCode/selectLanguageCodes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sLangCd"] = $("#sLangCd").val();
                        params["sLangNm"] = $("#sLangNm").val();
                        params["sEnabledYn"] = $("#sEnabledYn").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"langCd"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,langCd:{type:"string", validation:{required:true}}
                        ,langNm:{type:"string", validation:{required:true}}
                        ,enabledYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,edit:function(e) {
            if (!e.model.isNew()) {
                var fieldName = e.container.find("input").attr("name");
                if (fieldName == "langCd") {
                    this.closeCell();
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:false
        ,editableOnlyNewExcludeColumns:["langNm", "enabledYn"]
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}}
            ,{field:"langCd", title:"<spring:message code='global.lbl.langCd' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"langNm", title:"<spring:message code='global.lbl.langNm' />", width:250}
            ,{field:"enabledYn", title:"<spring:message code='global.lbl.enabledYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    if (dataItem.enabledYn === "Y") {
                        return "<spring:message code='global.lbl.enabled' />";
                    } else if (dataItem.enabledYn === "N") {
                        return "<spring:message code='global.lbl.disabled' />";
                    } else {
                        return "";
                    }
                }
                ,editor:function(container, options) {
                    $('<input required name="enabledYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:[
                            {"text":"<spring:message code='global.lbl.enabled' />", "value":"Y"}
                            ,{"text":"<spring:message code='global.lbl.disabled' />", "value":"N"}
                        ]
                        ,dataTextField:"text"
                        ,dataValueField:"value"
                    });
                    $('<span class="k-invalid-msg" data-for="enabledYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                        	dataSource:[
	                                {"text":"", "value":""}
	                                ,{"text":"<spring:message code='global.lbl.enabled' />", "value":"Y"}
	                                ,{"text":"<spring:message code='global.lbl.disabled' />", "value":"N"}
	                            ]
	                            ,dataTextField:"text"
	                            ,dataValueField:"value"
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
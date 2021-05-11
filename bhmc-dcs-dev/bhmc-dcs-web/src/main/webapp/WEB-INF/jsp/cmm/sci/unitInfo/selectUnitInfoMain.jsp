<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 단위정보 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.unitInfoMng" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12147" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <th scope="row"><spring:message code="global.lbl.unitCd" /></th>
                    <td>
                        <input id=sUnitCd type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.unitTp" /></th>
                    <td>
                        <input id="sUnitTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.unitNm" /></th>
                    <td>
                        <input id="sUnitNm" type="text" class="form_input" >
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.unitStdYn" /></th>
                    <td>
                        <input id="sUnitStdYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.useYn" /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-I-12146" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12144" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12143" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12145" hasPermission="${dms:getPermissionMask('READ')}">
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
//단위유형 Array
var unitTpList = [];
<c:forEach var="obj" items="${unitTpList}">
unitTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//단위유형 Map
var unitTpMap = dms.data.arrayToMap(unitTpList, function(obj){ return obj.cmmCd; });

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
                    url:"<c:url value='/cmm/sci/unitInfo/multiUnitInfos.do' />",
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
                "unitCd":""
                , "unitExtCd":""
                , "unitTp":""
                , "unitNm":""
                , "unitStdYn":"N"
                , "nmrtrVal":1
                , "denmntrVal":1
                , "useYn":"Y"
             });
        }
    });

    //버튼 - 행삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var deleteCheck = true;

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if(dataItem.unitStdYn == "Y") {
                    dms.notification.warning("<spring:message code='global.lbl.unitStd' var='unitStdMsg'/><spring:message code='global.err.delete' arguments='${unitStdMsg}' />");
                    deleteCheck = false;
                    return false;
                }
            });

            if(deleteCheck) {
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //조회조건 - 단위유형
    $("#sUnitTp").kendoExtDropDownList({
        dataSource:unitTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 기준단위여부
    $("#sUnitStdYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //조회조건 - 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/unitInfo/selectUnitInfos.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sUnitCd"] = $("#sUnitCd").val();
                        params["sUnitTp"] = $("#sUnitTp").val();
                        params["sUnitNm"] = $("#sUnitNm").val();
                        params["sUnitStdYn"] = $("#sUnitStdYn").val();
                        params["sUseYn"] = $("#sUseYn").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"unitSeq"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,unitSeq:{type:"number"}
                        ,unitCd:{type:"string", validation:{required:true}}
                        ,unitExtCd:{type:"string", validation:{required:true}}
                        ,unitTp:{type:"string"}
                        ,unitNm:{type:"string", validation:{required:true}}
                        ,unitStdYn:{type:"string", validation:{required:true}}
                        ,nmrtrVal:{type:"number", validation:{required:true}}
                        ,denmntrVal:{type:"number", validation:{required:true}}
                        ,useYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
            	, attributes:{"class":"ac"}
            }
            ,{field:"unitCd", title:"<spring:message code='global.lbl.unitCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"unitExtCd", title:"<spring:message code='global.lbl.unitExtCd' />", width:120, attributes:{"class":"ac"}}
            ,{field:"unitTp", title:"<spring:message code='global.lbl.unitTp' />", width:180
                ,attributes:{"class":"ac"}
                ,template:"# if(unitTpMap[unitTp] != null) { # #= unitTpMap[unitTp].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input name="unitTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:unitTpList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="unitTp"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                        	dataSource:unitTpList
	                            ,dataValueField:"cmmCd"
	                            ,dataTextField:"cmmCdNm"
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
//             ,{field:"unitNm", title:"<spring:message code='global.lbl.unitNm' />", width:150}
            ,{field:"unitStdYn", title:"<spring:message code='global.lbl.unitStdYn' />", width:80
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="unitStdYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="unitStdYn"></span>').appendTo(container);
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
            },
            {field:"nmrtrVal", title:"<spring:message code='global.lbl.nmrtrVal' />" ,width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            },
            {field:"denmntrVal", title:"<spring:message code='global.lbl.denmntrVal' />", width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            },
            {field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:80
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
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
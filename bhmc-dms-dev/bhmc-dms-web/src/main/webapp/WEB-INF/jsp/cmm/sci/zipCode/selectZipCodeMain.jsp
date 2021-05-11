<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 우편번호 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.zipCodeMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10843" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.searchCondition" /></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <input id="sGubun" type="text" class="form_comboBox" />
                            </div>
                            <div class="form_right">
                                <input id="sValue" type="text" class="form_input" >
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.zipCd" /></th>
                    <td>
                        <input id="sZipCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-10844" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
			</dms:access>
	        <dms:access viewId="VIEW-D-10846" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10847" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
			</dms:access>
	        <dms:access viewId="VIEW-D-10845" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10848" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnExcelImport"><spring:message code="global.btn.excelImport" /><!-- 엑셀Import --></button>
			</dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div id="refDocCont" class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
//검색조건 구분목록
var gubunList = [];
<c:forEach var="obj" items="${gubunList}">
gubunList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

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
                    url:"<c:url value='/cmm/sci/zipCode/multiZipCodes.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
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
            $('#grid').data('kendoExtGrid').dataSource.insert(0);
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
    
    //버튼 - 일괄등록
    $("#btnBatchUpload").kendoButton({
        click:function(e) {
            dbMessageSourceBatchUploadPopupWin = dms.window.popup({
                title:"<spring:message code='global.lbl.zipCode.batchUpload' />"
                ,windowId:"dbMessageSourceBatchUploadPopupWin"
                ,content:{
                    url:"<c:url value='/cmm/sci/zipCode/selectZipCodeBatchUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });
    
  	//조회조건 - 검색조건
    $("#sGubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:gubunList
        ,autoBind:false
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/zipCode/selectZipCodes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGubun"] = $("#sGubun").val();
                        params["sValue"] = $("#sValue").val();

                        params["sSungNm"] = $("#sSungNm").val();
                        params["sCityNm"] = $("#sCityNm").val();
                        params["sDistNm"] = $("#sDistNm").val();
                        params["sZipCd"] = $("#sZipCd").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"zipCd"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,sungCd:{type:"string", validation:{required:true}}
                        ,sungNm:{type:"string", validation:{required:true}}
                        ,cityCd:{type:"string", validation:{required:true}}
                        ,cityNm:{type:"string", validation:{required:true}}
                        ,distCd:{type:"string", validation:{required:true}}
                        ,distNm:{type:"string", validation:{required:true}}
                        ,zipCd:{type:"string", validation:{required:true}}
                        ,extZipCd:{type:"string", editable:true}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["sungNm","cityNm","distNm","zipCd","extZipCd"]
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}}
            ,{field:"sungCd", title:"<spring:message code='global.lbl.sungCd' />", width:60, attributes:{"class":"ac"} }
            ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:150, attributes:{"class":"ac"}}
            ,{field:"cityCd", title:"<spring:message code='global.lbl.cityCd' />", width:80,  attributes:{"class":"ac"}}
            ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:150}
            ,{field:"distCd", title:"<spring:message code='global.lbl.distCd' />", width:80}
            ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:150}
            ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:80, attributes:{"class":"ac"}}
        ]
    });
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 역할 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.roleMgr" /><!-- 역할관리 --></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button type="button" class="btn_m btn_save" id="btnRoleSave"><spring:message code="global.btn.save" /></button>
            <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
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
                    <th scope="row"><spring:message code="global.lbl.gubun" /><!-- 시스템구분 --></th>
                    <td>
                        <input id="sSysCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.role" /><!-- 역할 --></th>
                    <td>
                        <input id="sRoleId" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.roleNm" /><!-- 역할명 --></th>
                    <td>
                        <input id="sRoleNm" type="text" class="form_input">
                    </td>
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
            <button type="button" class="btn_s" id="btnRoleAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button type="button" class="btn_s" id="btnRoleDel"><spring:message code="global.btn.rowDel" /></button>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 역할 그리드 시작 -->
    <div class="table_grid">
        <div id="roleGrid" class="resizable_grid"></div>
    </div>
    <!-- 역할 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
//시스템구분  목록
var sysCdList = [];
<c:forEach var="obj" items="${sysCdList}">
sysCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시스템구분 맵
var sysCdMap = dms.data.arrayToMap(sysCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //조회조건 - 시스템구분
    $("#sSysCd").kendoExtDropDownList({
        dataSource:sysCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,value:"${sysCd}"
        ,change:function(e){
            var grid = $("#roleGrid").data("kendoExtGrid");
            grid.dataSource._destroyed = [];
            grid.dataSource.page(1);
        }
    });

    //역할 추가
    $("#btnRoleAdd").kendoButton({
        click:function(e) {
            roleGrid.dataSource.insert(0, {
                "sysCd":$("#sSysCd").data("kendoExtDropDownList").value()
                ,"roleTp":"CST"
                ,"roleId":""
                ,"roleNm":""
                ,"roleDetlCont":""
            });
        }
    });

    //역할 삭제
    $("#btnRoleDel").kendoButton({
        click:function(e) {
            var rows = roleGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                roleGrid.removeRow(row);
            });
        }
    });

    //역할 저장
    $("#btnRoleSave").kendoButton({
        click:function(e) {
            var saveData = roleGrid.getCUDData("insertList", "updateList", "deleteList");
            if (roleGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (roleGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/ath/role/multiRoles.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        roleGrid.dataSource._destroyed = [];
                        roleGrid.dataSource.page(1);

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

    //역할 적용 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            roleGrid.cancelChanges();
        }
    });

    //역할 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            roleGrid.dataSource.page(1);
        }
    });

    //역할 그리드
    var roleGrid = $("#roleGrid").kendoExtGrid({
        gridId:"G-CMM-0302-154301"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ath/role/selectRoles.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSysCd"] = $("#sSysCd").data("kendoExtDropDownList").value();
                        params["sRoleId"] = $("#sRoleId").val();
                        params["sRoleNm"] = $("#sRoleNm").val();

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
                        rnum:{type:"string", editable:false}
                        ,sysCd:{type:"string", validation:{required:true}}
                        ,roleId:{type:"string", validation:{required:true}}
                        ,roleNm:{type:"string", validation:{required:true}}
                        ,roleDetlCont:{type:"string"}
                    }
                }
            }
        }
//         ,appendEmptyColumn:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"]
        ,indvColumnRows:10
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60
                ,attributes:{"class":"ac"}
                ,sortable:false
                ,filterable:false
            }
            ,{field:"sysCd", title:"<spring:message code='global.lbl.gubun' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"# if(sysCdMap[sysCd] != null) { # #= sysCdMap[sysCd].cmmCdNm# # }#"
            }
            ,{field:"roleId", title:"<spring:message code='global.lbl.roleId' />", width:250}
            ,{field:"roleNm", title:"<spring:message code='global.lbl.roleNm' />", width:300}
            ,{field:"roleDetlCont", title:"<spring:message code='global.lbl.roleDetlCont' />"}
        ]
    }).data("kendoExtGrid");
});
</script>
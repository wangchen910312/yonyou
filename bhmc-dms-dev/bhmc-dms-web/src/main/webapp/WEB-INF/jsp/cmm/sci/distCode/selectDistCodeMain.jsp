<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 지역코드 관리 -->
<div id="resizableContainer">
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.distCodeMng" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.distCd" /></th>
                    <td>
                        <input id="sDistCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.distNm" /></th>
                    <td>
                        <input id="sDistNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.useYn" /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.saleDistYn" /></th>
                    <td>
                        <input id="sSaleDistYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.serDistYn" /></th>
                    <td>
                        <input id="sSerDistYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.gobDistYn" /></th>
                    <td>
                        <input id="sGobDistYn" type="text" class="form_comboBox">
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
            <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
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

    //조회조건 - 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //조회조건 - 판매지역여부
    $("#sSaleDistYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //조회조건 - 정비지역여부
    $("#sSerDistYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //조회조건 - 행정여부
    $("#sGobDistYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

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
                "distCd":""
                ,"distNm":""
                ,"useYn":"Y"
                ,"saleDistYn":"N"
                ,"serDistYn":"N"
                ,"gobDistYn":"N"
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
                    url:"<c:url value='/cmm/sci/distCode/multiDistCodes.do' />",
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

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/distCode/selectDistCodes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDistCd"] = $("#sDistCd").val();
                        params["sDistNm"] = $("#sDistNm").val();
                        params["sUseYn"] = $("#sUseYn").val();
                        params["sSaleDistYn"] = $("#sSaleDistYn").val();
                        params["sSerDistYn"] = $("#sSerDistYn").val();
                        params["sGobDistYn"] = $("#sGobDistYn").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"distCd"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,distCd:{type:"string", validation:{required:true}}
                        ,distNm:{type:"string", validation:{required:true}}
                        ,useYn:{type:"string", validation:{required:true}}
                        ,saleDistYn:{type:"string", validation:{required:true}}
                        ,serDistYn:{type:"string", validation:{required:true}}
                        ,gobDistYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["distNm","useYn","saleDistYn","serDistYn","gobDistYn"]
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"distCd", title:"<spring:message code='global.lbl.distCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:350}
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                    });
                    $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                }
            }
            ,{field:"saleDistYn", title:"<spring:message code='global.lbl.saleDistYn' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="saleDistYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                    });
                    $('<span class="k-invalid-msg" data-for="saleDistYn"></span>').appendTo(container);
                }
            }
            ,{field:"serDistYn", title:"<spring:message code='global.lbl.serDistYn' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="serDistYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                    });
                    $('<span class="k-invalid-msg" data-for="serDistYn"></span>').appendTo(container);
                }
            }
            ,{field:"gobDistYn", title:"<spring:message code='global.lbl.gobDistYn' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="gobDistYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                    });
                    $('<span class="k-invalid-msg" data-for="gobDistYn"></span>').appendTo(container);
                }
            }
        ]

    });
});

</script>








<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

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
                    <th scope="row"><spring:message code="global.lbl.tskCd" /></th>
                    <td><input id="sTskCd" type="text" value="" class="form_input"></td>
                    <th scope="row"><spring:message code="global.lbl.tskNm" /></th>
                    <td><input id="sTskNm" type="text" value="" class="form_input"></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
$(document).ready(function() {
    /**
     * 팝업 옵션
     */
    var popupWindow = parent.$("#taskSearchPopupWin").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                popupOptions.callbackFunc(data);
                if(popupOptions["closeAfterSelect"]!=false) {
                    popupWindow.close();
                }
            }
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (popupOptions.tskNm) {
        $("#sTskNm").val(popupOptions.tskNm);
    }

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectTasks.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sTskCd"] = $("#sTskCd").val();
                        params["sTskNm"] = $("#sTskNm").val();
                        
                        if(popupOptions.cmpTp){
                        	params["sCmpTp"] = popupOptions.cmpTp;
                        }

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"tskCd"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,tskCd:{type:"string", validation:{required:true}}
                        ,tskNm:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,height:407
        ,selectable:popupOptions.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,filterable:false
            }
            ,{field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:150}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />", width:300}
        ]
    });

    if(popupOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});
</script>
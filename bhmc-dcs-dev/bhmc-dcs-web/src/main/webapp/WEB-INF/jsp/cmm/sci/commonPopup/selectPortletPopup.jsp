<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

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

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>

<script type="text/javascript">
    $(document).ready(function() {

        //팝업옵션
         var popupWindow = parent.$("#portletSearchPopupWin").data("kendoWindow");
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

                if(rows.length != 0){
                    popupOptions.callbackFunc(grid.dataItem(rows));
                }
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/commonPopup/selectPortlets.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            if(popupOptions["searchAll"] !== true){
                                params["sRefId"] = "${usrId}";
                            }
                            params["sPortletId"] = $("#sPortletId").val();
                            params["sPortletNm"] = $("#sPortletNm").val();
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
                            rnum:{type:"number", editable:false}
                            ,portletId:{type:"string", validation:{required:true}}
                            ,portletNm:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,appendEmptyColumn:true
            ,autoBind:false
            ,editable:false
            ,height:405
            ,multiSelectWithCheckbox:true
            ,selectable:"row"
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
                ,{field:"portletId", title:"<spring:message code='global.lbl.portletId' />", width:150 ,attributes:{"class":"ac"}}
                ,{field:"portletNm", title:"<spring:message code='global.lbl.portletNm' />", width:250}
            ]

        }).data("kendoExtGrid").dataSource.data([]);

        if(popupOptions.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>
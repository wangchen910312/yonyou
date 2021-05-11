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

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:19%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.systemId" /><!-- 시스템번호 --></th>
                    <td>
                        <input id="sTecId" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.staffNo" /><%-- 직원번호--%></th>
                    <td>
                        <input id="sSysNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.empNm" /><%-- 직원명--%></th>
                    <td>
                        <input id="sTecNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.deptNm" /><%-- 부서명칭--%></th>
                    <td>
                        <input id="sDeptNm" type="text" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.techManSearchPopupWin.options.content.data;


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

                    options.callbackFunc(data);
                    parent.techManSearchPopupWin.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.techManSearchPopupWin.close();
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.tecId) {
            $("#sTecId").val(options.tecId);
        }
        if (options.tecNm) {
            $("#sTecNm").val(options.tecNm);
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000107"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sSysNo"] = $("#sSysNo").val();
                            params["sTecId"] = $("#sTecId").val();
                            params["sTecNm"] = $("#sTecNm").val();
                            params["sDeptNm"] = $("#sDeptNm").val();

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
                       id:"rnum"
                       ,fields:{
                           rnum:{type:"number", editable:false}
                           ,tecId:{type:"string", validation:{required:true}}
                           ,tecNm:{type:"string", validation:{required:true}}
                      }
                   }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:280
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                {field:"tecId", title:"<spring:message code='ser.lbl.systemId' />", width:100}                     // 직원번호
                ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:100, attributes:{"class":"al"}} // 시스템번호
                ,{field:"tecNm", title:"<spring:message code='ser.lbl.empNm' />", width:150}                       // 직원이름
                ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", width:150}                     // 부서코드
                ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", width:150}                     // 부서명칭
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>










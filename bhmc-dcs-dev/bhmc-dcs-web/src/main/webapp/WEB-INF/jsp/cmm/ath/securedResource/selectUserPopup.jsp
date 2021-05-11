<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>

    <div class="table_form form_width_20per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col style="width:21%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.usrId" /></th>
                    <td>
                        <input id="sUsrId" name="sUsrId" class="form_input" style="width:70%">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.usrNm" /></th>
                    <td>
                        <input id="sUsrNm" name="sUsrNm" class="form_input" style="width:70%">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.empNo" /></th>
                    <td>
                        <input id="sEmpNo" name="sEmpNo" class="form_input" style="width:70%">
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
         var options = parent.userSearchPopupWin.options.content.data;


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
                    parent.userSearchPopupWin.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.userSearchPopupWin.close();
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.cntryNm) {
            $("#sCntryNm").val(options.cntryNm);
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sUsrId"] = $("#sUsrId").val();
                            params["sUsrNm"] = $("#sUsrNm").val();
                            params["sEmpNo"] = $("#sEmpNo").val();
                            params["sDelYn"] = "N";

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
                        id:"usrNm"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,usrId:{type:"string", validation:{required:true}}
                            ,usrNm:{type:"string", validation:{required:true}}
                            ,empNo:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,dataBound:function (e) {

              var dataItems = e.sender.dataSource.view();

              for (var j=0; j < dataItems.length; j++) {

                delete  dataItems[j]["usrPw"];

              }

            }
            ,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,pageable:false
            ,height:280
            ,columns:[
                {field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:80 ,attributes:{"class":"ac"}}
                ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:150}
                ,{field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:150}
                ,{title:""}
            ]

        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>










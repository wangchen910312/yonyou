<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">

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
                <col style="width:17%;">
                <col style="width:24%;">
                <col style="width:17%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.empNo" /></th>
                    <td>
                        <input id="sEmpNo" name="sEmpNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.receiveNm" /></th>
                    <td>
                        <input id="sUsrNm" name="sUsrNm" class="form_input">
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
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
         var popupWindow = parent.issueReceivePopupButtonWindow;
         var options = popupWindow.options.content.data;


        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            //$("#btnSelect").click();
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

                if(rows.length == 0){
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                var data = [];
                $.each(rows, function(idx, row){
                    //data.push({ flag:"Y", receiveNm:grid.dataItem(row).usrNm});
                    data.push(grid.dataItem(row));
                });

                console.log("receive data 1 : ", data);
                var retData = { flag:"Y", receiveNm:data[0].usrId};
                console.log("receive data 2 : ", retData);
                options.callbackFunc(retData);
                parent.issueReceivePopupButtonWindow.close();

            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.usrId) {
            $("#sUsrId").val(options.usrId);
        }

        if (options.usrNm) {
            $("#sUsrNm").val(options.usrNm);
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0628-113101"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectUsersByRoleRecipientes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            //params["recordCountPerPage"] = options.pageSize;
                            //params["pageIndex"] = options.page;
                            //params["firstIndex"] = options.skip;
                            //params["lastIndex"] = options.skip + options.take;
                            //params["sort"] = options.sort;

                            params["sEmpNo"] = $("#sEmpNo").val();
                            params["sUsrNm"] = $("#sUsrNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
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
            ,multiSelectWithCheckbox:false
            ,selectable:options.selectable === "multiple"? "multiple, row":"row"
            ,editable:false
            ,autoBind:false
            ,height:288
            ,pageable:false
            ,sortable:false
            ,columns:[
                {field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:150}
                ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:150}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }else{
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });
</script>

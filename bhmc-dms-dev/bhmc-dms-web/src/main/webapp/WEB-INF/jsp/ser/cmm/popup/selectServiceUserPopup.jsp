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
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.systemId" /></th> <!-- 시스템번호 -->
                    <td>
                        <input id="sUsrId" name="sUsrId" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.empNm" /></th> <!-- 직원이름 -->
                    <td>
                        <input id="sUsrNm" name="sUsrNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.deptCd" /></th> <!-- 부서코드 -->
                    <td>
                        <input id="sDeptCd" name="sDeptCd" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.deptNm" /></th> <!-- 부서명 -->
                    <td>
                        <input id="sDeptNm" name="sDeptNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.tskCd" /></th> <!-- 직무코드 -->
                    <td>
                        <input id="sTskCd" name="sTskCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.tskNm" /></th> <!-- 직무명칭 -->
                    <td>
                        <input id="sTskNm" name="sTskNm" class="form_input">
                    </td>
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
         var popupWindow = parent.$("#userSearchPopupWin").data("kendoWindow");
         var options = popupWindow.options.content.data;


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

                if(rows.length == 0){
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                options.callbackFunc(data);

                if(options["closeAfterSelect"] == true) {
                    popupWindow.close();
                    //parent.userSearchPopupWin.close();
                }
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.usr) {
            $("#sUsrNm").val(options.usrNm);
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

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sUsrId"] = $("#sUsrId").val();
                            params["sUsrNm"] = $("#sUsrNm").val();
                            params["sDeptCd"] = $("#sDeptCd").val();

                            params["sDeptNm"] = $("#sDeptNm").val();
                            params["sTskCd"] = $("#sTskCd").val();
                            params["sTskNm"] = $("#sTskNm").val();

                            params["sEnabledYn"] = "Y";

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                //,pageSize:0
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
            ,selectable:options.selectable === "multiple"? "multiple, row":"row"
            ,editable:false
            ,autoBind:false
            ,appendEmptyColumn:true
            ,height:360
            ,columns:[
                 {field:"usrId", title:"<spring:message code='ser.lbl.systemId' />", width:150}
                ,{field:"usrNm", title:"<spring:message code='ser.lbl.empNm' />", width:150}
                ,{field:"", title:"<spring:message code='ser.lbl.sex' />", width:80}                                // 성별
                ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", width:120}                     // 부서코드
                ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", width:150}                     // 부서명
                ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", width:120}                       // 직무코드
                ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", width:150}                       // 직무명칭
                ,{field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:150,hidden:true}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }else{
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                    <td>
                        <input id="sDlrCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.dlrNm" /></th>
                    <td>
                        <input id="sDlrNm" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.dlrGrpCd" /></th>
                    <td>
                        <input id="sDlrGrpCd" class="form_input" />
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
         var options = parent.dealerSearchPopupWin.options.content.data;
         var autoBind = options.autoBind? options.autoBind:false;


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

                if(rows !== null) {
                    var data = [];
                    $.each(rows, function(idx, row){

                        data.push(grid.dataItem(row));

                    });

                    options.callbackFunc(data);

                    if (options["closeAfterSelect"] == true) {
                        parent.dealerSearchPopupWin.close();
                    }
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.dealerSearchPopupWin.close();
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.dlrCd) {
            $("#sDlrCd").val(options.dlrCd);
            autoBind = true;
        }

        if (options.dlrNm) {
            $("#sDlrNm").val(options.dlrNm);
            autoBind = true;
        }

        if (options.dlrGrpCd) {
            $("#sDlrGrpCd").val(options.dlrGrpCd);
            autoBind = true;
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/cmp/dealer/selectDealers.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sDlrNm"] = $("#sDlrNm").val();
                            params["sDlrGrpCd"] = $("#sDlrGrpCd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"dlrCd"
                        ,fields:{
                            rnum:{type:"number"}
                            ,dlrCd:{ type:"string" }
                            ,dlrNm:{ type:"string" }
                       }
                    }
                }
            }
            ,multiSelectWithCheckbox:options.selectable === "multiple"? true:false
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,pageable: true
            ,height:407
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:250}
                ,{field:"dlrGrpCd", title:"<spring:message code='global.lbl.dlrGrpCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"ownRgstNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:150}
                ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100}
                ,{field:"faxNo", title:"<spring:message code='global.lbl.faxNo' />", width:100}
                ,{field:"callCenTelNo", title:"<spring:message code='global.lbl.callCenTelNo' />", width:100}
                ,{field:"emgcCenTelNo", title:"<spring:message code='global.lbl.emgcCenTelNo' />", width:100}
                ,{field:"serDlrTelNo", title:"<spring:message code='global.lbl.serDlrTelNo' />", width:100}
                ,{field:"salDlrTelNo", title:"<spring:message code='global.lbl.salDlrTelNo' />", width:100}
                ,{title:""}
            ]

        });

        if(autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>










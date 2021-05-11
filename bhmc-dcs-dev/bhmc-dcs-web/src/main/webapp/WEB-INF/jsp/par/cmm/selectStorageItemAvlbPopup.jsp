<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 창고별 부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.strge" /><!-- strge --></span></th>
                        <td class="required_area">
                            <input id="sStrgeCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- strge --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>
    <!-- //창고별 부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var options = parent.searchStorgeItemPopupWindow.options.content.data;

        //giStrgeCdList
        var giStrgeCdList = [];
        <c:forEach var="obj" items="${giStrgeCdList}">
        giStrgeCdList.push({
            "strgeCd":"${obj.strgeCd}"
            ,"strgeNm":"${obj.strgeNm}"
        });
        </c:forEach>

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

                if(rows !== null){
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                    if(options.autoClose){
                        parent.searchStorgeItemPopupWindow.close();
                    }
                }
            }
        });


        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"strgeNm"
            ,dataValueField:"strgeCd"
            ,dataSource:giStrgeCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });

        $("#sStrgeCd").data("kendoExtDropDownList").value(options.strgeCd);
        $("#sStrgeCd").data("kendoExtDropDownList").enable(false);

        /************************************************************
                    그리드 설정
        *************************************************************/

        //grid
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockInOut/selectStockInOutList.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            //strgeCd
                            var sStrgeCd = $("#sStrgeCd").val() == "" ? "X":$("#sStrgeCd").val();
                            params["sStrgeCd"] = sStrgeCd;
                            params["sItemCd"] = $("#sItemCd").val()

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"locId"
                        ,fields:{
                            rnum:{ type:"number" }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,locId:{ type:"string" , validation:{required:true} }
                            ,pltCd:{ type:"string" , validation:{required:true} }
                            ,strgeCd:{ type:"string" , validation:{required:true} }
                            ,lvlId:{ type:"number" , validation:{required:true}, editable:false }
                            ,locCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,dbLocCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,locNm:{ type:"string" , validation:{required:true} }
                            ,upperLocId:{ type:"string" , editable:false }
                            ,lmtMngYn:{ type:"string", defaultValue:"Y", editable:true }
                            ,mainLocYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,lastLvlYn:{ type:"string" , defaultValue:"Y", editable:false }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,unitCd:{ type:"string" }
                            ,maxQty:{ type:"number" , editable:false}
                            ,remark:{ type:"string" }
                            ,upperLvlId:{ type:"number" , validation:{required:true}, editable:false }
                            ,baseAvlbStockQty:{ type:"number" , editable:false}
                            ,avlbStockQty:{ type:"number" , editable:false}
                            ,resvStockQty:{ type:"number" , editable:false}
                            ,clamStockQty:{ type:"number" , editable:false}
                            ,dbYn:{ type:"string" , defaultValue:"N" }
                            ,lgthCnt:{ type:"number" }
                            ,cdTp:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,sortable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                { field:"rnum", title:"No", width:50}
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.mgrItemCd'/>", width:120}
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{ field:"unitCd", title:"<spring:message code='par.lbl.unit'/>", width:50}
                ,{ field:"baseAvlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", width:120, attributes:{"class":"ar"}}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

 </script>


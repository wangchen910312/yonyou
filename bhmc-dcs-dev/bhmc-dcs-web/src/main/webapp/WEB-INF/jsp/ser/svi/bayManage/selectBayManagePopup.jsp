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
                    <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></th>
                    <td>
                        <input id="sBayNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayMngNm" /><%-- BAY 관리자 --%></th>
                    <td>
                        <input id="sAdmSaNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

    //공통코드:BAY상세구분
    var bayTpCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${bayTpCdList}">
    bayTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var bayTpCdArr = dms.data.arrayToMap(bayTpCdList, function(obj){return obj.cmmCd});

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.bayManagePopup.options.content.data;


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
                    parent.bayManagePopup.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.bayManagePopup.close();
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
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = $("#dlrCd").val();
                            params["sBayNo"] = $("#sBayNo").val();
                            params["sAdmSaNm"] = $("#sAdmSaNm").val();

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
                           rnum:{type:"number"}
                           ,bayNo:{ type:"string" }
                           ,dlrCd:{ type:"string" }
                           ,bayNm:{ type:"string" }
                           ,rpirTp:{ type:"string" }
                           ,modNm:{ type:"string" }
                           ,bayTp:{ type:"string" }
                           ,bayTpNm:{ type:"string" }
                           ,useYn:{ type:"string" }
                           ,strgeCd:{ type:"string" }
                           ,strgeNm:{ type:"string" }
                           ,admSaId:{ type:"string" }
                           ,admSaNm:{ type:"string" }
                           ,vrYn:{ type:"string" }
                      }
                   }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:280
            ,columns:[
                {field:"bayTp"
                 ,title:"<spring:message code='ser.lbl.gubun' />", width:80      // 구분
                 ,template:"#=bayTpCdGrid(bayTp)#"
                }
                ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:60}
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.dtiInfo' />", width:100}
                ,{field:"admSaNm", title:"<spring:message code='ser.lbl.bayMngNm' />", width:100}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        // BAY 구분
        bayTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = bayTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }
    });
</script>










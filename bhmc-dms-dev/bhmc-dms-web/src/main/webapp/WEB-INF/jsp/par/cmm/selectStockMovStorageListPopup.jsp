<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 재고이동 팝업 -->
    <section id="windows" class="pop_wrap">
    <div id="resizableContainer">

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
                    <col style="width:15%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:50%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.otherGiTp" /><!-- 기타출고유형 --></th>
                        <td>
                            <input id="sMvtTp" readonly data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.strgeMoveDocNo" /><!-- 재고이동번호 --></th>
                        <td>
                            <input type="text" id="sEtcGiDocNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>

    </div>
    </section>
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.stockMovStorageListPopupWindow.options.content.data,
             mvtTpList = [],
             mvtTpObj = {};

         mvtTpList.push({cmmCd:options.mvtTp, cmmCdNm:options.mvtTpNm});
         mvtTpObj[options.mvtTp] = options.mvtTpNm;

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
                }
            }
        });

        //기타출고유형선택
        $("#sMvtTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        $("#sMvtTp").data("kendoExtDropDownList").value(options.mvtTp);
        $("#sMvtTp").data("kendoExtDropDownList").enable(false);

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0928-185001"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockMovement/selectStockMovStorageByCondition.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sMvtTp"] = $("#sMvtTp").data("kendoExtDropDownList").value();
                            params["sEtcGiDocNo"] = $("#sEtcGiDocNo").val();
                            params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    ,total:"total"
                    ,model:{
                        id:"etcGiDocNo"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,etcGiDocNo:{ type:"string" }
                            ,statCd:{ type:"string" }
                            ,itemCnt:{ type:"number" }
                            ,itemQty:{ type:"number" }
                            ,mvtTp:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,remark:{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,height:280
            ,columns:[
                {field:"etcGiDocNo" ,title:"<spring:message code='par.lbl.strgeMoveDocNo' />" ,width:120}//기타출고현황번호
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.itemCnt' />" ,attributes:{ "class":"ar"} ,width:100}//품목수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.itemQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}", decimal:2 ,width:100}//품목수량
                ,{field:"mvtTp" ,title:"<spring:message code='par.lbl.otherGiTp' />" ,width:160
                    ,template:'#= changeMvtTp(mvtTp)#'
                }//기타출고유형
                ,{field:"regDt" ,title:"<spring:message code='par.lbl.regDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "class":"ac"}
                    ,width:90
                }//등록일
            ]
        });

        if(options.etcGiDocNo != ""){
            $("#sEtcGiDocNo").val(options.etcGiDocNo);
        }

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //기타출고유형
        changeMvtTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = mvtTpObj[val];
            }
            return returnVal;
        };

    });

 </script>


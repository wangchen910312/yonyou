<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col style="width:15%;">
                    <col style="width:35%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <input id="sItemCd" class="form_input">
                            <input id="sDlrCd" class="hidden" disabled="disabled">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.salePrcTp" /><!-- 판매단가유형 --></th>
                        <td>
                            <input id="sPrcTp" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
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
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.itemSalePrcPopupWindow.options.content.data,
             abcIndList          = [],
             abcIndObj           = {},
             prcTpList           = [],
             prcTpObj            = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             sItemDstinCd;

         abcIndList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         carlineCdList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
         </c:forEach>

         prcTpList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${prcTpList}" varStatus="status">
             prcTpList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>
         console.log('options:',options);

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
                }
            }
        });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:abcIndList
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
           ,index:0
       });

        $("#sPrcTp").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:prcTpList
           ,index:0
       });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정
        if(options.hasOwnProperty("prcTp")){
            $("#sPrcTp").data("kendoExtDropDownList").value(options.prcTp);
        }else{
            $("#sPrcTp").data("kendoExtDropDownList").value("01");
        }

        if(options.hasOwnProperty("itemDstinCd")){
            sItemDstinCd = options.itemDstinCd;
        }else{
            sItemDstinCd = null;
        }

        $("#sPrcTp").data("kendoExtDropDownList").enable(false);

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectItemSalePrcPopupByCondition.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 품목구분코드.
                            params["sDlrCd"]        = $("#sDlrCd").val();
                            params["sItemCd"]       = $("#sItemCd").val();
                            params["sItemNm"]       = $("#sItemNm").val();
                            params["sAbcInd"]       = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]    = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sPrcTp"]        = $("#sPrcTp").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]  = sItemDstinCd;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"itemCd"
                        , fields:{
                              dlrCd        :{ type:"string" }
                            , itemCd       :{ type:"string" }
                            , itemNm       :{ type:"string" }
                            , stockUnitCd  :{ type:"string" }
                            , prcTp        :{ type:"string" }
                            , salePrcAmt   :{ type:"number" }
                            , abcInd       :{ type:"string" }
                            , carlineCd    :{ type:"string" }
                            , purcLeadHm   :{ type:"number" }
                            , grStrgeCd    :{ type:"string" }
                            , giStrgeCd    :{ type:"string" }
                            , avlbStockQty :{ type:"number" }
                            , movingAvgPrc :{ type:"number" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,height:280
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:110 }                //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:180 }                //부품명
                ,{field:"stockUnitCd"
                     ,title:"<spring:message code='par.lbl.unitNm' />"
                     ,width:180
                     ,hidden:true}                //단위
                ,{field:"salePrcAmt"
                     ,title:"<spring:message code='par.lbl.salePrcAmt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,width:100 }                //판매단가
                ,{field:"movingAvgPrc"
                     ,title:"<spring:message code='par.lbl.movingAvgPrc' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,width:100
                     ,hidden:true}                //이동평균단가
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,template:'#= changeAbcInd(abcInd)#'
                     ,width:80 }                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:120 }
                ,{field:"purcLeadHm"
                     ,title:"<spring:message code='par.lbl.purcLeadHm' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:100
                     ,hidden:true}                //구매리드타임
                ,{field:"grStrgeCd"
                     ,title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:100
                     ,hidden:true}                //입고창고
                ,{field:"giStrgeCd"
                     ,title:"<spring:message code='par.lbl.giStrgeCd' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:100
                     ,hidden:true}                //출고창고
                ,{field:"avlbStockQty"
                     ,title:"<spring:message code='par.lbl.avlbStock' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:100}                //가용수량
                ,{title:""}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        // 차형
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = carlineCdObj[val];
            }
            return returnVal;
        };

        $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>


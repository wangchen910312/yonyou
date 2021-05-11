<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 부품선택 팝업 -->
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
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                            <input id="sItemDstinCd" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemGrpCd" /><!-- 품목그룹 --></th>
                        <td>
                            <input id="sItemGrpCd" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
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
    </section>
    <!-- //부품선택 팝업 -->
</div>
 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.searchItemPopupWindow.options.content.data,
             itemDstinCdList     = [],
             itemDstinCdObj      = {},
             itemGrpCdObj        = {},
             abcIndList          = [],
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             urlInfo             = "<c:url value='/par/cmm/selectSearchItemPopupByCondition.do' />",
             sStrgeCd;


         <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
             if("${obj.useYn}" !== 'N'){
                 itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                 itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
             }
         </c:forEach>

         <c:forEach var="obj" items="${itemGroupList}">
             if(itemGrpCdObj.hasOwnProperty("${obj.itemDstinCd}")){
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
             }else{
                 itemGrpCdObj["${obj.itemDstinCd}"] = [];
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:" ", cmmCdNm:"ALL"});
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
             }
         </c:forEach>

         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({abcCd:"${obj.cmmCd}", abcCdNm:"${obj.cmmCd}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCd}";
         </c:forEach>

         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({carlineCd:"${obj.carlineCd}", carlineNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
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

                if(rows !== null)
                {
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                    if(options.autoClose){
                        parent.searchItemPopupWindow.close();
                    }
                }
            }
        });

        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:itemDstinCdList
            ,index:0
        });

        $("#sItemGrpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:[]
            ,index:0
        });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndList
            ,index:0
        });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,optionLabel:" "
            ,dataSource:carlineCdList
            ,index:0
        });

        $("#sItemDstinCd").on("change", function (){
            $("#sItemGrpCd").data("kendoExtDropDownList").setDataSource(itemGrpCdObj[$(this).data("kendoExtDropDownList").value()]);
            $("#sItemGrpCd").data("kendoExtDropDownList").value(' ');
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정
        $("#sItemCd").val(options.itemCd);
        $("#sItemNm").val(options.itemNm);
        sStrgeCd = options.strgeCd;

        if(dms.string.isEmpty(options.itemDstinCd)){
            options.itemDstinCd = '';
        }else{
            $("#sItemDstinCd").data("kendoExtDropDownList").value(options.itemDstinCd);
            $("#sItemDstinCd").data("kendoExtDropDownList").enable(false);
        }

        if(dms.string.isEmpty(options.parentTp)){
            urlInfo = "<c:url value='/par/cmm/selectSearchItemPopupByCondition.do' />";
        }else{
            if(options.parentTp === "QNA"){
                urlInfo = "<c:url value='/par/cmm/selectSearchItemPopupByQnACondition.do' />";
                //$("#grid").data("kendoExtGrid").hideColumn('avlbStockQty');
            }else{
                urlInfo = "<c:url value='/par/cmm/selectSearchItemPopupByCondition.do' />";
            }

        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-185402"
            ,dataSource:{
                transport:{
                    read:{
                        url:urlInfo//"<c:url value='/par/cmm/selectSearchItemPopupByCondition.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                itemGrpCdValue = $("#sItemGrpCd").data("kendoExtDropDownList").value();


                            if(dms.string.isEmpty(itemGrpCdValue)){
                                itemGrpCdValue = '';
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 품목구분코드.
                            params["sItemCd"]          = $("#sItemCd").val();
                            params["sItemNm"]          = $("#sItemNm").val();
                            params["sItemDstinCd"]     = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sItemGrpCd"]       = itemGrpCdValue;
                            params["sAbcInd"]          = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]       = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            //params["sStrgeCd"]         = sStrgeCd;
                            params["sAvlbStockQtyZeroYn"] = "N";    //가용수량 > 0

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
                            , bpCd         :{ type:"string" }
                            , bpNm         :{ type:"string" }
                            , itemCd       :{ type:"string" }
                            , itemNm       :{ type:"string" }
                            , stockUnitCd  :{ type:"string" }
                            , itemDstinCd  :{ type:"string" }
                            , itemGrpCd    :{ type:"string" }
                            , itemGrpNm    :{ type:"string" }
                            , abcInd       :{ type:"string" }
                            , carlineCd    :{ type:"string" }
                            , purcLeadHm   :{ type:"number" }
                            , grStrgeCd    :{ type:"string" }
                            , avlbStockQty :{ type:"number" }
                            , movingAvgPrc :{ type:"number" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:280
            ,columns:[
                 {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105 ,hidden:true}           //딜러 코드
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105 ,hidden:true}             //거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpNm' />" ,width:105 ,hidden:true}             //거래처명
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:110 }                     //부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:180 }                     //부품명
                ,{field:"stockUnitCd" ,title:"<spring:message code='par.lbl.unitNm' />" ,width:180 ,hidden:true}    //단위
                ,{field:"itemDstinCd" ,title:"<spring:message code='par.lbl.itemDstinCd' />" ,width:80
                    ,template:'#= changeItemDstinCd(itemDstinCd)#'
                }//품목구분
                ,{field:"itemGrpCd" ,title:"<spring:message code='par.lbl.itemGrpCd' />" ,width:100 ,hidden:true}   //품목그룹
                ,{field:"itemGrpNm" ,title:"<spring:message code='par.lbl.itemGrpCd' />" ,width:100}                //품목그룹
                ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd' />" ,width:80 }                      //ABC CLASS
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />" ,width:80
                    ,template:'#= changeCarlineCd(carlineCd)#'
                }
                ,{field:"purcLeadHm" ,title:"<spring:message code='par.lbl.purcLeadHm' />" ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,width:100 ,hidden:true}//구매리드타임
                ,{field:"grStrgeCd" ,title:"<spring:message code='par.lbl.grStrgeCd' />" ,attributes:{ "class":"ar"} ,width:100 ,hidden:true}//입고창고
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.movingAvgPrc' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//이동평균단가
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:80 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0}//가용수량
            ]
        });

        //  품목구분
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
            }
            return returnVal;
        };

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

        if(!dms.string.isEmpty(options.parentTp)){
            if(options.parentTp === "QNA"){
                $("#grid").data("kendoExtGrid").hideColumn('avlbStockQty');
            }else{
                $("#grid").data("kendoExtGrid").showColumn('avlbStockQty');
            }

        }else{
            $("#grid").data("kendoExtGrid").showColumn('avlbStockQty');
        }
    });

 </script>


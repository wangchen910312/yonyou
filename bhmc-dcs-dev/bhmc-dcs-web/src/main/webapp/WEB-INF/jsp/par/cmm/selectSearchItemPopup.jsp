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
                            <input id="sItemCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                            <input id="sItemDstinCd" type="text" data-type="combo" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemGrpCd" /><!-- 품목그룹 --></th>
                        <td>
                            <input id="sItemGrpCd" type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox">
                        </td>
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
         var options = parent.searchItemPopupWindow.options.content.data,
             itemDstinCdList     = [],
             itemDstinCdObj      = {},
             itemGrpCdObj        = {},
             abcIndList          = [],
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             sStrgeCd;

         var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":""}];
         <c:forEach var="obj" items="${itemDstinCdList}">
         itemDstinCdList.push({
             "cmmCd":"${obj.cmmCd}"
             ,"cmmCdNm":"${obj.cmmCdNm}"
         });
         </c:forEach>

         for(var i = 0, itemDstinCdLen = itemDstinCdList.length; i < itemDstinCdLen; i = i + 1){
             itemDstinCdObj[itemDstinCdList[i].cmmCd] = itemDstinCdList[i].cmmCdNm;
         }

         <c:forEach var="obj" items="${itemGroupList}">
             if(itemGrpCdObj.hasOwnProperty("${obj.itemDstinCd}")){
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
             }else{
                 itemGrpCdObj["${obj.itemDstinCd}"] = [];
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:" ", cmmCdNm:"ALL"});
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
             }
         </c:forEach>

         abcIndList.push({abcCd:"", abcCdNm:"ALL"});
         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({abcCd:"${obj.abcCd}", abcCdNm:"${obj.abcCd}"});
             abcIndObj["${obj.abcCd}"] = "${obj.abcCd}";
         </c:forEach>

         carlineCdList.push({carlineCd:"", carlineNm:"ALL"});
         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({carlineCd:"${obj.carlineCd}", carlineNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
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
                    if(options.autoClose){
                        parent.searchItemPopupWindow.close();
                    }
                }
            }
        });


        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:itemDstinCdList
           ,index:0
       });

        $("#sItemGrpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:[]
           ,index:0
       });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
           ,dataValueField:"abcCd"
           ,dataSource:abcIndList
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,index:0
       });

        $("#sItemDstinCd").on("change", function (){
            console.log('itemDstinCd Change:',$(this).data("kendoExtDropDownList").value());
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

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectSearchItemPopupByCondition.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
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
                            params["sStrgeCd"]         = sStrgeCd;

                            console.log('params:',params);
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
            ,height:280
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.bpNm' />"
                     ,width:105
                     ,hidden:true}  //거래처명
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
                ,{field:"itemDstinCd"
                     ,title:"<spring:message code='par.lbl.itemDstinCd' />"
                     ,template:'#= changeItemDstinCd(itemDstinCd)#'
                     ,width:80 }                //품목구분
                ,{field:"itemGrpCd"
                     ,title:"<spring:message code='par.lbl.itemGrpCd' />"
                     ,width:100
                     ,hidden:true}                //품목그룹
                ,{field:"itemGrpNm"
                     ,title:"<spring:message code='par.lbl.itemGrpCd' />"
                     ,width:100 }                //품목그룹
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,width:80 }                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:80 }
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
                     ,hidden:true}
                , {   //이동평균단가
                    title:"<spring:message code='par.lbl.movingAvgPrc' />"
                   ,field:"movingAvgPrc"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }//입고창고
                ,{field:"avlbStockQty"
                     ,title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                 }//가용수량
                ,{title:""}
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
    });

 </script>


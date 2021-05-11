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
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:24%;">
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
                        <th scope="row"><spring:message code="par.lbl.salePrcTp" /><!-- 판매단가유형 --></th>
                        <td>
                            <input id="sPrcTp" data-type="combo" class="form_comboBox">
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
             abcIndList = [],
             abcIndObj = {},
             prcTpList = [],
             prcTpObj = {},
             carlineCdList = [],
             carlineCdObj = {},
             giStrgeCdList = [],
             giStrgeTpObj = {},
             useYnObj = {},
             sItemDstinCd;

         //useYnList
         <c:forEach var="obj" items="${useYnList}">
             useYnObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
         </c:forEach>

         <c:forEach var="obj" items="${prcTpList}" varStatus="status">
             prcTpList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

        //giStrgeCdList
        giStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${giStrgeCdList}">
            giStrgeCdList.push({"strgeCd":"${obj.strgeCd}" ,"strgeNm":"${obj.strgeNm}"});
            giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
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
                        //종료된 부품인 경우
                        //if(grid.dataItem(row).endChk === 'N'){
                        //    var itemInfo = grid.dataItem(row).itemCd + '[' + grid.dataItem(row).itemNm + '] ' + '[' + giStrgeTpObj[grid.dataItem(row).giStrgeCd] + '] ' + "<spring:message code='par.lbl.useYn'/>";
                        //    dms.notification.warning("<spring:message code='global.info.confirmMsgParam' arguments='" + itemInfo + "'/>");
                        //}else{
                            data.push(grid.dataItem(row));
                        //}
                    });

                    options.callbackFunc(data);

                    if(options.selectable == "single"){
                        parent.itemSalePrcPopupWindow.close();
                    }
                }
            }
        });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:abcIndList
           ,optionLabel:" "
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           ,index:0
       });

        $("#sPrcTp").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:prcTpList
           ,optionLabel:" "
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
            gridId:"G-PAR-0803-145901"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectItemSalePrcPopupByCondition.do' />"
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

                            // 품목구분코드.
                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sAbcInd"] = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sPrcTp"] = $("#sPrcTp").data("kendoExtDropDownList").value();

                            params["sItemDstinCd"] = sItemDstinCd;

                            if(sItemDstinCd === "07"){//부품유형 : 공구일때만(세금공제보증가격 0 이상 여부 사용안함)
                                params["sTaxDdctGrtePrcOverZeroUseYn"] = "N";
                            }

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
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,stockUnitCd:{ type:"string" }
                            ,prcTp:{ type:"string" }
                            ,salePrcAmt:{ type:"number" }
                            ,abcInd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,purcLeadHm:{ type:"number" }
                            ,grStrgeCd:{ type:"string" }
                            ,giStrgeCd:{ type:"string" }
                            ,avlbStockQty:{ type:"number" }
                            ,movingAvgPrc:{ type:"number" }
                            ,endChk:{ type:"string" }
                            ,stockQty:{ type:"number" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //empty column. default:false
            ,height:280
            ,multiSelectWithCheckbox:true
            ,columns:[
                { field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:105, hidden:true }//딜러 코드
                ,{ field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />", width:110 }//부품번호
                ,{ field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />", width:170 }//부품명
                ,{ field:"stockUnitCd", title:"<spring:message code='par.lbl.unitNm' />", width:180, hidden:true }//단위
                ,{ field:"salePrcAmt", title:"<spring:message code='par.lbl.salePrcAmt' />", attributes:{ "class":"ar"}, format:"{0:n2}", width:100 }//판매단가
                ,{ field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", attributes:{ "class":"ar"}, format:"{0:n2}", width:100 ,hidden:true }//이동평균단가
                ,{ field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />", attributes:{ "class":"ac"}, width:70 }//ABC CLASS
                ,{ field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />", width:120, template:'#= changeCarlineCd(carlineCd)#' }
                ,{ field:"purcLeadHm", title:"<spring:message code='par.lbl.purcLeadHm' />", attributes:{ "class":"ar"}, format:"{0:n0}", width:100, hidden:true }//구매리드타임
                ,{ field:"grStrgeCd", title:"<spring:message code='par.lbl.strge' />", width:100, hidden:true}//입고창고
                ,{ field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />", width:100, template:'#= changeStrgeCd(giStrgeCd)#' }//출고창고
                ,{ field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }//가용수량
                ,{ field:"endChk", title:"<spring:message code='par.lbl.useYn' />", width:80, template:'#= changeEndChk(endChk)#', attributes:{ "class":"ac"}, hidden:true }//종료여부
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  종료여부
        changeEndChk = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(useYnObj[val])){
                    returnVal = useYnObj[val];
                }
            }
            return returnVal;
        };

        //ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        //carlineCd
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = carlineCdObj[val];
            }
            return returnVal;
        };

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = giStrgeTpObj[val];
            }
            return returnVal;
        };

        $("#grid").data("kendoExtGrid").dataSource.read();
    });
</script>
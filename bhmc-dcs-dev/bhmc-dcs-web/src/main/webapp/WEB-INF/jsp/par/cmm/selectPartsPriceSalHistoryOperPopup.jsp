<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 판매가 히스토리 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.salePriceHistoryTarget" /> --%><!-- 판매가 히스토리 --></h1>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--조회  -->
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:28%;">
                <col style="width:10%;">
                <col style="width:21%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.supplyNm" /><!-- 공급업체명 --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                        <input type="hidden" id="sPriceBpCd" name="sPriceBpCd" />
                        <input id="sBpNm" name="sBpNm" class="form_input" value="${bpNm}" />

                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.regUsrId" /><!-- 생성자ID --></th>
                    <td>
                        <input type="hidden" id="sRegUsrId" name="sRegUsrId" value="" />
                        <input id="sRegUsrNm" name="sRegUsrNm" class="form_input" value="" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분코드 --></th>
                    <td>
                        <input id="sItemDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                    <td>
                        <input id="sItemCd" class="form_input" />
                        <input type="hidden" id="sPriceItemCd" name="sPriceItemCd" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.applyDt" /><!-- 적용일자--></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input data-type="date" id="sApplyStartDt" name="sApplyStartDt" required class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input data-type="date" id="sApplyEndDt" name="sApplyEndDt" required class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.itemCdList" /></h2>
    </div>
    <div class="table_grid">
        <!-- salePrice grid -->
        <div id="grid" ></div>
    </div>

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tabPrice01" class="k-state-active"><spring:message code="par.title.salePrice" /></li>
            <li id="tabPrice02" ><spring:message code="par.title.purcPrice" /></li>
            <li id="tabPrice03" ><spring:message code="par.title.grItemPrice" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 销售价格 -->
        <div>
            <div class="table_grid">
                <div id="gridPrice01" class="grid"></div>
            </div>
        </div>
        <!-- //销售价格 -->

        <!-- 采购价(BMP) -->
        <div>
            <div class="table_grid">
                <div id="gridPrice02" class="grid"></div>
            </div>
        </div>
        <!-- //采购价(BMP) -->

        <!-- 入库价 -->
        <div>
            <div class="table_grid">
                <div id="gridPrice03" class="grid"></div>
            </div>
        </div>
        <!-- //入库价 -->
    </div>

    </section>

</section>
<!-- //구매요청 -->

<!-- script -->
<script>
//unitCdDs
var unitCdDs = [];
<c:forEach var="obj" items="${unitCdDs}">
unitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitNm}"
});
</c:forEach>
var unitCdMap = [];
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});
//partsCarTpDs
var partsCarTpDs = [];
<c:forEach var="obj" items="${partsCarTpDs}">
partsCarTpDs.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//ABC CLASS
var abcIndDs = [];
<c:forEach var="obj" items="${abcIndDs}">
abcIndDs.push({
    "abcCd":"${obj.abcCd}"
    ,"abcCdNm":"${obj.abcCd}"
});
</c:forEach>
//itemDstinCdList
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var itemDstinCdMap = [];
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//salePrcTpList
var salePrcTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//salePrcTpMap
var salePrcTpMap = [];
$.each(salePrcTpList, function(idx, obj){
    salePrcTpMap[obj.cmmCd] = obj.cmmCdNm;
});

    $(document).ready(function() {

        /************************************************************
                팝업옵션 설정
        *************************************************************/
        /**
        * 팝업 옵션
        */
        var options = parent.searchSalPriceHistoryPopupWindow.options.content.data;

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

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                var vBpCd = $("#sBpCd").val();
                var vBpNm = $("#sBpNm").val();
                if(vBpCd === ""){
                    // 공급업체는 필수 입력사항입니다.
                    dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}' />");
                    $("#sBpNm").focus();

                    return false;
                }
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sItemCd").val(options.itemCd);
        $("#sItemNm").val(options.itemNm);

        // 품목코드 focus
        $("#sItemCd").focus();

        // 차종 드랍다운 리스트.
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,optionLabel:" "
            ,dataSource:partsCarTpDs
            ,autoBind:false
            ,index:0
        });

        $("#sCarlineCd").data("kendoExtDropDownList").value(options.carlineCd);

        // ABC Class 드랍다운 리스트.
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndDs
            ,autoBind:false
            ,index:0
        });

        $("#sAbcInd").data("kendoExtDropDownList").value(options.abcInd);

        // 품목구분 드랍다운 리스트.
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,autoBind:false
            ,index:0
        });

        $("#sItemDstinCd").data("kendoExtDropDownList").value(options.itemDstinCd);

        // 적용시작일자
        $("#sApplyStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 적용종료일자
        $("#sApplyEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

     // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        // salePrice grid
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // search area
                            params["sBpCd"] = $("#sBpCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpCd:{ type:"string" ,editable:false}
                            ,bpNm:{ type:"string" ,editable:false}
                            ,lineNo:{ type:"number" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,purcPrc:{ type:"number" , editable:false}
                            ,prcQty:{ type:"number" , editable:false}
                            ,prcQtyUnitCd:{ type:"string" , editable:false}
                            ,startDt:{ type:"date" , editable:false}
                            ,endDt:{ type:"date" , editable:false}
                            ,applyDt:{ type:"date" , editable:false}
                            ,saleTaxRate:{ type:"number" , editable:false}
                            ,delYn:{ type:"string" , editable:false}
                            ,retlPrc:{ type:"number"}
                            ,whslPrc:{ type:"number"}
                            ,incPrc:{ type:"number"}
                            ,grtePrc:{ type:"number"}
                            ,retlAddTaxRate:{ type:"number"}
                            ,whslAddTaxRate:{ type:"number"}
                            ,incAddTaxRate:{ type:"number"}
                            ,grteAddTaxRate:{ type:"number"}
                            ,bmpOpnPrc:{ type:"number" , editable:false}
                            ,rectGiPrc:{ type:"number" , editable:false}
                            ,stdPrc:{ type:"number" , editable:false}
                            ,etcPrc1:{ type:"number" , editable:false}
                            ,etcPrc2:{ type:"number" , editable:false}
                            ,etcPrc3:{ type:"number" , editable:false}
                            ,taxDdctRetlPrc:{ type:"number"}
                            ,taxDdctWhslPrc:{ type:"number"}
                            ,taxDdctIncPrc:{ type:"number"}
                            ,taxDdctGrtePrc:{ type:"number"}
                            ,taxDdctEtcPrc1:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc2:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc3:{ type:"number" , editable:false}
                        }
                    }
                }
            }
            ,height:150
            ,editable:false
            ,autoBind:false
            ,sortable:false
            ,selectable:"row"
            ,multiSelectWithCheckbox:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#sPriceBpCd").val(selectedItem.bpCd);
                    $("#sPriceItemCd").val(selectedItem.itemCd);
                    $("#gridPrice01").data("kendoExtGrid").dataSource.read();
                    $("#gridPrice02").data("kendoExtGrid").dataSource.read();
                    $("#gridPrice03").data("kendoExtGrid").dataSource.data([]);
                }
             }
            ,columns :
                [{ title:"<spring:message code='par.lbl.bpNm' />", field:"bpNm", width:80 }//bpNm
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", width:60 , format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.partsPriceRegUsrId' />", field:"regUsrId", width:60 }//regUsrId
            ]
        });
        //gridPrice01
        $("#gridPrice01").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            // search area

                            params["sBpCd"] = $("#sPriceBpCd").val();
                            params["sItemCd"] = $("#sPriceItemCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpCd:{ type:"string" ,editable:false}
                            ,bpNm:{ type:"string" ,editable:false}
                            ,lineNo:{ type:"number" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,purcPrc:{ type:"number" , editable:false}
                            ,prcQty:{ type:"number" , editable:false}
                            ,prcQtyUnitCd:{ type:"string" , editable:false}
                            ,startDt:{ type:"date" , editable:false}
                            ,endDt:{ type:"date" , editable:false}
                            ,applyDt:{ type:"date" , editable:false}
                            ,saleTaxRate:{ type:"number" , editable:false}
                            ,delYn:{ type:"string" , editable:false}
                            ,retlPrc:{ type:"number"}
                            ,whslPrc:{ type:"number"}
                            ,incPrc:{ type:"number"}
                            ,grtePrc:{ type:"number"}
                            ,retlAddTaxRate:{ type:"number"}
                            ,whslAddTaxRate:{ type:"number"}
                            ,incAddTaxRate:{ type:"number"}
                            ,grteAddTaxRate:{ type:"number"}
                            ,bmpOpnPrc:{ type:"number" , editable:false}
                            ,rectGiPrc:{ type:"number" , editable:false}
                            ,stdPrc:{ type:"number" , editable:false}
                            ,etcPrc1:{ type:"number" , editable:false}
                            ,etcPrc2:{ type:"number" , editable:false}
                            ,etcPrc3:{ type:"number" , editable:false}
                            ,taxDdctRetlPrc:{ type:"number"}
                            ,taxDdctWhslPrc:{ type:"number"}
                            ,taxDdctIncPrc:{ type:"number"}
                            ,taxDdctGrtePrc:{ type:"number"}
                            ,taxDdctEtcPrc1:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc2:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc3:{ type:"number" , editable:false}
                        }
                    }
                }
            }
            ,height:196
            ,editable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", width:80 ,format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.purcPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.purcPriceTax' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPriceTax
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
            ]
        });
        //gridPrice02
        $("#gridPrice02").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetHistorys.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            // search area

                            params["sBpCd"] = $("#sPriceBpCd").val();
                            params["sItemCd"] = $("#sPriceItemCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpCd:{ type:"string" ,editable:false}
                            ,bpNm:{ type:"string" ,editable:false}
                            ,lineNo:{ type:"number" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,purcPrc:{ type:"number" , editable:false}
                            ,prcQty:{ type:"number" , editable:false}
                            ,prcQtyUnitCd:{ type:"string" , editable:false}
                            ,startDt:{ type:"date" , editable:false}
                            ,endDt:{ type:"date" , editable:false}
                            ,applyDt:{ type:"date" , editable:false}
                            ,saleTaxRate:{ type:"number" , editable:false}
                            ,delYn:{ type:"string" , editable:false}
                            ,retlPrc:{ type:"number"}
                            ,whslPrc:{ type:"number"}
                            ,incPrc:{ type:"number"}
                            ,grtePrc:{ type:"number"}
                            ,retlAddTaxRate:{ type:"number"}
                            ,whslAddTaxRate:{ type:"number"}
                            ,incAddTaxRate:{ type:"number"}
                            ,grteAddTaxRate:{ type:"number"}
                            ,bmpOpnPrc:{ type:"number" , editable:false}
                            ,rectGiPrc:{ type:"number" , editable:false}
                            ,stdPrc:{ type:"number" , editable:false}
                            ,etcPrc1:{ type:"number" , editable:false}
                            ,etcPrc2:{ type:"number" , editable:false}
                            ,etcPrc3:{ type:"number" , editable:false}
                            ,taxDdctRetlPrc:{ type:"number"}
                            ,taxDdctWhslPrc:{ type:"number"}
                            ,taxDdctIncPrc:{ type:"number"}
                            ,taxDdctGrtePrc:{ type:"number"}
                            ,taxDdctEtcPrc1:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc2:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc3:{ type:"number" , editable:false}
                        }
                    }
                }
            }
            ,height:196
            ,editable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", width:80 ,format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:70
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
                ,{ title:"<spring:message code='par.lbl.purcPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.grRecentPrice' />", field:"rectGiPrc", attributes:{"class":"ar"}, width:70 }//grRecentPrice
                ,{ title:"<spring:message code='par.lbl.bmpBasePrice' />", field:"bmpOpnPrc", attributes:{"class":"ar"}, width:90 }//bmpBasePrice
                ,{ title:"<spring:message code='par.lbl.basePrice' />", field:"stdPrc", attributes:{"class":"ar"}, width:70 }//basePrice
                ,{ title:"<spring:message code='par.lbl.salePriceCost01' />", headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"retlPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    },{
                        field:"retlAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                    }]
                }
                ,{ title:"<spring:message code='par.lbl.salePriceCost02' />", headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"whslPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    },{
                        field:"whslAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                    }]
                }
                ,{  title:"<spring:message code='par.lbl.salePriceCost03' />", headerAttributes:{ "class":"hasBob" }
                    ,columns:[{
                        field:"incPrc"
                        ,title:"<spring:message code='par.lbl.salePrice' />"
                        ,width:60
                        ,format:"{0:n2}"
                        ,attributes:{"class":"ar"}
                    },{
                        field:"incAddTaxRate"
                        ,title:"<spring:message code='par.lbl.subMarkUp' />"
                        ,width:70
                        ,attributes:{"class":"ar"}
                    }]
                }
                ,{  field:"grtePrc" ,title:"<spring:message code='par.lbl.salePriceCost04' />", width:70, format:"{0:n2}", attributes:{"class":"ar"} }//basePrice
            ]
        });
        //gridPrice03
        $("#gridPrice03").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            // search area

                            params["sBpCd"] = $("#sPriceBpCd").val();
                            params["sItemCd"] = $("#sPriceItemCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,bpCd:{ type:"string" ,editable:false}
                            ,bpNm:{ type:"string" ,editable:false}
                            ,lineNo:{ type:"number" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,purcPrc:{ type:"number" , editable:false}
                            ,prcQty:{ type:"number" , editable:false}
                            ,prcQtyUnitCd:{ type:"string" , editable:false}
                            ,startDt:{ type:"date" , editable:false}
                            ,endDt:{ type:"date" , editable:false}
                            ,applyDt:{ type:"date" , editable:false}
                            ,saleTaxRate:{ type:"number" , editable:false}
                            ,delYn:{ type:"string" , editable:false}
                            ,retlPrc:{ type:"number"}
                            ,whslPrc:{ type:"number"}
                            ,incPrc:{ type:"number"}
                            ,grtePrc:{ type:"number"}
                            ,retlAddTaxRate:{ type:"number"}
                            ,whslAddTaxRate:{ type:"number"}
                            ,incAddTaxRate:{ type:"number"}
                            ,grteAddTaxRate:{ type:"number"}
                            ,bmpOpnPrc:{ type:"number" , editable:false}
                            ,rectGiPrc:{ type:"number" , editable:false}
                            ,stdPrc:{ type:"number" , editable:false}
                            ,etcPrc1:{ type:"number" , editable:false}
                            ,etcPrc2:{ type:"number" , editable:false}
                            ,etcPrc3:{ type:"number" , editable:false}
                            ,taxDdctRetlPrc:{ type:"number"}
                            ,taxDdctWhslPrc:{ type:"number"}
                            ,taxDdctIncPrc:{ type:"number"}
                            ,taxDdctGrtePrc:{ type:"number"}
                            ,taxDdctEtcPrc1:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc2:{ type:"number" , editable:false}
                            ,taxDdctEtcPrc3:{ type:"number" , editable:false}
                        }
                    }
                }
            }
            ,height:196
            ,editable:false
            ,autoBind:false
            ,selectable:"multiple"
            ,pageable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.grDt' />", field:"applyDt", width:80 ,format:"{0:<dms:configValue code='dateFormat' />}"}//applyDt
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:110 }//itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:120 }//itemNm
                ,{ title:"<spring:message code='par.lbl.grItemPriceTax' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.grItemPrice' />", field:"purcPrc", attributes:{"class":"ar"}, width:70 }//purcPrc
                ,{ title:"<spring:message code='par.lbl.bpNm' />", field:"bpNm", width:70 }//bpNm
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }//carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:60 }//abcInd
            ]
        });

    });
</script>
<!-- //script -->


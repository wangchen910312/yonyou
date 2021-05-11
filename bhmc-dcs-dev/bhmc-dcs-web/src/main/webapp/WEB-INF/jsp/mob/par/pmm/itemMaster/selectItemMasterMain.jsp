<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="par.title.itemMasterList" /><!-- 품목마스터 목록 --></h2>
            </div>
            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="global.lbl.itemCd" /><!-- 품목코드 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.itemNm" /><!-- 품목명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="par.lbl.spyrCd" /><!-- 공급상 --></span></th>
                                <td><span  name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="global.lbl.itemCd" /><!-- 품목코드 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="global.lbl.itemNm" /><!-- 품목명 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.spyrCd" /><!-- 공급상 --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.itemMasterSearchCondition" /><!-- 품목마스터 조회조건  --></h2>
        </div>
       <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.itemCd" /><!-- 품목번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sItemCd" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.itemNm" /><!-- 품목명 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sItemNm" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                            <td>
                                <div class="f_text"><input id="sItemDstinCd" type="text" class="form_combo"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- 로컬여부 --></th>
                            <td>
                                <div class="f_text"><input id="sSpyrCd" type="text" class="form_combo" /></div>
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">

            <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.title.itemMasterInfo" /><!-- 품목마스터 정보 --></h2>
                <div class="title_btn"><span class="co_open"><span></span></span></div>
            </div>
            <div class="co_view" style="">

            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.itemCd" /><!-- 품목번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.itemNm" /><!-- 품목명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemNm" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemDstinCd" type="text"  disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemGrpCd" /><!-- 품목그룹 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemGrpCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.brand" /><!-- 브랜드 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="brandCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- 로컬여부 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="spyrCd" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="global.lbl.engNm" /><!-- 영문명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemEnNm" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.endYn" /><!-- 부품단종 --></th>
                            <td>
                                <input type="checkbox" id="endYn" name="endYn" class="f_check" data-type="checkbox" disabled="disabled"/><label for="endYn"></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="carlineCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.startDt" /><!-- 유효시작일 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="startDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.endDt" /><!-- 유효종료일 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="endDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.oldRplcItemCd" /><!-- 구형대체부품번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="oldRplcItemCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.oldRplcParCmptYn" /><!-- 구형부품호환여부 --></th>
                            <td>
                                <input type="checkbox" id="oldRplcParCmptYn" name="oldRplcParCmptYn" class="f_check" data-type="checkbox" disabled="disabled"/><label for="oldRplcParCmptYn"></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.newRplcItemCd" /><!-- 신규대체부품번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="newRplcItemCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.newRplcParCmptYn" /><!-- 신규부품호환여부 --></th>
                            <td>
                                <input type="checkbox" id="newRplcParCmptYn" name="newRplcParCmptYn" class="f_check" data-type="checkbox" disabled/><label for="newRplcParCmptYn"></label>
                                <!--
                                <input type="checkbox" id="newRplcParCmptYn" name="newRplcParCmptYn" data-type="checkbox" disabled/>
                                -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.sucCd" /><!-- SUC --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="sucCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.lastCmptItemCd" /><!-- 최종호환부품 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="lastCmptItemCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.carUseUnitCnt" /><!-- Unit Usage --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="carUseUnitCnt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.mobisImpLocalYnTp" /><!-- Source --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mobisImpLocalYnTp" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.parSpecCd" /><!-- Character code --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parSpecCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.pncCd" /><!-- PNC --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="pncCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="global.title.stockInfo" /><!-- 재고 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="bu_required"><spring:message code="par.lbl.stockUnitCd" /><!-- 재고단위 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stockUnitCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcLeadHm" /><!-- 구매 Lead Time --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcLeadHm" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.minPurcQty" /><!-- 최소구매수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="minPurcQty" type="text" disabled="disabled"/></div>
                            </td>
                        </tr><tr>
                            <th scope="row"><spring:message code="par.lbl.sftyStockQty" /><!-- 안전재고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="sftyStockQty" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stdrdStockQty" /><!-- 적정재고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stdrdStockQty" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stdrdStockApplyRate" /><!-- 적정재고적용률 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stdrdStockApplyRate" type="text" disabled="disabled"/></div>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stdrdStockCalcYn" /><!-- 적정재고산출여부 --></th>
                            <td>
                                <input type="checkbox" id="stdrdStockCalcYn" name="stdrdStockCalcYn" class="f_check" data-type="checkbox" disabled="disabled"/><label for="stdrdStockCalcYn"></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcCqtyCalcYn" /><!-- 구매소요량산출여부 --></th>
                            <td>
                                <input type="checkbox" id="purcCqtyCalcYn" name="purcCqtyCalcYn" class="f_check" data-type="checkbox" disabled="disabled"/><label for="purcCqtyCalcYn"></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.nonMovingFlg" /><!-- Non-Moving 여부 --></th>
                            <td>
                                <input type="checkbox" id="nonMovingFlg" name="nonMovingFlg" class="f_check" data-type="checkbox" disabled="disabled"/><label for="nonMovingFlg"></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stockPrsnNm" /><!-- 재고담당자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stockPrsnId" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcPrsnNm" /><!-- 구매담당자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcPrsnId" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="grStrgeCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giStrgeCd" /><!-- 출고창고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="giStrgeCd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="abcInd" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.mm3AvgDmndQty" /><!-- 3개월평균수요량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mm3AvgDmndQty" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.mm6AvgDmndQty" /><!-- 6개월평균수요량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mm6AvgDmndQty" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.mm12AvgDmndQty" /><!-- 12개월평균수요량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mm12AvgDmndQty" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.lastGrDt" /><!-- 최종입고일 --></th>
                            <td class="readonly_area">
                                <div class="f_text f_disabled"><input id=lastGrDt type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.lastGiDt" /><!-- 최종출고일 --></th>
                            <td class="readonly_area">
                                <div class="f_text f_disabled"><input id="lastGiDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="par.title.stockStatus" /><!-- 재고현황 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <section class="group">
                <div class="table_grid">
                    <div id="treelist"></div>
                </div>
                <script>
                    $(document).ready(function () {
                        var dataSource = new kendo.data.TreeListDataSource({
                            data:[
                              { id:1, th1:"▼ 领用配件仓库",      th2:"0", th3:"0", th4:"", th5:"", th6:"", parentId:null },
                              { id:2, th1:"     ▼ A1 Location", th2:"0", th3:"0", th4:"", th5:"", th6:"", parentId:1 },
                              { id:3, th1:"     ▼ B1 Location", th2:"0", th3:"0", th4:"", th5:"", th6:"", parentId:2 }
                            ],

                            schema:{
                                model:{
                                    id:"id",
                                    expanded:true
                                }
                            }
                        });

                        $("#treelist").kendoTreeList({
                            dataSource:dataSource,
                            selectable:"multiple",
                            columns:[
                                { field:"th1", title:"<spring:message code='par.lbl.strgeCdLocation' />" },
                                { field:"th2", title:"<spring:message code='global.lbl.avlbStockQty' />" },
                                { field:"th3", title:"<spring:message code='global.lbl.resvStockQty' />" },
                                { field:"th4", title:"<spring:message code='global.lbl.clamStockQty' />" },
                                { field:"th5", title:"<spring:message code='par.lbl.grScheQty' />" },
                                { field:"th6", title:"<spring:message code='par.lbl.giScheQty' />" }
                            ]
                        });
                    });
                </script>
            </section>
            </div>
            </div>

            <!-- 사진 -->
            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="global.title.pictureInfo" /><!-- 사진 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
                <!-- Upload 된 사진영역 -->
                <div class="upload_view">
                     <div class="carImgView"><span><img src=""/></span></div>
                </div>
                <!-- //Upload 된 사진영역 -->
            </div>
            </div>
            <!-- //사진 -->

            <%--<iframe id="otherList" border="10" frameborder="10" width="100%" height="80%"></iframe>--%>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>







var spyrCdList             = [],
    spyrCdObj              = {},
    itemDstinCdList        = [],
    itemDstinCdObj         = {},
    itemGroupObj           = {},
    stockUnitList          = [],
    storageList            = [],
    carlineCdList          = [],
    brandCdList            = [],
    sucList                = [],
    parSpecCdList          = [],
    mobisImpLocalYnTpList  = [],
    toDate,
    gCrud;

toDate = new Date();


<c:forEach var="obj" items="${storageList}" varStatus="status">
    storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
</c:forEach>

<c:forEach var="obj" items="${spyrCdList}" varStatus="status">
    spyrCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    spyrCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
    itemDstinCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${stockUnitList}" varStatus="status">
    stockUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
</c:forEach>

<c:forEach var="obj" items="${sucList}" varStatus="status">
    sucList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
</c:forEach>

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sItemCd").val("");
            break;
        case "search2Area" :
            $("#sSpyrCd").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sItemNm").val("");
            break;
        case "search4Area" :
            $("#sItemDstinCd").data("kendoExtDropDownList").value("");
            break
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sItemCd = $("#sItemCd").val();
    var sItemNm = $("#sItemNm").val();
    var sSpyrCd = $("#sSpyrCd").data("kendoExtDropDownList").value();
    var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList").value();

    if(sItemCd == "" && sSpyrCd == "" && sItemNm == "" && sItemDstinCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sItemCd == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sSpyrCd == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sItemNm == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sItemDstinCd == "") $("#search4Area").hide();
        else $("#search4Area").show();
    }

    setMainListHeight();
}


$(document).ready(function() {

    //조회조건 - 품목구분선택
    $("#sItemDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });


    //조회조건 - 로컬여부선택
    $("#sSpyrCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:spyrCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });


    $(".form_datepicker").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });


    /* 처리필요
    $("#itemDstinCd").on("change", function (){
        console.log('itemDstinCd Change:',$(this).data("kendoExtDropDownList").value());
        $("#itemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[$(this).data("kendoExtDropDownList").value()]);
    });
    */


    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        $("#sItemDstinCd").data("kendoExtDropDownList").value('02');
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").value('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").value(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='par.title.itemMasterSearch' />");<!-- 품목마스터 조회 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/pmm/itemMaster/selectItemMasterList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sItemCd = $("#sItemCd");
            var sItemNm = $("#sItemNm");
            var sSpyrCd = $("#sSpyrCd").data("kendoExtDropDownList");
            var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList");

            if(sItemCd.val() != "") $("#search1Area span[name='searchStr']").text(sItemCd.val());
            if(sSpyrCd.value() != "") $("#search2Area span[name='searchStr']").text(sSpyrCd.text());
            if(sItemNm.val() != "") $("#search3Area span[name='searchStr']").text(sItemNm.val());
            if(sItemDstinCd.value() != "") $("#search4Area span[name='searchStr']").text(sItemDstinCd.text());

            setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });



});
</script>
<script>

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}


//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  $("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기
function contentDetail(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
  $("#header_title span").removeAttr("class");

  if( key != null && key != 'undefined'){
      $.ajax({
          //url:"<c:url value='/mob/par/pmm/itemMaster/selectMobileItemMasterByKey.do' />",
          //url:"<c:url value='/mob/par/pmm/itemMaster/selectItemMasterDetail.do' />",
          url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",

          data:JSON.stringify({ sItemCd:key}),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
              mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
          }

      }).done(function(result) {
          //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
          if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
              return false;
          }
          console.log('result:', result);
          console.log('Hash:', partsJs.validate.formJs.Hash);


          partsJs.validate.groupObjAllDataSet(result);

          (result.endYn == "Y") ? $("#endYn").attr("checked",true):$("#endYn").attr("checked",false);
          (result.oldRplcParCmptYn == "Y") ? $("#oldRplcParCmptYn").attr("checked",true):$("#oldRplcParCmptYn").attr("checked",false);
          (result.newRplcParCmptYn == "Y") ? $("#newRplcParCmptYn").attr("checked",true):$("#newRplcParCmptYn").attr("checked",false);
          (result.stdrdStockCalcYn == "Y") ? $("#stdrdStockCalcYn").attr("checked",true):$("#stdrdStockCalcYn").attr("checked",false);
          (result.purcCqtyCalcYn == "Y") ? $("#purcCqtyCalcYn").attr("checked",true):$("#purcCqtyCalcYn").attr("checked",false);
          (result.nonMovingFlg == "Y") ? $("#nonMovingFlg").attr("checked",true):$("#nonMovingFlg").attr("checked",false);

        //alert("||"+result.newRplcParCmptYn+"||");
          //if(result.newRplcParCmptYn == "Y") $("#newRplcParCmptYn").attr("checked",true);


      });
  }
}

</script>
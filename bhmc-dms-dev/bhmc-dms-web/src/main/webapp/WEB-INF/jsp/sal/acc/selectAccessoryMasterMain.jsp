<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
        <div id="resizableContainer">

        <!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="attachment.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="attachment.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->

            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="sal.lbl.goodsStock" /></h1>
                    <div class="btn_right">
                        <button class="btn_m btn_search" id="btnCustSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
                        <button class="btn_m" id="btnCustAdd"><spring:message code='global.lbl.add' /></button><!-- 추가 -->
                        <button class="btn_m" id="btnCustUse"><spring:message code='sal.lbl.useStop' /></button><!-- 사용/사용정지 -->
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnCustSearch">
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
                                <th scope="row"><spring:message code='sal.lbl.goodsHouse' /></th><!-- 용품창고 -->
                                <td>
                                    <input type="text" id="sGoodsHouse" name="sGoodsHouse" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.goodsCd' /></th><!-- 용품코드 -->
                                <td>
                                    <input type="text" id="sGoodsCd" name="sGoodsCd" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.goodsName' /></th><!-- 용품명칭 -->
                                <td>
                                    <input type="text" id="sGoodsName" name="sGoodsName" class="form_input" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.goodsGubun' /></th><!-- 용품유형 -->
                                <td>
                                    <input type="text" id="sGoodsGubun" name="sGoodsGubun" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.grDt" /></th><!-- 입고일자 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sGrDtFrom" name="sGrDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sGrDtTo" name="sGrDtTo" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.giDt" /></th><!-- 출고일자 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sGiDtFrom" name="sGiDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sGiDtTo" name="sGiDtTo" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.bpCd' /></th><!-- 공급업체 -->
                                <td>
                                    <input type="text" id="sBpCd" name="sBpCd" class="form_input" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="grid" class="resizable_grid"></div>
                </div>
            </section>
        </div>

        <section id="window" class="pop_wrap">
                    <!-- unique info pop contents start -->
                    <div id="defaultInfoTabDiv" class="mt10">

                    <div class="header_area">
                        <div class="btn_right">
                            <button class="btn_m btn_search" id="btnCustSave"><spring:message code='global.lbl.save' /></button><!-- 저장 -->
                            <button class="btn_m" id="btnCustCancel"><spring:message code='global.lbl.cancel' /></button><!-- 취소 -->
                        </div>
                    </div>
                    <br>

                        <div class="table_form">
                            <form id="defaultInfoForm" >
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:20%;">
                                        <col style="width:25%;">
                                        <col style="width:20%;">
                                        <col style="width:25%;">
                                        <col style="width:20%;">
                                        <col style="width:25%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.goodsHouse" /></span><!-- 용품창고 --></th>
                                                <td>
                                                    <input id="pGoodsHouse" name="pGoodsHouse" value="" class="form_input" style="width:100%"  />
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.size" /><!-- 규격/형호 --></th>
                                            <td>
                                                <input id="pSize" name="pSize" class="form_input"  style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.goodsCd" /></span><!-- 용품코드 --></th>
                                                <td>
                                                    <input id="pGoodsCd" name="pGoodsCd" value="" class="form_input" style="width:100%" />
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.unit" /><!-- 단위 --></th>
                                            <td>
                                                <input id="pUnit" name="pUnit" class="form_input"  style="width:100%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.goodsName" /></span><!-- 용품명칭 --></th>
                                                <td>
                                                    <input id="pGoodsName" name="pGoodsName" value="" class="form_input" style="width:100%" />
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.cost" /><!-- 원가(세금) --></th>
                                            <td>
                                                <input id="pCost" name="pCost" class="form_input"  style="width:100%" />
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.noncost" /><!-- 원가(불세금) --></th>
                                            <td>
                                                <input id="pNonCost" name="pNonCost" class="form_input"  style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.goodsGubun" /></span><!-- 용품유형 --></th>
                                                <td>
                                                    <input id="pGoodsGubun" name="pGoodsGubun" value="" class="form_comboBox" style="width:100%"/>
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.costAmount" /><!-- 원가*수량 --></th>
                                            <td>
                                                <input id="pCostAmount" name="pCostAmount" class="form_input"  style="width:100%"/>
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.costAmount" /><!-- 원가*수량 --></th>
                                            <td>
                                                <input id="pCostAmount2" name="pCostAmount2" class="form_input"  style="width:100%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.prodFactory" /></span><!-- 생산공장 --></th>
                                                <td>
                                                    <input id="pProdFactory" name="pProdFactory" value="" class="form_input" style="width:100%" />
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.buyPrice" /><!-- 최근구입가격 --></th>
                                            <td>
                                                <input id="pBuyPrice" name="pBuyPrice" class="form_input"  style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="global.lbl.bpCd" /></span><!-- 공급업체 --></th>
                                                <td>
                                                    <input id="pBpCd" name="pBpCd" value="" class="form_input" style="width:100%" />
                                                </td>
                                            <th scope="row"><spring:message code="par.lbl.lastStockInDt" /><!-- 최근 입고일 --></th>
                                            <td>
                                                <input id="pLastStockInDt" name="pLastStockInDt" class="form_input"  style="width:100%" />
                                            </td>
                                            <th scope="row"><spring:message code="par.lbl.lastStockOutDt" /> <!-- 최근 출고일 --></th>
                                            <td>
                                                <input id="pLastStockOutDt" name="pLastStockOutDt" class="form_input"  style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.useYn" /></span><!-- 사용여부 --></th>
                                                <td>
                                                    <input id="pUseYn" name="pUseYn" value="" class="form_input" style="width:100%" />
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.fitCost" /><!-- 설치비 --></th>
                                            <td>
                                                <input id="pFitCost" name="pFitCost" class="form_input"  style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.pointGoods" /></span><!-- 포인트상품 --></th>
                                                <td>
                                                    <input id="pPointGoods" name="pPointGoods" value="" class="form_input" style="width:100%" />
                                                </td>
                                            <th scope="row"><spring:message code="sal.lbl.salePrice" /><!-- 판매가 --></th>
                                            <td>
                                                <input id="pSalePrice" name="pSalePrice" class="form_input"  style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="sal.lbl.qty" /></span><!-- 수량 --></th>
                                                <td>
                                                    <input id="pQty" name="pQty" value="" class="form_input" style="width:100%" />
                                                </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                  <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code='sal.lbl.remark' /></h2><!-- 비고 -->
                    </div>
                    <br>
                    <div class="table_grid">
                        <div id="fileGrid"></div>
                        <h2 class="title_basic"><spring:message code='global.info.fileTpImgYn' /></h2><!-- 이미지등록 -->
                    </div>
                    <br>
                    <!-- 사진 -->
                    <div style="min-height:100px;">
                        <div class="btn_right_absolute">
                            <div class="btn_right">
                            </div>
                        </div>
                        <div>
                            <span class="btn_file" id="attachmentSelect"><spring:message code="par.btn.uploadFile" /><!-- Upload File --><input type="file"></span>
                        </div>

                    <!-- Upload 된 사진영역 -->
                        <div class="upload_view">
                            <input type="hidden" id="fileDocNo" name="fileDocNo" class="form_file" />
                            <img id="fileDocUrl" src="" alt="" width="300" height="300" />
                        </div>
                <!-- //Upload 된 사진영역 -->
                    </div>
            <!-- //사진 -->
                </section>
            </section>

<!-- script start  -->
<script type="text/javascript" charset="UTF-8">

var par101List = [];
<c:forEach var="obj" items="${par101List}">
   <c:if test="${obj.cmmCd eq '02' or obj.cmmCd eq '05' }">
    par101List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   </c:if>
</c:forEach>

$(document).ready(function() {

    // 저장 버튼.
    $("#btnCustSave").kendoButton({
        click:function(e){

            var ArrayList = new Array();

            var saveData = new Object();

            saveData.grStrgeCd = $("#pGoodsHouse").val();
            saveData.stockVal = $("#pSize").val();
            saveData.itemCd = $("#pGoodsCd").val();
            saveData.stockUnit = $("#pUnit").val();
            saveData.itemNm = $("#pGoodsName").val();
            saveData.incCostVat = $("#pCost").val();
            saveData.itemDstinCd = $("#pGoodsGubun").val();
            saveData.costAmount = $("#pCostAmount").val();
            saveData.factoryNm = $("#pProdFactory").val();
            saveData.amtVat = $("#pBuyPrice").val();
            saveData.bpNm = $("#pBpCd").val();
            saveData.aprrvDt = $("#pLastStockInDt").val();
            saveData.useYn = $("#pUseYn").val();
            saveData.instalPrice = $("#pFitCost").val();
            saveData.pointYn = $("#pPointGoods").val();
            saveData.salePrice = $("#pSalePrice").val();
            saveData.invcQty = $("#pQty").val();
            saveData.incPrice = $("#pNonCost").val();
            saveData.costAmount2 = $("#pCostAmount2").val();

            ArrayList.push(saveData);

            $.ajax({
                url:"<c:url value='/sal/acc/accessoryMaster/selectAccessoryMasterSave.do' />"
                ,data:JSON.stringify(ArrayList)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                }
            });
        }
    });

    $("#pGoodsGubun").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:par101List
       ,index:0
    });
    /*
    $("#pGoodsCd").kendoExtDropDownList({
        dataSource:""
        ,dataTextField:""
        ,dataValueField:""
        ,index:0
    });

    $("#pGoodsGubun").kendoExtDropDownList({
        dataSource:""
        ,dataTextField:""
        ,dataValueField:""
        ,index:0
    });

    $("#pBpCd").kendoExtDropDownList({
        dataSource:""
        ,dataTextField:""
        ,dataValueField:""
        ,index:0
    });
    */

    $("#sGrDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sGrDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sGiDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue2
    });

    $("#sGiDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue2
    });

    $("#window").kendoWindow({
        pinned:true,
        modal:true,
        resizable:true,
        visible:false,
        animation:false,
        title:"<spring:message code='sal.lbl.goodsInfo' />",
        width:"950px",
        height:"270px"
    }).data("kendoWindow");

    // 검색 버튼.
    $("#btnCustSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 추가 버튼.
    $("#btnCustAdd").kendoButton({
        click:function(e){
            dbClickDetailInfoInPop();
        }
    });

    // 그리드 더블클릭 이벤트
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid")
            , dataItem = grid.dataItem(grid.select());
        var statCd = dataItem.statCd;

        $("#pGoodsHouse").val("");
        $("#pSize").val("");
        $("#pGoodsCd").val("");
        $("#pUnit").val("");
        $("#pGoodsName").val("");
        $("#pCost").val("");
        $("#pGoodsGubun").val("");
        $("#pCostAmount").val("");
        $("#pProdFactory").val("");
        $("#pBuyPrice").val("");
        $("#pBpCd").val("");
        $("#pLastStockInDt").val("");
        $("#pUseYn").val("");
        $("#pFitCost").val("");
        $("#pPointGoods").val("");
        $("#pSalePrice").val("");
        $("#pQty").val("");
        $("#pNonCost").val("");
        $("#pCostAmount2").val("");
        $("#pLastStockOutDt").val("");

        dbClickDetailInfoInPop();

        //$("#fileGrid").data("kendoExtGrid").dataSource.page(1);
    });

    // show detail information in the pop
    function dbClickDetailInfoInPop(){
        var row = $("#grid").data("kendoExtGrid").select();
        var data = $("#grid").data("kendoExtGrid").dataItem(row);
        var win = $("#window").data("kendoWindow");
        win.center();
        win.open();

        var saveData = data;

        $.ajax({
            url:"<c:url value='/sal/acc/accessoryMaster/selectAccessoryMasterLineSearch.do' />"
            ,data:JSON.stringify(saveData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(jqXHR, textStatus) {

                $("#pGoodsHouse").val(jqXHR.data[0].grStrgeCd);
                $("#pSize").val(jqXHR.data[0].stockVal);
                $("#pGoodsCd").val(jqXHR.data[0].itemCd);
                $("#pUnit").val(jqXHR.data[0].stockUnit);
                $("#pGoodsName").val(jqXHR.data[0].itemNm);
                $("#pCost").val(jqXHR.data[0].incCostVat);
                $("#pGoodsGubun").val(jqXHR.data[0].itemDstinCd);
                $("#pCostAmount").val(jqXHR.data[0].costAmount);
                $("#pProdFactory").val(jqXHR.data[0].factoryNm);
                $("#pBuyPrice").val(jqXHR.data[0].amtVat);
                $("#pBpCd").val(jqXHR.data[0].bpNm);
                $("#pLastStockInDt").val(jqXHR.data[0].aprrvDt);
                $("#pUseYn").val(jqXHR.data[0].useYn);
                $("#pFitCost").val(jqXHR.data[0].instalPrice);
                $("#pPointGoods").val(jqXHR.data[0].pointYn);
                $("#pSalePrice").val(jqXHR.data[0].salePrice);
                $("#pQty").val(jqXHR.data[0].invcQty);
                $("#pNonCost").val(jqXHR.data[0].invcQty);
                $("#pCostAmount2").val("");
                $("#pLastStockOutDt").val("");

            }
        });

    }

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sGrDtFrom'){
                var minDate = new Date(toDt);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
            }else if(id === 'sGrDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();
            }
        }else{
            if(id === 'sGrDtFrom'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGrDFTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sGrDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }

    function fnChkDateValue2(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sGiDtFrom'){
                var minDate = new Date(toDt);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
            }else if(id === 'sGiDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();
            }
        }else{
            if(id === 'sGiDtFrom'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'giDtFTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sGiDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }


    //그리드 설정 (그룹 CRUD)
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1006-1607"
        , dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/accessoryMaster/selectAccessoryMasterSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sGoodsHouse"]   = $("#sGoodsHouse").val();
                        params["sGoodsCd"]      = $("#sGoodsCd").val();
                        params["sGoodsName"]    = $("#sGoodsName").val();
                        params["sGoodsGubun"]   = $("#sGoodsGubun").val();
                        params["sGrDtFrom"]     = $("#sGrDtFrom").val();
                        params["sGrDtTo"]       = $("#sGrDtTo").val();
                        params["sGiDtFrom"]     = $("#sGiDtFrom").val();
                        params["sGiDtTo"]       = $("#sGiDtTo").val();
                        params["sBpCd"]         = $("#sBpCd").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"grStrgeCd"
                    , fields:{
                          rnum:{type :"number", editable:false}
                        , grStrgeCd:{type:"string"}
                        , itemCd:{type:"string"}
                        , itemNm:{type:"string"}
                        , itemDstinCd:{type:"string"}
                        , amtVat:{type:"string"}
                        , incCostVat:{type:"string"}
                        , incCostAmt:{type:"string"}
                        , incVat:{type:"string"}
                        , incPrice:{type:"string"}
                        , salePrice:{type:"string"}
                        , instalPrice:{type:"string"}
                        , invcQty:{type:"string"}
                        , factoryNm:{type:"string"}
                        , bpNm:{type:"string"}
                        , goodsYear:{type:"string"}
                        , useYn:{type:"string"}
                        , aprrvDt:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                        });
                    }
                    return d;
                }
            }

        }
        ,columns:[
                   {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:50, attributes:{"class":"ac"}}  //번호
                  ,{field:"grStrgeCd" , title:"<spring:message code='sal.lbl.goodsHouse' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"itemCd" , title:"<spring:message code='sal.lbl.goodsCd' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"itemNm" , title:"<spring:message code='sal.lbl.goodsName' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"itemDstinCd" , title:"<spring:message code='sal.lbl.goodsGubun' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"amtVat" , title:"<spring:message code='sal.lbl.buyPrice' />",  width:100, attributes:{"class":"ac"}}
                  ,{field:"incCostVat" , title:"<spring:message code='sal.lbl.cost' />",  width:100, attributes:{"class":"ac"}}
                  ,{field:"incCostAmt" , title:"<spring:message code='sal.lbl.noncost' />",  width:100, attributes:{"class":"ac"}}
                  ,{field:"incVat" , title:"<spring:message code='sal.lbl.costTax' />",  width:100, attributes:{"class":"ac"}}
                  ,{field:"incPrice" , title:"<spring:message code='sal.lbl.nonCostTax' />",  width:100, attributes:{"class":"ac"}}
                  ,{field:"salePrice" , title:"<spring:message code='sal.lbl.salePrice' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"instalPrice" , title:"<spring:message code='sal.lbl.fitCost' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"invcQty" , title:"<spring:message code='sal.lbl.qty' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"factoryNm" , title:"<spring:message code='sal.lbl.prodFactory' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"bpNm" , title:"<spring:message code='global.lbl.bpCd' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"goodsYear" , title:"<spring:message code='sal.lbl.goodsYear' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"useYn" , title:"<spring:message code='sal.lbl.useYn' />",  width:60, attributes:{"class":"ac"}}
                  ,{field:"aprrvDt" , title:"<spring:message code='par.lbl.lastStockInDt' />",  width:100, attributes:{"class":"ac"}}
                ]
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default :true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default :true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default :false
        ,appendEmptyColumn:true           //빈컬럼 적용. default :false
        ,enableTooltip:false              //Tooltip 적용, default :false
        ,pageable :{
            refresh :true
            ,pageSize :40
            ,pageSizes :[ "40", "80", "100", "200"]
        }
        ,height:434
        ,editable:false
        ,resizable:true
        ,autoBind:true
        ,selectable:"row"
        ,navigatable:true
    });





    /* *************************************************************************
     **************************file attachment********************************************
     ***************************************************************************/
     //================================
     var attachment = new Resumable({
         target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize:1 * 1024 * 1024
         ,simultaneousUploads:4
         ,testChunks:true
         ,throttleProgressCallbacks:1
         ,method:"octet"
     });
     attachment.assignBrowse($('#attachmentSelect')[0]);

     //file add event
     attachment.on('fileAdded', function(file) {

         $("#progressWindow").kendoWindow({
             width:"600px"
             ,height:"300px"
             ,title:"<spring:message code='global.lbl.fileSend'/>"     //file send
             ,animation:false
             ,draggable:false
             ,visible:false
             ,resizable:false
             ,modal:true
         }).data("kendoWindow").center().open();

         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
         //file list output
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         attachment.upload();

     });
     attachment.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     attachment.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#fileDocNo").val())) {

                 $.ajax({
                     url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                     dataType:"json",
                     type:"get",
                     async:false,
                     cache:false,
                     success:function(id) {
                         _that.opt["query"]["resumableSessionId"] = id;
                         $("#fileDocNo").val(id);
                     }
                 });

         } else {
             var deleteList = [];
                 deleteList.push({"fileDocNo":$("#fileDocNo").val(), "fileNo":1});

             $.ajax({
                 url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                 ,data:JSON.stringify(deleteList)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR, status, error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
                 ,success:function(jqXHR, textStatus) {

                     $.ajax({
                         url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                         dataType:"json",
                         type:"get",
                         async:false,
                         cache:false,
                         success:function(id) {
                             _that.opt["query"]["resumableSessionId"] = id;
                             $("#fileDocNo").val(id);
                         }
                     });
                 }
             });
         }


         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     attachment.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

         $("#progressWindow").data("kendoWindow").close();
         attachment.files = [];
         $(".resumable-list").html("");
     });
     attachment.on('fileSuccess', function(file, message) {
         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#fileDocNo").val(result.fileDocNo);
             var fileDocUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + $("#fileDocNo").val() + "&fileNo=" + 1 + "&inline=true";
             $("#fileDocUrl").attr("src", fileDocUrl);
         }
     });
     attachment.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
     });
     attachment.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width:Math.min(Math.floor(attachment.progress() * 100), 100)+ '%'});
     });
     /* *************************************************************************
     **************************file attachment****************************************
     ***************************************************************************/



});

</script>
<!-- //script end -->
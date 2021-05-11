<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 차량배정관리 -->
<div id="tabstrip" class="tab_area">
    <!-- 탭메뉴 -->
    <ul>
        <li id="assignProcessT" class="k-state-active" selected><spring:message code="global.lbl.assignProcess" /><!-- 배정처리 --></li>
        <li id="assignContracStsT"><spring:message code="global.lbl.assignContractSts" /><!-- 배정계약현황 --></li>
        <li id="unAssignContracStsT"><spring:message code="global.lbl.unAssignContractSts" /><!-- 미배정계약현황 --></li>
        <li id="assignCancelStsT"><spring:message code="global.lbl.assignCancelSts" /><!-- 배정취소이력현황 --></li>
    </ul>
    <!-- //탭메뉴 -->

    <!-- 배정처리 탭 -->
    <div>
        <section class="group">
            <div class="btn_right_absolute2">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </div>
            <div class="table_form form_width_70per">
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
                            <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                            <td>
                                <input id="sContractNo" type="text" class="form_input" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                            <td>
                                <div class="form_float">
                                    <div class="form_left">
                                        <div class="form_search">
                                            <input id="sContractCustNo" type="text" class="form_input">
                                            <a href="javascript:selectBpPopupWindow('T1');"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="sContractCustNm" type="text" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sContractStartDt" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sContractEndDt" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.assignYn' /></th><!-- 배정여부 -->
                            <td>
                                <input id="sAssignYn" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                            <td>
                                <input id="sContractTp" class="form_comboBox"  >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th><!-- 인도요청일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sDlReqStartDt" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sDlReqEndDt" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <input id="sCarlineCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                            <td>
                                <input id="sModelCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                            <td>
                                <input id="sOcnCd" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                            <td>
                                <input id="sExtColorCd" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                            <td class="bor_none">
                                <input id="sIntColorCd" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                            <td class="bor_none">
                                <input id="sVinNo" type="text" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <div class="header_area">
                <div class="btn_right">
                    <button id="btnAssign" name="btnAssign" class="btn_s" ><spring:message code="global.btn.assign" /><!-- 배정 --></button>
                    <button id="btnAssignCancel" name="btnAssignCancel" class="btn_s" ><spring:message code="global.btn.assignCancel" /><!-- 배정취소 --></button>
                    <button id="btnVehExchange" name="btnVehExchange" class="btn_s" ><spring:message code="global.btn.vehExchange" /><!-- 차량교환 --></button>
                </div>
            </div>

            <!--배정처리 탭 영역 -->
            <div class="table_grid">
                <div id="assignProcessG" class="grid"></div>
            </div>
        </section>
    </div>
    <!-- //배정처리  -->

    <!-- 배정계약현황 -->
    <div>
        <section class="group">
            <div class="btn_right_absolute2">
                <button id="btnAssignExcelExport" class="btn_m"><spring:message code="global.btn.excelExport" /></button><!-- 엑셀저장 -->
                <button id="btnSearchAssignSts" class="btn_m btn_search"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </div>
            <div class="table_form form_width_70per">
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
                            <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                            <td>
                                <input id="sContractNoT2" type="text" class="form_input" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                            <td>
                                <div class="form_float">
                                    <div class="form_left">
                                        <div class="form_search">
                                            <input id="sContractCustNoT2" type="text" class="form_input">
                                            <a href="javascript:selectBpPopupWindow('T2');"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="sContractCustNmT2" type="text" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sContractStartDtT2" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sContractEndDtT2" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">VIN NO</th>
                            <td>
                                <input id="sVinNoT2" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                            <td>
                                <input id="sContractTpT2" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th><!-- 인도요청일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sDlReqStartDtT2" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sDlReqEndDtT2" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <input id="sCarlineCdT2" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                            <td>
                                <input id="sModelCdT2" class="form_comboBox">
                            </td>
                            <th scope="row">OCN</th>
                            <td>
                                <input id="sOcnCdT2" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                            <td>
                                <input id="sExtColorCdT2" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                            <td>
                                <input id="sIntColorCdT2" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.assignDt' /></th><!-- 배정일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sAllocStartDtT2" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sAllocEndDtT2" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="assignStsG" class="grid"></div>
            </div>
        </section>
    </div>
    <!-- //배정계약현황 -->


    <!-- 미배정계약현황 -->
    <div>
        <section class="group">
            <div class="btn_right_absolute2">
                <button id="btnUnAssignExport" class="btn_m"><spring:message code="global.btn.excelExport" /></button><!-- 엑셀저장 -->
                <button id="btnSearchUnAssignSts" class="btn_m btn_search"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </div>
            <div class="table_form form_width_70per">
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
                            <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                            <td>
                                <input id="sContractNoT3" type="text" class="form_input" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                            <td>
                                <div class="form_float">
                                    <div class="form_left">
                                        <div class="form_search">
                                            <input id="sContractCustNoT3" type="text" class="form_input">
                                            <a href="javascript:selectBpPopupWindow('T3');"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="sContractCustNmT3" type="text" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sContractStartDtT3" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sContractEndDtT3" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td></td>
                            <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                            <td>
                                <input id="sContractTpT3" class="form_comboBox"  >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th><!-- 인도요청일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sDlReqStartDtT3" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sDlReqEndDtT3" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <input id="sCarlineCdT3" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                            <td>
                                <input id="sModelCdT3" class="form_comboBox">
                            </td>
                            <th scope="row">OCN</th>
                            <td>
                                <input id="sOcnCdT3" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                            <td>
                                <input id="sExtColorCdT3" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                            <td>
                                <input id="sIntColorCdT3" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="unAssignStsG" class="grid"></div>
            </div>
        </section>
    </div>
    <!-- //미배정계약현황 -->

    <!-- 배정취소이력현황 -->
    <div>
        <section class="group">
            <div class="btn_right_absolute2">
                <button id="btnSearchAssignCancelSts" class="btn_m btn_search"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </div>
            <div class="table_form form_width_70per">
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
                            <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                            <td>
                                <input id="sContractNoT4" type="text" class="form_input" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                            <td>
                                <div class="form_float">
                                    <div class="form_left">
                                        <div class="form_search">
                                            <input id="sContractCustNoT4" type="text"  class="form_input">
                                            <a href="javascript:selectBpPopupWindow('T4');"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="sContractCustNmT4" type="text" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sContractStartDtT4" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sContractEndDtT4" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNum' /></th> <!-- VIN NO -->
                            <td>
                                <input id="sVinNoT2" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                            <td>
                                <input id="sContractTpT4" class="form_comboBox"  >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th><!-- 인도요청일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sDlReqStartDtT4" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sDlReqEndDtT4" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <input id="sCarlineCdT4" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                            <td>
                                <input id="sModelCdT4" class="form_comboBox">
                            </td>
                            <th scope="row">OCN</th>
                            <td>
                                <input id="sOcnCdT4" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                            <td>
                                <input id="sExtColorCdT4" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                            <td>
                                <input id="sIntColorCdT4" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.cancelDt' /></th><!-- 취소일 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCancelStartDtT4" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCancelEndDtT4" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="assignCancelStsG" class="grid"></div>
            </div>
        </section>
    </div>
    <!-- //배정취소이력현황 -->

</div>

<!-- script -->
<script type="text/javascript">
//배정팝업윈도우 변수 선언
var assignPopupWin;

//선택된 Tab 아이디
var selectTabId;

//차종
var carLineCdList = [{"carlineNm":"", "carlineCd":""}];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 판매유형 Array
var contractTpDs = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${contractTpList}">
    contractTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 판매유형 Map
var contractTpMap = dms.data.arrayToMap(contractTpDs, function(obj){ return obj.cmmCd; });


// 재고상태 Array
var stockTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${stockTpList}">
    stockTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 재고상태 Map
var stockTpMap = dms.data.arrayToMap(stockTpList, function(obj){ return obj.cmmCd; });

// 배정여부 SAL007 Array
var dsAssignYn = [{"cmmCdNm":"", "cmmCd":""}];
<c:forEach var="obj" items="${assignList}">
    dsAssignYn.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var assignYnMap = dms.data.arrayToMap(dsAssignYn, function(obj){ return obj.cmmCd; });


$(document).ready(function() {

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       //,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);


    //조회조건 - 계약일(기간)- START
    $("#sContractStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sContractStartDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);
    $("#sContractEndDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);


    //조회조건 - 인도요칭일(기간)- START
    $("#sDlReqStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 인도요칭일(기간)- END
    $("#sDlReqEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sDlReqStartDt").on('change', {from:$("#sDlReqStartDt"), to:$("#sDlReqEndDt")}, fnChkSearchDate);
    $("#sDlReqEndDt").on('change', {from:$("#sDlReqStartDt"), to:$("#sDlReqEndDt")}, fnChkSearchDate);

    //조회조건 - 배정유형
    $("#sAssignYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:dsAssignYn
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 판매유형
    $("#sContractTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractTpDs
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });

    /*********************************  //배정처리 검색조건  ****************************************/

    //차종
    $("#sCarlineCdT2").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       //,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCdT2").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCdT2").data("kendoExtDropDownList").enable(true);

           $("#sOcnCdT2").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCdT2").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCdT2").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCdT2").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCdT2").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCdT2").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCdT2").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCdT2").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCdT2").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCdT2").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCdT2").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCdT2").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCdT2").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCdT2").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCdT2").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCdT2").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCdT2").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCdT2").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCdT2").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCdT2").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCdT2").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCdT2").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCdT2").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCdT2").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCdT2").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCdT2").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCdT2").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCdT2").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCdT2").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCdT2").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCdT2").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCdT2").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCdT2").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCdT2").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCdT2").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCdT2").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCdT2").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCdT2").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCdT2").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCdT2").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCdT2").data("kendoExtDropDownList").enable(false);


    //조회조건 - 계약일(기간)- START
    $("#sContractStartDtT2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDtT2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sContractStartDtT2").on('change', {from:$("#sContractStartDtT2"), to:$("#sContractEndDtT2")}, fnChkSearchDate);
    $("#sContractEndDtT2").on('change', {from:$("#sContractStartDtT2"), to:$("#sContractEndDtT2")}, fnChkSearchDate);


    //조회조건 - 인도요칭일(기간)- START
    $("#sDlReqStartDtT2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 인도요칭일(기간)- END
    $("#sDlReqEndDtT2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sDlReqStartDtT2").on('change', {from:$("#sDlReqStartDtT2"), to:$("#sDlReqEndDtT2")}, fnChkSearchDate);
    $("#sDlReqEndDtT2").on('change', {from:$("#sDlReqStartDtT2"), to:$("#sDlReqEndDtT2")}, fnChkSearchDate);


    //조회조건 - 판매유형
    $("#sContractTpT2").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractTpDs
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 배정일(기간)- START
    $("#sAllocStartDtT2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 배정일(기간)- END
    $("#sAllocEndDtT2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sAllocStartDtT2").on('change', {from:$("#sAllocStartDtT2"), to:$("#sAllocEndDtT2")}, fnChkSearchDate);
    $("#sAllocEndDtT2").on('change', {from:$("#sAllocStartDtT2"), to:$("#sAllocEndDtT2")}, fnChkSearchDate);


    /************************************  // 배정계약현황   ****************************************/

    //차종
    $("#sCarlineCdT3").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       //,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCdT3").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCdT3").data("kendoExtDropDownList").enable(true);

           $("#sOcnCdT3").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCdT3").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCdT3").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCdT3").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCdT3").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCdT3").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCdT3").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCdT3").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCdT3").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCdT3").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCdT3").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCdT3").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCdT3").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCdT3").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCdT3").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCdT3").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCdT3").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCdT3").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCdT3").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCdT3").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCdT3").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCdT3").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCdT3").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCdT3").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCdT3").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCdT3").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCdT3").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCdT3").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCdT3").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCdT3").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCdT3").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCdT3").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCdT3").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCdT3").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCdT3").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCdT3").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCdT3").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCdT3").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCdT3").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCdT3").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCdT3").data("kendoExtDropDownList").enable(false);

    //조회조건 - 계약일(기간)- START
    $("#sContractStartDtT3").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDtT3").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });
    // 시작일은 종료일보다 클수가 없다.
    $("#sContractStartDtT3").on('change', {from:$("#sContractStartDtT3"), to:$("#sContractEndDtT3")}, fnChkSearchDate);
    $("#sContractEndDtT3").on('change', {from:$("#sContractStartDtT3"), to:$("#sContractEndDtT3")}, fnChkSearchDate);


    //조회조건 - 인도요칭일(기간)- START
    $("#sDlReqStartDtT3").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 인도요칭일(기간)- END
    $("#sDlReqEndDtT3").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });
    // 시작일은 종료일보다 클수가 없다.
    $("#sDlReqStartDtT3").on('change', {from:$("#sDlReqStartDtT3"), to:$("#sDlReqEndDtT3")}, fnChkSearchDate);
    $("#sDlReqEndDtT3").on('change', {from:$("#sDlReqStartDtT3"), to:$("#sDlReqEndDtT3")}, fnChkSearchDate);


    //조회조건 - 판매유형
    $("#sContractTpT3").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractTpDs
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });

    /***************************  // 미배정계약현황 *************************************************/

    //차종
    $("#sCarlineCdT4").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       //,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCdT4").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCdT4").data("kendoExtDropDownList").enable(true);

           $("#sOcnCdT4").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCdT4").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCdT4").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCdT4").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCdT4").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCdT4").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCdT4").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCdT4").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCdT4").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCdT4").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCdT4").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCdT4").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCdT4").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCdT4").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCdT4").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCdT4").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCdT4").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCdT4").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCdT4").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCdT4").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCdT4").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCdT4").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCdT4").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCdT4").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCdT4").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCdT4").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCdT4").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCdT4").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCdT4").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCdT4").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCdT4").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCdT4").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCdT4").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCdT4").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCdT4").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCdT4").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCdT4").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCdT4").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCdT4").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCdT4").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCdT4").data("kendoExtDropDownList").enable(false);


    //조회조건 - 계약일(기간)- START
    $("#sContractStartDtT4").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDtT4").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sContractStartDtT4").on('change', {from:$("#sContractStartDtT4"), to:$("#sContractEndDtT4")}, fnChkSearchDate);
    $("#sContractEndDtT4").on('change', {from:$("#sContractStartDtT4"), to:$("#sContractEndDtT4")}, fnChkSearchDate);

    //조회조건 - 인도요칭일(기간)- START
    $("#sDlReqStartDtT4").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 인도요칭일(기간)- END
    $("#sDlReqEndDtT4").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sDlReqStartDtT4").on('change', {from:$("#sDlReqStartDtT4"), to:$("#sDlReqEndDtT4")}, fnChkSearchDate);
    $("#sDlReqEndDtT4").on('change', {from:$("#sDlReqStartDtT4"), to:$("#sDlReqEndDtT4")}, fnChkSearchDate);


    //조회조건 - 판매유형
    $("#sContractTpT4").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractTpDs
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 취소일(기간)- START
    $("#sCancelStartDtT4").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });


    //조회조건 - 취소일(기간)- END
    $("#sCancelEndDtT4").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sCancelStartDtT4").on('change', {from:$("#sCancelStartDtT4"), to:$("#sCancelEndDtT4")}, fnChkSearchDate);
    $("#sCancelEndDtT4").on('change', {from:$("#sCancelStartDtT4"), to:$("#sCancelEndDtT4")}, fnChkSearchDate);


    /***************************  // 배정취소이력현황   *************************************************/




    /*************************** 검색 조건 영역 END **************************************************/


    // 탭
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;

        }
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#assignProcessG').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 배정(팝업)
    $("#btnAssign").kendoButton({
        click:function(e) {

            var grid = $("#assignProcessG").data("kendoExtGrid");
            var selectIdx = grid.select().index();

            if(selectIdx ==  -1 ){
                // 목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return false;
            }

            var length = 0;
            var rows = $("#assignProcessG").data("kendoExtGrid").tbody.find("tr");
            rows.each(function(index, row) {
                //var chk   = $("#"+id).is(":checked");//.attr('checked');
                var chk = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chk){
                    length++;
                }
            });

            if(length != 1){
                // 차량을 1건만 선택하십시오.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.isSelectChk' arguments='${globalLblCar}, 1' />");
                return false;
            }


            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if(selectVal.assignYn == '01'){
                // 이미 배정 되었습니다.
                dms.notification.warning("<spring:message code='global.lbl.assign' var='globalLblAssign' /><spring:message code='global.info.usedMsg' arguments='${globalLblAssign}' />");
                return false;
            }


            assignPopupWin = dms.window.popup({
                title:"<spring:message code='global.title.assign' />"    //배정
                ,windowId:"assignPopupWin"
                ,content:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectAssignPopup.do'/>"
                    ,data:{
                        "carlineCd":selectVal.carlineCd
                        ,"carlineNm":selectVal.carlineNm
                        ,"modelCd":selectVal.modelCd
                        ,"modelNm":selectVal.modelNm
                        ,"ocnCd":selectVal.ocnCd
                        ,"ocnNm":selectVal.ocnNm
                        ,"extColorCd":selectVal.extColorCd
                        ,"extColorNm":selectVal.extColorNm
                        ,"intColorCd":selectVal.intColorCd
                        ,"intColorNm":selectVal.intColorNm
                        ,"dlReqDt":selectVal.dlReqDt
                        ,"dlrCd":selectVal.dlrCd
                        ,"contractNo":selectVal.contractNo
                        ,"vinNo":selectVal.vehicleVinNo
                        ,"callbackFunc":function(){
                            // 배정이 완료 되었습니다.
                            dms.notification.warning("<spring:message code='global.lbl.assign' var='globalLblAssign' /><spring:message code='global.info.successMsg' arguments='${globalLblAssign}' />");

                            $('#assignProcessG').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });


    //버튼 - 배정취소
    $("#btnAssignCancel").kendoButton({
        click:function(e){

            var length = 0;
            var rows = $("#assignProcessG").data("kendoExtGrid").tbody.find("tr");
            rows.each(function(index, row) {
                //var chk   = $("#"+id).is(":checked");//.attr('checked');
                var chk = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chk){
                    length++;
                }
            });

            if(length != 1){
                // 차량을 1건만 선택하십시오.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.isSelectChk' arguments='${globalLblCar}, 1' />");
                return false;
            }

            var grid = $("#assignProcessG").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if(selectVal.assignYn != '01'){
                // 미배정 계약건 입니다.
                dms.notification.warning("<spring:message code='global.info.NonAssignInfo' />");
                return false;
            }

            // 배정 하시겠습니까?
            if (confirm("<spring:message code='global.btn.assignCancel' var='globalBtnAssignCancel' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnAssignCancel}' />") == false ){
                return false;
            }

            $.ajax({
                url:"<c:url value='/sal/ass/vehicleAssign/vehicleAssignCancel.do' />",
                dataType:"json",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(getSaveData()),
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                },
                success:function(jqXHR, textStatus){
                    //배정취소가 완료되었습니다.
                    dms.notification.success("<spring:message code='global.btn.assignCancel' var='globalBtnAssignCancel' /><spring:message code='global.info.successMsg' arguments='${globalBtnAssignCancel}' />");
                    $('#assignProcessG').data('kendoExtGrid').dataSource.read();
                }
            });
        }
    });



    //버튼 - 차량교환(팝업)
    $("#btnVehExchange").kendoButton({
        click:function(e) {
            var sltIdx = [];
            var length = 0;
            var rows = $("#assignProcessG").data("kendoExtGrid").tbody.find("tr");
            rows.each(function(index, row) {
                //var chk   = $("#"+id).is(":checked");//.attr('checked');
                var chk = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chk){
                    sltIdx += index+",";
                    length++;
                }
            });

            if(length != 2){
                // 교환할 차량을 선택하십시오.
                dms.notification.warning("<spring:message code='global.lbl.change' var='globalLblChange' /><spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.chkselect' arguments='${globalLblChange}, ${globalLblCar}' />");
                return false;
            }

            var grid = $("#assignProcessG").data("kendoExtGrid");
            var data = grid.dataSource.view();
            var idx = sltIdx.split(",");
            var selectVal1 = data[idx[0]];
            var selectVal2 = data[idx[1]];

            if(!(selectVal1.assignYn == '01' && selectVal2.assignYn == '01') ){
                // 모두 배정된 계약건에 대하여 차량교환을 할 수 있습니다.
                dms.notification.warning("<spring:message code='sal.info.NonAssign' />");
                return false;
            }

            if(selectVal1.carlineCd != selectVal2.carlineCd ||
                    selectVal1.modelCd != selectVal2.modelCd || selectVal1.ocnCd != selectVal2.ocnCd ){
                // 차종,모델,OCN이 모두 동일한 계약건에 한하여 차량교환이 가능합니다.
                var msg = "<spring:message code='sal.info.assignChk' />";
                var msgDtl = "";

                if(selectVal1.carlineCd != selectVal2.carlineCd){
                    msgDtl += "<spring:message code='global.lbl.carLine' />"; //차종
                }
                if(selectVal1.modelCd != selectVal2.modelCd){
                    msgDtl += "<spring:message code='global.lbl.model' />";     //모델
                }
                if(selectVal1.ocnCd != selectVal2.ocnCd){
                    msgDtl += "<spring:message code='global.lbl.ocn' />";       //OCN
                }

                dms.notification.warning(msg + "["+ msgDtl +" <spring:message code='global.lbl.discord' /> ]" );     // 불일치
                return false;
            }


            exchangePopupWin = dms.window.popup({
                title:"<spring:message code='global.title.vehExchange' />"    //차량교환
                ,windowId:"exchangePopupWin"
                ,content:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectVehExchangePopup.do'/>"
                    ,data:{
                        "carlineNm1"  :selectVal1.carlineNm
                        ,"carlineNm2" :selectVal2.carlineNm
                        ,"modelNm1"   :selectVal1.modelNm
                        ,"modelNm2"   :selectVal2.modelNm
                        ,"ocnNm1"     :selectVal1.ocnNm
                        ,"ocnNm2"     :selectVal2.ocnNm
                        ,"extColorNm1":selectVal1.extColorNm
                        ,"extColorNm2":selectVal2.extColorNm
                        ,"intColorNm1":selectVal1.intColorNm
                        ,"intColorNm2":selectVal2.intColorNm
                        ,"contractNo1":selectVal1.contractNo
                        ,"contractNo2":selectVal2.contractNo
                        ,"vinNo1"     :selectVal1.assignVinNo
                        ,"vinNo2"     :selectVal2.assignVinNo
                        ,"stockTp1"   :stockTpMap[selectVal1.stockTp].cmmCdNm
                        ,"stockTp2"   :stockTpMap[selectVal2.stockTp].cmmCdNm
                        ,"contractTp1":contractTpMap[selectVal1.contractTp].cmmCdNm
                        ,"contractTp2":contractTpMap[selectVal2.contractTp].cmmCdNm
                        ,"contractDt1":selectVal1.contractDt
                        ,"contractDt2":selectVal2.contractDt
                        ,"dlReqDt1"   :selectVal1.dlReqDt
                        ,"dlReqDt2"   :selectVal2.dlReqDt
                        ,"allocQueNo1":selectVal1.allocQueNo
                        ,"allocQueNo2":selectVal2.allocQueNo
                        ,"contractCustNm1":selectVal1.contractCustNm
                        ,"contractCustNm2":selectVal2.contractCustNm
                        ,"callbackFunc":function(){
                            // 차량교환이 완료되었습니다.
                            dms.notification.success("<spring:message code='global.btn.vehExchange' var='globalBtnVehExchange' /><spring:message code='global.info.successMsg' arguments='${globalBtnVehExchange}' />");

                            $('#assignProcessG').data('kendoExtGrid').dataSource.read();
                        }

                    }
                }
            });
        }
    });


    //[배정계약현황]버튼 - 조회
    $("#btnSearchAssignSts").kendoButton({
        click:function(e){
            $('#assignStsG').data('kendoExtGrid').dataSource.page(1);
        }
    });



    //[미배정계약현황]버튼 - 조회
    $("#btnSearchUnAssignSts").kendoButton({
        click:function(e){
            $('#unAssignStsG').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //[계약취소현황]버튼 - 조회
    $("#btnSearchAssignCancelSts").kendoButton({
        click:function(e){
            $('#assignCancelStsG').data('kendoExtGrid').dataSource.page(1);
        }
    });



    //[배정계약현황]버튼 - 엑셀저장
    $("#btnAssignExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName"         :"assignMngService"
                ,"templateFile"    :"AssignContractSts_Tpl.xlsx"
                ,"fileName"        :"assignContractSts.xlsx"
                ,"sContractNo"     :$("#sContractNoT2").val()                           // 계약번호.
                ,"sContractCustNo" :$("#sContractCustNoT2").val()                       // 고객번호.
                ,"sContractStartDt":$("#sContractStartDtT2").val()                      // 계약일 - 시작일.
                ,"sContractEndDt"  :$("#sContractEndDtT2").val()                        // 계약일 - 종료일.
                ,"sContractTp"     :$("#sContractTpT2").val()                           // 판매유형
                ,"sDlReqStartDt"   :$("#sDlReqStartDtT2").val()                         // 인도요청일 - 시작일
                ,"sDlReqEndDt"     :$("#sDlReqEndDtT2").val()                           // 인도요청일 - 종료일
                ,"sCarlineCd"      :$("#sCarlineCdT2").data("kendoExtDropDownList").value()                            // 차종
                ,"sModelCd"        :$("#sModelCdT2").data("kendoExtDropDownList").value()                              // 모델
                ,"sOcnCd"          :$("#sOcnCdT2").data("kendoExtDropDownList").value()                                // OCN
                ,"sExtColorCd"     :$("#sExtColorCdT2").data("kendoExtDropDownList").value()                           // 외장색
                ,"sIntColorCd"     :$("#sIntColorCdT2").data("kendoExtDropDownList").value()                           // 내장색
                ,"sVinNo"          :$("#sVinNoT2").val()                                // VIN NO
                ,"sAllocStartDt"   :$("#sAllocStartDtT2").val()                         // 인도요청일 - 시작일
                ,"sAllocEndDt"     :$("#sAllocEndDtT2").val()                           // 인도요청일 - 종료일
                ,"sTabId"          :"assignContractStsT"                                // TAB ID
            });

        }
    });



    //[미배정계약현황]버튼 - 엑셀저장
    $("#btnUnAssignExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName"         :"assignMngService"
                ,"templateFile"    :"UnAssignContractSts_Tpl.xlsx"
                ,"fileName"        :"unAssignContractSts.xlsx"
                ,"sContractNo"     :$("#sContractNoT3").val()                           // 계약번호.
                ,"sContractCustNo" :$("#sContractCustNoT3").val()                       // 고객번호.
                ,"sContractStartDt":$("#sContractStartDtT3").val()                      // 계약일 - 시작일.
                ,"sContractEndDt"  :$("#sContractEndDtT3").val()                        // 계약일 - 종료일.
                ,"sContractTp"     :$("#sContractTpT3").val()                           // 판매유형
                ,"sDlReqStartDt"   :$("#sDlReqStartDtT3").val()                         // 인도요청일 - 시작일
                ,"sDlReqEndDt"     :$("#sDlReqEndDtT3").val()                           // 인도요청일 - 종료일
                ,"sCarlineCd"      :$("#sCarlineCdT3").data("kendoExtDropDownList").value()     // 차종
                ,"sModelCd"        :$("#sModelCdT3").data("kendoExtDropDownList").value()       // 모델
                ,"sOcnCd"          :$("#sOcnCdT3").data("kendoExtDropDownList").value()         // OCN
                ,"sExtColorCd"     :$("#sExtColorCdT3").data("kendoExtDropDownList").value()    // 외장색
                ,"sIntColorCd"     :$("#sIntColorCdT3").data("kendoExtDropDownList").value()    // 내장색
                ,"sTabId"          :"unAssignContractStsT"                              // TAB ID

            });

        }
    });


    /*********************************  //버튼 처리 끝 *****************************************/




    // 배정처리 그리드.
    $("#assignProcessG").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectAssignMng.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sContractNo"]     = $("#sContractNo").val();                     // 계약번호.
                        params["sContractCustNo"] = $("#sContractCustNo").val();                 // 고객번호.
                        params["sContractStartDt"]= $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();   // 계약일 - 시작일.
                        params["sContractEndDt"]  = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();     // 계약일 - 종료일.
                        params["sAssignYn"]       = $("#sAssignYn").data("kendoExtDropDownList").value();                 // 배정여부
                        params["sContractTp"]     = $("#sContractTp").data("kendoExtDropDownList").value();               // 판매유형
                        params["sDlReqStartDt"]   = $("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value();      // 인도요청일 - 시작일
                        params["sDlReqEndDt"]     = $("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value();        // 인도요청일 - 종료일
                        params["sCarlineCd"]      = $("#sCarlineCd").data("kendoExtDropDownList").value();   // 차종
                        params["sModelCd"]        = $("#sModelCd").data("kendoExtDropDownList").value();     // 모델
                        params["sOcnCd"]          = $("#sOcnCd").data("kendoExtDropDownList").value();       // OCN
                        params["sExtColorCd"]     = $("#sExtColorCd").data("kendoExtDropDownList").value();  // 외장색
                        params["sIntColorCd"]     = $("#sIntColorCd").data("kendoExtDropDownList").value();  // 내장색
                        params["sVinNo"]          = $("#sVinNo").val();                          // VIN NO
                        params["sTabId"]          = "assignProcessT";                            // TAB ID

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"bpCd"
                    ,fields:{
                        rnum      :{ type:"number"}
                       ,allocQueNo:{ type:"string"}
                       ,assignVinNo:{ type:"string"}
                       ,carlineNm :{ type:"string"}
                       ,modelNm   :{ type:"string"}
                       ,ocnNm     :{ type:"string"}
                       ,extColorNm:{ type:"string"}
                       ,intColorNm:{ type:"string"}
                       ,contractNo:{ type:"string"}
                       ,contractCustNm:{ type:"string"}
                       ,contractTp:{ type:"string"}
                       ,saleEmpNm :{ type:"string"}
                       ,contractDt:{ type:"date"}
                       ,dlReqDt   :{ type:"date"}
                       ,assignYn  :{ type:"string"}
                       ,allocDt   :{ type:"date"}
                    }
                }
            }
        }
        , autoBind:false
        , editable:false
        , height:360
        , multiSelectWithCheckbox:true
        , columns:[ {field:"rnum"         ,title:"No.", width:50 ,attributes:{"class":"ac"}}
                     ,{field:"allocQueNo"   ,title:"<spring:message code = 'global.lbl.allocQueNo'/>", width:100,attributes:{"class":"ac"}}             //배정번호
                     ,{field:"assignVinNo"  ,title:"VIN NO", width:150, attributes:{"class":"ac"}}
                     ,{title:"<spring:message code = 'global.lbl.carNo'/>"      ,attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },     //차량정보
                        columns:[{field:"carlineNm" ,title:"<spring:message code = 'global.lbl.carLine'/>", width:150, attributes:{"class":"al"}}       //차종
                                ,{field:"modelNm"   ,title:"<spring:message code = 'global.lbl.model'/>", width:250, attributes:{"class":"al"}}         //모델
                                ,{field:"ocnNm"     ,title:"<spring:message code = 'global.lbl.ocn'/>", width:250, attributes:{"class":"al"}}           //OCN
                                ,{field:"extColorNm",title:"<spring:message code = 'global.lbl.extColor'/>", width:200, attributes:{"class":"al"}}    //외장색
                                ,{field:"intColorNm",title:"<spring:message code = 'global.lbl.intColor'/>", width:200, attributes:{"class":"al"}}    //내장색
                                ]
                      }
                     ,{title:"<spring:message code = 'global.lbl.contractInfo'/>", attributes:{"class":"ac"} , headerAttributes:{ "class":"hasBob" },  //계약정보
                        columns:[{field:"contractNo"    ,title:"<spring:message code = 'global.lbl.contractNo'/>", width:150, attributes:{"class":"ac"}}   //계약번호
                                ,{field:"contractCustNm",title:"<spring:message code = 'global.lbl.customer'/>", width:100, attributes:{"class":"ac"}}  //고객
                                ,{field:"contractTp"    ,title:"<spring:message code = 'global.lbl.saleType'/>", width:100, attributes:{"class":"ac"} //판매유형
                                  ,template:"# if(contractTpMap[contractTp] != null ){# #= contractTpMap[contractTp].cmmCdNm# #}#"
                                 }
                                ,{field:"saleEmpNo"     ,title:"<spring:message code = 'global.lbl.salEmp'/>", width:80, attributes:{"class":"ac"}}     //판매사원
                                ,{field:"contractDt"    ,title:"<spring:message code = 'global.lbl.contractDate'/>", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //계약일
                                ,{field:"dlReqDt"       ,title:"<spring:message code = 'global.lbl.dlReqDt'/>", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //인도요청일
                                ]
                      }
                     ,{field:"assignYn" ,title:"<spring:message code = 'global.lbl.assignYn'/>", width:80, attributes:{"class":"ac"}//배정여부
                       ,template:"# if(assignYnMap[assignYn] != null){# #= assignYnMap[assignYn].cmmCdNm# #}#"
                      }
                     ,{field:"stockTp"  ,title:"<spring:message code = 'global.lbl.stockStat'/>", width:80, attributes:{"class":"ac"}//재고상태
                       ,template:"# if(stockTpMap[stockTp] != null){# #= stockTpMap[stockTp].cmmCdNm# #}#"
                      }
                     ,{field:"allocDt"  ,title:"<spring:message code = 'global.lbl.allocDt'/>", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //배정일
                ]
    });


    // 배정계약현황 그리드.
    $("#assignStsG").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectAssignSts.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sContractNo"]      = $("#sContractNoT2").val();                     // 계약번호.
                        params["sContractCustNo"]  = $("#sContractCustNoT2").val();                 // 고객번호.
                        params["sContractStartDt"] = $("#sContractStartDtT2").data("kendoExtMaskedDatePicker").value();         // 계약일 - 시작일.
                        params["sContractEndDt"]   = $("#sContractEndDtT2").data("kendoExtMaskedDatePicker").value();           // 계약일 - 종료일.
                        params["sContractTp"]      = $("#sContractTpT2").val();                     // 판매유형
                        params["sDlReqStartDt"]    = $("#sDlReqStartDtT2").data("kendoExtMaskedDatePicker").value();            // 인도요청일 - 시작일
                        params["sDlReqEndDt"]      = $("#sDlReqEndDtT2").data("kendoExtMaskedDatePicker").value();              // 인도요청일 - 종료일
                        params["sCarlineCd"]       = $("#sCarlineCdT2").data("kendoExtDropDownList").value();                      // 차종
                        params["sModelCd"]         = $("#sModelCdT2").data("kendoExtDropDownList").value();                        // 모델
                        params["sOcnCd"]           = $("#sOcnCdT2").data("kendoExtDropDownList").value();                          // OCN
                        params["sExtColorCd"]      = $("#sExtColorCdT2").data("kendoExtDropDownList").value();                     // 외장색
                        params["sIntColorCd"]      = $("#sIntColorCdT2").data("kendoExtDropDownList").value();                     // 내장색
                        params["sVinNo"]           = $("#sVinNoT2").val();                          // VIN NO
                        params["sAllocStartDt"]    = $("#sAllocStartDtT2").data("kendoExtMaskedDatePicker").value();            // 인도요청일 - 시작일
                        params["sAllocEndDt"]      = $("#sAllocEndDtT2").data("kendoExtMaskedDatePicker").value();              // 인도요청일 - 종료일

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"allocQueNo"
                    ,fields:{
                        rnum     :{ type:"number"}
                       ,allocQueNo:{ type:"string"}
                       ,vinNo    :{ type:"string"}
                       ,carlineNm:{ type:"string"}
                       ,modelNm  :{ type:"string"}
                       ,ocnNm    :{ type:"string"}
                       ,extColorNm:{ type:"string"}
                       ,intColorNm:{ type:"string"}
                       ,contractNo:{ type:"string"}
                       ,contractCustNm:{ type:"string"}
                       ,contractTp:{ type:"string"}
                       ,saleEmpNm:{ type:"string"}
                       ,contractDt:{ type:"date"}
                       ,dlReqDt  :{ type:"date"}
                       ,assignYn :{ type:"string"}
                       ,allocDt  :{ type:"date"}
                    }
                }
            }
        }
        , autoBind:false
        , editable:false
        , height:384
        , columns:[ {field:"rnum"         ,title:"No.", width:50 ,attributes:{"class":"ac"}}
                     ,{field:"allocQueNo"   ,title:"<spring:message code = 'global.lbl.allocQueNo'/>"       ,width:100,attributes:{"class":"ac"}}             //배정번호
                     ,{field:"vinNo"        ,title:"VIN NO", width:150, attributes:{"class":"ac"}}
                     ,{title:"<spring:message code='ser.title.carInfo' />", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },                                                   //차량정보
                        columns:[{field:"carlineNm" ,title:"<spring:message code = 'global.lbl.carLine'/>"  ,width:150, attributes:{"class":"al"}}           //차종
                                ,{field:"modelNm"   ,title:"<spring:message code = 'global.lbl.model'/>"    ,width:250, attributes:{"class":"al"}}           //모델
                                ,{field:"ocnNm"     ,title:"OCN", width:250, attributes:{"class":"al"}}     //OCN
                                ,{field:"extColorNm",title:"<spring:message code = 'global.lbl.extColor'/>" ,width:200, attributes:{"class":"al"}}           //외장색
                                ,{field:"intColorNm",title:"<spring:message code = 'global.lbl.intColor'/>" ,width:200, attributes:{"class":"al"}}           //내장색
                                ]
                      }
                     ,{title:"<spring:message code = 'global.lbl.contractInfo'/>", attributes:{"class":"ac"} , headerAttributes:{ "class":"hasBob" },       //계약정보
                        columns:[{field:"contractNo"    ,title:"<spring:message code = 'global.lbl.contractNo'/>"   ,width:150, attributes:{"class":"ac"}}   //계약번호
                                ,{field:"contractCustNm",title:"<spring:message code = 'global.lbl.customer'/>"     ,width:100, attributes:{"class":"ac"}}   //고객
                                ,{field:"contractTp"    ,title:"<spring:message code = 'global.lbl.saleType'/>"     ,width:100, attributes:{"class":"ac"}    //판매유형
                                  ,template:"# if(contractTpMap[contractTp] !== '' ){# #= contractTpMap[contractTp].cmmCdNm# #}#"
                                 }
                                ,{field:"saleEmpNo"     ,title:"<spring:message code = 'global.lbl.salEmp'/>"      ,width:80, attributes:{"class":"ac"}}    //판매사원
                                ,{field:"contractDt"    ,title:"<spring:message code = 'global.lbl.contractDate'/>" ,width:100, attributes:{"class":"ac"}    //계약일
                                  ,format:"{0:<dms:configValue code='dateFormat' />}"}
                                ,{field:"dlReqDt"       ,title:"<spring:message code = 'global.lbl.dlReqDt'/>"      ,width:100, attributes:{"class":"ac"}    //인도요청일
                                  ,format:"{0:<dms:configValue code='dateFormat' />}"}
                                ]
                      }
                     ,{field:"assignYn" ,title:"<spring:message code = 'global.lbl.assignYn'/>"     ,width:80   ,attributes:{"class":"ac"}                   //배정여부
                       ,template:"# if(assignYnMap[assignYn] != null){# #= assignYnMap[assignYn].cmmCdNm# #}#"
                      }
                     ,{field:"stockTp"  ,title:"<spring:message code = 'global.lbl.stockStat'/>"    ,width:80   ,attributes:{"class":"ac"}                   //재고상태
                       ,template:"# if(stockTpMap[stockTp] != null){# #= stockTpMap[stockTp].cmmCdNm# #}#"
                      }
                     ,{field:"allocDt"  ,title:"<spring:message code = 'global.lbl.allocDt'/>"      ,width:100  ,attributes:{"class":"ac"}                   //배정일
                       ,format:"{0:<dms:configValue code='dateFormat' />}"}
                ]
    });


    // 미배정계약현황 그리드.
    $("#unAssignStsG").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectAssignMng.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNoT3").val();                          // 계약번호.
                        params["sContractCustNo"] = $("#sContractCustNoT3").val();                  // 고객번호.
                        params["sContractStartDt"] = $("#sContractStartDtT3").data("kendoExtMaskedDatePicker").value();   // 계약일 - 시작일.
                        params["sContractEndDt"] = $("#sContractEndDtT3").data("kendoExtMaskedDatePicker").value();       // 계약일 - 종료일.
                        params["sContractTp"] = $("#sContractTpT3").val();                          // 판매유형
                        params["sDlReqStartDt"] = $("#sDlReqStartDtT3").data("kendoExtMaskedDatePicker").value();         // 인도요청일 - 시작일
                        params["sDlReqEndDt"] = $("#sDlReqEndDtT3").data("kendoExtMaskedDatePicker").value();             // 인도요청일 - 종료일
                        params["sCarlineCd"] = $("#sCarlineCdT3").data("kendoExtDropDownList").value();     // 차종
                        params["sModelCd"] = $("#sModelCdT3").data("kendoExtDropDownList").value();         // 모델
                        params["sOcnCd"] = $("#sOcnCdT3").data("kendoExtDropDownList").value();             // OCN
                        params["sExtColorCd"] = $("#sExtColorCdT3").data("kendoExtDropDownList").value();   // 외장색
                        params["sIntColorCd"] = $("#sIntColorCdT3").data("kendoExtDropDownList").value();   // 내장색
                        params["sTabId"] = "unAssignContractStsT";                                  // TAB ID


                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"contractNo"
                    ,fields:{
                        rnum     :{ type:"number"}
                       ,carlineNm: { type:"string"}
                       ,modelNm  :{ type:"string"}
                       ,ocnNm    :{ type:"string"}
                       ,extColorNm:{ type:"string"}
                       ,intColorNm:{ type:"string"}
                       ,contractNo:{ type:"string"}
                       ,contractCustNm:{ type:"string"}
                       ,contractTp:{ type:"string"}
                       ,saleEmpNm:{ type:"string"}
                       ,contractDt:{ type:"date"}
                       ,dlReqDt  :{ type:"date"}
                    }
                }
            }
        }
        , autoBind:false
        , editable:false
        , height:384
        , columns:[ {field:"rnum", title:"No.", width:50 ,attributes:{"class":"ac"}}
                     ,{title:"<spring:message code = 'global.lbl.contractInfo'/>", attributes:{"class":"ac"} , headerAttributes:{ "class":"hasBob" },     //계약정보
                         columns:[{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:150, attributes:{"class":"ac"}}   //계약번호
                                 ,{field:"contractCustNm", title:"<spring:message code='global.info.customer' />", width:150, attributes:{"class":"ac"}}  //고객
                                 ,{field:"contractTp", title:"<spring:message code='global.lbl.saleType' />", width:100, attributes:{"class":"ac"}
                                   ,template:"# if(contractTpMap[contractTp] != null){# #= contractTpMap[contractTp].cmmCdNm# #}#"
                                  }                                                                            //판매유형
                                 ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.salEmp' />", width:80, attributes:{"class":"ac"}}     //판매사원
                                 ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDate' />", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //계약일
                                 ,{field:"dlReqDt", title:"<spring:message code='global.lbl.dlReqDt' />", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //인도요청일
                                 ]
                      }
                     ,{title:"<spring:message code='ser.title.carInfo' />", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },     //차량정보
                        columns:[{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}       //차종
                                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:250, attributes:{"class":"al"}}         //모델
                                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:250, attributes:{"class":"al"}} //OCN
                                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:200, attributes:{"class":"al"}}    //외장색
                                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:200, attributes:{"class":"al"}}    //내장색
                                ]
                      }
                     ]
    });




    // 배정취소이력현황 그리드.
    $("#assignCancelStsG").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectAssignCancelSts.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                          // 계약번호.
                        params["sContractCustNo"] = $("#sContractCustNo").val();                  // 고객번호.
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();  // 계약일 - 시작일.
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();      // 계약일 - 종료일.
                        params["sAssignYn"] = $("#sAssignYn").data("kendoExtDropDownList").value();                       // 배정여부
                        params["sContractTp"] = $("#sContractTp").data("kendoExtDropDownList").value();                   // 판매유형
                        params["sDlReqStartDt"] = $("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value();        // 인도요청일 - 시작일
                        params["sDlReqEndDt"] = $("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value();            // 인도요청일 - 종료일
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();     // 차종
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();         // 모델
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();             // OCN
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();   // 외장색
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();   // 내장색
                        params["sVinNo"] = $("#sVinNo").val();                                    // VIN NO
                        params["sTabId"] = "assignProcessT";                                      // TAB ID

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"allocQueNo"
                    ,fields:{
                        rnum     :{ type:"number"}
                       ,allocQueNo:{ type:"string"}
                       ,assignVinNo:{ type:"string"}
                       ,carlineNm: { type:"string"}
                       ,modelNm  :{ type:"string"}
                       ,ocnNm    :{ type:"string"}
                       ,extColorNm:{ type:"string"}
                       ,intColorNm:{ type:"string"}
                       ,contractNo:{ type:"string"}
                       ,contractCustNm:{ type:"string"}
                       ,contractTp:{ type:"string"}
                       ,saleEmpNm:{ type:"string"}
                       ,contractDt:{ type:"date"}
                       ,dlReqDt  :{ type:"date"}
                       ,assignYn :{ type:"string"}
                       ,allocDt  :{ type:"date"}
                       ,regDt    :{ type:"date"}
                    }
                }
            }
        }
        , autoBind:false
        , editable:false
        , height:384
        , columns:[ {field:"rnum", title:"No.", width:50 ,attributes:{"class":"ac"}}
                     ,{field:"allocQueNo", title:"<spring:message code='global.lbl.allocQueNo' />", width:100,attributes:{"class":"ac"}}             //배정번호
                     ,{field:"vinNo",title:"<spring:message code='global.lbl.vinNum' />", width:150, attributes:{"class":"ac"}}               //VIN NO
                     ,{title:"<spring:message code='global.lbl.carNo' />", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },     //차량정보
                        columns:[{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}       //차종
                                ,{field:"modelNm", title:"<spring:message code = 'global.lbl.model'/>", width:250, attributes:{"class":"al"}}         //모델
                                ,{field:"ocnNm", title:"<spring:message code = 'global.lbl.ocn'/>", width:250, attributes:{"class":"al"}} //OCN
                                ,{field:"extColorNm", title:"<spring:message code = 'global.lbl.extColor'/>", width:200, attributes:{"class":"al"}}    //외장색
                                ,{field:"intColorNm", title:"<spring:message code = 'global.lbl.intColor'/>", width:200, attributes:{"class":"al"}}    //내장색
                                ]
                      }
                     ,{title:"<spring:message code = 'global.lbl.contractInfo'/>", attributes:{"class":"ac"} , headerAttributes:{ "class":"hasBob" },    //계약정보
                        columns:[{field:"contractNo", title:"<spring:message code = 'global.lbl.contractNo'/>", width:150, attributes:{"class":"ac"}}   //계약번호
                                ,{field:"contractCustNm", title:"<spring:message code = 'global.lbl.customer'/>", width:100, attributes:{"class":"ac"}}  //고객
                                ,{field:"contractTp", title:"<spring:message code = 'global.lbl.saleType'/>", width:100, attributes:{"class":"ac"}
                                  ,template:"# if(contractTpMap[contractTp] !== '' ){# #= contractTpMap[contractTp].cmmCdNm# #}#"
                                 }                                                                            //판매유형
                                ,{field:"saleEmpNo", title:"<spring:message code = 'global.lbl.salEmp'/>", width:80, attributes:{"class":"ac"}}     //판매사원
                                ,{field:"contractDt", title:"<spring:message code = 'global.lbl.contractDate'/>", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //계약일
                                ,{field:"dlReqDt", title:"<spring:message code='global.lbl.dlReqDt' />", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //인도요청일
                                ]
                      }
                     ,{field:"assignYn", title:"<spring:message code = 'global.lbl.assignYn'/>", width:80, attributes:{"class":"ac"}
                       ,template:"# if(assignYnMap[assignYn] != null){# #= assignYnMap[assignYn].cmmCdNm# #}#"
                      }                                                                                       //배정여부
                     ,{field:"stockTp", title:"<spring:message code = 'global.lbl.stockStat'/>", width:80, attributes:{"class":"ac"}
                       ,template:"# if(stockTpMap[stockTp] != null){# #= stockTpMap[stockTp].cmmCdNm# #}#"
                      }                                                                                       //재고상태
                     ,{field:"allocDt", title:"<spring:message code = 'global.lbl.allocDt'/>", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //배정일
                     ,{field:"regDt", title:"<spring:message code='global.lbl.cancelDt' />", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //취소일
                ]
    });


    // 간반차트를 통해 넘어온 경우.
    if("${contNo}" != ""){
        $("#sContractNo").val("${contNo}");  // 계약번호
        $("#sContractStartDt").data("kendoExtMaskedDatePicker").value('');  // 계약일
        $("#sContractEndDt").data("kendoExtMaskedDatePicker").value('');    // 계약일
        $("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value('');     // 인도요청일
        $("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value('');       // 인도요청일
        $("#assignProcessG").data("kendoExtGrid").dataSource.page(1);
    }

});



function getSaveData(){

    var grid = $("#assignProcessG").data("kendoExtGrid");
    var selectIdx = grid.select().index();

    if(selectIdx ==  -1 ){
        // 목록을 선택하여 주십시오.
        dms.notification.warning("<spring:message code='global.info.required.select' />");
        return false;
    }

    var data = grid.dataSource.view();
    var selectVal = data[selectIdx];

    var saveData = {
            dlrCd:selectVal.dlrCd
            ,contractNo:selectVal.contractNo
            ,vinNo:selectVal.assignVinNo
        };

        return saveData;
}



//고객 팝업 열기 함수.
function selectBpPopupWindow(tab){

    popupWindow = dms.window.popup({
        windowId:"bpCdPopup"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    if(tab == "T1"){
                        $("#sContractCustNo").val(data[0].custNo);
                        $("#sContractCustNm").val(data[0].custNm);
                    }else if(tab == "T2"){
                        $("#sContractCustNoT2").val(data[0].custNo);
                        $("#sContractCustNmT2").val(data[0].custNm);
                    }else if(tab == "T3"){
                        $("#sContractCustNoT3").val(data[0].custNo);
                        $("#sContractCustNmT3").val(data[0].custNm);
                    }else if(tab == "T4"){
                        $("#sContractCustNoT4").val(data[0].custNo);
                        $("#sContractCustNmT4").val(data[0].custNm);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}


//검색조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    if(dms.string.isEmpty(e.data.from.val())){return;}
    if(dms.string.isEmpty(e.data.to.val())){return;}

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

</script>
<!-- //script -->











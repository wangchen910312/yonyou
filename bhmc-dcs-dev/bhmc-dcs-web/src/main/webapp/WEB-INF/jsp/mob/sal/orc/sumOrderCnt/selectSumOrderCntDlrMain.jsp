<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list" class="content_list" style="display:none;">
            <div class="content_title conttitlePrev">
                <h1 id="content_list_title"><spring:message code='global.title.sumOrderCntCorp' /> <spring:message code='global.title.list' /><!-- 종합오더현황 목록 --></h1>
                <!-- div class="title_btn">
                    <a href="#">추가</a>
                </div -->
            </div>
            <div class="skeyarea"><div>
                <table class="slist01">
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr id="stOrdTp">
                            <th scope="row"><spring:message code='global.lbl.orderType' /></th> <!-- 주문유형 -->
                            <td>
                                <span id="siOrdTp"></span>
                            </td>
                        </tr>
                        <tr id="stOrdYyMmPrid">
                            <th scope="row"><spring:message code='global.lbl.week' /></th>  <!-- 주차 -->
                            <td>
                                <span id="siOrdYyMmPrid"></span>
                            </td>
                        </tr>
                        <tr id="stOrdStartDt">
                            <th scope="row"><spring:message code='global.lbl.term' /></th>    <!-- 기간 -->
                            <td>
                                <span id="siOrdStartDt"></span> ~ <span id="siOrdEndDt"></span>
                            </td>
                        </tr>
                        <tr id="stOrdStatCd">
                            <th scope="row"><spring:message code='global.lbl.ordStat' /></th> <!-- 주문상태 -->
                            <td>
                                <span id="siOrdStatCd"></span><span id="sbOrdStatCd" class="btn_delete"></span>
                            </td>
                        </tr>
                        <tr id="stCarlineCd">
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                            <td>
                                <span id="siCarlineCd"></span><span id="sbCarlineCd" class="btn_delete"></span>
                            </td>
                        </tr>
                        <tr id="stModelCd">
                            <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                            <td>
                                <span id="siModelCd"></span><span id="sbModelCd" class="btn_delete"></span>
                            </td>
                        </tr>
                        <tr id="stOcnCd">
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                            <td>
                                <span id="siOcnCd"></span><span id="sbOcnCd" class="btn_delete"></span>
                            </td>
                        </tr>
                        <tr id="stExtColorCd">
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                            <td>
                                <span id="siExtColorCd"></span><span id="sbExtColorCd" class="btn_delete"></span>
                            </td>
                        </tr>
                        <tr id="stIntColorCd">
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                            <td>
                                <span id="siIntColorCd"></span><span id="sbIntColorCd" class="btn_delete"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div></div>
            <div class="listarea">
                <ul>
                    <li class="listhead">
                        <div class="dlistitem">
                            <span class="strong"><spring:message code='global.lbl.ocn' /><!-- OCN --></span>
                            <span class="fright""><spring:message code='global.lbl.orderType' /><!-- 주문유형 --></span>
                            <span class="clboth"><spring:message code='global.lbl.reqQty' /><!-- 요청수량 --></span>
                            <span class="fright"><spring:message code='global.lbl.cancQty' /><!-- 취소수량 --></span>
                        </div>
                    </li>
                </ul>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h1><spring:message code='global.title.sumOrderCntCorp' /> <spring:message code='global.title.search' /><!-- 종합오더현황 조회조건 --></h1>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.orderType' /></span></th> <!-- 주문유형 -->
                            <td class="required_area">
                                <input id="sOrdTp" class="form_comboBox" />
                            </td>
                        </tr>
                        <!-- tr>
                            <th scope="row">달력테스트</th>
                            <td>
                                <div class="f_data">
                                    <input type="text" id="sOrdStartDt4" value="" class="" readOnly >
                                    <span class="date" onclick="calpicker('sOrdStartDt4')">날짜선택</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">달력테스트-년/월</th>
                            <td>
                                <div class="f_data">
                                    <input type="text" id="sOrdStartDt5" value="" class="" readOnly>
                                    <span class="time" onclick="datepicker('sOrdStartDt5')">시간선택</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">달력테스트-시간</th>
                            <td>
                                <div class="f_data">
                                    <input type="text" id="sOrdStartDt6" value="" class="" readOnly>
                                    <span class="time" onclick="timepicker('sOrdStartDt6')">시간선택</span>
                                </div>
                            </td>
                        </tr -->
                        <tr>
                            <th class="group-week" scope="row"><span class="bu_required"><spring:message code='global.lbl.week' /></span></th>  <!-- 주차 -->
                            <td class="required_area group-week">
                                <input id="sOrdYyMmPrid" class="form_comboBox ac" style="width:100px;" />
                            </td>
                        </tr>
                        <tr>
                            <th class="group-term" scope="row" style="display:none"><span class="bu_required"><spring:message code='global.lbl.term' /></span></th>    <!-- 기간 -->
                            <td class="required_area group-term" style="display:none">
                                <div class="f_data">
                                    <input type="text" id="sOrdStartDt" value="" class="" readOnly />
                                    <span class="date" onclick="calpicker('sOrdStartDt')">날짜선택</span>
                                </div>
                                ~
                                <div class="f_data">
                                    <input type="text" id="sOrdEndDt" value="" class="" readOnly />
                                    <span class="date" onclick="calpicker('sOrdEndDt')">날짜선택</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ordStat' /></th> <!-- 주문상태 -->
                            <td>
                                <input id="sOrdStatCd" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                            <td>
                                <input id="sCarlineCd" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                            <td>
                                <input id="sModelCd" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                            <td>
                                <input id="sOcnCd" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                            <td>
                                <input id="sExtColorCd" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                            <td class="bor_none">
                                <input id="sIntColorCd" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <span id="btnSearch" class="btnd2"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
        </section>

        <!-- content_detail -->
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h1><spring:message code='global.title.sumOrderCntCorp' /> <spring:message code='global.title.detail' /><!-- 종합오더현황 상세목록 --></h1>
            </div>
            <div class="table_form form_width_70per">
                <input id="dDlrCd" type="hidden" readonly />
                <input id="dOrdYyMmDt" type="hidden" readonly />
                <input id="dWeek" type="hidden" readonly />
                <input id="dCarlineCd" type="hidden" readonly />
                <input id="dOrdNo" type="hidden" readonly />

                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                            <td>
                                <input id="dCarlineNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                            <td>
                                <input id="dModelNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                            <td>
                                <input id="dOcnNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                            <td>
                                <input id="dExtColorNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                            <td>
                                <input id="dIntColorNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.orderType' /></th>        <!-- 주문유형:Name 변경 -->
                            <td>
                                <input id="dOrdTp" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.orderGrade' /></th>        <!-- 주문등급:Name 변경 -->
                            <td>
                                <input id="dOrdGradeCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.reqQty' /></th>        <!-- 요청수량 -->
                            <td>
                                <input id="dOrdQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.fstConfirmQty' /></th>        <!-- 1차심사결과 -->
                            <td>
                                <input id="dFstConfirmQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.scndConfirmQty' /></th>        <!-- 2차심사결과 -->
                            <td>
                                <input id="dScndConfirmQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cancQty' /></th>        <!-- 취소수량 -->
                            <td>
                                <input id="dCnclQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.nOrdQty' /></th>        <!-- 미배정 -->
                            <td>
                                <input id="dNOrdQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.pdiQty' /></th>        <!-- PDI배정 -->
                            <td>
                                <input id="dPdiQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinQty' /></th>        <!-- VIN배정 -->
                            <td>
                                <input id="dVinQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.dlrSaleQty' /></th>        <!-- 법인출고 -->
                            <td>
                                <input id="dFinalQty" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="bor_none"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="listarea">
                <ul>
                    <li class="listhead">
                        <div class="dlistitem">
                            <span class=""><spring:message code='global.lbl.orderType' /><!-- 주문유형 --></span>
                            <span class="fright strong"><spring:message code='global.lbl.ordStat' /><!-- 주문상태 --></span>
                            <span class="clboth"><spring:message code='global.lbl.carRegDt' /><!-- 주문등록일자 --></span>
                            <span class="fright"><spring:message code='global.lbl.chrgCd' /><!-- 주문자 --></span>
                            <span class="clboth"><spring:message code='global.lbl.giDocRegDt' /><!-- 출고일자 --></span>
                        </div>
                    </li>
                </ul>
                <iframe id="subList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>

        <!-- content_subdetail -->
        <section id="content_subdetail" class="content_detail" style="display:none">
            <div class="content_title">
                <h1><spring:message code='global.title.sumOrderCntCorp' /> <spring:message code='global.title.detail' /><!-- 종합오더현황 상세목록 --></h1>
            </div>
            <div class="table_form form_width_70per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.orderType' /></th>   <!-- 주문유형 -->
                            <td>
                                <input id="sdOrdTp" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ordStat' /></th>   <!-- 주문상태 -->
                            <td>
                                <input id="sdOrdStatCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carRegDt' /></th>   <!-- 등록일자 -->
                            <td>
                                <input id="sdOrdDate" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.chrgCd' /></th>   <!-- 주문자 -->
                            <td>
                                <input id="sdChrgCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ordNo' /></th>   <!-- 주문번호 -->
                            <td>
                                <input id="sdOrdSeq" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.yard' /></th>   <!-- 하치장명 -->
                            <td>
                                <input id="sdVinmVloc" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.fndlDt' /></th>   <!-- 납기예정일 -->
                            <td>
                                <input id="sdFndlDt" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                            <td>
                                <input id="sdCarlineCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carlineNm' /></th>   <!-- 차종 -->
                            <td>
                                <input id="sdCarlineNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /></th>   <!-- 모델 -->
                            <td>
                                <input id="sdModelCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.modelNm' /></th>   <!-- 모델 -->
                            <td>
                                <input id="sdModelNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th>   <!-- OCN -->
                            <td>
                                <input id="sdOcnCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocnNm' /></th>   <!-- OCN -->
                            <td>
                                <input id="sdOcnNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th>   <!-- 외장색 -->
                            <td>
                                <input id="sdExtColorCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.extColorNm' /></th>   <!-- 외장색명 -->
                            <td>
                                <input id="sdExtColorNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th>   <!-- 내장색 -->
                            <td>
                                <input id="sdIntColorCd" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.intColorNm' /></th>   <!-- 내장색명 -->
                            <td>
                                <input id="sdIntColorNm" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.llbl.pdiDt' /></th>   <!-- PDI배정일 -->
                            <td>
                                <input id="sdPdiDt" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinDt' /></th>   <!-- VIN배정일 -->
                            <td>
                                <input id="sdVinDt" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.giDocRegDt' /></th>   <!-- 출고일자 -->
                            <td>
                                <input id="sdRetailDt" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNo' /></th>   <!-- VIN -->
                            <td>
                                <input id="sdVinNo" class="form_input" readonly />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="bor_none"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var subParam = {};

//주문유형 SAL137
var ordTpList = [];
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
<c:if test="${obj.cmmCd ne 'N3' && obj.cmmCd ne 'N5' && obj.cmmCd ne 'NS' && obj.cmmCd ne 'N7'}">
  ordTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:if>
  ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//주차
var ordYyMmPridList = [];
<c:forEach var="obj" items="${ordYyMmPridInfo}">
  ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
</c:forEach>

//주문상태 SAL150
var ordStatCdList = [];
var ordStatCdObj = {};
<c:forEach var="obj" items="${ordStatCdDS}">
  ordStatCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
  ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//하치장 SAL152
var vinmVlocObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
    // 주문유형
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       ,select:function (e){
           var ordTpCd = this.dataItem(e.item).cmmCd;
           if( ordTpCd != null && ordTpCd != ""){
               if( ordTpCd == "N1" ){
                   $(".group-week").show();
                   $(".group-term").hide();
               }else{
                   $(".group-term").show();
                   $(".group-week").hide();
               }
           }
       }
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
       ,value:"N1"
    });

    // 주차
    $("#sOrdYyMmPrid").kendoExtDropDownList({
        dataTextField:"btoYmwNm"
       ,dataValueField:"btoYmwCd"
       ,dataSource:ordYyMmPridList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
       ,index:ordYyMmPridList.length
    });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
       ,select:function(e){
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           var dataItem = this.dataItem(e.item);
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
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
       ,optionLabel:"<spring:message code="global.lbl.check" />"   // 전체
       ,select:function(e){
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           var dataItem = this.dataItem(e.item);
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
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
        ,optionLabel:"<spring:message code="global.lbl.check" />"   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:"<spring:message code="global.lbl.check" />"   // 전체
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:"<spring:message code="global.lbl.check" />"   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 주문상태
    $("#sOrdStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordStatCdList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    //타이틀
    $("#header_title").html("<spring:message code='global.title.sumOrderCntDlr' />");<!-- 종합오더현황-딜러 -->
    $("#header_title").on("click", contentSearch);

    //종합오더현황 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrList.do' />");

    //버튼 - 조회
    $("#btnSearch").bind("click", function()
    {
        contentList();
        $("#mainList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrList.do' />");
    });

    //버튼 - 전체조건 삭제
    $("#btnAllDelete").bind("click", function()
    {
        $("#sOrdStatCd").data("kendoExtDropDownList").value("");
        $("#sCarlineCd").data("kendoExtDropDownList").value("");
        $("#sModelCd").data("kendoExtDropDownList").value("");
        $("#sOcnCd").data("kendoExtDropDownList").value("");
        $("#sExtColorCd").data("kendoExtDropDownList").value("");
        $("#sIntColorCd").data("kendoExtDropDownList").value("");
        $("#btnSearch").click();
    });

    $("#sbOrdStatCd").bind("click", function()
    {
        $("#sOrdStatCd").data("kendoExtDropDownList").value("");
        $("#btnSearch").click();
    });
    $("#sbCarlineCd").bind("click", function()
    {
         $("#sCarlineCd").data("kendoExtDropDownList").value("");
         $("#btnSearch").click();
    });
    $("#sbModelCd").bind("click", function()
    {
        $("#sModelCd").data("kendoExtDropDownList").value("");
        $("#btnSearch").click();
    });
    $("#sbOcnCd").bind("click", function()
    {
        $("#sOcnCd").data("kendoExtDropDownList").value("");
        $("#btnSearch").click();
    });
    $("#sbExtColorCd").bind("click", function()
         {
         $("#sExtColorCd").data("kendoExtDropDownList").value("");
         $("#btnSearch").click();
    });
    $("#sbIntColorCd").bind("click", function()
    {
        $("#sIntColorCd").data("kendoExtDropDownList").value("");
        $("#btnSearch").click();
    });

    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
        else if ($("#content_subdetail").css("display") == "block") { contentDetail(); }
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

// iframe 높이값 계산
function setMainListHeight() {
    var lsitareaHeight = $(window).height() - $("#header").height() - $("#content_list > .content_title").innerHeight() - 2;

    if( $(".skeyarea").is(':visible') ){ lsitareaHeight -= $(".skeyarea").innerHeight(); }
    if( $(".con_btnarea").is(':visible') ){ lsitareaHeight -= $(".con_btnarea").innerHeight(); }

    $("#mainList").parent(".listarea").css("height",lsitareaHeight);
    $("#mainList").css("height", lsitareaHeight - $("#content_list .listarea > ul>li.listhead").innerHeight());
}

//메인화면 가기
function goMain() {
    window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_list").css("display","block");
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_search").css("display","block");
}

//상세페이지 보기
function contentDetail() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_detail").css("display","block");
}

//상세페이지 보기
function contentDetail(dlrCd, ordYyMmDt, ordPrid, yyMm, week, ordStatCd, ordGradeCd, carlineCd, carlineNm, modelCd, modelNm, ocnCd, ocnNm, extColorCd, extColorNm, intColorCd, intColorNm, ordTp, ordQty, fstConfirmQty, scndConfirmQty, cnclQty, cnclRsn, nOrdQty, pdiQty, vinQty, dlrSaleQty, ordNo, finalQty, wtOrdQty, dlrCnclQty) {
    $("#dDlrCd").val(dlrCd);
    $("#dOrdYyMmDt").val(ordYyMmDt);
    $("#dWeek").val(week);
    $("#dCarlineCd").val(carlineCd);
    $("#dOrdNo").val(ordNo);

    $("#dCarlineNm").val(carlineNm);            <!-- 차종 -->
    $("#dModelNm").val(modelNm);                <!-- 모델 -->
    $("#dOcnNm").val(ocnNm);                    <!-- OCN -->
    $("#dExtColorNm").val(extColorNm);          <!-- 외장색 -->
    $("#dIntColorNm").val(intColorNm);          <!-- 내장색 -->
    $("#dOrdTp").val(ordTp);                    <!-- 주문유형 -->
    $("#dOrdGradeCd").val(ordGradeCd);          <!-- 주문등급 -->
    $("#dOrdQty").val(ordQty);                  <!-- 요청수량 -->
    $("#dFstConfirmQty").val(fstConfirmQty);    <!-- 1차심사결과 -->
    $("#dScndConfirmQty").val(scndConfirmQty);  <!-- 2차심사결과 -->
    $("#dCnclQty").val(cnclQty);                <!-- 취소수량 -->
    $("#dNOrdQty").val(nOrdQty);                <!-- 미배정 -->
    $("#dPdiQty").val(pdiQty);                  <!-- PDI배정 -->
    $("#dVinQty").val(vinQty);                  <!-- VIN배정 -->
    $("#dFinalQty").val(finalQty);              <!-- 법인출고 -->

    $("#subList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubList.do' />");

    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_detail").css("display","block");
}

//서브상세페이지 보기
function contentSubDetail(totCnt, ordTp, ordStatCd, ordDate, chrgCd, ordSeq, vinmVloc, fndlDt, carlineCd, carlineNm, modelCd, modelNm, ocnCd, ocnNm, extColorCd, extColorNm, intColorCd, intColorNm, pdiDt, vinDt, retailDt, vinNo) {
    $("#sdOrdTp").val(ordTp);              <!-- 주문유형 -->
    $("#sdOrdStatCd").val(ordStatCd);      <!-- 주문상태 -->
    $("#sdOrdDate").val(ordDate);          <!-- 등록일자 -->
    $("#sdChrgCd").val(chrgCd);            <!-- 주문자 -->
    $("#sdOrdSeq").val(ordSeq);            <!-- 주문번호 -->
    $("#sdVinmVloc").val(vinmVloc);        <!-- 하치장명 -->
    $("#sdFndlDt").val(fndlDt);            <!-- 납기예정일 -->
    $("#sdCarlineCd").val(carlineCd);      <!-- 차종 -->
    $("#sdCarlineNm").val(carlineNm);      <!-- 차종 -->
    $("#sdModelCd").val(modelCd);          <!-- 모델 -->
    $("#sdModelNm").val(modelNm);          <!-- 모델 -->
    $("#sdOcnCd").val(ocnCd);              <!-- OCN -->
    $("#sdOcnNm").val(ocnNm);              <!-- OCN -->
    $("#sdExtColorCd").val(extColorCd);    <!-- 외장색 -->
    $("#sdExtColorNm").val(extColorNm);    <!-- 외장색명 -->
    $("#sdIntColorCd").val(intColorCd);    <!-- 내장색 -->
    $("#sdIntColorNm").val(intColorNm);    <!-- 내장색명 -->
    $("#sdPdiDt").val(pdiDt);              <!-- PDI배정일 -->
    $("#sdVinDt").val(vinDt);              <!-- VIN배정일 -->
    $("#sdRetailDt").val(retailDt);        <!-- 출고일자 -->
    $("#sdVinNo").val(vinNo);              <!-- VIN -->

    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","block");
}
</script>
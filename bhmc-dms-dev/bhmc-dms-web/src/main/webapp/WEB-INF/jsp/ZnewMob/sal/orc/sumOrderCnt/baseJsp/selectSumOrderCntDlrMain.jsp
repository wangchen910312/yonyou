<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
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
var fifteenDayBf = "${fifteenDayBf}";
var _ordPrid;
var _ordsTp;
var totalOrdQty,totalFinalQty,totalFstConfirmQty,totalScndConfirmQty;
</script>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/sal/orc/sumOrderCnt/listJsp/selectSumOrderCntDlrList.jsp" />
        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='global.lbl.orderStatus' /> <spring:message code="global.title.searchCondition" /><!-- 오더종합현황 조회조건 --></h2>
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
                           <th scope="row"><spring:message code="global.lbl.ordTp" /><!-- 오더유형 --></th>
                           <td>
                                <div id="ordTpRadio">
                                    <input type="radio" id="radio04" name="radio" class="f_radio" value="Y" checked /><label for="radio04" >常规订单</label>
                                    <input type="radio" id="radio05" name="radio" class="f_radio" value="N" /><label for="radio05" > 非常规订单</label>
                                </div>
                           </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required" id="sOrdsTpTh"><spring:message code="global.lbl.orderType" /><!-- 주문유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sOrdsTp" type="form_comboBox"/></div>
                            </td>
                        </tr>
                        <tr class="sOrdYyMmPrid" class="required">
                            <th scope="row" class="required"><spring:message code="global.lbl.orderWeek" /><!-- 주문주차 --></th>
                            <td>
                                <div class="f_text"><input type="text" name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="form_comboBox"/></div>
                            </td>
                        </tr>
                        <tr class="orderRegDt">
                            <th scope="row" class="required"><span><spring:message code='global.lbl.orderRegDt' /></span></th>    <!-- 주문등록일 -->
                             <td class="f_term">
                                <div class="f_item01" style="width:82%">
                                    <input type="date" id="sOrdStartDt" value="${fifteenDayBf}" style="background-color: #ffffff;" />
                                    <%-- <input type="search" id="sOrdStartDt" value="${fifteenDayBf}"  />
                                    <span class="date" onclick="calpicker('sOrdStartDt')"><spring:message code='global.lbl.date' /></span> --%>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01" style="width:82%">
                                    <input type="search" id="sOrdEndDt" value="${toDay}" style="background-color: #ffffff;"/>
                                    <%-- <input type="search" id="sOrdEndDt" value="${toDay}"  />
                                    <span class="date" onclick="calpicker('sOrdEndDt')"><spring:message code='global.lbl.date' /></span> --%>
                                </div>
                            </td>
                        </tr>
                        <tr style="display:none">
                            <th scope="row"><spring:message code='sal.lbl.ordStat' /></th><!-- 오더상태 -->
                            <td>
                                <div class="f_text"><input type="text" id="sOrdStatCd" class="form_comboBox"></div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <div class="f_text"><input type="text" id="sCarlineCd" class="form_comboBox"></div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                            <td>
                                <div class="f_text"><input type="text" id="sModelCd" class="form_comboBox"></div>
                                <input id="hiddenFscCode" type="hidden" />
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                            <td>
                                <div class="f_text"><input type="text" id="sOcnCd" class="form_comboBox"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sExtColorCd" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sIntColorCd" class="form_comboBox" ></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12599" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>




        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code='global.lbl.orderStatus' /> <spring:message code='ser.title.campaign.detailInfo' /><!-- 오더종합현황 상세정보 --></h2>
                </div>
                <div class="formarea">


                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col>
                        </colgroup>
                        <tbody class="detialListData">
                            <input id="dlrCd" type="hidden" value=""  />
                            <input id="ordYyMmDt" type="hidden" value=""  />
                            <!-- <input id="ordPrid" type="hidden" value=""  /> -->
                            <!-- <input id="ordsTp" type="hidden" value=""  />  -->
                            <!--  <input id="carlineCd" type="hidden" value=""  />-->
                            <input id="modelCd" type="hidden" value=""  />
                            <!-- <input id="ocnCd" type="hidden" value=""  />-->
                            <!-- <input id="extColorCd" type="hidden" value=""  />-->
                            <input id="intColorCd" type="hidden" value=""  />
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carlineCd' /></th>   <!-- 차종코드 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="carlineCd" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='par.lbl.carLine' /></th>   <!-- 차종명칭 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="carlineNm" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="modelNm" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocnCode' /></th>     <!-- OCN코드 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="ocnCd" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocnNm' /></th>     <!-- OCN명 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="ocnNm" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColorCd' /></th>        <!-- 외장색 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="extColorCd" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColorNm' /></th>        <!-- 외장색 -->
                                <td>
                                    <div class="f_text f_disabled"><input id="extColorNm" type="text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="co_group">
                    <div class="content_title">
                        <h2><spring:message code="global.btn.moreInfo" /><!-- 상세정보 --></h2>
                        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                    </div>
                    <div class="co_view" style="display:none;">
                        <div class="formarea">
                            <table  class="flist01">
                                <caption></caption>
                                <colgroup>
                                    <col style="width:30%;">
                                    <col>
                                </colgroup>
                                <tbody class="detialListData">
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="intColorNm" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.orderType' /></th>        <!-- 주문유형:Name 변경 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="ordTp" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.orderGrade' /></th>        <!-- 주문등급:Name 변경 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="ordGradeCd" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.reqQty' /></th>        <!-- 요청수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="ordQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.fstConfirmQty' /></th>        <!-- 1차심사결과 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="fstConfirmQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.scndConfirmQty' /></th>        <!-- 2차심사결과 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="scndConfirmQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evalRequestQty' /></th>        <!-- 심사미통과 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="scndParIsffAdjQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.wtOrdQty' /></th>        <!-- 승인대기수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="wtOrdQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.dlrCnclQty' /></th>        <!-- 승인후취소수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dlrCnclQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.finalConfQty' /></th>        <!-- 최종확인수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="sumTotalQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.nOrdQty' /></th>        <!-- 미배정수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="nonAlocQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.orderAssignQty' /></th>       <!--주문배정수량-->
                                        <td>
                                            <div class="f_text f_disabled"><input id="pdiQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.misSetQty' /></th>       <!--임무배정-->
                                        <td>
                                            <div class="f_text f_disabled"><input id="misSetQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.tranSchQty' /></th>       <!--배송임무-->
                                        <td>
                                            <div class="f_text f_disabled"><input id="tranSchQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>


                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.vinQty' /></th>        <!-- VIN배정수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="vinQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.dlrSaleQty' /></th>        <!-- 공장출고수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="gateOutQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.stockCnt' /></th>        <!-- 재고수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dlrInQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.retlQty' /></th>        <!-- 소매수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dlrOutQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>


                                    <%-- <tr>
                                        <th scope="row"><spring:message code='global.lbl.cancQty' /></th>        <!-- 취소수량 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dCnclQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.nOrdQty' /></th>        <!-- 미배정 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dNOrdQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.pdiQty' /></th>        <!-- PDI배정 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dPdiQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.vinQty' /></th>        <!-- VIN배정 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dVinQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.dlrSaleQty' /></th>        <!-- 법인출고 -->
                                        <td>
                                            <div class="f_text f_disabled"><input id="dFinalQty" type="text" placeholder="" disabled="disabled"/></div>
                                        </td>
                                    </tr> --%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:import url="/WEB-INF/jsp/ZnewMob/sal/orc/sumOrderCnt/listJsp/selectSumOrderCntDlrSubList.jsp" />
                <div class="con_btnarea">
                      <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
                 </div>
            </section>
        </div>

        <!-- content_subdetail -->
        <section id="content_subdetail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='global.lbl.orderStatus' /> <spring:message code='global.title.detail' /><!-- 종합오더현황 상세목록 --></h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <tbody class="subdetialListData">
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.orderRegDt' /></th>   <!-- 주문일자 -->
                            <td>
                                <div class="f_text f_disabled"><input id="ordDate" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.chrgCd' /></th>   <!-- 주문자 -->
                            <td>
                                <div class="f_text f_disabled"><input id="chrgCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ordNo' /></th>   <!-- 오더번호 -->
                            <td>
                                <div class="f_text f_disabled"><input id="ordSeq" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.ordStat' /></th>   <!-- 주문상태 -->
                            <td>
                                <div class="f_text f_disabled"><input id="ordStatCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.plant' /></th>   <!-- 공장 -->
                            <td>
                                <div class="f_text f_disabled"><input id="vinmVloc" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <%-- <tr>
                            <th scope="row"><spring:message code='crm.lbl.vinNo' /></th>   <!-- VIN -->
                            <td>
                                <div class="f_text f_disabled"><input id="sdVinNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr> --%>
                         <tr>
                            <th scope="row"><spring:message code='sal.lbl.ordSetDt' /></th>   <!-- 오더배정일자 -->
                            <td>
                                <div class="f_text f_disabled"><input id="pdiDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinDt' /></th>   <!-- VIN배정일 -->
                            <td>
                                <div class="f_text f_disabled"><input id="vinDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.giDocDt' /></th>   <!-- 출고일자 -->
                            <td>
                                <div class="f_text f_disabled"><input id="retailDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.grDts' /></th>   <!-- 입고일자 -->
                            <td>
                                <div class="f_text f_disabled"><input id="grDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.saleDt' /></th>   <!-- 판매일자 -->
                            <td>
                                <div class="f_text f_disabled"><input id="saleDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script>
var subParam = {};
//주문유형 SAL137 N1만
var ordTpObj = {};
var ordTpListN1 = [];
<c:forEach var="obj" items="${ordTpDS}">
    <c:if test="${obj.cmmCd eq 'N1'}">
      ordTpListN1.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//주문유형 SAL137 N1제외
var ordTpList = [];
<c:forEach var="obj" items="${ordTpDS}">
    <c:if test="${obj.cmmCd ne 'N1'}">
      ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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
  ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//BTO주문상태 SAL135
var btoOrdStatCdList = [];
var btoOrdStatCdObj = {};
<c:forEach var="obj" items="${btoOrdStatCdDS}">
  btoOrdStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  btoOrdStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//하치장 SAL152
var vinmVlocObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {
    $("#sOrdsTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ordTpListN1)

    });
    $("#ordTpRadio input[type=radio][name=radio]").change(function (){
        if($(this).val()=="Y"){
            //$("#sOrdsTp").data("kendoExtDropDownList").setOptions({optionLabel:null});
            $("#sOrdsTp").data("kendoExtDropDownList").setDataSource(ordTpListN1);
            $("#sOrdsTpTh").attr("class","required");
            $(".orderRegDt").hide();
            $(".sOrdYyMmPrid").show();
        }else{
            //$("#sOrdsTp").data("kendoExtDropDownList").setOptions({index:1});
            $("#sOrdsTp").data("kendoExtDropDownList").setDataSource(ordTpList);
            if( $("#sOrdStartDt").val() == "" || $("#sOrdStartDt").val() == null ){
                $("#sOrdStartDt").val(chgServerDate2Str(fifteenDayBf));
                $("#sOrdEndDt").val(chgServerDate2Str(toDay));
            }
            $(".sOrdYyMmPrid").hide();
            $(".orderRegDt").show();
        }
        $("#sOrdsTp").data("kendoExtDropDownList").select(0);
    });


    /**
     * 주문주차 콤보박스
     */
     $("#sOrdYyMmPrid").kendoExtDropDownList({
         dataTextField:"btoYmwNm"
        ,dataValueField:"btoYmwCd"
        ,dataSource:ordYyMmPridList
        ,index:0
     });

    /**
     * 주문유형에 따른 주문주차 및 메모 조회
     */
     function onSelectOrdTp(e) {
         var ordTpCd = this.dataItem(e.item).cmmCd;
         if( ordTpCd != null && ordTpCd != ""){
             /* if( ordTpCd == "N1" ){ */
             if( ordTpCd == "C1" ){
                 $("#sOrdStartDt").val("");
                 $("#sOrdEndDt").val("");
                 var responseJson = dms.ajax.getJson({
                     url:"<c:url value='/sal/orm/btoSearchOrder/selectOrdWeekRemark.do'/>"
                     ,data:JSON.stringify({"sOrdTp":this.dataItem(e.item).cmmCd})
                     ,async:false
                 });
                 $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource(responseJson.data);
                 $("#sOrdYyMmPrid").data("kendoExtDropDownList").select(responseJson.data.length);
                 $(".orderRegDt").hide();
                 $(".sOrdYyMmPrid").show();
             }else{
                 if( $("#sOrdStartDt").val() == "" || $("#sOrdStartDt").val() == null ){
                     $("#sOrdStartDt").val(chgServerDate2Str(oneDay));
                     $("#sOrdEndDt").val(chgServerDate2Str(toDay));
                 }
                 $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource([]);
                 $("#sOrdStartDt").val(chgServerDate2Str(oneDay));
                 $("#sOrdEndDt").val(chgServerDate2Str(toDay));
                 $(".sOrdYyMmPrid").hide();
                 $(".orderRegDt").show();
             }
         }else{
             $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource([]);
             if( $("#sOrdStartDt").val() == "" || $("#sOrdStartDt").val() == null ){
                 $("#sOrdStartDt").val(chgServerDate2Str(oneDay));
                 $("#sOrdEndDt").val(chgServerDate2Str(toDay));
             }
         }
         $("#sCarlineCd").data("kendoExtDropDownList").value("");
         $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
     };


     $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdList
        ,optionLabel:" "   // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([{fscNm:"", fscCd:""}]);
            $("#sModelCd").data("kendoExtDropDownList").enable(true);

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([{ocnNm:"", ocnCd:""}]);   // OCN data
            $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([{extColorNm:"", extColorCd:""}]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([{intColorNm:"", intColorCd:""}]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            $("#hiddenFscCode").val("");

            if(dataItem.carlineCd == ""){
                $("#sModelCd").data("kendoExtDropDownList").setDataSource([{fscNm:"", fscCd:""}]);
                $("#sModelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
                ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
                ,async:false
            });
            $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
     });

     // 모델
     $("#sModelCd").kendoExtDropDownList({
         dataTextField:"fscNm"
        ,dataValueField:"fscCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([{ocnNm:"", ocnCd:""}]);
            $("#sOcnCd").data("kendoExtDropDownList").enable(true);

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([{extColorNm:"", extColorCd:""}]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([{intColorNm:"", intColorCd:""}]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            $("#hiddenFscCode").val("");

            if(dataItem.modelCd == ""){
                $("#sOcnCd").data("kendoExtDropDownList").setDataSource([{ocnNm:"", ocnCd:""}]);
                $("#sOcnCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
                ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
                ,async:false
            });

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);}
     });
     $("#sModelCd").data("kendoExtDropDownList").enable(false);

     // ocn
     $("#sOcnCd").kendoExtDropDownList({
          dataTextField: "ocnNm"
         ,dataValueField:"ocnCd"
         ,optionLabel:" "   // 전체
         ,select:function(e){
             var dataItem = this.dataItem(e.item);
             $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([{extColorNm:"", extColorCd:""}]);
             $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([{intColorNm:"", intColorCd:""}]);
             $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

             //$("#hiddenFscCode").val("");

             if(this.dataItem(e.item).ocnCd == ""){
                 $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                 $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                 return false;
             }

             var responseJson = dms.ajax.getJson({
                 url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                 ,data:JSON.stringify({"sModelCd":dataItem.modelCd})
                 ,async:false
                 ,success:function(data) {
                     $("#hiddenFscCode").val(dataItem.modelCd);
                 }
             });
             $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     });
     $("#sOcnCd").data("kendoExtDropDownList").enable(false);

     //외장색
     $("#sExtColorCd").kendoExtDropDownList({
          dataTextField: "extColorNm"
         ,dataValueField:"extColorCd"
         ,optionLabel:" "
         ,select:function(e){
             if(this.dataItem(e.item).extColorCd == ""){
                 $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([{intColorNm:"", intColorCd:""}]);
                 $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                 return false;
             }

             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([{intColorNm:"", intColorCd:""}]);
             $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

             var responseJson = dms.ajax.getJson({
                 url:"<c:url value='/sal/veh/vehicleMaster/selectIntColorCombo.do' />"
                 ,data:JSON.stringify({"sModelCd":$("#hiddenFscCode").val()})
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
         ,optionLabel:" "
     });
     $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 주문상태
    $("#sOrdStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(btoOrdStatCdList)
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });
    //타이틀
    $("#header_title").html("<spring:message code='global.lbl.orderStatus' />");/* <!-- 오더종합현황-딜러 --> */
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    var sOrdsTp     = $("#sOrdsTp").data("kendoExtDropDownList").value();
    var sOrdStartDt = $("#sOrdStartDt").val();
    var sOrdEndDt = $("#sOrdEndDt").val();
    if(sOrdsTp != "") $("#search1Area span[name='searchStr']").text(sOrdsTp);
    if(sOrdStartDt != "") $("#search2Area span[name='searchStr']").html(sOrdStartDt +" ~ <br/>"+ sOrdEndDt);



 // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            $("#listarea_noData").hide();
            var sOrdsTp     = $("#sOrdsTp").data("kendoExtDropDownList").value();
            var sOrdStartDt = $("#sOrdStartDt").val();
            var sOrdEndDt = $("#sOrdEndDt").val();
            var sOrdStatCd     = $("#sOrdStatCd").data("kendoExtDropDownList").text();


            var sCarlineCd     = $("#sCarlineCd").data("kendoExtDropDownList").text();
            var sModelCd       = $("#sModelCd").data("kendoExtDropDownList").text();
            var sOcnCd         = $("#sOcnCd").data("kendoExtDropDownList").text();
            var sExtColorCd    = $("#sExtColorCd").data("kendoExtDropDownList").text();
            var sIntColorCd    = $("#sIntColorCd").data("kendoExtDropDownList").text();



            if(sOrdsTp != "") $("#search1Area span[name='searchStr']").text(sOrdsTp);
            if(sOrdStartDt != "") $("#search2Area span[name='searchStr']").html(sOrdStartDt +" ~ <br/>"+ sOrdEndDt);
            if(sOrdStatCd != "") $("#search3Area span[name='searchStr']").text(sOrdStatCd);
            if(sCarlineCd != "") $("#search4Area span[name='searchStr']").text(sCarlineCd);
            if(sModelCd != "") $("#search5Area span[name='searchStr']").text(sModelCd);
            if(sOcnCd != "") $("#search6Area span[name='searchStr']").text(sOcnCd);
            if(sExtColorCd != "") $("#search7Area span[name='searchStr']").text(sExtColorCd);
            if(sIntColorCd != "") $("#search8Area span[name='searchStr']").text(sIntColorCd);

            searchClickFl = true;
            initList();
            contentList();
            $("#totalSum").html("");
        }
    });

    //버튼 - 이전
    /* $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh();}
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh();}
        else if ($("#content_subdetail").css("display") == "block") { contentDetail(); }

        if($("#content_detail").css("display") != "block"){
            $("#detailCloseBtn").hide();
        }else{
            $("#detailCloseBtn").show();
        }

    });

    $("#detailCloseBtn").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh();  }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh();  }
        else if ($("#content_subdetail").css("display") == "block") { contentDetail(); }

        if($("#content_detail").css("display") != "block"){
            $("#detailCloseBtn").hide();
        }else{
            $("#detailCloseBtn").show();
        }

    });

    $("#detailListBtn").bind("click", function()
    {
        if(!$(this).hasClass("co_close")){
            $("#subList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubList.do' />");
        }
    });
    */

    //초기상태
    $("#sOrdsTp").data("kendoExtDropDownList").value("N1");
    $("#sOrdStartDt").val("");
    $("#sOrdEndDt").val("");
    $(".orderRegDt").hide();
    $(".sOrdYyMmPrid").show();


});

//목록페이지 보기
function contentList() {
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_list").css("display","block");
    listData.read();

}

//상세페이지 보기
function contentDetail(obj) {

    if(typeof obj != 'undefined'){

        $("#dlrCd").val(obj.dataItem.dlrCd);
        $("#ordYyMmDt").val(obj.dataItem.ordYyMmDt);
        _ordPrid=obj.dataItem.week;
        _ordsTp=obj.dataItem.ordTp;
        $("#carlineCd").val(obj.dataItem.carlineCd);
        $("#modelCd").val(obj.dataItem.modelCd);
        $("#ocnCd").val(obj.dataItem.ocnCd);
        $("#intColorCd").val(obj.dataItem.intColorCd);

        $("#carlineCds").val(obj.dataItem.carlineCd);
        $("#carlineNm").val(obj.dataItem.carlineNm);
        $("#ocnCds").val(obj.dataItem.ocnCd);

        setDetailData(obj.dataItem,".detialListData input[id]");

        console.log("sss",obj.dataItem);

        $("#misSetQty").val(obj.dataItem.missSetQty);
        $("#tranSchQty").val(obj.dataItem.tranMissQty);
    }
    $("#ordTp").val(ordTpObj[$("#ordTp").val()]);



    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_detail").css("display","block");

    $("#header_title span").removeAttr("class");

    $("#detailCloseBtn").show();

    if(!$(this).hasClass("co_close")){
        $("#subList").attr("src", "<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubList.do' />");
    }
}


//서브상세페이지 보기
/* function contentSubDetail(obj) {

    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","block");


    setDetailData(obj.dataItem,".subdetialListData input[id]");

    $("#ordDate").val(chgDate2Str($("#ordDate").val()));
    $("#pdiDt").val(chgDate2Str($("#pdiDt").val()));
    $("#vinDt").val(chgDate2Str($("#vinDt").val()));
    $("#retailDt").val(chgDate2Str($("#retailDt").val()));
    $("#grDt").val(chgDate2Str($("#grDt").val()));
    $("#saleDt").val(chgDate2Str($("#saleDt").val()));
    $("#ordStatCd").val(ordStatCdObj[$("#ordStatCd").val()]);


} */
</script>
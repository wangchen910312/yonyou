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
                <h2 id="content_list_title"><spring:message code="sal.title.usedCarBuy" /> <spring:message code="global.title.list" /></h2>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:70%"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span>
                    <span style="width:30%"><spring:message code='global.lbl.statNm' /><!-- 상태 --></span>
                    <span style="width:100%" class="clboth"><spring:message code='sal.lbl.documentNo' /></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>


        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.title.usedCarBuy" /> <spring:message code="global.title.searchCondition" /></h2>
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
                             <th scope="row"><spring:message code='sal.lbl.documentNo' /><!-- 매입번호 --></th>
                             <td>
                                 <div class="f_text">
                                 <input type="text" id="sPurcNo" class="form_input" style="width:100%">
                                 </div>
                             </td>

                         </tr>
                         <tr>
                             <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                             <td>
                                 <input type="hidden" id="sPurcCustNo" name="sPurcCustNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                 <div class="f_item01">
                                     <input type="text" id="sPurcCustNm" name="sPurcCustNm" value="" readOnly>
                                     <span class="search" id="custSearch"><spring:message code='global.lbl.custSearch' /><!-- 검색 --></span>
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row"><spring:message code='global.lbl.vinNum' /><!-- VIN NO --></th>
                             <td>
                                 <div class="f_text">
                                   <input type="text" id="sVinNo" class="form_input" style="width:100%">
                                 </div>
                             </td>
                         </tr>
                        <tr>
                             <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carRegDt' /></span></th>    <!-- 등록일자 -->
                             <td class="f_term">
                                <div class="f_item01" style = "width:82%" >
                                    <input type="search" id="sPurcRegStartDt" value="${toDayFrom}"  />
                                    <span class="date" onclick="calpicker('sPurcRegStartDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01" style = "width:82%" >
                                    <input type="search" id="sPurcRegEndDt" value="${toDayTo}"  />
                                    <span class="date" onclick="calpicker('sPurcRegEndDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>





                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12636" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <form id="detailForm" name="detailForm" method="POST" action="/">
                <!-- 기본정보 -->
                    <div class="content_title conttitlePrev">
                        <h2><spring:message code='global.title.defaultInfo' /><!-- 기본정보 --></h2>
                    </div>
                    <div class="formarea" id="formarea1" >
                        <table class="flist01">
                            <caption><spring:message code='global.lbl.salesOpptDetlInfo' /><!-- 판매기회 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                 <tr>
                                    <th scope="row"><spring:message code='sal.lbl.documentNo' /><!-- 매입번호 --></th>
                                    <td>
                                        <input id="dlrCd" name="dlrCd" type="hidden" data-bind="value:dlrCd" data-json-obj="true">
                                        <div class="f_text">
                                            <input type="text" id="purcNo" name="purcNo" readonly data-bind="value:purcNo"  data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.statNm' /><!-- 상태 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="purcStatCd" name="purcStatCd" class="form_comboBox" disabled="disabled" data-bind="value:purcStatCd"  data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='par.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="purcCustNm" name="purcCustNm" readonly  data-bind="value:purcCustNm"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.prsNm' /><!-- 담당자 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="regUsrNm" name="regUsrNm" readonly  data-json-obj="true" readonly data-bind="value:regUsrNm"/>
                                        </div>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='sal.lbl.newCarContractNo' /><!-- 신차계약번호 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="contractNo" name="contractNo" readonly   data-bind="value:contractNo"/>
                                        </div>
                                    </td>
                                </tr> --%>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='sal.lbl.newCarContractLink' /><!-- 신차계약연결 --></th>
                                    <td>
                                        <ul class="tridetype">
                                            <li id="carIssueHmVal1"><span class="on"><spring:message code='sal.lbl.link' /></span></li>
                                            <li id="carIssueHmVal2"><span><spring:message code='sal.lbl.unLink' /></span></li>
                                            <input type="hidden" id="carIssueHmVal" name="carIssueHmVal" value="1"/>
                                        </ul>
                                    </td>
                                </tr> --%>

                            </tbody>
                        </table>
                </div>


                <!-- 차량정보 -->
                <div class="co_group">
                    <div class="content_title">
                        <h2><spring:message code='ser.title.carInfo' /><!-- 차량정보 --></h2>
                        <div class="title_btn">
                            <dms:access viewId="VIEW-D-12635" hasPermission="${dms:getPermissionMask('READ')}">
                                <span class="co_open co_close"><span><spring:message code='crm.title.detailCont' /><!-- 상세내용 보기 --> </span></span>
                            </dms:access>
                        </div>
                    </div>
                    <div class="co_view">
                        <div class="formarea" id="formarea2" >
                            <table class="flist01">
                                <caption><spring:message code='global.lbl.salesOpptDetlInfo' /><!-- 판매기회 상세정보    --></caption>
                                <colgroup>
                                    <col style="width:30%;">
                                    <col style="">
                                </colgroup>
                                <tbody>
                                     <tr>
                                        <th scope="row"><spring:message code='sal.lbl.factory' /><!-- 제조사 --></th>
                                        <td>
                                           <div class="f_text f_disabled">
                                                <input type="text" id="carBrandCd" name="carBrandCd"  disabled="disabled" data-bind="value:carBrandCd">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td>
                                            <ul class="tridetype" ><!-- 수정필요 -->
                                                <li id="carIssueHmValSsssssssssv1"><span class="on"><spring:message code='sal.lbl.thisCompany' /></span></li><!-- 본사 -->
                                                <li id="carIssueHmValSsssssssssv2"><span><spring:message code='sal.lbl.otherCompany' /></span></li><!-- 기타회사 -->
                                                <input type="hidden" id="carIssueHmValSsssssssssv" name="carIssueHmValSsssssssssv" value="1"/>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.licensePltSaleYn' /><!-- 번호판여부 --></th>
                                        <td>
                                            <input type="checkbox" class="f_check" data-type="checkbox" id="noSaleYn" name="noSaleYn" readonly data-bind="value:noSaleYn"/><label for="noSaleYn"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="carlineNm" name="carlineNm" readonly data-bind="value:carlineNm"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 번호판 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="platNo" name="platNo" readonly data-bind="value:platNo"/>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.madeYyMm' /><!-- 제조년월 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="manufactYyMmDt" name="manufactYyMmDt" readonly data-bind="value:manufactYyMmDt"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.purcTotAmt' /><!-- 최종가격 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="purcTotAmt" name="purcTotAmt" readonly data-bind="value:purcTotAmt" onblur="inputNumberFormatPointPlus(this)" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN NO --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="vinNo" name="vinNo" readonly  data-bind="value:vinNo"/>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.model" /><!-- 모델 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="modelNm" name="modelNm" readonly data-bind="value:modelNm"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="extColorNm" name="extColorNm" readonly data-bind="value:extColorNm"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- <tr>
                                        <th scope="row">气缸数실린더</th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" readonly  data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr> -->

                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.carDrvMth" /><!-- 구동방식 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="drvMthCd" name="drvMthCd" disabled="disabled" data-bind="value:drvMthCd"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.purposeOfUse' /><!-- 사용용도 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="pcDstinCd" name="pcDstinCd" readonly disabled="disabled" data-bind="value:pcDstinCd"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.fuelType' /><!-- 연료구분 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="fuelCd" name="fuelCd" readonly disabled="disabled" data-bind="value:fuelCd"/>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <!-- 평가정보 -->
                <div class="co_group">
                    <div class="content_title conttitlePrev">
                        <h2><spring:message code='sal.lbl.evaluationInfo' /><!-- 평가정보 --></h2>
                        <div class="title_btn">
                            <dms:access viewId="VIEW-D-12634" hasPermission="${dms:getPermissionMask('READ')}">
                                <span class="co_open co_close"><span><spring:message code='crm.title.detailCont' /><!-- 상세내용 보기 --> </span></span>
                            </dms:access>
                        </div>
                    </div>
                    <div class="co_view">
                        <div class="formarea" id="formarea3" >
                            <table class="flist01">
                                <caption><spring:message code='sal.lbl.evaluationInfo' /><!-- 평가정보 --></caption>
                                <colgroup>
                                    <col style="width:30%;">
                                    <col style="">
                                </colgroup>
                                <tbody>
                                     <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationWay' /><!-- 평가방법 --></th>
                                        <td>
                                           <ul class="tridetype" ><!-- 수정필요 -->
                                                <li id="carIssueHmValddddddddv1"><span class="on"><spring:message code='global.lbl.ourCompany' /></span></li><!-- 본인 -->
                                                <li id="carIssueHmValddddddddv2"><span><spring:message code='global.lbl.execution' /></span></li><!-- 대행 -->
                                                <input type="hidden" id="carIssueHmValddddddddv" name="carIssueHmValSsssssssssv" value="1"/>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationPerson' /><!-- 평가담당자 --></th>
                                        <td>
                                            <div class="f_text">
                                            <input type="text" id="evalPrsnNm" name="evalPrsnNm"  data-json-obj="true"/>
                                            <div class="f_text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.evalScheDt' /><!-- 평가일자 --></th>
                                        <td>
                                            <div class="f_item01">
                                                <input type="search" id="evalDt" value="" class=""  data-json-obj="true"/>
                                                <span class="date" onclick="calpicker('evalDt')"><spring:message code='global.lbl.date' /></span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.vinSts' /><!-- 차량상태 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="carStatCd" name="carStatCd"  data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.custHopeAmt' /><!-- 고객희망가격 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="custHopeAmt" name="custHopeAmt" min="0" max="" onblur="inputNumberFormat(this)" onkeyup="inputNumberFormat(this)" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluatePrice' /><!-- 평가가격 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="evalAmt" name="evalAmt" min="0" max="" onblur="inputNumberFormat(this)" onkeyup="inputNumberFormat(this)" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.lastAmt' /><!-- 최종판매가격 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="lastAmt" name="lastAmt" min="0" max="" onblur="inputNumberFormat(this)" onkeyup="inputNumberFormat(this)" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.carRegEvalAmt' /><!-- 번호판평가가격 --></th>
                                        <td>
                                            <div class="f_text">
                                                <input type="text" id="carRegAmt" name="carRegAmt" min="0" max="" onblur="inputNumberFormat(this)" onkeyup="inputNumberFormat(this)" data-json-obj="true"/>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationRemark' /><!-- 평가의견 --></th>
                                         <td>
                                            <textarea rows="5" id=evalRemark name="evalRemark" cols="" class="f_textarea"  placeholder="<spring:message code='sal.lbl.evaluationRemark' />"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>



                <!-- 마감대상 딜러정보  -->
                <div class="co_group">
                    <div class="content_title conttitlePrev">
                        <%--<h2><spring:message code='sal.lbl.deadlineTartgetDealerInfo' /><!-- 마감대상 딜러정보--></h2> --%>
                        <h2><spring:message code='sal.lbl.auctInfo' /><!-- 경매정보--></h2>
                        <%-- <div class="title_btn">
                            <span class="tbtn" onclick="javascript:addNewSubList();"><spring:message code="global.btn.add" /><!-- 추가 --></span>
                            <span class="co_open"><span>상세내용 보기 </span></span>
                        </div> --%>
                    </div>
                    <div class="co_view">
                        <ul>
                            <li>
                                <div class="deleteitem listhead">
                                    <span style="width:50%"><spring:message code='global.lbl.reqDt' /><!-- 신청일자  --></span>
                                    <span style="width:50%"><spring:message code='sal.lbl.auctType' /><!-- 경매구분 --></span>
                                    <span style="width:50%" class="clboth"><spring:message code='sal.lbl.auctAddr' /><!-- 경매처--></span>
                                    <span style="width:50%"><spring:message code='sal.lbl.auctAmt' /><!-- 경매가격 --></span>
                                    <%-- <span style="width:50%" class="clboth"><spring:message code='sal.lbl.goods' /><!-- 용품내용--></span> --%>
                                    <span style="width:50%"><spring:message code='sal.lbl.carDlYn' /><!-- 차량인도여부--></span>
                                    <span style="width:100%" class="clboth"><spring:message code='sal.lbl.scheConfirmDt' /><!-- 예상확정일자 --></span>
                                    <span style="width:100%" class="clboth"><spring:message code='par.lbl.remark' /><!-- 비고--></span>
                                </div>
                            </li>
                        </ul>
                        <iframe id="subList" name="subList" border="1" frameborder="0" width="100%" height=""></iframe>
                        <div class="dlistitem listarea_noData bgNone" style="display:none;" id="listarea_noData_dt"><span></span></div>
                    </div>
                </div>

                <div class="con_btnarea btncount2">
                    <dms:access viewId="VIEW-D-12633" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1" id="btnSave" ><spring:message code='global.btn.tempSave' /><!-- 임시저장 --></span></div>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12632" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1" id="btnRequestEval"><spring:message code="sal.lbl.evalFinish" /><!-- 평가완료 --></span></div>
                    </dms:access>
                </div>
                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailCloseBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
                </div>
                </form><!-- detailForm -->



                <!-- 마감대상평가입력 -->
                <div class="content_right" id="formAreaInputData" style="display:none">
                    <div class="content_title conttitlePrev">
                        <h2><spring:message code='sal.lbl.deadlineTartgetEvalInput' /><!-- 마감대상평가입력 --></h2>
                    </div>
                    <div class="formarea" id="formarea4" >
                        <table class="flist01">
                            <caption><spring:message code='sal.lbl.deadlineTartgetEvalInput' /><!-- 마감대상평가입력 --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.reqDt' /><!-- 신청일자  --></th>
                                    <td>
                                        <div class="f_item01">
                                            <input type="search" id="regDt" value="" class="" readOnly data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('regDt')"><spring:message code='global.lbl.date' /></span>
                                            <input type="hidden" id="seq" value="" data-bind="value:seq" class="" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.auctType' /><!-- 경매구분 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="auctCd" name="auctCd" data-bind="value:auctCd" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.auctAddr' /><!-- 경매처--></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="auctPlaceNm" name="auctPlaceNm" data-bind="value:auctPlaceNm" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.auctAmt' /><!-- 경매가격 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="auctAmt" name="auctAmt" min="0" max="" data-bind="value:auctAmt" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.goods' /><!-- 용품내용--></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="goodsDetlCont" name="goodsDetlCont" data-bind="value:goodsDetlCont" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.carDlYn' /><!-- 차량인도여부--></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="carDlYn" name="carDlYn" data-bind="value:carDlYn" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.scheConfirmDt' /><!-- 예상확정일자 --></th>
                                    <td>
                                        <div class="f_item01">
                                            <input type="search" id="scheConfirmDt" value="" class="" readOnly data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('scheConfirmDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='par.lbl.remark' /><!-- 비고--></th>
                                     <td>
                                        <textarea rows="5" id=remark name="remark" cols="" class="f_textarea" data-bind="value:remark" placeholder="비고"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="con_btnarea btncount2">
                        <dms:access viewId="VIEW-D-12630" hasPermission="${dms:getPermissionMask('READ')}">
                            <div><span class="btnd1" id="btnAuctSave" ><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
                        </dms:access>
                        <dms:access viewId="VIEW-D-12629" hasPermission="${dms:getPermissionMask('READ')}">
                            <div><span class="btnd1" id="btnAutcCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
                        </dms:access>
                    </div>
                </div>
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

//중고차매입상태 Array
var purcStatCdDs = [];
<c:forEach var="obj" items="${purcStatCdList}">
    purcStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량인도여부 Map
var purcStatCdMap = dms.data.arrayToMap(purcStatCdDs, function(obj){ return obj.cmmCd; });


//사용용도(승/상용구분) Array
var pcDstinCdDs = [];
//pcDstinCdDs.push({"cmmCd":"", "cmmCdNm":"", "useYn":""});
<c:forEach var="obj" items="${pcDstinCdList}">
    pcDstinCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//사용용도(승/상용구분) Map
var pcDstinCdMap = dms.data.arrayToMap(pcDstinCdDs, function(obj){ return obj.cmmCd; });


//연료구분 Array
var fuelCdDs = [];
//fuelCdDs.push({"cmmCd":"", "cmmCdNm":"", "useYn":""});
<c:forEach var="obj" items="${fuelCdList}">
    fuelCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//연료구분 Map
var fuelCdMap = dms.data.arrayToMap(fuelCdDs, function(obj){ return obj.cmmCd; });


//구동방식 Array
var drvMthCdDs = [];
//drvMthCdDs.push({"cmmCd":"", "cmmCdNm":"", "useYn":""});
<c:forEach var="obj" items="${drvMthCdList}">
    drvMthCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//구동방식 Map
var drvMthCdMap = dms.data.arrayToMap(drvMthCdDs, function(obj){ return obj.cmmCd; });


//차량상태코드 Array
var carStatCdDs = [];
//carStatCdDs.push({"cmmCd":"", "cmmCdNm":"", "useYn":""});
<c:forEach var="obj" items="${carStatCdList}">
    carStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량상태코드 Map
var carStatCdMap = dms.data.arrayToMap(carStatCdDs, function(obj){ return obj.cmmCd; });



//경매구분 Array
var auctCdDs = [];
//auctCdDs.push({"cmmCd":"", "cmmCdNm":"", "useYn":""});
<c:forEach var="obj" items="${auctCdList}">
    auctCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var auctCdMap = dms.data.arrayToMap(auctCdDs, function(obj){ return obj.cmmCd; });


//차량인도여부 Array
var carDlYnDs = [];
//carDlYnDs.push({"cmmCd":"", "cmmCdNm":"", "useYn":""});
<c:forEach var="obj" items="${carDlYnList}">
    carDlYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var carDlYnMap = dms.data.arrayToMap(carDlYnDs, function(obj){ return obj.cmmCd; });



//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


//브랜드 COM019
var carBrandCdDs = [];
<c:forEach var="obj" items="${carBrandCdList}">
    carBrandCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carBrandCdMap = dms.data.arrayToMap(carBrandCdDs, function(obj){ return obj.cmmCd; });


/* //본사,타사구분
var corpCarDstinCdDs = [{"cmmCd":"01","cmmCdNm":"<spring:message code='sal.lbl.thisCompany' />"},{"cmmCd":"02","cmmCdNm":"<spring:message code='sal.lbl.otherCompany' />"}];
var corpCarDstinCdMap = dms.data.arrayToMap(corpCarDstinCdDs, function(obj){ return obj.cmmCd; }); */


var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();


//고객 검색 팝업
var popupWindow  ;
$("#custSearch").click(function(){
    popupWindow = mob.window.popup({
        windowId:"customerSearchPopupMain"
        , content:{
            url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if ( dms.string.isNotEmpty(data.custNo) ) {
                        $("#sPurcCustNo").val(data.custNo);
                        $("#sPurcCustNm").val(data.custNm);
                    }
                }
            }
        }
    })
});

/* $(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){

        case "search1Area" :
            $("#sPurcRegStartDt").val("");
            $("#sPurcRegEndDt").val("");
            break;
        case "search2Area" :
            $("#sPurcCustNo").val("");
            $("#sPurcCustNm").val("");
            break;
        case "search3Area" :
            $("#sPurcNo").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});



function setSearchBox(){

    var sPurcRegStartDt = $("#sPurcRegStartDt").val();
    var sPurcRegEndDt = $("#sPurcRegEndDt").val();
    var sPurcCustNo = $("#sPurcCustNo").val();
    var sPurcNo = $("#sPurcNo").val();


    if(sPurcRegStartDt == "" && sPurcRegEndDt == "" && sPurcCustNo == "" && sPurcNo == "" ){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sPurcRegStartDt == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sPurcCustNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sPurcNo == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
} */
var addModiFl = "I";
$(document).ready(function() {

  //현재일자
    var toDay = "${toDay}";

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
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
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.menu.usedCarBuy' />"); //중고차매입관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    var sSrchFrDt = $("#sSrchFrDt").val();
    var sSrchToDt = $("#sSrchToDt").val();

    if(sSrchFrDt != "") $("#search2Area span[name='searchStr']").html(sSrchFrDt +" ~ <br/>"+ sSrchToDt);
    //setSearchBox();

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/usc/purcEval/selectEvalMngList.do' />");

    //$("#subList").attr("src", "<c:url value='/mob/sal/usc/purcEval/selectEvalMngSubList.do' />");



    /**************************************** 상세내역 Start **********************************************************/


  //중고차매입상태
    $("#purcStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(purcStatCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    //사용용도(승/상용구분)
    $("#pcDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(pcDstinCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    //연료구분
    $("#fuelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(fuelCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    //구동방식
    $("#drvMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(drvMthCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    //차량상태
    $("#carStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(carStatCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });



    //제조사
    $("#carBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(carBrandCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });



    //경매구분
    $("#auctCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(auctCdDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    //차량인도여부
    $("#carDlYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(carDlYnDs)
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    /***** 매입총금액 *****/
  /*   $("#purcTotAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });
 */



    /***** 고객희망가격 *****/
   /*  $("#custHopeAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    }); */

    /***** 평가가격 *****/
/*     $("#evalAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });
 */

    /***** 최종판매가격 *****/
 /*    $("#lastAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });
 */

    /***** 번호판평가가격 *****/
    /* $("#carRegAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });
 */

    /**************************************** 상세내역 END **********************************************************/


    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sPurcRegStartDt = $("#sPurcRegStartDt").val();
            var sPurcRegEndDt = $("#sPurcRegEndDt").val();
            var sPurcCustNo = $("#sPurcCustNo").val();
            var sPurcNo = $("#sPurcNo").val();

            if(sPurcRegStartDt != "") $("#search1Area span[name='searchStr']").html(sPurcRegStartDt +" ~ <br/>"+ sPurcRegEndDt);
            if(sPurcCustNo != "") $("#search2Area span[name='searchStr']").text(sPurcCustNo);
            if(sPurcNo != "") $("#search3Area span[name='searchStr']").text(sPurcNo);
            //setSearchBox();
            contentList();
        }
    });

    //저장/수정
     $("#btnSave").kendoButton({
         click:function(e) {
            confirmOpen(confirmMsgSave,'doSave',y,n);
         }
     });

    //평가완료
     $("#btnRequestEval").kendoButton({

         click:function(e) {
            confirmOpen(confirmMsgSave,'doRequestEval',y,n);

         }
     });


    //경매이력그리드 - 취소
     $("#btnAutcCancel").kendoButton({
         /*click:function(e) {
             $('#auctGrid').data('kendoExtGrid').cancelChanges();
         }
     */
         click:function(e) {
             $("#formAreaInputData").hide();
             $("#detailForm").show();
            /*  var sibl = $("#formAreaInputData").siblings("div");
             $.each(sibl,function(){
                 sibl.show();
             }); */
         }

     });



     //경매이력그리드  - 저장
     $("#btnAuctSave").kendoButton({
         /*
         click:function(e) {

             var grid = $("#auctGrid").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
             if (grid.cudDataLength == 0) {
                 //변경된 정보가 없습니다.
                 dms.notification.info("<spring:message code='global.info.required.change'/>");
                 return;
             }
             if (grid.gridValidation()) {
                 $.ajax({
                     url:"<c:url value='/sal/usc/purcEval/multiSaveAuctInfo.do' />"
                     ,data:JSON.stringify(saveData)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error) {
                        mob.loading.hide();
                        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                     }
                     ,success:function(jqXHR, textStatus) {
                         grid.dataSource._destroyed = [];
                         grid.dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                });
             }else{
                 //입력값을 확인하여 주십시오.
                 dms.notification.warning("<spring:message code='global.info.check.input'/>");

             }

         }
     */
         click:function(e) {

             document.getElementById("subList").contentWindow.saveItemSubList();

             //doSaveSubList();

         }

     });

    //선택 항목 바인딩 처리
    makingSelEdit();

    // 버튼 - 이전
    $("#docu_prev, #detailCloseBtn").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#formAreaInputData").css("display") == "block") {
            $("#formAreaInputData").hide();
            $("#detailForm").show();
        }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }

        $("#btnSave").data("kendoButton").enable(true); //버튼 disabled
        $("#btnRequestEval").data("kendoButton").enable(true); //버튼 disabled
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
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
    setTimeout(function(){ setMainListHeight();}, 200);

}

//검색페이지 보기

function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기
var sDlrCd = "";
var sPurcNo = "";;
function contentDetail(selectedVal) {

    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if($("#content_list").css("display") == "block") {
        $("#formAreaInputData").hide();
        $("#detailForm").show();
    }
    var purcNo = selectedVal.purcNo;

    $.ajax({
        url:"<c:url value='/mob/sal/usc/purcEval/selectPurcEval.do' />",
        data:JSON.stringify({sPurcNo:purcNo}),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error){
            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }

    }).done(function(result) {

        var purcEvalDs = result["purcEvalDs"];
        //$('#auctGrid').data('kendoExtGrid').dataSource.page(1);
        sDlrCd = purcEvalDs.dlrCd;
        sPurcN = purcEvalDs.purcNo;
        $("#subList").attr("src", "<c:url value='/mob/sal/usc/purcEval/selectEvalMngSubList.do' />");
        //document.getElementById("subList").contentWindow.document.location.reload(); // 목록 iframe 새로고침

        //kendo.bind($("#viewPurcEval"), purcEvalDs);  //웹참조 selectEvalMngMain.jsp
        kendo.bind($("#content_detail"), purcEvalDs);

        //금액 포맷팅
        /*
        setTimeout(function(){
            $("#purcTotAmt").val(dms.format.currency($("#purcTotAmt").val()));
            $("#custHopeAmt").val(comma($("#custHopeAmt").val()));
            $("#evalAmt").val(comma($("#evalAmt").val()));
            $("#lastAmt").val(comma($("#lastAmt").val()));
            $("#carRegAmt").val(comma($("#carRegAmt").val()));
        }, 200);
        */
        $("#purcTotAmt").val(dms.format.currency(Number(purcEvalDs.purcTotAmt)));
        $("#custHopeAmt").val(dms.format.currency(Number(purcEvalDs.custHopeAmt)));
        $("#evalAmt").val(dms.format.currency(Number(purcEvalDs.evalAmt)));
        $("#lastAmt").val(dms.format.currency(Number(purcEvalDs.lastAmt)));
        $("#carRegAmt").val(dms.format.currency(Number(purcEvalDs.carRegAmt)));
        $("#evalRemark").val(purcEvalDs.evalRemark);
        /*$("#purcTotAmt").val(dms.format.currency(purcEvalDs.purcTotAmt));
        $("#custHopeAmt").val(comma(purcEvalDs.custHopeAmt));
        $("#evalAmt").val(comma(purcEvalDs.evalAmt));
        $("#lastAmt").val(comma(purcEvalDs.lastAmt));
        $("#carRegAmt").val(comma(purcEvalDs.carRegAmt)); */


        /* //자사차량구분
        if(selectedVal.corpCarDstinCd == '01'){//자사
            //$("#btnThis").attr("class", "on");
            //$("#btnOther").attr("class", "");
            $("#carIssueHmValSsssssssssv1").click();
        }else if(selectedVal.corpCarDstinCd == '02'){//타사
            //$("#btnThis").attr("class", "");
            //$("#btnOther").attr("class", "on");
            $("#carIssueHmValSsssssssssv2").click();
        } */

        //차량번호판매여부
        if (selectedVal.noSaleYn == 'Y'){
            $("#noSaleYn").prop("checked", true);
        }else {
            $("#noSaleYn").prop("checked", false);
        };

        $("#noSaleYn").click(function (event){
            event.preventDefault();
        });



        //평가방법
        if(selectedVal.evalMthCd == 'A'){//본인
            //$("#btnSelf").attr("class", "on");
            //$("#btnProxy").attr("class", "");
            $("#carIssueHmValddddddddv1").click();

        }else if(selectedVal.evalMthCd == 'M'){//대행
            //$("#btnSelf").attr("class", "");
            //$("#btnProxy").attr("class", "on");
            $("#carIssueHmValddddddddv2").click();
        }


        if($("#purcStatCd").val()=='01' ){
            $("#btnRequestEval").data("kendoButton").enable(false); //버튼 disabled
        }


        if($("#purcStatCd").val()=='03' || $("#purcStatCd").val()=='04' || $("#purcStatCd").val()=='05' ){
            $("#btnSave").data("kendoButton").enable(false); //버튼 disabled
            $("#btnRequestEval").data("kendoButton").enable(false); //버튼 disabled
        }



    });
}

//selectEvalMngSubList.jsp에서 선택한 리스트 객체
function contentSubDetail(selectedVal) {
    if(selectedVal !=""){
        kendo.bind($("#formAreaInputData"), selectedVal);
        $("#regDt").val(chgServerDate2Str(selectedVal.regDt));
        $("#scheConfirmDt").val(chgServerDate2Str(selectedVal.scheConfirmDt));
    }
    $("#formAreaInputData").show();
    $("#detailForm").hide();
    addModiFl = "U";
    /* var sibl = $("#formAreaInputData").siblings("div");
    $.each(sibl,function(){
        sibl.hide();
    }); */
}
//각선택 버튼 클릭시 class변경 (<li><span class="on"> 형식에 li클릭시 클래스 변경)
function reCheckClassSelEdit(obj){
    var slibs = obj.siblings("li");
    $.each(slibs,function(){
        this.firstChild.className = "";
    });
    obj[0].firstChild.className = "on";
}

//마감대상 딜리정보 추가 버튼 클릭시
function addNewSubList(){
    kendo.bind($("#formAreaInputData"), "");
    $("#formAreaInputData").show();
    $("#detailForm").hide();
    addModiFl = "I";
}

function makingSelEdit(){
    // 신차계약링크:연결
    $("#carIssueHmVal1").click(function(){
        reCheckClassSelEdit($(this));
        $("#carIssueHmVal").val("1");
    });
    // 신차계약링크:미연결
    $("#carIssueHmVal2").click(function(){
        reCheckClassSelEdit($(this));
        $("#carIssueHmVal").val("2");
    });

    /* // 제조사:본사
    $("#carIssueHmValSsssssssssv1").click(function(){
        reCheckClassSelEdit($(this));
        $("#carIssueHmValSsssssssssv").val("1");
    });
    // 제조사:타사
    $("#carIssueHmValSsssssssssv2").click(function(){
        reCheckClassSelEdit($(this));
        $("#carIssueHmValSsssssssssv").val("2");
    }); */

    //평가방법
    $("#carIssueHmValddddddddv1").click(function(){
        reCheckClassSelEdit($(this));
        $("#carIssueHmValddddddddv").val("1");
    });
    // 제조사:타사
    $("#carIssueHmValddddddddv2").click(function(){
        reCheckClassSelEdit($(this));
        $("#carIssueHmValddddddddv").val("2");
    });
}

function doSaveSubList(){
    var dataSource = document.getElementById("subList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;

    var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

    var total = saveData.deleteList.length + saveData.insertList.length + saveData.updateList.length;
    if (total == 0){
        mob.notification.info("<spring:message code='global.info.required.change' />");
        return;
    }

    mob.loading.show();
    $.ajax({
        url:"<c:url value='/mob/sal/usc/purcEval/multiSaveAuctInfo.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                mob.loading.hide();
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success:function(jqXHR, textStatus){
                mob.loading.hide();
                mob.notification.info("<spring:message code='global.info.success' />");

                //contentSubDetail("");
                $("#formAreaInputData").hide();
                $("#detailForm").show();
            }
    });

    document.getElementById("subList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
}

function doSave(){
    var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
             param.dlrCd = $("#dlrCd").val();
             param.purcNo = $("#purcNo").val();
             param.evalDt = new Date($("#evalDt").val());
             param.stat = "E";
             param.purcStatCd = "02";
             param.gubun = "U";

             param.purcTotAmt = uncommaPointPlus($("#purcTotAmt").val());
             param.custHopeAmt = uncomma($("#custHopeAmt").val());
             param.evalAmt = uncomma($("#evalAmt").val());
             param.lastAmt = uncomma($("#lastAmt").val());
             param.carRegAmt = uncomma($("#carRegAmt").val());

            mob.loading.show();

             $.ajax({
                 url:"<c:url value='/mob/sal/usc/purcEval/savePurcEvalMng.do' />",
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 data:JSON.stringify(param),
                 error:function(jqXHR,status,error){
                    mob.loading.hide();
                     mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                 },
                 success:function(data){
                     mob.loading.hide();
                     //$("#grid").data("kendoExtGrid").dataSource.read();
                     // 저장이 완료되었습니다.
                     mob.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                     //setSearchBox();
                     contentList();
                 }
             });
    }


function doRequestEval() {
    var saveData = {
             dlrCd:$("#dlrCd").val()
             ,purcNo    :$("#purcNo").val()
             ,purcStatCd:"03"
             ,stat      :"P"
             ,gubun     :"U"
     };
    mob.loading.show();
     $.ajax({
         url:"<c:url value='/mob/sal/usc/purcEval/savePurcEvalMng.do' />",
         type:'POST',
         dataType:'json',
         contentType:'application/json',
         data:JSON.stringify(saveData),
         error:function(jqXHR,status,error){
            mob.loading.hide();
            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
         },
         success:function(data){
            mob.loading.hide();
             //$("#grid").data("kendoExtGrid").dataSource.read();
             // 저장이 완료되었습니다.
             mob.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
             $("#lay_pop").css("top","300px");
             //setSearchBox();
             contentList();
         }
     });
}

</script>
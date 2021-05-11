<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


    <!-- 조회승인신청 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="ser.title.reqSearch" /></h1>
            <div class="btn_right">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            </div>
        </div>
        <div id="tabstrip1" class="tab_area mt0">
            <ul>
                <li id="claim" class ="k-state-active"><spring:message code="ser.title.claimReq" /></li>
                <li id="ro"><spring:message code="ser.lbl.roSearch" /></li>
            </ul>

            <!-- 클레임신청 -->
            <div>
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:13%;">
                            <col style="width:13%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.wrtrDt" /></th><!-- 작성일자 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sClaimFromDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sClaimToDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimStatNm" /></th><!-- 클레임상태 -->
                                <td>
                                    <input type="text" id="sClaimStatCd" name="sClaimStatCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimTp" /></th><!-- 클레임유형 -->
                                <td>
                                    <input type="text" id="sClaimTp" name="sClaimTp" class="form_comboBox"    />
                                </td>
                                <th scope="row" class="th_form"><input type="text" id="sField" name="sField" class="form_comboBox al" style="width:85%;" /></th><!-- 조회 조건-->
                                <td>
                                    <input type="text" id="sText" name="sText" class="form_input" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                   <div id="gridClaim" class="grid"></div>
                </div>
            </div>
            <!-- //클레임신청-->

            <!-- RO -->
            <div>
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roDate" /></th><!-- RO일자 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sRoFromDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sRoToDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!-- 차대번호 -->
                                <td>
                                    <input type="text" id="sVinNo" name="sVinNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO 번호 -->
                                <td>
                                    <input type="text" id="sRoDocNo" name="sRoDocNo" class="form_input" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                   <div id="gridRo" class="grid"></div>
                </div>
            </div>
            <!-- //RO -->
        </div>
    </section>



    <form id="claimRequestForm">
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnInquire"><spring:message code="global.btn.search" /></button>
                    <button type="button" class="btn_s" id="btnInit"><spring:message code="global.btn.init" /></button>
                    <button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /></button>
                    <button type="button" class="btn_s" id="btnCancel" disabled><spring:message code="global.btn.cancel" /></button>
                    <button type="button" class="btn_s" id="btnReq" disabled><spring:message code="global.btn.req" /></button>
                    <button type="button" class="btn_s" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button>
                </div>
            </div>
            <div class="table_form form_width_100per ">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!-- 클레임번호 -->
                            <td colspan="3">
                                <div class="form_float">
                                    <div class="form_left" style="width:37.4%;">
                                        <input type="text" id="sClaimDocNo" name="sClaimDocNo" class="form_input" /> <!--클레임번호 -->
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.claimTp" /></span></th><!-- 클레임유형 -->
                            <td>
                                <input type="text" id="claimTp" name="claimTp" class="form_comboBox" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.tecAdvNo" /></th><!-- 기술자문번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="claimTcavNo" name="claimTcavNo" class="form_input form_readonly" data-json-obj="true" />
                                    <a href="javascript:;"></a>
                                </div>
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_form mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!-- 클레임번호 -->
                            <td class="readonly_area">
                                <input type="text" id="claimDocNo" name="claimDocNo" class="form_input" readonly data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.claimStatNm" /></th><!-- 클레임상태 -->
                            <td class="readonly_area">
                                <input type="text" id="claimStatCd" name="claimStatCd" class="form_comboBox" readonly data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.claimRegDt" /></th><!-- 생성일 -->
                            <td class="readonly_area">
                                <input type="text" id="regDt" name="regDt" readonly class="form_datepicker ac"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!-- 차대번호 -->
                            <td class="readonly_area">
                                 <input type="text" id="vinNo" name="vinNo" class="form_input" readonly data-json-obj="true"/>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO번호 -->
                            <td class="readonly_area">
                                <input type="text" id="roDocNo" name="roDocNo" class="form_input" readonly data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roStatus" /></th><!-- RO상태 -->
                            <td class="readonly_area">
                                <input type="text" id="roStatCd" name="roStatCd" class="form_comboBox" readonly data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roDate" /></th><!-- RO발행일 -->
                            <td class="readonly_area">
                                <input type="text" id="roDt" name="roDt" readonly class="form_datepicker ac" />
                            </td>


                            <th scope="row"><spring:message code="ser.lbl.carLine" /></th><!-- 차종 -->
                            <td class="readonly_area">
                                <input type="text" id="ltsModelNm" name="ltsModelNm" class="form_input" readonly   />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.enginNo" /></th><!--엔진번호 -->
                            <td class="readonly_area">
                                <input type="text" id="enginNo" name="enginNo" readonly class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.wartDt" /></th><!-- 보증수리일자 -->
                            <td class="readonly_area">
                                <input type="text" id="wartDt" name="wartDt" readonly class="form_datepicker ac" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roStartDt" /></th><!-- 작업시작일 -->
                            <td class="readonly_area">
                                <input type="text" id="roStartDt" name="roStartDt"   class="form_datepicker ac" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roEndDt" /></th><!-- 작업종료일 -->
                            <td class="readonly_area">
                                <input type="text" id="roEndDt" name="roEndDt"   class="form_datepicker ac" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.runDist" /></th><!-- 주행거리 -->
                            <td colspan="3" class="readonly_area">
                                <div class="form_float">
                                    <div class="form_left" style="width:18%;"> <!-- 37.4 -->
                                        <input type="text" id="runDistVal" name="runDistVal" class="form_numeric ar" data-json-obj="true"/>

                                    </div>
                                     <div class="form_right" style="width:18.2%;"> <!-- 62.6 -->
                                        <input type="text" id="lastDistVal" name="lastDistVal" readonly class="form_numeric ar" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.pwaDocNo" /></th><!-- PWA -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="pwaApproveNo" name="pwaApproveNo" class="form_input form_readonly" readonly data-json-obj="true" />
                                    <a href="javascript:selectPwaApproveSearchPopupWindow();"></a>
                                </div>
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><span id="cauCdSpan" class="bu_required"><spring:message code="ser.lbl.cauCd" /></span></th><!-- 원인 -->
                            <td colspan="3" class="readonly_area">
                                <div class="form_float">
                                    <div class="form_left" style="width:37.4%;">
                                        <input type="text" id="cauCd" name="cauCd" readOnly class="form_input" data-json-obj="true"/> <!-- 원인코드 -->
                                    </div>
                                    <div class="form_right" style="width:62.6%;">
                                        <div class="form_search">
                                            <input type="text" id="cauNm" name="cauNm" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드명 -->
                                            <a href="javascript:selectPhenCauCodeSearchPopupWindow();"></a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><span id="phenCdSpan" class="bu_required"><spring:message code="ser.lbl.phenCd" /></span></th><!-- 현상(N) -->
                            <td colspan="3" class="readonly_area">
                                <div class="form_float">
                                    <div class="form_left" style="width:37.4%;">
                                        <input type="text" id="phenCd" name="phenCd" readOnly class="form_input" data-json-obj="true" />
                                    </div>
                                    <div class="form_right" style="width:62.6%;">
                                        <input type="text" id="phenNm" name="phenNm" readOnly class="form_input" data-json-obj="true"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span id="remarkSpan" class="bu_required"><spring:message code="ser.lbl.problem" /></span></th><!-- 문제점 -->
                            <td colspan="3">
                                <input type="text" id="remark" name="remark" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><span id="cauItemCdSpan" class="bu_required"><spring:message code="ser.lbl.cauItemCd" /></span></th><!-- 원인부품 -->
                            <td colspan="3" class="readonly_area">
                                <div class="form_float">
                                    <div class="form_left" style="width:37.4%">
                                        <div class="form_search">
                                            <input type="text" id="cauItemCd" name="cauItemCd" readOnly class="form_input" data-json-obj="true" />
                                             <a href="javascript:partSearchPopupWindow('IP')"></a>
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:62.6%">
                                        <input type="text" id="cauItemNm" name="cauItemNm" readOnly class="form_input" data-json-obj="true"/> <!-- 원인부품명 -->
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span id="cauOperAtcCdSpan" class="bu_required"><spring:message code="ser.lbl.mainLbrCd" /></span></th><!-- OP코드 -->
                            <td colspan="3" class="readonly_area">
                                <div class="form_float">
                                    <div class="form_left" style="width:37.4%">
                                        <input type="text" id="cauOperAtcCd" name="cauOperAtcCd" readOnly class="form_input" data-json-obj="true" /> <!-- 주작업코드 -->
                                    </div>
                                    <div class="form_right" style="width:62.6%">
                                        <input type="text" id="cauOperAtcNm" name="cauOperAtcNm" readOnly class="form_input form_readonly" data-json-obj="true"/> <!-- 주작업코드명 -->
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.subDistin" /></th><!-- 외주구분 -->
                            <td>
                                <input type="text" id="subDstinCd" name="subDstinCd" class="form_comboBox" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.prePartTp" /></th><!-- 이전부품유형  -->
                            <td>
                                <input type="text" id="asParWartDstinCd" name="asParWartDstinCd" class="form_comboBox" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.dtcCd" /></th><!-- 고장코드(DTC) -->
                            <td colspan="7">
                                <div class="form_float">
                                    <div class="form_left" style="width:13%;">
                                        <input type="text" id="dtc1Cd" name="dtc1Cd" class="form_input" data-json-obj="true"/>
                                    </div>
                                    <div class="form_left" style="width:12%;">
                                        <input type="text" id="dtc1UseYn" name="dtc1UseYn" class="form_comboBox" data-json-obj="true"/>
                                    </div>
                                    <div class="form_left" style="width:13%;">
                                        <input type="text" id="dtc2Cd" name="dtc2Cd" class="form_input" data-json-obj="true"/>
                                    </div>
                                    <div class="form_left" style="width:12%;">
                                        <input type="text" id="dtc2UseYn" name="dtc2UseYn" class="form_comboBox" data-json-obj="true"/>
                                    </div>
                                    <div class="form_left" style="width:13%;">
                                        <input type="text" id="dtc3Cd" name="dtc3Cd" class="form_input" data-json-obj="true"/>
                                    </div>
                                    <div class="form_left" style="width:12%;">
                                        <input type="text" id="dtc3UseYn" name="dtc3UseYn" class="form_comboBox" data-json-obj="true"/>
                                    </div>
                                    <div class="form_left" style="width:13%;">
                                        <input type="text" id="dtc4Cd" name="dtc4Cd" class="form_input" data-json-obj="true"/>
                                    </div>
                                    <div class="form_right" style="width:12%;">
                                        <input type="text" id="dtc4UseYn" name="dtc4UseYn" class="form_comboBox" data-json-obj="true"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <section class="group">
            <div class="table_form mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span id="befRoDocNoSpan"><spring:message code="ser.lbl.preRoDocNo" /></span></th><!-- 이전RO번호 -->
                            <td class="bor_none">
                                <div class="form_search">
                                    <input type="text" id="befRoDocNo" name="befRoDocNo" readonly class="form_input form_readonly" data-json-obj="true"  />
                                    <a href="javascript:selectBefRoNoPopupWindowWindow();"></a>
                                </div>
                            </td>
                            <th scope="row"><span id="befRoDtSpan"><spring:message code="ser.lbl.preRoDt" /></span></th><!-- 이전RO일자 -->
                            <td>
                                <input type="text" id="befRoDt" name="befRoDt" class="form_datetimepicker ac" />
                            </td>
                            <th scope="row"><span id="befRunDistValSpan"><spring:message code="ser.lbl.preRunDist" /></span></th><!-- 이전주행거리 -->
                            <td>
                                <input type="text" id="befRunDistVal" name="befRunDistVal" class="form_numeric ar" data-json-obj="true" />
                            </td>
                            <th scope="row" class="bor_none"></th>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.itemAmt" /></th><!-- 부품금액 -->
                            <td>
                                <input type="text" id="itemAmt" name="itemAmt" readonly class="form_numeric ar form_readonly" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.lbrAmt" /></th><!-- 공임금액 -->
                            <td>
                                <input type="text" id="lbrAmt" name="lbrAmt" readonly class="form_numeric ar form_readonly" data-json-obj="true" />
                            </td>
                            <th scope="row"><label><!-- <input type="checkbox" name="subLbrChk" id="subLbrChk" class="form_check"> --> <spring:message code="ser.lbl.subLbrAmt" /></label></th><!-- 외주금액 -->
                            <td>
                                <input type="text" id="subAmt" name="subAmt" class="form_numeric ar" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.totAmt" /></th><!-- 총금액 -->
                            <td>
                                <input type="text" id="totAmt" name="totAmt" readonly class="form_numeric ar form_readonly" data-json-obj="true"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <!-- 탭메뉴 전체 영역 -->
        <div id="tabstrip2" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.lbr" /></li>
                <li><spring:message code="ser.lbl.item" /></li>

            </ul>
            <!-- //탭메뉴 -->

            <div>
                <%-- <div class="btn_right_absolute">
                    <button type="button" id="lbrAdd" class="btn_s btn_add "><spring:message code="global.btn.add" /></button>
                    <button type="button" id="lbrDel" class="btn_s btn_delete "><spring:message code="global.btn.rowDel" /></button>
                    <button type="button" id="lbrCancel" class="btn_s btn_cancel "><spring:message code="global.btn.cancel" /></button>
                </div> --%>
                <div class="table_grid">
                    <div id="gridLabor" class="grid"></div>
                </div>
            </div>
            <!-- //정비항목 -->

            <!-- 부품 -->
            <div>
                <%-- <div class="btn_right_absolute">
                    <button type="button" id="parAdd" class="btn_s btn_add "><spring:message code="global.btn.add" /></button>
                    <button type="button" id="parDel" class="btn_s btn_delete "><spring:message code="global.btn.rowDel" /></button>
                    <button type="button" id="parCancel" class="btn_s btn_cancel "><spring:message code="global.btn.cancel" /></button>
                </div> --%>
                <div class="table_grid">
                    <div id="gridPart" class="grid"></div>
                </div>
            </div>
            <!-- 부품 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
        <!-- //조회승인신청 -->

        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_m" id="btnReturnReason"><spring:message code="ser.btn.returnReasonCont" /></button> <!-- 반송이유 팝업-->
                <button type="button" class="btn_m" id="btnRoHistPopup" disabled><spring:message code="ser.btn.btnRoHist" /></button><!--R/O 이력 팝업 -->
            </div>
        </div>

         <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true"/>
         <input type="hidden" id="crNo" name="crNo" data-json-obj="true"/>
         <input type="hidden" id="ltsModelCd" name="ltsModelCd" data-json-obj="true"/>
         <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true"/>
         <input type="hidden" id="carOwnerNm" name="carOwnerNm" data-json-obj="true"/>
         <input type="hidden" id="carDstinCd" name="carDstinCd" data-json-obj="true"/>
         <input type="hidden" id="roGrpNo" name="roGrpNo" data-json-obj="true"/>
         <input type="hidden" id="roTp" name="roTp" data-json-obj="true"/>
         <input type="hidden" id="crudStatCd" name="crudStatCd" data-json-obj="true"/>
         <input type="hidden" id="roWorkTime" value="" /> <!-- 삼보RO 작업시간 설정 -->

    </form>
<!-- script -->
<script type="text/javascript">


var roUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRo.do' />";
var rolbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoLabour.do' />";
var roPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoPart.do' />";

var claimUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaim.do' />";
var claimLbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimLabour.do' />";
var claimPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimPart.do' />";

/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;
/** 부품 조회 팝업 **/
var itemSalePrcPopupWindow;
/**PWA 승인번호조회 팝업**/
var pwaApprovePopupWindow;
/**이전 RO 팝업**/
var befRoNoPopupWindow;
/** 정비이력 조회 팝업 **/
var repairOrderSearchPopup;

var selectTabId = "claim";

//var rateList = [];

//클레임 그리드 선택 Row
var gridClaimRow = 0;
var selectedYn = false;
var gVatCd = Number("${vatCd}");

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    gVatCd = .16;
}
console.log('gVatCd:',gVatCd);

$(document).ready(function() {


    /********************** 팝업  설정 ***************************/
  //부품조회팝업
    partSearchPopupWindow = function (sFlag){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        itemSalePrcPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='ser.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                ,data:{
                     "autoBind":false
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(jsonObj){
                        if(jsonObj.length > 0) {

                            var grid = $('#gridPart').data('kendoExtGrid');

                            if(sFlag == 'GD'){
                                $.each(jsonObj, function(idx, data){

                                    var copyData = {};
                                    var result = true;
                                    $.each(grid.dataSource._data , function(i , partData){
                                        if(partData.itemCd == data.itemCd){
                                            result = false;
                                        }
                                    });
                                    if(result){
                                        copyData = {
                                                  dlrCd :data.dlrCd
                                                , itemCd:data.itemCd
                                                , itemNm:data.itemNm
                                                , reqQty:1
                                                , saleUnitCd:data.stockUnitCd
                                                , itemPrc:data.salePrcAmt
                                                , itemTax:( 1 + gVatCd )
                                                , itemAmt:Number( ( ( ( data.salePrcAmt * 1 ).toFixed(2) ) * ( 1 + gVatCd ) ).toFixed(2) )  //  ((부품단가 * markup * 수량 ) * tax)
                                                , cauItemYn:"N"
                                        };
                                        grid.dataSource.add(copyData);
                                        calLbrTotAmt();
                                    }

                                });
                             }else{
                                 $("#cauItemCd").val(jsonObj[0].itemCd);
                                 $("#cauItemNm").val(jsonObj[0].itemNm);


                                 // 그리드 원인부품 유무 초기화
                                 $.each(grid.dataSource._data, function(idx, data){
                                     grid.dataSource._data[idx].set("cauItemYn","N");
                                 });

                                 // 원인부품 선택한 부품코드가 그리드에 존재하면 원인부품 여부 선택
                                  $.each(jsonObj, function(idx, data){
                                     $.each(grid.dataSource._data , function(i , partData){

                                          if(partData.itemCd == data.itemCd){
                                             grid.dataSource._data[i].set("cauItemYn","Y");
                                         }
                                     });

                                 });

                                  itemSalePrcPopupWindow.close();

                             }
                        }
                    }
                }
            }
        });
    };

    /** 원인현상코드 조회 팝업 **/
    selectPhenCauCodeSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${cauItemCd}' />";

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
        if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        }

        var paintYn = ($("#claimTp").val() == 'P') ? "P":"C";

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data:{
                     "autoBind":false
                    ,"paintYn":paintYn  // paint:P , 원인코드:C
                    ,"itemCd":$("#cauItemCd").val()
                    ,"callbackFunc":function(data){
                        $("#cauCd").val(data[0].cauCd);
                        $("#cauNm").val(data[0].cauNm);
                        $("#phenCd").val(data[0].phenCd);
                        $("#phenNm").val(data[0].phenNm);
                    }
                }
            }
        });
    };

    /** PWA 승인번호 조회 팝업 **/
    selectPwaApproveSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.vinNo' var='vinNo' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />";

        if($("#vinNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
       /*  if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        } */


     pwaApprovePopupWindow = dms.window.popup({
            windowId:"pwaApprovePopupWindow"
            , title:"<spring:message code = 'ser.title.pwaList'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectPwaApproveSearchPopup.do'/>"
                , data:{
                     "autoBind":true
                    ,"dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"roDocNo":$("#roDocNo").val()
                    ,"callbackFunc":function(data){
                        $("#pwaApproveNo").val(data[0].pwaApproveNo);
                    }
                }
            }
        });
    };

    /** 이전 RO번호 조회 팝업 **/
    selectBefRoNoPopupWindowWindow = function (e){



        var cauItemMsg = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${cauItemCd}' />";

        if($("#claimTp").val() != "S"){
            return;
        }

        if($("#vinNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
         if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        }



        befRoNoPopupWindow = dms.window.popup({
            windowId:"befRoNoPopupWindow"
            , title:"<spring:message code = 'ser.lbl.roSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectPreRepairOrderSearchPopup.do'/>"
                , data:{
                     "autoBind":true
                    ,"dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"itemCd":$("#cauItemCd").val()
                    ,"roDocNo":$("#roDocNo").val()
                    , "callbackFunc":function(data){
                         $("#befRoDocNo").val(data[0].roDocNo);
                         $("#befRoDt").data("kendoExtMaskedDatePicker").value(data[0].roDt);
                         $("#befRunDistVal").data("kendoExtNumericTextBox").value(data[0].runDistVal);
                    }
                }
            }
        });
    };


    /** 정비이력 조회 팝업 **/
    selectRepairOrderSearchPopupWindow = function (e){

         repairOrderSearchPopup = dms.window.popup({
             windowId:"repairOrderSearchPopup"
             , width:920
             , height:550
             , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
             , content:{
                 url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                 , data:{
                     "autoBind":false
                     , "listType":"01"
                     , "callbackFunc":function(data){

                     }
                 }
             }
         });
     };


    /********************** 팝업  설정 ***************************/


    /********************** 초기 데이터  설정 ***************************/
    /**삼보 RO 작업시간 설정**/
    <c:forEach var ="obj" items="${roWorkTimeDs}">
      $("#roWorkTime").val("${obj.applyPrid}");
    </c:forEach>

    /**클레임 조회조건 시작일자 **/
    $("#sClaimFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**클레임 조회조건 종료일자**/
    $("#sClaimToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    /** RO 조회조건 시작일자 **/
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**RO 조회조건 종료일자**/
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    /**RO유형**/
    var roTpList = [];
     <c:forEach var ="obj" items="${roTpDs}">
         roTpList.push({
             cmmCdNm:"${obj.cmmCdNm}"
             , cmmCd:"${obj.cmmCd}"
         });
     </c:forEach>

    /**임률정보**/
   var rateList = [];
     <c:forEach var ="obj" items="${rateDs}">
       rateList.push({
             rpirTp:"${obj.rpirTp}"
             , rpir01:"${obj.gnlRteRate}"
             , rpir02:"${obj.wartRteRate}"
             , rpir03:"${obj.incRteRate}"
             , rpir04:"${obj.intRteRate}"
             , rpir05:"${obj.rwrkRteRate}"
         });
     </c:forEach>

     // 임률 데이터 배열을 맵으로 변환한다.
     var rateMap = rateList.reduce( function(map , obj){
         map[ obj.rpirTp] = obj;
         return map;
       } ,{});

     //RO 유형 , 수리유형별 임률정보를 가져온다.
     setRpirRate = function( roTp , rpirCd ){

         var resultVal = "0";
         if(rpirCd == "" || rpirCd == null){
             return resultVal = eval("rateMap['01'].rpir"+roTp);
         }

         /**
                    수리유형
           01:검사조정
           02:정기점검
           03:기계수리
           04:판금페인트
           05:악세사리
         **/

         if(rateMap[rpirCd] != undefined){ // 일반
             resultVal = eval("rateMap[rpirCd].rpir"+roTp);
         }else{ // 클레임 일경우
             var claimTp = "01";

             if(rpirCd == "P") claimTp ="04"; //판금페인트
             if(roTp == "02"){
                 resultVal = eval("rateMap[claimTp].rpir"+roTp);
             }else{//일반수리
                 resultVal = eval("rateMap[claimTp].rpir"+roTp);
             }
         }
         return resultVal;
     };


     /**클레임유형**/
    var claimTpList = [];
     <c:forEach var ="obj" items="${claimTpDs}">
     claimTpList.push({
             cmmCdNm:"${obj.cmmCdNm}"
             , cmmCd:"${obj.cmmCd}"
         });
     </c:forEach>

     var claimTpMap = dms.data.arrayToMap(claimTpList , function(obj){return obj.cmmCd;});

     $("#sClaimTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimTpList
         ,optionLabel:" "
         ,index:0
     });

     //클레임 타입 선택 체크
     claimTpCheck = function(e){
         var claimTp = $("#claimTp").data("kendoExtDropDownList").value();
         if(claimTp == "C" || claimTp == "K" || claimTp == "V" || claimTp == "R"|| claimTp == "T"){
             //ser.info.isNotSelectClaimTp
             dms.notification.warning("<spring:message code='ser.info.isNotSelectClaimTp'/>");
             $("#claimTp").data("kendoExtDropDownList").value("");
             return;
         }else{

             setRequiredField(); //필수값 설정

             var gridLbr = $("#gridLabor").data("kendoExtGrid");
             var gridLbrData = gridLbr.dataSource._data;

             $.each(gridLbrData , function(i , gridData){

                 var lbrQty = Number(gridData.lbrQty);
                 var lbrHm  = Number(gridData.lbrHm);
                 var lbrPrc = Number(setRpirRate($("#roTp").val() ,claimTp ));

                 var lbrAmt = Number(( lbrQty * lbrHm * lbrPrc  ).toFixed(2));

                 gridLbr.dataSource._data[i].set("lbrAmt",lbrAmt);
                 gridLbr.dataSource._data[i].set("lbrPrc" , lbrPrc );
                 calLbrTotAmt();

             });
         }

     };

     $("#claimTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimTpList
         ,optionLabel:" "
         ,index:0
         ,change:claimTpCheck
     });

     setClaimTpMap = function(value){
         var resultVal = "";
         if( dms.string.strNvl(value) != ""){
            if(claimTpMap[value] != undefined)
             resultVal =  claimTpMap[value].cmmCdNm;
         }
         return resultVal;
     };

     /**캠페인 유형**/
    var campaignTpList = [];
     <c:forEach var ="obj" items="${campaignTpDs}">
     campaignTpList.push({
             cmmCdNm:"${obj.cmmCdNm}"
             , cmmCd:"${obj.cmmCd}"
         });
     </c:forEach>

     /**조회조건**/
    var searchTpList = [];
     <c:forEach var ="obj" items="${searchTpDs}">
     searchTpList.push({
             cmmCdNm:"${obj.cmmCdNm}"
             , cmmCd:"${obj.cmmCd}"
         });
     </c:forEach>

     // 검색유형
     $("#sField").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:searchTpList
         ,optionLabel:" "
         ,index:0
     });

     /**클레임상태**/
    var claimStatList = [];
     <c:forEach var ="obj" items="${claimStatDs}">
     claimStatList.push({
             cmmCdNm:"${obj.cmmCdNm}"
             , cmmCd:"${obj.cmmCd}"
         });
     </c:forEach>
     var claimStatMap = dms.data.arrayToMap(claimStatList , function(obj){return obj.cmmCd;});

     $("#sClaimStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimStatList
         ,optionLabel:" "
         ,index:0
     });

     $("#claimStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimStatList
         ,optionLabel:" "
         ,index:0
     });

     setClaimStatMap = function(value){
         var resultVal = "";
         if( dms.string.strNvl(value) != ""){
            if(claimStatMap[value] != undefined)
             resultVal =  claimStatMap[value].cmmCdNm;
         }
         return resultVal;
     };

     /**RO 상태**/
     var roStatList = [];
      <c:forEach var ="obj" items="${roStatDs}">
      roStatList.push({
              cmmCdNm:"${obj.cmmCdNm}"
              , cmmCd:"${obj.cmmCd}"
          });
      </c:forEach>

      $("#roStatCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:roStatList
          ,optionLabel:" "
          ,index:0
      });

     /**외주구분 코드**/
     var subDstinList = [];
      <c:forEach var ="obj" items="${subDstinDs}">
      subDstinList.push({
              cmmCdNm:"${obj.cmmCdNm}"
              , cmmCd:"${obj.cmmCd}"
          });
      </c:forEach>

      $("#subDstinCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:subDstinList
          ,optionLabel:" "
          ,index:0
      });

     /**이전부품코드**/
     var asPartDsList = [];
      <c:forEach var ="obj" items="${asPartDs}">
      asPartDsList.push({
              cmmCdNm:"${obj.cmmCdNm}"
              , cmmCd:"${obj.cmmCd}"
          });
      </c:forEach>

      $("#asParWartDstinCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:asPartDsList
          ,optionLabel:" "
          ,index:0
      });

      /** 고장코드**/
      var dtcDsList = [];
       <c:forEach var ="obj" items="${useYnDs}">
       dtcDsList.push({
               cmmCdNm:"${obj.cmmCdNm}"
               , cmmCd:"${obj.cmmCd}"
           });
       </c:forEach>

       // 고장코드1
       $("#dtc1UseYn").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:dtcDsList
          ,index:2
      });
       // 고장코드2
       $("#dtc2UseYn").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:dtcDsList
          ,index:2
      });
       // 고장코드3
       $("#dtc3UseYn").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:dtcDsList
          ,index:2
      });
       // 고장코드4
       $("#dtc4UseYn").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:dtcDsList
          ,index:2
      });

      // 주원인 여부
      var cauYnList = [];
      <c:forEach var ="obj" items="${cauYnDs}">
      cauYnList.push({
          cmmCdNm:"${obj.cmmCdNm}"
          , cmmCd:"${obj.cmmCd}"
      });
      </c:forEach>

      var cauYnMap = dms.data.arrayToMap(cauYnList , function(obj){return obj.cmmCd;});

      setCauYnMap = function(value){
          var resultVal = "";
          if(dms.string.strNvl(value) != ""){
             if(cauYnMap[value] != undefined)
              resultVal =  cauYnMap[value].cmmCdNm;
          }
          return resultVal;
      };

      /**부품금액**/
      $("#itemAmt").kendoExtNumericTextBox({
         format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,value:0.00
        ,spinners:false
      });
      /**공임금액**/
      $("#lbrAmt").kendoExtNumericTextBox({
         format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,value:0.00
        ,spinners:false
      });
      /**외주금액**/
      $("#subAmt").kendoExtNumericTextBox({
         format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,value:0.00
        ,spinners:false
      });
      /**총금액**/
      $("#totAmt").kendoExtNumericTextBox({
         format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,value:0.00
        ,spinners:false
      });

      /**주행거리**/
      $("#runDistVal").kendoExtNumericTextBox({
         min:0
        ,format:"n0" //"{0:##,###}"
        ,value :0
        ,spinners:false             // 증,감 화살표

      });

      /**최종주행거리**/
      $("#lastDistVal").kendoExtNumericTextBox({
         min:0
        ,format:"n0" //"{0:##,###}"
        ,value :0
        ,spinners:false             // 증,감 화살표

      });

      /**이전주행거리**/
      $("#befRunDistVal").kendoExtNumericTextBox({
         min:0
        ,format:"n0" //"{0:##,###}"
        ,value :0
        ,spinners:false             // 증,감 화살표
      });

     /** 클레임생성일 **/
     $("#regDt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,value:""
     });

     /** RO일자 **/
     $("#roDt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,value:""
     });

     /** 이전RO일자 **/
     $("#befRoDt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,value:""
     });

     /** 보증적용일자 **/
     $("#wartDt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,value:""
     });
     /** 작업시작일 **/
     $("#roStartDt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,value:""
     });
     /** 작업종료일 **/
     $("#roEndDt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,value:""
     });
    /********************** 초기 데이터  설정 ***************************/


    /********************** 버튼  설정 ***************************/

    /** 조회 버튼**/
    $("#btnSearch").kendoButton({
        click:function(e){
            getSearchData(selectTabId);
        }
    });

    getSearchData = function(selectTabId){

        if(selectTabId == "claim"){
            $("#gridClaim").data("kendoExtGrid").dataSource.data([]);
            $("#gridClaim").data("kendoExtGrid").dataSource.read();
        }else{
            $("#gridRo").data("kendoExtGrid").dataSource.data([]);
            $("#gridRo").data("kendoExtGrid").dataSource.read();
        }
    };

    /** 조회 버튼**/
    $("#btnInquire").kendoButton({

        click:function(e){

            searchClaimData();
        }
    });

    /** 초기화 버튼**/
    $("#btnInit").kendoButton({

        click:function(e){
            getClearField();
        }
    });

    /** 저장 버튼**/
    $("#btnSave").kendoButton({

        click:function(e){
            sendRequestSave( ($("#claimStatCd").val() == "") ? "O":$("#claimStatCd").val());

        }

    });

    /** 취소 버튼**/
    $("#btnCancel").kendoButton({

        click:function(e){
            if(!confirm("<spring:message code='ser.btn.cancel' var='cancel' />"+
            "<spring:message code='global.info.cnfrmMsg' arguments='${cancel}' />")){
                return;
            }
            sendRequestData("C");
        }

    });

    /** 요청 버튼**/
    $("#btnReq").kendoButton({

        click:function(e){

            sendRequestData("Q");
        }

    });

    /** 요청취소 버튼**/
    $("#btnReqCancel").kendoButton({

        click:function(e){
            if(!confirm("<spring:message code='ser.lbl.reqCancel' var='reqCancel' />"+
            "<spring:message code='global.info.cnfrmMsg' arguments='${reqCancel}' />")){
                return;
            }
            sendRequestData("O");
        }

    });

    /** 정비이력팝업 버튼**/
    $("#btnRoHistPopup").kendoButton({

        click:function(e){
            selectRepairOrderSearchPopupWindow();
        }

    });

    /** 반송사유팝업 버튼**/
    $("#btnReturnReason").kendoButton({

        click:function(e){
            dms.notification.warning("<spring:message code='global.info.developIng' />");
        }

    });

    /** 초기화 **/
    getClearField = function(e){

        $("#claimRequestForm").get(0).reset();

        $("#gridLabor").data("kendoExtGrid").dataSource._destroyed = [];
        $("#gridPart").data("kendoExtGrid").dataSource._destroyed = [];
        //$("#fileGrid").data("kendoExtGrid").dataSource._destroyed = [];

        $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
        $("#gridPart").data("kendoExtGrid").dataSource.data([]);
        //$("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        return true;
    } ;

    /********************** 버튼  설정 ***************************/


    /********************** 데이터 설정 ***************************/
    /** 취소/요청/요청취소 전송 데이터 세팅**/
    sendRequestData = function (sFlag){

        if(!saveCheckValue()){
            return;
        }

        $("#crudStatCd").val( ($("#claimDocNo").val() == "") ? "C":"U" ) ;

        var grid = $("#gridClaim").data("kendoExtGrid");

        var formSaveData = $("#claimRequestForm").serializeObject( $("#claimRequestForm").serializeArrayInSelector("[data-json-obj='true']"));
         formSaveData.befRoDt = $("#befRoDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.wartDt = $("#wartDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.roStartDt = $("#roStartDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.roEndDt = $("#roEndDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.roDt = $("#roDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.claimTp = $("#claimTp").data("kendoExtDropDownList").value();
         formSaveData.claimStatCd =  sFlag;

         $.ajax({
            url:"<c:url value='/ser/wac/claimReq/updateClaimRequest.do' />"
           ,data:JSON.stringify(formSaveData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
            ,success:function(result , textStatus){

                selectedYn = true;
                gridClaimRow = grid.select().index();

                getSearchData(selectTabId); // Hearder Grid 조회
                searchClaimData();
                setButtonEnable($("#claimStatCd").val());
                dms.notification.success("<spring:message code='global.info.success' />");
            }
        });

    };

    /** 저장 전송 데이터 세팅**/
    sendRequestSave = function (sFlag){

        if(!saveCheckValue()){
            return;
        }

        var gridLabor = $("#gridLabor").data("kendoExtGrid");
        var gridPart = $("#gridPart").data("kendoExtGrid");

        $("#crudStatCd").val( ($("#claimDocNo").val() == "") ? "C":"U" ) ;

        var formSaveData = $("#claimRequestForm").serializeObject( $("#claimRequestForm").serializeArrayInSelector("[data-json-obj='true']"));
         formSaveData.befRoDt = $("#befRoDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.wartDt = $("#wartDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.roStartDt = $("#roStartDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.roEndDt = $("#roEndDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.roDt = $("#roDt").data("kendoExtMaskedDatePicker").value();
         formSaveData.claimTp = $("#claimTp").data("kendoExtDropDownList").value();

         formSaveData.claimStatCd =  sFlag;

         var labourSaveData = gridLabor.dataSource.data();
         var partSaveData = gridPart.dataSource.data();


         var searchYn = dms.string.isEmpty($("#claimDocNo").val());

         var params =  $.extend(
                 {"claimReqVO":formSaveData}
                ,{"claimReqLbrVO":{"insertList":labourSaveData}}
                ,{"claimReqPartVO":{"insertList":partSaveData}}
          );


         $.ajax({
            url:"<c:url value='/ser/wac/claimReq/multiClaimRequests.do' />"
           ,data:JSON.stringify(params)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
            ,success:function(result , textStatus){

                $("#claimDocNo").val(result);


                if(searchYn) {

                    selectedYn = true;
                    gridClaimRow = 0;

                    //getSearchData(selectTabId); // Hearder Grid 조회
                    $("#gridClaim").data("kendoExtGrid").dataSource.data([]);
                    $("#gridRo").data("kendoExtGrid").dataSource.data([]);
                    $("#gridClaim").data("kendoExtGrid").dataSource.read();
                    $("#gridRo").data("kendoExtGrid").dataSource.read();
                }
                searchClaimData();
                setButtonEnable($("#claimStatCd").val());
                dms.notification.success("<spring:message code='global.info.success' />");
            }
        });

    };


    /**저장된 클레임 데이터 조회 **/
    searchClaimData = function(e){



        var params = {};
        params["sVinNo"] = $("#vinNo").val();
        params["sClaimDocNo"] = $("#claimDocNo").val();
        params["sDlrCd"] = $("#dlrCd").val();

        var gridLabor =  $("#gridLabor").data("kendoExtGrid");
        var gridPart = $("#gridPart").data("kendoExtGrid");

        $.ajax({
            url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimByKey.do' />"
           ,data:JSON.stringify(params)
           ,type:"POST"
           ,dataType:"json"
           ,contentType:"application/json"
           ,error:function(jqXHR,status,error) {

              dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function (result){

               setResultDataSetting(result);

               gridLabor.dataSource._destroyed = [];
               gridPart.dataSource._destroyed = [];
               gridLabor.dataSource.transport.options.read.url = claimLbrUrl;
               gridPart.dataSource.transport.options.read.url = claimPartUrl;

               gridLabor.dataSource.read();
               gridPart.dataSource.read();


               setButtonEnable($("#claimStatCd").val());
               setRequiredField(); // 필수값 설정

            }

        }) ;
    };


    /** 조회 결과값  세팅**/
    setResultDataSetting =  function (result){


        $("#claimDocNo").val(result.claimDocNo);
        $("#dlrCd").val(result.dlrCd);
        $("#crNo").val(result.crNo);
        $("#roDocNo").val(result.roDocNo);
        $("#roGrpNo").val(result.roGrpNo);
        $("#roTp").val(result.roTp);
        $("#vinNo").val(result.vinNo);
        $("#carRegNo").val(result.carRegNo);
        $("#carDstinCd").val(result.carDstinCd);
        $("#cauCd").val(result.cauCd);
        $("#cauNm").val(result.cauNm);
        $("#phenCd").val(result.phenCd);
        $("#phenNm").val(result.phenNm);
        $("#remark").val(result.remark);
        $("#pwaApproveNo").val(result.pwaApproveNo);
        $("#ltsModelCd").val(result.ltsModelCd);
        $("#ltsModelNm").val(result.ltsModelNm);
        $("#cauOperAtcCd").val(result.cauOperAtcCd);
        $("#cauOperAtcNm").val(result.cauOperAtcNm);
        $("#cauItemCd").val(result.cauItemCd);
        $("#cauItemNm").val(result.cauItemNm);
        $("#befRoDocNo").val(result.befRoDocNo);
        $("#enginNo").val(result.enginNo);
        $("#carOwnerId").val(result.carOwnerId);
        $("#carOwnerNm").val(result.carOwnerNm);

        $("#roTp").val(result.roTp);
        $("#dtc1Cd").val(result.dtc1Cd);
        $("#dtc2Cd").val(result.dtc2Cd);
        $("#dtc3Cd").val(result.dtc3Cd);
        $("#dtc4Cd").val(result.dtc4Cd);

        // 캠페인 인경우만  자동세팅
        if(dms.string.isNotEmpty($("#crNo").val())){
            $("#claimTp").data("kendoExtDropDownList").enable(false);
           // $("#claimTp").attr("readonly",bFlag).addClass("form_readonly");
        }else{
          //  $("#claimTp").attr("readonly",bFlag).removeClass("form_readonly");
            $("#claimTp").data("kendoExtDropDownList").enable(true);
        }

        $("#claimTp").data("kendoExtDropDownList").value(result.claimTp);


        $("#asParWartDstinCd").data("kendoExtDropDownList").value(result.asParWartDstinCd);
        $("#claimStatCd").data("kendoExtDropDownList").value(result.claimStatCd);

        $("#subDstinCd").data("kendoExtDropDownList").value(result.subDstinCd);
        $("#roStatCd").data("kendoExtDropDownList").value(result.roStatCd);

        $("#dtc1UseYn").data("kendoExtDropDownList").value(result.dtc1UseYn);
        $("#dtc2UseYn").data("kendoExtDropDownList").value(result.dtc2UseYn);
        $("#dtc3UseYn").data("kendoExtDropDownList").value(result.dtc3UseYn);
        $("#dtc4UseYn").data("kendoExtDropDownList").value(result.dtc4UseYn);

        $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
        $("#roDt").data("kendoExtMaskedDatePicker").value(result.roDt);
        $("#wartDt").data("kendoExtMaskedDatePicker").value(result.wartDt);
        $("#roStartDt").data("kendoExtMaskedDatePicker").value(result.roStartDt);
        $("#roEndDt").data("kendoExtMaskedDatePicker").value(result.roEndDt);
        $("#befRoDt").data("kendoExtMaskedDatePicker").value(result.befRoDt);


        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
        $("#befRunDistVal").data("kendoExtNumericTextBox").value(result.befRunDistVal);
        $("#itemAmt").data("kendoExtNumericTextBox").value(result.itemAmt);
        $("#lbrAmt").data("kendoExtNumericTextBox").value(result.lbrAmt);
        $("#subAmt").data("kendoExtNumericTextBox").value(Number(dms.string.defaultString(result.subAmt, "0" )));
        $("#totAmt").data("kendoExtNumericTextBox").value(result.totAmt);




       // $("#fileKeyNm").val(result.fileKeyNm);

    };

    /********************** 데이터 설정 ***************************/


    /********************** 계산로직 설정 ***************************/

 // 요청금액 합계 계산
    calTotAmt = function(){

        var gridLbr = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLbr.dataSource._data;

        var gridPart = $("#gridPart").data("kendoExtGrid");
        var gridPartData = gridPart.dataSource._data;


     // 전체 공임 금액 계산
        var labrTotAmt=0;
        $.each(gridLbrData , function(i , labrData){
            labrTotAmt += labrData.lbrAmt;
       });

        $("#lbrAmt").data("kendoExtNumericTextBox").value(labrTotAmt);

        // 전체 부품 금액 계산
        var partTotAmt=0;
         $.each(gridPartData , function(i , partData){
             partTotAmt += partData.itemAmt;
        });

         $("#itemAmt").data("kendoExtNumericTextBox").value(partTotAmt);

         var lbrAmt    = Number(dms.string.defaultString($("#lbrAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var subLbrAmt = Number(dms.string.defaultString($("#subAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var partAmt   = Number(dms.string.defaultString($("#itemAmt").data("kendoExtNumericTextBox").value() , "0" ) );

        $("#totAmt").data("kendoExtNumericTextBox").value(labrTotAmt + subLbrAmt + partTotAmt);
    };

    //공임 그리드 임률  변경시 재계산
    calLbrGridAmt = function(e){

        var gridLbr = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLbr.dataSource._data;

        var selectedVal = gridLbr.dataItem(gridLbr.select());

        var lbrQty = Number(selectedVal.lbrQty);
        var lbrHm  = Number(selectedVal.lbrHm);
        var lbrPrc = Number(selectedVal.lbrPrc);
        var lbrAmt = Number((lbrQty* lbrHm * lbrPrc  ).toFixed(2));

        selectedVal.set("lbrAmt",lbrAmt);
        calLbrTotAmt();
    };

 // 요청 공임 금액 합계 계산
    calLbrTotAmt = function(){

        var gridLbr = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLbr.dataSource._data;


     // 전체 공임 금액 계산
        var labrTotAmt=0;
        $.each(gridLbrData , function(i , labrData){
            labrTotAmt += labrData.lbrAmt;
       });

        $("#lbrAmt").data("kendoExtNumericTextBox").value(labrTotAmt);

         var lbrAmt    = Number(dms.string.defaultString($("#lbrAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var subLbrAmt = Number(dms.string.defaultString($("#subAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var partAmt   = Number(dms.string.defaultString($("#itemAmt").data("kendoExtNumericTextBox").value() , "0" ) );

        $("#totAmt").data("kendoExtNumericTextBox").value(lbrAmt + subLbrAmt + partAmt);
    };

    // 부품합계
    calPartTotAmt = function(){

        var gridPart = $("#gridPart").data("kendoExtGrid");
        var gridPartData = gridPart.dataSource._data;

        // 전체 부품 금액 계산
        var partTotAmt=0;
         $.each(gridPartData , function(i , partData){
             partTotAmt += partData.itemAmt;
        });

         $("#itemAmt").data("kendoExtNumericTextBox").value(partTotAmt);

         var lbrAmt    = Number(dms.string.defaultString($("#lbrAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var subLbrAmt = Number(dms.string.defaultString($("#subAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var partAmt   = Number(dms.string.defaultString($("#itemAmt").data("kendoExtNumericTextBox").value() , "0" ) );

         $("#totAmt").data("kendoExtNumericTextBox").value(lbrAmt + subLbrAmt + partAmt);
    };

    /********************** 계산로직 설정 ***************************/


    /********************** 저장 필수값 체크 ***************************/


    saveCheckValue = function (e){

        /**
         1. RO 시작일자 체크
         2. RO 종료일자 체크
         3. RO 시작일 종료일 유효성 체크
         4. 원인/현상코드 체크 ( 캠페인은 제외 )
         5. 비고란 필수 체크 ( 캠페인은 제외)
         7. 보증수리 일경우 원인부품 필수값으로
         8. 주작업코드 체크
         9. AS 부품인경우 외주부품구분 코드 필수
         10.AS 부품 :이전RO  , 일자 , 마일리지 필수 값
         11.AS부품이 아닌때  외주부품구분은 A(보증) 만 선택 가능함. "WSR00198"


      // 기준 등록 작업일수 보다 작업 시간이 많을 경우 문제점 필수 값으로 (삼포관련 로직)
         if ( eval(RO_WORK_TIME.realValue) >= eval(RO_TOT_WORK.realValue) &&
             PLBM_RMK.realValue == ""
         ) {
             PLBM_RMK.setFocus();
             return sendMessage("WSR00166");
         }

        **/



        var msgText;
        var result = true;


        if( dms.string.isEmpty($("#claimTp").val()) ){ //클레임 유형
            msgText = "<spring:message code='ser.lbl.claimTp' var='claimTp' />"+
            "<spring:message code='global.info.chkSelectItemMsg' arguments='${claimTp}' />";

            $("#claimTp").focus();
            result =  false;

        }else if( $("#vinNo").val() == "" ) { //빈번호
            msgText = "<spring:message code='ser.lbl.vinNo' var='global_lbl_vinNo' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_vinNo}' />";

                      $("#vinNo").focus();
                      result =  false;

        }else if( $("#roStartDt").val() == "" ){ //RO시작일자
            msgText = "<spring:message code='ser.lbl.roStartDt' var='roStartDt' />"+
                      "<spring:message code='global.info.confirmMsgParam' arguments='${roStartDt}' />";
                      result =  false;
        }else if( $("#roEndDt").val() == "" ){ //RO종료일자
            msgText = "<spring:message code='ser.lbl.roEndDt' var='roEndDt' />"+
                      "<spring:message code='global.info.confirmMsgParam' arguments='${roEndDt}' />";
                      result =  false;
        }else if( $("#roStartDt").val() > $("#roEndDt").val() ){ // 시작일자 > 종료일자
            msgText = "<spring:message code='ser.lbl.roStartDt' var='roStartDt' />"+
                      "<spring:message code='ser.lbl.roEndDt' var='roEndDt' />"+
                      "<spring:message code='global.info.validation.min' arguments='${roEndDt} , ${roStartDt}' />";
                      result =  false;
        }else if( $("#cauOperAtcCd").val() == "" ){ //주작업코드
            msgText = "<spring:message code='ser.lbl.mainLbrCd' var='mainLbrCd' />"+
                      "<spring:message code='global.info.required.field' arguments='${mainLbrCd}' />";
                      result =  false;
        }

        // 캠페인은경우 체크로직 제외
        if($("#crNo").val() == ""){
            if( $("#cauCd").val() == "" ){
                msgText = "<spring:message code='ser.lbl.cauCd' var='ser_lbl_cauCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${ser_lbl_cauCd}' />";
                          result =  false;
            }else if( $("#phenCd").val() == "" ){
                msgText = "<spring:message code='ser.lbl.phenCd' var='ser_lbl_phenCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${ser_lbl_phenCd}' />";
                          result =  false;
            }else if( $("#remark").val() == "" ){
                msgText = "<spring:message code='ser.lbl.problem' var='problem' />"+
                          "<spring:message code='global.info.required.field' arguments='${problem}' />";
                          $("#errPhenCont").focus();
                          result =  false;
            }else if( $("#cauItemCd").val() == "" ){
                msgText = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${cauItemCd}' />";

                         result =  false;
            }
        }
        /*
        AS 부품 체크로직
                외주부품구분 코드 필수
                이전RO  , 일자 , 마일리지 필수 값
        AS부품이 아닌때  외주부품구분은 A(보증) 만 선택 가능함.
        */
        if($("#claimTp").val() == "S"){
            if( $("#asParWartDstinCd").val() == "" ){
                msgText = "<spring:message code='ser.lbl.asPartCd' var='asPartCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${asPartCd}' />";
                         result =  false;
            }else if( $("#befRoDocNo").val() == "" ){
                msgText = "<spring:message code='ser.lbl.preRoDocNo' var='preRoDocNo' />"+
                          "<spring:message code='global.info.required.field' arguments='${preRoDocNo}' />";
                         result =  false;
            }else if( $("#befRoDt").val() == "" ){
                msgText = "<spring:message code='ser.lbl.preRoDt' var='preRoDt' />"+
                          "<spring:message code='global.info.required.field' arguments='${preRoDt}' />";
                         result =  false;
            }else if( $("#befRunDistVal").val() == "" ){
                msgText = "<spring:message code='ser.lbl.preRunDist' var='preRunDist' />"+
                          "<spring:message code='global.info.required.field' arguments='${preRunDist}' />";
                         result =  false;
            }
        }else{
            if( $("#asParWartDstinCd").val() == "B" ){
                msgText = "<spring:message code='ser.lbl.claimTp' var='claimTp' />"+
                          "<spring:message code='ser.lbl.asPartCd' var='asPartCd' />"+
                          "<spring:message code='global.info.isCheckedItem' arguments='${claimTp},${asPartCd}' />";
                         result =  false;
            }
        }

        if(!result) dms.notification.warning(msgText);
        return result;

    };

    /** 필수값 설정 **/
    setRequiredField = function(e){

        if($("#crNo").val() != ""){
            $("#cauCdSpan").removeClass("bu_required");
            $("#phenCdSpan").removeClass("bu_required");
            $("#remarkSpan").removeClass("bu_required");
        }else{
            $("#cauCdSpan").addClass("bu_required");
            $("#phenCdSpan").addClass("bu_required");
            $("#remarkSpan").addClass("bu_required");

        }
        if($("#claimTp").val() == "S"){
            $("#befRoDocNoSpan").addClass("bu_required");
            $("#befRoDtSpan").addClass("bu_required");
            $("#befRunDistValSpan").addClass("bu_required");

            $("#befRoDocNo").removeClass("form_readonly");
            $("#befRoDocNo").prop("readonly",false);


            $("#befRunDistVal").data("kendoExtNumericTextBox").enable(true);
            $("#befRoDt").data("kendoExtMaskedDatePicker").enable(true);
        }else{
            $("#befRoDocNoSpan").removeClass("bu_required");
            $("#befRoDtSpan").removeClass("bu_required");
            $("#befRunDistValSpan").removeClass("bu_required");

            $("#befRoDocNo").addClass("form_readonly");
            $("#befRoDocNo").prop("readonly",true);

            $("#befRunDistVal").data("kendoExtNumericTextBox").enable(false)
            $("#befRoDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#befRoDocNo").val("");
            $("#befRunDistVal").data("kendoExtNumericTextBox").value(0);
            $("#befRoDt").data("kendoExtMaskedDatePicker").value("");


        }

    };

  //버튼설정
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "O" :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(true);
                $("#btnReqCancel").data("kendoButton").enable(false);

                      break;
            case "A" :
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);

                      break;
             case "C" :
                 $("#btnSave").data("kendoButton").enable(false);
                 $("#btnCancel").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(false);

                      break;
            case "Q" :
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(true);

                      break;
            case "R" :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(true);
                $("#btnReqCancel").data("kendoButton").enable(false);

                      break;
            default :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);

                break;
        }
    };
    setFileButton("N");


    $("#gridClaim").kendoExtGrid({

        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForClaim.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sClaimFromDt"] = $("#sClaimFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sClaimToDt"]   = $("#sClaimToDt").data("kendoExtMaskedDatePicker").value();
                         params["sClaimStatCd"] = $("#sClaimStatCd").data("kendoExtDropDownList").value();
                         params["sClaimTp"] = $("#sClaimTp").data("kendoExtDropDownList").value();
                         params["sField"] = $("#sField").data("kendoExtDropDownList").value();
                         params["sText"] = $("#sText").val();


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,claimDocNo:{type:"string" }
                       ,claimStartDt:{type:"date" }
                       ,roDocNo:{type:"string" }
                       ,claimTp:{type:"string" }
                       ,crNo:{type:"string" }
                       ,roDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridClaimRow]);
            }
        }
        ,height:200
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());

            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var claimDocNo = selectedVal.claimDocNo;

            $("#vinNo").val(vinNo);
            $("#dlrCd").val(dlrCd);
            $("#claimDocNo").val(claimDocNo);

            var params = {};
            params["sVinNo"] = $("#vinNo").val();
            params["sClaimDocNo"] = $("#claimDocNo").val();
            params["sDlrCd"] = $("#dlrCd").val();

            getClearField();
            $.ajax({
                url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){

                   setResultDataSetting(result);

                   $("#gridLabor").data("kendoExtGrid").dataSource.transport.options.read.url = claimLbrUrl;
                   $("#gridPart").data("kendoExtGrid").dataSource.transport.options.read.url = claimPartUrl;

                   $("#gridLabor").data("kendoExtGrid").dataSource.read();
                   $("#gridPart").data("kendoExtGrid").dataSource.read();

                   //$("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                   //$("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#claimStatCd").val());
                   setRequiredField(); // 필수값 세팅
                   //dms.notification.success("<spring:message code='global.info.searchSuccess' />");

                }

            }) ;

        }
        ,columns:[
                    {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
                   ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />", width:100,sortable:false, attributes :{"class":"al"}  }
                   ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:70, attributes :{"class":"al"} }
                   ,{field:"claimStartDt" , title:"<spring:message code='ser.lbl.claimRegDt' />", width:80
                       , attributes :{"class":"ac"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"
                    }
                   ,{field:"roDocNo",title:"<spring:message code='ser.lbl.roDocNo' />", width:70, attributes :{"class":"al"} }
                   ,{field:"claimTp",title:"<spring:message code='ser.lbl.claimTp' />", width:60
                       ,attributes :{"class":"ac"}
                       ,template:"#=setClaimTpMap(claimTp)#"
                       ,editor:function(container, options){
                           $('<input required name="claimTp" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,dataValueField:"cmmCd"
                               ,dataSource:claimTpList
                               ,valuePrimitive:true
                           });
                           $('<span class="k-invalid-msg" data-for="claimTp"></span>').appendTo(container);
                          }
                     }
                   ,{field:"claimStatCd",title:"<spring:message code='ser.lbl.claimStatNm' />", width:60
                       ,attributes :{"class":"ac"}
                       ,template:"#=setClaimStatMap(claimStatCd)#"
                       ,editor:function(container, options){
                           $('<input required name="claimStatCd" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,dataValueField:"cmmCd"
                               ,dataSource:claimTpList
                               ,valuePrimitive:true
                           });
                           $('<span class="k-invalid-msg" data-for="claimStatCd"></span>').appendTo(container);
                          }
                     }
                  ,{field:"crNo", title:"<spring:message code='global.lbl.crNo' />" , width:100 , attributes :{"class":"al"}} //캠페인번호

                 ]

    });

    $("#gridRo").kendoExtGrid({

        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForRo.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sRoToDt"]   = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sRoDocNo"] = $("#sRoDocNo").val();


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,roDocNo:{type:"string" }
                       ,claimTp:{type:"string" }
                       ,crNo:{type:"string" }
                       ,roDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:200
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());

            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var roDocNo = selectedVal.roDocNo;

            $("#vinNo").val(vinNo);
            $("#dlrCd").val(dlrCd);
            $("#roDocNo").val(roDocNo);

            var params = {};
            params["sVinNo"] = $("#vinNo").val();
            params["sRoDocNo"] = $("#roDocNo").val();
            params["sDlrCd"] = $("#dlrCd").val();

            getClearField();
            $.ajax({
                url:"<c:url value='/ser/wac/claimReq/selectClaimRequestByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){

                   setResultDataSetting(result);

                   $("#gridLabor").data("kendoExtGrid").dataSource.transport.options.read.url = rolbrUrl;
                   $("#gridPart").data("kendoExtGrid").dataSource.transport.options.read.url = roPartUrl;

                   $("#gridLabor").data("kendoExtGrid").dataSource.read();
                   $("#gridPart").data("kendoExtGrid").dataSource.read();

                   //$("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                   //$("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#claimStatCd").val());
                   setRequiredField(); // 필수값 세팅
                   //dms.notification.success("<spring:message code='global.info.searchSuccess' />");

                }

            }) ;

        }
        ,columns:[
                    {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
                   ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />", width:100,sortable:false, attributes :{"class":"al"}  }
                   ,{field:"roDocNo",title:"<spring:message code='ser.lbl.roDocNo' />", width:70, attributes :{"class":"al"} }
                   ,{field:"roDt" , title:"<spring:message code='ser.lbl.roDate' />", width:80
                      , attributes :{"class":"ac"}
                      , format:"{0:<dms:configValue code='dateFormat' />}"

                    }
                   ,{field:"crNo", title:"<spring:message code='global.lbl.crNo' />" , width:100 , attributes :{"class":"al"}}
                 ]

    });

    /**공임 그리드 **/
    $("#gridLabor").kendoExtGrid({

        dataSource:{
            transport:{
                   read :{
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoDocNo"] = $("#roDocNo").val();
                         params["sClaimDocNo"] = $("#claimDocNo").val();
                         params["sDlrCd"] = $("#dlrCd").val();


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                       ,dlrCd:{type:"string" , editable:false}
                       ,lineNo:{type:"number", editable:false, validation:{required:true}}
                       ,lbrCd:{type:"string", editable:false, validation:{required:true}}
                       ,lbrNm:{type:"string" , editable:false}
                       ,lbrHm:{type:"number" , editable:false}
                       ,lbrQty:{type:"number", editable:false}
                       ,lbrPrc:{type:"number"}
                       ,lbrAmt:{type:"number"}
                       ,cauLbrYn:{type:"string"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,resizable:true
        ,height:150
       // ,multiSelectWithCheckbox:true
       // ,editableOnlyNew:true
       // ,editableOnlyNewExcludeColumns:["lbrQty","cauLbrYn"]
        ,change:function (e){

        }
         ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="lbrAmt" || fieldName =="lbrPrc" ){
                 this.closeCell();
             }
         }
        ,dataBound:function(e){
            if($("#lbrAmt").val()== "")
            calLbrTotAmt();
        }
        ,columns:[
                    {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:80, attributes:{"class":"al"}}
                   ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width:200, attributes:{"class":"al"}}
                   ,{field:"lbrHm",title:"<spring:message code='ser.lbl.lbrHm' />", width:40, attributes:{"class":"ar"} }
                   ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ar"} }
                   ,{field:"lbrPrc",title:"<spring:message code='ser.lbl.lbrPrc' />", width:80
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="lbrPrc" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:1
                              ,value:0.00
                              ,spinners:false
                              ,change:calLbrGridAmt
                           });
                           $('<span class="k-invalid-msg" data-for="lbrPrc"></span>').appendTo(container);
                        }
                   }
                   ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.amt' />", width:80
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="lbrAmt" id="lbrAmt" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:1
                              ,value:0.00
                              ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="lbrAmt"></span>').appendTo(container);
                        }

                   }
                   ,{field:"cauLbrYn",title:"<spring:message code='ser.lbl.mainLbrCd' />", width:50
                       , attributes :{"class":"ac"}
                       , template:"#= setCauYnMap(cauLbrYn) #"
                       , editor:function(container, options){
                           $('<input required name="cauLbrYn" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:cauYnList
                               ,change:function(e){

                                   var grid = $("#gridLabor").data("kendoExtGrid");//.dataSource._data;
                                   var selectedVal = grid.dataItem(grid.select());
                                   if(selectedVal.cauLbrYn == "Y" ){
                                       $("#cauOperAtcCd").val(selectedVal.lbrCd);
                                       $("#cauOperAtcNm").val(selectedVal.lbrNm);
                                   }else{
                                       $("#cauOperAtcCd").val("");
                                       $("#cauOperAtcNm").val("");
                                   }

                                   $.each(grid.dataSource._data , function(i , gridData){
                                       var result = true;
                                       if($("#cauOperAtcCd").val() == gridData.lbrCd){
                                           result = false;
                                           gridData.set("cauLbrYn" , "Y");
                                       }
                                       if(result) gridData.set("cauLbrYn" , "N");

                                   });
                                   grid.refresh();
                               }
                           });
                           $('<span class="k-invalid-msg" data-for="cauLbrYn"></span>').appendTo(container);
                          }
                     }
                 ]

    });



    /**부품 그리드 **/
    $("#gridPart").kendoExtGrid({

        dataSource:{
            transport:{
                   read :{
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoDocNo"] = $("#roDocNo").val();
                         params["sClaimDocNo"] = $("#claimDocNo").val();
                         params["sDlrCd"] = $("#dlrCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,itemCd:{type:"string", editable:false, validation:{required:true} }//부품코드
                       ,itemNm:{type:"string", editable:false }//부품명
                       ,reqQty:{type:"number", editable:false , validation:{required:true} } //수량
                       ,saleUnitCd:{type:"string", editable:false }//단위
                       ,itemPrc:{type:"number", editable:false } // 단가
                       ,itemAmt:{type:"number", editable:false }//금액
                       ,cauItemYn:{type:"string", editable:true }
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:150
        ,resizable:false
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[0]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
        }
        ,dataBound:function(e){
            if($("#itemAmt").val()== "")
            calPartTotAmt();
        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:70, attributes :{"class":"al"}}
                   ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, attributes :{"class":"al"}}
                   ,{field:"reqQty", title:"<spring:message code='ser.lbl.itemQty' />", width:40
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n0"                // n0:###,###, n2:###,###.##
                              ,decimals:0                // 소숫점
                              ,min:1
                              ,value:0
                              ,spinners:true
                              ,change:calPartTotAmt
                           });
                           $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                        }
                   }
                   ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:50, attributes :{"class":"ac"}}
                   ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:50, attributes :{"class":"ar"}}
                   ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:50, attributes :{"class":"ar"}}
                   ,{field:"cauItemYn", title:"<spring:message code='ser.lbl.cauItemCd' />", width:50
                       , attributes :{"class":"ac"}
                       , template:"#= setCauYnMap(cauItemYn) #"
                       , editor:function(container, options){
                           $('<input required name="cauItemYn" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:cauYnList
                               ,change:function(e){

                                   var grid = $("#gridPart").data("kendoExtGrid");//.dataSource._data;
                                   var selectedVal = grid.dataItem(grid.select());
                                   if(selectedVal.cauItemYn == "Y" ){
                                       $("#cauItemCd").val(selectedVal.itemCd);
                                       $("#cauItemNm").val(selectedVal.itemNm);
                                   }else{
                                       $("#cauItemCd").val("");
                                       $("#cauItemNm").val("");
                                   }

                                   $.each(grid.dataSource._data , function(i , gridData){
                                       var result = true;
                                       if($("#cauItemCd").val() == gridData.itemCd){
                                           result = false;
                                           gridData.set("cauItemYn" , "Y");
                                       }
                                       if(result) gridData.set("cauItemYn" , "N");

                                  });
                                   grid.refresh();
                               }
                           });
                           $('<span class="k-invalid-msg" data-for="cauItemYn"></span>').appendTo(container);
                          }
                     }
                 ]

    });



    $("#tabstrip1").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            selectTabId = e.item.id;
            var kendoTab = $("#tabstrip1").kendoExtTabStrip().data("kendoExtTabStrip");
        }
    });

    $("#tabstrip2").kendoExtTabStrip({
        animation:false
    });

    $("#befRunDistVal").data("kendoExtNumericTextBox").enable(false);
    $("#befRoDt").data("kendoExtMaskedDatePicker").enable(false);
});
</script>
<!-- //script -->
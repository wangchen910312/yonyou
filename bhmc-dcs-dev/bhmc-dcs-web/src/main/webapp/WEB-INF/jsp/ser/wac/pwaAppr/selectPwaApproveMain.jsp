<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
        <!-- 조회승인신청 -->
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.reqSearch" /></h1>
                <div class="btn_right">
                <dms:access viewId="VIEW-I-12435" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12434" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_excel btn_s_min5" id="btnExcel" ><spring:message code="ser.btn.excel" /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-13196" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="print" class="btn_m"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12433" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_search btn_s_min5" id="btnPwaHist" ><spring:message code="ser.btn.pwaHist" /></button>
                </dms:access>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:5%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:19%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.sdpt' /></th> <!-- 사업부 -->
                        <td>
                            <input id="sDivision" type="text" data-type="multicombo" class="form_comboBox">
                        </td>

                        <th scope="row"><spring:message code='sal.lbl.officeNm' /></th> <!-- 사무소 -->
                        <td>
                            <input id="sOffice" type="text" data-type="multicombo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.dealer" /></th>  <!-- 딜러 -->
                        <td>
                            <input type="text" id="sDlrCd" maxlength="5" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                        <td>
                            <input type="text" id="sVinNo" maxlength="17" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.fincReqDt" /></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input value="" id="sFromDt" class="form_datepicker ac"><!-- 신청일자 FROM-->
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input value="" id="sToDt" class="form_datepicker ac" ><!-- 신청일자 TO-->
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.statNm" /></th>    <!-- 상태 -->
                        <td>
                            <input type="text" id="sPwaStatCd" maxlength="17"  class="form_comboBox" />
                        </td>

                    </tr>
                </tbody>
            </table>
            </div>
                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip2" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="req" class="k-state-active"><spring:message code="ser.menu.pwaReqMng" /></li>
                        <li id="apr"><spring:message code="ser.menu.pwaApprMng" /></li>
                    </ul>
                    <!-- //탭메뉴 -->
                    <!-- 요청 -->
                    <div>
                        <div class="table_grid">
                           <div id="gridMaster" class="grid"></div>
                        </div>
                    </div>
                    <!-- //요청 -->
                    <!-- 승인 -->
                    <div>
                        <div class="table_grid">
                            <div id="gridMaster2" class="grid"></div>
                        </div>
                    </div>
                    <!-- //승인 -->
                </div>
            </section>
        <form id="pwaApproveForm">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                    <dms:access viewId="VIEW-I-12432" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_approve btn_s_min5" id="btnAccept" disabled><spring:message code="ser.btn.btnAccept" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12431" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_approve btn_s_min5" id="btnApprove" disabled><spring:message code="ser.btn.approval" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12430" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_return btn_s_min5" id="btnReturn" disabled><spring:message code="ser.btn.nonAppr" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12429" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_reject btn_s_min5" id="btnReject" disabled><spring:message code="ser.btn.reject" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-13190" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_s_min5" id="btnApprCancel" disabled><spring:message code="ser.btn.apprCancel" /></button>
                    </dms:access>
                    </div>
                </div>
                 <div class="table_form form_width_100per ">
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
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>

                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.approvalNo" /></th> <!-- 승인번호 -->
                                <td class="bor_none">
                                    <input type="text" id="pwaApproveNo" name="pwaApproveNo" readonly="readonly" class="form_input form_readonly" data-json-obj="true" />
                                </td>
                                <th scope="row" class="bor_none"></th>
                                <td></td>
                                <th></th>
                                <th></th>
                                <th scope="row"><spring:message code="ser.lbl.hqApproveNm" /></th> <!-- 판정인 -->
                                <td class="bor_none">
                                    <input type="text" id="hqApproveNm" name="hqApproveNm" readonly="readonly" class="form_input form_readonly" />
                                </td>
                                <th scope="row" class="bor_none"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per mt10">
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
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.custNm" /></th> <!-- 고객명 -->
                                <td>
                                    <input type="text" id="carOwnerNm" name="carOwnerNm" readonly="readonly" class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.telNumer" /></th> <!-- 연락처-->
                                <td>
                                    <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" readonly="readonly" class="form_input form_readonly" />
                                </td>
                                <th></th>
                                <th></th>
                                <th scope="row"><spring:message code="ser.lbl.wrtrNm" /></th> <!-- 작성자 -->
                                <td>
                                    <input type="text" id="pwaWrtrNm" name="pwaWrtrNm" readonly="readonly" class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.enginNo" /></th> <!-- 엔진번호 -->
                                <td>
                                    <input type="text" id="enginNo" name="enginNo" readonly="readonly" class="form_input form_readonly" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                                <td>
                                    <input type="text" id="vinNo" name="vinNo" readonly="readonly" class="form_input form_readonly" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.carNo" /></th>  <!-- 차량번호 -->
                                <td>
                                    <input type="text" id="carRegNo" name="carRegNo" readonly="readonly" class="form_input form_readonly" />
                                </td>
                                <th></th>
								<th></th>
                                <th scope="row"><spring:message code="ser.lbl.carLine" /></th> <!-- 차종 -->
                                <td>
                                    <input type="text" id="ltsModelNm" name="ltsModelNm" readonly="readonly" class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.runDist" /></th>  <!-- 주행거리 -->
                                <td>
                                    <input type="text" id="runDistVal" name="runDistVal" readonly="readonly" class="form_numeric form_readonly ar"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.cauCd" /></th>
                                <td colspan="4">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <input type="text" id="cauCd" name="cauCd" readonly="readonly" class="form_input form_readonly " data-json-obj="true"/> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="cauNm" name="cauNm" readonly="readonly" class="form_input form_readonly " /> <!-- 원인코드명 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.mainLbrCd" /></th>
                                <td colspan="4">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <input type="text" id="cauOperAtcCd" name="cauOperAtcCd" readonly="readonly" class="form_input form_readonly" data-json-obj="true"/> <!-- 주작업코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="cauOperAtcNm" readonly="readonly" class="form_input form_readonly" /> <!-- 주작업명 -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.phenCd" /></th>
                                <td colspan="4">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <input type="text" id="phenCd" name="phenCd" readOnly class="form_input form_readonly " data-json-obj="true"/> <!-- 현상코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="phenNm" name="phenNm" readOnly class="form_input form_readonly " /> <!-- 현상코드명 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.cauItemCd" /></th>
                                <td colspan="4">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <input type="text" id="cauItemCd" name="cauItemCd" readonly="readonly" class="form_input form_readonly " data-json-obj="true"/> <!-- 원인부품 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="cauItemNm" name="cauItemNm" readonly="readonly" class="form_input form_readonly " /> <!-- 원인부품명 -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.errPhenCont" /></th>
                                <td colspan="4">
                                    <textarea rows="2" cols="" id="errPhenCont" name="errPhenCont" readonly="readonly" class="form_textarea form_readonly" data-json-obj="true"></textarea>  <!-- 고장현상 -->
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.rpirMtdCont" /></th>
                                <td colspan="4">
                                    <textarea rows="2" cols="" id="rpirMtdCont" name="rpirMtdCont" readonly="readonly" class="form_textarea form_readonly" data-json-obj="true"></textarea> <!-- 수리방안 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.pwaTpCd" /></th>
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:50%">
                                            <input type="text" id="pwaTpCd1" name="pwaTpCd1" readonly="readonly" class="form_comboBox" data-json-obj="true"/> <!-- PWA TYPE1 -->
                                        </div>
                                        <div class="form_right" style="width:50%">
                                            <input type="text" id="pwaTpCd2" name="pwaTpCd2" readonly="readonly" class="form_comboBox" data-json-obj="true"/> <!-- PWA TYPE2 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.wartDt" /></th>
                                <td>
                                    <input type="text" id="wartDt" name="wartDt" readonly="readonly" class="form_datepicker form_readonly ac" /> <!-- 보증일 -->
                                </td>
                                 <!-- 新增保修结束日期  start -->
                                <th scope="row"><spring:message code="ser.lbl.wartExpireDt" /></th>
                                <td class="readonly_area">
                                    <input type="text" id="wartExpireDt" name="wartExpireDt"  readOnly class="form_datetimepicker ac" data-json-obj="true"/>
                                </td>
                                <!-- 新增保修结束日期  end -->
                                <th scope="row"><spring:message code="ser.lbl.creDt" /></th>
                                <td>
                                    <input type="text" id="creDt" name="creDt" readonly="readonly" class="form_datepicker ac form_readonly" /> <!-- 생산일 -->
                                </td>
                            </tr>
                            
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.returnReasonCont" /></th>
                                <td colspan="10">
                                    <input type="text" id="returnReasonCd" name="returnReasonCd" class="form_comboBox" data-json-obj="true"/> <!-- 반송사유코드(SER220) -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td colspan="10">
                                    <textarea data-name="<spring:message code="ser.lbl.returnReasonCont" />"  rows="2" cols="" id="returnReasonCont" name="returnReasonCont" class="form_textarea" data-json-obj="true"></textarea> <!-- 반송사유 -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                        <input type="hidden" id="ltsModelCd" name="ltsModelCd"  data-json-obj="true"/> <!-- LTS MODEL CD -->
                        <input type="hidden" id="hqApproveId" name="hqApproveId" data-json-obj="true"/>  <!-- 판정자 ID -->
                        <input type="hidden" id="pwaDocNo" name="pwaDocNo" data-json-obj="true"/> <!-- PWA DOC NO -->
                        <input type="hidden" id="pwaStatCd" name="pwaStatCd" data-json-obj="true"/> <!-- PWA상태 -->
                        <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true"/> <!-- 고객ID -->
                        <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true"/> <!-- 고객ID -->
                        <input type="hidden" id="pwaWrtrId" name="pwaWrtrId" /> <!-- 작성자 -->
                        <input type="hidden" id="returnCnt" name="returnCnt" data-json-obj="true" />
                        <input type="hidden" id="returnApproveNo" name="returnApproveNo" data-json-obj="true"/> <!-- 반품신청 승인 번호 -->
                </div>
            </section>
            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code="ser.lbl.lbr" /></li>
                    <li><spring:message code="ser.lbl.item" /></li>
                    <li><spring:message code="ser.lbl.file" /></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- 공임 -->
                <div>
                    <div class="table_grid">
                       <div id="gridLabor" class="grid"></div>
                    </div>
                </div>
                <!-- //수리 -->

                <!-- 부품 -->
                <div>
                    <div class="table_grid">
                        <div id="gridPart" class="grid"></div>
                    </div>
                </div>
                <!-- //부품 -->
                <div>
                    <!-- 파일업로드관련 include page -->
                    <div class="btn_right_absolute">
                        <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 파일찾기 -->
                        <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s hidden" ><spring:message code="global.btn.fileDelete" /></button>
                    </div>
                    <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                    <!-- 파일업로드관련 include page -->
               </div>
            </div>
            <!-- //탭메뉴 전체 영역 -->
            <section class="group">
                <div class="table_form table_form_info mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:13%;">
                            <col style="width:12%;">
                            <col style="width:13%;">
                            <col style="width:12%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"><spring:message code="ser.lbl.itemAmt" /></th><!--부품금액  -->
                                <th scope="col"><spring:message code="ser.lbl.lbrAmt" /></th><!--공임금액  -->
                                <th scope="col"><spring:message code="ser.lbl.subLbrAmt" /></th><!--외주금액  -->
                                <th scope="col"><spring:message code="ser.lbl.totRepairAmt" /></th><!--수리금액 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><h2 class="title_basic"><spring:message code="ser.lbl.reqEstAmt" /></h2></th><!--청구예상금액  -->
                                <td class="ar" id="itemOccrAmt"></td>
                                <td class="ar" id="lbrOccrAmt"></td>
                                <td class="ar" id="subLbrOccrAmt"></td>
                                <td class="ar" id="totOccrAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><h2 class="title_basic"><spring:message code="ser.lbl.approvalAmt" /></h2></th><!--청구승인금액  -->
                                <td><input type="text" id="itemApproveAmt" name="itemApproveAmt" class="form_numeric ar" data-json-obj="true"/></td>
                                <td><input type="text" id="lbrApproveAmt" name="lbrApproveAmt" class="form_numeric ar" data-json-obj="true"/></td>
                                <td><input type="text" id="subLbrApproveAmt" name="subLbrApproveAmt" class="form_numeric ar" data-json-obj="true"/></td>
                                <td class="ar" id="totApproveAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><h2 class="title_basic"><spring:message code="ser.lbl.deductionAmt" /></h2></th><!--공제금액  -->
                                <td class="ar" id="itemDeductAmt"></td>
                                <td class="ar" id="lbrDeductAmt"></td>
                                <td class="ar" id="subLbrDeductAmt"></td>
                                <td class="ar" id="totDeductAmt"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //조회승인신청 -->
        </form>
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12982" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m" id="btnCauPhenPopup" disabled><spring:message code="ser.btn.cauPhenSearch" /></button><!--원인현상코드 팝업 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12981" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m" id="btnLbrPopup" disabled><spring:message code="ser.btn.lbrSearch" /></button><!--공임조회 팝업 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12980" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m" id="btnPwaHistPopup" disabled><spring:message code="ser.btn.pwaHisSearch" /></button><!--PWA 이력  팝업-->
                </dms:access>
                <dms:access viewId="VIEW-I-12979" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m" id="btnRoHistPopup" disabled><spring:message code="ser.btn.btnRoHist" /></button><!--R/O 이력 팝업 -->
                </dms:access>
            </div>
        </div>
    </div>
</div>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">

/**
 **************** 코드 데이터 ****************************
 */
//PWA 상태 코드
var pwaStatCdList = [];
<c:forEach var="obj" items="${pwaStatDs}">
    if("${obj.cmmCd}" != "O" ){ // 미결 상태는 제외
        pwaStatCdList.push({
            cmmCdNm:"${obj.cmmCdNm}"
            , cmmCd:"${obj.cmmCd}"
        });
    }
</c:forEach>
var pwaStatMap = dms.data.arrayToMap(pwaStatCdList, function(obj){return obj.cmmCd;});

//PWA 유형코드 pwaTpDs
var pwaTpList = [];
<c:forEach var ="obj" items="${pwaTpDs}">
    pwaTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pwaTpMap = dms.data.arrayToMap(pwaTpList , function(obj){return obj.cmmCd;});


//PWA 주원인 여부
var pwaCauYnList = [];
<c:forEach var ="obj" items="${pwaCauYnDs}">
    pwaCauYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var pwaCauYnMap = dms.data.arrayToMap(pwaCauYnList , function(obj){return obj.cmmCd;});


 //반송사유코드 returnReasonCdList
var returnReasonCdList = [];
<c:forEach var ="obj" items="${returnReasonCdDs}">
    returnReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var returnReasonCdMap = dms.data.arrayToMap(returnReasonCdList , function(obj){return obj.cmmCd;});


/** 공임 조회 팝업 **/
var laborSearchPopup;
/** 부품 조회 팝업 **/
var itemSalePrcPopupWindow;
/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;
/** 정비이력 조회 팝업 **/
var repairOrderSearchPopup;

var pwaApprovePopupWindow;
var pwaHistoryPopupWindow;


//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;
var selectTabId = "req";
var reqPwaStatCd = "";


var divisionList = [{"diviNm":"", "diviCd":""}];
<c:forEach var="obj" items="${divisionList}">
divisionList.push({diviNm:"${obj.diviNm}", diviCd:"${obj.diviCd}"});
</c:forEach>

var officeList = [{"offNm":"", "offCd":""}];
<c:forEach var="obj" items="${officeList}">
officeList.push({offNm:"${obj.offNm}", offCd:"${obj.offCd}"});
</c:forEach>


$(document).ready(function() {

    //조회조건 :  사업부
    $("#sDivision").kendoExtMultiSelectDropDownList({
         dataTextField:"diviNm"
        ,dataValueField:"diviCd"
        ,dataSource:divisionList
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectDivisionList = e.dataItem.diviCd;
            if(dms.string.isEmpty(selectDivisionList)){
                $("#sDivision").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sDivision").data("kendoExtMultiSelectDropDownList").value([]);
            }

        }
    });

  //조회조건 :  사무소
    $("#sOffice").kendoExtMultiSelectDropDownList({
        dataTextField:"offNm"
       ,dataValueField:"offCd"
       ,dataSource:officeList
       ,dataBound:function(){
           var current = this.value();
           this._savedOld = current.slice(0);

       }
       ,select:function(e){
           var selectOfficeList = e.dataItem.offCd;

           if(dms.string.isEmpty(selectOfficeList)){
               $("#sOffice").data("kendoExtMultiSelectDropDownList").refresh();
               $("#sOffice").data("kendoExtMultiSelectDropDownList").value([]);
           }
       }
   });

/********************* 팝업 **********************/
      //공임조회팝업
    function selectlaborCodeSearchPopupWindow(sCloseYn){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        laborSearchPopup = dms.window.popup({
            windowId:"laborCodeSearchPopupWindow"
            ,title:"<spring:message code = 'ser.title.lbrCdSearch'/>"    //
            ,template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            ,height:400
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"selectable":"multiple"
                    ,"sLtsModelCd":$("#ltsModelCd").val()
                    ,"sReadOnly":"Y"      // 구분 readOnly 여부
                    ,"sSort":1        // 보증수리:1 , 일반수리 :0
                    ,"sClose":sCloseYn
                    ,"callbackFunc":function(jsonObj){

                    }
                 }
             }
        });
    };


    /** 원인현상코드 조회 팝업 **/
    selectPhenCauCodeSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.part' var='global_lbl_part' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${global_lbl_part}' />";

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
        if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        }

        var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
        var paintYn = (pwaType1 == "3" || pwaType2 == "3") ? "P":"C";

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            ,height:400
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data:{
                     "autoBind":false
                    ,"paintYn": "C" // paintYn paint:P , 원인코드:C
                    ,"itemCd":$("#cauItemCd").val()        // 보증수리:0 , 일반수리 :1
                    , "callbackFunc":function(data){

                    }
                }
            }
        });
    };

    /** 정비이력 조회 팝업 **/
    selectRepairOrderSearchPopupWindow = function (e){

        repairOrderSearchPopup = dms.window.popup({
             windowId:"repairOrderSearchPopup"
             ,width:920
             ,height:550
             ,title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
             ,content:{
                 url:"<c:url value='/ser/cmm/popup/selectRepairOrderHistorySearchPopup.do'/>"
                 , data:{
                     "autoBind":false
                     , "listType":"01"
                     , "vinNo":$("#vinNo").val()
                     , "callbackFunc":function(data){

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

        pwaApprovePopupWindow = dms.window.popup({
            windowId:"pwaApprovePopupWindow"
                ,title:"<spring:message code = 'ser.title.pwaList'/>"    //
                ,template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
                ,height:350
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectPwaApproveSearchPopup.do'/>"
                    ,data:{
                         "autoBind":true
                        ,"dlrCd":$("#dlrCd").val()
                        ,"vinNo":$("#vinNo").val()
                        ,"roDocNo":$("#roDocNo").val()
                        ,"callbackFunc":function(data){
                            if(data.length != 0 ){

                            }
                        }
                    }
                }
            });
        };

    /** PWA 이력 조회 팝업 **/
    selectPwaHistorySearchPopupWindow = function (e){

        if($("#pwaDocNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.required.select' />");
        }

        pwaHistoryPopupWindow = dms.window.popup({
            windowId:"pwaHistoryPopupWindow"
                ,title:"<spring:message code = 'ser.btn.pwaHist'/>"    //
                ,height:350
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectPwaHistorySearchPopup.do'/>"
                    ,data:{
                         "autoBind":true
                        ,"dlrCd":$("#dlrCd").val()
                        ,"vinNo":$("#vinNo").val()
                        ,"pwaDocNo":$("#pwaDocNo").val()
                        ,"callbackFunc":function(data){
                            if(data.length != 0 ){

                            }
                        }
                    }
                }
            });
        };
/********************* 팝업 **********************/

    setPwaStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaStatMap[value] != undefined)
            resultVal =  pwaStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    setPwaCauYnMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaCauYnMap[value] != undefined)
            resultVal =  pwaCauYnMap[value].cmmCdNm;
        }
        return resultVal;
    };

/***************************버튼 이벤트**************************************/

    /** 조회버튼 **/
    $("#btnSearch").kendoButton({
        click:function(e){

            if(selectTabId == "apr"){
                $("#gridMaster2").data("kendoExtGrid").dataSource.data([]);
                $("#gridMaster2").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
            }
            setButtonEnable($("#pwaStatCd").val());
            initAll();
        }
    });

    setKendoDate = function( dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };
    /** Excel 버튼 **/
    $("#btnExcel").kendoButton({

        click:function(e){

            var pwaStatCd = $("#sPwaStatCd").val();
            var templateFile = "PwaApproveList_Tpl.xlsx";
            var fileName = "<spring:message code='ser.menu.pwaApprMng' />.xlsx";
            if(selectTabId == "apr"){
                pwaStatCd = "A";
                templateFile = "PwaApproveList_Tpl.xlsx";
                fileName = "<spring:message code='ser.menu.pwaApprMng' />.xlsx";
            }else{
                pwaStatCd = $("#sPwaStatCd").val();
                templateFile = "PwaApproveReqList_Tpl.xlsx";
                fileName = "<spring:message code='ser.menu.pwaReqMng' />.xlsx";
            }


            dms.ajax.excelExport({
                "beanName"         :"pwaApproveService"
                ,"templateFile"    :templateFile
                ,"fileName"        :fileName
                ,"sFromDt"         :setKendoDate($("#sFromDt").data("kendoExtMaskedDatePicker").value())
                ,"sToDt"           :setKendoDate($("#sToDt").data("kendoExtMaskedDatePicker").value())
                ,"sVinNo"          :$("#sVinNo").val()
                ,"sPwaStatCd"      :pwaStatCd
                ,"sDlrCd"          :$("#sDlrCd").val()
                ,"sSelectTabId"    :selectTabId
                ,"sTabId"          :"pwaApproveListT"                                // TAB ID
            });
        }

    });


    // 인쇄
    $("#print").kendoButton({
        click:function(e) {
            var data ='';
            var data1 ='';
            var data2 ='';
            var gridRow1 ='';
            var gridRow2 = '';

            if(selectTabId == "apr"){
                gridRow2 = $("#gridMaster2").data("kendoExtGrid").select();
                data2 = $("#gridMaster2").data("kendoExtGrid").dataItem(gridRow2);
                data = data2;
            }else{
                gridRow1 = $("#gridMaster").data("kendoExtGrid").select();
                data1 = $("#gridMaster").data("kendoExtGrid").dataItem(gridRow1);
                data = data1;
            }

            var pwaReportParam =  "&sDlrCd="+data.dlrCd;
                pwaReportParam += "&sPwaDocNo="+data.pwaDocNo;
            parent._createOrReloadTabMenu("<spring:message code='ser.title.pwaReqReport' />","<c:url value='/ReportServer?reportlet=ser/selectPWAPrintMain.cpt'/>"+pwaReportParam);
        }
        ,enable:true
    });

    /** 접수버튼 **/
    $("#btnAccept").kendoButton({

        click:function(e){
            sendApproveSave("S");
        }
    });

    /** 승인버튼 **/
    $("#btnApprove").kendoButton({

        click:function(e){

            var totAmt = Number($("#totApproveAmt").text().replace(",", ""));
            if( totAmt == 0 ){

                $("#messageId").html("<spring:message code='ser.info.zeroApproveAmt' /> " );
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();
                        sendApproveSave("A");

                    }else{
                       conformKendoWindow.close();
                    }

                }).end();

            }else{

                $("#messageId").html("<spring:message code='ser.btn.approval' var='global_btn_approval' />"+
                                     "<spring:message code='global.info.cnfrmMsg' arguments='${global_btn_approval}' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                   if($(this).hasClass("yes")){
                       conformKendoWindow.close();
                       sendApproveSave("A");
                   }else{
                      conformKendoWindow.close();
                   }

                }).end();
            }
        }
    });

    /** 반려버튼 **/
    $("#btnReturn").kendoButton({

        click:function(e){

            if($("#returnReasonCont").val() == "" ){
                var msgText = "<spring:message code='ser.lbl.returnReasonCont' var='ser_lbl_returnReasonCont' />"+
                              "<spring:message code='global.info.emptyCheckParam' arguments='${ser_lbl_returnReasonCont}' />";
                dms.notification.warning(msgText);
                return false;
            }

            $("#messageId").html("<spring:message code='ser.btn.appRollback' var='global_btn_appRollback' />"+
                                 "<spring:message code='global.info.cnfrmMsg' arguments='${global_btn_appRollback}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();

                    sendApproveSave("R");

                }else{
                   conformKendoWindow.close();
                }
            }).end();
        }
    });

    /** 거절버튼 **/
    $("#btnReject").kendoButton({

        click:function(e){

            //반송사유 미입력시 메세지처리.
            if($("#returnReasonCont").val() == ""){
                dms.notification.warning("<spring:message code='ser.lbl.returnReasonCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#returnReasonCont").focus();
                return false;
            }

            $("#messageId").html("<spring:message code='ser.btn.reject' var='global_btn_reject' />"+
                                 "<spring:message code='global.info.cnfrmMsg' arguments='${global_btn_reject}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                   conformKendoWindow.close();
                   sendApproveSave("C");
                }else{
                  conformKendoWindow.close();
                }
            }).end();
        }
    });

    /** 승인취소버튼 **/
    $("#btnApprCancel").kendoButton({
        click:function(e){
            $("#messageId").html("<spring:message code='ser.btn.apprCancel' var='ser_lbl_reqCancel' />"+
                                  "<spring:message code='global.info.cnfrmMsg' arguments='${ser_lbl_reqCancel}' />");

            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                    sendApproveSave("D"); //승인취소 상태
                }else{
                    conformKendoWindow.close();
                }
            }).end();
        }
    });

    /** 원인현상코드 팝업**/
    $("#btnCauPhenPopup").kendoButton({
        click:function(e){
            selectPhenCauCodeSearchPopupWindow();
        }
    });

    /** 공임조회 팝업**/
    $("#btnLbrPopup").kendoButton({
        click:function(e){
            selectlaborCodeSearchPopupWindow('Y');
        }
    });

    /** PWA VIN 이력 이력 팝업**/
    $("#btnPwaHistPopup").kendoButton({
        click:function(e){
            selectPwaApproveSearchPopupWindow();
        }
    });

    /** pwa 이력 팝업**/
    $("#btnPwaHist").kendoButton({
        click:function(e){
            selectPwaHistorySearchPopupWindow();
        }
    ,enable : false
    });
    /**RO 이력 팝업**/
    $("#btnRoHistPopup").kendoButton({
        click:function(e){
            selectRepairOrderSearchPopupWindow();
        }
    });

/***************************버튼 이벤트**************************************/

    /**PWA 요청 및 요청 취소**/
    sendApproveSave = function (sFlag){

        /**
         PWA 승인 상태를 확인필요
        **/

        var formSaveData = $("#pwaApproveForm").serializeObject( $("#pwaApproveForm").serializeArrayInSelector("[data-json-obj='true']") );
        formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
        //保修结束日期
        var wartExpireDtFmt = $("#wartExpireDt").data("kendoDatePicker").value();
        formSaveData.wartExpireDt = $("#wartExpireDt").data("kendoDatePicker").value("");
        formSaveData.itemApproveAmt = $("#itemApproveAmt").data("kendoExtNumericTextBox").value();
        formSaveData.lbrApproveAmt = $("#lbrApproveAmt").data("kendoExtNumericTextBox").value();
        formSaveData.subLbrApproveAmt = $("#subLbrApproveAmt").data("kendoExtNumericTextBox").value();


        /**
         PWA 상태 코드
                     접수:S
                     요청:Q
                     승인:A
                     반려:R
                     거절:C
        **/
        formSaveData.pwaStatCd = sFlag;

        $.ajax({
            url:"<c:url value='/ser/wac/pwaAppr/updateStatePwaApproves.do' />"
           ,data:JSON.stringify(formSaveData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result , textStatus){

               $("#pwaStatCd").val(sFlag);
               $("#pwaApproveNo").val(result["pwaApproveNo"]);
               $("#hqApproveId").val(result["hqApproveId"]);
               $("#hqApproveNm").val(result["hqApproveNm"]);
			   //保修结束日期回显
			   $("#wartExpireDt").data("kendoDatePicker").value(wartExpireDtFmt);
               /** 버튼 상태 세팅 **/
               setButtonEnable(sFlag);

               selectedYn = (dms.string.isEmpty($("#sPwaStatCd").val()) && dms.string.isEmpty($("#sDlrCd").val()) ) ? true:false;

               if(selectedYn){
                   gridRow = $("#gridMaster").data("kendoExtGrid").select().index();
               }

               $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
               $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
               $("#gridMaster2").data("kendoExtGrid").dataSource.data([]);
               $("#gridMaster2").data("kendoExtGrid").dataSource.page(1);


               dms.notification.success("<spring:message code='global.info.success' />");
           }
           ,beforeSend:function(xhr){
               dms.loading.show($("#resizableContainer"));
           }
           ,complete:function(xhr,status){
               dms.loading.hide($("#resizableContainer"));
           }
        });

    };

    /** PWA 유형코드1 pwaTpCd1 **/
    $("#pwaTpCd1").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:pwaTpList
       ,template:"[#:cmmCd#] #:cmmCdNm#"
       ,valueTemplate:"[#:cmmCd#] #:cmmCdNm#"
       ,optionLabel:" "  // 선택
       ,index:0
    });



   /**PWA 유형코드2 pwaTpCd2 **/
    $("#pwaTpCd2").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:pwaTpList
       ,template:"[#:cmmCd#] #:cmmCdNm#"
       ,valueTemplate:"[#:cmmCd#] #:cmmCdNm#"
       ,optionLabel:" "  // 선택
       ,index:0
     });


    /** 반송사유코드  returnReasonCd **/
    $("#returnReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:returnReasonCdList
       ,template:"[#:cmmCd#] #:cmmCdNm#"
       ,valueTemplate:"[#:cmmCd#] #:cmmCdNm#"
       ,change:function(e){
           var dataItem = this.dataItem(e.item);
           $("#returnReasonCont").val(dataItem.cmmCdNm);
       }
       ,optionLabel:" "  // 선택
       ,index:0
    });


     // 금액 합계 계산
    calApproveAmt = function(){

       var statCd = $("#pwaStatCd").val();

       var itemOccrAmt      =  $("#itemOccrAmt").text();
       itemOccrAmt          =  Number(itemOccrAmt.replace(",", "")); //부품요청금액
       var lbrOccrAmt       =  $("#lbrOccrAmt").text();
       lbrOccrAmt           =  Number(lbrOccrAmt.replace(",", "")); //공임요청금액
       var subLbrOccrAmt    =  $("#subLbrOccrAmt").text();
       subLbrOccrAmt        =  Number(subLbrOccrAmt.replace(",", "")); //외주요청금액
       var totOccrAmt       =  $("#totOccrAmt").text();
       totOccrAmt           =  Number(totOccrAmt.replace(",", "")); //요청금액합계

       var itemApproveAmt   =  $("#itemApproveAmt").data("kendoExtNumericTextBox").value(); //승인부품금액금액
       var lbrApproveAmt    =  $("#lbrApproveAmt").data("kendoExtNumericTextBox").value(); //승인공임금액금액
       var subLbrApproveAmt =  $("#subLbrApproveAmt").data("kendoExtNumericTextBox").value(); //승인외주금액금액

       var approveTotAmt =  (itemApproveAmt + lbrApproveAmt + subLbrApproveAmt); // 승인금액 재설정
       $("#totApproveAmt").html( dms.string.addThousandSeparatorCommas(approveTotAmt.toFixed(2))  ); //승인금액합계 단위쉼표
       var totApproveAmt    =  $("#totApproveAmt").text();
       totApproveAmt        =  Number(totApproveAmt.replace(",", "")); //승인금액합계

       //global.info.validation.max
       if( (itemApproveAmt   > itemOccrAmt   )   ||
           (lbrApproveAmt    > lbrOccrAmt    )   ||
           (subLbrApproveAmt > subLbrOccrAmt )
       ) {
           var msgText = "<spring:message code='ser.lbl.approvalAmt' var='approvalAmt' />"+
                         "<spring:message code='ser.lbl.reqEstAmt' var='reqEstAmt' />"+
                         "<spring:message code='global.info.validation.max' arguments='${approvalAmt} , ${reqEstAmt}' />";
                         dms.notification.warning(msgText);

                         $("#itemApproveAmt").data("kendoExtNumericTextBox").value((itemApproveAmt > itemOccrAmt) ? itemOccrAmt : itemApproveAmt);
                         $("#lbrApproveAmt").data("kendoExtNumericTextBox").value((lbrApproveAmt > lbrOccrAmt ) ?  lbrOccrAmt : lbrApproveAmt);
                         $("#subLbrApproveAmt").data("kendoExtNumericTextBox").value((subLbrApproveAmt > subLbrOccrAmt ) ? subLbrOccrAmt :  subLbrApproveAmt);

           return false;
       }

       $("#itemDeductAmt").html( dms.string.addThousandSeparatorCommas( (itemOccrAmt-itemApproveAmt).toFixed(2) ) ); //공제부품금액
       $("#lbrDeductAmt").html( dms.string.addThousandSeparatorCommas( (lbrOccrAmt-lbrApproveAmt).toFixed(2) ) ); //공제공임금액
       $("#subLbrDeductAmt").html( dms.string.addThousandSeparatorCommas( (subLbrOccrAmt-subLbrApproveAmt).toFixed(2) ) ); //공제외주금액
       $("#totDeductAmt").html( dms.string.addThousandSeparatorCommas( (totOccrAmt-totApproveAmt).toFixed(2) ) ); //공제금액합계



    };



    /** 조회 결과값  세팅**/
    setResultDataSetting =  function (result){
        console.log("返回值",result);
         //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
             var  fileVinNo = result["vinNo"];
             var  filePwaRequiNo = result["pwaRequiNo"];
		     if(dms.string.isNotEmpty(filePwaRequiNo)){
		         //getRequisitionFile(fileKeyNmVal);
		         getPwaFileRequestByKey(fileVinNo,filePwaRequiNo,result["dlrCd"]);
		     }
        //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
        $("#carRegNo").val(result["carRegNo"]);
        $("#enginNo").val(result["enginNo"]);
        $("#carOwnerId").val(result["carOwnerId"]);
        $("#carOwnerNm").val(result["carOwnerNm"]);
        $("#carOwnerTelNo").val(result["carOwnerTelNo"]);
        $("#dlrCd").val(result["dlrCd"]);


        $("#vinNo").val(result["vinNo"]);
        $("#pwaDocNo").val(result["pwaDocNo"]);
        $("#pwaStatCd").val(result["pwaStatCd"]);
        $("#runDistVal").data("kendoExtNumericTextBox").value(result["runDistVal"]);
        $("#ltsModelCd").val(result["ltsModelCd"]);
        $("#ltsModelNm").val(result["ltsModelNm"]);
        $("#hqApproveId").val(result["hqApproveId"]);
        $("#hqApproveNm").val(result["hqApproveNm"]);
        $("#pwaApproveNo").val(result["pwaApproveNo"]);
        $("#returnApproveNo").val(result["returnApproveNo"]);
        $("#cauCd").val(result["cauCd"]);
        $("#cauNm").val(result["cauNm"]);
        $("#cauItemCd").val(result["cauItemCd"]);
        $("#cauItemNm").val(result["cauItemNm"]);
        $("#phenCd").val(result["phenCd"]);
        $("#phenNm").val(result["phenNm"]);
        $("#pwaWrtrId").val(result["pwaWrtrId"]);
        $("#pwaWrtrNm").val(result["pwaWrtrNm"]);
        $("#cauOperAtcCd").val(result["cauOperAtcCd"]);
        $("#cauOperAtcNm").val(result["cauOperAtcNm"]);
        $("#errPhenCont").val(result["errPhenCont"]);
        $("#rpirMtdCont").val(result["rpirMtdCont"]);
        $("#returnReasonCd").data("kendoExtDropDownList").value(result["returnReasonCd"]);
        $("#returnReasonCont").val(result["returnReasonCont"]);
        $("#pwaTpCd1").data("kendoExtDropDownList").value(result["pwaTpCd1"]);
        $("#pwaTpCd2").data("kendoExtDropDownList").value(result["pwaTpCd2"]);
        $("#creDt").data("kendoDatePicker").value(result["creDt"]);
        $("#wartDt").data("kendoDatePicker").value(result["wartDt"]);
        //保修结束日期
        $("#wartExpireDt").data("kendoDatePicker").value(result["wartExpireDt"]);
        $("#fileKeyNm").val(result["fileKeyNm"]);
        $("#returnCnt").val(result["returnCnt"]);

        $("#itemOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["itemOccrAmt"]).toFixed(2)));
        $("#lbrOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["lbrOccrAmt"]).toFixed(2)));
        $("#subLbrOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["subLbrOccrAmt"]).toFixed(2)));
        $("#totOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["totOccrAmt"]).toFixed(2)));

        $("#itemApproveAmt").data("kendoExtNumericTextBox").value(result["itemApproveAmt"]);
        $("#lbrApproveAmt").data("kendoExtNumericTextBox").value(result["lbrApproveAmt"]);
        $("#subLbrApproveAmt").data("kendoExtNumericTextBox").value(result["subLbrApproveAmt"]);
        $("#totApproveAmt").html(dms.string.addThousandSeparatorCommas(Number(result["totApproveAmt"]).toFixed(2)));

    };
    
 //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
 //在选择PWA1类型时为延保索赔结算时，选择 延保索赔申请的附件
 getRequisitionFile = function(fileKeyNmVal){
                   var params = {};
                   params["sFileDocNo"] =fileKeyNmVal;
                  $.ajax({
                         url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                        ,data:JSON.stringify(params)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result , textStatus){
                              //console.log("文件数据",result.data);
                              var fileGrid = $('#fileGrid').data('kendoExtGrid');
                            if(result.data.length > 0 ){
                                 var fileGridData = result.data;
                                 $.each(fileGridData, function(idx, data){
                                    var copyData = {};
                                    copyData = {
                                                  fileDocNo :data.fileDocNo
                                                , fileNo:data.fileNo
                                                , fileNm:data.fileNm
                                                , fileSize:data.fileSize
                                                
                                        };
                                        fileGrid.dataSource.add(copyData);
                                }); 
                              
                              }
                             
                              
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                 });
 
 };
  //在选中pwa时，带出延保索赔申请的附件
  getPwaFileRequestByKey = function(fileVinNo,filePwaRequiNo,dlrCd){
       var data = {
               "sVinNo" : fileVinNo
               ,"sPwaDocNo":filePwaRequiNo
               ,sDlrCd:dlrCd
             };
             
       $.ajax({                     
                 url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveByKey.do' />"
                ,data:JSON.stringify(data)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
                ,error:function(jqXHR,status,error) {

                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function (result){
                  var fileKeyNmVal = result["fileKeyNm"];
                  if(dms.string.isNotEmpty(fileKeyNmVal)){
                     getRequisitionFile(fileKeyNmVal);
                  }
                        
                }
             }) ;
  };
 
 //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 end
 

       /** 필드 초기화**/
    initAll = function(){

        $("#gridLabor").data("kendoExtGrid").dataSource._destroyed = [];
        $("#gridPart").data("kendoExtGrid").dataSource._destroyed = [];
        $("#fileGrid").data("kendoExtGrid").dataSource._destroyed = [];

        $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
        $("#gridPart").data("kendoExtGrid").dataSource.data([]);
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

        $("#pwaApproveForm").get(0).reset();

        $("#ltsModelCd").val("");
        $("#hqApproveId").val("");
        $("#pwaDocNo").val("");
        $("#pwaStatCd").val("");
        $("#carOwnerId").val("");
        $("#dlrCd").val("");
        $("#pwaWrtrId").val("");
        $("#returnApproveNo").val("");
        $("#returnCnt").val("0");

        $("#itemOccrAmt").html("0");
        $("#lbrOccrAmt").html("0");
        $("#subLbrOccrAmt").html("0");
        $("#totOccrAmt").html("0");

        $("#totApproveAmt").html("0");

        $("#itemDeductAmt").html("0"); //공제부품금액금액
        $("#lbrDeductAmt").html("0"); //공제공임금액금액
        $("#subLbrDeductAmt").html("0"); //공제외주금액금액
        $("#totDeductAmt").html("0"); //공제금액합계

        setButtonEnable("");
    };

    /** 버튼 세팅 **/
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "Q" :
                $("#btnAccept").data("kendoButton").enable(true);
                $("#btnApprove").data("kendoButton").enable(false);
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnReject").data("kendoButton").enable(false);
                $("#btnApprCancel").data("kendoButton").enable(false);
                $("#btnExcel").data("kendoButton").enable(false);
                $("#btnCauPhenPopup").data("kendoButton").enable(true);
                $("#btnLbrPopup").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#btnPwaHist").data("kendoButton").enable(true);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                      break;
            case "S" :
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnApprove").data("kendoButton").enable(true);
                $("#btnReturn").data("kendoButton").enable(true);
                $("#btnReject").data("kendoButton").enable(true);
                $("#btnApprCancel").data("kendoButton").enable(false);
                $("#btnExcel").data("kendoButton").enable(true);
                $("#btnCauPhenPopup").data("kendoButton").enable(true);
                $("#btnLbrPopup").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#btnPwaHist").data("kendoButton").enable(true);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                      break;
            case "A" :
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnApprove").data("kendoButton").enable(false);
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnReject").data("kendoButton").enable(false);
                $("#btnApprCancel").data("kendoButton").enable(true);
                $("#btnExcel").data("kendoButton").enable(true);
                $("#btnCauPhenPopup").data("kendoButton").enable(true);
                $("#btnLbrPopup").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#btnPwaHist").data("kendoButton").enable(true);
                $("#btnRoHistPopup").data("kendoButton").enable(true);

                      break;
            case "C" :
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnApprove").data("kendoButton").enable(false);
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnReject").data("kendoButton").enable(false);
                $("#btnApprCancel").data("kendoButton").enable(false);
                $("#btnExcel").data("kendoButton").enable(true);
                $("#btnCauPhenPopup").data("kendoButton").enable(true);
                $("#btnLbrPopup").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#btnPwaHist").data("kendoButton").enable(true);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                      break;
            case "R" :
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnApprove").data("kendoButton").enable(false);
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnReject").data("kendoButton").enable(false);
                $("#btnApprCancel").data("kendoButton").enable(false);
                $("#btnExcel").data("kendoButton").enable(true);
                $("#btnCauPhenPopup").data("kendoButton").enable(true);
                $("#btnLbrPopup").data("kendoButton").enable(true);
                $("#btnPwaHistPopup").data("kendoButton").enable(true);
                $("#btnPwaHist").data("kendoButton").enable(true);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                      break;
            default :
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnApprove").data("kendoButton").enable(false);
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnReject").data("kendoButton").enable(false);
                $("#btnApprCancel").data("kendoButton").enable(false);
                $("#btnExcel").data("kendoButton").enable(true);
                $("#btnCauPhenPopup").data("kendoButton").enable(false);
                $("#btnLbrPopup").data("kendoButton").enable(false);
                $("#btnPwaHistPopup").data("kendoButton").enable(false);
                $("#btnPwaHist").data("kendoButton").enable(false);
                $("#btnRoHistPopup").data("kendoButton").enable(false);
                     break;
        }
    };

    /** PWA 신청  그리드 **/
    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-0803-164901"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         var sDivisionLst = $("#sDivision").data("kendoExtMultiSelectDropDownList").value();
                         var sOfficeLst = $("#sOffice").data("kendoExtMultiSelectDropDownList").value();

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;


                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"]   = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"]  = $("#sVinNo").val();
                         params["sDlrCd"]  = $("#sDlrCd").val();
                         params["sSelectTabId"] = selectTabId;
                         params["sDivisionLst"] = sDivisionLst;
                         params["sOfficeLst"] = sOfficeLst;

                         if(selectTabId == "apr"){
                             params["sPwaStatCd"] = "A";
                         }else{
                             params["sPwaStatCd"] = $("#sPwaStatCd").val();
                         }

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
                       ,pwaStatCd:{type:"string" }
                       ,dlrCd:{type:"string" }
                       ,dlrNm:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,pwaApproveNo:{type:"string" }
                       ,dlrSignReqDt:{type:"date" }
                       ,hqApproveDt:{type:"date"}
                       ,itemOccrAmt:{type:"number"}
                       ,lbrOccrAmt:{type:"number"}
                       ,subLbrOccrAmt:{type:"number"}
                       ,occrAmtSum:{type:"number"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,selectable:"row"
        ,height:170
        ,sortable:false
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }
        }
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());
            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var pwaDocNo = selectedVal.pwaDocNo;

            var params = {};
            params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
            params["sToDt"]   = $("#sToDt").data("kendoExtMaskedDatePicker").value();
            params["sVinNo"] = selectedVal.vinNo;
            params["sPwaDocNo"] = selectedVal.pwaDocNo;
            params["sDlrCd"] = selectedVal.dlrCd;


            $.ajax({
                url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){
                   setResultDataSetting(result); // 필드값 세팅
                   calApproveAmt(); // 금액 계산

                   $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
                   $("#gridPart").data("kendoExtGrid").dataSource.data([]);
                   $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

                   $("#gridLabor").data("kendoExtGrid").dataSource.read();
                   $("#gridPart").data("kendoExtGrid").dataSource.read();
                   $("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#pwaStatCd").val());
                }
            }) ;
        }
        ,columns:[
             {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
            ,{field:"pwaStatCd",title:"<spring:message code='ser.lbl.statNm' />", width:100
                ,attributes :{"class":"ac"}
                ,template:"#=setPwaStatMap(pwaStatCd) #"
                ,editor:function(container, options){
                    $('<input required name="pwaStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:pwaStatCdList
                    });
                    $('<span class="k-invalid-msg" data-for="pwaStatCd"></span>').appendTo(container);
               }
            }//상태
           ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"ac"}  }//딜러코드
           ,{field:"dlrNm",title:"<spring:message code='sal.lbl.dlrNm' />", width:180,sortable:false, attributes :{"class":"ac"}  }//딜러이름
           ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />" ,width:150 , attributes :{"class":"ac"}}//VIN
           ,{field:"pwaApproveNo",title:"<spring:message code='ser.lbl.pwaApprovalNo' />", width:100, attributes :{"class":"ac"} }//PWA승인번호
           ,{field:"carOwnerNm",title:"<spring:message code='ser.lbl.custNm' />", width:100,sortable:false, attributes :{"class":"al"}}//고객명
           ,{field:"dlrSignReqDt" , title:"<spring:message code='par.lbl.requestDt' />", width:120
               ,attributes :{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />  HH:mm}"
            }//신청일자
            ,{field:"hqApproveDt",title:"<spring:message code='global.lbl.evalDt' />", width:120,sortable:false
                , attributes :{"class":"ac"}
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }//심사일자
            ,{field:"cauOperAtcCd",title:"<spring:message code='ser.lbl.cauOperActCd' />", width:80,sortable:false, attributes :{"class":"ac"}}//주조작코드
            ,{field:"cauItemCd",title:"<spring:message code='ser.lbl.cauItemCd' />", width:120,sortable:false, attributes :{"class":"ac"}}//원인부품
            ,{field:"pwaTpCd1",title:"<spring:message code='ser.lbl.pwaTpCd1' />", width:80,sortable:false, attributes :{"class":"ac"}}//PWA유형1
            ,{field:"pwaTpCd2",title:"<spring:message code='ser.lbl.pwaTpCd2' />", width:80,sortable:false, attributes :{"class":"ac"}}//PWA유형2
            //添加行车里程字段内容 start
            ,{field:"runDistVal",title:"<spring:message code='ser.lbl.runDist' />", width:120,sortable:false, attributes :{"class":"ac"}}//行车里程
            //添加行车里程字段内容 end
            ,{field:"itemOccrAmt",title:"<spring:message code='ser.lbl.itemAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//부품금액
            ,{field:"lbrOccrAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//공임금액
            ,{field:"subLbrOccrAmt",title:"<spring:message code='ser.lbl.subLbrAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//외주금액
            ,{field:"occrAmtSum",title:"<spring:message code='global.lbl.total' />", width:100,sortable:false, attributes :{"class":"ar"}}//합계
            ,{field:"hqApproveNm",title:"<spring:message code='ser.lbl.hqApproveNm' />", width:80,sortable:false, attributes :{"class":"ac"}}//판정자이름
          	//添加故障现象说明字段内容 start
            ,{field:"errPhenCont",title:"<spring:message code='ser.lbl.errPhenCont' />", width:150,sortable:false, attributes :{"class":"ac"}}//故障现象说明
            //添加故障现象说明字段内容 end
            //添加维修方案字段内容 start
            ,{field:"rpirMtdCont",title:"<spring:message code='ser.lbl.rpirMtdCont' />", width:150,sortable:false, attributes :{"class":"ac"}}//维修方案
            //添加维修方案字段内容 end
            ,{field:"returnReasonCont",title:"<spring:message code='ser.lbl.returnReasonCont' />", width:150, attributes :{"class":"al"} }//미승인원인
            ,{field:"returnCnt", title:"<spring:message code='ser.lbl.returnCnt' />",  width:80 , attributes :{"class":"ar"}}//리턴횟수
        ]
    });

    /** PWA 승인 그리드 **/
    $("#gridMaster2").kendoExtGrid({
        gridId:"G-SER-0803-164902"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};

                         var sDivisionLst = $("#sDivision").data("kendoExtMultiSelectDropDownList").value();
                         var sOfficeLst = $("#sOffice").data("kendoExtMultiSelectDropDownList").value();

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"]   = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"]  = $("#sVinNo").val();
                         params["sDlrCd"]  = $("#sDlrCd").val();
                         params["sSelectTabId"] = selectTabId;
                         params["sPwaStatCd"] = "A";
                         params["sDivisionLst"] = sDivisionLst;
                         params["sOfficeLst"] = sOfficeLst;

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
                       ,pwaStatCd:{type:"string" }
                       ,dlrCd:{type:"string" }
                       ,dlrNm:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,pwaApproveNo:{type:"string" }
                       ,dlrSignReqDt:{type:"date" }
                       ,hqApproveDt:{type:"date" }
                       ,pwaApproveNm:{type:"string" }
                       ,itemApproveAmt:{type:"number"}
                       ,lbrApproveAmt:{type:"number"}
                       ,subLbrApproveAmt:{type:"number"}
                       ,approveAmtSum:{type:"number"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,selectable:"row"
        ,height:170
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());

            if(selectedVal != null){

                var dlrCd = selectedVal.dlrCd;
                var vinNo = selectedVal.vinNo;
                var pwaDocNo = selectedVal.pwaDocNo;
                var pwaApproveNo = selectedVal.pwaApproveNo;

                var params = {};
                params["sVinNo"] = selectedVal.vinNo;
                params["sPwaDocNo"] = selectedVal.pwaDocNo;
                params["sDlrCd"] = selectedVal.dlrCd;
                params["sPwaApproveNo"] = selectedVal.pwaApproveNo;


                $.ajax({
                    url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveByKey.do' />"
                   ,data:JSON.stringify(params)
                   ,type:"POST"
                   ,dataType:"json"
                   ,contentType:"application/json"
                   ,error:function(jqXHR,status,error) {

                      dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function (result){
                       setResultDataSetting(result); // 필드값 세팅
                       calApproveAmt(); // 금액 계산

                       $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
                       $("#gridPart").data("kendoExtGrid").dataSource.data([]);
                       $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                       $("#gridLabor").data("kendoExtGrid").dataSource.read();
                       $("#gridPart").data("kendoExtGrid").dataSource.read();
                       /**/
                       $("#fileGrid").data("kendoExtGrid").dataSource.read();

                       setButtonEnable($("#pwaStatCd").val());


                    }

                }) ;
            }

        }
        ,columns:[
             {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
            ,{field:"pwaStatCd",title:"<spring:message code='ser.lbl.statNm' />", width:100
                ,attributes :{"class":"ac"}
                ,template:"#=setPwaStatMap(pwaStatCd) #"
                ,editor:function(container, options){
                    $('<input required name="pwaStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:pwaStatCdList
                    });
                    $('<span class="k-invalid-msg" data-for="pwaStatCd"></span>').appendTo(container);
                   }
            }//상태
            ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"ac"}  }//딜러코드
            ,{field:"dlrNm",title:"<spring:message code='sal.lbl.dlrNm' />", width:180,sortable:false, attributes :{"class":"al"}  }//딜러이름
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />" ,width:150 , attributes :{"class":"ac"}}//VIN
            ,{field:"pwaApproveNo",title:"<spring:message code='ser.lbl.pwaApprovalNo' />", width:100, attributes :{"class":"ac"} }//PWA승인번호
            ,{field:"carOwnerNm",title:"<spring:message code='ser.lbl.custNm' />", width:100,sortable:false, attributes :{"class":"ac"}}//고객명
            ,{field:"dlrSignReqDt" , title:"<spring:message code='par.lbl.requestDt' />", width:120
                ,attributes :{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />  HH:mm}"
             }//신청일자
            ,{field:"hqApproveDt",title:"<spring:message code='global.lbl.evalDt' />", width:120,sortable:false
                ,attributes :{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />  HH:mm}"
             }//심사일자
            ,{field:"cauOperAtcCd",title:"<spring:message code='ser.lbl.cauOperActCd' />", width:80,sortable:false, attributes :{"class":"ac"}}//주조작코드
            ,{field:"cauItemCd",title:"<spring:message code='ser.lbl.cauItemCd' />", width:120,sortable:false, attributes :{"class":"ac"}}//원인부품
            ,{field:"pwaTpCd1",title:"<spring:message code='ser.lbl.pwaTpCd1' />", width:80,sortable:false, attributes :{"class":"ac"}}//PWA유형1
            ,{field:"pwaTpCd2",title:"<spring:message code='ser.lbl.pwaTpCd2' />", width:80,sortable:false, attributes :{"class":"ac"}}//PWA유형2
          	//添加行车里程字段内容 start
            ,{field:"runDistVal",title:"<spring:message code='ser.lbl.runDist' />", width:120,sortable:false, attributes :{"class":"ac"}}//行车里程
            //添加行车里程字段内容 end
            ,{field:"itemApproveAmt",title:"<spring:message code='ser.lbl.itemAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//부품금액
            ,{field:"lbrApproveAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//공임금액
            ,{field:"subLbrApproveAmt",title:"<spring:message code='ser.lbl.subLbrAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//외주금액
            ,{field:"approveAmtSum",title:"<spring:message code='global.lbl.total' />", width:100,sortable:false, attributes :{"class":"ar"}}//합계
            ,{field:"hqApproveNm",title:"<spring:message code='ser.lbl.hqApproveNm' />", width:80,sortable:false, attributes :{"class":"ac"}}//판정자이름
            //添加故障现象说明字段内容 start
            ,{field:"errPhenCont",title:"<spring:message code='ser.lbl.errPhenCont' />", width:150,sortable:false, attributes :{"class":"ac"}}//故障现象说明
            //添加故障现象说明字段内容 end
            //添加维修方案字段内容 start
            ,{field:"rpirMtdCont",title:"<spring:message code='ser.lbl.rpirMtdCont' />", width:150,sortable:false, attributes :{"class":"ac"}}//维修方案
            //添加维修方案字段内容 end
            ,{field:"returnReasonCont",title:"<spring:message code='ser.lbl.returnReasonCont' />", width:150, attributes :{"class":"al"} }//미승인원인
            ,{field:"returnCnt", title:"<spring:message code='ser.lbl.returnCnt' />",  width:80 , attributes :{"class":"ar"}}//리턴횟수
        ]
    });


    /**공임 그리드 **/
    $("#gridLabor").kendoExtGrid({
        gridId:"G-SER-0803-164903"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveLbrs.do' />"
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

                         params["sPwaDocNo"] = $("#pwaDocNo").val();
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
                        ,lbrCd:{type:"string", editable:false, validation:{required:true}}
                        ,lbrNm:{type:"string" , editable:false}
                        ,lbrHm:{type:"number" , editable:false}
                        ,lbrQty:{type:"number", validation:{required:true}}
                        ,lbrPrc:{type:"number" , editable:false}
                        ,lbrWart:{type:"number" , editable:false}
                        ,lbrPaint:{type:"number" , editable:false}
                        ,lbrAmt:{type:"number", editable:false }
                        ,cauLbrYn:{type:"string", editable:false}
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,resizable:false
        ,height:100
        ,editable:false
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="lbrAmt" || fieldName =="lbrPrc" ){
                 this.closeCell();
             }
         }
        ,columns:[
             {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
            ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:150, attributes:{"class":"al"}}
            ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width:300, attributes:{"class":"al"}}
            ,{field:"lbrHm",title:"<spring:message code='ser.lbl.lbrHm' />", width:120, attributes:{"class":"ar"} }
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:120
                ,attributes :{"class":"ar"}
                ,editor:function(container, options){
                    $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:true
                    });
                    $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
                 }
            }
            ,{field:"lbrPrc",title:"<spring:message code='ser.lbl.lbrPrc' />", width:120
                ,attributes :{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input required name="lbrPrc" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:1
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="lbrPrc"></span>').appendTo(container);
                 }
             }
            ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.amt' />", width:150
                ,attributes :{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
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
            ,{field:"cauLbrYn",title:"<spring:message code='ser.lbl.mainLbrCd' />", width:120
                ,attributes :{"class":"ac"}
                ,template:"#= setPwaCauYnMap(cauLbrYn) #"
                ,editor:function(container, options){
                    $('<input required name="cauLbrYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:pwaCauYnList
                    });
                    $('<span class="k-invalid-msg" data-for="cauLbrYn"></span>').appendTo(container);
                   }
               }
          ]
    });


    /**부품 그리드 **/
    $("#gridPart").kendoExtGrid({
        gridId:"G-SER-0803-164904"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveParts.do' />"
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

                         params["sPwaDocNo"] = $("#pwaDocNo").val();
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
                       ,reqQty:{type:"number", validation:{required:true} } //수량
                       ,saleUnitCd:{type:"string", editable:false }//단위
                       ,itemPrc:{type:"number", editable:false } // 단가
                       ,itemTax:{type:"number", editable:false } // 세금
                       ,itemMarkup:{type:"number", editable:false } // 마크업
                       ,itemAmt:{type:"number", editable:true }//금액
                       ,cauItemYn:{type:"string", editable:true }
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:100
        ,resizable:false
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
         }
        ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150, attributes :{"class":"al"}}
               ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300, attributes :{"class":"al"}}
               ,{field:"reqQty", title:"<spring:message code='ser.lbl.itemQty' />", width:120
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="reqQty" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0                // 소숫점
                          ,min:1
                          ,value:0
                          ,spinners:true
                       });
                       $('<span class="k-invalid-msg" data-for="reqQty"></span>').appendTo(container);
                    }
               }
               ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:120, attributes :{"class":"ac"}}
               ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:120, attributes :{"class":"ar"}, format:"{0:n2}"}
               ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:150, attributes :{"class":"ar"}, format:"{0:n2}"}
               ,{field:"cauItemYn", title:"<spring:message code='ser.lbl.cauItemCd' />", width:120
                   ,attributes :{"class":"ac"}
                   ,template:"#= setPwaCauYnMap(cauItemYn)#"
                   ,editor:function(container, options){
                       $('<input required name="cauItemYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:pwaCauYnList
                       });
                       $('<span class="k-invalid-msg" data-for="cauItemYn"></span>').appendTo(container);
                      }
                 }
          ]
    });

 // ********************** 데이터 format 세팅 **********************
    /**조회조건 시작일자 **/
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**조회조건 종료일자**/
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    /** PWA 상태코드  콤보박스 **/
    $("#sPwaStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pwaStatCdList
        ,optionLabel:" "  // 선택
        ,index:1
    });

   /**판매일자**/
    $("#creDt").kendoDatePicker({
       format:"{0:<dms:configValue code='dateFormat' />}"
    });

   /**보증수리일자**/
    $("#wartDt").kendoDatePicker({
       format:"{0:<dms:configValue code='dateFormat' />}"
    });
    /**保修结束日期**/
    $("#wartExpireDt").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
     });

   /**주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표

    });

     /**승인 부품금액 금액**/
    $("#itemApproveAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false
       ,change:calApproveAmt
     });

     /**승인 공임금액 금액**/
    $("#lbrApproveAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false
       ,change:calApproveAmt
     });

    /**승인 외주금액 금액**/
    $("#subLbrApproveAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false
       ,change:calApproveAmt
    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    $("#tabstrip2").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            selectTabId = e.item.id;
            var kendoTab = $("#tabstrip1").kendoExtTabStrip().data("kendoExtTabStrip");
            var pwaStatCd = $("#sPwaStatCd").val();

            if(selectTabId == "apr"){ //승인
                reqPwaStatCd = pwaStatCd;
                $("#sPwaStatCd").data("kendoExtDropDownList").value("A");
                $("#sPwaStatCd").data("kendoExtDropDownList").enable(false);
                $("#gridMaster2").data("kendoExtGrid").dataSource.data([]);
                $("#gridMaster2").data("kendoExtGrid").dataSource.page(1);
            } else { //신청
                $("#sPwaStatCd").data("kendoExtDropDownList").value(reqPwaStatCd);
                $("#sPwaStatCd").data("kendoExtDropDownList").enable(true);
                $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
            }
         }
    });

    setFileButton("N");

});
</script>
<!-- //script -->
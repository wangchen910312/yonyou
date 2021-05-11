<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

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
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->




<!-- 고객인도관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.custDeliveryMgmt" /></h1><!-- 고객인도관리 -->
        <div class="btn_right">
            <button class="btn_m" id="btnDelivery"><spring:message code="global.btn.deliveryHandle" /><!-- 인도처리 --></button>
            <button class="btn_m" id="btnDeliveryCancel"><spring:message code="global.btn.deliveryCancel" /><!-- 인도취소 --></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:21%;">
                <col style="width:10%;">
                <col style="width:21%;">
                <col style="width:14%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <!--  2016.08.26변경. 계약상태 공통코드값을 갖고가되 TEXT와 코드내용만 가공하여 출력 [인도상태:계약생성 -> 미인도 , 인도 -> 인도]-->
                    <th scope="row"><spring:message code='sal.lbl.deliveryStat' /></th><!-- 인도상태 -->
                    <td>
                        <input id="sContractStatCd" type="text"  class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractType' /></th><!-- 계약유형 -->
                    <td>
                        <input id="sContractTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row" class="th_form"><spring:message code='sal.lbl.deliveryDt' /></th><!-- 인도일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNm" name="sContractCustNm" type="text" class="form_input onKey_down" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                    <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" type="text" readonly class="form_input form_readonly">
                            </div>
                       </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" maxlength="17">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->


    <div class="clfix">
        <div class="left_areaStyle" style="width:33%;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.lbl.contractList' /></h2><!-- 계약목록 -->
            </div>
            <section class="group">
                <!-- 그리드 시작 -->
                <div class="table_grid">
                    <div id="grid"></div>
                </div>
                <!-- 그리드 종료 -->
            </section>
        </div>


        <div class="right_areaStyle" style="width:66%;" >
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.lbl.custInfo' /></h2><!-- 고객정보 -->
                </div>
                <!-- 고객정보 -->
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" style="width:64%;">
                                            <input id="custNo" type="text" class="form_input form_readonly" readonly>
                                        </div>
                                        <div class="form_right" style="width:36%;">
                                            <input id="custNm" type="text" readonly class="form_input form_readonly">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row" class="th_form"><spring:message code='global.lbl.custTp' /></th><!-- 고객유형 -->
                                <td>
                                   <input id="custTp" type="text" class="form_comboBox"  >
                                </td>
                                <th scope="row" class="th_form"><spring:message code='global.lbl.phoneNo' /></th><!-- 전화번호 -->
                                <td>
                                   <input id="hpNo" type="text" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row" class="th_form"><spring:message code='global.lbl.mathDocTp' /></th><!-- 신분증유형 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left" style="width:38%;">
                                            <input id="mathDocTp" type="text" class="form_comboBox" >
                                        </div>
                                        <div class="form_right" style="width:62%;">
                                            <input id="ssnCrnNo" type="text" readonly class="form_input form_readonly">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 고객정보 끝 -->

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2><!-- 차량정보 -->
                </div>
                <!-- 차량정보 -->
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                                <td class="readonly_area">
                                    <input id="carlineCd" class="form_input" readonly>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                <td class="readonly_area" >
                                    <input id="modelCd" class="form_input" readonly>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ocn' /></th>    <!-- OCN -->
                                <td class="readonly_area">
                                    <input id="ocnCd" class="form_input" readonly >
                                </td>
                                <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                                <td class="readonly_area">
                                    <input id="extColorCd" type="text" class="form_input" readonly>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                                <td class="readonly_area">
                                    <input id="intColorCd" type="text" class="form_input" readonly>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.assignVinNo' /></th><!-- 임시배정 VIN NO -->
                                <td class="readonly_area">
                                    <input id="contractVinNo" type="text" class="form_input" readonly>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.rfidNo' /></th><!-- RFID NO -->
                                <td class="readonly_area">
                                    <input id="contractRfidNo" class="form_input"  readonly>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.retlTp' /></th><!-- 소매유형 -->
                                <td class="readonly_area">
                                    <input id="contractRetlTp" type="text" class="form_comboBox" readonly>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.releaseCancDt' /></span></th><!-- 출고취소일자 -->
                                <td>
                                    <input id="cancDt" type="text" class="form_datepicker">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.cancReason' /></span></th><!-- 판매취소사유 -->
                                <td>
                                    <input id="cancReasonCd" type="text" class="form_comboBox">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 차량정보 끝 -->


                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.lbl.contractInfo' /></h2><!-- 계약정보 -->
                </div>
                <!-- 계약정보 -->
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.logChannel' /></span></th><!-- Log.Channel -->
                                <td>
                                    <input id="dstbChnCd" type="text" class="form_comboBox" >
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.tecId' /></span></th><!-- 서비스고문 -->
                                <td>
                                    <input id="tecId" type="text" class="form_datepicker" >
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.giDt' /></span></th><!-- 출고일 -->
                                <td >
                                    <input id="realDlDt" type="text" class="form_datepicker" >
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.rcptScan' /></th><!-- 영수증 스캔 -->
                                <td class="readonly_area" colspan="3">
                                    <input id="contractRcptId" class="form_input" style="width:80%;" readonly>
                                    <button class="btn_xs" id="btnRcptScan"><spring:message code='sal.lbl.scan' /><!-- 스캔 --></button>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th><!-- 영수증번호 -->
                                <td >
                                    <input id="contractRcptNo" class="form_input ">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.rcptAmt' /></th><!-- 영수금액 -->
                                <td >
                                    <input id="contractRcptAmt" class="form_input ar">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.invoiceDt' /></th><!-- 영수증일자 -->
                                <td >
                                    <input id="contractRcptDt" class="form_datepicker">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 계약정보 끝 -->


                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.lbl.DeliveryInfoChange' /></h2><!-- 출고VIN정보 -->
                </div>
                <!-- 출고VIN정보 -->
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.deliveryVinRfid' /></th><!-- RFID NO -->
                                <td colspan="3">
                                    <input id="rfidNoH" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.deliveryVinNo' /></th><!-- VIN NO -->
                                <td >
                                    <input id="vinNo" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.retlTp' /></th><!-- 소매유형 -->
                                <td class="readonly_area">
                                    <input id="deliveryRetlTp" type="text" class="form_comboBox" readonly>
                                </td>
                                <td colspan="3"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.rfidNo' /></th><!-- RFID NO -->
                                <td class="readonly_area" colspan="3">
                                    <input id="rfidNo" class="form_input" style="width:80%;" readonly>
                                    <button class="btn_xs" id="btnRfidScan" ><spring:message code='sal.lbl.scan' /><!-- 스캔 --></button>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.regReason' /></span></th><!-- 신청사유 -->
                                <td >
                                    <input id="fceSaleReqReasonCd" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code='global.lbl.reqStat' /></th><!-- 신청상태 -->
                                <td class="readonly_area">
                                    <input id="reqStatCd" class="form_comboBox" readonly>
                                </td>
                                <td colspan="4" class="ar">
                                    <button class="btn_xs" id="btnFileUpload" onclick="fnFileUploadPopup()"><spring:message code='global.btn.fileUpload' /><!-- 첨부파일(파일업로드) --></button>
                                    <button class="btn_xs" id="btnExceptionDlv"><spring:message code='global.btn.exceptionDelivery' /><!-- 이상출고처리 --></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 출고VIN정보 -->

                <!-- assign 그리드 시작 -->
                <div class="table_grid mt10">
                    <div id="assignGrid"></div>
                </div>
                <!-- assign 그리드 종료 -->
            </section>
        </div>
    </div>

    <section id="fileViewWindow" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
            </div>
        </div>
        <div class="table_grid">
            <div id="fileGrid"></div>
        </div>
        <!-- 파일업로드 -->

    </section>
<input type="hidden" id="fileDocNo" />
</section>




<OBJECT
id=TULMReader
codebase="ULMReaderProj1.ocx"
classid="clsid:9B5B1F60-6EB2-4246-801A-F059114D1D45"
width=0
height=0
align=center
hspace=0
vspace=0
>
</OBJECT>



<!-- script -->
<script>
var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nowMonth = "${nowMonth}";   // 현재월
var toDay = "${toDay}";         // 오늘날짜
var sysYyyyMm = "${sysYyyyMm}"; // 이월취소비교용년월
var vCustNo = "";
var carlineCd = "";
var modelCd = "";
var ocnCd = "";
var extColorCd = "";
var intColorCd = "";
var excpApproveYn = "";
var reqStatCd = "";
var scanYn;                     // 스캔여부
var getBrowserType = dms.browser.getBrowserType();

//인도처리 팝업변수 선언
var deliveryPopupWin;

//판매유형 Array
var contractTp = [];
<c:forEach var="obj" items="${contractTpList}">
    contractTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판매유형 Map
var contractTpMap = dms.data.arrayToMap(contractTp, function(obj){ return obj.cmmCd; });

//계약상태 Array
var sContractStat = [];
var contractStat = [];
var cmmCdNm = "";
<c:forEach var="obj" items="${contractStatList}">
if("${obj.cmmCd}" == '20' || "${obj.cmmCd}" == '50' || "${obj.cmmCd}" == '91' ){
    if("${obj.cmmCd}" == '20'){
        cmmCdNm = "<spring:message code='sal.lbl.notDelivery' />";//미인도
    }else if("${obj.cmmCd}" == '50'){
        cmmCdNm = "<spring:message code='sal.lbl.deliveryed' />";//인도
    }else{
        cmmCdNm = "<spring:message code='sal.lbl.deliveryCancel' />";//인도취소
    }
    sContractStat.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":cmmCdNm, "useYn":"${obj.useYn}"});
    contractStat.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
//계약상태 Map
var contractStatMap = dms.data.arrayToMap(contractStat, function(obj){ return obj.cmmCd; });

//유통채널 Array(SAL018)
var dstbChnCdDs = [];
<c:forEach var="obj" items="${dstbChnCdList}">
    dstbChnCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//유통채널 Map
var dstbChnCdMap = dms.data.arrayToMap(dstbChnCdDs, function(obj){ return obj.cmmCd; });

//소매유형 Array(SAL130)
var retlTpDs = [];
<c:forEach var="obj" items="${retlTpList}">
    retlTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//소매유형 Map
var retlTpMap = dms.data.arrayToMap(retlTpDs, function(obj){ return obj.cmmCd; });

//판매취소사유 Array(SAL129)
var cancReasonCdDs = [];
var cncRsCdDs = [];
<c:forEach var="obj" items="${cancReasonCdList}">
    cancReasonCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    if("${obj.cmmCd}" == 'CA' || "${obj.cmmCd}" == 'CB' || "${obj.cmmCd}" == 'CC'){
        cncRsCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>
//판매취소사유 Map
var cancReasonCdMap = dms.data.arrayToMap(cancReasonCdDs, function(obj){ return obj.cmmCd; });

//강제판매처리신청사유 Array(SAL153)
var fceSaleReqReasonCdDs = [];
<c:forEach var="obj" items="${fceSaleReqReasonCdList}">
    fceSaleReqReasonCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//강제판매처리신청사유 Map
var fceSaleReqReasonCdMap = dms.data.arrayToMap(fceSaleReqReasonCdDs, function(obj){ return obj.cmmCd; });

//심사여부 Array(SAL145)
var approveYnDs = [];
<c:forEach var="obj" items="${approveYnList}">
    approveYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//심사여부 Map
var approveYnMap = dms.data.arrayToMap(approveYnDs, function(obj){ return obj.cmmCd; });

//강제판매처리신청상태 Array(SAL154)
var reqStatCdDs = [];
<c:forEach var="obj" items="${reqStatCdList}">
    reqStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//강제판매처리신청상태 Map
var reqStatCdMap = dms.data.arrayToMap(reqStatCdDs, function(obj){ return obj.cmmCd; });

//주문유형(오더유형) Array(SAL138)
var ordTpDs = [];
<c:forEach var="obj" items="${ordTpList}">
    ordTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//주문유형 Map
var ordTpMap = dms.data.arrayToMap(ordTpDs, function(obj){ return obj.cmmCd; });

//조건기간구분 SAL061
var searchDSList = [];
<c:forEach var="obj" items="${searchDtList}" varStatus="status">
    <c:if test="${status.index == 0 || status.index == 3}" >
    searchDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//서비스고문 데이터셋
var tecIdDs = [];
<c:forEach var="obj" items="${serviceAdList}">
    tecIdDs.push({tecId:"${obj.tecId}", tecNm:"${obj.tecNm}"});
</c:forEach>

//고객유형 데이터셋
var custTpDs = [];
<c:forEach var="obj" items="${custTpList}">
    custTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>


//주요인증문서유형(证件类型) 데이터셋
var mathDocTpDs = [];
<c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    //조회조건 - 계약일(기간)- START
    $("#sStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 계약일(기간)- END
    $("#sEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);
    $("#sEndDt").on('change',   {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);

    //조회조건 - 인도상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:sContractStat
        ,change:function(e) {
            if(this.value() == '20'){
                $("#btnDelivery").data("kendoButton").enable(true);
                $("#btnDeliveryCancel").data("kendoButton").enable(false);
                $("#btnRfidScan").data("kendoButton").enable(true);
                $("#btnRcptScan").data("kendoButton").enable(true);
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
            }else if(this.value() == '50'){
                $("#btnDelivery").data("kendoButton").enable(false);
                $("#btnDeliveryCancel").data("kendoButton").enable(true);
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
            }else {
                $("#btnDelivery").data("kendoButton").enable(false);
                $("#btnDeliveryCancel").data("kendoButton").enable(false);
                $("#btnExceptionDlv").data("kendoButton").enable(false);
                $("#btnRfidScan").data("kendoButton").enable(false);
                $("#btnRcptScan").data("kendoButton").enable(false);
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
            }
        }
        ,index:0
        //,optionLabel:" "
    });

    //조회조건 - 계약유형(판매유형)
    $("#sContractTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractTp
        ,optionLabel:" "
    });

    // 상세정보
    $("#btnFileUpload").kendoButton({
        click:function(e){
        }
        , enable:false
    })

    // RFID 스캔 버튼
    $("#btnRfidScan").kendoButton({
        click:function(e){

            if(getBrowserType == 'msie'){
                var sTagNo = "";

                sTagNo = TULMReader.OpenUSB();

                if (sTagNo == "00") {
                    TULMReader.CloseRF();
                    TULMReader.OpenRF();
                    sTagNo = TULMReader.ULMQuery();

                    if(sTagNo == '20'){
                        dms.notification.info("<spring:message code='sal.info.noScanRfid' />");
                    }else {
                        $("#rfidNo").val(sTagNo);
                    }

                    TULMReader.CloseRF();
                    TULMReader.CloseUSB();
                } else {
                    sTagNo = '';
                    TULMReader.CloseUSB();
                }

                scanYn = true;
            }else {
                //IE브라우저에서만 스캔 가능합니다.
                dms.notification.info("<spring:message code='sal.info.ieBrowserCanScan' />");
            }

        }
    })

    // 영수증스캔
    $("#btnRcptScan").kendoButton({
        click:function(e){
        }
    })


    /*************************** 검색 조건 영역 END **************************************************/
    //인도요청일
    $("#dlReqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //출고일
    $("#realDlDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    $("#realDlDt").data("kendoExtMaskedDatePicker").enable(false);

    //출고취소일자
    $("#cancDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#cancDt").data("kendoExtMaskedDatePicker").enable(false);



    //유통채널
    $("#dstbChnCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dstbChnCdDs
        ,optionLabel:" "
    });


    //취소사유
    $("#cancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:cancReasonCdDs
        ,optionLabel:" "
    });


    //강제판매신청사유
    $("#fceSaleReqReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:fceSaleReqReasonCdDs
        ,optionLabel:" "
    });


    //고객유형
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:custTpDs
        ,optionLabel:" "
    });
    $("#custTp").data("kendoExtDropDownList").enable(false);


    //주요인증문서유형
    $("#mathDocTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:mathDocTpDs
        ,optionLabel:" "
    });
    $("#mathDocTp").data("kendoExtDropDownList").enable(false);


    //심사여부
    $("#approveYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:approveYnDs
        ,optionLabel:" "
    });


    //신청상태
    $("#reqStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:reqStatCdDs
        ,optionLabel:" "
    });



    //서비스고문
    $("#tecId").kendoExtDropDownList({
        dataTextField:"tecNm"
        ,dataValueField:"tecId"
        ,dataSource:tecIdDs
        ,optionLabel:" "
    });


    //소매유형 - 임시배정빈
    $("#contractRetlTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:retlTpDs
        ,optionLabel:" "
    });


    //소매유형 - 출고빈
    $("#deliveryRetlTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:retlTpDs
        ,optionLabel:" "
    });


    //영수증일자
    $("#contractRcptDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    $("#cancReasonCd").data("kendoExtDropDownList").enable(false);


    //첨부파일 팝업
    $("#fileViewWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='global.btn.fileUpload' />"
        ,width:"700px"
        ,height:"250px"
    }).data("kendoWindow");




    /************************** 상세내역 영역 END **************************************************/
     //========파일삭제
     $("#fileDelete").click(function(){
         var fileGrid = $("#fileGrid").data("kendoExtGrid");
         var rows = fileGrid.select();
         var selectedItem = fileGrid.dataItem(rows);

         if (rows.length < 1) {
             //목록을 선택하여 주십시오.
             dms.notification.info("<spring:message code='global.info.required.select'/>");
             return;
         }

         var deleteList = [];
         rows.each(function(index, row) {
             var dataItem = fileGrid.dataItem(row);
             deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
         });

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

                 //삭제가 완료 되었습니다.
                 dms.notification.success("<spring:message code='global.info.deleteSuccess'/>");

                 var fileGrid = $("#fileGrid").data("kendoExtGrid");
                 var rows = fileGrid.select();
                 rows.each(function(index, row) {
                     fileGrid.removeRow(row);
                 });
                 fnDetlGroupHeader();

             }
         });
     });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            refresh();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
            $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });

    //버튼 - 차량그리드 조회
    $("#btnVehicleSearch").kendoButton({
        click:function(e){

            $('#assignGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 인도처리
    $("#btnDelivery").kendoButton({
        click:function(e) {

            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];


            //주문그리드
            var assignGrid = $("#assignGrid").data("kendoExtGrid");
            var sltIdx = assignGrid.select().index();
            var assignData = assignGrid.dataSource.view();
            var selectAssignVal = data[sltIdx];


            if(selectIdx == -1){
                // 인도처리할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }


            //VIN NO가 빈값이 아니고 RFID NO와 스캔된 RFID NO가 일치 혹은  VIN NO가 빈값이 아니고  강제심사심사상태가 'Y'인 경우 출고가능.
            if( ($("#rfidNo").val() == $("#rfidNoH").val() || $("#rfidNo").val() == $("#contractRfidNo").val() || $("#reqStatCd").val() == "Y") && ($("#contractVinNo").val() != "" || $("#vinNo").val() != "") ){

                if($("#reqStatCd").val() == "" || $("#reqStatCd").val() == null){
                    //RFID
                    if ( dms.string.isEmpty($("#rfidNo").val()) ){
                        //출고차량 RFID를 스캔 하지 않았습니다.
                        dms.notification.warning("<spring:message code='sal.info.scanRfidNo' />");
                        $("#rfidNo").focus();
                        return false;
                    }
                }

                //유통채널 필수
                if ( dms.string.isEmpty($("#dstbChnCd").val()) ){
                    dms.notification.warning("<spring:message code='sal.lbl.logChannel' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#dstbChnCd").focus();
                    return false;
                }

                //출고일자
                if ( dms.string.isEmpty($("#realDlDt").val())){
                    dms.notification.warning("<spring:message code='global.lbl.giDocRegDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#realDlDt").focus();
                    return false;
                }

                //서비스고문
                if ( dms.string.isEmpty($("#tecId").val())){
                    dms.notification.warning("<spring:message code='global.lbl.serviceAd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#tecId").focus();
                    return false;
                }

                var submitVin = "";
                var submitRetlTp = "";
                if($("#vinNo").val() != ""){
                    submitVin = $("#vinNo").val();
                    submitRetlTp = $("#deliveryRetlTp").val();
                }else {
                    submitVin = $("#contractVinNo").val();
                    submitRetlTp = $("#contractRetlTp").val();
                }
                var msg = "<spring:message code='sal.info.deliveryConfirm' />";
                // 임시배정된 VIN()출고하시겠습니까?
                if (confirm("VIN( "+ submitVin +" ) " + msg) == false ){
                    return false;
                }

                var saveData = {
                        contractNo:selectVal.contractNo
                        ,contractCustNo:selectVal.contractCustNo
                        ,saleOpptNo:selectVal.saleOpptNo
                        ,vinNo:submitVin
                        ,tecId:$("#tecId").data("kendoExtDropDownList").value()
                        ,dstbChnCd:$("#dstbChnCd").data("kendoExtDropDownList").value()
                        ,realDlDt:$("#realDlDt").data("kendoExtMaskedDatePicker").value()
                        ,contractRcptNo:$("#contractRcptNo").val()
                        ,contractRcptAmt:$("#contractRcptAmt").val()
                        ,contractRcptDt:$("#contractRcptDt").data("kendoExtMaskedDatePicker").value()
                        ,fceSaleReqReasonCd:$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value()
                        ,reqStatCd:$("#reqStatCd").data("kendoExtDropDownList").value()
                        ,ssnCrnNo:$("#ssnCrnNo").val()
                        ,retlTpCd:submitRetlTp
                        ,grteStartDt:$("#contractRcptDt").data("kendoExtMaskedDatePicker").value()
                        ,invcPublDt:$("#contractRcptDt").data("kendoExtMaskedDatePicker").value()
                        ,saleEmpNo:selectVal.saleEmpNo
                };

                $.ajax({
                    url:"<c:url value='/sal/dlv/vehicleDelivery/vehicleDelivery.do' />",
                    dataType:"json",
                    type:"POST",
                    contentType:"application/json",
                    data:JSON.stringify(saveData),
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus){
                        //정상적으로 처리되였습니다.
                        dms.notification.success("<spring:message code='sal.info.deliverySuccessMsg' />");
                        $('#grid').data('kendoExtGrid').dataSource.page(1);
                    }
                });

            }else {

                if($("#contractVinNo").val() == "" && $("#vinNo").val() == ""){
                    if(assignData.length == 0){
                        // 인도처리할 차량이 존재하지 않습니다.
                        dms.notification.warning("<spring:message code='global.lbl.car' var='deliveryVehicle' /><spring:message code='par.info.itemInsertNotMsg' arguments='${deliveryVehicle}' />");
                        return false;
                    }else if(sltIdx == -1){
                        // 인도처리할 차량을 선택하십시오.
                        dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.car' var='deliveryVehicle' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${deliveryVehicle}' />");
                        return false;
                    }
                }else {
                    if(sltIdx == -1 && $("#contractRfidNo").val() != $("#rfidNo").val() && $("#reqStatCd").val() == ""){
                        //임시배정VIN의 RFID와 스캔된 RFID가 일치하지 않습니다.
                        dms.notification.warning("<spring:message code='sal.info.contractRfidNotMapping'/>");
                        return false;
                    }


                    //신청사유
                    if ( dms.string.isEmpty($("#fceSaleReqReasonCd").val())){
                        //dms.notification.warning("<spring:message code='global.lbl.serviceAd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        dms.notification.warning("<spring:message code='sal.info.selectFceSaleReason'/>");
                        $("#fceSaleReqReasonCd").focus();
                        return false;
                    }else {
                        if($("#reqStatCd").val() == "R"){
                            dms.notification.warning("<spring:message code='sal.info.excpDeliveryEvaling'/>");
                            return false;
                        }else if($("#reqStatCd").val() == "N"){
                            dms.notification.warning("<spring:message code='sal.info.excpDeliveryEvalFaild'/>");
                            $("#btnExceptionDlv").data("kendoButton").enable(true);
                            return false;
                        }else {
                            dms.notification.warning("<spring:message code='sal.info.excpDeliveryFirstAct'/>");
                            return false;
                        }
                    }
                }

            }
        }
    });

    //버튼 - 인도취소
    $("#btnDeliveryCancel").kendoButton({
        click:function(e){

            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if(selectIdx == -1){
                // 출고취소할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='sal.info.selectCancelVehicle' />");
                //dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }

            if(selectVal.contractStatCd == '93'){
                //출고취소가 완료된 계약건입니다.
                dms.notification.warning("<spring:message code='sal.info.contractFinishCancel' />");
                //dms.notification.warning("<spring:message code='sal.info.deliveryWarningMsg' />");
                return false;
            }else if(selectVal.contractStatCd != '50'){
                //출고되지 않은  계약건입니다.
                dms.notification.warning("<spring:message code='sal.info.unDeliveryContract' />");
                //dms.notification.warning("<spring:message code='sal.info.deliveryWarningMsg' />");
                return false;
            }

            //취소요청일자
            if ( dms.string.isEmpty($("#cancDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.cancDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#cancDt").focus();
                return false;
            }

            //판매취소사유
            if ( dms.string.isEmpty($("#cancReasonCd").val())){
                dms.notification.warning("<spring:message code='sal.lbl.cancReason' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#cancReasonCd").focus();
                return false;
            }

            // 인도취소 처리 하시겠습니까?
            if (confirm("<spring:message code='global.btn.deliveryCancel' var='globalLblCustDelivery' /><spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblCustDelivery}, ${globalLblProce}' />") == false ){
                return false;
            }


            var realDlDt = $("#realDlDt").val().split("-");
            var realDlDtMm = realDlDt[1];
            var cancDt = $("#cancDt").val().split("-");
            var cancDtMm = cancDt[1];
            var deliveryGb;

            if(Number(sysYyyyMm) == Number(cancDtMm)){  //출고년월과 취소년월이 같은지 비교함. 다르면 이월출고 로직으로 감.
                deliveryGb = 'N';
            }else{
                deliveryGb = 'Y';
            }

            var vinNo ;

            if(selectVal.deliveryVinNo != ""){
                vinNo = selectVal.deliveryVinNo;
            }else {
                vinNo = selectVal.contractVinNo;
            }

            var saveData = {
                    contractNo:selectVal.contractNo
                    ,reqDt    :$("#cancDt").data("kendoExtMaskedDatePicker").value()
                    ,realDlDt :$("#realDlDt").data("kendoExtMaskedDatePicker").value()
                    ,contractTp:selectVal.contractTp
                    ,contractCustNo:$("#custNo").val()
                    ,carlineCd:selectVal.carlineCd
                    ,modelCd  :selectVal.modelCd
                    ,ocnCd    :selectVal.ocnCd
                    ,extColorCd:selectVal.extColorCd
                    ,intColorCd:selectVal.intColorCd
                    ,vinNo1   :selectVal.vinNo1
                    ,vinNo2   :selectVal.vinNo2
                    ,saleOpptNo:selectVal.saleOpptNo
                    ,cancReasonCd:$("#cancReasonCd").data("kendoExtDropDownList").value()
                    ,dstbChnCd:selectVal.dstbChnCd
                    ,contractRcptNo:selectVal.contractRcptNo
                    ,contractRcptAmt:selectVal.contractRcptAmt
                    ,contractRcptDt:selectVal.contractRcptDt
                    ,deliveryGb:deliveryGb
                    ,vinNo:vinNo
                    ,ssnCrnNo:$("#ssnCrnNo").val()

            };

            $.ajax({
                url:"<c:url value='/sal/dlv/vehicleDelivery/cancelDelivery.do' />",
                dataType:"json",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                },
                success:function(jqXHR, textStatus){
                    //정상적으로 처리되였습니다.
                    dms.notification.success("<spring:message code='sal.info.cancelDeliverySuccessMsg' />");
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                }
            });
        }
    });




    //버튼 - 이상출고처리
    $("#btnExceptionDlv").kendoButton({
        click:function(e){


            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];



            if($("#vinNo").val() == ""){
                dms.notification.warning("<spring:message code='sal.info.selectDeliveryVehicle'/>");
                return false;
            }


            if($("#rfidNo").val() != "" && $("#rfidNo").val() == $("#rfidNoH").val()){
                dms.notification.warning("<spring:message code='sal.info.notExcpDeliveryTarget'/>");
                return false;
            }else {
                //신청사유
                if ( dms.string.isEmpty($("#fceSaleReqReasonCd").val())){
                    dms.notification.warning("<spring:message code='sal.info.selectFceSaleReason'/>");
                    $("#fceSaleReqReasonCd").focus();
                    return false;
                }else {
                    if($("#reqStatCd").val() == "R"){
                        dms.notification.warning("<spring:message code='sal.info.excpDeliveryEvaling'/>");
                        return false;
                    }else if($("#reqStatCd").val() == "" || $("#reqStatCd").val() == 'N'){
                        // 이상출고처리 하시겠습니까?
                        if (confirm("<spring:message code='global.info.qDelivery' var='globalInfoQDelivery' /><spring:message code='global.info.cnfrmMessage' arguments='${globalInfoQDelivery}' />") == false ){
                            return false;
                        }


                        //차량그리드
                        var assignGrid = $("#assignGrid").data("kendoExtGrid");
                        var sltIdx = assignGrid.select().index();
                        var data = assignGrid.dataSource.view();
                        var sltVal = data[sltIdx];
                        var saveExcpData;
                        if($("#reqStatCd").val() == "" && sltIdx != -1){
                            saveExcpData = {
                                    contractNo:selectVal.contractNo
                                    ,vinNo1:sltVal.vinNo1
                                    ,vinNo2:sltVal.vinNo2
                                    ,fceSaleReqReasonCd:$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value()
                                    ,rfidNo:$("#rfidNoH").val()
                                };
                        }else {
                            saveExcpData = {
                                    contractNo:selectVal.contractNo
                                    ,vinNo1:selectVal.contractVinNo1
                                    ,vinNo2:selectVal.contractVinNo2
                                    ,fceSaleReqReasonCd:$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value()
                                    ,rfidNo:$("#contractRfidNo").val()
                                };
                        }


                        $.ajax({
                            url:"<c:url value='/sal/dlv/vehicleDelivery/exceptionDelivery.do' />",
                            dataType:"json",
                            type:"POST",
                            contentType:"application/json",
                            data:JSON.stringify(saveExcpData),
                            error:function(jqXHR,status,error){
                                //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                            },
                            success:function(jqXHR, textStatus){
                                //강제판매출고 신청이 정상적으로 처리 되였습니다.
                                dms.notification.success("<spring:message code='sal.info.exceptionDeliverySuccessMsg' />");
                                $('#grid').data('kendoExtGrid').dataSource.page(1);
                                $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
                            }
                        });
                    }

                }
            }
        }
    });


    $("#btnDeliveryCancel").data("kendoButton").enable(false);



    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0913-175001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/vehicleDelivery/selectDeliveryMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sContractCustNo"] = $("#sContractCustNo").val();    // 고객번호
                        params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();   // 검색일자 - 시작일
                        params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();     // 검색일자 - 종료일
                        params["sVinNo"]      = $("#sVinNo").val();                 // VIN NO
                        params["sContractStatCd"] = $("#sContractStatCd").val();    // 인도상태(계약상태 공통코드:'20':미인도 '50':'인도')
                        params["sContractTp"] = $("#sContractTp").val();            // 계약상태

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"contractNo"
                    ,fields:{
                        contractNo  :{type:"string"}
                        ,contractStatCd:{type:"string"}
                        ,custNm    :{type:"string"}
                        ,contractDt:{type:"date"}
                        ,dlReqDt   :{type:"date"}
                        ,carlineNm :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,modelCd   :{type:"string"}
                        ,ocnNm     :{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,contractVinNo:{type:"string"}
                        ,deliveryVinNo:{type:"string"}
                        ,realDlDt  :{type:"date"}
                        ,cancDt    :{type:"date"}
                        ,contractRcptDt:{type:"date"}
                        ,approveYn:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:true
        ,height:482
        ,selectable:"row"
        ,change:function(e) {

            if(!e.sender.dataItem(e.sender.select()).isNew()){
                var selectedVal = this.dataItem(this.select());
                var contractNo = selectedVal.contractNo;

                if ( dms.string.isNotEmpty(contractNo) ) {
                    scanYn = false;
                    $("#rfidNo").val("");

                    if(selectedVal.contractStatCd != '50' && selectedVal.contractStatCd != '91'){
                        if(selectedVal.reqStatCd != null){
                            $("#btnRfidScan").data("kendoButton").enable(false);
                        }else {
                            $("#btnRfidScan").data("kendoButton").enable(true);
                        }
                    }



                    //고객정보
                    $("#custNo").val(selectedVal.custNo);                                                      //고객코드
                    $("#custNm").val(selectedVal.custNm);                                                      //고객명
                    $("#custTp").data("kendoExtDropDownList").value(selectedVal.custTp);                          //고객유형
                    $("#hpNo").val(selectedVal.hpNo);                                                          //전화번호
                    $("#mathDocTp").data("kendoExtDropDownList").value(selectedVal.mathDocTp);                    //신분증유형
                    $("#ssnCrnNo").val(selectedVal.ssnCrnNo);                                                  //신분증번호

                    //주문정보
                    $("#carlineCd").val(selectedVal.carlineNm);
                    $("#modelCd").val(selectedVal.modelNm);
                    $("#ocnCd").val(selectedVal.ocnNm);
                    $("#extColorCd").val(selectedVal.extColorNm);
                    $("#intColorCd").val(selectedVal.intColorNm);
                    $("#contractVinNo").val(selectedVal.contractVinNo);
                    $("#dstbChnCd").data("kendoExtDropDownList").value(selectedVal.dstbChnCd);                    //유통채널
                    $("#cancDt").data("kendoExtMaskedDatePicker").value(selectedVal.cancDt);
                    $("#cancReasonCd").data("kendoExtDropDownList").value(selectedVal.cancReasonCd);
                    $("#realDlDt").data("kendoExtMaskedDatePicker").value(selectedVal.realDlDt);
                    $("#contractRfidNo").val(selectedVal.rfidNo);

                    //차량정보
                    $("#contractRcptNo").val(selectedVal.contractRcptNo);                                      //영수증번호
                    $("#contractRcptAmt").val(selectedVal.contractRcptAmt);                                    //영수증금액
                    $("#contractRcptDt").data("kendoExtMaskedDatePicker").value(selectedVal.contractRcptDt);   //영수증일자
                    $("#tecId").data("kendoExtDropDownList").value(selectedVal.tecId);                            //고객명(?) /서비스고문
                    $("#contractRcptId").val(selectedVal.contractRcptId);                                      //영수증번호


                    carlineCd = selectedVal.carlineCd;
                    modelCd = selectedVal.modelCd;
                    ocnCd = selectedVal.ocnCd;
                    extColorCd = selectedVal.extColorCd;
                    intColorCd = selectedVal.intColorCd;

                    $("#rfidNoH").val(selectedVal.deliveryRfidNo);
                    if(selectedVal.reqStatCd != null){
                        $("#vinNo").val(selectedVal.deliveryVinNo);
                    }else {
                        $("#vinNo").val("");
                    }
                    $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value(selectedVal.fceSaleReqReasonCd);
                    $("#reqStatCd").data("kendoExtDropDownList").value(selectedVal.reqStatCd);
                    $("#fileDocNo").val(selectedVal.fileDocNo);

                    if(selectedVal.reqStatCd == 'R'){
                        $("#btnFileUpload").data("kendoButton").enable(true);
                    }else {
                        $("#btnFileUpload").data("kendoButton").enable(false);
                    }

                    if(selectedVal.approveYn == 'R'){
                        $("#btnDeliveryCancel").data("kendoButton").enable(false);
                    }else {
                        $("#btnDeliveryCancel").data("kendoButton").enable(true);
                    }


                    if((selectedVal.contractStatCd == '20' && $("#reqStatCd").val() != "" ) || selectedVal.contractStatCd == '50' || selectedVal.contractStatCd == '91'){
                        $("#dstbChnCd").data("kendoExtDropDownList").enable(false);                                //유통채널
                        //$("#realDlDt").data("kendoExtMaskedDatePicker").enable(false);
                        $("#tecId").data("kendoExtDropDownList").enable(false);
                        $("#contractRcptNo").prop("disabled","disabled").addClass("form_disabled");
                        $("#contractRcptAmt").prop("disabled","disabled").addClass("form_disabled");
                        $("#contractRcptDt").data("kendoExtMaskedDatePicker").enable(false);
                        $("#fceSaleReqReasonCd").data("kendoExtDropDownList").enable(false);
                        $("#btnExceptionDlv").data("kendoButton").enable(false);
                        //$("#btnFileUpload").data("kendoButton").enable(false);

                        $("#cancDt").data("kendoExtMaskedDatePicker").value("");
                        $("#cancReasonCd").data("kendoExtDropDownList").value("");
                        //$("#cancDt").data("kendoExtMaskedDatePicker").enable(true);
                        $("#cancReasonCd").data("kendoExtDropDownList").enable(true);

                        $('#assignGrid').data('kendoExtGrid').dataSource.data([]);


                        if(selectedVal.contractStatCd == '91'){
                            $("#cancDt").data("kendoExtMaskedDatePicker").value(selectedVal.cancDt);
                            $("#cancReasonCd").data("kendoExtDropDownList").value(selectedVal.cancReasonCd);
                            //$("#cancDt").data("kendoExtMaskedDatePicker").enable(false);
                            $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
                        }else if(selectedVal.contractStatCd == '20' && $("#reqStatCd").val() != ""){
                            $("#dstbChnCd").data("kendoExtDropDownList").enable(true);                                //유통채널
                            //$("#realDlDt").data("kendoExtMaskedDatePicker").enable(true);
                            $("#tecId").data("kendoExtDropDownList").enable(true);
                            $("#fceSaleReqReasonCd").data("kendoExtDropDownList").enable(false);
                            //$("#cancDt").data("kendoExtMaskedDatePicker").enable(false);
                            $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
                            $("#realDlDt").data("kendoExtMaskedDatePicker").value(toDay);

                            $('#assignGrid').data('kendoExtGrid').dataSource.page(1);
                        }else {
                            $("#cancDt").data("kendoExtMaskedDatePicker").value(toDay);
                            $("#cancReasonCd").data("kendoExtDropDownList").value("");
                            //$("#cancDt").data("kendoExtMaskedDatePicker").enable(true);
                            $("#cancReasonCd").data("kendoExtDropDownList").enable(true);
                        }

                    }else{
                        //$("#rfidNo").val("");
                        //$("#rfidNoH").val(selectedVal.deliveryRfidNo);
                        //$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");                                       //신청사유
                        //$("#reqStatCd").data("kendoExtDropDownList").value("");                                                //심사상태
                        $("#realDlDt").data("kendoExtMaskedDatePicker").value(toDay);
                        $("#dstbChnCd").data("kendoExtDropDownList").enable(true);                                             //유통경로
                        //$("#realDlDt").data("kendoExtMaskedDatePicker").enable(true);                                       //출고일자
                        $("#tecId").data("kendoExtDropDownList").enable(true);                                                 //서비스고문
                        $("#contractRcptNo").prop("disabled","").removeClass("form_disabled");                              //영수증번호
                        $("#contractRcptAmt").prop("disabled","").removeClass("form_disabled");                             //영수금액
                        $("#contractRcptDt").data("kendoExtMaskedDatePicker").enable(true);                                 //영수증발행일자
                        $("#fceSaleReqReasonCd").data("kendoExtDropDownList").enable(true);                                    //신청사유
                        $("#btnExceptionDlv").data("kendoButton").enable(true);                                             //이상출고처리

                        //$("#cancDt").data("kendoExtMaskedDatePicker").enable(false);                                        //취소출고일자
                        $("#cancReasonCd").data("kendoExtDropDownList").enable(false);                                         //판매취소사유

                        $('#assignGrid').data('kendoExtGrid').dataSource.page(1);

                    }

                    getRetlTp("");

                }
            }

        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                    {field:"contractNo"     ,title:"<spring:message code = 'global.lbl.contractNo'/>"   ,width:105  ,attributes:{"class":"ac"}}         //계약번호
                    //,{field:"contractStatCd",title:"<spring:message code = 'global.lbl.contractStat'/>" ,width:80  ,attributes:{"class":"ac"}         //계약상태
                    //  ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"
                    // }
                    ,{field:"contractDt"    ,title:"<spring:message code = 'global.lbl.contractDate'/>" ,width:90  ,attributes:{"class":"ac"}          //계약일
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"contractVinNo" ,title:"<spring:message code = 'sal.lbl.assignVinNo'/>"        ,width:150  ,attributes:{"class":"al"}}      //임시배정VIN_NO
                    ,{field:"deliveryVinNo" ,title:"<spring:message code = 'sal.lbl.deliveryVinNo'/>"        ,width:150  ,attributes:{"class":"al"}}    //출고VIN_NO
                    ,{field:"realDlDt"      ,title:"<spring:message code = 'global.lbl.giDocRegDt'/>"   ,width:100  ,attributes:{"class":"ac"}          //출고일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"cancDt"      ,title:"<spring:message code = 'sal.lbl.releaseCancDt'/>"   ,width:80  ,attributes:{"class":"ac"}            //출고일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"reqStatCd",title:"<spring:message code = 'sal.lbl.exceptionDeliveyEval'/>" ,width:90  ,attributes:{"class":"ac"}           //이상출고심사 / 异常出库审批
                        ,template:"# if(reqStatCdMap[reqStatCd] != null) { # #= reqStatCdMap[reqStatCd].cmmCdNm# # }#"
                     }
                    ,{field:"approveYn",title:"<spring:message code = 'sal.lbl.deliveryCancEval'/>" ,width:90  ,attributes:{"class":"ac"}               //출고취소심사 /交车取消审批
                    ,template:"# if(reqStatCdMap[approveYn] != null) { # #= reqStatCdMap[approveYn].cmmCdNm# # }#"}
                ]
    });



    // 파일 그리드 시작
    $("#fileGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation == "read") {
                        var params = {};
                        params["sFileDocNo"] = $("#fileDocNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        fileDocNo:{type:"string"}
                        ,fileNo:{type:"number"}
                        ,fileNm:{type:"string"}
                        ,fileSize:{type:"number"}
                    }
                }
            }
        }
       ,autoBind:false
       ,editable:false
       ,height:200
       ,multiSelectWithCheckbox:true
       ,navigatable:false
       ,pageable:false
       ,resizable:false
       ,sortable:false
       ,filterable:false
       ,columns:[
           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}           // 파일명
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"al"}}       // 파일크기
          ,{title:"",width:50,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue'>下载</span>"
           }

       ]
    });
    // 파일 그리드 종료 //





    // 배정처리 그리드.
    $("#assignGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113330"
        ,dataSource:{
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

                        params["sCarlineCd"] = carlineCd;                     // 차종.
                        params["sModelCd"]   = modelCd;                       // 모델.
                        params["sOcnCd"]     = ocnCd;                         // OCN
                        params["sExtColorCd"]= extColorCd;                    // 외장색
                        params["sIntColorCd"]= intColorCd;                    // 내장색


                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        rnum      :{ type:"number"}
                       ,vinNo     :{ type:"string"}
                       ,allocQueNo:{ type:"string"}
                       ,assignVinNo:{ type:"string"}
                       ,carlineNm :{ type:"string"}
                       ,modelNm   :{ type:"string"}
                       ,ocnNm     :{ type:"string"}
                       ,extColorNm:{ type:"string"}
                       ,intColorNm:{ type:"string"}
                       ,ordTp     :{ type:"string"}
                       ,manufactYyMmDt:{ type:"string"}
                       ,grDt      :{ type:"date"}
                       ,rfidNo    :{ type:"string"}
                       ,lv2DlrSotckYn:{ type:"string"}
                    }
                }
            }
        }
        , sortable:false
        , resizable:true
        , autoBind:false
        , editable:false
        , height:158
        , change:function(e) {
            var grid = e.sender;
            var idx = grid.select().index();
            var selectRow = grid.dataItem(grid.select());
            if(idx != -1){

                scanYn = false;
                $("#rfidNo").val("");

                $("#rfidNoH").val(selectRow.rfidNo);
                $("#vinNo").val(selectRow.vinNo);

                //주문그리드
                var grid = $("#grid").data("kendoExtGrid");
                var selectIdx = grid.select().index();
                var data = grid.dataSource.view();
                var sltVal = data[selectIdx];



                if(sltVal.deliveryVinNo != $("#vinNo").val()){
                    $("#rfidNoH").val(selectRow.rfidNo);
                    $("#vinNo").val(selectRow.vinNo);
                    $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");
                    $("#reqStatCd").data("kendoExtDropDownList").value("");

                    $("#btnExceptionDlv").data("kendoButton").enable(true);                                             //이상출고처리
                }else {
                    //$("#rfidNoH").val(sltVal.deliveryRfidNo);
                    //$("#vinNo").val(sltVal.deliveryVinNo);
                    $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value(sltVal.fceSaleReqReasonCd);
                    $("#reqStatCd").data("kendoExtDropDownList").value(sltVal.reqStatCd);
                    $("#btnExceptionDlv").data("kendoButton").enable(false);                                            //이상출고처리
                }

                if($("#reqStatCd").val() == 'R'){
                    $("#btnFileUpload").data("kendoButton").enable(true);
                }else {
                    $("#btnFileUpload").data("kendoButton").enable(false);
                }


                if($("#reqStatCd").val() == ''){
                    $("#fceSaleReqReasonCd").data("kendoExtDropDownList").enable(true);
                    $("#btnRfidScan").data("kendoButton").enable(true);
                }else {
                    $("#fceSaleReqReasonCd").data("kendoExtDropDownList").enable(false);
                    $("#btnRfidScan").data("kendoButton").enable(false);
                }

                getRetlTp("assignGrid");

            };
        }
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , filterable:false
        , columns:[ {field:"vinNo"     ,title:"<spring:message code = 'global.lbl.vinNum'/>", width:100 ,attributes:{"class":"ac"}}
                     ,{field:"carlineNm" ,title:"<spring:message code = 'global.lbl.carLine'/>", width:70, attributes:{"class":"al"}}               //차종
                     ,{field:"modelNm"   ,title:"<spring:message code = 'global.lbl.model'/>", width:100, attributes:{"class":"al"}}                //모델
                     ,{field:"ocnNm"     ,title:"<spring:message code = 'global.lbl.ocn'/>", width:100, attributes:{"class":"al"}}                  //OCN
                     ,{field:"extColorNm",title:"<spring:message code = 'global.lbl.extColor'/>", width:80, attributes:{"class":"al"}}              //외장색
                     ,{field:"intColorNm",title:"<spring:message code = 'global.lbl.intColor'/>", width:80, attributes:{"class":"al"}}
                     ,{field:"ordTp"     ,title:"<spring:message code = 'global.lbl.orderType'/>", width:70, attributes:{"class":"al"}
                         ,template:"# if(ordTpMap[ordTp] != null){# #= ordTpMap[ordTp].cmmCdNm# #}#"
                      }
                     ,{field:"manufactYyMmDt",title:"<spring:message code = 'global.lbl.creYm'/>", width:70, attributes:{"class":"al"}}
                     ,{field:"grDt",title:"<spring:message code = 'sal.lbl.grDt'/>", width:80, attributes:{"class":"al"}
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                      }
                     ,{field:"rfidNo",title:"RFID", width:100, attributes:{"class":"al"}}
                    ]
    });



    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                $(".custSearch").click();
            }
        }
    });

    // 고객조회
    //var custSearch = function() {
     $(".custSearch").click(function(){

         var custNm = $("#sContractCustNm").val();

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":true
                     , "closeYn":"Y"
                     , "custNm":custNm
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                 $("#sContractCustNo").val(data[0].custNo);
                                 $("#sContractCustNm").val(data[0].custNm);
                             }

                             //popupWindow.close();

                         }
                     }
                 }
             }
         })
     });


   //내용 초기화
     refresh = function(){

         var stepStat =  $("#sContractStatCd").val();

         if(stepStat == '20'){
             $("#btnDelivery").data("kendoButton").enable(true);
             $("#btnDeliveryCancel").data("kendoButton").enable(false);
             $("#btnRfidScan").data("kendoButton").enable(true);
             $("#btnRcptScan").data("kendoButton").enable(true);
             $('#grid').data('kendoExtGrid').dataSource.page(1);
             $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
         }else if(stepStat == '50'){
             $("#btnDelivery").data("kendoButton").enable(false);
             $("#btnDeliveryCancel").data("kendoButton").enable(true);
             $('#grid').data('kendoExtGrid').dataSource.page(1);
             $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
         }else {
             $("#btnDelivery").data("kendoButton").enable(false);
             $("#btnDeliveryCancel").data("kendoButton").enable(false);
             $("#btnExceptionDlv").data("kendoButton").enable(false);
             $("#btnRfidScan").data("kendoButton").enable(false);
             $("#btnRcptScan").data("kendoButton").enable(false);
             $('#grid').data('kendoExtGrid').dataSource.page(1);
             $('#assignGrid').data('kendoExtGrid').dataSource.data([]);
         }

         $("#custNo").val("");
         $("#custNm").val("");
         $("#custTp").data("kendoExtDropDownList").value("");
         $("#hpNo").val("");
         $("#mathDocTp").data("kendoExtDropDownList").value("");
         $("#ssnCrnNo").val("");
         $("#carlineCd").val("");
         $("#modelCd").val("");
         $("#ocnCd").val("");
         $("#extColorCd").val("");
         $("#intColorCd").val("");
         $("#contractVinNo").val("");
         $("#vinNo").val("");
         $("#cancDt").data("kendoExtMaskedDatePicker").value("");
         $("#cancReasonCd").data("kendoExtDropDownList").value("");
         $("#dstbChnCd").data("kendoExtDropDownList").value("");
         $("#realDlDt").data("kendoExtMaskedDatePicker").value(toDay);
         //$("#fileDocId").val("");
         $("#rfidNo").val("");
         $("#rfidNoH").val("");
         $("vinNo").val("");
         $("#reqStatCd").data("kendoExtDropDownList").value("");
         $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");
         $("#tecId").data("kendoExtDropDownList").value("");
         $("#contractRcptNo").val("");
         $("#contractRcptAmt").val("");
         $("#contractRcptDt").data("kendoExtMaskedDatePicker").value("");
         $("#contractRcptId").val("");
         $("#contractRetlTp").data("kendoExtDropDownList").value("");
         $("#deliveryRetlTp").data("kendoExtDropDownList").value("");

         $("#contractRfidNo").val("");

         //$("#cancDt").data("kendoExtMaskedDatePicker").enable(false);
         $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
         $("#dstbChnCd").data("kendoExtDropDownList").enable(true);
         //$("#realDlDt").data("kendoExtMaskedDatePicker").enable(true);
         $("#tecId").data("kendoExtDropDownList").enable(true);
         $("#contractRcptNo").prop("disabled","").removeClass("form_disabled");
         $("#contractRcptAmt").prop("disabled","").removeClass("form_disabled");
         $("#contractRcptDt").data("kendoExtMaskedDatePicker").enable(true);
         $("#btnExceptionDlv").data("kendoButton").enable(true);

         $('#fileGrid').data('kendoExtGrid').dataSource.data([]);
     }


     fnOnChange = function(id,vl){
         $("#sContractCustNo").val("");
     }



     //차량 RFID스캔 기능은 IE브라우저에서만 사용가능합니다.
     var msg = "<spring:message code='sal.info.vehicleRfidMustMsie' />";
     if(getBrowserType != "msie"){
         confirm(msg);
     }

});





//조회조건:시작일-종료일 날짜 비교
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



function fnFileUploadPopup(){
    var win = $("#fileViewWindow").data("kendoWindow");
    win.center();
    win.open();
    $('#fileGrid').data('kendoExtGrid').dataSource.read();
}




fnDetlGroupHeader = function(){
    var fileGrid = $('#fileGrid').data('kendoExtGrid');

    if(fileGrid._data.length == 0){

        //주문그리드
        var grid = $("#grid").data("kendoExtGrid");
        var selectIdx = grid.select().index();
        var data = grid.dataSource.view();
        var sltVal = data[selectIdx];

         var data = {"dlrCd":sltVal.dlrCd
                     ,"vinNo1":sltVal.vinNo1
                     ,"vinNo2":sltVal.vinNo2
                     ,"seq":sltVal.seq
                     ,"fileDocNo":""
                };

         $.ajax({
             url:"<c:url value='/sal/dlv/vehicleDelivery/updateAddFile.do' />",
             data:JSON.stringify(data),
             type:'POST',
             dataType:'json',
             contentType:'application/json',
             error:function(jqXHR,status,error){
                 dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
             },
             success:function(jqXHR, textStatus){
                 $("#fileDocNo").val("");
                 $("#fileViewWindow").data("kendoWindow").close();
                 $('#grid').data('kendoExtGrid').dataSource.read();
             }
         });

    }
}

//소매유형 가져오기
function getRetlTp(gb){
    var conSltVal;
    var dlvSltVal;

    if(gb == 'assignGrid'){
        var assignGrid = $("#assignGrid").data("kendoExtGrid");
        var sltIdx = assignGrid.select().index();
        var data = assignGrid.dataSource.view();
        dlvSltVal = data[sltIdx].ordTp;
    }else{
        var grid = $("#grid").data("kendoExtGrid");
        var sltIdx = grid.select().index();
        var data = grid.dataSource.view();
        conSltVal = data[sltIdx].contractOrdTp;
        dlvSltVal = data[sltIdx].deliveryOrdTp;

        if(conSltVal == 'AD' || conSltVal == 'AS' || conSltVal == 'N1'||  conSltVal == 'N8' || conSltVal == 'N9'){
            $("#contractRetlTp").data("kendoExtDropDownList").value("P1");
        }else if(conSltVal == 'C1'){
            $("#contractRetlTp").data("kendoExtDropDownList").value("D1");
        }else if(conSltVal == 'N5' || conSltVal == 'NS'){
            $("#contractRetlTp").data("kendoExtDropDownList").value("D2");
        }else if(conSltVal == 'N7' ){
            $("#contractRetlTp").data("kendoExtDropDownList").value("D3");
        }else if(conSltVal == 'C3' || conSltVal == 'N6'){
            $("#contractRetlTp").data("kendoExtDropDownList").value("D4");
        }else if(conSltVal == 'C4' ){
            $("#contractRetlTp").data("kendoExtDropDownList").value("F1");
        }else if(conSltVal == 'C6' || conSltVal == 'C9' || conSltVal == 'N3'|| conSltVal == 'NB'){
            $("#contractRetlTp").data("kendoExtDropDownList").value("F2");
        }else if(conSltVal == 'N4' ){
            $("#contractRetlTp").data("kendoExtDropDownList").value("F4");
        }else if(conSltVal == 'C2' || conSltVal == 'C7' || conSltVal == 'C8'|| conSltVal == 'N2'){
            $("#contractRetlTp").data("kendoExtDropDownList").value("F5");
        }else {
            $("#contractRetlTp").data("kendoExtDropDownList").value("P1");
        }

        if(conSltVal == '' || conSltVal == null){
            $("#contractRetlTp").data("kendoExtDropDownList").value("");
        }


        if(data[sltIdx].contractStatCd == '50'){
            if(dlvSltVal == 'AS'){
                $("#cancReasonCd").data("kendoExtDropDownList").value("CD");
                $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
            }else if(dlvSltVal == 'N8' || dlvSltVal == 'N9' || dlvSltVal == 'C1' || dlvSltVal == 'N5' || dlvSltVal == 'NS' || dlvSltVal == 'N7' ||
                dlvSltVal == 'C3' || dlvSltVal == 'N6' || dlvSltVal == 'C4'){
                $("#cancReasonCd").data("kendoExtDropDownList").value("CE");
                $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
            }else if(dlvSltVal == 'C6' || dlvSltVal == 'C9' || dlvSltVal == 'N4' || dlvSltVal == 'C2' || dlvSltVal == 'C8' ){
                $("#cancReasonCd").data("kendoExtDropDownList").value("CF");
                $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
            }else if(dlvSltVal == 'N3' || dlvSltVal == 'NB' || dlvSltVal == 'C7' || dlvSltVal == 'N2' ){
                $("#cancReasonCd").data("kendoExtDropDownList").value("CF");
                $("#cancReasonCd").data("kendoExtDropDownList").enable(false);
            }else{
                $("#cancReasonCd").data("kendoExtDropDownList").enable(true);
                $("#cancReasonCd").data("kendoExtDropDownList").setDataSource(cncRsCdDs);
            }
        }

    }


    if(dlvSltVal == 'AD' || dlvSltVal == 'AS' || dlvSltVal == 'N1'||  dlvSltVal == 'N8' || dlvSltVal == 'N9'){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("P1");
    }else if(dlvSltVal == 'C1'){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("D1");
    }else if(dlvSltVal == 'N5' || dlvSltVal == 'NS'){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("D2");
    }else if(dlvSltVal == 'N7' ){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("D3");
    }else if(dlvSltVal == 'C3' || dlvSltVal == 'N6'){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("D4");
    }else if(dlvSltVal == 'C4' ){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("F1");
    }else if(dlvSltVal == 'C6' || dlvSltVal == 'C9' || dlvSltVal == 'N3'|| dlvSltVal == 'NB'){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("F2");
    }else if(dlvSltVal == 'N4' ){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("F4");
    }else if(dlvSltVal == 'C2' || dlvSltVal == 'C7' || dlvSltVal == 'C8'|| dlvSltVal == 'N2'){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("F5");
    }else {
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("P1");
    }

    if(dlvSltVal == '' || dlvSltVal == null){
        $("#deliveryRetlTp").data("kendoExtDropDownList").value("");
    }



}




 /* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize:1 * 1024 * 1024
     ,simultaneousUploads:4
     ,testChunks:true
     ,throttleProgressCallbacks:1
     ,method:"octet"
     //,maxFiles:1
 });
 r.assignBrowse($('#fileSelect')[0]);

 //파일추가 이벤트
 r.on('fileAdded', function(file) {

     $("#progressWindow").kendoWindow({
         width:"600px"
         ,height:"300px"
         ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
         ,animation:false
         ,draggable:false
         ,visible:false
         ,resizable:false
         ,modal:true
     }).data("kendoWindow").center().open();


     $('.resumable-progress, .resumable-list').show();
     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();

     //파일목록 출력
     $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

     //업로드 시작
     r.upload();

 });
 r.on('pause', function() {
     $('.resumable-progress .progress-resume-link').show();
     $('.resumable-progress .progress-pause-link').hide();
 });
 r.on('uploadStart', function() {

     var _that = this;

     if (_that.opt["query"] == null) {
          _that.opt["query"] = {};
     }

     if (dms.string.isEmpty($("#exceptionFileDocNo").val())) {
         $.ajax({
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#exceptionFileDocNo").val(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#exceptionFileDocNo").val();
     }

     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();
 });
 r.on('complete', function() {

     var _that = this;

     $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

     //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");


 });
 r.on('fileSuccess', function(file, message) {
     //console.log("===============");
     ///console.log(message);

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo:result.fileDocNo
             ,fileNo:result.fileNo
             ,fileNm:result.fileNm
             ,fileSize:dms.string.formatFileSize(result.fileSize)
         });
         //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');

         $("#fileDocNo").val(result.fileDocNo);

         if (!dms.string.isEmpty($("#fileDocNo").val())) {

             //주문그리드
             var grid = $("#grid").data("kendoExtGrid");
             var selectIdx = grid.select().index();
             var data = grid.dataSource.view();
             var sltVal = data[selectIdx];

              var data = {"dlrCd":sltVal.dlrCd
                          ,"vinNo1":sltVal.vinNo1
                          ,"vinNo2":sltVal.vinNo2
                          ,"seq":sltVal.seq
                          ,"fileDocNo":$("#fileDocNo").val()
                     };

              $.ajax({
                  url:"<c:url value='/sal/dlv/vehicleDelivery/updateAddFile.do' />",
                  data:JSON.stringify(data),
                  type:'POST',
                  dataType:'json',
                  contentType:'application/json',
                  error:function(jqXHR,status,error){
                      dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                  },
                  success:function(jqXHR, textStatus){
                      //정상적으로 반영 되었습니다.
                      $('#grid').data('kendoExtGrid').dataSource.read();
                  }
              });
          }

     }
 });
 r.on('fileError', function(file, message) {
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
 });
 r.on('fileProgress', function(file) {
     var fileProgress = 0;

     if (file instanceof ResumableChunk) {
         fileProgress = file.fileObj.progress();
     } else {
         fileProgress = file.progress();
     }

     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
     $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
 });
 /* *************************************************************************
 **************************파일업로드3****************************************
 ***************************************************************************/



</script>
<!-- //script -->
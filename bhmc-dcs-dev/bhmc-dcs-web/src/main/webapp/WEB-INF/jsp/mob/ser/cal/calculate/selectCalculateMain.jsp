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
                <h2 id="content_list_title"><spring:message code='ser.menu.serCalcList' /> <spring:message code='global.title.list' /><!-- 정비정산현황 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDt" /><!-- 배정일 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.driver" /><!-- 운전자 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.assigner" /><!-- 배정자 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.assignStat" /><!-- 배정상태 --></span>

                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></span>

                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.serCalcList" /><spring:message code="global.title.searchCondition" /><!-- 정비정산현황 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCarRegNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sVinNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoDocNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- 위탁일자 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sRoFromDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sRoToDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
        </div>

    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
            </div>
            <div class="co_group">
            <div class="formarea" id="formarea">

                <input id="calcDocNo" type="hidden"/>

                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roTpNm" type="text" disabled="disabled"/></div>
                                <input id="roTp" type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.incReqNo" /><!-- 보험신청번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="incReqNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.origRorcptNo" /><!-- 원 RO번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="baseRoNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <%--
                        <tr>
                            <th scope="row"><spring:message code="ser.title.resvDocNo" /><!-- 예약번호--></th>
                            <td>
                                <div class="f_text f_disabled"><input id="resvDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.preInsNo" /><!-- 입고점검번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="diagDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        --%>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="custRemark" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <%--
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.CalcRemark" /><!-- 서비스정산비고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="calcRemark" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.serviceSuggestRemark" /><!-- 서비스건의비고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="opnRemark" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        --%>
                    </tbody>
                </table>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.campaign.detailInfo" /><!-- 상세정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">

                <ul class="sumlist">
                        <li>
                            <div class="sumtitle">
                                <h3><spring:message code="ser.lbl.lbrSubAmt" /><!--공임비소계  --></h3>
                                <span class="svalue" id="lbrSumAmt"></span>
                                <span class="st_open"></span>
                                <!-- <span class="st_open st_close"></span>-->

                            </div>
                            <div class="sumCont" style="display:">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="global.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="lbrCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="global.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="lbrDcAmt" class="sumitemValue"></span>
                                        <span id="lbrDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.pointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="lbrBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="lbrPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="lbrEtcDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--최종정산금액  --></span>
                                        <span id="lbrCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.parSubCamt" /><!--부품비소계  --></h3>
                                <span class="svalue" id="parSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="global.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="parCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="global.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="parDcAmt" class="sumitemValue"></span>
                                        <span id="parDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.pointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="parBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="parPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="parEtcDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--최종정산금액  --></span>
                                        <span id="parCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.etcSubAmt" /><!--기타비용소계  --></h3>
                                <span class="svalue" id="etcSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="global.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="etcCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="global.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="etcDcAmt" class="sumitemValue"></span>
                                        <span id="etcDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.pointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="etcBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="etcPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="etcOtherDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--최종정산금액  --></span>
                                        <span id="etcCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sumlistTotal">
                            <div class="sumtitle">
                                <h3><span class="ico_equal"></span><spring:message code="ser.lbl.serTotAmt" /><!--서비스총계  --></h3>
                                <span class="svalue" id="totSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="global.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="calcTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="global.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="dcTotAmt" class="sumitemValue"></span>
                                        <span id="dcTotRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.pointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="bmPointTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="pointTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="etcTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--최종정산금액  --></span>
                                        <span id="lastCalcTotAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="global.title.signInfo" /><!-- 결재정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:70%"><spring:message code="ser.lbl.calcNo" /><!-- 결재문서번호 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.payer" /><!-- 지불자--></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.payWay" /><!-- 지불유형--></span>
                            <span style="width:35%"><spring:message code="ser.lbl.payTerm" /><!-- 지불기한--></span>
                            <span style="width:30%"><spring:message code="ser.lbl.payMethod" /><!-- 지불방식--></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.arCd" /><!-- 발생금액--></span>
                            <span style="width:65%"><spring:message code="ser.lbl.outstdAmt" /><!-- 미수금액--></span>
                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.payBigo" /><!-- 비고--></span>
                        </div>
                <iframe id="subList1" name="subList1" border="1" frameborder="0" width="100%" height=""></iframe>
            </div>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드 --></span>
                            <span style="width:70%"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목--></span>

                            <span class="clboth" style="width:30%"><spring:message code="ser.lbl.lbrTp" /><!-- 정비유형 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.genericLbrPrice" /><!-- 일반공임단가 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.claimLbrPrice" /><!-- 클레임공임단가 --></span>

                            <span class="clboth" style="width:30%"><spring:message code="global.lbl.dcAmt" /><!-- 할인 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.lbrAmt" /><!-- 공임비소계 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.payTp" /><!-- 결제유형 --></span>

                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.payerNm" /><!-- 결제자 --></span>
                        </div>
                <iframe id="subList2" name="subList2" border="1" frameborder="0" width="100%" height=""></iframe>
            </div>
            </div>
            </div>


            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="global.lbl.part" /><!-- 부품정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
                            <span style="width:65%"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.qty" /> / <spring:message code="ser.lbl.unitCd" /><!-- 부품수량 / 단위 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.itemUntPrc" /><!-- 단가 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.itemAmt" /><!-- 금액 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.stockStat" /><!-- 재고상태 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.payTp" /><!-- 결제유형  --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.payerNm" /><!-- 결제자 --></span>
                        </div>
                <iframe id="subList3" name="subList3" border="1" frameborder="0" width="100%" height=""></iframe>
            </div>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="global.lbl.othDetail" /><!-- 기타사항 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div>
                <input id="rnum" type="text" class="f_text" placeholder="" disabled="disabled"/>
            </div>
            </div>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>

        </section>


    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",

    toDate,
    gCrud;

    var url;
    var listType;
    var calcParUrl = "<c:url value='/ser/cal/calculate/selectCalculateParts.do' />";
    var calcLbrUrl = "<c:url value='/ser/cal/calculate/selectCalculateLabors.do' />";
    var roParUrl = "<c:url value='/ser/ro/repairOrder/selectRepairOrderParts.do' />";
    var roLbrUrl = "<c:url value='/ser/ro/repairOrder/selectRepairOrderLabors.do' />";


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sCarRegNo").val("");
            break;
        case "search2Area" :
            $("#sVinNo").val("");
            break;
        case "search3Area" :
            $("#sRoDocNo").val("");
            break;
        case "search4Area" :
            $("#sRoFromDt").val("");
            $("#sRoToDt").val("");
            break;
        default :
            break;
    }
    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sCarRegNo = $("#sCarRegNo").val();
    var sVinNo = $("#sVinNo").val();
    var sRoDocNo = $("#sRoDocNo").val();
    var sRoFromDt = $("#sRoFromDt").val();
    var sRoToDt = $("#sRoToDt").val();

    if(sCarRegNo == "" && sVinNo == "" && sRoDocNo == "" && sRoFromDt == "" && sRoToDt == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();

        if(sCarRegNo == "") $("#search1Area").hide();
        else $("#search1Area").show();

        if(sVinNo == "") $("#search2Area").hide();
        else $("#search2Area").show();

        if(sRoDocNo == "") $("#search3Area").hide();
        else $("#search3Area").show();

        if(sRoFromDt == "" && sRoToDt) $("#search4Area").hide();
        else $("#search4Area").show();
    }
    setMainListHeight();
}


//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});


//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd;});


//RO상태 Array
var roStatCdList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });



//공통코드:정비유형(수리유형)
    var lbrTpCdList = [];
    <c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});




$(document).ready(function() {


    function initPage(){
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.serCalcList' />");<!-- 정비정산현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));
    var sRoFromDt = $("#sRoFromDt");
    var sRoToDt = $("#sRoToDt");
    if(sRoFromDt.val() != "" || sRoToDt.val() != "") $("#search4Area span[name='searchStr']").html(sRoFromDt.val() + " ~ <br/>" + sRoToDt.val());

    //$("#search4Area span[name='searchStr']").html($("#search4Area span[name='searchStr']").html()+"<br/>");
    setSearchBox();
    $("#mainList").attr("src", "<c:url value='/mob/ser/cal/calculate/selectCalculateList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sCarRegNo = $("#sCarRegNo");
            var sVinNo = $("#sVinNo");
            var sRoDocNo = $("#sRoDocNo");
            var sRoFromDt = $("#sRoFromDt");
            var sRoToDt = $("#sRoToDt");

            if(sCarRegNo.val() != "") $("#search1Area span[name='searchStr']").text(sCarRegNo.val());
            if(sVinNo.val() != "") $("#search2Area span[name='searchStr']").text(sVinNo.val());
            if(sRoDocNo.val() != "") $("#search3Area span[name='searchStr']").text(sRoDocNo.val());
            //if(sRoFromDt.val() != "" || sRoToDt.val() != "") $("#search4Area span[name='searchStr']").text(sRoFromDt.val() + " ~<br/>" + sRoToDt.val());
            if(sRoFromDt.val() != "" || sRoToDt.val() != "") $("#search4Area span[name='searchStr']").html(sRoFromDt.val() + " ~<br/>" + sRoToDt.val());


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






     // 결제유형
     paymTpCdGrid = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             returnVal = paymTpCdArr[val].cmmCdNm;
         }
         return returnVal;
     }

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
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");

    $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));

}

//상세페이지 보기
function contentDetail(key) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");


    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/mob/ser/cal/calculate/selectCalculateExistByKey.do' />"
            ,data:JSON.stringify({sRoDocNo:key})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result){
                if(result){
                    listType = "CA";
                    url = "<c:url value='/mob/ser/cal/calculate/selectCalculateByKey.do' />";
                } else {
                    listType = "RO";
                    url = "<c:url value='/mob/ser/ro/repairOrder/selectRepairOrderByKey.do' />";
                }

                $.ajax({
                    url:url
                    ,data:JSON.stringify({sRoDocNo:key})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        if(result != null){

                            //getCustInfo(result);    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                            calcInfoSet(result, listType);
                        }
                    }
                });
            }
        });
    }


    /*
    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/mob/ser/cal/calculate/selectCalculateByKey.do' />",
            data:JSON.stringify({ sRoDocNo:key }),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                //alert(error);
            }
        }).done(function(result) {
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            console.log('result:', result);
            console.log('Hash:', partsJs.validate.formJs.Hash);
            partsJs.validate.groupObjAllDataSet(result);
        });
    }
    */


    /*
    if(dataItem != null){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataSet(dataItem);

        $("#leadSrcCd").data("kendoExtDropDownList").value(dataItem.leadSrcCd); // 리드출처1
        $("#leadSrcDtl").data("kendoExtDropDownList").value(dataItem.leadSrcDtl); // 리드출처2

        $("#statCd").data("kendoExtDropDownList").value(dataItem.statCd); // 상태


        if(dataItem.leadNo != null && dataItem.leadNo != 'undefined'){

            // 관심차종 목록 조회
            $("#subList1").attr("src", "<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoSub1List.do' />");

            // 메시지이력 목록 조회
            $("#subList2").attr("src", "<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoSub2List.do' />");

        }

    }
    */




}



//정산정보 셋팅
calcInfoSet = function(result, listType){
    $("#roDocNo").val(result.roDocNo);
    $("#calcDocNo").val(result.calcDocNo);
    $("#rcvDocNo").val(result.rcvDocNo);
    $("#roTpNm").val(roTpCdGrid(result.roTp));
    $("#roTp").val(result.roTp);

    /*
    $("#lbrCalcAmt").text(0);
    $("#lbrDcRate").text(0);
    $("#lbrDcAmt").text(0);
    $("#lbrBmPointUseAmt").text(0);
    $("#lbrPointUseAmt").text(0);
    $("#lbrEtcDcAmt").text(0);
    $("#lbrCalcSumAmt").text(0);

    $("#parCalcAmt").text(0);
    $("#parDcRate").text(0);
    $("#parDcAmt").text(0);
    $("#parBmPointUseAmt").text(0);
    $("#parPointUseAmt").text(0);
    $("#parEtcDcAmt").text(0);
    $("#parCalcSumAmt").text(0);

    $("#etcCalcAmt").text(0);
    $("#etcDcRate").text(0);
    $("#etcDcAmt").text(0);
    $("#etcBmPointUseAmt").text(0);
    $("#etcPointUseAmt").text(0);
    $("#etcOtherDcAmt").text(0);
    $("#etcCalcSumAmt").text(0);

    $("#calcTotAmt").text(0);
    $("#dcTotRate").text(0);
    $("#dcTotAmt").text(0);
    $("#bmPointTotAmt").text(0);
    $("#pointTotAmt").text(0);
    $("#etcTotAmt").text(0);
    $("#lastCalcTotAmt").text(0);
    */

    $("#lbrCalcAmt").text(result.lbrCalcAmt);
    $("#lbrDcRate").text("("+result.lbrDcRate+"%)");
    $("#lbrDcAmt").text(result.lbrDcAmt);
    $("#lbrBmPointUseAmt").text(result.lbrBmPointUseAmt);
    $("#lbrPointUseAmt").text(result.lbrPointUseAmt);
    $("#lbrEtcDcAmt").text(result.lbrEtcDcAmt);
    $("#lbrCalcSumAmt").text(result.lbrCalcSumAmt);
    $("#lbrSumAmt").text(result.lbrCalcSumAmt);

    $("#parCalcAmt").text(result.parCalcAmt);
    $("#parDcRate").text("("+result.parDcRate+"%)");
    $("#parDcAmt").text(result.parDcAmt);
    $("#parBmPointUseAmt").text(result.parBmPointUseAmt);
    $("#parPointUseAmt").text(result.parPointUseAmt);
    $("#parEtcDcAmt").text(result.parEtcDcAmt);
    $("#parCalcSumAmt").text(result.parCalcSumAmt);
    $("#parSumAmt").text(result.parCalcSumAmt);

    $("#etcCalcAmt").text(result.etcCalcAmt);
    $("#etcDcRate").text("("+result.etcDcRate+"%)");
    $("#etcDcAmt").text(result.etcDcAmt);
    $("#etcBmPointUseAmt").text(result.etcBmPointUseAmt);
    $("#etcPointUseAmt").text(result.etcPointUseAmt);
    $("#etcOtherDcAmt").text(result.etcOtherDcAmt);
    $("#etcCalcSumAmt").text(result.etcCalcSumAmt);
    $("#etcSumAmt").text(result.etcCalcSumAmt);

    $("#calcTotAmt").text(result.calcTotAmt);
    $("#dcTotRate").text("("+result.dcTotRate+"%)");
    $("#dcTotAmt").text(result.dcTotAmt);
    $("#bmPointTotAmt").text(result.bmPointTotAmt);
    $("#pointTotAmt").text(result.pointTotAmt);
    $("#etcTotAmt").text(result.etcTotAmt);
    $("#lastCalcTotAmt").text(result.lastCalcTotAmt);
    $("#totSumAmt").text(result.lastCalcTotAmt);

    $("#roGrpNo").val(result.roGrpNo);
    $("#resvDocNo").val(result.resvDocNo);
    $("#diagDocNo").val(result.diagDocNo);
    $("#custRemark").val(result.custRemark);



    /*
    var partsGrid = $("#partsGrid").data("kendoExtGrid");
    var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
    var calcGrid = $("#calcGrid").data("kendoExtGrid");

    if(listType == "CA"){
        partsGrid.dataSource.transport.options.read.url = calcParUrl;
        lbrGrid.dataSource.transport.options.read.url = calcLbrUrl;
    } else if(listType == "RO") {
        partsGrid.dataSource.transport.options.read.url = roParUrl;
        lbrGrid.dataSource.transport.options.read.url = roLbrUrl;
    }

    partsGrid.dataSource.read();
    lbrGrid.dataSource.read();
    calcGrid.dataSource.read();
    */

    $("#subList1").attr("src", "<c:url value='/mob/ser/cal/calculate/selectCalculateSubList1.do' />");

    if(result.calcDocNo != null && result.calcDocNo != 'undefined'){
        // 결재정보 목록 조회
        $("#subList2").attr("src", "<c:url value='/mob/ser/cal/calculate/selectCalculateSubList2.do' />");
        // 부품정보 목록 조회
        $("#subList3").attr("src", "<c:url value='/mob/ser/cal/calculate/selectCalculateSubList3.do' />");
    }
}



//RO유형
roTpCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = roTpCdArr[val].cmmCdNm;
     }
     return returnVal;
 }

</script>
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
                <h2 id="content_list_title"><spring:message code="ser.menu.receiveList" /> <spring:message code="global.title.list" /><!-- 수납현황 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.driver" /><!-- 수리의뢰자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="ser.lbl.payer" /><!-- 지불자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search6Area">
                                <th scope="row"><span><spring:message code="ser.lbl.receiveStat" /><!-- 수납상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search7Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.driver" /><!-- 수리의뢰자 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.settlement" /><!-- 정비정산자 --></span>

                            <span style="width:35%"><spring:message code="ser.lbl.receiveStat" /><!-- 수납상태 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.calcConDt" /><!-- 정산확인시간 --></span>

                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.calcNo" /><!-- 결제문서번호 --></span>

                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.receiveList" /> <spring:message code="global.title.list" /> <spring:message code="global.title.searchCondition" /><!-- 수납현황 조회조건  --></h2>
        </div>
        <div class="formarea form2">
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
                        <th scope="row"><spring:message code="ser.lbl.driver" /><!-- 수리의뢰자 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sDriverNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoDocNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payer" /><!-- 지불자 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.receiveStat" /><!-- 수납상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRcvStatCd" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoTp" class="form_comboBox"/></div>
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
                <table  class="flist01 form2">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.calcNo" /><!-- 결제문서번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="rcvDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.settlement" /><!-- 정비정산자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="calcPrsnId" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roTp" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>

                        <!-- 추가 -->
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.gisuAmt" /><!-- 실수금액 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="rcvAmt" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.receiveDt" /><!-- 수납완료일자 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="rcvCpltDt" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.outstdAmt" /><!-- 미수금액 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="npayAmt" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.outstdAmtDt" /><!-- 미수금확인시간 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="npayChkDt" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.invoiceTp" /><!-- 세금영수증유형 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="rcptTp" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.invoiceNo" /><!-- 영수증번호 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="rcptNo" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.invoiceDt" /><!-- 영수증일자 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="rcptDt" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.receiveBigo" /><!-- 수납비고 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="rcvRemark" disabled="disabled"/></div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            </div>


            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.payInfo" /><!-- 지불정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="ser.lbl.payer" /><!-- 지불자--></span>
                            <span style="width:35%"><spring:message code="ser.lbl.receiveStat" /><!-- 수납상태 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.payWay" /><!-- 지불유형--></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.payTerm" /><!-- 지불기한--></span>
                            <span style="width:65%"><spring:message code="ser.lbl.payMethod" /><!-- 지불방식 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.finalCalcAmt" /><!-- 최종정산금액 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.arCd" /><!-- 발생금액 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.intAmt" /><!-- 절사금액 --></span>
                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.payBigo" /><!-- 정산비고--></span>
                        </div>
                <iframe id="subList1" name="subList1" border="1" frameborder="0" width="100%" height="200px"></iframe>
            </div>
            </div>
            </div>


            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.calcDetailInfo" /><!-- 전산상세정보 --></h2>
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
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.preDoUseAmt" /><!--예치금사용금액  --></span>
                                        <span id="" class="sumitemValue"></span>
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
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.preDoUseAmt" /><!--예치금사용금액  --></span>
                                        <span id="" class="sumitemValue"></span>
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
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.preDoUseAmt" /><!--예치금사용금액  --></span>
                                        <span id="" class="sumitemValue"></span>
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
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.preDoUseAmt" /><!--예치금사용금액  --></span>
                                        <span id="" class="sumitemValue"></span>
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
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>


    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var sysDate = "${sysDate}"

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


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sCarRegNo").val("");
            break;
        case "search2Area" :
            $("#sDriverNm").val("");
            break;
        case "search3Area" :
            $("#sRoDocNo").val("");
            break;
        case "search4Area" :
            //$("").val("");
            break;
        case "search5Area" :
            $("#sVinNo").val("");
            break;
        case "search6Area" :
            $("#sRcvStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search7Area" :
            $("#sRoTp").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }
    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var search1 = $("#sCarRegNo").val();
    var search2 = $("#sDriverNm").val();
    var search3 = $("#sRoDocNo").val();
    //var search4 = $("#").val();
    var search5 = $("#sVinNo").val();
    var search6 = $("#sRcvStatCd").data("kendoExtDropDownList").value();
    var search7 = $("#sRoTp").data("kendoExtDropDownList").value();

    //if(search1 == "" && search2 == "" && search3 == "" && search4 == "" && search5 == "" && search6 =="" && search7 == ""){
    if(search1 == "" && search2 == "" && search3 == "" && search5 == "" && search6 =="" && search7 == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();

        $("#search4Area").hide(); // 임시

        if(search1 == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(search2 == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(search3 == "") $("#search3Area").hide();
        else $("#search3Area").show();
        //if(search4 == "") $("#search4Area").hide();
        //else $("#search4Area").show();
        if(search5 == "") $("#search5Area").hide();
        else $("#search5Area").show();
        if(search6 == "") $("#search6Area").hide();
        else $("#search6Area").show();
        if(search7 == "") $("#search7Area").hide();
        else $("#search7Area").show();

    }
    setMainListHeight();

}


//공통코드:수납상태
//var receiveCdList = [{"cmmCd":"", "cmmCdNm":""}];
var receiveCdList = [];
<c:forEach var="obj" items="${receiveCdList}">
receiveCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//수납상태 map
var receiveCdMap = dms.data.arrayToMap(receiveCdList, function(obj){return obj.cmmCd});


//RO유형 Array
 //var roTpCdList = [{"cmmCd":"", "cmmCdNm":""}];
 var roTpCdList = [];
 <c:forEach var="obj" items="${roTpCdList}">
 roTpCdList.push({
     "cmmCd":"${obj.cmmCd}"
     , "cmmCdNm":"${obj.cmmCdNm}"
 });
 </c:forEach>

 //RO유형 Map
 var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });


//공통코드:결제유형
 var paymTpCdList = [];
 <c:forEach var="obj" items="${paymTpCdList}">
 paymTpCdList.push({
     "cmmCd":"${obj.cmmCd}"
     , "cmmCdNm":"${obj.cmmCdNm}"
 });
 </c:forEach>
 var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});


$(document).ready(function() {


    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
     });

    $("#sRcvStatCd").kendoExtDropDownList({
        dataSource:receiveCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });



    function initPage(){
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.receiveList' />");<!-- 수납현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    setSearchBox();
    $("#mainList").attr("src", "<c:url value='/mob/ser/rcv/serviceReceive/selectServiceReceiveList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var search1 = $("#sCarRegNo");
            var search2 = $("#sDriverNm");
            var search3 = $("#sRoDocNo");
            //var search4 = $("#");
            var search5 = $("#sVinNo");
            var search6 = $("#sRcvStatCd").data("kendoExtDropDownList");
            var search7 = $("#sRoTp").data("kendoExtDropDownList");

            if(search1.val() != "") $("#search1Area span[name='searchStr']").text(search1.val());
            if(search2.val() != "") $("#search2Area span[name='searchStr']").text(search2.val());
            if(search3.val() != "") $("#search3Area span[name='searchStr']").text(search3.val());
            //if(search4.val() != "") $("#search4Area span[name='searchStr']").text(search4.val());
            if(search5.val() != "") $("#search5Area span[name='searchStr']").text(search5.val());
            if(search6.value() != "") $("#search6Area span[name='searchStr']").text(search6.text());
            if(search7.value() != "") $("#search7Area span[name='searchStr']").text(search7.text());

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
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
}

//상세페이지 보기
//function contentDetail(key) {
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if( dataItem != null && dataItem != 'undefined'){

        $("#rcvDocNo").val(dataItem.rcvDocNo);
        $("#calcPrsnId").val(dataItem.calcPrsnId);
        $("#roDocNo").val(dataItem.roDocNo);
        $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);

        //$("#calcDocNo").html(dataItem.calcDocNo);
        //$("#roDocNo").html(dataItem.roDocNo);
        //$("#roTp").html(roTpCdMap[dataItem.roTp].cmmCdNm);

        $("#lbrCalcAmt").html(dataItem.lbrCalcAmt);
        $("#lbrDcRate").html("("+trimNull(dataItem.lbrDcRate)+"%)");
        $("#lbrDcAmt").html(dataItem.lbrDcAmt);
        $("#lbrBmPointUseAmt").html(dataItem.lbrBmPointUseAmt);
        $("#lbrPointUseAmt").html(dataItem.lbrPointUseAmt);
        $("#lbrEtcDcAmt").html(dataItem.lbrEtcDcAmt);
        $("#lbrSumAmt").text(dataItem.lbrCalcAmt);

        $("#parCalcAmt").html(dataItem.parCalcAmt);
        $("#parDcRate").html("("+trimNull(dataItem.parDcRate)+"%)");
        $("#parDcAmt").html(dataItem.parDcAmt);
        $("#parBmPointUseAmt").html(dataItem.parBmPointUseAmt);
        $("#parPointUseAmt").html(dataItem.parPointUseAmt);
        $("#parEtcDcAmt").html(dataItem.parEtcDcAmt);
        $("#parSumAmt").text(dataItem.parCalcAmt);

        $("#etcCalcAmt").html(dataItem.etcCalcAmt);
        $("#etcDcRate").html("("+trimNull(dataItem.etcDcRate)+"%)");
        $("#etcDcAmt").html(dataItem.etcDcAmt);
        $("#etcBmPointUseAmt").html(dataItem.etcBmPointUseAmt);
        $("#etcPointUseAmt").html(dataItem.etcPointUseAmt);
        $("#etcOtherDcAmt").html(dataItem.etcOtherDcAmt);
        $("#etcSumAmt").text(dataItem.etcCalcAmt);

        $("#calcTotAmt").html(dataItem.calcTotAmt);
        $("#dcTotRate").html("("+trimNull(dataItem.dcTotRate)+"%)");
        $("#dcTotAmt").html(dataItem.dcTotAmt);
        $("#bmPointTotAmt").html(dataItem.bmPointTotAmt);
        $("#pointTotAmt").html(dataItem.pointTotAmt);
        $("#etcTotAmt").html(dataItem.etcTotAmt);
        $("#totSumAmt").text(dataItem.calcTotAmt);

        //$("#rcvDocNo").val(dataItem.rcvDocNo);
        //$("#dlrCd").val(dataItem.dlrCd);

        //$("#rcptDt").html(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));
        //$("#rcvCpltDt").html(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));

        $("#rcptDt").val(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));
        $("#rcvCpltDt").val(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));

        if( dataItem.rcvDocNo != null && dataItem.rcvDocNo != 'undefined'){
            $("#subList1").attr("src", "<c:url value='/mob/ser/rcv/serviceReceive/selectServiceReceiveSubList1.do' />");
        }

    }

}

receiveCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = receiveCdMap[val].cmmCdNm;
    }
    return returnVal;
}


</script>
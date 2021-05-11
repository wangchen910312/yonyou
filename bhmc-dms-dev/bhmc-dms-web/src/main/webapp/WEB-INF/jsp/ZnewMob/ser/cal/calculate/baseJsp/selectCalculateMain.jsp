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
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/cal/calculate/listJsp/selectCalculateList.jsp" />

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="mob.ser.title.calcualateStatus" /> <spring:message code="global.title.searchCondition" /><!-- 정산현황 조회조건  --></h2>
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
                        <th scope="row"><spring:message code='global.lbl.calcNo' /><!-- 정산번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCalcDocNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                        <td>
                            <div class="f_text"><input id="sRoTp" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoFromDt" style="background-color:#ffffff; width:140px" class="" />
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoToDt" style="background-color:#ffffff; width:140px" class="" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sVinNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.calcWrtrNm" /><!-- 정산조작자 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sRegUsrNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.calcStat" /><!-- 서비스정산상태 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sCalcStatCd" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.calcDt" /><!-- 정산일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sCalcFromDt" style="background-color:#ffffff; width:140px" class="" />
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sCalcToDt" style="background-color:#ffffff; width:140px" class="" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div>
                <span id="btnInit" class="btnd1"><span class=""><spring:message code='global.btn.init' /><!-- 초기화 --></span></span>
            </div>
            <dms:access viewId="VIEW-D-12673" hasPermission="${dms:getPermissionMask('READ')}">
            <div>
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
            </div>
            </dms:access>
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

                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody id="defaultHtml"><!-- 여기에 디폴트 HTML --></tbody>
                    </table>
                    <div class="content_title">
                        <h2><spring:message code="global.btn.moreInfo" /></h2>
                        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                    </div>
                    <div class="co_view" style="display:none;">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody id="hiddenHtml"><!-- 여기에 HIDE HTML --></tbody>
                        </table>
                    </div>

                    <input id="sParUrl" type="hidden"/>
                    <input id="sLbrUrl" type="hidden"/>
                </div>
            </div>
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListCustomerDemand.jsp" /><!--고객요청사항-->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListLabors.jsp" /><!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListParts.jsp" /><!-- 부품수령 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListEtcIssues.jsp" /><!-- 기타사항 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="ser.lbl.calcCost" /><!-- 정산비용 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <ul class="sumlist">
                        <li>
                            <div class="sumtitle">
                                <h3><spring:message code="ser.lbl.calcLbrSubAmt" /><!--정산공임비소계  --></h3>
                                <span class="svalue" id="C_lbrSumAmt"></span>
                                <span class="st_open"></span>
                            </div>
                            <div class="sumCont" style="display:">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="C_lbrCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_lbrDcAmt" class="sumitemValue"></span>
                                        <span id="C_lbrDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_lbrBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_lbrBmCupnUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.dlrPointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_lbrPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_lbrEtcDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--정산금액  --></span>
                                        <span id="C_lbrCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.calcParSubCamt" /><!--정산부품비소계  --></h3>
                                <span class="svalue" id="C_parSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="C_parCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_parDcAmt" class="sumitemValue"></span>
                                        <span id="C_parDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_parBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_parBmCupnUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.dlrPointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_parPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_parEtcDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--정산금액  --></span>
                                        <span id="C_parCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.calcEtcSubAmt" /><!--정산기타비용소계  --></h3>
                                <span class="svalue" id="C_etcSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="C_etcCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_etcDcAmt" class="sumitemValue"></span>
                                        <span id="C_etcDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_etcBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_etcBmCupnUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.dlrPointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_etcPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_etcOtherDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--정산금액  --></span>
                                        <span id="C_etcCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sumlistTotal">
                            <div class="sumtitle">
                                <h3><span class="ico_equal"></span><spring:message code="ser.lbl.calcSerTotAmt" /><!--정산정비총비용  --></h3>
                                <span class="svalue" id="C_totSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.calcAmt" /><!--정산금액  --></span>
                                        <span id="C_calcTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_dcTotAmt" class="sumitemValue"></span>
                                        <span id="C_dcTotRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_bmPointTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_bmCupnTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.dlrPointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_pointTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_etcTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalCalcAmt" /><!--정산금액  --></span>
                                        <span id="C_lastCalcTotAmt" class="sumitemValue"></span>
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
</section>


<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var fromWhere="selectCalculateMain";
var _sRoDocNo="";

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


//공통코드:기타유형(수리유형)
var etcTpCdList = [];
<c:forEach var="obj" items="${etcTpCdList}">
etcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var etcTpCdArr = dms.data.arrayToMap(etcTpCdList, function(obj){return obj.cmmCd});


//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd});


//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});


//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd;});

//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
    <c:if test="${obj.remark1 eq 'calcStatCd'}">
        <c:if test="${obj.cmmCd eq '00' || obj.cmmCd eq '07' }">    // 정산완료(00), 정산취소(07)만 사용
            roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    </c:if>
</c:forEach>

//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });


//공통코드:정비유형(수리유형)
var lbrTpCdList = [];
<c:forEach var="obj" items="${lbrTpCdList}">
lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});


// 지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd;});


$(document).ready(function() {

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {

            $("#sCarRegNo").val("");
            $("#sCalcDocNo").val("");
            $("#sRoTp").data("kendoExtDropDownList").value("");
            $("#sRoFromDt").val("");
            $("#sRoToDt").val("");
            $("#sVinNo").val("");
            $("#sRegUsrNm").val("");
            $("#sCalcStatCd").data("kendoExtDropDownList").value("");
            $("#sCalcFromDt").val("");
            $("#sCalcToDt").val("");

            $("#sCalcFromDt").val(chgServerDate2Str(sevenDtBf));
            $("#sCalcToDt").val(chgServerDate2Str(toDt));

        }
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });

    // 정산상태
    $("#sCalcStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.title.calcualateStatus' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

     // 목록 조회
    $("#sCalcFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sCalcToDt").val(chgServerDate2Str(toDt));
    $("#mainList").attr("src", "<c:url value='/mob/ser/cal/calculate/selectCalculateList.do' />");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        initList();
        listData.read();
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

//상세페이지 보기
function contentDetail(data) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if( data != null && data != 'undefined'){
        mob.loading.show();
        $.ajax({
            url:"<c:url value='/ser/cal/calculate/selectCalculateByKey.do' />"
            ,data:JSON.stringify({sCalcDocNo:data.calcDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                mob.loading.hide();
            }
            ,success:function(result, textStatus){
                if(dms.string.strNvl(result.calcDocNo) == ""){
                    mob.notification.info("<spring:message code='ser.lbl.calc' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                    initCalcInfoSet();
                } else {
                    calcInfoSet(result, "CA");
                }
                mob.loading.hide();
            }
        });
    }

    setDetailData3(keyMapArr,data,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,data,"#hiddenHtml input[id]");// 안보이는 것

    $("#calcStatCd").val(roStatCdMap[data.calcStatCd].cmmCdNm);
    $("#runDistVal").val(commaZero(data.runDistVal));
    $("#carRunDistVal").val(commaZero(data.carRunDistVal));

    $("#regDt").val(chgDate2DateTimeStr(data.regDt));
    $("#calcPrintDt").val(chgDate2DateTimeStr(data.calcPrintDt));
    $("#calcDt").val(chgDate2DateTimeStr(data.calcDt));
    $("#roDt").val(chgDate2DateTimeStr(data.roDt));

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");

    _sRoDocNo=data.roDocNo;
    subListData.read();
    subListData2.read();
    subListData3.read();
    subListData4.read();
}


//정산정보 셋팅
calcInfoSet = function(result, listType){
    $("#C_lbrCalcAmt").text(result.lbrCalcAmt);
    /* $("#C_lbrDcRate").text("("+_dcRate+"%)"); */
    $("#C_lbrDcAmt").text(result.lbrDcAmt);
    $("#C_lbrBmPointUseAmt").text(result.lbrBmPointUseAmt);
    $("#C_lbrBmCupnUseAmt").text(result.lbrBmCupnUseAmt);
    $("#C_lbrPointUseAmt").text(result.lbrPointUseAmt);
    $("#C_lbrEtcDcAmt").text(result.lbrEtcDcAmt);
    $("#C_lbrCalcSumAmt").text(result.lbrCalcSumAmt);
    $("#C_lbrSumAmt").text(result.lbrCalcSumAmt);

    $("#C_parCalcAmt").text(result.parCalcAmt);

    $("#C_parDcRate").text("("+chgInt(result.parDcRate)+"%)");
    $("#C_parDcAmt").text(result.parDcAmt);
    $("#C_parBmPointUseAmt").text(result.parBmPointUseAmt);
    $("#C_parBmCupnUseAmt").text(result.parBmCupnUseAmt);
    $("#C_parPointUseAmt").text(result.parPointUseAmt);
    $("#C_parEtcDcAmt").text(result.parEtcDcAmt);
    $("#C_parCalcSumAmt").text(result.parCalcSumAmt);
    $("#C_parSumAmt").text(result.parCalcSumAmt);

    $("#C_etcCalcAmt").text(result.etcCalcAmt);
    $("#C_etcDcRate").text("("+chgInt(result.etcDcRate)+"%)");
    $("#C_etcDcAmt").text(result.etcDcAmt);
    $("#C_etcBmPointUseAmt").text(result.etcBmPointUseAmt);
    $("#C_etcBmCupnUseAmt").text(result.etcBmCupnUseAmt);
    $("#C_etcPointUseAmt").text(result.etcPointUseAmt);
    $("#C_etcOtherDcAmt").text(result.etcOtherDcAmt);
    $("#C_etcCalcSumAmt").text(result.etcCalcSumAmt);
    $("#C_etcSumAmt").text(result.etcCalcSumAmt);

    $("#C_calcTotAmt").text(result.calcTotAmt);
    $("#C_dcTotRate").text("("+chgInt(result.dcTotRate)+"%)");
    $("#C_dcTotAmt").text(result.dcTotAmt);
    $("#C_bmPointTotAmt").text(result.bmPointTotAmt);
    $("#C_bmCupnUseAmt").text(result.bmCupnUseAmt);
    $("#C_pointTotAmt").text(result.pointTotAmt);
    $("#C_etcTotAmt").text(result.etcTotAmt);
    $("#C_lastCalcTotAmt").text(result.lastCalcTotAmt);
    $("#C_totSumAmt").text(result.lastCalcTotAmt);
}

//정산정보 초기화
initCalcInfoSet = function(){
    $("#C_lbrCalcAmt").text("");
    $("#C_lbrDcRate").text("");
    $("#C_lbrDcAmt").text("");
    $("#C_lbrBmPointUseAmt").text("");
    $("#C_lbrPointUseAmt").text("");
    $("#C_lbrEtcDcAmt").text("");
    $("#C_lbrCalcSumAmt").text("");
    $("#C_lbrSumAmt").text("");

    $("#C_parCalcAmt").text("");
    $("#C_parDcRate").text("");
    $("#C_parDcAmt").text("");
    $("#C_parBmPointUseAmt").text("");
    $("#C_parPointUseAmt").text("");
    $("#C_parEtcDcAmt").text("");
    $("#C_parCalcSumAmt").text("");
    $("#C_parSumAmt").text("");

    $("#C_etcCalcAmt").text("");
    $("#C_etcDcRate").text("");
    $("#C_etcDcAmt").text("");
    $("#C_etcBmPointUseAmt").text("");
    $("#C_etcPointUseAmt").text("");
    $("#C_etcOtherDcAmt").text("");
    $("#C_etcCalcSumAmt").text("");
    $("#C_etcSumAmt").text("");

    $("#C_calcTotAmt").text("");
    $("#C_dcTotRate").text("");
    $("#C_dcTotAmt").text("");
    $("#C_bmPointTotAmt").text("");
    $("#C_pointTotAmt").text("");
    $("#C_etcTotAmt").text("");
    $("#C_lastCalcTotAmt").text("");
    $("#C_totSumAmt").text("");
}



//RO유형
roTpCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = roTpCdArr[val].cmmCdNm;
     }
     return returnVal;
 }

//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""},
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""},
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""},
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""},
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""},
               {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""},
               {temp:"h",key:"carRunDistVal",txt:"<spring:message code='ser.lbl.dlRunDistVal' />",type:""},

               {temp:"h",key:"calcStatCd",txt:"<spring:message code='ser.lbl.calcStat' />",type:""},
               {temp:"h",key:"calcDocNo",txt:"<spring:message code='ser.lbl.serCalcNo' />",type:""},
               {temp:"h",key:"regDt",txt:"<spring:message code='ser.lbl.serCalTime' />",type:""},
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.serCalMan' />",type:""},
               {temp:"h",key:"calcPrintDt",txt:"<spring:message code='ser.lbl.calcPrintDt' />",type:""},
               {temp:"h",key:"calcCancDt",txt:"<spring:message code='ser.lbl.calcCancelDt' />",type:""},
               {temp:"h",key:"calcCancNm",txt:"<spring:message code='ser.lbl.calcCancNm' />",type:""},
               {temp:"h",key:"calcCancReasonNm",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},

               {temp:"h",key:"calcDt",txt:"<spring:message code='ser.lbl.calcEndDt' />",type:""},
               {temp:"h",key:"calcCompUsrNm",txt:"<spring:message code='ser.lbl.calcCompNm' />",type:""},
               {temp:"h",key:"roDocNo",txt:"<spring:message code='ser.lbl.roDocNo' />",type:""},
               {temp:"h",key:"roTpNm",txt:"<spring:message code='ser.lbl.roTp' />",type:""},
               {temp:"h",key:"roDt",txt:"<spring:message code='ser.lbl.roDate' />",type:""},
               {temp:"h",key:"roUsrNm",txt:"<spring:message code='ser.lbl.roWrtrNm' />",type:""},
               {temp:"h",key:"paymYnNm",txt:"<spring:message code='crm.lbl.isPay' />",type:""},
               {temp:"h",key:"calcRemark",txt:"<spring:message code='ser.lbl.CalcRemark' />",type:""},

               {temp:"h",key:"lbrCalcSumAmt",txt:"<spring:message code='ser.lbl.lbrCalcAmt' />",type:""},
               {temp:"h",key:"parCalcSumAmt",txt:"<spring:message code='ser.lbl.parCalcAmt' />",type:""},
               {temp:"h",key:"etcCalcAmt",txt:"<spring:message code='ser.lbl.etcCalcAmt' />",type:""},
               {temp:"h",key:"lbrDcAmt",txt:"<spring:message code='ser.lbl.lbrCdDcAmt' />",type:""},
               {temp:"h",key:"parDcAmt",txt:"<spring:message code='ser.lbl.parDcAmt' />",type:""},
               {temp:"h",key:"pointTotAmt",txt:"<spring:message code='ser.lbl.dlrPointUseAmt' />",type:""},
               {temp:"h",key:"bmPointTotAmt",txt:"<spring:message code='ser.lbl.bmPointUseAmt' />",type:""},
               {temp:"h",key:"etcTotAmt",txt:"<spring:message code='ser.lbl.etcSaleAmt' />",type:""},

               {temp:"h",key:"calcTotAmt",txt:"<spring:message code='crm.lbl.calcLastAmt' />",type:""},//최종 정산 금액
               {temp:"h",key:"wonUnitCutAmt",txt:"<spring:message code='ser.lbl.interSettAmt' />",type:""},
               {temp:"h",key:"demicPointCutAmt",txt:"<spring:message code='ser.lbl.calcZeroAmt' />",type:""},
               {temp:"h",key:"paymAmt",txt:"<spring:message code='ser.lbl.arCd' />",type:""},//발생금액
               {temp:"h",key:"rcvAmt",txt:"<spring:message code='ser.lbl.gisuAmt' />",type:""},
               {temp:"h",key:"npayAmt",txt:"<spring:message code='ser.lbl.outstdAmt' />",type:""},
               {temp:"h",key:"carRunDistVal",txt:"<spring:message code='ser.lbl.realDrivDis' />",type:""}
               ]



</script>
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
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/rcv/serviceReceive/listJsp/selectServiceReceiveList.jsp"></c:import>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.receiveList" /> <spring:message code="global.title.searchCondition" /><!-- 수납현황 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoDocNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payer" /><!-- 지불자 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sPaymUsrNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.calcEndDt" /><!-- 정산완료시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRcvCpltFromDt" style="width:140px" class="" value="${oneMonthDtBf}"/>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRcvCpltToDt" style="width:140px" class="" value="${toDt}"/>
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
                        <th scope="row"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoTp" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payWay" /><!-- 지불유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sPaymTp" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.paidYn" /><!-- 청산완료여부 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sPaymYn" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.driver" /><!-- 수리의뢰자 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sCarOwnerNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payStat" /><!-- 지불상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRcvStatCd" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payTerm" /><!-- 지불기한 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sPaymPrid" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.calcCompNm" /><!-- 정산완료자 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCalcPrsnNm" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div>
                <span id="btnInit" class="btnd1"><span class=""><spring:message code='global.btn.init' /><!-- 초기화 --></span></span>
            </div>
            <dms:access viewId="VIEW-D-12675" hasPermission="${dms:getPermissionMask('READ')}">
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
           <!--  <input type="hidden" id="rcvDocNo" /> -->
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

                    <table  class="flist01 form2" style="display:none">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcNo" /><!-- 결제문서번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="calcDocNo" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.settlement" /><!-- 정비정산자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="calcPrsnNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="roDocNo" type="text" disabled="disabled"/></div>
                                    <input type="hidden" id="rcvSubDocNo">
                                </td>
                            </tr>

                            <!-- 추가 -->
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.finalCalcAmt" /><!-- 최종정산금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="calcAmt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.gisuAmt" /><!-- 실수금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="rcvAmt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.outstdAmt" /><!-- 미수금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="npayAmt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.arCd" /><!-- 수납금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="paymAmt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.invoiceTp" /><!-- 영수증유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="rcptTp" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.payBigo" /><!-- 지불비고 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="rcvRemark" disabled="disabled"/></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!--  지불정보 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/rcv/serviceReceive/listJsp/selectServiceReceiveDetailsHistList.jsp"></c:import>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

</section>


<script>
var sysDate = "${sysDate}";
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
    oneMonthDtBf           = "${oneMonthDtBf}",

    toDate,
    gCrud;


//공통코드:수납상태
var receiveCdList = [];
var receiveCdList2 = [];
<c:forEach var="obj" items="${receiveCdList}">
    <c:if test="${obj.remark1 ne 'N' }">
    receiveCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    receiveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수납상태 map
var receiveCdMap = dms.data.arrayToMap(receiveCdList, function(obj){return obj.cmmCd});

//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });


//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});

//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });


//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd});

//공통코드:청산완료여부
var paymYnList = [];
<c:forEach var="obj" items="${paymYnList}">
paymYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymYnListMap = dms.data.arrayToMap(paymYnList, function(obj){return obj.cmmCd;});

$(document).ready(function() {

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sCalcFromDt").val("");
            $("#sCalcToDt").val("");
            $("#sVinNo").val("");
            $("#sRoDocNo").val("");
            $("#sPaymUsrNm").val("");
            $("#sCarRegNo").val("");
            $("#sDriverNm").val("");
            $("#sPaymYn").data("kendoExtDropDownList").value("");
            $("#sPaymTp").data("kendoExtDropDownList").value("");
            $("#sRcvStatCd").data("kendoExtDropDownList").value("");
            $("#sCalcPrsnNm").val("");
            $("#sRoTp").data("kendoExtDropDownList").value("");
            $("#sPaymPrid").data("kendoExtDropDownList").value("");
            $("#sCarOwnerNm").val("");
            $("#sRcvCpltFromDt").val("${oneMonthDtBf}");
            $("#sRcvCpltToDt").val("${toDt}");

        }
    });

    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
     });


    // 지불유형
    $("#sPaymTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:paymTpCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });


    // 지불상태
    $("#sRcvStatCd").kendoExtDropDownList({
        dataSource:receiveCdList2
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    //지불기한
    $("#sPaymPrid").kendoExtDropDownList({
        dataSource:paymPridCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });

    //청산완료여부
    $("#sPaymYn").kendoExtDropDownList({
        dataSource:paymYnList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.receiveList' />");<!-- 수납현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    //setSearchBox();
    $("#sCalcFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sCalcToDt").val(chgServerDate2Str(toDt));

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        initList();
        listData.read();
    });

    /* $("#subList1Btn").bind("click", function()
    {
        if(!$(this).hasClass("co_close")){

        }
    }); */

});

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    if( dataItem != null && dataItem != 'undefined'){

        $("#calcDocNo").val(dataItem.calcDocNo);
        $("#calcPrsnNm").val(dataItem.calcPrsnNm);
        $("#roDocNo").val(dataItem.roDocNo);
        $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);

        $("#calcAmt").val(dms.format.currency(dataItem.calcAmt));
        $("#rcvAmt").val(dms.format.currency(dataItem.rcvAmt));
        $("#npayAmt").val(dms.format.currency(dataItem.npayAmt));
        $("#paymAmt").val(dms.format.currency(dataItem.paymAmt));
        $("#rcptTp").val(rcptTpCdGrid(dataItem.rcptTp));
        $("#paymRemark").val(dms.format.currency(dataItem.paymAmt));

        $("#lbrDcRate").html("("+trimNull(dataItem.lbrDcRate)+"%)");
        $("#lbrDcAmt").html(dataItem.lbrDcAmt);
        $("#lbrBmPointUseAmt").html(dataItem.lbrBmPointUseAmt);
        $("#lbrPointUseAmt").html(dataItem.lbrPointUseAmt);
        $("#lbrEtcDcAmt").html(dataItem.lbrEtcDcAmt);
        $("#lbrSumAmt").text(dataItem.lbrCalcAmt);
        $("#lbrCalcSumAmt").text(dataItem.lbrCalcAmt);

        $("#parCalcAmt").html(dataItem.parCalcAmt);
        $("#parDcRate").html("("+trimNull(dataItem.parDcRate)+"%)");
        $("#parDcAmt").html(dataItem.parDcAmt);
        $("#parBmPointUseAmt").html(dataItem.parBmPointUseAmt);
        $("#parPointUseAmt").html(dataItem.parPointUseAmt);
        $("#parEtcDcAmt").html(dataItem.parEtcDcAmt);
        $("#parSumAmt").text(dataItem.parCalcAmt);
        $("#parCalcSumAmt").text(dataItem.parCalcAmt);

        $("#etcCalcAmt").html(dataItem.etcCalcAmt);
        $("#etcDcRate").html("("+trimNull(dataItem.etcDcRate)+"%)");
        $("#etcDcAmt").html(dataItem.etcDcAmt);
        $("#etcBmPointUseAmt").html(dataItem.etcBmPointUseAmt);
        $("#etcPointUseAmt").html(dataItem.etcPointUseAmt);
        $("#etcOtherDcAmt").html(dataItem.etcOtherDcAmt);
        $("#etcSumAmt").text(dataItem.etcCalcAmt);
        $("#etcCalcSumAmt").text(dataItem.etcCalcAmt);

        $("#calcTotAmt").html(dataItem.calcTotAmt);
        $("#dcTotRate").html("("+trimNull(dataItem.dcTotRate)+"%)");
        $("#dcTotAmt").html(dataItem.dcTotAmt);
        $("#bmPointTotAmt").html(dataItem.bmPointTotAmt);
        $("#pointTotAmt").html(dataItem.pointTotAmt);
        $("#etcTotAmt").html(dataItem.etcTotAmt);
        $("#totSumAmt").text(dataItem.calcTotAmt);
        $("#lastCalcTotAmt").text(dataItem.calcTotAmt);

        $("#rcvDocNo").val(dataItem.rcvDocNo);

        $("#rcptDt").val(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));
        $("#rcvCpltDt").val(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));

        $("#npayChkDt").val(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));
        $("#rcvSubDocNo").val(dataItem.rcvSubDocNo);
        $("#paymPrid").val(paymPridCdArr[dataItem.paymPrid].cmmCdNm);
    }

    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것/

    if(dms.string.strNvl(dataItem.rcvStatCd) !=""){
        $("#rcvStatCd").val(receiveCdMap[dataItem.rcvStatCd].cmmCdNm);
    }
    if(dms.string.strNvl(dataItem.rcptTp) !=""){
        $("#rcptTp").val(rcptTpCdMap[dataItem.rcptTp].cmmCdNm);
    }
    if(dms.string.strNvl(dataItem.paymTp) !=""){
        $("#paymTp").val(paymTpCdArr[dataItem.paymTp].cmmCdNm);
    }

    $("#rcvSubDocNo").val(dataItem.rcvSubDocNo);
    if(dms.string.strNvl(dataItem.paymPrid) !="")$("#paymPrid").val(paymPridCdArr[dataItem.paymPrid].cmmCdNm);

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");
    subListData.read();
}

receiveCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = receiveCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rcptTpCdMap[val] != undefined)
        returnVal = rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""},
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""},
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""},
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""},
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""},

               {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:"strDist"},
               {temp:"h",key:"giRunDistVal",txt:"<spring:message code='ser.lbl.dlRunDistVal' />",type:"strDist"},
               {temp:"h",key:"rcvStatCd",txt:"<spring:message code='ser.lbl.payStat' />",type:""},
               {temp:"h",key:"roDocNo",txt:"<spring:message code='ser.lbl.roDocNo' />",type:""},
               {temp:"h",key:"roTpNm",txt:"<spring:message code='par.lbl.invResvWorkType' />",type:""},
               {temp:"h",key:"roDt",txt:"<spring:message code='ser.lbl.roDt' />",type:"strDate"},
               {temp:"h",key:"roRegUsrNm",txt:"<spring:message code='ser.lbl.roManNm' />",type:""},
               {temp:"h",key:"calcDt",txt:"<spring:message code='ser.lbl.calcEndDt' />",type:"strDate"},
               {temp:"h",key:"calcCompUsrNm",txt:"<spring:message code='ser.lbl.calcCompNm' />",type:""},
               {temp:"h",key:"paymTp",txt:"<spring:message code='ser.lbl.payWay' />",type:""},
               {temp:"h",key:"paymCd",txt:"<spring:message code='par.lbl.payerCd' />",type:""},
               {temp:"h",key:"paymUsrNm",txt:"<spring:message code='ser.lbl.payer' />",type:""},
               {temp:"h",key:"paymPrid",txt:"<spring:message code='ser.lbl.payTerm' />",type:""},
               {temp:"h",key:"calcAmt",txt:"<spring:message code='ser.lbl.finalCalcAmt' />",type:""},
               {temp:"h",key:"wonUnitCutAmt",txt:"<spring:message code='ser.lbl.interSettAmt' />",type:""},
               {temp:"h",key:"demicPointCutAmt",txt:"<spring:message code='ser.lbl.calcZeroAmt' />",type:""},
               {temp:"h",key:"paymAmt",txt:"<spring:message code='ser.lbl.arCd' />",type:""},
               {temp:"h",key:"rcvAmt",txt:"<spring:message code='ser.lbl.gisuAmt' />",type:""},
               {temp:"h",key:"npayAmt",txt:"<spring:message code='ser.lbl.outstdAmt' />",type:""},
               {temp:"h",key:"paymRemark",txt:"<spring:message code='ser.lbl.payBigo' />",type:""},
               {temp:"h",key:"paymMthCdNm",txt:"<spring:message code='ser.lbl.expcRcvPayMethod' />",type:""},
               {temp:"h",key:"rcptTpNm",txt:"<spring:message code='ser.lbl.expcInvoiceTp' />",type:""},
               {temp:"h",key:"rcvDocNo",txt:"<spring:message code='ser.lbl.rcvDocNo' />",type:""},
               {temp:"h",key:"paymYnNm",txt:"<spring:message code='ser.lbl.paidYn' />",type:""}
               ];
</script>
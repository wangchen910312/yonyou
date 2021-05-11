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
            <h2 id="content_list_title"><spring:message code="ser.menu.roStatus" /><!-- RO작업이력현황 --></h2>
        </div>
        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>

                <span style="width:50%"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.roWrtrNm" /><!-- RO발행자 --></span>

                <span style="width:50%"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.roStatus" /><!-- RO상태 --></span>

                <span style="width:50%"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.roStatus" /> <spring:message code="global.title.searchCondition" /><!-- ro현황 + 조회조건  --></h2>
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
                            <div class="f_text"><input id="sCarRegNo" type="text"  class="form_input" style="width:100%"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.roDocNo" /><!-- 정비위탁번호 --></th>
                        <td>
                            <div class="f_text"><input id="sRoDocNo" type="text"  class="form_input" style="width:100%"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.roTp' /></th><!-- RO유형 -->
                        <td>
                            <div class="f_text"><input type="text" id="sRoTp" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- Ro일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRoFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRoToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></th>
                        <td>
                            <div class="f_text"><input id="sVinNo" type="text"  class="form_input" style="width:100%"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /><!-- RO발행자 --></th>
                        <td>
                            <div class="f_text"><input id="sRegUsrNm" type="text"  class="form_input" style="width:100%"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.roStatus' /></th><!-- RO 상태 -->
                        <td>
                            <div class="f_text"><input type="text" id="sRoStatCd" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sExpcDlFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sExpcDlToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /></span></div>
            <dms:access viewId="VIEW-D-12657" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="ser.menu.roStatus" /> <spring:message code="ser.title.campaign.detailInfo" /><!-- RO작업 상세정보 --></h2>
            </div>
            <div class="co_group">
                <div class="formarea">
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
                </div>
            </div>
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListCustomerDemand.jsp" /><!--고객요청사항-->
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListLabors.jsp" /><!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListParts.jsp" /><!-- 부품수령 -->
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListEtcIssues.jsp" /><!-- 기타사항 -->
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>
</section>

<script>
var dlrCd = "${dlrCd}";
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

toDate = new Date();

var fromWhere="selectWorkHistoryMain";
var _sRoDocNo="";


//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//진행상태 Array
var progressStatList = [];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});


//공통코드:정비유형(수리유형)
var lbrTpCdList  = []; //기본 수리유형
var lbrTpCdList2 = []; //보증수리용 수리유형
var lbrTpCdList3 = []; //딜러 공임 전용 수리유형
var lbrTpCdList4 = []; //BHMC 공임 전용 수리유형
<c:forEach var="obj" items="${lbrTpCdList}">
    <c:if test="${obj.remark1 eq '02'}">
        lbrTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test="${obj.remark2 eq 'E'}">
        lbrTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    lbrTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});


//공통코드:부품수령상태
var partRcvCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${partRcvCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
    partRcvCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var partRcvCdMap = dms.data.arrayToMap(partRcvCdList, function(obj){return obj.cmmCd;});

$(document).ready(function() {

 // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
        ,index:0
    });

    // RO상태
    $("#sRoStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
        ,index:0
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
    }
    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.roStatus' />");<!-- RO작업이력 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

     // 목록 조회
    $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/workHistory/selectWorkHistoryList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            contentList();
        }
    });

    // 버튼 - 초기화
    $("#btnInit").click(function(){
        $("input").val("");
        $("#sRoStatCd").data("kendoExtDropDownList").value("");
        $("#sRoTp").data("kendoExtDropDownList").value("");

        $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
        $("#sRoToDt").val(chgServerDate2Str(toDt));
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

});

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
    setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
}

//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""}, //VIN
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""}, //차량소유자
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""}, //방문자
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""}, //차종명
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""}, //차관명
               {temp:"s",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""}, //사전점검주행거리
               {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.accuDrivDis' />",type:""},//누계주행거리
               {temp:"h",key:"roStatNm",txt:"<spring:message code='ser.lbl.roStatus' />",type:""},//RO상태
               {temp:"h",key:"roDocNo",txt:"<spring:message code='ser.lbl.roDocNo' />",type:""},//RO위탁번호
               {temp:"h",key:"roTpNm",txt:"<spring:message code='ser.lbl.roTp' />",type:""},// RO유형
               {temp:"h",key:"roDt",txt:"<spring:message code='ser.lbl.roDt' />",type:"strDate"},//정비위탁시간
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.roWrtrNm' />",type:""},//위탁인-
               {temp:"h",key:"roPrintDt",txt:"<spring:message code='ser.lbl.roPrintDt' />",type:"strDate"},//정비인쇄일자
               {temp:"h",key:"updtDt",txt:"<spring:message code='ser.lbl.roUpdtDt' />",type:"strDate"},//변경정비위탁시간
               {temp:"h",key:"updtUsrNm",txt:"<spring:message code='ser.lbl.roUpdtUsrNm' />",type:""},//변경정비위탁자
               {temp:"h",key:"roCancDt",txt:"<spring:message code='ser.lbl.roCancDt' />",type:"strDate"},//정비위탁취소시간
               {temp:"h",key:"roCancNm",txt:"<spring:message code='ser.lbl.roCancUsr' />",type:""},//정비위탁취소자
               {temp:"h",key:"cancReasonNm",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},//취소원인
               {temp:"h",key:"lbrAmt",txt:"<spring:message code='ser.lbl.preLbrSubAmt' />",type:"strAmt"},//예상공임비소계
               {temp:"h",key:"parAmt",txt:"<spring:message code='ser.lbl.preParSubAmt' />",type:"strAmt"},// 예상부품비소계
               {temp:"h",key:"etcAmt",txt:"<spring:message code='ser.lbl.preEtcSubAmt' />",type:"strAmt"},//예상기타비소계
               {temp:"h",key:"sumAmt",txt:"<spring:message code='ser.lbl.preTotAmt' />",type:""},//예상수리비합계
               {temp:"h",key:"expcDlDt",txt:"<spring:message code='ser.lbl.expcDlvDt' />",type:""},//예상인도시간
               {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.repairSerStat' />",type:""},//수리서비스상태
               {temp:"h",key:"atqProcTpNm",txt:"<spring:message code='ser.lbl.OldItemHandTp' />",type:""},//고품처리
               {temp:"h",key:"carWashTpNm",txt:"<spring:message code='ser.lbl.carWash' />",type:""},//세차
               {temp:"h",key:"custWaitMthNm",txt:"<spring:message code='ser.lbl.custStbyMth' />",type:""},//고객대기
               {temp:"h",key:"qtTestMthNm",txt:"<spring:message code='ser.lbl.qtTest' />",type:""},//품질검사
               {temp:"h",key:"goodwillYnNm",txt:"<spring:message code='ser.lbl.goodWillYn' />",type:""},//선의배상
               {temp:"h",key:"carDriveReqTpNm",txt:"<spring:message code='ser.lbl.tdrvReq' />",type:""},//시승
               {temp:"h",key:"roRemark",txt:"<spring:message code='ser.lbl.roRemark' />",type:""},//정비위탁비고
               {temp:"h",key:"dlrRoTpNm",txt:"<spring:message code='ser.lbl.dlrRoTp' />",type:""},//자체정의위탁유형
               {temp:"h",key:"diagDocNo",txt:"<spring:message code='ser.lbl.preInsNo' />",type:""},//사전점검번호
               {temp:"h",key:"incReqNo",txt:"<spring:message code='ser.lbl.incReqNo' />",type:""},//보험청구번호
               {temp:"h",key:"baseRoNo",txt:"<spring:message code='ser.lbl.origRorcptNo' />",type:""},//기존정비위탁번호
               {temp:"h",key:"calcDocNo",txt:"<spring:message code='ser.lbl.calcNo' />",type:""},//서비스정산번호
               {temp:"h",key:"calcRegDt",txt:"<spring:message code='ser.lbl.calcDt' />",type:"strDate"},//서비스정산시간
               {temp:"h",key:"calcPrsnNm",txt:"<spring:message code='ser.lbl.settlement' />",type:""},//서비스정산자
               {temp:"h",key:"calcDt",txt:"<spring:message code='ser.lbl.calcEndDt' />",type:"strDate"},//정산완료시간
               {temp:"h",key:"calcLbrAmt",txt:"<spring:message code='ser.lbl.lbrCalcAmt' />",type:"strAmt"},//정산공임금액
               {temp:"h",key:"calcParAmt",txt:"<spring:message code='ser.lbl.parCalcAmt' />",type:"strAmt"},//정산부품금액
               {temp:"h",key:"calcEtcAmt",txt:"<spring:message code='ser.lbl.etcCalcAmt' />",type:"strAmt"},//정산기타금액
               {temp:"h",key:"lbrDcAmt",txt:"<spring:message code='ser.lbl.lbrCdDcAmt' />",type:"strAmt"},//공임할인금액
               {temp:"h",key:"parDcAmt",txt:"<spring:message code='ser.lbl.parDcAmt' />",type:"strAmt"},//부품할인금액
               {temp:"h",key:"pointUseAmt",txt:"<spring:message code='ser.lbl.dlrPointUseAmt' />",type:"strAmt"},//회원포인트사용금액
               {temp:"h",key:"bmPointUseAmt",txt:"<spring:message code='ser.lbl.bmPointUseAmt' />",type:"strAmt"},//BM포인트사용금액
               {temp:"h",key:"bmCupnUseAmt",txt:"<spring:message code='ser.lbl.bmCupnUseAmt' />",type:"strAmt"},//BM쿠폰용금액
               {temp:"h",key:"calcEtcDcAmt",txt:"<spring:message code='ser.lbl.etcSaleAmt' />",type:"strAmt"},//기타할인금액
               {temp:"h",key:"calcSumAmt",txt:"<spring:message code='ser.lbl.finalCalcAmt' />",type:"strAmt"},//최종정산금액
               {temp:"h",key:"paidYnNm",txt:"<spring:message code='ser.lbl.paidYn' />",type:""},//지불완료여부
               {temp:"h",key:"wonUnitCutAmt",txt:"<spring:message code='ser.lbl.interSettAmt' />",type:"strAmt"},//정산절사금액
               {temp:"h",key:"demicPointCutAmt",txt:"<spring:message code='ser.lbl.calcZeroAmt' />",type:"strAmt"},//정산제로금액
               {temp:"h",key:"paymAmt",txt:"<spring:message code='ser.lbl.arCd' />",type:"strAmt"},//발생금액
               {temp:"h",key:"rcvAmt",txt:"<spring:message code='ser.lbl.gisuAmt' />",type:"strAmt"},//실수령금액
               {temp:"h",key:"npayAmt",txt:"<spring:message code='ser.lbl.outstdAmt' />",type:"strAmt"},//미수금액
               ];

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem!=null){
        $("#roDocNo").val(dataItem.roDocNo);
    }

    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

    $("#runDistVal").val(commaZero(dataItem.runDistVal));
    $("#lastRunDistVal").val(commaZero(dataItem.lastRunDistVal));
    $("#expcDlDt").val(chgDate2DateTimeStr(dataItem.expcDlDt));



    _sRoDocNo=dataItem.roDocNo;

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");

    /* if( dataItem.roDocNo != null && dataItem.roDocNo != 'undefined'){
        // 푸품정보 리스트 조회
        $("#itemList").attr("src", "<c:url value='/mob/ser/ro/workHistory/selectWorkHistoryItemList.do' />");
        // 작업정보 리스트 조회
        $("#workList").attr("src", "<c:url value='/mob/ser/ro/workHistory/selectWorkHistoryWorkList.do' />");
    }
    if( dataItem.vinNo != null && dataItem.vinNo != 'undefined'){
        $("#vinNo").val(dataItem.vinNo);
    }
    if( dataItem.roStatNm != null && dataItem.roStatNm != 'undefined'){
        $("#roStatNm").val(dataItem.roStatNm);
    } */
}

</script>
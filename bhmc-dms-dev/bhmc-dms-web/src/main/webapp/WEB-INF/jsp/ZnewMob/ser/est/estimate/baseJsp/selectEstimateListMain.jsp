<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">
    <!-- content_list -->
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/est/estimate/listJsp/selectEstimateListList.jsp" />
    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.estList" /> <spring:message code="global.title.searchCondition" /><!-- 견적현황 + 조회조건  --></h2>
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
                            <div class="f_text"><input id="sCarRegNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.estDocNo" /><!-- 견적번호 --></th>
                        <td>
                            <div class="f_text"><input id="sEstDocNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.roTp' /></th><!-- RO유형 -->
                        <td>
                            <div class="f_text"><input type="text" id="sRoTp" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type=date id="sRoFromDt" style="width:140px" class="" />
                                <!-- <input type="search" id="sRoFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoFromDt');"></span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type=date id="sRoToDt" style="width:140px" class="" />
                                <!-- <input type="search" id="sRoToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoToDt');"></span> -->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- VIN NO --></th>
                        <td>
                            <div class="f_text"><input id="sVinNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.estWrtrNm' /><!-- 정비견적자 --></th>
                        <td>
                            <div class="f_text"><input id="sRegUsrNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.estimateStatCd" /><!-- 견적상태 --></th>
                        <td>
                            <div class="f_text"><input id="sEstStatCd" type="text" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.estDt" /><!-- 견적일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sFromDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sFromDt');">날짜선택</span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sToDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sToDt');">날짜선택</span> -->
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /></span></div>
            <dms:access viewId="VIEW-D-12660" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="ser.menu.estList" /> <spring:message code="ser.title.campaign.detailInfo" /><!-- 견적현황 상세정보 --></h2>
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
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListCustomerDemand.jsp" /><!--고객요청사항-->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListLabors.jsp" /><!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListParts.jsp" /><!-- 부품수령 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListEtcIssues.jsp" /><!-- 기타사항 -->

            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="ser.lbl.estCost" /><!-- 견적비용 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <ul class="sumlist">
                        <li>
                            <div class="sumtitle">
                                <h3><spring:message code="ser.lbl.estLbrSubAmt" /><!--견적공임비소계  --></h3>
                                <span class="svalue" id="C_lbrSumAmt"></span>
                                <span class="st_open"></span>
                            </div>
                            <div class="sumCont" style="display:">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.estAmt" /><!--견적금액  --></span>
                                        <span id="C_lbrCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_lbrDcAmt" class="sumitemValue"></span>
                                        <span id="C_lbrDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_lbrBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_lbrBmCupnUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_lbrPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_lbrEtcDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalEstAmt" /><!--최종견적금액  --></span>
                                        <span id="C_lbrCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.estParSubCamt" /><!--견적부품비소계  --></h3>
                                <span class="svalue" id="C_parSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.estAmt" /><!--견적금액  --></span>
                                        <span id="C_parCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_parDcAmt" class="sumitemValue"></span>
                                        <span id="C_parDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_parBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_parBmCupnUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_parPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_parEtcDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalEstAmt" /><!--최종견적금액  --></span>
                                        <span id="C_parCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.estEtcSubAmt" /><!--견적기타비용소계  --></h3>
                                <span class="svalue" id="C_etcSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.estAmt" /><!--견적금액  --></span>
                                        <span id="C_etcCalcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_etcDcAmt" class="sumitemValue"></span>
                                        <span id="C_etcDcRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_etcBmPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_etcBmCupnUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_etcPointUseAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_etcOtherDcAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalEstAmt" /><!--최종견적금액  --></span>
                                        <span id="C_etcCalcSumAmt" class="sumitemValue"></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sumlistTotal">
                            <div class="sumtitle">
                                <h3><span class="ico_equal"></span><spring:message code="ser.lbl.estSerTotAmt" /><!--견적비용총비용  --></h3>
                                <span class="svalue" id="C_totSumAmt"></span>
                                <span class="st_open st_close"></span>
                            </div>
                            <div class="sumCont" style="display:none">
                                <ul class="sumDetail">
                                    <li>
                                        <span class="sumitem"><spring:message code="ser.lbl.estAmt" /><!--견적금액  --></span>
                                        <span id="C_calcTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="global.lbl.dcAmt" /><!--할인금액  -->(<spring:message code="ser.lbl.dcRate" /><!--할인율  -->)</span>
                                        <span id="C_dcTotAmt" class="sumitemValue"></span>
                                        <span id="C_dcTotRate" class="sumPercent"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- BM<spring:message code="ser.lbl.bmPointUseAmt" /><!--BM포인트사용금액  --></span>
                                        <span id="C_bmPointTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.bmCupnUseAmt" /><!--BM쿠폰사용금액  --></span>
                                        <span id="C_bmCupnTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.pointUseAmt" /><!--포인트사용금액  --></span>
                                        <span id="C_pointTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li>
                                        <span class="sumitem">- <spring:message code="ser.lbl.etcSaleAmt" /><!--기타혜택금액  --></span>
                                        <span id="C_etcTotAmt" class="sumitemValue"></span>
                                    </li>
                                    <li class="sumdatailTotal">
                                        <span class="sumitem">= <spring:message code="ser.lbl.finalEstAmt" /><!--최종견적금액  --></span>
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
    <div id="docu_top" style="display:none">TOP</div>
</section>


<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDt                = "${toDt}",
oneMonthDtBf           = "${oneMonthDtBf}";

toDate = new Date();

var fromWhere="selectEstimateListMain";
var _sEstDocNo="";

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

var estTpCdList = [];
<c:forEach var="obj" items="${estTpCdList}">
estTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var estTpCdMap = dms.data.arrayToMap(estTpCdList, function(obj){return obj.cmmCd});

//견적상태 Array
var estStatCdList = [];
<c:forEach var="obj" items="${estStatCdList}">
estStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

$(document).ready(function() {
    //견적상태
    $("#sEstStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:estStatCdList
       ,optionLabel : "<spring:message code='global.lbl.check'/>"  // 선택
       ,index:0
    });

   // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.estList' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#sFromDt").val(chgServerDate2Str(oneMonthDtBf));
    $("#sToDt").val(chgServerDate2Str(toDt));

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        initList();
        contentList();
    });
    // 버튼 - 초기화
    $("#btnInit").click(function(){
        $("input").val("");
        $("#sEstStatCd").data("kendoExtDropDownList").value("");
        $("#sRoTp").data("kendoExtDropDownList").value("");
        $("#sFromDt").val(chgServerDate2Str(oneMonthDtBf));
        $("#sToDt").val(chgServerDate2Str(toDt));
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
  listData.read();
}

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem!=null){
        $("#estDocNo").val(dataItem.estDocNo);
    }


    $.ajax({
        url:"<c:url value='/ser/est/estimate/selectEstimateManageMains.do' />"
        ,data:JSON.stringify({sRoDocNo:dataItem.roDocNo, sEstDocNo:dataItem.estDocNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            mob.loading.hide();
        }
        ,success:function(result, textStatus){
            if(dms.string.strNvl(result.estDocNo) == ""){
                mob.notification.info("<spring:message code='ser.menu.estimate' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                initEstInfoSet();

            } else {
                estInfoSet(result, "CA");
            }
            mob.loading.hide();
        }
    });


  //견적정보 셋팅
    estInfoSet = function(result, listType){
        $("#C_lbrCalcAmt").text(result.lbrCalcAmt);
        $("#C_lbrDcRate").text("("+chgInt(result.lbrDcRate)+"%)");
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

  //견적정보 초기화
    initEstInfoSet = function(){
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



    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");

    _sEstDocNo=dataItem.estDocNo;
    _sLtsModelCd=dataItem.ltsModelCd;
    /* if( dataItem.estDocNo != null && dataItem.estDocNo != 'undefined'){
        // 푸품정보 리스트 조회
        $("#itemList").attr("src", "<c:url value='/mob/ser/est/estimate/selectEstimateListItemList.do' />");
        // 작업정보 리스트 조회
        $("#workList").attr("src", "<c:url value='/mob/ser/est/estimate/selectEstimateListWorkList.do' />");
    }
    if( dataItem.vinNo != null && dataItem.vinNo != 'undefined'){
        $("#vinNo").val(dataItem.vinNo);
    } */
}

</script>
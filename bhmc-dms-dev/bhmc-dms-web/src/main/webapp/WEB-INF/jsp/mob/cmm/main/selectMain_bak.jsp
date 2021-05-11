<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript">
var hasRoleIdArr=$.trim("${hasRoleIdArr}").replace(/[\[\]]/g,"").split(",",-1);
//var hasRoleIdArr=[];

var tskCd="${tskCd}";
var toDay="${toDay}";
var oneDay="${oneDay}";

var showRoomVisitCnt="${showRoomVisitCnt}";
var salesOpptProcessMgmtsByConditionStatsCnt="${salesOpptProcessMgmtsByConditionStatsCnt}";
var vocDateTpRegCnt="${vocDateTpRegCnt}";

var roCnt="${roCnt}";
var roCntGubun="${roCntGubun}";
var serviceTotCnt="${serviceTotCnt}";
var claimTotAmt="${claimTotAmt}";
var claimTotAmtGubun="${claimTotAmtGubun}";

var tmonthSoldCnt="${tmonthSoldCnt}";
var tmonthSoldGubn="${tmonthSoldGubn}";
var tyearSoldCnt="${tyearSoldCnt}";
var tyearSoldGubn="${tyearSoldGubn}";
var stockRate="${stockRate}";
var stockCnt="${stockCnt}";



var PURC_TOT_AMT="${PURC_TOT_AMT}";
var PURC_TOT_AMT_GUBUN="${PURC_TOT_AMT_GUBUN}";
var SALE_TOT_AMT="${SALE_TOT_AMT}";
var STOCK_TOT_AMT="${STOCK_TOT_AMT}";



</script>
    <!-- content -->
    <section id="content_main">
        <div class="todolist">
            <ul>
                <li class="unconfirmed" onclick="goTodo(1)"><span><spring:message code='global.title.workStatus' /><!-- todo --><strong><sapn id="todoCnt" ></sapn></strong></span></li>
                <li class="ongoing" onclick="goAlarm()"><span><spring:message code='global.lbl.alarm' /><!-- 알람 --><strong><sapn id="alarmCnt"></sapn></strong></span></li>
                <%-- <li class="hold" onclick="goTodo(1)"><span><spring:message code='global.btn.notConfirm' /><!-- 미확인 --><strong><sapn id="notConfirmCnt"></sapn></strong></span></li> --%>
            </ul>
            <div class="today" id="noticeCampaign6">${dt}</div>
        </div>

        <!-- 즐겨찾기 -->
         <!-- 총경리 메인메뉴 -->
        <div class="bosslist2 favoritelist listAll">
            <ul class="bxSlider">
                <!-- <li class="_A isShow__"> 테스트용으로 총경리 다 보이게 만든 것 나중에 이걸 살리고 바로 밑의 li를 삭제 khs-->
                <li class="_A">
                    <ul>
                        <li class="bo_contract">
                            <a href="#">
                                <div class="bocont">
                                    <h3>판매</h3>
                                    <div class="numcont">
                                        <div>
                                            <p class="left_cont"><span class="txt"><spring:message code='mob.lbl.main.sale.month' /></span><span class="txt_num" id="tmonthSoldCnt">▲44</span></p>
                                            <p class="right_cont"><span class="txt"><spring:message code='mob.lbl.main.yearTotalAmt' /></span><span class="txt_num" id="tyearSoldCnt">▼954</span></p>
                                        </div>
                                    </div>
                                    <div class="numdetail">
                                        <p class="left_cont bo_green"><span class="txt"><spring:message code='mis.lbl.stockvaluecnt' /></span><span class="txt_num" id="stockRate">45</span></p>
                                        <p class="right_cont bo_orange"><span class="txt"><spring:message code='mob.lbl.main.stockCnt' /></span><span class="txt_num" id="stockCnt">185</span></p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="bo_customer">
                            <div class="bocont">
                                <h3>고객</h3>
                                <div class="numcont">
                                    <div>
                                        <p><span class="txt"><spring:message code='mob.lbl.main.innerCustomer' /></span><span class="txt_num" id="showRoomVisitCnt">39</span></p><!-- 당월보유고객 -->
                                    </div>
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.main.saleOpptCnt' /></span><span class="txt_num" id="salesOpptProcessMgmtsByConditionStatsCnt">8</span></p><!-- 금일오더 -->
                                    <p class="right_cont"><span class="txt"><spring:message code='mob.lbl.main.vocCnt' /></span><span class="txt_num" id="vocDateTpRegCnt">▲5</span></p><!-- 금일거래 -->
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- <li class="_A isShow__"> 테스트용으로 총경리 다 보이게 만든 것 나중에 이걸 살리고 바로 밑의 li를 삭제 khs-->
                <li class="_A">
                    <ul>
                        <li class="bo_repair">
                            <div class="bocont">
                                <h3>정비</h3>
                                <div class="numcont">
                                    <div>
                                        <p class=><span class="txt"><spring:message code='crm.lbl.serCnt' /></span><span class="txt_num" id="roCnt">1,172</span></p><!-- 정비대수 -->
                                    </div>
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green" style="width:43%;"><span class="txt"><spring:message code='sal.menu.totalSales' /></span><span class="txt_num" id="serviceTotCnt">102,012</span></p>
                                    <p class="right_cont" style="width:50%;"><span class="txt"><spring:message code='mob.lbl.main.claimReqAmt' /></span><span class="txt_num" id="claimTotAmt">317,266</span></p>
                                </div>
                            </div>
                        </li>
                        <li class="bo_part">
                            <div class="bocont">
                                <h3>부품</h3>
                                <div class="numcont">
                                    <div>
                                        <p class=""><span class="txt"><spring:message code='mob.lbl.main.orderTotalAmt' /></span><span class="txt_num" id="PURC_TOT_AMT">387,142</span></p>
                                    </div>
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green" style="width:43%;"><span class="txt"><spring:message code='mob.lbl.main.saleTotalCnt' /></span><span class="txt_num" id="SALE_TOT_AMT">460,321</span></p>
                                    <p class="right_cont bo_orange" style="width:50%;"><span class="txt"><spring:message code='par.lbl.stockPrice' /></span><span class="txt_num" id="STOCK_TOT_AMT">543,134</span></p>
                                </div>
                            </div>
                        </li>
                    </ul>

                </li>
                <%-- <li class="_C isShow__">
                    <ul class="fmenu">
                        <li url='<c:url value="/mob/ser/rev/reservationReceipt/selectReservationReceiptMain.do" />'><span><span class="icon ser01"></span><span class="menu"><spring:message code='ser.menu.reserStatus' /><!--예약접수현황--></span></span></li>
                        <li url='<c:url value="/mob/ser/rev/partReservation/selectPartReservationMain.do" />'><span><span class="icon ser02"></span><span class="menu"><spring:message code='ser.menu.partReserveStatus' /><!--부품예약현황--></span></span></li>
                        <li url='<c:url value="/mob/ser/ro/preCheck/selectPreCheckListMain.do" />'><span><span class="icon ser03"></span><span class="menu"><spring:message code='ser.menu.preCheckList' /><!--사전점검현황--></span></span></li>
                        <li url='<c:url value="/mob/ser/est/estimate/selectEstimateListMain.do" />'><span><span class="icon ser04"></span><span class="menu"><spring:message code='ser.menu.estList' /><!--견적현황--></span></span></li>
                        <li url='<c:url value="/mob/ser/ro/workHistory/selectWorkHistoryMain.do" />'><span><span class="icon ser05"></span><span class="menu"><spring:message code='ser.menu.roStatus' /><!--RO현황--></span></span></li>
                        <li url='<c:url value="/mob/ser/ro/workAssign/selectWorkAssignMain.do" />'><span><span class="icon ser06"></span><span class="menu"><spring:message code='ser.title.workAssignList' /><!--작업배분현황--></span></span></li>
                        <li url='<c:url value="/mob/ser/ro/workProcess/selectWorkProcessMgrMain.do" />'><span><span class="icon ser07"></span><span class="menu"><spring:message code='ser.menu.wkProcMng' /><!--정비진도--></span></span></li>
                        <li url='<c:url value="/mob/ser/ro/workProcess/selectWorkProcessMain.do" />'><span><span class="icon ser08"></span><span class="menu"><spring:message code='ser.menu.wkProcStat' /><!--정비진도현황--></span></span></li>
                    </ul>
                </li>
                <li class="_C isShow__">
                    <ul class="fmenu">
                        <li url='<c:url value="/mob/ser/cal/calculate/selectCalculateMain.do" />'><span><span class="icon ser09"></span><span class="menu"><spring:message code='ser.menu.calcMng' /><!--서비스정산관리--></span></span></li>
                        <li url='<c:url value="/mob/ser/rcv/serviceReceive/selectServiceReceiveMain.do" />'><span><span class="icon ser10"></span><span class="menu"><spring:message code='ser.menu.receiveMng' /><!--수납관리--></span></span></li>
                        <li url='<c:url value="/mob/par/pmm/itemMaster/selectItemMasterMain.do" />'><span><span class="icon par01"></span><span class="menu"><spring:message code='par.menu.partMaster' /><!--부품정보관리--></span></span></li>
                        <li url='<c:url value="/mob/par/pcm/receive/selectReceiveCnfmMain.do" />'><span><span class="icon par02"></span><span class="menu"><spring:message code='par.menu.partInStockConfirm' /><!--구매입고확정--></span></span></li>
                        <li url='<c:url value="/mob/par/stm/physicalInv/selectPhysicalInvMain.do" />'><span><span class="icon par03"></span><span class="menu"><spring:message code='par.menu.stockResultInvest' /><!--실사문서확정--></span></span></li>
                        <li url='<c:url value="/mob/par/ism/issueReq/selectIssueReqStatusMain.do" />'><span><span class="icon par04"></span><span class="menu"><spring:message code='par.menu.partOutStockStatus' /><!--출고현황--></span></span></li>
                        <li url='<c:url value="/mob/par/pcm/purcOrd/selectPurcOrdMain.do" />'><span><span class="icon par05"></span><span class="menu"><spring:message code='par.menu.partOrderMgr' /><!--구매오더목록--></span></span></li>
                    </ul>
                </li>
                <!-- //정비/부품 -->
                <!-- 판매/CRM -->
                <li class="_B _D isShow__">
                    <ul class="fmenu">
                        <li url='<c:url value="/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrMain.do" />'><span><span class="icon sal01"></span><span class="menu"><spring:message code='mob.title.sumOrderCntDlr' /><!--종합오더현황--></span></span></li>
                        <li url='<c:url value="/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleMain.do" />'><span><span class="icon sal02"></span><span class="menu"><spring:message code='sal.menu.vehicleStockConfirm' /><!--완성차입고확정--></span></span></li>
                        <li url='<c:url value="/mob/sal/lom/dlCarMonitor/selectDlCarMonitorMain.do" />'><span><span class="icon sal03"></span><span class="menu"><spring:message code='sal.menu.dlrTpMonitoring' /><!--TP차량모니터링--></span></span></li>
                        <li url='<c:url value="/mob/sal/inv/stockState/selectStockStateMain.do" />'><span><span class="icon sal04"></span><span class="menu"><spring:message code='sal.menu.stockStatMgmt' /><!--재고상태관리--></span></span></li>
                        <li url='<c:url value="/mob/sal/lom/evalSearchEdit/selectEvalSearchEditMain.do" />'><span><span class="icon sal05"></span><span class="menu"><spring:message code='sal.menu.evalSrchUpd' /><!--평가정보조회 및 수정--></span></span></li>
                        <li url='<c:url value="/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceMain.do" />'><span><span class="icon sal06"></span><span class="menu"><spring:message code='sal.menu.stockRealSearch' /><!--재고실사--></span></span></li>
                        <li url='<c:url value="/mob/sal/usc/purcEval/selectEvalMngMain.do" />'><span><span class="icon sal07"></span><span class="menu"><spring:message code='sal.menu.usedCarBuy' /><!--중고차매입관리--></span></span></li>
                        <li url='<c:url value="/mob/sal/usc/exchRslt/selectExchRegistMain.do" />'><span><span class="icon sal08"></span><span class="menu"><spring:message code='sal.menu.midAgeVehicleChgSaleApprvSrch' /><!--중고차치환평가 조회--></span></span></li>
                    </ul>
                </li>
                <li class="_B _D isShow__">
                    <ul class="fmenu">
                        <li url='<c:url value="/mob/sal/cnt/aapMng/selectAapMngMain.do" />'><span><span class="icon sal09"></span><span class="menu"><spring:message code='sal.menu.agencyBsiMgmt' /><!--대행업무관리--></span></span></li>
                        <li url='<c:url value="/mob/crm/cif/customerInfo/selectCustomerInfoMain.do" />'><span><span class="icon crm01"></span><span class="menu"><spring:message code='crm.menu.custInfo' /><!--고객정보조회--></span></span></li>
                        <li url='<c:url value="/mob/crm/css/satisFactionMobile/selectSatisFactionMobileMain.do" />'><span><span class="icon crm02"></span><span class="menu"><spring:message code='crm.menu.satisFaction' /><!--만족도조사--></span></span></li>
                        <li url='<c:url value="/mob/crm/crq/vocMgmt/selectVocMgmtMain.do" />'><span><span class="icon crm03"></span><span class="menu"><spring:message code='crm.title.vocMgmt' /><!--고객요청관리--></span></span></li>
                        <li url='<c:url value="/mob/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do" />'><span><span class="icon crm04"></span><span class="menu"><spring:message code='crm.menu.campaignMng' /><!--캠페인관리--></span></span></li>
                        <li url='<c:url value="/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtMain.do" />'><span><span class="icon crm05"></span><span class="menu"><spring:message code='crm.menu.opportunityMng' /><!--판매기회관리--></span></span></li>
                        <li url='<c:url value="/mob/crm/cso/testDrive/selectTestDriveMgmtMain.do" />'><span><span class="icon crm06"></span><span class="menu"><spring:message code='crm.menu.testDriveMng' /><!--시승관리--></span></span></li>
                    </ul>
                </li> --%>
            </ul>
        </div>
        <div class="notice" >
            <ul>
                <li><span><span class="noti" id="noticeCampaign2"></span><span class="date" ></span></span></li>
                <li><span><span class="noti" id="noticeCampaign2"></span><span class="date" ></span></span></li>
                <li><span><span class="noti" id="noticeCampaign2"></span><span class="date" ></span></span></li>
            </ul>
        </div>
<input type="hidden" id="leadJson">
    </section>

    <footer id="footer">
        <p class="copyright">Copyright 2016 BHMC Corporation, All Rights Reserved. </p>
    </footer>

<%--     <img id="mainloadingImg" src='<c:url value="/resources/img/mob/loading-image_t.gif" />' style="position: absolute; z-index: 1000; width: 48px; height: 48px;">
 --%>

<script>
//시스템 날짜 정보 가져오기.

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var holdTpList =[];
var infoTpList =[];
//var infoPathCdList =[];

<c:forEach var="obj" items="${holdTpList}">
holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

<c:forEach var="obj" items="${infoTpList}">
infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var holdDetlTpSeqList =[];
<c:forEach var="obj" items="${holdDetlTpSeqList}">
holdDetlTpSeqList.push({"cmmCd":"${obj.holdSeq}" ,"holdTp":"${obj.holdTp}" , "cmmCdNm":"${obj.holdDetlTpNm}", "useYn":"${obj.delYn}"});
</c:forEach>


var carInfoList=[];
<c:forEach var="obj" items="${carInfoList}">
carInfoList.push({"carlineCd":"${obj.carlineCd}", "carlineNm":"${obj.carlineNm}", "barCode":"${obj.barCode}"});
</c:forEach>

var $slider;

var bardSal =[];
var bardSer =[];
var bardPar =[];
var bardCrm =[];
var bardCom =[];
var bardAdm =[];
var bardAll =[];

var grant=hasRoleIdArr.toString();

$(document).ready(function() {

    getTodoInfo(1);
    //getTodoInfo(2);//확인
    //getTodoInfo(3);//미완료

    //CRM
    $("#showRoomVisitCnt").text(showRoomVisitCnt);
    $("#salesOpptProcessMgmtsByConditionStatsCnt").text(salesOpptProcessMgmtsByConditionStatsCnt);
    if(Number(vocDateTpRegCnt) < 0 ){
        $("#vocDateTpRegCnt").addClass("bo_blue");
        $("#vocDateTpRegCnt").text("▼"+Math.abs(vocDateTpRegCnt));
    }else{
        $("#vocDateTpRegCnt").addClass("bo_red");
        $("#vocDateTpRegCnt").text("▲"+vocDateTpRegCnt);
    }
    //CRM

    //정비
    if(roCntGubun=="DN" ){
        $("#roCnt").addClass("bo_blue");
        $("#roCnt").text("▼"+roCnt);
    }else if(roCntGubun=="UP" ){
        $("#roCnt").addClass("bo_red");
        $("#roCnt").text("▲"+roCnt);
    }else{
        $("#roCnt").text(roCnt);
    }
    $("#serviceTotCnt").text(comma(serviceTotCnt));
    if(claimTotAmtGubun=="DN"){
        $("#claimTotAmt").addClass("bo_blue");
        $("#claimTotAmt").text("▼"+comma(claimTotAmt));
    }else if(claimTotAmtGubun=="UP" ){
        $("#claimTotAmt").addClass("bo_red");
        $("#claimTotAmt").text("▲"+comma(claimTotAmt));
    }else{
        $("#claimTotAmt").text(comma(claimTotAmt));
    }
    //정비

    //판매
    if(tmonthSoldGubn=="DN"){
        $("#tmonthSoldCnt").addClass("bo_blue");
        $("#tmonthSoldCnt").text("▼"+tmonthSoldCnt);
    }else if(tmonthSoldGubn=="UP"){
        $("#tmonthSoldCnt").addClass("bo_red");
        $("#tmonthSoldCnt").text("▲"+tmonthSoldCnt);
    }else{
        $("#tmonthSoldCnt").text(tmonthSoldCnt);
    }
    if(tyearSoldGubn=="DN"){
        $("#tyearSoldCnt").addClass("bo_blue");
        //$("#tyearSoldCnt").text("▼"+dms.format.currency(Number(tyearSoldCnt)));
        $("#tyearSoldCnt").text("▼"+tyearSoldCnt);
    }else if(tyearSoldGubn=="UP"){
        $("#tyearSoldCnt").addClass("bo_red");
        $("#tyearSoldCnt").text("▲"+tyearSoldCnt);
    }else{
        $("#tyearSoldCnt").text(tyearSoldCnt);
    }
    $("#stockRate").text(stockRate);
    $("#stockCnt").text(stockCnt);
    //판매

    //부품
    $("#PURC_TOT_AMT_GUBUN").text(PURC_TOT_AMT_GUBUN);
    if(PURC_TOT_AMT_GUBUN=="DN"){
        $("#PURC_TOT_AMT").addClass("bo_blue");
        $("#PURC_TOT_AMT").text("▼"+comma(PURC_TOT_AMT));
    }else if(PURC_TOT_AMT_GUBUN=="UP"){
        $("#PURC_TOT_AMT").addClass("bo_red");
        $("#PURC_TOT_AMT").text("▲"+comma(PURC_TOT_AMT));
    }else{
        $("#PURC_TOT_AMT").text(comma(PURC_TOT_AMT));
    }
    $("#SALE_TOT_AMT").text(comma(SALE_TOT_AMT));
    $("#STOCK_TOT_AMT").text(comma(STOCK_TOT_AMT));
    //부품

    includeList = "N";
    $("#mwrap").attr("class", "mainarea");

    $slider=$(".bxSlider").bxSlider({
        controls:false,
        minSlides:1,
        maxSlides:1,
        moveSlides:1,
        slideMargin:0
        });


    $(".fmenu li").click(function(obj){
        var url = $(this).attr("url");
        goMenu(url);
    });

    console.log(hasRoleIdArr.toString());

    showContents();
    getBoardList();
    //leadInfoMakeJason();
    carInfoMakeJason();

    $("._admin").remove();
    $slider.reloadSlider();
});

function getBoardList(){

    var rowIndex = 0;
    var params = {};
    params["sBbsId"] = "BBS201604-000011";
    params["sNttCatCd"] = "";
    params["sNttTitleNm"] = "";
    params["sNttCont"] = "";

    $.ajax({
        url:"<c:url value='/mob/cmm/bbs/generalBoard/selectGeneralBoard.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {

        }
        ,success:function(result) {
            var data = [];
            rowTotal = result.total;
            var SerIndex=0, SalIndex=0, ParIndex=0, CrmIndex=0, ComIndex=0, AdmIndex=0;
            if (rowTotal > 0) {
                $.each(result.data , function(i , row){
                    rowIndex++;


                    if(row.nttCatCd=="01"){var YYYYMMDD=row.regDt.split(' ');bardSer[SerIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                    if(row.nttCatCd=="02"){var YYYYMMDD=row.regDt.split(' ');bardSal[SalIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                    if(row.nttCatCd=="03"){var YYYYMMDD=row.regDt.split(' ');bardPar[ParIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                    if(row.nttCatCd=="04"){var YYYYMMDD=row.regDt.split(' ');bardCrm[CrmIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                    if(row.nttCatCd=="05"){var YYYYMMDD=row.regDt.split(' ');bardCom[ComIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                    var YYYYMMDD=row.regDt.split(' ');
                    bardAll[AdmIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm+"-=;"+row.nttCatCd;

                });
            }
            contentSetBoardByGrant();

        }
    });

}
changeCatCdMap = function(val){
    if(isFromBoardMain=="Y"){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = arrCatCdMap[val].cmmCdNm;
        }
        return returnVal;
    }
};

function contentSetBoardByGrant(){

    var i;
    var noticeHtml="";
    if(tskCd.indexOf("B") > -1 ){
        var totalLine=0;
        console.log("bardAll.length : "+bardAll.length);
        for(i=0; i<bardAll.length; i++){
            if(totalLine==3)break;
            var _bardAll=bardAll[i].split('-=;'); totalLine++;
            var _nttCatCdNm="";
            if(_bardAll[2]=="01"){
                _nttCatCdNm="<spring:message code='crm.lbl.sale' />";
            }else if(_bardAll[2]=="02"){
                _nttCatCdNm="<spring:message code='crm.lbl.lbr' />";
            }else if(_bardAll[2]=="03"){
                _nttCatCdNm="<spring:message code='global.lbl.part' />";
            }else if(_bardAll[2]=="04"){
                _nttCatCdNm="<spring:message code='crm.menu.crmMain' />";
            }else if(_bardAll[2]=="05"){
                _nttCatCdNm="<spring:message code='cmm.menu.comMain' />";
            }
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'>"+_nttCatCdNm+"</span><span class='date' >["+_bardAll[0]+"]</span><span>"+_bardAll[1]+"</span></span></li>";
            if(i==3)break;
        }

    }else{
        var totalLine2=0;
        if(tskCd.indexOf("B") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardCom.length; i++){
                var _bardCom=bardCom[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='cmm.menu.comMain' /></span><span class='date' >["+_bardCom[0]+"]</span><span>"+_bardCom[1]+"</span></span></li>";
                if(i==3)break;
            }
        }else if(tskCd.indexOf("B") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardCrm.length; i++){
                var _bardCrm=bardCrm[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='crm.menu.crmMain' /></span><span class='date' >["+_bardCrm[0]+"]</span><span>"+_bardCrm[1]+"</span></span></li>";
                if(i==3)break;
            }
        }else if(tskCd.indexOf("B") > -1){

        }else if(tskCd.indexOf("B") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardPar.length; i++){
                var _bardPar=bardPar[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='global.lbl.part' /></span><span class='date' >["+_bardPar[0]+"]</span><span>"+_bardPar[1]+"</span></span></li>";
                if(i==3)break;
            }
        }else if(tskCd.indexOf("B") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardSal.length; i++){
                var _bardSal=bardSal[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='crm.lbl.sale' /></span><span class='date' >["+_bardSal[0]+"]</span><span>"+_bardSal[1]+"</span></span></li>";
                if(i==3)break;
            }
        }
    }
    $(".notice > ul").html(noticeHtml);
}

function getDeviceInfo(param){ // js (앱에서 리턴되는 값 받는 스크립트)
    insertToCM1901T(param);
}
function insertToCM1901T(param) {
    var result = JSON.parse(param);
    var obj = {
             dlrCd       :dlrCd,
             userId      :userId,
             userNm      :userNm,
             hpNo        :result.PHONE_NO,
             os          :result.OS,
             osVersion   :result.OS_VERSION,
             updateDate  :result.UPDATE_DATE,
             appVersion  :result.APP_VERSION,
             deviceId    :result.DEVICE_ID
    };
    $.ajax({
         url:"<c:url value='/mob/cmm/main/insertDeviceInfo.do'/>"
        ,data:kendo.stringify(obj)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,success:function(result) {
            leadInfoMakeJason();
        }
        ,error:function(jqXHR,status,error) {
            leadInfoMakeJason();
            return false;
        }
    });
 }

function showContents(){

    var i=0;
    var j=0;
    var allElements=$(".isShow__");
    
    var tskCdArr=["A","B","C","D","E","F","G","H"]; //나중에 DB에서 받아오자  khs
    
    for(var i=0; i<tskCdArr.length; i++){
        if(tskCd.indexOf(tskCdArr[i]) > -1){
            for(var j=0; j<allElements.length; j++){
                if(!$(allElements[j]).hasClass("_"+tskCdArr[i])){
                    $(allElements[j]).remove();
                }
            }
        }
    }
    
    $slider.reloadSlider();

}

function leadInfoMakeJason(){
/*
    var testList = new Array();
    var i;
    for(i=0; i<infoTpList.length; i++){
        var testObj = new Object() ;
        testObj.LEAD_SEQ="-1";
        testObj.LEAD_CD=infoTpList[i].cmmCd;
        testObj.LEAD_NM=encodeURIComponent(infoTpList[i].cmmCdNm.trim());
        testList.push(testObj);
    }
    for(i=0; i<holdTpList.length; i++){
        var testObj = new Object() ;
        testObj.LEAD_SEQ="00";
        testObj.LEAD_CD=holdTpList[i].cmmCd;
        testObj.LEAD_NM=encodeURIComponent(holdTpList[i].cmmCdNm.trim());
        testList.push(testObj);
    }
    for(i=0; i<holdDetlTpSeqList.length; i++){
        var testObj = new Object() ;
        testObj.LEAD_SEQ=holdDetlTpSeqList[i].cmmCd;
        testObj.LEAD_CD=holdDetlTpSeqList[i].holdTp;
        testObj.LEAD_NM=encodeURIComponent(holdDetlTpSeqList[i].cmmCdNm.trim());
        testList.push(testObj);
    }


    var totalData=new Object();
    totalData.data=testList;
    var jsonData = JSON.stringify(totalData).replace(/\u2028/g, '\\u2028').replace(/\u2029/g, '\\u2029').replace(/\u000D/g, '\\u000D').replace(/\u000A/g, '\\u000A');
    
    //$("#leadJson").val(fnBase64(jsonData));
    $("#leadJson").val(jsonData);
    console.log(jsonData);
*/
var jsonData="";
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location='bhmccp://SAVE_Array?TABLE_NM=Lead_Source&return_func=resultSave&values='+jsonData;

        }else
        {
            window.bhmccp.SAVE_Array('Lead_Source',jsonData,'resultSave');
        }
    }catch(e){

    }
}

function carInfoMakeJason(){
    var testList = new Array();
    var i;
    for(i=0; i<carInfoList.length; i++){
        var testObj = new Object() ;
        testObj.VEHICLE_CD=carInfoList[i].barCode;
        testObj.CARLINE_CD=carInfoList[i].carlineCd;
        testObj.CARLINE_NM=carInfoList[i].carlineNm.trim();
        testList.push(testObj);
    }

    var totalData=new Object();
    totalData.data=testList;
    var jsonData = JSON.stringify(totalData) ;
    console.log(jsonData);
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location='bhmccp://SAVE_Car_Info?TABLE_NM=Car_Info&return_func=resultCar_Info&values='+jsonData;
        }else
        {
            window.bhmccp.SAVE_Car_Info('Car_Info',jsonData,'resultCar_Info');
        }
    }catch(e){

    }
}

function resultCar_Info(obj){
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location = 'bhmccp://getDeviceInfo?DEALER_CD='+dlrCd+'&USER_ID='+userId+'&LANGUAGE=&return_func=getDeviceInfo';
        }else /* if (userAgent.search("android") > -1) */
        {
            window.bhmccp.getDeviceInfo(dlrCd, userId, 'lannge', 'getDeviceInfo');
        }
    }catch(e){

    }
}

</script>

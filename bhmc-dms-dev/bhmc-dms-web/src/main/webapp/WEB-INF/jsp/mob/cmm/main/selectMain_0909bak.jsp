<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- content -->
    <section id="content_main">

        <div class="todolist">
            <!-- <div class="today"><span class="day"><strong>08</strong>Fri</span>2016.4</div> -->
            <ul>
                <li class="unconfirmed" onclick="goTodo(1)"><span><spring:message code='global.btn.notConfirm' /><!-- 미확인 --><strong>4</strong></span></li>
                <li class="ongoing" onclick="goTodo(2)"><span><spring:message code='global.btn.confirm' /><!-- 확인 --><strong>1</strong></span></li>
                <li class="hold"><span><spring:message code='global.btn.complete' /><!-- 작업완료 --><strong>0</strong></span></li>
            </ul>
            <%--<div class="today">2016年 7月7日 星期四</div>--%>
            <div class="today" id="noticeCampaign6">${dt}</div>
        </div>

        <%--
        <div class="mainjobarea">
            <div class="slider">
                <div class="slide" onclick="javascript:goBarcode();"><span><span class="icon01"></span><spring:message code='mob.lbl.barcode' /> <spring:message code='mob.lbl.scan' /><!-- 바코드 스캔 --></span></div>
                <div class="slide" onclick="javascript:goCamera();"><span><span class="icon02"></span><spring:message code='mob.lbl.camera' /><!-- 카메라 --></span></div>
                <div class="slide" onclick="javascript:goCalendar();"><span><span class="icon03"></span><spring:message code='mob.lbl.calendar' /><!-- 달력 --></span></div>
                <div class="slide" onclick="javascript:goOther4();"><span><span class="icon04"></span>4</span></div>
                <div class="slide" onclick="javascript:goOther5();"><span><span class="icon05"></span>5</span></div>
            </div>
        </div>
         --%>

        <!-- 판매총감 -->
        <%-- <c:if test="${userId eq 'boss2'}"> --%>
        <c:if test="${userId eq 'D0030847'}">
        <div class="favoritelist" id="favForBoss2">
            <ul class="bxSlider">
                <li>
                    <ul class="fmenu">

                        <li onclick="javascript:goMenu('<c:url value="/mob/crm/cif/customerInfo/selectCustomerInfoMain.do" />');">
                            <span><span class="icon menu01"></span>
                            <span class="menu"><spring:message code='global.title.custinfo' /><!-- 고객정보 --></span></span>
                        </li>

<%--                         <li onclick="javascript:goMenu('<c:url value="/mob/cmm/common/selectWorking.do"/>');"> --%>
                        <li>
                            <span><span class="icon menu02"></span>
                            <span class="menu"><spring:message code='mob.title.sumOrderCntDlr' /><!-- 오더현황[개발중] --></span>
                        </li>

                        <li onclick="javascript:goMenu('<c:url value="/ReportServer?formlet=misForm1.frm"/>');">
                            <span><span class="icon menu03"></span>
                            <span class="menu"><spring:message code='sal.lbl.yearlySale' /><!-- 년매출액 --></span>
                        </li>

                        <li onclick="javascript:goMenu('<c:url value="/mob/sal/lom/dlCarMonitor/selectDlCarMonitorMain.do"/>');">
                            <span><span class="icon menu04"></span>
                            <span class="menu"><spring:message code='mob.title.tpVehicleMonitoring' /><!-- TP차량모니터링 --></span>
                        </li>

                        <li onclick="javascript:goMenu('<c:url value="/mob/sal/inv/stockState/selectStockStateMain.do"/>');">
                            <span><span class="icon menu05"></span>
                            <span class="menu"><spring:message code='global.lbl.stockInfo' /><!-- 재고상태관리 --></span>
                        </li>

                        <li onclick="javascript:goMenu('<c:url value="/mob/crm/slm/leadInfo/selectLeadInfoMain.do"/>');">
                            <span><span class="icon menu06"></span>
                            <span class="menu"><spring:message code='mob.crm.menu.leadMng' /><!-- 리드관리 --></span>
                        </li>

                        <li>
                            <span><span class="icon menu07"></span>
                            <span class="menu"><spring:message code='sal.menu.contactMgmt' /><!-- 계약관리[개발중] --></span>
                        </li>

<%--                         <li onclick="javascript:goMenu('<c:url value="/mob/cmm/common/selectWorking.do"/>');"> --%>
<!--                             <span><span class="icon menu07"></span> -->
<%--                             <span class="menu"><spring:message code='sal.menu.contactMgmt' /><!-- 계약관리[개발중] --></span> --%>
<!--                         </li> -->

                        <li onclick="javascript:goMenu('<c:url value="/mob/crm/cso/salesActive/selectSalesActiveMgmtMain.do"/>');">
                            <span><span class="icon menu08"></span>
                            <span class="menu"><spring:message code='mob.crm.menu.salesActiveMgmt' /><!-- 영업활동 --></span>
                        </li>

                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="bo_contract">
                            <a href="<c:url value='/resources/html/mob/manage/m_8.html' />"><div class="bocont">
                                <h3>판매</h3>
                                <div class="numcont">
                                <span>
                                        <p class="bo_red" style="width:48%;float:left;"><span class="txt">当月销售</span>▲44</p>
                                        <p class="bo_blue" style="width:48%;float:right"><span class="txt">今年销售</span>▼954</p>
                                </span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">库存周期</span>45</span>
                                    <span class="right_cont bo_orange"><span class="txt">库存数量</span>185</span>
                                </div>
                            </div></a>
                        </li>
                        <li class="bo_customer">
                            <div class="bocont">
                                <h3>고객</h3>
                                <div class="numcont"><span>
                                        <p><span class="txt">当月保客</span>39</p>
                                </span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">当天订单</span>8</span>
                                    <span class="right_cont bo_red"><span class="txt">当天成交</span>▲5</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <script type="text/javascript">
            $(".bxSlider").bxSlider({
                controls:false,
                minSlides:1,
                maxSlides:1,
                moveSlides:1,
                slideMargin:0
            });
        </script>
        </c:if>
        <!-- /판매총감 -->

        <!-- 정비총감 -->
        <%-- <c:if test="${userId eq 'boss3'}"> --%>
        <c:if test="${userId eq 'D0097507'}">
        <div class="favoritelist" id="favForBoss3">
            <ul class="bxSlider">
                <li>
                    <ul class="fmenu">
                        <li onclick="javascript:goMenu('<c:url value="/mob/crm/cif/customerInfo/selectCustomerInfoMain.do" />');">
                            <span><span class="icon menu01"></span>
                                  <span class="menu"><spring:message code='global.lbl.custInfo' /><!-- 고객정보 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/ser/rev/reservationReceipt/selectReservationReceiptMain.do" />');">
                            <span><span class="icon menu02"></span>
                                    <span class="menu"><spring:message code='ser.menu.reservMng' /><!-- 예약관리 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/ser/ro/preCheck/selectPreCheckListMain.do" />');">
                            <span><span class="icon menu03"></span>
                                  <span class="menu"><spring:message code='mob.ser.menu.preCheckList' /><!-- 사전점검 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/ser/ro/workHistory/selectWorkHistoryMain.do" />');">
                            <span><span class="icon menu04"></span>
                                    <span class="menu"><spring:message code='mob.ser.menu.roCreate' /><!-- 정비위탁 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/ser/ro/workProcess/selectWorkProcessMain.do" />');">
                            <span><span class="icon menu05"></span>
                                    <span class="menu"><spring:message code='ser.lbl.workStatCd' /><!-- 정비진도 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/ser/cal/calculate/selectCalculateMain.do" />');">
                            <span><span class="icon menu06"></span>
                                    <span class="menu"><spring:message code='mob.ser.menu.calcReceiveMng' /><!-- 서비스정산 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/par/pmm/itemMaster/selectItemMasterMain.do" />');">
                            <span><span class="icon menu07"></span>
                                    <span class="menu"><spring:message code='ser.title.itemInfo' /><!-- 부품정보 --></span>
                            </span>
                        </li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/par/pcm/purcOrd/selectPurcOrdMain.do" />');">
                            <span><span class="icon menu08"></span>
                                    <span class="menu"><spring:message code='mob.par.menu.partOrder' /><!-- 부품오더 --></span>
                            </span>
                        </li>
                   </ul>
                </li>
                <li>
                    <ul>
                        <li class="bo_repair">
                            <div class="bocont">
                                <h3>정비</h3>
                                <div class="numcont"><span class="bo_blue"><span class="txt">当月台次</span>▼1,172</span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">毛利</span>102,012</span>
                                    <span class="right_cont bo_red"><span class="txt">当月产值</span>▲ 317,266</span>
                                </div>
                            </div>
                        </li>
                        <li class="bo_part">
                            <div class="bocont">
                                <h3>부품</h3>
                                <div class="numcont"><span class="bo_red"><span class="txt">销售额</span>▲387,142</span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">库存</span>460,321</span>
                                    <span class="right_cont bo_orange"><span class="txt">总金额</span>543,134</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <script type="text/javascript">
            $(".bxSlider").bxSlider({
                controls:false,
                minSlides:1,
                maxSlides:1,
                moveSlides:1,
                slideMargin:0
            });
        </script>
        </c:if>
        <!-- /정비총감 -->


        <!-- 총경리 메인메뉴 -->
        <c:if test="${userId eq 'admin2'}">
        <div class="bosslist">
            <ul>
                <li class="bo_contract">
                    <a href="<c:url value='/resources/html/mob/manage/m_8.html' />"><div class="bocont">
                        <h3>판매</h3>
                        <div class="numcont"><span>
                                <p class="bo_red">▲44</p>
                                <p class="bo_blue">▼954</p>
                        </span></div>
                        <div class="numdetail">
                            <span class="left_cont bo_green">45</span>
                            <span class="right_cont bo_orange">185</span>
                        </div>
                    </div></a>
                </li>
                <li class="bo_customer">
                    <div class="bocont">
                        <h3>고객</h3>
                        <div class="numcont"><span class="ac">44</span></div>
                        <div class="numdetail">
                            <span class="left_cont bo_green">8</span>
                            <span class="right_cont bo_red">▲5</span>
                        </div>
                    </div>
                </li>
                <li class="bo_repair">
                    <div class="bocont">
                        <h3>정비</h3>
                        <div class="numcont"><span class="bo_blue">▼1,172</span></div>
                        <div class="numdetail">
                            <span class="left_cont bo_green">102,012</span>
                            <span class="right_cont bo_red">▲ 317,266</span>
                        </div>
                    </div>
                </li>
                <li class="bo_part">
                    <div class="bocont">
                        <h3>부품</h3>
                        <div class="numcont"><span class="bo_red">▲367,182</span></div>
                        <div class="numdetail">
                            <span class="left_cont bo_green">460,321</span>
                            <span class="right_cont bo_orange">543,134</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        </c:if>

        <c:if test="${userId eq 'boss1'}">
        <div class="bosslist2">
            <ul class="bxSlider2">
                <li>
                    <ul>
                        <li class="bo_contract">
                            <a href="<c:url value='/resources/html/mob/manage/m_8.html' />"><div class="bocont">
                                <h3>판매</h3>
                                <div class="numcont">
                                <span>
                                        <p class="bo_red" style="width:48%;float:left;"><span class="txt">当月销售</span>▲44</p>
                                        <p class="bo_blue" style="width:48%;float:right"><span class="txt">今年销售</span>▼954</p>
                                </span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">库存周期</span>45</span>
                                    <span class="right_cont bo_orange"><span class="txt">库存数量</span>185</span>
                                </div>
                            </div></a>
                        </li>
                        <li class="bo_customer">
                            <div class="bocont">
                                <h3>고객</h3>
                                <div class="numcont"><span>
                                        <p><span class="txt">当月保客</span>39</p>
                                </span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">当天订单</span>8</span>
                                    <span class="right_cont bo_red"><span class="txt">当天成交</span>▲5</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="bo_repair">
                            <div class="bocont">
                                <h3>정비</h3>
                                <div class="numcont"><span class="bo_blue"><span class="txt">当月台次</span>▼1,172</span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">毛利</span>102,012</span>
                                    <span class="right_cont bo_red"><span class="txt">当月产值</span>▲ 317,266</span>
                                </div>
                            </div>
                        </li>
                        <li class="bo_part">
                            <div class="bocont">
                                <h3>부품</h3>
                                <div class="numcont"><span class="bo_red"><span class="txt">销售额</span>▲387,142</span></div>
                                <div class="numdetail">
                                    <span class="left_cont bo_green"><span class="txt">库存</span>460,321</span>
                                    <span class="right_cont bo_orange"><span class="txt">总金额</span>543,134</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <script type="text/javascript">
            $(".bxSlider2").bxSlider({
                controls:false,
                minSlides:1,
                maxSlides:1,
                moveSlides:1,
                slideMargin:0
            });
        </script>
        </c:if>
        <!-- // 총경리 메인메뉴 -->


        <!-- // 총경리 메인메뉴 -->

<%--        <div class="notice" onclick="javascript:goAlarm();"> --%>
        <div class="notice" >
            <ul>
                <li class="strong" id="noticeCampaign"><span><span class="campain" ><spring:message code='global.lbl.notice' /><!-- 공지 --></span><span class="date">[16-07-12]</span>新一代DMS系统试用评价</span></li>
                <li><span><span class="noti" id="noticeCampaign2"><spring:message code='global.lbl.cpi' /><!-- 캠페인 --></span><span class="date" >[16-07-12]</span>春季免检活动</span></li>
                <li><span><span class="event"><spring:message code='global.lbl.event' /><!-- 행사 --></span><span class="date" >[16-06-12]</span>2016年6月 百城团购活动</span></li>
            </ul>
        </div>
    </section>


    <!-- footer -->
    <footer id="footer">
        <p class="copyright">Copyright 2016 BHMC Corporation, All Rights Reserved. </p>
    </footer>
    <!-- //footer -->
    <%--
    <div id="docu_prev">이전</div>
    <div id="docu_top">TOP</div>
    --%>


<script>
//시스템 날짜 정보 가져오기.

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

$(document).ready(function() {



    var userAgent = navigator.userAgent.toLowerCase();
    //alert(userAgent);

    if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
    {
        document.location = 'bhmccp://getDeviceInfo?DEALER_CD='+dlrCd+'&USER_ID='+userId+'&LANGUAGE=&return_func=getDeviceInfo';
        //alert("I");
    }else /* if (userAgent.search("android") > -1) */
    {
        //alert("1");
        window.bhmccp.getDeviceInfo(dlrCd, userId, 'lannge', 'getDeviceInfo');
    }

    //var param="{\"PHONE_NO\":\"010-4444-4444\",\"DEVICE_ID\":\"1234\",\"OS\":\"I\",\"DEVICE_MODEL\":\"4321\",\"OS_VERSION\":\"1.0.1\",\"UPDATE_DATE\":\"\",\"APP_VERSION\":\"1.0.0\"}";

    //getDeviceInfo(param);
    //insertToCM1901T("");

    includeList = "N";


// var userId = "${userId}";   // 사용자코드

//  if(userId == "boss2"){
//     $("#favForBoss3").css("display", "none");
//     $("#favForBoss2").css("display", "block");
// }else if(userId == "boss3"){
//     $("#favForBoss2").css("display", "none");
//     $("#favForBoss3").css("display", "block");
// }
// else if(userId == "admin2"){
//     $("#favForBoss2").css("display", "none");
//     $("#favForBoss3").css("display", "none");
//     $(".bosslist2").css("display", "none");
//     $(".bosslist").css("display", "block");
// }else if(userId == "boss1"){
//     $("#favForBoss2").css("display", "none");
//     $("#favForBoss3").css("display", "none");
//     $(".bosslist").css("display", "none");
//     $(".bosslist2").css("display", "block");
// }


    $("#mwrap").attr("class", "mainarea");
});

// 외부URL테스트1
$("#noticeCampaign").click(function(){
    /* var browTp = "";
    browTp = getBrowTp();

    if(browTp == "safari" || browTp == "mozilla" ){ // ios
        document.location = 'bhmccp://openWebSite?url=http://www.sojump.com/jq/9018047.aspx';
        //document.location = 'bhmccp://openPopup?url=/bhmc-dms-web/resources/html/mob/cmm/surveyPopup2.html';
    }else { // android
        window.bhmccp.openWebSite('http://www.sojump.com/jq/9018047.aspx');
        //window.bhmccp.openPopup('/bhmc-dms-web/resources/html/mob/cmm/surveyPopup2.html');
    } */

    var userAgent = navigator.userAgent.toLowerCase();
    if (userAgent.search("android") > -1)
    {
        window.bhmccp.openWebSite('http://www.sojump.com/jq/9018047.aspx');
    }
    else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
    {
        document.location = 'bhmccp://openWebSite?url=http://www.sojump.com/jq/9018047.aspx';
    }

});

// 외부URL테스트2
$("#noticeCampaign2").click(function(){
    /* var browTp = "";
    browTp = getBrowTp();

    if(browTp == "safari" || browTp == "mozilla" ){ // ios
        //document.location = 'bhmccp://openWebSite?url=http://www.sojump.com/jq/9018047.aspx';
        document.location = 'bhmccp://openPopup?url=http://www.sojump.com/jq/9018047.aspx';
    }else { // android
        //window.bhmccp.openWebSite('http://www.sojump.com/jq/9018047.aspx');
        window.bhmccp.openPopup('http://www.sojump.com/jq/9018047.aspx');
    } */
    var userAgent = navigator.userAgent.toLowerCase();
    if (userAgent.search("android") > -1)
    {
        window.bhmccp.openPopup('http://www.sojump.com/jq/9018047.aspx');
    }
    else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
    {
        document.location = 'bhmccp://openPopup?url=http://www.sojump.com/jq/9018047.aspx';
    }

});

/* function getBrowTp(){
    var userAgent = navigator.userAgent.toLowerCase();

    if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (userAgent.indexOf("msie") != -1) ) {
                    return "msie";
                } else if (userAgent.indexOf("chrome") > -1) {
                    return "chrome";
                } else if (userAgent.indexOf("safari") > -1) {
                    return "safari";
                } else if (userAgent.indexOf("firefox") > -1) {
                    return "firefox";
                } else if (userAgent.indexOf("opera") > -1) {
                    return "opera";
                } else if (userAgent.indexOf("mozilla") > -1) {
                    return "mozilla";
                } else {
                    return "unknown";
                }
} */


 $("#salePart").click(function(){
     //location.href = "<c:url value='/resources/html/mob/manage/m_8.html' />";
 });

 function getDeviceInfo(param){ // js (앱에서 리턴되는 값 받는 스크립트)

     //alert("2");
     insertToCM1901T(param);

 }
 function insertToCM1901T(param) {
     //var param="{\"PHONE_NO\":\"12345678999\",\"DEVICE_ID\":\"1234\",\"OS\":\"A\",\"DEVICE_MODEL\":\"4321\",\"OS_VERSION\":\"1.0.1\",\"UPDATE_DATE\":\"20160828\"}";
     //alert(param);
     var result = JSON.parse(param);

     var obj = {
             dlrCd       :dlrCd,
             userId      :userId,
             userNm      :userNm,
             hpNo        :result.PHONE_NO,
             os          :result.OS,
             osVersion   :result.OS_VERSION,
             updateDate  :result.UPDATE_DATE,
             appVersion  :result.APP_VERSION
     };

     //alert(dlrCd+" "+userId+" "+userNm+" "+obj.hpNo+" "+obj.os+" "+obj.osVersion+" "+obj.updateDate+" "+obj.appVersion);


     $.ajax({
         url:"<c:url value='/mob/cmm/main/insertDeviceInfo.do'/>"
        ,data:kendo.stringify(obj)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,success:function(result) {

            //alert(result);
            /* var userAgent = navigator.userAgent.toLowerCase();
            if (userAgent.search("android") > -1)
            {
                window.bhmccp.removeUpdateInfo();
            }
            else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                    || (userAgent.search("ipad") > -1))
            {
                document.location = 'bhmccp://removeUpdateInfo';
            } */
        }
        ,error:function(jqXHR,status,error) {
            //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            //mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
           // alert(error);
            return false;
        }
    });
 }

</script>
<!-- //script -->

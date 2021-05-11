<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- content -->
    <section id="content_main">

        <div class="todolist">
            <!-- <div class="today"><span class="day"><strong>08</strong>Fri</span>2016.4</div> -->
            <ul onclick="javascript:goTodo();">
                <li class="unconfirmed"><span><spring:message code='global.btn.notConfirm' /><!-- 미확인 --><strong>4</strong></span></li>
                <li class="ongoing"><span><spring:message code='global.btn.confirm' /><!-- 확인 --><strong>1</strong></span></li>
                <li class="hold"><span><spring:message code='global.btn.complete' /><!-- 작업완료 --><strong>1</strong></span></li>
            </ul>
            <div class="today">2016年 7月7日 星期四</div>
        </div>

        <%-- 2016.04.20 김영필 차장 요청
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
        <div class="favoritelist">
            <ul class="bxSlider">
                <li>
                    <ul class="fmenu">
                        <li onclick="javascript:goMenu('<c:url value="/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrMain.do" />');"><span><span class="icon menu01"></span><span class="menu"><spring:message code='global.title.sumOrderCntDlr' /><!-- 종합오더현황-딜러 --></span></span></li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/par/pmm/itemMaster/selectItemMasterMain.do" />');"><span><span class="icon menu02"></span><span class="menu"><spring:message code='par.title.itemMasterSearch' /><!-- 품목마스터 조회 --></span></span></li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/par/pcm/purcOrd/selectPurcOrdMain.do" />');"><span><span class="icon menu03"></span><span class="menu"><spring:message code='par.title.purcOrdListSearch' /><!-- 오더현황 조회 --></span></span></li>
                        <li onclick="javascript:goMenu('<c:url value="/mob/par/pcm/receive/selectReceiveCnfmMain.do" />');"><span><span class="icon menu04"></span><span class="menu"><spring:message code='mob.title.mobileReceive' /><!-- 모바일입고 --></span></span></li>
                        <li><span><span class="icon menu05"></span><span class="menu"><spring:message code='global.title.tpVehicleMonitoring' /><!-- TP차량모니터링 --></span></span></li>
                        <li><span><span class="icon menu06"></span><span class="menu"><spring:message code='sal.title.confirmWearingVehicle' /><!-- 완성차 입고확정 --></span></span></li>
                        <li><span><span class="icon menu07"></span><span class="menu"><spring:message code='sal.title.stockState' /><!-- 재고상태관리 --></span></span></li>
                        <li><span><span class="icon menu08"></span><span class="menu"><spring:message code='sal.title.retailContractOrd' /><!-- 계약품의관리 --></span></span></li>
                    </ul>
                </li>
                <li>
                    <ul class="fmenu">
                        <li><span><span class="icon menu01"></span><span class="menu"><spring:message code='global.title.custinfo' /><!-- 고객정보 --></span></span></li>
                        <li><span><span class="icon menu02"></span><span class="menu"><spring:message code='global.title.vocHandling' /><!-- VOC 처리 --></span></span></li>
                        <li><span><span class="icon menu03"></span><span class="menu"><spring:message code='crm.title.campaign' /><!-- 캠페인 관리 --></span></span></li>
                        <li><span><span class="icon menu04"></span><span class="menu"><spring:message code='global.title.leadinfo' /><!-- 리드정보 --></span></span></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="notice" onclick="javascript:goAlarm();">
            <ul>
                <li><span><span class="campain"><spring:message code='global.lbl.cpi' /><!-- 캠페인 --></span><span class="date">[16-02-12]</span>2016年 2月 销售实数</span></li>
                <li><span><span class="noti"><spring:message code='global.lbl.notice' /><!-- 공지 --></span><span class="date">[16-02-12]</span>提醒订货发送</span></li>
                <li><span><span class="event"><spring:message code='global.lbl.event' /><!-- 행사 --></span><span class="date">[16-02-12]</span>2016年 1月 销售实数</span></li>
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

<!-- script -->
<script>
$(document).ready(function() {
    $(".bxSlider").bxSlider({
        controls:false,
        minSlides:1,
        maxSlides:1,
        moveSlides:1,
        slideMargin:0
        });
    $("#mwrap").attr("class", "mainarea");
});

</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript">
</script>
    <!-- content -->
    <section id="content_main">
        <div class="todolist">
            <ul>
                <li class="unconfirmed" onclick="goTodo(1)"><span><spring:message code='cmm.title.todoListPtl' /><!-- todo --><strong><sapn id="todoCnt" ></sapn></strong></span></li>
                <li class="ongoing" onclick="goAlarm()"><span><spring:message code='global.lbl.alarm' /><!-- 알람 --><strong><sapn id="alarmCnt">0</sapn></strong></span></li>
            </ul>
            <div class="today" id="noticeCampaign6">${today}</div>
        </div>

        <!-- 즐겨찾기 -->
        <div class="bosslist2 favoritelist listAll">
            <ul>
                <li>
                    <ul>
                        <li class="bo_repair">
                            <div class="bocont">
                                <h3>정비</h3>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.ser.repairTrustCredit' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${repairOrderCountForMonth}" type="number" /></span></p> <!-- 정비 위탁 대차 -->
                                    <p class="right_cont"><span class="txt"><spring:message code='mob.lbl.ser.serPrdAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${calcTotAmtForMonth}" type="number" maxFractionDigits="2" /></span></p><!-- 정비 생산액 -->
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.ser.serCalCredit' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${calcDocCntForMonth}" type="number" /></span></p> <!-- 서비스 정산 대차  -->
                                    <p class="right_cont"><span class="txt"><spring:message code='mob.lbl.ser.serSales' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${calcTotAmtExcludeItemPriceForMonth}" type="number" maxFractionDigits="2" /></span></p><!-- 정비 매출 -->
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.ser.avgCreditPrdAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${calcDocAvgAmgForMonth}" type="number" maxFractionDigits="2" /></span></p> <!-- 한 대차 생산액   -->
                                    <p class="right_cont"><span class="txt"><spring:message code='mob.lbl.ser.PrdAmtPerCar' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${calcVinAvgAmgForMonth}" type="number" maxFractionDigits="2" /></span></p><!-- 대당 생산액 -->
                                </div>
                            </div>
                        </li>
                        <li class="bo_part">
                            <div class="bocont">
                                <h3>부품</h3>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.par.docStockAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${stockAmt}" type="number" maxFractionDigits="2" /></span></p><!-- 장면 금액 -->
                                    <p class="right_cont bo_orange"><span class="txt"><spring:message code='mob.lbl.par.calcAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${usedAmtReceivedInAdvanced}" type="number" maxFractionDigits="2" /></span></p><!-- 공사 중 -->
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.par.stockAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${stockAvlbAmt}" type="number" maxFractionDigits="2" /></span></p><!-- 재고 금액 -->
                                    <p class="right_cont bo_orange"><span class="txt"><spring:message code='mob.lbl.par.todaySalAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${itemSalesAmtForDate}" type="number" maxFractionDigits="2" /></span></p><!-- 당일 판매 금액 -->
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.par.sendOrdCnt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${processingPurcharsOrderCount}" type="number" /></span></p><!-- 발송 주문 수 -->
                                    <p class="right_cont bo_orange"><span class="txt"><spring:message code='mob.lbl.par.proceOrdCnt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${completedPurcharsOrderCount}" type="number" /></span></p><!-- 처리 주문수 -->
                                </div>
                                <div class="numdetail">
                                    <p class="left_cont bo_green"><span class="txt"><spring:message code='mob.lbl.par.dayGiAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${itemGiAmtForDate}" type="number" maxFractionDigits="2" /></span></p><!-- 일 출고 금액 -->
                                    <p class="right_cont bo_orange"><span class="txt"><spring:message code='mob.lbl.par.dayGrAmt' /></span><span class="txt_num" id="____"><fmt:formatNumber value="${itemGrAmtForDate}" type="number" maxFractionDigits="2" /></span></p><!-- 일 입고 금액 -->
                                </div>
                            </div>
                        </li>
                        <li>
                            <!-- 월별 서비스생산금액 차트 -->
                            <div id="monthlyCalcTotAmountChart" style="height: 300px;"></div>
                        </li>
                        <li>
                            <!-- 당월 차종별 서비스 정산 차트 -->
                            <div id="calcDocByCarlineChart" style="height: 340px;"></div>
                        </li>
                        <li>
                            <!-- 당월 수리유형별 서비스 정산 차트 -->
                            <div id="calcDocByRepoirOrderTypeChart" style="height: 340px;"></div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </section>

    <footer id="footer">
        <p class="copyright">Copyright 2016 BHMC Corporation, All Rights Reserved. </p>
    </footer>

<script>
var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

$(document).ready(function() {
    $("#mwrap").attr("class", "mainarea");

    //월별 서비스생산금액 차트
    monthlyCalcTotAmountChart();
    //당월 차종별 서비스 정산 차트
    calcDocByCarlineChart();
    //당월 수리유형별 서비스 정산 차트
    calcDocByRepoirOrderTypeChart();

    $(".fmenu li").click(function(obj){
        var url = $(this).attr("url");
        goMenu(url);
    });
    requestDeviceInfo();
});

//월별 서비스생산금액 차트
function monthlyCalcTotAmountChart(){
    $("#monthlyCalcTotAmountChart").kendoChart({
        dataSource: {
            transport: {
                read: {
                    url: "<c:url value='/mob/cmm/main/selectMonthlyCalcTotAmtList.do' />",
                    dataType: "json"
                }
            }
        },
        title: {
            text: "<spring:message code='mob.title.monthlyCalcTotAmountChart' />"
        },
        legend: {
            visible: false
        },
        seriesDefaults: {
            type: "column"
        },
        series: [{
            field: "prevYear"
        },{
            field: "currYear"
        }
        ],
        categoryAxis: {
            field: "category",
            crosshair: {
                visible: true
            }
        },
        valueAxis: {
            labels: {
                format: "N0"
            }
        },
        tooltip: {
            visible: true,
            format: "N0"
        }
    });
}

//당월 차종별 서비스 정산 차트
function calcDocByCarlineChart(){
    $("#calcDocByCarlineChart").kendoChart({
        dataSource: {
            transport: {
                read: {
                    url: "<c:url value='/mob/cmm/main/selectCalcDocListByCarline.do' />",
                    dataType: "json"
                }
            }
        },
        title: {
            text: "<spring:message code='mob.title.calcDocByCarlineChart' />"
        },
        legend: {
            position: "right"
        },
        //seriesColors: ["#33567F","#3A6190","#416C9F","#4774AB","#4C7DB7","#668DC2","#8AA2C9","#A3B5D4","#B9C6DD","#CCD5E6"],
        seriesColors: ["#E8214E","#5987b2","#e6effa","#76a915","#c5f7c5","#ffa419","#ffcccc","#d8b2d8","#20b2aa","#ff3737"],
        series: [{
            field: "value",
            type: "donut",
            border: {
                width: 5,
                color: "#FFFFFF"
            },
            overlay: {
                gradient: "none"
            },
            labels:{
                visible: true,
                position: "center",
                background: "none",
                template: "#= kendo.format('{0:P}', percentage)#"
            }
        }],
        categoryAxis: {
            field: "category"
        },
        tooltip: {
            visible: true,
            template: "#= category #: #= kendo.format('{0:P}', percentage) #"
        }
    });
}

//당월 수리유형별 서비스 정산 차트
function calcDocByRepoirOrderTypeChart(){
    $("#calcDocByRepoirOrderTypeChart").kendoChart({
        dataSource: {
            transport: {
                read: {
                    url: "<c:url value='/mob/cmm/main/selectCalcDocListByRepairOrderType.do' />",
                    dataType: "json"
                }
            }
        },
        title: {
            text: "<spring:message code='mob.title.calcDocByRepoirOrderTypeChart' />"
        },
        legend: {
            position: "right"
        },
        //seriesColors: ["#33567F","#3A6190","#416C9F","#4774AB","#4C7DB7","#668DC2","#8AA2C9","#A3B5D4","#B9C6DD","#CCD5E6"],
        seriesColors: ["#E8214E","#5987b2","#e6effa","#76a915","#c5f7c5","#ffa419","#ffcccc","#d8b2d8","#20b2aa","#ff3737"],
        series: [{
            field: "value",
            type: "donut",
            border: {
                width: 5,
                color: "#FFFFFF"
            },
            overlay: {
                gradient: "none"
            },
            labels:{
                visible: true,
                position: "center",
                background: "none",
                template: "#= kendo.format('{0:P}', percentage)#"
            }
        }],
        categoryAxis: {
            field: "category"
        },
        tooltip: {
            visible: true,
            template: "#= category #: #= kendo.format('{0:P}', percentage) #"
        }
    });
}

function getDeviceInfo(param){ // js (앱에서 리턴되는 값 받는 스크립트)
    insertToCM1901T(param);
}
function insertToCM1901T(param) {
    var result = JSON.parse(param);
    var obj = {
             dlrCd:dlrCd,
             userId:userId,
             userNm:userNm,
             hpNo:result.PHONE_NO,
             os:result.OS,
             osVersion:result.OS_VERSION,
             updateDate:result.UPDATE_DATE,
             appVersion:result.APP_VERSION,
             deviceId:result.DEVICE_ID
    };
    $.ajax({
         url:"<c:url value='/mob/cmm/main/insertDeviceInfo.do'/>"
        ,data:kendo.stringify(obj)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,success:function(result) {
            requestCarInfoAndReadSourceData();
        }
        ,error:function(jqXHR,status,error) {
            requestCarInfoAndReadSourceData();
            return false;
        }
    });
 }

function requestCarInfoAndReadSourceData(){
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location='bhmccp://SAVE_CnR?&return_func=resultSave';
        }else
        {
            window.bhmccp.SAVE_CnR('resultSave');
        }
    }catch(e){

    }
}
function requestDeviceInfo(){
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location = 'bhmccp://getDeviceInfo?DEALER_CD='+dlrCd+'&USER_ID='+userId+'&LANGUAGE=&return_func=getDeviceInfo';
        }else
        {
            window.bhmccp.getDeviceInfo(dlrCd, userId, 'lannge', 'getDeviceInfo');
        }
    }catch(e){

    }
}
</script>

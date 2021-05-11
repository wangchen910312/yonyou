<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.vticker.js"/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.css"/>">

<!-- 서비스예약 -->
<div class="content">

    <div class="board_header">
        <div class="board_logo"></div>
        <h1><spring:message code="ser.title.todayResvStat" /><!-- 예약현황 --></h1>
        <div class="date_time"></div>
    </div>

    <div class="table_list_kb table_scroll" style="overflow-y:hidden;">
        <table>
            <caption></caption>
            <colgroup>
            <col style="width:8%;">
            <col style="width:10%;">
            <col style="width:10%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="txt_white" class="th_bg" style="height:20px"><spring:message code="ser.lbl.carNo" />(<span class="totalCnt">0</span>)</th><!-- 차량번호 -->
                    <th scope="col" class="txt_white"><spring:message code="ser.lbl.driver" /></th><!-- 방문자 -->
                    <th scope="col" class="txt_white"><spring:message code="ser.lbl.carlineNm" /></th><!-- 차종명 -->
                    <th scope="col" class="txt_white"><spring:message code="ser.lbl.repairResvDt" /></th><!-- 수리예약시간 -->
                    <th scope="col" class="txt_white"><spring:message code="ser.lbl.tecAppoint" /></th><!-- 지정서비스고문 -->
                    <th scope="col" class="txt_white"><spring:message code="ser.lbl.resvStat" /></th><!-- 예약상태 -->
                </tr>
            </thead>
            <tbody id="template"></tbody>
        </table>
        <div style="display:none;">
            <a id="stopScroll" href="#">Stop</a>
            <a id="startScroll" href="#">Start</a>
        </div>
    </div>

</div>

<script id="workProcessBoardTemplate" type="text/x-kendo-template">
    # var totalCnt = data.length; #
    # for (var i = 0; i < data.length; i++) { #
    <tr>
        # if (data[i].resvReptStatCd == "01") {#
            <th scope="row" style="height:20px"><font color="yellow">#= dms.string.strNvl(data[i].carRegNo) #</font></th>
        # } else if (data[i].resvReptStatCd == "02") {#
            <th scope="row" style="height:20px"><font color="red">#= dms.string.strNvl(data[i].carRegNo) #</font></th>
        # } else {#
            <th scope="row" style="height:20px">#= dms.string.strNvl(data[i].carRegNo) #</th>
        # }#
        <td>#= dms.string.strNvl(data[i].driverNm) #</td>
        <td class="bg_gray sc_event">#= data[i].carlineNm #</td>
        <td>#= kendo.toString(kendo.parseDate(data[i].serResvStartDt), 'MM-dd HH:mm') #</td>
        <td>#= dms.string.strNvl(data[i].tecNm) #</td>
        <td>#= dms.string.strNvl(data[i].resvStatCdNm) #</td>
    </tr>
    # } #

    # for (var i = 0; i < minRefreshCnt - data.length; i++) { #
    <tr>
        <th scope="row" style="height:20px"></th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    # } #

    # $(".totalCnt").html(totalCnt); #
</script>

<script type="text/javascript">

var sysDate = new Date("<c:out value='${sysDate}' />");
var dlrCd = "${dlrCd}";
var totResvCnt = 0;
var minRefreshCnt = 9;

var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

show_clock = function() {
    var date = new Date();
    $(".date_time").html(formatToday + " " + date.toLocaleTimeString());

    setTimeout("show_clock()",1000);
};


$(document).ready(function() {
    refresh();
    show_clock();

    var wHeight, header1, header2;
    wHeight = $(window).height();
    header1 = $("div.board_header").outerHeight();
    header2 = $("div.table_header").outerHeight();
    $("div.table_scroll").css("max-height", (wHeight - header1 - header2 - 1 - 40)  + "px");

    $("#template").totemticker({
        message      : 'Ticker Loaded'
        ,row_height  : '30px'
        ,stop        : '#stopScroll'
        ,start       : '#startScroll'
        ,speed       : 300
        ,interval    : 3000
        ,max_items   : 1
        ,mousestop   : false
        ,direction   : 'up'
    });
});

function refresh() {
    $.ajax({
        url:"<c:url value='/ser/rev/reservationReceipt/selectKanbanReservation.do' />"
        ,data:JSON.stringify({sSerResvStartFromDt:sysDate, sSerResvStartToDt:sysDate, sDlrCd:dlrCd, sResvIvalCd:'01'})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            totResvCnt = result.data.length < minRefreshCnt ? minRefreshCnt : result.data.length;
            setTimeout(refresh, Number(totResvCnt) * 3000);
            var workProcessBoardTemplate = kendo.template($("#workProcessBoardTemplate").html());
            $("#template").html(workProcessBoardTemplate(result.data));
            if(result.data.length <= minRefreshCnt){
                $("#stopScroll").click();
            }else{
                $("#startScroll").click();
            }
        }
    });
}

</script>

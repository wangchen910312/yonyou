<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>


<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/mob/mobCommon.js"/>"></script>



<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<style>
.k-scheduler-edit-form .k-edit-form-container, .k-scheduler-timezones .k-edit-form-container { width:520px;}
.k-window>div.k-popup-edit-form { padding:1em 0;}
.k-edit-form-container .k-edit-buttons { display:block;}
</style>



<div class="header_area">
    <h1 class="title_basic"><spring:message code="par.title.partReserveStatus" /> <!-- 예약접수현황 --> </h1>
    <div class="btn_right">
        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /> <!-- 초기화 --> </button>
        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /> <!-- 조회 --></button>
    </div>
</div>

<div class="table_form table_form_v2 pt0">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:25%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code="ser.lbl.custNm" /> <!-- 고객명 --></th>
                <td>
                    <input type="text" id="sDriverNm" class="form_input"/>
                </td>
                <th scope="row"><spring:message code="ser.lbl.carNo" /> <!-- 차량번호 --></th>
                <td>
                    <input type="f_text" id="sCarNo" class="form_input"/>
                </td>
                <th scope="row"><spring:message code="ser.lbl.resvStat" /> <!-- 예약상태 --></th>
                <td>
                    <input type="f_text" id="sResvStatCd" class="form_comboBox" />
                </td>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>

<div class="reservation_scheduler">
    <div id="scheduler"></div>
</div>


<script id="groupHeaderTemplate" type="text/x-kendo-template">

    <div class="groupHeader_th">
        <span class="th_txt">#=text#</span>
        <%--<button type="button" class="th_btnAdd" onclick="addEvent(this);">+</button>--%>
    </div>

</script>

<script id="work_event_template" type="text/x-kendo-template">
    <div class="work_event_template">#:resvDocNo #</div>
</script>


<script id="scheduler_viewTooltip_template" type="text/x-kendo-template">
    <div id="scheduler_viewTooltip" ></div>
</script>


<script id="majorTime_template" type="text/x-kendo-template">
    #=kendo.toString(date, "t")#
</script>

<script id="reservation_event_template" type="text/x-kendo-template">
    <div class="reservation_event_template">
        <p class="time">#:chgDate2TimeStr(start) #</p>
        <p class="txt1"><strong>#:changeResvStatCd(resvStatCd) #</strong></p>
        <p class="txt2"><strong>#:trimNull(carRegNo) #</strong></p>
        <p class="txt3"><strong>#:trimNull(driverNm) #</strong></p>
        <p class="txt4">#:trimNull(driverHpNo) #</p>
        <p class="txt5">#:trimNull(resvDocNo) #</p>
        <a onclick="detailEvent('#:resvDocNo#','#:vinNo#','#:trimNull(carRegNo)#','#:trimNull(driverNm)#');" class="btn_detail"></a>
    </div>
</script>

<script>



var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자



//dateFormat :yyyy-MM-dd 는 오류남.
var sysDate = new Date("<c:out value='${sysDate}' />");

//var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
//var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";


var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " " + "${resvAvlbStartHm}";
var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " " + "${resvAvlbEndHm}";


//var startTime;
//var endTime;

var tecId;
var row = 0;
var saveYn = false;

var resvStatCdList             = [];
var resvStatCdObj              = {};
//resvStatCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${resvStatCdList}" varStatus="status">
resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
resvStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>







$(document).ready(function() {




  //조회조건 - 예약상태
    $("#sResvStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource :resvStatCdList
        ,index :0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

  $("#btnReset").click(function(){
     $("#sDriverNm").val("");
     $("#sCarNo").val("");
     $("#sResvStatCd").data("kendoExtDropDownList").value("");
  });

  $("#btnSearch").click(function(){
      $("#scheduler").data("kendoScheduler").dataSource.read();
   });


    var workAssignScheduleDs = new kendo.data.SchedulerDataSource({
        transport :{
            read :{
                url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceipts.do' />"
                //url :"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                ,dataType :"json"
                ,type :"POST"
                ,contentType :"application/json"
            }
            ,update:{}
            ,create:{}
            ,destroy:{}
            ,parameterMap :function(options, operation) {
                if (operation === "read" ) {
                    var params = {};
                    params["sort"] = options.sort;

                    params["sDriverNm"] = $("#sDriverNm").val();
                    params["sCarRegNo"] = $("#sCarNo").val();
                    params["sListType"] = '01';
                    params["sResvStatCd"] = $("#sResvStatCd").data("kendoExtDropDownList").value();


                    console.log(kendo.stringify(params))
                    return kendo.stringify(params);
                }
                else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            data:"data",
            total:"total",
            model :{
                id :"resvDocNo"
                ,fields :{

                    resvDocNo :{type :"string"}
                    ,start:{ type:"date", from:"serResvStartDt"}
                    ,end:{ type:"date", from:"serResvEndDt"}
                    /*
                    rpirCd :{type :"string"}
                    ,start:{ type:"date", from:"wrkStartDt"}
                    ,end:{ type:"date", from:"wrkEndDt"}
                    */
                }

            }
        }
    });


    //scheduler_viewLayer tooltip
    var tooltip = $("#scheduler").kendoTooltip({
        filter:".work_event_template",
        //show:add_class,
        autoHide:false,
        showOn:"click",
        //showOn:"focus",
        position:"top",
        width:186,
        height:105,
        content:kendo.template($('#scheduler_viewTooltip_template').html())
    }).data("kendoTooltip");



    //scheduler
    $("#scheduler").kendoScheduler({
        //date:new Date(),
        date:sysDate,
        height:545,
        allDaySlot:false,
        startTime:new Date(startTime),
        endTime:new Date(endTime),
        //showWorkHours:false,

        allDaySlot:false,
        selectable:true,

        footer:false,
        messages:{
            today:"<spring:message code='ser.lbl.today' />"
        },
        views:[{
            type:"timeline",
            eventHeight:92,
            columnWidth:208,
            //columnWidth:308,
            minorTickCount:2,
            //eventTemplate:$("#work_event_template").html()
            majorTimeHeaderTemplate:$("#majorTime_template").html(),
            eventTemplate:$("#reservation_event_template").html()
        }],
        editable:{
            create:false,
            update:false,
            destroy:false,
            move:true,
            window:{
                animation:false
            }
        },
        dataSource :workAssignScheduleDs,

        moveEnd:function(e) {
        },

        resizeEnd:function(e) {
        },

        navigate:function(e){
            // 달력 날짜 클릭시 클릭된 날짜 가져오기
            $("#scheduler").data("kendoScheduler").dataSource.read();
        }

    });

    var scheduler = $("#scheduler").data("kendoScheduler");
    $("a.details_btn").on("click", function(){
        var detailArea = $(this).parent("div.details_area");
        if(detailArea.hasClass("closed")){
            detailArea.removeClass("closed");
        }else{
            detailArea.addClass("closed");
        }
        scheduler.refresh();
    });


    $("#btnSearchRoList").click(function(){
        $("#roListGrid").data("kendoExtGrid").dataSource.read();
        if($("#sRoDocNo").val() != null || $("#sRoDocNo").val() != ""){
            $("#roDocNo").val($("#sRoDocNo").val());
        }
    });

});








function detailEvent(resvDocNo, vinNo, carRegNo, driverNm){
    if(resvDocNo == null || resvDocNo == ""){
        return false;
    }
    /*
    var roDsData = $('#roListGrid').data('kendoExtGrid').dataSource._data;
    var roIdx = 0;
    for(var i=0; i < roDsData.length; i++){
        if(roDsData[i].roDocNo == roDocNo){
            roIdx = i;
        }
    }
    */
    console.log("vinNo==="+vinNo);
    detailPop = dms.window.popup({
        windowId :"detailPop"
        ,width:"800px"
        ,height:"455px"
        ,title :"<spring:message code='ser.menu.reserCreate' /> <spring:message code='global.title.detail' />"   // 예약현황 상세
        ,content :{
            url :"<c:url value='/mob/waSer/rev/reservationReceipt/selectWaReservationReceiptDtlPopup.do?lang=ko'/>"
            ,data :{
                "resvDocNo" :resvDocNo // ro번호
                ,"roDocNo" :resvDocNo
                ,"vinNo" :vinNo
                ,"carRegNo":carRegNo
                ,"driverNm":driverNm
                
                /*
                ,"driverNm" :roDsData[roIdx].driverNm // 고객명
                ,"carRegNo" :roDsData[roIdx].carRegNo // 차량번호
                ,"roStatCdNm" :roStatCdGrid(roDsData[roIdx].roStatCd) // 수리상태
                ,"roDt" :chgServerDateTime2Str2(roDsData[roIdx].roDt) // Ro 생성일자
                ,"roTpNm" :roTpCdGrid(roDsData[roIdx].roTp) // Ro 유형
                */
            }
        }
    });
}




changeResvStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = resvStatCdObj[val];
    }
    return returnVal;
};


//scheduler_viewLayer tooltip addClass
function add_class() {
    this.popup.element.addClass("scheduler_tooltip");
}


</script>
<!-- //script -->

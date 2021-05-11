<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tabletMain.css"/>">
<style type="text/css">
#waMenu{height:500px; background-color: green;}
#waMenu li{float: left; width: 25%; height: 100px; outline: 1px black solid;}
</style>

<div id="wrap">
    <p id="waMenuBtn2">오늘일정</p>
    <div class="reserv_scheduler">
        <div id="scheduler" data-role="scroller"></div>
    </div>
    <div id="waMenu" style="display: none;">
        <ul>
            <li><spring:message code="ser.menu.reserCreate" /></li>
            <li><spring:message code="ser.menu.preCheckCreate" /></li>
            <li id="selectRepairOrderMain"><spring:message code="ser.btn.roInsert" /></li>
            <li><spring:message code="ser.menu.assignMng" /></li>
            <li><spring:message code="ser.menu.wkProcStat" /></li>
            <li><spring:message code="ser.menu.qtTestMng" /></li>
            <li><spring:message code="ser.title.calcMng" /></li>
            <li><spring:message code="ser.title.reciveMng" /></li>
        </ul>
    </div>
</div>

<%-- <section id="window_sa" class="pop_wrap" style="display:none">
    <div class="st01_pop">
        <ul>
            <li><a href="#" class="disable"><spring:message code="ser.menu.reserCreate" /></a></li>
            <li><a href="#"><spring:message code="ser.menu.preCheckCreate" /></a></li>
            <li><a href="#"><spring:message code="ser.btn.roInsert" /></a></li>
            <li><a href="#"><spring:message code="ser.menu.assignMng" /></a></li>
            <li><a href="#"><spring:message code="ser.menu.wkProcStat" /></a></li>
            <li><a href="#"><spring:message code="ser.menu.qtTestMng" /></a></li>
            <li><a href="#"><spring:message code="ser.title.calcMng" /></a></li>
            <li><a href="#"><spring:message code="ser.title.reciveMng" /></a></li>
        </ul>
    </div>
</section> --%>

<script id="resvInfoView" type="text/x-kendo-template">
    #if(noResvTp == '02') {#
        <div class="noresvtp">
            #=title#:<spring:message code="ser.lbl.doNotResv" />
        </div>
    #} else {#
        <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #if(dms.string.strNvl(title) != ''){#
                #= title#
            #} else {#
                #= driverNm#
            #}#
            <br>
            #=resvDocNo#
        </div>
    #}#
</script>

<script type="text/javascript">

//Confirm Modal
var confirmWindow = $("<div/>").kendoWindow({
    title:""
    ,resizable:false
    ,modal:true
    ,width:300
});

var sysDate = new Date("<c:out value='${sysDate}' />");

var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

var diffStartTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
var diffEndTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 23:59";

$(document).ready(function() {

    $( "#waMenuBtn2, #waMenuBtn" ).click(function() {
        $( "#waMenu" ).toggle( "slow" );
        $( ".reserv_scheduler" ).toggle( "slow" );
    });

    $("#selectRepairOrderMain").click(function(){
        $.ajax({
            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />"
            ,data:""
            ,type:'GET'
            ,success:function(result) {
                $("#ajaxDiv").html(result);
            }
        });
    });


    var minorTickCount = 2;
    var dataTextField = "bayNm";
    var sysDate = new Date("<c:out value='${sysDate}' />");
    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";
    var toDay = new Date();
    var resvToDay = new Date();

    $("#scheduler").kendoScheduler({
        date:sysDate
       ,startTime:new Date(startTime)
       ,endTime:new Date(endTime)
       ,majorTick:60
       ,minorTickCount:minorTickCount
       //,minorTickCount:1
       ,editable:false
       ,footer:false
       ,allDaySlot:false
       ,eventTemplate:$("#resvInfoView").html()
       ,views:[{ type:"day" }]
       ,autoBind:true
       ,selectable:true
       ,navigate:function(e){
           resvToDay = new Date(e.date);
           $("#scheduler").data("kendoScheduler").dataSource.read();
       }
       ,dataSource:{
           batch:true
           ,transport:{
               read:{
                   url:"<c:url value='/ser/rev/reservationReceipt/selectKanbanReservation.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["sDlrCd"] = "${dlrCd}";
                       params["sListType"] = "02";
                       //params["sResvIvalCd"] = "${serSetInfo.resvIvalCd}";
                       params["sSerResvStartFromDt"] = kendo.parseDate(kendo.toString(resvToDay, "yyyy-MM-dd"));
                       params["sSerResvStartToDt"] = kendo.parseDate(kendo.toString(resvToDay, "yyyy-MM-dd"));
                       params["sSaNm"] = $("#sKanbanSaNm").val();
                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               data:"data"
               ,total:"total"
               ,model:{
                   id:"resvDocNo"
                   ,fields:{
                       dlrCd:{type:"string"}
                       ,resvDocNo:{type:"string"}
                       ,carOwnerId:{type:"string"}
                       ,carOwnerNm:{type:"string"}
                       ,driverNm:{type:"string"}
                       ,saId:{type:"string"}
                       ,bayNo:{type:"string"}
                       ,start:{type:"date", from:"serResvStartDt"}
                       ,end:{type:"date", from:"serResvEndDt"}
                       ,title:{type:"string", from:"carRegNo"}
                       ,vinNo:{type:"string", from:"vinNo"}
                       ,noResvTp:{type:"string"}
                       ,resvDt:{type:"date"}
                   }
               }
           }
       }
       ,group:{
           resources:["BAY"]
       }
       ,resources:[
           {
               field:"bayNo"
               ,name:"BAY"
               ,title:"BAY"
               ,dataTextField:dataTextField
               ,dataValueField:"bayNo"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                           ,dataType:"json"
                           ,type:"POST"
                           ,contentType:"application/json"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               params["sDlrCd"] = "${dlrCd}";
                               params["sVrYn"] = "Y";

                               return kendo.stringify(params);

                           }else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       data:"data"
                       ,total:"total"
                       ,model:{
                           id:"bayNo"
                           ,fields:{
                               dlrCd:{type:"string"}
                               ,bayNo:{type:"string"}
                               ,bayNm:{type:"string"}
                           }
                       }
                   }
               }
           }
       ]
       ,change:function(event) {

           resvStart = event.start;
           resvEnd = event.end;
           resvResource = event.resources;

           resvEventData = event.sender.dataSource._data;
       }
       ,dataBound:function(event) {
           resvToDay = new Date($("#scheduler").data("kendoScheduler")._model.selectedDate);
           resvEventData = event.sender.dataSource._data;
           $("#scheduler > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
       }
   });

});
</script>

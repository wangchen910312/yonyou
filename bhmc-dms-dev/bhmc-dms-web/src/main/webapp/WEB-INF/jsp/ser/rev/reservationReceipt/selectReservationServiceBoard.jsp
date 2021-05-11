<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 서비스예약 -->
<div class="content">

<section class="group">
    <div class="header_area">
        <%-- <div class="btn_left">
            <button type="button" id="serBoardSet" class="btn_m"><spring:message code="ser.btn.serBoardSet" /><!-- 서비스보드설정 --></button>
            <button type="button" id="serPlan" class="btn_m"><spring:message code="ser.btn.resvSerBoard" /><!-- 예약계획보드 --></button>
            <button type="button" id="serPlan" class="btn_m"><spring:message code="ser.btn.carAcceptAlram" /><!-- 예약계획보드 --></button>
        </div> --%>
    </div>

    <div id="scheduler"></div>
</section>

</div>


<script id="info-confirmation" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='ser.lbl.resvInfo' var='resvInfo' /><spring:message code='global.info.callSelectItem' arguments='${resvInfo},' /></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<script id="info-init" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<!-- 스케쥴러에 나타나는  예약 정보 -->
<script id="resvInfoView" type="text/x-kendo-template">
    #if(noResvTp == '02') {#
        <div class="noresvtp">
            #=title#:<spring:message code="ser.lbl.doNotResv" />
        </div>
    #} else {#
        <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #=title#
        </div>
    #}#
</script>

<script id="resvItemTooltip" type="text/x-kendo-template">
    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#

    #if(model) {#

        <div>
            <div class="carDetail_popup" style="top:-80%; left:5%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            #if(model.noResvTp != '02') {#
                            <li><spring:message code="ser.lbl.resvDocNo" />:#=model.resvDocNo#</li>
                            <li><spring:message code="sal.lbl.usrNm" />:#=model.driverNm#</li>
                            <li><spring:message code="ser.lbl.bayNo" />:#=dms.string.strNvl(model.bayNo)#</li>
                            <li><spring:message code="ser.lbl.saNm" />:#=dms.string.strNvl(model.saNm)#</li>
                            #}#
                            <li><spring:message code="ser.lbl.resvDt" />:#=kendo.format('{0:HH:mm}', model.start)# ~ #=kendo.format('{0:HH:mm}', model.end)#</li>
                        </ul>
                    </div>
                </div>
            </div>
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

$(document).ready(function() {

    /********************** 예약현황보드 **********************/
    var sysDate = new Date("<c:out value='${sysDate}' />");

    var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
    formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
    formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
    formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";
    var toDay = new Date();

    $("#scheduler").kendoScheduler({
        date:sysDate
       ,startTime:new Date(startTime)
       ,endTime:new Date(endTime)
       ,editable:false
       ,footer:false
       ,allDaySlot:false
       ,eventTemplate:$("#resvInfoView").html()
       ,views:[{ type:"day" }]
       ,dataSource:{
           batch:true
           ,transport:{
               read:{
                   url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceipts.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["sDlrCd"] = "${dlrCd}";
                       params["sResvFromDt"] = kendo.parseDate(kendo.toString(toDay, "yyyy-MM-dd"));
                       params["sResvToDt"] = kendo.parseDate(kendo.toString(toDay, "yyyy-MM-dd"));

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
                       ,tecId:{type:"string", from:"saId"}
                       ,bayNo:{type:"string"}
                       ,start:{type:"date", from:"serResvStartDt"}
                       ,end:{type:"date", from:"serResvEndDt"}
                       ,title:{type:"string", from:"carRegNo"}
                       ,vinNo:{type:"string", from:"vinNo"}
                       ,noResvTp:{type:"string"}
                       ,custRemark:{type:"string"}
                   }
               }
           }
       }
       ,group:{
           resources:["SA"]
       }
       ,resources:[
           {
               field:"tecId"
               ,name:"SA"
               ,title:"SA"
               ,dataTextField:"tecNm"
               ,dataValueField:"tecId"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                           ,dataType:"json"
                           ,type:"POST"
                           ,contentType:"application/json"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               params["sDlrCd"] = "${dlrCd}";

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
                           id:"tecId"
                           ,fields:{
                               dlrCd:{type:"string"}
                               ,tecId:{type:"string"}
                               ,tecNm:{type:"string"}
                           }
                       }
                   }
               }
           }
       ]
       ,change:function(event) {

           var start = event.start;
           var end = event.end;
           var resource = event.resources;

           $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event' , function(e) {

               var scheduler = $("#scheduler").getKendoScheduler();
               var element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
               var uid = scheduler.occurrenceByUid(element.data("uid"));

               if ( uid ) {

               } else {            // 신규

                   $("#bayNo").val(resource.bayNo);
                   $("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value(start);
                   slidePlay();

               }
           });
       }
       ,dataBound:function() {
           toDay = new Date($("#scheduler").data("kendoScheduler")._model.selectedDate);
           $(".k-scheduler-toolbar ul:nth-child(2)").hide();      // day button delete
           $(".k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();   // 오늘날짜 삭제
           $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
           $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  " + formatToday);

       }
   });

    // 예약스케줄러
    var scheduler = $("#scheduler").data("kendoScheduler");

    // 스케줄러 툴팁
    $("#scheduler").kendoTooltip({
        filter:".k-event",
        position:"top",
        width:200,
        height:60,
        content:kendo.template($('#resvItemTooltip').html())
    });

    $("#scheduler > .k-scheduler-toolbar .k-nav-prev").click(function(e){
        toDay.setDate(toDay.getDate()-1);
        $("#scheduler1").data("kendoScheduler").dataSource.read();
    });
    $("#scheduler > .k-scheduler-toolbar .k-nav-next").click(function(e){
        toDay.setDate(toDay.getDate()+1);
        $("#scheduler1").data("kendoScheduler").dataSource.read();
    });

    var interval = setInterval(refresh, 30000);

    function refresh() {
        scheduler.dataSource.read();
    }
});
</script>

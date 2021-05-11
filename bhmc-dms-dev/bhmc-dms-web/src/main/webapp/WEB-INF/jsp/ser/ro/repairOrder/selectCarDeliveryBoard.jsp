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
            <button type="button" id="serPlan" class="btn_m"><spring:message code="ser.btn.carDeliveryBoard" /><!-- 차량인도보드 --></button>
            <button type="button" id="serPlan" class="btn_m"><spring:message code="ser.btn.carDeliveryInfo" /><!-- 차량인도안내 --></button>
        </div> --%>
    </div>

    <div id="scheduler"></div>
</section>

</div>


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

    $("#scheduler").kendoScheduler({
        date:sysDate
       ,startTime:new Date(startTime)
       ,endTime:new Date(endTime)
       ,editable:false
       ,footer:false
       ,allDaySlot:false
       ,views:[
           { type:"week" }
       ]
       ,dataSource:{
           batch:true
           ,transport:{
               read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};
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
                   id:"roDocNo"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,roDocNo:{type:"string"}
                       ,start:{type:"date", from:"expcDlStartDt" }
                       ,end:{type:"date", from:"expcDlDt" }
                       ,roGrpNo:{type:"string"}
                       ,tecId:{type:"string"}
                       ,tecNm:{type:"string" }
                       ,title:{type:"string", from:"carRegNo"}
                       ,vinNo:{type:"string"}
                       ,carOwnerNm:{type:"string"}
                   }
               }
           }
       }
       ,dataBinding:function() {
           $(".k-scheduler-toolbar ul:nth-child(2)").hide();      // day button delete
           $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
           $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  " + formatToday);

       }
   });

    // 예약스케줄러
    var scheduler = $("#scheduler").data("kendoScheduler");

    var interval = setInterval(refresh, 30000);

    function refresh() {
        scheduler.dataSource.read();
    }
});
</script>

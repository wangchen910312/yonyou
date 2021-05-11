<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 조회 조건 타이틀 시작 -->
<div class="header_area">
    <h1 class="title_basic">维修进度看板-钣金喷漆</h1><!-- RO작업배정관리 -->
</div>
<!-- 조회 조건 타이틀 종료 -->
<div id="scheduler"></div>
<div id="scheduler1" style="height:200"></div>
<div id="scheduler2" style="height:200"></div>

 <!-- 스케쥴러에 나타나는  예약 정보 -->
<script id="resvInfoView" type="text/x-kendo-template">
        <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #=title#
            <br>
            #=roDocNo#
        </div>
</script>

 <!-- 스케쥴러에 나타나는  예약 정보 -->
<script id="roInfoView1" type="text/x-kendo-template">
        <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #=title#
            <br>
            #=roGrpNo#
        </div>
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
                            <li><spring:message code="ser.lbl.roDocNo" />:#=model.roDocNo#</li>
                            <li><spring:message code="ser.lbl.assigner" />:#=model.saNm#</li>
                            <li><spring:message code="ser.lbl.roDt" />:#=model.roDt#</li>
                            <li><spring:message code="ser.lbl.expcDlvDt" />:#=kendo.format('{0:HH:mm}', model.start)# ~ #=kendo.format('{0:HH:mm}', model.end)#</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    #}#

</script>


<script id="resvItemTooltip1" type="text/x-kendo-template">
    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#

    #if(model) {#

        <div>
            <div class="carDetail_popup" style="top:-80%; left:5%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            <li><spring:message code="ser.lbl.roDocNo" />:#=model.roGrpNo#</li>
                            <li><spring:message code="ser.lbl.vinNo" />:#=model.vinNo#</li>
                            <li><spring:message code="ser.lbl.driver" />:#=model.driverNm#</li>
                            <li><spring:message code="ser.lbl.expcDlvDt" />:#=kendo.format('{0:HH:mm}', model.start)# ~ #=kendo.format('{0:HH:mm}', model.end)#</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    #}#

</script>

<script type="text/javascript">
var sysDate = new Date("<c:out value='${sysDate}' />");

var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";

var str = 'th class="" colspan="2">京XXXXX</th>'

var jsonData={
        //"sRoFromDt":sysDate
        //,"sRoToDt":sysDate
        //"roStatCd":"02"

}
var carRegNo = '';
$.ajax({
    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />",
    data:JSON.stringify(jsonData),
    type:'POST',
    dataType:'json',
    async:false,
    contentType:'application/json',
    error:function(jqXHR,status,error) {
        dms.notification.error(jqXHR.responseJSON.errors);
    },
    success:function(jqXHR, textStatus) {
        $.each(jqXHR.data,function(i,value){
             if(i<10){
                 if(jqXHR.data[i].carRegNo==null){
                     jqXHR.data[i].carRegNo = ''
                 }
             carRegNo += '<th class="" colspan="2">'+jqXHR.data[i].carRegNo+'</th>'
             }
        });
        if(jqXHR.data.length<10)
            for(var i=0;i<(10-jqXHR.data.length);i++){
                carRegNo+='<th class="" colspan="2"></th>'

            }


    }
});


//버튼 - 조회
$("#btnSearch").kendoButton({
    click:function(e) {
        $("#scheduler").data("kendoScheduler").refresh();
    }
});

$("#scheduler").kendoScheduler({
    date:sysDate
    ,startTime:new Date(startTime)
    ,endTime:new Date(endTime)
    ,editable:false
    ,footer:false
    ,height:300
    ,allDaySlot:false
    ,eventTemplate:$("#resvInfoView").html()
    ,views:[
        {
            type:"timeline"
            ,columnWidth:10
        }
    ]
    ,autoBind:true
    ,editable:false
    ,selectable:true
    ,dataSource:{
        batch:true
            ,transport:{
                read:{
                    url:"<c:url value='/ser/kanban/selectWorkProcessKanbanList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sDlrCd"] = "${dlrCd}";
                        //params["sResvStatCd"] = $("#sResvStatCd").val();

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
                        ,carOwnerId:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,saId:{type:"string"}
                        ,bayNo:{type:"string", from:"bpNo"}
                        ,start:{type:"date", from:"roStartDt"}
                        ,end:{type:"date", from:"roEndDt"}
                        ,title:{type:"string", from:"carRegNo"}
                        ,vinNo:{type:"string", from:"vinNo"}
                        ,noResvTp:{type:"string"}
                        ,custRemark:{type:"string"}
                    }
                }
            }
        }
        ,group:{
            resources:["BAY"],
            orientation:"vertical"
        }
        ,resources:[
            {
                field:"bayNo"
                ,name:"BAY"
                ,title:"BAY"
                ,dataTextField:"bayNm"
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
                                params["bpYn"] = "Y";

                                return kendo.stringify(params);

                            } else if (operation !== "read" && options.models) {
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
        ,dataBinding:function() {
            $("#scheduler.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-times table.k-scheduler-table tbody tr th").eq(0).text("等待维修")
            $("#scheduler.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-times table.k-scheduler-table tbody tr th").eq(1).text("机电维修")
            $("#scheduler.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-header.k-state-default div.k-scheduler-header-wrap table.k-scheduler-table tbody tr").eq(0).html(carRegNo)
            $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
            $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  " + formatToday);
        }
    });

    // 스케줄러 툴팁
    $("#scheduler").kendoTooltip({
        filter:".k-event",
        position:"top",
        width:200,
        height:60,
        content:kendo.template($('#resvItemTooltip').html())
    });

    //$('[data-name="timeline"]').hide();
    $("#scheduler.k-widget.k-scheduler.k-floatwrap div.k-floatwrap.k-header.k-scheduler-toolbar").hide();

    $("#scheduler1").kendoScheduler({
        date:sysDate
        ,startTime:new Date(startTime)
        ,endTime:new Date(endTime)
        ,editable:false
        ,footer:false
        ,editable:false
        ,height:300
        ,allDaySlot:false
        ,eventTemplate:$("#roInfoView1").html()
        ,views:[
            {
                type:"timeline"
                ,columnWidth:10
                ,eventHeight:10  // 스케쥴 높이값 조정
            }
        ]
        ,autoBind:true
        ,selectable:true
        ,dataSource:{
            batch:true
            ,transport:{
                read:{
                    url:"<c:url value='/ser/kanban/selectCarWashKanbanList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sDlrCd"] = "${dlrCd}";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
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
                        ,carOwnerId:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,saId:{type:"string"}
                        ,bayNo:{type:"string"}
                        ,start:{type:"date", from:"qtTestStartDt"}
                        ,end:{type:"date", from:"qtTestEndDt"}
                        ,title:{type:"string", from:"carRegNo"}
                        ,vinNo:{type:"string", from:"vinNo"}
                        ,noResvTp:{type:"string"}
                        ,custRemark:{type:"string"}
                        ,tecId:{type:"string", from:"qtTestPrsnCd"}
                    }
                }
            }
        }
        ,group:{
            resources:["TECMAN"],
            orientation:"vertical"
        }
        ,resources:[
            {
                field:"tecId"
                ,name:"TECMAN"
                ,title:"TECMAN"
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

                            } else if (operation !== "read" && options.models) {
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
        ,dataBinding:function() {
            $("#scheduler1.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-times table.k-scheduler-table tbody tr th").eq(1).text("质量检验");
            $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
            $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  "+ formatToday);
        }
    });

    // 스케줄러 툴팁
    $("#scheduler1").kendoTooltip({
        filter:".k-event",
        position:"top",
        width:200,
        height:60,
        content:kendo.template($('#resvItemTooltip1').html())
    });

    $("#scheduler1.k-widget.k-scheduler.k-floatwrap div.k-floatwrap.k-header.k-scheduler-toolbar").hide();

    $("#scheduler2").kendoScheduler({
        date:sysDate
        ,startTime:new Date(startTime)
        ,endTime:new Date(endTime)
        ,editable:false
        ,footer:false
        ,height:300
        ,editable:false
        ,allDaySlot:false
        ,eventTemplate:$("#roInfoView1").html()
        ,views:[
            {
                type:"timeline",
                columnWidth:10
                ,eventHeight:10  // 스케쥴 높이값 조정
            }
        ]
        ,autoBind:true
        ,selectable:true
        ,dataSource:{
            batch:true
            ,transport:{
                read:{
                    url:"<c:url value='/ser/kanban/selectCarWashKanbanList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,async:false
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sDlrCd"] = "${dlrCd}";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
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
                        ,carOwnerId:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,saId:{type:"string"}
                        ,bayNo:{type:"string"}
                        ,start:{type:"date", from:"carWashStartDt"}
                        ,end:{type:"date", from:"carWashEndDt"}
                        ,title:{type:"string", from:"carRegNo"}
                        ,vinNo:{type:"string", from:"vinNo"}
                        ,noResvTp:{type:"string"}
                        ,custRemark:{type:"string"}
                        ,tecId:{type:"string", from:"carWashPrsnCd"}
                    }
                }
            }
        }
        ,group:{
            resources:["TECMAN"]
            ,orientation:"vertical"
        }
        ,resources:[
            {
                field:"tecId"
                ,name:"TECMAN"
                ,title:"TECMAN"
                ,dataTextField:"tecNm"
                ,dataValueField:"tecId"
                ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                            ,dataType:"json"
                            ,type:"POST"
                            ,async:false
                            ,contentType:"application/json"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};
                                params["sDlrCd"] = "${dlrCd}";

                                return kendo.stringify(params);

                            } else if (operation !== "read" && options.models) {
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
        ,dataBound:function() {
            $("#scheduler2.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-times table.k-scheduler-table tbody tr th").eq(1).text("车辆清洗");
            $("#scheduler2 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
            $("#scheduler2 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  "+ formatToday);
        }
    });

    // 스케줄러 툴팁
    $("#scheduler2").kendoTooltip({
        filter:".k-event",
        position:"top",
        width:200,
        height:60,
        content:kendo.template($('#resvItemTooltip1').html())
    });

    $("#scheduler2.k-widget.k-scheduler.k-floatwrap div.k-floatwrap.k-header.k-scheduler-toolbar").hide();
    $("#scheduler1.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-header.k-state-default div.k-scheduler-header-wrap table.k-scheduler-table tbody tr").eq(0).hide();
    $("#scheduler1.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-times table.k-scheduler-table tbody tr").eq(0).hide();
    $("#scheduler2.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-header.k-state-default div.k-scheduler-header-wrap table.k-scheduler-table tbody tr").eq(0).hide();
    $("#scheduler2.k-widget.k-scheduler.k-floatwrap table.k-scheduler-layout.k-scheduler-timelineview.k-scrollbar-h tbody tr td div.k-scheduler-times table.k-scheduler-table tbody tr").eq(0).hide();

</script>


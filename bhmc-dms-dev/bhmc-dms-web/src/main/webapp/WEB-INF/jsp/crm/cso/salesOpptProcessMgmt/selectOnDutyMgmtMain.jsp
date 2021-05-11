<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 당직설정 시작-->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic title_basic_v1"><spring:message code="crm.menu.onDutyProp" /><!-- 당직설정 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11135" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m" id="btnCopyNextMonth"><spring:message code='crm.lbl.copyNextMonth' /></button><!-- 다음달로 복사-->
                    </dms:access>
                    </div>
                </div>
                <!-- 당직 상세 시작-->
                <div class="duty_scheduler">
                    <div id="scheduler"></div>
                </div>
                <!-- //당직 상세 끝 -->

            </section>
            <!-- // 당직설정 끝-->

            <script id="duty_event_template" type="text/x-kendo-template">
                <span class="icon_ok"></span>
            </script>

            <script type="text/javascript">

                var popupWindow
                    , sStartDt
                ;

                $(document).ready(function() {

                    var schedulerDs = new kendo.data.SchedulerDataSource({
                        batch:true
                        ,transport:{
                            read:{
                                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectOnDutySetMember.do' />"
                                ,dataType:"json"
                                ,type:"POST"
                                ,contentType:"application/json"
                            }
                            ,parameterMap:function(options, operation) {
                                if (operation === "read") {

                                    var params = {};

                                    params["recordCountPerPage"] = options.pageSize;
                                    params["pageIndex"] = options.page;
                                    params["firstIndex"] = options.skip;
                                    params["lastIndex"] = options.skip + options.take;
                                    params["sort"] = options.sort;

                                    params["sStartDt"] = sStartDt;

                                    console.log("schedule param!!!");
//                                     console.log(params);

                                    return kendo.stringify(params);

                                } else if (operation !== "read" && options.models) {
                                    return kendo.stringify(options.models);
                                }
                            }
                        }
                        ,schema:{
                            data:"data",
                            total:"total",
                             model:{
                                id:"seq",
                                fields:{
                                        usrId:{ type:"string", from:"ondutyUsrId"}
                                        ,title:{ type:"string", from:"ondutyUsrNm"}
                                        ,start:{ type:"date", from:"ondutyDtFrom"}
                                        ,end:{ type:"date", from:"ondutyDtTo"}

                                }
                            }
                        }
                    });

                    var mngScIdDs = new kendo.data.DataSource({
                        transport:{
                            read:function (options) {

                                var param = {};
//                                 console.log(JSON.stringify(param));

                                $.ajax({
                                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectOnDutyMember.do' />"
                                    ,data:JSON.stringify(param)        //파라미터
                                    ,type:'POST'                       //조회요청
                                    ,dataType:'json'                  //json 응답
                                    ,contentType:'application/json'   //문자열 파라미터
                                    ,error:function(jqXHR,status,error){
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    }
                                }).done(function(body) {
                                    options.success(body);
                                });

                            }
                        }
                        ,schema:{
                             data:"data"
                            ,total:"total"
                            ,model:{
                                id:"usrId"
                                ,fields:{
                                     usrId         :{ type:"string" }
                                    ,usrNm         :{ type:"string" }
                                    //,remark         :{ type:"string" }
                                }
                            }
                        }
                    })

                    // dateFormat:yyyy-MM-dd 는 오류남.
                    var sysDate = new Date("<c:out value='${sysDate}' />");
                    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
                    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";

                    // 다음달로 복사
                    $("#btnCopyNextMonth").kendoButton({
                        click:function(e) {

                            var msg = "<spring:message code='crm.info.copyOnDutyNextMonthCfm' />";
                            dms.window.confirm({
                               message:msg
                               ,title :"<spring:message code='crm.lbl.copyNextMonth' />"
                               ,callback:function(result){
                                   if(result){

                                       var param = {};
//                                        console.log($("#scheduler").data("kendoScheduler").date());

                                       param["ondutyDt"] = $("#scheduler").data("kendoScheduler").date();
                                       param["ondutyTp"] = "01";

//                                        console.log(param);
                                       $.ajax({
                                           url:"<c:url value='/crm/cso/salesOpptProcessMgmt/insertCopyOnDutyMbrNextMonth.do' />"
                                           ,data:JSON.stringify(param)
                                           ,type:'POST'
                                           ,dataType:'json'
                                           ,contentType:'application/json'
                                           ,error:function(jqXHR,status,error){
//                                                console.log(jqXHR);
                                               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                           },
                                           success:function(result){
//                                                console.log("success - btnSearchCustCharge");
                                               dms.notification.success("<spring:message code='global.info.success'/>");
                                               if(result){
//                                                console.log(result);

                                               }
                                           }
                                           ,beforeSend:function(xhr){
                                               dms.loading.show();
                                           }
                                           ,complete:function(xhr,status){
                                               dms.loading.hide();
                                           }
                                       }).done(function(result) {
                                           console.log("btnSearchCustCharge Done!!!!");
                                       });

                                   }else{
                                       return false;
                                   }
                               }
                           });

                        }
                    });


                    $("#scheduler").kendoScheduler({
                        date:sysDate
                        ,startTime:new Date(startTime)
                        ,endTime:new Date(endTime)
                        ,dateHeaderTemplate: kendo.template("<strong>#=kendo.toString(date, 'dd')#</strong>")
                        ,views:[
                                {
                                    type:"timelineMonth",
                                    startTime:new Date("2013/6/13 00:00 AM"),
                                    majorTick:1440,
                                    selected:true,
                                    eventTemplate:$("#duty_event_template").html(),
                                    eventHeight:10,  // 스케쥴 높이값 조정
                                    columnWidth:20
                                }
                        ]
                        ,dataSource:schedulerDs
                        ,navigate:function(e){
                            // 달력 날짜 클릭시 클릭된 날짜 가져오기
                            //console.log("navigate", e.date);
                            sStartDt = JSON.parse(JSON.stringify(e.date))
                            $("#scheduler").data("kendoScheduler").dataSource.read();
                        }
                        ,selectable:true
                        //,height:600
                        ,footer:false
                        ,multiple:true
                        ,group:{
                            resources:["LINE"],
                            orientation:"vertical"
                        }
                        ,resources:[
                            {
                                 field:"usrId"
                                ,name:"LINE"
                                ,dataTextField:"usrNm"
                                ,dataValueField:"usrId"
                                ,dataSource:mngScIdDs
                                ,title:"LINE"
                             }
                        ]
                        ,change:function(e){

                            // 스케줄러 클릭시 useId return
                            rowUsrId = e.resources.usrId;


                        }
                        ,dataBound:function(e){
                            // 스케줄러 x 표시 삭제
                            $(".k-event-actions .k-event-delete").remove();
                        }
                        ,editable:false
                    });

                    // 더블클릭 이벤트
                    $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event', function(e) {

                        var start
                            , scheduler
                            , element
                            , event
                            , ondutyTp = "01"
                            , seq
                            , ondutyUsrId
                        ;

                        scheduler = $("#scheduler").getKendoScheduler();
                        element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
                        event = scheduler.occurrenceByUid(element.data("uid"));

                        console.log("event!!!!");
//                         console.log(event);

                        var param = {};
//                         console.log(JSON.stringify(param));

                        param["ondutyTp"] = ondutyTp;

                        if ( event ) {
                            //console.log("event duty except");
                            //console.log(scheduler._selection.start);
                            //console.log(event.usrId);

                            param["ondutyDt"] = scheduler._selection.start;
                            param["ondutyUsrId"] = event.usrId;

                            //당직 제외
                            $.ajax({
                                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/insertOnDutySetMember.do' />",
                                data:JSON.stringify(param),
                                type:'POST',
                                dataType:'json',
                                async:false,
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(result) {
//                                     console.log("result:"+result );
                                }
                            });
                        } else {
                            //console.log("event duty");
                            //console.log(scheduler._selection.start);
                            //console.log(rowUsrId);

                            start = scheduler._selection.start
                            ondutyUsrId = rowUsrId

                            if (event) {
//                                 console.log("event.usrId::"+event.usrId);
                                if (event.usrId != null){
                                    return;
                                }
                            }
                            param["ondutyDt"] = start;
                            param["ondutyUsrId"] = ondutyUsrId;

                            //당직
                            $.ajax({
                                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/deleteOnDutySetMember.do' />",
                                data:JSON.stringify(param),
                                type:'POST',
                                dataType:'json',
                                async:false,
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(result) {
//                                     console.log("result:"+result );
                                }
                            });
                        }

                        $("#scheduler").data("kendoScheduler").dataSource.read();

                    });


                    // 우측 상단 Timeline view 삭제
                    $(".k-reset.k-header.k-scheduler-views").hide();
                    //$("scheduler>.k-scheduler-table>tbody").hide();

                    console.log("tag selector 1!!!");
                    $("#scheduler").text();
                    console.log("tag selector 2!!!");
                    //console.log($(".k-reset.k-header.k-scheduler-table").val());



                });


            </script>
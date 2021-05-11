<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 시승 예약 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.testDriveCalendar" /><!-- 시승 캘린더 --></h1>

                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </div>

                </div>


                <!-- 고객조회 -->
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.carId" /><!-- 시승모델 --></th>
                                <td>
                                    <input id="sModelCd" name="sModelCd" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 담당 SC --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" >
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //고객조회 -->

                <!-- 스케쥴 상세 -->
                <div class="drive_scheduler">
                    <div id="scheduler"></div>
                </div>
                <!-- //스케쥴 상세 -->

                <!-- 스케줄러 클릭시 resources id 가져오기 위해 hidden 으로 처리 -->
                <input type="hidden" id="tdrvVinNo" name="tdrvVinNo" />
                <!-- 달력 날짜 클릭시 클릭된 날짜 가져와서 검색조건에 넣기위해서 hidden 으로 처리 -->
                <input type="hidden" id="sStartDt" name="sStartDt" />

            </section>
            <!-- //시승 예약 -->

            <!-- 스케쥴러에 나타나는 시승 예약 정보 -->
            <script id="tdrvInfoView" type="text/x-kendo-template">
                <div class="scheduler_padding" style="background-color:\\#fccac4;">
                    <span>
                            [<spring:message code="global.lbl.resv" />] #=resvCnt# <!-- 예약 -->
                            [<spring:message code="global.lbl.tdrv" />] #=testDriveCnt# <!-- 시승 -->
                    </span>
                </div>
            </script>

            <script type="text/javascript">

                // 시승모델
                var carIdDs = [];
                <c:forEach var="obj" items="${carIdList}">
                    carIdDs.push({text:"${obj.modelNm}", value:"${obj.modelCd}"});
                </c:forEach>

                // 판매고문 목록
                var usersDS = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                </c:forEach>

                // 내방 예약 등록 팝업
                function visitCustomerPopup() {

                    // 스케쥴러 데이터 set 한다음에 스케줄러에서 제공되는 form 닫기
                    $("#scheduler").data("kendoScheduler").cancelEvent();

                    //var tmp = "111"
                    //if ( dms.string.isNotEmpty(tmp) ) {
                        //window.open("<c:url value='/crm/cso/testDrive/selectTestDriveMgmtMain.do' />")
                        window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.testDriveMng' />", "<c:url value='/crm/cso/testDrive/selectTestDriveMgmtMain.do' />", "VIEW-I-10243"); //시승 관리
                    //}

                }

                $(document).ready(function() {

                    // 시승모델
                    $("#sModelCd").kendoExtDropDownList({
                        dataSource:carIdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 판매고문
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // 시승캘린더 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#scheduler").data("kendoScheduler").dataSource.read();
                        }
                    });

                    function scheduler_change(e) {

                        // 스케줄러 클릭시 tdrvVinNo return
                        var tdrvVinNo = e.resources.tdrvVinNo;
                        $("#tdrvVinNo").val(tdrvVinNo);

                    }

                    var schedulerDs = new kendo.data.SchedulerDataSource({
                        batch:true

                        ,transport:{
                            read:{
                                url:"<c:url value='/crm/cso/testDrive/selectTestDriveCalendars.do' />"
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


                                    params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                                    params["sScId"] = $("#sScId").data("kendoExtDropDownList").value();
                                    params["sStartDt"] = $("#sStartDt").val();

                                    console.log("param:"+kendo.stringify(params));

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
                                id:"rnum",
                                fields:{
                                    rnum:{ type:"number" }
                                    ,resvCnt:{ type:"number"}
                                    ,cancelCnt:{ type:"number"}
                                    ,testDriveCnt:{ type:"number"}
                                    ,start:{ type:"date"}
                                    ,end:{ type:"date"}

                                }
                            }
                        }
                    });

                    // dateFormat:yyyy-MM-dd 는 오류남.
                    var sysDate = new Date("<c:out value='${sysDate}' />");

                    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
                    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";

                    $("#scheduler").kendoScheduler({
                        date:sysDate
                        ,startTime:new Date(startTime)
                        ,endTime:new Date(endTime)
                        ,views:[
                                ,{ type:"month", selected:true, eventHeight:38}
                            ]
                        ,dataSource:schedulerDs
                        ,navigate:function(e){

                            // 달력 날짜 클릭시 클릭된 날짜 가져오기
                            $("#sStartDt").val(JSON.parse(JSON.stringify(e.date)));
                            $("#scheduler").data("kendoScheduler").dataSource.read();

                        }
                        ,selectable:true
                        //,majorTick:60
                        //,minorTickCount:2
                        //,height:600
                        ,eventTemplate:$("#tdrvInfoView").html()
                        ,footer:false
                        ,change:scheduler_change
                        ,dataBound:function(e){
                            // 스케줄러 x 표시 삭제
                            $(".k-event-actions .k-event-delete").remove();
                        }
                        ,editable:false
                    });

                    // 우측 상단 Timeline view 삭제
                    $(".k-reset.k-header.k-scheduler-views").hide();


                    // 더블클릭 이벤트
                    $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event', function(e) {

                        var scheduler = $("#scheduler").getKendoScheduler();
                        var element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");

                        var event = scheduler.occurrenceByUid(element.data("uid"));

                        if ( event ) {
                          //window.open("<c:url value='/crm/cso/testDrive/selectTestDriveMgmtMain.do' />")
                            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.testDriveMng' />", "<c:url value='/crm/cso/testDrive/selectTestDriveMgmtMain.do' />", "VIEW-I-10243"); //시승 관리
                        }


                    });


                });

            </script>
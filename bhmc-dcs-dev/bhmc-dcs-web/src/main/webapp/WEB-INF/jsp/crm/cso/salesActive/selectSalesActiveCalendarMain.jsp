<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 영업활동 스케줄 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.menu.salesActiveScheduler" /><!-- 영업활동 스케줄 --></h2>
                </div>

                <!-- 고객조회 -->
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <span class="form_search">
                                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" disabled />
                                        <a href="javascript:;" id="custSearch" ></a>
                                    </span>
                                    <input type="hidden" id="sCustNo" name="sCustNo" />
                                    <input type="hidden" id="sScId" name="sScId" />
                                    <input type="hidden" id="sScNm" name="sScNm" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input id="sHpNo" name="sHpNo" class="form_input numberic" disabled />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.preActiveDt" /><!-- 기존활동일 --></th>
                                <td class="readonly_area">
                                    <input id="sActiveDt" name="sActiveDt" class="form_datetimepicker" readonly />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.saleOpptStepCd" /><!-- 판매기회단계 --></th>
                                <td class="readonly_area">
                                    <input id="sSaleOpptStepCd" name="sSaleOpptStepCd" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //고객조회 -->

                <!-- 판매고문 체크박스 -->
                <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 판매고문 --></th>
                                <td colspan="7">
                                    <div id="people">
                                    <c:forEach var="obj" items="${users}">
                                        <input type="checkbox" checked id="users_${obj.usrId}" value="${obj.usrId}" />${obj.usrNm}
                                    </c:forEach>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //판매고문 체크박스 -->

                <!-- 스케쥴 상세 -->
                <div class="mt10">
                    <div id="scheduler"></div>
                </div>
                <!-- //스케쥴 상세 -->

            </section>
            <!-- //영업활동 스케줄 -->


<!-- 판매기회에서 들어왔을때 판매기회 번호 설정 -->
<input type="hidden" id="saleOpptNo" name="saleOpptNo" value="${saleOpptNo}"/>

<!-- 스케쥴러에 나타나는 내방 예약 정보 -->
<script id="activeInfoView" type="text/x-kendo-template">

    # var schedulerTpNm ;#

    #if(schedulerTp === '01') {#

        #if(schedulerStat === '01') {#
            #schedulerTpNm = '<spring:message code='global.lbl.visitResv' />'#      <!-- 내방예약 -->
        #} else if(schedulerStat === '03'){#
            #schedulerTpNm = '<spring:message code='global.lbl.visit' />'#          <!-- 내방 -->
        #}#

    #} else if(schedulerTp === '02'){#

        #if(schedulerStat === '01') {#
            #schedulerTpNm = '<spring:message code='global.lbl.tdrvResv' />'#       <!-- 시승예약 -->
        #} else if(schedulerStat === '03'){#
            #schedulerTpNm = '<spring:message code='global.lbl.tdrv' />'#           <!-- 시승 -->
        #}#

    #} else if(schedulerTp === '03'){#

        #schedulerTpNm = salesActiveTpCdArrVal(salesActiveTpCd) #               <!-- 영업활동유형 -->

    #}#

    # var scNm ;#
    #if(scNm == null) {#
        #scNm = '<spring:message code='global.lbl.unsettled' />' #        <!-- 미정 -->
    #} else if(scNm != ''){#
        #scNm = scNm #
    #}#

    <div class="scheduler_padding">
        <span>
            [#= schedulerTpNm #] #= custNm #<br>
        </span>
        <span>
            [<spring:message code="crm.lbl.prsn" />] #= scNm #
        </span>
    </div>
</script>

<!-- //영업스케줄 팝업 -->

            <script type="text/javascript">

                var popupWindow
                    , popupUrl
                    , popupWindowId
                    , popupTitle
                    , sStartDt          // 달력 검색을 위한 변수

                ;

                // 고객 검색 팝업
                $("#custSearch").click(function(){

                    popupWindow = dms.window.popup({
                        windowId:"customerSearchPopup"
                        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                        , content:{
                            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                            , data:{
                                "autoBind":false
                                , "type"  :null
                                , "callbackFunc":function(data){
                                    if(data.length >= 1) {

                                        console.log(data);

                                        $("#sScId").val(data[0].mngScId);
                                        $("#sScNm").val(data[0].mngScNm);
                                        $("#sCustNo").val(data[0].custNo);
                                        $("#sCustNm").val(data[0].custNm);
                                        $("#sActiveDt").data("kendoExtMaskedDatePicker").value(data[0].preActiveDt);
                                        $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                        $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                        // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                        $("#leadNo").val("");

                                        popupWindow.close();

                                    }
                                }
                            }
                        }
                    });
                });


                // 판매기회단계 상태
                var saleOpptStepCdDs = [];
                <c:forEach var="obj" items="${saleOpptStepCdList}">
                    saleOpptStepCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                </c:forEach>

                // 스케줄타입
                var schedulerTpDs = [];
                <c:forEach var="obj" items="${schedulerTpList}">
                    schedulerTpDs.push({color:"${obj.remark1}", value:"${obj.cmmCd}"});
                </c:forEach>

                // 영업활동유형 DS
                var salesActiveTpCdDs = [];
                var salesActiveTpCdArr = [];
                <c:forEach var="obj" items="${salesActiveTpCdList}">
                    salesActiveTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                salesActiveTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = salesActiveTpCdArr[val];
                    }
                    return returnVal;
                };


                // 담당자 목록
                var usersDS = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                </c:forEach>


                $(document).ready(function() {

                    // S판매기회단계
                    $("#sSaleOpptStepCd").kendoExtDropDownList({
                        dataSource:saleOpptStepCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                        , enable:false
                    });

                    // 휴대전화
                    $("#sHpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    $("#sActiveDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    var sActiveDt = $("#sActiveDt").data("kendoExtMaskedDatePicker");
                    sActiveDt.enable(false);

                    var schedulerDs = new kendo.data.SchedulerDataSource({
                        batch:true

                        ,transport:{
                            read:{
                                url:"<c:url value='/crm/cso/salesActive/selectSalesActiveCalendars.do' />"
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

                                    console.log("scheduler param:"+kendo.stringify(params));

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
                                id:"totalSchedulerSeq",
                                fields:{
                                         totalSchedulerSeq:{ type:"string"}
                                        ,schedulerSeq:{ type:"string"}
                                        ,schedulerTp:{ type:"string"}
                                        ,title:{ type:"string"}
                                        ,schedulerStat:{ type:"string"}
                                        ,scId:{ type:"string"}
                                        ,start:{ type:"date"}
                                        ,end:{ type:"date"}
                                        ,custNm:{ type:"string"}
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
                        //,startTime:new Date(startTime)
                        //,endTime:new Date(endTime)
                        ,views:[
                            "day"
                            ,"week"
                            ,{ type:"month", selected:true, eventHeight:38}
                        ]
                        ,showWorkHours:false
                        ,dataSource:schedulerDs
                        ,selectable:true
                        ,height:760
                        ,footer:false
                        ,eventTemplate:$("#activeInfoView").html()
                        ,navigate:function(e){

                            // 달력 날짜 클릭시 클릭된 날짜 가져오기
                            sStartDt = JSON.parse(JSON.stringify(e.date));
                            $("#scheduler").data("kendoScheduler").dataSource.read();

                        }
                        ,dataBound:function(e){
                            // 스케줄러 x 표시 삭제
                            $(".k-event-actions .k-event-delete").remove();
                        }
                        ,resources:[
                                    {
                                         field:"schedulerTp"       // CRM362 01(내방) / 02(시승) / 03(활동)
                                        ,dataSource:schedulerTpDs
                                    }
                                    ,{
                                         field:"scId"
                                        ,title:"<spring:message code='crm.lbl.scId' />"       // 판매고문
                                        ,dataSource:usersDS
                                    }
                        ]
                        ,editable:false
                    });

                    // 더블클릭 이벤트
                    $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event', function(e) {

                        var schedulerTp
                            , schedulerSeq
                            , start
                            , scheduler
                            , element
                            , event
                        ;

                        scheduler = $("#scheduler").getKendoScheduler();
                        element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
                        event = scheduler.occurrenceByUid(element.data("uid"));

                        if ( event ) {      // 수정

                            schedulerTp = event.schedulerTp
                            start = event.start
                            schedulerSeq = event.schedulerSeq


                        } else {            // 신규

                            schedulerTp = "03";
                            start = scheduler._selection.start;

                            if( dms.string.isEmpty($("#sCustNo").val()) ){
                                // 고객 / 을(를) 선택해주세요.
                                dms.notification.info("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                                return;
                            }

                        }

                        if(schedulerTp === "01"){
                            // 내방 팝업 호출
                            popupUrl = "<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerPopup.do'/>";
                            popupWindowId = "visitCustomerPopup"
                            popupTitle = "<spring:message code='crm.title.visitCustomer' />" //내방예약
                        }else if(schedulerTp === "02"){
                            // 시승 팝업 호출
                            popupUrl = "<c:url value='/crm/cso/testDrive/selectTestDriveResvPopup.do'/>";
                            popupWindowId = "tdrvResvPopup"
                            popupTitle = "<spring:message code='crm.title.tdrvResv' />" //시승예약
                        }else {
                            // 영업활동 스케줄 팝업 호출
                            popupUrl = "<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarPopup.do'/>"
                            popupWindowId = "salesActivePopup"
                            popupTitle =  "<spring:message code='crm.menu.salesActiveScheduler' />"  // 영업활동 스케줄
                        }

                        popupWindow = dms.window.popup({
                            windowId:popupWindowId
                            ,title:popupTitle
                            ,content:{
                                url:popupUrl
                                , data:{

                                    "autoBind":false
                                    ,"schedulerSeq":schedulerSeq
                                    ,"start":start
                                    ,"salesActiveYn":"Y"

                                    // 신규등록일때 전송할 정보
                                    ,"custNo":$("#sCustNo").val()
                                    ,"custNm":$("#sCustNm").val()
                                    ,"hpNo":$("#sHpNo").data("kendoMaskedTextBox").value()
                                    ,"scId":$("#sScId").val()
                                    ,"scNm":$("#sScNm").val()
                                    // 신규등록일때 전송할 정보

                                    ,"callbackFunc":function(data){

                                        console.log("callbackFunc")
                                        console.log(data)

                                        if ( data == "SUCCESS" ) {
                                            // 예약 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                            $("#scheduler").data("kendoScheduler").dataSource.read();
                                            popupWindow.close();
                                        }

                                    }
                                }
                            }

                        });


                    });


                    $("#people :checkbox").change(function(e){

                        //console.log(e)
                        var checked = $.map($("#people :checked"), function(checkbox){
                            return $(checkbox).val();
                        });

                        var scheduler = $("#scheduler").data("kendoScheduler");

                        scheduler.dataSource.filter({
                            operator:function(task){
                                return $.inArray(task.scId, checked) >= 0;
                            }
                        })
                    })


                });

            </script>

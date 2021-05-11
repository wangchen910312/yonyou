<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 내방 예약 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.visitCustomer" /><!-- 내방 예약 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnCustAdd" ><spring:message code="global.btn.custAdd" /><!-- 고객등록 --></button>
                    </div>

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
                                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" disabled <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].custNm}' />"</c:if> />
                                        <a href="javascript:;" id="custSearch" ></a>
                                    </span>
                                    <input type="hidden" id="sCustNo" name="sCustNo" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].custNo}' />"</c:if> />
                                    <input type="hidden" id="sScId" name="sScId" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].mngScId}' />"</c:if> />
                                    <input type="hidden" id="sScNm" name="sScNm" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].mngScNm}' />"</c:if> />
                                <c:if test="${leadNo != ''}">
                                    <input type="hidden" id="leadNo" name="leadNo" value="<c:out value='${leadNo}' />" />
                                </c:if>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input id="sHpNo" name="sHpNo" class="form_input numberic" disabled <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].hpNo}' />"</c:if> />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.preVisitDt" /><!-- 기존내방일 --></th>
                                <td class="readonly_area">
                                    <input id="sVsitDt" name="sVsitDt" class="form_datetimepicker" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].preVsitDt}' />"</c:if> />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.saleOpptStepCd" /><!-- 판매기회단계 --></th>
                                <td class="readonly_area">
                                    <input id="sSaleOpptStepCd" name="sSaleOpptStepCd" class="form_comboBox" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].saleOpptStepCd}' />"</c:if> />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //고객조회 -->

                <!-- 스케쥴 상세 -->
                <div class="visit_scheduler">
                    <div id="scheduler"></div>
                </div>
                <!-- //스케쥴 상세 -->

            </section>
            <!-- //내방 예약 -->


            <!-- 스케쥴러에 나타나는 내방 예약 정보 -->
            <script id="visitInfoView" type="text/x-kendo-template">

                # var vsitStatCdNm ;#

                #if(vsitStatCd == '01') {#
                    #vsitStatCdNm = '<spring:message code='global.lbl.resv' />'#       <!-- 예약 -->
                #} else if(vsitStatCd == '02'){#
                    #vsitStatCdNm = '<spring:message code='global.lbl.cancel' />'#     <!-- 취소 -->
                #} else if(vsitStatCd == '03'){#
                    #vsitStatCdNm = '<spring:message code='global.lbl.visit' />'#      <!-- 내방 -->
                #}#

                # var scNm ;#
                #if(scNm == null) {#
                    #scNm = '<spring:message code='global.lbl.unsettled' />' #        <!-- 미정 -->
                #} else if(scNm != ''){#
                    #scNm = scNm #
                #}#

                <div class="scheduler_padding">
                    <span>
                        [#= vsitStatCdNm #] #= custNm #
                    </span><br>
                    <span>
                        [<spring:message code="crm.lbl.prsn" />] #= scNm #
                    </span>
                </div>

            </script>

            <script type="text/javascript">

                var popupWindow
                    , sStartDt
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
                                        $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
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

                $(document).ready(function() {

                    // 판매기회단계 상태
                    var saleOpptStepCdDs = [];
                    <c:forEach var="obj" items="${saleOpptStepCdList}">
                        saleOpptStepCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    </c:forEach>

                    // 내방출처 ( CRM202 )
                    var vsitSrcCdListDs = [];
                    <c:forEach var="obj" items="${vsitSrcCdList}">
                        vsitSrcCdListDs.push({color:"${obj.remark2}", value:"${obj.cmmCd}"});
                    </c:forEach>

                    // 고객등록
                    $("#btnCustAdd").kendoButton({
                        click:function(e){
                            //window.open("<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />")
                            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.personalCustReg' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />", "VIEW-I-10232"); //개인 고객 등록
                        }
                    });

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

                    $("#sVsitDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    var sVsitDt = $("#sVsitDt").data("kendoExtMaskedDatePicker");
                    sVsitDt.enable(false);

                    var schedulerDs = new kendo.data.SchedulerDataSource({
                        batch:true

                        ,transport:{
                            read:{
                                url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomers.do' />"
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

                                    params["sVsitStat"] = "N";
                                    params["sStartDt"] = sStartDt;

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
                                id:"vsitNo",
                                fields:{
                                         vsitNo:{ from:"vsitNo", type:"string" }
                                        //,title:{ from:"remark", defaultValue:"", validation:{ required:true } }
                                        ,custNo:{ type:"string"}
                                        ,custNm:{ type:"string"}
                                        ,custNo:{ type:"remark"}
                                        ,vsitStatCd:{ type:"string"}
                                        ,vsitSrcCd:{ type:"string"}
                                        ,scId:{ type:"string"}
                                        ,start:{ type:"date", from:"resvSchStartDt"}
                                        ,end:{ type:"date", from:"resvSchEndDt"}
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
                                {
                                    type:"timeline",
                                    selected:true,
                                    eventHeight:35 // 스케쥴 높이값 조정
                                 }
                            ]
                        ,dataSource:schedulerDs
                        ,dataBound:function(e){
                            // 스케줄러 x 표시 삭제
                            $(".k-event-actions .k-event-delete").remove();
                        }

                        ,resources:[
                                     {
                                          field:"vsitSrcCd"       // 내방출처(CRM202) :
                                         ,dataSource:vsitSrcCdListDs
                                     }
                         ]

                        ,navigate:function(e){

                            // 달력 날짜 클릭시 클릭된 날짜 가져오기
                            sStartDt = JSON.parse(JSON.stringify(e.date));
                            $("#scheduler").data("kendoScheduler").dataSource.read();

                        }
                        ,selectable:true
                        ,height:443
                        ,eventTemplate:$("#visitInfoView").html()
                        ,footer:false
                        ,editable:false
                    });

                    // 우측 상단 Timeline view 삭제
                    $(".k-reset.k-header.k-scheduler-views").hide();

                    // 더블클릭 이벤트
                    $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event', function(e) {

                        var schedulerTp = "01"
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

                            start = event.start
                            schedulerSeq = event.vsitNo

                        } else {            // 신규

                            start = scheduler._selection.start

                            if( dms.string.isEmpty($("#sCustNo").val()) ){
                                // 고객 / 을(를) 선택해주세요.
                                dms.notification.info("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                                return;
                            }

                        }

                        popupWindow = dms.window.popup({
                            windowId:"visitCustomerPopup"
                            ,title:"<spring:message code='crm.title.visitCustomer' />" //내방예약
                            ,height:330
                            ,content:{
                                url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerPopup.do'/>"
                                , data:{
                                    "autoBind":false
                                    ,"schedulerSeq":schedulerSeq
                                    ,"start":start

                                    // 신규등록일때 전송할 정보
                                    ,"leadNo":$("#leadNo").val()
                                    ,"custNo":$("#sCustNo").val()
                                    ,"custNm":$("#sCustNm").val()
                                    ,"hpNo":$("#sHpNo").data("kendoMaskedTextBox").value()
                                    ,"scId":$("#sScId").val()
                                    ,"scNm":$("#sScNm").val()
                                   // 신규등록일때 전송할 정보

                                    ,"callbackFunc":function(data){

                                        console.log(data)
                                        if ( data === "SUCCESS" ) {
                                            // 예약 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                            $("#scheduler").data("kendoScheduler").dataSource.read();

                                            // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                            $("#leadNo").val("");

                                        } else if ( data == "CANCEL" ) {
                                            // 예약 / 이(가) 취소되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.cancelSuccessParam' arguments='${arguMsg}'/>");
                                            $("#scheduler").data("kendoScheduler").dataSource.read();
                                        } else {
                                            // 저장 / 에 실패 하였습니다.
                                            dms.notification.error("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.failedMsg' arguments='${arguMsg}'/>");
                                        }

                                        popupWindow.close();

                                    }
                                }
                            }

                        });

                    });


                });

            </script>
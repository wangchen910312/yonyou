<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 시승 예약 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.testDriveResv" /><!-- 시승 예약 --></h1>
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
                                    <span class="form_search" >
                                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" disabled />
                                        <a href="javascript:;" id="custSearch" ></a>
                                    </span>
                                    <input type="hidden" id="sCustNo" name="sCustNo" />
                                    <input type="hidden" id="sScId" name="sScId" />
                                    <input type="hidden" id="sScNm" name="sScNm" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td class="readonly_area">
                                    <input id="sHpNo" name="sHpNo" class="form_input numberic" disabled >
                                </td>
                                <th scope="row"><spring:message code="global.lbl.preTdrvDt" /><!-- 기존시승일 --></th>
                                <td class="readonly_area">
                                    <input id="sTdrvDt" name="sTdrvDt" class="form_datetimepicker" readonly >
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
                <div class="drive_scheduler">
                    <div id="scheduler"></div>
                </div>
                <!-- //스케쥴 상세 -->

            </section>
            <!-- //시승 예약 -->

            <!-- 스케쥴러에 나타나는 시승 예약 정보 -->
            <script id="tdrvInfoView" type="text/x-kendo-template">
                <div class="scheduler_padding">
                    <span>
                        #if(tdrvStatCd == '01') {#
                            [<spring:message code="global.lbl.resv" />] #=custNm# <!-- 예약 -->
                        #} else if(tdrvStatCd == '03'){#
                            [<spring:message code="global.lbl.tdrv" />] #=custNm# <!-- 시승 -->
                        #}#
                    </span><br>
                    <span>
                        #if(scId == null) {#
                            <spring:message code="crm.lbl.scId" />:<spring:message code="global.lbl.unsettled" />                <!-- 판매고문 / 미정-->
                        #} else if(scId != ''){#
                            <spring:message code="crm.lbl.scId" />:#=scNm#        <!-- 판매고문 -->
                        #}#
                    </span>
                </div>
            </script>

            <script id="vhItemTooltip" type="text/x-kendo-template">
                <div id="vhItemTt"></div>
            </script>

            <script type="text/javascript">

                var popupWindow
                    , tdrvVinNo
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
                                        $("#sTdrvDt").data("kendoExtMaskedDatePicker").value(data[0].preTdrvDt);
                                        $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                        $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);
                                        $("#custSearchInfo").val(data[0].custNm);

                                        popupWindow.close();


                                    }
                                }
                            }
                        }
                    });
                });

                // 판매기회단계
                var saleOpptStepCdDs = [];
                <c:forEach var="obj" items="${saleOpptStepCdList}">
                    saleOpptStepCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                </c:forEach>

                // 시승상태
                var tdrvStatCdDs = [];
                <c:forEach var="obj" items="${tdrvStatCdList}">
                    tdrvStatCdDs.push({color:"${obj.remark1}", value:"${obj.cmmCd}"});
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

                    $("#sTdrvDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    var sTdrvDt = $("#sTdrvDt").data("kendoExtMaskedDatePicker");
                    sTdrvDt.enable(false);

                    // 휴대전화
                    $("#sHpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // scheduler resources tooltip
                    var tooltip = $("#scheduler").kendoTooltip({
                        filter:".k-scheduler-times table.k-scheduler-table tbody tr th.k-slot-cell",
                        position:"right",
                        width:500,
                        height:50,
                        content:kendo.template($('#vhItemTooltip').html())
                    }).data("kendoTooltip");

                    tooltip.bind("show", function() {

                        var selIdx
                            , resourceData = $("#scheduler").data('kendoScheduler').resources[0].dataSource.data()
                            , tdrvVinNo
                            , carlineCd
                            , carlineNm
                            , modelCd
                            , modelNm
                            , carRegNo
                            , extColorCd
                            , intColorCd
                            , carRunDistVal
                            , strHtml
                        ;

                        $("#scheduler .k-event-inverse").css("height","41px");

                        $("div.k-scheduler-times table.k-scheduler-table tbody tr th.k-slot-cell").each(function(index, item) {
                            if( $(this).attr("aria-describedby") == "scheduler_tt_active" ){
                                selIdx = index;
                            }
                        });

                        for(var i = 0; i < resourceData.length; i++){
                            if( i == selIdx){
                                tdrvVinNo = resourceData[i].tdrvVinNo;
                                carlineCd = resourceData[i].carlineCd;
                                carlineNm = resourceData[i].carlineNm;
                                modelCd = resourceData[i].modelCd;
                                modelNm = resourceData[i].modelNm;
                                carRegNo = resourceData[i].carRegNo;
                                extColorCd = resourceData[i].extColorCd;
                                intColorCd = resourceData[i].intColorCd;
                                carRunDistVal = resourceData[i].carRunDistVal;
                            }
                        }

                        if ( dms.string.isEmpty(carRegNo) ) {
                            carRegNo = "";
                        }
                        if ( dms.string.isEmpty(carRunDistVal) ) {
                            carRunDistVal = "";
                        }
                        if ( dms.string.isEmpty(extColorCd) ) {
                            extColorCd = "";
                        }
                        if ( dms.string.isEmpty(intColorCd) ) {
                            intColorCd = "";
                        }

                        // TODO[이인문] 나중에 변경 popup form
                        strHtml =
                                    '<div class="carDetail_popup">'
                                    +'    <span class="bg_area"></span>'
                                    +'    <div class="clfix">'
                                    +'        <div class="txt_area">'
                                    +'            <h2>' + carlineNm + '</h2>'
                                    +'            <p>' + modelNm + '</p>'
                                    +'            <ul>'
                                    +'                <li><spring:message code="global.lbl.carNo" />:<span class="txt_color">'+carRegNo+'</span></li>'
                                    +'                <li><spring:message code="global.lbl.runDist" />:<span class="txt_color">'+carRunDistVal+'</span></li>'
                                    +'                <li><spring:message code="global.lbl.extColor" />:<span class="txt_color">'+extColorCd+'</span></li>'
                                    +'                <li><spring:message code="global.lbl.intColor" />:<span class="txt_color">'+intColorCd+'</span></li>'
                                    +'            </ul>'
                                    +'        </div>'
                                    +'    </div>'
                                    +'</div>';
                        $("#vhItemTt").html(strHtml);

                    });

                    // 시승 예약 중복 체크
                    function tdrvResvChk(vinNo, start){

                        if( dms.string.isEmpty(vinNo) ){
                            // 시승차대번호 / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.tdrvVinNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        }

                        if( dms.string.isEmpty(start) ){
                            // 예약일 / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='global.lbl.resvDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        }

                        var tdrvResvChkRst = false;

                        var tdrvResvChkData ={
                                 tdrvVinNo:vinNo
                                ,resvDt:start
                        };

                        console.log("tdrvResvChk param:" + JSON.stringify(tdrvResvChkData));

                        $.ajax({
                            url:"<c:url value='/crm/cso/testDrive/selectTdrvResvByKeyCnt.do' />",
                            data:JSON.stringify(tdrvResvChkData),
                            type:'POST',
                            dataType:'json',
                            async:false,
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(result) {

                                console.log("result:"+result );
                                tdrvResvChkRst = result;

                            }
                        });

                        return tdrvResvChkRst;

                    }

                    var schedulerDs = new kendo.data.SchedulerDataSource({
                        batch:true

                        ,transport:{
                            read:{
                                url:"<c:url value='/crm/cso/testDrive/selectTestDriveResvs.do' />"
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

                                    params["sTdrvStat"] = "N";

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
                                id:"tdrvSeq",
                                fields:{
                                         tdrvSeq:{ from:"tdrvSeq", type:"number" }
                                        ,custNo:{ type:"string"}
                                        ,tdrvStatCd:{ type:"string"}
                                        ,scId:{ type:"string"}
                                        ,scNm:{ type:"string"}
                                        ,start:{ type:"date", from:"resvDt"}
                                        ,end:{ type:"date", from:"resvEndDt"}

                                }
                            }
                        }
                    });

                    var testDriveCarDs = new kendo.data.DataSource({
                        transport:{
                            read:function (options) {

                                var param = {};
                                console.log(JSON.stringify(param));

                                $.ajax({
                                    url:"<c:url value='/crm/cso/testDrive/selectTestDriveResvCars.do' />"
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
                                id:"tdrvVinNo"
                                ,fields:{
                                     tdrvVinNo         :{ type:"string" }
                                    ,carlineCd         :{ type:"string" }
                                    ,carlineNm         :{ type:"string" }
                                    ,modelCd           :{ type:"string" }
                                    ,modelNm           :{ type:"string" }
                                    ,carRegNo          :{ type:"string" }
                                    ,extColorCd        :{ type:"string" }
                                    ,runDistVal        :{ type:"number" }
                                    ,useYn             :{ type:"string" }
                                    ,tdrvCont          :{ type:"number" }
                                    ,regUsrId          :{ type:"string" }
                                    ,regDt             :{ type:"date"   }
                                }
                            }
                        }
                    })

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
                                    eventHeight:35  // 스케쥴 높이값 조정
                                 }
                            ]
                        ,dataSource:schedulerDs
                        ,navigate:function(e){

                            // 달력 날짜 클릭시 클릭된 날짜 가져오기
                            sStartDt = JSON.parse(JSON.stringify(e.date))
                            $("#scheduler").data("kendoScheduler").dataSource.read();

                        }
                        ,selectable:true
                        //,majorTick:60
                        //,minorTickCount:2
                        //,height:600
                        ,eventTemplate:$("#tdrvInfoView").html()
                        ,footer:false
                        ,group:{
                            resources:["LINE"],
                            orientation:"vertical"
                        }
                        ,resources:[
                            {
                                 field:"tdrvStatCd"       // 시승상태(CRM404)
                                ,dataSource:tdrvStatCdDs
                            }
                            ,{
                                 field:"tdrvVinNo"
                                ,name:"LINE"
                                ,dataTextField:"modelNm"
                                ,dataValueField:"tdrvVinNo"
                                ,dataSource:testDriveCarDs
                                ,title:"LINE"
                             }
                        ]
                        ,change:function(e){

                            // 스케줄러 클릭시 tdrvVinNo return
                            tdrvVinNo = e.resources.tdrvVinNo;

                            /*
                            // 예약정보에 입력
                            var scheduler = $("#scheduler").data("kendoScheduler");
                            console.log(scheduler);
                            scheduler.wrapper.on("mouseup touchend", ".k-scheduler-table td, .k-event", function(e) {
                                var target = $(e.currentTarget);

                                if (target.hasClass("k-event")) {
                                    var event = scheduler.occurrenceByUid(target.data("uid"));

                                    console.log(event);
                                    //$("#revCstNm").val(event.revCstNm);

                                }
                            });
                            */

                        }
                        ,dataBound:function(e){
                            // 스케줄러 x 표시 삭제
                            $(".k-event-actions .k-event-delete").remove();
                        }
                        ,editable:false
                    });

                    // 더블클릭 이벤트
                    $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event', function(e) {

                        var schedulerTp = "02"
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
                            schedulerSeq = event.tdrvSeq

                        } else {            // 신규

                            start = scheduler._selection.start

                            console.log("scheduler ::::",scheduler)


                            if ( dms.string.isEmpty( $("#sCustNo").val() ) ) {
                                // 고객 / 을(를) 선택해주세요.
                                dms.notification.info("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                                return;
                            }



                            // 클릭된 셀의 차량 정보를 가지고오기.
                            var resourceData
                                , vinNo
                                , modelNm
                            ;

                            resourceData = $("#scheduler").data('kendoScheduler').resources[0].dataSource.data()
                            vinNo = tdrvVinNo

                            for(var i = 0; i < resourceData.length; i++){
                                if( resourceData[i].tdrvVinNo == tdrvVinNo ){
                                    modelNm = resourceData[i].modelNm;
                                }
                            }

                            // 중복 시승 예약 확인
                            var tdrvResvChkRst = tdrvResvChk(vinNo, start);
                            if(!tdrvResvChkRst){
                                //중복된 데이터가 존재합니다.
                                dms.notification.error("<spring:message code='global.err.duplicate' />");
                                return;
                            }

                        }

                        // 시승 예약 팝업 열기
                        popupWindow = dms.window.popup({
                            windowId:"tdrvResvPopup"
                            ,title:"<spring:message code='crm.title.tdrvResv' />" //시승예약
                            ,height:330
                            ,content:{
                                url:"<c:url value='/crm/cso/testDrive/selectTestDriveResvPopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        ,"schedulerSeq":schedulerSeq
                                        ,"start":start

                                        // 신규등록일때 전송할 정보
                                        ,"custNo":$("#sCustNo").val()
                                        ,"custNm":$("#sCustNm").val()
                                        ,"hpNo":$("#sHpNo").data("kendoMaskedTextBox").value()
                                        ,"scId":$("#sScId").val()
                                        ,"scNm":$("#sScNm").val()
                                        ,"modelNm":modelNm
                                        ,"tdrvVinNo":tdrvVinNo
                                        // 신규등록일때 전송할 정보

                                        ,"callbackFunc":function(data){

                                            if ( data == "SUCCESS" ) {
                                                // 예약 / 이 완료 되었습니다.
                                                dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                                $("#scheduler").data("kendoScheduler").dataSource.read();
                                                popupWindow.close();
                                            } else if ( data == "CANCEL" ) {
                                                // 예약 / 이(가) 취소되었습니다.
                                                dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.cancelSuccessParam' arguments='${arguMsg}'/>");
                                                $("#scheduler").data("kendoScheduler").dataSource.read();
                                                popupWindow.close();
                                            }

                                        }
                                    }
                            }
                        });


                    });


                    // 우측 상단 Timeline view 삭제
                    $(".k-reset.k-header.k-scheduler-views").hide();


                    //TODO dellllllllllllllll
//                    $("#sScId").val("admin2");
  //                  $("#sScNm").val("管理员二");
    //                $("#sCustNo").val("CA07AA20160400071");
      //              $("#sCustNm").val("李教鎭对了");
        //            $("#sTdrvDt").data("kendoExtMaskedDatePicker").value("");
          //          $("#sHpNo").data("kendoMaskedTextBox").value("02548748615135");
            //        $("#sSaleOpptStepCd").data("kendoExtDropDownList").value("");
              //      $("#custSearchInfo").val("");

                });

            </script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div class="content_v1">

        <form id="dmsForm" name="dmsForm" method="POST">
        <input type="hidden" id="parResvStatCd" name="parResvStatCd" data-json-obj="true">

        <!-- 차량정보, 운전자정보 공통 페이지 -->
        <jsp:include page="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp"></jsp:include>
        <!-- 차량정보, 운전자정보 공통 페이지 -->

        <!-- 예약번호 -->
        <section class="group">
            <div class="table_form form_width_100per mt5">
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
                            <th scope="row"><spring:message code="ser.lbl.partReserveNo" /></th><!-- 부품예약번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="parResvDocNo" name="parResvDocNo" class="form_input" data-json-obj="true">
                                    <a href="javascript:goPartResvStatus();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.partResvTp" /></th><!-- 부품예약유형 -->
                            <td>
                                <input id="parResvTp" name="parResvTp" value="01" class="form_comboBox"  data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.partResvStat" /></th><!-- 부품예약상태 -->
                            <td class="readonly_area">
                                <input id="parResvStatus" name="parResvStatus" class="form_input" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.partResveNm" /></th><!-- 발행자 -->
                            <td class="readonly_area">
                                <input id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area mt5">
                <!-- 탭메뉴 -->
                <ul>
                    <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                    <li class="k-state-active"><spring:message code="ser.lbl.partsReserveInfo" /><!-- 부품 --></li>
                    <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- 고객요청사항 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectCustDemand.jsp" />
                <!-- //고객요청사항 -->

                <!-- 부품 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
                <!-- //부품 -->

                <!-- 기타 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
                <!-- //기타 -->
            </div>

            <section class="group">
                <div class="table_form mt5">
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
                                <th scope="row"><spring:message code="ser.lbl.preParSubAmt" /></th><!-- 예정부품비용 소계 -->
                                <td>
                                    <input id="parAmt" name="parAmt" class="form_numeric form_readonly ar" readonly>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.preEtcSubAmt" /></th><!-- 예정기타비용 소계 -->
                                <td>
                                    <input id="etcAmt" name="etcAmt" class="form_numeric form_readonly ar" readonly>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.prePartTotAmt" /></th><!-- 예정서비스비용 합계 -->
                                <td>
                                    <input id="totAmt" name="totAmt" class="form_numeric form_readonly ar" readonly>
                                </td>
                                <th scope="row"><span id="preAmtSpan" class="bu_required"><spring:message code="ser.lbl.preAmt" /></span></th><!-- 선수금금액 -->
                                <td>
                                    <input type="text" id="preAmt" name="preAmt" class="form_numeric ar" data-type="number" data-name="<spring:message code='ser.lbl.preAmt'/>" data-json-obj="true" required>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.partResvRemark" /></th><!-- 부품예약 비고 -->
                                <td colspan="7">
                                    <input type="text" id="parResvRemark" name="parResvRemark" class="form_input" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-11591" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="resvCreateBtn" class="btn_m"><spring:message code="ser.btn.resvCreate" /><!-- 예약생성 --></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11590" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="partArryAlarm" class="btn_m"><spring:message code="ser.lbl.ArrivalPartAram" /><!-- 부품도착알람 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-13002" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="partResvComp" class="btn_m"><spring:message code="ser.btn.partResvComplete" /><!-- 부품예약완료 --></button>
                    </dms:access>
                </div>
            </div>
        </section>
        <!-- //예약번호 -->
        </form>
    </div>
</div>
<!-- //서비스예약 -->
<div id="lbrGrid" style="display:none;"></div>

    <!-- 우측 메뉴 간반보드 공통 페이지 -->
    <c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp" />
    <!-- 우측 메뉴 간반보드 공통 페이지 -->

<script>

    var resvCancelPopup;
    var sysDate = new Date("<c:out value='${sysDate}' />");

    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";
    var isTablet = "${isTablet}"; //khs

    //공통코드:부품예약유형
    var parResvTpCdList = [];
    <c:forEach var="obj" items="${partResvTpCdList}">
    parResvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //고객전화표시여부
    var custTelYnValue;
    <c:forEach var="obj" items="${custTelYnCdList}">
        <c:if test="${obj.remark10 eq 'default'}">
        custTelYnValue = "${obj.cmmCd}";
        </c:if>
    </c:forEach>


    $(document).ready(function() {

        // 예약구분
        $("#parResvTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parResvTpCdList
            ,change:function(e){
                var selectVal = this.value();
                if(selectVal == '01'){
                    $("#preAmt").prop("readonly", false);
                    $("#preAmt").prop("required", true);
                    $("#preAmt").removeClass("form_readonly");
                    $("#preAmt").data("kendoExtNumericTextBox").enable(true);
                    $("#preAmtSpan").addClass("bu_required");
                } else {
                    $("#preAmt").prop("readonly", true);
                    $("#preAmt").prop("required", false);
                    $("#preAmt").addClass("form_readonly");
                    $("#preAmt").data("kendoExtNumericTextBox").enable(false);
                    $("#preAmt").data("kendoExtNumericTextBox").value(0.00);
                    $("#preAmtSpan").removeClass("bu_required");
                }
            }
            ,index:0
        });

        // 선수금금액
        $("#preAmt").kendoExtNumericTextBox({
            min:0
           ,format:"n2" //"{0:##,###}"
           ,spinners:false             // 증,감 화살표
         });

        $("#parAmt, #etcAmt, #totAmt").kendoExtNumericTextBox({
            format:"n2"                // n0:###,###, n2:###,###.##
           ,decimals:2                // 소숫점
           ,value:0.00
           ,spinners:false             // 증,감 화살표
        });

        $("#tabstrip").kendoExtTabStrip({
            animation:false
        });

        // 예약등록
        $("#resvCreateBtn").kendoButton({
            click:function(e) {
                parent._createOrReloadTabMenu("<spring:message code='ser.menu.reserCreate' />", "<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do'/>?sVinNo="+$("#vinNo").val(), "VIEW-D-10332");
            }
            ,enable:false
        });

        // 부품도착알림
        $("#partArryAlarm").kendoButton({
            click:function(e) {
                var formParam = $("#dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

                $.ajax({
                    url:"<c:url value='/ser/rev/partReservation/partArrivalAlramCall.do' />"
                    ,data:JSON.stringify(formParam)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
            ,enable:false
        });

        $("#print").kendoButton({
            click:function(e) {
                if(dms.string.isNotEmpty($("#parResvDocNo").val())){
                    $.ajax({
                        url:"<c:url value='/ser/rev/partReservation/updatePartReservationReceipt.do' />"
                        ,data:JSON.stringify({"parResvDocNo":$("#parResvDocNo").val(), "printYn":"Y"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){

                        }
                    });


                    var printParam =  "&sDlrCd="+"${dlrCd}"+"&sParResvDocNo="+$("#parResvDocNo").val()+"&sTelShowYn="+custTelYnValue;
                    parent._createOrReloadTabMenu("<spring:message code='ser.lbl.partResvDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectPartReservationMain.cpt'/>"+printParam);
                }else{
                    dms.notification.info("<spring:message code='global.info.preInquire' />");
                    return;
                }
            }
            ,enable:false
        });

        // 확인
        $("#resvCreate").kendoButton({
            click:function(e) {
                saveResv("R");
            }
            ,enable:false
        });

        // 부품예약완료
        $("#partResvComp").kendoButton({
            click:function(e) {
                saveResv("F");
            }
            ,enable:false
        });

        // 취소
        $("#resvCancel").kendoButton({
            click:function(e) {

                resvCancelPopup = dms.window.popup({
                    windowId:"resvCancelPopup"
                    , title:"<spring:message code='ser.lbl.resvCancel'/>"   // 예약취소
                    , width:400
                    , height:200
                    , content:{
                        url:"<c:url value='/ser/rev/partReservation/selectPartReservationCancelPopup.do'/>"
                        ,data:{
                            "parResvDocNo":$("#parResvDocNo").val()
                            ,"callbackFunc":function(){
                                dms.notification.success("<spring:message code='ser.lbl.resv' var='resv' /><spring:message code='global.info.cancelSuccessParam' arguments='${resv}' />");
                                initAll();
                            }
                        }
                    }
                });
            }
            ,enable:false
        });

        goPartResvStatus = function(){
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.parRevList'/>", "<c:url value='/ser/rev/partReservation/selectPartReservationListMain.do'/>", "VIEW-D-10499"); // 부품예약접수현황
        };

        saveResv = function(resvStat){

            var validator = $("#dmsForm").kendoExtValidator().data("kendoExtValidator");

            if (validator.validate()) {

                $("#parResvStatCd").val(resvStat);
                var formParam = $("dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));
                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $.extend(
                   {"partReservationVO":formParam}
                   ,{"servicePartListVO":getPartData()}
                   ,{"custDemandListVO":custDemandParam()}
                   ,{"etcIssueListVO":getEtcIssueData()}
                )

                $.ajax({
                    url:"<c:url value='/ser/rev/partReservation/multiPartReservation.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        var data = {"parResvDocNo":result};
                        detailSet(data, false);
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }
        };

        //초기화
        initAll = function(){
            serviceJs.commonInit(preFixId);     // service 공통 JS
            crTpYn = false;                     // 캠페인여부 초기화
            btnControll("", false);
        };


        btnControll = function(status){

            var  resvStat = $("#parResvStatCd").val();
            if(dms.string.strNvl(resvStat) != ""){
                if(resvStat == "R"){
                        $("#resvCreate").data("kendoButton").enable(true);
                        $("#resvCancel").data("kendoButton").enable(true);
                        $("#print").data("kendoButton").enable(true);
                        $("#resvCreateBtn").data("kendoButton").enable(true);
                        $("#partResvComp").data("kendoButton").enable(true);

                        $("#parPkgAdd").data("kendoButton").enable(true);
                        $("#parAdd").data("kendoButton").enable(true);
                        $("#parDel").data("kendoButton").enable(true);
                    }else if(resvStat == "F"){
                        $("#resvCreate").data("kendoButton").enable(false);
                        $("#resvCancel").data("kendoButton").enable(true);
                        $("#print").data("kendoButton").enable(true);
                        $("#resvCreateBtn").data("kendoButton").enable(true);
                        $("#partResvComp").data("kendoButton").enable(false);

                        $("#parPkgAdd").data("kendoButton").enable(false);
                        $("#parAdd").data("kendoButton").enable(false);
                        $("#parDel").data("kendoButton").enable(false);
                    }else if(resvStat == "C"){
                        $("#resvCreate").data("kendoButton").enable(false);
                        $("#resvCancel").data("kendoButton").enable(false);
                        $("#print").data("kendoButton").enable(false);
                        $("#resvCreateBtn").data("kendoButton").enable(false);
                        $("#partResvComp").data("kendoButton").enable(false);

                        $("#parPkgAdd").data("kendoButton").enable(false);
                        $("#parAdd").data("kendoButton").enable(false);
                        $("#parDel").data("kendoButton").enable(false);
                    }else{
                        $("#resvCreate").data("kendoButton").enable(true);
                        $("#resvCancel").data("kendoButton").enable(true);
                        $("#print").data("kendoButton").enable(true);
                        $("#resvCreateBtn").data("kendoButton").enable(true);
                        $("#partResvComp").data("kendoButton").enable(false);

                        $("#parPkgAdd").data("kendoButton").enable(false);
                        $("#parAdd").data("kendoButton").enable(false);
                        $("#parDel").data("kendoButton").enable(false);
                    }
            } else {
                switch(status){
                    case "U" :
                        $("#resvCreate").data("kendoButton").enable(true);
                        $("#resvCancel").data("kendoButton").enable(false);
                        $("#print").data("kendoButton").enable(false);
                        $("#resvCreateBtn").data("kendoButton").enable(true);
                        $("#partResvComp").data("kendoButton").enable(false);

                        $("#parPkgAdd").data("kendoButton").enable(true);
                        $("#parAdd").data("kendoButton").enable(true);
                        $("#parDel").data("kendoButton").enable(true);

                        break;
                    default :
                        $("#resvCreate").data("kendoButton").enable(false);
                        $("#resvCancel").data("kendoButton").enable(false);
                        $("#print").data("kendoButton").enable(false);
                        $("#resvCreateBtn").data("kendoButton").enable(true);
                        $("#partResvComp").data("kendoButton").enable(false);

                        $("#parPkgAdd").data("kendoButton").enable(false);
                        $("#parAdd").data("kendoButton").enable(false);
                        $("#parDel").data("kendoButton").enable(false);

                        break;
                }
            }
        };
    });

    $("#parResvDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#parResvDocNo").val()) != ""){
            e.preventDefault();
            var data = {"parResvDocNo":$("#parResvDocNo").val()}
            detailSet(data, false);
        }
    });

    detailSet = function(data, slide){

        $.ajax({
            url:"<c:url value='/ser/rev/partReservation/selectPartReservationByKey.do' />"
            ,data:JSON.stringify({sParResvDocNo:data.parResvDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(dms.string.strNvl(result.parResvDocNo) == ""){
                    dms.notification.info("<spring:message code='ser.menu.partResvCreate' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                } else {
                    // 예약현황보드 슬라이드 닫기
                    if(slide){
                        slidePlay();
                    }
                    $("#parAmt").val(0);
                    $("#totAmt").val(0);

                    $("#parResvDocNo").val(result.parResvDocNo);
                    $("#preAmt").data("kendoExtNumericTextBox").value(result.preAmt);
                    $("#parResvTp").data("kendoExtDropDownList").value(result.parResvTp);
                    $("#parResvRemark").val(result.parResvRemark);
                    $("#parResvStatus").val(result.parResvStatNm);
                    $("#parResvStatCd").val(result.parResvStatCd);
                    $("#regUsrNm").val(result.regUsrNm);
                    getCustInfo(result, "N");                                // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                    partInfo(result.parResvDocNo, "${preFixId}");          // 부품(selectPartList.jsp)
                    custDemandSet(result.parResvDocNo, "${preFixId}");
                    etcIssueSet(result.parResvDocNo, "${preFixId}");    // 기타사항
                }
            }
        });
    };

    /** 부품준비상태 확인 **/
    function checkParReadyStat(){
        var checkCnt = 0;
        var partGrid = $("#partGrid").data("kendoExtGrid");
        var partRows = partGrid.tbody.find("tr");

        partRows.each(function(index, row){

            var data = partGrid.dataItem(row);
            if(data.parResvStatCd === "03"){ // 예류
                checkCnt ++;
            }
        });

        if(checkCnt > 0){
            $("#partArryAlarm").data("kendoButton").enable(true);
        }
    }

    /** 부품예약 번호가 있을경우 자동 조회**/
    <c:if test="${parResvDocNo ne ''}">
        var data = {"parResvDocNo":"${parResvDocNo}"};
        detailSet(data, false);
    </c:if>
</script>
<!-- //script -->

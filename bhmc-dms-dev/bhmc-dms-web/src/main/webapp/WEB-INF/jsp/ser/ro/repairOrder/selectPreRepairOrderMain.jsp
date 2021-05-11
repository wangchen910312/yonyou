<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div class="content_v1">
        <form id="dmsForm" name="dmsForm" method="POST">

        <!-- 차량정보, 운전자정보 공통 페이지 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp" />
        <!-- 차량정보, 운전자정보 공통 페이지 -->

        <!-- RO번호 -->
        <section class="group">

            <div class="header_area">
                <div style="width:92px;float:left">
                    <h2 class="title_basic"><spring:message code="ser.lbl.preChkRoDocNo" /></h2><!-- 사전 RO번호 -->
                </div>
                <div class="left_area">
                    <div>
                        <div class="form_search">
                            <input type="text" id="preRoDocNo" name="preRoDocNo" class="form_input" style="width:130px;" data-json-obj="true" >
                            <a href="javascript:goPreRepairOrderStatus();"></a>
                        </div>
                    </div>
                </div>
                <div style="float:left;width:35%;box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box;">
                    <div style="width:92px;float:left">
                        <h2 class="title_basic"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></h2>
                    </div>
                    <div class="left_area">
                        <input id="preRoTp" name="preRoTp" class="form_comboBox" value="01" style="width:130px;" />
                    </div>
                </div>
                <div class="btn_right">
                    <button type="button" id="roUpdate" class="btn_s btn_s_min5"><spring:message code="ser.btn.confirm" /><!-- RO변경 --></button>
                    <button type="button" id="roCancel" class="btn_s btn_s_min5"><spring:message code="ser.btn.cancel" /><!-- RO취소 --></button>
                    <button type="button" id="print" class="btn_s btn_s_min5"><spring:message code="global.btn.print" /><!-- RO인쇄 --></button>
                </div>
            </div>

            <div class="table_form form_width_100per mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:11%;">
                        <col>
                    </colgroup>
                    <tbody>

                        <tr>
                            <th scope="row"><spring:message code='ser.title.resvDocNo' /><!-- 예약번호 --></th>
                            <td class="readonly_area">
                                <input type="text" id="resvDocNo" name="resvDocNo" class="form_input form_readonly" data-json-obj="true" readonly>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                            <td class="readonly_area">
                                <input type="text" id="diagDocNo" name="diagDocNo" class="form_input form_readonly" data-json-obj="true" readonly>
                            </td>
                            <th scope="row"><span id="incNoSpan"><spring:message code='ser.lbl.incReqNo' /></span><!-- 보험신청번호 --></th>
                            <td>
                                <input type="text" id="incReqNo" name="incReqNo" class="form_input form_readonly" data-json-obj="true" data-name="<spring:message code='ser.lbl.incReqNo'/>" readonly>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.origRorcptNo' /><!-- 원 RO번호 --></th>
                            <td class="readonly_area">
                                <input type="text" id="baseRoNo" name="baseRoNo" class="form_input" data-json-obj="true" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 일반 -->
            <div id="tabstrip2" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                    <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                    <li class="k-state-active"><spring:message code="ser.lbl.rpipProject" /><!-- 정비항목 --></li>
                    <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                    <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- 고객요청사항 & 고장설명 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp" />
                <!-- //고객요청사항 & 고장설명 -->

                <!-- 정비항목 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrList.jsp" />
                <!-- //정비항목 -->

                <!-- 부품 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
                <!-- //부품 -->

                <!-- 기타 -->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
                <!-- //기타 -->
            </div>
            <!-- //일반 -->

            <div class="table_form form_width_100per mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:11%;">
                        <col style="width:14%;">
                        <col style="width:11%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.preLbrSubAmt" /><!-- 예정공임비 소계 --></th>
                            <td class="readonly_area">
                                <input id="lbrAmt" name="lbrAmt" class="form_numeric ar" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.preParSubAmt" /><!-- 예정부품대 소계 --></th>
                            <td class="readonly_area">
                                <input id="parAmt" name="parAmt" class="form_numeric ar" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.preEtcSubAmt" /><!-- 예상기타비용소계 --></th>
                            <td class="readonly_area">
                                <input id="etcAmt" name="etcAmt" class="form_numeric ar" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.preTotAmt" /><!-- 예정서비스 비용합계 --></th>
                            <td class="readonly_area">
                                <input id="totAmt" name="totAmt" class="form_numeric ar" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /><!-- 고부품처리방식 --></th>
                            <td>
                                <input id="atqProcTp" name="atqProcTp" class="form_comboBox" value="02" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWash" /><!-- 세차요청 --></th>
                            <td>
                                <input id="carWashTp" name="carWashTp" class="form_comboBox" value="01" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.custStbyMth" /><!-- 고객대기방식 --></th>
                            <td>
                                <input id="custWaitMthCd" name="custWaitMthCd" class="form_comboBox" value="01" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.preAmt" /></th><!-- 선수금 -->
                            <td>
                                <input type="text" id="preAmt" class="form_numeric ar form_readonly" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roadTest" /><!-- 도로테스트 --></th>
                            <td class="required_area">
                                <input id="roadTestCd" name="roadTestCd" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.qtTest" /><!-- 품질검사 --></th>
                            <td>
                                <input id="qtTestMthCd" name="qtTestMthCd" class="form_comboBox" value="01" data-json-obj="true">
                            </td>
                             <th scope="row"><spring:message code="global.lbl.tdrvReq" /><!-- 시승요청 --></th>
                            <td>
                                <input id="carDriveReqTp" name="carDriveReqTp" class="form_comboBox" value="02" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                            <td>
                                <input id="expcDlDt" name="expcDlDt" class="form_datetimepicker" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roRemark" /><!-- RO비고 --></th>
                            <td colspan="7">
                                <input type="text" id="roRemark" name="roRemark" class="form_input" data-json-obj="true">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="roChgAlarm" class="btn_m"><spring:message code="ser.btn.roChgAlarm" /></button><!-- RO변경알람 -->
                    <button type="button" id="pwa" class="btn_m btn_link"><spring:message code="ser.btn.pwa" /></button><!-- PWA -->
                    <button type="button" id="roCreate" class="btn_m btn_link"><spring:message code="ser.btn.roInsert" /></button><!-- RO등록 -->
                </div>
            </div>
            <div class="header_area">
                <div class="btn_left">
                    <th scope="row"><spring:message code="ser.lbl.preChkRoDocNo" /></th><!-- 정비미리점검자 -->
                    <td><input type="text" id="" name="" class="form_input" style="width:156px;" /></td>
                </div>
                <div class="btn_right">
                    <button type="button" id="" class="btn_m"><spring:message code="ser.lbl.preChkStart" /></button><!-- 정비미리점검시작 -->
                    <button type="button" id="" class="btn_m"><spring:message code="ser.lbl.preChkPause" /></button><!-- 정비미리점검 일시정지 -->
                    <button type="button" id="" class="btn_m"><spring:message code="ser.lbl.preChkRestart" /></button><!-- 정비미리점검 재시작 -->
                    <button type="button" id="" class="btn_m"><spring:message code="ser.lbl.preChkConfirm" /></button><!-- 정비미리점검완료 -->
                    <button type="button" id="" class="btn_m"><spring:message code="ser.lbl.preChkCancel" /></button><!-- 취소정비미리점검 -->
                </div>
            </div>
        </section>
        <!-- //RO번호 -->

        <input type="hidden" id="preRoStatCd" name="preRoStatCd" data-json-obj="true">
        </form>
    </div>
</div>
    <!-- 우측 메뉴 간반보드 공통 페이지 -->
    <c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp" />
    <!-- 우측 메뉴 간반보드 공통 페이지 -->

<!-- //서비스예약 -->


<!-- script -->
<script>

    var isTablet="${isTablet}";
    var _width=920;//web
    if(isTablet == "true"){
        _width=950;//tablet
    }

    var tecSearchPopup;
    var bayManagePopup;
    var roCancelPopup;
    var visitServicePopup;
    var deliveryPopup;
    var pwaApprovePopupWindow;
    var insurancePopup;

    //공통코드:고객대기방식유형
    var custWaitMthCdList = [];
    <c:forEach var="obj" items="${custWaitMthCdList}">
    custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:고품처리유형
    var atqProcTpCdList = [];
    <c:forEach var="obj" items="${atqProcTpCdList}">
    atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:차량세차유형
    var carWashTpCdList = [];
    <c:forEach var="obj" items="${carWashTpCdList}">
    carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:차량시승요청유형
    var carDriveReqTpCdList = [];
    <c:forEach var="obj" items="${carDriveReqTpCdList}">
    carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:사용여부
    var useYnCdList = [];
    <c:forEach var="obj" items="${useYnCdList}">
    useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:품질검사
    var qtTestMthCdList = [];
    <c:forEach var="obj" items="${qtTestMthCdList}">
    qtTestMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    $(document).ready(function() {

        $("#parAmt, #lbrAmt, #etcAmt, #totAmt, #preAmt").kendoExtNumericTextBox({
            format:"n2"                // n0:###,###, n2:###,###.##
           ,decimals:2                // 소숫점
           ,value:0.00
           ,spinners:false             // 증,감 화살표
        });

        // 고객대기방식
        $("#custWaitMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custWaitMthCdList
            ,optionLabel:" "
            ,index:1
        });

        // 고부품처리방식
        $("#atqProcTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:atqProcTpCdList
            ,optionLabel:" "
            ,index:2
        });

        // 세차요청
        $("#carWashTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carWashTpCdList
            ,optionLabel:" "
            ,index:1
        });

        // 시승요청
        $("#carDriveReqTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carDriveReqTpCdList
            ,index:2
        });

        // 품질검사
        $("#qtTestMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:qtTestMthCdList
            ,optionLabel:" "
            ,index:1
        });

        // 도로 테스트
        $("#roadTestCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnCdList
            ,optionLabel:" "
        });

        // 예약구분
        var preRoTp;
        $("#preRoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roTpCdList
            ,select:function(e){
                var selectVal = this.value();
                preRoTp = selectVal;
            }
            ,change:function(e){
                var selectVal = this.value();

                setChangeRoTpValue(selectVal,preRoTp); //selectPartList.jsp 로 이동
                /*
                if(selectVal == '02'){

                    changeLbrTpList(selectVal);

                    $.each(getLbrData(), function(i , gridData){
                        gridData.set("lbrTp", "03");
                        gridData.set("roTp", selectVal);
                        changeRateAmt();

                    });

                    $.each(getPartData(), function(i , gridData){
                        gridData.set("roTp", selectVal);
                    });

                }else{

                    changeLbrTpList(selectVal);

                    $.each(getLbrData(), function(i , gridData){
                        gridData.set("lbrTp", "01");
                        gridData.set("roTp", selectVal);
                        changeRateAmt();
                    });

                    $.each(getPartData(), function(i , gridData){
                        gridData.set("roTp", selectVal);
                    });
                }

                if(selectVal == '03'){
                    insurancePopup = dms.window.popup({
                        windowId:"insurancePopup"
                        ,title:"<spring:message code='ser.lbl.insurance' />"
                        ,content:{
                            url:"<c:url value='/ser/cmm/popup/selectInsurancePopup.do'/>"
                            ,data:{
                                "autoBind":false
                                ,"selectable":"single"
                            }
                        }
                    });

                    $("#incReqNo").prop("readonly", false);
                    $("#incReqNo").removeClass("form_readonly");
                } else if(selectVal == '05') {
                    //RO검색 팝업
                    roSearchPopupWindow("RW");
                } else {
                    $("#incReqNo").val("");
                    $("#incReqNo").prop("readonly", true);
                    $("#incReqNo").addClass("form_readonly");
                }
                changeRateAmt();
                */
            }
            ,index:0
        });

        // 예정인도일자
        $("#expcDlDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // pwa
        $("#pwa").kendoButton({
            click:function(e) {

            }
            ,enable:false
        });

        // RO변경알람
        $("#roChgAlarm").kendoButton({
            click:function(e) {

            }
            ,enable:false
        });

        // RO등록
        $("#roCreate").kendoButton({
            click:function(e) {
                parent._createOrReloadTabMenu("<spring:message code='ser.menu.rpipPreChk' />", "<c:url value='/ser/ro/repairOrder/selectPreRepairOrderMain.do'/>?vinNo="+$("#vinNo").val(), "VIEW-D-10191"); // RO Main
            }
        });

        $(".tab_area").kendoExtTabStrip({
            animation:false
        });

        // 확인
        $("#roUpdate").kendoButton({
            click:function(e) {
                saveRo("01");
            }
            ,enable:false
        });

        // 취소
        $("#roCancel").kendoButton({
            click:function(e) {

                roCancelPopup = dms.window.popup({
                    windowId:"roCancelWin"
                        , title:"<spring:message code='ser.lbl.roCancel'/>"   // 예약취소
                        , width:400
                        , height:200
                        , content:{
                            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderCancelPopup.do'/>"
                            ,data:{
                                "preRoDocNo":$("#preRoDocNo").val()
                                ,"callbackFunc":function(){
                                    dms.notification.success("<spring:message code='ser.lbl.roCancel' var='ro' /><spring:message code='global.info.cancelSuccessParam' arguments='${ro}' />");
                                    initAll();
                                }
                            }
                        }
                });
            }
            ,enable:false
        });

        $("#print").kendoButton({
            click:function(e) {
                alert("print");
            }
            ,enable:false
        });

        saveRo = function(preRoStat){

            var validator = $("#dmsForm").kendoExtValidator().data("kendoExtValidator");

            if (validator.validate()) {

                if( dms.string.strNvl( $("#preRoTp").val()) == ""){
                    dms.notification.warning("<spring:message code='ser.lbl.roTp' var='roTp' />"+
                            "<spring:message code='global.info.check.field' arguments='${roTp}' />");
                    $("#preRoTp").focus();
                    return
                }

                var formParam = $("dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

                formParam.preRoStatCd = preRoStat;
                formParam.expcDlDt = $("#expcDlDt").data("kendoExtMaskedDatePicker").value();
                formParam.preRoTp = $("#preRoTp").data("kendoExtDropDownList").value();
                formParam.parAmt = $("#parAmt").data("kendoExtNumericTextBox").value();
                formParam.lbrAmt = $("#lbrAmt").data("kendoExtNumericTextBox").value();
                formParam.etcAmt = $("#etcAmt").data("kendoExtNumericTextBox").value();
                formParam.totAmt = $("#totAmt").data("kendoExtNumericTextBox").value();

                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $.extend(
                   {"preRepairOrderVO":formParam}
                   ,{"servicePartListVO":getPartData()}
                   ,{"serviceLaborListVO":getLbrData()}
                   ,{"trobleDescVO":trobleDescParam()}
                   ,{"custDemandListVO":custDemandParam()}
                   ,{"etcIssueListVO":getEtcIssueData()}
                )

                $.ajax({
                    url:"<c:url value='/ser/ro/repairOrder/multiPreRepairOrder.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        $("#preRoDocNo").val(result);
                        partInfo(result, "${preFixId}");
                        lbrInfo(result, "${preFixId}" , $("#ltsModelCd").val());
                        trobleDescInfo(result, "${preFixId}");
                        etcIssueSet(result, "${preFixId}");  // 기타사항

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

        // RO정보 셋팅
        roInfoSet = function(result, infoType){

            $("#parAmt").val(0);
            $("#lbrAmt").val(0);
            $("#totAmt").val(0);

            if(infoType == "PRC"){
                $("#preRoDocNo").val(result.preRoDocNo);

                $("#preRoTp").data("kendoExtDropDownList").value(result.preRoTp);
                $("#custWaitMthCd").data("kendoExtDropDownList").value(result.custWaitMthCd);
                $("#atqProcTp").data("kendoExtDropDownList").value(result.atqProcTp);
                $("#carWashTp").data("kendoExtDropDownList").value(result.carWashTp);
                $("#carDriveReqTp").data("kendoExtDropDownList").value(result.carDriveReqTp);
                $("#qtTestMthCd").data("kendoExtDropDownList").value(result.qtTestMthCd);
                $("#expcDlDt").data("kendoExtMaskedDatePicker").value(result.expcDlDt);
                $("#roRemark").val(result.roRemark);

            } else {
                $("#preRoDocNo").val("");
                $("#custWaitMthCd").data("kendoExtDropDownList").value("");
                $("#atqProcTp").data("kendoExtDropDownList").value("");
                $("#carWashTp").data("kendoExtDropDownList").value("");
                $("#carDriveReqTp").data("kendoExtDropDownList").value("");
            }

            $("#cauCd1").val(result.cauCd1);
            $("#cauNm1").val(result.cauNm1);
            $("#phenCd1").val(result.phenCd1);
            $("#phenNm1").val(result.phenNm1);

            $("#cauCd2").val(result.cauCd2);
            $("#cauNm2").val(result.cauNm2);
            $("#phenCd2").val(result.phenCd2);
            $("#phenNm2").val(result.phenNm2);

            $("#resvDocNo").val(result.resvDocNo);
            $("#tecId").val(result.tecId);
            $("#tecNm").val(result.tecNm);
            $("#diagDocNo").val(result.diagDocNo);

        }

        //초기화
        initAll = function(){
            serviceJs.commonInit();     // service 공통 JS
            btnControll("");
        }

        btnControll = function(status){
            if(status == "U"){

                $("#roUpdate").data("kendoButton").enable(true);
                $("#roCancel").data("kendoButton").enable(true);
                $("#print").data("kendoButton").enable(true);

                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);

            } else {

                $("#roUpdate").data("kendoButton").enable(false);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);

                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
            }
        };

        $("#preRoDocNo").keypress(function(e){
            if(e.keyCode === 13 && dms.string.strNvl($("#preRoDocNo").val()) != ""){
                e.preventDefault();
                var data = {"preRoDocNo":$("#preRoDocNo").val()}
                detailSet(data, false, "PRC");
            }
        });

        detailSet = function(data, slide, infoType){

            if(infoType == "PC"){
                //initAll();
                // 예약현황보드 슬라이드 닫기

                getCustInfo(data);

                $("#vinNo").val(data.vinNo);
                $("#roGrpNo").val(data.roGrpNo);
                $("#diagDocNo").val(data.diagDocNo);
                $("#runDistVal").data("kendoExtNumericTextBox").value(data.runDistVal);
                //$("#runDistValTablet").data("kendoExtNumericTextBox").value(data.runDistVal);

                trobleDescInfo(data.diagDocNo, "PC");
                if(slide){
                    //slidePlay1();
                    slidePlay2();
                }
            }else{
                $.ajax({
                    url:"<c:url value='/ser/ro/repairOrder/selectPreRepairOrderByKey.do' />"
                    ,data:JSON.stringify({sPreRoDocNo:data.preRoDocNo})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                        if(result != null){
                            // 예약현황보드 슬라이드 닫기
                            if(slide){
                                slidePlay();
                            }
                            getCustInfo(result);                            // 고객정보(selectCustCarInfoMain.jsp)
                            roInfoSet(result, infoType);
                            partInfo(result.preRoDocNo, infoType);          // 부품(selectPartList.jsp)
                            lbrInfo(result.preRoDocNo, infoType , result.ltsModelCd);           // 공임(selectLbrList.jsp)
                            trobleDescInfo(result.preRoDocNo, infoType);    // 고객요구사항및 고장설명
                            etcIssueSet(result.preRoDocNo, infoType);       // 기타사항
                        }
                    }
                });
            }
        };

        goPreRepairOrderStatus = function(){
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.rpipPreChkStatus'/>", "<c:url value='/ser/ro/repairOrder/selectPreRepairOrderStatusMain.do'/>", "VIEW-D-10192"); // 예약접수현황
        }

        //RO검색 팝업
        roSearchPopupWindow = function(listType){
            repairOrderSearchPopup = dms.window.popup({
                windowId:"repairOrderSearchPopup"
                , width:_width//todo khskhs 사이즈변경완료
                , height:550
                , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "close" :"Y"
                        , "callbackFunc":function(data){
                            if(listType == "RW"){
                                $("#baseRoNo").val(data[0].roDocNo);
                                partInfo(data[0].roDocNo, "RO");            // 부품(selectPartList.jsp)
                                lbrInfo(data[0].roDocNo, "RO" , $("#ltsModelCd").val());             // 공임(selectLbrList.jsp)
                                trobleDescInfo(data[0].roDocNo, "RO");      // 고객요구사항및 고장설명
                                etcIssueSet(data[0].roDocNo, "RO");         // 기타사항
                            }
                        }
                    }
                }
            });
        }

        <c:if test="${preRoDocNo ne ''}">
            var data = {"preRoDocNo":"${preRoDocNo}"};
            detailSet(data, false, "PRC");
        </c:if>
    });


</script>
<!-- //script -->

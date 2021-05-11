<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div class="content_v1">
        <form id="dmsForm" name="dmsForm">
        <input type="hidden" id="rescStatCd" name="rescStatCd" data-json-obj="true">
        <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true">

        <!-- 차량정보, 운전자정보 공통 페이지 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp" />
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
                            <th scope="row"><spring:message code="ser.lbl.rescDocNo" /></th><!-- 구원서비스번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="rescDocNo" name="rescDocNo" class="form_input" data-json-obj="true">
                                    <a href="javascript:goRescStatus();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescTp" /></th><!-- 구원서비스유형 -->
                            <td>
                                <input id="rescTp" name="rescTp" style="width:110px;" value="01" class="form_comboBox" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescStat" /></th><!-- 구원서비스상태 -->
                            <td class="readonly_area">
                                <input id="rescStatus" name="rescStatus" class="form_input" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescWrtrNm" /></th><!-- 구원서비스조작자 -->
                            <td class="readonly_area">
                                <input id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                    <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                    <li class="k-state-active"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></li>
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

            <!-- //탭메뉴 전체 영역 -->
            <div class="table_form form_width_100per mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:11%;">
                        <col style="width:13%;">
                        <col style="width:11%;">
                        <col style="width:13%;">
                        <col style="width:11%;">
                        <col style="width:15%;">
                        <col style="width:11%;">
                        <col style="width:15%;">
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
                            <th scope="row"><spring:message code="ser.lbl.saAppoint" /><!-- SA지정 --></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="saNm" name="saNm" readonly class="form_input" data-json-obj="true">
                                    <a href="javascript:techPopup('SA');"></a>
                                    <input type="hidden" id="saId" name="saId" data-json-obj="true">
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.tecAppoint" /><!-- 테크니션 지정 --></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="tecNm" name="tecNm" readonly class="form_input" data-json-obj="true">
                                    <a href="javascript:techPopup('TEC');"></a>
                                    <input type="hidden" id="tecId" name="tecId" data-json-obj="true">
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescReqDt" /><!-- 구원요청시간 --></th>
                            <td class="readonly_area">
                                <input id="rescReqDt" name="rescReqDt" class="form_datetimepicker" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.expStartDt" /><!-- 예정출동시간 --></th>
                            <td>
                                <input id="expcRescStartDt" name="expcRescStartDt" class="form_datetimepicker" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.rescAddr" /><!-- 구원주소 --></th>
                            <td colspan="7">
                                <input type="text" id="rescAddrNm" name="rescAddrNm" class="form_input" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.rescStartDt" /><!-- 구원출동시간 --></th>
                            <td>
                                <input id="rescStartDt" name="rescStartDt" class="form_datetimepicker">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.arrvDt" /><!-- 현장도착시간 --></th>
                            <td>
                                <input id="arrvDt" name="arrvDt" class="form_datetimepicker">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescEndDt" /><!-- 현장leave시간 --></th>
                            <td>
                                <input id="rescEndDt" name="rescEndDt" class="form_datetimepicker">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescReturnDt" /><!-- 구원복귀시간 --></th>
                            <td>
                                <input id="rescReturnDt" name="rescReturnDt" class="form_datetimepicker">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.rescMthCd" /><!-- 구원방식 --></th>
                            <td>
                                <input type="text" id="rescMthCd" name="rescMthCd" data-json-obj="true" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rescCarCd" /><!-- 구원차량 --></th>
                            <td>
                                <input type="text" id="rescCarCd" name="rescCarCd"  class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.moveRunVal" /><!-- 출동주행거리 --></th>
                            <td>
                                <input type="text" id="moveRunDistVal" name="moveRunDistVal" class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.returnRunVal" /><!-- 복귀주행거리 --></th>
                            <td>
                                <input type="text" id="returnRunDistVal" name="returnRunDistVal" class="form_input" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.rescRemark" /><!-- 구원비고 --></th>
                            <td colspan="7">
                                <input type="text" id="rescRemark" name="rescRemark" class="form_input" data-json-obj="true">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-11574" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="visitSer" class="btn_m"><spring:message code="global.lbl.vsitSer" /><!-- 방문서비스 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11573" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="delivery" class="btn_m"><spring:message code="global.lbl.delivery" /><!-- Delivery --></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11572" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="serAlarm" class="btn_m"><spring:message code="ser.lbl.resvSerAlarm" /></button><!-- 서비스인도알람 -->
                    </dms:access>
                </div>
            </div>

        </section>
        <!-- //예약번호 -->
        </form>
    </div>
</div>
    <!-- 우측 메뉴 간반보드 공통 페이지 -->
    <c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp" />
    <!-- 우측 메뉴 간반보드 공통 페이지 -->

<!-- //서비스예약 -->

<script>

    var tecSearchPopup;
    var bayManagePopup;
    var resvCancelPopup;
    var visitServicePopup;
    var deliveryPopup;


    //공통코드:구원방식
    var rescMthCdList = [];
    <c:forEach var="obj" items="${rescMthCdList}">
    rescMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:구원유형
    var rescueTpCdList = [];
    <c:forEach var="obj" items="${rescueTpCdList}">
    rescueTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {

        $("#parAmt, #lbrAmt, #etcAmt, #totAmt").kendoExtNumericTextBox({
            format:"n2"                // n0:###,###, n2:###,###.##
           ,decimals:2                // 소숫점
           ,value:0.00
           ,spinners:false             // 증,감 화살표
        });

        // 구원구분
        $("#rescTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:rescueTpCdList
            ,optionLabel:" "
            ,index:1
        });
        // 구원방식
        $("#rescMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:rescMthCdList
            ,optionLabel:" "
            ,index:1
        });

        // 차량수령시간
        $("#carReceiveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 방문시간
        $("#vsitDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 구원요청시간

        $("#rescReqDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 구원요청일자
        $("#expcRescStartDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 구원출동일자
        $("#rescStartDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 도착일자
        $("#arrvDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 구원종료일자
        $("#rescEndDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 구원복귀일자
        $("#rescReturnDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#tabstrip, #tabstrip2").kendoExtTabStrip({
            animation:false
        });

        // 저장
        $("#resvCreate").kendoButton({
            click:function(e) {
                saveResv("R");
            }
            ,enable:false
        });


        // 취소
        $("#resvCancel").kendoButton({
            click:function(e) {
                 if($("#rescDocNo").val()==""){
                     return
                 }
                resvCancelPopup = dms.window.popup({
                    windowId:"resvCancelPopup"
                    , title:"救援取消"   // 예약취소
                    , width:400
                    , height:200
                    , content:{
                        url:"<c:url value='/ser/res/rescue/selectRescueCancelPopup.do'/>"
                        ,data:{
                            "rescDocNo":$("#rescDocNo").val()
                            ,"dlrCd":$("#dlrCd").val()
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

        $("#print").kendoButton({
            click:function(e) {
                alert("print");
            }
            ,enable:false
        });

        $("#serAlarm").kendoButton({
            click:function(e) {
            }
            ,enable:false
        });

        goRescStatus = function(){
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.rescList'/>", "<c:url value='/ser/res/rescue/selectRescueListMain.do'/>", "VIEW-I-10169"); // 구원서비스현황
        };

        $("#rescDocNo").keypress(function(e){
            if(e.keyCode === 13 && dms.string.strNvl($("#rescDocNo").val()) != ""){
                e.preventDefault();
                var data = {"rescDocNo":$("#rescDocNo").val()}
                detailSet(data, false, "RES");
            }
        });

        saveResv = function(resvStat){

            var validator = $("#dmsForm").kendoExtValidator().data("kendoExtValidator");

            $("#rescReqDt").data("kendoExtMaskedDateTimePicker").value(new Date());

            if (validator.validate()) {

                /* if( dms.string.isEmpty($("#runDistVal").val()) ) {
                    $("#runDistVal").focus();
                    dms.notification.success("<spring:message code='ser.lbl.nowRunDist' var='nowRunDist' /><spring:message code='global.info.emptyParamInfo' arguments='${nowRunDist}' />");
                    return false;
                } */

                $("#rescStatCd").val(resvStat);
                var formParam = $("#dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

                formParam.rescReqDt = $("#rescReqDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.expcRescStartDt = $("#expcRescStartDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.rescStartDt = $("#rescStartDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.arrvDt = $("#arrvDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.rescEndDt = $("#rescEndDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.rescReturnDt = $("#rescReturnDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.expcRescStartDt = $("#expcRescStartDt").data("kendoExtMaskedDateTimePicker").value();
                formParam.parAmt = $("#parAmt").data("kendoExtNumericTextBox").value();
                formParam.lbrAmt = $("#lbrAmt").data("kendoExtNumericTextBox").value();
                formParam.etcAmt = $("#etcAmt").data("kendoExtNumericTextBox").value();
                formParam.totAmt = $("#totAmt").data("kendoExtNumericTextBox").value();

                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $.extend(
                   {"rescueVO":formParam}
                   ,{"servicePartListVO":getPartData()}
                   ,{"serviceLaborListVO":getLbrData()}
                   ,{"trobleDescVO":trobleDescParam()}
                   ,{"custDemandListVO":custDemandParam()}
                   ,{"etcIssueListVO":getEtcIssueData()}
                );

                $.ajax({
                    url:"<c:url value='/ser/res/rescue/multiRescue.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        $("#rescDocNo").val(result);
                        var data = {"rescDocNo":result, "vinNo":$("#vinNo").val()};
                        detailSet(data, false, "RES");
                        partInfo(result, "${preFixId}");
                        lbrInfo(result, "${preFixId}");
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

        // 테크니션 팝업
        techPopup = function(saGubun){
            tecSearchPopup = dms.window.popup({
                windowId:"teckManFnSearchWin"
                , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "callbackFunc":function(jsonObj) {
                            if(jsonObj.length > 0) {
                                if(saGubun == "SA"){
                                    $("#saId").val(jsonObj[0].tecId);
                                    $("#saNm").val(jsonObj[0].tecNm);
                                } else if(saGubun == "TEC") {
                                    $("#tecId").val(jsonObj[0].tecId);
                                    $("#tecNm").val(jsonObj[0].tecNm);
                                }
                            }
                        }
                    }
                }
            });
        };

        // SA지정 팝업
        bayManageWindow = function(){

            bayManagePopup = dms.window.popup({
                windowId:"teckManFnSearchWin"
                    , title:"<spring:message code='ser.title.baySearch' />"   // BAY 조회
                    , content:{
                        url:"<c:url value='/ser/cmm/popup/selectBayManagePopup.do'/>"
                        , data:{
                            "autoBind":true
                            , "callbackFunc":function(jsonObj) {

                                if(jsonObj.length > 0) {
                                    $("#bayNo").val(jsonObj[0].bayNo);
                                }
                            }
                        }
                    }

            });
        };
    });


    var sVinNo =  "${sVinNo}";

    detailSet = function(data, slide, infoType){
        $.ajax({
            url:"<c:url value='/ser/res/rescue/selectRescueByKey.do' />"
            ,data:JSON.stringify({sRescDocNo:data.rescDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                    // 예약현황보드 슬라이드 닫기
                    if(slide){
                        slidePlay();
                    }
                    getCustInfo(result);    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                    resvInfoSet(result);
                    partInfo(result.rescDocNo, "${preFixId}");
                    lbrInfo(result.rescDocNo, "${preFixId}");
                    trobleDescInfo(result.rescDocNo, "${preFixId}");
                    etcIssueSet(result.rescDocNo, "${preFixId}");  // 기타사항
                }
            }
        });
    };

    // 예약정보 셋팅
    resvInfoSet = function(result){

        $("#parAmt").val(0);
        $("#lbrAmt").val(0);
        $("#totAmt").val(0);

        $("#rescDocNo").val(result.rescDocNo);
        $("#dlrCd").val(result.dlrCd);
        $("#saId").val(result.saId);
        $("#saNm").val(result.saNm);
        $("#tecId").val(result.tecId);
        $("#tecNm").val(result.tecNm);
        $("#bayNo").val(result.bayNo);
        $("#rescCarCd").val(result.rescCarCd);
        $("#moveRunDistVal").val(result.moveRunDistVal);
        $("#returnRunDistVal").val(result.returnRunDistVal);
        $("#rescRemark").val(result.rescRemark);
        $("#rescAddrNm").val(result.rescAddrNm);
        $("#rescTp").data("kendoExtDropDownList").value(result.rescTp);
        $("#rescMthCd").data("kendoExtDropDownList").value(result.rescMthCd);
        $("#custRemark").val(result.custRemark);
        $("#rescReqDt").data("kendoExtMaskedDateTimePicker").value(result.rescReqDt);
        $("#rescStartDt").data("kendoExtMaskedDateTimePicker").value(result.rescStartDt);
        $("#arrvDt").data("kendoExtMaskedDateTimePicker").value(result.arrvDt);
        $("#rescEndDt").data("kendoExtMaskedDateTimePicker").value(result.rescEndDt);
        $("#rescReturnDt").data("kendoExtMaskedDateTimePicker").value(result.rescReturnDt);
        $("#expcRescStartDt").data("kendoExtMaskedDateTimePicker").value(result.expcRescStartDt);
        $("#rescStatus").val("<spring:message code='ser.lbl.rescComplete'/>");
        $("#regUsrNm").val(result.regUsrNm);
    };

    //초기화
    initAll = function(){
        serviceJs.commonInit();     // service 공통 JS
        btnControll("");
    };

    btnControll = function(status){

        switch(status){
            case "U" :
                $("#resvCreate").data("kendoButton").enable(true);
                $("#resvCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);

                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                break;
            default :
                $("#resvCreate").data("kendoButton").enable(false);
                $("#resvCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);

                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                break;
        }
    };

    /** 구원서비스 번호가 있을경우 자동 조회**/
     <c:if test="${rescDocNo ne '' or vinNo ne ''}">
        var data = {"rescDocNo":"${rescDocNo}", "vinNo":"${vinNo}"};
        detailSet(data, false, "RES");
    </c:if>

</script>
<!-- //script -->

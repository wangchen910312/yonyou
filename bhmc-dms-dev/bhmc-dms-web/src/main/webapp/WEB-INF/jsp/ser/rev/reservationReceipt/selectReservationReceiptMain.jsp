<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div class="content_v1">

        <form id="dmsForm" name="dmsForm">
        <input type="hidden" id="diagDocNo" name="diagDocNo" >

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
                            <th scope="row"><spring:message code="ser.title.resvDocNo" /></th><!-- 예약번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="resvDocNo" name="resvDocNo" class="form_input" data-json-obj="true">
                                    <a href="javascript:goResvStatus();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.resvStat" /></th><!-- 예약상태 -->
                            <td class="readonly_area">
                                <input id="resvStatCd" name="resvStatCd" readonly class="form_comboBox" data-json-obj="true">
                            </td>
<%--                             <th scope="row"><spring:message code="ser.lbl.resvContacts" /></th><!-- 예약상태 --> --%>
<!--                             <td class=""> -->
<!--                                 <input id="resvContacts" name="resvContacts" class="form_input" data-json-obj="true"> -->
<!--                             </td> -->
							<th scope="row"><spring:message code="ser.lbl.resvChannel" /></th><!-- 예약채널 -->
                            <td>
                                <input id="resvTp" name="resvTp" value="01" class="form_comboBox" data-json-obj="true">
                            </td>
<%--                             <th scope="row"><spring:message code="ser.lbl.resvPhone" /></th><!-- 예약상태 --> --%>
<!--                             <td class=""> -->
<!--                                 <input id="resvPhone" name="resvPhone" class="form_input" data-json-obj="true"> -->
<!--                             </td> -->
                             <th scope="row"><spring:message code="ser.lbl.resvWrtrNm" /></th><!-- 발행자 -->
                            <td class="readonly_area">
                                <input id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                            	<input type="hidden" id="fmsId" name="fmsId" data-json-obj="true" />
                            </td>
                        </tr>
<!--                         <tr> -->
<%--                             <th scope="row"><spring:message code="ser.lbl.resvChannel" /></th><!-- 예약채널 --> --%>
<!--                             <td> -->
<!--                                 <input id="resvTp" name="resvTp" value="01" class="form_comboBox" data-json-obj="true"> -->
<!--                             </td> -->
<%--                             <th scope="row"><spring:message code="ser.lbl.resvWrtrNm" /></th><!-- 발행자 --> --%>
<!--                             <td class="readonly_area"> -->
<!--                                 <input id="regUsrNm" name="regUsrNm" class="form_input" readonly> -->
<!--                             </td> -->
<%--                             <th scope="row"><spring:message code="par.lbl.resvTp" /></th><!-- 예약상태 --> --%>
<!--                             <td class="readonly_area"> -->
<!--                                 <input id="resvWbTp" name="resvWbTp" class="form_input" data-json-obj="true" readonly> -->
<!--                             	<input type="hidden" id="fmsId" name="fmsId" data-json-obj="true" /> -->
<!--                             </td> -->
<!--                         </tr> -->
                    </tbody>
                </table>
            </div>

            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area mt5">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                    <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                    <li><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></li>
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
            <div class="table_form form_width_100per mt5">
                <table>
                    <caption></caption>
                    <colgroup id="reservationColGroup"><!-- ipad 때문에 reservationColGroup를 사용 -->
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
                            <%-- <th scope="row"><spring:message code="ser.lbl.saAppoint" /><!-- SA지정 --></th>
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
                            </td> --%>
                            <th scope="row"><spring:message code="ser.lbl.saAppoint" /><!-- SA지정 --></th>
                            <td>
                                <input type="text" id="saId" name="saId" class="form_comboBox" data-json-obj="true">
                                <!-- <input type="hidden" id="saNm" name="saNm" data-json-obj="true"> -->
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.tecAppoint" /><!-- 테크니션 지정 --></th>
                            <td>
                                <input type="text" id="tecId" name="tecId" class="form_comboBox" data-json-obj="true">
                                <!-- <input type="hidden" id="tecNm" name="tecNm" data-json-obj="true"> -->
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.hopeResvDt" /><!-- 희망예약시간 --></th>
                            <td>
                                <input type="text" id="hopeResvDt" name="hopeResvDt" class="form_datetimepicker" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.resvDt" /></span><!-- 서비스예약시간 --></th>
                            <td class="readonly_area">
                                <input type="text" id="serResvStartDt" name="serResvStartDt" class="form_datetimepicker" data-json-obj="true" data-name="<spring:message code="ser.lbl.serResvDt" />" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.resvRemark" /><!-- 예약서비스비고 --></th>
                            <td colspan="7">
                                <input type="text" id="resvRemark" name="resvRemark" class="form_input" data-json-obj="true"/>
                            </td>
                            <input type="hidden" id="bayNo" name="bayNo" data-json-obj="true" />
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
                <%-- <div class="btn_left">
                    <button type="button" id="visitSer" class="btn_m"><spring:message code="global.lbl.vsitSer" /><!-- 방문서비스 --></button>
                    <button type="button" id="delivery" class="btn_m"><spring:message code="global.lbl.delivery" /><!-- Delivery --></button>
                </div> --%>
                <div class="btn_right">
                    <%-- <button type="button" id="serAlarm" class="btn_m"><spring:message code="ser.lbl.resvSerAlarm" /></button><!-- 부품미리남기기 --> --%>
                    <dms:access viewId="VIEW-D-11589" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="serAlarm" class="btn_m"><spring:message code="ser.btn.resvSerAlarm" /></button><!-- 서비스인도알람 -->
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

<script id="distVal-confirmation" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='ser.info.distValConfirm'/></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<script>

var tecSearchPopup;
var bayManagePopup;
var resvCancelPopup;

//공통코드:예약구분
var resvTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${resvTpCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
    resvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//공통코드:예약상태
var resvStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${resvStatCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
    resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//고객전화표시여부
var custTelYnValue;
<c:forEach var="obj" items="${custTelYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    custTelYnValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

//지정정비사
var techManList=[];
<c:forEach var="obj" items="${techManList}">
    techManList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
</c:forEach>

//지정 SA
var saList=[];
<c:forEach var="obj" items="${saList}">
    saList.push({"saId":"${obj.tecId}", "saNm":"${obj.tecNm}"});
</c:forEach>

//서비스알람설정
var resvSerAlarmValue;
<c:forEach var="obj" items="${resvSerAlarmCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    resvSerAlarmValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

var sVinNo =  "${sVinNo}";
var sResvDocNo = "${sResvDocNo}";
var isTablet = "${isTablet}"; //khs

$(document).ready(function() {

    goResvStatus = function(){
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.reserStatus'/>", "<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptStatusMain.do'/>", "VIEW-D-10497", false); // 예약접수현황
    };

    save = function(resvStat){
    	//liuxueying add start
    	var oldResvStat = $("#resvStatCd").data("kendoExtDropDownList").value();
        //liuxueying add end
    	var validator = $("#dmsForm").kendoExtValidator().data("kendoExtValidator");

        // readOnly는 validator가 적용 안됨
        if ( dms.string.isEmpty($("#serResvStartDt").val())) {
            dms.notification.info("<spring:message code='ser.lbl.serResvDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }

        if (validator.validate()) {

            $("#resvStatCd").data("kendoExtDropDownList").value(resvStat);

            var formParam = $("#dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

            formParam.resvStatCd = resvStat;
            formParam.hopeResvDt = $("#hopeResvDt").data("kendoExtMaskedDateTimePicker").value();
            formParam.serResvStartDt = $("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value();
            formParam.parAmt = $("#parAmt").data("kendoExtNumericTextBox").value();
            formParam.lbrAmt = $("#lbrAmt").data("kendoExtNumericTextBox").value();
            formParam.etcAmt = $("#etcAmt").data("kendoExtNumericTextBox").value();
            formParam.totAmt = $("#totAmt").data("kendoExtNumericTextBox").value();
            formParam.tecNm  = $("#tecId").data("kendoExtDropDownList").text();
            formParam.saNm = $("#saId").data("kendoExtDropDownList").text();
 
            // form 데이터 및 그리드 변경 데이터 세팅
            var param = $.extend(
               {"reservationReceiptVO":formParam}
               ,{"servicePartListVO":getPartData()}
               ,{"serviceLaborListVO":getLbrData()}
               ,{"trobleDescVO":trobleDescParam()}
               ,{"custDemandListVO":custDemandParam()}
               ,{"etcIssueListVO":getEtcIssueData()}
            );
             $.ajax({
                url:"<c:url value='/ser/rev/reservationReceipt/multiReservationReceipt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                	//liuxueying add start
                    $("#resvStatCd").data("kendoExtDropDownList").value(oldResvStat);
                  //liuxueying add end
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    if(resvSerAlarmValue == "A"){
                        sendAlram("A", formParam);
                    } else {
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    $("#resvDocNo").val(result);
                    var data = {"resvDocNo":result}
                    detailSet(data, false);
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

    // 알람보내기
    sendAlram = function(alramType, formParam){
        var resvData = [];
        formParam.resvSerAlramCd = alramType;
        resvData.push(formParam);

        $.ajax({
            url:"<c:url value='/ser/rev/reservationReceipt/resvRegAlramCall.do' />"
            ,data:JSON.stringify(resvData)
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
    };

    // 테크니션 팝업
    techPopup = function(saGubun){
        var title;
        var wrkTp;
        if(saGubun == "SA") {
            title = "<spring:message code='ser.title.saSearch' />";
            wrkTp = "01";
        } else {
            title = "<spring:message code='ser.title.tecSearch' />";
            wrkTp = "05";
        }
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            , title:title
            , height : 400
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do?'/>?wrkTp="+wrkTp
                , data:{
                    "autoBind":true
                    , "wrkTp":wrkTp
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
    }

    // 예약정보 셋팅
    resvInfoSet = function(result){
        btnControll(result.resvStatCd);
        //liuxueying add start
        if(result.resvTp == '03'){//fms类型不允许修改
           $("#fmsId").val(result.fmsId);
 	       $("#resvTp").data("kendoExtDropDownList").enable(false);
        }
        //liuxueying add end
        $("#parAmt").val(0);
        $("#lbrAmt").val(0);
        $("#totAmt").val(0);
        $("#resvDocNo").val(result.resvDocNo);
        $("#docNo").val(result.resvDocNo);

        $("#saId").data("kendoExtDropDownList").value(result.saId);
        $("#tecId").data("kendoExtDropDownList").value(result.tecId);

        /* $("#saId").val(result.saId);
        $("#saNm").val(result.saNm);
        $("#tecId").val(result.tecId);
        $("#tecNm").val(result.tecNm);
         */
        $("#bayNo").val(result.bayNo);
        $("#regUsrNm").val(result.regUsrNm);
        $("#resvTp").data("kendoExtDropDownList").value(result.resvTp);
        $("#hopeResvDt").data("kendoExtMaskedDateTimePicker").value(result.hopeResvDt);
        $("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value(result.serResvStartDt);
        $("#resvRemark").val(result.resvRemark);
        $("#resvStatCd").data("kendoExtDropDownList").value(result.resvStatCd);


    };

    // 예약서비스알람
    $("#serAlarm").kendoButton({
        click:function(e) {

            var formParam = $("#dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

            formParam.hopeResvDt = $("#hopeResvDt").data("kendoExtMaskedDateTimePicker").value();
            formParam.serResvStartDt = $("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value();

            if(resvSerAlarmValue == "A"){
                sendAlram("M", formParam);
            } else {
                serAlramPopup = dms.window.popup({
                    windowId:"serAlramPopup"
                    , title:""
                    , width:300
                    , height:120
                    , content:{
                        url:"<c:url value='/ser/rev/reservationReceipt/selectReservationAlramPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(data){
                                if(data === "A") {
                                    sendAlram("A", formParam);
                                } else {
                                    sendAlram("M", formParam);
                                }
                            }
                        }
                    }
                });
            }
        }
        ,enable:false
    });

    $("#resvDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#resvDocNo").val()) != ""){
            e.preventDefault();
            var data = {"resvDocNo":$("#resvDocNo").val()}
            detailSet(data, false);
        }
    });

    $("#parAmt, #lbrAmt, #etcAmt, #totAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });
    
    var oldResvTp = "";//liuxueying add记录维修预约类型原来的选项值，以便选择蓝斌时控制
    // 예약구분
    $("#resvTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:resvTpCdList
        ,index:0
        ,open :function(e){
        	oldResvTp = this.value();
        }
         //liuxueying add start
        ,change:function(e){
        	if(this.value() == '03'){
        	     dms.notification.warning("<spring:message code='par.lbl.resvTp' var='lresvTp' /><spring:message code='par.err.paramNotAvailable' arguments='${lresvTp}' />");
        		 $("#resvTp").data("kendoExtDropDownList").value(oldResvTp);
        	}
        }
        //liuxueying add end
    });

    // 예약상태
    $("#resvStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:resvStatCdList
        ,index:0
    });
    // 지정SA
    $("#saId").kendoExtDropDownList({
        dataTextField:"saNm"
        ,dataValueField:"saId"
        ,dataSource:saList
        ,optionLabel:" "
        ,index:0
    });
    // 지정정비사
    $("#tecId").kendoExtDropDownList({
        dataTextField:"tecNm"
        ,dataValueField:"tecId"
        ,dataSource:techManList
        ,optionLabel:" "
        ,index:0
    });

    // 희망예약시간
    $("#hopeResvDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 서비스예약시간
    $("#serResvStartDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,enable:false
    });

    // 저장
    $("#resvCreate").kendoButton({
        click:function(e) {
            save("O");
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
                    url:"<c:url value='/ser/rev/reservationReceipt/selectReservationCancelPopup.do'/>"
                    ,data:{
                        "resvDocNo":$("#resvDocNo").val()
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
        click:function(e){

            if(dms.string.isNotEmpty($("#resvDocNo").val())){
                $.ajax({
                    url:"<c:url value='/ser/rev/reservationReceipt/updateReservationReceipt.do' />"
                    ,data:JSON.stringify({"resvDocNo":$("#resvDocNo").val(), "printYn":"Y"})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){

                    }
                });
                var printParam =  "&sDlrCd="+"${dlrCd}"+"&sResvDocNo="+$("#resvDocNo").val()+"&sTelShowYn="+custTelYnValue;
                parent._createOrReloadTabMenu("<spring:message code='ser.lbl.resvDocPrint' />", "<c:url value='/ReportServer?reportlet=ser/selectReservationReceiptMain.cpt'/>"+printParam); // RO Main

            }else{
                //만족도 조사를 선택하세요.
                dms.notification.info("<spring:message code='global.info.preInquire' />");
                return;
            }
        }
    });

    <c:choose>
        <c:when test="${sLinkType eq 'A'}">    // CRM에서 넘어온 경우
        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
            , title:"<spring:message code='ser.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "linkType":"${sLinkType}"
                    , "vinNo":"${sVinNo}"
                    , "carRegNo":"${sCarRegNo}"
                    , "carOwnerNm":"${sCarOwnerNm}"
                    , "preFixId":"RE"
                    , "callbackFunc":function(data){
                        if(data.isNew == "new" || data.isNew == "update"){
                            custReg(data);
                        } else {
                            setBizDataSearch(data[0], preFixId);
                        }
                    }//callback
                }
            }
        });
        </c:when>
        <c:otherwise>
        // 사전점검에서 넘어온 VIN 으로 예약 정보조회
        if(dms.string.strNvl(sVinNo) != ""){
            var data = {"vinNo":sVinNo};
            getCustInfo(data, "Y");
        } else if(dms.string.strNvl(sResvDocNo)){
            var data = {"resvDocNo":sResvDocNo};
            detailSet(data, false);
        }
        </c:otherwise>
    </c:choose>


    if(isTablet == "true"){
        $("#serTitleResvDocNo").css("width","27%");
        $("#serLblResvChannel").css("width","22%");

        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#reservationColGroup col");
            $(colEmt[0]).css("width","8%");
            $(colEmt[1]).css("width","15%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[3]).css("width","15%");
            $(colEmt[4]).css("width","9%");
            $(colEmt[5]).css("width","17%");
            $(colEmt[6]).css("width","8%");
        }
    }

});

$("#tabstrip, #tabstrip2").kendoExtTabStrip({
    animation:false
});

detailSet = function(data, slide){
    $.ajax({
        url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptByKey.do' />"
        ,data:JSON.stringify({sResvDocNo:data.resvDocNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            if(dms.string.strNvl(result.resvDocNo) == ""){
                dms.notification.info("<spring:message code='ser.lbl.resv' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
            } else {
                // 예약현황보드 슬라이드 닫기
                if(slide){
                    slidePlay();
                }

                getCustInfo(result, status);                        // 고객정보(selectCustCarInfoMain.jsp)
                resvInfoSet(result);
                partInfo(result.resvDocNo, "${preFixId}");          // 부품(selectPartList.jsp)
                lbrInfo(result.resvDocNo, "${preFixId}");           // 공임(selectLbrList.jsp)
                trobleDescInfo(result.resvDocNo, "${preFixId}");    // 고객요구사항및 고장설명(selectTabInfo.jsp)
                etcIssueSet(result.resvDocNo, "${preFixId}");       // 기타사항(selectEtcIssue.jsp)
                changeTotalAmt();                                   // 금액 계산(selectLbrList.jsp)

                btnControll($("#resvStatCd").val());
            }
        }
    });
};

btnControll = function(status){
    var resvStat = $("#resvStatCd").val();

    if(dms.string.strNvl(resvStat) == ""){
        if(status == "U"){
            $("#resvCreate").data("kendoButton").enable(true);
            $("#resvCancel").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(false);
            //$("#visitSer").data("kendoButton").enable(true);
            $("#parPkgAdd").data("kendoButton").enable(true);
            $("#lbrPkgAdd").data("kendoButton").enable(true);
            $("#lbrAdd").data("kendoButton").enable(true);
            $("#lbrDel").data("kendoButton").enable(true);
            $("#parAdd").data("kendoButton").enable(true);
            $("#parDel").data("kendoButton").enable(true);
            $("#custAdd").data("kendoButton").enable(true);
            $("#custDel").data("kendoButton").enable(true);
            $("#serAlarm").data("kendoButton").enable(false);
            //$("#resvComplete").data("kendoButton").enable(false);
        } else {
            $("#resvCreate").data("kendoButton").enable(false);
            $("#resvCancel").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(false);
            //$("#visitSer").data("kendoButton").enable(false);
            $("#parPkgAdd").data("kendoButton").enable(false);
            $("#lbrPkgAdd").data("kendoButton").enable(false);
            $("#lbrAdd").data("kendoButton").enable(false);
            $("#lbrDel").data("kendoButton").enable(false);
            $("#parAdd").data("kendoButton").enable(false);
            $("#parDel").data("kendoButton").enable(false);
            $("#custAdd").data("kendoButton").enable(false);
            $("#custDel").data("kendoButton").enable(false);
            $("#serAlarm").data("kendoButton").enable(false);
            //$("#resvComplete").data("kendoButton").enable(false);
        }
    } else {
        if(resvStat == "O") {
            $("#resvCreate").data("kendoButton").enable(true);
            $("#resvCancel").data("kendoButton").enable(true);
            $("#print").data("kendoButton").enable(true);
            //$("#visitSer").data("kendoButton").enable(true);
            $("#parPkgAdd").data("kendoButton").enable(true);
            $("#lbrPkgAdd").data("kendoButton").enable(true);
            $("#lbrAdd").data("kendoButton").enable(true);
            $("#lbrDel").data("kendoButton").enable(true);
            $("#parAdd").data("kendoButton").enable(true);
            $("#parDel").data("kendoButton").enable(true);
            $("#custAdd").data("kendoButton").enable(true);
            $("#custDel").data("kendoButton").enable(true);
            $("#serAlarm").data("kendoButton").enable(true);
            //$("#resvComplete").data("kendoButton").enable(true);
        } else if(resvStat == "F" || resvStat == "C") {
            $("#resvCreate").data("kendoButton").enable(false);
            $("#resvCancel").data("kendoButton").enable(false);
            $("#print").data("kendoButton").enable(true);
            //$("#visitSer").data("kendoButton").enable(true);
            $("#parPkgAdd").data("kendoButton").enable(false);
            $("#lbrPkgAdd").data("kendoButton").enable(false);
            $("#lbrAdd").data("kendoButton").enable(false);
            $("#lbrDel").data("kendoButton").enable(false);
            $("#parAdd").data("kendoButton").enable(false);
            $("#parDel").data("kendoButton").enable(false);
            $("#custAdd").data("kendoButton").enable(false);
            $("#custDel").data("kendoButton").enable(false);
            $("#serAlarm").data("kendoButton").enable(true);
            //$("#resvComplete").data("kendoButton").enable(false);
        }else if(resvStat == "S") {
            $("#resvCreate").data("kendoButton").enable(true);
            //$("#resvCancel").data("kendoButton").enable(false);
            $("#resvCancel").data("kendoButton").enable(true); //20200902 update by tjx 修改等待受理状态的预约单能点击取消按钮
            $("#print").data("kendoButton").enable(true);
            $("#parPkgAdd").data("kendoButton").enable(true);
            $("#lbrPkgAdd").data("kendoButton").enable(true);
            $("#lbrAdd").data("kendoButton").enable(true);
            $("#lbrDel").data("kendoButton").enable(true);
            $("#parAdd").data("kendoButton").enable(true);
            $("#parDel").data("kendoButton").enable(true);
            $("#custAdd").data("kendoButton").enable(true);
            $("#custDel").data("kendoButton").enable(true);
            $("#serAlarm").data("kendoButton").enable(false);
            //$("#resvComplete").data("kendoButton").enable(false);
        }
    }
};

//초기화
initAll = function(){
    serviceJs.commonInit();     // service 공통 JS
    crTpYn = false;     // 캠페인여부 초기화
    $("#resvStatCd").data("kendoExtDropDownList").value("");
    $("#resvTp").data("kendoExtDropDownList").enable(true);
    btnControll("");
};

</script>
<!-- //script -->

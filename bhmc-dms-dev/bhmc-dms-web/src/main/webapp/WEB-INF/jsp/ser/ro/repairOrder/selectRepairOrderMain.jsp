<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div class="content_v1">

        <form id="dmsForm" name="dmsForm" method="POST">
        <div style="display:none;">
            <input type="text" id="goodwillStatCd" name="goodwillStatCd" ><!-- GOODWILL상태 -->
            <input type="text" id="roGrpNo" name="roGrpNo" data-json-obj="true">
            <input type="text" id="roDt" name="roDt" />
            <input type="text" id="resvDocNo" name="resvDocNo" data-json-obj="true" />
            <input type="text" id="saNm" name="saNm" data-json-obj="true" />
            <input type="text" id="chgExpcDlDtHidden" name="chgExpcDlDtHidden"/>
        </div>

        <!-- 차량정보, 운전자정보 공통 페이지 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp" />
        <!-- 차량정보, 운전자정보 공통 페이지 -->

        <!-- RO번호 -->
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
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="roDocNo" name="roDocNo" class="form_input" data-json-obj="true" >
                                    <a href="javascript:roSearchPopupWindow();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!-- RO유형 -->
                            <td>
                                <input id="roTp" name="roTp" class="form_comboBox" value="01" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roStatus" /></th><!-- RO상태 -->
                            <td class="readonly_area">
                                <input type="text" id="roStatCd" name="roStatCd" readonly class="form_comboBox" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!-- 발행자 -->
                            <td class="readonly_area">
                                <input id="regUsrNm" name="regUsrNm" readonly class="form_input" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.dlrRoTp' /><!-- 자체RO유형 --></th>
                            <td>
                                <input type="text" id="dlrRoTp" name="dlrRoTp" class="form_comboBox" data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                            <td class="readonly_area">
                                <input type="text" id="diagDocNo" name="diagDocNo" class="form_input form_readonly" data-json-obj="true" readonly>
                            </td>
                            <th scope="row"><span id="incNoSpan"><spring:message code='ser.lbl.incReqNo' /></span><!-- 보험신청번호 --></th>
                            <td>
                                <input type="text" id="incReqNo" name="incReqNo" class="form_input form_readonly" data-json-obj="true" readonly>
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
            <div id="tabstrip2" class="tab_area mt5">
                <!-- 탭메뉴 -->
                <ul>
                    <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                    <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                    <li class="k-state-active"><spring:message code="ser.lbl.rpipProject" /><!-- 정비항목 --></li>
                    <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                    <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                    <li><spring:message code='ser.lbl.serviceCont' /><!-- 수리건의 --></li>
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
                <!-- 수리건의-->
                <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrSuggest.jsp" />
                <!-- //수리건의 -->
            </div>
            <!-- //일반 -->

            <div class="table_form form_width_100per mt10">
                <table>
                    <caption></caption>
                    <colgroup id="roColGroup">
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
                                <input id="atqProcTp" name="atqProcTp" class="form_comboBox" data-json-obj="true" value="02">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWash" /><!-- 세차요청 --></th>
                            <td>
                                <input id="carWashTp" name="carWashTp" class="form_comboBox" data-json-obj="true" value="01">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.custStbyMth" /><!-- 고객대기방식 --></th>
                            <td>
                                <input id="custWaitMthCd" name="custWaitMthCd" class="form_comboBox" data-json-obj="true" value="01">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.qtTest" /><!-- 품질검사 --></th>
                            <td>
                                <input id="qtTestMthCd" name="qtTestMthCd" class="form_comboBox" data-json-obj="true" value="02">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.goodWillYn" /><!-- GoodWill --></th>
                            <td>
                                <input id="goodwillYn" name="goodwillYn" class="form_comboBox" disabled data-json-obj="true" value="N">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.tdrvReq" /><!-- 시승요청 --></th>
                            <td>
                                <input id="carDriveReqTp" name="carDriveReqTp" class="form_comboBox" data-json-obj="true" value="02">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.chgExpcDlDt" /></th><!-- 변경된예정인도시간 -->
                            <td>
                                <div class="form_search">
                                   <b><input id="chgExpcDlDt" name="chgExpcDlDt" class="form_input" data-json-obj="true" readonly/></b>
                                    <a href="javascript:pausePopupSearch();"></a>
                                </div>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></span></th>
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
<!--                 <div class="btn_left"> -->
<%--                     <dms:access viewId="VIEW-D-11599" hasPermission="${dms:getPermissionMask('READ')}"> --%>
<%--                         <button type="button" id="visitSer" class="btn_m"><spring:message code="ser.btn.vsitSer" /><!-- Home to Home --></button> --%>
<%--                     </dms:access> --%>
<%--                     <button type="button" id="rpirPreChk" class="btn_m btn_link"><spring:message code="ser.btn.rpipPreChk" /><!-- 정비미리점검 --></button> --%>
<%--                     <button type="button" id="serviceCont" class="btn_m"><spring:message code="ser.btn.serviceCont" /><!-- 정비의견 --></button> --%>

<!--                 </div> -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11598" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="qirLink" class="btn_m btn_link"><spring:message code="ser.btn.qtInfoReport" /></button><!-- QIR -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11597" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnPwa" class="btn_m btn_link" disabled><spring:message code="ser.btn.pwa" /></button><!-- PWA -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11596" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="roChgAlarm" class="btn_m"><spring:message code="ser.btn.roChgAlarm" /></button><!-- RO변경알람 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11595" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="deliveryChk" class="btn_m btn_link" style="display:none"><spring:message code="ser.btn.deliveryChk" /></button><!-- 인도체크 -->
                    </dms:access>

                </div>
            </div>
        </section>
        <!-- //RO번호 -->
        </form>
    </div>
</div>
    <!-- 우측 메뉴 간반보드 공통 페이지 -->
    <c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanBoardInfo.jsp" />
    <!-- 우측 메뉴 간반보드 공통 페이지 -->

<!-- //서비스예약 -->
<form name="qirForm" method="post">
    <input type="hidden" id="sendParam" name="sendParam">
</form>

<!-- script -->
<script>

var bayManagePopup;
var roCancelPopup;
var repairOrderSearchPopup;
var pauseCausePopup;
var visitServicePopup;
var deliveryPopup;
var roSearchPopupWindow;
var isTablet="${isTablet}";
var _width=920;//web
var _height=450;//web
if(isTablet == "true"){
    _width=950;//tablet
    _height=600;//tablet
}

//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//공통코드:딜러 자체RO 유형
var dlrRoTpList = [];
<c:forEach var="obj" items="${dlrRoTpDs}">
    <c:if test="${obj.useYn eq 'Y'}">
        dlrRoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
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

//공통코드:RO상태
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객전화표시여부
var custTelYnValue;
<c:forEach var="obj" items="${custTelYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    custTelYnValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

$(document).ready(function() {
    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

    $("#parAmt, #lbrAmt, #etcAmt, #totAmt").kendoExtNumericTextBox({
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
        ,index:0
    });

    // 고부품처리방식
    $("#atqProcTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:atqProcTpCdList
        ,index:1
    });

    // 세차요청
    $("#carWashTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carWashTpCdList
        ,index:0
    });

    // 시승요청
    $("#carDriveReqTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carDriveReqTpCdList
        ,index:1
    });

    // 품질검사
    $("#qtTestMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:qtTestMthCdList
        ,index:1
    });

    // 딜러자체RO유형
    $("#dlrRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dlrRoTpList
        ,optionLabel:" "
        ,index:0
    });

    // Goodwill
    $("#goodwillYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnCdList
        ,change : function(e){
            var roTp = $("#roTp").data("kendoExtDropDownList").value();
            var goodWillYn = this.value();

            var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
            var rows = lbrGrid.tbody.find("tr");

            var delLbrYn = false;
            if(rows.length > 0 ){
                rows.each(function(idx , obj){
                var itemData = lbrGrid.dataSource._data;
                    if(goodWillYn == "Y" && itemData[idx].dstinCd != "G"){
                        delLbrYn = true;
                    }
                    if(goodWillYn == "N" && itemData[idx].dstinCd == "G"){
                        delLbrYn = true;
                    }
                    if(delLbrYn){
                        var msg = "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                        "<spring:message code='ser.lbl.del' var='del' />"+
                        "<spring:message code='global.info.cnfrmsMsg' arguments='${lbrCd} , ${del}' />";
                        $("#messageId").html(msg);
                        conformKendoWindow.content( $(".msgDiv").html());
                        conformKendoWindow.open();

                        $(".yes, .no").click(function(){
                            if($(this).hasClass("yes")){
                                conformKendoWindow.close();
                                lbrGrid.dataSource.data([]);
                            }else{
                                conformKendoWindow.close();
                                return false;
                            }

                        }).end();
                    }
                });
            }
        }
        ,index:1
    });

    // RO 상태
    $("#roStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO유형
    var preRoTp = "";
    $("#roTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,select:function(e){
            var selectVal = this.value();
            preRoTp = selectVal;
        }
        ,change:function(e){
            var partGridData = $("#partGrid").data("kendoExtGrid").dataSource._data;
            var roTp = this.value();
            var selectRoTp = preRoTp;
            var giQtyYn = false;

           
          //2021.2.18 update by tjx 非北京现代品牌车辆，不可以制作保修索赔工单  start
        	var carBrandCd = $("#carBrandCd").val();
        	if (typeof(carBrandCd) != undefined) {
	        	if(roTp == '02' && carBrandCd != 'N'){
	        		dms.notification.info("<spring:message code='ser.info.notBhmcCannotclaims'/>");
	        		$("#roTp").data("kendoExtDropDownList").value(selectRoTp);
	                return false;
	        	}
        	}
        	//2021.2.18 update by tjx 非北京现代品牌车辆，不可以制作保修索赔工单  end
        	
 if(partGridData.length > 0){
                $.each(partGridData , function(i , obj){
                    if(obj.giQty > 0 ){
                        giQtyYn = true;
                    }
                });
            setChangeRoTpValue(roTp,selectRoTp); //selectPartList.jsp 로 이동
                if(chkRsultYn){
                    if(giQtyYn){
                    dms.notification.info("<spring:message code='ser.info.notChgRoTp'  />");
                    $("#roTp").data("kendoExtDropDownList").value(selectRoTp);
                    return false;
                    }else {
                        $("#messageId").html("<spring:message code='ser.info.deletePartsAndNew' />");
                        conformKendoWindow.content( $(".msgDiv").html());
                        conformKendoWindow.open();

                        $(".yes, .no").click(function(){
                            if($(this).hasClass("yes")){

                                conformKendoWindow.close();
            paymTpDataRstl(roTp);
            roTpChangeSet(roTp);

                                $("#partGrid").data("kendoExtGrid").dataSource.data([]);
                            }else{
                                conformKendoWindow.close();
                                $("#roTp").data("kendoExtDropDownList").value(selectRoTp);
                                return false;
                            }

                        }).end();
                    }
                }else{
                    $("#roTp").data("kendoExtDropDownList").value(selectRoTp);
                }
             }else {
                 setChangeRoTpValue(roTp,selectRoTp); //selectPartList.jsp 로 이동
                 if(chkRsultYn){
                    paymTpDataRstl(roTp);
                    roTpChangeSet(roTp);
                }
             }

            // RO 유형별 결제유형 셋팅
            setPaymTpList(roTp);
            lbrDlrDcSet();
        }
        ,index:0
    });


    roTpChangeSet = function(roTp){
        if(roTp == '02'){
            $("#atqProcTp").data("kendoExtDropDownList").value("03");
            $("#btnPwa").data("kendoButton").enable(true);
            $("#goodwillYn").data("kendoExtDropDownList").enable(true);
        }else{
            var goodwillYn = $("#goodwillYn").data("kendoExtDropDownList").value();
            if(goodwillYn != "Y"){
                $("#atqProcTp").data("kendoExtDropDownList").value("02");
                $("#btnPwa").data("kendoButton").enable(false);
                $("#goodwillYn").data("kendoExtDropDownList").enable(false);
                $("#goodwillYn").data("kendoExtDropDownList").value("N");
            }
        }
        if(roTp == '03'){
            var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
            var partGrid = $("#partGrid").data("kendoExtGrid");
            var grid = {
                    lbrGrid : lbrGrid
                   ,partGrid : partGrid
            };
            /* if(getPartData().length > 0 || getLbrData().length > 0){
                insurancePopupWindow(grid,"Y");
            } */
            insurancePopupWindow(grid,"Y");
            $("#incReqNo").prop("readonly", false);
            $("#incReqNo").removeClass("form_readonly");
        } else if(roTp == '05') {
            //RO검색 팝업
            roSearchPopupWindow("RW");
        } else {
            $("#incReqNo").val("");
            $("#incReqNo").prop("readonly", true);
            $("#incReqNo").addClass("form_readonly");
        }

    };

    // 예정인도일자
    $("#expcDlDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"20:00"
    });

    // 방문서비스
    $("#visitSer").kendoButton({
        click:function(e) {
            visitServicePopup = dms.window.popup({
                windowId:"visitServicePopup"
                ,title:"<spring:message code='ser.lbl.vsitSer' />"
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectVisitServicePopup.do'/>"
                    ,data:{
                        "resvDocNo":$("#resvDocNo").val()
                    }
                }
            });

        }
        ,enable:false
    });

    // 딜리버리
    $("#delivery").kendoButton({
        click:function(e) {
            deliveryPopup = dms.window.popup({
                windowId:"deliveryPopup"
                ,title:"<spring:message code='ser.lbl.delivery' />"
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectDeliveryServicePopup.do'/>"
                    ,data:{
                        "resvDocNo":$("#resvDocNo").val()
                    }
                }
            });
        }
        ,enable:false
    });

    // 인도검사
    $("#deliveryChk").kendoButton({
        click:function(e) {
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.deliveryChk'/>", "<c:url value='/ser/deliveryCheck/selectDeliveryCheckMain.do'/>", "VIEW-D-10190"); //
        }
        //,enable:false
    });

    // pwa
    $("#btnPwa").kendoButton({
        click:function(e) {

            parent._createOrReloadTabMenu("<spring:message code='ser.menu.pwaReqMng'/>", "<c:url value='/ser/wac/pwaReq/selectPwaRequestMain.do'/>?vinNo="+$("#vinNo").val()+
                    "&infoType=RO"+
                    "&ltsModelCd="+$("#ltsModelCd").val()+
                    "&roDocNo="+$("#roDocNo").val(), "VIEW-D-10352"); // PWA신청
        }
        //,enable:false
    });

    // RO변경알람
    $("#roChgAlarm").kendoButton({
        click:function(e) {
            var chgExpcDlDt = kendo.parseDate($("#chgExpcDlDt").val());
            $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(chgExpcDlDt);

            var formParam = $("#dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));
            formParam.expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
            formParam.chgExpcDlDt = kendo.parseDate($("#chgExpcDlDt").val());

            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/roChangeAlramCall.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    $("#roChgAlarm").data("kendoButton").enable(false);
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
        ,enable:false
    });

    // 서비스정산관리
    $("#calculate").kendoButton({
        click:function(e) {

        }
        ,enable:false
    });

    // 정비미리점검
    $("#rpirPreChk").kendoButton({
        click:function(e) {
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.rpipPreChk'/>", "<c:url value='/ser/ro/repairOrder/selectPreRepairOrderMain.do?vinNo="+$("#vinNo").val()+"'/>", "VIEW-D-10191"); // 정비미리점검
        }
    });

    // QIR
    $("#qirLink").kendoButton({
        click:function(e) {
            var f = document.qirForm;
            var pop = window.open;
            window.open("", "popup", "toolbar='no'");
            f.target = "popup";
            f.action = "http://gqis.hyundai-motor.com/xui/LoginH.jsp";
            f.submit();
        }
        ,enable:false
    });

    // 확인
    $("#roUpdate").kendoButton({
        click:function(e) {
        	//开保修工单时弹框提醒操作人：（操作人点“已阅”后弹框才能关闭）“请提前与客户（本次进店送修人）确认APP绑车状态，本保修索赔工单结算完成前需邀请对方进入“APP爱车-我要保修”处操作“保修确认”。” start
		    //校验配件批量活动类型是否是K,T,V
		    //var carStatCd = getVinCarStatCd();
		    var carStatCd = "";
		            var params = {};
	        		params["sVinNo"] = $("#vinNo").val();
	        		$.ajax({
	        		    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMaster.do' />"
	                   ,data:JSON.stringify(params)
	                   ,type:'POST'
	                   ,dataType:'json'
	                   ,contentType:'application/json'
	                   ,error:function(jqXHR, status, error){
	                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
	                  }
	                ,success:function(result, textStatus){
	                   //console.log("dfd",result);
	                   var data = result.data;
	                   carStatCd = data[0].carStatCd
	                   //console.log("carStatCd的值",carStatCd);
	                   var crtpYn = false;
		               var goodwillYn = $("#goodwillYn").val();
						  $.each(getPartData(), function(index, item) {
						  if(item.crTp != "K" && item.crTp != "T" && item.crTp != "V"){
							crtpYn = true;
							}
						  });
						//校验维修项目批量活动类型是否是K,T,V
					   $.each(getLbrData(), function(index, item) {
						 if(item.crTp != "K" && item.crTp != "T" && item.crTp != "V"){
						  crtpYn = true;
						 }
					   });
						//保修索赔&符合保修索赔车种限制规则&批量活动类型不是K,T,V类型 & 非善意补偿单
						if($("#roTp").val() == "02" && warrYn && crtpYn && goodwillYn == "N" && carStatCd == "70"){
						/*$("#messageIdRead").html("<spring:message code='ser.lbl.needWarranty'/>");
						  conformKendoWindow.content( $(".msgDivRead").html());
						  conformKendoWindow.open();
						  $(".read").click(function(){
						  saveRo("01","Y");
						  conformKendoWindow.close();
						}).end();*/
						 dms.notification.warning("<spring:message code='ser.lbl.needWarranty'/>");
						   saveRo("01","Y");
						 }else{
							saveRo("01","N");
						 }
	                }
	                ,beforeSend:function(xhr){
	                  dms.loading.show($("#resizableContainer"));
	                }
	                ,complete:function(xhr,status){
	                  dms.loading.hide($("#resizableContainer"));
	                }
	             });
	             
		    
		    
		  //开保修工单时弹框提醒操作人：（操作人点“已阅”后弹框才能关闭）“请提前与客户（本次进店送修人）确认APP绑车状态，本保修索赔工单结算完成前需邀请对方进入“APP爱车-我要保修”处操作“保修确认”。” end
        }
        ,enable:false
    });
    
    // 취소
    $("#roCancel").kendoButton({
        click:function(e) {

            if(chkPartExtStatus()) {    // 출고요청이 된 부품이 있을경우 취소 불가
                roCancelPopup = dms.window.popup({
                    windowId:"roCancelWin"
                        , title:"<spring:message code='ser.lbl.roCancel'/>"   // 예약취소
                        , width:400
                        , height:200
                        , content:{
                            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderCancelPopup.do'/>"
                            ,data:{
                                "roDocNo":$("#roDocNo").val()
                                ,"diagDocNo":$("#diagDocNo").val()
                                ,"callbackFunc":function(){
                                    dms.notification.success("<spring:message code='ser.lbl.roCancel' var='ro' /><spring:message code='global.info.cancelSuccessParam' arguments='${ro}' />");
                                    initAll();
                                }
                            }
                        }
                });
            } else {
                dms.notification.info("<spring:message code='ser.info.alreadyPartExt' />");
            }

        }
        ,enable:false
    });

    $("#print").kendoButton({
        click:function(e) {
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/updateRepairOrder.do' />"
                ,data:JSON.stringify({"roDocNo":$("#roDocNo").val(), "printYn":"Y"})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){

                }
            });
            var rptNm = ("${rptNm}"=="")? "selectRepairOrderPrintMain.cpt" : "${rptNm}"
            parent._createOrReloadTabMenu("<spring:message code='ser.title.roPrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/" + rptNm + "'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCarId="+$("#carId").val()+"&sTelShowYn="+custTelYnValue);
        }
        ,enable:false
    });

    $("#print2").kendoButton({
        click:function(e) {
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/updateRepairOrder.do' />"
                ,data:JSON.stringify({"roDocNo":$("#roDocNo").val(), "printYn":"Y"})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){

                }
            });
//             parent._createOrReloadTabMenu("<spring:message code='ser.title.roPrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectRepairOrderPrintMain.cpt'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCarId="+$("#carId").val()+"&sTelShowYn="+custTelYnValue);

            //파인리포트 빠른인쇄 기능 적용 by 한강석 2017.08.02
            //파라메터 : 리포트URL, 인쇄팝업화면출력여부, 용지에맞게축소여부
            var rptNm = ("${rptNm}"=="")? "selectRepairOrderPrintMain.cpt" : "${rptNm}"
            dms.fineReport.print("<c:url value='/ReportServer?reportlet=ser/" + rptNm + "'/>&sDlrCd=${dlrCd}&sRoDocNo="+$("#roDocNo").val()+"&sCarId="+$("#carId").val()+"&sTelShowYn="+custTelYnValue, false, true);
        }
        ,enable:false
    });

    saveRo = function(roStat,warYn){
        var dlrCd = '${dlrCd}';
        //判断是否为保修app工单  ;
         var custConfirmYn;  
         if("Y" == warYn){
        	 custConfirmYn = "Y";
         }
       
        var validator = $("#dmsForm").kendoExtValidator().data("kendoExtValidator");

        if (validator.validate()) {

            var expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
            if(dms.string.isEmpty(expcDlDt) || expcDlDt == null ){
                var dstbHm = 0;
                $.each(getLbrData() , function(i , gridData){
                    dstbHm += gridData.dstbHm;
                });

                var ecpcCurDt = new Date();
                var addMinutes = ecpcCurDt.getMinutes() + (dstbHm * 60) ;
                    ecpcCurDt.setMinutes(addMinutes);
                    $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(ecpcCurDt);
            }


            var formParam = $("#dmsForm").serializeObject($("#dmsForm").serializeArrayInSelector("[data-json-obj='true']"));

            formParam.roStatCd = roStat;
            formParam.allocStatCd = "01";
            formParam.expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
            formParam.chgExpcDlDt = kendo.parseDate($("#chgExpcDlDt").val());
            formParam.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
            formParam.diagDocNo = $("#diagDocNo").val();
            formParam.parAmt = $("#parAmt").data("kendoExtNumericTextBox").value();
            formParam.lbrAmt = $("#lbrAmt").data("kendoExtNumericTextBox").value();
            formParam.etcAmt = $("#etcAmt").data("kendoExtNumericTextBox").value();
            formParam.totAmt = $("#totAmt").data("kendoExtNumericTextBox").value();
            formParam.roTp   =  $("#roTp").val();
            formParam.goodwillYn = $("#goodwillYn").data("kendoExtDropDownList").value();
            formParam.pdiYn = $("#pdiYn").val();
            formParam.dlrCd = dlrCd

            
            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
            var carRunDistVal = $("#carRunDistVal").data("kendoExtNumericTextBox").value();

            if(runDistVal < 0) {
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#runDistVal").focus();
                return false;
            }

            if(runDistVal < carRunDistVal) {
                dms.notification.info("<spring:message code='ser.lbl.nowRunDist' var='returnMsg1' /><spring:message code='ser.lbl.accuDrivDis' var='returnMsg2' /><spring:message code='ser.info.distValNotHigher' arguments='${returnMsg1},${returnMsg2}' />");
                $("#runDistVal").focus();
                return false;
            }

            if(dms.string.strNvl(formParam.carRegNo) == "" && formParam.pdiYn == "N") {
                dms.notification.info("<spring:message code='ser.lbl.carNo' var='carNo' /><spring:message code='global.info.required.field' arguments='${carNo},' />");
                return false;
            }

            if(dms.string.strNvl(formParam.expcDlDt) == ""){
                dms.notification.info("<spring:message code='ser.lbl.expcDlvDt' var='expcDlvDt' /><spring:message code='global.info.required.field' arguments='${expcDlvDt},' />");
                return false;
            }

            if(dms.string.strNvl(formParam.dlrRoTp) == ""){
                dms.notification.info("<spring:message code='ser.lbl.dlrRoTp' var='dlrRoTp' /><spring:message code='global.info.required.field' arguments='${dlrRoTp},' />");
                return false;
            }
            
            // form 데이터 및 그리드 변경 데이터 세팅
            var param = $.extend(
               {"repairOrderVO":formParam}
               ,{"servicePartListVO":getPartData()}
               ,{"serviceLaborListVO":getLbrData()}
               ,{"trobleDescVO":trobleDescParam()}
               ,{"custDemandListVO":custDemandParam()}
               ,{"etcIssueListVO":getEtcIssueData()}
               ,{"lbrSuggestListVO":getLbrSuggestData()}
              	//判断是否为保修app工单  ;
               ,{"custConfirmYn":custConfirmYn}
            );

            if(getLbrData().length == 0 && getPartData().length == 0){
                dms.notification.warning( "<spring:message code='ser.lbl.lbrOrPartInfo' var='lbrOrPartInfo' />"+
                                           "<spring:message code='global.info.validation.required' arguments='${lbrOrPartInfo}' />");
                return;
            }
            //2020/01/03 tianjx  配件项目&维修项目  付款者类型和付款者必填 ------start
            var pay = true;
            
            if(pay){
            	$.each(getPartData(), function(index, item){
            		if(dms.string.isEmpty(this.paymTp)){
	                    dms.notification.info("<spring:message code='ser.lbl.part' var='part' />"+
	                    					  "<spring:message code='ser.lbl.payWay' var='payWay' />"+
	                                          "<spring:message code='global.info.required.field' arguments='${part}${payWay},' />");
	                    pay = false;
	                    return false;
	                }
	            	if(dms.string.isEmpty(this.paymUsrNm)){
	                    dms.notification.info("<spring:message code='ser.lbl.part' var='part' />"+
	                    					  "<spring:message code='ser.lbl.payer' var='payer' />"+
	                                          "<spring:message code='global.info.required.field' arguments='${part}${payer},' />");
	                    pay = false;
	                    return false;
	                }
            	});
            }
            
            if(pay){
	            $.each(getLbrData(), function(index, item){
	            	if(dms.string.isEmpty(this.paymTp)){
	                    dms.notification.info("<spring:message code='ser.lbl.lbr' var='lbr' />"+
	                    					  "<spring:message code='ser.lbl.payWay' var='payWay' />"+
	                                          "<spring:message code='global.info.required.field' arguments='${lbr}${payWay},' />");
	                    pay = false;
	                    return false;
	                }
	            	if(dms.string.isEmpty(this.paymUsrNm)){
	                    dms.notification.info("<spring:message code='ser.lbl.lbr' var='lbr' />"+
	                    					  "<spring:message code='ser.lbl.payer' var='payer' />"+
	                                          "<spring:message code='global.info.required.field' arguments='${lbr}${payer},' />");
	                    pay = false;
	                    return false;
	                }
	            });
            }
            
            if(!pay) {
            	return false;
            }
            //付款者类型和付款者必填 ------end
            
          //校验客户主诉是否必填并且限制5~20个文字，不可以出现全部数字或字母  start
            //保修索赔工单客户主诉是必填项
            if(dms.string.strNvl(formParam.roTp) == "02"){
            	
            	var data = param.custDemandListVO;
            	
            	if(null == data[0].custReqCont || dms.string.strNvl(data[0].custReqCont) == ""){
	                dms.notification.info("<spring:message code='ser.lbl.custRemarkCheck' />");
	                return false;
            	}else{
            		//且限制5~20个文字，不可以出现全部数字或字母
            		var regu = "^(?![0-9]+$)(?![a-zA-Z]+$)(?![0-9A-Za-z]+$)[0-9A-Za-z\u4e00-\u9fa5,.，。]{5,20}$"
					var re = new RegExp(regu);
            		var flag = 0;
            		$.each(data, function(idx, obj){
						if (!re.test(obj.custReqCont.replace(/\s+/g, ""))) { 
							flag = 1;
						}
            		});
            		if(flag == 1){
            			dms.notification.info("<spring:message code='ser.lbl.custRemarkCheck'/>");
            			return false;
            		}
            	}  
            		 
            }
            //校验客户主诉是否必填并且限制5~20个文字，不可以出现全部数字或字母  end
            
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/multiRepairOrder.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.loading.hide($("#resizableContainer"));
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    $("#roUpdate").data("kendoButton").enable(false);
                    $("#roCancel").data("kendoButton").enable(false);

                    var data = {"roDocNo":result};
                    detailSet(data, false, "RO");
                    tabInfoSet(result, "${preFixId}", $("#ltsModelCd").val());
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

        serviceJs.commonInit("${preFixId}");     // service 공통 JS
        crTpYn = false;     // 캠페인여부 초기화
        $("#roTp").data("kendoExtDropDownList").enable(true);
        $("#btnPwa").data("kendoButton").enable(false);
        $("#roStatCd").data("kendoExtDropDownList").value("");
        $("#goodwillStatCd").val("");
        btnControll("");
    };

    $("#roDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#roDocNo").val()) != ""){
            e.preventDefault();
            var data = {"roDocNo":$("#roDocNo").val()}
            detailSet(data, false, "RO");
        }
    });

    detailSet = function(data, slide, infoType){

        if(infoType == "PC"){
            getCustInfo(data);

            $("#vinNo").val(data.vinNo);
            $("#roGrpNo").val(data.roGrpNo);
            $("#diagDocNo").val(data.diagDocNo);
            /*liuxueying 带出接车检查维修项目和配件start*/
            $("#resvDocNo").val(data.resvDocNo);
            /*liuxueying 带出接车检查维修项目和配件end*/
            $("#runDistVal").data("kendoExtNumericTextBox").value(data.runDistVal);
            $("#roRemark").val(data.remark);
            var pdiYn = "N";
            if(data.carAcptTp == "03"){
                pdiYn = "Y";
            }
            $("#pdiYn").val(pdiYn);

            tabInfoSet(data.diagDocNo,"PC");

            if(slide){
                slidePlay2();
            }
        } else if(infoType == "ET") {
            getCustInfo(data, "N");    // 공통 페이지 selectCustCarInfoMain.jsp에 함수 존재

            $("#roTp").data("kendoExtDropDownList").value(data.roTp);
            tabInfoSet(data.estDocNo,"ET" );

            changeTotalAmt();                               // 금액 계산(selectLbrList.jsp)
        } else {
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderByKey.do' />"
                ,data:JSON.stringify({sRoDocNo:data.roDocNo, sResvDocNo:data.resvDocNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){

                    if(dms.string.strNvl(result.roDocNo) == ""){
                        if(infoType == "RE"){
                            // 예약현황보드 슬라이드 닫기
                            if(slide){
                                slidePlay();
                            }

                            getCustInfo(data);                              // 고객정보(selectCustCarInfoMain.jsp)
                            $("#resvDocNo").val(data.resvDocNo);
                            $("#runDistVal").data("kendoExtNumericTextBox").value(data.runDistVal);
                            tabInfoSet(data.resvDocNo, infoType);
                            changeTotalAmt();                               // 금액 계산(selectLbrList.jsp)
                        } else {
                            dms.notification.info("<spring:message code='ser.lbl.ro' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                        }
                    } else {

                        // 예약현황보드 슬라이드 닫기
                        if(slide){
                            slidePlay();
                        }

                        $("#parAmt").val(0);
                        $("#lbrAmt").val(0);
                        $("#totAmt").val(0);

                        if(infoType == "RO"){
                            $("#roDocNo").val(result.roDocNo);
                            $("#roTp").data("kendoExtDropDownList").value(result.roTp);
                            $("#custWaitMthCd").data("kendoExtDropDownList").value(result.custWaitMthCd);
                            $("#atqProcTp").data("kendoExtDropDownList").value(result.atqProcTp);
                            $("#carWashTp").data("kendoExtDropDownList").value(result.carWashTp);
                            $("#carDriveReqTp").data("kendoExtDropDownList").value(result.carDriveReqTp);
                            $("#qtTestMthCd").data("kendoExtDropDownList").value(result.qtTestMthCd);
                            $("#goodwillYn").data("kendoExtDropDownList").value(result.goodwillYn);
                            $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(result.expcDlDt);
                            $("#chgExpcDlDtHidden").val(kendo.toString(kendo.parseDate(result.chgExpcDlDt) , "<dms:configValue code='dateFormat' /> HH:mm") );
                            $("#roRemark").val(result.roRemark);
                            $("#regUsrNm").val(result.regUsrNm);
                            $("#roDt").val(kendo.toString(kendo.parseDate(result.roDt), "yyyyMMdd"));
                            $("#roStatCd").data("kendoExtDropDownList").value(result.roStatCd);
                            $("#pdiYn").val(result.pdiYn);
                            $("#goodwillStatCd").val(result.goodwillStatCd);
                            $("#dlrRoTp").data("kendoExtDropDownList").value(result.dlrRoTp);
                            $("#saNm").val(result.saNm);
                            $("#incReqNo").val(result.incReqNo);

                            if(result.qtTestStatCd != null && result.qtTestStatCd != "Q5"){
                                $("#qtTestMthCd").data("kendoExtDropDownList").enable(false);
                            }else{
                                $("#qtTestMthCd").data("kendoExtDropDownList").enable(true);
                            }

                            if(dms.string.isNotEmpty(result.chgExpcDlDt)){
                                if(result.expcDlDt != result.chgExpcDlDt) {
                                    $("#roChgAlarm").data("kendoButton").enable(true);
                                } else {
                                    $("#roChgAlarm").data("kendoButton").enable(false);
                                }
                            }
                            if(result.roTp == '02'){

                                $("#btnPwa").data("kendoButton").enable(true);
                                $("#goodwillYn").data("kendoExtDropDownList").enable( (result.goodwillStatCd == "F") ? false : true );
                                if(result.pdiYn == "Y"){
                                    $("#roTp").data("kendoExtDropDownList").enable(false);
                                }
                            }else{
                                $("#btnPwa").data("kendoButton").enable(false);
                                $("#goodwillYn").data("kendoExtDropDownList").enable(false);
                            }


                        } else {
                            $("#roDocNo").val("");
                            $("#roStatCd").data("kendoExtDropDownList").value("");
                            $("#custWaitMthCd").data("kendoExtDropDownList").value("");
                            $("#atqProcTp").data("kendoExtDropDownList").value("");
                            $("#carWashTp").data("kendoExtDropDownList").value("");
                            $("#carDriveReqTp").data("kendoExtDropDownList").value("");
                        }

                        $("#roGrpNo").val(result.roGrpNo);
                        $("#resvDocNo").val(result.resvDocNo);
                        $("#tecId").val(result.tecId);
                        $("#tecNm").val(result.tecNm);
                        $("#diagDocNo").val(result.diagDocNo);
                        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
                        getCustInfo(result,"N");                        // 고객정보(selectCustCarInfoMain.jsp)
                        tabInfoSet(result.roDocNo, infoType , result.ltsModelCd);
                        changeTotalAmt();                               // 금액 계산(selectLbrList.jsp)
                    }
                }
            });
        }

    };

    //RO검색 팝업
    roSearchPopupWindow = function(listType){

        if(listType == "RW" && dms.string.strNvl($("#vinNo").val()) == ""){
            dms.notification.info("<spring:message code='ser.title.carInfo' var='carInfo' /><spring:message code='ser.info.noInfoData' arguments='${carInfo}' />");
            return false;
        }

        repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:_width
            , height:_height
            , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "close" :"Y"
                    , "listType" : listType
                    , "vinNo" : $("#vinNo").val()
                    , "callbackFunc":function(data){
                        if(listType == "RW"){ //리워크

                            $("#baseRoNo").val(data[0].roDocNo);
                            tabInfoSet(data[0].roDocNo , "RO" , $("#ltsModelCd").val());
                        } else {
                            detailSet(data[0], false, "RO");
                        }
                    }
                }
            }
        });
    };


    /* 작업중지 이력 팝업 */
    pausePopupSearch = function(){
        if(dms.string.strNvl($("#roDocNo").val()) != ""){
            pauseCausePopup = dms.window.popup({
                windowId:"pauseCausePopup"
                ,title:"<spring:message code='ser.btn.lbrStop' />"   // 작업중지
                ,content:{
                    url:"<c:url value='/ser/ro/workProcess/selectPauseCausePopup.do'/>"
                    ,data:{
                        "roDocNo":$("#roDocNo").val()
                        ,"roTp":$("#roTp").data("kendoExtDropDownList").value()
                        ,"expcDlDt":$("#expcDlDt").data("kendoExtMaskedDateTimePicker").value()
                        ,"chgExpcDlDt":kendo.parseDate($("#chgExpcDlDt").val())
                        ,"sWrkStopYn":"Y"
                        ,"callbackFunc":function(data){

                        }
                    }
                }
                ,height:430
                ,width:900
            });
        }
    }

    //TAB 정보
    tabInfoSet = function(docNo , preFixId , ltsModelCd){
        if(preFixId == "PC"){
            trobleDescInfo(docNo, preFixId);      //고객요구사항및 고장설명(selectTabInfo.jsp)
            lbrSuggestSet(docNo, preFixId);   //수리건의(selectLbrSuggest.jsp)
            /*liuxueying 接车检查带出配件和维修项目 start*/
            lbrInfo(docNo, preFixId);
            partInfo(docNo, preFixId);
            /*liuxueying 接车检查带出配件和维修项目 end*/
        }else{
            partInfo(docNo, preFixId);            //부품(selectPartList.jsp)

            if(preFixId == "ET" || preFixId == "RE" ){
                lbrInfo(docNo, preFixId);         //공임(selectLbrList.jsp)
            }else{
                lbrInfo(docNo, preFixId, ltsModelCd);
                lbrSuggestSet(docNo, preFixId);   //수리건의(selectLbrSuggest.jsp)
            }
            trobleDescInfo(docNo, preFixId);      //고객요구사항및 고장설명(selectTabInfo.jsp)
            etcIssueSet(docNo, preFixId);         //기타사항(selectEtcIssue.jsp)
        }
    };

    btnControll = function(status){

        var roStat = $("#roStatCd").val();

        var btnGoodwillStatEnabled = true;
        var btnGoodwillYn = true;
        var goodwillStatCd = $("#goodwillStatCd").val();
        var goodwillYn = $("#goodwillYn").val();
        if(goodwillStatCd == "F"){
            btnGoodwillStatEnabled = false;
        }
        if(goodwillYn == "Y"){
            btnGoodwillYn = false;
        }

        if(dms.string.strNvl(roStat) == ""){
            if(status == "U"){

                $("#roUpdate").data("kendoButton").enable(true);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);
                $("#print2").data("kendoButton").enable(false);

                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                $("#moveRepair").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
                $("#qirLink").data("kendoButton").enable(false);

            } else {

                $("#roUpdate").data("kendoButton").enable(false);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(false);
                $("#print2").data("kendoButton").enable(false);

                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                $("#moveRepair").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(false);

            }
        } else {

            if(roStat == "01") {

                $("#roTp").data("kendoExtDropDownList").enable(btnGoodwillStatEnabled);
                $("#roUpdate").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#roCancel").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#print").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#print2").data("kendoButton").enable(btnGoodwillStatEnabled);

                $("#parPkgAdd").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#lbrPkgAdd").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#lbrAdd").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#lbrDel").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#parAdd").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#parDel").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#custAdd").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#custDel").data("kendoButton").enable(btnGoodwillStatEnabled);

                $("#lbrSuggestAdd").data("kendoButton").enable(btnGoodwillStatEnabled);
                $("#lbrSuggestDel").data("kendoButton").enable(btnGoodwillStatEnabled);

                $("#qirLink").data("kendoButton").enable(btnGoodwillYn);
                $("#deliveryChk").data("kendoButton").enable(btnGoodwillYn);


            } else if(roStat == "02"){
                $("#roUpdate").data("kendoButton").enable(true);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable(true);
                $("#print2").data("kendoButton").enable(true);

                $("#parPkgAdd").data("kendoButton").enable(true);
                $("#lbrPkgAdd").data("kendoButton").enable(true);
                $("#lbrAdd").data("kendoButton").enable(true);
                $("#lbrDel").data("kendoButton").enable(true);
                $("#parAdd").data("kendoButton").enable(true);
                $("#parDel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);

                $("#lbrSuggestAdd").data("kendoButton").enable(true);
                $("#lbrSuggestDel").data("kendoButton").enable(true);

                $("#qirLink").data("kendoButton").enable(true);
            }  else if(roStat == "03") {
                //Goodwill일 경우 RO취소 가능
                if(goodwillYn == "Y"){
                    $("#roCancel").data("kendoButton").enable(true);
                }else{
                    $("#roCancel").data("kendoButton").enable(false);
                }
                $("#roUpdate").data("kendoButton").enable(true);
                $("#print").data("kendoButton").enable(true);
                $("#print2").data("kendoButton").enable(true);

                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(true);
            }  else if(roStat == "04" || roStat == "05" || roStat == "06" || roStat == "00") {
                $("#roUpdate").data("kendoButton").enable(false);
                $("#roCancel").data("kendoButton").enable(false);
                $("#print").data("kendoButton").enable((roStat == "06") ? false  : true);
                $("#print2").data("kendoButton").enable((roStat == "06") ? false  : true);

                $("#parPkgAdd").data("kendoButton").enable(false);
                $("#lbrPkgAdd").data("kendoButton").enable(false);
                $("#lbrAdd").data("kendoButton").enable(false);
                $("#lbrDel").data("kendoButton").enable(false);
                $("#parAdd").data("kendoButton").enable(false);
                $("#parDel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(true);
                $("#lbrSuggestAdd").data("kendoButton").enable(false);
                $("#lbrSuggestDel").data("kendoButton").enable(true);
                $("#qirLink").data("kendoButton").enable(true);
            }
        }
    };

    <c:choose>
        <c:when test="${infoType eq 'RO'}">
            var data = {"roDocNo":"${roDocNo}", "parReqStatCd":"${parReqStatCd}"};
            detailSet(data, false, "RO");
        </c:when>
        <c:when test="${infoType eq 'PC'}">
            var data = {"vinNo":"${vinNo}", "carId":"${carId}", "diagDocNo":"${diagDocNo}", "resvDocNo":"${resvDocNo}", "roGrpNo":"${roGrpNo}", "runDistVal":"${runDistVal}", "carAcptTp":"${carAcptTp}", "remark":"${remark}"};

            // 특수문자 decode
            data.remark = replaceAll(data.remark, "&amp;#33;", "!");
            data.remark = replaceAll(data.remark, "&amp;#64;", "@");
            data.remark = replaceAll(data.remark, "&amp;#37;23", "#");  // #은 앞에서 변환한 값 (%23) 그대로 넘어와서 이렇게 처리
            data.remark = replaceAll(data.remark, "&amp;#36;", "$");
            data.remark = replaceAll(data.remark, "&amp;#37;", "%");
            data.remark = replaceAll(data.remark, "&amp;#40;", "(");
            data.remark = replaceAll(data.remark, "&amp;#41;", ")");
            data.remark = replaceAll(data.remark, "&amp;amp;", "&");
            data.remark = replaceAll(data.remark, "&amp;#42;", "*");
            data.remark = replaceAll(data.remark, "&amp;#63;", "?");
            data.remark = replaceAll(data.remark, "&amp;#124;", "|");

            detailSet(data, true, 'PC');
        </c:when>
        <c:when test="${infoType eq 'ET'}">
            var data = {"vinNo":"${vinNo}", "carId":"${carId}", "estDocNo":"${estDocNo}", "runDistVal":"${runDistVal}", "roTp":"${roTp}"};
            detailSet(data, true, 'ET');
        </c:when>
        <c:when test="${infoType eq 'RE'}">

        </c:when>
    </c:choose>

    if(isTablet == "true" || isTablet == true){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#roColGroup  col");
            $(colEmt[0]).css("width","8%");
            $(colEmt[2]).css("width","10%");
        }
    }


});

function replaceAll(s, findstr, newstr) {
    return s.split(findstr).join(newstr);
}

</script>
<!-- //script -->


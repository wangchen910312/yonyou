<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<!-- 수납 -->
<div id="resizableContainer" class="content">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11622" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11620" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11621" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
                <input type="hidden" id="rcvSubDocNo3">
            </div>
        </div>
        <form id="rcvForm" name="rcvForm" method="POST">
            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup id="reciveColGroup">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carNo" /></th><!--차량번호  -->
                            <td>
                                <input type="text" id="sCarRegNo" name="sCarRegNo" value="" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!--RO번호  -->
                            <td>
                                <input type="text" id="sRoDocNo" name="sRoDocNo" value="" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.payer" /></th><!--지불자  -->
                            <td>
                                <input type="text" id="sPaymUsrNm" name="sPaymUsrNm" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.calcEndDt' /><!--  정산완료일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCalcFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCalcToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!--vin  -->
                            <td>
                                <input type="text" id="sVinNo" name="sVinNo" value="" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!--RO유형  -->
                            <td>
                                <input type="text" id="sRoTp" name="sRoTp" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.payWay" /></th><!--지불유형  -->
                            <td>
                                <input type="text" id="sPaymTp" name="sPaymTp" value="" class="form_comboBox" >
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.paidYn" /></th><!--청산완료여부 -->
                            <td>
                                <input type="text" id="sPaymYn" name="sPaymYn" value="" class="form_comboBox" />
                            </td>
                            <%-- <th scope="row"><spring:message code="ser.lbl.rcvDocNo" /></th><!--정산번호  -->
                            <td>
                                <input type="text" id="sRcvDocNo" name="sRcvDocNo" value="" class="form_input" />
                            </td> --%>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.driver" /></th><!--수리의뢰자  -->
                            <td>
                                <input type="text" id="sDriverNm" name="sDriverNm" value="" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.payStat" /></th><!--지불상태  -->
                            <td>
                                <input type="text" id="sRcvStatCd" name="sRcvStatCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.payTerm" /></th><!--지불기한  -->
                            <td>
                                <input type="text" id="sPaymPrid" name="sPaymPrid" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.calcCompNm" /></th><!--정산완료자  -->
                            <td>
                                <input type="text" id="sCalcPrsnNm" name="sCalcPrsnNm" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="SER" class="k-state-active"><span><spring:message code="ser.lbl.servCalc" /></span><!-- 정비정산 --></li>
                    <li id="PAR" ><span><spring:message code="ser.lbl.partCalc" /></span></li> <!-- 부품정산 -->
                </ul>
                <div>
                     <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="receiveGrid" ></div>
                    </div>
                </div>
                <div>
                     <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="itemGrid" ></div>
                    </div>
                </div>
            </div>

            <section class="group mt5">
                <div class="table_grid mt10">
                    <div id="detailGrid" class="grid"></div>
                </div>
                <div class="header_area">
                    <div class="btn_left" style="display:none">
                        <dms:access viewId="VIEW-D-11619" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnRefund" class="btn_m" disabled><spring:message code="ser.btn.refund" /></button><!--환불  -->
                        </dms:access>
                        &nbsp;
                        <span ><spring:message code="ser.lbl.outReceiveNo" />
                            <input type="text" id="rcvSubDocNo2" name="rcvSubDocNo2" class="form_input" style="width:130px;" data-json-obj="true" readonly>
                        </span>
                    </div>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11618" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_m" id="receiveStart" disabled><spring:message code="ser.btn.receiveStart" /></button>                <!--수납시작  -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11617" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_m" id="receiveCancel" disabled><spring:message code="ser.btn.receiveCancel" /></button>              <!--수납취소  -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11616" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_m" id="refundConfirm" style="display:none;"><spring:message code="ser.btn.refundConfirm" /></button> <!--환불확인  -->
                        </dms:access>
                    </div>
                </div>
                <div style="display:none;">
                    <input type="text" id="rcvSubDocNo" name="rcvSubDocNo" />
                    <input type="text" id="roDocNo" name="roDocNo" />
                    <input type="text" id="roTp" name="roTp" />
                    <input type="text" id="paymTp" name="paymTp" />
                    <input type="text" id="rcvDocNo" name="rcvDocNo" />
                    <input type="text" id="rcvStatCd" name="rcvStatCd" />
                    <input type="text" id="paymPrid" name="paymPrid" />
                </div>
            </section>
        </form>
    </section>
    <!-- //수납 -->
</div>
<!-- 우측 메뉴 -->
<%-- <c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanCustInfo.jsp" /> --%>
<!-- //우측 메뉴 -->

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- script -->
<script>

var selectTabId = "SER";
var selectReceiveRegPopup;

//공통코드:수납상태

var receiveCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var receiveCdList2 = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${receiveCdList}">
    <c:if test="${obj.remark1 ne 'N' }">
    receiveCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    receiveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수납상태 map
var receiveCdMap = dms.data.arrayToMap(receiveCdList, function(obj){return obj.cmmCd;});

//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });

//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd;});

//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd;});

//공통코드:청산완료여부
var paymYnList = [];
<c:forEach var="obj" items="${paymYnList}">
paymYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymYnListMap = dms.data.arrayToMap(paymYnList, function(obj){return obj.cmmCd;});


//수납 구분
receiveCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(receiveCdMap[val] != undefined)
        returnVal = receiveCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//결제유형
paymTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymTpCdArr[val] != undefined)
        returnVal = paymTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymMthCdMap[val] != undefined)
        returnVal = paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 결제기간
paymPridCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymPridCdArr[val] != undefined)
        returnVal = paymPridCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rcptTpCdMap[val] != undefined)
        returnVal = rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 청산완료여부
paymYnGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymYnListMap[val] != undefined)
        returnVal = paymYnListMap[val].cmmCdNm;
    }
    return returnVal;
};

var sysDate = "${sysDate}";
var loginUsrNm = "${loginUsrNm}";
var saveYn = false;

var processResultYn = true;

//그리드 선택 Row
var gridRow = 0;
var rowRcvSubDocNo;

$(document).ready(function(){

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            selectTabId = e.item.id;
        }
    });

    // 정산일자(From)
    $("#sCalcFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sCalcFromDt}"
    });

    // 정산일자(To)
    $("#sCalcToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sCalcToDt}"
    });
    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
     });

    $("#sRcvStatCd").kendoExtDropDownList({
        dataSource:receiveCdList2
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:1
    });

    //지불유형
    $("#sPaymTp").kendoExtDropDownList({
        dataSource:paymTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //지불기한
    $("#sPaymPrid").kendoExtDropDownList({
        dataSource:paymPridCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //청산완료여부
    $("#sPaymYn").kendoExtDropDownList({
        dataSource:paymYnList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });


  //초기화
    $("#btnReset").kendoButton({
        click:function(e){
            initAll();
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            gridRow = 0;
            rowRcvSubDocNo;

            if(selectTabId == "SER"){
                $('#receiveGrid').data('kendoExtGrid').dataSource.page(1);
            }else{
                $('#itemGrid').data('kendoExtGrid').dataSource.page(1);
            }

            $("#detailGrid").data('kendoExtGrid').dataSource.data([]);
            $("#rcvSubDocNo2").val("");

            setButtonEnable("","N");

        }
    });

    // 환불 - 사용안함
    $("#btnRefund").kendoButton({
        click:function(e) {

            var grid = $('#detailGrid').data('kendoExtGrid');
            var selectedVal = grid.dataItem(grid.select());

            var totAmt = 0;
            $.each(grid.dataSource._data, function(i , obj){
                totAmt += obj.rcvAmt;

            });
            if(selectedVal==null||selectedVal==""){
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                 return;
            }

            var btnRefundYn = ( selectedVal.paymYn == "N"  ) ? true : false;


            if( selectedVal.rcvStatCd != "R" && btnRefundYn  ){
                selectReceivePopupWindow(grid,"R");
            }

        }
    });

    //수납시작
    $("#receiveStart").kendoButton({
        click:function(e){

            var grid;
            if(selectTabId == "SER"){
                grid = $('#receiveGrid').data('kendoExtGrid');
            }else{
                grid = $('#itemGrid').data('kendoExtGrid');
            }

            var selectedVal = grid.dataItem(grid.select());
            if(selectedVal==null||selectedVal==""){
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                 return;
            }
            selectReceivePopupWindow(grid,"F");

        }
        ,enable:true
    });

    //수납취소 old
    $("#receiveCancel_back").kendoButton({
        click:function(e){

            var grid;
            if(selectTabId == "SER"){
                grid = $('#receiveGrid').data('kendoExtGrid');
            }else{
                grid = $('#itemGrid').data('kendoExtGrid');
            }

            var selectedVal = grid.dataItem(grid.select());
            if(selectedVal==null||selectedVal==""){
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                 return;
            }

            $("#messageId").html("<spring:message code='global.info.cancel'  />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                    updateReceive('C');
                    if(processResultYn) {
                        setButtonEnable('C','N'); //수납취소
                    }
                    processResultYn = true;
                }else{
                    conformKendoWindow.close();
                }
            }).end();

        }
        ,enable:true
    });

    //수납취소 - 환불
    $("#receiveCancel").kendoButton({
        click:function(e){

            var grid = $('#detailGrid').data('kendoExtGrid');
            var selectedVal = grid.dataItem(grid.select());

            var rows = grid.tbody.find("tr");
            var chkYn = false;
            var chkCnt = $(".grid-checkbox-item.k-state-selected").length;

            if(chkCnt == 0 ){
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                 return;
            }

            $("#messageId").html("<spring:message code='global.info.cancel'  />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                    updateReceive('R');
                    if(processResultYn) {
                        setButtonEnable('R','N'); //수납취소
                    }
                    processResultYn = true;
                }else{
                    conformKendoWindow.close();
                }
            }).end();

        }
        ,enable:true
    });

    initAll = function(){
        saveYn = false;

        $("#rcvForm").get(0).reset();
        $("#receiveGrid").data("kendoExtGrid").dataSource.data([]);
        $("#itemGrid").data("kendoExtGrid").dataSource.data([]);
        $("#detailGrid").data("kendoExtGrid").dataSource.data([]);

        $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value("${sCalcFromDt}");
        $("#sCalcToDt").data("kendoExtMaskedDatePicker").value("${sCalcToDt}");

    };

    //버튼설정
    setButtonEnable = function (statCd , paymYn ){

        //버튼 세팅
        switch(statCd){
            case "O"://미결

                $("#receiveStart").data("kendoButton").enable(true); //수납시작
                $("#receiveCancel").data("kendoButton").enable(false);//수납취소
                $("#btnRefund").data("kendoButton").enable(false);//환불

                      break;
             case "O1"://미결수납시작
                 $("#receiveStart").data("kendoButton").enable(false); //수납시작
                 $("#receiveCancel").data("kendoButton").enable(false);//수납취소
                 $("#btnRefund").data("kendoButton").enable(false);//환불

                      break;

            case "02"://미수
                $("#receiveStart").data("kendoButton").enable(true); //수납시작
                $("#receiveCancel").data("kendoButton").enable(false);//수납취소
                $("#btnRefund").data("kendoButton").enable(true);//환불

                      break;
            case "F"://수납완료

                $("#receiveStart").data("kendoButton").enable((paymYn == "Y") ? false : true); //수납시작
                $("#receiveCancel").data("kendoButton").enable((paymYn == "Y") ? true : false);//수납취소
                $("#btnRefund").data("kendoButton").enable((paymYn == "Y") ? true : false);//환불

                      break;
             case "C"://수납취소
                 $("#receiveStart").data("kendoButton").enable(true); //수납시작
                 $("#receiveCancel").data("kendoButton").enable(false);//수납취소
                 $("#btnRefund").data("kendoButton").enable(false);//환불
                 $(".checkAll").prop("checked", false);

                      break;
            case "R"://환불
                $("#receiveStart").data("kendoButton").enable(true); //수납시작
                $("#receiveCancel").data("kendoButton").enable(false);//수납취소
                $("#btnRefund").data("kendoButton").enable(false);//환불
                      break;
            default :
                $("#receiveStart").data("kendoButton").enable(false); //수납시작
                $("#receiveCancel").data("kendoButton").enable(false);//수납취소
                $("#btnRefund").data("kendoButton").enable(false);//환불

               break;
        };
    };

    //버튼 - 수납확정
    function updateReceive(stat) {
        var jsonData;
        var cardPointUseParam = {};
        var dlrPointAccuParam = {};
        var custPointUseParam = {};
        var url;

        saveYn = true;


        var grid;
        if(selectTabId == "SER"){
            grid = $("#receiveGrid").data("kendoExtGrid");
        }else{
            grid = $("#itemGrid").data("kendoExtGrid");
        }

        var rows = grid.select();
        var selectedVal = grid.dataItem(rows);

        if(stat == "R"){//환뷸
            if($("#refdAmt").val()=="0"||$("#refdAmt").val()==""){
                dms.notification.info("<spring:message code='ser.lbl.refdAmt' var='gisuAmt' /><spring:message code='global.info.required.field' arguments='${gisuAmt}' />");

                processResultYn = false;
             }
        } else {
            if(stat == "F" ){
                if( ($("#roTp").val() != "02") &&  ( $("#rcvAmt").val()=="0"||$("#rcvAmt").val()=="" ) ){
                    dms.notification.info("<spring:message code='ser.lbl.gisuAmt' var='gisuAmt' /><spring:message code='global.info.required.field' arguments='${gisuAmt}' />");
                }
                if( dms.string.isEmpty($("#rcptTp").data("kendoExtDropDownList").value())){
                    dms.notification.info("<spring:message code='ser.lbl.invoiceTp' var='invoiceTp' /><spring:message code='global.info.validation.select' arguments='${invoiceTp}' />");
                    processResultYn = false;
                }
            }else if(stat == "R"){

                if( dms.string.isEmpty($("#refdPrsnNm").val())){
                    dms.notification.info("<spring:message code='ser.lbl.refdPrsnNm' var='refdPrsnNm' /><spring:message code='global.info.validation.select' arguments='${refdPrsnNm}' />");
                    processResultYn = false;
                 }
            }
            if($("#disTrY").is(':hidden')&&stat!='C'){
                dms.notification.info("<spring:message code='ser.btn.receiveStart' var='receiveStart' /><spring:message code='global.info.clicked.btn' arguments='${receiveStart}' />");
                processResultYn = false;
            }
        }

        if(!processResultYn) return;

        var param = {};

        if(stat == "R"){//환불

            url = "<c:url value='/ser/rcv/serviceReceive/updateRefundReceiveDetail.do' />";

            //var grid = $('#receiveGrid').data('kendoExtGrid');
            var detailGrid = $('#detailGrid').data('kendoExtGrid');
            var selectedVal = grid.dataItem(grid.select());

            var jsonDataList = [];
            var dlrPointAccuParamList = [];
            var cardPointUseParamList = [];
            var custPointUseParamList = [];
            var rows = grid.tbody.find("tr");
            var chkYn = false;
            var chkCnt = 0;
            var chkIdx = 0;

            $(".grid-checkbox-item").each( function(index , obj){
                var dataItem = detailGrid.dataSource._data;

                if( $(obj).hasClass("k-state-selected")){
                      var myDate = new Date();//退款时间修改 贾明 2018-11-29
                      //console.log("我的值e",kendo.parseDate(myDate));
                      //console.log("我的值",kendo.parseDate(sysDate));
                    jsonData = {
                           "rcvDocNo"    : dataItem[chkIdx].rcvDocNo
                          ,"roDocNo"     : dataItem[chkIdx].roDocNo
                          ,"rcvSubDocNo" : dataItem[chkIdx].rcvSubDocNo
                          ,"rcvStatCd"   : stat
                          ,"refdAmt"     : dataItem[chkIdx].rcvAmt     //환불금액
                          ,"refdDt"      : kendo.parseDate(myDate)    //환불일자 sysDate 改为  myDate 退款时间修改 贾明 2018-11-29
                          ,"refdPrsnNm"  : loginUsrNm
                          ,"refdRemark"  : ""
                          ,"rcvCpltDt"   : dataItem[chkIdx].rcvCpltDt
                          ,"npayAmt"     : 0.00                         //미수금
                          ,"rcvAmt"      : dataItem[chkIdx].rcvAmt      //실수령액
                          ,"rcptTp"      : dataItem[chkIdx].rcptTp
                          ,"rcptNo"      : dataItem[chkIdx].rcptNo
                          ,"rcptDt"      : dataItem[chkIdx].rcptDt
                          ,"paymTp"      : dataItem[chkIdx].paymTp
                          ,"rcvRemark"   : dataItem[chkIdx].rcvRemark
                          ,"paymMthCd"   : dataItem[chkIdx].paymMthCd
                          ,"paymPrid"    : dataItem[chkIdx].paymPrid
                          ,"paymYn"      : "Y"
                          ,"lineNo"      : dataItem[chkIdx].lineNo
                          ,"serParDstinCd" : selectTabId
                       };
                    jsonDataList.push(jsonData);

                    // 딜러포인트 적립취소
                    if(dataItem[chkIdx].paymPrid == "01" && dataItem[chkIdx].paymTp == "04") {
                        var srcSub3;

                        if(selectTabId == "SER"){
                            if(dataItem[chkIdx].roTp == "01") {
                                srcSub3 = "GNL_RTE_RATE";
                            } else if(dataItem[chkIdx].roTp == "02") {
                                srcSub3 = "WART_RTE_RATE";
                            } else if(dataItem[chkIdx].roTp == "03") {
                                srcSub3 = "INC_RTE_RATE";
                            }
                        } else {
                            srcSub3 = "REV_PARTS_RATE";
                        }

                        dlrPointAccuParam = {
                             roDocNo:dataItem[chkIdx].roDocNo
                            ,srcSub1:dataItem[chkIdx].rcvDocNo
                            ,srcSub2:dataItem[chkIdx].lineNo
                            ,srcSub3:srcSub3
                        };

                       dlrPointAccuParamList.push(dlrPointAccuParam);
                    };

                   //카드 선불금 취소
                    if(dataItem[chkIdx].paymMthCd == "04"){ //paymMthCd 04

                       cardPointUseParam = {
                           membershipNo :""
                           ,cardNo      :""
                           ,pointCd     :"06"
                           ,cardTpCd    :"02"
                           ,occrPointVal:""
                           ,extcTargYn  :"Y"     //소멸대상여부
                           ,roDocNo     :dataItem[chkIdx].roDocNo
                           ,srcSub1     :dataItem[chkIdx].rcvDocNo
                           ,srcSub2     :dataItem[chkIdx].lineNo
                       };
                       cardPointUseParamList.push(cardPointUseParam);
                    }

                   // 고객예치금 취소
                    if(dataItem[chkIdx].paymTp == "04" && dataItem[chkIdx].paymMthCd == "03"){ //고객선수금
                        var useTp = "03";
                        if(selectTabId == "PAR"){
                            useTp = "04";
                        }
                        custPointUseParam = {
                            custNo     :dataItem[chkIdx].paymCd
                           ,sourTp     :"06"
                           ,chrTp      :"+"
                           ,paymMthCd  :dataItem[chkIdx].paymMthCd
                           ,paymAmt    :dataItem[chkIdx].rcvAmt
                           ,rcptTp     :dataItem[chkIdx].rcptTp
                           ,rcptNo     :dataItem[chkIdx].rcptNo
                           ,rcptDt     :dataItem[chkIdx].rcptDt
                           ,vinNo      :dataItem[chkIdx].vinNo
                           ,carRegNo   :dataItem[chkIdx].carRegNo
                           ,refKeyNo   :dataItem[chkIdx].rcvDocNo
                           ,refTableNm :"SE_0560T"
                           ,useTp      :useTp
                           ,useNum     :dataItem[chkIdx].roDocNo
                        };

                        custPointUseParamList.push(custPointUseParam);
                    }
                }
                chkIdx++;
            });

                param = $.extend(
                     {"serviceReceiveDetailListVO":jsonDataList}
                    ,{"cardPointHisListVO":cardPointUseParamList}
                    ,{"dlrPointAccuListVO":dlrPointAccuParamList}
                    ,{"custChargeHistListVO":custPointUseParamList}
                );

       }else{

            url = "<c:url value='/ser/rcv/serviceReceive/multiServiceReceiveDetail.do' />";

            jsonData = {
                "rcvDocNo"    : selectedVal.rcvDocNo
                ,"roDocNo"    : selectedVal.roDocNo
                ,"rcvSubDocNo": $("#rcvSubDocNo").val()
                ,"dlrCd"      : $("#dlrCd").val()
                ,"paymTp"     : selectedVal.paymTp
                ,"paymMthCd"  : selectedVal.paymMthCd
                ,"rcvStatCd"  : stat
                ,"npayAmt"    : 0
                ,"rcvAmt"     : selectedVal.rcvAmt
                ,"rcptTp"     : ""
                ,"rcptNo"     : ""
                ,"rcvRemark"  : ""
                ,"serParDstinCd" : selectTabId
            };

            // 딜러포인트 적립
            if(selectedVal.paymPrid == "01" && selectedVal.paymTp == "04") {
                var srcSub3;

                if(selectTabId == "SER"){
                    if(dataItem[chkIdx].roTp == "01") {
                        srcSub3 = "GNL_RTE_RATE";
                    } else if(dataItem[chkIdx].roTp == "02") {
                        srcSub3 = "WART_RTE_RATE";
                    } else if(dataItem[chkIdx].roTp == "03") {
                        srcSub3 = "INC_RTE_RATE";
                    }
                } else {
                    srcSub3 = "REV_PARTS_RATE";
                }

                dlrPointAccuParam = {
                     roDocNo:selectedVal.roDocNo
                    ,srcSub1:selectedVal.rcvDocNo
                    ,srcSub2:""
                    ,srcSub3:srcSub3
                };
            }

            cardPointUseParam = {
                membershipNo :""
                ,cardNo      :""
                ,pointCd     :"06"
                ,cardTpCd    :"02"
                ,occrPointVal:""
                ,extcTargYn  :"Y"     //소멸대상여부
                ,roDocNo     :selectedVal.calcDocNo
            };
            param = $.extend(
                {"serviceReceiveDetailVO":jsonData}
                ,{"cardPointHisVO":cardPointUseParam}
                ,{"dlrPointAccuVO":dlrPointAccuParam}
            );

       }

        $.ajax({
            url:url,
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
                processResultYn = false;
            },
            success:function(jqXHR, textStatus) {
                //$("#btnReset").click();

                setGridRows(grid);
                $("#rcvStatCd").val(stat);
                grid.dataSource.page(1);
                $("#detailGrid").data("kendoExtGrid").dataSource.data([]);
                processResultYn = true;

                //정상적으로 반영 되었습니다.
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


    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

             dms.ajax.excelExport({
                "beanName"         :"serviceReceiveService"
                ,"templateFile"    :"ServiceReceiveList_Tpl.xlsx"
                ,"fileName"        :"<spring:message code='ser.menu.receiveMng' />.xlsx"
                ,"sRoDocNo"        : $("#sRoDocNo").val()
                ,"sRoTp"           :$("#sRoTp").val()
                ,"sRcvStatCd"      :$("#sRcvStatCd").val()
                ,"sPaymTp"         :$("#sPaymTp").val()
                ,"sPaymPrid"       :$("#sPaymPrid").val()
                ,"sVinNo"          :$("#sVinNo").val()
                ,"sDriverNm"       :$("#sDriverNm").val()
                ,"sCarRegNo"       :$("#sCarRegNo").val()
                ,"sPaymUsrNm"      :$("#sPaymUsrNm").val()
                ,"sCalcFromDt"     :$("#sCalcFromDt").val()
                ,"sCalcToDt"       :$("#sCalcToDt").val()
                ,"sPaymYn"         :$("#sPaymYn").val()
                ,"sCalcPrsnNm"     :$("#sCalcPrsnNm").val()
                ,"sCalcStatCd"     :"00"
                ,"sSerParDstinCd"  :"SER"
            });
        }
    });

  //그리드 설정
    $("#receiveGrid").kendoExtGrid({
        gridId:"G-SER-1011-000081"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceives.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sRoDocNo"]    = $("#sRoDocNo").val();
                        params["sRoTp"]       = $("#sRoTp").val();
                        params["sRcvStatCd"]  = $("#sRcvStatCd").val();
                        params["sPaymTp"]     = $("#sPaymTp").val();
                        params["sPaymPrid"]   = $("#sPaymPrid").val();
                        params["sVinNo"]      = $("#sVinNo").val();
                        params["sDriverNm"]   = $("#sDriverNm").val();
                        params["sCarRegNo"]   = $("#sCarRegNo").val();
                        params["sPaymUsrNm"]  = $("#sPaymUsrNm").val();
                        params["sCalcFromDt"] = $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCalcToDt"]   = $("#sCalcToDt").data("kendoExtMaskedDatePicker").value();
                        params["sPaymYn"]     = $("#sPaymYn").val();
                        params["sCalcPrsnNm"] = $("#sCalcPrsnNm").val();
                        params["sCalcStatCd"]   = "00";
                        params["sSerParDstinCd"] = "SER";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,rcvDocNo:{type:"string"}
                        ,vinNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,rcvStatCd:{type:"string"}
                        ,calcDocNo:{type:"string"}
                        ,calcDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,wonUnitCutAmt:{type:"number"}
                        ,demicPointCutAmt:{type:"number"}
                        ,rcvAmt:{type:"number"}
                    }
                }
            }
            ,aggregate:[
                { field:"rcvAmt", aggregate:"sum" }
            ]
        }
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(rowRcvSubDocNo  == selectedVal.rcvSubDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }
        }
        ,change:function(e){
             var dataItem = this.dataItem(this.select());
             saveYn = false;
             $("#rcvDocNo").val(dataItem.rcvDocNo);
             $("#rcvSubDocNo").val(dataItem.rcvSubDocNo);
             $("#rcvSubDocNo2").val(dataItem.rcvSubDocNo);
             $("#roDocNo").val(dataItem.roDocNo);
             $("#paymTp").val(dataItem.paymTp);

             $("#detailGrid").data("kendoExtGrid").dataSource.read();
             if(${isTablet}){
                 $("#detailGrid").hide();
                 $("#detailGrid").show();
             }

             setButtonEnable( dataItem.rcvStatCd , dataItem.paymYn );

        }
        ,height:250
        ,selectable:"row"
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100,attributes:{"class":"al"}}//차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150,attributes:{"class":"al"}}//VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"al"}}//차량소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:120, attributes:{"class":"al"}}//방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}                // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}                    // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}      // 현주행거리
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"} // 인도주행거리
            ,{field:"rcvStatCd", title:"<spring:message code='ser.lbl.payStat' />", width:120, attributes:{"class":"ac"} ,template:"#=receiveCdGrid(rcvStatCd)#"}//지불상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120,attributes:{"class":"ac"}}//RO 번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:80, attributes:{"class":"ac"}}  // RO유형
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }   // RO일자
            ,{field:"roRegUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}    // 정비위탁자
            ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:120, attributes:{"class":"al"}}//정비정산번호
            ,{field:"calcDt", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}//정산일자
            ,{field:"calcPrsnNm", title:"<spring:message code='ser.lbl.calcCompNm' />", width:120, attributes:{"class":"al"}}//정산완료자
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                    });
                }
            }          // 지불유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100, attributes:{"class":"al"}}       // 지불자 코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100, attributes:{"class":"al"}}       // 지불자
            ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90
                ,attributes:{"class":"ac"}
                ,template:"#=paymPridCdGrid(paymPrid)#"
                ,editor:function(container, options){
                    $('<input required name="paymPrid" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymPridCdList
                    });
                }
            }       // 지불기한
            ,{field:"calcAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}            //정산금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }     //정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}    //정산제로
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}           // 수납금액
            ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }          //실수령금액
            ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}      //미수금
            ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90}    // 지불비고
            ,{field:"rcvHisPaymMthCd", title:"<spring:message code='ser.lbl.expcPayMethod' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=paymMthCdGrid(paymMthCd)#"
                ,editor:function(container, options){
                    $('<input required name="paymMthCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymMthCdList
                    });
                }
            }    // 예상지불방식
            ,{field:"rcvHisRcptTp", title:"<spring:message code='ser.lbl.expcInvoiceTp' />", width:120
                ,template:"#=rcptTpCdGrid(rcptTp)#"
                ,editor:function(container, options){
                    $('<input required name="rcptTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:rcptTpCdList
                    });
                }
            }   //예상영수증유형
            ,{field:"rcvDocNo", title:"<spring:message code='ser.lbl.rcvDocNo' />", width:120, attributes:{"class":"al"}}//수납번호
            ,{field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", width:80,attributes:{"class":"ac"}}//청산완료여부
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.arLbrAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" , hidden:true} //발생공임비 (사용안함)
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.arItemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" , hidden:true}//발생부품비 (사용안함)
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.arOtherAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", hidden:true}//발생기타비 (사용안함)
            ,{field:"preAmt", title:"<spring:message code='ser.lbl.preDoUseAmt' />", width:80, attributes:{"class":"ar"}, hidden:true}//선수금 금액 사용
            ,{field:"balAmt", title:"<spring:message code='ser.lbl.advance' />", width:80, attributes:{"class":"ar"}, hidden:true}//선불금금액
            ,{field:"dcPermCd", title:"<spring:message code='ser.lbl.dcAuthor' />", width:80, attributes:{"class":"ac"}, hidden:true}//할인권한
            ,{field:"cupnNo", title:"CouponNo", width:90, hidden:true}       // 쿠폰번호
            ,{field:"cupnAmt", title:"CouponPrice", width:90, attributes:{"class":"ar"}, hidden:true
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:10000
                        ,decimals:0
                        ,spinners:false
                    });
                }
            }       // 쿠폰금액
            ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=paymMthCdGrid(paymMthCd)#"
                ,editor:function(container, options){
                    $('<input required name="paymMthCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymMthCdList
                    });
                }
                ,hidden:true
            }    // 지불방식
            ,{field:"rcptTp", title:"<spring:message code='ser.lbl.invoiceTp' />", width:120
                ,template:"#=rcptTpCdGrid(rcptTp)#"
                ,editor:function(container, options){
                    $('<input required name="rcptTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:rcptTpCdList
                    });
                }
                ,hidden:true
            }//영수증유형
        ]
    });

    // 부품
    $("#itemGrid").kendoExtGrid({
        gridId:"G-SER-1011-000082"
        ,dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceives.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sRoDocNo"]    = $("#sRoDocNo").val();
                       params["sRoTp"]       = $("#sRoTp").data("kendoExtDropDownList").value();
                       params["sRcvStatCd"]  = $("#sRcvStatCd").data("kendoExtDropDownList").value();
                       params["sPaymTp"]     = $("#sPaymTp").data("kendoExtDropDownList").value();
                       params["sPaymPrid"]   = $("#sPaymPrid").data("kendoExtDropDownList").value();
                       params["sVinNo"]      = $("#sVinNo").val();
                       //params["sRcvDocNo"]   = $("#sRcvDocNo").val();
                       params["sDriverNm"]   = $("#sDriverNm").val();
                       params["sCarRegNo"]   = $("#sCarRegNo").val();
                       params["sPaymUsrNm"]  = $("#sPaymUsrNm").val();
                       params["sCalcFromDt"] = $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value();
                       params["sCalcToDt"]   = $("#sCalcToDt").data("kendoExtMaskedDatePicker").value();
                       params["sPaymYn"]     = $("#sPaymYn").data("kendoExtDropDownList").value();
                       params["sSerParDstinCd"] = "PAR";

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"rnum"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,carRegNo:{type:"string"}
                       ,rcvDocNo:{type:"string"}
                       ,vinNo:{type:"string"}
                       ,driverNm:{type:"string"}
                       ,carOwnerNm:{type:"string"}
                       ,roDocNo:{type:"string"}
                       ,rcvStatCd:{type:"string"}
                       ,calcDocNo:{type:"string"}
                       ,calcDt:{type:"date"}
                       ,wonUnitCutAmt:{type:"number"}
                       ,demicPointCutAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(rowRcvSubDocNo  == selectedVal.rcvSubDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#rcvDocNo").val(dataItem.rcvDocNo);
            $("#rcvSubDocNo").val(dataItem.rcvSubDocNo);
            $("#rcvSubDocNo2").val(dataItem.rcvSubDocNo);
            $("#roDocNo").val(dataItem.roDocNo);
            $("#paymTp").val(dataItem.paymTp);

            $("#detailGrid").data("kendoExtGrid").dataSource.read();

            setButtonEnable( dataItem.rcvStatCd ,"Y");
        }
        ,height:250
        ,selectable:"row"
        ,columns:[
             {field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", width:80,attributes:{"class":"ac"},hidden:true}//청산완료여부
            ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100,attributes:{"class":"al"}}//차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150,attributes:{"class":"al"}}//VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"al"}}//차량소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:120, attributes:{"class":"al"}}//운전자
            ,{field:"rcvStatCd", title:"<spring:message code='ser.lbl.payStat' />", width:120, attributes:{"class":"ac"} ,template:"#=receiveCdGrid(rcvStatCd)#"}//지불상태
            ,{field:"calcDt", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}//정산일자
            ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:120, attributes:{"class":"al"}}//정비정산번호
            ,{field:"rcvDocNo", title:"<spring:message code='ser.lbl.rcvDocNo' />", width:120, attributes:{"class":"al"}}//수납번호
            ,{field:"calcPrsnNm", title:"<spring:message code='ser.lbl.calcCompNm' />", width:120, attributes:{"class":"ac"}}//정산완료자
            ,{field:"calcSubDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:150,hidden:true}          // 정산번호
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                    });
                }
            }          // 지불유형
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100, attributes:{"class":"al"}}       // 지불자
            ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90
                ,attributes:{"class":"ac"}
                ,template:"#=paymPridCdGrid(paymPrid)#"
                ,editor:function(container, options){
                    $('<input required name="paymPrid" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymPridCdList
                    });
                }
            }       // 지불기한
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.arLbrAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" , hidden:true} //발생공임비(사용안함)
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.arItemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" , hidden:true}//발생부품비(사용안함)
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.arOtherAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" , hidden:true}//발생기타비(사용안함)
            ,{field:"calcAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}            //발생금액
            ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}          //실수령금액
            ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}      //미수금
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSett' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }                 //정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.settClZero' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}              //정산제로
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}    // 최종정산금액
            ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=paymMthCdGrid(paymMthCd)#"
                ,editor:function(container, options){
                    $('<input required name="paymMthCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymMthCdList
                    });
                }
            }    // 지불방식
            ,{field:"cupnNo", title:"CouponNo", width:90,hidden:true}       // 쿠폰번호
            ,{field:"cupnAmt", title:"CouponPrice", width:90, attributes:{"class":"ar"},hidden:true
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:10000
                        ,decimals:0
                        ,spinners:false
                    });
                }
            }       // 쿠폰금액
            ,{field:"rcptTp", title:"<spring:message code='ser.lbl.invoiceTp' />", width:120
                ,template:"#=rcptTpCdGrid(rcptTp)#"
                ,editor:function(container, options){
                    $('<input required name="rcptTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:rcptTpCdList
                    });
                }
            }//영수증유형
            ,{field:"preAmt", title:"<spring:message code='ser.lbl.preDoUseAmt' />", width:80, attributes:{"class":"ar"},hidden:true}//선수금 금액 사용
            ,{field:"balAmt", title:"<spring:message code='ser.lbl.advance' />", width:80, attributes:{"class":"ar"},hidden:true}//선불금금액
            ,{field:"dcPermCd", title:"<spring:message code='ser.lbl.dcAuthor' />", width:80, attributes:{"class":"ac"},hidden:true}//할인권한
            ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90}    // 지불비고
          ]
    });


    $("#detailGrid").kendoExtGrid({
        gridId:"G-SER-1011-000083"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveDetailsHist.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sRcvDocNo"] = $("#rcvDocNo").val();
                        params["sRcvSubDocNo"] = $("#rcvSubDocNo").val();
                        params["sPaymTp"]   = $("#paymTp").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number" ,editable:false}
                        ,paymTp:{type:"string"}
                        ,paymPrid:{type:"string", validation:{required:true} , editable:false} /* 지불기간 */
                        ,lbrAmt:{type:"number"} /* 발생공임비 */
                        ,parAmt:{type:"number"} /* 발생부품비 */
                        ,etcAmt:{type:"number"} /* 발생기타비 */
                        ,rcvAmt:{type:"number"} /* 발생금액 */
                        ,paymAmt:{type:"number"}
                        ,paymMthCd:{type:"string"}
                        ,rcvCpltDt:{type:"date"}
                        ,rcptDt:{type:"date"}
                        ,npayChkDt:{type:"date"}
                        ,refdDt:{type:"date"}
                        ,calcDocNo:{type:"string"}
                        ,lineNo:{type:"number"}
                    }
                }
            }
        }
        ,height:150
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        //,multiSelectWithCheckbox:true
        //,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function (e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem.paymYn == "Y" || dataItem.paymPrid == "02"){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                }else{
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                }
            });
        }
        ,change : function(e){

            var grid = $('#detailGrid').data('kendoExtGrid');
            var selectedVal = grid.dataItem(grid.select());
            var totAmt = 0;
            var btnRefundYn = false;

        }
        ,columns:[
            {title:"", width:40
                ,attributes:{"class":"ac"}, _field:"_checkAll"
                ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
            }
            ,{field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50,attributes:{"class":"ac"}, hidden:true }                                                               // 번호
            ,{field:"rcvHistStatNm", title:"<spring:message code='ser.lbl.receiveStat' />", width:80, attributes:{"class":"ac"} }                                            //수납상태명
            ,{field:"rcvCpltDt", title:"<spring:message code='ser.lbl.rcvEndDt' />", width:125, attributes:{"class":"ac"}
             // ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             ,template:"#= kendo.toString(changRcvCpltDt(rcvHistStatNm,rcvCpltDt,refdDt), '<dms:configValue code='dateFormat' /> HH:mm') #"
             }//수납시간 贾明 修改收款时间与退款时间展示 2018-11-29
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.receiver' />", width:90, attributes:{"class":"al"} }                                                    //수납자
            ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:70,attributes:{"class":"ac"},template:"#=paymMthCdGrid(paymMthCd)#" }            //지불방식
            ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}                                       //실수령금액
            ,{field:"rcptTp", title:"<spring:message code='ser.lbl.invoiceTp' />", width:120,template:"#=rcptTpCdGrid(rcptTp)#"}                                             //영수증유형
            ,{field:"rcptNo", title:"<spring:message code='ser.lbl.invoiceNo' />", width:120, attributes:{"class":"al"} }                                                    //영수증번호
            ,{field:"rcptDt", title:"<spring:message code='ser.lbl.invoiceDt' />", width:125, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"} //영수증일자
            ,{field:"rcvRemark", title:"<spring:message code='ser.lbl.receiveBigo' />", width:195, attributes:{"class":"al"}}                                                //수납비고
            ,{field:"lineNo", title:"<spring:message code='ser.lbl.rcvDocNo' />", width:120, hidden:true }                                                                              //
            ,{field:"rcvDocNo", title:"<spring:message code='ser.lbl.rcvDocNo' />", width:120, hidden:true }                                                                              // 수납번호
            ,{field:"rcvStatCd", title:"<spring:message code='ser.lbl.payStat' />", width:80, attributes:{"class":"ac"} ,template:"#=receiveCdGrid(rcvStatCd)#",hidden:true} //지불상태
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70,attributes:{"class":"ac"},template:"#=paymTpCdGrid(paymTp)#",hidden:true}           //지불유형
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100, attributes:{"class":"al"} ,hidden:true}                                         //지불자
            ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90,attributes:{"class":"ac"},template:"#=paymPridCdGrid(paymPrid)#" ,hidden:true}   //지불기한
            ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" ,hidden:true}                       //미수금
            ,{field:"npayChkDt", title:"<spring:message code='ser.lbl.outstdAmtDt' />", width:120, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}",hidden:true}//미수금확인시간
            ,{field:"refdAmt", title:"<spring:message code='ser.lbl.refdAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" ,hidden:true}                         //환불금액
            ,{field:"refdDt", title:"<spring:message code='ser.lbl.refdDt' />", width:125, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", hidden:true}//환불확인시간
            ,{field:"refdPrsnNm", title:"<spring:message code='ser.lbl.refdPrsnNm' />", width:90, attributes:{"class":"al"} , hidden:true}                                   //환불담당자
            ,{field:"paymYn", hidden:true }
            ,{field:"calcDocNo", hidden:true }
            ,{field:"carOwnerId", hidden:true }
            ,{field:"carRegNo", hidden:true }
            ,{field:"vinNo", hidden:true }
        ]
    });
    
    //退款后，退款的时间还是显示收款的时间，而不是实际退款的时间 时间修改  退款时，展示退款时间  收款时展示收款时间  贾明 2018-11-29 
     changRcvCpltDt = function(val,rcvCpltDt,refdDt){
         //console.log("dms",dms);
         var returnVal = "";
          if(val != null && val != ""){
              if("退款" == val){
                 returnVal =  refdDt;
               } else if("收款" == val ){
                returnVal =  rcvCpltDt;
              } 
           }
        return returnVal;
     }

    //체크박스 세팅
    gridCheckBoxSet = function(uid , checked){
        var grid = $("#detailGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var rows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
            $(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
        }else{
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
        }

        receiveCancelYn();
    };

    //수납취소 버튼 활성화여부
    receiveCancelYn = function(e){

        var grid = $("#detailGrid").data("kendoExtGrid");
        var rows = grid.tbody.find("tr");
        var chkYn = false;
        var chkCnt = 0;

        rows.each( function(index , obj){
            var dataItem = grid.dataSource._data;
            if(dataItem[index].paymYn == 'N'){
                chkYn = $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked");
                if(chkYn) chkCnt++;
            }
        });

        if(chkCnt == 0 ){
            $(".checkAll").prop("checked", false);
        }
        $("#receiveCancel").data("kendoButton").enable( (chkCnt> 0 ) ? true : false);//수납취소 */

    };

    //그리드 헤더CheckBox 클릭이벤트
    $(".checkAll").on("click" , function(e){

        var grid = $("#detailGrid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");
        var uid = $(this).attr("data-uid");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                if(dataItem[index].paymYn == 'N' && dataItem[index].paymPrid == '01'){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
            });
        }

        receiveCancelYn();
    });


    //그리드 선택 이벤트
      $("#detailGrid").on("click", "tr.k-state-selected", function (e) {

        var grid = $("#detailGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var chkBoolean = true;
        if(selectedVal != null){
            var uid = selectedVal.uid;
            if(selectedVal.paymYn == "N"){
                chkBoolean = $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked") ? false : true;
                gridCheckBoxSet(uid , chkBoolean);
            }
        }
    });

    //체크박스 선택이벤트
    $("#detailGrid").on("click", ".grid-checkbox-item", function(e){
        var checked = $(this).is(":checked");

        var grid = $("#detailGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var chkBoolean = true;
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");

        rows.each( function(index , obj){
            var dataItem = grid.dataSource._data;
            if( uid  == dataItem[index].uid){
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid  + "]")).toggleClass("k-state-selected");
            }else{
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).removeClass("k-state-selected");
            }
        });

        gridCheckBoxSet($(this).attr("data-uid") , checked);

    });


    //수납 완료 팝업
    selectReceivePopupWindow = function(selectedGrid,btnStat){

        var grid;
        var popupUrl;
        var popupHeight;

        if(selectTabId == "SER"){
            grid = $("#receiveGrid").data("kendoExtGrid");
        }else{
            grid = $("#itemGrid").data("kendoExtGrid");
        }

        if(btnStat === "R"){
            popupUrl = "<spring:message code='ser.btn.refund' />";
            popupHeight = 330;
        } else {
            popupUrl = "<spring:message code='ser.title.reciveMng' />";
            popupHeight = 450;
        }

        var rows = selectedGrid.select();
        var selectedVal = selectedGrid.dataItem(rows);

        selectReceiveRegPopup = dms.window.popup({
            windowId:"selectReceiveRegPopup"
            ,title:popupUrl
            ,height:popupHeight
            ,width:650
            ,modal:true
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectServiceReceivePopup.do'/>"
                , data:{
                    "autoBind":true
                    ,"selectable":"multiple"
                    ,"selectedVal" : selectedVal
                    ,"detailCnt" : $("#detailGrid").data("kendoExtGrid").dataSource.data().length + 1
                    ,"btnStat" : btnStat
                    ,"serParDstinCd" : selectTabId
                    ,"callbackFunc":function(data){

                    /*
                        selectedYn = (dms.string.isEmpty($("#sPaymTp").val()) &&
                                        dms.string.isEmpty($("#sRcvStatCd").val())
                                        ) ? true : false;
                        if(selectedYn){
                            gridRow = grid.select().index();
                        } */

                        setGridRows(grid);
                        $("#detailGrid").data("kendoExtGrid").dataSource.data([]);
                        grid.dataSource.page(1);

                    }
                }
            }
        });
    };


  //선택된 그리드 Rows
    setGridRows = function(grid){

        rowRcvSubDocNo = "";
        gridRow = 0;
        var selectedVal = grid.dataItem(grid.select());
        if(selectedVal != null){
            gridRow = grid.select().index();
            rowRcvSubDocNo = selectedVal.rcvSubDocNo;
        }
    }

    <c:if test="${rcvDocNo ne ''}">
        $("#sRcvDocNo").val("${rcvDocNo}");
        $('#receiveGrid').data('kendoExtGrid').dataSource.page(1);
        $("#sRcvStatCd").data("kendoExtDropDownList").value("");
        $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value("");
        $("#sCalcToDt").data("kendoExtMaskedDatePicker").value("");
    </c:if>

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        $("#sRcvStatCd").data("kendoExtDropDownList").value("");
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#reciveColGroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[2]).css("width","7%");

            $("#detailGrid").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<div id="resizableContainer">
    <div class="content">
        <!-- 수납현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-11544" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12999" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnRcvStats"><spring:message code="ser.btn.rcvStats" /></button><!-- 수납통계 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11634" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11635" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="form">
                <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup id="reciveStatColGroup">
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
                                <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                                <td>
                                    <input type="text" id="sCarRegNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.paidYn" /></th><!--청산완료여부 -->
                                <td>
                                    <input type="text" id="sPaymYn" name="sPaymYn" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payer' /><!-- 지불자 --></th>
                                <td>
                                    <input type="text" id="sPaymUsrNm" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.rcvEndDt' /><!--  수납시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRcvCpltFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRcvCpltToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /><!--  VIN --></th>
                                <td>
                                    <input type="text" id="sVinNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roTp" /></th>
                                <td>
                                    <input type="text" id="sRoTp" class="form_comboBox"/> <!-- RO유형-->
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payWay' /></th><!-- 지불유형 -->
                                <td>
                                    <input type="text" id="sPaymTp" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payMethod' /></th><!-- 지불방식 -->
                                <td>
                                    <input type="text" id="sPaymMthTp" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <%-- <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCarOwnerNm" class="form_input">
                                </td> --%>
                                <th scope="row"><spring:message code='ser.lbl.driver' /><!-- 방문자 --></th>
                                <td>
                                    <input type="text" id="sDriverNm" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payStat' /></th><!-- 수납상태 -->
                                <td>
                                    <input type="text" id="sRcvStatCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payTerm' /></th><!-- 지불기한 -->
                                <td>
                                    <input type="text" id="sPaymPrid" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.receiveStatRcv' /></th><!-- 수납상태 -->
                                <td>
                                    <input type="text" id="sRcvHistStatCd" class="form_comboBox">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>
    </div>
</div>

<!-- script -->
<script>
var selectRcvStatsPopup;

var receiveCdList = [];
var receiveCdList2 = [];
<c:forEach var="obj" items="${receiveCdList}">
    <c:if test="${obj.remark1 ne 'N' }">
    receiveCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    receiveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수납상태 map
var receiveCdMap = dms.data.arrayToMap(receiveCdList, function(obj){return obj.cmmCd});

var receiveHistCdList = [];
<c:forEach var="obj" items="${receiveHistCdList}">
    receiveHistCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수납상태 map

//공통코드:정산완료여부
var paymYnList = [];
<c:forEach var="obj" items="${paymYnList}">
paymYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymYnListMap = dms.data.arrayToMap(paymYnList, function(obj){return obj.cmmCd;});

//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});

//공통코드:지불방식
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymMthCdArr = dms.data.arrayToMap(paymMthCdList, function(obj){return obj.cmmCd});

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd;});

//수납 구분
receiveCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(receiveCdMap[val] != undefined)
            returnVal = receiveCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//공통코드:RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
            returnVal = roTpCdArr[val].cmmCdNm;
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

$(document).ready(function() {

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            if( dms.string.isEmpty($("#sRcvCpltToDt").val()) || dms.string.isEmpty($("#sRcvCpltFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.rcvEndDt' var='rcvEndDt'/><spring:message code='global.info.validation.required' arguments='${rcvEndDt}' />");
                return;
            }

            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
        }
    });

    var sRcvCpltFromDt = "${sRcvCpltFromDt}";
    var sRcvCpltToDt   = "${sRcvCpltToDt}";

    $("#btnReset").kendoButton({
        click:function(e){

            $("#form").get(0).reset();

            $("#sRoTp").data("kendoExtDropDownList").value("");
            $("#sPaymMthTp").data("kendoExtDropDownList").value("");
            $("#sPaymYn").data("kendoExtDropDownList").value("");
            $("#sRcvCpltFromDt").data("kendoExtMaskedDatePicker").value(sRcvCpltFromDt);
            $("#sRcvCpltToDt").data("kendoExtMaskedDatePicker").value(sRcvCpltToDt);
            $("#btnSearch").click();
        }
    });

    // 수납통계
    $("#btnRcvStats").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sRcvCpltToDt").val()) || dms.string.isEmpty($("#sRcvCpltFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.rcvEndDt' var='rcvEndDt'/><spring:message code='global.info.validation.required' arguments='${rcvEndDt}' />");
                return;
            }

            var searchParam = {
                "sDlrCd"           : $("#sDlrCd").val()
                ,"sCarRegNo"        : $("#sCarRegNo").val()
                ,"sPaymYn"          : $("#sPaymYn").val()
                ,"sPaymUsrNm"       : $("#sPaymUsrNm").val()
                ,"sVinNo"           : $("#sVinNo").val()
                ,"sRoTp"            : $("#sRoTp").val()
                ,"sPaymTp"          : $("#sPaymTp").val()
                ,"sPaymMthTp"       : $("#sPaymMthTp").val()
                //,"sCarOwnerNm"      : $("#sCarOwnerNm").val()
                ,"sDriverNm"        : $("#sDriverNm").val()
                ,"sPaymPrid"        : $("#sPaymPrid").val()
                ,"sRcvStatCd"       : $("#sRcvStatCd").val()
                ,"sRcvHistStatCd"   : $("#sRcvHistStatCd").val()
                ,"sRcvCpltFromDt"   : $("#sRcvCpltFromDt").data("kendoExtMaskedDatePicker").value()
                ,"sRcvCpltToDt"     : $("#sRcvCpltToDt").data("kendoExtMaskedDatePicker").value()
                ,"sSerParDstinCd"   : "SER"
            };

            selectRcvStatsPopup = dms.window.popup({
                windowId:"selectRcvStatsPopup"
                ,height:280
                ,width:650
                ,title:"<spring:message code='ser.btn.rcvStats' />"
                ,modal:true
                ,content:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveStatsPopup.do'/>"
                    , data:{
                        "searchParam":searchParam
                    }
                }
            });
        }
    });


    /** 엑셀 버튼**/
    $("#btnExcelExport").kendoButton({

        click:function(e){

            if( dms.string.isEmpty($("#sRcvCpltToDt").val()) || dms.string.isEmpty($("#sRcvCpltFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.rcvEndDt' var='rcvEndDt'/><spring:message code='global.info.validation.required' arguments='${rcvEndDt}' />");
                return;
            }

            var param = $.extend(
                 {"sDlrCd"           : $("#sDlrCd").val()}
                ,{"sCarRegNo"        : $("#sCarRegNo").val()}
                ,{"sPaymYn"          : $("#sPaymYn").val()}
                ,{"sPaymUsrNm"       : $("#sPaymUsrNm").val()}
                ,{"sVinNo"           : $("#sVinNo").val()}
                ,{"sRoTp"            : $("#sRoTp").val()}
                ,{"sPaymTp"          : $("#sPaymTp").val()}
                ,{"sPaymMthTp"       : $("#sPaymMthTp").val()}
                ,{"sDriverNm"        : $("#sDriverNm").val()}
                ,{"sPaymPrid"        : $("#sPaymPrid").val()}
                ,{"sRcvStatCd"       : $("#sRcvStatCd").val()}
                ,{"sRcvHistStatCd"   : $("#sRcvHistStatCd").val()}
                ,{"sRcvCpltFromDt"   : $("#sRcvCpltFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sRcvCpltToDt"     : $("#sRcvCpltToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveStatusCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"          : "serviceReceiveService"
                            ,"templateFile"     : "ServiceReceiveStatusMain_Tpl.xlsx"
                            ,"fileName"         : "<spring:message code='ser.menu.receiveMng' />.xlsx"
                            ,"sDlrCd"           : $("#sDlrCd").val()
                            ,"sCarRegNo"        : $("#sCarRegNo").val()
                            ,"sPaymYn"          : $("#sPaymYn").data("kendoExtDropDownList").value()
                            ,"sPaymUsrNm"       : $("#sPaymUsrNm").val()
                            ,"sVinNo"           : $("#sVinNo").val()
                            ,"sRoTp"            : $("#sRoTp").data("kendoExtDropDownList").value()
                            ,"sPaymTp"          : $("#sPaymTp").data("kendoExtDropDownList").value()
                            ,"sPaymMthTp"       : $("#sPaymMthTp").data("kendoExtDropDownList").value()
                            //,"sCarOwnerNm"      : $("#sCarOwnerNm").val()
                            ,"sDriverNm"        : $("#sDriverNm").val()
                            ,"sPaymPrid"        : $("#sPaymPrid").data("kendoExtDropDownList").value()
                            ,"sRcvStatCd"       : $("#sRcvStatCd").data("kendoExtDropDownList").value()
                            ,"sRcvHistStatCd"   : $("#sRcvHistStatCd").data("kendoExtDropDownList").value()
                            ,"sRcvCpltFromDt"   : $("#sRcvCpltFromDt").val()
                            ,"sRcvCpltToDt"     : $("#sRcvCpltToDt").val()
                            ,"sTabId"           : "LIST"
                            ,"sSerParDstinCd"   : "SER"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    // 지불방식
    $("#sPaymMthTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:paymMthCdList
        ,optionLabel:" "
        ,index:0
    });

    // 지불유형
    $("#sPaymTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:paymTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
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

    //지불기간
    $("#sPaymPrid").kendoExtDropDownList({
        dataSource:paymPridCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //수납상태
    $("#sRcvStatCd").kendoExtDropDownList({
        dataSource:receiveCdList2
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //수납상태
    $("#sRcvHistStatCd").kendoExtDropDownList({
        dataSource:receiveHistCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    // 수납완료일자(From)
    $("#sRcvCpltFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:sRcvCpltFromDt
    });

    // 수납완료일자(To)
    $("#sRcvCpltToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:sRcvCpltToDt
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000084"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveStatus.do' />"
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

                        params["sDlrCd"]      = $("#sDlrCd").val();
                        params["sCarRegNo"]   = $("#sCarRegNo").val();
                        params["sPaymYn"]     = $("#sPaymYn").val();
                        params["sPaymUsrNm"]  = $("#sPaymUsrNm").val();

                        params["sVinNo"]      = $("#sVinNo").val();
                        params["sRoTp"]       = $("#sRoTp").val();
                        params["sPaymTp"]     = $("#sPaymTp").val();
                        params["sPaymMthTp"]  = $("#sPaymMthTp").val();

                        //params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                        params["sDriverNm"] = $("#sDriverNm").val();
                        params["sPaymPrid"]   = $("#sPaymPrid").val();
                        params["sRcvStatCd"]  = $("#sRcvStatCd").val();
                        params["sRcvHistStatCd"]  = $("#sRcvHistStatCd").val();

                        params["sRcvCpltFromDt"]  = $("#sRcvCpltFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRcvCpltToDt"]    = $("#sRcvCpltToDt").data("kendoExtMaskedDatePicker").value();
                        params["sSerParDstinCd"]    = "SER";

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
                        dlrCd:{type:"string", editable:false}
                        ,rcvDocNo:{type:"string", editable:false}
                        ,roDocNo:{type:"string"}
                        ,paymAmt:{type:"number"}
                        ,rcvCpltDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,rcptDt:{type:"date"}
                        ,paymYnDt:{type:"date"}
                        ,rcvHistRegDt:{type:"date"}
                        ,calcDt:{type:"date"}
                        ,rcvCpltHistDt:{type:"date"}
                        ,payEndDt:{type:"date"}
                        ,rcvCpltDtFormat:{type:"date"}
                        ,roDtFormat:{type:"date"}
                        ,rcptDtFormat:{type:"date"}
                        ,paymYnDtFormat:{type:"date"}
                        ,rcvHistRegDtFormat:{type:"date"}
                        ,calcDtFormat:{type:"date"}
                        ,rcvCpltHistDtFormat:{type:"date"}
                        ,payEndDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rcvCpltDtFormat = kendo.parseDate(elem.rcvCpltDt, "<dms:configValue code='dateFormat' />");
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.rcptDtFormat = kendo.parseDate(elem.rcptDt, "<dms:configValue code='dateFormat' />");
                            elem.paymYnDtFormat = kendo.parseDate(elem.paymYnDt, "<dms:configValue code='dateFormat' />");
                            elem.rcvHistRegDtFormat = kendo.parseDate(elem.rcvHistRegDt, "<dms:configValue code='dateFormat' />");
                            elem.calcDtFormat = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                            elem.rcvCpltHistDtFormat = kendo.parseDate(elem.rcvCpltHistDt, "<dms:configValue code='dateFormat' />");
                            elem.payEndDtFormat = kendo.parseDate(elem.payEndDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
            ,aggregate:[{ field:"paymAmt", aggregate:"sum" }]
        }
        ,height:480
        ,editable:false
        ,selectable:"row"
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100,attributes:{"class":"al"}}//차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150,attributes:{"class":"al"}}//VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"al"}}//차량소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:120, attributes:{"class":"al"}}//방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}// 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}// 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}// 현주행거리
            ,{field:"giRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"} // 인도주행거리
            ,{field:"rcvStatNm", title:"<spring:message code='ser.lbl.payStat' />", width:120, attributes:{"class":"ac"}}//지불상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110,attributes:{"class":"al"}}//RO 번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:80, attributes:{"class":"ac"}}// RO유형
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//RO일자
            ,{field:"roRegUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}//정비위탁자
            ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:110, attributes:{"class":"al"}}//정비정산번호
            ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//정산일자
            ,{field:"calcCompUsrNm", title:"<spring:message code='ser.lbl.calcCompNm' />", width:100}// 정산완료자
            ,{field:"paymTpNm", title:"<spring:message code='ser.lbl.payWay' />", width:100, attributes:{"class":"ac"}}// 지불유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:150, attributes:{"class":"al"}}// 지불자 코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100, attributes:{"class":"al"}}// 지불자
            ,{field:"paymPridNm", title:"<spring:message code='ser.lbl.payTerm' />", width:90, attributes:{"class":"ac"}}// 지불기한
            ,{field:"calcAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}//정산금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }//정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}//정산제로
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}// 수납금액
            ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}//실수령금액
            ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}//미수금
            ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:120}//지불비고
            ,{field:"paymMthCdNm", title:"<spring:message code='ser.lbl.expcRcvPayMethod' />", width:100, attributes:{"class":"ac"}}//예상지불방식
            ,{field:"rcptTpNm", title:"<spring:message code='ser.lbl.expcInvoiceTp' />", width:120}//예상영수증유형
            ,{field:"rcvDocNo", title:"<spring:message code='ser.lbl.rcvDocNo' />", width:110, attributes:{"class":"al"}}//수납번호
            ,{field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", width:80,attributes:{"class":"ac"}}//청산완료여부
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.realDrivDis' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}//현주행거리
            ,{field:"rcvHistStatNm", title:"<spring:message code='ser.lbl.receiveStatRcv' />", width:80, attributes:{"class":"ac"} }// 수납상태
            ,{field:"rcvCpltHistDtFormat", title:"<spring:message code='ser.lbl.rcvEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                //,template:"#= dms.string.strNvl(kendo.toString(data.rcvCpltHistDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                 ,template:"#= dms.string.strNvl(kendo.toString(changRcvCpltDt(rcvHistStatNm,data.rcvCpltHistDt,data.refdDt), '<dms:configValue code='dateFormat' /> HH:mm')) #"
                 // ,template:"#= changRcvCpltDt(rcvHistStatNm,data.rcvCpltHistDt,data.refdDt) #"
            }//수납완료일자 如果是退款展示退款时间，收款展示收款时间 贾明 2018-11-30
            ,{field:"refdDt", title:"<spring:message code='ser.lbl.refdDt' />", width:125, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", hidden:true}//增加退款时间 贾明 2018-11-30
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.rcvRegUsrNm' />", width:100, attributes:{"class":"al"} }//수납자
            ,{field:"rcvHisPaymMthCdNm", title:"<spring:message code='ser.lbl.payMethod' />", width:70,attributes:{"class":"ac"}}//지불방식
            ,{field:"rcvHistAmt", title:"<spring:message code='par.lbl.dpstAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}//실수령금액
            ,{field:"rcvHisRcptTpNm", title:"<spring:message code='ser.lbl.invoiceTp' />", width:120}//영수증유형
            ,{field:"rcptNo", title:"<spring:message code='ser.lbl.invoiceNo' />", width:120, attributes:{"class":"al"} }//영수증번호
            ,{field:"rcptDtFormat", title:"<spring:message code='ser.lbl.invoiceDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.rcptDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//영수증일자
            ,{field:"", title:"<spring:message code='ser.lbl.incinerateYn' />", sortable:false, width:100, attributes:{"class":"ac"}}//소각여부
            ,{field:"", title:"<spring:message code='ser.lbl.incinerateDt' />", sortable:false, width:125, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}//소각시간
            ,{field:"rcvRemark", title:"<spring:message code='ser.lbl.receiveBigo' />", width:195, attributes:{"class":"al"}}//수납비고
            ,{field:"dlrRoTpNm", title:"<spring:message code='ser.lbl.dlrRoTp' />", width:100}//자체정의RO유형
            ,{field:"payEndDtFormat", title:"<spring:message code='ser.lbl.payEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.payEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//지불완료시간
        ]
    });
    
     //退款后，退款的时间还是显示收款的时间，而不是实际退款的时间 时间修改  退款时，展示退款时间  收款时展示收款时间  贾明 2018-11-29 
     changRcvCpltDt = function(val,rcvCpltDt,refdDt){
         var returnVal = "";
         
          if(val != null && val != ""){
              if("退款" == val){
                 returnVal  = kendo.toString(refdDt, 'yyyy-MM-dd HH:mm').substring(0,16);
               } else if("收款" == val ){
                returnVal =  kendo.toString(rcvCpltDt, 'yyyy-MM-dd HH:mm');
              } 
           }
           
        return returnVal;
     }
    
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#reciveStatColGroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[4]).css("width","8%");

            $("#gridHeader").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

});
</script>
<!-- //script -->


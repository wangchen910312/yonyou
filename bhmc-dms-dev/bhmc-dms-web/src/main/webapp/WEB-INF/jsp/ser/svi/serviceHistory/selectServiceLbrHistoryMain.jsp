<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12921" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12919" hasPermission="${dms:getPermissionMask('READ')}">
                    <%-- <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button> --%>
                    <button type="button" class="btn_m" id="btnExcelExport2"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12920" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="searchForm">
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
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
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                                <td>
                                    <input type="text" id="sVinNo" maxlength="17" class="form_input upper" data-name="<spring:message code="ser.lbl.vinNo" />" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th><!-- 공임코드 -->
                                <td>
                                    <input type="text" id="sLbrCd" class="form_input"/>
                                </td>

                                <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호  -->
                                <td>
                                    <input type="text" id="sRoDocNo" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- RO일자 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input required type="text" id="sRoFromDt" value="${sRoFromDt}" class="form_datepicker ac"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input required type="text" id="sRoToDt" value="${sRoToDt}" class="form_datepicker ac"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /></th><!-- 차량번호 -->
                                <td>
                                    <input type="text" id="sCarRegNo" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.rpirNm" /></th><!-- 정비명칭 -->
                                <td>
                                    <input type="text" id="sLbrNm" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!-- RO유형-->
                                <td>
                                    <input type="text" id="sRoTp" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roStatus' /></th><!-- RO상태 -->
                                <td>
                                    <input type="text" id="sRoStatCd" class="form_comboBox" >
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 차량소유자 -->
                                <td>
                                    <input type="text" id="sCarOwnerNm" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.lbrTp" /></th><!-- 정비유형-->
                                <td>
                                    <input type="text" id="sLbrTp" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roWrtrNm' /></th><!-- RO발행자 -->
                                <td>
                                    <input type="text" id="sRegUsrNm" class="form_input" >
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.calcEndDt' /></th><!-- 정산완료시간 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sCalcFromDt" value="${sCalcFromDt}" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sCalcToDt" value="${sCalcToDt}" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.tecNm" /></th><!-- 정비사 -->
                                <td>
                                    <input type="text" id="sTecNm" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.crNm" /></th><!-- 캠페인명칭 -->
                                <td>
                                    <input type="text" id="sCrNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.crTp" /></th><!-- 캠페인유형 -->
                                <td>
                                    <input type="text" id="sCrTp" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.payEndDt' /></th><!-- 지불완료시간 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sPayFromDt" value="${sPayFromDt}" class="form_datepicker ac"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sPayToDt" value="${sPayToDt}" class="form_datepicker ac"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </section>
        <div class="table_grid mt5">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <div id="excelProgress" class="demo-section k-content mt10">
            <h4>Excel Export</h4>
            <div id="progressBar"></div>
        </div>
    </div>
</div>
<script type="text/javascript">


var sDlrCd = "${dlrCd}";

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});

//공통코드:정비유형(수리유형)
var lbrTpCdList = [];
<c:forEach var="obj" items="${lbrTpCdList}">
lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdMap = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

//공통코드:RO상태
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
<c:if test="${obj.cmmCd ne '07'}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

//공통코드:캠페인유형(리콜캠페인 구분)
var crTpCdList = [];
<c:forEach var="obj" items="${crTpCdList}">
crTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpCdMap = dms.data.arrayToMap(crTpCdList, function(obj){return obj.cmmCd;});


$(document).ready(function(){

    //수리유형
    crTpCdMap = function(val){
        var resultVal = "";
        if(dms.string.strNvl(val) != ""){
            if(crTpCdMap[val] != undefined)
                resultVal = crTpCdMap[val].cmmCdNm;
        }
        return resultVal;
    };

    //수리유형
    setLbrTpMap = function(val){
        var resultVal = "";
        if(dms.string.strNvl(val) != ""){
            if(lbrTpCdMap[val] != undefined)
                resultVal = lbrTpCdMap[val].cmmCdNm;
        }
        return resultVal;
    };

    // RO유형
    setRoTpCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(roTpCdMap[val] != undefined)
                returnVal = roTpCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    // RO상세
    setRoStatCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(roStatCdMap[val] != undefined)
                returnVal = roStatCdMap[val].cmmCdNm;
        }
        return returnVal;
    };


    // RO상태
    $("#sRoStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
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

    // 수리유형
    $("#sLbrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:lbrTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 캠페인유형
    $("#sCrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:crTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoFromDt}"
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoToDt}"
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

    // 지불완료일자(From)
    $("#sPayFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPayFromDt}"
    });

    // 지불완료일자(To)
    $("#sPayToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPayToDt}"
    });

    $("#progressBar").kendoProgressBar({
        min: 0,
        max: 100,
        type: "percent",
        change: onChange,
        complete: onComplete
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){
            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            var param = $.extend(
                 {"sVinNo":     $("#sVinNo").val()}
                ,{"sRoStatCd":  $("#sRoStatCd").val()}
                ,{"sRoFromDt":  $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sRoToDt":    $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sRoTp":      $("#sRoTp").val()}
                ,{"sCarRegNo":  $("#sCarRegNo").val()}
                ,{"sDriverNm":  $("#sDriverNm").val()}
                ,{"sRoDocNo":   $("#sRoDocNo").val()}
                ,{"sLbrNm":     $("#sLbrNm").val()}
                ,{"sCarOwnerNm":$("#sCarOwnerNm").val()}
                ,{"sLbrCd":     $("#sLbrCd").val()}
                ,{"sLbrTp":     $("#sLbrTp").val()}
                ,{"sRegUsrNm":  $("#sRegUsrNm").val()}
                ,{"sCalcFromDt":$("#sCalcFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sCalcToDt":  $("#sCalcToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sTecNm":     $("#sTecNm").val()}
                ,{"sCrNm":      $("#sCrNm").val()}
                ,{"sCrTp":      $("#sCrTp").val()}
                ,{"sPayFromDt": $("#sPayFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sPayToDt":   $("#sPayToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersLbrHistoryCnt.do' />"
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
                            "beanName"              :"repairOrderService"
                            ,"templateFile"         :"RepairOrderLbrHistList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='ser.menu.roLbrHist' />.xlsx"
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sRoStatCd"            :$("#sRoStatCd").val()
                            ,"sRoFromDt"            :$("#sRoFromDt").val()
                            ,"sRoToDt"              :$("#sRoToDt").val()
                            ,"sRoTp"                :$("#sRoTp").data("kendoExtDropDownList").value()
                            ,"sCarRegNo"            :$("#sCarRegNo").val()
                            ,"sDriverNm"            :$("#sDriverNm").val()
                            ,"sRoDocNo"             :$("#sRoDocNo").val()
                            ,"sLbrNm"               :$("#sLbrNm").val()
                            ,"sCarOwnerNm"          :$("#sCarOwnerNm").val()
                            ,"sLbrCd"               :$("#sLbrCd").val()
                            ,"sLbrTp"               :$("#sLbrTp").data("kendoExtDropDownList").value()
                            ,"sRegUsrNm"            :$("#sRegUsrNm").val()
                            ,"sCalcFromDt"          :$("#sCalcFromDt").val()
                            ,"sCalcToDt"            :$("#sCalcToDt").val()
                            ,"sTecNm"               :$("#sTecNm").val()
                            ,"sCrNm"                :$("#sCrNm").val()
                            ,"sCrTp"                :$("#sCrTp").data("kendoExtDropDownList").value()
                            ,"sPayFromDt"           :$("#sPayFromDt").val()
                            ,"sPayToDt"             :$("#sPayToDt").val()
                            ,"sListType"            :"LH"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    //엑셀버튼
    $("#btnExcelExport2").kendoButton({

        click:function(e){
            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            var param = $.extend(
                    {"sVinNo":     $("#sVinNo").val()}
                   ,{"sRoStatCd":  $("#sRoStatCd").val()}
                   ,{"sRoFromDt":  $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sRoToDt":    $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sRoTp":      $("#sRoTp").val()}
                   ,{"sCarRegNo":  $("#sCarRegNo").val()}
                   ,{"sDriverNm":  $("#sDriverNm").val()}
                   ,{"sRoDocNo":   $("#sRoDocNo").val()}
                   ,{"sLbrNm":     $("#sLbrNm").val()}
                   ,{"sCarOwnerNm":$("#sCarOwnerNm").val()}
                   ,{"sLbrCd":     $("#sLbrCd").val()}
                   ,{"sLbrTp":     $("#sLbrTp").val()}
                   ,{"sRegUsrNm":  $("#sRegUsrNm").val()}
                   ,{"sCalcFromDt":$("#sCalcFromDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sCalcToDt":  $("#sCalcToDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sTecNm":     $("#sTecNm").val()}
                   ,{"sCrNm":      $("#sCrNm").val()}
                   ,{"sCrTp":      $("#sCrTp").val()}
                   ,{"sPayFromDt": $("#sPayFromDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sPayToDt":   $("#sPayToDt").data("kendoExtMaskedDatePicker").value()}
           );

           // 엑셀다운로드 row수 체크
           $.ajax({
               url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersLbrHistoryCnt.do' />"
               ,data:JSON.stringify(param)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,error:function(jqXHR, status, error){
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function(result){

                   var maxRow = 30000;
                   var fileCnt = 0;
                   var downCnt = 0;
                   var totRow = result.total;
                   fileCnt = Math.ceil(totRow / maxRow);
                   //console.log("maxRow : "+maxRow+", totRow : "+totRow+", fileCnt : "+fileCnt);

                   callExcelDownload(0, maxRow, maxRow, fileCnt, downCnt);

               }
           });
        }
    });

    callExcelDownload = function(firstIdx, lastIdx, maxRow, fileCnt, downCnt){
        //showProgressBar();
        dms.ajax.excelProgressExport({
            "beanName"              :"repairOrderService"
            ,"templateFile"         :"RepairOrderLbrHistList_Tpl.xlsx"
            ,"fileName"             :"<spring:message code='ser.menu.roLbrHist' />.xlsx"
            ,"sVinNo"               :$("#sVinNo").val()
            ,"sRoStatCd"            :$("#sRoStatCd").val()
            ,"sRoFromDt"            :$("#sRoFromDt").val()
            ,"sRoToDt"              :$("#sRoToDt").val()
            ,"sRoTp"                :$("#sRoTp").data("kendoExtDropDownList").value()
            ,"sCarRegNo"            :$("#sCarRegNo").val()
            ,"sDriverNm"            :$("#sDriverNm").val()
            ,"sRoDocNo"             :$("#sRoDocNo").val()
            ,"sLbrNm"               :$("#sLbrNm").val()
            ,"sCarOwnerNm"          :$("#sCarOwnerNm").val()
            ,"sLbrCd"               :$("#sLbrCd").val()
            ,"sLbrTp"               :$("#sLbrTp").data("kendoExtDropDownList").value()
            ,"sRegUsrNm"            :$("#sRegUsrNm").val()
            ,"sCalcFromDt"          :$("#sCalcFromDt").val()
            ,"sCalcToDt"            :$("#sCalcToDt").val()
            ,"sTecNm"               :$("#sTecNm").val()
            ,"sCrNm"                :$("#sCrNm").val()
            ,"sCrTp"                :$("#sCrTp").data("kendoExtDropDownList").value()
            ,"sPayFromDt"           :$("#sPayFromDt").val()
            ,"sPayToDt"             :$("#sPayToDt").val()
            ,"sListType"            :"LH"
            ,"firstIndex"           :firstIdx
            ,"lastIndex"            :lastIdx
        }, maxRow, fileCnt, downCnt);
    };

    showProgressBar = function(){
        $("#excelProgress").slideDown();
    };

    hideProgressBar = function(){
        $("#excelProgress").slideUp();
    };


    $("#grid").kendoExtGrid({
        gridId:"G-SER-0206-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersLbrHistory.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var dlrCd;
                        if($("#othDlrHis").checked){
                            dlrCd = "";
                        } else {
                            dlrCd = $("sDlrCd").val();
                        }
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"]        = $("#sVinNo").val();
                        params["sRoStatCd"]     = $("#sRoStatCd").val();
                        params["sRoFromDt"]     = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"]       = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoTp"]         = $("#sRoTp").val();
                        params["sCarRegNo"]     = $("#sCarRegNo").val();
                        params["sDriverNm"]     = $("#sDriverNm").val();
                        params["sRoDocNo"]      = $("#sRoDocNo").val();
                        params["sLbrNm"]        = $("#sLbrNm").val();
                        params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
                        params["sLbrCd"]        = $("#sLbrCd").val();
                        params["sLbrTp"]        = $("#sLbrTp").val();
                        params["sRegUsrNm"]     = $("#sRegUsrNm").val();
                        params["sCalcFromDt"]   = $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCalcToDt"]     = $("#sCalcToDt").data("kendoExtMaskedDatePicker").value();
                        params["sTecNm"]        = $("#sTecNm").val();
                        params["sCrNm"]         = $("#sCrNm").val();
                        params["sCrTp"]         = $("#sCrTp").val();
                        params["sPayFromDt"]    = $("#sPayFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sPayToDt"]      = $("#sPayToDt").data("kendoExtMaskedDatePicker").value();

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
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,resvDocNo:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,roDt:{type:"date"}
                        ,roPrintDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,calcDt:{type:"date"}
                        ,allocStartDt:{type:"date"}
                        ,allocEndDt:{type:"date"}
                        ,exptStartDt:{type:"date"}
                        ,exptEndDt:{type:"date"}
                        ,wrkStartDt:{type:"date"}
                        ,wrkEndDt:{type:"date"}
                        ,qtTestStartDt:{type:"date"}
                        ,qtTestEndDt:{type:"date"}
                        ,rcvCpltDt:{type:"date"}
                        ,payEndDt:{type:"date"}
                        ,roDtFormat:{type:"date"}
                        ,roPrintDtFormat:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                        ,calcDtFormat:{type:"date"}
                        ,allocStartDtFormat:{type:"date"}
                        ,allocEndDtFormat:{type:"date"}
                        ,exptStartDtFormat:{type:"date"}
                        ,exptEndDtFormat:{type:"date"}
                        ,wrkStartDtFormat:{type:"date"}
                        ,wrkEndDtFormat:{type:"date"}
                        ,qtTestStartDtFormat:{type:"date"}
                        ,qtTestEndDtFormat:{type:"date"}
                        ,rcvCpltDtFormat:{type:"date"}
                        ,payEndDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.roPrintDtFormat = kendo.parseDate(elem.roPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            elem.calcDtFormat = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                            elem.allocStartDtFormat = kendo.parseDate(elem.allocStartDt, "<dms:configValue code='dateFormat' />");
                            elem.allocEndDtFormat = kendo.parseDate(elem.allocEndDt, "<dms:configValue code='dateFormat' />");
                            elem.exptStartDtFormat = kendo.parseDate(elem.exptStartDt, "<dms:configValue code='dateFormat' />");
                            elem.exptEndDtFormat = kendo.parseDate(elem.exptEndDt, "<dms:configValue code='dateFormat' />");
                            elem.wrkStartDtFormat = kendo.parseDate(elem.wrkStartDt, "<dms:configValue code='dateFormat' />");
                            elem.wrkEndDtFormat = kendo.parseDate(elem.wrkEndDt, "<dms:configValue code='dateFormat' />");
                            elem.qtTestStartDtFormat = kendo.parseDate(elem.qtTestStartDt, "<dms:configValue code='dateFormat' />");
                            elem.qtTestEndDtFormat = kendo.parseDate(elem.qtTestEndDt, "<dms:configValue code='dateFormat' />");
                            elem.rcvCpltDtFormat = kendo.parseDate(elem.rcvCpltDt, "<dms:configValue code='dateFormat' />");
                            elem.payEndDtFormat = kendo.parseDate(elem.payEndDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
         ,height:350
        ,pageable:true
        ,selectable:"row"
        ,autoBind:true
        ,editable:false
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                        // VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}               // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}                   // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100
                ,attributes :{"class":"ar"}
                ,format:"{0:n0}"
            } // 주행거리
            ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal'/>", width:100
                ,attributes :{"class":"ar"}
                ,format:"{0:n0}"
            } // 인도주행거리
            ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", width:100, attributes:{"class":"ac"}}// RO 상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}                   // RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100,attributes :{"class":"ac"}}
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // RO확인시간
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}                       // 위탁인
            ,{field:"roPrintDtFormat", title:"<spring:message code='ser.lbl.roPrintDt' />",width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // RO프린트시간
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.roUpdtDt' />",width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // RO변경시간
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.roUpdtUsrNm' />", width:100}                       // 변경자
            ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // 정산완료시간
            ,{field:"pkgItemCd", title:"<spring:message code='ser.lbl.pkgItemCd' />", width:80}                      // 패키지품목코드
            ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:80}                              // 정비코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250}                            // 정비항목
            ,{field:"lbrTpNm", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}} // 정비유형
            ,{field:"subBpNm", title:"<spring:message code='ser.lbl.custReqCd' />", width:80, attributes:{"class":"al"}}  //의견코드
            ,{field:"subBpCd", title:"<spring:message code='ser.lbl.checkCd' />", width:80, attributes:{"class":"al"}}  //점검코드
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:100, attributes:{"class":"ar"}, format:"{0:n1}"}  // 수불공임
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 공임단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 공임금액
            ,{field:"lbrDcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 공임할인율
            ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.lbrCdDcAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 공임할인금액
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.whDcAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 공임할인후금액
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:100, attributes:{"class":"al"}}  // 정비사
            ,{field:"tecId", title:"<spring:message code='ser.lbl.staffNo' />", width:100, attributes:{"class":"ac"}}  // 직원번호
            ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100, attributes:{"class":"al"}}  // 정비반조
            ,{field:"wkgrpNo", title:"<spring:message code='ser.lbl.wrkTeamNo' />", width:100, attributes:{"class":"ac"}}  // 반조번호
            ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:100, attributes:{"class":"al"}}  // BAY명칭
            ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:100, attributes:{"class":"ac"}}  // BAY번호
            ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}  // 수리건수
            ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}  // 난의도계수
            ,{field:"allocStatNm", title:"<spring:message code='ser.lbl.assignStat' />", width:100, attributes:{"class":"ac"}}  // 배정상태
            ,{field:"dstbHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 배분공임
            ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:100}  // 정비배정자
            ,{field:"allocStartDtFormat", title:"<spring:message code='ser.lbl.assignStartDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.allocStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 배정시작시간
            ,{field:"allocEndDtFormat", title:"<spring:message code='ser.lbl.assignEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.allocEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 배정완료시간
            ,{field:"exptStartDtFormat", title:"<spring:message code='ser.lbl.preStartDt' />",width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.exptStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 예상시작시간
            ,{field:"exptEndDtFormat", title:"<spring:message code='ser.lbl.preCompDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.exptEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 예상완료시간
            ,{field:"allocRemark", title:"<spring:message code='global.lbl.assignRemark' />", width:150}  // 배정비고
            ,{field:"wrkStatNm", title:"<spring:message code='ser.lbl.processWorkStat' />", width:100, attributes:{"class":"ac"}}  // 정비진도상태
            ,{field:"paintStatNm", title:"<spring:message code='ser.lbl.paintStatus' />", width:100, attributes:{"class":"ac"}}  // 판금페인트상태
            ,{field:"wrkStartDtFormat", title:"<spring:message code='ser.lbl.wrkStartDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.wrkStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 정비시작시간
            ,{field:"wrkEndDtFormat", title:"<spring:message code='ser.lbl.wrkEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.wrkEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 정비완료시간
            ,{field:"pauseCauCd", title:"<spring:message code='ser.lbl.pauseCau' />", width:100, attributes:{"class":"ac"}}  // 정비중단원인
            ,{field:"pauseCauRmk", title:"<spring:message code='ser.lbl.pauseRemark' />", width:150}  // 정비중단비고
            ,{field:"qtTestStatNm", title:"<spring:message code='ser.lbl.qtTestStat' />", width:100, attributes:{"class":"ac"}}  // 품질점검상태
            ,{field:"qtTestStartDtFormat", title:"<spring:message code='ser.lbl.qtTestStartDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.qtTestStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 품질점검시작시간
            ,{field:"qtTestEndDtFormat", title:"<spring:message code='ser.lbl.qtTestEndDt' />",width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.qtTestEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }  // 품질점검완료시간
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100, attributes:{"class":"ac"}}  // 캠페인코드
            ,{field:"crTpNm", title:"<spring:message code='ser.lbl.crTp' />", width:100, attributes:{"class":"ac"}}  // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100, attributes:{"class":"al"}}  // 캠페인명칭
            ,{field:"allocReadyTime", title:"<spring:message code='ser.lbl.assignReadyTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 배정대기사용시간
            ,{field:"allocUseTime", title:"<spring:message code='ser.lbl.assignUseTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 배정사용시간
            ,{field:"rpirSerTime", title:"<spring:message code='ser.lbl.rpirSerTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 정비서비스사용시간
            ,{field:"rpirReadyTime", title:"<spring:message code='ser.lbl.rpirReadyTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 정비대기사용시간
            ,{field:"rpirTime", title:"<spring:message code='ser.lbl.rpirTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 정비조작사용시간
            ,{field:"qtTestReadyTime", title:"<spring:message code='ser.lbl.qtTestReadyTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 품질점검대기사용시간
            ,{field:"qtTestTime", title:"<spring:message code='ser.lbl.qtTestTime' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  // 품질점검사용시간
            ,{field:"onTimeStartYn", title:"<spring:message code='ser.lbl.onTimeStartYn' />", width:100, attributes:{"class":"ac"}}  // On time 작업시작
            ,{field:"onTimeEndYn", title:"<spring:message code='ser.lbl.onTimeEndYn' />", width:100, attributes:{"class":"ac"}}  // On time 작업완료
            ,{field:"delayStartYn", title:"<spring:message code='ser.lbl.delayStartYn' />", width:100, attributes:{"class":"ac"}}  // 지연 작업시작
            ,{field:"delayEndYn", title:"<spring:message code='ser.lbl.delayEndYn' />", width:100, attributes:{"class":"ac"}}  // 지연 작업완료
            ,{field:"rcvCpltDtFormat", title:"<spring:message code='ser.lbl.rcvEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.rcvCpltDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//수납완료일자
            ,{field:"payEndDtFormat", title:"<spring:message code='ser.lbl.payEndDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.payEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//지불완료시간
        ]
    });

    $(".upper").bind("keyup", function(){
        $(this).val($(this).val().toUpperCase());
    });

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#searchForm  col");
            $(colEmt[0]).css("width","8%");
            $(colEmt[1]).css("width","14%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[3]).css("width","14%");
            $(colEmt[4]).css("width","8%");
            $(colEmt[5]).css("width","14%");
            $(colEmt[6]).css("width","8%");
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
    // tablet 사이즈 맞추는거 khskhs 문제시 삭제

    // progress bar 숨김
    hideProgressBar();

});

function onChange(e) {
    //console.log("Change event :: value is " + e.value);
}

function onComplete(e) {
    //console.log("Complete event :: value is " + e.value);
    //$("#startProgress").text("Restart Progress").removeClass("k-state-disabled");
    hideProgressBar();
}

</script>


<style>
.uppercase
 {
  text-transform:uppercase;
 }

    #progressBar {
        display: block;
        width: 100%;
        margin-bottom: 10px;
    }
 </style>
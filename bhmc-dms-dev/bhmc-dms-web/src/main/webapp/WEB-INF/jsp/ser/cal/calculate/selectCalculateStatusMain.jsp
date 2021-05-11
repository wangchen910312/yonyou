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
        <input type="hidden" id="dlrCd" name="dlrCd" value="${dlrCd}"/>
        <!-- 정산현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12960" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13077" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnCalcTotAmt"><spring:message code="ser.btn.calcStats" /></button><!-- 정산통계 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11615" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
<%--                         <button type="button" class="btn_m" id="btnExcelExport2"><spring:message code="ser.btn.excelDownload" />2</button> --%>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11614" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="searchForm">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                            <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <input type="text" id="sCarRegNo" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.calcNo' /><!-- 정산번호 --></th>
                            <td>
                                <input type="text" id="sCalcDocNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                            <td>
                                <input id="sRoTp" data-type="multicombo" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roDt' /></span></th><!-- RO일자 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRoFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRoToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!--  VIN --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.calcWrtrNm" /></th><!-- 정산조작자 -->
                            <td>
                                <input type="text" id="sRegUsrNm" name="sRegUsrNm" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.calcStat" /></th><!-- 서비스정산상태 -->
                            <td>
                                <input id="sCalcStatCd" name="sCalcStatCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.calcEndDt' /><!--  정산완료일자 --></th>
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
                            <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 차량소유자 --></th>
                            <td>
                                <input type="text" id="sCarOwnerNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roWrtrNm' /><!-- RO발행자 --></th>
                            <td>
                                <input type="text" id="sRoUsrNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roDocNo' /><!-- RO번호 --></th>
                            <td>
                                <input type="text" id="sRoDocNo" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.dlrRoTp' /><!-- 자체RO유형 --></th>
                            <td>
                                <input id="sDlrRoTp" class="form_comboBox">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            <div id="excelProgress" class="demo-section k-content mt10">
                <h4>Excel Export</h4>
                <div id="progressBar"></div>
            </div>
            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>
    </div>
</div>

<!-- script -->
<script>

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});

//공통코드:RO상태
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
    <c:if test="${obj.remark1 eq 'calcStatCd'}">
    roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var roStatCdArr = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

//공통코드:서비스정산상태
var calcStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
    <c:if test="${obj.remark1 eq 'calcStatCd'}">
        <c:if test="${obj.cmmCd eq '00' || obj.cmmCd eq '07' }">    // 정산완료(00), 정산취소(07)만 사용
        calcStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    </c:if>
</c:forEach>
var calcStatCdArr = dms.data.arrayToMap(calcStatCdList, function(obj){return obj.cmmCd;});

//공통코드:자체정의RO유형
var dlrRoTpCdList = [];
<c:forEach var="obj" items="${dlrRoTpCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
        dlrRoTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var dlrRoTpCdMap = dms.data.arrayToMap(dlrRoTpCdList, function(obj){return obj.cmmCd;});

// RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//RO상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdArr[val] != undefined)
        returnVal = roStatCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//자체정의RO유형
dlrRoTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(dlrRoTpCdMap[val] != undefined)
        returnVal = dlrRoTpCdMap[val].cmmCdNm;
    }
    return returnVal;
}

$(document).ready(function() {


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
            $("#sRoTp").data("kendoExtMultiSelectDropDownList").refresh();
            $("#sRoTp").data("kendoExtMultiSelectDropDownList").value([]);
            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sCalcToDt").val()) || dms.string.isEmpty($("#sCalcFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='calcEndDt'/><spring:message code='global.info.validation.required' arguments='${calcEndDt}' />");
                return;
            }

            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);

        }
    });

    /** 엑셀 버튼**/
//     $("#btnExcelExport").kendoButton({

//         click:function(e){

//             if( dms.string.isEmpty($("#sCalcToDt").val()) || dms.string.isEmpty($("#sCalcFromDt").val()) ){
//                 dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='calcEndDt'/><spring:message code='global.info.validation.required' arguments='${calcEndDt}' />");
//                 return;
//             }

//             var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
//             if(dms.string.isEmpty(sRoTpList[0])){
//                 sRoTpList.splice(0,1);
//             }

//             var param = $.extend(
//                  {"sCalcFromDt"     : $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value()}
//                 ,{"sCalcToDt"       : $("#sCalcToDt").data("kendoExtMaskedDatePicker").value()}
//                 ,{"sRoTpList"       : sRoTpList}
//                 ,{"sCarRegNo"       : $("#sCarRegNo").val()}
//                 ,{"sRoDocNo"        : $("#sRoDocNo").val()}
//                 ,{"sVinNo"          : $("#sVinNo").val()}
//                 ,{"sRoFromDt"       : $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
//                 ,{"sRoToDt"         : $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
//                 ,{"sRegUsrNm"       : $("#sRegUsrNm").val()}
//                 ,{"sCalcStatCd"     : $("#sCalcStatCd").val()}
//                 ,{"sCarOwnerNm"     : $("#sCarOwnerNm").val()}
//                 ,{"sRoUsrNm"        : $("#sRoUsrNm").val()}
//                 ,{"sCalcDocNo"      : $("#sCalcDocNo").val()}
//                 ,{"sDlrRoTp"        : $("#sDlrRoTp").val()}
//             );

//             엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
//             $.ajax({
//                 url:"<c:url value='/ser/cal/calculate/selectCalculateStatusCnt.do' />"
//                 ,data:JSON.stringify(param)
//                 ,type:'POST'
//                 ,dataType:'json'
//                 ,contentType:'application/json'
//                 ,error:function(jqXHR, status, error){
//                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
//                 }
//                 ,success:function(result){
//                     if(result.total <= 10000){
//                         dms.ajax.excelExport({
//                             "beanName"         : "calculateService"
//                             ,"templateFile"    : "CalculateStatusList_Tpl.xlsx"
//                             ,"fileName"        : "<spring:message code='ser.title.calcualateStatus' />.xlsx"
//                             ,"sCalcFromDt"     : $("#sCalcFromDt").val()
//                             ,"sCalcToDt"       : $("#sCalcToDt").val()
//                             ,"sRoTpList"       : sRoTpList
//                             ,"sCarRegNo"       : $("#sCarRegNo").val()
//                             ,"sRoDocNo"        : $("#sRoDocNo").val()
//                             ,"sVinNo"          : $("#sVinNo").val()
//                             ,"sRoFromDt"       : $("#sRoFromDt").val()
//                             ,"sRoToDt"         : $("#sRoToDt").val()
//                             ,"sRegUsrNm"       : $("#sRegUsrNm").val()
//                             ,"sCalcStatCd"     : $("#sCalcStatCd").data("kendoExtDropDownList").value()
//                             ,"sCarOwnerNm"     : $("#sCarOwnerNm").val()
//                             ,"sRoUsrNm"        : $("#sRoUsrNm").val()
//                             ,"sCalcDocNo"      : $("#sCalcDocNo").val()
//                             ,"sDlrRoTp"        : $("#sDlrRoTp").data("kendoExtDropDownList").value()
//                         });
//                     }else{
//                         dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
//                     }
//                 }
//             });

//         }
//     });

  //엑셀버튼
    $("#btnExcelExport").kendoButton({
        click:function(e){
            if( dms.string.isEmpty($("#sCalcToDt").val()) || dms.string.isEmpty($("#sCalcFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='calcEndDt'/><spring:message code='global.info.validation.required' arguments='${calcEndDt}' />");
                return;
            }

            var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
            if(dms.string.isEmpty(sRoTpList[0])){
                sRoTpList.splice(0,1);
            }

            var calcCancYn = "";
            if($("#sCalcStatCd").val() == "00"){
                calcCancYn = "N";
            }

            var param = $.extend(
                    {"sCalcFromDt"     : $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sCalcToDt"       : $("#sCalcToDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sRoTpList"       : sRoTpList}
                   ,{"sCarRegNo"       : $("#sCarRegNo").val()}
                   ,{"sRoDocNo"        : $("#sRoDocNo").val()}
                   ,{"sVinNo"          : $("#sVinNo").val()}
                   ,{"sRoFromDt"       : $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sRoToDt"         : $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sRegUsrNm"       : $("#sRegUsrNm").val()}
                   ,{"sCalcStatCd"     : $("#sCalcStatCd").val()}
                   ,{"sCarOwnerNm"     : $("#sCarOwnerNm").val()}
                   ,{"sRoUsrNm"        : $("#sRoUsrNm").val()}
                   ,{"sCalcDocNo"      : $("#sCalcDocNo").val()}
                   ,{"sDlrRoTp"        : $("#sDlrRoTp").val()}
                   ,{"sCalcCancYn"     : calcCancYn}
               );

           // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
           $.ajax({
               url:"<c:url value='/ser/cal/calculate/selectCalculateStatusCnt.do' />"
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
                   console.log("maxRow : "+maxRow+", totRow : "+totRow+", fileCnt : "+fileCnt);

                   callExcelDownload(0, maxRow, maxRow, fileCnt, downCnt);

               }
           });
        }
    });

    callExcelDownload = function(firstIdx, lastIdx, maxRow, fileCnt, downCnt){
        var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
        if(dms.string.isEmpty(sRoTpList[0])){
            sRoTpList.splice(0,1);
        }

        var calcCancYn = "";
        if($("#sCalcStatCd").val() == "00"){
            calcCancYn = "N";
        }

        dms.ajax.excelProgressExport({
            "beanName"         : "calculateService"
            ,"templateFile"    : "CalculateStatusList_Tpl.xlsx"
            ,"fileName"        : "<spring:message code='ser.title.calcualateStatus' />.xlsx"
            ,"sCalcFromDt"     : $("#sCalcFromDt").val()
            ,"sCalcToDt"       : $("#sCalcToDt").val()
            ,"sRoTpList"       : sRoTpList
            ,"sCarRegNo"       : $("#sCarRegNo").val()
            ,"sRoDocNo"        : $("#sRoDocNo").val()
            ,"sVinNo"          : $("#sVinNo").val()
            ,"sRoFromDt"       : $("#sRoFromDt").val()
            ,"sRoToDt"         : $("#sRoToDt").val()
            ,"sRegUsrNm"       : $("#sRegUsrNm").val()
            ,"sCalcStatCd"     : $("#sCalcStatCd").data("kendoExtDropDownList").value()
            ,"sCarOwnerNm"     : $("#sCarOwnerNm").val()
            ,"sRoUsrNm"        : $("#sRoUsrNm").val()
            ,"sCalcDocNo"      : $("#sCalcDocNo").val()
            ,"sDlrRoTp"        : $("#sDlrRoTp").data("kendoExtDropDownList").value()
            ,"sCalcCancYn"     : calcCancYn
        }, maxRow, fileCnt, downCnt);
    };
    showProgressBar = function(){
        $("#excelProgress").slideDown();
    };
    hideProgressBar = function(){
        $("#excelProgress").slideUp();
    };

    $(document).on("click", ".linkCalcDocNo", function(e){
        var grid = $("#gridHeader").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.calcMng' />", "<c:url value='/ser/cal/calculate/selectCalculateMain.do'/>?calcDocNo="+selectedVal.calcDocNo, "VIEW-D-10347"); // 정산 Main
    });

    $("#sRoTp").kendoExtMultiSelectDropDownList({
        dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,index:0
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectRoTp = e.dataItem.cmmCd;

            if(dms.string.isEmpty(selectRoTp)){
                $("#sRoTp").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sRoTp").data("kendoExtMultiSelectDropDownList").value([]);
            }
        }
    });

    // 정산상태
    $("#sCalcStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:calcStatCdList
        ,optionLabel:" "
        ,index:0
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

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 자체RO유형
    $("#sDlrRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dlrRoTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 정산통계
    $("#btnCalcTotAmt").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sCalcToDt").val()) || dms.string.isEmpty($("#sCalcFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='calcEndDt'/><spring:message code='global.info.validation.required' arguments='${calcEndDt}' />");
                return;
            }

            var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
            if(dms.string.isEmpty(sRoTpList[0])){
                sRoTpList.splice(0,1);
            }

            var searchParam = {
                "sCarRegNo"         : $("#sCarRegNo").val()
                ,"sRoDocNo"         : $("#sRoDocNo").val()
                ,"sVinNo"           : $("#sVinNo").val()
                ,"sRoTpList"        : sRoTpList
                ,"sRegUsrNm"        : $("#sRegUsrNm").val()
                ,"sCalcStatCd"      : $("#sCalcStatCd").val()
                ,"sCalcFromDt"      : $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value()
                ,"sCalcToDt"        : $("#sCalcToDt").data("kendoExtMaskedDatePicker").value()
                ,"sRoFromDt"        : $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()
                ,"sRoToDt"          : $("#sRoToDt").data("kendoExtMaskedDatePicker").value()
                ,"sCarOwnerNm"      : $("#sCarOwnerNm").val()
                ,"sRoUsrNm"         : $("#sRoUsrNm").val()
                ,"sCalcDocNo"       : $("#sCalcDocNo").val()
                ,"sDlrRoTp"         : $("#sDlrRoTp").val()
            };

            selectRcvStatsPopup = dms.window.popup({
                windowId:"selectRcvStatsPopup"
                ,height:280
                ,width:650
                ,title:"<spring:message code='ser.btn.calcStats' />"
                ,modal:true
                ,content:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculateTotAmtPopup.do'/>"
                    , data:{
                        "searchParam":searchParam
                    }
                }
            });
        }
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000003"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculatesList.do' />"
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

                        params["sCarRegNo"]   = $("#sCarRegNo").val();
                        var sRoTpList = $("#sRoTp").data("kendoExtMultiSelectDropDownList").value();
                        if(dms.string.isEmpty(sRoTpList[0])){
                            sRoTpList.splice(0,1);
                        }
                        params["sRoTpList"]     = sRoTpList;
                        params["sRoDocNo"]    = $("#sRoDocNo").val();
                        params["sVinNo"]      = $("#sVinNo").val();
                        params["sRegUsrNm"]   = $("#sRegUsrNm").val();
                        if($("#sCalcStatCd").val() == "00"){
                            params["sCalcCancYn"] = "N";
                        }
                        params["sCalcStatCd"] = $("#sCalcStatCd").val();
                        params["sCalcFromDt"] = $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCalcToDt"]   = $("#sCalcToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoFromDt"]   = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"]     = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                        params["sRoUsrNm"]    = $("#sRoUsrNm").val();
                        params["sCalcDocNo"]  = $("#sCalcDocNo").val();
                        params["sDlrRoTp"]    = $("#sDlrRoTp").val();

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
                        dlrCd:{type:"string"}
                        ,calcDocNo:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,calcDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,calcPrintDt:{type:"date"}
                        ,calcCancDt:{type:"date"}
                        ,regDt:{type:"date"}
                        ,expcChkDt:{type:"date"}
                        ,calcDtFormat:{type:"date"}
                        ,roDtFormat:{type:"date"}
                        ,calcPrintDtFormat:{type:"date"}
                        ,calcCancDtFormat:{type:"date"}
                        ,regDtFormat:{type:"date"}
                        ,expcChkDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.calcDtFormat = kendo.parseDate(elem.calcDt, "<dms:configValue code='dateFormat' />");
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.calcPrintDtFormat = kendo.parseDate(elem.calcPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.calcCancDtFormat = kendo.parseDate(elem.calcCancDt, "<dms:configValue code='dateFormat' />");
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.expcChkDtFormat = kendo.parseDate(elem.expcChkDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
            ,aggregate:[
                          { field:"lbrCalcAmt", aggregate:"sum" }
                         ,{ field:"parCalcAmt", aggregate:"sum" }
                         ,{ field:"etcCalcAmt", aggregate:"sum" }
                         ,{ field:"lbrDcAmt", aggregate:"sum" }
                         ,{ field:"parDcAmt", aggregate:"sum" }
                         ,{ field:"pointTotAmt", aggregate:"sum" }
                         ,{ field:"bmPointTotAmt", aggregate:"sum" }
                         ,{ field:"bmCupnTotAmt", aggregate:"sum" }
                         ,{ field:"etcTotAmt", aggregate:"sum" }
                         ,{ field:"lastCalcTotAmt", aggregate:"sum" }
                         ,{ field:"wonUnitCutAmt", aggregate:"sum" }
                         ,{ field:"demicPointCutAmt", aggregate:"sum" }
                         ,{ field:"paymAmt", aggregate:"sum" }
                         ,{ field:"rcvAmt", aggregate:"sum" }
                         ,{ field:"npayAmt", aggregate:"sum" }
                         ,{ field:"movingAvgAmt", aggregate:"sum" }
                         ,{ field:"bmCupnAmt", aggregate:"sum" }
                         ,{ field:"bmCupnChangeAmt", aggregate:"sum" }
                      ]
        }
        ,height:480
        ,editable:false
        ,selectable:"row"
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}       // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}          // VIN NO
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}  // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}       // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}  // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", width:100}        // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100
                , attributes :{"class":"ar"}, format:"{0:n0}"}      // 현주행거리
            ,{field:"giRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal' />", width:100
                , attributes :{"class":"ar"}, format:"{0:n0}"} // 인도주행거리
            ,{field:"calcStatNm", title:"<spring:message code='ser.lbl.calcStat' />", width:100
                , attributes:{"class":"ac"}}   // 서비스정산상태
            ,{field:"calcDocNo", title:"<spring:message code='global.lbl.calcNo' />", width:120
                , template:function(dataItem){
                    var spanObj = "<a href='#' class='linkCalcDocNo'>"+dataItem.calcDocNo+"</a>";
                    return spanObj;
                }
            }   // 정산번호
            ,{field:"regDtFormat", title:"<spring:message code='ser.lbl.calcDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 정산일자
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.settlement' />", width:100}   // 정비정산자
            ,{field:"calcPrintDtFormat", title:"<spring:message code='ser.lbl.calcPrintDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.calcPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 정산프린트시간
            ,{field:"calcCancDtFormat", title:"<spring:message code='ser.lbl.calcCancelDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.calcCancDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 정산취소시간
            ,{field:"calcCancNm", title:"<spring:message code='ser.lbl.calcCancNm' />", width:100}           // 취소서비스정산자
            ,{field:"calcCancReasonNm", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100}   // 취소원인
            ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // 정산완료시간
            ,{field:"calcCompUsrNm", title:"<spring:message code='ser.lbl.calcCompNm' />", width:100}           // 정산완료자
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110}                 // RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:80
                , attributes:{"class":"ac"}}                     // RO유형
            ,{field:"dlrRoTpNm", title:"<spring:message code='ser.lbl.dlrRoTp'/>", width:100
                , attributes:{"class":"ac"}}                    // 자체RO유형
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // RO일자
            ,{field:"roUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}    // ro발행자
            ,{field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", width:90
                , attributes:{"class":"ac"}}                    //지불완료여부 (수납)
            ,{field:"calcRemark", title:"<spring:message code='ser.lbl.CalcRemark' />", width:120
                , attributes:{"class":"ar"}}                    //정비정산비고
            ,{field:"lbrCalcAmt", title:"<spring:message code='ser.lbl.lbrCalcAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //공임정산금액
            ,{field:"parCalcAmt", title:"<spring:message code='ser.lbl.parCalcAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //부품정산금액
            ,{field:"etcCalcAmt", title:"<spring:message code='ser.lbl.etcCalcAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //기타정산금액
            ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.lbrCdDcAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //공임할인금액
            ,{field:"parDcAmt", title:"<spring:message code='ser.lbl.parDcAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //부품할인금액
            ,{field:"pointTotAmt", title:"<spring:message code='ser.lbl.dlrPointUseAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //포인트사용금액
            ,{field:"bmPointTotAmt", title:"<spring:message code='ser.lbl.bmPointUseAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //BM포인트사용금액
            ,{field:"bmCupnTotAmt", title:"<spring:message code='ser.lbl.bmCupnUseAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //BM쿠폰사용금액
            ,{field:"etcTotAmt", title:"<spring:message code='ser.lbl.etcSaleAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //기타할인금액
            ,{field:"lastCalcTotAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //정산금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //정산절사금액
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //정산제로금액
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //수납금액 (수납)
            ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //실수금액 (수납)
            ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //미수금액 (수납)
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.realDrivDis' />", width:100
                , attributes :{"class":"ar"}, format:"{0:n0}"}  // 현주행거리
            ,{field:"expcChkDtFormat", title:"<spring:message code='ser.lbl.scheChkDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.expcChkDt, '<dms:configValue code='dateFormat' />')) #"
            }  // 정비예정일자
            ,{field:"expcChkRunDistVal", title:"<spring:message code='ser.lbl.scheChkDist' />", width:100
                , attributes :{"class":"ar"}, format:"{0:n0}"}  // 예정주행거리
            ,{field:"movingAvgAmt", title:"<spring:message code='ser.lbl.movingAvgAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //부품원가금액
            ,{field:"bmCupnNo", title:"<spring:message code='ser.lbl.bmCupnNo' />", width:110}  // BM쿠폰번호
            ,{field:"bmCupnNm", title:"<spring:message code='ser.lbl.bmCupnNm' />", width:110}  // BM쿠폰명칭
            ,{field:"bmAtvtTp", title:"<spring:message code='ser.lbl.bmAtvtTp' />", width:110}  // BM캠페인명칭
            ,{field:"bmCupnAmt", title:"<spring:message code='ser.lbl.cupnApplyAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //BM쿠폰금액
            ,{field:"bmCupnChangeAmt", title:"<spring:message code='sal.lbl.prcChgAmt' />", width:100
                , attributes:{"class":"ar"}, format:"{0:n2}"
                , footerTemplate:"#=kendo.toString(sum,'n2')#" , footerAttributes:{style:"text-align:right;"}}   //BM쿠폰조정금액
            ,{field:"mainCtnoDtTpNm", title:"<spring:message code='ser.lbl.mainContactTime'/>", width:100
                , attributes:{"class":"ac"}} //메인연락시간
            ,{field:"mainCtnoTpNm", title:"<spring:message code='ser.lbl.mainContactMth'/>", width:100
                , attributes:{"class":"ac"}} //메인연락방법
        ]
    });
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#searchForm  col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[1]).css("width","14%");
            $(colEmt[2]).css("width","9%");
            $(colEmt[3]).css("width","15%");
            $(colEmt[4]).css("width","9%");
            $(colEmt[5]).css("width","15%");
            $(colEmt[6]).css("width","9%");
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
<!-- //script -->

<style>
 #progressBar {
        display: block;
        width: 100%;
        margin-bottom: 10px;
    }
 </style>

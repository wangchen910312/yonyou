<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <div class="content_v1">
    <!-- 작업진도관리 -->
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11544" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11543" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11542" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch"">
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
                        <th scope="row"><spring:message code="ser.lbl.carNo" /></th><!--차량번호  -->
                        <td>
                            <input id="sCarRegNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!--RO번호  -->
                        <td>
                            <input type="text" id="sRoDocNo" name="sRoDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!-- RO유형 -->
                        <td>
                            <input id="sRoTp" type="text" class="form_comboBox" style="width:100%">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /></th><!--RO일자  -->
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
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!--VIN  -->
                        <td>
                            <input id="sVinNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!--정비위탁자  -->
                        <td>
                            <input id="sRegUsrNm" type="text" class="form_input" maxlength="30">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.dlvChkStatus" /></th><!--인도체크상태  -->
                        <td>
                            <input id="sDlStatCd" type="text" class="form_comboBox" style="width:100%">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간  -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sExpcDlFromDt" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sExpcDlToDt" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <form id="workProcessForm" method="POST" action="/">
            <!-- RO작업 배정 상세 타이틀 시작 -->
            <div class="header_area">
             </div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="roListGrid"></div>
            </div>

            <div class="header_area">
            </div>
            <div class="table_form form_width_100per">
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
                            <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /></th><!-- 고품처리방식 -->
                            <td>
                                <input type="text" class="form_input form_readonly" id="atqProcTp">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWash" /></th><!-- 세차처리 -->
                            <td>
                                <input type="text" class="form_input form_readonly" id="carWashTp">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.custStbyMth" /></th><!-- 고객대기방식 -->
                            <td>
                                <input type="text" class="form_input form_readonly" id="custWaitMthCd">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.qultTest" /></th><!-- 품질검사 -->
                            <td>
                                <input type="text" value="" class="form_input form_readonly" id="qtTestMthCd">
                            </td>
                        </tr>
                         <tr>
                            <th scope="row"><spring:message code="ser.lbl.goodWillYn" /><!-- GoodWill --></th>
                            <td>
                                <input id="goodwillYn" name="goodwillYn" class="form_input form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.tdrvReq" /></th><!--시승 -->
                            <td>
                                <input class="form_input form_readonly" id="carDriveReqTp">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.chgExpcDlDt" /></th><!-- 수리변경 -->
                            <td>
                                <input id="chgExpcDlDt" type="text" class="form_input form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                            <td>
                                <input type="text" class="form_input form_readonly" id="expcDlDt" style="width:100%">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="workProgress_manage mt5">
                <div class="top_area" style="border-bottom:none;">
                    <ul class="txt_input">
                        <li>
                            <span class="bu_required"><spring:message code="ser.lbl.dlvConfPrsn" /></span><!-- 인도확인자 -->
                            <div class="required_area">
                                <div class="form_search">
                                    <input id="dlChkPrsnNm" name="dlChkPrsnNm" type="text" data-json-obj="true" class="form_input">
                                    <a href="javascript:techmanPopup();"></a>
                                </div>
                                <input id="dlChkPrsnCd" name="dlChkPrsnCd" type="hidden" data-json-obj="true" />
                            </div>
                        </li>
                    </ul>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11541" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_v2" id="btnSave" type="button"><spring:message code="ser.btn.dlvConf" /></button><!-- 인도확인 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11540" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_v2" id="btnDel" type="button"><spring:message code="ser.btn.deliveryCancel" /></button><!-- 인도취소 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11539" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_v2" id="calcLink" type="button"><spring:message code="ser.btn.calculate" /></button><!--정산등록  -->
                        </dms:access>
                    </div>
                </div>
            </div>
            <div class="table_list table_list_v2">
                <table>
                    <caption></caption>
                    <colgroup>
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    <col style="width:12.5%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col"><spring:message code="ser.lbl.deliveryChkItem" /></th><!-- 인도점검항목 -->
                            <th scope="col"><spring:message code="ser.lbl.roComplete" /></th><!-- RO완료 -->
                            <th scope="col"><spring:message code="ser.lbl.oldItemTread" /></th><!-- 고품부품처리 -->
                            <th scope="col"><spring:message code="ser.lbl.qtTestComfirm" /></th><!-- 품질점검확인 -->
                            <th scope="col"><spring:message code="ser.lbl.carWashMatters" /></th><!-- 세차현황 -->
                            <th scope="col"><spring:message code="ser.lbl.servTagReturn" /></th><!-- 서비스태그회수 -->
                            <th scope="col"><spring:message code="ser.lbl.nowRunDist" /></th><!-- 입고주행거리 -->
                            <th scope="col"><span class="bu_required"><spring:message code="ser.lbl.outRunVal" /></span></th><!-- 출고주행거리 -->
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.dlvChkStatus" /></th><!-- 인도점검상태 -->
                            <td>
                                <input id="roEndChkYn" value="Y" class="form_comboBox">
                            </td>
                            <td>
                                <input id="atqProcChkYn" value="Y" class="form_comboBox">
                            </td>
                            <td>
                                <input id="qtChkYn" value="Y" class="form_comboBox">
                            </td>
                            <td>
                                <input id="carWashChkYn" value="Y" class="form_comboBox">
                            </td>
                            <td>
                                <input id="serTagChkYn" value="Y" class="form_comboBox">
                            </td>
                            <td class="readonly_area">
                                <input id="runDistVal" value="" readonly class="form_numeric ar">
                            </td>
                            <td>
                                <input id="giRunDistVal" value="" class="form_numeric ar">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <input type="hidden" id="dlrCd">
            <input type="hidden" id="roGrpNo">
            <input type="hidden" id="roDocNo">
            <input type="hidden" id="carId">
        </form>
    </div>
    <!-- //작업진도관리 -->

    <!-- 우측 메뉴 -->
    <section class="slide_menu">
        <div id="slide-in-share" class="slide-in-share">
            <a id="slide-in-handle" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.guideBoard" /></span></a><!-- 인도현황보드 -->
            <div class="slide-content"><div id="scheduler2"></div></div>
        </div>
    </section>
</div>
<!-- script -->
<script id="deliveryTooltip" type="text/x-kendo-template">
    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#
    #if(model) {#
        <div>
            <div class="carDetail_popup" style="top:-80%; left:5%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            <li><spring:message code="ser.lbl.roWrtrNm" /> : #=dms.string.strNvl(model.driverNm)#</li>
                            <li><spring:message code="ser.lbl.roDt" /> : #=kendo.format('{0:<dms:configValue code='dateFormat' /> HH:mm} ', model.roDt)#</li>
                            <li><spring:message code="ser.lbl.expcDlvDt" /> : #=kendo.format('{0:<dms:configValue code='dateFormat' /> HH:mm} ', model.end)#</li>
                            <li><spring:message code="ser.lbl.roTp" /> : #=model.roTpNm#</li>
                            <li><spring:message code="ser.lbl.roStatus" /> : #=model.roStatNm#</li>
                       </ul>
                    </div>
                </div>
            </div>
        </div>
    #}#
</script>

<!-- 인도칸반에 나타나는  정보 -->
<script id="deliveryInfoView" type="text/x-kendo-template">
    <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
        #=dms.string.strNvl(carRegNo)#
        <br>
        #= title#
    </div>
</script>

<script>

var popupWindow;
var userSearchPopupWin;
var row = 0;
var row1 = 0;

var isTablet = "${isTablet}"+"";
var _height = 0;
if(isTablet == "true"){
    _height = 250;
}else{
    _height = 320;
}

//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO완료여부 Array
var roEndYnCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roEndYnCdList}">
roEndYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO완료여부 Map
var roEndYnCdMap = dms.data.arrayToMap(roEndYnCdList, function(obj){return obj.cmmCd;});

//RO상태 Array
var roStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//RO상태 map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

//페인트상태 Array
var paintStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//페인트상태 map
var paintStatMap = dms.data.arrayToMap(paintStatList, function(obj){return obj.cmmCd;});

//중지원인 Array
var pauseStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pauseStatList}">
pauseStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고객대기방식유형 map
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd;});

//공통코드:시승시운전
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시승시운전 map
var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd;});

//공통코드:품질검사
var qtTestList = [];
<c:forEach var="obj" items="${qtTestList}">
qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//품질검사 map
var qtTestMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd;});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고품처리유형 map
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd;});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량세차유형 map
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd;});

//사용여부 Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//사용여부 map
var useYnCdMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd;});

//차량인도상태 Array
var dlStatCdList = [];
<c:forEach var="obj" items="${dlStatCdList}">
dlStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량인도상태 map
var dlStatCdMap = dms.data.arrayToMap(dlStatCdList, function(obj){return obj.cmmCd;});

//RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdMap[val] != undefined)
            returnVal = roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
            returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//차량인도상태
dlStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(dlStatCdMap[val] != undefined)
            returnVal = dlStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {
    $(".btn_s").each(function(){
        $(this).kendoButton({
            enable:false
        });
    });

    // 예정인도시간
    $("#sExpcDlFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예정인도시간
    $("#sExpcDlToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
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

    // 인도체크상태
    $("#sDlStatCd").kendoExtDropDownList({
        dataSource:dlStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
    });

    // RO완료여부
    $("#roEndChkYn").kendoExtDropDownList({
        dataSource:roEndYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    // 고품처리
    $("#atqProcChkYn").kendoExtDropDownList({
        dataSource:roEndYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    // 품질검사확인
    $("#qtChkYn").kendoExtDropDownList({
        dataSource:roEndYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    // 세차여부
    $("#carWashChkYn").kendoExtDropDownList({
        dataSource:roEndYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    // 서비스태그
    $("#serTagChkYn").kendoExtDropDownList({
        dataSource:roEndYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    /**현재주행거리**/
    $("#giRunDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    /**현재주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#roListGrid').data('kendoExtGrid').dataSource.read();

            $("#workProcessForm").get(0).reset();
            row = 0;
            row1 = 0;
            $(".btn_s_v3").css("background-color","");
            $('[data-for="wrk01"]').each(function(){
                $(this).data("kendoButton").enable(true);
            });
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){
            $("#sCarRegNo").val("");
            $("#sRoDocNo").val("");
            $("#sRoTp").data("kendoExtDropDownList").value("");
            $("#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sRoFromDt}");
            $("#sRoToDt").data("kendoExtMaskedDatePicker").value("${sRoToDt}");
            $("#sVinNo").val("");
            $("#sRegUsrNm").val("");
            $("#sDlStatCd").data("kendoExtDropDownList").value("");
            $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value("");
            $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value("");

            $("#roListGrid").data("kendoExtGrid").dataSource.page(1);

            $("#workProcessForm").get(0).reset();
            row = 0;
            row1 = 0;
            $(".btn_s_v3").css("background-color","");
            $('[data-for="wrk01"]').each(function(){
                $(this).data("kendoButton").enable(true);
            });
        }
    });

    $("#btnSave").kendoButton({
        click:function(e){
            var grid = $("#roListGrid").data("kendoExtGrid");
            var dataItem = grid.dataItem(grid.select());
            row1 = grid.select().index();
            var jsonData = {
                 "dlrCd":$("#dlrCd").val()
                ,"roDocNo":$("#roDocNo").val()
                ,"roGrpNo":$("#roGrpNo").val()
                ,"carId":$("#carId").val()
                ,"dlChkPrsnCd":$("#dlChkPrsnCd").val()
                ,"dlChkPrsnNm":$("#dlChkPrsnNm").val()
                ,"giRunDistVal":$("#giRunDistVal").val()
                ,"roEndChkYn":$("#roEndChkYn").data("kendoExtDropDownList").value()
                ,"atqProcChkYn":$("#atqProcChkYn").data("kendoExtDropDownList").value()
                ,"qtChkYn":$("#qtChkYn").data("kendoExtDropDownList").value()
                ,"carWashChkYn":$("#carWashChkYn").data("kendoExtDropDownList").value()
                ,"serTagChkYn":$("#serTagChkYn").data("kendoExtDropDownList").value()
                ,"dlStatCd":"02"
                ,"roStatCd":"03"
            };

            if(dataItem==null){
                dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                return;
            }
            
            if($("#dlChkPrsnCd").val()==""){
                //dms.notification.info("交车检查者是必输项目");
                dms.notification.info("<spring:message code='ser.lbl.dlvConfPrsn' var='dlChkPrsnNm' /><spring:message code='global.info.required.field' arguments='${dlChkPrsnNm},' />");
                return;
            }
            if($("#giRunDistVal").val()==""||$("#giRunDistVal").val()=="0"){
                //dms.notification.info("离店行驶里程是必输项目");
                dms.notification.info("<spring:message code='ser.lbl.outRunVal' var='giRunDistVal' /><spring:message code='global.info.required.field' arguments='${giRunDistVal},' />");
                $("#giRunDistVal").focus();
                return;
            }
            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
            var giRunDistVal = $("#giRunDistVal").data("kendoExtNumericTextBox").value();

            if(giRunDistVal < runDistVal) {
                //dms.notification.info("离店行驶里程要大于进店行驶里程");
                dms.notification.info("<spring:message code='ser.lbl.outRunVal' var='giRunDistVal' /><spring:message code='ser.lbl.nowRunDist' var='runDistVal' /><spring:message code='global.info.validation.min' arguments='${giRunDistVal},${runDistVal}'/>");
                $("#giRunDistVal").focus();
                return false;
            }
            
            //需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认  进行提醒 JiaMing 2021-3-31 start
            //DMS交车确认，提醒需要APP确认的校验（非阻断）
            if(dataItem.custConfirmYn == 'Y'){
               //.请邀请并指导本工单送修人进入“北京现代APP”-“爱车”-“我要保修”-“保修确认”处选择对应工单进行保修确认；如送修人对保修确认的“客户主诉”、“维修项目”、“配件项目”有疑问的，由经销商负责解释说明。”
                 dms.notification.info("<spring:message code='ser.info.appConfirmInfo'/>");
                //return false;
            }
           //需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认  进行提醒 JiaMing 2021-3-31 end
           
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/updateDelivery.do' />",
                data:JSON.stringify(jsonData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    $("#roListGrid").data("kendoExtGrid").dataSource.read();
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
    });

    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#roListGrid").data("kendoExtGrid");
            row1 = grid.select().index();

            dlvCancelPopup = dms.window.popup({
                windowId:"dlvCancelPopup"
                , title:"<spring:message code='ser.btn.deliveryCancel'/>"   // 인도취소
                , width:400
                , height:200
                , content:{
                    url:"<c:url value='/ser/deliveryCheck/selectDeliveryCheckCancelPopup.do'/>"
                    ,data:{
                        "roDocNo":$("#roDocNo").val()
                        ,"callbackFunc":function(){
                            dms.notification.success("<spring:message code='global.info.success'/>");
                            $("#roListGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                    }
                }
            });
        }
    });

    $("#calcLink").kendoButton({
        click:function(e){
            var grid = $("#roListGrid").data("kendoExtGrid");
            var dataItem = grid.dataItem(grid.select());
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.calcMng'/>", "<c:url value='/ser/cal/calculate/selectCalculateMain.do'/>?roDocNo="+dataItem.roDocNo, "VIEW-D-10347"); // 사전점검현황
        }
    });

    //그리드 설정
    $("#roListGrid").kendoExtGrid({
        gridId:"G-SER-1011-000072"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        params["sRegUsrNm"] = $("#sRegUsrNm").val();
                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlFromDt"] = $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlToDt"] = $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoTp"] = $("#sRoTp").val();
                        params["sDlStatCd"] = $("#sDlStatCd").val();
                        params["sListType"] = "DL";

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
                        ,vinNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,roDt:{type:"date"}
                        ,expcDlDt:{type:"date"}
                        ,dlChkDt:{type:"date"}
                        ,roStatCd:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,change:function(e){

            var dataItem = this.dataItem(this.select());
            $("#roDocNo").val(dataItem.roDocNo);
            $("#resvDocNo").val(dataItem.resvDocNo);
            $("#roGrpNo").val(dataItem.roGrpNo);
            $("#carId").val(dataItem.carId);
            $("#dlrCd").val(dataItem.dlrCd);
            $("#expcDlDt").val(kendo.toString(dataItem.expcDlDt,"<dms:configValue code='dateFormat' /> HH:mm"));
            $("#chgExpcDlDt").val(kendo.toString(dataItem.chgExpcDlDt,"<dms:configValue code='dateFormat' /> HH:mm"));
            $("#diagDocNo").val(dataItem.diagDocNo);
            $("#bayNm").val(dataItem.bayNo);
            $("#driverNm").val(dataItem.driverNm);
            $("#roDt").val(dataItem.roDt);
            $("#dlChkPrsnCd").val(dataItem.dlChkPrsnCd);
            $("#dlChkPrsnNm").val(dataItem.dlChkPrsnNm);
            if(dataItem.giRunDistVal == "0") {
                $("#giRunDistVal").data("kendoExtNumericTextBox").value(dataItem.runDistVal);
            } else {
                $("#giRunDistVal").data("kendoExtNumericTextBox").value(dataItem.giRunDistVal);
            }
            $("#runDistVal").data("kendoExtNumericTextBox").value(dataItem.runDistVal);
            $("#roEndChkYn").data("kendoExtDropDownList").value(dataItem.roEndChkYn);
            $("#atqProcChkYn").data("kendoExtDropDownList").value(dataItem.atqProcChkYn);
            $("#qtChkYn").data("kendoExtDropDownList").value(dataItem.qtChkYn);
            $("#carWashChkYn").data("kendoExtDropDownList").value(dataItem.carWashChkYn);
            $("#serTagChkYn").data("kendoExtDropDownList").value(dataItem.serTagChkYn);
            if(dataItem.custWaitMthCd != null){
                $("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
            }else{
                $("#custWaitMthCd").val("");
            }
            if(dataItem.carDriveReqTp != null){
                $("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
            }else{
                $("#carDriveReqTp").val("");
            }
            if(dataItem.qtTestMthCd != null){
                $("#qtTestMthCd").val(qtTestMap[dataItem.qtTestMthCd].cmmCdNm);
            }else{
                $("#qtTestMthCd").val("");
            }
            if(dataItem.atqProcTp != null){
                $("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
            }else{
                $("#atqProcTp").val("");
            }
            if(dataItem.carWashTp != null){
                $("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
            }else{
                $("#carWashTp").val("");
            }
            if(dataItem.roTp!=null){
                $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);
            }
            if(dataItem.goodwillYn!=null){
                $("#goodwillYn").val(useYnCdMap[dataItem.goodwillYn].cmmCdNm);
            }else{
                $("#goodwillYn").val("");
            }
            if(dataItem.dlStatCd == "01"){

                $('.btn_s').each(function(){
                     $(this).data("kendoButton").enable(false);
                });
                $("#btnSave").data("kendoButton").enable(true);
                $("#dlChkPrsnCd").val("${loginUsrId}");
                $("#dlChkPrsnNm").val("${loginUsrNm}");
                $("#roEndChkYn").data("kendoExtDropDownList").value("Y");
                $("#atqProcChkYn").data("kendoExtDropDownList").value("Y");
                $("#qtChkYn").data("kendoExtDropDownList").value("Y");
                $("#carWashChkYn").data("kendoExtDropDownList").value("Y");
                $("#serTagChkYn").data("kendoExtDropDownList").value("Y");

                $.ajax({
                    url:"<c:url value='/ser/deliveryCheck/partGiQtyCheck.do' />",
                    data:JSON.stringify({"sDocNo":dataItem.roDocNo, "sPreFixId":"RO"}),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result, textStatus) {
                        if(!result){
                            $("#btnSave").data("kendoButton").enable(false);
                            dms.notification.info("<spring:message code='ser.info.giQtyPartNotExist'/>");
                        }
                    }
                });

            } else if(dataItem.dlStatCd == "02") {
                $('.btn_s').each(function(){
                     $(this).data("kendoButton").enable(true);
                });
                $("#btnSave").data("kendoButton").enable(false);
            }
        }
        ,height:_height
        ,selectable:"row"
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            e.sender.select(e.sender.tbody.find("tr")[row1]);
        }
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100}//차량등록번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}//vin번호
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:90//소유자
                ,attributes:{"class":"ac"}
            }
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:90//운전자
                ,attributes:{"class":"ac"}
            }
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", sortable:false, width:80//차종명
                ,attributes:{"class":"al"}
            }
            ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", sortable:false, width:130//모델명
                ,attributes:{"class":"al"}
            }
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", sortable:false, width:100 // 주행거리
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"giRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal' />", sortable:false, width:100    //인도주행거리
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"roStatCd", title:"<spring:message code='ser.lbl.roStatus' />", sortable:false, width:100   //RO상태
                ,attributes:{"class":"ac"}
                ,template:"#=roStatCdGrid(roStatCd)#"
            }
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110  //RO번호
                ,attributes:{"class":"al"}
            }
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:80    //위탁유형
                ,attributes:{"class":"ac"}
                ,template:"#=roTpCdGrid(roTp)#"
            }
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120   //RO일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", sortable:false, width:80    //RO발행자
                ,attributes:{"class":"al"}
            }
            ,{field:"expcDlDt", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:120  //예정인도시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
             ,{field:"dlStatCd", title:"<spring:message code='ser.lbl.dlvChkStatus' />", sortable:false, width:120  //인도체크상태
                 ,attributes:{"class":"ac"}
                 ,template:"#=dlStatGrid(dlStatCd)#"
             }
             ,{field:"dlChkDt", title:"<spring:message code='serl.lbl.dlConfirmDt' />", width:120   //인도확인시간
                 ,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }
             ,{field:"dlChkPrsnNm", title:"<spring:message code='ser.lbl.dlvConfPrsn' />", sortable:false, width:80 //인도체크자
                 ,attributes:{"class":"al"}
             }
        ]

    });

    if(isTablet == "true"){
        _height = 250;
        if(window.matchMedia('(max-width:1024px)').matches){
            $("#roListGrid").parents(".table_grid").attr("style","width:938px !important; max-width:938px !important");
        }
    }else{
        _height = 320;
    }

});


var tecSearchPopup;
techmanPopup = function() {
    tecSearchPopup = dms.window.popup({
        windowId:"teckManFnSearchWin"
        , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
        , content:{
            url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
            , data:{
                "autoBind":true
                , "callbackFunc":function(jsonObj) {

                    if(jsonObj.length > 0) {
                        $("#dlChkPrsnCd").val(jsonObj[0].tecId);
                        $("#dlChkPrsnNm").val(jsonObj[0].tecNm);
                    }
                }
            }
        }
    });
};

var sysDate = new Date("<c:out value='${sysDate}' />");

var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";
var toDay = new Date();

var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

var slide2 = kendo.fx($("#slide-in-share")).slideIn("right"),

    visible2 = true;

    $("#scheduler2").kendoScheduler({
        date:sysDate
       ,startTime:new Date(startTime)
       ,endTime:new Date(endTime)
       ,editable:false
       ,footer:false
       ,allDaySlot:false
       ,eventTemplate:$("#deliveryInfoView").html()
       ,views:[
           { type:"day" }
       ]
        ,navigate:function(e){
            toDay = new Date(e.date);
            $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
            $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
            $("#scheduler2").data("kendoScheduler").dataSource.read();
        }
       ,dataSource:{
           batch:true
           ,transport:{
               read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectDeliveryKanban.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       params["sExpcDlFromDt"] = kendo.parseDate(kendo.toString(toDay, "yyyy-MM-dd"));
                       params["sRegUsrNm"] = $("#tecNm").val();

                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               data:"data"
               ,total:"total"
               ,model:{
                   id:"roDocNo"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,roDocNo:{type:"string"}
                       ,start:{type:"date", from:"expcDlStartDt" }
                       ,end:{type:"date", from:"expcDlDt" }
                       ,roGrpNo:{type:"string"}
                       ,tecId:{type:"string"}
                       ,tecNm:{type:"string" }
                       ,title:{type:"string", from:"roDocNo"}
                       ,vinNo:{type:"string"}
                       ,carOwnerNm:{type:"string"}
                       ,grpNo:{type:"string"}
                   }
               }
           }
       }
       ,group:{
           resources:["DL"]
       }
       ,resources:[
           {
               field:"grpNo"
               ,name:"DL"
               ,title:"DL"
               ,dataTextField:""
               ,dataValueField:"grpNo"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/ser/ro/repairOrder/selectDeliveryKanbanRows.do' />"
                           ,dataType:"json"
                           ,type:"POST"
                           ,contentType:"application/json"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               return kendo.stringify(params);

                           }else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       data:"data"
                       ,total:"total"
                       ,model:{
                           id:"grpNo"
                           ,fields:{
                                grpNo:{type:"string"}
                           }
                       }
                   }
               }
           }
       ]
       ,dataBinding:function() {
           toDay = new Date($("#scheduler2").data("kendoScheduler")._model.selectedDate);
           $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
           $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
       }
       ,dataBound:function() {
           $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
           $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
       }
    });

    var scheduler2 = $("#scheduler2").data("kendoScheduler");
    $("#scheduler2 > .k-scheduler-toolbar ul > li:nth-child(4)").after('<span class="scheduler_search_form"><spring:message code="ser.lbl.roWrtrNm" /><div id="tecSearch" class="form_search" style="float:right;width:120px;height:23px;margin-left:10px;"><input type="text" id="tecNm" name="tecNm" class="form_input" /><a href="#" onclick="userSearch(\'scheduler2\',\'tecNm\')" ></a></span>');
    $("#slide-in-handle").click(function(e) {

         scheduler2.dataSource.read();
         $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
         $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
         $("#scheduler2 > .k-scheduler-toolbar ul:nth-child(2)").hide();      // day button delete
         scheduler2.dataSource.read();
         $("#scheduler2 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
         $("#scheduler2 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  "+ formatToday);

         scheduler2.element.height($(".slide_menu").height()-23);
         $(".slide-in-share").removeClass("z-index-top");
         $(this).parent().addClass("z-index-top");

         if (visible2) {
             slide2.reverse();
         } else {
             slide2.play();
         }
         visible2 = !visible2;
         e.preventDefault();
     });

     // 스케줄러 툴팁
     $("#scheduler2").kendoTooltip({
         filter:".k-event",
         position:"top",
         width:200,
         height:60,
         content:kendo.template($('#deliveryTooltip').html())
     });

     //엑셀버튼
     $("#btnExcelExport").kendoButton({

         click:function(e){

             var param = $.extend(
                  {"sCarRegNo"           :$("#sCarRegNo").val()}
                 ,{"sRoDocNo"            :$("#sRoDocNo").val()}
                 ,{"sRoTp"               :$("#sRoTp").val()}
                 ,{"sRoFromDt"           :$("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sRoToDt"             :$("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sVinNo"              :$("#sVinNo").val()}
                 ,{"sRegUsrNm"           :$("#sRegUsrNm").val()}
                 ,{"sDlStatCd"           :$("#sDlStatCd").val()}
                 ,{"sExpcDlFromDt"       :$("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sExpcDlToDt"         :$("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value()}
             );

             // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
             $.ajax({
                 url:"<c:url value='/ser/ro/repairOrder/selectDeliveryCheckCnt.do' />"
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
                             "beanName"             :"deliveryCheckService"
                             ,"templateFile"        :"DeliveryCheckStatusList_Tpl.xlsx"
                             ,"fileName"            :"<spring:message code='ser.menu.deliveryChk' />.xlsx"
                             ,"sCarRegNo"           :$("#sCarRegNo").val()
                             ,"sRoDocNo"            :$("#sRoDocNo").val()
                             ,"sRoTp"               :$("#sRoTp").data("kendoExtDropDownList").value()
                             ,"sRoFromDt"           :$("#sRoFromDt").val()
                             ,"sRoToDt"             :$("#sRoToDt").val()
                             ,"sVinNo"              :$("#sVinNo").val()
                             ,"sRegUsrNm"           :$("#sRegUsrNm").val()
                             ,"sDlStatCd"           :$("#sDlStatCd").data("kendoExtDropDownList").value()
                             ,"sExpcDlFromDt"       :$("#sExpcDlFromDt").val()
                             ,"sExpcDlToDt"         :$("#sExpcDlToDt").val()
                             ,"sDlrCd"              :$("#dlrCd").val()
                             ,"sListType"           :"DL"
                         });
                     }else{
                         dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                     }
                 }
             });
         }
     });

     userSearch = function(schedulerId , fieldNm){
         techManSearchPopupWin = dms.window.popup({
             windowId:"techManSearchPopupWin"
             ,height:530
             ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
             ,content:{
                 url:"<c:url value='/ser/cmm/popup/selectTechManSearchPopup.do'/>"
                 ,data:{
                     "autoBind":true
                     ,"selectable":"single"
                     ,"closeAfterSelect":true
                     ,"callbackFunc":function(data){
                         if(data.length > 0){

                             $("#"+fieldNm).val(data[0].tecNm);//ser.lbl.preChkNm
                             $("#"+schedulerId).data("kendoScheduler").dataSource.read();

                         }
                     }
                 }
             }
         });
     };

</script>
<!-- 인도현황 보드 -->

<style>
    #slide-in-share { width:800px; margin-right:-800px;}
    #scheduler2 .k-scheduler-content .k-scheduler-table, #scheduler1 .k-scheduler-header {
           width: 1360px
    }
    #scheduler2 > .k-scheduler-layout {
    table-layout: fixed;
    }

    #scheduler2 > .k-scheduler-layout > tbody > tr > td:first-child {
        width: 100px;
    }
    #scheduler2 .k-scheduler-table td {
        height: 22px !important;
    }
</style>
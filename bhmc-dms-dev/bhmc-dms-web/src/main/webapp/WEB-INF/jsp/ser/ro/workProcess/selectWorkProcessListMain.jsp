<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 작업진도조회 -->
<div id="resizableContainer">
    <div class="content">
        <div class="header_area">
            <div class="btn_left">
                    <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
            </div>
            <div class="btn_right">
                    <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                <dms:access viewId="VIEW-D-11687" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
            </div>
        </div>

         <!-- 조회 조건 시작 -->
        <form id="form">
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup id="wrokProcListColGroup">
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
                                <input type="text" class="form_input" id="sCarRegNo">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roDocNo' /><!-- RO번호 --></th>
                            <td>
                                <input type="text" id="sRoDocNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                            <td>
                                <input id="sRoTp" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.roDt" /></th><!--RO시간  -->
                            <td>
                               <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRoFromDt" class="form_datepicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRoToDt" class="form_datepicker ac"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- VIN NO --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 차량소유자 --></th>
                            <td>
                                <input type="text" id="sCarOwnerNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.driver' /><!-- 운전자 --></th>
                            <td>
                                <input id="sDriverNm" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.expcDlvDt' /></th><!-- 예정인도시간 -->
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
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.assignEndDt' /></th><!-- 배정완료시간 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sAssignFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sAssignToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.wrkEndDt' /></th><!-- 수리완료시간 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sWorkFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sWorkToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.qtTestEndDt' /></th><!-- 품질점검완료시간 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sQtTestFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sQtTestToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='serl.lbl.dlConfirmDt' /></th><!-- 인도확인시간 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sDlChkFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sDlChkToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        <!-- RO작업 배정 상세 타이틀 시작 -->
        <div class="header_area">
         </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="roListGrid" class="grid"></div>
        </div>

        <div class="header_area">
        </div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup id="wrokProcListColGroup2">
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
                            <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /><!-- 고부품처리방식 --></th>
                            <td class="readonly_area">
                                <input id="atqProcTp" name="atqProcTp" class="form_comboBox" data-json-obj="true" value="" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWash" /><!-- 세차요청 --></th>
                            <td class="readonly_area">
                                <input id="carWashTp" name="carWashTp" class="form_comboBox" data-json-obj="true" value="" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.custStbyMth" /><!-- 고객대기방식 --></th>
                            <td class="readonly_area">
                                <input id="custWaitMthCd" name="custWaitMthCd" class="form_comboBox" data-json-obj="true" value="" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.qtTest" /><!-- 품질검사 --></th>
                            <td class="readonly_area">
                                <input id="qtTestMthCd" name="qtTestMthCd" class="form_comboBox" data-json-obj="true" value="" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.goodWillYn" /><!-- GoodWill --></th>
                            <td class="readonly_area">
                                <input id="goodwillYn" name="goodwillYn" class="form_comboBox" data-json-obj="true" value="" readonly>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.tdrvReq" /><!-- 시승요청 --></th>
                            <td class="readonly_area">
                                <input id="carDriveReqTp" name="carDriveReqTp" class="form_comboBox" data-json-obj="true" value="" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.chgExpcDlDt" /></th><!-- 변경된예정인도시간 -->
                            <td>
                                <div class="form_search">
                                   <b><input id="chgExpcDlDt" name="chgExpcDlDt" class="form_input" data-json-obj="true" style="color:#0c7dd9; font-weight:bold;" readonly/></b>
                                    <a href="javascript:pausePopupSearch();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                            <td class="readonly_area">
                                <input id="expcDlDt" name="expcDlDt" class="form_datetimepicker" data-json-obj="true" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <input type="hidden" id="dlrCd">
            <input type="hidden" id="roDocNo">
            <input type="hidden" id="lineNo">
        </form>
        <!-- RO작업 배정 상세 타이틀 시작 -->

        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="repairHistoryGrid"></div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid" style="display:none">
            <div id="workProcessGrid"></div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid" style="display:none">
            <div id="workHisGrid"></div>
        </div>
    </div>
</div>
<!-- //작업진도관리 -->


<!-- script -->
<script>
//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO상태 Array
var roStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//RO상태 map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd});

//진행상태 Array
var progressStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//페인트상태 Array
var paintStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>


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



var isTablet="${isTablet}";
var _selectable="";
(isTablet == "true" ) ?  _selectable="single" :  _selectable="rows";

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});
var popupWindow;
var pauseCausePopup;
var repairHistroyInfoSearchPopup;
var roDocNo;


$(document).ready(function() {


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            $('#roListGrid').data('kendoExtGrid').dataSource.read();
            $('#workHisGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#form").get(0).reset();
            $("#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sRoFromDt}");
            $("#sRoToDt").data("kendoExtMaskedDatePicker").value("${sRoToDt}");
            $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value("");
            $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value("");
            $("#roListGrid").data("kendoExtGrid").dataSource.page(1);
            $("#sAssignFromDt").data("kendoExtMaskedDatePicker").value("");
            $("#sAssignToDt").data("kendoExtMaskedDatePicker").value("");
            $("#sWorkFromDt").data("kendoExtMaskedDatePicker").value("");
            $("#sWorkToDt").data("kendoExtMaskedDatePicker").value("");
            $("#sQtTestFromDt").data("kendoExtMaskedDatePicker").value("");
            $("#sQtTestToDt").data("kendoExtMaskedDatePicker").value("");
            $("#sDlChkFromDt").data("kendoExtMaskedDatePicker").value("");
            $("#sDlChkToDt").data("kendoExtMaskedDatePicker").value("");
        }
    });

        /** 엑셀 버튼**/
    $("#btnExcelExport").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            var param = $.extend(
                 {"sCarRegNo"        : $("#sCarRegNo").val()}
                ,{"sVinNo"           : $("#sVinNo").val()}
                ,{"sCarOwnerNm"      : $("#sCarOwnerNm").val()}
                ,{"sExpcDlFromDt"    : $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sExpcDlToDt"      : $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sRoDocNo"         : $("#sRoDocNo").val()}
                ,{"sRoTp"            : $("#sRoTp").val()}
                ,{"sDriverNm"        : $("#sDriverNm").val()}
                ,{"sRoFromDt"        : $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sRoToDt"          : $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sAssignFromDt"    : $("#sAssignFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sAssignToDt"      : $("#sAssignToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sWorkFromDt"      : $("#sWorkFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sWorkToDt"        : $("#sWorkToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sQtTestFromDt"    : $("#sQtTestFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sQtTestToDt"      : $("#sQtTestToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sDlChkFromDt"     : $("#sDlChkFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sDlChkToDt"       : $("#sDlChkToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectWorkProcessListCnt.do' />"
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
                            "beanName"          : "repairOrderService"
                            ,"templateFile"     : "WorkProcessListMain_Tpl.xlsx"
                            ,"fileName"         : "<spring:message code='ser.menu.wkProcStat' />.xlsx"
                            ,"sCarRegNo"        : $("#sCarRegNo").val()
                            ,"sVinNo"           : $("#sVinNo").val()
                            ,"sCarOwnerNm"      : $("#sCarOwnerNm").val()
                            ,"sExpcDlFromDt"    : $("#sExpcDlFromDt").val()
                            ,"sExpcDlToDt"      : $("#sExpcDlToDt").val()
                            ,"sRoDocNo"         : $("#sRoDocNo").val()
                            ,"sRoTp"            : $("#sRoTp").data("kendoExtDropDownList").value()
                            ,"sDriverNm"        : $("#sDriverNm").val()
                            ,"sRoFromDt"        : $("#sRoFromDt").val()
                            ,"sRoToDt"          : $("#sRoToDt").val()
                            ,"sAssignFromDt"    : $("#sAssignFromDt").val()
                            ,"sAssignToDt"      : $("#sAssignToDt").val()
                            ,"sWorkFromDt"      : $("#sWorkFromDt").val()
                            ,"sWorkToDt"        : $("#sWorkToDt").val()
                            ,"sQtTestFromDt"    : $("#sQtTestFromDt").val()
                            ,"sQtTestToDt"      : $("#sQtTestToDt").val()
                            ,"sDlChkFromDt"     : $("#sDlChkFromDt").val()
                            ,"sDlChkToDt"       : $("#sDlChkToDt").val()
                            ,"sListType"        : "WP"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
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

    // 배정완료시간
    $("#sAssignFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 배정완료시간
    $("#sAssignToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 수리완료시간
    $("#sWorkFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 수리완료시간
    $("#sWorkToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 품질점검완료시간
    $("#sQtTestFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 품질점검완료시간
    $("#sQtTestToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 인도확인시간
    $("#sDlChkFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 인도확인시간
    $("#sDlChkToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel : " "
        ,index:0
    });


    //RO상태
    $("#sRoStatCd").kendoExtDropDownList({
        dataSource:roStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
            ,optionLabel : " "
        ,index:0
    });

    // 고객대기방식
    $("#custWaitMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:custWaitMthCdList
        ,optionLabel : " "
        ,index:0
    });

    // 예정인도시간
    $("#expcDlDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
    });

    // 고부품처리방식
    $("#atqProcTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:atqProcTpCdList
        ,optionLabel : " "
        ,index:0
    });

    // 세차요청
    $("#carWashTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carWashTpCdList
        ,optionLabel : " "
        ,index:0
    });

    // 시승요청
    $("#carDriveReqTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carDriveReqTpCdList
        ,optionLabel : " "
        ,index:0
    });

    // 품질검사
    $("#qtTestMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:qtTestMthCdList
        ,optionLabel : " "
        ,index:0
    });

    // Goodwill
    $("#goodwillYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnCdList
        ,optionLabel : " "
        ,index:0
    });

    /* 작업중지 이력 팝업 */
    pausePopupSearch = function(){
        pauseCausePopup = dms.window.popup({
            windowId:"pauseCausePopup"
            ,title:"<spring:message code='ser.btn.lbrStop' />"   // 작업중지
            ,content:{
                url:"<c:url value='/ser/ro/workProcess/selectPauseCausePopup.do'/>"
                ,data:{
                    "roDocNo" :$("#roDocNo").val()
                    ,"roTp"    : $("#roTp").val()
                    ,"expcDlDt": $("#chgExpcDlDt").val()
                    ,"sWrkStopYn"  : "Y"
                    ,"callbackFunc":function(data){

                    }
                }
            }
            ,height:430
            ,width:900
        });

    }


    //그리드 설정
    $("#roListGrid").kendoExtGrid({
        gridId:"G-SER-1011-000098"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderInfoList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarRegNo"]     = $("#sCarRegNo").val();
                        params["sVinNo"]        = $("#sVinNo").val();
                        params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
                        params["sExpcDlFromDt"] = $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlToDt"]   = $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoDocNo"]      = $("#sRoDocNo").val();
                        params["sRoTp"]         = $("#sRoTp").val();
                        params["sDriverNm"]     = $("#sDriverNm").val();
                        params["sRoFromDt"]     = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"]       = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sAssignFromDt"] = $("#sAssignFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sAssignToDt"]   = $("#sAssignToDt").data("kendoExtMaskedDatePicker").value();
                        params["sWorkFromDt"]   = $("#sWorkFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sWorkToDt"]     = $("#sWorkToDt").data("kendoExtMaskedDatePicker").value();
                        params["sQtTestFromDt"] = $("#sQtTestFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sQtTestToDt"]   = $("#sQtTestToDt").data("kendoExtMaskedDatePicker").value();
                        params["sDlChkFromDt"]  = $("#sDlChkFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sDlChkToDt"]    = $("#sDlChkToDt").data("kendoExtMaskedDatePicker").value();

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
                        ,roDt:{type:"date"}
                        ,expcDlDt:{type:"date"}
                        ,dlChkDt:{type:"date"}
                        ,allocStartDt:{type:"date"}
                        ,allocEndDt:{type:"date"}
                        ,wrkStartDt:{type:"date"}
                        ,wrkEndDt:{type:"date"}
                        ,qtTestStartDt:{type:"date"}
                        ,qtTestEndDt:{type:"date"}
                        ,roDtFormat:{type:"date"}
                        ,expcDlDtFormat:{type:"date"}
                        ,dlChkDtFormat:{type:"date"}
                        ,allocStartDtFormat:{type:"date"}
                        ,allocEndDtFormat:{type:"date"}
                        ,wrkStartDtFormat:{type:"date"}
                        ,wrkEndDtFormat:{type:"date"}
                        ,qtTestStartDtFormat:{type:"date"}
                        ,qtTestEndDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.expcDlDtFormat = kendo.parseDate(elem.expcDlDt, "<dms:configValue code='dateFormat' />");
                            elem.allocStartDtFormat = kendo.parseDate(elem.allocStartDt, "<dms:configValue code='dateFormat' />");
                            elem.allocEndDtFormat = kendo.parseDate(elem.allocEndDt, "<dms:configValue code='dateFormat' />");
                            elem.wrkStartDtFormat = kendo.parseDate(elem.wrkStartDt, "<dms:configValue code='dateFormat' />");
                            elem.wrkEndDtFormat = kendo.parseDate(elem.wrkEndDt, "<dms:configValue code='dateFormat' />");
                            elem.qtTestStartDtFormat = kendo.parseDate(elem.qtTestStartDt, "<dms:configValue code='dateFormat' />");
                            elem.qtTestEndDtFormat = kendo.parseDate(elem.qtTestEndDt, "<dms:configValue code='dateFormat' />");
                            elem.dlChkDtFormat = kendo.parseDate(elem.dlChkDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,editable:false
        ,selectable:_selectable
        ,change:function(e){

            var dataItem = this.dataItem(this.select());
            $("#roDocNo").val(dataItem.roDocNo);
            $("#resvDocNo").val(dataItem.resvDocNo);
            $("#roGrpNo").val(dataItem.roGrpNo);
            $("#dlrCd").val(dataItem.dlrCd);

            $("#custWaitMthCd").data("kendoExtDropDownList").value(dataItem.custWaitMthCd);
            $("#atqProcTp").data("kendoExtDropDownList").value(dataItem.atqProcTp);
            $("#carWashTp").data("kendoExtDropDownList").value(dataItem.carWashTp);
            $("#carDriveReqTp").data("kendoExtDropDownList").value(dataItem.carDriveReqTp);
            $("#qtTestMthCd").data("kendoExtDropDownList").value(dataItem.qtTestMthCd);
            $("#goodwillYn").data("kendoExtDropDownList").value(dataItem.goodwillYn);
            $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(dataItem.expcDlDt);
            $("#chgExpcDlDt").val(kendo.toString(kendo.parseDate(dataItem.chgExpcDlDt) , "<dms:configValue code='dateFormat' /> HH:mm") );
            $("#allocStatCd").val(dataItem.allocStatCd);
            $("#goodwillStatCd").val(dataItem.goodwillStatCd);

            roDocNo = dataItem.roDocNo;
            repairHistoryGrid.dataSource.read();
        }
        ,height:300
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100}//차량등록번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}//빈번호
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}// 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:90}//수리 의뢰자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}// 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}// 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}                     // 현주행거리
            ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.totRunDistVal' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"}               // 실제주행거리
            ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", width:100, attributes:{"class":"ac"}}   // RO상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:130}//RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100, attributes:{"class":"ac"}}     // RO유형
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}                          // 위탁인
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDate' />", width:150//RO일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,hidden:true
            }
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:120                                   //ro확인일자
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"expcDlDtFormat", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:140                                                      //예정인도시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.expcDlDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"roRemark", title:"<spring:message code='ser.lbl.roRemark' />", width:100}                            // RO비고
            ,{field:"wrkStatNm", title:"<spring:message code='ser.lbl.repairSerStat' />", width:100, attributes:{"class":"ac"}}         // 수리서비스상태
            ,{field:"rwrkCd", title:"<spring:message code='ser.lbl.reworkYn' />", width:100, attributes:{"class":"ac"}}       // 리워크여부
            ,{field:"dlStatNm", title:"<spring:message code='ser.lbl.dlvChkStatus' />", width:100, attributes:{"class":"ac"}} // 인도체크상태
            ,{field:"dlChkDtFormat", title:"<spring:message code='serl.lbl.dlConfirmDt' />", width:140                              // 인도확인시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.dlChkDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"allocStatNm", title:"<spring:message code='ser.lbl.assignStat' />", width:100, attributes:{"class":"ac"}} // 배정상태
            ,{field:"allocStartDtFormat", title:"<spring:message code='ser.lbl.assignStartDt' />", width:140                         // 배정시작시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.allocStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"allocEndDtFormat", title:"<spring:message code='ser.lbl.assignEndDt' />", width:140                             // 배정완료시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.allocEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"wrkStatNm", title:"<spring:message code='ser.lbl.processWorkStat' />", width:100, attributes:{"class":"ac"}} // 진도상태
            ,{field:"wrkStartDtFormat", title:"<spring:message code='ser.lbl.wrkStartDt' />", width:140                              // 작업시작시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.wrkStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"wrkEndDtFormat", title:"<spring:message code='ser.lbl.wrkEndDt' />", width:140                                  // 작업완료시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.wrkEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"qtTestStatNm", title:"<spring:message code='ser.lbl.qtTestStat' />", width:100, attributes:{"class":"ac"}} // 품질점검상태
            ,{field:"qtTestStartDtFormat", title:"<spring:message code='ser.lbl.qtTestStartDt' />", width:140                         // 품질점검시작시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.qtTestStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"qtTestEndDtFormat", title:"<spring:message code='ser.lbl.qtTestEndDt' />", width:140                             // 품질점검완료시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.qtTestEndDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
        ]

    });

    //그리드 설정
    $("#repairHistoryGrid").kendoExtGrid({
        gridId:"G-SER-1107-165301"
        ,dataSource:{
         transport:{
            read:{
                url:"<c:url value='/ser/ro/workProcess/selectRpirHisReturns.do' />"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    params["sRoDocNo"] = roDocNo;

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
                     rnum:{type:"number"}
                    ,rpirDt:{type:"date"}
                    ,rpirDtFormat:{type:"date"}
                    ,saNm:{type:"string"}
                    ,rpirCd:{type:"string"}
                    ,rpirNm:{type:"string"}
                    ,wrkStatNm:{type:"string"}
                }
            }
            ,parse:function(d) {
                if(d.data){
                    $.each(d.data, function(idx, elem) {
                        elem.rpirDtFormat = kendo.parseDate(elem.rpirDt, "<dms:configValue code='dateFormat' />");
                    });
                }
                return d;
            }
         }
        }
        ,pageable:false
        ,editable:false
        ,appendEmptyColumn:false
        ,height:200
        ,selectable:"row"
        ,columns:[
              {field:"rpirDtFormat", title:"<spring:message code='ser.lbl.rpirHisDt' />", width:140
                  ,attributes:{"class":"ac tooltip-enabled"}
                  ,template:"#= dms.string.strNvl(kendo.toString(data.rpirDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
              }//조작일자
             ,{field:"saNm", title:"<spring:message code='ser.lbl.serWrtrNm' />", width:80, attributes:{"class":"al"}}//정비조작자
             ,{field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes:{"class":"al"}}//공임코드
             ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250, attributes:{"class":"al"}}//정비명칭
             ,{field:"wrkStatNm", title:"<spring:message code='ser.lbl.serOperation' />", width:80, attributes:{"class":"ac"}}//정비조작
        ]
    });

    var repairHistoryGrid = $("#repairHistoryGrid").data("kendoExtGrid");

    //그리드 설정
    $("#workProcessGrid").kendoExtGrid({
        gridId:"G-SER-1011-000099"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sRoDocNo"] = $("#roDocNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"lineNo"
                    ,fields:{
                        dlrCd:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,lineNo:{type:"string"}
                        ,bayNo:{type:"string"}
                        ,bayNm:{type:"string"}
                        ,rpirTp:{type:"string", editable:false}
                        ,rpirCd:{type:"string", editable:false}
                        ,rpirNm:{type:"string", editable:false}
                        ,rpirDstinCd:{type:"string", editable:false}
                        ,wrkStatCd:{type:"string",defaultValue:""}
                        ,qtTestCd:{type:"string"}
                        ,carWashStatCd:{type:"string"}
                        ,qtTestStatCd:{type:"string"}
                        ,paintStatCd:{type:"string"}
                        ,wrkStartDt:{type:"date"}
                        ,wrkEndDt:{type:"date"}
                        ,planHm:{type:"number", editable:false}
                    }
                }
            }
        }
        ,change:function(e){
               var dataItem = this.dataItem(this.select());
               $("#dlrCd").val(dataItem.dlrCd)
               $("#roDocNo").val(dataItem.roDocNo)
               $("#lineNo").val(dataItem.lineNo)
               $("#workHisGrid").data("kendoExtGrid").dataSource.read();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,editable :false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:_selectable
        ,columns:[
            {field:"wrkStatCd", title:"<spring:message code='ser.lbl.repairStat' />", width:80, attributes:{"class":"ac"}
               ,template:"#=progressStatGrid(wrkStatCd)#"
            }//수리상태
            ,{field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"rpirNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:250//정비항목
                ,attributes:{"class":"ac"}
            }
            ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"ac"}}//테크맨
            ,{field:"wrkStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:120//예정완료시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"wrkEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120//예정완료시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
        ]

    });

    //그리드 설정
    $("#workHisGrid").kendoExtGrid({
        gridId:"G-SER-1011-000100"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/workProcess/selectWorkAssigns.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]   = $("#dlrCd").val();
                        params["sRoDocNo"] = $("#roDocNo").val();
                        params["sLineNo"]  = $("#lineNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"lineNo"
                    ,fields:{
                        dlrCd:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,lineNo:{type:"string"}
                        ,bayNo:{type:"string"}
                        ,bayNm:{type:"string"}
                        ,rpirTp:{type:"string", editable:false}
                        ,rpirCd:{type:"string", editable:false}
                        ,rpirNm:{type:"string", editable:false}
                        ,rpirDstinCd:{type:"string", editable:false}
                        ,wrkStatCd:{type:"string",defaultValue:""}
                        ,qtTestCd:{type:"string"}
                        ,carWashStatCd:{type:"string"}
                        ,qtTestStatCd:{type:"string"}
                        ,paintStatCd:{type:"string"}
                        ,wrkStartDt:{type:"date"}
                        ,wrkEndDt:{type:"date"}
                        ,planHm:{type:"number", editable:false}
                    }
                }
            }
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,editable :false
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
            {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"rpirNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:250//정비항목
                ,attributes:{"class":"ac"}
            }
            ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}}//정비유형
            ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ac"}
            }//수리시간
            ,{field:"wrkStatCd", title:"<spring:message code='ser.lbl.repairStat' />", width:80, attributes:{"class":"ac"}
               ,template:"#=progressStatGrid(wrkStatCd)#"
            }//수리상태
            ,{field:"wrkEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120//예정완료시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                   $('<input id="wrkEndDt" required name="wrkEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' /> HH:mm"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   });
                   $('<span class="k-invalid-msg" data-for="wrkEndDt"></span>').appendTo(container);
               }
            }
        ]

    });

    if(isTablet == "true" ){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#wrokProcListColGroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[1]).css("width","15%");
            $(colEmt[2]).css("width","7%");
            $(colEmt[3]).css("width","15%");
            $(colEmt[4]).css("width","9%");
            $(colEmt[5]).css("width","15%");
            $(colEmt[6]).css("width","9%");
            $("#roListGrid").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
            var colEmt2=$("#wrokProcListColGroup2 col");
            $(colEmt2[0]).css("width","10%");
            $(colEmt2[2]).css("width","10%");
            $(colEmt2[4]).css("width","10%");
        }
    }
});

</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- RO작업배정관리 -->
<div id="resizableContainer">
    <div class="content_v1">

        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11640" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </dms:access>
                <button class="btn_m" id="backward" style="visibility:hidden"><spring:message code="global.btn.pre" /></button><!-- 이전 -->
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13088" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11639" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 조회 조건 시작 -->
        <form id="workAssignForm1" method="POST" action="/">
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup id="workAssignColGroup">
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
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!--예정인도시간  -->
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
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!--VIN  -->
                        <td>
                            <input id="sVinNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!--RO발행자  -->
                        <td>
                            <input id="sRegUsrNm" type="text" class="form_input" maxlength="30">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.assignStat" /></th><!--정비배정상태  -->
                        <td>
                            <input id="sAllocStatCd" type="text" class="form_comboBox" style="width:100%">
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
                </tbody>
            </table>
        </div>

        </form>
        <!-- 조회 조건 종료 -->

        <!-- RO작업 배정 상세 타이틀 시작 -->
        <div class="header_area">
         </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="roListGrid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->

        <form id="workAssignForm2" method="POST" action="/">

        <div style="display:none" id="tDataTable" class="table_form form_width_100per">   <!-- 태블릿 jhg -->
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
                        <th scope="row"><spring:message code='ser.lbl.carRegNo' /></th><!-- 차량등록번호 -->
                        <td>
                            <input type="text" id="tCarRegNo" class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tVinNo">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 차량 소유자 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tCarOwnerNm">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.driver' /></th><!-- 수리의뢰자 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tDriverNm">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th><!-- 차종명 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tCarlineNm">
                        </td>
                        <th scope="row"><spring:message code='par.lbl.model' /></th><!-- 모델명칭 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tModelNm">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tRoDocNo">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roWrtrNm' /></th><!-- RO발행자 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="tRegUsrNm">
                        </td>
                    </tr>
                </tbody>
        </table>
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
                            <input type="text" class="form_input form_readonly" id="atqProcTp" readonly>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.carWash" /></th><!-- 세차처리 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="carWashTp" readonly>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.custStbyMth" /></th><!-- 고객대기방식 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="custWaitMthCd" readonly>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.qultTest" /></th><!-- 품질검사 -->
                        <td>
                            <input type="text" class="form_input form_readonly" id="qtTestMthCd" readonly>
                        </td>
                    </tr>
                     <tr>
                        <th scope="row"><spring:message code="ser.lbl.goodWillYn" /><!-- GoodWill --></th>
                        <td>
                            <input id="goodwillYn" name="goodwillYn" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.tdrvReq" /></th><!--시승 -->
                        <td>
                            <input class="form_input form_readonly" id="carDriveReqTp" readonly>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.chgExpcDlDt" /></th><!-- 변경된예정인도시간 -->
                        <td>
                            <input id="chgExpcDlDt" class="form_datetimepicker form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                        <td>
                            <input id="expcDlDt" class="form_datetimepicker" >
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
            <div id="workAssignGrid" ></div>
        </div>

        <!-- 그리드 종료 -->
        <div class="header_area">
         </div>
         <!-- 품질검사 시작 -->
        <div>
            <div class="workProgress_manage">
                <div class="top_area">
                    <ul class="txt_input">
                        <li>
                            <span class="bu_required"><spring:message code="ser.lbl.assigner" /></span><!-- 배정자 -->
                            <div class="required_area">
                                <div class="form_search">
                                    <input type="text" id="saNm" name="saNm" data-json-obj="true" class="form_input">
                                    <a href="javascript:techmanPopup('A');"></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11638" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_v2" id="btnStart" type="button"><spring:message code="ser.btn.allocWrk" /></button><!-- 배정작업 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11637" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_v2" id="btnSave" type="button" style="display:none;"><spring:message code="ser.btn.assignComp" /></button><!--배정완료  -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11636" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_s_v2" id="btnDel" type="button"><spring:message code="ser.btn.assignCancel" /></button><!-- 배정취소 -->
                        </dms:access>
                    </div>
                </div>
            </div>
        </div>
        <div style="display:none;">
            <input type="text" id="dlrCd" name="dlrCd">
            <input type="text" id="roGrpNo" name="roGrpNo">
            <input type="text" id="roDocNo" name="roDocNo">
            <input type="text" id="saId" name="saId" data-json-obj="true" />
        </div>
        </form>
    </div>
</div>

<!-- 우측 메뉴 -->
<c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectWorkProcessKanban.jsp" />
<!-- //우측 메뉴 -->

<script type="text/javascript">

//20170508 hg
var isTablet="${isTablet}";
var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
}

var wkgrpSearchPopup;
var assignSearchPopup;

var row = 0;
var rowRoDocNo;

// 배정상태 Array
var allocStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${allocStatCdList}">
allocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 배정상태 Map
var allocStatCdMap = dms.data.arrayToMap(allocStatCdList, function(obj){ return obj.cmmCd; });

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
//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//풀질검사 Array
var qtTestList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${qtTestList}">
qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var qtTestCdMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd});

//사용여부 Array
var useYnCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnCdMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd});

//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고객대기방식유형 map
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd});

//공통코드:시승시운전
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시승시운전 map
var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd});

//공통코드:품질검사
var qtTestList = [];
<c:forEach var="obj" items="${qtTestList}">
qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//품질검사 map
var qtTestMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고품처리유형 map
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량세차유형 map
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd});

//수리유형 Array
var rpirStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});

//배정상태
allocStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(allocStatCdMap[val] != undefined)
        returnVal = allocStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdMap[val] != undefined)
        returnVal = roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//RO상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//품질검사 상태
qtTestCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(qtTestCdMap[val] != undefined)
        returnVal = qtTestCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 수리구분
rpirStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rpirStatMap[val] != undefined)
        returnVal = rpirStatMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    $("#assignFoot td").addClass("readonly_area");

    $("#sAllocStatCd").kendoExtDropDownList({
        dataSource:allocStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    $("#qtTestCd").kendoExtDropDownList({
        dataSource:qtTestList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
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

    // 변경된 예정인도일자
    $("#chgExpcDlDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예정인도일자
    $("#expcDlDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //버튼 - 적용
    $("#btnStart").kendoButton({
        click:function(e) {
            var gd = $('#workAssignGrid').data('kendoExtGrid');
            var gdItem = gd.dataItem(gd.select());
            if(gdItem==null||gdItem==""){
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                 return;
            }

            var planHm = 0;
            var selectCnt = gd.select().length;

            gd.select().each(function(idx, item){
                planHm += Number(gd.dataItem(item).allocHm);
            });

            assignSearchPopup = dms.window.popup({
                windowId:"assignSearchWin"
                , title:"<spring:message code='ser.title.workAssignMng' />"   // 소조 조회
                , width : 600
                , content:{
                    url:"<c:url value='/ser/ro/workAssign/selectWorkAssignPopup.do'/>?planHm="+planHm
                    , data:{
                         "saId":$("#saId").val()
                         ,"saNm":$("#saNm").val()
                         ,"bayNo":gdItem.bayNo
                         ,"bayNm":gdItem.bayNm
                         ,"wkgrpNo":gdItem.wkgrpNo
                         ,"wkgrpNm":gdItem.wkgrpNm
                         ,"tecId":gdItem.realTecId
                         ,"tecNm":gdItem.realTecNm
                         ,"allocHm":gdItem.allocHm
                         ,"shtCnt":gdItem.shtCnt
                         ,"paintCnt":gdItem.paintCnt
                         ,"paintColorCd":gdItem.paintColorCd
                         ,"diffVal":gdItem.diffVal
                         ,"lbrCnt":gdItem.lbrCnt
                         ,"allocStartDt":gdItem.allocStartDt
                         ,"allocEndDt":gdItem.allocEndDt
                         ,"allocRemark":gdItem.allocRemark
                         ,"expcDlDt":$("#expcDlDt").data("kendoExtMaskedDateTimePicker").value()
                         ,"selectCnt":selectCnt
                         ,"callbackFunc":function(jsonObj) {
                             var grid = $('#workAssignGrid').data('kendoExtGrid');

                             grid.select().each(function(i,row){
                                grid.dataItem(row).realTecNm = jsonObj.tecNm;
                                grid.dataItem(row).realTecId = jsonObj.tecId;
                                grid.dataItem(row).sysNo = jsonObj.sysNo;
                                grid.dataItem(row).bayNo = jsonObj.bayNo;
                                grid.dataItem(row).bayNm = jsonObj.bayNm;
                                grid.dataItem(row).wkgrpNo = jsonObj.wkgrpNo;
                                grid.dataItem(row).wkgrpNm = jsonObj.wkgrpNm;
                                if(selectCnt == 1){
                                    grid.dataItem(row).allocHm = jsonObj.allocHm;
                                }
                                grid.dataItem(row).shtCnt = jsonObj.shtCnt;
                                grid.dataItem(row).paintCnt = jsonObj.paintCnt;
                                grid.dataItem(row).paintColorCd = jsonObj.paintColorCd;
                                grid.dataItem(row).diffVal = jsonObj.diffVal;
                                grid.dataItem(row).lbrCnt = jsonObj.lbrCnt;
                                grid.dataItem(row).allocStartDt = kendo.parseDate(jsonObj.allocStartDt);
                                grid.dataItem(row).allocEndDt = kendo.parseDate(jsonObj.allocEndDt);
                                grid.dataItem(row).allocStatCd = "02";
                                grid.dataItem(row).allocRemark = jsonObj.allocRemark;
                              });
                              $("#btnSave").click();
                        }
                    }
                }
                ,height:370
            });
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            rowRoDocNo = "";
            row = 0;
            setBtnEnable("");

            $('#workAssignGrid').data('kendoExtGrid').dataSource.data([]);
            $('#roListGrid').data('kendoExtGrid').dataSource.page(1);

            if(isTablet=="true"){
                showFirstPage();
            }
        }
    });

    //tablet버튼- 이전
    $("#backward").kendoButton({
        click:function(e) {
            showFirstPage();
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {


            if($("#saId").val() == "" || $("#saId").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.assignMnger' var='assigner' /><spring:message code='global.info.required.field' arguments='${assigner},' />");
                return;
            }

            var grid = $("#workAssignGrid").data("kendoExtGrid");
            var workAssignData = [];

            var isReturn = false;

            grid.select().each(function(i,row){
                grid.dataItem(row).saNm = $("#saNm").val();
                grid.dataItem(row).saId = $("#saId").val();
                grid.dataItem(row).expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
                grid.dataItem(row).allocStatCd = "03";
                if(dms.string.isEmpty(grid.dataItem(row).wkgrpNo) && dms.string.isEmpty(grid.dataItem(row).realTecId)){
                    dms.notification.info("<spring:message code='ser.lbl.tecNm' var='assigner' /><spring:message code='global.info.required.field' arguments='${assigner},' />");
                    isReturn = true;
                    return false;
                }
                workAssignData.push(grid.dataItem(row));
            });

            if(isReturn) return;
            var jsonData = {"insertList":[],"updateList":[],"deleteList":[]}
            jsonData.insertList = workAssignData;

            if(workAssignData.length > 0){
                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/ser/ro/workAssign/insertWorkAssigns.do' />",
                        data:JSON.stringify(jsonData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            $('#workAssignGrid').data('kendoExtGrid').dataSource.data([]);

                            var grid = $("#roListGrid").data("kendoExtGrid");
                            setGridRows(grid);
                            grid.dataSource.page(1);
                            //$('#workAssignGrid').data('kendoExtGrid').refresh();
                            $(".checkAll").attr("checked", false);
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

                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        }
        ,enable :false
    });

    // 배정취소
    $("#btnDel").kendoButton({
        click:function(e) {

            var assignGrid = $("#workAssignGrid").data("kendoExtGrid");
            var rows = assignGrid.select();

            if(rows.length > 0){
                var saveData = [];

                rows.each(function(index, row) {
                    var selectedItem = assignGrid.dataItem(row);
                    saveData.push(selectedItem);
                });

                $.ajax({
                    url:"<c:url value='/ser/ro/workAssign/cancelWorkAssigns.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.info(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        $("#workAssignGrid").data("kendoExtGrid").dataSource.data([]);

                        var roListGrid = $("#roListGrid").data("kendoExtGrid");
                        setGridRows(roListGrid);
                        roListGrid.dataSource.page(1);
                        $(".checkAll").attr("checked", false);
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
            } else {
                //입력값을 확인하여 주십시오.
                dms.notification.info("<spring:message code='ser.info.cancelNoData'/>");
            }
        }
        ,enable :false
    });

    $("#btnReset").kendoButton({
        click:function(e){
            row = 0;
            $("#workAssignForm1").get(0).reset();
            $("#workAssignForm2").get(0).reset();
            $("#tecId").val("");
            $("#saId").val("");
            $("#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sRoFromDt}");
            $("#sRoToDt").data("kendoExtMaskedDatePicker").value("${sRoToDt}");
            $("#roListGrid").data("kendoExtGrid").dataSource.read();
            $("#workAssignGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });

  //엑셀버튼
    $("#btnExcelExport").kendoButton({
        click:function(e){
             dms.ajax.excelExport({
                "beanName"       :"repairOrderService"
                ,"templateFile"  :"WorkAssignList_Tpl.xlsx"
                ,"fileName"      :"<spring:message code='ser.menu.workAssignMng' />.xlsx"
                ,"sRoFromDt"     :$("#sRoFromDt").val()
                ,"sRoToDt"       :$("#sRoToDt").val()
                ,"sExpcDlFromDt" :$("#sExpcDlFromDt").val()
                ,"sExpcDlToDt"   :$("#sExpcDlToDt").val()
                ,"sRoDocNo"      :$("#sRoDocNo").val()
                ,"sRoTp"         :$("#sRoTp").val()
                ,"sVinNo"        :$("#sVinNo").val()
                ,"sRegUsrNm"     :$("#sRegUsrNm").val()
                ,"sCarRegNo"     :$("#sCarRegNo").val()
                ,"sAllocStatCd"  :$("#sAllocStatCd").val()
                ,"sListType"     :"AL"
            });
        }
    });

    //그리드 설정
    $("#roListGrid").kendoExtGrid({
        gridId:"G-SER-1011-000095"
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

                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlFromDt"] = $("#sExpcDlFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sExpcDlToDt"] = $("#sExpcDlToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sRoTp"] = $("#sRoTp").data("kendoExtDropDownList").value();
                        params["sDriverNm"] = $("#sDriverNm").val();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sRegUsrNm"] = $("#sRegUsrNm").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                        params["sAllocStatCd"] = $("#sAllocStatCd").val();
                        params["sListType"] = "AL";

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
                        ,saNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,expcDlDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,roStatCd:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,selectable:"row"
        ,change:function(e){
            $("#assignFoot td").addClass("readonly_area");
            var dataItem = this.dataItem(this.select());
            $("#roDocNo").val(dataItem.roDocNo);
            $("#roGrpNo").val(dataItem.roGrpNo);
            $("#dlrCd").val(dataItem.dlrCd);
            $("#saId").val(dataItem.saId);
            $("#saNm").val(dataItem.saNm);
            $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(dataItem.expcDlDt);
            $("#chgExpcDlDt").data("kendoExtMaskedDateTimePicker").value(dataItem.chgExpcDlDt);
            $("#workAssignGrid").data("kendoExtGrid").dataSource.read();
            if(dataItem.custWaitMthCd!=null){
                $("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
            }else{
                $("#custWaitMthCd").val("");
            }
            if(dataItem.carDriveReqTp!=null){
                $("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
            }else{
                $("#carDriveReqTp").val("");
            }
            if(dataItem.qtTestMthCd!=null){
                $("#qtTestMthCd").val(qtTestMap[dataItem.qtTestMthCd].cmmCdNm);
            }else{
                $("#qtTestMthCd").val("");
            }
            if(dataItem.atqProcTp!=null){
                $("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
            }else{
                $("#atqProcTp").val("");
            }
            if(dataItem.carWashTp!=null){
                $("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
            }else{
                $("#carWashTp").val("");
            }
            if(dataItem.roTp!=null){
                $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);
            }else{
                $("#roTp").val("");
            }
            if(dataItem.goodwillYn!=null){
                $("#goodwillYn").val(useYnCdMap[dataItem.goodwillYn].cmmCdNm);
            }else{
                $("#goodwillYn").val("");
            }
            if(dms.string.strNvl(dataItem.allocStatCd) == "01"){
                $("#saId").val("${loginUsrId}");
                $("#saNm").val("${loginUsrNm}");
            }
            /* if(isTablet=="true"){
                showSecondPage();
                $("#tCarRegNo").val(dataItem.carRegNo);
                $("#tVinNo").val(dataItem.vinNo);
                $("#tCarOwnerNm").val(dataItem.carOwnerNm);
                $("#tDriverNm").val(dataItem.driverNm);
                $("#tCarlineNm").val(dataItem.carlineNm);
                $("#tModelNm").val(dataItem.modelNm);
                $("#tRoDocNo").val(dataItem.roDocNo);
                $("#tRegUsrNm").val(dataItem.regUsrNm);
            } */

            setBtnEnable("");

        }
        ,height:200
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[row]);
            if(selectedVal != null){
                if(rowRoDocNo  == selectedVal.roDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[row]);
                }
            }
        }
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:80//차량등록번호
                ,attributes:{"class":"al"}
            }
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150//vin번호
                ,attributes:{"class":"al"}
            }
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100//소유자
                ,attributes:{"class":"al"}
            }
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100//운전자
                ,attributes:{"class":"al"}
            }
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", sortable:false, width:80//차종명
                ,attributes:{"class":"al"}
            }
            ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", sortable:false, width:130//모델명
                ,attributes:{"class":"al"}
            }
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", sortable:false, width:80 // 주행거리
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.totRunDistVal' />", sortable:false, width:80    //누계주행거리
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{field:"roStatCd", title:"<spring:message code='ser.lbl.roStatus' />", sortable:false, width:100
                ,attributes:{"class":"ac"}
                ,template:"#=roStatCdGrid(roStatCd)#"
            }//RO상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:100//RO번호
                ,attributes:{"class":"al"}
            }
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:80//위탁유형
                ,attributes:{"class":"ac"}
                ,template:"#=roTpCdGrid(roTp)#"
            }
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120//RO일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", sortable:false, width:80//RO발행자
                ,attributes:{"class":"al"}
            }
            ,{field:"expcDlDt", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:120//예정인도시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"qtTestMthCd", title:"<spring:message code='ser.lbl.qultTest' />", sortable:false, width:100//품질검사
                ,attributes:{"class":"ac"}
                ,template:"#=qtTestCdGrid(qtTestMthCd)#"
            }
            ,{field:"allocStatCd", title:"<spring:message code='ser.lbl.assignStat' />", sortable:false, width:100
                ,attributes:{"class":"ac"}
                ,template:"#=allocStatCdGrid(allocStatCd)#"
            }//배정상태
            ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:150//bayNo
                ,attributes:{"class":"al"}, hidden:true
            }
            ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:90//sa
                ,attributes:{"class":"al"}, hidden:true
            }
        ]

    });

    $("#roListGrid").on("doubletap", "tr.k-state-selected", function (e) {

        var grid = $("#roListGrid").data("kendoExtGrid");
        var rows = grid.select();

        var dataItem = grid.dataItem(rows);
        if(isTablet=="true"){
            showSecondPage();
            $("#tCarRegNo").val(dataItem.carRegNo);
            $("#tVinNo").val(dataItem.vinNo);
            $("#tCarOwnerNm").val(dataItem.carOwnerNm);
            $("#tDriverNm").val(dataItem.driverNm);
            $("#tCarlineNm").val(dataItem.carlineNm);
            $("#tModelNm").val(dataItem.modelNm);
            $("#tRoDocNo").val(dataItem.roDocNo);
            $("#tRegUsrNm").val(dataItem.regUsrNm);
        }
    });

    if(isTablet == "true"){

        //그리드 설정
        $("#workAssignGrid").kendoExtGrid({
            gridId:"G-SER-0626-160835"
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
                            params["lastIndex"] = 500; //options.skip + options.take;由100改成 500条件  2018-10-15 贾明  
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
                            ,rpirTp:{type:"string"}
                            ,rpirCd:{type:"string", editable:false}
                            ,rpirNm:{type:"string", editable:false}
                            ,rpirDstinCd:{type:"string", editable:false}
                            ,wrkStatCd:{type:"string"}
                            ,allocStatCd:{type:"string"}
                            ,qtTestCd:{type:"string", editable:true }
                            ,realTecId:{type:"string"}
                            ,realTecNm:{type:"string"}
                            ,wkgrpNo:{type:"string"}
                            ,wkgrpNm:{type:"string"}
                            ,wrkStartDt:{type:"date", editable:false}
                            ,wrkEndDt:{type:"date", editable:false}
                            ,planHm:{type:"number", editable:false}
                            ,allocHm:{type:"number", editable:false}
                            ,shtCnt:{type:"number", editable:false}
                            ,paintCnt:{type:"number", editable:false}
                            ,diffVal:{type:"number", editable:false}
                            ,lbrCnt:{type:"number", editable:false}
                            ,allocStartDt:{type:"date", editable:false}
                            ,allocEndDt:{type:"date", editable:false, validation:{required:true}}
                            ,regDt:{type:"date", editable:false}
                            ,qtTestStartDt:{type:"date"}
                            ,qtTestEndDt:{type:"date"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,pageable:false
            ,sortable:false
            ,editable:false
            ,height:200
            ,resizable:false
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,filterable:false                 // 필터링 기능 사용안함
            ,selectable:"row"
            ,change:function(e){
                var dataItem = this.dataItem(this.select());

                if(dataItem != null){
                    setBtnEnable(dataItem.allocStatCd);
                }
            }
            ,columns:[
                {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                    ,sortable:false
                    ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"}
                ,{field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                    ,attributes:{"class":"al"}
                }
                ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250//정비명칭
                    ,attributes:{"class":"al"}
                }
                ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=rpirStatGrid(rpirTp)#"
                    ,editor:function(container, options) {
                        $('<input required name="rpirTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataSource:rpirStatList
                            ,dataValueField:"cmmCd"
                            ,dataTextField:"cmmCdNm"
                        });
                    }
                }   //정비유형
                ,{field:"allocStatCd", title:"<spring:message code='ser.lbl.assignStat' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=allocStatCdGrid(allocStatCd)#"
                }   // 배정상태
                ,{field:"regDt", title:"<spring:message code='ser.lbl.assignEndDt' />", width:120//배정완료시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                ,{field:"allocStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:120//예정시작시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                ,{field:"allocEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120//예정완료시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//수리시간
                ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"al"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//테크니션
                ,{field:"realTecId", hidden:true}  //직원번호
                ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:80, attributes:{"class":"al"}}  //직원번호
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"al"}
                     ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//정비반조
                ,{field:"wkgrpNo", title:"<spring:message code='ser.lbl.wrkTeamNo' />", width:80, attributes:{"class":"al"}}//반조번호
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:80, attributes:{"class":"al"}}//bayNm
                ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"al"}}//bayNo
                ,{field:"shtCnt", title:"<spring:message code='ser.lbl.serCnt'/>", width:60, attributes:{"class":"ac"}}   //정비건수
                ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ac"}}    //난이도계수
                ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ar"}
                    ,format:"{0:n0}"
                    ,decimal:0
                    ,template:function(data){
                        var allocHm = data.allocHm;
                        if(allocHm <= 0){
                            allocHm = data.dstbHm;
                            data.allocHm = allocHm;
                        }
                        return allocHm;
                    }
                }
                ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:80, attributes:{"class":"al"}}//정비배정자
                ,{field:"allocRemark", title:"<spring:message code='global.lbl.assignRemark' />", width:80, attributes:{"class":"al"}}//배정비고
                ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ar"}, hidden:true}
                ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ar"}, hidden:true}
                ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"expcDlDt", hidden:true}
            ]

        });

    }else{

        //그리드 설정
        $("#workAssignGrid").kendoExtGrid({
            gridId:"G-SER-1011-000096"
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
                            params["lastIndex"] = 500; //options.skip + options.take; 由100改成 500条件  2018-10-15 贾明  
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
                            ,rpirTp:{type:"string"}
                            ,rpirCd:{type:"string", editable:false}
                            ,rpirNm:{type:"string", editable:false}
                            ,rpirDstinCd:{type:"string", editable:false}
                            ,wrkStatCd:{type:"string"}
                            ,allocStatCd:{type:"string"}
                            ,qtTestCd:{type:"string", editable:true }
                            ,realTecId:{type:"string"}
                            ,realTecNm:{type:"string"}
                            ,wkgrpNo:{type:"string"}
                            ,wkgrpNm:{type:"string"}
                            ,wrkStartDt:{type:"date", editable:false}
                            ,wrkEndDt:{type:"date", editable:false}
                            ,planHm:{type:"number", editable:false}
                            ,allocHm:{type:"number", editable:false}
                            ,shtCnt:{type:"number", editable:false}
                            ,paintCnt:{type:"number", editable:false}
                            ,diffVal:{type:"number", editable:false}
                            ,lbrCnt:{type:"number", editable:false}
                            ,allocStartDt:{type:"date", editable:false}
                            ,allocEndDt:{type:"date", editable:false, validation:{required:true}}
                            ,regDt:{type:"date", editable:false}
                            ,qtTestStartDt:{type:"date"}
                            ,qtTestEndDt:{type:"date"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,pageable:false
            ,sortable:false
            ,editable:false
            ,height:200
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,selectable:_selectable
            ,change:function(e){
                var dataItem = this.dataItem(this.select());

                if(dataItem != null){
                    setBtnEnable(dataItem.allocStatCd);
                }
            }
            ,columns:[
                {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                    ,attributes:{"class":"al"}
                }
                ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250//정비명칭
                    ,attributes:{"class":"al"}
                }
                ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=rpirStatGrid(rpirTp)#"
                    ,editor:function(container, options) {
                        $('<input required name="rpirTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataSource:rpirStatList
                            ,dataValueField:"cmmCd"
                            ,dataTextField:"cmmCdNm"
                        });
                    }
                }   //정비유형
                ,{field:"allocStatCd", title:"<spring:message code='ser.lbl.assignStat' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=allocStatCdGrid(allocStatCd)#"
                }   // 배정상태
                ,{field:"regDt", title:"<spring:message code='ser.lbl.assignEndDt' />", width:120//배정완료시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                ,{field:"allocStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:120//예정시작시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                ,{field:"allocEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120//예정완료시간
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//수리시간
                ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"al"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//테크니션
                ,{field:"realTecId", hidden:true}  //직원번호
                ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:80, attributes:{"class":"al"}}  //직원번호
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"al"}
                     ,editor:function(container, options) {
                        $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                        .appendTo(container)
                    }
                }//정비반조
                ,{field:"wkgrpNo", title:"<spring:message code='ser.lbl.wrkTeamNo' />", width:80, attributes:{"class":"al"}}//반조번호
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:80, attributes:{"class":"al"}}//bayNm
                ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"al"}}//bayNo
                ,{field:"shtCnt", title:"<spring:message code='ser.lbl.serCnt'/>", width:60, attributes:{"class":"ac"}}   //정비건수
                ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ac"}}    //난이도계수
                ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ar"}
                    ,format:"{0:n0}"
                    ,decimal:0
                    ,template:function(data){
                        var allocHm = data.allocHm;
                        //if(allocHm <= 0){
                        if(allocHm < 0){
                            allocHm = data.dstbHm;
                            data.allocHm = allocHm;
                        }
                        return allocHm;
                    }
                }//배분공임
                ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:80, attributes:{"class":"al"}}//정비배정자
                ,{field:"allocRemark", title:"<spring:message code='global.lbl.assignRemark' />", width:80, attributes:{"class":"al"}}//배정비고
                ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ar"}, hidden:true}
                ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ar"}, hidden:true}
                ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}, hidden:true}
                ,{field:"expcDlDt", hidden:true}
            ]

        });

    }



    setBtnEnable = function(allocStatCd){

        if(dms.string.strNvl(allocStatCd) == "01"){
            $("#btnStart").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(false);
        } else if(dms.string.strNvl(allocStatCd) == "03"){
            $("#btnStart").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnDel").data("kendoButton").enable(true);
        } else {
            $("#btnStart").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnDel").data("kendoButton").enable(false);
        }

    }
    //선택된 그리드 Rows
    setGridRows = function(grid){

        rowRoDocNo = "";
        row = 0;
        var selectedVal = grid.dataItem(grid.select());
        if(selectedVal != null){
            row = grid.select().index();
            rowRoDocNo = selectedVal.roDocNo;
        }
    }

    if(isTablet=="true") {
        $("#workAssignForm2").css("display","none");
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#workAssignColGroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[2]).css("width","7%");

            $("#roListGrid").parents(".table_grid").attr("style","width:938px !important; max-width:938px !important");
        }
    }

});



    var tecSearchPopup;
    techmanPopup = function(away) {
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.lbl.serviceUserSearch' />"   // 정비사용자 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {

                        if(jsonObj.length > 0) {
                            if(away=='A'){
                                $("#saId").val(jsonObj[0].tecId);
                                $("#saNm").val(jsonObj[0].tecNm);
                            }else if(away=='B'){
                                $("#tecId").val(jsonObj[0].tecId);
                                $("#tecNm").val(jsonObj[0].tecNm);
                            }else{
                                var grid = $('#workAssignGrid').data('kendoExtGrid');
                                var dataItem = grid.dataItem(grid.select());
                                dataItem.realTecId = jsonObj[0].tecId;
                                dataItem.realTecNm = jsonObj[0].tecNm;
                                grid.refresh();
                            }
                        }
                    }
                }
            }
        });
    };

    techmanTabPopup = function(away) {
         wkgrpSearchPopup = dms.window.popup({
            windowId:"teckManTabFnSearchWin"
            , title:"<spring:message code='ser.title.tecSearch' />"   // 소조 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManTabPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {

                        if(jsonObj.length > 0) {
                            if(away=='A'){
                                $("#wkgrpNo").val(jsonObj[0].wkgrpNo);
                                $("#wkgrpNm").val(jsonObj[0].wkgrpNm);
                            }else{
                                if(jsonObj[0].tabId=="techTab"){
                                var grid = $('#workAssignGrid').data('kendoExtGrid');
                                var dataItem = grid.dataItem(grid.select());

                                dataItem.wkgrpNo = jsonObj[0].tecId;
                                dataItem.wkgrpNm = jsonObj[0].tecNm;
                                grid.refresh();
                                } else {

                                    var grid = $('#workAssignGrid').data('kendoExtGrid');
                                    var dataItem = grid.dataItem(grid.select());
                                    dataItem.wkgrpNo = jsonObj[0].wkgrpNo;
                                    dataItem.wkgrpNm = jsonObj[0].wkgrpNm;
                                    grid.refresh();
                                }
                            }
                        }
                    }
                }
            }
        });
    };

  //jhg tablet
    showFirstPage = function() {
        $("#workAssignForm2").css("display","none");
        $(".table_grid").eq(0).css("display","block");
        $("#workAssignForm1").css("display","block");
        $("#backward").css("visibility","hidden");
        $("#tDataTable").css("display","none");
    };
    //jhg tablet
    showSecondPage = function() {
        $("#workAssignForm2").css("display","block");
        $(".table_grid").eq(0).css("display","none");
        $("#workAssignForm1").css("display","none");
        $("#backward").css("visibility","visible");
        $("#tDataTable").css("display","block");
    };

//workAssignGrid의 multi-select
    $(document).on("click", ".grid-checkbox-item, #workAssignGrid tr", function(e){
        if(isTablet == "true"){
            var target = $(e.currentTarget);
            if($(target).is("tr")){
                //체크박스에 체크가 되어있으면 선택을 해제하고, 그렇지 않다면 선택한다.
                var chkItem = $(target).find(".grid-checkbox-item");
                if($(chkItem).prop("checked")){
                    $(target).removeClass("k-state-selected");
                    $(target).find(".grid-checkbox-item").prop("checked",false);
                }else{
                    $(target).addClass("k-state-selected");
                    $(target).find(".grid-checkbox-item").prop("checked",true);
                }
              //체크된 모든 row를 선택한다.
                $(".grid-checkbox-item").each(function(index, row){
                    if($(row).prop("checked")){
                        $(row).closest("tr").addClass("k-state-selected");
                    }
                });

                var grid = $('#workAssignGrid').data('kendoExtGrid');
                var dataItem = grid.dataItem(grid.select());
                if(dataItem != null){
                    setBtnEnable(dataItem.allocStatCd);
                }
            }else{
                //기본체크버튼 이벤트를 막는다. 이후 tr클릭 이벤트를 탄다.
                $(e.currentTarget).prop("checked")? $(e.currentTarget).prop("checked",false) : $(e.currentTarget).prop("checked",true);
            }

        }
    });

  //khskhs doubletab
    (function($){

        $.event.special.doubletap = {
          bindType: 'touchend',
          delegateType: 'touchend',

          handle: function(event) {
            var handleObj   = event.handleObj,
                targetData  = jQuery.data(event.target),
                now         = new Date().getTime(),
                delta       = targetData.lastTouch ? now - targetData.lastTouch : 0,
                delay       = delay == null ? 300 : delay;

            if (delta < delay && delta > 30) {
              targetData.lastTouch = null;
              event.type = handleObj.origType;
              ['clientX', 'clientY', 'pageX', 'pageY'].forEach(function(property) {
                event[property] = event.originalEvent.changedTouches[0][property];
              })

              // let jQuery handle the triggering of "doubletap" event handlers
              handleObj.handler.apply(this, arguments);
            } else {
              targetData.lastTouch = now;
            }
          }
        };

      })(jQuery);
    //khskhs doubletab
</script>

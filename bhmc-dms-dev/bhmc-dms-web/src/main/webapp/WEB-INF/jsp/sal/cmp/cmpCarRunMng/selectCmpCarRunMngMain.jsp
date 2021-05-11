<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 회사차운행관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.comVehicleDrvMgmt" /></h1>
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-11117" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <%-- </dms:access> --%>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" maxlength="17" />
                        <input id="useStartKmVal" type="hidden"/>
                        <input id="hidSrchVinNo" type="hidden"/>
                        <input id="hidSrchType" type="hidden"/>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                    <td>
                        <label for="sRadioN" class="label_check">
                            <input type="radio" id="sCarStatCd" name="sCarStatCd" value="U" checked class="form_check" onClick="javascript:changedRadio(true);"/>
                            <spring:message code='sal.lbl.using' />
                        </label> <!-- 사용중 -->
                        <label for="sRadioY" class="label_check">
                            <input type="radio" id="sCarStatCd" name="sCarStatCd" value="D" class="form_check" onClick="javascript:changedRadio(false);"/>
                            <spring:message code='sal.lbl.usingDone' />
                        </label> <!-- 만기 -->
                        <input id="sRadioTp" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /></th><!-- 회사차유형 -->
                    <td>
                        <input id="sCpnCarTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th> <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.orgStartDt' /></th><!-- 사용시작일자 -->
                    <td>
                         <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>

                    <th scope="row"><spring:message code='global.lbl.fincEndDt' /></th><!-- 만기일자 -->
                    <td>
                         <div class="form_float">
                            <div class="date_left">
                                <input id="sEndStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndEndDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>


                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.comVehicleDrvMgmtList' /></h2><!-- 회사차운행관리목록 -->
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-11115" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnMainSave" ><spring:message code='global.btn.save' /></button><!-- 저장 -->
            <%-- </dms:access> --%>
            <%-- <dms:access viewId="VIEW-D-11118" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnMainNew"><spring:message code="sal.btn.addCmpVehicle" /></button><!-- 회사차추가 -->
            <%-- </dms:access> --%>

            <button class="btn_s" id="btnDelMain"><spring:message code='global.btn.rowDel' /></button><!-- 삭제 -->

            <%-- <dms:access viewId="VIEW-D-11116" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnMainCancl"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
            <%-- </dms:access> --%>
        </div>
    </div>
    <div class="mt0">
    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
    </div>
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.comVehicleDrvMgmtDetail' /></h2><!-- 회사차 운행관리 상세정보 -->
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-11119" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnSubSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
            <%-- </dms:access> --%>
            <%-- <dms:access viewId="VIEW-D-13207" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnSubNew"><spring:message code='global.btn.rowAdd' /></button><!-- 추가 -->
            <%-- </dms:access> --%>

            <button class="btn_s" id="btnDelSub"><spring:message code='global.btn.rowDel' /></button><!-- 삭제 -->

            <%-- <dms:access viewId="VIEW-D-13206" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnSubCancl"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
            <%-- </dms:access> --%>
        </div>
    </div>
    <div class="mt0">
        <div class="table_grid">
            <div id="subGrid"></div>
        </div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<!-- script -->
<script>
var oneDay = "${oneDay}"+" 00:00:00";   // 해당월 1일
var lastDay = "${lastDay}"+" 00:00:00"; // 해당월 마지막일자
var toDay = "${toDay}";
var after2Years = "${after2Years}";
var toDayTime = "${toDay}"+" 00:00:00";
var loginUserId = "${loginUserId}";
var loginUserIdAndNm = "${loginUserIdAndNm}";

var toDayTimes = "";
var currentNow = new Date();
var year = currentNow.getYear();
var month = currentNow.getMonth()+1;
var date = currentNow.getDate();
var hour = currentNow.getHours();
var hourOne = currentNow.getHours()+1;
var toDayTimes = getFormatDate(currentNow)+" "+hour+":"+"00";
var toDayTimesOne = getFormatDate(currentNow)+" "+hourOne+":"+"00";
var toDayNumber = Number(year+month+date);

//회사차량상태 Array
var cmpCarStatCd = [];
var cmpCarStatObj = {};
<c:forEach var="obj" items="${cmpCarStatCdList}">
    cmpCarStatCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    cmpCarStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//회사차량상태 Map
var cmpCarStatCdMap = dms.data.arrayToMap(cmpCarStatCd, function(obj){ return obj.cmmCd; });

//회사차구분 Array
var cmpCarDstinCd = [];
var cmpCarDstinCdMin = [];
var cmpCarDstinObj = {};
<c:forEach var="obj" items="${cmpCarDstinCdList}">
    cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    <c:if test="${obj.cmmCd eq '03' || obj.cmmCd eq '04'}">
        cmpCarDstinCdMin.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    cmpCarDstinObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });

//차종 Array
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//사용자
var userList = [];
var userObj = {};
<c:forEach var="obj" items="${userListDs}">
    userList.push({"usrId":"${obj.usrId}", "usrNm":"["+"${obj.usrId}"+"]"+"${obj.usrNm}"});
    userObj["${obj.usrId}"] = "["+"${obj.usrId}"+"]"+"${obj.usrNm}";
</c:forEach>
var userListMap = dms.data.arrayToMap(userList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    //조회조건 - 회사차유형
    $("#sCpnCarTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd,
        optionLabel:" " // 전체
    });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" " // 전체
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 만기시작일
    $("#sEndStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

    // 만기종료일
    $("#sEndEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //메인-조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
            $("#subGrid").data('kendoExtGrid').dataSource.data([]);
        }
    });

    //상단-저장
    $("#btnMainSave").kendoButton({
        click:function(e) {

            var grid = $("#mainGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            console.log(kendo.stringify(saveData));
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/saveCmpCarRunMngMain.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        $("#btnMainNew").data("kendoButton").enable(true);
                        $("#btnDelMain").data("kendoButton").enable(true);
                        $("#btnMainCancl").data("kendoButton").enable(false);

                        $("#subGrid").data('kendoExtGrid').dataSource.data([]);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //상단-신규
    $("#btnMainNew").kendoButton({
        click:function(e){
            vehiclePopupWindow();
        }
    });

    //상단-삭제
    $("#btnDelMain").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {

                var selectedItem = grid.dataItem(grid.select());

                if(selectedItem.subDataCnt > 0){
                    dms.notification.error("<spring:message code='sal.err.detailDataLocNoDelete'/>");
                }else{
                    dms.window.confirm({
                        message:"<spring:message code='cmm.info.delYn'/>"
                        ,title :"<spring:message code='global.lbl.info' />"
                        ,callback:function(result){
                            if(result){
                                grid.removeRow(row);
                                $("#btnMainSave").click();
                            }else{
                                return false;
                            }
                        }
                    });
                }
            });
        }
    });

    //상단-취소
    $("#btnMainCancl").kendoButton({
        click:function(e) {

            $("#btnMainNew").data("kendoButton").enable(true);
            $("#btnDelMain").data("kendoButton").enable(true);
            $("#btnMainCancl").data("kendoButton").enable(false);

            $("#btnSubSave").data("kendoButton").enable(false);
            $("#btnSubNew").data("kendoButton").enable(false);
            $("#btnDelSub").data("kendoButton").enable(false);
            $("#btnSubCancl").data("kendoButton").enable(false);

            $('#mainGrid').data('kendoExtGrid').cancelChanges();
            $("#subGrid").data('kendoExtGrid').dataSource.data([]);
        }
    });

    //하단-저장
    $("#btnSubSave").kendoButton({
        click:function(e) {

            var upGrid = $("#mainGrid").data("kendoExtGrid");
            var grid = $("#subGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            console.log(kendo.stringify(saveData));
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/saveCmpCarRunMngSub.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {
                        isGridReload = true;
                        upGrid.dataSource.read();

                        isGridReload = true;
                        grid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        $("#btnSubSave").data("kendoButton").enable(false);
                        $("#btnSubNew").data("kendoButton").enable(false);
                        $("#btnSubCancl").data("kendoButton").enable(false);

                        $("#btnMainSave").data("kendoButton").enable(true);
                        $("#btnMainNew").data("kendoButton").enable(true);
                        $("#btnDelMain").data("kendoButton").enable(true);
                        $("#btnMainCancl").data("kendoButton").enable(false);
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //하단-신규
    $("#btnSubNew").kendoButton({
        click:function(e) {
            var grid = $('#mainGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var toDayTimesCon = new Date(toDayTimes);
            var toDayTimesOneCon = new Date(toDayTimesOne);

            if(selectedItem!=null) {

                var vinNo = selectedItem.vinNo;
                var carlineNm = selectedItem.carlineNm;
                var modelNm = selectedItem.modelNm;
                var ocnNm = selectedItem.ocnNm;
                var extColorNm = selectedItem.extColorNm;
                var carRegNo = selectedItem.carRegNo;
                var cpnCarTp = selectedItem.cpnCarTp;
                var lastRunKm = selectedItem.lastRunKm;

                var oldUseStartDt = selectedItem.oldUseStartDt;
                var oldUseEndDt = selectedItem.oldUseEndDt;

                if(lastRunKm == "" || lastRunKm == null){
                    lastRunKm = 0;
                }

                $('#subGrid').data('kendoExtGrid').dataSource.insert(0, {
                    "seq":""
                    ,"vinNo":vinNo
                    ,"carlineNm":carlineNm
                    ,"modelNm":modelNm
                    ,"ocnNm":ocnNm
                    ,"extColorNm":extColorNm
                    ,"carRegNo":carRegNo
                    ,"cpnCarTp":cpnCarTp
                    ,"userId":loginUserId
                    ,"useStartDt":""
                    ,"useEndDt":""
                    ,"startKm":lastRunKm
                    ,"endKm":0
                    ,"runKm":0
                    ,"etcCmnt":""
                    ,"usedOil":0
                    ,"regUsrId":loginUserId
                    ,"regDt":currentNow
                    ,"oldUseStartDt":oldUseStartDt
                    ,"oldUseEndDt":oldUseEndDt
                });

                var grid = $('#subGrid').data('kendoExtGrid');

                selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                grid.select(selectRow);

                cellToEdit = grid.content.find("tr:eq(0) td:eq(8)");
                grid.editCell(cellToEdit);

                $("#btnSubSave").data("kendoButton").enable(true);
                $("#btnSubNew").data("kendoButton").enable(false);
                $("#btnSubCancl").data("kendoButton").enable(true);
            } else {
                //회사차목록을 먼저 선택해 주십시오.
                dms.notification.warning("<spring:message code='sal.lbl.comVehicleDrvMgmtList' var='comVehicleDrvMgmtList' /><spring:message code='global.info.chkSelectItemMsg' arguments='${comVehicleDrvMgmtList}' />");
            }
        }
    });

    //하단-삭제
    $("#btnDelSub").kendoButton({
        click:function(e) {
            var grid = $("#subGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {

                dms.window.confirm({
                    message:"<spring:message code='cmm.info.delYn'/>"
                    ,title :"<spring:message code='global.lbl.info' />"
                    ,callback:function(result){
                        if(result){
                            $("#btnSubSave").data("kendoButton").enable(true);
                            grid.removeRow(row);
                            $("#btnSubSave").click();
                            $("#btnSubSave").data("kendoButton").enable(false);
                        }else{
                            return false;
                        }
                    }
                });

            });
        }
    });

    //하단-취소
    $("#btnSubCancl").kendoButton({
        click:function(e) {
            $('#subGrid').data('kendoExtGrid').cancelChanges();
            $("#btnSubSave").data("kendoButton").enable(false);
            $("#btnSubNew").data("kendoButton").enable(true);
            $("#btnSubCancl").data("kendoButton").enable(false);
        }
    });

    //상단그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0719-183701"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/selectCmpCarRunMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sCarStatCd = $('input:radio[name=sCarStatCd]:checked').val();

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarStatCd"] = sCarStatCd;
                        params["sCpnCarTp"] = $("#sCpnCarTp").data("kendoExtDropDownList").value();
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sStartDt"]= $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndDt"]= $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndStartDt"]= $("#sEndStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndEndDt"]= $("#sEndEndDt").data("kendoExtMaskedDatePicker").value();

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
                        rnum :{type:"number", editable:false}
                        ,carStatCd :{type:"string"}
                        ,cpnCarTp :{type:"string" ,validation:{required:true}}
                        ,vinNo :{type:"string", editable:false}
                        ,carlineCd :{type:"string", editable:false}
                        ,carlineNm :{type:"string", editable:false}
                        ,modelCd :{type:"string", editable:false}
                        ,modelNm :{type:"string", editable:false}
                        ,ocnCd :{type:"string", editable:false}
                        ,ocnNm :{type:"string", editable:false}
                        ,extColorCd :{type:"string", editable:false}
                        ,extColorNm :{type:"string", editable:false}
                        ,startDt :{type:"date",validation:{required:true}}
                        ,endDt :{type:"date",validation:{required:true}}
                        ,ingDtCnt :{type:"number", editable:false}
                        ,totRunKm :{type:"number", editable:false}
                        ,engineNo :{type:"string", editable:false}
                        ,carRegNo :{type:"string", editable:false}
                        ,lastRunKm : {type:"number"}
                        ,oldUseStartDt:{type:"date"}
                        ,oldUseEndDt:{type:"date"}
                        ,subDataCnt : {type:"number"}
                    }
                }
            }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

                if (dataItem.isNew()) {
                    $("#btnSubSave").data("kendoButton").enable(false);
                    $("#btnSubNew").data("kendoButton").enable(false);
                    $("#btnDelSub").data("kendoButton").enable(false);
                    $("#btnSubCancl").data("kendoButton").enable(false);

                    $("#subGrid").data("kendoExtGrid").dataSource.data([]);
                } else {

                    if(dms.string.isNotEmpty(dataItem.carStatCd) && (dataItem.cpnCarTp == "03" || dataItem.cpnCarTp == "04")){
                        $("#btnDelMain").data("kendoButton").enable(true);
                    }else{
                        $("#btnDelMain").data("kendoButton").enable(false);
                    }

                    if(dms.string.isNotEmpty(dataItem.carStatCd) && dataItem.carStatCd != "D"){
                        $("#btnSubSave").data("kendoButton").enable(false);
                        $("#btnSubNew").data("kendoButton").enable(true);
                        $("#btnDelSub").data("kendoButton").enable(false);
                        $("#btnSubCancl").data("kendoButton").enable(false);
                    }else{
                        $("#btnSubSave").data("kendoButton").enable(false);
                        $("#btnSubNew").data("kendoButton").enable(false);
                        $("#btnSubCancl").data("kendoButton").enable(false);
                        $("#btnDelMain").data("kendoButton").enable(false);
                    }
                    $("#subGrid").data("kendoExtGrid").dataSource.read();
                }
         }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,reorderable:false              //컬럼순서변경가능여부
        ,sortable:false
        ,selectable:"row"
        ,edit:function(e){
            var eles = e.container.find("input");
            var selectedItem = e.model;
            var fieldName;

            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

            if(fieldName == "carStatCd"){
                this.closeCell();
            }

            if(fieldName == "cpnCarTp"){
                if(!selectedItem.isNew()){
                    if(dms.string.isNotEmpty(e.model.carStatCd)){
                        this.closeCell();
                    }
                }
            }

            if(fieldName == "startDt"){
                if(!selectedItem.isNew()){
                    if(dms.string.isNotEmpty(e.model.cpnCarTp) && (e.model.cpnCarTp=="01" || e.model.cpnCarTp=="02" || e.model.cpnCarTp=="05")){
                        this.closeCell();
                    }
                }
            }

            if(fieldName == "endDt"){
                if(dms.string.isNotEmpty(e.model.cpnCarTp) && e.model.cpnCarTp=="01"){
                    this.closeCell();
                }
                input.blur(function(){
                    if(dms.string.isNotEmpty(e.model.endDt)){
                        if(Number((kendo.toString(e.model.endDt,"<dms:configValue code='dateFormat' />")).replace(/-/gi, "")) >= Number(toDay.replace(/-/gi, ""))){
                            selectedItem.set("carStatCd", "U");
                        }else{
                            selectedItem.set("carStatCd", "D");
                        }
                    }else{
                        selectedItem.set("carStatCd", "U");
                    }
                });
            }
        }
        ,columns:[  {field:"carStatCd",title:"<spring:message code='global.lbl.vinSts' />",width:60 // 회사차량상태
                        ,attributes:{"class":"ac"}
                        ,template:"#=bf_selectCpnCarStat(carStatCd)#"
                        ,editor:function (container, options){
                            $('<input name="carStatCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,valuePrimitive:true
                                ,dataSource:cmpCarStatCd
                                ,template:"#=bf_selectCpnCarStat(cmmCd)#"
                                ,autoWidth:true
                                ,change:function(e){

                                }
                            });
                            $('<span class="k-invalid-msg" data-for="carlineCd"></span>').appendTo(container);
                        }
                     }
                    ,{field:"cpnCarTp",title:"*"+"<spring:message code='global.lbl.cmpCarDstinCd' />",width:100 // 회사차량종류
                        ,attributes:{"class":"al"}
                        ,template:"#=bf_selectCpnCarTp(cpnCarTp)#"
                        ,editor:function (container, options){
                            $('<input name="cpnCarTp" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,valuePrimitive:true
                                ,dataSource:cmpCarDstinCdMin
                                ,template:"#=bf_selectCpnCarTp(cmmCd)#"
                                ,autoWidth:true
                                ,change:function(e){

                                }
                            });
                            $('<span class="k-invalid-msg" data-for="carlineCd"></span>').appendTo(container);
                        }
                     }
                    ,{field:"vinNo"         ,title:"<spring:message code = 'global.lbl.vinNo'/>"       ,width:150 ,attributes:{"class":"al"}}
                    ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carLine' />",      width:80, attributes:{"class":"al"}}
                    ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}}
                    ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}}
                    ,{field:"startDt",title:"*"+"<spring:message code = 'sal.lbl.orgStartDt'/>",width:110,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,editor:function (container, options){
                        $('<input name="startDt" id="startDt" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtMaskedDatePicker({
                            format:"<dms:configValue code='dateFormat' />"
                            ,dateValidMessage:"<spring:message code='sal.lbl.orgStartDt' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                        });
                        $('<span class="k-invalid-msg" data-for="startDt"></span>').appendTo(container);
                      }
                    }
                    ,{field:"endDt",title:"*"+"<spring:message code = 'global.lbl.fincEndDt'/>",width:110,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,editor:function (container, options){
                        $('<input name="endDt" id="startDt" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtMaskedDatePicker({
                            format:"<dms:configValue code='dateFormat' />"
                           ,dateValidMessage:"<spring:message code='global.lbl.fincEndDt' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                        });
                        $('<span class="k-invalid-msg" data-for="endDt"></span>').appendTo(container);
                      }
                    }
                    ,{field:"ingDtCnt"
                        ,title:"<spring:message code='sal.lbl.ingDtCnt'/>"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n0}"
                        ,editor:function(container, options){
                            $('<input name="ingDtCnt" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
                            .focus(function(){ this.select(); })
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"n0"
                               ,spinners:false
                            });
                          }
                       }
                    ,{field:"totRunKm"
                        ,title:"<spring:message code='sal.lbl.totRunKm'/>"
                        ,width:70
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n0}"
                        ,editor:function(container, options){
                            $('<input name="totRunKm" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
                            .focus(function(){ this.select(); })
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"n0"
                                ,spinners:false
                            });
                          }
                       }
                    ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:140, attributes:{"class":"al"}}
                    ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}}
                    ,{field:"engineNo"   ,title:"<spring:message code = 'global.lbl.enginNo'/>"       ,width:120 ,attributes:{"class":"al"}}
                    ,{field:"carRegNo",    title:"<spring:message code='global.lbl.carRegNo' />",     width:80,  attributes:{"class":"al"}}
                   ]
    });

    //하단그리드
    $("#subGrid").kendoExtGrid({
        gridId:"G-SAL-0719-190513"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/selectCmpCarRunMngSub.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var grid = $("#mainGrid").data("kendoExtGrid");
                        var selectedItem = grid.dataItem(grid.select());
                        var subParam = {};

                        subParam["recordCountPerPage"] = options.pageSize;
                        subParam["pageIndex"] = options.page;
                        subParam["firstIndex"] = options.skip;
                        subParam["lastIndex"] = options.skip + options.take;
                        subParam["sort"] = options.sort;

                        var sVinNo = "";

                        $("#hidSrchVinNo").val(sVinNo);
                        $("#hidSrchType").val("N");

                        if(selectedItem!=null)  {
                            var sVinNo = selectedItem.vinNo;
                            $("#useStartKmVal").val(selectedItem.totRunKm);
                        }

                        subParam["sVinNo"] = sVinNo;

                        return kendo.stringify(subParam);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum",
                    fields:{
                         seq:{type:"number", editable:false}
                        ,rnum:{type:"number", editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,carlineNm:{type:"string", editable:false}
                        ,modelNm:{type:"string", editable:false}
                        ,ocnCd:{type:"string", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,carRegNo:{type:"string", editable:false}
                        ,cpnCarTp:{type:"string", editable:false}
                        ,userId:{type:"string"}
                        ,useStartDt:{type:"date"}
                        ,useEndDt:{type:"date"}
                        ,startKm:{type:"number"}
                        ,endKm:{type:"number"}
                        ,runKm:{type:"number"}
                        ,etcCmnt:{type:"string"}
                        ,usedOil:{type:"number"}
                        ,regUsrId:{type:"string", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,oldUseStartDt:{type:"date"}
                        ,oldUseEndDt:{type:"date"}
                    }
                }
            }
        }
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");
            var selectedItem = e.model;

             if(fieldName == "useStartDt"){
                 if(dms.string.isNotEmpty(selectedItem.seq)){
                     this.closeCell();
                 }
            }

             if(fieldName == "useEndDt"){
                 if(dms.string.isNotEmpty(selectedItem.seq)){
                     this.closeCell();
                 }
            }

             if(fieldName == "startKm"){
                 if(dms.string.isNotEmpty(selectedItem.seq)){
                     this.closeCell();
                 }
            }

             if(fieldName == "endKm"){
                 if(dms.string.isNotEmpty(selectedItem.seq)){
                     this.closeCell();
                 }
            }

             if(fieldName == "usedOil"){
                 if(dms.string.isNotEmpty(selectedItem.seq)){
                     this.closeCell();
                 }
            }

             if(fieldName == "etcCmnt"){
                 if(dms.string.isNotEmpty(selectedItem.seq)){
                     this.closeCell();
                 }
            }

            if(fieldName == "startKm" ){
                input.blur(function(){
                    selectedItem.set("runKm", selectedItem.endKm - selectedItem.startKm);
                });
            }

            if(fieldName == "endKm" ){
                input.blur(function(){
                    selectedItem.set("runKm", selectedItem.endKm - selectedItem.startKm);
                });
            }

            if(fieldName == "runKm" ){
                this.closeCell();
            }

            if(fieldName == "userId"){
                if(dms.string.isNotEmpty(selectedItem.seq)){
                    this.closeCell();
                }
           }

            if(fieldName == "etcCmnt"){
                input.blur(function(){

                });
           }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
                if (!dataItem.isNew()) {
                    $("#btnSubSave").data("kendoButton").enable(false);
                    $("#btnSubNew").data("kendoButton").enable(false);
                    $("#btnDelSub").data("kendoButton").enable(true);
                    $("#btnSubCancl").data("kendoButton").enable(false);
                }else{
                    $("#btnSubSave").data("kendoButton").enable(true);
                    $("#btnSubNew").data("kendoButton").enable(false);
                    $("#btnDelSub").data("kendoButton").enable(false);
                    $("#btnSubCancl").data("kendoButton").enable(true);
                }
         }
       ,indvColumnVisible:false //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false //컬럼순서 변경 개인화 적용. default:true
       ,filterable:false // 필터링 기능 사용안함
       ,reorderable:false //컬럼순서변경가능여부
       ,pageable:true
       ,height:200
       ,autoBind:false
       ,sortable:false
       ,selectable:"row"
       ,columns:[
           {field:"rnum"       ,title:"<spring:message code='global.lbl.noName' />"        ,width:50       , attributes:{"class":"ar"}} // 순번
          ,{field:"vinNo"       ,title:"<spring:message code='global.lbl.vinNo' />"         ,width:145       , attributes:{"class":"al"}} // 빈번호
          ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"al"} ,hidden:true}//차종description
          ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:160, attributes:{"class":"al"} ,hidden:true} //모델description
          ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:160, attributes:{"class":"al"} ,hidden:true} //OCNdescription
          ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"} ,hidden:true} //외장색description
          ,{field:"carRegNo",    title:"<spring:message code='global.lbl.carRegNo' />",     width:80,  attributes:{"class":"al"} ,hidden:true} //차량등록번호
          ,{field:"cpnCarTp",title:"<spring:message code = 'global.lbl.cmpCarDstinCd'/>",width:80  ,attributes:{"class":"ac"} ,hidden:true  //회사차구분
          ,template:"# if(cmpCarDstinCdMap[cpnCarTp] != null) { # #= cmpCarDstinCdMap[cpnCarTp].cmmCdNm# # }#"
          }
          ,{field:"userId"
              ,title:"*"+"<spring:message code='global.lbl.user' />"
              ,width:150
              ,attributes:{"class":"al"}
              ,template:"#=dms.string.strNvl(userObj[userId])#"
              ,editor:function (container, options){
                  $('<input name="userId" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                        valuePrimitive:true
                      , dataTextField: "usrNm"
                      , dataValueField:"usrId"
                      , dataSource:userList
                  });
                  $('<span class="k-invalid-msg" data-for="userId"></span>').appendTo(container);
              }
          } //사용자명

          ,{field:"useStartDt",title:"*"+"<spring:message code = 'global.lbl.startHm'/>"
              ,width:125,attributes:{"class":"ac"}
              ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
              ,editor:function (container, options){
                $('<input name="useStartDt" id="useStartDt" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoExtMaskedDateTimePicker({
                    format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                    ,dateValidMessage:"<spring:message code='global.lbl.startHm' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                });
                $('<span class="k-invalid-msg" data-for="useStartDt"></span>').appendTo(container);
              }
            }
          ,{field:"useEndDt", title:"*"+"<spring:message code='global.lbl.completeDt' />", width:125
              ,attributes:{"class":"ac"}
              ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
              ,editor:function (container, options){
                  $('<input name="useEndDt" id="useEndDt" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtMaskedDateTimePicker({
                      format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                     ,dateValidMessage:"<spring:message code='global.lbl.completeDt' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                     ,value:""
                  });
                  $('<span class="k-invalid-msg" data-for="useEndDt"></span>').appendTo(container);
              }
          } //종료일시
          ,{field:"startKm"
           ,title:"*"+"<spring:message code='global.lbl.startKmVal'/>"
           ,width:70
           ,attributes:{"class":"ar"}
           ,format:"{0:n0}"
           ,editor:function(container, options){
               $('<input name="startKm" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
               .focus(function(){ this.select(); })
               .appendTo(container)
               .kendoExtNumericTextBox({
                   format:"n0"
                  ,value:0
                  ,spinners:false
               });
             }
          } //시작KM
          ,{field:"endKm"
              ,title:"*"+"<spring:message code='global.lbl.endKmVal'/>"
              ,width:75
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,editor:function(container, options){
                  $('<input name="endKm" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
                  .focus(function(){ this.select(); })
                  .appendTo(container)
                  .kendoExtNumericTextBox({
                      format:"n0"
                     ,value:0
                     ,spinners:false
                  });
                }
             } //종료KM
          ,{field:"runKm"
              ,title:"<spring:message code='ser.lbl.runDist'/>"
              ,width:75
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,editor:function(container, options){
                  $('<input name="runKm" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
                  .focus(function(){ this.select(); })
                  .appendTo(container)
                  .kendoExtNumericTextBox({
                      format:"n0"
                     ,value:0
                     ,spinners:false
                  });
                }
             } //운행거리
          ,{field:"usedOil"
              ,title:"*"+"<spring:message code='sal.lbl.usedOil'/>"
              ,width:85
              ,attributes:{"class":"ar"}
              ,format:"{0:n2}"
              ,editor:function(container, options){
                  $('<input name="usedOil" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
                  .focus(function(){ this.select(); })
                  .appendTo(container)
                  .kendoExtNumericTextBox({
                      format:"n2"
                     ,value:0.00
                     ,spinners:false
                  });
                }
             } //오일소모량
          ,{field:"etcCmnt",    title:"<spring:message code='sal.lbl.remark' />",     width:185,  attributes:{"class":"al"}} //비고
          ,{field:"regUsrId",    title:"<spring:message code='global.lbl.regUsrId' />",     width:70,  attributes:{"class":"al"}} //등록자
          ,{field:"regDt",title:"<spring:message code = 'global.lbl.regDt'/>",width:90,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}"
              ,editor:function (container, options){
                 $('<input name="regDt" id="startDt" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtMaskedDatePicker({
                     format:"<dms:configValue code='dateFormat' />"
                     ,dateValidMessage:"<spring:message code='global.lbl.regDt' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });
                 $('<span class="k-invalid-msg" data-for="startDt"></span>').appendTo(container);
               }
             }
       ]
   });

    $("#btnMainCancl").data("kendoButton").enable(false);
    $("#btnSubSave").data("kendoButton").enable(false);
    $("#btnSubNew").data("kendoButton").enable(false);
});

//상세팝업 - 차량조회
function vehiclePopupWindow(){
    popupWindow = dms.window.popup({
        windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
        ,title:"<spring:message code='global.lbl.carList' />"
        ,modal:true
        ,height:"510px"
        ,width :"850px"
        ,content:{
            url:"<c:url value='/sal/cmp/cmpCarRunMng/selectVehicleMasterPopup.do'/>"
            ,data: {
                "type"  :null
                ,"autoBind":false
                ,"pageGubun":"cmpRunMng"
                ,"cmpCarYn":"Y"
                ,"callbackFunc":function(data){

                    var endDt = "";
                    var cpnCarTp = "";

                    if(data[0].ordTp == "N7"){
                        endDt = after2Years;
                        cpnCarTp = "01";
                    }else if(data[0].ordTp == "N5"){
                        cpnCarTp = "05";
                    }else if(data[0].ordTp == "NS"){
                        cpnCarTp = "02";
                    }

                    $('#mainGrid').data('kendoExtGrid').dataSource.insert(0, {
                        "carStatCd" : ""
                       ,"cpnCarTp" : cpnCarTp
                       ,"vinNo" : data[0].vinNo
                       ,"carlineCd" : data[0].carlineCd
                       ,"carlineNm" :data[0].carlineNm
                       ,"modelCd" : data[0].modelCd
                       ,"modelNm" : data[0].modelNm
                       ,"ocnCd" : data[0].ocnCd
                       ,"ocnNm" : data[0].ocnNm
                       ,"extColorCd" : data[0].extColorCd
                       ,"extColorNm" : data[0].extColorNm
                       ,"startDt" : currentNow
                       ,"endDt" : ""
                       ,"ingDtCnt" : 0
                       ,"totRunKm" : 0
                       ,"engineNo" : data[0].enginSerialNo
                       ,"carRegNo" : data[0].carRegNo
                    }).set("dirty", true);

                    var grid = $('#mainGrid').data('kendoExtGrid');

                    selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                    grid.select(selectRow);

                    cellToEdit = grid.content.find("tr:eq(0) td:eq(1)");
                    grid.editCell(cellToEdit);

                    $("#btnMainNew").data("kendoButton").enable(false);
                    $("#btnMainCancl").data("kendoButton").enable(true);
                    $("#btnDelMain").data("kendoButton").enable(false);

                    $("#btnSubSave").data("kendoButton").enable(false);
                    $("#btnSubNew").data("kendoButton").enable(false);
                    $("#btnDelSub").data("kendoButton").enable(false);
                    $("#btnSubCancl").data("kendoButton").enable(false);

                    $("#subGrid").data('kendoExtGrid').dataSource.data([]);
                }
            }
        }
    });
}

function bf_selectCpnCarStat(val) {
    var returnVal = "";
    if(val != null && val != ""){
        if(cmpCarStatObj[val] != undefined)
        returnVal = cmpCarStatObj[val];
    }
    return returnVal;
}

function bf_selectCpnCarTp(val) {
    var returnVal = "";
    if(val != null && val != ""){
        if(cmpCarDstinObj[val] != undefined)
        returnVal = cmpCarDstinObj[val];
    }
    return returnVal;
}

function changedRadio(flg){
    if(flg){
        $("#btnMainSave").data("kendoButton").enable(true);
        $("#btnMainNew").data("kendoButton").enable(true);
        $("#btnMainCancl").data("kendoButton").enable(true);
        $("#btnSubNew").data("kendoButton").enable(true);
        $("#btnSubCancl").data("kendoButton").enable(true);
        $("#btnDelSub").data("kendoButton").enable(true);
        $("#mainGrid").data('kendoExtGrid').dataSource.data([]);
        $("#subGrid").data('kendoExtGrid').dataSource.data([]);
        $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
    }else{
        $("#btnMainSave").data("kendoButton").enable(true);
        $("#btnMainNew").data("kendoButton").enable(false);
        $("#btnDelMain").data("kendoButton").enable(false);
        $("#btnMainCancl").data("kendoButton").enable(false);
        $("#btnSubSave").data("kendoButton").enable(false);
        $("#btnSubNew").data("kendoButton").enable(false);
        $("#btnDelSub").data("kendoButton").enable(false);
        $("#btnSubCancl").data("kendoButton").enable(false);
        $("#mainGrid").data('kendoExtGrid').dataSource.data([]);
        $("#subGrid").data('kendoExtGrid').dataSource.data([]);
        $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
    }
}

function getFormatDate(date){
    var year = date.getFullYear(); //yyyy
    var month = (1 + date.getMonth()); //M
    month = month >= 10 ? month : '0' + month; // month 두자리로 저장
    var day = date.getDate(); //d
    day = day >= 10 ? day : '0' + day; //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

</script>